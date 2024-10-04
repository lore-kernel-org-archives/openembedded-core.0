Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82E9CFA77D
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 13:40:04 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.22462.1728049200751370796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 06:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=iv0VsSOD;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4582a0b438aso16682911cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728049199; x=1728653999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7u/qoNewM7FgztrJylppCyq8SarqJ5UMUCrwoTeyEOU=;
        b=iv0VsSODBB/YMS0UB/F+yRT4LEi+KwNpiswnm/g+oQ47M9EBlQ/uz/bCMrbEUkJKB+
         tDxkWawW8XsAKcrPyyAZQ5iEf4rO8Rz8U5wGzmfll4LfKN6FRt7/oZwVqlAsxmdyUiGz
         WSdp35wcuVRTz6gZZyHZ1toLisGfhxzAQcpVcxS7nYXS8Q1NX4mxzoqpj5pm+bk7YadK
         ZlVuhprNWK+EZb08IlJgTu2J5riX/aXCfszjUfOEilxvgeKvB6XBhuSAcwNQRORozl0h
         lQOZ1x3hBkXw2JtanXFmyF4+d3s3iGZ40KTW0XhQgUxGPFxbsDJOvl9z58bRX6jESc5o
         P0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728049199; x=1728653999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7u/qoNewM7FgztrJylppCyq8SarqJ5UMUCrwoTeyEOU=;
        b=ZvfZmE09sT1cC4DnFAgjWLQonIk28gBVBZ32gxNL97rDUbC8BZLJwpJXbYn5oKRX5f
         oTKtZpxcGQg9o8CtgRdltoYOC51K/UKmWYBGh+lP1mfcJ7vsnhnEIXe/tnv3m9/AqOUi
         3VSYbpBgEgVnVWs1T+S9BrkmyKy/wgd0AKbDOBM7XMnuugI2OqG81d9kD0Y+diPKZq/0
         i/9EeXkOYLxi2MSFhwIQGhWItbSkTbvFQhaK6moAR69cDJFq++v2r3QCOSvIMyzr8o+h
         dCnrletXZxbUUpNizN1kb4g8Z1zeBWIkgFR1KL9CyX/3GrRJaXeOCehhvMFmstYlsfl1
         gavw==
X-Gm-Message-State: AOJu0YzsjHWxkLj03GsNmX5Zc+m8i/q7ypG7fbwZVXq9+68fzKX/ogeA
	Hs4moP2vt679eheZwE0LFGW0z3GlpUZC8fksXuu6tIM16LoFGD3/E7aMzN0H7j2a4EM0+oAmcIb
	5rqM=
X-Google-Smtp-Source: AGHT+IG3KcfsY4zR7PjtXcYRl5NAhxSkJSL1L9GewCN4uvlllrFYAx4S8v1MEtR5mTeNHu6WR722rA==
X-Received: by 2002:a05:622a:1989:b0:458:2c27:7730 with SMTP id d75a77b69052e-45d9ba44b5bmr39023011cf.19.1728049199336;
        Fri, 04 Oct 2024 06:39:59 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45d92c4fb0asm14973391cf.0.2024.10.04.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 06:39:59 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] patchtest: add test_commit_message_user_tags
Date: Fri,  4 Oct 2024 09:39:54 -0400
Message-Id: <20241004133954.53733-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 13:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205234

This test makes patchtest check to ensure that there aren't any
GitHub-style user account names being tagged in the commit message, e.g.
it should catch lines like:

"fix added by @threexc"

This is desired so that if (for example) we add upstream changelogs in
recipe upgrade commit messages verbatim, we don't end up subscribing any
associated maintainers to our repo mirrors' updates by accident.

There is a small possibility of a false positive with this test, where
if someone is mentioning Python decorators in their commit message (or
similar syntax from other languages), it will fail when it should pass.
However, having this test in place to guard against username inclusion
is more important that the occasional false positive for that reason.

With this addition, a failure will look like:

