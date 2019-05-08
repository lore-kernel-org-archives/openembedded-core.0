Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 834057DE53
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V1vCW0lRPrwMvjTSb2GVov2UIWoNzLsjXCd5I9Ss98s=;
	b=YyGMd/mAql2sq2osB8yXXL9vue
	LSYbbR0yASbUiTbh2MFesRAQdPvG1M7wy8SSQJpXZuVn1oaBo4PBygLg47bbmU4O0WHn8Z5G/s08I
	4Rl49+xlLbm+QSLFfg7MIYU3hhBxccxnMBv0IXSMqdEh6Bb8ISS2rqXv7g8aEeJVp7r+moGhtGsNe
	OUAnRnPQimJFN/Oh+4zgFD3SDvqm5+dTyDNjiZHaB13YWJbBySGynsh7f2NS7hmu7sqdNbKuEB0zN
	4b2UArbq7/cIOc7TNsndDnUmOPcro2mdiYvaqOOrlp4zewARZrDFuMu1rJl1USvtPRzs5i8pqhQ8C
	BCOaPSpg==;
Received: from lakka.kapsi.fi ([2001:67c:1be8::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1hOMaX-0001w8-2Q; Wed, 08 May 2019 16:26:25 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1hOMaX-0007xy-0o; Wed, 08 May 2019 16:26:25 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 16:26:08 +0300
Message-Id: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 1/2] eoqa: use bash to execute SDK test commands
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
X-List-Received-Date: Wed, 08 May 2019 13:26:25 -0000

The commands only work with with bash. If /bin/sh is
dash like in Debian, the command execution fails with
errors like:

Standard Output: /bin/sh: 5: export: --sysroot: bad variable name

and all SDK tests fail.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/lib/oeqa/sdk/case.py                  | 2 +-
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index d8611c8..5334237 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -9,7 +9,7 @@ from oeqa.core.case import OETestCase
 class OESDKTestCase(OETestCase):
     def _run(self, cmd):
         return subprocess.check_output(". %s > /dev/null; %s;" % \
-                (self.tc.sdk_env, cmd), shell=True,
+                (self.tc.sdk_env, cmd), shell=True, executable="/bin/bash",
                 stderr=subprocess.STDOUT, universal_newlines=True)
 
     def fetch(self, workdir, dl_dir, url, archive=None):
diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
index 6fed73e..eafbd7a 100644
--- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -42,7 +42,8 @@ class SDKBuildProject(BuildProject):
     def _run(self, cmd):
         self.log("Running . %s; " % self.sdkenv + cmd)
         try:
-            output = subprocess.check_output(". %s; " % self.sdkenv + cmd, shell=True, stderr=subprocess.STDOUT)
+            output = subprocess.check_output(". %s; " % self.sdkenv + cmd, shell=True,
+                                             executable='/bin/bash', stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as exc:
             print(exc.output.decode('utf-8'))
             return exc.returncode
-- 
1.9.1


