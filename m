Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C37D74EDA
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 14:25:59 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68663.1769178358244741315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 06:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vi9AFn/1;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43590777e22so1370583f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 06:25:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769178356; cv=none;
        d=google.com; s=arc-20240605;
        b=S+zsvGjsRzulvxUxYeUgS7op7rg2o3GjaMyKZpM/mihOoDPYjluyrx8SO9HABC8/ed
         eHAMSUSAxPKbcz0b9PL09hrtSmUCskDbrrcAwPYtOWqdlGW2oXSOeEQ0+bL4H2v6TPrR
         bAC/TrNbRbzHoODtCVpOWa1tE8H1SqiXe7D7iTKXUXXK684sHP/xRX02jrph0n51AufE
         7MoH0C3mr6DCHPoAXuigyacOtl/jVnZxp/4Ou0trVvaID5uhAfq1kMTr/2b7gBVAkXLq
         +AI8c2/kRin+xvo8DsiXP6go+4h5wLrmoCxm+zklLnlKSLNSMX8HQ0CU2nhcjR22IbKE
         qknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I61sCNWnLOvIE7nAP8CrZqfb+zHy5PzIizi2O7R5JLA=;
        fh=mkJtNC7i9KyqGncDtPimScwQuINSCJBuP6aqpdxZuhY=;
        b=NaTzurdV2sER1HKVrBg7lX7UVUtmL9iBGWao4u+FizRTm50+OlXKksPScyQuy827NN
         1eNT8Swf8t1HrgJnRaBOOVFnbLeNNz437tvIyMM4QmmhEMHCfjWfqYng3+iLLu8a04W4
         WSqtXu8lS7APsjvUf90jTaxDTG8XkBYaAtiIAgnmfzdXMLWcVn1kORwJgOlSoFmdX3mO
         GfH8cbM5DfM/TM0VljNf1XtNs0Tcxp50M0fhLFi19qnxz91WJJf5FJyr9I78nzfxty/g
         QTmhBD/dI+CJFVWDTUgxCM2xtW76vJs6UuqliL7AYUBLvi5yAvSmAHbXUPYnFIe+x28Y
         jfDQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769178356; x=1769783156; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I61sCNWnLOvIE7nAP8CrZqfb+zHy5PzIizi2O7R5JLA=;
        b=vi9AFn/1xeHkNcd8bNo8n1gm7lefAQx/eqso1kzLen+jffTG6zPOffqLlaJz12g7o+
         xZCJk0g47DHRPMrE91SdFQDvuJuxOtyxEuKpB3RHUytQTLZrnoEOvcT1Na+dKEpesqYB
         UjSIL3sXKqy6wfhdj6bDevQwBlijJi8N1egJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769178356; x=1769783156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I61sCNWnLOvIE7nAP8CrZqfb+zHy5PzIizi2O7R5JLA=;
        b=S43CSEvxOm1nnkF863HMFI1qMT3ajVmwz9wo5q0kqYtNIN0rR0mN0zGvODkoRudHvS
         zblMiHo9qjHEz4abiGwPtINIHbRaEmi0LLfZ4Wc3AtVKut60HNzwXXja5aC0isWgHfIV
         406I4Uo1HzQ1TCNZ0vCCafl8JWrL45bxuGvkcYEh3brxa86d5NURE5YsLxonqWqSgPp8
         MsgNZMh6aLXCis3RcXBmAtCoJR3g08AlImaCQM++4vd6ui6caBNie4MEK2Db3Za8RzpG
         QovBOiLMx1e2MlOClIrUx+b4UiNBgJaZ+BQrZjne8HLCU0ytWZjh0gbcEFIHMBdYBLHM
         OpCQ==
