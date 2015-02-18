Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id EB67F6E614
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 14:40:38 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id k14so1573994wgh.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 06:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IACx+9YoYcHhflEBgZmwCMw3zWbKc2OD2L8yAtNA3f0=;
	b=rdTwYk/4LUvD5QuofHaZGtbH9wzOJyrw3I3dPrRAsTIQpvhpBE5EOw7CjBP8CceiRc
	VZDZbfAYUUZzYZqSliCGX08Cn6JtND/gJ1QCVfuhwxd5x4UrypLZ2w/7lNX6MtsTde7L
	ZyOy/DXQDK3YBrBailvvbq7IrGvXtOGuCcDz/HeRjawUJ2IrBgHvWheqgOh5FbqXjByQ
	M7rRrVfxMYYE4ymgO9cO+SpLw7wrRWNl+09F/OzqqILKjQkexjbXRNx4KNFqQMo3ICdF
	CIVD7Pu5QH+kHGVBVfdxRrqC9WmA6MhveAFXCAc3YrD9uhq7y9YKWi128JflWEWoPGjv
	BtcQ==
X-Received: by 10.194.185.68 with SMTP id fa4mr9443916wjc.111.1424270439051;
	Wed, 18 Feb 2015 06:40:39 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ka1sm32959924wjc.2.2015.02.18.06.40.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Feb 2015 06:40:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Feb 2015 15:40:35 +0100
Message-Id: <1424270435-8424-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <20150113210849.GC2478@jama>
References: <20150113210849.GC2478@jama>
Subject: [PATCHv2] feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb suffix
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
X-List-Received-Date: Wed, 18 Feb 2015 14:40:42 -0000

* this means that recipes with ARM_INSTRUCTION_SET explicitly changed
  to arm will be built in feed without thumb suffix, the same does apply
  for workdir, e.g. after "bitbake glib-2.0" you can see:

  tmp-glibc/work/armv5e-oe-linux-gnueabi:
  glib-2.0  glibc  glibc-initial

  tmp-glibc/work/armv5te-oe-linux-gnueabi:
  acl              db              gdk-pixbuf     kmod  ....

  and

  tmp-glibc/deploy/ipk:
  all  armv5e  armv5te  qemuarm

* feed config should be ok, because all default DEFAULTTUNEs always
  include "arm" variants of all supported PACKAGE_ARCHs

* for more details see
  http://lists.openembedded.org/pipermail/openembedded-core/2014-April/091960.html
  the toolchain path issues were resolved in 1.8

* add ARM_INSTRUCTION_SET = "arm" to glibc-collateral.inc and comment in
  glibc.inc to fix glibc-locale and glibc-scripts build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 ++-
 meta/recipes-core/glibc/glibc-collateral.inc        | 5 +++++
 meta/recipes-core/glibc/glibc.inc                   | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 0db5ec1..9746c7b 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -32,7 +32,8 @@ python () {
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
 OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
 
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d)}"
+# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
+ARMPKGSFX_THUMB .= "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar('ARM_M_OPT', True) == 'thumb' else ''}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index 85e06da..dfcebae 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -2,6 +2,11 @@ INHIBIT_DEFAULT_DEPS = "1"
 LICENSE = "GPLv2 & LGPLv2.1"
 HOMEPAGE = "http://www.gnu.org/software/libc/index.html"
 
+# This needs to match with glibc.inc, otherwise glibc-scripts and glibc-locale
+# will fail to find main glibc, for details see
+# http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
+ARM_INSTRUCTION_SET = "arm"
+
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 8aa78df..77947be 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -61,6 +61,9 @@ GLIBC_EXTRA_OECONF ?= ""
 GLIBC_EXTRA_OECONF_class-nativesdk = ""
 INHIBIT_DEFAULT_DEPS = "1"
 
+# This needs to match with glibc-collateral.inc, otherwise glibc-scripts and glibc-locale
+# will fail to find main glibc, for details see
+# http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
 ARM_INSTRUCTION_SET = "arm"
 
 # glibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
-- 
2.3.0


