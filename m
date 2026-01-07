Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDE5D0D14F
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 17:43:47 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12022.1767807826203999898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 09:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kp0TEQcF;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64669a2ecb5so1366865d50.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767807825; x=1768412625; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pFMUQeWHxKkyKoLHSVQqKQocsrtfkLX7reKgFrf6Wgg=;
        b=Kp0TEQcFMD1cNKPx5tzy6yRvEwFPKJGT/h9PIzhoK1EC3D0PmpFeaYlf1Po4DtLLnv
         ps/61QI0/A2KaN4ZS5pZ375czV/yfOiMCM9UNvUR67DV74iBhMWr23AF80VmCr//DFxZ
         fSVs77AUBrZTVv/4zvDema7J5qrONFW8EdBSRWmZ0kPRuC8KLKqlZnDzlOmE28zm6zLt
         wCCMQOc0oTBmz6rywZ24bGSZsvhNFkiK3rpV2+t+S8t6ERo7mDjR1NiU5rH4sBpRzXcG
         l8w5hrZav4QBNk+qOkEa+v0gxc0NRRz9NWBca3xfSeQZGqHblBsqUWCr6G7Edm22Bzyc
         nYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767807825; x=1768412625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFMUQeWHxKkyKoLHSVQqKQocsrtfkLX7reKgFrf6Wgg=;
        b=d3mVRYD+hPAjVTzI+nlVfGmObTIYlTNwd9uEJdNTWlez/TZTl6rAghXpULUoKwZnQ9
         FnCRMBbgGfHg88e5I3+t53P5Rf0eojov/0wvRahJAa2qNkMUIGT/8JlqMUz0E7HZwt5N
         Qe4ZWmEOhISo4SQn5+B7DXPGo5X8h/PkXwXzsD9rpI2BtmGRrEHLtY6D2ATvoYXc7Mkh
         ppARuCIGDL6MH7BThAcvKSe5jklO+eZA28owcQIOW0cN2ZxlQDRbXki+GniKlT8Dpck0
         5Tk9+IxzsnKrp9JnC0StwqgBO7SOXzOtMk1+bQ+taxZtwxZKV4ZYFeNY1oKWPMaMl5Nz
         9Law==
X-Gm-Message-State: AOJu0YyMS39I4WSe2zEuVCHp0YCUdmFVaG25lezKCQYYQXiR/QrrnR7i
	1Hmix0Kpi7/UQSIPpU9XdYKJvwGK6YvES+CNSpsaPvKkYYze4koZmB4geki7UXcJtzhCpQ6INxg
	qpaR/uVWAvwa/ouKBOa14UWchO6Pe+Ko=
X-Gm-Gg: AY/fxX5FslWrTzuOiLB+spFo8SZ7JLe4eTLUXZ7jHJHKzSOJfIjtbYKplC2m3Gi9nXr
	MJDeiuCG988klaXWZvIvNVVpH3BAsFZtbaPHdkLz58fbBta5h71Wb97hgi4Qqp4XvOfSNjydQ+r
	QE4e8Y3xDri7Hfhe8+yTO2rp71l2qNzeBTmk2XXDF4rL8vPfoiNwoHP7q1QY558iiHKGJlaH19g
	4SdX/fsMiWSVcElqYT1+4wvJqPiY0bstBd9c01XLXlmUBNbL4Nr+NczsUfbUXG57taPcXlumkPo
	9F3zoh5gCCxx3GvIwKYaKunPOE6G71y3/QMyDaONicYGeDP4CGKqNrZ+nJtniVW0itvFGhqVjiU
	xIZshdMRVnICLj4fyTRojMK1qyn+IXPfbgCuW/JcAYK5PQw==
X-Google-Smtp-Source: AGHT+IHlIrlHuswX+tYxLniKOQTRe9LwGrYyJ3g0utaCP8QQTTbUyRmtLJZrEhy5g/T7PJBM7aVoZ/UCveLu6VdgEaU=
X-Received: by 2002:a05:690e:1409:b0:645:5325:3e59 with SMTP id
 956f58d0204a3-6470d243987mr5900062d50.6.1767807825302; Wed, 07 Jan 2026
 09:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20260107093231.59163-1-thomas.perrot@bootlin.com>
