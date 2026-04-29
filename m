Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B897FF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 17:10:28 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1402.1777482618322191037
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 10:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CvVpQglU;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bhstalel@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66bd474d90bso2711a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 10:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777482617; cv=none;
        d=google.com; s=arc-20240605;
        b=ckhmz+dMr2gCy9+HKCUn1HsrGjSfqQV+S07o7yfglexlYHxzICofLpw7z/oVl2Yv7o
         Ra3kYB9YKA5A06fAH5LXqsFTy7hcQewVnlw58K5qS3zC4/oTwRxhZft0VfIpTzvnFQOG
         +qvS1bey6mAp53rj37Ds5OkfYFvLvJy7/3m3vcV0FpqAtePsC1g6T+6Bz1VYMyMktAfA
         dnJdq7x0yZIBCRVtmetN0w9S6G/itF0HSFtpI2bZhktAdjhsdEUZVbIzYc7vvalDhuw3
         TOJFp8jeF3kkzQwyPabqGCRFUN+hA8AX1P/dZ4DP01444Zqgtc62YuK+QxuNes2Ltvuj
         wm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1kTUzLDOSWRLQkorcszBSJPDkGDdbS4sucPwD8oj03Y=;
        fh=gVJX43qLPAugh+SSsQEDCTV56QnFiVpDhtnPIAfPhTI=;
        b=bEShxz/K/b7f/dB1O8POWvb+rJDyfSJ7vBq0+YdIc+wWHZ2H+fwxdYdCUinQ7AsM32
         ESFdc4PYTMnc6bfiMzCGotkB4bRraKD1pKc77Iyafwb57ltvO+iT0ewyUduMTYgviSXZ
         vQJhfctl3C+YvzpWB+Pmfnc81XwL63VBGpzKto4Umtg9H1ykCp4T4SMqJbLGmgJ7QuiD
         JbJ3Rb+LB4jUnRuHU8Kwm2W8j7cUq4B42EfLCS0zX/Q5XTGvR3murB2UcdS1uW2d4hqm
         sFiIAjyK0JQzqvIL8+Om1d4MAoIxsnDOlhHZP8iAmdKr0xiguPKGvivIep3O4fzLhaTz
         y5rg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482617; x=1778087417; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1kTUzLDOSWRLQkorcszBSJPDkGDdbS4sucPwD8oj03Y=;
        b=CvVpQglUNKGDwVSbtJiDuylpaIRjmsMKL/Es63J2TYo+hRyP935BNi6nD+CaaVbhYj
         sraF5zSxtvF1PfNXaJK3hQk3mVXAmLk4FuGeHG5B5fgkfJRlkHbocW5WPjzLD2u2HniX
         oqtmlYpM23MboodYUuNE7iOPY6CG00mugV8+MYmzEHJeXwJaS5mldD6qmJ89B5Pv57hW
         xuCh5TI3ynVugATPwOg4y5GxThdDGKADlNVRW7Tcaxeqcz21o3efQ9E8B08rvOx7DvWr
         Lxqpi70WGUijJQiOkzKlimEXJyC3zGb5ghOwIf+0Tlf+YDxSjQRvu2BgZr5xL7azxO+6
         4U9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482617; x=1778087417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kTUzLDOSWRLQkorcszBSJPDkGDdbS4sucPwD8oj03Y=;
        b=eQ/XRrXnpIcpRrLaG0lPgdXqReX3lLvQNfmR7kNmZ5HCLZwZAw3M3KtHMPYqm7JXEH
         OgzEpdU+eTgJbw/c54LCyhEInI9ZaATpnPdlLDw/Ohfl+8kMjf0pYXgnB29Zh7noEWJu
         SguFgignkwh5UFVSFw0MqvXvgpldqFtNZyTvnrb9CSS5LDh/pAne5CuSSGLYJk2BsbUN
         ko9Vr6usI4WhP5vam2FjixLgqYb6rN0LT+JKMzJVfgpBk++EiItA+r8tBDvqH9K7o+aC
         GCZFMnE63qFTvLBEncbOGPXK839dnBQ7+K9Auv07eJi78p8NvowL24wwQ3YI4szNHUuM
         RCbw==
X-Forwarded-Encrypted: i=1; AFNElJ/ERz7bMCd+cQxGIyMCcyqZOQRlqfttS8jJqsGwrTQOXaY+yj3u2htS6QEXsEG+YP+M3wXIl/8J/PyAWKfCiBXUCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YznsN1qKMwC3NV7DAMSNwiVww5JD+nVr+0W3x9hZaJ02lMz0Hr3
	u9w/zLniQi6hWNzSBXbdDHJZIhmP7qttRNEFka+K/a5md84cK04Wzy3kalXh8X2UgwTflSNEVc3
	D3BXK90xYOKXFhzTyqP+rGj8XWtd9kW8=