X-Gm-Message-State: AOJu0YwHvuASKG93mh20oXYTIPmU14LkGNuSAeNWv06QHju2CLDeOzpe
	Kq3BC6krksuQeaQYZSWE6fj/9uozRqQg7h9cdCs/WxK6xiGvPRGe4BIIvTb9dFaOxsW3bnobUDw
	nzPV1uPQyWFZzkvn2iEg3IH6fGEAEYhbOiBHODEyldJv0WwGKGfJS
X-Gm-Gg: AZuq6aJ63rqgCQgkiGksSZplroF+H45jU7TYVxglwF2fwbSWqTMDTrSMCW3XkWyCy0N
	NGbWGRBOs1zozHEF0BIJ6oiUDz+r5k64gbbhdTHUYVXAURBbqtm2+pi4FH+/Sbgi7ZoI8A5CdR6
	I0vWwGbjNB5cNhjZ7hG/BA4O/iAOfBlkM5O2kuUZ0PT0sHIZG8tt56lZLaP3fcADRh5Wru8e1uB
	sdIuFpwTJtjUjcgZq4HTFjxDexekW3S/Ezfxv2YmGmYSjMA9muTX5KHc/Q6GRKeuKio7+6OAiGN
	/Ll+Rq7T+9E1fmQp16kL+hsz0RK7FqLmlg36j58=
X-Received: by 2002:a05:6000:2dc4:b0:429:b751:7935 with SMTP id
 ffacd0b85a97d-435b16280damr5673772f8f.56.1769178356249; Fri, 23 Jan 2026
 06:25:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769175900.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1769175900.git.yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 23 Jan 2026 15:25:29 +0100
X-Gm-Features: AZwV_QjFNlTYq4PrJZsHUvDWxp8N3XWRGRalJm2bCA2hwGiG0lt-iAXW_RwPzdQ
Message-ID: <CAMSfU+779ANtEvXg9Z4M8a4wZu_Z4-+a1RJvE__OvfR92Oq=ZQ@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 00/15] Pull request (cover letter only)
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Content-Type: multipart/alternative; boundary="00000000000078786c06490eef08"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 14:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229894

--00000000000078786c06490eef08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 23 janv. 2026 =C3=A0 14:50, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> Those are the patches from the last patch review:
>
> https://lore.kernel.org/openembedded-core/cover.1768906687.git.yoann.cong=
al@smile.fr/
>
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3112
> The "Send QA Email" step failed, that is a known AB-INT bug:
> #15696 =E2=80=93 AB_INT: resulttool: File exists
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15696
>
> The following changes since commit
> dd10706cfafb5574b7cf316fca2300d166ef71b0:
>
>   build-appliance-image: Update to whinlatter head revisions (2026-01-12
> 10:58:53 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/whinlatter-next
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wh=
inlatter-next
>
> for you to fetch changes up to e7891f39ae90d1c23bfcb59af0064591513a671d:
>
>   libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-19 23:29:16 +0100)
>
> ----------------------------------------------------------------
>
> Alexander Kanavin (3):
>   libpng: upgrade 1.6.52 -> 1.6.53
>

I forgot to add the cherry-pick reference to this commit. I'll add it now.


