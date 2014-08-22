Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD3C70E61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:43:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7M8hKMS007123
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 01:43:20 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 01:43:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Aug 2014 01:43:19 -0700
Message-ID: <a2cc1d4e34001c5dfcda48222a54bfd7037cc6c5.1408696967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408696967.git.liezhi.yang@windriver.com>
References: <cover.1408696967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sanity.bbclass/kernel.bbclass: minor fixes
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
X-List-Received-Date: Fri, 22 Aug 2014 08:43:20 -0000
Content-Type: text/plain

Fixed:
- Remove an unused line
- Remove unneeded code after d.getVar(), we don't need the "or ''" after
  d.getVar() unless we need a string.
- typo: PREMIRROS -> PREMIRRORS.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/kernel.bbclass |    2 +-
 meta/classes/sanity.bbclass |    7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1289873..76d04a7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -12,7 +12,7 @@ INITRAMFS_TASK ?= ""
 INITRAMFS_IMAGE_BUNDLE ?= ""
 
 python __anonymous () {
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
+    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
     if kerneltype == 'uImage':
         depends = d.getVar("DEPENDS", True)
         depends = "%s u-boot-mkimage-native" % depends
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b5fab6a..3b40ebe 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -150,10 +150,9 @@ def check_toolchain_tune(data, tune, multilib):
             bb.debug(2, "  %s: %s" % (feature, valid_tunes[feature]))
         else:
             tune_errors.append("Feature '%s' is not defined." % feature)
-    whitelist = localdata.getVar("TUNEABI_WHITELIST", True) or ''
-    override = localdata.getVar("TUNEABI_OVERRIDE", True) or ''
+    whitelist = localdata.getVar("TUNEABI_WHITELIST", True)
     if whitelist:
-        tuneabi = localdata.getVar("TUNEABI_tune-%s" % tune, True) or ''
+        tuneabi = localdata.getVar("TUNEABI_tune-%s" % tune, True)
         if not tuneabi:
             tuneabi = tune
         if True not in [x in whitelist.split() for x in tuneabi.split()]:
@@ -265,7 +264,7 @@ def check_connectivity(d):
     # CONNECTIVITY_CHECK_URIS are set
     network_enabled = not d.getVar('BB_NO_NETWORK', True)
     check_enabled = len(test_uris)
-    # Take a copy of the data store and unset MIRRORS and PREMIRROS
+    # Take a copy of the data store and unset MIRRORS and PREMIRRORS
     data = bb.data.createCopy(d)
     data.delVar('PREMIRRORS')
     data.delVar('MIRRORS')
-- 
1.7.9.5