X-Gm-Gg: AeBDiesLK2mLdWD6uiRWlstzKilVLTubq/z1HwkhGlpxVEhYqLwxh5NaJNnNV0QJ/eA
	jKFAvjq33Cw1L0tpLP6tt9JcTysMMGlVvj0cpiettTp4KUBbBwJeHAtxfJcaUoKgnzoGzTnpR6J
	7WbDFSJ1RimKcbYOG3vnyYF2mBFQl627Dk/Q+U6YpzxAtGYTNsZLT4wE54OHKWfOiUHymNN5ODy
	VP3WX8dGXsUHUu3SNXozdyBxORmu+2BjkPz3L3IKd1VoXO1IbkK/NBRgSrvBTJR6y+YJKMhi1fd
	kKJsqLXPkU2R0uDgAP9yDpsA13i8p5ze81/MTIuFUZoew0n8Ylo=
X-Received: by 2002:a05:6402:3224:b0:678:a5d1:ca9c with SMTP id
 4fb4d7f45d1cf-679b6721093mr1931146a12.6.1777482616280; Wed, 29 Apr 2026
 10:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260429145136.618168-1-dario.binacchi@amarulasolutions.com> <CANNYZj_G3qnevyKhBYzqm=uSTf5T6vGtJPH0AgW5eDBZKTBRUg@mail.gmail.com>
In-Reply-To: <CANNYZj_G3qnevyKhBYzqm=uSTf5T6vGtJPH0AgW5eDBZKTBRUg@mail.gmail.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Wed, 29 Apr 2026 18:10:00 +0100
X-Gm-Features: AVHnY4I9MCzFHdYfeLlZqGkSMdmDoLChTlGt7fLoVc3t61wdHj7A5pIdjF_GmxM
Message-ID: <CAOgG7m1sCnR3wL+MApkxxgWL9LrRoHECEB8aXO1cvq2pFAY=8A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libfwumdata: add new recipe
To: alex.kanavin@gmail.com
Cc: dario.binacchi@amarulasolutions.com, 
	openembedded-core@lists.openembedded.org, linux-amarula@amarulasolutions.com
Content-Type: multipart/alternative; boundary="000000000000f01a0606509c6b76"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 17:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236125

--000000000000f01a0606509c6b76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dario

I have some questions.

Why are you maintaining a custom version for this ?

I can see that U-boot has already a support for this:
https://github.com/u-boot/u-boot/tree/master/tools/fwumdata_src

Also, vendors U-boot provide support for this, such as ST/iMX:
https://github.com/STMicroelectronics/u-boot/blob/v2023.10-stm32mp/tools/mk=
fwumdata.c

I see that the already provided tool is enough to update metadata (supports
V2), so what your library is adding to that ?

Do we really need it in OE core or meta-oe ?

Kind regards
Talel

