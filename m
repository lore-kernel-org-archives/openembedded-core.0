Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF43AC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 10:51:44 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16553.1786013500152059412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 03:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JlhbkT9U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1759456f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 03:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786013498; x=1786618298; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3+lloEybLP1aAmah+cKlwkRHQQjomd4E/HHfXJ4jVOE=;
        b=JlhbkT9UFDoy10r9dee/ufPNnfEQ9om1t6chUtLqarn4unWAksdpyrHHCqgFYvFIOw
         8LoMPV9KQDtr7EUhgLOQsfU63xPL0OEvvS4qBOYSls+QiCG9gY+I8cdMe0a+RMbtww96
         wxYLhISe37dTafB73UVWy5QsQJ5XJoJSDYlQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013498; x=1786618298;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+lloEybLP1aAmah+cKlwkRHQQjomd4E/HHfXJ4jVOE=;
        b=dLC3kAN1G+g4en5DcgOpNslffkrPHnBQhaIm/Zt+l4pscJhtLph1n4vypG38NXbYeh
         QbcvuIQl0b1K29lcNPaMcg/1E8COvx+KIfDgQKmJvRGL5non2g2B1ty4qEdf3wj2+/LR
         cpBBKGsgxGQOb/WOY5r3f/zDM7PCS4/ee+i+UkPSuysNZBE07e6LsRPBI9J0/AyqCOF7
         BybiXythC4VjDNeMMqKG/aKIFiltAPRUtM9PBz/JgiPD5oTqgr4mSiGhZw/ffbLaROO/
         Vajy399o+0a2Lz2D05ifMaY/nTjWiOmbZ/j+2yyulrbmGknilMd2/jTmE4fFaV5WQ8wL
         rsuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rooj1wm/vVEK2tVmYUP5jTSPa8/I0KZytAk8o/vZCydI6vZS1AUdVDkfAfQSH/RyHLVz7On9r5/ggqtmEkj77RfFA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3qkbbGPO1mm6V2apSbS891VVS5oKdloU67G6LGIfx7D1WSBcI
	yiwZnPJeoQMnlxOsLaLMwqQmkY92KlPnWSZ+e8PgEX+a+v3W77V28bvoXBnNUXfxESg=
X-Gm-Gg: AR+sD10Es2qkNtjAGesGFc5qhPG/ibVFKUqUmHlWO7Q4WqK4ouvur8lf7LmKop/B4DM
	uNk+TEsUC6vsaSpV1tWaUAeZQhtWC8kN+40nB8c1Hil2UUKirLbScIdcNubdBvExja9o1/OfWis
	RqqhwsVUrZubEWPyVf96sGvrns/1pvvlP/hio7oVr/yZQvRsYwXnPT3lF84fcr0srmZLh9Lwape
	NfAGw+odvJhTbv+Jj9PUTFeOrK8L0BrQogWkTD8cFnzlzTNdkNFsiswF+j21SCjQiNHU8KKOyK9
	leC8bog5ogp11ifPHAUsahYAJydI2jcG5m/dFhYFZm+Yw+HdgNnIx4Br/Cgr3eqsESKih2cpN7L
	TXp0bSN2oLPDXAzKW7rtfio7e8rYFPy647U6OCEHM/ecYjenyaGT5qEb6Dc6pCHew/8qIdFKpaj
	VPuPge/V56ycxxyx/az5B/Z9FqSPHnqL2PnPuhe1itQTMIKntQxdqFjkm5kv2Yy4tSj5sxTXU58
	mTy8TztQ161ro23NE1CDQdkCDXl942wSJNremwa2WQ6XEH7dZVBZw==
