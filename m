Return-Path: <Ming.Liu@windriver.com>
X-Greylist: delayed 2214 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 May 2014 03:07:30 UTC
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52EA3601A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 03:07:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s452UbMi000622
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 May 2014 19:30:37 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Sun, 4 May 2014 19:30:37 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 May 2014 10:30:33 +0800
Message-ID: <1399257033-7155-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH V2] ldconfig-native: also default to lib32 and lib64 directories
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
X-List-Received-Date: Mon, 05 May 2014 03:07:31 -0000
Content-Type: text/plain

make ldconfig default to /lib+/usr/lib, /lib32+/usr/lib32 and
/lib64+/usr/lib64 on bi-ABI architectures.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../ldconfig-default-to-all-multilib-dirs.patch    | 37 ++++++++++++++++++++++
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |  4 ++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch

diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
new file mode 100644
index 0000000..5ed4f6f
--- /dev/null
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+make ldconfig default to both /lib+/usr/lib, /lib32+/usr/lib32 and
+/lib64+/usr/lib64 on bi-ABI architectures.
+
+---
+ ldconfig.c |   10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff -urpN a/ldconfig.c b/ldconfig.c
+--- a/ldconfig.c
++++ b/ldconfig.c
+@@ -52,7 +52,11 @@
+ 
+ #define SYSCONFDIR "/etc"
+ #define LIBDIR "/usr/lib"
++#define LIBDIR32 "/usr/lib32"
++#define LIBDIR64 "/usr/lib64"
+ #define SLIBDIR "/lib"
++#define SLIBDIR32 "/lib32"
++#define SLIBDIR64 "/lib64"
+ # define N_(msgid)  msgid
+ #define _(msg) msg
+ 
+@@ -1373,6 +1377,12 @@ main (int argc, char **argv)
+       add_system_dir (SLIBDIR);
+       if (strcmp (SLIBDIR, LIBDIR))
+ 	add_system_dir (LIBDIR);
++      add_system_dir (SLIBDIR32);
++      if (strcmp (SLIBDIR32, LIBDIR32))
++	add_system_dir (LIBDIR32);
++      add_system_dir (SLIBDIR64);
++      if (strcmp (SLIBDIR64, LIBDIR64))
++	add_system_dir (LIBDIR64);
+     }
+ 
+   const char *aux_cache_file = _PATH_LDCONFIG_AUX_CACHE;
diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
index d7bc444..75ffbf6 100644
--- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
@@ -10,7 +10,9 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://32and64bit.patch \
            file://endian-ness_handling.patch \
            file://flag_fix.patch \
-           file://endianess-header.patch"
+           file://endianess-header.patch \
+           file://ldconfig-default-to-all-multilib-dirs.patch \
+"
 
 PR = "r2"
 
-- 
1.8.4.1


