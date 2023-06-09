Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DF9C7EE45
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:55 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.194.1686329688978912413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=F8Oy8nra;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-652699e72f7so1708948b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329688; x=1688921688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88SnwcahxVIvFObNOoXDCk3nYqAx0LvdlgvYcqf9ztE=;
        b=F8Oy8nrasPtoHip22abvdFECnYoyc8LhHhc2v0sFiP2/CJujOdrlock/m8B37z9PcL
         o5DciwyLTlqKBVlBlgV6WR8kBBz79PhjCTm54G5UFfK1LP0zuL2koJ2QIjaNPsI6aOsa
         aGh0as5PA6Y9R4SUDT/l/xvzyQ1SugJ7KD82Sol3jM3ZWFf43zrRJrsoCirkpmyWibW4
         JZDZz2eFGRgj40rnDcERReAFHHQcosjuwKX9+qt4ZtDbgcjIiulMvlxA9O0lAnc5dr59
         3PXE0RIWE6qJNcf1gWhXGugwFHdeORlLMjfzH3qU/Q0uE00sUmksCo7y2bUFajfIGHBp
         jisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329688; x=1688921688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88SnwcahxVIvFObNOoXDCk3nYqAx0LvdlgvYcqf9ztE=;
        b=eIG731GHPPeZMeNKXhf+B5EUfi/vhe33y4Rf/xjwoUUWwvriWNDAaAuE6smfqvJ3Mu
         Te31gThNDAdN98tqeaDXLdnXn+h5h2N0Ne1ODGZdpmwvlklzPE1kv7oyn3VayrLLHQDE
         E0t7vg2LLVIAr6LiqukcVZyoNA6yLgSh87ltUi75FULfxokZNP/fvDRxF5I/BhTWjL1a
         6fYK1hWefNsDVr0Ic34RdaS7Qdqzu0Xnlavz2gu0sAtKzSCDucX9VIc7+EVPCLPl43js
         n1RhN3aUYr22PRhL/FiIyKkh2HWwL1Ab0NBCpJmju9mYZeDgnFRPE24fNBjMCvaRsf65
         M9lA==
X-Gm-Message-State: AC+VfDyWTKu6Rg4QGlnEWnNJl5gKXKmMxEkfpCecUnXr71hKzmptSa6N
	XkwXMnX+fg2f3F0eh7I1dp8IVxEobt7jLDBnGTE=
X-Google-Smtp-Source: ACHHUZ5Mkx5WeIA3iOxrHmMBfOoMzrAEiCLD4iZdKdBz6dNQXZTEVB8OT29hp5PUV//6reiWqjq+DQ==
X-Received: by 2002:a05:6a20:1454:b0:117:c3f8:2f39 with SMTP id a20-20020a056a20145400b00117c3f82f39mr1776535pzi.19.1686329687956;
        Fri, 09 Jun 2023 09:54:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 27/30] oeqa: adding selftest-hello and use it to speed up tests
Date: Fri,  9 Jun 2023 06:53:54 -1000
Message-Id: <95241ece5fcef53901b97f96ae961cea208ca31a.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182593

From: Thomas Roos <throos@amazon.de>

Adding a selftest version of hello world to run it in tests where no download is necessary.
Also using this in several tests to speed them up.
Using the -native version wherever possible will also speed up tests a lot.

[YOCTO #11142]

Signed-off-by: Thomas Roos <throos@amazon.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c3f26b63934888df0e3cd563c1c2804eb78a368e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


