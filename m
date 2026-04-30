Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3491EFF8873
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 12:54:13 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16544.1777543214737930754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=H7vtCuhB;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.171, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7982c3b7dfcso7169667b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 03:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777543214; cv=none;
        d=google.com; s=arc-20240605;
        b=H5/XYHHAG6ETjiNGywdP4jBXKvJ6kVW9jXm//tWjg6r01/bPVKRkhBFDaDwR4TmEH7
         RR3BXr7Wt0KAbysRc8D2cikqvtreqWjSKs5h5FOhdxJew/Xo4C1t7k9PGpEnGbzrP34e
         8XaWtL9voXuqsWbs7xZzDZ/c1+uIH5V4wB47BjiiZphhkZ4VffcvmmZgTqs+qB2TE0F+
         8iMSY8ebG348Bx9u7eUssdJ1FqwK1rSz2Wyx0TpBFsoBp6ywPlyUQLi2hzWTPU2Kbu+E
         2YVMUtfrO9vfjSXSiqqhejfiS47AayZUs6l/dRia3uqt9zv1Dw7oHMxQMHIRVFBz6YgQ
         2+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+DtVWdfb0z4DpHYM3hq84PaEFxos7YcUTJcMAGFqnUQ=;
        fh=BaatVCw1GBbPkBltJ8woK5kz6hmyDOw5YFvBD6e0bFE=;
        b=A5sRnbWdHgTk1Ux0NLZtFY5Zfnfg1cpLBDZneyzhmT6/izHlyhgnEuh9R/aGLZGh5x
         +drpjsQXL5bZYMJvyeUzx42O3tzGpIznBik05ird7d+e0fO1VDRLTH2AZo2Ry2yIZ+Dl
         a4om6JUFEWxJxJSda+dk4E4YX+rwoCNqKSPc6/6JdWv4mDX2pnzyoNCvybgsth+du1Sx
         IWGAhWwZLPQP458jpQk0VvQUoJXeSI0TsPezBBfp3ZQfkHfYtfhBxDq0/X25r2JnIOX0
         Ue31TsXWTPEFV1mC/rIQBTnVf9kUnjl0Ib9K8ATYNYy/cEt3rhMfvthX+BI46dkleB1B
         Az3A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1777543214; x=1778148014; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DtVWdfb0z4DpHYM3hq84PaEFxos7YcUTJcMAGFqnUQ=;
        b=H7vtCuhBwJxnO62VDSne45osbJ8i33n6tsxr5yliwdhEG9PtrAjDmn9japGPHBcOS/
         ujmHVB6CAKeHFRn6jSn4/yT5CdvX8fbv6R6rvtbrvVvoM9UnmNAIhUXCkJCfFspSeqpM
         udFa+jZPSPaL9bmE+CNTelDnK/rXuGSERe6rI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543214; x=1778148014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DtVWdfb0z4DpHYM3hq84PaEFxos7YcUTJcMAGFqnUQ=;
        b=AAAjE6Kmc4eRFKPVrIeBQYi8ZDahKRuKV9v8mywHuJeiW1J8dsbA9hO9ICw1R4Eyg0
         MII8aIZxjS3DDHREpKVzKQQAp4RJeJuxrKhU+Ry5CCSwhulaZe5bkPFB/VXmpis2BAS5
         fH5CyXmpywvNitxRP+psnCmMEHzW0QKxUL35RRQiEYpk40hM11yZixaTrThOOATYPRIA
         utKyId9uGfPa13gzkzPqPN+lViOP6S4YtMpy1woHocobA7TYd9EwMmk2Hw5bSlkZc24R
         /pvisL2Vl1b7ylV5p8MhpP9MD8CVmb0cej3TW7AeeQJJEOvYk7OR+4+mPhiizSu/ohWw
         haWg==
X-Gm-Message-State: AOJu0YxBY8IQPhJp6tX7/tG9cSeXRsLGy+rFvyDv16XTUwQM706kMaEy
	WqT5nuYGvreT9767kURxLXrBGekCHtHZbJ6pB49IEBOcoAKbhpqIHa9xPqN2b5W4nS/TcctN27p
	vMLm/8W6i9mwOQNajj4/gX6b52yYCdf+yPfqsDmo5xQ==
X-Gm-Gg: AeBDies+UI/HfJ1wVbwwAzvyBNXHSIdpEhBm74Wu3YxFlhOGBoZIkC+QEfqj4WVSFYY
	f6ICbk+VpqHyJTw1xozWDC9xWLnY8LGnVjh343KojZ4MqX5/u8rClu7gn6VSauWHVsLMTY5Jwwa
	jz/wUe3JXnEORtctR3wc9uV9X/mw9Cn6yFN+z39zxDri2yMKiej3mVcZ2lUU34opBkFou0oBl1m
	WAobkQdTjgUfwxTZPw/76XpzJjKMfY+n4P0gweUN8FnXduk53nTC71eNJogbYkzANk/l4sXzI0H
	MxKo7BuCeyBS4EhjRdIjZvOHBbOg1PuRazMYQrugbpW4ZrYE
X-Received: by 2002:a05:690c:a041:b0:7b6:de92:adb2 with SMTP id
 00721157ae682-7bd52aa32f6mr16865907b3.45.1777543213244; Thu, 30 Apr 2026
 03:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260429145136.618168-1-dario.binacchi@amarulasolutions.com> <CANNYZj_G3qnevyKhBYzqm=uSTf5T6vGtJPH0AgW5eDBZKTBRUg@mail.gmail.com>
