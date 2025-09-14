Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF752CA0EE8
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 17:47:20 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.14249.1757872032271514360
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 10:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d6KM2/wU;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso6924274a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 10:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757872031; x=1758476831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=z5ijDvGggkbER6nZMMv0pMBZ3GOyHk4dpCmXZshnX34=;
        b=d6KM2/wUY2XvI4pkFOUdDFuh8OTJ8no3VaR2RfdQXXjuxRZz17Bj7Jr0FrSD53c8El
         6gWe+eKzqwKiS5YEJK31pKilemekmcZB2UcV/vZsvEzGLFZRubkef/MvRrP+7VpT5uWy
         p8s7yvYGkyIHjROmsV/ll3mxzY2Ct5eWMSxh6b899g2MPiODCOI+apgGg1TcsNlwFkAU
         XVVVUAHwdWfJZQmmypiLxUIFo9gwyg9EaBUed6EM/W+nyUT7XS5fNAlXeMH5lW0dcgzY
         lyCQTIxla9qSt7Jj45jQ5CNcYN9EQOk+/ucBWI/ZFq9+qNxUaKHgQWzAG+wr8IB58Ayu
         ZYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757872031; x=1758476831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5ijDvGggkbER6nZMMv0pMBZ3GOyHk4dpCmXZshnX34=;
        b=pXqROD59AX+7Wrcb9GmD0Zx0whHiMjT1QfNLaGPINpX72lm71b7mi8OKXPDdjMdlzx
         sLGZYrS52dzzzNXd2pTAWcD2hc9QwYw43VZxWpOLBXytV9U3or+6h/F8XqNzYXHOOWIT
         2BpuNIX17xLuce9xT4T2FPhAf4ncy9gzj3GSLzWGue9NwnpFyvtycsLIy7seisdK3pRj
         FPsqBBBDg1S/3dw8oX7Sg8sJUeWyxXgiKnVkA0RaWA1kFT8yqJ/ZC2UEeNhtlffEGt//
         O76w5i2d+FPjMyuas6ztrUPVhp2Ey4l9KYFv1HAOrgs14cgPX2C56V5kyiQQDwVhETIz
         y7XQ==
X-Gm-Message-State: AOJu0Yw29sfhacQYGGv9TcUUyKSD62PQQs4QKg6Mgm+zO0O70+J3WAPQ
	o2z4FRQWDIaEQNIuqq1GwV65CTUGShhotuWBfh+gn6/y9yVIrlATVYUA2m4utQ==
X-Gm-Gg: ASbGncsSvckhffZVFCp3NRa7HQ15c2xw3zL41o+70YK0dBz8njObDPjL6wmfd9lOSn5
	ALmm2TUcOG79UllVyrufXL79JR4vVy3wmrvLBWFVMsyCKUrBXcyI5EUKBo+Z61DAsR1MVa37d3D
	3Y8TZ1s4UwJPZnk43m6pPJP4ML1uQm3Fa3pKhOZs/hw7clSj+aFklViZSFcdslF+LVV8f0Sm4dR
	ZGUo1dmgR4RiGBYTczLlUXOdrkIXraFfPm0UehXe/d4ZqQ1ePLZX3C5DLDlE4P2sTEtF7822W7X
	Rm/aGnd9UpUA8mMomMYx2AhXp6CpQcVQF0OFTpVb6F/KbLF2Nox6CuxTHQmCTlYHhI82HfhA2th
	c1580T6S8CDTtAS6GR+y+
X-Google-Smtp-Source: AGHT+IGJ2A3ULzIJWD/T/okZYYXxe5NcTXIr7VInUnI/RwN/EncTCRF1A0ak/Pa2tz4BHdFDE32slw==
X-Received: by 2002:a05:6402:2706:b0:62e:eded:43a4 with SMTP id 4fb4d7f45d1cf-62eeded4539mr7521532a12.23.1757872030434;
        Sun, 14 Sep 2025 10:47:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec6b6cec5sm7251871a12.1.2025.09.14.10.47.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:47:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patchtest: don't match BitBake python expansion as GitHub username
Date: Sun, 14 Sep 2025 19:47:09 +0200
Message-ID: <20250914174709.3230701-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 17:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223365

BitBake's Python expansion syntax looks very similar to GitHub usernames:
${@foo} - which triggers a false alarm from patchtest.

This patch adds a negative lookahead to the GitHub username matching pattern:
only match in case the pattern doesn't start with "${" characters.

Also add a test for it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/lib/patchtest/patchtest_patterns.py      |  2 +-
 ...Mbox.test_commit_message_user_tags.1.pass} |  0
 ...tMbox.test_commit_message_user_tags.2.pass | 66 +++++++++++++++++++
 3 files changed, 67 insertions(+), 1 deletion(-)
 rename meta/lib/patchtest/selftest/files/{TestMbox.test_commit_message_user_tags.pass => TestMbox.test_commit_message_user_tags.1.pass} (100%)
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.2.pass

diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtest/patchtest_patterns.py
index 50637cf499..655ecfd049 100644
--- a/meta/lib/patchtest/patchtest_patterns.py
+++ b/meta/lib/patchtest/patchtest_patterns.py
@@ -59,7 +59,7 @@ mbox_bugzilla_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
 mbox_revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
 mbox_shortlog_maxlength = 90
 # based on https://stackoverflow.com/questions/30281026/regex-parsing-github-usernames-javascript
-mbox_github_username = pyparsing.Regex('\B@([a-z0-9](?:-(?=[a-z0-9])|[a-z0-9]){0,38}(?<=[a-z0-9]))')
+mbox_github_username = pyparsing.Regex('\B(?<!\${)@([a-z0-9](?:-(?=[a-z0-9])|[a-z0-9]){0,38}(?<=[a-z0-9]))')
 
 # patch
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.1.pass
similarity index 100%
rename from meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.pass
rename to meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.1.pass
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.2.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.2.pass
new file mode 100644
index 0000000000..cdae2c3fac
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.2.pass
@@ -0,0 +1,66 @@
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: fix CVE-1234-56789
+
+This should pass the ${@test_commit_message_user_tags} test.
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

