Return-Path: <B40290@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0239.outbound.protection.outlook.com [207.46.163.239])
	by mail.openembedded.org (Postfix) with ESMTP id C121365CFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 03:23:48 +0000 (UTC)
Received: from BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) by
	BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) with Microsoft
	SMTP Server (TLS) id 15.0.921.12; Wed, 23 Apr 2014 03:23:46 +0000
Received: from BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.59]) by
	BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.59]) with mapi id
	15.00.0921.000; Wed, 23 Apr 2014 03:23:46 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] lttng-modules: update to 2.4.1 version
Thread-Index: AQHPV6i2wYbPOXQKakaZe01/M3t8Z5sel3gQ
Date: Wed, 23 Apr 2014 03:23:45 +0000
Message-ID: <0de2e744fad74d7fb751a041e0d83f26@BY2PR03MB254.namprd03.prod.outlook.com>
References: <1397456023-21015-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1397456023-21015-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(377454003)(13464003)(189002)(199002)(164054003)(76576001)(80022001)(76482001)(46102001)(66066001)(74316001)(20776003)(83322001)(19580405001)(19580395003)(83072002)(85852003)(77982001)(81542001)(74662001)(92566001)(33646001)(74502001)(50986999)(31966008)(87936001)(4396001)(99396002)(99286001)(80976001)(575784001)(86362001)(81342001)(2656002)(79102001)(54356999)(76176999)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB254;
	H:BY2PR03MB254.namprd03.prod.outlook.com;
	FPR:E9ACFE3F.13E2D781.70FF954A.42896A2E.20579; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] lttng-modules: update to 2.4.1 version
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
X-List-Received-Date: Wed, 23 Apr 2014 03:23:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pings.

Thanks,
chunrong

-----Original Message-----
From: Chunrong Guo [mailto:B40290@freescale.com]=20
Sent: Monday, April 14, 2014 2:14 PM
To: openembedded-core@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo Chunrong-=
B40290
Subject: [OE-core][PATCH] lttng-modules: update to 2.4.1 version

    *This updates lttng-modules for 2.4.1 and
     it also fixes the build with 3.13 Linux kernel.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../lttng/lttng-modules/bio-bvec-iter.patch        | 156 -----------------=
----
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb   |  38 -----
 meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb   |  38 +++++
 3 files changed, 38 insertions(+), 194 deletions(-)  delete mode 100644 me=
ta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb

diff --git a/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch b/=
meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
deleted file mode 100644
index d6c66e4..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-Upstream-Status: Pending
-
-In 3.14, bi_sector and bi_size were moved into an iterator, thus -breaking=
 any tracepoints that still expect them in the bio.  Fix up -the lttng-modu=
