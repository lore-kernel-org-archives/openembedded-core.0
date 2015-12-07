Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D416601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 21:36:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB7LaCfj015367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Dec 2015 13:36:13 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 7 Dec 2015 13:36:12 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Dec 2015 15:36:11 -0600
Message-ID: <1449524171-2835-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] cross-canadian.bbclass: Add BASECANADIANEXTRAOS to specify main extraos
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
X-List-Received-Date: Mon, 07 Dec 2015 21:36:13 -0000
Content-Type: text/plain

By default the system will expand the extra os entries for uclibc and musl
even if they are not enabled in the build.  There was no way to prevent this
behavior while still getting the expansion for things like x32 or spe.

The change adds a new setting which a distribution creator can override
easily, setting the base set of canadianextraos components.  The other
expansions are then based on this setting.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/cross-canadian.bbclass | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index ea17f09..799844b 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -15,7 +15,8 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
-CANADIANEXTRAOS = "linux-uclibc linux-musl"
+BASECANADIANEXTRAOS ?= "linux-uclibc linux-musl"
+CANADIANEXTRAOS = "${BASECANADIANEXTRAOS}"
 CANADIANEXTRAVENDOR = ""
 MODIFYTOS ??= "1"
 python () {
@@ -34,8 +35,13 @@ python () {
 
     tos = d.getVar("TARGET_OS", True)
     whitelist = []
+    extralibcs = [""]
+    if "uclibc" in d.getVar("BASECANADIANEXTRAOS", True):
+        extralibcs.append("uclibc")
+    if "musl" in d.getVar("BASECANADIANEXTRAOS", True):
+        extralibcs.append("musl")
     for variant in ["", "spe", "x32", "eabi", "n32"]:
-        for libc in ["", "uclibc", "musl"]:
+        for libc in extralibcs:
             entry = "linux"
             if variant and libc:
                 entry = entry + "-" + libc + variant
@@ -59,14 +65,20 @@ python () {
     if tarch == "x86_64":
         d.setVar("LIBCEXTENSION", "")
         d.setVar("ABIEXTENSION", "")
-        d.appendVar("CANADIANEXTRAOS", " linux-gnux32 linux-uclibcx32 linux-muslx32")
+        d.appendVar("CANADIANEXTRAOS", " linux-gnux32")
+        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
+            d.appendVar("CANADIANEXTRAOS", " " + extraos + "x32")
     elif tarch == "powerpc":
         # PowerPC can build "linux" and "linux-gnuspe"
         d.setVar("LIBCEXTENSION", "")
         d.setVar("ABIEXTENSION", "")
-        d.appendVar("CANADIANEXTRAOS", " linux-gnuspe linux-uclibcspe linux-muslspe")
+        d.appendVar("CANADIANEXTRAOS", " linux-gnuspe")
+        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
+            d.appendVar("CANADIANEXTRAOS", " " + extraos + "spe")
     elif tarch == "mips64":
-        d.appendVar("CANADIANEXTRAOS", " linux-gnun32 linux-uclibcn32 linux-musln32")
+        d.appendVar("CANADIANEXTRAOS", " linux-gnun32")
+        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
+            d.appendVar("CANADIANEXTRAOS", " " + extraos + "n32")
     if tarch == "arm" or tarch == "armeb":
         d.setVar("TARGET_OS", "linux-gnueabi")
     else:
-- 
1.9.3


