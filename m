Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 25C4C731FA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:32 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id yy13so325929766pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=IN0/bMFAeVMuXEZ3x5qGD48Cmm9EfByBxxavhyMwPkg=;
	b=n6GOlOJPFYL5PCZc6VZWHvk1eF4INC+MboAyzBJVfDGmMNffB+YLHG7Ud+IpvzIzYw
	gk6XKHO9U92UG2AVcbKicfqMU53YX0pfgVFtMLzH5ltTI53Ey1oDvXq6rV5XiEY7VkAE
	fAXfTS0nftFeUcX9JhJIe9mrTbUVE/zQffcluqeVGalpfrhJOlmnpJnj5cCrYDkUzGfk
	ROXDnWo+FMS9NuTL0l1QLrfvVvYa9wCmSLDrQUqi5xoRMnBwwOa9bj9HSJ2+S/dm4nwA
	/Vz+G4ARempVt9aD0GbecTy2p0d8Ox26JzJ2GjPziVk+ZW2JQmCY7jSXqav48ND43Use
	TzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=IN0/bMFAeVMuXEZ3x5qGD48Cmm9EfByBxxavhyMwPkg=;
	b=hNulHiGpRo85kc6vmbc1Qf6pf+taYGosfoHjyeAqddvjnouCRaXpTMUWMX2TMUIoUx
	CzM4ndw48LtwGxGq12Ymzt29+8cDP7dC0j6fUUMd7I6H1/JQ79gL9LC9K2UyzSwb/CkS
	/iv8WMN3IhQaUWULEcrIYaozXVNC0+h7TwwmyS5gAWFL3XlxZYyLTLTmacryVyhEnlpD
	kOu7n/7y5e6dz3kNTrzF2koynT1rXT3DxCewj8y0bUHlZO00Cf+IvCSYf+1p13Y2xeax
	gwbap2t33FLGRdDNsBSaSLr3KPCYejTRvKHglkexO5q2Ilz0m51wKmfXdLxnlnAWDjBy
	O6eA==
X-Gm-Message-State: ALoCoQlVhhPKSg0jXwbfkMTaCqZLoBcRt7NwPZ/cvElAedJiyiSPOD5KTwQLXQ7ruX151U1Jb/imZmEsz1JEjRPGykTsxDj+Yw==
X-Received: by 10.67.1.69 with SMTP id be5mr27890447pad.6.1453030653205;
	Sun, 17 Jan 2016 03:37:33 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:09 -0800
Message-Id: <5e74a39b03c25135b2223e856ce2afb0d1f199f9.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 36/73] tar: Fix build for musl based targets
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:32 -0000

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


