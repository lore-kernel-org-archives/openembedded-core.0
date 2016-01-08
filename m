Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id BF20C763F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:53 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id e32so258874966qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=IN0/bMFAeVMuXEZ3x5qGD48Cmm9EfByBxxavhyMwPkg=;
	b=jSfN2bHZWOCEx+y9pS8cJWRv+Tn5JAxOecV40ZLfHCrbEMRnWkgdqEecH4EupKKhOj
	n5eJ3ieMob1d4NL6txhNO35/2EZ6Ym+WqPr8FLeu51bGjlRBm7WNPwV8tpovTT4gvYOS
	WpUmaayhba+5QJjjkG6SW1WYe2DvjAhq1FCg/miE4/g8kRcrHl6Q03L+3NCmorGh02d8
	xxLOoZGq3Dw2qQ0fuiLoxLlc1E0Xu44xapRUnttr/1UHpE89ElC2d/a0hIxIveg9awBI
	CGbFN3OI9tMezK5fbJcGkgIS4iA+qs4POCi9tEU/z1SK6uY0sWhAjaxX72/K22U/EvCt
	9mEg==
X-Received: by 10.140.141.138 with SMTP id 132mr42547373qhn.74.1452248394651; 
	Fri, 08 Jan 2016 02:19:54 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:08 +0000
Message-Id: <9fa50c3ef8b7545ca25d5dcc04fc9ba7f22cdb59.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 40/53] tar: Fix build for musl based targets
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:54 -0000

It only considered linux-gnu hosts when cross compiling
here we add linux-musl to the mix as well

Fixes errors e.g.

1.28-r0/tar-1.28/src/tar.c:1351:5: error: 'SAVEDIR_SORT_INODE'
undeclared here (not in a function)
|      SAVEDIR_SORT_INODE
|      ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/tar/tar/musl_dirent.patch | 19 +++++++++++++++++++
 meta/recipes-extended/tar/tar_1.28.bb           |  6 ++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/musl_dirent.patch

diff --git a/meta/recipes-extended/tar/tar/musl_dirent.patch b/meta/recipes-extended/tar/tar/musl_dirent.patch
new file mode 100644
index 0000000..b0dc16c
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/musl_dirent.patch
@@ -0,0 +1,19 @@
+musl has valid d_ino implementation
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: tar-1.28/m4/d-ino.m4
+===================================================================
+--- tar-1.28.orig/m4/d-ino.m4
++++ tar-1.28/m4/d-ino.m4
+@@ -40,7 +40,8 @@ AC_DEFUN([gl_CHECK_TYPE_STRUCT_DIRENT_D_
+            [gl_cv_struct_dirent_d_ino=no],
+            [case "$host_os" in
+                            # Guess yes on glibc systems with Linux kernel.
+-              linux*-gnu*) gl_cv_struct_dirent_d_ino="guessing yes" ;;
++              linux*-gnu*|linux*-musl*)
++                           gl_cv_struct_dirent_d_ino="guessing yes" ;;
+                            # If we don't know, assume the worst.
+               *)           gl_cv_struct_dirent_d_ino="guessing no" ;;
+             esac
diff --git a/meta/recipes-extended/tar/tar_1.28.bb b/meta/recipes-extended/tar/tar_1.28.bb
index 8816000..518e622 100644
--- a/meta/recipes-extended/tar/tar_1.28.bb
+++ b/meta/recipes-extended/tar/tar_1.28.bb
@@ -7,6 +7,12 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI += "file://remove-gets.patch \
+            file://musl_dirent.patch \
            "
 SRC_URI[md5sum] = "8f32b2bc1ed7ddf4cf4e4a39711341b0"
 SRC_URI[sha256sum] = "60e4bfe0602fef34cd908d91cf638e17eeb09394d7b98c2487217dc4d3147562"
+
+do_install_append_libc-musl() {
+	rm -f ${D}${libdir}/charset.alias
+	rmdir ${D}${libdir}
+}
-- 
2.7.0


