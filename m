Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1816EB26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 14:33:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Feb 2014 06:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,832,1384329600"; d="scan'208";a="480273224"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 12 Feb 2014 06:33:53 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2014 16:33:44 +0200
Message-Id: <f1d4b1de74f2c69b444ed50977263245440ed071.1392215552.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392215552.git.laurentiu.palcu@intel.com>
References: <cover.1392215552.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392215552.git.laurentiu.palcu@intel.com>
References: <cover.1392215552.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] (image|rootfs_ipk).bbclass, rootfs.py: ipk multilib fixes
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
X-List-Received-Date: Wed, 12 Feb 2014 14:33:56 -0000

This commit whitelists some common directories, so the multilib sanity
checks pass and also fixes an issue in lib/oe/rootfs.py when the
compared files do not exist.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image.bbclass      |    2 +-
 meta/classes/rootfs_ipk.bbclass |    2 +-
 meta/lib/oe/rootfs.py           |    4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8f4be13..28b68f9 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -264,7 +264,7 @@ insert_feed_uris () {
 	done
 }
 
-MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|"
+MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 6d4f9fa..1887dd3 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -21,7 +21,7 @@ OPKG_POSTPROCESS_COMMANDS = ""
 
 OPKGLIBDIR = "${localstatedir}/lib"
 
-MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg"
+MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
 
 python () {
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b6baf77..4fd17de 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -496,7 +496,9 @@ class OpkgRootfs(Rootfs):
                         if allow_rep.match(key):
                             valid = True
                         else:
-                            if not filecmp.cmp(files[key], item):
+                            if os.path.exists(files[key]) and \
+                               os.path.exists(item) and \
+                               not filecmp.cmp(files[key], item):
                                 valid = False
                                 bb.fatal("%s duplicate files %s %s is not the same\n" %
                                          (error_prompt, item, files[key]))
-- 
1.7.9.5