>   ffmpeg: add a (possible) build race fix
>   ffmpeg: fix a build race, hopefully for real this time
>
> Paul Barker (1):
>   selftest: devtool: Set PATH when running pseudo
>
> Peter Marko (9):
>   util-linux: patch CVE-2025-14104
>   gnupg: patch CVE-2025-68973
>   curl: patch CVE-2025-13034
>   curl: patch CVE-2025-14017
>   curl: patch CVE-2025-14524
>   curl: patch CVE-2025-14819
>   curl: patch CVE-2025-15079
>   curl: patch CVE-2025-15224
>   libarchive: upgrade 3.8.4 -> 3.8.5
>
> Richard Purdie (2):
>   pseudo: Update to pull in openat2 and efault return code changes
>   pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'
>
>  meta/lib/oeqa/selftest/cases/devtool.py       |   5 +-
>  meta/recipes-core/util-linux/util-linux.inc   |   2 +
>  .../util-linux/CVE-2025-14104-01.patch        |  33 +++++
>  .../util-linux/CVE-2025-14104-02.patch        |  28 +++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
>  ...ibarchive_3.8.4.bb =3D> libarchive_3.8.5.bb} |   2 +-
>  ...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++
>  ...s-Fix-double-build-by-disabling-.d-f.patch |  78 ++++++++++++
>  ...ak-ensure-target-directories-are-cre.patch |  43 +++++++
>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   6 +-
>  .../{libpng_1.6.52.bb =3D> libpng_1.6.53.bb}    |   2 +-
>  .../curl/curl/CVE-2025-13034.patch            |  37 ++++++
>  .../curl/curl/CVE-2025-14017.patch            | 116 ++++++++++++++++++
>  .../curl/curl/CVE-2025-14524.patch            |  40 ++++++
>  .../curl/curl/CVE-2025-14819.patch            |  73 +++++++++++
>  .../curl/curl/CVE-2025-15079.patch            |  32 +++++
>  .../curl/curl/CVE-2025-15224.patch            |  31 +++++
>  meta/recipes-support/curl/curl_8.17.0.bb      |   6 +
>  .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ++++++++++++++++
>  meta/recipes-support/gnupg/gnupg_2.5.11.bb    |   1 +
>  20 files changed, 745 insertions(+), 6 deletions(-)
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
>  rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb =3D>
> libarchive_3.8.5.bb} (96%)
>  create mode 100644
> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-=
pattern-rules-for-comp.patch
>  create mode 100644
> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-b=
uild-by-disabling-.d-f.patch
>  create mode 100644
> meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-targ=
et-directories-are-cre.patch
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.52.bb =3D>
> libpng_1.6.53.bb} (97%)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-13034.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch
>  create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
>
>

--=20
Yoann Congal
Smile ECS

--00000000000078786c06490eef08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 23=
 janv. 2026 =C3=A0=C2=A014:50, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Those are the patches from =
