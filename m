Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web11.2697.1586287601440206261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 12:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UJhIbS7G;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id s25so1146810vsp.11
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DxnHuPzIsykNUzLHSPyMmS2Tdd6nU1GfbW8WGkrn/0Y=;
        b=UJhIbS7GjPGPmMsnu0Px/TS/3ybBGwvEk/EAcgLS34uIdkqT8IOZhrQrWvJOUHUQnY
         AXggE9325SSEHBgzqCM99pXhIDeuhPaAne+ulXeLsTpJKt5JpGF4TC7GBf5HfHNdjiau
         BfRuQMNApW2A2JDu93Geu0MBxsTxvLno30l17UvLW0MFC5Ob+mB9UQIHjWMhfu4l/1kv
         3WkfV0HjkXlYpiemEndOXmwRBKBkdGP7KuH4aKlNpyHyzdJpY9eIq/xbaz+silw/ko/n
         SmAhaReQ2cAPU631i1tm9DPKXwg6MCJwo/6AnA4Qe7x69qtpBlf5Y00lwXki6zzbjZQW
         7xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DxnHuPzIsykNUzLHSPyMmS2Tdd6nU1GfbW8WGkrn/0Y=;
        b=mUkFzqdnNabH2LfLdiXbyb42uO9FJzC6w3bl1in+Ng1O/16vDQqCRCRC2DTcAgEW0D
         kI4y+0B+7GK0oG9wlG6hAL1wVCGu2Ql9Bno97LvLpDGrsVWyRlqLR2VGVEsMwC17Nh0y
         4wu7r52LTq0QMIBXx+6Tur+rB2yWmjBSDXgzJlZdcg/8520QTLT0FLPlxGzNFZrOtiig
         1W/Zg+BQkU0vMiBbvRU6aOT4FrFOSdSTmd80lb1DUEwAoBPo+HINy5EGjESh7x7HLEmv
         jufObUHbAjUIWmdBMwrxrlpbtrLF54zl+87lv8vEK0svj1VMqUvQefYvCMeXgAmlWi0J
         Kavw==
X-Gm-Message-State: AGi0PuYbNUeUCkawMCdZLuertS/RkidHX0XTfPSra+BtJ2Vfh5NDvLNO
	P+7acWduI8Sk0SoNc5MQqx6MbJ3HYqMpCE4LZYbyQg==
X-Google-Smtp-Source: APiQypKumirXhkqMEVv92H8oId+GvSMEAEaWuEnxGXz/ehsnVwkNW/CpES4ztiUngQlBVktfqFAmV9DIAjUMX7FQDoU=
X-Received: by 2002:a05:6102:72d:: with SMTP id u13mr3148692vsg.35.1586287600551;
 Tue, 07 Apr 2020 12:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2004071503180.10456@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004071503180.10456@localhost.localdomain>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 7 Apr 2020 21:26:29 +0200
Message-ID: <CANNYZj8_5_eKPnUn3Ckv0X9upaQGBe7ZcnyAysv=G6zF-+_Kyw@mail.gmail.com>
Subject: Re: [OE-core] clarify use of "$D" in pkg_postinst routines?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f1491d05a2b85c6d"

--000000000000f1491d05a2b85c6d
Content-Type: text/plain; charset="UTF-8"

These run
- at image creation time in the context of package manager (dnf/apt/opkg)
installing packages into the image rootfs directory. The code that executes
the package manager specifically exports $D into the environment before
launching it.
- at runtime when packages are installed or updated through the same
package manager. Then, $D is absent.

The scripts are written into the package files when the packages gets
created; they become 'post-install scriptlets' that every package manager
supports and executes if they are present.

Alex

On Tue, 7 Apr 2020 at 21:11, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>
>   first time looking closely at pkg_postinst_* routines, so can
> someone clarify the use of "$D" in those routines? at the moment, i'm
> *guessing* that those routines need to be able to run in two different
> contexts (but i could be wrong):
>
>   1) at image creation time
>   2) at later package installation time on a running system
>
> i'm aware that bitbake requires the use of curly braces, so always
> must use "${D}", so in something like this from xorg-font-common.inc,
> how does OE process this shell function? as in, what context do those
> routines run in?
>
>   pkg_postinst_${PN} () {
>         for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
>                 mkfontdir $fontdir
>                 mkfontscale $fontdir
>         done
>         for fontdir in `find $D/usr/share/fonts/X11 -type d`; do
>                 mkfontdir $fontdir
>                 mkfontscale $fontdir
>         done
>   }
>
> it seems(?) clear that testing $D is the way to tell which of the two
> contexts one is running in, as in:
>
>   pkg_postinst_${PN}_class-target () {
>         if [ "x$D" != "x" ]; then
>           rootarg="--root $D"
>         else
>           rootarg=""
>         fi
>         ... snip ...
>
> such that if $D is the empty string, then you're in the context of a
> running system. am i close?
>
> rday
>
> p.s. i notice there are two ways that $D is used to define the
> context. in some cases, just using it (as in the first example above)
> is sufficient, while in other cases (as in the second case), the
> routine needs to actually test the value.
> 
>

--000000000000f1491d05a2b85c6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>These run <br></div><div>- at image creation time in =
the context of package manager (dnf/apt/opkg) installing packages into the =
image rootfs directory. The code that executes the package manager specific=
ally exports $D into the environment before launching it.</div><div>- at ru=
ntime when packages are installed or updated through the same package manag=
er. Then, $D is absent.</div><div><br></div><div>The scripts are written in=
to the package files when the packages gets created; they become &#39;post-=
install scriptlets&#39; that every package manager supports and executes if=
 they are present.</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 7 Apr 202=
0 at 21:11, Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">r=
pjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><br>
=C2=A0 first time looking closely at pkg_postinst_* routines, so can<br>
someone clarify the use of &quot;$D&quot; in those routines? at the moment=
, i&#39;m<br>
*guessing* that those routines need to be able to run in two different<br>
contexts (but i could be wrong):<br>
<br>
=C2=A0 1) at image creation time<br>
=C2=A0 2) at later package installation time on a running system<br>
<br>
i&#39;m aware that bitbake requires the use of curly braces, so always<br>
must use &quot;${D}&quot;, so in something like this from xorg-font-common=
.inc,<br>
how does OE process this shell function? as in, what context do those<br>
routines run in?<br>
<br>
=C2=A0 pkg_postinst_${PN} () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for fontdir in `find $D/usr/lib/X11/fonts -typ=
e d`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkfontdir $fontdir=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkfontscale $fontd=
ir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for fontdir in `find $D/usr/share/fonts/X11 -t=
ype d`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkfontdir $fontdir=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkfontscale $fontd=
ir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 }<br>
<br>
it seems(?) clear that testing $D is the way to tell which of the two<br>
contexts one is running in, as in:<br>
<br>
=C2=A0 pkg_postinst_${PN}_class-target () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;x$D&quot; !=3D &quot;x&quot; ]; the=
n<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rootarg=3D&quot;--root $D&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rootarg=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ... snip ...<br>
<br>
such that if $D is the empty string, then you&#39;re in the context of a<b=
r>
running system. am i close?<br>
<br>
rday<br>
<br>
p.s. i notice there are two ways that $D is used to define the<br>
context. in some cases, just using it (as in the first example above)<br>
is sufficient, while in other cases (as in the second case), the<br>
routine needs to actually test the value.<br>
<br>
</blockquote></div>

--000000000000f1491d05a2b85c6d--
