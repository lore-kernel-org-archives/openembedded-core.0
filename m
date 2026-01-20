Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A1DD2628E
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:04:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14273.1768935846072867919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 11:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tbIbBf+B;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so41379755e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:04:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768935844; cv=none;
        d=google.com; s=arc-20240605;
        b=h21zA+Ft0BbA6F+N/CqcAQLoaBlVlbLDCCW+urfMm9Bgv21gcpHQ6Ybmf0w7QoVgS/
         8EEvikoVQcX0TvHR4b1EUm6sUEHUiAVKtEc78xCm0ukuA2Q4wEUswzizfx4+o4y6xbOy
         G8KUmVJhyQa8ukp8enFt68vaVqDMbwwFQNJNtNwp0mPLRSfbb40zl8CmO5C2POftxjit
         /mDDNwWG/Zt86aOc/ThwUu11DQxVSLcg0mPN31prSX5gXXo1L3Z2a/+NH9JxGkLmJB0l
         wgyEF/FUMWenGw4EuwD41QkkB6BTXXo3eHMCwOMWI56WGo6rE9s5YJ6iHzKsFg3Qw2iP
         8ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+MPoXT0XnlKE6Qo2MoKw7lqLdOGK7gBHOUYSSRTKib0=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=UNcDrXM2j7zpw0NMzY/Zx0PgT4q/6Y48Hk2gUfx/15rXv6kYlJfVQSCWdYoV2mEIqF
         ZvpCQi33PzmsvYxgr2XPbDBDI9z2lJHNl5UThA4eKvV7V8Eg3X+xpOKHBPEwoxjV0L/G
         8MG/SY16/bfdNSW5vIvOVyoyvfBXYuucb8YYe2AAQJKz5EQVqafgwv84yrmQlQ1ZGErG
         CtkI1i30z9P5YOzTQL1s0oefR6XfshWahJ8FYyoBBH6SilhHc7kSOp/fSZW1B+/YiMJr
         TlSZ53GvLwrPRMs5GeVyxS0E4dcQkfs37OnuXj1dhPMypAiY39cnDmwLIpwiDhzzZL2/
         qc0A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768935844; x=1769540644; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+MPoXT0XnlKE6Qo2MoKw7lqLdOGK7gBHOUYSSRTKib0=;
        b=tbIbBf+BPkgBFqZIK1T6aRs0QwllWXFdp8KRqLYnl/1X2si5J/7oYiEQ7xglkKHPE9
         5W8w4r7COh18BRoWuJuMYK2acFPvptEgJl/Kc7Jh9xrW1dxcvIf2OyVNRzYzExr1Roja
         fKIw2cMVtWnpYM+svpwxyX0NoXq+MT/w27wp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935844; x=1769540644;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MPoXT0XnlKE6Qo2MoKw7lqLdOGK7gBHOUYSSRTKib0=;
        b=ezCBcaXhXQNTKR+YnnSzUGsoJrCmvXfsSfkxu97drfGy8Txc0EMuRdpCnANUpDUWpv
         Y/jl8FaZaDio2ij25LBSHXveDqJpYVg9lJb5Na6+lmTo5NDOlDTmJGm69UKG1X9GCIcG
         aTzqloMi83CvI30/6QiwIsxqly8hO9PZ1CMQIWkwWarA/LB+95NOhjt+VjFukcJM7p2A
         5P9gHxsGbyf56kz86PYApgMBhJON1klJ9sTB0Efu8tZAnoUIo/AB4nnCZKnj2DMqaPTh
         DKX4p0AQNKeUiAR+8GHFO8FC8jDH88CSKg5gWDk3CmIhoV2US7c6+lVock2WCJWQSuR3
         9nxQ==
X-Gm-Message-State: AOJu0YyGX8S+PTNASlQe3GK5HikPxmFW5AcxcUg7pwZ5zM6Wo3TdUmkE
	wshIwoiBFmMBGuxyYwe5dzRzEDgZTb0ki/A/+KlxFvwMaglK9KDTq2HSUUlnQH17ixgt++Ce18y
	SHfNFdCL+ECi4YrcFAIS9VbgFjLNGd7j7g2tt1Wk9oeWxloGUE/u0AAI=
