Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UAMJr-0002kt-6J
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 16:19:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Feb 2013 07:03:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,740,1355126400"; d="scan'208";a="261618820"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 26 Feb 2013 07:03:29 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 17:04:40 +0200
Message-Id: <1361891080-5035-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v2] log_srcrev.bbclass: add a bbclass for logging SRCREVs
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
X-List-Received-Date: Tue, 26 Feb 2013 15:19:52 -0000

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
index 0000000..d5d0284
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
+        srcrevfile = d.expand('${TMPDIR}/srcrevs/${MULTIMACH_TARGET_SYS}/${BP}-${PV}')
+        bb.utils.mkdirhier(os.path.dirname(srcrevfile))
+
+        with open(srcrevfile, 'w') as f:
+            f.write(','.join([bbfile, src_uri, srcrev, from_autorev]))
+}
+
+addtask do_log_srcrev after do_fetch
-- 
1.7.11.7



