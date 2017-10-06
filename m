Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C7A1B7822B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:10 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f4so7563928wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2zndl7w4SaVjsyzg6kLziAuW01WThK51RBrbdvCSZUE=;
	b=uFKHS9vPVqhJHKeXyIc3hDswgqvYdjL0C5vw34SXJOh+Zbgo6J40H7El1INjZLjc+t
	LS359pb6+4zGQOCrZ7KVPLUeOij64Q5eOFg3TFX+X9AuG9TgPLQkRtuwUGBrczT/FVLy
	oYYmUnmus+palQzUA6TpVKnX4Ta1q7UbgZOUOCrarUho/+1TIKcAm67WbFpqXEE5U2OA
	mMm/uOJR4fVG7/l2DpiEOX8/MOnH6rkk8k3WBnTWrEJj9nm2IzNO6o468NLhsOGZQYqB
	jUugUqoefeiFUI45FKaI/IxfMSnXmvXtN4XUf8TlSctbxam8GiJ8l+yrSmDnhfYWU72P
	gFMw==
X-Gm-Message-State: AMCzsaUjQrH+/vTHF0zz95TUQ2MwIxl9G6wNfAc2JAGUqynedNzu9v81
	wIjXh8E8NE34Klr3wHYSKOMnteel
X-Google-Smtp-Source: AOwi7QAyoBcIXQXJCosD4+j1mjJCPs76SPqE/sv8B4ctFeKH4yZ9hc9gZFIOArZZwYBF+pWmdKeZ1Q==
X-Received: by 10.28.147.208 with SMTP id v199mr1540576wmd.136.1507291991345; 
	Fri, 06 Oct 2017 05:13:11 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:10 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:43 +0100
Message-Id: <20171006121259.5817-2-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 01/17] gdb: fix gdbserver not working in musl/mips context
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Similar to
  https://bugs.lede-project.org/index.php?do=details&task_id=637&openedfrom=-1%2Bweek

Signed-off-by: André Draszik <adraszik@tycoint.com>
Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit 0b9d94a5e54191f93659f7b4e7a3cb4376487823)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-devtools/gdb/gdb-7.12.1.inc           |  1 +
 ..._gdb_patches_120-sigprocmask-invalid-call.patch | 45 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/package_devel_gdb_patches_120-sigprocmask-invalid-call.patch

diff --git a/meta/recipes-devtools/gdb/gdb-7.12.1.inc b/meta/recipes-devtools/gdb/gdb-7.12.1.inc
index b15a2b5832..634756ce45 100644
--- a/meta/recipes-devtools/gdb/gdb-7.12.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.12.1.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
+           file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
 "
 SRC_URI[md5sum] = "193453347ddced7acb6b1cd2ee8f2e4b"
 SRC_URI[sha256sum] = "4607680b973d3ec92c30ad029f1b7dbde3876869e6b3a117d8a7e90081113186"
diff --git a/meta/recipes-devtools/gdb/gdb/package_devel_gdb_patches_120-sigprocmask-invalid-call.patch b/meta/recipes-devtools/gdb/gdb/package_devel_gdb_patches_120-sigprocmask-invalid-call.patch
new file mode 100644
index 0000000000..c5484f789d
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/package_devel_gdb_patches_120-sigprocmask-invalid-call.patch
@@ -0,0 +1,45 @@
+From 56893a61aa4f0270fa8d1197b9848247f90fce0d Mon Sep 17 00:00:00 2001
+From: Yousong Zhou <yszhou4tech@gmail.com>
+Date: Fri, 24 Mar 2017 10:36:03 +0800
+Subject: [PATCH] Fix invalid sigprocmask call
+
+The POSIX document says
+
+    The pthread_sigmask() and sigprocmask() functions shall fail if:
+
+    [EINVAL]
+    The value of the how argument is not equal to one of the defined values.
+
+and this is how musl-libc is currently doing.  Fix the call to be safe
+and correct
+
+ [1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/pthread_sigmask.html
+
+gdb/ChangeLog:
+2017-03-24  Yousong Zhou  <yszhou4tech@gmail.com>
+
+    * common/signals-state-save-restore.c (save_original_signals_state):
+    Fix invalid sigprocmask call.
+---
+Upstream-Status: Pending [not author, cherry-picked from LEDE https://bugs.lede-project.org/index.php?do=details&task_id=637&openedfrom=-1%2Bweek]
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+ gdb/ChangeLog                           | 5 +++++
+ gdb/common/signals-state-save-restore.c | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/gdb/common/signals-state-save-restore.c b/gdb/common/signals-state-save-restore.c
+index d11a9ae..734335c 100644
+--- a/gdb/common/signals-state-save-restore.c
++++ b/gdb/common/signals-state-save-restore.c
+@@ -41,7 +41,7 @@ save_original_signals_state (void)
+   int i;
+   int res;
+ 
+-  res = sigprocmask (0,  NULL, &original_signal_mask);
++  res = sigprocmask (SIG_BLOCK,  NULL, &original_signal_mask);
+   if (res == -1)
+     perror_with_name (("sigprocmask"));
+ 
+-- 
+2.6.4
+
-- 
2.14.2


