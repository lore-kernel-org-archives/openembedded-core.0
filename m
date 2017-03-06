Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E020677552
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:24:35 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2017 07:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,254,1484035200"; d="scan'208";a="73321955"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 06 Mar 2017 07:24:30 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id B89026A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:24:27 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 17:10:12 +0200
Message-Id: <d5bf33ee78f6ac95425576781aec6bdd30201b66.1488812619.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488812619.git.ed.bartosh@linux.intel.com>
References: <cover.1488812619.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/5] qemurunner.py: ignore decode errors
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
X-List-Received-Date: Mon, 06 Mar 2017 15:24:36 -0000

qemu output can contain control characters. This cause qemurunner
API to crash when decoding the output to utf-8:

Traceback (most recent call last):
  File "/usr/lib64/python3.4/threading.py", line 911, in _bootstrap_inner
    self.run()
  File "meta/lib/oeqa/utils/qemurunner.py", line 472, in run
    threading.Thread.run(self)
  File "/usr/lib64/python3.4/threading.py", line 859, in run
    self._target(*self._args, **self._kwargs)
  File "meta/lib/oeqa/utils/qemurunner.py", line 465, in threadtarget
    self.eventloop()
  File "meta/lib/oeqa/utils/qemurunner.py", line 526, in eventloop
    self.logfunc(data)
  File "meta/lib/oeqa/utils/qemurunner.py", line 77, in log
    msg = msg.decode("utf-8")
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xda in position 0:
unexpected end of data

Added errors='ignore' to decode call to fix this.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 19f0f92..59dc11d 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -74,7 +74,7 @@ class QemuRunner:
         if self.logfile:
             # It is needed to sanitize the data received from qemu
             # because is possible to have control characters
-            msg = msg.decode("utf-8")
+            msg = msg.decode("utf-8", errors='ignore')
             msg = re_control_char.sub('', msg)
             with codecs.open(self.logfile, "a", encoding="utf-8") as f:
                 f.write("%s" % msg)
-- 
2.1.4