In-Reply-To: <20260107093231.59163-1-thomas.perrot@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jan 2026 09:43:18 -0800
X-Gm-Features: AQt7F2rY0mSHQ3gz-3ynpNpFd6N-W4kD3wu9DmlIE2IBcj0OaatqNCVBSpBXmFs
Message-ID: <CAMKF1sq2=BTBnMtFthXFkwab53ZGqUjnCM1n1AgkDu2D_=AKTw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] opensbi: bump to 1.8
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000755a160647cfd545"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 17:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229017

--000000000000755a160647cfd545
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 1:33=E2=80=AFAM Thomas Perrot via lists.openembedded=
.org
<thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:

> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> This release has:
> - Safe and reverse list iteration
> - Stack protector support
> - Allocate heap housekeeping nodes dynamically
> - IPI device ratings
> - Andes QiLai SoC support
> - SpacemiT K1 SoC support
> - ESWIN Computing EIC7700 SoC support
> - Moved Ariane and Openpiton to generic platform
> - SiFive CLINT v2 support
> - Simple FDT based cache library
> - SiFive PL2 cache controller driver
> - SiFive Extensible Cache (EC) driver
> - SiFive TMC0 based HSM driver
> - SiFive SMC0 based system suspend driver
> - MPXY RPMI mailbox driver for voltage service group
> - MPXY RPMI mailbox driver for device power service group
> - MPXY RPMI mailbox driver for performance service group
> - HART protection abstraction
>
> Overall, this release has various domain related improvements and
> also adds multiple platform support.
>
> Also switch Qemu -cpu parameter to rv64 because rva23s64 and rva22s64
> profiles lack PMP entries, causing hart isolation configuration to fail
> [1].
>
> [1] https://lists.nongnu.org/archive/html/qemu-riscv/2026-01/msg00048.htm=
l
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
>
> ---
>     Changes in v2:
>     - Enable PMP support on Qemu with rva23
>     - Include tag=3Dv${PV} in the SRC_URI
>     - Link to v1:
> https://lists.openembedded.org/g/openembedded-core/message/228935
> ---
>  meta/conf/machine/include/riscv/qemuriscv.inc               | 2 +-
>  meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} (97=
%)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc
> b/meta/conf/machine/include/riscv/qemuriscv.inc
> index b755d32c9d1a..45fcf36e62d9 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
>  # qemuboot options
>  QB_SMP ?=3D "-smp 4"
>  QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> -QB_CPU:riscv64 ?=3D "-cpu rva23s64"
> +QB_CPU:riscv64 ?=3D "-cpu rv64"
>

Do we still need this after enabling PMP


