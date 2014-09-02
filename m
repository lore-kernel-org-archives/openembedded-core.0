Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C7E0C65D56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s82As4vQ010796
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:03 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:53:47 +0800
Message-ID: <c57d855c12c783cdfa52f304e52fc2fd1267dd96.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/26] systemd: upgrade to 216
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:08 -0000
Content-Type: text/plain

Upgrade systemd from 213 to 216.

systemd-older-kernel.patch is removed as it's fixed in 216.

0001-uClibc-doesn-t-implement-pwritev-preadv.patch is removed because
the file it patches has been removed from the project.

0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch is removed because
it has been merged.

0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch is backported
to fix compilation error for mips.

Below are the required kernel versions for systemd 216.
        Linux kernel >= 3.0
        Linux kernel >= 3.3 for loop device partition support features with nspawn
        Linux kernel >= 3.8 for Smack support

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ing.h-add-fake-__NR_memfd_create-for-MIPS.patch | 29 +++++++++++
 ...1-uClibc-doesn-t-implement-pwritev-preadv.patch | 34 -------------
 ...-Including-missing.h-to-get-MAX_HANDLE_SZ.patch | 29 -----------
 .../systemd/systemd/systemd-older-kernel.patch     | 56 ----------------------
 .../systemd/{systemd_213.bb => systemd_216.bb}     | 15 +++---
 5 files changed, 38 insertions(+), 125 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
 rename meta/recipes-core/systemd/{systemd_213.bb => systemd_216.bb} (96%)