X-Gm-Gg: AY/fxX4UPH3+0FC+ivh8Nl8hfW5INK3XADVIBxVWrYYFZYXnmbJi3P0Yy2G95wLQ6M2
	Dd2B9QVucZpeH5GN3Ty26LJIyOqK2ZzjVU2Puzu2jajNOMIW26cz2PCH0YYnkU09Qd5TrHPk7Ek
	j7S2cMhNuR8DwALs8IQfkg1Gf52qW7gJXZwjSSgydhw2YvOuVa6A88qbW/VpYPkkzDiE9D0emPn
	u/IkZTMVi5BCOFLrQhdqQ/Jz2ML//LFXczExnPgwfupx2fm3kaiWk0AFDKvemkbeyDHR5Lim1+d
	ddoecGcbXyc7CYktf/nqhRPVi6I6kw==
X-Received: by 2002:a05:600c:8b55:b0:47d:403e:90c9 with SMTP id
 5b1f17b1804b1-4801e2fe345mr191358185e9.11.1768935843676; Tue, 20 Jan 2026
 11:04:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1768914702.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 20 Jan 2026 20:03:36 +0100
X-Gm-Features: AZwV_QibkaUeFVY9WpzL2zztW0JETAyjxjBD8ahvKrcFPVRenkdxPqgaIPatGck
Message-ID: <CAMSfU+6YFbkNxNACu1OZNoURRbN2=tNdgm5Z3G7-GD6+4seP9g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/26] Patch review
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000097d9320648d6781e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 19:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229786

--00000000000097d9320648d6781e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 20 janv. 2026 =C3=A0 14:38, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> Please review this set of changes for kirkstone and have comments back by
> end of day Thursday, January 22.
>
> This is the last patch review request for kirkstone 4.0.33 before it is
> built on monday: In addition to normal CVE fixes:
> * pseudo upgrade to fix 16117 =E2=80=93 AB-INT: do_package: Error executi=
ng a
> python function in exec_func_python() autogenerated
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16117
> * A oeqa fix for 16137 =E2=80=93 AB-INT: core-image-sato.bb:do_testsdk fa=
ils on
> ftpmirror.gnu.org returning 502 Bad Gateway
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16137
>
> Passed (with rebuild) a-full on autobuilder:
> * https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3090
>   * via poky-contrib stable/kirkstone-nut :
>     * OE-core tip is at
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dstable/kirkstone-nu=
t&id=3D08f446ecb3d3b78daaf8e5b90dec1bff6cb1d5d8
>   * meta-mingw failed
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/7/builds/3115
>     * Bug is: #16145 =E2=80=93 [kirkstone] AB-INT: mingw-sdktest fail wit=
h "wine
> %CC" returning 1
>   * then, with the same commits, meta-mingw was successfully rebuilt
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/7/builds/3119


I have now re-run a successful a-full test
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3097
with the v2 of "python3-urllib3: patch CVE-2025-66418"
https://lists.openembedded.org/g/openembedded-core/topic/kirkstone_patch_v2=
/117362843
The tip of the stable/kirkstone-nut is now at
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3D1ce772b2fd97d2e8364a602fdd313355f2df967e


