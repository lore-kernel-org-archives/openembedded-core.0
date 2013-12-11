Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1C56D64B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 09:05:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBB95eb9020575
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 01:05:40 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 11 Dec 2013 01:05:39 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Dec 2013 17:06:29 +0800
Message-ID: <dcc009fb321188b3fcced26ca26addb817cc9a95.1386752701.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386752701.git.Qi.Chen@windriver.com>
References: <cover.1386752701.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] libgcrypt: fix compile error with '-O2' in sysroot path
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
X-List-Received-Date: Wed, 11 Dec 2013 09:05:40 -0000
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
 ...ix-building-error-with-O2-in-sysroot-path.patch |   32 ++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch

diff --git a/meta/recipes-support/libgcrypt/files/libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
new file mode 100644
index 0000000..a3e5403
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
@@ -0,0 +1,32 @@
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
+ 1 file changed, 1 insertion(+), 1 deletion(-)
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
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index e0dfec2..5ab0c11 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "libgpg-error libcap"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
-           file://add-pkgconfig-support.patch"
+           file://add-pkgconfig-support.patch \
+           file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.9.5


