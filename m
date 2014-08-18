Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3F1B6607F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 01:51:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I1pQie012566
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 18:51:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 18:51:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 09:51:38 +0800
Message-ID: <e03f1ba45da9061db0d74eded04c2f41f729b469.1408326458.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408326458.git.Qi.Chen@windriver.com>
References: <cover.1408326458.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 01/10] systemd: upgrade to 215
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
X-List-Received-Date: Mon, 18 Aug 2014 01:51:28 -0000
Content-Type: text/plain

Upgrade systemd from 213 to 215.

systemd-older-kernel.patch is removed as it's fixed in 215.

Backport two patches to fix compilation problem for qemuppc.

    0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
    0002-endian-explicitly-include-endian.h-wherever-we-want-.patch

Below are the required kernel versions for systemd 215.
        Linux kernel >= 3.0
        Linux kernel >= 3.3 for loop device partition support features with nspawn
        Linux kernel >= 3.8 for Smack support

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...k-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch |  116 ++++++++++++++++++++
 ...icitly-include-endian.h-wherever-we-want-.patch |   52 +++++++++
 .../systemd/systemd/systemd-older-kernel.patch     |   56 ----------
 .../systemd/{systemd_213.bb => systemd_215.bb}     |   10 +-
 4 files changed, 174 insertions(+), 60 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-endian-explicitly-include-endian.h-wherever-we-want-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
 rename meta/recipes-core/systemd/{systemd_213.bb => systemd_215.bb} (97%)

