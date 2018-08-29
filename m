Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87F24790A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 02:51:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7T2ppEW005909
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 19:51:51 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 28 Aug 2018 19:51:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 10:56:30 +0800
Message-ID: <da3a38f65298e7a493e1e3ef7f8c83ff46921b90.1535511291.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1535511291.git.Qi.Chen@windriver.com>
References: <cover.1535511291.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] sdk/buldgalculator.py: check against multilib for gtk+3
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
X-List-Received-Date: Wed, 29 Aug 2018 02:51:50 -0000
Content-Type: text/plain

When determining whether to skip the test case, the check should be
done with consideration of multilib. Otherwise, we will meet the
following error when testing against lib32 environment.

  No package 'gtk+-3.0' found

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 4c02ea4..3714825 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -8,8 +8,8 @@ class GalculatorTest(OESDKTestCase):
 
     @classmethod
     def setUpClass(self):
-        if not (self.tc.hasTargetPackage(r"gtk\+3") or\
-                self.tc.hasTargetPackage(r"libgtk-3.0")):
+        if not (self.tc.hasTargetPackage(r"gtk\+3", multilib=True) or\
+                self.tc.hasTargetPackage(r"libgtk-3.0", multilib=True)):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
         if not (self.tc.hasHostPackage("nativesdk-gettext-dev")):
             raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain gettext")
-- 
1.9.1


