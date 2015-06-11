Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 907D460670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 22:40:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2015 15:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,598,1427785200"; d="scan'208";a="586337518"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga003.jf.intel.com with ESMTP; 11 Jun 2015 15:40:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 15:38:54 +0000
Message-Id: <1434037134-4898-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: roosesweb@gmail.com
Subject: [PATCH] distutils: regenerate pyc files after being modified by sed
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
X-List-Received-Date: Thu, 11 Jun 2015 22:40:17 -0000

py files are edited by sed and therefore *.pyc files are recreated on first boot, but if you have a read-only filesystem this is not possible. This patch creates pyc files directly after the py files are modified.

[YOCTO #7722]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Thomas Roos <roosesweb@gmail.com>
---
 meta/classes/distutils.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index c0bb573..2498685 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -42,8 +42,8 @@ distutils_do_install() {
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
-        # only modify file if it contains path to avoid recompilation on the target
-        find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \;
+        # only modify file if it contains path  and recompile it
+        find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \; -exec ${STAGING_BINDIR_NATIVE}/python-native/python -mcompileall {} \;
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
-- 
1.8.4.5