diff --git a/meta/recipes-core/systemd/systemd/0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch b/meta/recipes-core/systemd/systemd/0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
new file mode 100644
index 0000000..228d835
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
@@ -0,0 +1,116 @@
+Upstream-Status: Backport
+
+Subject: always check for __BYTE_ORDER == __BIG_ENDIAN when checking for endianess
+
+Let's always stick to glibc's way to determine byte order, and not mix
+autoconf-specific checks with gcc checks.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/shared/architecture.h |   12 ++++++------
+ src/shared/gpt.h          |    4 ++--
+ src/shared/time-dst.c     |    6 +++---
+ 3 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/src/shared/architecture.h b/src/shared/architecture.h
+index 4821d5d..58e97e5 100644
+--- a/src/shared/architecture.h
++++ b/src/shared/architecture.h
+@@ -80,7 +80,7 @@ Architecture uname_architecture(void);
+ #  define native_architecture() ARCHITECTURE_X86
+ #  define LIB_ARCH_TUPLE "i386-linux-gnu"
+ #elif defined(__powerpc64__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_PPC64
+ #    define LIB_ARCH_TUPLE "ppc64-linux-gnu"
+ #  else
+@@ -88,7 +88,7 @@ Architecture uname_architecture(void);
+ #    error "Missing LIB_ARCH_TUPLE for PPC64LE"
+ #  endif
+ #elif defined(__powerpc__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_PPC
+ #    define LIB_ARCH_TUPLE "powerpc-linux-gnu"
+ #  else
+@@ -117,7 +117,7 @@ Architecture uname_architecture(void);
+ #  define native_architecture() ARCHITECTURE_SPARC
+ #  define LIB_ARCH_TUPLE "sparc-linux-gnu"
+ #elif defined(__mips64__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_MIPS64
+ #    error "Missing LIB_ARCH_TUPLE for MIPS64"
+ #  else
+@@ -125,7 +125,7 @@ Architecture uname_architecture(void);
+ #    error "Missing LIB_ARCH_TUPLE for MIPS64_LE"
+ #  endif
+ #elif defined(__mips__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_MIPS
+ #    define LIB_ARCH_TUPLE "mips-linux-gnu"
+ #  else
+@@ -136,7 +136,7 @@ Architecture uname_architecture(void);
+ #  define native_architecture() ARCHITECTURE_ALPHA
+ #  define LIB_ARCH_TUPLE "alpha-linux-gnu"
+ #elif defined(__aarch64__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_ARM64_BE
+ #    define LIB_ARCH_TUPLE "aarch64_be-linux-gnu"
+ #  else
+@@ -144,7 +144,7 @@ Architecture uname_architecture(void);
+ #    define LIB_ARCH_TUPLE "aarch64-linux-gnu"
+ #  endif
+ #elif defined(__arm__)
+-#  if defined(WORDS_BIGENDIAN)
++#  if __BYTE_ORDER == __BIG_ENDIAN
+ #    define native_architecture() ARCHITECTURE_ARM_BE
+ #    if defined(__ARM_EABI__)
+ #      if defined(__ARM_PCS_VFP)
+diff --git a/src/shared/gpt.h b/src/shared/gpt.h
+index 64090e0..278940b 100644
+--- a/src/shared/gpt.h
++++ b/src/shared/gpt.h
+@@ -42,10 +42,10 @@
+ #  define GPT_ROOT_NATIVE GPT_ROOT_X86
+ #endif
+ 
+-#if defined(__aarch64__) && !defined(WORDS_BIGENDIAN)
++#if defined(__aarch64__) && (__BYTE_ORDER != __BIG_ENDIAN)
+ #  define GPT_ROOT_NATIVE GPT_ROOT_ARM_64
+ #  define GPT_ROOT_SECONDARY GPT_ROOT_ARM
+-#elif defined(__arm__) && !defined(WORDS_BIGENDIAN)
++#elif defined(__arm__) && (__BYTE_ORDER != __BIG_ENDIAN)
+ #  define GPT_ROOT_NATIVE GPT_ROOT_ARM
+ #endif
+ 
+diff --git a/src/shared/time-dst.c b/src/shared/time-dst.c
+index ceca2fa..6195b11 100644
+--- a/src/shared/time-dst.c
++++ b/src/shared/time-dst.c
+@@ -207,8 +207,8 @@ read_again:
+                 if (type_idxs[i] >= num_types)
+                         return -EINVAL;
+ 
+-        if (BYTE_ORDER == BIG_ENDIAN ? sizeof(time_t) == 8 && trans_width == 4
+-                                     : sizeof(time_t) == 4 || trans_width == 4) {
++        if (__BYTE_ORDER == __BIG_ENDIAN ? sizeof(time_t) == 8 && trans_width == 4
++                                         : sizeof(time_t) == 4 || trans_width == 4) {
+                 /* Decode the transition times, stored as 4-byte integers in
+                    network (big-endian) byte order.  We work from the end of
+                    the array so as not to clobber the next element to be
+@@ -216,7 +216,7 @@ read_again:
+                 i = num_transitions;
+                 while (i-- > 0)
+                         transitions[i] = decode((char *)transitions + i * 4);
+-        } else if (BYTE_ORDER != BIG_ENDIAN && sizeof(time_t) == 8) {
++        } else if (__BYTE_ORDER != __BIG_ENDIAN && sizeof(time_t) == 8) {
+                 /* Decode the transition times, stored as 8-byte integers in
+                    network (big-endian) byte order.  */
+                 for (i = 0; i < num_transitions; ++i)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/systemd/systemd/0002-endian-explicitly-include-endian.h-wherever-we-want-.patch b/meta/recipes-core/systemd/systemd/0002-endian-explicitly-include-endian.h-wherever-we-want-.patch
new file mode 100644
index 0000000..5494192
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-endian-explicitly-include-endian.h-wherever-we-want-.patch
@@ -0,0 +1,52 @@
+Upstream-Status: Backport
+
+Subject: endian: explicitly include endian.h wherever we want to use __BYTE_ORDER
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/libsystemd/sd-bus/bus-protocol.h |    1 +
+ src/shared/architecture.h            |    2 ++
+ src/shared/gpt.h                     |    2 ++
+ 3 files changed, 5 insertions(+)
+
+diff --git a/src/libsystemd/sd-bus/bus-protocol.h b/src/libsystemd/sd-bus/bus-protocol.h
+index 5046d17..4f46468 100644
+--- a/src/libsystemd/sd-bus/bus-protocol.h
++++ b/src/libsystemd/sd-bus/bus-protocol.h
+@@ -21,6 +21,7 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#include <endian.h>
+ 
+ /* Endianness */
+ 
+diff --git a/src/shared/architecture.h b/src/shared/architecture.h
+index 58e97e5..38780d1 100644
+--- a/src/shared/architecture.h
++++ b/src/shared/architecture.h
+@@ -21,6 +21,8 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#include <endian.h>
++
+ #include "util.h"
+ 
+ /* A cleaned up architecture definition. We don't want to get lost in
+diff --git a/src/shared/gpt.h b/src/shared/gpt.h
+index 278940b..ef3444f 100644
+--- a/src/shared/gpt.h
++++ b/src/shared/gpt.h
+@@ -19,6 +19,8 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#include <endian.h>
++
+ #include "sd-id128.h"
+ 
+ /* We only support root disk discovery for x86, x86-64 and ARM for
+-- 
+1.7.9.5
+
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
diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_215.bb
similarity index 97%
rename from meta/recipes-core/systemd/systemd_213.bb
rename to meta/recipes-core/systemd/systemd_215.bb
index 4fb7ffc..770787b 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_215.bb
@@ -17,9 +17,9 @@ SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
 
-SRCREV = "c9679c652b3c31f2510e8805d81630680ebc7e95"
+SRCREV = "252ff40a3827b4e8e62e03a5e2f80da3fe02bee6"
 
-PV = "213+git${SRCPV}"
+PV = "215+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
            file://binfmt-install.patch \
@@ -31,12 +31,13 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
            file://uclibc-sysinfo_h.patch \
            file://uclibc-get-physmem.patch \
+           file://0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch \
+           file://0002-endian-explicitly-include-endian.h-wherever-we-want-.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
-           file://systemd-older-kernel.patch \
-          "
+         "
 
 S = "${WORKDIR}/git"
 
@@ -231,6 +232,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/systemd \
                 ${exec_prefix}/lib/modules-load.d \
                 ${exec_prefix}/lib/sysctl.d \
+                ${exec_prefix}/lib/sysusers.d \
                 ${localstatedir} \
                 /lib/udev/rules.d/70-uaccess.rules \
                 /lib/udev/rules.d/71-seat.rules \
-- 
1.7.9.5