X-Received: by 2002:a05:6000:290a:b0:47f:9283:1fb3 with SMTP id ffacd0b85a97d-47fec478c10mr22190243f8f.0.1786013498070;
        Thu, 06 Aug 2026 03:51:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6? ([2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b25b4asm5230562f8f.26.2026.08.06.03.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:51:37 -0700 (PDT)
Message-ID: <0fd41cd1d660cc4d975a40e76a89debd613aef12.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] nfs-utils: upgrade 2.9.1 -> 2.9.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Thu, 06 Aug 2026 11:51:36 +0100
In-Reply-To: <20260805162550.13442-1-jaipaul.cheernam@est.tech>
References: <20260805162550.13442-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 10:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242926

On Wed, 2026-08-05 at 18:25 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> ChangeLog: https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.2/2.9.2-C=
hangelog
>=20
> Add 0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch to
> fix link failure when building with --disable-nfsdctl:
>=20
> =C2=A0 ld: exportfs-exportfs.o: in function 'unexportfs_parsed':
> =C2=A0 exportfs.c:491: undefined reference to 'nfsd_nl_cmd_str'
>=20
> HAVE_NFSD_NETLINK is defined unconditionally in configure.ac, but the
> implementation (nfsdnl.c) is only compiled under CONFIG_NFSDCTL. Move
> the AC_DEFINE inside the enable_nfsdctl conditional so the feature
> gating is consistent. Reported to linux-nfs@vger.kernel.org.
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> =C2=A0..._key_file.c-Fix-build-error-for-musl.patch |=C2=A0 9 ++--
> =C2=A0.../0004-Use-nogroup-for-nobody-group.patch=C2=A0=C2=A0 |=C2=A0 6 +=
--
> =C2=A0.../0005-find-OE-provided-Kerberos.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 +-
> =C2=A0...e-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch | 47 ++++++++++++++++=
+++
> =C2=A0...{nfs-utils_2.9.1.bb =3D> nfs-utils_2.9.2.bb} |=C2=A0 3 +-
> =C2=A05 files changed, 57 insertions(+), 12 deletions(-)
> =C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/00=
06-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
> =C2=A0rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.9.1.bb =3D>=
 nfs-utils_2.9.2.bb} (97%)
