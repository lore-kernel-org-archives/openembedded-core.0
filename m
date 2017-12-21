Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC50378733
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 02:02:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBL22U8P012672
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 18:02:31 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 20 Dec 2017 18:02:30 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Dec 2017 10:02:21 +0800
Message-ID: <6bed2ead820cbb22462e458b49c82c71ece0ff85.1513821698.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513821698.git.liezhi.yang@windriver.com>
References: <cover.1513821698.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa/core/loader.py: fix re for module
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
X-List-Received-Date: Thu, 21 Dec 2017 02:02:30 -0000
Content-Type: text/plain

Fixed:
$ oe-selftest -r eSDK.oeSDKExtSelfTest.test_image_generation_binary_feeds
Traceback (most recent call last):
[snip]
  File "/workspace2/lyang1/poky/meta/lib/oeqa/core/loader.py", line 49, in _built_modules_dict
    module_name, class_name, test_name = m.groups()
AttributeError: 'NoneType' object has no attribute 'groups'

The old code assumed the arg should be:
module.Class.test

Note about the module and Class, the lower and upper cases matters, which can't
handle the testcases like eSDK.oeSDKExtSelfTest.test_image_generation_binary_feeds
and gotoolchain.oeGoToolchainSelfTest.test_go_dep_build. Use a new re to fix
the problem, now all of the following commmands can work:
$ oe-selftest -r eSDK
$ oe-selftest -r eSDK.oeSDKExtSelfTest
$ oe-selftest -r eSDK.oeSDKExtSelfTest.test_image_generation_binary_feeds

[YOCTO #12438]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/core/loader.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 975a081..25078ba 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -41,9 +41,10 @@ def _built_modules_dict(modules):
         return modules_dict
 
     for module in modules:
-        # Assumption: package and module names do not contain upper case
-        # characters, whereas class names do
-        m = re.match(r'^([^A-Z]+)(?:\.([A-Z][^.]*)(?:\.([^.]+))?)?$', module)
+        # The format is module.class.test, while .class and .test is optional.
+        m = re.match(r'([^\.]+)(?:\.([^\.]+))?(?:\.([^\.]*))?', module)
+        if not m:
+            raise OEQATestNotFound("Not found %s in loaded test cases" % module)
 
         module_name, class_name, test_name = m.groups()
 
-- 
2.7.4


