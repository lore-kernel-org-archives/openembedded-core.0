Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.12990.1597387240546136990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 23:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07E6eJfd024553
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 23:40:29 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 23:40:08 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gcc-runtime.inc: fix m32 compile fail with x86-64 compiler
Date: Fri, 14 Aug 2020 14:35:23 +0800
Message-ID: <20200814063523.342237-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

configuration:
MACHINE ??= "qemux86-64"
require conf/multilib.conf
MULTILIBS ?= "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "core2-32"
IMAGE_INSTALL_append = " packagegroup-core-buildessential lib32-libstdc++ lib32-libstdc++-dev"

m32 compile failed on target:
cmd: gcc -m32 -v test.cpp -o test
output:
GGC heuristics: --param ggc-min-expand=45 --param ggc-min-heapsize=29590
ignoring nonexistent directory "/usr/lib64/gcc/x86_64-poky-linux/10.1.0/../../../../include/c++/10.1.0/x86_64-poky-linux/32"
ignoring nonexistent directory "/usr/lib64/x86_64-poky-linux/10.1.0/include"
ignoring nonexistent directory "/usr/local/include"
ignoring nonexistent directory "/usr/lib64/gcc/x86_64-poky-linux/10.1.0/../../../../x86_64-poky-linux/include"
 /usr/lib64/gcc/x86_64-poky-linux/10.1.0/../../../../include/c++/10.1.0
 /usr/lib64/gcc/x86_64-poky-linux/10.1.0/../../../../include/c++/10.1.0/backward
 /usr/lib64/gcc/x86_64-poky-linux/10.1.0/include
 /usr/lib64/gcc/x86_64-poky-linux/10.1.0/include-fixed
 /usr/include
End of search list.
GNU C++14 (GCC) version 10.1.0 (x86_64-poky-linux)
	compiled by GNU C version 10.1.0, GMP version 6.2.0, MPFR version 4.1.0, MPC version 1.1.0, isl version none
GGC heuristics: --param ggc-min-expand=45 --param ggc-min-heapsize=29590
Compiler executable checksum: bc3b2f3a33dad80e30112cf1235bf631
In file included from test.cpp:1:
/usr/include/c++/10.1.0/iostream:38:10: fatal error: bits/c++config.h: No such file or directory
   38 | #include <bits/c++config.h>
      |          ^~~~~~~~~~~~~~~~~~

cannot find header since
/usr/lib64/gcc/x86_64-poky-linux/10.1.0/x86_64-poky-linux/32 is missing

fixed by link it to ../i686-poky-linux

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index df1432e68d..9dcce26536 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -138,6 +138,10 @@ do_install_append_class-target () {
 		ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
 	fi
 
+	if [ "${TARGET_ARCH}" == "x86_64" -a "${MULTILIB_VARIANTS}" != "" ];then
+		ln -sf ../${X86ARCH32}${TARGET_VENDOR}-${TARGET_OS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/32
+	fi
+
 	if [ "${TCLIBC}" != "glibc" ]; then
 		case "${TARGET_OS}" in
 			"linux-musl" | "linux-*spe") extra_target_os="linux";;
-- 
2.17.1

