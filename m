Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36508CCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 12:54:13 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16751.1777543359302717235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=kkdFRMkm;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.176, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-799001d73bdso6633267b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 03:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777543358; cv=none;
        d=google.com; s=arc-20240605;
        b=jUA37f/oEm/pPEnGBru0gPfhoVptyIn1NkPHVgVEYh6mi5jzSrII4FxUK/JKHSyHpC
         EXGspf1jcOKTYDY4RkGQB5wiJ3/WD/leVxZ1p0ngJoplNqbebCPsMwMSjlmlDPvZZmwF
         ZrhTW1yEqdLiApohLOxTLwyLtiOj6PxC03jNZmyEaquRJ62EGKDm3IZrwaC9UhQo4V5x
         FbhVlPzwynWJTiModLFicI8UQ27LbHpZlYOyh6wcBc+gKM9Hha+HKKMWbWwYvQBu6YIY
         JXfnjpRqr+HhBEve5eCXRqKhWozwAHBUoYIofdFh64+OGHGAV/QrG5PuYOOdSsZ2kUXv
         5anQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=umVn3yO+SMyIwf0qYQ1SCFkAOAIVTH/mvAEylmNlAow=;
        fh=h3nkVvoLhjfdxU5DDLPhH+ifK7P5aJbe0a8U/JGLCDk=;
        b=WIG3gzZrfWFjzwiInBK00PVhkjZ1zyJFj37YLEzdP1igU/De5x18VROKl7xTPszYSP
         HMzYYBTRYIUCxyrJYwatxFVDHS2ZnX7A7edwGNYGT4E0pHpBhM8g2Wws94HlBkMp2kA8
         KUtr6OAp0aosa+NKLHAB7RkVw7hCCJp4K5cfHKUkh593EmBxl0ktbBW5KrwL25fcytfi
         YrIrIL5LKAEgn6GtUI/moIApOU2+AO1IUPJ6mjGP59OHAoma/pzDvfO+/f2a5hBl7ekZ
         IU/GMKRYqGuVrdseoLmtPXsGXch+sZImNWz0ucBt5DLbNdEMoK0Rg4hFL3pMaDPMSlWl
         Fpag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1777543358; x=1778148158; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=umVn3yO+SMyIwf0qYQ1SCFkAOAIVTH/mvAEylmNlAow=;
        b=kkdFRMkmlkEU/MaIrZ0YLWerQxDVyiv9T4tTY46NV1wQ1XtdsXdJYonV/kAyp7Rh9B
         1+h6h4XtLWqcahykg1PCRqttaeO/Azk/Qk7pPXUYzIjvQbOgyIK6NNcnCbcT8E2DXxOz
         N715mikjHVlBi8lGi09IZPqllJPOOnHwjjZx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543358; x=1778148158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umVn3yO+SMyIwf0qYQ1SCFkAOAIVTH/mvAEylmNlAow=;
        b=bSSpdNqJlFJKtYzml/w9CauNJnZ32+DvkFyfcD9Y3hy2mxQIefRtG/SFE8R56vjnUV
         m4geXUFMxqq9/+ViO44ObW5z+QOri9Q9u7p1sE9mLySR/zVDEKsIehnO0B8Jm5E90oKv
         O+k26UwbAGhOc2U4784hoaP53SdHJXgvXjlCpqlWOQD9+khWf6YRNFmBclCGu9n8aagO
         tdjYwOQBH9lcthHyn+PGqTtj1stO5ixcZAupMd7YTBL+pn0MyoSJtfmRVuQyZFm+6tov
         kYJzHoBa/UjQSIKund7jP7nnMypoodvkVJ6vWOU3/8W1ehND9yHeQiIvL8eoH3AINhKI
         0k8g==
X-Forwarded-Encrypted: i=1; AFNElJ+ZksvjIuwGfpP23xAsfmD7C9ChhB1EYCnv3OSifyzthP9y+3DU+XeWT3fbejVpRLhdszcXcqPcm2Y5aLRROOuwgw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyca9iFEVY4cXuBQ4J+WFsSRi8gwGl02rKcMAboojUDOSrWZIrM
	hEfAKEPmzIks9DgJv03xenHkRh3FWEN1VjYaoddklWGggdaaUhpvfq2AHjU36+g7hW/xYnt6vpR
	rZtep3gNcXdtvknS9f7pqMPqgjxLgQz3oxKRnTMHmoQ==