diff --git a/meta/recipes-core/systemd/systemd/0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch b/meta/recipes-core/systemd/systemd/0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch
new file mode 100644
index 0000000..448ef1a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Backport
+
+Subject: missing.h: add fake __NR_memfd_create for MIPS
+
+We don't have the correct __NR_memfd_create syscall number yet, so set it to
+0xffffffff for now to prevent compile time errors.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/shared/missing.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/shared/missing.h b/src/shared/missing.h
+index 3ff1a21..3051cb5 100644
+--- a/src/shared/missing.h
++++ b/src/shared/missing.h
+@@ -167,6 +167,9 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
+ #      define __NR_fanotify_mark 5296
+ #    endif
+ #  endif
++#  ifndef __NR_memfd_create
++#    define __NR_memfd_create 0xffffffff /* FIXME */
++#  endif
+ #else
+ #  ifndef __NR_fanotify_init
+ #    define __NR_fanotify_init 338
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch b/meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
deleted file mode 100644
index 9fdb3c9..0000000
--- a/meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Inappropriate [uclibc specific]
-
-From 7be9273548bcb1f57d011fc252965e45dd2a058c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 21 Aug 2013 19:09:27 -0700
-Subject: [PATCH] uClibc doesn't implement pwritev/preadv
-
-Lets stub out the testcase for building.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libsystemd-bus/test-bus-memfd.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-Index: systemd-209/src/libsystemd/sd-bus/test-bus-memfd.c
-===================================================================
---- systemd-209.orig/src/libsystemd/sd-bus/test-bus-memfd.c	2014-02-19 15:03:09.983254602 -0800
-+++ systemd-209/src/libsystemd/sd-bus/test-bus-memfd.c	2014-02-19 23:42:10.636652864 -0800
-@@ -151,6 +151,7 @@
-         /* check content */
-         assert_se(memcmp(buf, "ll", 2) == 0);
- 
-+#ifndef __UCLIBC__
-         /* writev it out*/
-         iov[0].iov_base = (char *)"ABC";
-         iov[0].iov_len = 3;
-@@ -173,6 +174,7 @@
-         assert_se(memcmp(bufv[0], "ABC", 3) == 0);
-         assert_se(memcmp(bufv[1], "DEF", 3) == 0);
-         assert_se(memcmp(bufv[2], "GHI", 3) == 0);
-+#endif /* __UCLIBC__ */
- 
-         sd_memfd_free(m);
- 
diff --git a/meta/recipes-core/systemd/systemd/0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch b/meta/recipes-core/systemd/systemd/0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch
deleted file mode 100644
index ba4a21b..0000000
--- a/meta/recipes-core/systemd/systemd/0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 764ecbeda4813f33eafd45fdc3ccb9376356f475 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Aug 2014 15:40:31 -0700
-Subject: [PATCH] util: Including missing.h to get MAX_HANDLE_SZ
-
-Helps compiling on uclibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: [Backport]
----
- src/shared/util.h |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/shared/util.h b/src/shared/util.h
-index 62eb604..036fc59 100644
---- a/src/shared/util.h
-+++ b/src/shared/util.h
-@@ -84,6 +84,7 @@
- #endif
- 
- #include "macro.h"
-+#include "missing.h"
- #include "time-util.h"
- 
- /* What is interpreted as whitespace? */
--- 
-1.7.10.4
-
diff --git a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch b/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
deleted file mode 100644
index 18b50e7..0000000
--- a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 6109f02dcc4f2d7a461c5772bab494f5753a2203 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 29 May 2014 08:09:07 +0000
-Subject: [PATCH] rtnl-types.c: check IFLA_VLAN_PROTOCOL
-
-The older kernel's linux/if_link.h doesn't have IFLA_VLAN_PROTOCOL, we need
-check whether it has been defined or not.
-
-The maintainer said that he would fix it:
-
-http://thread.gmane.org/gmane.comp.sysutils.systemd.devel/18200
-
-Also we need redefine IFLA_MAX from 34 to 35 when define IFLA_CARRIER,
-otherwise there would be error:
-
-| src/libsystemd/sd-rtnl/rtnl-types.c:233:9: error: array index in initializer exceeds array bounds
-|          [IFLA_CARRIER]          = { .type = NLA_U8 },
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- src/libsystemd/sd-rtnl/rtnl-types.c | 2 ++
- src/shared/missing.h                | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/src/libsystemd/sd-rtnl/rtnl-types.c b/src/libsystemd/sd-rtnl/rtnl-types.c
-index 44ac5ec..ab6161f 100644
---- a/src/libsystemd/sd-rtnl/rtnl-types.c
-+++ b/src/libsystemd/sd-rtnl/rtnl-types.c
-@@ -67,7 +67,9 @@ static const NLType rtnl_link_info_data_vlan_types[IFLA_VLAN_MAX + 1] = {
-         [IFLA_VLAN_EGRESS_QOS]  = { .type = NLA_NESTED },
-         [IFLA_VLAN_INGRESS_QOS] = { .type = NLA_NESTED },
- */
-+#ifdef IFLA_VLAN_PROTOCOL
-         [IFLA_VLAN_PROTOCOL]    = { .type = NLA_U16 },
-+#endif
- };
- 
- static const NLType rtnl_link_info_data_bond_types[IFLA_BOND_MAX + 1] = {
-diff --git a/src/shared/missing.h b/src/shared/missing.h
-index d5ec2f8..732853f 100644
---- a/src/shared/missing.h
-+++ b/src/shared/missing.h
-@@ -94,6 +94,8 @@
- 
- #ifndef IFLA_CARRIER
-   #define IFLA_CARRIER 33
-+  #undef IFLA_MAX
-+  #define IFLA_MAX 35
-   #ifndef IFLA_NUM_RX_QUEUES
-     #define IFLA_NUM_RX_QUEUES 32
-     #ifndef IFLA_NUM_TX_QUEUES
--- 
-1.8.3.4
-
diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_216.bb
similarity index 96%
rename from meta/recipes-core/systemd/systemd_213.bb
rename to meta/recipes-core/systemd/systemd_216.bb
index ca071c1..df4a217 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -17,9 +17,9 @@ SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
 
-SRCREV = "c9679c652b3c31f2510e8805d81630680ebc7e95"
+SRCREV = "5d0ae62c665262c4c55536457e84e278c252cc0b"
 
-PV = "213+git${SRCPV}"
+PV = "216+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
            file://binfmt-install.patch \
@@ -28,15 +28,13 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://systemd-pam-fix-fallocate.patch \
            file://systemd-pam-fix-mkostemp.patch \
            file://optional_secure_getenv.patch \
-           file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
            file://uclibc-sysinfo_h.patch \
            file://uclibc-get-physmem.patch \
-           file://0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch \
+           file://0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
-           file://systemd-older-kernel.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -126,6 +124,9 @@ do_install() {
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 
+	# Move libgudev back to ${rootlibdir} to keep backward compatibility
+	[ ${rootlibdir} != ${exec_prefix}/lib ] && mv -t ${D}${rootlibdir} ${D}${exec_prefix}/lib/libgudev*
+
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 }
@@ -208,6 +209,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/system-services \
                 ${datadir}/polkit-1 \
                 ${datadir}/${BPN} \
+                ${datadir}/factory \
                 ${sysconfdir}/bash_completion.d/ \
                 ${sysconfdir}/dbus-1/ \
                 ${sysconfdir}/machine-id \
@@ -220,7 +222,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
                 ${base_libdir}/security/*.so \
-                ${libdir}/libnss_myhostname.so.2 \
+                ${exec_prefix}/lib/libnss_* \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/busctl \
@@ -233,6 +235,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/systemd \
                 ${exec_prefix}/lib/modules-load.d \
                 ${exec_prefix}/lib/sysctl.d \
+                ${exec_prefix}/lib/sysusers.d \
                 ${localstatedir} \
                 /lib/udev/rules.d/70-uaccess.rules \
                 /lib/udev/rules.d/71-seat.rules \
-- 
1.9.1


