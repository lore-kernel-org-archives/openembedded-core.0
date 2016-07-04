Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7056011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 19:10:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jul 2016 12:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,575,1459839600"; d="scan'208";a="1015568145"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2016 12:10:16 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 9FC2A6A4080;
	Mon,  4 Jul 2016 12:10:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 22:00:15 +0300
Message-Id: <1467658815-3019-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [master][krogoth][jethro][PATCH] devshell.bbclass: fix double unbuffering
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
X-List-Received-Date: Mon, 04 Jul 2016 19:10:17 -0000

stdout is already unbuffered in bitbake code. Attempt to
do it again in devshell.bbclass causes this crash when
running devpyshell:
  File "scripts/oepydevshell-internal.py", line 29, in <module>
      pty = open(sys.argv[1], "w+b", 0)
  IOError: [Errno 13] Permission denied: '/dev/pts/6'

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/devshell.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 4451436..72390dd 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -65,7 +65,6 @@ def devpyshell(d):
         os.dup2(m, sys.stdout.fileno())
         os.dup2(m, sys.stderr.fileno())
 
-        sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
         sys.stdin = os.fdopen(sys.stdin.fileno(), 'r', 0)
 
         bb.utils.nonblockingfd(sys.stdout)
-- 
2.1.4


