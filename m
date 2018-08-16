Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C86807925C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 02:49:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7G2nVe8018482
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 19:49:32 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 15 Aug 2018 19:49:30 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2018 19:49:29 -0700
Message-ID: <20180816024929.40896-3-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180816024929.40896-1-hongzhi.song@windriver.com>
References: <20180816024929.40896-1-hongzhi.song@windriver.com>
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
X-List-Received-Date: Thu, 16 Aug 2018 02:49:31 -0000
Content-Type: text/plain

1. So far, only qemux86[-64] support hw breakpoint, no matter whether or
not with kvm.

qemuppc: The oe-core configuration uses a PPC G4 system as the
default cpu but qemu doesn't simulate the hw breakpoint register for G4.

qemuarm: The arch more than v7 supports hw breakpoint, however arm use
v5 as default.

qemuarm64: It has some problem that haven't been located so far.

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


