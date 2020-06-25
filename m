Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web12.7413.1593080688769204794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tXflSINy;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id b13so1698663uav.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tqE+3RrBBt5yEmq48fs4X0Ke/s71Zmx7UJwAUmrcreA=;
        b=tXflSINy4d07RJQVikKPM21z89ChZ8mg7lb00qnpVmx1ONZh1oABRiFQOiKJxXs8ih
         afha3R1f3rJ1eoyhN7vQgUy0okaXLvhvkYIQa0VquS5kQAnttz/Zu896XOHoQSc4cDvI
         Uvo0IpunIHoVF3yATTJ72xQYr9MCx/U+SQ2BZHQd0UfwEuuifyH2Kw6ekvPRCtpOXxNN
         VS7jF5RVO4/8ppMFk+tlhPnzyA06Kb75+DsiC4aQHkEHMA6ShdPxbeLlPg/IL30Kzl/4
         gC2Xlrc/+21p1KgVwy/fW6MnT4eB+Goso7YVOxYXRK1vUjAnHDkRIr/AGi/dmeTuwy4r
         Oh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tqE+3RrBBt5yEmq48fs4X0Ke/s71Zmx7UJwAUmrcreA=;
        b=gi9k2Df2otOc/+KT+4xi6PLrpCc8tIgbWc2+IMxbw4krHopHe5BTx0n7XF8pzqgq32
         4OH9T+llAyVvjqkr84LBI00Y39qX3BFTXmnZVVVPd66FuvcHfBXRmeJJgf39WlKjizhS
         brOYkEggSf8aBdxie8jThsLDnybV24sTFKTWffnoAQTETb+RO962QK9JXxNByCi3++Ca
         jOOJGxYvCzcRvhQXKHNhO/Gz++mWlkURzyRblotN4B2qnj4mZA1Rt+j1EEirM4uDRtq4
         MkotYke+sBKRefrUKXSiz/RQlXjdVfIWkNSct3nAWM19EFtSu9Wuwll2MfWtu82q44+w
         KpIg==
X-Gm-Message-State: AOAM531U6HcuxrDXBZANIhwMQwa9pjg5EyPfJfOIbEFPUoNcM6lSoQuk
	fgOidKQXIZG9h2Z6tmKEnqgLrU2dgx+9XDkT03MyqUtY
X-Google-Smtp-Source: ABdhPJzCOjIe693jqzzIMxxvA2vkSrTNP4a5t2RDwAOBTgFy/aZeOmH8KeBZf+t1ri8Kgxzz4P60ULfTMGtatDPNNLo=
X-Received: by 2002:ab0:15ca:: with SMTP id j10mr8026913uae.71.1593080687870;
 Thu, 25 Jun 2020 03:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101413.2783-1-fredrigu@axis.com>
In-Reply-To: <20200625101413.2783-1-fredrigu@axis.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2020 12:24:35 +0200
Message-ID: <CANNYZj--txtppAq4o1bjmRQiZ2Oehaftx4WR-ewx7VmYHRPxmQ@mail.gmail.com>
Subject: Re: [OE-core] Add package managers as a plugin
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal@axis.com, hugo.cedervall@axis.com
Content-Type: multipart/alternative; boundary="0000000000007fc85605a8e600f9"

--0000000000007fc85605a8e600f9
Content-Type: text/plain; charset="UTF-8"

Apologies, but these metrics do not look particularly convincing - 15s vs
20s? Can you try it with an image several gigabytes in size?
Core-image-sato-sdk-ptest is a good option.

Alex

On Thu, 25 Jun 2020 at 12:14, Fredrik Gustafsson <
fredrik.gustafsson@axis.com> wrote:

