Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4D5A751C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 09:31:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5P9VCYM015190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 02:31:27 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 02:31:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jun 2018 17:33:51 +0800
Message-ID: <c8a7632a1f27b73ac623c5399ed4e452f2b37571.1529919069.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1529919069.git.Qi.Chen@windriver.com>
References: <cover.1529919069.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa/runtime/cases/systemd.py: avoid timeout problem
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
X-List-Received-Date: Mon, 25 Jun 2018 09:31:36 -0000
Content-Type: text/plain

I've encountered the following error when doing testimage.

  RESULTS - systemd.SystemdBasicTests.test_systemd_list - Testcase 551: FAILED

After investigation, I found that it's not functionality issue. It's
just that the qemu was not running fast enough. And it resulted 'time out'
problem when using `systemctl list-unit-files'.

The correctness could be verified by using 'busctl' directly.
e.g.
busctl --timeout=240 call org.freedesktop.systemd1 \
/org/freedesktop/systemd1 org.freedesktop.systemd1.Manager \
ListUnitFilesByPatterns asas 0 0

Checking the source codes, I can see that the timeout is 25s. I don't
think we should patch systemd's source codes just for such a simple
runtime test case.

So instead, I change the test case to use 'busctl' directly if
'systemctl list-unit-files' gets a timeout error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index db69384..b4f1025 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -81,7 +81,19 @@ class SystemdBasicTests(SystemdTest):
     @OETestID(551)
     @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
     def test_systemd_list(self):
-        self.systemctl('list-unit-files')
+        command = 'systemctl list-unit-files'
+        status, output = self.target.run(command)
+        message = '\n'.join([command, output])
+        match = re.search('Connection timed out', output)
+        if match:
+            # it's possible that qemu is running slow
+            # use busctl to check the results with timeout set to 240s
+            command = 'busctl --timeout=240 call org.freedesktop.systemd1 /org/freedesktop/systemd1 org.freedesktop.systemd1.Manager ListUnitFilesByPatterns asas 0 0'
+            status, output = self.target.run(command)
+            message = '\n'.join([command, output])
+            self.assertEqual(status, 0, message)
+        else:
+            self.assertEqual(status, 0, message)
 
     @OETestID(550)
     @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
-- 
1.9.1


