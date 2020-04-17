Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.316.1587159216265962208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 14:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OxMdEAHO;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id z1so2101180vsn.11
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2020 14:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihaVUA8aOrSiIWihS0OoRPsZ6HU4KLmVRVFC5gOcg44=;
        b=OxMdEAHOR6NYhfmsEMCEOgboj7KnCEJOd9tLGW/pAOvoSNNzJo9ttGqxF3SQowB2ip
         VNg9eIbFWaRsoy3dpt8/0XqX2I0ZUXcdyxfHPMMnjZwNSjPgeyhUy77L8LUnZdZAC19o
         fFLUZag7zeBDTQN8OeIAim+WfNac5wMRqP4oysun+CaajjuHnYvxoM5pHkfLk5V65AKW
         33LxUYzbiDn2T3Aa3xK7bAxPKuJjAn6b4fccIV/xbsvRpfw0hZ+Yimb70eU8na/Em1RB
         XTo4wwfr2PYYR758tlbM/bHghJHJcX9VE2pbAbS0xvc8Yjh3Yp/bmW9yJgKlxBS9oje9
         ZhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihaVUA8aOrSiIWihS0OoRPsZ6HU4KLmVRVFC5gOcg44=;
        b=B+A7pwkdbttePLPlxPqpccAbXLQK39oWaDssW16ElFGmIXwn8lVJ76UZ3iVUC0+++r
         tYk6bifkYU9ffLm0YBAWvA5/h7mhsd97HDyhCQ4+P4NdyndmMajrTQGCdPZcdqUrSMc0
         bls43js00HLgAOLx3Lp34u7DXq3yFVYjzsN/4xmIvKR7YlbwP9HhQaqJENPOftRULfL7
         COhoqCyMc1d/uhribgKXnxHKF51Mds+3gazo5ZKezgLxFfGgcNBTcoULC0mvV6w9zIv4
         0/Mry/mupg/D3+487jR/dIcHHo20fe2FTqhMYVYBVaHfz6PGzVBHhtp1IaEQzHTBEzlq
         FLfg==
X-Gm-Message-State: AGi0PuaOkkczWTKZ+68QXJvFRRERF9tcbuYbJzVojJnSD3UjP6pzbXMr
	o029947NacvTrq7eEY+ZkmkeCHtam2i5BZbvw6I/Sw==
X-Google-Smtp-Source: APiQypJyjoe2kDRpLt8oRYoSVuDGA2/4Tlj2IK0IRfFLE0144I3DRnTe6lVya7MuC6OnnOWUTvQ0vFk6/HNMT+kYyaE=
X-Received: by 2002:a67:fc8d:: with SMTP id x13mr4432204vsp.83.1587159215205;
 Fri, 17 Apr 2020 14:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2004171715340.1963843@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004171715340.1963843@localhost.localdomain>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 17 Apr 2020 23:33:23 +0200
Message-ID: <CANNYZj9hjn28fQqLpbML7=SOdERUBGfFDCSir29sTz1nprgQEQ@mail.gmail.com>
Subject: Re: [OE-core] missing(?) numerous ptest packages building core-image-minimal for arm64
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000039746405a3834dac"

--00000000000039746405a3834dac
Content-Type: text/plain; charset="UTF-8"

ptest-pkgs is complementary; it pulls in ptests only for those packages
that are explicitly included in the image. (similar to how dev-pkgs or
doc-pkgs work).

Generally, it is not recommended to use ptest-pkgs as you never know what
you end up with, and how long running ptests will take; list ptests you
want explicitly
(core-image-sato-sdk-ptest is an example of how).

Alex

On Fri, 17 Apr 2020 at 23:21, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   as a demo of how ptest works, i used the current master branch of
> poky, MACHINE=qemuarm64, built core-image-minimal, and selected to
> install ptests with:
>
>   DISTRO_FEATURES_append = " ptest"
>   EXTRA_IMAGE_FEATURES += "ptest-pkgs"
>
> following the directions in the dev manual. but when it was all over
> and i fired up the qemu image, there were *very* few ptests installed
> under /usr/lib -- in fact, only busybox, zlib and util-linux.
>
>   i was expecting far more; for example, bzip2, which has ptest
> capability. i verified that PACKAGES for bzip2 included bzip2-ptest, i
> could see the ptest content under bzip2's "packages-split" and so on,
> but nothing in the qemu image. and there are quite a number of
> ptest-enabled recipes that seem to have had their ptest package
> omitted from the final image.
>
>   am i missing something? is there an extra configuration i need? feel
> free to try this for yourself, and let me know if i'm just overlooking
> something trivial.
>
> rday
> 
>

--00000000000039746405a3834dac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ptest-pkgs is complementary; it pulls in ptests only =
for those packages that are explicitly included in the image. (similar to h=
ow dev-pkgs or doc-pkgs work).</div><div><br></div><div>Generally, it is no=
t recommended to use ptest-pkgs as you never know what you end up with, and=
 how long running ptests will take; list ptests you want explicitly</div><d=
iv>(core-image-sato-sdk-ptest is an example of how).</div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, 17 Apr 2020 at 23:21, Robert P. J. Day &lt;<a href=
=
=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0 as a demo of how ptest works, i used the current master branch of<b=
r>
poky, MACHINE=3Dqemuarm64, built core-image-minimal, and selected to<br>
install ptests with:<br>
<br>
=C2=A0 DISTRO_FEATURES_append =3D &quot; ptest&quot;<br>
=C2=A0 EXTRA_IMAGE_FEATURES +=3D &quot;ptest-pkgs&quot;<br>
<br>
following the directions in the dev manual. but when it was all over<br>
and i fired up the qemu image, there were *very* few ptests installed<br>
under /usr/lib -- in fact, only busybox, zlib and util-linux.<br>
<br>
=C2=A0 i was expecting far more; for example, bzip2, which has ptest<br>
capability. i verified that PACKAGES for bzip2 included bzip2-ptest, i<br>
could see the ptest content under bzip2&#39;s &quot;packages-split&quot; a=
nd so on,<br>
but nothing in the qemu image. and there are quite a number of<br>
ptest-enabled recipes that seem to have had their ptest package<br>
omitted from the final image.<br>
<br>
=C2=A0 am i missing something? is there an extra configuration i need? fee=
l<br>
free to try this for yourself, and let me know if i&#39;m just overlooking=
<br>
something trivial.<br>
<br>
rday<br>
<br>
</blockquote></div>

--00000000000039746405a3834dac--