the last patch review:<br>
<a href=3D"https://lore.kernel.org/openembedded-core/cover.1768906687.git.y=
oann.congal@smile.fr/" rel=3D"noreferrer" target=3D"_blank">https://lore.ke=
rnel.org/openembedded-core/cover.1768906687.git.yoann.congal@smile.fr/</a><=
br>
<br>
Passed a-full on autobuilder:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/bui=
lds/3112" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopro=
ject.org/valkyrie/?#/builders/29/builds/3112</a><br>
The &quot;Send QA Email&quot; step failed, that is a known AB-INT bug:<br>
#15696 =E2=80=93 AB_INT: resulttool: File exists<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15696" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D15696</a><br>
<br>
The following changes since commit dd10706cfafb5574b7cf316fca2300d166ef71b0=
:<br>
<br>
=C2=A0 build-appliance-image: Update to whinlatter head revisions (2026-01-=
12 10:58:53 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/whinlatter-next<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/whinlatter-next" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/whinlatter-=
next</a><br>
<br>
for you to fetch changes up to e7891f39ae90d1c23bfcb59af0064591513a671d:<br=
>
<br>
=C2=A0 libarchive: upgrade 3.8.4 -&gt; 3.8.5 (2026-01-19 23:29:16 +0100)<br=
>
<br>
----------------------------------------------------------------<br>
<br>
Alexander Kanavin (3):<br>
=C2=A0 libpng: upgrade 1.6.52 -&gt; 1.6.53<br></blockquote><div><br></div><=
div>I forgot to add the cherry-pick reference to this commit. I&#39;ll add =
it now.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0 ffmpeg: add a (possible) build race fix<br>
=C2=A0 ffmpeg: fix a build race, hopefully for real this time<br>
<br>
Paul Barker (1):<br>
=C2=A0 selftest: devtool: Set PATH when running pseudo<br>
<br>
Peter Marko (9):<br>
=C2=A0 util-linux: patch CVE-2025-14104<br>
=C2=A0 gnupg: patch CVE-2025-68973<br>
=C2=A0 curl: patch CVE-2025-13034<br>
=C2=A0 curl: patch CVE-2025-14017<br>
=C2=A0 curl: patch CVE-2025-14524<br>
=C2=A0 curl: patch CVE-2025-14819<br>
=C2=A0 curl: patch CVE-2025-15079<br>
=C2=A0 curl: patch CVE-2025-15224<br>
=C2=A0 libarchive: upgrade 3.8.4 -&gt; 3.8.5<br>
<br>
Richard Purdie (2):<br>
=C2=A0 pseudo: Update to pull in openat2 and efault return code changes<br>
=C2=A0 pseudo: Update to pull in &#39;makewrappers: Fix EFAULT implementati=
on&#39;<br>
<br>
=C2=A0meta/lib/oeqa/selftest/cases/devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +-<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../util-linux/CVE-2025-14104-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 33 +++++<br>
=C2=A0.../util-linux/CVE-2025-14104-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 28 +++++<br>
=C2=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
2 +-<br>
=C2=A0...<a href=3D"http://ibarchive_3.8.4.bb" rel=3D"noreferrer" target=3D=
"_blank">ibarchive_3.8.4.bb</a> =3D&gt; <a href=3D"http://libarchive_3.8.5.=
bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.5.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++<=
br>
=C2=A0...s-Fix-double-build-by-disabling-.d-f.patch |=C2=A0 78 ++++++++++++=
<br>
=C2=A0...ak-ensure-target-directories-are-cre.patch |=C2=A0 43 +++++++<br>
=C2=A0meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_8.0.bb</a>=C2=A0 |=C2=A0 =C2=A06 +=
-<br>
=C2=A0.../{<a href=3D"http://libpng_1.6.52.bb" rel=3D"noreferrer" target=3D=
"_blank">libpng_1.6.52.bb</a> =3D&gt; <a href=3D"http://libpng_1.6.53.bb" r=
el=3D"noreferrer" target=3D"_blank">libpng_1.6.53.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../curl/curl/CVE-2025-13034.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 37 ++++++<br>
=C2=A0.../curl/curl/CVE-2025-14017.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 116 ++++++++++++++++++<br>
=C2=A0.../curl/curl/CVE-2025-14524.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 40 ++++++<br>
=C2=A0.../curl/curl/CVE-2025-14819.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 73 +++++++++++<br>
=C2=A0.../curl/curl/CVE-2025-15079.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 32 +++++<br>
=C2=A0.../curl/curl/CVE-2025-15224.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 31 +++++<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_8.17.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_8.17.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A06 +<br>
=C2=A0.../gnupg/gnupg/CVE-2025-68973.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 108 ++++++++++++++++<br>
=C2=A0meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.11.bb" rel=3D"=
noreferrer" target=3D"_blank">gnupg_2.5.11.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A020 files changed, 745 insertions(+), 6 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-1=
4104-01.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-1=
4104-02.patch<br>
=C2=A0rename meta/recipes-extended/libarchive/{<a href=3D"http://libarchive=
_3.8.4.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.4.bb</a> =3D=
&gt; <a href=3D"http://libarchive_3.8.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">libarchive_3.8.5.bb</a>} (96%)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild=
-commonmak-Consolidate-pattern-rules-for-comp.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools=
-resources-Fix-double-build-by-disabling-.d-f.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild=
-common.mak-ensure-target-directories-are-cre.patch<br>
=C2=A0rename meta/recipes-multimedia/libpng/{<a href=3D"http://libpng_1.6.5=
2.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.52.bb</a> =3D&gt; <a =
href=3D"http://libpng_1.6.53.bb" rel=3D"noreferrer" target=3D"_blank">libpn=
g_1.6.53.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-13034.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.pa=
tch<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000078786c06490eef08--

