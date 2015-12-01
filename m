Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7B4605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:50:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 09:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,369,1444719600"; 
   d="scan'208";a="5628180"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2015 09:50:57 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 09:38:59 +0000
Message-Id: <dd7c072a108e9f38175604ba0d938f0381cdeecd.1448961756.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/6] wic: Prepare wicboot to allow custom bootloader config
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
X-List-Received-Date: Tue, 01 Dec 2015 17:50:56 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently wic does the bootloader configuration file on the fly.
This change introduce a configfile variable for the bootloader;
this is to have a user defined configuration file for the
bootloaders (grub, syslinux, and gummiboot). This is particular
useful when having a multiboot system or scripts embedded in the
configuration file.

[YOCTO #8728]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 scripts/lib/wic/kickstart/__init__.py                | 7 +++++++
 scripts/lib/wic/kickstart/custom_commands/wicboot.py | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
index c9b0e51..79b39fb 100644
--- a/scripts/lib/wic/kickstart/__init__.py
+++ b/scripts/lib/wic/kickstart/__init__.py
@@ -97,6 +97,13 @@ def get_timeout(kickstart, default=None):
         return default
     return int(kickstart.handler.bootloader.timeout)
 
+def get_bootloader_file(kickstart, default=None):
+    if not hasattr(kickstart.handler.bootloader, "configfile"):
+        return default
+    if kickstart.handler.bootloader.configfile is None:
+        return default
+    return kickstart.handler.bootloader.configfile
+
 def get_kernel_args(kickstart, default="ro rd.live.image"):
     if not hasattr(kickstart.handler.bootloader, "appendLine"):
         return default
diff --git a/scripts/lib/wic/kickstart/custom_commands/wicboot.py b/scripts/lib/wic/kickstart/custom_commands/wicboot.py
index a3e1852..eb17dab 100644
--- a/scripts/lib/wic/kickstart/custom_commands/wicboot.py
+++ b/scripts/lib/wic/kickstart/custom_commands/wicboot.py
@@ -35,6 +35,7 @@ class Wic_Bootloader(F8_Bootloader):
         self.menus = ""
         self.ptable = "msdos"
         self.source = ""
+        self.configfile = ""
 
     def _getArgsAsStr(self):
         retval = F8_Bootloader._getArgsAsStr(self)
@@ -45,6 +46,8 @@ class Wic_Bootloader(F8_Bootloader):
             retval += " --ptable=\"%s\"" %(self.ptable,)
         if self.source:
             retval += " --source=%s" % self.source
+        if self.configfile:
+            retval += " --configfile=%s" % self.configfile
 
         return retval
 
@@ -56,5 +59,7 @@ class Wic_Bootloader(F8_Bootloader):
         # use specified source plugin to implement bootloader-specific methods
         parser.add_option("--source", type="string", action="store",
                       dest="source", default=None)
+        parser.add_option("--configfile", type="string", action="store",
+                      dest="configfile", default=None)
         return parser
 
-- 
1.8.4.5


