Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 273667386E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 21:36:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t22LahCO012110
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Mar 2015 13:36:43 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 2 Mar 2015 13:36:43 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 2 Mar 2015 16:36:39 -0500
Message-ID: <7117da7dcfe06bc7129f8dfdd4c25948b4dab128.1425331960.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1425331960.git.bruce.ashfield@windriver.com>
References: <cover.1425331960.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] kernel-yocto: inhibit BSP description warnings for custom linux-yocto kernels
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
X-List-Received-Date: Mon, 02 Mar 2015 21:36:46 -0000
Content-Type: text/plain

We don't require that a yocto custom kernel + defconfig have a full BSP
description (but of course it would be better if they did). Since this
isn't a requirement, we shouldn't alarm users by generating a BSP
description warning.

To implement this, we add a bsp audit level flag (like the one that
exists for kconfig audits), and only set it to activate in the versioned
linux-yocto recipes.

[YOCTO: #7370]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  | 13 +++++++------
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  1 +
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto.inc          |  1 +
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |  1 +
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      |  1 +
 7 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index c8d1e95df348..8db489964ed2 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -265,6 +265,7 @@ python do_kernel_configcheck() {
     ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
 
     config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
+    bsp_check_visibility = int(d.getVar( "KCONF_BSP_AUDIT_LEVEL", True ) or 0)
 
     # if config check visibility is non-zero, report dropped configuration values
     mismatch_file = "${S}/" + kmeta + "/" + "mismatch.cfg"
@@ -283,13 +284,13 @@ python do_kernel_configcheck() {
                 bb.warn( "[kernel config]: BSP specified non-hw configuration:\n\n%s" % results)
 
     bsp_desc = "${S}/" + kmeta + "/" + "top_tgt"
-    if os.path.exists(bsp_desc):
+    if os.path.exists(bsp_desc) and bsp_check_visibility > 1:
         with open (bsp_desc, "r") as myfile:
-                bsp_tgt = myfile.read()
-                m = re.match("^(.*)scratch.obj(.*)$", bsp_tgt)
-                if not m is None:
-                    bb.warn( "[kernel]: An auto generated BSP description was used, this normally indicates a misconfiguration.\n" +
-                             "Check that your machine (%s) has an associated kernel description." % "${MACHINE}" )
+            bsp_tgt = myfile.read()
+            m = re.match("^(.*)scratch.obj(.*)$", bsp_tgt)
+            if not m is None:
+                bb.warn( "[kernel]: An auto generated BSP description was used, this normally indicates a misconfiguration.\n" +
+                         "Check that your machine (%s) has an associated kernel description." % "${MACHINE}" )
 }
 
 # Ensure that the branches (BSP and meta) are on the locations specified by
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 8e2189654bc5..bd61c4a927c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -14,6 +14,7 @@ LINUX_VERSION ?= "3.14.29"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index db9ad738c3ab..d110297246c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -7,6 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_VERSION ?= "3.14.29"
 
 KMETA = "meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "f65678ef48c5d41af914d2769e4dd01411c1df96"
 SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index 1997e30a2589..d10449aab365 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -7,6 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_VERSION ?= "3.19"
 
 KMETA = "meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "43b9eced9ba8a57add36af07736344dcc383f711"
 SRCREV_meta ?= "f7a81274b461d0c748964d75c24bea8574d350fb"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 79b3f256f4bc..c62f8ca97de4 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -28,6 +28,7 @@ SRCREV_FORMAT ?= "meta_machine"
 #   1: report options that are specified, but not in the final config
 #   2: report options that are not hardware related, but set by a BSP
 KCONF_AUDIT_LEVEL ?= "1"
+KCONF_BSP_AUDIT_LEVEL ?= "0"
 
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index ac0143089795..9cdd3eea0d5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -28,6 +28,7 @@ LINUX_VERSION ?= "3.14.29"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
 
 COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index f856d19f938f..f1bf3bea9016 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -28,6 +28,7 @@ LINUX_VERSION ?= "3.19"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
 
 COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
-- 
2.1.0


