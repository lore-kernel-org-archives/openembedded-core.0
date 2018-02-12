Return-Path: <anders.roxell@linaro.org>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3E258606CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 21:57:24 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id 37so3564569lfs.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 13:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=LkOMwjLT783Qf/6GruqEWaP/mbKxVyYQ0fmLO2Be92s=;
	b=beYSQxzXcGcu27iBTlHqeRpcgbD/6CD9ugbVHnQ11zJA1k5L8sqHsG7+oYu+X2/VK8
	H04GSvq29gN1FOLqvG28kT0NDFDSWdMcJ4zyZjba+A/gbNQarDhTqU6Jgoda4+ZeFUlU
	tXqiIOm9mz03o6ndDTwWTQzYRtHOO8wOAcIng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LkOMwjLT783Qf/6GruqEWaP/mbKxVyYQ0fmLO2Be92s=;
	b=h/m6vQ/WgpwpqYxgZf7zVpB4ijQATe+BFz/SsZQlBOrIhjhInB92nOz9ECC7Np2ds6
	kQAQN6AZzy6PCuYrZWUrBnNzTyFgHG+nRBeZf8Zj6+qNNuoYzomM3cUfkoJ3rYSVCZR7
	Ehr6LVOgocpHjR6xoWQDTlytOpRzjvarN2VqqgjLtWw0j6oXu3ZfwCMKtNZm86mCVUou
	PATy9wCMba0e06notb5znV0GwMR0dpQhsFdUi/Lf1+rsocefzVZ53c1oDPhmEIhJVz2x
	V5mn0cH6RJG9dfb0pTfZTfWxUdp9lRGp7HZKQ9pAas2vkgKDunx+gr/DTFSdoXfvBFUw
	rF0Q==
X-Gm-Message-State: APf1xPBT5I1MCffUJQUbqU0OBQ3kfM6sBpinCFaH2DldpqYp7RljyJ2v
	wvVxrgtfRQCAZRd1QCufchJBYPiRUg0=
X-Google-Smtp-Source: AH8x225xBlJ7L5VMCOaKgVozhVR5K1TYD+E97dtuBKiAl4H3XP47QM1m95fRUjZm3u+0Iw9CQNSgLg==
X-Received: by 10.25.68.10 with SMTP id r10mr1273260lfa.124.1518472645417;
	Mon, 12 Feb 2018 13:57:25 -0800 (PST)
Received: from localhost (c-2c3d70d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.61.44]) by smtp.gmail.com with ESMTPSA id
	q77sm1190461lfd.23.2018.02.12.13.57.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 13:57:24 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 22:57:21 +0100
Message-Id: <20180212215721.15929-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] ltp: fix fanotify06 test
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
X-List-Received-Date: Mon, 12 Feb 2018 21:57:25 -0000

This patch fixes the fanotify06 test.

http://lists.linux.it/pipermail/ltp/2018-January/006915.html

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 ...anotify-the-mount-fs_type-should-be-given.patch | 38 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180118.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0040-fanotify-the-mount-fs_type-should-be-given.patch

diff --git a/meta/recipes-extended/ltp/ltp/0040-fanotify-the-mount-fs_type-should-be-given.patch b/meta/recipes-extended/ltp/ltp/0040-fanotify-the-mount-fs_type-should-be-given.patch
new file mode 100644
index 0000000000..6b4dc30712
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0040-fanotify-the-mount-fs_type-should-be-given.patch
@@ -0,0 +1,38 @@
+From c1b440c04d86adf77308fcd173d41dbfc6e66299 Mon Sep 17 00:00:00 2001
+From: Li Wang <liwang@redhat.com>
+Date: Tue, 23 Jan 2018 16:23:14 +0800
+Subject: [PATCH 40/40] fanotify: the mount fs_type should be given
+
+This commmit 28507e514c(safe_mount: Do not try mount() syscall for FUSE fs)
+involves FUSE fs check in safe_mount(), so we should give the "fs_type" when
+calling that in case the system kill our program.
+
+  cmdline="fanotify06"
+  contacts=""
+  analysis=exit
+  <<<test_output>>>
+  tst_test.c:980: INFO: Timeout per run is 0h 10m 00s
+  tst_test.c:1025: BROK: Test killed by SIGSEGV!
+
+Signed-off-by: Li Wang <liwang@redhat.com>
+Upstream-Status: Submitted
+---
+ testcases/kernel/syscalls/fanotify/fanotify06.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/fanotify/fanotify06.c b/testcases/kernel/syscalls/fanotify/fanotify06.c
+index e63e457a1..8cbe1adc6 100644
+--- a/testcases/kernel/syscalls/fanotify/fanotify06.c
++++ b/testcases/kernel/syscalls/fanotify/fanotify06.c
+@@ -221,7 +221,7 @@ void test01(void)
+ static void setup(void)
+ {
+ 	SAFE_MKDIR(MOUNT_NAME, 0755);
+-	SAFE_MOUNT(MOUNT_NAME, MOUNT_NAME, NULL, MS_BIND, NULL);
++	SAFE_MOUNT(MOUNT_NAME, MOUNT_NAME, "none", MS_BIND, NULL);
+ 	mount_created = 1;
+ 	SAFE_CHDIR(MOUNT_NAME);
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
index a0dd9aa19b..4c6be16e30 100644
--- a/meta/recipes-extended/ltp/ltp_20180118.bb
+++ b/meta/recipes-extended/ltp/ltp_20180118.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
+           file://0040-fanotify-the-mount-fs_type-should-be-given.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


