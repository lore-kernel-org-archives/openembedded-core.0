Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 232C178993
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 05:23:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7D5Ndp7025867
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Aug 2018 22:23:39 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Sun, 12 Aug 2018 22:23:38 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Aug 2018 22:23:36 -0700
Message-ID: <20180813052336.43281-3-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180813052336.43281-1-hongzhi.song@windriver.com>
References: <20180813052336.43281-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/2] runtime selftest: optimize the case of hw_breakpoint
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
X-List-Received-Date: Mon, 13 Aug 2018 05:23:38 -0000
Content-Type: text/plain

1. So far, only qemux86 can support hw breakpoint
qemuppc: Runqemu uses G4 as the default cpu. But qemu doesn't simulate
the hw breakpoint register for G4, which belong to 74xx series.

qemuarm: The arch more than v7 supports hw breakpoint, however arm use
v5 as default.

2. Rsyslog maybe not started, so we use dmesg to confirm.

3. Adding the operation of 'ls' triggers hardware breakpoint.

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


