Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D540C7404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 18:32:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2015 11:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; d="scan'208";a="811415647"
Received: from nravicha-mobl.amr.corp.intel.com (HELO
	alimonb-MOBL1.amr.corp.intel.com) ([10.254.117.132])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2015 11:32:06 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 13:29:25 -0500
Message-Id: <1443032966-19802-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa/runtime/parselogs.py: Fix dmesg log retrieve in sato
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
X-List-Received-Date: Wed, 23 Sep 2015 18:32:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sato uses busybox that fails to write log using echo "" because
dmesg output can contain special characters.

[YOCTO #8377]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index e20947b..e2dd3eb 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -233,8 +233,7 @@ class ParseLogsTest(oeRuntimeTest):
 
     #get the output of dmesg and write it in a file. This file is added to log_locations.
     def write_dmesg(self):
-        (status, dmesg) = self.target.run("dmesg")
-        (status, dmesg2) = self.target.run("echo \""+str(dmesg)+"\" > /tmp/dmesg_output.log")
+        (status, dmesg) = self.target.run("dmesg > /tmp/dmesg_output.log")
 
     @testcase(1059)
     @skipUnlessPassed('test_ssh')
-- 
1.9.1


