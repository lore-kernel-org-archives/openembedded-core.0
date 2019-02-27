Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id A832B7C875
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 21:30:01 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q17so8607274pfh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 13:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vQkDBUo+qndBtKDNpMMh9Aoxi7Rhs2uchng7JXJfmaw=;
	b=CYEhSsDJV9iN2HAtEY0gw+pqr/Z6SE+/SducuzHooMfLy+t/rfO3rtj0fuYifC6YSU
	sPUcJmVBdxeu201XefmK53Ta5h/pZxEhmm7qaFB7b4guFYu5QqbLnGX2hK+qjIbj36KH
	Kf7N8Bpa9jw6Dtxj3BSsvZUsXtcdcdnY4NiTVt3dK1wbW4XW9Ywg+m04B6sJ6ozyeh1v
	0BnHxlc3IkFGnn2ADLjog0dY3zmcKtLyBUyUyFqU75YPKAM+HdPeM2EnIsB5J988c0kJ
	tOTueDhsm4r2JIv8OlPv2N/vCw+q6hiPQ+n1W1gA7rz4n3lZamk3WYOKM0d9SIMVqLiX
	7fCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vQkDBUo+qndBtKDNpMMh9Aoxi7Rhs2uchng7JXJfmaw=;
	b=KMQ6LfKkSrAbsNqmZlxFtlrLVAlcbwE7mv119Imi5gJhteGB0D3ScjPOeRZC6bxt8t
	jWu5EpaNUOsBF2qxXVCiezvn+aprd9/bWwlhKPILl/RhWuZhzaQC6gIbT3tVtdJu0+7T
	ixCPWWLcgxRFFMaBScTwARg73/VCbCCHlhFukMZ5XoNEd8u0zpDhFTQ6KJd1dukKJEhJ
	FsBt3b3v1PeVPo7H54yLGQOu7wYNcdQ7/hj+Bd2bZ0edX0C0j0CVb9klfbtS57SU8zIW
	0MUU8lzwJJnN1G/NJ42rEbBe3l5d1A84ya5lV4tanTHqpgILrvgYfiuhIClHVl569fab
	0L/w==
X-Gm-Message-State: AHQUAub89E5F/th/C5oeA0cl20ZXUDmtNQ07/2a+AxajcsIJtxwwqWgw
	sdxLABalDEqu27YSQWebgHP+tnHo
X-Google-Smtp-Source: AHgI3IZrk+8+eaS77XRNY3p38gANMo15qlyK/qI6Hu6Yr/hb7wAdOoVI5c4D+Rf3+QvPrrlExQWVfA==
X-Received: by 2002:a63:1766:: with SMTP id 38mr1002765pgx.204.1551303002043; 
	Wed, 27 Feb 2019 13:30:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	p86sm39064748pfa.104.2019.02.27.13.30.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 13:30:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 13:29:51 -0800
Message-Id: <20190227212951.39714-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] glibc: Move common bits to gcc-common.inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2019 21:30:01 -0000
Content-Transfer-Encoding: 8bit

We have been duplicating few variables in glibc recipes which could
actually be defined once, therefore move them to gcc-common.inc which is
included by all glibc family of recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-collateral.inc | 18 +++---------------
 meta/recipes-core/glibc/glibc-common.inc     | 14 ++++++++++++++
 meta/recipes-core/glibc/glibc.inc            |  8 --------
 meta/recipes-core/glibc/glibc_2.29.bb        |  5 -----
 4 files changed, 17 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index 3379270566..52880791a7 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -1,15 +1,7 @@
-INHIBIT_DEFAULT_DEPS = "1"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
-                     file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
-HOMEPAGE = "http://www.gnu.org/software/libc/index.html"
+require glibc-common.inc
 
-# This needs to match with glibc.inc, otherwise glibc-scripts and glibc-locale
-# will fail to find main glibc, for details see
-# http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
-ARM_INSTRUCTION_SET_armv6 = "arm"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+                     file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
 
 deltask do_fetch
 deltask do_unpack
@@ -18,7 +10,3 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
 do_install[depends] += "virtual/${MLPREFIX}libc:do_stash_locale"
-
-COMPATIBLE_HOST_libc-musl_class-target = "null"
-
-PV = "2.29"
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index b05e162f88..cded384592 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -7,4 +7,18 @@ LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
+
 CVE_PRODUCT = "glibc"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
+#
+# We will skip parsing glibc when target system C library selection is not glibc
+# this helps in easing out parsing for non-glibc system libraries
+#
+COMPATIBLE_HOST_libc-musl_class-target = "null"
+
+PV = "2.29"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index a382a22b73..252fd56c13 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -25,14 +25,6 @@ CACHED_CONFIGUREVARS_append_mipsarch = " libc_cv_ld_gnu_indirect_function=no"
 
 GLIBC_EXTRA_OECONF ?= ""
 GLIBC_EXTRA_OECONF_class-nativesdk = ""
-INHIBIT_DEFAULT_DEPS = "1"
-
-# This needs to match with glibc-collateral.inc, otherwise glibc-scripts and glibc-locale
-# will fail to find main glibc, for details see
-# http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
-ARM_INSTRUCTION_SET_armv6 = "arm"
 
 # glibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
 # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index 9b6fab066b..4577350eae 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -69,11 +69,6 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
 
 GLIBC_BROKEN_LOCALES = ""
-#
-# We will skip parsing glibc when target system C library selection is not glibc
-# this helps in easing out parsing for non-glibc system libraries
-#
-COMPATIBLE_HOST_libc-musl_class-target = "null"
 
 GLIBCPIE ??= ""
 
-- 
2.21.0