>  QB_MACHINE =3D "-machine virt"
>  QB_DEFAULT_BIOS =3D "fw_jump.elf"
>  QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscr=
ipt=3Dno"
> diff --git a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
> b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> similarity index 97%
> rename from meta/recipes-bsp/opensbi/opensbi_1.7.bb
> rename to meta/recipes-bsp/opensbi/opensbi_1.8.bb
> index a460062e9398..f2d3e9f20082 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> @@ -8,7 +8,7 @@ require opensbi-payloads.inc
>
>  inherit deploy
>
> -SRCREV =3D "a32a91069119e7a5aa31e6bc51d5e00860be3d80"
> +SRCREV =3D "e7fa66c2160ec139de1853a00f669c09320a9256"
>  SRC_URI =3D "git://
> github.com/riscv/opensbi.git;branch=3Dmaster;protocol=3Dhttps"
>
>  TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228967):
> https://lists.openembedded.org/g/openembedded-core/message/228967
> Mute This Topic: https://lists.openembedded.org/mt/117131548/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000755a160647cfd545
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 7, =
2026 at 1:33=E2=80=AFAM Thomas Perrot via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;thomas.perrot=3D<a href=3D"mailto:b=
ootlin.com@lists.openembedded.org">bootlin.com@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.com" target=3D"_b=
lank">thomas.perrot@bootlin.com</a>&gt;<br>
<br>
This release has:<br>
- Safe and reverse list iteration<br>
- Stack protector support<br>
- Allocate heap housekeeping nodes dynamically<br>
- IPI device ratings<br>
- Andes QiLai SoC support<br>
- SpacemiT K1 SoC support<br>
- ESWIN Computing EIC7700 SoC support<br>
- Moved Ariane and Openpiton to generic platform<br>
- SiFive CLINT v2 support<br>
- Simple FDT based cache library<br>
- SiFive PL2 cache controller driver<br>
- SiFive Extensible Cache (EC) driver<br>
- SiFive TMC0 based HSM driver<br>
- SiFive SMC0 based system suspend driver<br>
- MPXY RPMI mailbox driver for voltage service group<br>
- MPXY RPMI mailbox driver for device power service group<br>
- MPXY RPMI mailbox driver for performance service group<br>
- HART protection abstraction<br>
<br>
Overall, this release has various domain related improvements and<br>
also adds multiple platform support.<br>
<br>
Also switch Qemu -cpu parameter to rv64 because rva23s64 and rva22s64<br>
profiles lack PMP entries, causing hart isolation configuration to fail [1]=
.<br>
<br>
[1] <a href=3D"https://lists.nongnu.org/archive/html/qemu-riscv/2026-01/msg=
00048.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/a=
rchive/html/qemu-riscv/2026-01/msg00048.html</a><br>
<br>
Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.co=
m" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
<br>
---<br>
=C2=A0 =C2=A0 Changes in v2:<br>
=C2=A0 =C2=A0 - Enable PMP support on Qemu with rva23<br>
=C2=A0 =C2=A0 - Include tag=3Dv${PV} in the SRC_URI<br>
=C2=A0 =C2=A0 - Link to v1: <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/message/228935" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/message/228935</a><br>
---<br>
=C2=A0meta/conf/machine/include/riscv/qemuriscv.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-bsp/opensbi/{<a href=3D"http://opensbi_1.7.bb" rel=3D"no=
referrer" target=3D"_blank">opensbi_1.7.bb</a> =3D&gt; <a href=3D"http://op=
ensbi_1.8.bb" rel=3D"noreferrer" target=3D"_blank">opensbi_1.8.bb</a>} | 2 =
+-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-bsp/opensbi/{<a href=3D"http://opensbi_1.7.bb" re=
l=3D"noreferrer" target=3D"_blank">opensbi_1.7.bb</a> =3D&gt; <a href=3D"ht=
tp://opensbi_1.8.bb" rel=3D"noreferrer" target=3D"_blank">opensbi_1.8.bb</a=
>} (97%)<br>
<br>
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/mach=
ine/include/riscv/qemuriscv.inc<br>
index b755d32c9d1a..45fcf36e62d9 100644<br>
--- a/meta/conf/machine/include/riscv/qemuriscv.inc<br>
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc<br>
@@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D &quot;0x80200000&quot;<br>
=C2=A0# qemuboot options<br>
=C2=A0QB_SMP ?=3D &quot;-smp 4&quot;<br>
=C2=A0QB_KERNEL_CMDLINE_APPEND =3D &quot;earlycon=3Dsbi&quot;<br>
-QB_CPU:riscv64 ?=3D &quot;-cpu rva23s64&quot;<br>
+QB_CPU:riscv64 ?=3D &quot;-cpu rv64&quot;<br></blockquote><div><br></div><=
div>Do we still need this after enabling PMP</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
=C2=A0QB_MACHINE =3D &quot;-machine virt&quot;<br>
=C2=A0QB_DEFAULT_BIOS =3D &quot;fw_jump.elf&quot;<br>
=C2=A0QB_TAP_OPT =3D &quot;-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno=
,downscript=3Dno&quot;<br>
diff --git a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.7.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.7.bb</a> b/meta/recipes-bsp/ope=
nsbi/<a href=3D"http://opensbi_1.8.bb" rel=3D"noreferrer" target=3D"_blank"=
>opensbi_1.8.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.7.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.7.bb</a><br>
rename to meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.8.bb" rel=3D=
"noreferrer" target=3D"_blank">opensbi_1.8.bb</a><br>
index a460062e9398..f2d3e9f20082 100644<br>
--- a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">opensbi_1.7.bb</a><br>
+++ b/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.8.bb" rel=3D"nor=
eferrer" target=3D"_blank">opensbi_1.8.bb</a><br>
@@ -8,7 +8,7 @@ require opensbi-payloads.inc<br>
<br>
=C2=A0inherit deploy<br>
<br>
-SRCREV =3D &quot;a32a91069119e7a5aa31e6bc51d5e00860be3d80&quot;<br>
+SRCREV =3D &quot;e7fa66c2160ec139de1853a00f669c09320a9256&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/riscv/opensbi.gi=
t;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/riscv/opensbi.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
<br>
=C2=A0TARGET_DBGSRC_DIR =3D &quot;/share/opensbi/*/generic/firmware/&quot;<=
br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228967): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228967" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228967</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117131548/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117131548/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000755a160647cfd545--

