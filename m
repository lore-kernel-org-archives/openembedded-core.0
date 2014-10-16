Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D9A5460DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 21:27:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Oct 2014 14:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,734,1406617200"; d="scan'208";a="615758838"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2014 14:26:39 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.106]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.74]) with mapi id
	14.03.0195.001; Thu, 16 Oct 2014 14:26:38 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [daisy] [PATCHv2 1/1] lttng-modules: Update to
	version 2.4.2
Thread-Index: AQHP5oqm1q8dfm+5t0GvB9dVb+nJgJwzQqaA
Date: Thu, 16 Oct 2014 21:26:38 +0000
Message-ID: <D06585FF.873F%nitin.a.kamble@intel.com>
References: <1413166123-2719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1413166123-2719-2-git-send-email-rebecca.swee.fun.chang@intel.com>
In-Reply-To: <1413166123-2719-2-git-send-email-rebecca.swee.fun.chang@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.4.140807
x-originating-ip: [10.252.135.196]
MIME-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [daisy] [PATCHv2 1/1] lttng-modules: Update to version 2.4.2
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
X-List-Received-Date: Thu, 16 Oct 2014 21:27:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9FAE4E6F06F4CE479D73FB5FEDA3868E@intel.com>
Content-Transfer-Encoding: quoted-printable



On 10/12/14, 7:08 PM, "Chang, Rebecca Swee Fun"
<rebecca.swee.fun.chang@intel.com> wrote:

