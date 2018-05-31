Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD61B74F49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 08:43:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4V8h7tK017794
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 01:43:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 May 2018 01:43:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2018 16:45:26 +0800
Message-ID: <81f5176c42065e0c7504f80ddbe8bb4d6f7882b0.1527755435.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1527755434.git.Qi.Chen@windriver.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/14] oeqa/runtime/cases/multilib.py: fix test_file_connman skipping logic
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
X-List-Received-Date: Thu, 31 May 2018 08:43:06 -0000
Content-Type: text/plain

The test_file_connman should be executed only when 'lib32-connman' is
installed and 'connman' is not installed.

When lib32-connman and connman are both installed, the /usr/sbin/connmand
could be from connman or lib32-connman, depending on the installation
order. What we want to check is the connmand command from lib32-connman,
so we need to make sure that connman is not there to cause chaos.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/multilib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
index 970f676..8902038 100644
--- a/meta/lib/oeqa/runtime/cases/multilib.py
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -38,6 +38,6 @@ class MultilibTest(OERuntimeTestCase):
 
     @OETestID(279)
     @OETestDepends(['multilib.MultilibTest.test_check_multilib_libc'])
-    @OEHasPackage(['lib32-connman'])
+    @OEHasPackage(['lib32-connman', '!connman'])
     def test_file_connman(self):
         self.archtest("/usr/sbin/connmand", "ELF32")
-- 
1.9.1