X-Gm-Gg: AeBDiev7Vt07i+/Gw8fh2cx1WKn9MJDCyFPYpXQT8G/Cqbc6qQHoMFIciN+7rvBnO46
	ug1wjCbvEK9CbuBFRX1Q5CTYfdyIRFM8uSh4UgOB7zkze9kvacZhfmZRjamK85Ao6hILLzWhW5b
	CbF1DX9AXcE8j7KxPEMwDDK8m0XGBmUjwBl9sbyfkm/L0vy8MBbEWtqb4naQQpM/uv1cA+3+8HR
	826wDAr0cCLXBb844Avg/qNJwfMItD4n0eGlGxl5p10N/AhgHE7wgI49y1wwYPf2J9VFSee7o9q
	ojoOWX6RthulcMuCKFfeCo2WXjtdOUouKe48cNpONWkK6mI3
X-Received: by 2002:a05:690c:630c:b0:7ba:f6b4:358b with SMTP id
 00721157ae682-7bd52abcdfamr21075947b3.43.1777543357828; Thu, 30 Apr 2026
 03:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260429145136.618168-1-dario.binacchi@amarulasolutions.com>
 <CANNYZj_G3qnevyKhBYzqm=uSTf5T6vGtJPH0AgW5eDBZKTBRUg@mail.gmail.com> <CAOgG7m1sCnR3wL+MApkxxgWL9LrRoHECEB8aXO1cvq2pFAY=8A@mail.gmail.com>
In-Reply-To: <CAOgG7m1sCnR3wL+MApkxxgWL9LrRoHECEB8aXO1cvq2pFAY=8A@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 30 Apr 2026 12:02:24 +0200
X-Gm-Features: AVHnY4Jju2mvpz5uTLs61ofLsMSV08OJ6uc4UCqa8qsykiqufMwJ4aidWQ1jpNY
Message-ID: <CABGWkvpZh0UerxDzzeP+omBi9Tk0VibPzeoxoeGTa2r=fcgUUw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libfwumdata: add new recipe
To: Talel BELHADJ SALEM <bhstalel@gmail.com>
Cc: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org, 
	linux-amarula@amarulasolutions.com
Content-Type: multipart/alternative; boundary="0000000000006ae07b0650aa908d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236164

--0000000000006ae07b0650aa908d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Talel,

On Wed, Apr 29, 2026 at 7:10=E2=80=AFPM Talel BELHADJ SALEM <bhstalel@gmail=
.com>
wrote:

> Hello Dario
>
> I have some questions.
>
> Why are you maintaining a custom version for this ?
>
> I can see that U-boot has already a support for this:
> https://github.com/u-boot/u-boot/tree/master/tools/fwumdata_src
>
> Also, vendors U-boot provide support for this, such as ST/iMX:
> https://github.com/STMicroelectronics/u-boot/blob/v2023.10-stm32mp/tools/=
mkfwumdata.c
>
> I see that the already provided tool is enough to update metadata
> (supports V2), so what your library is adding to that ?
>
> Do we really need it in OE core or meta-oe ?
>


While the primary purpose of mkfwumdata is to generate a complete metadata
image
from scratch, typically during the build process, the fwumdata tool, on the
other
hand, was designed for targeted runtime manipulation of existing metadata.

The distinction between the two tools in a real-world scenario, can be seen
in
my recent PR for the ST BSP [1];

Build-time: In commit [2] mkfwumdata is used to generate the initial
metadata file
                  to be included in the WIC image.

                  git grep TF_A_METADATA_TOOL

recipes-bsp/trusted-firmware-a/tf-a-stm32mp.inc:TF_A_METADATA_TOOL_NAME ?=
=3D
"mkfwumdata"

recipes-bsp/trusted-firmware-a/tf-a-stm32mp.inc:TF_A_METADATA_TOOL ?=3D
"${STAGING_BINDIR_NATIVE}/${TF_A_METADATA_TOOL_NAME}"


Runtime: In commit [3], fwumdata is used within a systemd service. Upon
boot, it
                checks if the current bank is in the "valid" state and sets
it to "accepted" to
                prevent the Arm Trusted Firmware (ATF) from performing an
unwanted rollback.

