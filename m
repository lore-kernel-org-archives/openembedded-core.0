Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 418E7734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 15:48:56 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so48727321wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 08:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=JxBQysO0lOcpcnadnPQ8exEboJQ3MkkvO+Be9SsVHyc=;
	b=WABOPab+cD/MCvBVtnUjKYL37qQSc6/KmyDDJHTLdW7nio7kWvrPdfwVRIqz4s7iav
	X4KKp2MuaTW5v2Uf0+qMI3vwBstd1n9qGHPMe81xSVA8QmVH1ux3CIqB0917mE7Bb0tw
	qCNc2mdZ5UGKh7CiX7IIqBkDqx40f9HHdjDQqfK94XEmsSTs0zhKq1YsMy/QrnicZa75
	wtvY1hYVtvHoZolpTUcVarLLOu4BeOJrRIR0/BzNp2n2WoM+dvzJ0YyDDqWzQUcbRIBL
	nMZ3miL+cgrflsG0S60IIvIRBjBFn4kwR9GodWtgSaR9bZmzg9azD35jmdjVmwYZMB8O
	qv4A==
X-Gm-Message-State: ALoCoQlk2f9WWsfOE4x5TZFqKd7zQQaPW2IvV5xqxKEewUBGihp6dhRJpjgoBPSWZUoE7Kqz6j8o
X-Received: by 10.180.108.103 with SMTP id hj7mr13462009wib.11.1440604135885; 
	Wed, 26 Aug 2015 08:48:55 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	ir5sm4457290wjb.23.2015.08.26.08.48.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Aug 2015 08:48:55 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 16:48:28 +0100
Message-Id: <1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [RFC PATCH 1/2] android-tools: import android-tools from meta-smartphone into oe-core
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
X-List-Received-Date: Wed, 26 Aug 2015 15:48:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes were done to trim down the recipe size:
* removed adbd support
* removed android-tools-conf

The main idea is to keep only what is strictly needed for make_ext4fs tool.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../android-tools/disable-selinux-support.patch    | 137 +++++++++++++++++++++
 .../android-tools/reboot-syscall.patch             |  25 ++++
 .../android-tools/remove-libselinux.patch          |  13 ++
 .../android-tools/android-tools_4.2.2.bb           |  51 ++++++++
 4 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/disable-selinux-support.patch
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/reboot-syscall.patch
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/remove-libselinux.patch
 create mode 100644 meta/recipes-devtools/android-tools/android-tools_4.2.2.bb

