Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC6960107
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 14:46:17 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id v186so130093893lfa.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 06:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ATpcqLx07f14h8/Oy/HJwz9lyGaH5iQMgK1puHuYPDA=;
	b=y9hYXEuNWZMbtiP5ll9rbEWmzo5Osn2BFq2XFOFraYkBV9R/jcJI26ZCokwIj8nf5m
	zwZbSgjUVpX3qSeKetwl2ZAIzaiNCeAZAwMdMNdzzqrDZKJK4Qk81RjCqCZstQwfEaCw
	RpQRnALmZ/naktBC98lGGaCZygDuQtbFX8x/VkmbwiGgGmCRAE9I5cQaCpJ4DBw2G0Mj
	DPqHirsJel6eoAUj2utcLpEEx7UQ4culBtnDZ2gz61BF9sE0rzQgJajSXm2T1i3VHKLv
	qklLhRk3mVqiGS5NDOy0su2e+6QuPtahg4IU4PfqowTQBGTi+/a04icQ7ehi8SLR/lr1
	jbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ATpcqLx07f14h8/Oy/HJwz9lyGaH5iQMgK1puHuYPDA=;
	b=MLM4dsNdte+tor2nPs2ZLr39BthqYWoWog/uduyogUfJd7BZN/HzqrC3vcnxrGHl/Q
	jNRKeilEFCC4Z7eGLbwwo5rbLwk8WcPyMqiq8ogEhN1ZHQGn+OHqK+CF31NxwDPRuJ+y
	f2rSeG7ee4lhS07GIKXEQAeV5Z/QYJm6SSgOfvQwM2LcqEA6Nj3x+AVRZ+J7LvmabJYv
	Ng2BKKYQ1tAYnzahnSauDY5YVqjH3dbT1OLpFJL5Ove4r0wQs4/VRfoAS0ZQHaFBGIZJ
	sb7IEWc2YacY1YVPCtuw7im47g4MyOJizFvX0rLqwl/C78WYLD8bcp1VHVcMTko57qpz
	0pPw==
X-Gm-Message-State: AIkVDXLdAngm07dapeC0g2dsfC93T40VuVEzLQqIW1zJhD2m5OzXeifRtGxnQmIUzWSa9w==
X-Received: by 10.25.66.70 with SMTP id p67mr10984996lfa.99.1485355577419;
	Wed, 25 Jan 2017 06:46:17 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	70sm153933lfq.14.2017.01.25.06.46.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 06:46:16 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: Openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 25 Jan 2017 15:46:15 +0100
Message-Id: <1485355575-31836-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485355129.17309.0.camel@linuxfoundation.org>
References: <1485355129.17309.0.camel@linuxfoundation.org>
Subject: [PATCH] sstate: Make SSTATE_SCAN_CMD vars configurable using weak defaults.
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
X-List-Received-Date: Wed, 25 Jan 2017 14:46:18 -0000

For this we move them out of the python section so they can be
overridden on a per-recipe basis.

The motivation for this change is that not all tool chains need the
path modifications provided by the command, and these will provide
alternative or empty commands. The Go compiler is such an example.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/classes/cross.bbclass    | 4 ++++
 meta/classes/crosssdk.bbclass | 4 ++++
 meta/classes/native.bbclass   | 4 ++++
 meta/classes/sstate.bbclass   | 9 ++-------
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index d125f10..4985f89 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -38,6 +38,10 @@ TOOLCHAIN_OPTIONS = ""
 
 DEPENDS_GETTEXT = "gettext-native"
 
+# This class encodes staging paths into its scripts data so can only be
+# reused if we manipulate the paths.
+SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
+
 # Path mangling needed by the cross packaging
 # Note that we use := here to ensure that libdir and includedir are
 # target paths.
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index c5c29ea..a5ffd97 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -10,6 +10,10 @@ python () {
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
+# This class encodes staging paths into its scripts data so can only be
+# reused if we manipulate the paths.
+SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
+
 TARGET_ARCH = "${SDK_ARCH}"
 TARGET_VENDOR = "${SDK_VENDOR}"
 TARGET_OS = "${SDK_OS}"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 4d4aaad..ec91fc3 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -115,6 +115,10 @@ MACHINEOVERRIDES = ""
 
 PATH_prepend = "${COREBASE}/scripts/native-intercept:"
 
+# This class encodes staging paths into its scripts data so can only be
+# reused if we manipulate the paths.
+SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
+
 python native_virtclass_handler () {
     classextend = e.data.getVar('BBCLASSEXTEND') or ""
     if "native" not in classextend:
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a767a02..5f4ef76 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -34,7 +34,8 @@ SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}"
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR}/sdk/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt"
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
-SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
+SSTATE_SCAN_CMD ??= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
+SSTATE_SCAN_CMD_NATIVE ??= 'grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE_SYSROOT_NATIVE} ${SSTATE_BUILDDIR}'
 
 BB_HASHFILENAME = "False ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
@@ -94,12 +95,6 @@ python () {
         d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}")
         d.setVar('SSTATE_EXTRAPATHWILDCARD', "*/")
 
-    # These classes encode staging paths into their scripts data so can only be
-    # reused if we manipulate the paths
-    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('crosssdk', d):
-        scan_cmd = "grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE_SYSROOT_NATIVE} ${SSTATE_BUILDDIR}"
-        d.setVar('SSTATE_SCAN_CMD', scan_cmd)
-
     unique_tasks = sorted(set((d.getVar('SSTATETASKS') or "").split()))
     d.setVar('SSTATETASKS', " ".join(unique_tasks))
     for task in unique_tasks:
-- 
2.7.4