The next logical step, and the reason for this patch, is to allow OTA
managers
like SWUpdate or RAUC, as well as proprietary applications, to easily
trigger
a bank switch. While they could theoretically call the fwumdata command-lin=
e
tool, providing a dedicated, lightweight C library is a much cleaner and
more
integrated approach for C/C++ applications than relying on system() or
exec().

Furthermore, this first version of libfwumdata (v0.1.0) minimizes write
operations to just the three fields strictly necessary for boot bank
selection:

- active_index
- previous_index
- bank_state

This limited scope currently provides the added benefit of increasing
safety by
preventing userspace applications from accidentally corrupting other parts
of
the metadata.

[1] https://github.com/STMicroelectronics/meta-st-stm32mp/pull/110
[2]
https://github.com/STMicroelectronics/meta-st-stm32mp/pull/110/changes/d7e3=
2fdbfca3b4489a30f28101f0184e211733c6
[3]
https://github.com/STMicroelectronics/meta-st-stm32mp/pull/110/changes/ed6a=
9c52d9d32abcf281f986f0506ff4dbde1c5a


Thanks and regards,
Dario


>
> Kind regards
> Talel
>
> On Wed, Apr 29, 2026 at 4:12=E2=80=AFPM Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
>
>> This should probably go to meta-oe? Oe-core carries essential packages
>> and toolchains and this doesn't seem like it meets the criteria.
>>
>> Alex
>>
>> On Wed, 29 Apr 2026 at 17:05, Dario Binacchi via
>> lists.openembedded.org
>> <dario.binacchi=3Damarulasolutions.com@lists.openembedded.org> wrote:
>> >
>> > libfwumdata is a lightweight C library for parsing, validating (CRC32)=
,
>> > and manipulating Firmware Update (FWU) metadata, allowing tools such a=
s
>> > RAUC or SWUpdate, and in general any application, to modify the boot
>> > bank selection.
>> >
>> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> > ---
>> >  meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb | 22 +++++++++++++++++++=
+
>> >  1 file changed, 22 insertions(+)
>> >  create mode 100644 meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
>> >
>> > diff --git a/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
>> b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
>> > new file mode 100644
>> > index 000000000000..838b4983c21d
>> > --- /dev/null
>> > +++ b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
>> > @@ -0,0 +1,22 @@
>> > +SUMMARY =3D "Library to access Firmware Update (FWU) metadata"
>> > +
>> > +DESCRIPTION =3D "This package contains a library to read and modify F=
WU \
>> > +metadata. It provides a minimal API to allow userspace applications,
>> such as \
>> > +SWUpdate, RAUC or any other OTA update manager, to modify the boot
>> bank \
>> > +selection."
>> > +
>> > +HOMEPAGE =3D "https://github.com/passgat/libfwumdata"
>> > +LICENSE =3D "LGPL-2.1-or-later"
>> > +LIC_FILES_CHKSUM =3D
>> "file://LICENSES/LGPL-2.1-or-later.txt;md5=3D4fbd65380cdd255951079008b36=
4516c"
>> > +SECTION =3D "libs"
>> > +
>> > +SRC_URI =3D "git://
>> github.com/passgat/libfwumdata;protocol=3Dhttps;branch=3Dmaster"
>> > +SRCREV =3D "c6e235d3cf0467211ca6946bd10a2c8bdc0d5053"
>> > +
>> > +S =3D "${WORKDIR}/git"
>> > +
>> > +inherit cmake lib_package
>> > +
>> > +DEPENDS =3D "zlib"
>> > +
>> > +BBCLASSEXTEND =3D "native"
>> > --
>> > 2.43.0
>> >
>> >
>> >
>> >
>>
>>=20
>>
>>

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