diff --git a/meta/recipes-devtools/android-tools/android-tools/disable-selinux-support.patch b/meta/recipes-devtools/android-tools/android-tools/disable-selinux-support.patch
new file mode 100644
index 0000000..738f575
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools/disable-selinux-support.patch
@@ -0,0 +1,137 @@
+diff --git a/extras/ext4_utils/make_ext4fs.c b/extras/ext4_utils/make_ext4fs.c
+index b2d1426..94e92d6 100644
+--- a/extras/ext4_utils/make_ext4fs.c
++++ b/extras/ext4_utils/make_ext4fs.c
+@@ -59,9 +59,11 @@
+ 
+ #else
+ 
++#if 0
+ #include <selinux/selinux.h>
+ #include <selinux/label.h>
+ #include <selinux/android.h>
++#endif
+ 
+ #define O_BINARY 0
+ 
+@@ -178,6 +180,7 @@ static u32 build_directory_structure(const char *full_path, const char *dir_path
+ 			error("can't set android permissions - built without android support");
+ #endif
+ 		}
++#if 0
+ #ifndef USE_MINGW
+ 		if (sehnd) {
+ 			if (selabel_lookup(sehnd, &dentries[i].secon, dentries[i].path, stat.st_mode) < 0) {
+@@ -188,6 +191,7 @@ static u32 build_directory_structure(const char *full_path, const char *dir_path
+ 				printf("Labeling %s as %s\n", dentries[i].path, dentries[i].secon);
+ 		}
+ #endif
++#endif
+ 
+ 		if (S_ISREG(stat.st_mode)) {
+ 			dentries[i].file_type = EXT4_FT_REG_FILE;
+@@ -229,10 +233,12 @@ static u32 build_directory_structure(const char *full_path, const char *dir_path
+ 		dentries[0].file_type = EXT4_FT_DIR;
+ 		dentries[0].uid = 0;
+ 		dentries[0].gid = 0;
++#if 0
+ 		if (sehnd) {
+ 			if (selabel_lookup(sehnd, &dentries[0].secon, dentries[0].path, dentries[0].mode) < 0)
+ 				error("cannot lookup security context for %s", dentries[0].path);
+ 		}
++#endif
+ 		entries++;
+ 		dirs++;
+ 	}
+@@ -270,9 +276,11 @@ static u32 build_directory_structure(const char *full_path, const char *dir_path
+ 			dentries[i].mtime);
+ 		if (ret)
+ 			error("failed to set permissions on %s\n", dentries[i].path);
++#if 0
+ 		ret = inode_set_selinux(entry_inode, dentries[i].secon);
+ 		if (ret)
+ 			error("failed to set SELinux context on %s\n", dentries[i].path);
++#endif
+ 
+ 		free(dentries[i].path);
+ 		free(dentries[i].full_path);
+@@ -562,6 +570,7 @@ int make_ext4fs_internal(int fd, const char *_directory,
+ 	root_mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
+ 	inode_set_permissions(root_inode_num, root_mode, 0, 0, 0);
+ 
++#if 0
+ #ifndef USE_MINGW
+ 	if (sehnd) {
+ 		char *secontext = NULL;
+@@ -578,6 +587,7 @@ int make_ext4fs_internal(int fd, const char *_directory,
+ 		freecon(secontext);
+ 	}
+ #endif
++#endif
+ 
+ 	ext4_update_free();
+ 
+diff --git a/extras/ext4_utils/make_ext4fs_main.c b/extras/ext4_utils/make_ext4fs_main.c
+index b6c740d..ce31764 100644
+--- a/extras/ext4_utils/make_ext4fs_main.c
++++ b/extras/ext4_utils/make_ext4fs_main.c
+@@ -29,6 +29,7 @@
+ #include <private/android_filesystem_config.h>
+ #endif
+ 
++#if 0
+ #ifndef USE_MINGW
+ #include <selinux/selinux.h>
+ #include <selinux/label.h>
+@@ -36,6 +37,7 @@
+ #else
+ struct selabel_handle;
+ #endif
++#endif
+ 
+ #include "make_ext4fs.h"
+ #include "ext4_utils.h"
+@@ -72,9 +74,11 @@ int main(int argc, char **argv)
+ 	int exitcode;
+ 	int verbose = 0;
+ 	struct selabel_handle *sehnd = NULL;
++#if 0
+ #ifndef USE_MINGW
+ 	struct selinux_opt seopts[] = { { SELABEL_OPT_PATH, "" } };
+ #endif
++#endif
+ 
+ 	while ((opt = getopt(argc, argv, "l:j:b:g:i:I:L:a:S:fwzJsctv")) != -1) {
+ 		switch (opt) {
+@@ -131,6 +135,7 @@ int main(int argc, char **argv)
+ 			fprintf(stderr, "Warning: -t (initialize inode tables) is deprecated\n");
+ 			break;
+ 		case 'S':
++#if 0
+ #ifndef USE_MINGW
+ 			seopts[0].value = optarg;
+ 			sehnd = selabel_open(SELABEL_CTX_FILE, seopts, 1);
+@@ -139,6 +144,7 @@ int main(int argc, char **argv)
+ 				exit(EXIT_FAILURE);
+ 			}
+ #endif
++#endif
+ 			break;
+ 		case 'v':
+ 			verbose = 1;
+@@ -149,6 +155,7 @@ int main(int argc, char **argv)
+ 		}
+ 	}
+ 
++#if 0
+ #if !defined(HOST)
+ 	// Use only if -S option not requested
+ 	if (!sehnd && mountpoint) {
+@@ -160,6 +167,7 @@ int main(int argc, char **argv)
+ 		}
+ 	}
+ #endif
++#endif
+ 
+ 	if (wipe && sparse) {
+ 		fprintf(stderr, "Cannot specifiy both wipe and sparse\n");
diff --git a/meta/recipes-devtools/android-tools/android-tools/reboot-syscall.patch b/meta/recipes-devtools/android-tools/android-tools/reboot-syscall.patch
new file mode 100644
index 0000000..0055416
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools/reboot-syscall.patch
@@ -0,0 +1,25 @@
+Subject: port android_reboot() to call the reboot syscall via syscall() (glibc) rather than __reboot (bionic)
+Author: Loïc Minier <loic.minier@ubuntu.com>
+
+--- a/core/libcutils/android_reboot.c
++++ b/core/libcutils/android_reboot.c
+@@ -21,6 +21,8 @@
+ #include <fcntl.h>
+ #include <stdio.h>
+ #include <string.h>
++#include <linux/reboot.h>
++#include <sys/syscall.h>
+ 
+ #include <cutils/android_reboot.h>
+ 
+@@ -121,8 +123,8 @@
+             break;
+ 
+         case ANDROID_RB_RESTART2:
+-            ret = __reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
+-                           LINUX_REBOOT_CMD_RESTART2, arg);
++            ret = syscall(SYS_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
++                          LINUX_REBOOT_CMD_RESTART2, arg);
+             break;
+ 
+         default:
diff --git a/meta/recipes-devtools/android-tools/android-tools/remove-libselinux.patch b/meta/recipes-devtools/android-tools/android-tools/remove-libselinux.patch
new file mode 100644
index 0000000..24690b2
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools/remove-libselinux.patch
@@ -0,0 +1,13 @@
+diff --git a/debian/makefiles/ext4_utils.mk b/debian/makefiles/ext4_utils.mk
+index cb64916..60e81d6 100644
+--- a/debian/makefiles/ext4_utils.mk
++++ b/debian/makefiles/ext4_utils.mk
+@@ -36,7 +36,7 @@ CPPFLAGS+= -I/usr/include
+ CPPFLAGS+= -I../../core/include
+ CPPFLAGS+= -I../../core/libsparse/include/
+ 
+-LIBS+= -lz -lselinux
++LIBS+= -lz
+ 
+ OBJS= $(SRCS:.c=.o)
+ 
diff --git a/meta/recipes-devtools/android-tools/android-tools_4.2.2.bb b/meta/recipes-devtools/android-tools/android-tools_4.2.2.bb
new file mode 100644
index 0000000..7780e09
--- /dev/null
+++ b/meta/recipes-devtools/android-tools/android-tools_4.2.2.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "Different utilities from Android - based on the corresponding ubuntu \
+package"
+SECTION = "console/utils"
+LICENSE = "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM = " \
+  file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
+  file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+  file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378 \
+  file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
+  file://${WORKDIR}/debian/copyright;md5=141efd1050596168ca05ced04e4f498b \
+"
+
+DEPENDS = "zlib openssl"
+
+# Use same version than ubuntu does here
+BASE_PV = "4.2.2+git20130218"
+PV = "${BASE_PV}-3ubuntu13"
+
+BBCLASSEXTEND += "native"
+
+SRC_URI = " \
+    https://launchpad.net/ubuntu/+archive/primary/+files/android-tools_${BASE_PV}.orig.tar.xz;name=source \
+    https://launchpad.net/ubuntu/+archive/primary/+files/android-tools_${PV}.debian.tar.gz;name=debian \
+    file://reboot-syscall.patch \
+    file://disable-selinux-support.patch \
+    file://remove-libselinux.patch;patchdir=.. \
+"
+S = "${WORKDIR}/android-tools"
+
+SRC_URI[source.md5sum] = "0e653b129ab0c95bdffa91410c8b55be"
+SRC_URI[source.sha256sum] = "9bfba987e1351b12aa983787b9ae4424ab752e9e646d8e93771538dc1e5d932f"
+SRC_URI[debian.md5sum] = "5e409d01caf3c33fc60a2100464754ff"
+SRC_URI[debian.sha256sum] = "320757edc8af015f40335c41dc96bf37e2d50c9f3a40a31e64264ff6e2dba5e3"
+
+do_compile() {
+    # Setting both variables below causing our makefiles to not work with implicit make
+    # rules
+    unset CFLAGS
+    unset CPPFLAGS
+
+    sed -i "s%^CPPFLAGS+= -I/usr/include%# we don't want to include headers from host CPPFLAGS+= -I/usr/include%g" ${WORKDIR}/debian/makefiles/ext4_utils.mk
+
+    oe_runmake -f ${WORKDIR}/debian/makefiles/ext4_utils.mk -C ${S}/extras/ext4_utils clean
+    oe_runmake -f ${WORKDIR}/debian/makefiles/ext4_utils.mk -C ${S}/extras/ext4_utils
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/extras/ext4_utils/make_ext4fs ${D}${bindir}
+
+}
-- 
2.3.5


