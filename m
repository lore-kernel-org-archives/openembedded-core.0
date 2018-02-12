Return-Path: <anders.roxell@linaro.org>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id AFB4178289
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 22:38:35 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id q69so4702219lfi.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 14:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=7OkCv+XjYXrMkdJRS1okFmJxXqJepIukOSHM2fzQ5Rs=;
	b=HAxcoCJZjJIuGuzlixDGVDf5f/fdcyudJ9VYcmFjVICBrUU6BAaIlPBLIjWYQlYeuw
	Pm1r90/A8eb3GiEnuaQrBpEWpxtf6E+TyVvSv3pVz72bmmPnAvBqTYXjx+fskKEb+Cov
	YlBncIG50dWZYlBOMXGplbhJO0qRo1SbEeb/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7OkCv+XjYXrMkdJRS1okFmJxXqJepIukOSHM2fzQ5Rs=;
	b=RiF1+cVOw1lpaLtWge8PyLu/S4DW0bk/ZekQfGtcfdf8jt9mm3rZVNGvXLC1le27pX
	6u4HRc2FhdjR68goZYSf2u/x1cbqRav+lMmY5rBAflV5ETPWOzBQcc9zRsMZ9/W6t3HB
	Gf+aEVkDGn+HnrfXxp+6DcjRc16ez5kZvQJLKt7+ikJbTRXQ62kjdvCFU5CPB4ogDZYZ
	izdOydFDbo2mVUJtBmKVGFTLGeTALrrMrDRBerMNelMFx1k8//qouy5cAAfcdGxPhHVa
	nEE1CUegszTBQmIa0flxdrz2SKfsyBpCu/CGgfWh7ZdIzjCg+Z+ZPRav0+y7UvqU5mnF
	GRRg==
X-Gm-Message-State: APf1xPB/lyQz41PhgqklqPFPgym3mAnVsvOXVETmBZ2+AJqOqQR9lsYx
	DKgJNlq/dsu5sLvAUCq6v1qfwFdFWFs=
X-Google-Smtp-Source: AH8x2276DXAWgxIG9fJd/B5KbuF65RXN3y8M4Np0T5i73oquopRttVLTKKyCHVryIe7ut3mq9nyiJg==
X-Received: by 10.25.225.84 with SMTP id y81mr6195809lfg.102.1518475115873;
	Mon, 12 Feb 2018 14:38:35 -0800 (PST)
Received: from localhost (c-2c3d70d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.61.44])
	by smtp.gmail.com with ESMTPSA id c70sm802239ljf.34.2018.02.12.14.38.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 14:38:34 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 23:38:08 +0100
Message-Id: <20180212223808.9016-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2] ltp: fix fanotify06 test
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
X-List-Received-Date: Mon, 12 Feb 2018 22:38:35 -0000

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
index 0000000000..e57b6cd91e
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
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2018-January/006915.html]
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
index 369b98df9b..88f3bb4879 100644
--- a/meta/recipes-extended/ltp/ltp_20180118.bb
+++ b/meta/recipes-extended/ltp/ltp_20180118.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
+           file://0040-fanotify-the-mount-fs_type-should-be-given.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