In-Reply-To: <CANNYZj_G3qnevyKhBYzqm=uSTf5T6vGtJPH0AgW5eDBZKTBRUg@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 30 Apr 2026 12:00:02 +0200
X-Gm-Features: AVHnY4K7Lt6qL_PZ_XfMpctiyyatV-kZOBtUykjLcWFJDiTP_I3C7-UN8X_fkoI
Message-ID: <CABGWkvqW=czB_RcCNwtRXb6yZiZLTCmRW5eSLymv-Wp4KVnJYg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libfwumdata: add new recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	linux-amarula@amarulasolutions.com
Content-Type: multipart/alternative; boundary="000000000000cc72d00650aa87c1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236163

--000000000000cc72d00650aa87c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Wed, Apr 29, 2026 at 5:12=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> This should probably go to meta-oe? Oe-core carries essential packages
> and toolchains and this doesn't seem like it meets the criteria.
>

Hi Alex,

I submitted this to oe-core because it seems to me similar to libubootenv.
On platforms using the FWU A/B scheme (like STM32MP25), FWU metadata
effectively
replaces traditional U-Boot variables as the only mechanism to control boot
flow.

Furthermore I recently submitted a patch [1] to SWUpdate that uses this
library.
The SWUpdate maintainer pointed out that managing these FWU metadata fields
belongs logically to SWUpdate's "bootloader" interface, rather than being
handled as a generic script. This reinforces that libfwumdata operates in
the
exact same domain as U-Boot environment variables.

Finally, since it shares libubootenv's configuration pattern management,
oe-core seemed the natural fit. However, I am perfectly fine moving it to
meta-oe if you prefer.

[1] https://groups.google.com/g/swupdate/c/kYr2Hy-f3us

Thanks and regards,
Dario


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
> >=20
> >
>


--=20
*Dario Binacchi*
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

--000000000000cc72d00650aa87c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Alexander,</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, Apr 29, 2026 at 5:12=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mai=
lto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">This should probably go t=
o meta-oe? Oe-core carries essential packages<br>
and toolchains and this doesn&#39;t seem like it meets the criteria.<br></b=
lockquote><div><br></div>Hi Alex,<br><br>I submitted this to oe-core becaus=
e it seems to me similar to libubootenv.<br>On platforms using the FWU A/B =
scheme (like STM32MP25), FWU metadata effectively<br>replaces traditional U=
-Boot variables as the only mechanism to control boot flow.<br><br>Furtherm=
ore I recently submitted a patch [1] to SWUpdate that uses this library.<br=
>The SWUpdate maintainer pointed out that managing these FWU metadata field=
s<br>belongs logically to SWUpdate&#39;s &quot;bootloader&quot; interface, =
rather than being<br>handled as a generic script. This reinforces that libf=
wumdata operates in the<br>exact same domain as U-Boot environment variable=
s.<br><br>Finally, since it shares libubootenv&#39;s configuration pattern =
management,<br>oe-core seemed the natural fit. However, I am perfectly fine=
 moving it to<br>meta-oe if you prefer.<br><br>[1] <a href=3D"https://group=
s.google.com/g/swupdate/c/kYr2Hy-f3us">https://groups.google.com/g/swupdate=
/c/kYr2Hy-f3us</a><br><br>Thanks and regards,<br>Dario<br><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><font color=3D"#888888"><font color=3D"#000000" =
face=3D"Times New Roman"><span style=3D"font-size:14px"><b>Dario Binacchi</=
b></span></font><br style=3D"color:rgb(0,0,0);font-family:&quot;Times New R=
oman&quot;;font-size:medium"><span style=3D"color:rgb(0,0,0);font-family:&q=
uot;Times New Roman&quot;;font-size:12px">Senior Embedded Software Engineer=
<br></span></font><span style=3D"color:rgb(0,0,0);font-family:&quot;Times N=
ew Roman&quot;;font-size:12px">M. +39 328 0625246</span><font color=3D"#888=
888"><span style=3D"color:rgb(0,0,0);font-family:&quot;Times New Roman&quot=
;;font-size:12px"><br><a href=3D"mailto:dario.binacchi@amarulasolutions.com=
" style=3D"color:rgb(17,85,204)" target=3D"_blank">dario.binacchi@amarulaso=
lutions.com</a></span><br style=3D"color:rgb(0,0,0);font-family:&quot;Times=
 New Roman&quot;;font-size:medium"><span style=3D"font-family:&quot;Times N=
ew Roman&quot;;font-size:12px;color:rgb(241,194,50)">=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95</span><br style=3D"color:rgb(0,0,0)=
;font-family:&quot;Times New Roman&quot;;font-size:medium"><span style=3D"c=
olor:rgb(0,0,0);font-family:&quot;Times New Roman&quot;;font-size:12px"><sp=
an style=3D"font-weight:700">Amarula Solutions SRL</span><br>=C2=A0Via Feli=
ce Cavallotti 25D, 41012 Carpi, MO, IT<br><a href=3D"mailto:info@amarulasol=
utions.com" style=3D"color:rgb(17,85,204)" target=3D"_blank">info@amarulaso=
lutions.com</a><br><a href=3D"http://www.amarulasolutions.com/" style=3D"co=
lor:rgb(17,85,204)" target=3D"_blank">www.amarulasolutions.com</a></span></=
font></div></div></div>

--000000000000cc72d00650aa87c1--