--0000000000006ae07b0650aa908d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Talel,</div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, Apr 29, 2026 at 7:10=E2=80=AFPM Talel BELHADJ SALEM &lt;<a href=3D"mailt=
o:bhstalel@gmail.com">bhstalel@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello Dario<div><b=
r></div><div>I have some questions.</div><div><br></div><div>Why are you ma=
intaining a custom version for this ?</div><div><br></div><div>I can see th=
at U-boot has already a support for this:=C2=A0<a href=3D"https://github.co=
m/u-boot/u-boot/tree/master/tools/fwumdata_src" target=3D"_blank">https://g=
ithub.com/u-boot/u-boot/tree/master/tools/fwumdata_src</a></div><div><br></=
div><div>Also, vendors U-boot provide support for this, such as ST/iMX:=C2=
=A0<a href=3D"https://github.com/STMicroelectronics/u-boot/blob/v2023.10-st=
m32mp/tools/mkfwumdata.c" target=3D"_blank">https://github.com/STMicroelect=
ronics/u-boot/blob/v2023.10-stm32mp/tools/mkfwumdata.c</a></div><div><br></=
div><div>I see that the already provided tool is enough to update metadata =
(supports V2), so what your library=C2=A0is adding to that ?</div><div><br>=
</div><div>Do we really need it in OE core or meta-oe ?</div></div></blockq=
uote><div><br><br>While the primary purpose of mkfwumdata is to generate a =
complete metadata image<br>from scratch, typically during the build process=
, the fwumdata tool, on the other<br>hand, was designed for targeted runtim=
e manipulation of existing metadata.<br><br>The distinction between the two=
 tools in a real-world scenario, can be seen in<br>my recent PR for the ST =
BSP [1];<br><br>Build-time: In commit [2] mkfwumdata is used to generate th=
e initial metadata file</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 to be included in the WIC image.<br><br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git grep TF_A_METADATA_TO=
OL<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe=
s-bsp/trusted-firmware-a/tf-a-stm32mp.inc:TF_A_METADATA_TOOL_NAME ?=3D &quo=
t;mkfwumdata&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 recipes-bsp/trusted-firmware-a/tf-a-stm32mp.inc:TF_A_METADATA_TO=
OL ?=3D &quot;${STAGING_BINDIR_NATIVE}/${TF_A_METADATA_TOOL_NAME}&quot;<br>=
<br><br>Runtime: In commit [3], fwumdata is used within a systemd service. =
Upon boot, it<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=
=A0checks if the current bank is in the &quot;valid&quot; state and sets it=
 to=C2=A0&quot;accepted&quot; to=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prevent the Arm Trusted Firmware (ATF) from=
 performing=C2=A0an unwanted rollback.<br><br>The next logical step, and th=
e reason for this patch, is to allow OTA managers<br>like SWUpdate or RAUC,=
 as well as proprietary applications, to easily trigger<br>a bank switch. W=
hile they could theoretically call the fwumdata command-line<br>tool, provi=
ding a dedicated, lightweight C library is a much cleaner and more<br>integ=
rated approach for C/C++ applications than relying on system() or exec().<b=
r><br>Furthermore, this first version of libfwumdata (v0.1.0) minimizes wri=
te<br>operations to just the three fields strictly necessary for boot bank =
selection:<br><br>- active_index<br>- previous_index<br>- bank_state<br><br=
>This limited scope currently provides the added benefit of increasing safe=
ty by<br>preventing userspace applications from accidentally corrupting oth=
er parts of<br>the metadata.<br><br>[1] <a href=3D"https://github.com/STMic=
roelectronics/meta-st-stm32mp/pull/110">https://github.com/STMicroelectroni=
cs/meta-st-stm32mp/pull/110</a><br>[2] <a href=3D"https://github.com/STMicr=
oelectronics/meta-st-stm32mp/pull/110/changes/d7e32fdbfca3b4489a30f28101f01=
84e211733c6">https://github.com/STMicroelectronics/meta-st-stm32mp/pull/110=
/changes/d7e32fdbfca3b4489a30f28101f0184e211733c6</a><br>[3] <a href=3D"htt=
ps://github.com/STMicroelectronics/meta-st-stm32mp/pull/110/changes/ed6a9c5=
2d9d32abcf281f986f0506ff4dbde1c5a">https://github.com/STMicroelectronics/me=
ta-st-stm32mp/pull/110/changes/ed6a9c52d9d32abcf281f986f0506ff4dbde1c5a</a>=
<br><br><br>Thanks and regards,<br>Dario<br>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>Kind=
=C2=A0regards</div><div>Talel</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 29, 2026 at 4:12=E2=80=AFPM =
Alexander Kanavin via <a href=3D"http://lists.openembedded.org" target=3D"_=
blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmai=
l.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">This should probably go to meta-oe? Oe-core carries essential packages=
<br>
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
<br>
<br>
</blockquote></div>
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

--0000000000006ae07b0650aa908d--

