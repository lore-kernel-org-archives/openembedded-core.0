Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 225267FC2B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 11:06:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2019 02:59:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="210078923"
Received: from ntruong2-mobl.ccr.corp.intel.com (HELO shodan.fritz.box)
	([10.255.170.244])
	by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 02:59:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 23:59:07 +1300
Message-Id: <31a77c3b3fd7ce1098966975bae68569911ecb73.1575888923.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575888923.git.paul.eggleton@linux.intel.com>
References: <cover.1575888923.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] oeqa: qemu: ensure we print runqemu output in the event of failure
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
X-List-Received-Date: Mon, 09 Dec 2019 11:06:30 -0000
Content-Transfer-Encoding: 8bit

If we get here in the code it's because runqemu has failed, this is not
a debug situation - we need to see the output, so print it as an error.

Fixes [YOCTO #13681].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 60e1cf8e08e..2cada35d480 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -99,8 +99,8 @@ class QemuRunner:
     def handleSIGCHLD(self, signum, frame):
         if self.runqemu and self.runqemu.poll():
             if self.runqemu.returncode:
-                self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
-                self.logger.debug("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
+                self.logger.error('runqemu exited with code %d' % self.runqemu.returncode)
+                self.logger.error('Output from runqemu:\n%s' % self.getOutput(self.runqemu.stdout))
                 self.stop()
                 self._dump_host()
                 raise SystemExit
-- 
2.20.1


