Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U8oYQ-0002ni-Tp
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 10:04:31 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Feb 2013 00:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,714,1355126400"; d="scan'208";a="290501430"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2013 00:48:15 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2013 10:49:21 +0200
Message-Id: <1361522961-5673-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] log_srcrev.bbclass: add a bbclass for logging SRCREVs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Feb 2013 09:04:33 -0000

- add a task which creates a file for each package with the following
format:

BB_FILENAME: ${BB_FILENAME}
SRC_URI: ${SRC_URI}
SRCREV: ${SRCREV}
FROM AUTOREV: no/yes

[YOCTO #3041]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/log_srcrev.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/classes/log_srcrev.bbclass

diff --git a/meta/classes/log_srcrev.bbclass b/meta/classes/log_srcrev.bbclass
new file mode 100644
index 0000000..b319e7b
--- /dev/null
+++ b/meta/classes/log_srcrev.bbclass
@@ -0,0 +1,20 @@
+SRCREV_LOGFILE ??= 'srcrev_log'
+
+python do_log_srcrev () {
+    srcrev = d.getVar('SRCREV', True)
+    if srcrev:
+        bbfile = d.getVar('BB_FILENAME', True)
+        src_uri = d.getVar('SRC_URI', True)
+        from_autorev = 'yes' if d.getVar('SRCREV', False) == 'AUTOINC' else 'no'
+
+        srcrevdir = d.expand('${TMPDIR}/srcrevs/${MULTIMACH_TARGET_SYS}/${PN}-${PV}/')
+        srcrevfile = os.path.join(srcrevdir, d.getVar('SRCREV_LOGFILE', True))
+        bb.utils.mkdirhier(os.path.dirname(srcrevfile))
+
+        with open(srcrevfile, 'w') as f:
+            f.write("BB_FILENAME: %s\nSRC_URI: %s\nSRCREV: %s\nFROM AUTOREV: %s\n"
+                    % (bbfile, src_uri, srcrev, from_autorev))
+}
+
+addtask do_log_srcrev after do_fetch
+do_log_srcrev[cleandirs] = "${TMPDIR}/srcrevs/${MULTIMACH_TARGET_SYS}/${PN}-${PV}/"
-- 
1.7.11.7