>=20
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_fi=
le.c-Fix-build-error-for-musl.patch b/meta/recipes-connectivity/nfs-utils/n=
fs-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch
> index d6db1fe0c0..d5843d5295 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fi=
x-build-error-for-musl.patch
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fi=
x-build-error-for-musl.patch
> @@ -1,4 +1,4 @@
> -From 98048fd9262b3e4e024248ebd07d5ff66175e4ec Mon Sep 17 00:00:00 2001
> +From 48eed3ed46893ce435cff271bbc58f243f9bc1cf Mon Sep 17 00:00:00 2001
> =C2=A0From: Robert Yang <liezhi.yang@windriver.com>
> =C2=A0Date: Thu, 7 May 2026 03:32:57 -0700
> =C2=A0Subject: [PATCH] fh_key_file.c: Fix build error with musl
> @@ -14,10 +14,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com=
>
> =C2=A0 1 file changed, 2 insertions(+)
> =C2=A0
> =C2=A0diff --git a/support/nfs/fh_key_file.c b/support/nfs/fh_key_file.c
> -index 5f5eafc..89555ce 100644
> +index 81ea150..947abcb 100644
> =C2=A0--- a/support/nfs/fh_key_file.c
> =C2=A0+++ b/support/nfs/fh_key_file.c
> -@@ -30,6 +30,8 @@
> +@@ -31,6 +31,8 @@
> =C2=A0=20
> =C2=A0 #include "nfslib.h"
> =C2=A0=20
> @@ -26,6 +26,3 @@ index 5f5eafc..89555ce 100644
> =C2=A0 #define HASH_BLOCKSIZE=C2=A0 256
> =C2=A0 int hash_fh_key_file(const char *fh_key_file, uuid_t uuid)
> =C2=A0 {
> ---=20
> -2.49.0
> -
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogro=
up-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0=
004-Use-nogroup-for-nobody-group.patch
> index bbf44d5977..7e63cb6282 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-=
nobody-group.patch
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-=
nobody-group.patch
> @@ -1,4 +1,4 @@
> -From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
> +From 5f4739475f3c01145174734ed8a3b31b3da99b77 Mon Sep 17 00:00:00 2001
> =C2=A0From: Daniel McGregor <daniel.mcgregor@vecima.com>
> =C2=A0Date: Tue, 6 Jun 2023 16:07:53 -0600
> =C2=A0Subject: [PATCH] Use "nogroup" for nobody group
> @@ -11,7 +11,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.=
com>
> =C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)
> =C2=A0
> =C2=A0diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd=
.conf
> -index 2a2f79a1..e6f3724f 100644
> +index 2a2f79a..e6f3724 100644
> =C2=A0--- a/support/nfsidmap/idmapd.conf
> =C2=A0+++ b/support/nfsidmap/idmapd.conf
> =C2=A0@@ -41,7 +41,7 @@
> @@ -24,7 +24,7 @@ index 2a2f79a1..e6f3724f 100644
> =C2=A0 [Translation]
> =C2=A0=20
> =C2=A0diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
> -index cd9a965f..3be805e9 100644
> +index 5231f56..e1aa8a5 100644
> =C2=A0--- a/utils/idmapd/idmapd.c
> =C2=A0+++ b/utils/idmapd/idmapd.c
> =C2=A0@@ -89,7 +89,7 @@
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-p=
rovided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005=
-find-OE-provided-Kerberos.patch
> index 3241e8e859..bb152c2754 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided=
-Kerberos.patch
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided=
-Kerberos.patch
> @@ -1,4 +1,4 @@
> -From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
> +From a1759d9079a436096be5ce44622a3a5a85ec9faa Mon Sep 17 00:00:00 2001
> =C2=A0From: Daniel McGregor <daniel.mcgregor@vecima.com>
> =C2=A0Date: Wed, 8 Nov 2023 16:24:20 -0600
> =C2=A0Subject: [PATCH] find OE provided Kerberos
> @@ -10,7 +10,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.=
com>
> =C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)
> =C2=A0
> =C2=A0diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
> -index f96f0fd4..ad85fdf2 100644
> +index f96f0fd..ad85fdf 100644
> =C2=A0--- a/aclocal/kerberos5.m4
> =C2=A0+++ b/aclocal/kerberos5.m4
> =C2=A0@@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-configure=
.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch b/meta/recipes-connectivi=
ty/nfs-utils/nfs-utils/0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-n=
fsdct.patch
> new file mode 100644
> index 0000000000..d15ea1ac5d
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-configure.ac-gat=
e-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
> @@ -0,0 +1,47 @@
> +From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +Date: Wed, 5 Aug 2026 06:55:00 +0000
> +Subject: [PATCH] configure.ac: gate HAVE_NFSD_NETLINK on --enable-nfsdct=
l
> +
> +HAVE_NFSD_NETLINK is currently defined unconditionally, but the
> +implementation of nfsd_nl_cmd_str() in support/nfs/nfsdnl.c is only
> +compiled into libnfs when CONFIG_NFSDCTL is true (--enable-nfsdctl).
> +
> +This causes a link failure when building with --disable-nfsdctl:
> +
> +=C2=A0 ld: exportfs-exportfs.o: in function `unexportfs_parsed':
> +=C2=A0 exportfs.c:491: undefined reference to `nfsd_nl_cmd_str'
> +
> +The callers (exportfs.c) guard their usage with #ifdef HAVE_NFSD_NETLINK=
,
> +and nfsdnl.h provides a static inline stub returning -ENOSYS when the
> +macro is not defined.=C2=A0 So the correct fix is to only define
> +HAVE_NFSD_NETLINK when --enable-nfsdctl is in effect, keeping netlink
> +support as an opt-in feature consistent with the CONFIG_NFSDCTL guard
> +on nfsdnl.c.
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/9fec9f1b-1=
c10-4a20-8282-dfc9addb4ee8@est.tech/T/#u]
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -256,8 +256,6 @@
> + PKG_CHECK_MODULES(LIBNLGENL3, libnl-genl-3.0 >=3D 3.1)
> +=20
> + AC_CHECK_HEADERS(linux/nfsd_netlink.h)
> +-AC_DEFINE([HAVE_NFSD_NETLINK], 1,
> +-	=C2=A0 [Define to 1 if nfsd generic netlink support is available])
> +=20
> + # ensure the system netlink headers have the latest features
> + AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <linux/nfsd_netlink.h>]],
> +@@ -279,6 +277,8 @@
> +=C2=A0	enable_nfsdctl=3D"yes")
> +=C2=A0	AM_CONDITIONAL(CONFIG_NFSDCTL, [test "$enable_nfsdctl" =3D "yes" =
])
> +=C2=A0	if test "$enable_nfsdctl" =3D yes; then
> ++		AC_DEFINE([HAVE_NFSD_NETLINK], 1,
> ++			=C2=A0 [Define to 1 if nfsd generic netlink support is available])
> +=C2=A0		PKG_CHECK_MODULES(LIBREADLINE, readline)
> +=C2=A0	fi
> +=20
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
> similarity index 97%
> rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
> rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
> index 06e4fcb6e0..adcc606ad3 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
> @@ -24,9 +24,10 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-utils=
/${PV}/nfs-utils-${PV}.tar.x
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0004-Use-nogroup-for-nobody-group.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0005-find-OE-provided-Kerberos.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-fh_key_file.c-Fix-build-error-for-musl.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0006=
-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> -SRC_URI[sha256sum] =3D "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a=
9082279d13b21a2c"
> +SRC_URI[sha256sum] =3D "e1dd8a9c95af15492065942cc3b52b1339ffd586baa2280e=
d86c9d3dc4097e8c"
> =C2=A0
> =C2=A0# Only kernel-module-nfsd is required here (but can be built-in)=C2=
=A0 - the nfsd module will
> =C2=A0# pull in the remainder of the dependencies.

This breaks on musl:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/3052

(and other musl builds as far as I can tell)

Cheers,

Richard

