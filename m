Return-Path: <zhengjunling@huawei.com>
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [119.145.14.66])
	by mail.openembedded.org (Postfix) with ESMTP id 36A94724DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 10:03:38 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BDX11211; Wed, 01 Apr 2015 18:03:38 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Wed, 1 Apr 2015 18:03:27 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Apr 2015 10:00:25 +0000
Message-ID: <1427882425-19536-1-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.551BC27A.03BA, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 1c9ef20d52c56304773d64cff24680df
Cc: peifeiyue@huawei.com
Subject: [PATCH] uclibc: fix undefinition of '_dl_strchr' in libdl.a
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
X-List-Received-Date: Wed, 01 Apr 2015 10:03:41 -0000
Content-Type: text/plain

The orign_path.patch introduced '_dl_strchr' into ldso/ldso/dl-elf.c, and
caused the following undefined referencing compiling error:

  | .../libdl.a(libdl.os): In function `search_for_named_library':
  | .../dl-elf.c:156: undefined reference to `_dl_strchr'
  | collect2: error: ld returned 1 exit status

I found this problem when compiling gdb in static mode using uclibc.

Add the definition of '_dl_strchr' to fix it. The '_dl_strstr' is added
as well.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
 ...-define-_dl_strchr-and-_dl_strstr-if-not-.patch | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-dl-string.h-define-_dl_strchr-and-_dl_strstr-if-not-.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index a2b2353..68240dc 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -25,5 +25,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://0002-wire-setns-syscall.patch \
 	file://0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch \
 	file://0001-timex-Sync-with-glibc.patch \
+	file://0001-dl-string.h-define-_dl_strchr-and-_dl_strstr-if-not-.patch \
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-dl-string.h-define-_dl_strchr-and-_dl_strstr-if-not-.patch b/meta/recipes-core/uclibc/uclibc-git/0001-dl-string.h-define-_dl_strchr-and-_dl_strstr-if-not-.patch
new file mode 100644
index 0000000..e94fbba
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-dl-string.h-define-_dl_strchr-and-_dl_strstr-if-not-.patch
@@ -0,0 +1,39 @@
+From eb1806f581a134599c1ef26975f514e35663f8c2 Mon Sep 17 00:00:00 2001
+From: Junling Zheng <zhengjunling@huawei.com>
+Date: Tue, 31 Mar 2015 12:00:58 +0000
+Subject: [PATCH] dl-string.h: define _dl_strchr and _dl_strstr if not
+ IS_IN_rtld
+
+We should define _dl_strchr and _dl_strstr when not defining IS_IN_rtld.
+Otherwise, if someone use _dl_strchr or _dl_strstr in the ldso/ldso/dl-
+elf.c, libdl.a will lack the declaration of '_dl_strchr' or '_dl_strstr',
+and there will be an compiling error like the following:
+
+  dl-elf.c:156: undefined reference to `_dl_strchr'
+
+So, add the definition of _dl_strchr and _dl_strstr.
+
+Upstream-Status: Submitted [http://lists.uclibc.org/pipermail/uclibc/2015-March/048888.html]
+
+Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
+---
+ ldso/include/dl-string.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ldso/include/dl-string.h b/ldso/include/dl-string.h
+index aacad10..14ae617 100644
+--- a/ldso/include/dl-string.h
++++ b/ldso/include/dl-string.h
+@@ -204,7 +204,9 @@ static __always_inline char * _dl_get_last_path_component(char *path)
+ # define _dl_strcat strcat
+ # define _dl_strcpy strcpy
+ # define _dl_strcmp strcmp
++# define _dl_strchr strchr
+ # define _dl_strrchr strrchr
++# define _dl_strstr strstr
+ # define _dl_memcpy memcpy
+ # define _dl_memcmp memcmp
+ # define _dl_memset memset
+-- 
+1.8.3.4
+
-- 
1.8.3.4


