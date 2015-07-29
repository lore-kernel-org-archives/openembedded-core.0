Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAF260132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 04:13:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99012801"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 12:17:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6T4C3FU025987
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:12:03 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 29 Jul 2015 12:13:54 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 12:13:05 +0800
Message-ID: <1438143185-2030-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438142932-1962-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438142932-1962-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH v2] mdadm: 3.3.2 -> 3.3.3
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
X-List-Received-Date: Wed, 29 Jul 2015 04:13:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Upgrade mdadm from 3.3.2 to 3.3.3

1) Remove backported patch:inline.patch

2) update context of mdadm-3.3.2_x32_abi_time_t.patch

3) Add systemd support:
add systemd service file mdmonitor.service and mdadm.conf which
is needed to start mdmonitor.service.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/mdadm/files/inline.patch     | 39 ------------------=
----
 .../mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch   | 26 +++++++++------
 meta/recipes-extended/mdadm/files/mdadm.conf       |  1 +
 .../recipes-extended/mdadm/files/mdmonitor.service | 13 ++++++++
 .../mdadm/{mdadm_3.3.2.bb =3D> mdadm_3.3.3.bb}       | 29 ++++++++++++----
 5 files changed, 52 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/inline.patch
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm.conf
 create mode 100644 meta/recipes-extended/mdadm/files/mdmonitor.service
 rename meta/recipes-extended/mdadm/{mdadm_3.3.2.bb =3D> mdadm_3.3.3.bb} (6=
6%)

