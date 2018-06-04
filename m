Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16853605C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 03:09:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5439dnF012683
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Jun 2018 20:09:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 3 Jun 2018 20:09:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2018 11:10:11 +0800
Message-ID: <b9da7c8293a6f05be15c7394db9e221030145f95.1528081495.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528081495.git.Qi.Chen@windriver.com>
References: <cover.1528081495.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/14] oeqa/runtime/cases/multilib.py: skip if needed packages are not available
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
X-List-Received-Date: Mon, 04 Jun 2018 03:09:38 -0000
Content-Type: text/plain

1) The test cases use 'readelf' command to do the check. This command
   is from binutils. So skip the test if the needed binutils package is
   not installed.

   The related error message in log.do_testimage is like below.

     Output:  sh: readelf: not found

2) The test case tests /lib/libc.so.6 from lib32-libc6. So skip the test
   if lib32-libc6 is not installed.

   The related error message in log.do_testimage is like below.

     Output:   readelf: Error: 'lib/libc.so.6': No such file

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/multilib.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
index 8c167f1..970f676 100644
--- a/meta/lib/oeqa/runtime/cases/multilib.py
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -27,6 +27,8 @@ class MultilibTest(OERuntimeTestCase):
     @skipIfNotInDataVar('MULTILIBS', 'multilib:lib32',
                         "This isn't a multilib:lib32 image")
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['binutils'])
+    @OEHasPackage(['lib32-libc6'])
     def test_check_multilib_libc(self):
         """
         Check that a multilib image has both 32-bit and 64-bit libc in.
-- 
1.9.1