>lttng-modules breaks when building with kernel 3.10.43.
>This updates lttng-modules for 2.4.2 and it will also
>fixes the build failure with kernel 3.10.43.
>
>The patch (bio-bvec-iter.patch) was removed since its
>fix was available in version 2.4.2.
>
>Fixes for [YOCTO #6788]
>
>Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Acked-By: Nitin A Kamble <nitin.a.kamble@intel.com>

>---
> .../lttng/lttng-modules/bio-bvec-iter.patch        |  156
>--------------------
> meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb   |   38 -----
> meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb   |   38 +++++
> 3 files changed, 38 insertions(+), 194 deletions(-)
> delete mode 100644
>meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
> delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
> create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
>
>diff --git a/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
>b/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
>deleted file mode 100644
>index d6c66e4..0000000
>--- a/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
>+++ /dev/null
>@@ -1,156 +0,0 @@
>-Upstream-Status: Pending
>-
>-In 3.14, bi_sector and bi_size were moved into an iterator, thus
>-breaking any tracepoints that still expect them in the bio.  Fix up
>-the lttng-module tracepoints to use the new scheme when the kernel
>-version is >=3D 3.14.
>-
>-Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
>-
>-diff --git a/instrumentation/events/lttng-module/block.h
>b/instrumentation/events/lttng-module/block.h
>-index f3b8bff..0a61543 100644
>---- a/instrumentation/events/lttng-module/block.h
>-+++ b/instrumentation/events/lttng-module/block.h
>-@@ -341,9 +341,15 @@ TRACE_EVENT(block_bio_bounce,
>- 	TP_fast_assign(
>- 		tp_assign(dev, bio->bi_bdev ?
>- 					  bio->bi_bdev->bd_dev : 0)
>-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
>-+		tp_assign(sector, bio->bi_iter.bi_sector)
>-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
>-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
>-+#else /* #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_assign(sector, bio->bi_sector)
>- 		tp_assign(nr_sector, bio->bi_size >> 9)
>- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
>-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
>- 	),
>-=20
>-@@ -385,14 +391,24 @@ TRACE_EVENT(block_bio_complete,
>-=20
>- 	TP_fast_assign(
>- 		tp_assign(dev, bio->bi_bdev->bd_dev)
>-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
>-+		tp_assign(sector, bio->bi_iter.bi_sector)
>-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
>-+#else /* #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_assign(sector, bio->bi_sector)
>- 		tp_assign(nr_sector, bio->bi_size >> 9)
>-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>-+
>- #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,38))
>- 		tp_assign(error, error)
>- #else
>- 		tp_assign(error, 0)
>- #endif
>-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
>-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
>-+#else /* #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
>-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 	),
>-=20
>- 	TP_printk("%d,%d %s %llu + %u [%d]",
>-@@ -419,9 +435,15 @@ DECLARE_EVENT_CLASS(block_bio_merge,
>-=20
>- 	TP_fast_assign(
>- 		tp_assign(dev, bio->bi_bdev->bd_dev)
>-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
>-+		tp_assign(sector, bio->bi_iter.bi_sector)
>-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
>-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
>-+#else /* #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_assign(sector, bio->bi_sector)
>- 		tp_assign(nr_sector, bio->bi_size >> 9)
>- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
>-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
>- 	),
>-=20
>-@@ -485,9 +507,15 @@ TRACE_EVENT(block_bio_queue,
>-=20
>- 	TP_fast_assign(
>- 		tp_assign(dev, bio->bi_bdev->bd_dev)
>-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
>-+		tp_assign(sector, bio->bi_iter.bi_sector)
>-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
>-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
>-+#else /* #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_assign(sector, bio->bi_sector)
>- 		tp_assign(nr_sector, bio->bi_size >> 9)
>- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
>-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
>- 	),
>-=20
>-@@ -513,9 +541,15 @@ DECLARE_EVENT_CLASS(block_bio,
>-=20
>- 	TP_fast_assign(
>- 		tp_assign(dev, bio->bi_bdev ? bio->bi_bdev->bd_dev : 0)
>-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
>-+		tp_assign(sector, bio->bi_iter.bi_sector)
>-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
>-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
>-+#else /* #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_assign(sector, bio->bi_sector)
>- 		tp_assign(nr_sector, bio->bi_size >> 9)
>- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
>-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
>- 	),
>-=20
>-@@ -587,10 +621,17 @@ DECLARE_EVENT_CLASS(block_get_rq,
>-=20
>- 	TP_fast_assign(
>- 		tp_assign(dev, bio ? bio->bi_bdev->bd_dev : 0)
>-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
>-+		tp_assign(sector, bio ? bio->bi_iter.bi_sector : 0)
>-+		tp_assign(nr_sector, bio ? bio->bi_iter.bi_size >> 9 : 0)
>-+		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
>-+			      bio ? bio->bi_iter.bi_size >> 9 : 0)
>-+#else /* #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_assign(sector, bio ? bio->bi_sector : 0)
>- 		tp_assign(nr_sector, bio ? bio->bi_size >> 9 : 0)
>- 		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
>- 			      bio ? bio->bi_size >> 9 : 0)
>-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
>-         ),
>-=20
>-@@ -759,9 +800,15 @@ TRACE_EVENT(block_split,
>-=20
>- 	TP_fast_assign(
>- 		tp_assign(dev, bio->bi_bdev->bd_dev)
>-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
>-+		tp_assign(sector, bio->bi_iter.bi_sector)
>-+		tp_assign(new_sector, new_sector)
>-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
>-+#else /* #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_assign(sector, bio->bi_sector)
>- 		tp_assign(new_sector, new_sector)
>- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
>-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
>- 	),
>-=20
>-@@ -805,11 +852,19 @@ TRACE_EVENT(block_remap,
>-=20
>- 	TP_fast_assign(
>- 		tp_assign(dev, bio->bi_bdev->bd_dev)
>-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0))
>-+		tp_assign(sector, bio->bi_iter.bi_sector)
>-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
>-+		tp_assign(old_dev, dev)
>-+		tp_assign(old_sector, from)
>-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
>-+#else /* #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 		tp_assign(sector, bio->bi_sector)
>- 		tp_assign(nr_sector, bio->bi_size >> 9)
>- 		tp_assign(old_dev, dev)
>- 		tp_assign(old_sector, from)
>- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
>-+#endif /* #else #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,14,0)) */
>- 	),
>-=20
>- 	TP_printk("%d,%d %s %llu + %u <- (%d,%d) %llu",
>diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
>b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
>deleted file mode 100644
>index aa01a8d..0000000
>--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
>+++ /dev/null
>@@ -1,38 +0,0 @@
>-SECTION =3D "devel"
>-SUMMARY =3D "Linux Trace Toolkit KERNEL MODULE"
>-DESCRIPTION =3D "The lttng-modules 2.0 package contains the kernel tracer
>modules"
>-LICENSE =3D "LGPLv2.1 & GPLv2"
>-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1412caf5a1aa90d6a48588a4794c0e=
ac \
>-                =20
>file://gpl-2.0.txt;md5=3D751419260aa954499f7abaabaa882bbe \
>-                =20
>file://lgpl-2.1.txt;md5=3D243b725d71bb5df4a1e5920b344b86ad"
>-
>-DEPENDS =3D "virtual/kernel"
>-
>-inherit module
>-
>-SRCREV =3D "fb2c37799306d16fb590aebee6fad8be431264b7"
>-PV =3D "2.4.0"
>-
>-# lttng currently blacklists arm with gcc-4.8
>-COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
>-
>-SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.4 \
>-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
>-           file://bio-bvec-iter.patch"
>-
>-export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>-export KERNEL_SRC=3D"${STAGING_KERNEL_DIR}"
>-
>-
>-S =3D "${WORKDIR}/git"
>-
>-do_install_append() {
>-	# Delete empty directories to avoid QA failures if no modules were built
>-	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
>-}
>-
>-python do_package_prepend() {
>-    if not os.path.exists(os.path.join(d.getVar('D', True),
>'lib/modules')):
>-        bb.warn("%s: no modules were created; this may be due to
>CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN',
>True))
>-}
>-
>diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
>b/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
>new file mode 100644
>index 0000000..1967631
>--- /dev/null
>+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
>@@ -0,0 +1,38 @@
>+SECTION =3D "devel"
>+SUMMARY =3D "Linux Trace Toolkit KERNEL MODULE"
>+DESCRIPTION =3D "The lttng-modules 2.0 package contains the kernel tracer
>modules"
>+LICENSE =3D "LGPLv2.1 & GPLv2"
>+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1412caf5a1aa90d6a48588a4794c0e=
ac \
>+                =20
>file://gpl-2.0.txt;md5=3D751419260aa954499f7abaabaa882bbe \
>+                =20
>file://lgpl-2.1.txt;md5=3D243b725d71bb5df4a1e5920b344b86ad"
>+
>+DEPENDS =3D "virtual/kernel"
>+
>+inherit module
>+
>+SRCREV =3D "85016adfb21268836df48dfb5cda106391e72fd1"
>+PV =3D "2.4.2"
>+
>+# lttng currently blacklists arm with gcc-4.8
>+COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
>+
>+SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.4 \
>+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
>+           "
>+
>+export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>+export KERNEL_SRC=3D"${STAGING_KERNEL_DIR}"
>+
>+
>+S =3D "${WORKDIR}/git"
>+
>+do_install_append() {
>+	# Delete empty directories to avoid QA failures if no modules were built
>+	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
>+}
>+
>+python do_package_prepend() {
>+    if not os.path.exists(os.path.join(d.getVar('D', True),
>'lib/modules')):
>+        bb.warn("%s: no modules were created; this may be due to
>CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN',
>True))
>+}
>+
>--=20
>1.7.9.5
>


