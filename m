Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9CECA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 18:34:03 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.1535.1755887638600270861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 11:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jbPZpnO9;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b471740e488so1999019a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755887638; x=1756492438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+m0Nqbyb0Ka9iASeKqfK5Kqwr1EM9gnvtJfrHQsu0g=;
        b=jbPZpnO9htfuxyM8kSgfPxq6KSZviZgf0EzmQOkAydbGwAopT+8U8StCSdU/qTIhJI
         GEECOACJ668u+fIImtjIkXqL2wKjSbhkeDtW8hZbW6svZDr6N6QrJ7qlI0N77DxTC1gH
         Vx5hEsF79WC7ytOFdiVIfXXWyZxZmb1Oz276rYB3hT2NBQ3EhIcVfcOvf7f/Ed3KD0pr
         D5jIQhkwjWKdyapwbwNt5ieoRUKlQGi+DctIAz+LixvQed7JSjnixWX97S8IfP3f04pw
         Ss3OMhamuE4LeynCKq7N4TgujbnsTlX4zIusX6Am2pPl/D7GA0Uh8POBYWlnU6YDzq+Z
         dNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755887638; x=1756492438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+m0Nqbyb0Ka9iASeKqfK5Kqwr1EM9gnvtJfrHQsu0g=;
        b=cEfRsTc+ezSaz+TNns4rIqwgoyNqLYMbBDqa1fAW9zO/6NecDk3t3P4BHB+x3p3l/X
         q0YGMMli05NVmna6HF9PZIOICtWhPcZwoXK0rVW71lMES4QyOiZ7t7vZAZ5TXzSsY/g6
         mq+/4SjS+JQfwdM/W2jibGS0L+9sbV2RRwjqtwn0pjnYkgp1KXCPjXTz2bjXH5/jJ/Qz
         Sls1nE1OuYjXNNKt5rJno78zfSxjbgiBe2fMDMk+RKJ349NXSq5ejQkcIfvtD+Z+FrcV
         CTr53fS+qkpfzS6aU64pPkHdwYmBjDs43/rF9B/jD3Ju4GtEublHgtLwTj7IJW2RZa1b
         CAQA==
X-Gm-Message-State: AOJu0YwuNSb+R92+/c4/1Hrpu2b4UsKiEzepQdQWmSg+NoOAU+8FXS+l
	Ea9tRjV3Wdr9PPahmD4hJymZM4PaA6avM/Vx08eDNeXLMynOSreN1EyORNUtpS1I
X-Gm-Gg: ASbGnctnCga3LbFqA5LniVKQeMuc9NQbYXqc/LyKm3wjWOq/WWHfc0JdrBjT4mFR+dh
	Tte41uIhMJtZ1AEC41yFqEYDkM6RucV2Oyj9/BOLZcZzNpJQeKWLnQcRZgZT22CFv7U43O7GKnG
	tSTEN0nTFS8WXyr47y5yn96D+35bwEcFRr4GvLQC/yvMKy9ha0bvNJHXSZQenjh4GhL9Scc0ysH
	vC0z5AxVNgIpR51CFB3h8OjXWnPFAjY4CcUDIFs29Ln4Z/XlpnZ4nvHNurfIFrbGmmI0YXn0FVo
	TngOetx9z3VV6rrKFR5FnCK0y+cOj6IxVtDbck0etYy6nQybrdh0RQauE+oS+gkpkmORjb5cBFE
	pg95iyH0MvCJoxxK4wYIx2BkhtEwJhVaMd9NKe1LbBxvx6B0BJtT3LwA3HJkupAOdKE3wzfi8BK
	5nEeXhTViXSyw5J7/AtsJ/kqmIb6bfhzMm3dU78eI=
X-Google-Smtp-Source: AGHT+IF2Z6UUwTqCLUId7nZITqvfgFrEWQKpBpC0O4Bw7XJJs0r+6PU7Tqds+wBKEdYiSk/CjZQmTQ==
X-Received: by 2002:a17:902:ceca:b0:242:a0b0:3c39 with SMTP id d9443c01a7336-2462efbd88emr68883705ad.54.1755887637380;
        Fri, 22 Aug 2025 11:33:57 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688611d4sm2809025ad.82.2025.08.22.11.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:33:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3: Address failing ptests on musl
Date: Fri, 22 Aug 2025 11:33:52 -0700
Message-ID: <20250822183352.2811555-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 18:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222343

Take a partial patch to disable portion of test_makedev, its also applied
in alpine. NODEV does not exist on musl

Add test_null_dlsym to ignore list on musl, it needs GNU ifunc support
and musl does not implement GNU ifuncs

fixes
Failed ptests:
{'python3': ['test_null_dlsym', 'test_makedev', 'python3']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python3/test_posix_nodev_disable.patch       | 16 ++++++++++++++++
 meta/recipes-devtools/python/python3_3.13.7.bb   |  6 ++++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch

diff --git a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
new file mode 100644
index 00000000000..85767e1e898
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
@@ -0,0 +1,16 @@
+Disable part of test_posix.test_makedev that depends on the NODEV
+macro being defined (missing on musl).
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/31794]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Lib/test/test_posix.py
++++ b/Lib/test/test_posix.py
+@@ -757,7 +757,7 @@ class PosixTester(unittest.TestCase):
+             self.assertRaises((ValueError, OverflowError), posix.makedev, x, minor)
+             self.assertRaises((ValueError, OverflowError), posix.makedev, major, x)
+ 
+-        if sys.platform == 'linux':
++        if False:
+             NODEV = -1
+             self.assertEqual(posix.major(NODEV), NODEV)
+             self.assertEqual(posix.minor(NODEV), NODEV)
diff --git a/meta/recipes-devtools/python/python3_3.13.7.bb b/meta/recipes-devtools/python/python3_3.13.7.bb
index 81d034bec6b..2fe0ae1a8f3 100644
--- a/meta/recipes-devtools/python/python3_3.13.7.bb
+++ b/meta/recipes-devtools/python/python3_3.13.7.bb
@@ -31,7 +31,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
            "
-
+SRC_URI:append:libc-musl = "\
+           file://test_posix_nodev_disable.patch \
+           "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
@@ -247,7 +249,7 @@ do_install:append:class-nativesdk () {
 }
 
 do_install_ptest:append:class-target:libc-musl () {
-    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="-x test__locale -x test_c_locale_coercion -x test_locale -x test_os test_re -x test__xxsubinterpreters -x test_threading --ignore test.test_strptime.StrptimeTests.test_date_locale2"|' ${D}${PTEST_PATH}/run-ptest
+    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="-x test__locale -x test_c_locale_coercion -x test_locale -x test_os test_re -x test__xxsubinterpreters -x test_threading --ignore test.test_strptime.StrptimeTests.test_date_locale2 --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym"|' ${D}${PTEST_PATH}/run-ptest
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"

