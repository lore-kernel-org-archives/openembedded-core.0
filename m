Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5E53972DFF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:49 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id fa1so10798378pad.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Vt80nUyL36rsY2l62/aOsGjpnxlBaOTTyYAUEgesIAA=;
	b=ize2T1xF6YSlRkb80keemAG1uX8YmBNb8EJNiRlmpuHwzLv1Z2yBVD/PKT17JHFSxm
	XwceshVOn6ANKsClrYuxXxFbxW4zYr0S4LBABa5Q953UgcElXmSITCcaVFv/S0zCjivl
	D1DGUshobWfQetRRSfl3ifZnY9b0j+x4LnlqLJblWelBFoH+2M3O9b7cLqJz3sYzB6MQ
	Z96K67FpTyOdRojX754OQWy5Es4pOBioM5jhEGreUuUuJzX8U4qkhv7VnsDSLKbXLYyr
	2LaKmguVrOAJTpVCB+GD/ULZrw1G5KBs+snliVGI0p67AV07aVj8TKmHToCPGlgAG9x3
	O0qw==
X-Received: by 10.66.156.229 with SMTP id wh5mr6579781pab.119.1423152291284;
	Thu, 05 Feb 2015 08:04:51 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:27 -0800
Message-Id: <5e8a7497baedcb4cdda5e10192e2d2422cd8863f.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 19/61] cross-canadian/meta-environment: Allow modification of TARGET_OS to be optional
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:51 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are some cases we want the manipulation cross-canadian performance
on TARGET_OS, there are also cases like meta-environment where we do not
want this manipulation.

We did try and use immediate expansion to avoid this problem and it
works in the non multilib case. If we have a multilib that used an
extension, like for example:

require conf/multilib.conf
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE = "mips32r2"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips64-n32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"

then the n32 extension case will be misconfigured.

It turns out saving an unexpanded variable is hard. The best I could
come up with was:

SAVEDTOS := "${@d.getVar('TARGET_OS', False).replace("{", "*")}"

and then

localdata.setVar("TARGET_OS", d.getVar("SAVEDOS", False).replace('*','{'))

which is rather evil, I'd challenge someone to come up with a nicer way
of making it work though!

Rather than the above madness, we modify cross-canadian to make the
problamtic code conditional.

This fixes the original issue (where a linux-gnuspe target was seeing
'linux') of
http://cgit.openembedded.org/openembedded-core/commit/?id=0038634ee6e2b6035c023a2702547f20f67c103a
but also fixes the multilib one.

(From OE-Core rev: 85ff3d6491c54aa712ed238c561742cda4f4ba07)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cross-canadian.bbclass        | 4 ++++
 meta/recipes-core/meta/meta-environment.bb | 5 ++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index fec6438..a8565e9 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -16,6 +16,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 CANADIANEXTRAOS = ""
+MODIFYTOS ??= "1"
 python () {
     archs = d.getVar('PACKAGE_ARCHS', True).split()
     sdkarchs = []
@@ -23,6 +24,9 @@ python () {
         sdkarchs.append(arch + '-${SDKPKGSUFFIX}')
     d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
 
+    # Allow the following code segment to be disabled, e.g. meta-environment
+    if d.getVar("MODIFYTOS", True) != "1":
+        return
     # PowerPC can build "linux" and "linux-gnuspe"
     tarch = d.getVar("TARGET_ARCH", True)
     if tarch == "powerpc":
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index bb208a3..90959b5 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -6,9 +6,9 @@ PR = "r8"
 
 EXCLUDE_FROM_WORLD = "1"
 
-ORIGOS := "${TARGET_OS}"
+MODIFYTOS = "0"
 
-REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${ORIGOS}"
+REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 inherit toolchain-scripts
 TOOLCHAIN_NEED_CONFIGSITE_CACHE += "zlib"
@@ -31,7 +31,6 @@ python do_generate_content() {
 
     # make sure we only use the SDKTARGETSYSROOT value from 'd'
     localdata.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT', True))
-    localdata.setVar('TARGET_OS', d.getVar('ORIGOS', True))
     localdata.setVar('libdir', d.getVar('target_libdir', False))
 
     # Process DEFAULTTUNE
-- 
1.9.1


