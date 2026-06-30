Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE41C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 23:09:03 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33601.1782860935044110648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 16:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IMthvTFQ;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664d7863920so3049006d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 16:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782860934; cv=none;
        d=google.com; s=arc-20260327;
        b=C5vmH93UQF0Ewc+C03+2O8+JpK7vzLgD6XLpolH0scNPZdiMnM+eRl/OJJljZ3rRto
         kRyT6p9NG3tNr5r11ZqGkLPQnqzEovUmcFrn5s/nIY05G7khlkFwG6CsA8bMWMvzzgZq
         Jd3WIZJOJGFTZRcMKh3sl9+Qck3KXGMtuJCznyt1GUgjmZcN+YNuE0e9Z27H91Vb0oDb
         Lb+LwNhCFnEFOVr19n8h7GYPMiri7Xc/TulYq80qahFsG2CBkLNu8H2B+WGAKnCPiS1n
         tfj7wTqtJEEjniPX6IXaipS06J2sPWB4ftZHbjJIE0WPukFfRoQJjekEiy6eW4wAzZ6t
         hCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AijdTzEaZdfgKuIsmW0arVMgYNDIcTpwVachskvPp88=;
        fh=H55edaxsWHsij9+DDVA86mjfio5ILrwHyGMM4Evpkl8=;
        b=ht17sEDxJTQOSwdC8WAe7u9IIbLmbgD65Tujd0SgpWyH277MPIpme/A+o4kCt9uXY9
         IwdxJvHtNfk3UUGHwi3LS+3Y/0Wm5pAOp6H1fGoIrXQQ6AL8CnkGJx+b7Pg3EXMk/yTV
         HmY4r+o6urhwguxcWs8pKRWreP7kRndnh67/+pCU+pCbT5NTAi1TbGfOHlRptrZRxR8/
         FlTn2XZsbFOi3My8OEUqQq3eneoLrTFLVPLWOReGrcGecwZtjpBlj5u23qAZQVmAoXeo
         TkBHMEwOV3QgcjNJIQWO8WPJy4GYASWQWQxHoD/3id3leiyynMdEWbLtltJvf7YgN2La
         HqJA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782860934; x=1783465734; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AijdTzEaZdfgKuIsmW0arVMgYNDIcTpwVachskvPp88=;
        b=IMthvTFQFG1m7z26JESDA3c2OfFBirw7aZnBvFNx9EArBorlFlvl5SIGigudHAsP6C
         6RDwoJOO+Cu2+pE4lAhjD1TlgulXN2L9ndvtW7GIRiHT1l6OPRPTCC5SHODMAF1e42aq
         JXjpBWfTqL/pSxmK8RsuCFWe7UZGLoIcUdY3DpQANJQYXhjZ9jho3+vS9WlP2mQrUQd5
         fLr83zjaq9tRmI8A0XQMvo7lxiIROVkqRkvoVULCsIML0MyibJm/XtAXm8kRIBUKynR1
         gPaPAwrpLSFExMQF93ZNo18r3lD0bFwKLm1MEzEpR9Yw1H4NXKfpw508t+ahbAg1jnyO
         le+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782860934; x=1783465734;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AijdTzEaZdfgKuIsmW0arVMgYNDIcTpwVachskvPp88=;
        b=rEDLJECuIZN1q7pebgzXmknwP0UB4BvC2xR02i2J/j5VfOTBRyW0tUB6C4WHcETSZL
         cyFx9yVC22Nj6nfloXmQLr8+3Z7pselwysJVNoDgM0zxYiP3p6h/7RdKqxP09UYadBlC
         CwLYxpq7PAJdEJP0OwQ7M5feIlk/AeXfvWlc36lBD5m3AufD3KKL7ioCWy+OGhY36wny
         Ilgmp+rDZadi1kUJfpfvDS8ILa5caOR9huzS+28p4sBt1dZBtD5XdGFc/jHRAhZQEMOt
         NOgAkqyRKvfEjZlIdoVvUwP0Q4i2iq7/toVtdzB2AIpI90gQFvOUIRa8yvp2OFSkdxiq
         RTRA==
X-Gm-Message-State: AOJu0Yyr5NTxMadTgtyyLy5Xt8aTidF0kECToRiEphDDtZ8Q1d8xVCpg
	Batpi2plcvUF5JmSDRmCl2kyPehQ8CrOGPSpDu1MQGIlU7D0XxxYG967fx0JylhCj8jtpKcteW2
	3Z1hnJLITueS0bP8h291Vubklk5vg7dU=
X-Gm-Gg: AfdE7cnOTIS0Sr5BgZGE8s5hDmkQYLR3cO+amk228enmGRVZaOsnEkqEXmw0nDRU8fm
	GiBX2y6/OWw6ThQuEng1jsIHWxLp1pRYlDoDCK5jCedHqn1twz39ImJTW8+ulROeUG4nDhzEPUV
	ME2pVCpQSoOQ8TuBx6PS0/m72CCb1NkMz9ZuWEtsIYmJb/TzBURiV2ItRgUbyRDxcymkcrAa+50
	Z8j36WEO9okc+1EqIVB/2EQCKx0ZTZI9BnLl9EagCJtADLSWRXyHkN1nlizr9EKXDpe9OQz39d9
	Zbv/053XdMkV25CgkD69Eb7tBHATJpltcdmz+40RHm2yZaY23fgUEkpyorydg+zu1kUrByCPvCK
	T79ovq6Nu1Wm6P9rRI3GHJyyK2zjWOS30p9oK3drask1FVTxfIfgZPSEhOD2CPaKxkLruG4o=
X-Received: by 2002:a05:690e:4185:b0:664:efd9:3def with SMTP id
 956f58d0204a3-664f9746b5dmr5219931d50.1.1782860933766; Tue, 30 Jun 2026
 16:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260630115028.4001775-1-daniel.turull@ericsson.com> <20260630115028.4001775-3-daniel.turull@ericsson.com>
In-Reply-To: <20260630115028.4001775-3-daniel.turull@ericsson.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Jun 2026 16:08:27 -0700
X-Gm-Features: AVVi8Cd2XCDOTATYtTKvzjdi06yn64YEKzmfguX_EvXAgPlAdHmhFz8EpmCB3Yc
Message-ID: <CAMKF1srMrFBgWpub7tzhkUYUF-3AN0Hvc_=3vZmz094NbYRSdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/3] systemd: upgrade to 261
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, qi.chen@windriver.com, 
	alex.kanavin@gmail.com, richard.purdie@linuxfoundation.org, 
	Ross.Burton@arm.com, mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000a42330065580a8fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 23:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239926

--000000000000a42330065580a8fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think, this patch also needs to revert changes from -
https://git.openembedded.org/openembedded-core/commit/?id=3D30140cb9354
its fails in do_install of systemd-systemctl-native right now.

On Tue, Jun 30, 2026 at 4:50=E2=80=AFAM Daniel Turull via lists.openembedde=
d.org
<daniel.turull=3Dericsson.com@lists.openembedded.org> wrote:

> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Changes: https://github.com/systemd/systemd/compare/v259.5...v261-stable
>
> - Drop backported patches no longer needed (libfido2_cflags,
>   tpm2-util PCR bank, fdset_new debug)
> - Remove sysvinit-path/sysvrcnd-path meson options and
>   systemd-sysv-install skeleton (removed upstream in 260)
> - Add explicit meson disables for auto-detected features in
>   systemd-systemctl-native to prevent host sysroot contamination
> - Refresh 0003-Do-not-create-var-log-README.patch
>
> Tested on qemu target with testsuite systemd
>
> AI-Generated: Claude-opus-4.6
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  ...ve_259.5.bb =3D> systemd-boot-native_261.bb} |  0
>  ...temd-boot_259.5.bb =3D> systemd-boot_261.bb} |  0
>  ...9.5.bb =3D> systemd-systemctl-native_261.bb} |  8 +-
>  meta/recipes-core/systemd/systemd.inc         |  8 +-
>  ...meson-use-libfido2_cflags-dependency.patch | 54 -----------
>  .../0003-Do-not-create-var-log-README.patch   | 10 +-
>  ...il-fix-PCR-bank-guessing-without-EFI.patch | 62 ------------
>  ...-detailed-debug-logging-to-fdset_new.patch | 97 -------------------
>  .../{systemd_259.5.bb =3D> systemd_261.bb}      | 12 +--
>  9 files changed, 18 insertions(+), 233 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D>
> systemd-boot-native_261.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D>
> systemd-boot_261.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd-systemctl-native_259.5.bb =3D>
> systemd-systemctl-native_261.bb} (54%)
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-dependen=
cy.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-guessing-wi=
thout-EFI.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-debug-lo=
gging-to-fdset_new.patch
>  rename meta/recipes-core/systemd/{systemd_259.5.bb =3D> systemd_261.bb}
> (99%)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_259.5.bb
> b/meta/recipes-core/systemd/systemd-boot-native_261.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot-native_259.5.bb
> rename to meta/recipes-core/systemd/systemd-boot-native_261.bb
> diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb
> b/meta/recipes-core/systemd/systemd-boot_261.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_259.5.bb
> rename to meta/recipes-core/systemd/systemd-boot_261.bb
> diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
> b/meta/recipes-core/systemd/systemd-systemctl-native_261.bb
> similarity index 54%
> rename from meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
> rename to meta/recipes-core/systemd/systemd-systemctl-native_261.bb
> index bf9c9f4776..28fddc79df 100644
> --- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
> +++ b/meta/recipes-core/systemd/systemd-systemctl-native_261.bb
> @@ -10,8 +10,14 @@ inherit pkgconfig meson native
>
>  MESON_TARGET =3D "systemctl"
>  MESON_INSTALL_TAGS =3D "systemctl"
> +# Explicitly disable features that meson auto-detects from the native
> sysroot.
> +# Only systemctl is built here; these prevent spurious dependencies and
> ensure
> +# reproducible builds regardless of what is installed on the build host.
>  EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
> -EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
> +EXTRA_OEMESON +=3D "-Dpam=3Ddisabled -Daudit=3Ddisabled -Dselinux=3Ddisa=
bled"
> +EXTRA_OEMESON +=3D "-Dacl=3Ddisabled -Dapparmor=3Ddisabled -Dseccomp=3Dd=
isabled"
> +EXTRA_OEMESON +=3D "-Dlibcryptsetup=3Ddisabled -Dlibcurl=3Ddisabled
> -Dlibfido2=3Ddisabled"
> +EXTRA_OEMESON +=3D "-Dpcre2=3Ddisabled -Dp11kit=3Ddisabled -Dopenssl=3Dd=
isabled"
>
>  # Systemctl is supposed to operate on target, but the target sysroot is
> not
>  # determined at run-time, but rather set during configure
> diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> index f107c4c5da..d9048e9187 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -15,14 +15,10 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e6e72d2c6 \
>
>  file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420a007368f2"
>
> -SRCREV =3D "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
> -SRCBRANCH =3D "v259-stable"
> +SRCREV =3D "de9dbc37ad4aa637e200ac02a0545095997055df"
> +SRCBRANCH =3D "v261-stable"
>  SRC_URI =3D "git://
> github.com/systemd/systemd.git;protocol=3Dhttps;branch=3D${SRCBRANCH};tag=
=3Dv${PV}
> <http://github.com/systemd/systemd.git;protocol=3Dhttps;branch=3D$%7BSRCB=
RANCH%7D;tag=3Dv$%7BPV%7D>
> "
>
>  CVE_PRODUCT =3D "systemd"
>
>  CVE_STATUS[CVE-2019-3815] =3D "not-applicable-platform: only applied to
> RHEL"
> -CVE_STATUS[CVE-2026-40223] =3D "fixed-version: fixed in 259.2"
> -CVE_STATUS[CVE-2026-40224] =3D "fixed-version: fixed in 259.3"
> -CVE_STATUS[CVE-2026-40225] =3D "fixed-version: fixed in 259.5"
> -CVE_STATUS[CVE-2026-40226] =3D "fixed-version: fixed in 259.4"
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-depend=
ency.patch
> b/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-depend=
ency.patch
> deleted file mode 100644
> index 4bc1e10ee7..0000000000
> ---
> a/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-depend=
ency.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 97142fd1db4124de5d5bdd3f49cc5a390286e522 Mon Sep 17 00:00:00 2001
> -From: Dan McGregor <danmcgr@protonmail.com>
> -Date: Wed, 11 Mar 2026 18:26:05 -0600
> -Subject: [PATCH] meson: use libfido2_cflags dependency
> -
> -Add the libfido2 dependency to cryptenroll and cryptsetup's
> -meson files. If libfido2's not installed in the default path
> -the build wasn't finding its headers correctly.
> -
> -Signed-off-by: Dan McGregor <danmcgr@protonmail.com>
> -Upstream-Status: Backport [
> https://github.com/systemd/systemd/commit/9ce905e35f690e7a10cd286be2b5059=
4d0857f5e
> ]
> ----
> - src/cryptenroll/meson.build                  | 1 +
> - src/cryptsetup/cryptsetup-tokens/meson.build | 2 +-
> - src/cryptsetup/meson.build                   | 1 +
> - 3 files changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/cryptenroll/meson.build b/src/cryptenroll/meson.build
> -index 488ceea14d..11265c8b41 100644
> ---- a/src/cryptenroll/meson.build
> -+++ b/src/cryptenroll/meson.build
> -@@ -23,6 +23,7 @@ executables +=3D [
> -                 'dependencies' : [
> -                         libcryptsetup,
> -                         libdl,
> -+                        libfido2_cflags,
> -                         libopenssl,
> -                         libp11kit_cflags,
> -                 ],
> -diff --git a/src/cryptsetup/cryptsetup-tokens/meson.build
> b/src/cryptsetup/cryptsetup-tokens/meson.build
> -index 804e18bc67..0fd6309201 100644
> ---- a/src/cryptsetup/cryptsetup-tokens/meson.build
> -+++ b/src/cryptsetup/cryptsetup-tokens/meson.build
> -@@ -58,7 +58,7 @@ modules +=3D [
> -                 'sources' : cryptsetup_token_systemd_fido2_sources,
> -                 'dependencies' : [
> -                         libcryptsetup,
> --                        libfido2,
> -+                        libfido2_cflags,
> -                 ],
> -         },
> -         template + {
> -diff --git a/src/cryptsetup/meson.build b/src/cryptsetup/meson.build
> -index d9778259c2..b36354fb0a 100644
> ---- a/src/cryptsetup/meson.build
> -+++ b/src/cryptsetup/meson.build
> -@@ -19,6 +19,7 @@ executables +=3D [
> -                 'sources' : systemd_cryptsetup_sources,
> -                 'dependencies' : [
> -                         libcryptsetup,
> -+                        libfido2_cflags,
> -                         libmount_cflags,
> -                         libopenssl,
> -                         libp11kit_cflags,
> diff --git
> a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.pat=
ch
> b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.pat=
ch
> index 1d3c4f83c0..0128c83d9f 100644
> ---
> a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.pat=
ch
> +++
> b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.pat=
ch
> @@ -1,7 +1,7 @@
>  From a7f6a296707642d05463aec22ea3dfce7d06c989 Mon Sep 17 00:00:00 2001
>  From: Peter Kjellerstedt <pkj@axis.com>
>  Date: Tue, 21 Jan 2025 05:02:00 +0100
> -Subject: [PATCH 03/16] Do not create /var/log/README
> +Subject: [PATCH] Do not create /var/log/README
>
>  /var/log/README is a link to /usr/share/doc/systemd/README.logs. The
>  latter is packaged in systemd-doc and likely not installed, which leaves
> @@ -15,19 +15,15 @@ Signed-off-by: Peter Kjellerstedt <
> peter.kjellerstedt@axis.com>
>   1 file changed, 3 deletions(-)
>
>  diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
> -index cdef21fa9b..03798c953e 100644
> +index cdef21fa9b..7890abcdef 100644
>  --- a/tmpfiles.d/legacy.conf.in
>  +++ b/tmpfiles.d/legacy.conf.in
> -@@ -13,9 +13,6 @@
> +@@ -13,6 +13,3 @@
>
>   d /run/lock 0755 root root -
>   L /var/lock - - - - ../run/lock
>  -{% if CREATE_LOG_DIRS %}
>  -L$ /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
>  -{% endif %}
> -
> - {% if HAVE_SYSV_COMPAT %}
> - # /run/lock/subsys is used for serializing SysV service execution, and
>  --
>  2.34.1
> -
> diff --git
> a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-guessing-=
without-EFI.patch
> b/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-guessing-=
without-EFI.patch
> deleted file mode 100644
> index c590b01cd3..0000000000
> ---
> a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-guessing-=
without-EFI.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From 3cef11c710e95bb5f891181e9b2a6d8f174712c3 Mon Sep 17 00:00:00 2001
> -From: Patrick Wicki <patrick.wicki@subset.ch>
> -Date: Fri, 20 Mar 2026 15:56:56 +0100
> -Subject: [PATCH] tpm2-util: fix PCR bank guessing without EFI
> -
> -Since 7643e4a89 efi_get_active_pcr_banks() is used to determine the
> -active PCR banks. Without EFI support, this returns -EOPNOTSUPP. This in
> -turns leads to cryptenroll and cryptsetup attach failures unless the PCR
> -bank is explicitly set, i.e.
> -
> -$ systemd-cryptenroll $LUKS_PART --tpm2-device=3Dauto --tpm2-pcrs=3D'7'
> -[...]
> -Could not read pcr values: Operation not supported
> -
> -But it works fine with --tpm2-pcrs=3D'7:sha256'.
> -
> -Similarly, unsealing during cryptsetup attach also fails if the bank
> -needs to be determined:
> -
> -Failed to unseal secret using TPM2: Operation not supported
> -
> -Catch the -EOPNOTSUPP and fallback to the guessing strategy.
> -
> -Upstream-Status: Backport [https://github.com/systemd/systemd/pull/41231=
]
> -
> -Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ----
> - src/shared/tpm2-util.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/shared/tpm2-util.c b/src/shared/tpm2-util.c
> -index cf11b50695..c0590fe575 100644
> ---- a/src/shared/tpm2-util.c
> -+++ b/src/shared/tpm2-util.c
> -@@ -2702,11 +2702,11 @@ int tpm2_get_best_pcr_bank(
> -         uint32_t efi_banks;
> -         r =3D efi_get_active_pcr_banks(&efi_banks);
> -         if (r < 0) {
> --                if (r !=3D -ENOENT)
> -+                if (!IN_SET(r, -ENOENT, -EOPNOTSUPP))
> -                         return r;
> -
> -                 /* If variable is not set use guesswork below */
> --                log_debug("Boot loader didn't set the
> LoaderTpm2ActivePcrBanks EFI variable, we have to guess the used PCR
> banks.");
> -+                log_debug("Boot loader didn't set the
> LoaderTpm2ActivePcrBanks EFI variable or EFI support is unavailable, we
> have to guess the used PCR banks.");
> -         } else if (efi_banks =3D=3D UINT32_MAX)
> -                 log_debug("Boot loader set the LoaderTpm2ActivePcrBanks
> EFI variable to indicate that the GetActivePcrBanks() API is not availabl=
e
> in the firmware. We have to guess the used PCR banks.");
> -         else {
> -@@ -2811,11 +2811,11 @@ int tpm2_get_good_pcr_banks(
> -         uint32_t efi_banks;
> -         r =3D efi_get_active_pcr_banks(&efi_banks);
> -         if (r < 0) {
> --                if (r !=3D -ENOENT)
> -+                if (!IN_SET(r, -ENOENT, -EOPNOTSUPP))
> -                         return r;
> -
> -                 /* If the variable is not set we have to guess via the
> code below */
> --                log_debug("Boot loader didn't set the
> LoaderTpm2ActivePcrBanks EFI variable, we have to guess the used PCR
> banks.");
> -+                log_debug("Boot loader didn't set the
> LoaderTpm2ActivePcrBanks EFI variable or EFI support is unavailable, we
> have to guess the used PCR banks.");
> -         } else if (efi_banks =3D=3D UINT32_MAX)
> -                 log_debug("Boot loader set the LoaderTpm2ActivePcrBanks
> EFI variable to indicate that the GetActivePcrBanks() API is not availabl=
e
> in the firmware. We have to guess the used PCR banks.");
> -         else {
> diff --git
> a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-debug-=
logging-to-fdset_new.patch
> b/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-debug-=
logging-to-fdset_new.patch
> deleted file mode 100644
> index 63fa7fefec..0000000000
> ---
> a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-debug-=
logging-to-fdset_new.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -From 0565f9f27323a8f9e62d85f2add542af99cea06a Mon Sep 17 00:00:00 2001
> -From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> -Date: Wed, 21 Jan 2026 14:13:29 +0530
> -Subject: [PATCH] systemd: Add detailed debug logging to fdset_new_fill()
> -
> -Currently, when fdset_new_fill() fails to open /proc/self/fd or
> -encounters an error while processing individual file descriptors
> -(such as fcntl or fstat failures), it returns a silent error code.
> -
> -For debugging rarely reproducible failures it becomes difficult to
> -know the exact cause of failure
> -This commit updates the function to use log_debug_errno() for all
> -error paths and hence  provides better visibility into why FD collection
> -failed, including the path of the problematic FD (via fd_get_path)
> -and its inode type.
> -
> -Upstream-Status: Backport [https://github.com/systemd/systemd/pull/40385=
]
> -
> -Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> ----
> - src/shared/fdset.c | 35 ++++++++++++++++++++++++++---------
> - 1 file changed, 26 insertions(+), 9 deletions(-)
> -
> -diff --git a/src/shared/fdset.c b/src/shared/fdset.c
> -index 832e7fda60..f340f41b0e 100644
> ---- a/src/shared/fdset.c
> -+++ b/src/shared/fdset.c
> -@@ -8,6 +8,7 @@
> - #include "alloc-util.h"
> - #include "async.h"
> - #include "dirent-util.h"
> -+#include "errno-util.h"
> - #include "fd-util.h"
> - #include "fdset.h"
> - #include "log.h"
> -@@ -179,9 +180,10 @@ int fdset_new_fill(
> -         d =3D opendir("/proc/self/fd");
> -         if (!d) {
> -                 if (errno =3D=3D ENOENT && proc_mounted() =3D=3D 0)
> --                        return -ENOSYS;
> -+                        return log_debug_errno(SYNTHETIC_ERRNO(ENOSYS),
> -+                                               "Failed to open
> /proc/self/fd/, /proc/ is not mounted.");
> -
> --                return -errno;
> -+                return log_debug_errno(errno, "Failed to open
> /proc/self/fd/: %m ");
> -         }
> -
> -         s =3D fdset_new();
> -@@ -210,9 +212,14 @@ int fdset_new_fill(
> -                          * been passed in can be collected and fds whic=
h
> have been created locally can be
> -                          * ignored, under the assumption that only the
> latter have O_CLOEXEC set. */
> -
> --                        fl =3D fcntl(fd, F_GETFD);
> --                        if (fl < 0)
> --                                return -errno;
> -+                        fl =3D RET_NERRNO(fcntl(fd, F_GETFD));
> -+                        if (fl < 0) {
> -+                                _cleanup_free_ char *path =3D NULL;
> -+                                (void) fd_get_path(fd, &path);
> -+                                return log_debug_errno(fl,
> -+                                                       "Failed to get
> flag of fd=3D%d (%s): %m ",
> -+                                                       fd, strna(path))=
;
> -+                        }
> -
> -                         if (FLAGS_SET(fl, FD_CLOEXEC) !=3D
> !!filter_cloexec)
> -                                 continue;
> -@@ -221,13 +228,23 @@ int fdset_new_fill(
> -                 /* We need to set CLOEXEC manually only if we're
> collecting non-CLOEXEC fds. */
> -                 if (filter_cloexec <=3D 0) {
> -                         r =3D fd_cloexec(fd, true);
> --                        if (r < 0)
> --                                return r;
> -+                        if (r < 0) {
> -+                                _cleanup_free_ char *path =3D NULL;
> -+                                (void) fd_get_path(fd, &path);
> -+                                return log_debug_errno(r,
> -+                                                       "Failed to set
> CLOEXEC flag fd=3D%d (%s): %m ",
> -+                                                       fd, strna(path))=
;
> -+                        }
> -                 }
> -
> -                 r =3D fdset_put(s, fd);
> --                if (r < 0)
> --                        return r;
> -+                if (r < 0) {
> -+                        _cleanup_free_ char *path =3D NULL;
> -+                        (void) fd_get_path(fd, &path);
> -+                        return log_debug_errno(r,
> -+                                               "Failed to put fd=3D%d (=
%s)
> into fdset: %m ",
> -+                                               fd, strna(path));
> -+                }
> -         }
> -
> -         *ret =3D TAKE_PTR(s);
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-core/systemd/systemd_259.5.bb
> b/meta/recipes-core/systemd/systemd_261.bb
> similarity index 99%
> rename from meta/recipes-core/systemd/systemd_259.5.bb
> rename to meta/recipes-core/systemd/systemd_261.bb
> index f3ec0edae7..eedce348c3 100644
> --- a/meta/recipes-core/systemd/systemd_259.5.bb
> +++ b/meta/recipes-core/systemd/systemd_261.bb
> @@ -32,9 +32,6 @@ SRC_URI +=3D " \
>             file://systemd-pager.sh \
>
> file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>             file://0003-Do-not-create-var-log-README.patch \
> -           file://0001-meson-use-libfido2_cflags-dependency.patch \
> -
>  file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch \
> -           file://0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch=
 \
>             "
>
>  PAM_PLUGINS =3D " \
> @@ -226,9 +223,6 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>                    -Ddbus=3Ddisabled \
>                    -Dtests=3Dfalse \
>                    -Dlibc=3D${TCLIBC} \
> -                  -Drc-local=3D'' \
> -                  -Dsysvinit-path=3D'' \
> -                  -Dsysvrcnd-path=3D'' \
>                    "
>
>  # Hardcode target binary paths to avoid using paths from sysroot or wors=
e
> @@ -582,6 +576,8 @@ FILES:${PN}-extra-utils =3D "\
>                          ${bindir}/systemd-cgtop \
>                          ${bindir}/systemd-stdio-bridge \
>                          ${base_sbindir}/mount.ddi \
> +                        ${base_sbindir}/mount.mstack \
> +                        ${base_sbindir}/mount.storage \
>
>  ${systemd_system_unitdir}/initrd.target.wants/systemd-pcrphase-initrd.pa=
th
> \
>
>  ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase.path \
>
>  ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase-sysinit.=
path
> \
> @@ -678,6 +674,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
>                  ${datadir}/polkit-1 \
>                  ${datadir}/${BPN} \
>                  ${datadir}/factory \
> +                ${datadir}/user-tmpfiles.d \
>                  ${sysconfdir}/credstore/ \
>                  ${sysconfdir}/credstore.encrypted/ \
>                  ${sysconfdir}/dbus-1/ \
> @@ -687,6 +684,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
>                  ${sysconfdir}/sysctl.d/ \
>                  ${sysconfdir}/systemd/ \
>                  ${sysconfdir}/tmpfiles.d/ \
> +                ${sysconfdir}/user-tmpfiles.d/ \
>                  ${sysconfdir}/xdg/ \
>                  ${sysconfdir}/init.d/README \
>                  ${sysconfdir}/resolv-conf.systemd \
> @@ -797,11 +795,13 @@ FILES:udev +=3D "${base_sbindir}/udevd \
>                 ${nonarch_libdir}/udev/rules.d/60-persistent-storage.rule=
s
> \
>
> ${nonarch_libdir}/udev/rules.d/60-persistent-storage-mtd.rules \
>
> ${nonarch_libdir}/udev/rules.d/60-persistent-storage-tape.rules \
> +               ${nonarch_libdir}/udev/rules.d/60-tpm2-id.rules \
>                 ${nonarch_libdir}/udev/rules.d/60-persistent-v4l.rules \
>                 ${nonarch_libdir}/udev/rules.d/60-sensor.rules \
>                 ${nonarch_libdir}/udev/rules.d/60-serial.rules \
>                 ${nonarch_libdir}/udev/rules.d/61-autosuspend-manual.rule=
s
> \
>                 ${nonarch_libdir}/udev/rules.d/64-btrfs.rules \
> +               ${nonarch_libdir}/udev/rules.d/65-integration.rules \
>                 ${nonarch_libdir}/udev/rules.d/70-camera.rules \
>                 ${nonarch_libdir}/udev/rules.d/70-joystick.rules \
>                 ${nonarch_libdir}/udev/rules.d/70-memory.rules \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239883):
> https://lists.openembedded.org/g/openembedded-core/message/239883
> Mute This Topic: https://lists.openembedded.org/mt/120045145/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a42330065580a8fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think, this patch also needs to revert changes from -=C2=
=A0<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D3=
0140cb9354">https://git.openembedded.org/openembedded-core/commit/?id=3D301=
40cb9354</a><div>its fails in do_install of=C2=A0systemd-systemctl-native r=
ight now.</div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 30, 2026 at 4:50=E2=80=AFA=
M Daniel Turull via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;daniel.turull=3D<a href=3D"mailto:ericsson.com@lists.open=
embedded.org">ericsson.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Daniel Turull &lt;<a=
 href=3D"mailto:daniel.turull@ericsson.com" target=3D"_blank">daniel.turull=
@ericsson.com</a>&gt;<br>
<br>
Changes: <a href=3D"https://github.com/systemd/systemd/compare/v259.5...v26=
1-stable" rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/s=
ystemd/compare/v259.5...v261-stable</a><br>
<br>
- Drop backported patches no longer needed (libfido2_cflags,<br>
=C2=A0 tpm2-util PCR bank, fdset_new debug)<br>
- Remove sysvinit-path/sysvrcnd-path meson options and<br>
=C2=A0 systemd-sysv-install skeleton (removed upstream in 260)<br>
- Add explicit meson disables for auto-detected features in<br>
=C2=A0 systemd-systemctl-native to prevent host sysroot contamination<br>
- Refresh 0003-Do-not-create-var-log-README.patch<br>
<br>
Tested on qemu target with testsuite systemd<br>
<br>
AI-Generated: Claude-opus-4.6<br>
Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.c=
om" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ve_259.5.bb" rel=3D"noreferrer" target=3D"_blank=
">ve_259.5.bb</a> =3D&gt; <a href=3D"http://systemd-boot-native_261.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd-boot-native_261.bb</a>} |=C2=A0 0=
<br>
=C2=A0...<a href=3D"http://temd-boot_259.5.bb" rel=3D"noreferrer" target=3D=
"_blank">temd-boot_259.5.bb</a> =3D&gt; <a href=3D"http://systemd-boot_261.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_261.bb</a>} |=C2=A0 0=
<br>
=C2=A0...<a href=3D"http://9.5.bb" rel=3D"noreferrer" target=3D"_blank">9.5=
.bb</a> =3D&gt; <a href=3D"http://systemd-systemctl-native_261.bb" rel=3D"n=
oreferrer" target=3D"_blank">systemd-systemctl-native_261.bb</a>} |=C2=A0 8=
 +-<br>
=C2=A0meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 +-<br>
=C2=A0...meson-use-libfido2_cflags-dependency.patch | 54 -----------<br>
=C2=A0.../0003-Do-not-create-var-log-README.patch=C2=A0 =C2=A0| 10 +-<br>
=C2=A0...il-fix-PCR-bank-guessing-without-EFI.patch | 62 ------------<br>
=C2=A0...-detailed-debug-logging-to-fdset_new.patch | 97 ------------------=
-<br>
=C2=A0.../{<a href=3D"http://systemd_259.5.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_259.5.bb</a> =3D&gt; <a href=3D"http://systemd_261.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_261.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
 12 +--<br>
=C2=A09 files changed, 18 insertions(+), 233 deletions(-)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot-nati=
ve_259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot-native_259.5=
.bb</a> =3D&gt; <a href=3D"http://systemd-boot-native_261.bb" rel=3D"norefe=
rrer" target=3D"_blank">systemd-boot-native_261.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot_259.=
5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_259.5.bb</a> =3D&gt=
; <a href=3D"http://systemd-boot_261.bb" rel=3D"noreferrer" target=3D"_blan=
k">systemd-boot_261.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-systemctl=
-native_259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-na=
tive_259.5.bb</a> =3D&gt; <a href=3D"http://systemd-systemctl-native_261.bb=
" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-native_261.bb</a>}=
 (54%)<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-l=
ibfido2_cflags-dependency.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-f=
ix-PCR-bank-guessing-without-EFI.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0018-shared-fdse=
t-add-detailed-debug-logging-to-fdset_new.patch<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_259.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_259.5.bb</a> =3D&gt; <a href=
=3D"http://systemd_261.bb" rel=3D"noreferrer" target=3D"_blank">systemd_261=
.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot-nativ=
e_259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot-native_259.5.=
bb</a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot-native_26=
1.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot-native_261.bb</a><b=
r>
similarity index 100%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-boot-native=
_259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot-native_259.5.b=
b</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-boot-native_2=
61.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot-native_261.bb</a><=
br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_259.5=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_259.5.bb</a> b/meta/=
recipes-core/systemd/<a href=3D"http://systemd-boot_261.bb" rel=3D"noreferr=
er" target=3D"_blank">systemd-boot_261.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-boot_259.5.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_259.5.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-boot_261.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd-boot_261.bb</a><br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-systemctl-=
native_259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-nat=
ive_259.5.bb</a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-syst=
emctl-native_261.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl=
-native_261.bb</a><br>
similarity index 54%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-systemctl-n=
ative_259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-nati=
ve_259.5.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-systemctl-nat=
ive_261.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-native_2=
61.bb</a><br>
index bf9c9f4776..28fddc79df 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-systemctl-native_=
259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-native_259=
.5.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-systemctl-native_=
261.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-native_261.b=
b</a><br>
@@ -10,8 +10,14 @@ inherit pkgconfig meson native<br>
<br>
=C2=A0MESON_TARGET =3D &quot;systemctl&quot;<br>
=C2=A0MESON_INSTALL_TAGS =3D &quot;systemctl&quot;<br>
+# Explicitly disable features that meson auto-detects from the native sysr=
oot.<br>
+# Only systemctl is built here; these prevent spurious dependencies and en=
sure<br>
+# reproducible builds regardless of what is installed on the build host.<b=
r>
=C2=A0EXTRA_OEMESON +=3D &quot;-Dlink-systemctl-shared=3Dfalse&quot;<br>
-EXTRA_OEMESON +=3D &quot;-Dsysvinit-path=3D -Dsysvrcnd-path=3D&quot;<br>
+EXTRA_OEMESON +=3D &quot;-Dpam=3Ddisabled -Daudit=3Ddisabled -Dselinux=3Dd=
isabled&quot;<br>
+EXTRA_OEMESON +=3D &quot;-Dacl=3Ddisabled -Dapparmor=3Ddisabled -Dseccomp=
=3Ddisabled&quot;<br>
+EXTRA_OEMESON +=3D &quot;-Dlibcryptsetup=3Ddisabled -Dlibcurl=3Ddisabled -=
Dlibfido2=3Ddisabled&quot;<br>
+EXTRA_OEMESON +=3D &quot;-Dpcre2=3Ddisabled -Dp11kit=3Ddisabled -Dopenssl=
=3Ddisabled&quot;<br>
<br>
=C2=A0# Systemctl is supposed to operate on target, but the target sysroot =
is not<br>
=C2=A0# determined at run-time, but rather set during configure<br>
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc<br>
index f107c4c5da..d9048e9187 100644<br>
--- a/meta/recipes-core/systemd/systemd.inc<br>
+++ b/meta/recipes-core/systemd/systemd.inc<br>
@@ -15,14 +15,10 @@ LICENSE:libsystemd =3D &quot;LGPL-2.1-or-later&quot;<br=
>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3Dc09786363500a9ac=
c29b147e6e72d2c6 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420a007368f2&quot;<br>
<br>
-SRCREV =3D &quot;b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a&quot;<br>
-SRCBRANCH =3D &quot;v259-stable&quot;<br>
+SRCREV =3D &quot;de9dbc37ad4aa637e200ac02a0545095997055df&quot;<br>
+SRCBRANCH =3D &quot;v261-stable&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/systemd/systemd.=
git;protocol=3Dhttps;branch=3D$%7BSRCBRANCH%7D;tag=3Dv$%7BPV%7D" rel=3D"nor=
eferrer" target=3D"_blank">github.com/systemd/systemd.git;protocol=3Dhttps;=
branch=3D${SRCBRANCH};tag=3Dv${PV}</a>&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;systemd&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2019-3815] =3D &quot;not-applicable-platform: only app=
lied to RHEL&quot;<br>
-CVE_STATUS[CVE-2026-40223] =3D &quot;fixed-version: fixed in 259.2&quot;<b=
r>
-CVE_STATUS[CVE-2026-40224] =3D &quot;fixed-version: fixed in 259.3&quot;<b=
r>
-CVE_STATUS[CVE-2026-40225] =3D &quot;fixed-version: fixed in 259.5&quot;<b=
r>
-CVE_STATUS[CVE-2026-40226] =3D &quot;fixed-version: fixed in 259.4&quot;<b=
r>
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cfla=
gs-dependency.patch b/meta/recipes-core/systemd/systemd/0001-meson-use-libf=
ido2_cflags-dependency.patch<br>
deleted file mode 100644<br>
index 4bc1e10ee7..0000000000<br>
--- a/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-depe=
ndency.patch<br>
+++ /dev/null<br>
@@ -1,54 +0,0 @@<br>
-From 97142fd1db4124de5d5bdd3f49cc5a390286e522 Mon Sep 17 00:00:00 2001<br>
-From: Dan McGregor &lt;<a href=3D"mailto:danmcgr@protonmail.com" target=3D=
"_blank">danmcgr@protonmail.com</a>&gt;<br>
-Date: Wed, 11 Mar 2026 18:26:05 -0600<br>
-Subject: [PATCH] meson: use libfido2_cflags dependency<br>
-<br>
-Add the libfido2 dependency to cryptenroll and cryptsetup&#39;s<br>
-meson files. If libfido2&#39;s not installed in the default path<br>
-the build wasn&#39;t finding its headers correctly.<br>
-<br>
-Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:danmcgr@protonmail.com" =
target=3D"_blank">danmcgr@protonmail.com</a>&gt;<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/c=
ommit/9ce905e35f690e7a10cd286be2b50594d0857f5e" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/systemd/systemd/commit/9ce905e35f690e7a10cd2=
86be2b50594d0857f5e</a>]<br>
----<br>
- src/cryptenroll/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 +<br>
- src/cryptsetup/cryptsetup-tokens/meson.build | 2 +-<br>
- src/cryptsetup/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
- 3 files changed, 3 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/cryptenroll/meson.build b/src/cryptenroll/meson.build<br>
-index 488ceea14d..11265c8b41 100644<br>
---- a/src/cryptenroll/meson.build<br>
-+++ b/src/cryptenroll/meson.build<br>
-@@ -23,6 +23,7 @@ executables +=3D [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;depende=
ncies&#39; : [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libcryptsetup,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libdl,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 libfido2_cflags,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libopenssl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libp11kit_cflags,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
-diff --git a/src/cryptsetup/cryptsetup-tokens/meson.build b/src/cryptsetup=
/cryptsetup-tokens/meson.build<br>
-index 804e18bc67..0fd6309201 100644<br>
---- a/src/cryptsetup/cryptsetup-tokens/meson.build<br>
-+++ b/src/cryptsetup/cryptsetup-tokens/meson.build<br>
-@@ -58,7 +58,7 @@ modules +=3D [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sources=
&#39; : cryptsetup_token_systemd_fido2_sources,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;depende=
ncies&#39; : [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libcryptsetup,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 libfido2,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 libfido2_cflags,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0template + {<br>
-diff --git a/src/cryptsetup/meson.build b/src/cryptsetup/meson.build<br>
-index d9778259c2..b36354fb0a 100644<br>
---- a/src/cryptsetup/meson.build<br>
-+++ b/src/cryptsetup/meson.build<br>
-@@ -19,6 +19,7 @@ executables +=3D [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sources=
&#39; : systemd_cryptsetup_sources,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;depende=
ncies&#39; : [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libcryptsetup,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 libfido2_cflags,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libmount_cflags,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libopenssl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libp11kit_cflags,<br>
diff --git a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-R=
EADME.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-=
README.patch<br>
index 1d3c4f83c0..0128c83d9f 100644<br>
--- a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch<br>
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch<br>
@@ -1,7 +1,7 @@<br>
=C2=A0From a7f6a296707642d05463aec22ea3dfce7d06c989 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com" target=
=3D"_blank">pkj@axis.com</a>&gt;<br>
=C2=A0Date: Tue, 21 Jan 2025 05:02:00 +0100<br>
-Subject: [PATCH 03/16] Do not create /var/log/README<br>
+Subject: [PATCH] Do not create /var/log/README<br>
<br>
=C2=A0/var/log/README is a link to /usr/share/doc/systemd/README.logs. The<=
br>
=C2=A0latter is packaged in systemd-doc and likely not installed, which lea=
ves<br>
@@ -15,19 +15,15 @@ Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto=
:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com=
</a>&gt;<br>
=C2=A0 1 file changed, 3 deletions(-)<br>
<br>
=C2=A0diff --git a/tmpfiles.d/<a href=3D"http://legacy.conf.in" rel=3D"nore=
ferrer" target=3D"_blank">legacy.conf.in</a> b/tmpfiles.d/<a href=3D"http:/=
/legacy.conf.in" rel=3D"noreferrer" target=3D"_blank">legacy.conf.in</a><br=
>
-index cdef21fa9b..03798c953e 100644<br>
+index cdef21fa9b..7890abcdef 100644<br>
=C2=A0--- a/tmpfiles.d/<a href=3D"http://legacy.conf.in" rel=3D"noreferrer"=
 target=3D"_blank">legacy.conf.in</a><br>
=C2=A0+++ b/tmpfiles.d/<a href=3D"http://legacy.conf.in" rel=3D"noreferrer"=
 target=3D"_blank">legacy.conf.in</a><br>
-@@ -13,9 +13,6 @@<br>
+@@ -13,6 +13,3 @@<br>
<br>
=C2=A0 d /run/lock 0755 root root -<br>
=C2=A0 L /var/lock - - - - ../run/lock<br>
=C2=A0-{% if CREATE_LOG_DIRS %}<br>
=C2=A0-L$ /var/log/README - - - - ../..{{DOC_DIR}}/README.logs<br>
=C2=A0-{% endif %}<br>
- <br>
- {% if HAVE_SYSV_COMPAT %}<br>
- # /run/lock/subsys is used for serializing SysV service execution, and<br=
>
=C2=A0-- <br>
=C2=A02.34.1<br>
-<br>
diff --git a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-=
guessing-without-EFI.patch b/meta/recipes-core/systemd/systemd/0004-tpm2-ut=
il-fix-PCR-bank-guessing-without-EFI.patch<br>
deleted file mode 100644<br>
index c590b01cd3..0000000000<br>
--- a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-guessin=
g-without-EFI.patch<br>
+++ /dev/null<br>
@@ -1,62 +0,0 @@<br>
-From 3cef11c710e95bb5f891181e9b2a6d8f174712c3 Mon Sep 17 00:00:00 2001<br>
-From: Patrick Wicki &lt;<a href=3D"mailto:patrick.wicki@subset.ch" target=
=3D"_blank">patrick.wicki@subset.ch</a>&gt;<br>
-Date: Fri, 20 Mar 2026 15:56:56 +0100<br>
-Subject: [PATCH] tpm2-util: fix PCR bank guessing without EFI<br>
-<br>
-Since 7643e4a89 efi_get_active_pcr_banks() is used to determine the<br>
-active PCR banks. Without EFI support, this returns -EOPNOTSUPP. This in<b=
r>
-turns leads to cryptenroll and cryptsetup attach failures unless the PCR<b=
r>
-bank is explicitly set, i.e.<br>
-<br>
-$ systemd-cryptenroll $LUKS_PART --tpm2-device=3Dauto --tpm2-pcrs=3D&#39;7=
&#39;<br>
-[...]<br>
-Could not read pcr values: Operation not supported<br>
-<br>
-But it works fine with --tpm2-pcrs=3D&#39;7:sha256&#39;.<br>
-<br>
-Similarly, unsealing during cryptsetup attach also fails if the bank<br>
-needs to be determined:<br>
-<br>
-Failed to unseal secret using TPM2: Operation not supported<br>
-<br>
-Catch the -EOPNOTSUPP and fallback to the guessing strategy.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/41231" rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/=
systemd/pull/41231</a>]<br>
-<br>
-Signed-off-by: Patrick Wicki &lt;<a href=3D"mailto:patrick.wicki@siemens.c=
om" target=3D"_blank">patrick.wicki@siemens.com</a>&gt;<br>
----<br>
- src/shared/tpm2-util.c | 8 ++++----<br>
- 1 file changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/src/shared/tpm2-util.c b/src/shared/tpm2-util.c<br>
-index cf11b50695..c0590fe575 100644<br>
---- a/src/shared/tpm2-util.c<br>
-+++ b/src/shared/tpm2-util.c<br>
-@@ -2702,11 +2702,11 @@ int tpm2_get_best_pcr_bank(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t efi_banks;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D efi_get_active_pcr_banks(&amp;efi_=
banks);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r !=3D -ENOEN=
T)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IN_SET(r, -E=
NOENT, -EOPNOTSUPP))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return r;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If variab=
le is not set use guesswork below */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_debug(&quot;B=
oot loader didn&#39;t set the LoaderTpm2ActivePcrBanks EFI variable, we hav=
e to guess the used PCR banks.&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_debug(&quot;B=
oot loader didn&#39;t set the LoaderTpm2ActivePcrBanks EFI variable or EFI =
support is unavailable, we have to guess the used PCR banks.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (efi_banks =3D=3D UINT32_MAX)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_debug(&q=
uot;Boot loader set the LoaderTpm2ActivePcrBanks EFI variable to indicate t=
hat the GetActivePcrBanks() API is not available in the firmware. We have t=
o guess the used PCR banks.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
-@@ -2811,11 +2811,11 @@ int tpm2_get_good_pcr_banks(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t efi_banks;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D efi_get_active_pcr_banks(&amp;efi_=
banks);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r !=3D -ENOEN=
T)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IN_SET(r, -E=
NOENT, -EOPNOTSUPP))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return r;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the va=
riable is not set we have to guess via the code below */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_debug(&quot;B=
oot loader didn&#39;t set the LoaderTpm2ActivePcrBanks EFI variable, we hav=
e to guess the used PCR banks.&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_debug(&quot;B=
oot loader didn&#39;t set the LoaderTpm2ActivePcrBanks EFI variable or EFI =
support is unavailable, we have to guess the used PCR banks.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (efi_banks =3D=3D UINT32_MAX)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_debug(&q=
uot;Boot loader set the LoaderTpm2ActivePcrBanks EFI variable to indicate t=
hat the GetActivePcrBanks() API is not available in the firmware. We have t=
o guess the used PCR banks.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
diff --git a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detail=
ed-debug-logging-to-fdset_new.patch b/meta/recipes-core/systemd/systemd/001=
8-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch<br>
deleted file mode 100644<br>
index 63fa7fefec..0000000000<br>
--- a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-debu=
g-logging-to-fdset_new.patch<br>
+++ /dev/null<br>
@@ -1,97 +0,0 @@<br>
-From 0565f9f27323a8f9e62d85f2add542af99cea06a Mon Sep 17 00:00:00 2001<br>
-From: AshishKumar Mishra &lt;<a href=3D"mailto:ashishkumar.mishra@bmwtechw=
orks.in" target=3D"_blank">ashishkumar.mishra@bmwtechworks.in</a>&gt;<br>
-Date: Wed, 21 Jan 2026 14:13:29 +0530<br>
-Subject: [PATCH] systemd: Add detailed debug logging to fdset_new_fill()<b=
r>
-<br>
-Currently, when fdset_new_fill() fails to open /proc/self/fd or<br>
-encounters an error while processing individual file descriptors<br>
-(such as fcntl or fstat failures), it returns a silent error code.<br>
-<br>
-For debugging rarely reproducible failures it becomes difficult to<br>
-know the exact cause of failure<br>
-This commit updates the function to use log_debug_errno() for all<br>
-error paths and hence=C2=A0 provides better visibility into why FD collect=
ion<br>
-failed, including the path of the problematic FD (via fd_get_path)<br>
-and its inode type.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/40385" rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/=
systemd/pull/40385</a>]<br>
-<br>
-Signed-off-by: AshishKumar Mishra &lt;<a href=3D"mailto:ashishkumar.mishra=
@bmwtechworks.in" target=3D"_blank">ashishkumar.mishra@bmwtechworks.in</a>&=
gt;<br>
----<br>
- src/shared/fdset.c | 35 ++++++++++++++++++++++++++---------<br>
- 1 file changed, 26 insertions(+), 9 deletions(-)<br>
-<br>
-diff --git a/src/shared/fdset.c b/src/shared/fdset.c<br>
-index 832e7fda60..f340f41b0e 100644<br>
---- a/src/shared/fdset.c<br>
-+++ b/src/shared/fdset.c<br>
-@@ -8,6 +8,7 @@<br>
- #include &quot;alloc-util.h&quot;<br>
- #include &quot;async.h&quot;<br>
- #include &quot;dirent-util.h&quot;<br>
-+#include &quot;errno-util.h&quot;<br>
- #include &quot;fd-util.h&quot;<br>
- #include &quot;fdset.h&quot;<br>
- #include &quot;log.h&quot;<br>
-@@ -179,9 +180,10 @@ int fdset_new_fill(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d =3D opendir(&quot;/proc/self/fd&quot;)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!d) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =
=3D=3D ENOENT &amp;&amp; proc_mounted() =3D=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -ENOSYS;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_debug_errno(SYNTHETIC_ERRNO(ENOSYS),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;Failed to open /proc/self/fd/, /proc/ is not moun=
ted.&quot;);<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_debug_=
errno(errno, &quot;Failed to open /proc/self/fd/: %m &quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D fdset_new();<br>
-@@ -210,9 +212,14 @@ int fdset_new_fill(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * been passed in can be collected and fds which have been=
 created locally can be<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * ignored, under the assumption that only the latter have=
 O_CLOEXEC set. */<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fl =3D fcntl(fd, F_GETFD);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (fl &lt; 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fl =3D RET_NERRNO(fcntl(fd, F_GETFD));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (fl &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *path =3D NULL;<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) fd_get_path(fd, &amp;path);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_debug_errno(fl,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to get flag of=
 fd=3D%d (%s): %m &quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd, strna(path));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (FLAGS_SET(fl, FD_CLOEXEC) !=3D !!filter_cloexec)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-@@ -221,13 +228,23 @@ int fdset_new_fill(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We need t=
o set CLOEXEC manually only if we&#39;re collecting non-CLOEXEC fds. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (filter_c=
loexec &lt;=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r =3D fd_cloexec(fd, true);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (r &lt; 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (r &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *path =3D NULL;<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) fd_get_path(fd, &amp;path);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_debug_errno(r,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to set CLOEXEC=
 flag fd=3D%d (%s): %m &quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd, strna(path));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D fdset_=
put(s, fd);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return r;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0) {<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _cleanup_free_ char *path =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (void) fd_get_path(fd, &amp;path);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_debug_errno(r,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;Failed to put fd=3D%d (%s) into fdset: %m &quot;,=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0fd, strna(path));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ret =3D TAKE_PTR(s);<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_259.5.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_259.5.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_261.bb" rel=3D"noreferrer" target=3D"_=
blank">systemd_261.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_259.5.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd_259.5.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_261.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_261.bb</a><br>
index f3ec0edae7..eedce348c3 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_259.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_259.5.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_261.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_261.bb</a><br>
@@ -32,9 +32,6 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://systemd-pager.sh \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-binfmt-Don-t-install-=
dependency-links-at-install-tim.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Do-not-create-var-log=
-README.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson-use-libfido2_cf=
lags-dependency.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0018-shared-fdset-add-deta=
iled-debug-logging-to-fdset_new.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-tpm2-util-fix-PCR-ban=
k-guessing-without-EFI.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PAM_PLUGINS =3D &quot; \<br>
@@ -226,9 +223,6 @@ EXTRA_OEMESON +=3D &quot;-Dnobody-user=3Dnobody \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddbus=
=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dtest=
s=3Dfalse \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibc=
=3D${TCLIBC} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Drc-local=
=3D&#39;&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dsysvinit-=
path=3D&#39;&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dsysvrcnd-=
path=3D&#39;&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
<br>
=C2=A0# Hardcode target binary paths to avoid using paths from sysroot or w=
orse<br>
@@ -582,6 +576,8 @@ FILES:${PN}-extra-utils =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${bindir}/systemd-cgtop \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${bindir}/systemd-stdio-bridge \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${base_sbindir}/mount.ddi \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${base_sbindir}/mount.mstack \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${base_sbindir}/mount.storage \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${systemd_system_unitdir}/initrd.target.wants/systemd-pcrp=
hase-initrd.path \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${systemd_system_unitdir}/sysinit.target.wants/systemd-pcr=
phase.path \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${systemd_system_unitdir}/sysinit.target.wants/systemd-pcr=
phase-sysinit.path \<br>
@@ -678,6 +674,7 @@ FILES:${PN} =3D &quot; ${base_bindir}/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/po=
lkit-1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/${=
BPN} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/fa=
ctory \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/user-tm=
pfiles.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/credstore/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/credstore.encrypted/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/dbus-1/ \<br>
@@ -687,6 +684,7 @@ FILES:${PN} =3D &quot; ${base_bindir}/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/sysctl.d/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/systemd/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/tmpfiles.d/ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/user=
-tmpfiles.d/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/xdg/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/init.d/README \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/resolv-conf.systemd \<br>
@@ -797,11 +795,13 @@ FILES:udev +=3D &quot;${base_sbindir}/udevd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/60-persistent-storage.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/60-persistent-storage-mtd.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/60-persistent-storage-tape.rules \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_libdir}/u=
dev/rules.d/60-tpm2-id.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/60-persistent-v4l.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/60-sensor.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/60-serial.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/61-autosuspend-manual.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/64-btrfs.rules \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_libdir}/u=
dev/rules.d/65-integration.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/70-camera.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/70-joystick.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/u=
dev/rules.d/70-memory.rules \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239883): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239883" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239883</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120045145/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120045145/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a42330065580a8fc--