> The following changes since commit
> 0057fc49725db8637656fac10631d8f89799bad3:
>
>   go: Fix CVE-2025-61729 (2025-12-29 08:48:27 -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/kirkstone-nut
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/ki=
rkstone-nut
>
> for you to fetch changes up to 20ff1a4ac744855b54952d7fad7424696500a230:
>
>   oeqa: Use 2.14 release of cpio instead of 2.13 (2026-01-19 23:44:02
> +0100)
>
> ----------------------------------------------------------------
>
> Hitendra Prajapati (1):
>   python3: fix CVE-2025-13836
>
> Khem Raj (1):
>   oeqa: Use 2.14 release of cpio instead of 2.13
>
> Paul Barker (1):
>   pseudo: Add hard sstate dependencies for pseudo-native
>
> Peter Marko (17):
>   util-linux: patch CVE-2025-14104
>   glib-2.0: patch CVE-2025-13601
>   glib-2.0: patch CVE-2025-14087
>   glib-2.0: patch CVE-2025-14512
>   qemu: ignore CVE-2025-54566 and CVE-2025-54567
>   cups: patch CVE-2025-58436
>   cups: patch CVE-2025-61915
>   cups: allow unknown directives in conf files
>   dropbear: patch CVE-2019-6111
>   python3-urllib3: patch CVE-2025-66418
>   libpcap: patch CVE-2025-11961
>   libpcap: patch CVE-2025-11964
>   libarchive: fix CVE-2025-60753 regression
>   curl: patch CVE-2025-14017
>   curl: patch CVE-2025-15079
>   curl: patch CVE-2025-15224
>   gnupg: patch CVE-2025-68973
>
> Richard Purdie (4):
>   pseudo: Upgrade to version 1.9.1
>   pseudo: Update to pull in memleak fix
>   pseudo: Update to pull in openat2 and efault return code changes
>   pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'
>
> Robert Yang (1):
>   pseudo: 1.9.0 -> 1.9.2
>
> Vijay Anusuri (1):
>   binutils: Fix CVE-2025-1181
>
>  meta/lib/oeqa/runtime/cases/buildcpio.py      |   2 +-
>  meta/lib/oeqa/sdk/cases/buildcpio.py          |   4 +-
>  meta/lib/oeqa/selftest/cases/meta_ide.py      |   2 +-
>  .../libpcap/libpcap/CVE-2025-11961-01.patch   |  38 ++
>  .../libpcap/libpcap/CVE-2025-11961-02.patch   | 433 ++++++++++++
>  .../libpcap/libpcap/CVE-2025-11964.patch      |  33 +
>  .../libpcap/libpcap_1.10.1.bb                 |   3 +
>  meta/recipes-core/dropbear/dropbear.inc       |   1 +
>  .../dropbear/dropbear/CVE-2019-6111.patch     | 157 +++++
>  .../glib-2.0/glib-2.0/CVE-2025-13601-01.patch | 125 ++++
>  .../glib-2.0/glib-2.0/CVE-2025-13601-02.patch | 128 ++++
>  .../glib-2.0/glib-2.0/CVE-2025-14087-01.patch |  69 ++
>  .../glib-2.0/glib-2.0/CVE-2025-14087-02.patch | 240 +++++++
>  .../glib-2.0/glib-2.0/CVE-2025-14087-03.patch | 150 +++++
>  .../glib-2.0/glib-2.0/CVE-2025-14512.patch    |  70 ++
>  meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   6 +
>  meta/recipes-core/util-linux/util-linux.inc   |   2 +
>  .../util-linux/CVE-2025-14104-01.patch        |  33 +
>  .../util-linux/CVE-2025-14104-02.patch        |  28 +
>  .../binutils/binutils-2.38.inc                |   2 +
>  .../binutils/binutils/CVE-2025-1181-pre.patch | 149 +++++
>  .../binutils/binutils/CVE-2025-1181.patch     | 342 ++++++++++
>  .../0001-configure-Prune-PIE-flags.patch      |  44 --
>  .../pseudo/files/glibc238.patch               |  65 --
>  .../pseudo/files/older-glibc-symbols.patch    |   4 +-
>  meta/recipes-devtools/pseudo/pseudo.inc       |   7 +
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   6 +-
>  .../python3-urllib3/CVE-2025-66418.patch      |  70 ++
>  .../python/python3-urllib3_1.26.20.bb         |   1 +
>  .../python/python3/CVE-2025-13836.patch       | 163 +++++
>  .../python/python3_3.10.19.bb                 |   1 +
>  meta/recipes-devtools/qemu/qemu.inc           |   3 +
>  meta/recipes-extended/cups/cups.inc           |   3 +
>  ...pping-scheduler-on-unknown-directive.patch |  43 ++
>  .../cups/cups/CVE-2025-58436.patch            | 630 ++++++++++++++++++
>  .../cups/cups/CVE-2025-61915.patch            | 487 ++++++++++++++
>  ...25-60753.patch =3D> CVE-2025-60753-01.patch} |   0
>  .../libarchive/CVE-2025-60753-02.patch        |  46 ++
>  .../libarchive/libarchive_3.6.2.bb            |   3 +-
>  .../curl/curl/CVE-2025-14017.patch            | 115 ++++
>  .../curl/curl/CVE-2025-15079.patch            |  32 +
>  .../curl/curl/CVE-2025-15224.patch            |  31 +
>  meta/recipes-support/curl/curl_7.82.0.bb      |   3 +
>  .../gnupg/gnupg/CVE-2025-68973.patch          | 108 +++
>  meta/recipes-support/gnupg/gnupg_2.3.7.bb     |   1 +
>  45 files changed, 3763 insertions(+), 120 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
>  create mode 100644
> meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
>  create mode 100644
> meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111.pat=
ch
>  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch
>  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-02.patch
>  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-01.patch
>  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-02.patch
>  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-03.patch
>  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch
>  delete mode 100644
> meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch
>  delete mode 100644 meta/recipes-devtools/pseudo/files/glibc238.patch
>  create mode 100644
> meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
>  create mode 100644
> meta/recipes-devtools/python/python3/CVE-2025-13836.patch
>  create mode 100644
> meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unk=
nown-directive.patch
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58436.patch
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-61915.patch
>  rename meta/recipes-extended/libarchive/libarchive/{CVE-2025-60753.patch
> =3D> CVE-2025-60753-01.patch} (100%)
>  create mode 100644
> meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch
>  create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
>
>