diff --git a/meta/recipes-extended/mdadm/files/inline.patch b/meta/recipes-=
extended/mdadm/files/inline.patch
deleted file mode 100644
index 9009f06..0000000
--- a/meta/recipes-extended/mdadm/files/inline.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-with gnu11 turning on a default with gcc-5 we have to abide by new inline =
semantics
-using 'inline' and using is in same translation unit means an external def=
inition has to exist
-same like "external inline" in gnu89, we simply make the functions static =
inline since they
-are just meant to be used in this file
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: mdadm-3.3.2/bitmap.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- mdadm-3.3.2.orig/bitmap.c
-+++ mdadm-3.3.2/bitmap.c
-@@ -20,7 +20,7 @@
-=20
- #include "mdadm.h"
-=20
--inline void sb_le_to_cpu(bitmap_super_t *sb)
-+static inline void sb_le_to_cpu(bitmap_super_t *sb)
- {
- 	sb->magic =3D __le32_to_cpu(sb->magic);
- 	sb->version =3D __le32_to_cpu(sb->version);
-@@ -34,7 +34,7 @@ inline void sb_le_to_cpu(bitmap_super_t
- 	sb->write_behind =3D __le32_to_cpu(sb->write_behind);
- }
-=20
--inline void sb_cpu_to_le(bitmap_super_t *sb)
-+static inline void sb_cpu_to_le(bitmap_super_t *sb)
- {
- 	sb_le_to_cpu(sb); /* these are really the same thing */
- }
-@@ -74,7 +74,7 @@ typedef struct bitmap_info_s {
- } bitmap_info_t;
-=20
- /* count the dirty bits in the first num_bits of byte */
--inline int count_dirty_bits_byte(char byte, int num_bits)
-+static inline int count_dirty_bits_byte(char byte, int num_bits)
- {
- 	int num =3D 0;
-=20
diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.p=
atch b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
index 143a8d9..ae1b7ae 100644
--- a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
@@ -1,26 +1,32 @@
-When try to print time_t values as a long int it causes an error because t=
ime_t
-data type in x32 ABI is long long int.
+From c668c66fc0505e8bfff38fdf2d30b7663d0e94fd Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Sat, 25 Jul 2015 22:02:00 +0900
+Subject: [PATCH] When try to print time_t values as a long int it causes a=
n
+ error because time_t data type in x32 ABI is long long int.
=20
 Upstream-Status: Pending
=20
-Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ monitor.c | 4 ++++
+ 1 file changed, 4 insertions(+)
=20
 diff --git a/monitor.c b/monitor.c
-index f81e707..19ea041 100644
+index 870cc1a..068aab4 100644
 --- a/monitor.c
 +++ b/monitor.c
-@@ -260,8 +260,13 @@ static int read_and_act(struct active_array *a)
+@@ -259,7 +259,11 @@ static int read_and_act(struct active_array *a)
  	}
 =20
  	gettimeofday(&tv, NULL);
 +#if defined(__x86_64__) && defined(__ILP32__)
 +	dprintf("%s(%d): %lld.%06lld state:%s prev:%s action:%s prev: %s start:%=
llu\n",
 +#else
- 	dprintf("%s(%d): %ld.%06ld state:%s prev:%s action:%s prev: %s start:%ll=
u\n",
--		__func__, a->info.container_member,
+ 	dprintf("(%d): %ld.%06ld state:%s prev:%s action:%s prev: %s start:%llu\=
n",
 +#endif
-+		__func__,
-+		a->info.container_member,
+ 		a->info.container_member,
  		tv.tv_sec, tv.tv_usec,
  		array_states[a->curr_state],
- 		array_states[a->prev_state],
+--=20
+1.8.4.2
+
diff --git a/meta/recipes-extended/mdadm/files/mdadm.conf b/meta/recipes-ex=
tended/mdadm/files/mdadm.conf
new file mode 100644
index 0000000..b869d8f
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm.conf
@@ -0,0 +1 @@
+MAILADDR root@mydomain.com
diff --git a/meta/recipes-extended/mdadm/files/mdmonitor.service b/meta/rec=
ipes-extended/mdadm/files/mdmonitor.service
new file mode 100644
index 0000000..3664ceb
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdmonitor.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=3DSoftware RAID monitoring and management
+After=3Dsyslog.target
+ConditionPathExists=3D@sysconfdir@/mdadm.conf
+
+[Service]
+Type=3Dforking
+PIDFile=3D@localstatedir@/run/mdadm/mdadm.pid
+EnvironmentFile=3D-@sysconfdir@/sysconfig/mdmonitor
+ExecStart=3D@basesbindir@/mdadm --monitor --scan -f --pid-file=3D@localsta=
tedir@/run/mdadm/mdadm.pid
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb b/meta/recipes-exte=
nded/mdadm/mdadm_3.3.3.bb
similarity index 66%
rename from meta/recipes-extended/mdadm/mdadm_3.3.2.bb
rename to meta/recipes-extended/mdadm/mdadm_3.3.3.bb
index b2fbe4a..52d3d0e 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.3.bb
@@ -10,18 +10,18 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.x=
z \
            file://mdadm-3.2.2_fix_for_x32.patch \
-           file://gcc-4.9.patch \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
-           file://inline.patch \
+           file://gcc-4.9.patch \
            file://run-ptest \
+           file://mdmonitor.service \
+           file://mdadm.conf \
 	  "
-
-SRC_URI[md5sum] =3D "44698d351501cac6a89072dc877eb220"
-SRC_URI[sha256sum] =3D "0f3a7e1a76b13892b79f9fceaf99ecb23513260389a768ac64=
4ffa3ae06e5b8c"
+SRC_URI[md5sum] =3D "dabd5ce70f3fff340cad7c18e4a062ab"
+SRC_URI[sha256sum] =3D "f5b50a6b506697fb9968d660444447473b453f9eaefaa9b7d3=
1c184693b8a28c"
=20
 CFLAGS +=3D "-fno-strict-aliasing"
=20
-inherit autotools-brokensep
+inherit autotools-brokensep systemd
=20
 EXTRA_OEMAKE =3D "CHECK_RUN_DIR=3D0"
 # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm=
/types.h
@@ -41,7 +41,22 @@ do_install() {
 	autotools_do_install
 }
=20
-FILES_${PN} +=3D "${base_libdir}/udev/rules.d/*.rules"
+do_install_append() {
+        install -d ${D}/${sysconfdir}/
+        install -m 644 ${WORKDIR}/mdadm.conf ${D}${sysconfdir}/
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/mdmonitor.service ${D}/${systemd_unitdir=
}/system
+        sed -i -e 's,@basesbindir@,${base_sbindir},g' \
+                -e 's,@localstatedir@,${localstatedir},g' \
+                -e 's,@sysconfdir@,${sysconfdir},g' \
+                ${D}/${systemd_unitdir}/system/mdmonitor.service
+        install -d ${D}/${localstatedir}
+        install -d ${D}/${localstatedir}/run
+        install -d -m 700 ${D}/${localstatedir}/run/mdadm
+}
+FILES_${PN} +=3D "${base_libdir}/udev/rules.d/*.rules \
+                /run/mdadm \
+                ${systemd_unitdir}"
=20
 inherit ptest
=20
--=20
1.8.4.2


