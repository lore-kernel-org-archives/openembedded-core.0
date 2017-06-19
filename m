Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4058E78210
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 11:49:39 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y25so10684627wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 04:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Qx3OCHsNvXCvXjuwlfPRP9SFTfICkw+VkF0xdVuT79w=;
	b=KhMA2cRaQ5PmfNjXQOY3ctUh3thJ3PU8bOCTVIiH7kuX9WbUfrwVDwQebbNoNdIwX9
	uQ/DgYa0sFYCUKIKChQMOMVFeHA9qnUesn41cM0er6vdIK/C39Al20aTA5QK3TgRLB6y
	xo8rgQ5ly9HapAqBXoBwemxvque/ST0IbDdjzhYNcOGFfT5KR4rIL35s1d/vH9b6cmYf
	k8lz4iowXK+EXzAeKGEhhrUzhCR1YGvB/UgD9an6DZabjSxiEGTVKktfdyu9S8Q46EWx
	R7F/v3WgpYbbqO0JcHDHvydK7tcD/fixDyY8vmahBgE3U+FXCX7UzW+LS9rVNVYgphNg
	/Uyg==
X-Gm-Message-State: AKS2vOx0YX2s+Ff/seAF0bVkW1BlvNhjb7+X1CLDlliA+4wK0OPuXd5f
	x7eHs8m4x/O8aVMiGNM=
X-Received: by 10.223.170.79 with SMTP id q15mr12813513wrd.134.1497872980309; 
	Mon, 19 Jun 2017 04:49:40 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	l26sm12705643wrl.15.2017.06.19.04.49.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 04:49:39 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 12:49:38 +0100
Message-Id: <20170619114938.8686-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170619102050.32072-1-git@andred.net>
References: <20170619102050.32072-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] gdb: fix gdbserver not working in musl/mips context
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
X-List-Received-Date: Mon, 19 Jun 2017 11:49:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Similar to
  https://bugs.lede-project.org/index.php?do=details&task_id=637&openedfrom=-1%2Bweek

Signed-off-by: André Draszik <adraszik@tycoint.com>
Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 meta/recipes-devtools/gdb/gdb-8.0.inc              |  1 +
 ..._gdb_patches_120-sigprocmask-invalid-call.patch | 45 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/package_devel_gdb_patches_120-sigprocmask-invalid-call.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.0.inc b/meta/recipes-devtools/gdb/gdb-8.0.inc
index 91f2ebfa4b..fba32ce12c 100644
--- a/meta/recipes-devtools/gdb/gdb-8.0.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.0.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
+           file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
 "
 SRC_URI[md5sum] = "c3d35cd949084be53b92cc1e03485f88"
 SRC_URI[sha256sum] = "f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee"
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
2.11.0