--=20
Yoann Congal
Smile ECS

--00000000000097d9320648d6781e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 20=
 janv. 2026 =C3=A0=C2=A014:38, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Please review this set of c=
hanges for kirkstone and have comments back by<br>
end of day Thursday, January 22.<br>
<br>
This is the last patch review request for kirkstone 4.0.33 before it is<br>
built on monday: In addition to normal CVE fixes:<br>
* pseudo upgrade to fix 16117 =E2=80=93 AB-INT: do_package: Error executing=
 a python function in exec_func_python() autogenerated<br>
=C2=A0 <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16117=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D16117</a><br>
* A oeqa fix for 16137 =E2=80=93 AB-INT: core-image-sato.bb:do_testsdk fail=
s on <a href=3D"http://ftpmirror.gnu.org" rel=3D"noreferrer" target=3D"_bla=
nk">ftpmirror.gnu.org</a> returning 502 Bad Gateway<br>
=C2=A0 <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16137=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D16137</a><br>
<br>
Passed (with rebuild) a-full on autobuilder:<br>
* <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/bu=
ilds/3090" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopr=
oject.org/valkyrie/#/builders/29/builds/3090</a><br>
=C2=A0 * via poky-contrib stable/kirkstone-nut :<br>
=C2=A0 =C2=A0 * OE-core tip is at <a href=3D"https://git.yoctoproject.org/p=
oky-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D08f446ecb3d3b78daaf8e=
5b90dec1bff6cb1d5d8" rel=3D"noreferrer" target=3D"_blank">https://git.yocto=
project.org/poky-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D08f446ec=
b3d3b78daaf8e5b90dec1bff6cb1d5d8</a><br>
=C2=A0 * meta-mingw failed <a href=3D"https://autobuilder.yoctoproject.org/=
valkyrie/?#/builders/7/builds/3115" rel=3D"noreferrer" target=3D"_blank">ht=
tps://autobuilder.yoctoproject.org/valkyrie/?#/builders/7/builds/3115</a><b=
r>
=C2=A0 =C2=A0 * Bug is: #16145 =E2=80=93 [kirkstone] AB-INT: mingw-sdktest =
fail with &quot;wine %CC&quot; returning 1<br>
=C2=A0 * then, with the same commits, meta-mingw was successfully rebuilt <=
a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/7/build=
s/3119" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/?#/builders/7/builds/3119</a></blockquote><div><br></div><d=
iv>I have now re-run a successful a-full test=C2=A0<a href=3D"https://autob=
uilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3097">https://autobu=
ilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3097</a></div><div>wi=
th the v2 of &quot;python3-urllib3: patch CVE-2025-66418&quot;=C2=A0<a href=
=3D"https://lists.openembedded.org/g/openembedded-core/topic/kirkstone_patc=
h_v2/117362843">https://lists.openembedded.org/g/openembedded-core/topic/ki=
rkstone_patch_v2/117362843</a></div><div>The tip of the stable/kirkstone-nu=
t is now at=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core-=
contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D1ce772b2fd97d2e8364a602fd=
d313355f2df967e">https://git.openembedded.org/openembedded-core-contrib/com=
mit/?h=3Dstable/kirkstone-nut&amp;id=3D1ce772b2fd97d2e8364a602fdd313355f2df=
967e</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
The following changes since commit 0057fc49725db8637656fac10631d8f89799bad3=
:<br>
<br>
=C2=A0 go: Fix CVE-2025-61729 (2025-12-29 08:48:27 -0800)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/kirkstone-nut<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/kirkstone-nut" rel=3D"noreferrer" target=3D"_blank">https://g=
it.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/kirkstone-nut=
</a><br>
<br>
for you to fetch changes up to 20ff1a4ac744855b54952d7fad7424696500a230:<br=
>
<br>
=C2=A0 oeqa: Use 2.14 release of cpio instead of 2.13 (2026-01-19 23:44:02 =
+0100)<br>
<br>
----------------------------------------------------------------<br>
<br>
Hitendra Prajapati (1):<br>
=C2=A0 python3: fix CVE-2025-13836<br>
<br>
Khem Raj (1):<br>
=C2=A0 oeqa: Use 2.14 release of cpio instead of 2.13<br>
<br>
Paul Barker (1):<br>
=C2=A0 pseudo: Add hard sstate dependencies for pseudo-native<br>
<br>
Peter Marko (17):<br>
=C2=A0 util-linux: patch CVE-2025-14104<br>
=C2=A0 glib-2.0: patch CVE-2025-13601<br>
=C2=A0 glib-2.0: patch CVE-2025-14087<br>
=C2=A0 glib-2.0: patch CVE-2025-14512<br>
=C2=A0 qemu: ignore CVE-2025-54566 and CVE-2025-54567<br>
=C2=A0 cups: patch CVE-2025-58436<br>
=C2=A0 cups: patch CVE-2025-61915<br>
=C2=A0 cups: allow unknown directives in conf files<br>
=C2=A0 dropbear: patch CVE-2019-6111<br>
=C2=A0 python3-urllib3: patch CVE-2025-66418<br>
=C2=A0 libpcap: patch CVE-2025-11961<br>
=C2=A0 libpcap: patch CVE-2025-11964<br>
=C2=A0 libarchive: fix CVE-2025-60753 regression<br>
=C2=A0 curl: patch CVE-2025-14017<br>
=C2=A0 curl: patch CVE-2025-15079<br>
=C2=A0 curl: patch CVE-2025-15224<br>
=C2=A0 gnupg: patch CVE-2025-68973<br>
<br>
Richard Purdie (4):<br>
=C2=A0 pseudo: Upgrade to version 1.9.1<br>
=C2=A0 pseudo: Update to pull in memleak fix<br>
=C2=A0 pseudo: Update to pull in openat2 and efault return code changes<br>
=C2=A0 pseudo: Update to pull in &#39;makewrappers: Fix EFAULT implementati=
on&#39;<br>
<br>
Robert Yang (1):<br>
=C2=A0 pseudo: 1.9.0 -&gt; 1.9.2<br>
<br>
Vijay Anusuri (1):<br>
=C2=A0 binutils: Fix CVE-2025-1181<br>
<br>
=C2=A0meta/lib/oeqa/runtime/cases/buildcpio.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/lib/oeqa/sdk/cases/buildcpio.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/meta_ide.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../libpcap/libpcap/CVE-2025-11961-01.patch=C2=A0 =C2=A0|=C2=A0 38 ++=
<br>
=C2=A0.../libpcap/libpcap/CVE-2025-11961-02.patch=C2=A0 =C2=A0| 433 +++++++=
+++++<br>
=C2=A0.../libpcap/libpcap/CVE-2025-11964.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
33 +<br>
=C2=A0.../libpcap/<a href=3D"http://libpcap_1.10.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libpcap_1.10.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0meta/recipes-core/dropbear/dropbear.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0.../dropbear/dropbear/CVE-2019-6111.patch=C2=A0 =C2=A0 =C2=A0| 157 ++=
+++<br>
=C2=A0.../glib-2.0/glib-2.0/CVE-2025-13601-01.patch | 125 ++++<br>
=C2=A0.../glib-2.0/glib-2.0/CVE-2025-13601-02.patch | 128 ++++<br>
=C2=A0.../glib-2.0/glib-2.0/CVE-2025-14087-01.patch |=C2=A0 69 ++<br>
=C2=A0.../glib-2.0/glib-2.0/CVE-2025-14087-02.patch | 240 +++++++<br>
=C2=A0.../glib-2.0/glib-2.0/CVE-2025-14087-03.patch | 150 +++++<br>
=C2=A0.../glib-2.0/glib-2.0/CVE-2025-14512.patch=C2=A0 =C2=A0 |=C2=A0 70 ++=
<br>
=C2=A0meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.72.3.bb" rel=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.3.bb</a> |=C2=A0 =C2=A06 +<=
br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../util-linux/CVE-2025-14104-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 33 +<br>
=C2=A0.../util-linux/CVE-2025-14104-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 28 +<br>
=C2=A0.../binutils/binutils-2.38.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../binutils/binutils/CVE-2025-1181-pre.patch | 149 +++++<br>
=C2=A0.../binutils/binutils/CVE-2025-1181.patch=C2=A0 =C2=A0 =C2=A0| 342 ++=
++++++++<br>
=C2=A0.../0001-configure-Prune-PIE-flags.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
44 --<br>
=C2=A0.../pseudo/files/glibc238.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 65 --<br>
=C2=A0.../pseudo/files/older-glibc-symbols.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0meta/recipes-devtools/pseudo/pseudo.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A07 +<br>
=C2=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
6 +-<br>
=C2=A0.../python3-urllib3/CVE-2025-66418.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
70 ++<br>
=C2=A0.../python/<a href=3D"http://python3-urllib3_1.26.20.bb" rel=3D"noref=
errer" target=3D"_blank">python3-urllib3_1.26.20.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../python/python3/CVE-2025-13836.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
63 +++++<br>
=C2=A0.../python/<a href=3D"http://python3_3.10.19.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3_3.10.19.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0meta/recipes-extended/cups/cups.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0...pping-scheduler-on-unknown-directive.patch |=C2=A0 43 ++<br>
=C2=A0.../cups/cups/CVE-2025-58436.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 630 ++++++++++++++++++<br>
=C2=A0.../cups/cups/CVE-2025-61915.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 487 ++++++++++++++<br>
=C2=A0...25-60753.patch =3D&gt; CVE-2025-60753-01.patch} |=C2=A0 =C2=A00<br=
>
=C2=A0.../libarchive/CVE-2025-60753-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 46 ++<br>
=C2=A0.../libarchive/<a href=3D"http://libarchive_3.6.2.bb" rel=3D"noreferr=
er" target=3D"_blank">libarchive_3.6.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0.../curl/curl/CVE-2025-14017.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 115 ++++<br>
=C2=A0.../curl/curl/CVE-2025-15079.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 32 +<br>
=C2=A0.../curl/curl/CVE-2025-15224.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 31 +<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_7.82.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +<br>
=C2=A0.../gnupg/gnupg/CVE-2025-68973.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 108 +++<br>
=C2=A0meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.3.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_2.3.7.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A045 files changed, 3763 insertions(+), 120 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025=
-11961-01.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025=
-11961-02.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025=
-11964.patch<br>
=C2=A0create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111.=
patch<br>
=C2=A0create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601=
-01.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601=
-02.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087=
-01.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087=
-02.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087=
-03.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512=
.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-1=
4104-01.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-1=
4104-02.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1=
181-pre.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1=
181.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/0001-configure-=
Prune-PIE-flags.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/glibc238.patch<=
br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2=
025-66418.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-1383=
6.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/cups/cups/0001-conf.c-Fix-st=
opping-scheduler-on-unknown-directive.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58436.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-61915.pat=
ch<br>
=C2=A0rename meta/recipes-extended/libarchive/libarchive/{CVE-2025-60753.pa=
tch =3D&gt; CVE-2025-60753-01.patch} (100%)<br>
=C2=A0create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-20=
25-60753-02.patch<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patc=
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

--00000000000097d9320648d6781e--

