Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5710C77B7F
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 12:14:19 +0000 (UTC)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
 by mx.groups.io with SMTP id smtpd.web11.47676.1684325654581280893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 05:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=bf3+vvUZ;
 spf=pass (domain: amazon.de, ip: 207.171.184.29, mailfrom: prvs=494b7313b=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1684325655; x=1715861655;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zU6/snJvurCGla+fFmxIpZnjV+ymhDAArJ5GdlVLK8g=;
  b=bf3+vvUZfHc5MyALiHfSHhkZ/cnOXeTtqJjOH40+HAWsNZf5mjRgrUXc
   pUKQ3y73e7v30woV/3NBaZcBfghgNNlFqb+2MIX4dsZN/3EbNi5//iQXs
   edP00mrHUD7vLbuvNttTLkJYND63/Y8PlwLyTG1Ttjc57DxDuJ2w0DovD
   U=;
X-IronPort-AV: E=Sophos;i="5.99,282,1677542400"; 
   d="scan'208";a="339383044"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-edda28d4.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 12:14:09 +0000
Received: from EX19D016EUC001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1a-m6i4x-edda28d4.us-east-1.amazon.com (Postfix) with ESMTPS id 11E2E80FC0
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 12:14:07 +0000 (UTC)
Received: from u182adcbddbfb55.ant.amazon.com (10.85.99.98) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 12:14:05 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH v2] oeqa: adding selftest-hello and use it to speed up tests
Date: Wed, 17 May 2023 14:13:53 +0200
Message-ID: <20230517121354.2461138-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.85.99.98]
X-ClientProxiedBy: EX19D039UWA002.ant.amazon.com (10.13.139.32) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 12:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181486

From: Thomas Roos <throos@amazon.de>

Adding a selftest version of hello world to run it in tests where no download is necessary.
Also using this in several tests to speed them up.
Using the -native version wherever possible will also speed up tests a lot.

[YOCTO #11142]

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 .../selftest-hello/files/helloworld.c         |  8 ++++++++
 .../selftest-hello/selftest-hello_1.0.bb      | 19 +++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bbtests.py       | 18 +++++++++---------
 3 files changed, 36 insertions(+), 9 deletions(-)
 create mode 100644 meta-selftest/recipes-test/selftest-hello/files/helloworld.c
 create mode 100644 meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb

diff --git a/meta-selftest/recipes-test/selftest-hello/files/helloworld.c b/meta-selftest/recipes-test/selftest-hello/files/helloworld.c
new file mode 100644
index 0000000000..fc7169b7b8
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hello/files/helloworld.c
@@ -0,0 +1,8 @@
+#include <stdio.h>
+
+int main(void)
+{
+	printf("Hello world!\n");
+
+	return 0;
+}
diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
new file mode 100644
index 0000000000..547587bef4
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Simple helloworld application -- selftest variant"
+SECTION = "examples"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://helloworld.c"
+
+S = "${WORKDIR}"
+
+do_compile() {
+	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 helloworld ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index d97bda13c2..1dd2839c8d 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -41,7 +41,7 @@ class BitbakeTests(OESelftestTestCase):
 
     def test_event_handler(self):
         self.write_config("INHERIT += \"test_events\"")
-        result = bitbake('m4-native')
+        result = bitbake('selftest-hello-native')
         find_build_started = re.search(r"NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Executing.*Tasks", result.output)
         find_build_completed = re.search(r"Tasks Summary:.*(\n.*)*NOTE: Test for bb\.event\.BuildCompleted", result.output)
         self.assertTrue(find_build_started, msg = "Match failed in:\n%s"  % result.output)
@@ -49,11 +49,11 @@ class BitbakeTests(OESelftestTestCase):
         self.assertNotIn('Test for bb.event.InvalidEvent', result.output)
 
     def test_local_sstate(self):
-        bitbake('m4-native')
-        bitbake('m4-native -cclean')
-        result = bitbake('m4-native')
-        find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
-        self.assertTrue(find_setscene, msg = "No \"m4-native.*do_.*_setscene\" message found during bitbake m4-native. bitbake output: %s" % result.output )
+        bitbake('selftest-hello-native')
+        bitbake('selftest-hello-native -cclean')
+        result = bitbake('selftest-hello-native')
+        find_setscene = re.search("selftest-hello-native.*do_.*_setscene", result.output)
+        self.assertTrue(find_setscene, msg = "No \"selftest-hello-native.*do_.*_setscene\" message found during bitbake selftest-hello-native. bitbake output: %s" % result.output )
 
     def test_bitbake_invalid_recipe(self):
         result = bitbake('-b asdf', ignore_status=True)
@@ -175,7 +175,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertIn('localconf', result.output)
 
     def test_dry_run(self):
-        result = runCmd('bitbake -n m4-native')
+        result = runCmd('bitbake -n selftest-hello-native')
         self.assertEqual(0, result.status, "bitbake dry run didn't run as expected. %s" % result.output)
 
     def test_just_parse(self):
@@ -233,7 +233,7 @@ INHERIT:remove = \"report-error\"
 
     def test_setscene_only(self):
         """ Bitbake option to restore from sstate only within a build (i.e. execute no real tasks, only setscene)"""
-        test_recipe = 'ed'
+        test_recipe = 'selftest-hello-native'
 
         bitbake(test_recipe)
         bitbake('-c clean %s' % test_recipe)
@@ -246,7 +246,7 @@ INHERIT:remove = \"report-error\"
                                              'Executed tasks were: %s' % (task, str(tasks)))
 
     def test_skip_setscene(self):
-        test_recipe = 'ed'
+        test_recipe = 'selftest-hello-native'
 
         bitbake(test_recipe)
         bitbake('-c clean %s' % test_recipe)
-- 
2.34.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094