> Poky today has three different package managers, the well-known formats deb
> and rpm is supported as well as ipkg that is good for embedded devices.
>
> When building and having a good cache hit, a significant amount of time is
> spent in the phase of generating a rootfs, which is really about the
> performance of the package manager. ipkg is way slower than deb or rpm. To
> save build time and also get a package manager that is suitanle for use on
> targets where flash memory is a concern, support for apk is suggested.
>
> However, it might or might not be what's wanted for Poky since it increases
> the test matrix. Therefore this patch series refactors the package
> management code so that it's possible to add more package managers in other
> own layer. I will send another patch serie that will add apk.
>
> Perfomance metrics below, (note that this includes build times).
>
> APK
> ===
> bitbake core-image-minimal
> 15.84s user 2.60s system 0% cpu 1:26:19.21 total
> 16.01s user 2.58s system 0% cpu 1:26:03.72 total
> 15.69s user 2.61s system 0% cpu 1:26:45.45 total
>
> bitbake core-image-minimal -c cleansstate
> bitbake core-image-minimal -c clean
> bitbake core-image-minimal -f -c do_rootfs
> 0.55s user 0.06s system 4% cpu 14.236 total
> 0.54s user 0.08s system 4% cpu 15.247 total
> 0.52s user 0.15s system 4% cpu 15.143 total
>
> RPM
> ===
> bitbake core-image-minimal
> 18.57s user 3.09s system 0% cpu 1:31:29.09 total
> 18.58s user 3.08s system 0% cpu 1:30:53.80 total
> 18.20s user 3.31s system 0% cpu 1:31:06.69 total
>
> bitbake core-image-minimal -c cleansstate
> bitbake core-image-minimal -c clean
> bitbake core-image-minimal -c do_rootfs -f
> 0.58s user 0.10s system 3% cpu 19.470 total
> 0.57s user 0.09s system 3% cpu 19.480 total
> 0.60s user 0.07s system 3% cpu 20.381 total
> 
>

--0000000000007fc85605a8e600f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Apologies, but these metrics do not look particularly=
 convincing - 15s vs 20s? Can you try it with an image several gigabytes in=
 size? Core-image-sato-sdk-ptest is a good option.<br></div><div><br></div>=
<div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, 25 Jun 2020 at 12:14, Fredrik Gustafsson &lt;<a =
href=3D"mailto:fredrik.gustafsson@axis.com">fredrik.gustafsson@axis.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Poky=
 today has three different package managers, the well-known formats deb<br>
and rpm is supported as well as ipkg that is good for embedded devices.<br=
>
<br>
When building and having a good cache hit, a significant amount of time is=
<br>
spent in the phase of generating a rootfs, which is really about the<br>
performance of the package manager. ipkg is way slower than deb or rpm. To=
<br>
save build time and also get a package manager that is suitanle for use on=
<br>
targets where flash memory is a concern, support for apk is suggested.<br>
<br>
However, it might or might not be what&#39;s wanted for Poky since it incr=
eases<br>
the test matrix. Therefore this patch series refactors the package<br>
management code so that it&#39;s possible to add more package managers in =
other<br>
own layer. I will send another patch serie that will add apk.<br>
<br>
Perfomance metrics below, (note that this includes build times).<br>
<br>
APK<br>
=3D=3D=3D<br>
bitbake core-image-minimal<br>
15.84s user 2.60s system 0% cpu 1:26:19.21 total<br>
16.01s user 2.58s system 0% cpu 1:26:03.72 total<br>
15.69s user 2.61s system 0% cpu 1:26:45.45 total<br>
<br>
bitbake core-image-minimal -c cleansstate<br>
bitbake core-image-minimal -c clean<br>
bitbake core-image-minimal -f -c do_rootfs<br>
0.55s user 0.06s system 4% cpu 14.236 total<br>
0.54s user 0.08s system 4% cpu 15.247 total<br>
0.52s user 0.15s system 4% cpu 15.143 total<br>
<br>
RPM<br>
=3D=3D=3D<br>
bitbake core-image-minimal<br>
18.57s user 3.09s system 0% cpu 1:31:29.09 total<br>
18.58s user 3.08s system 0% cpu 1:30:53.80 total<br>
18.20s user 3.31s system 0% cpu 1:31:06.69 total<br>
<br>
bitbake core-image-minimal -c cleansstate<br>
bitbake core-image-minimal -c clean<br>
bitbake core-image-minimal -c do_rootfs -f<br>
0.58s user 0.10s system 3% cpu 19.470 total<br>
0.57s user 0.09s system 3% cpu 19.480 total<br>
0.60s user 0.07s system 3% cpu 20.381 total<br>
<br>
</blockquote></div>

--0000000000007fc85605a8e600f9--
