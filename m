Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FC9CDE000
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 23:21:28 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.456.1782343283971257090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 16:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rbBrLb0k;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30c6c8d7503so3518283eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 16:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782343283; x=1782948083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBnpEqdCI+R9mjPybjK7k4HNKiig5pvIvx9XhGLKbPQ=;
        b=rbBrLb0kxF/ZHhP9eA9wLIC8eOI+bP7ttBEYBBIuikymfV4JGUmSppgG8LWDwyf7xD
         2uUQRdj+LhrSzGvKIOYaiMPBFulkvqZeC1NzWyO9gefIklEwld29XrLbaRDflqDNIBgS
         a8YL0A7blRHEKfb36yKcBQC34Q4ZbOPJdgOfpkWJ3E8dEfXpf7SiQidSMA8djQpaoS0k
         ep/P+yRu7t4uAQd7umCSq0ZnQzbY+5NFKHPib9DD9DSIlOoFnM6qs/XBsynkFfkPkfF5
         Vbh0AiONGlhDI+O7owmTuOXKYcKID0SdXPkxY9MK69zCtICWrK+MnxBgV0s7tba2ciNA
         +2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782343283; x=1782948083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBnpEqdCI+R9mjPybjK7k4HNKiig5pvIvx9XhGLKbPQ=;
        b=br38yKPVZH19f2FVDDdZ7AVooXzJj5qKyrwx0YNC8kBv2AQcnPYeLia/Bf8bT2+yAb
         rI70d+otvWOiJy1ZstrCCu4zFA0vz7H/XkZxPeUJtOenPNFPQm8VhCPns88G5R4dS7I8
         NeED7QL50KX4g79MYTQECouqHY/2LjYaij1pC1B3vV3i3TfZURKmZsGHVkouaXjSu4x4
         M5er3kpO+YKKZWMwuKR/Cn2nrvqd6OiSQCiTqH4zVdv/BOpMj6Rv5E1WjgFITv4qQSXx
         pwhRDkdSlgOVIwdGpLEzb/rQWGu/KzOvZbpS5eBwfc5/17Ud/vIE7wE3UEPop0cEwOot
         CBRw==
X-Gm-Message-State: AOJu0Yyda9ckoX6Fe0AHeI+LmksGlU6kiO98TUQJsnn/gSGdugafnrHG
	wsNkcN1qmACG2gCDkEqqRzqVNooh+z1BP1F2QKD+i8CuVvKHejFEp6m7HhS1ZBNkJ04=
X-Gm-Gg: AfdE7ckeOO4MFKe7PJqDWK1bGET45XOxPshSKQGMMCBfi/7z5S6E8BQYX3qFiC/x8hc
	Z+CcTQ6RmzxLjklHIo6bGhmoRTpdVpMmO23ZdYpprmbfpC30rTScy9oUD+9SvtjgGu4P+j0pENe
	yN2sDN/KWza2QVFq2jUWD/+k4mCYjPCgat73oyHyBHeTrmj/dlTYP1V4u1OdTNLD3M1NbczVk4P
	9cXSt9yhS8VWItbYC+0IgiC+CT9wlWi/sKs0rJWeylJkqAd3Fqy/4s3Ve5DS5hc5vxvRVmMHLt+
	8+A+QYLoht3zEjF2nWjmdgKNiWITC5CHbsIqjg6V85ULA5zmGv8lx1HNpwagwg/2UD3MJgYzZM+
	2lLmjxdT5XLKwEjmKJYILtGnNxiIhVNjHxOnvECFxQCfsryxWmdbtmzeaDA+Z74LD5O62DqqoOX
	zzg0oOEtd6KB59h3CvDKRYWwYgWACZcXx5pmWF7Kl+rOKMdxX2KThTmPtg0flh++lQwrd6chfQ2
	RiCdRcf3qEbJDsez/62PufyQf4dsa7jE2oNGdmPkSvj3sJp0YaCbVJhDVCAw0Thf5Epi9wPkCGF
	8sGH54odEA90SM+IpJZpAi58d3cWfw==
X-Received: by 2002:a05:7300:80cf:b0:30c:52c5:6e3f with SMTP id 5a478bee46e88-30c84fa60aemr233031eec.18.1782343283001;
        Wed, 24 Jun 2026 16:21:23 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c664sm2248632eec.8.2026.06.24.16.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 16:21:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] jansson: Fix build with lld linker
Date: Wed, 24 Jun 2026 16:21:19 -0700
Message-ID: <20260624232119.1501995-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 23:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239533

jansson hard-codes -Wl,--default-symver on glibc, which ld.lld does not
understand. Probe the linker for the option before using it so the recipe
builds with the clang/lld toolchain as well as GNU ld.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...se-default-symver-when-the-linker-su.patch | 45 +++++++++++++++++++
 .../jansson/jansson_2.15.0.bb                 |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch

diff --git a/meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch b/meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch
new file mode 100644
index 0000000000..eb0c459f68
--- /dev/null
+++ b/meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch
@@ -0,0 +1,45 @@
+From 7c44ab421c725ea6fed358f435c5461c0096f852 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Jun 2026 14:04:19 -0700
+Subject: [PATCH] configure: only use --default-symver when the linker supports
+ it
+
+jansson enables symbol versioning on glibc by passing
+-Wl,--default-symver to the linker. This is a GNU ld option which is
+not understood by every linker, e.g. ld.lld errors out with:
+
+  ld.lld: error: unknown argument '--default-symver'
+
+Probe the linker with a link test before adding the flag so the build
+works with both GNU ld and lld. When the linker does not accept the
+option the symbol versioning provided by the explicit version script
+is still applied; only the implicit default version is dropped.
+
+Upstream-Status: Submitted [https://github.com/akheron/jansson/pull/744]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e5c126a..1bb8b34 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -135,7 +135,16 @@ AC_SUBST(JSON_BSYMBOLIC_LDFLAGS)
+
+ # Enable symbol versioning on GNU libc
+ JSON_SYMVER_LDFLAGS=
+-AC_CHECK_DECL([__GLIBC__], [JSON_SYMVER_LDFLAGS=-Wl,--default-symver])
++AC_CHECK_DECL([__GLIBC__], [
++    saved_LDFLAGS="$LDFLAGS"
++    LDFLAGS="$LDFLAGS -Wl,--default-symver"
++    AC_MSG_CHECKING([whether the linker accepts -Wl,--default-symver])
++    AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
++        [AC_MSG_RESULT([yes])
++         JSON_SYMVER_LDFLAGS=-Wl,--default-symver],
++        [AC_MSG_RESULT([no])])
++    LDFLAGS="$saved_LDFLAGS"
++])
+ AC_SUBST([JSON_SYMVER_LDFLAGS])
+
+ AC_ARG_ENABLE([dtoa],
diff --git a/meta/recipes-extended/jansson/jansson_2.15.0.bb b/meta/recipes-extended/jansson/jansson_2.15.0.bb
index fda7a54ed8..1a0b6f24ac 100644
--- a/meta/recipes-extended/jansson/jansson_2.15.0.bb
+++ b/meta/recipes-extended/jansson/jansson_2.15.0.bb
@@ -5,7 +5,9 @@ LICENSE = "MIT & dtoa"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9911525d4128bee234ee2d3ccaa2537"
 
 GITHUB_BASE_URI = "https://github.com/akheron/jansson/releases"
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
+           file://0001-configure-only-use-default-symver-when-the-linker-su.patch \
+		  "
 
 SRC_URI[sha256sum] = "070a629590723228dc3b744ae90e965a569efb9c535b3309b52e80e75d8eb3be"
 

