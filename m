Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 23DB96DF8D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 08:54:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB58sURi019196
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 00:54:30 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 5 Dec 2013 00:54:29 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 16:55:11 +0800
Message-ID: <f728bc59095fc51372c8771356ca7fef2ed71bb5.1386232830.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386232830.git.Qi.Chen@windriver.com>
References: <cover.1386232830.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libgcrypt: fix compile error with '-O2' in sysroot path
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
X-List-Received-Date: Thu, 05 Dec 2013 08:54:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Characters like '-O2' or '-Ofast' will be replaced by '-O1' when
compiling cipher. If we are cross compiling libgcrypt and sysroot
contains such characters, we would get compile errors because the
sysroot path has been modified.

Fix this by adding whitespaces before and after the original matching
pattern in the sed command.

[YOCTO #5628]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...fix-compile-error-with-O2-in-sysroot-path.patch |   46 ++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch

diff --git a/meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch
new file mode 100644
index 0000000..6b1f119
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Pending
+
+libgcrypt: fix building error with '-O2' in sysroot path
+
+Characters like '-O2' or '-Ofast' will be replaced by '-O1' when compiling cipher.
+If we are cross compiling libgcrypt and sysroot contains such characters, we would
+get compile errors because the sysroot path has been modified.
+
+Fix this by adding blank spaces before and after the original matching pattern in the
+sed command.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ cipher/Makefile.am |    2 +-
+ cipher/Makefile.in |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cipher/Makefile.am b/cipher/Makefile.am
+index 76cdc96..9a89792 100644
+--- a/cipher/Makefile.am
++++ b/cipher/Makefile.am
+@@ -69,7 +69,7 @@ rfc2268.c \
+ camellia.c camellia.h camellia-glue.c
+ 
+ if ENABLE_O_FLAG_MUNGING
+-o_flag_munging = sed -e 's/-O\([2-9s][2-9s]*\)/-O1/' -e 's/-Ofast/-O1/g'
++o_flag_munging = sed -e 's/ -O\([2-9s][2-9s]*\) / -O1 /' -e 's/ -Ofast / -O1 /g'
+ else
+ o_flag_munging = cat
+ endif
+diff --git a/cipher/Makefile.in b/cipher/Makefile.in
+index 1394d15..6080d59 100644
+--- a/cipher/Makefile.in
++++ b/cipher/Makefile.in
+@@ -314,7 +314,7 @@ rfc2268.c \
+ camellia.c camellia.h camellia-glue.c
+ 
+ @ENABLE_O_FLAG_MUNGING_FALSE@o_flag_munging = cat
+-@ENABLE_O_FLAG_MUNGING_TRUE@o_flag_munging = sed -e 's/-O\([2-9s][2-9s]*\)/-O1/' -e 's/-Ofast/-O1/g'
++@ENABLE_O_FLAG_MUNGING_TRUE@o_flag_munging = sed -e 's/ -O\([2-9s][2-9s]*\) / -O1 /' -e 's/ -Ofast / -O1 /g'
+ all: all-am
+ 
+ .SUFFIXES:
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index e0dfec2..9383e17 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "libgpg-error libcap"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
-           file://add-pkgconfig-support.patch"
+           file://add-pkgconfig-support.patch \
+           file://fix-compile-error-with-O2-in-sysroot-path.patch"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.9.5


