Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UAMND-0002tF-B1
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 16:23:20 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Feb 2013 07:06:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,740,1355126400"; d="scan'208";a="292009855"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2013 07:06:57 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 17:08:09 +0200
Message-Id: <1361891289-6777-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v3] log_srcrev.bbclass: add a bbclass for logging SRCREVs
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
X-List-Received-Date: Tue, 26 Feb 2013 15:23:21 -0000

- add a task which creates a file for each package with the following
format:

${BB_FILENAME},${SRC_URI},${SRCREV},${FROM_AUTOREV}

[YOCTO #3041]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/log_srcrev.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/classes/log_srcrev.bbclass

diff --git a/meta/classes/log_srcrev.bbclass b/meta/classes/log_srcrev.bbclass
new file mode 100644
index 0000000..a04702c
--- /dev/null
+++ b/meta/classes/log_srcrev.bbclass
@@ -0,0 +1,15 @@
+python do_log_srcrev () {
+    srcrev = d.getVar('SRCREV', True)
+    if srcrev:
+        bbfile = d.getVar('BB_FILENAME', True)
+        src_uri = d.getVar('SRC_URI', True)
+        from_autorev = 'yes' if d.getVar('SRCREV', False) == 'AUTOINC' else 'no'
+
+        srcrevfile = d.expand('${TMPDIR}/srcrevs/${MULTIMACH_TARGET_SYS}/${BP}')
+        bb.utils.mkdirhier(os.path.dirname(srcrevfile))
+
+        with open(srcrevfile, 'w') as f:
+            f.write(','.join([bbfile, src_uri, srcrev, from_autorev]))
+}
+
+addtask do_log_srcrev after do_fetch
-- 
1.7.11.7