On Wed, Apr 29, 2026 at 4:12=E2=80=AFPM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> This should probably go to meta-oe? Oe-core carries essential packages
> and toolchains and this doesn't seem like it meets the criteria.
>
> Alex
>
> On Wed, 29 Apr 2026 at 17:05, Dario Binacchi via
> lists.openembedded.org
> <dario.binacchi=3Damarulasolutions.com@lists.openembedded.org> wrote:
> >
> > libfwumdata is a lightweight C library for parsing, validating (CRC32),
> > and manipulating Firmware Update (FWU) metadata, allowing tools such as
> > RAUC or SWUpdate, and in general any application, to modify the boot
> > bank selection.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >  meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb | 22 ++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
> >
> > diff --git a/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
> b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
> > new file mode 100644
> > index 000000000000..838b4983c21d
> > --- /dev/null
> > +++ b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY =3D "Library to access Firmware Update (FWU) metadata"
> > +
> > +DESCRIPTION =3D "This package contains a library to read and modify FW=
U \
> > +metadata. It provides a minimal API to allow userspace applications,
> such as \
> > +SWUpdate, RAUC or any other OTA update manager, to modify the boot ban=
k
> \
> > +selection."
> > +
> > +HOMEPAGE =3D "https://github.com/passgat/libfwumdata"
> > +LICENSE =3D "LGPL-2.1-or-later"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSES/LGPL-2.1-or-later.txt;md5=3D4fbd65380cdd255951079008b364=
516c"
> > +SECTION =3D "libs"
> > +
> > +SRC_URI =3D "git://
> github.com/passgat/libfwumdata;protocol=3Dhttps;branch=3Dmaster"
> > +SRCREV =3D "c6e235d3cf0467211ca6946bd10a2c8bdc0d5053"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake lib_package
> > +
> > +DEPENDS =3D "zlib"
> > +
> > +BBCLASSEXTEND =3D "native"
> > --
> > 2.43.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236111):
> https://lists.openembedded.org/g/openembedded-core/message/236111
> Mute This Topic: https://lists.openembedded.org/mt/119065936/1955228
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bhstalel@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f01a0606509c6b76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Dario<div><br></div><div>I have some questions.</div=
><div><br></div><div>Why are you maintaining a custom version for this ?</d=
iv><div><br></div><div>I can see that U-boot has already a support for this=
:=C2=A0<a href=3D"https://github.com/u-boot/u-boot/tree/master/tools/fwumda=
ta_src">https://github.com/u-boot/u-boot/tree/master/tools/fwumdata_src</a>=
</div><div><br></div><div>Also, vendors U-boot provide support for this, su=
ch as ST/iMX:=C2=A0<a href=3D"https://github.com/STMicroelectronics/u-boot/=
blob/v2023.10-stm32mp/tools/mkfwumdata.c">https://github.com/STMicroelectro=
nics/u-boot/blob/v2023.10-stm32mp/tools/mkfwumdata.c</a></div><div><br></di=
v><div>I see that the already provided tool is enough to update metadata (s=
upports V2), so what your library=C2=A0is adding to that ?</div><div><br></=
div><div>Do we really need it in OE core or meta-oe ?</div><div><br></div><=
div>Kind=C2=A0regards</div><div>Talel</div></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Ap=
r 29, 2026 at 4:12=E2=80=AFPM Alexander Kanavin via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
his should probably go to meta-oe? Oe-core carries essential packages<br>
and toolchains and this doesn&#39;t seem like it meets the criteria.<br>
<br>
Alex<br>
<br>
On Wed, 29 Apr 2026 at 17:05, Dario Binacchi via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;dario.binacchi=3D<a href=3D"mailto:amarulasolutions.com@lists.openembed=
ded.org" target=3D"_blank">amarulasolutions.com@lists.openembedded.org</a>&=
gt; wrote:<br>
&gt;<br>
&gt; libfwumdata is a lightweight C library for parsing, validating (CRC32)=
,<br>
&gt; and manipulating Firmware Update (FWU) metadata, allowing tools such a=
s<br>
&gt; RAUC or SWUpdate, and in general any application, to modify the boot<b=
r>
&gt; bank selection.<br>
&gt;<br>
&gt; Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@ama=
rulasolutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a=
>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-bsp/u-boot/<a href=3D"http://libfwumdata_0.1.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libfwumdata_0.1.0.bb</a> | 22 ++++++++=
++++++++++++<br>
&gt;=C2=A0 1 file changed, 22 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://lib=
fwumdata_0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">libfwumdata_0.1.0.b=
b</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://libfwumdata_0.1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">libfwumdata_0.1.0.bb</a> b/meta=
/recipes-bsp/u-boot/<a href=3D"http://libfwumdata_0.1.0.bb" rel=3D"noreferr=
er" target=3D"_blank">libfwumdata_0.1.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000000..838b4983c21d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-bsp/u-boot/<a href=3D"http://libfwumdata_0.1.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libfwumdata_0.1.0.bb</a><br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +SUMMARY =3D &quot;Library to access Firmware Update (FWU) metadata&qu=
ot;<br>
&gt; +<br>
&gt; +DESCRIPTION =3D &quot;This package contains a library to read and mod=
ify FWU \<br>
&gt; +metadata. It provides a minimal API to allow userspace applications, =
such as \<br>
&gt; +SWUpdate, RAUC or any other OTA update manager, to modify the boot ba=
nk \<br>
&gt; +selection.&quot;<br>
&gt; +<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/passgat/libfwumdata"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/passgat/libfwumdat=
a</a>&quot;<br>
&gt; +LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSES/LGPL-2.1-or-later.txt;md5=
=3D4fbd65380cdd255951079008b364516c&quot;<br>
&gt; +SECTION =3D &quot;libs&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/passgat/libfwumd=
ata;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">=
github.com/passgat/libfwumdata;protocol=3Dhttps;branch=3Dmaster</a>&quot;<b=
r>
&gt; +SRCREV =3D &quot;c6e235d3cf0467211ca6946bd10a2c8bdc0d5053&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +inherit cmake lib_package<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;zlib&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236111): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236111" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/236111</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119065936/195=
5228" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119065936/1955228</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bhstalel@gmail.com" target=
=3D"_blank">bhstalel@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f01a0606509c6b76--

