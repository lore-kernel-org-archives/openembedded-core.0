Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CCD274AB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 03:43:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4I3h1eh011050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 20:43:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 17 May 2018 20:43:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2018 11:44:50 +0800
Message-ID: <cf0f85ee5c3e02b768265c0eeeb242967d3b5dd3.1526608575.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1526608575.git.Qi.Chen@windriver.com>
References: <cover.1526608575.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa/sdk/cases/buildgalculator.py: skip if gettext not available
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
X-List-Received-Date: Fri, 18 May 2018 03:43:01 -0000
Content-Type: text/plain

We need to skip this testcase when gettext is not available. Otherwise,
we will have the following error at configure.

  error: possibly undefined macro: AM_NLS

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 780afcc..5a5bf99 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -11,6 +11,8 @@ class GalculatorTest(OESDKTestCase):
         if not (self.tc.hasTargetPackage("gtk\+3") or\
                 self.tc.hasTargetPackage("libgtk-3.0")):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
+        if not (self.tc.hasTargetPackage("gettext")):
+            raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain gettext")
 
     def test_galculator(self):
         dl_dir = self.td.get('DL_DIR', None)
-- 
1.9.1


