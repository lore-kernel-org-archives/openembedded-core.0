Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3849790D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 07:36:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7G7aoxf008983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 00:36:50 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 16 Aug 2018 00:36:49 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2018 00:36:47 -0700
Message-ID: <20180816073647.31708-3-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180816073647.31708-1-hongzhi.song@windriver.com>
References: <20180816073647.31708-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] runtime selftest: limit kernel hw bp arches
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
X-List-Received-Date: Thu, 16 Aug 2018 07:36:49 -0000
Content-Type: text/plain

1. So far, only qemux86[-64] support hw breakpoint, no matter whether or
not with kvm.

qemuppc: The oe-core configuration uses a PPC G4 system as the
default cpu but qemu doesn't simulate the hw breakpoint register for G4.

qemuarm: The arch more than v7 supports hw breakpoint, however arm use
v5 as default.

qemuarm64: We temporarily drop qemuarm64 for the moment. Normally it
will print debug info once, but endlessly when we trigger the break
point. Now it is hard to located the issue, but we will confirm it
later.

qemumips*: Kernel dosen't support hw bp for mips.

2. Syslog maybe not started, so we use dmesg to confirm.

3. Running 'ls' to trigger the hardware breakpoint test.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ksample.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index 26fbe9d8cb..eb8713351a 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -164,6 +164,11 @@ class KSampleTest(KSample):
     # hw breakpoint
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_hw_breakpoint_example(self):
+        # check arch
+        status, output = self.target.run("uname -m")
+        result = ("x86" in output) or ("aarch64" in output)
+        if not result:
+            self.skipTest("the arch doesn't support hw breakpoint" % output)
         # check config
         self.check_config("CONFIG_KALLSYMS_ALL")
         # make sure if module exists
-- 
2.11.0


