Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8D66011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 22:18:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 04 Jul 2016 15:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,576,1459839600"; d="scan'208";a="840605028"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 04 Jul 2016 15:18:36 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 33D816A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 15:18:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2016 01:08:13 +0300
Message-Id: <dc8e9df2e212e5d8a16117aceb4f4edc20d61f51.1467669922.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1467669922.git.ed.bartosh@linux.intel.com>
References: <cover.1467669922.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1467669922.git.ed.bartosh@linux.intel.com>
References: <cover.1467669922.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 1/3] devshell.bbclass: fix double unbuffering
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
X-List-Received-Date: Mon, 04 Jul 2016 22:18:34 -0000

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
index 341d9c0..041ed15 100644
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