le tracepoints to use the new scheme when the kernel -version is >=3D 3.14.
-
-Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
-
-diff --git a/instrumentation/events/lttng-module/block.h b/instrumentation=
/events/lttng-module/block.h
-index f3b8bff..0a61543 100644
---- a/instrumentation/events/lttng-module/block.h
-+++ b/instrumentation/events/lttng-module/block.h
-@@ -341,9 +341,15 @@ TRACE_EVENT(block_bio_bounce,
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev ?
- 					  bio->bi_bdev->bd_dev : 0)
-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size) #else /* #if=20
-+(LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
-
-@@ -385,14 +391,24 @@ TRACE_EVENT(block_bio_complete,
-=20
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9) #else /* #if=20
-+(LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
-+
- #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,38))
- 		tp_assign(error, error)
- #else
- 		tp_assign(error, 0)
- #endif
-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size) #else /* #if=20
-+(LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 	),
-=20
- 	TP_printk("%d,%d %s %llu + %u [%d]",
-@@ -419,9 +435,15 @@ DECLARE_EVENT_CLASS(block_bio_merge,
-=20
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size) #else /* #if=20
-+(LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
-
-@@ -485,9 +507,15 @@ TRACE_EVENT(block_bio_queue,
-=20
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size) #else /* #if=20
-+(LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
-
-@@ -513,9 +541,15 @@ DECLARE_EVENT_CLASS(block_bio,
-=20
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev ? bio->bi_bdev->bd_dev : 0)
-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size) #else /* #if=20
-+(LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
-
-@@ -587,10 +621,17 @@ DECLARE_EVENT_CLASS(block_get_rq,
-=20
- 	TP_fast_assign(
- 		tp_assign(dev, bio ? bio->bi_bdev->bd_dev : 0)
-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio ? bio->bi_iter.bi_sector : 0)
-+		tp_assign(nr_sector, bio ? bio->bi_iter.bi_size >> 9 : 0)
-+		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
-+			      bio ? bio->bi_iter.bi_size >> 9 : 0) #else /* #if=20
-+(LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio ? bio->bi_sector : 0)
- 		tp_assign(nr_sector, bio ? bio->bi_size >> 9 : 0)
- 		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
- 			      bio ? bio->bi_size >> 9 : 0)
-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
-         ),
-
-@@ -759,9 +800,15 @@ TRACE_EVENT(block_split,
-=20
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(new_sector, new_sector)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size) #else /* #if=20
-+(LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(new_sector, new_sector)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
-
-@@ -805,11 +852,19 @@ TRACE_EVENT(block_remap,
-=20
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		tp_assign(old_dev, dev)
-+		tp_assign(old_sector, from)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size) #else /* #if=20
-+(LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		tp_assign(old_dev, dev)
- 		tp_assign(old_sector, from)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
- 	),
-=20
- 	TP_printk("%d,%d %s %llu + %u <- (%d,%d) %llu",
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb b/meta/recipe=
s-kernel/lttng/lttng-modules_2.4.0.bb
deleted file mode 100644
index aa01a8d..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SECTION =3D "devel"
-SUMMARY =3D "Linux Trace Toolkit KERNEL MODULE"
-DESCRIPTION =3D "The lttng-modules 2.0 package contains the kernel tracer =
modules"
-LICENSE =3D "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1412caf5a1aa90d6a48588a4794c0ea=
c \
-                    file://gpl-2.0.txt;md5=3D751419260aa954499f7abaabaa882=
bbe \
-                    file://lgpl-2.1.txt;md5=3D243b725d71bb5df4a1e5920b344b=
86ad"
-
-DEPENDS =3D "virtual/kernel"
-
-inherit module
-
-SRCREV =3D "fb2c37799306d16fb590aebee6fad8be431264b7"
-PV =3D "2.4.0"
-
-# lttng currently blacklists arm with gcc-4.8 -COMPATIBLE_HOST =3D '(x86_6=
4|i.86|powerpc|aarch64|mips).*-linux'
-
-SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.4 \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://bio-bvec-iter.patch"
-
-export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
-export KERNEL_SRC=3D"${STAGING_KERNEL_DIR}"
-
-
-S =3D "${WORKDIR}/git"
-
-do_install_append() {
-	# Delete empty directories to avoid QA failures if no modules were built
-	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
-}
-
-python do_package_prepend() {
-    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')=
):
-        bb.warn("%s: no modules were created; this may be due to CONFIG_TR=
ACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
-}
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/meta/recipe=
s-kernel/lttng/lttng-modules_2.4.1.bb
new file mode 100644
index 0000000..4ef74dd
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
@@ -0,0 +1,38 @@
+SECTION =3D "devel"
+SUMMARY =3D "Linux Trace Toolkit KERNEL MODULE"
+DESCRIPTION =3D "The lttng-modules 2.0 package contains the kernel tracer =
modules"
+LICENSE =3D "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1412caf5a1aa90d6a48588a4794c0ea=
c \
+                    file://gpl-2.0.txt;md5=3D751419260aa954499f7abaabaa882=
bbe \
+                    file://lgpl-2.1.txt;md5=3D243b725d71bb5df4a1e5920b344b=
86ad"
+
+DEPENDS =3D "virtual/kernel"
+
+inherit module
+
+SRCREV =3D "afdc6b155161f209fcfadc5288dc017ceab56353"
+PV =3D "2.4.1"
+
+# lttng currently blacklists arm with gcc-4.8 COMPATIBLE_HOST =3D=20
+'(x86_64|i.86|powerpc|aarch64|mips).*-linux'
+
+SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.4 \
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
+           "
+
+export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
+export KERNEL_SRC=3D"${STAGING_KERNEL_DIR}"
+
+
+S =3D "${WORKDIR}/git"
+
+do_install_append() {
+	# Delete empty directories to avoid QA failures if no modules were built
+	find ${D}/lib -depth -type d -empty -exec rmdir {} \; }
+
+python do_package_prepend() {
+    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')=
):
+        bb.warn("%s: no modules were created; this may be due to=20
+CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN',=20
+True)) }
+
--
1.8.3.2