|FAIL: test commit message user tags: Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames (test_mbox.TestMbox.test_commit_message_user_tags)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/patchtest_patterns.py      |  2 +
 ...estMbox.test_commit_message_user_tags.fail | 65 ++++++++++++++++++
 ...estMbox.test_commit_message_user_tags.pass | 66 +++++++++++++++++++
 meta/lib/patchtest/tests/test_mbox.py         |  9 +++
 4 files changed, 142 insertions(+)
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.pass

diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtest/patchtest_patterns.py
index 8c2e192fc9f..39c5a65d91d 100644
--- a/meta/lib/patchtest/patchtest_patterns.py
+++ b/meta/lib/patchtest/patchtest_patterns.py
@@ -58,6 +58,8 @@ mbox_bugzilla = pyparsing.Regex('\[\s?YOCTO.*\]')
 mbox_bugzilla_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
 mbox_revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
 mbox_shortlog_maxlength = 90
+# based on https://stackoverflow.com/questions/30281026/regex-parsing-github-usernames-javascript
+mbox_github_username = pyparsing.Regex('\B@([a-z0-9](?:-(?=[a-z0-9])|[a-z0-9]){0,38}(?<=[a-z0-9]))')
 
 # patch
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.fail
new file mode 100644
index 00000000000..9d54af96440
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.fail
@@ -0,0 +1,65 @@
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: fix CVE-1234-56789
+
+This should fail the test_commit_message_user_tags test because of this
+string: @teststring
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+new file mode 100644
+index 00000000000..8a4f9329303
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
++From: Trevor Gamblin <tgamblin@baylibre.com>
++Date: Tue, 29 Aug 2023 14:08:20 -0400
++Subject: [PATCH] Fix CVE-NOT-REAL
++
++CVE: CVE-1234-56789
++Upstream-Status: Backport(http://example.com/example)
++
++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
++---
++ strlen.c | 1 +
++ 1 file changed, 1 insertion(+)
++
++diff --git a/strlen.c b/strlen.c
++index 1788f38..83d7918 100644
++--- a/strlen.c
+++++ b/strlen.c
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -3,7 +3,9 @@ SECTION = "examples"
+ LICENSE = "MIT"
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+ 
+-SRC_URI = "file://helloworld.c"
++SRC_URI = "file://helloworld.c \
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
+ 
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
+-- 
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.pass
new file mode 100644
index 00000000000..57f2fc8a8e5
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.pass
@@ -0,0 +1,66 @@
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: fix CVE-1234-56789
+
+This should pass the test_commit_message_user_tags test.
+
+CVE: CVE-1234-56789
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+new file mode 100644
+index 00000000000..8a4f9329303
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
++From: Trevor Gamblin <tgamblin@baylibre.com>
++Date: Tue, 29 Aug 2023 14:08:20 -0400
++Subject: [PATCH] Fix CVE-NOT-REAL
++
++CVE: CVE-1234-56789
++Upstream-Status: Backport(http://example.com/example)
++
++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
++---
++ strlen.c | 1 +
++ 1 file changed, 1 insertion(+)
++
++diff --git a/strlen.c b/strlen.c
++index 1788f38..83d7918 100644
++--- a/strlen.c
+++++ b/strlen.c
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -3,7 +3,9 @@ SECTION = "examples"
+ LICENSE = "MIT"
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+ 
+-SRC_URI = "file://helloworld.c"
++SRC_URI = "file://helloworld.c \
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
+ 
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
+-- 
+2.45.1
+
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index c0f9970686a..dab733ea77d 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -142,6 +142,15 @@ class TestMbox(base.Base):
             if not commit.commit_message.strip():
                 self.fail('Please include a commit message on your patch explaining the change', commit=commit)
 
+    # This may incorrectly report a failure if something such as a
+    # Python decorator is included in the commit message, but this
+    # scenario is much less common than the username case it is written
+    # to protect against
+    def test_commit_message_user_tags(self):
+        for commit in self.commits:
+            if patchtest_patterns.mbox_github_username.search_string(commit.commit_message):
+                self.fail('Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames', commit=commit)
+
     def test_bugzilla_entry_format(self):
         for commit in self.commits:
             if not patchtest_patterns.mbox_bugzilla.search_string(commit.commit_message):
-- 
2.39.5


