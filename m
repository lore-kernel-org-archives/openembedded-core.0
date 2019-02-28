Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 166A17C7F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 00:37:35 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id q206so8790292pgq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 16:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l1KYIip2efgXiw0fcJV5mZyUZF3v21PWJI+1zJl+68U=;
	b=FY6aXN7EGBV/aeBJayyexVinuBxJKnwh9oMC6HdYNxDSvAhn/t5ypIb2fGhHdXUywy
	l+AB4r/EYfWh9dWIItWQem1MltMI3ZHRk+woM3A41M6XPh7uXJmNOz1LPkVwuN5WfMRU
	p79z0/rQW91fVSuh/QQ6CoOqupgADBzwejwKviYBa8pR8N8u6llc/1cJ5OAPVn+x1Z4B
	q36Y3lxQkDsZWPWtgsG3SB4QHiMW43P3kUKtVX4T5p8IGACAgH2mmk1yYv3cz1ky0ZsU
	x+Q7V1/dWq7emndJTzCLmCPYLDNLV4g+bfz7PW/OijIN3foJHEL+zn2CwbWYGK+SIYFT
	Twaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l1KYIip2efgXiw0fcJV5mZyUZF3v21PWJI+1zJl+68U=;
	b=YSaYS2DNYNWBx5U8krQAu2rGEPlJY6DbzqsNKyZl3g8yiGpceM0ri4WTTk5zuK8tId
	JP+0B2Mh3wqjS+JlL50+Ibqn/ugOpQe1ZVk/OcRv7PyJ0IHEDhP1TSXIGAfOju/9sccZ
	kWMhgUAlx+DFzcnVQK+MOJUoRhdAHtRuWnllQyXpSY1CzniMeB4MVnJ7pdshJCDzsI26
	3+HQ6Z0ijgAEkC29Vw+8/qNKZTH6YskU9hn9z/WrxiPyW2jBI6KSuYHeCbC4r4Nkkn8j
	54/s6CmNA5jEQqsBctTwjAkt/LIIGjw9L1TEjwOXqDlnMnrmF0R3s/7mWyl8dz8CVsSB
	ckZw==
X-Gm-Message-State: AHQUAube7g4lWk/S6RH4pxOJpV9sIiFopLKkLRIzCPB62tZhTImUvIZi
	lVhToRc31FiSVz536p5o/hGtFjfq
X-Google-Smtp-Source: AHgI3IaPi7pWsGDkwpeVeXrNx84t73MenTWsSDADawpTj0av0TtJATZJKwy4mFBBR+O7NAmDHtyQWA==
X-Received: by 2002:a63:4287:: with SMTP id p129mr5518432pga.84.1551314256510; 
	Wed, 27 Feb 2019 16:37:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	h3sm19137769pgv.38.2019.02.27.16.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 16:37:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 16:37:24 -0800
Message-Id: <20190228003724.33791-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V2] glibc: Move common bits to glibc-common.inc
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
X-List-Received-Date: Thu, 28 Feb 2019 00:37:36 -0000
Content-Transfer-Encoding: 8bit

We have been duplicating few variables in glibc recipes which could
actually be defined once, therefore move them to glibc-common.inc which is
included by all glibc family of recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Correct typo gcc-common.inc -> glibc-common.inc in commit msg

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


