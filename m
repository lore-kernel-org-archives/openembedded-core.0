Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD06DD21246
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:40:13 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.44552.1729154403810974911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: vince_chang@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 17 Oct
 2024 16:40:02 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 17 Oct 2024 16:40:02 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 2/2] util-linux: sfdisk sector size improvements
Date: Thu, 17 Oct 2024 16:40:02 +0800
Message-ID: <20241017084002.4093919-3-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241017084002.4093919-1-vince_chang@aspeedtech.com>
References: <20241017084002.4093919-1-vince_chang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205993

Refer to https://github.com/util-linux/util-linux/pull/3237.

Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 ...-and-sfdisk-sector-size-improvements.patch | 252 ++++++++++++++++++
 2 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk=
-and-sfdisk-sector-size-improvements.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index ff47131d12..1c066631f3 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -39,6 +39,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v=
${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            file://fcntl-lock.c \
            file://0001-Revert-autotools-make-pam-install-path-configurable=
.patch \
+           file://libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patc=
h \
            "
=20
 SRC_URI[sha256sum] =3D "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd662820=
3b2a2b67c8e8b3"
diff --git a/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sf=
disk-sector-size-improvements.patch b/meta/recipes-core/util-linux/util-lin=
ux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
new file mode 100644
index 0000000000..356194a8ba
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-se=
ctor-size-improvements.patch
@@ -0,0 +1,252 @@
+From 7ada6547fcd1f649fadaa8021ff21e3e0f431459 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 14 Oct 2024 11:45:32 +0200
+Subject: [PATCH 1/4] libfdisk: make sure libblkid uses the same sector siz=
e
+
+Libfdisk uses libblkid to check for filesystems on the device. It
+makes sense for both libraries to share the logical sector size
+setting, as this setting can be modified by using the fdisk command
+line.
+
+We do not see this as an issue, as filesystem detection rarely depends
+on sector size (with the exception of some RAIDs). Additionally,
+libblkid is usually intelligent enough to check multiple locations
+independently of the current device's sector size setting.
+
+Addresses: https://github.com/util-linux/util-linux/pull/3235
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/=
3237]
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ libfdisk/src/wipe.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libfdisk/src/wipe.c b/libfdisk/src/wipe.c
+index bb5f1bb38bf..f389ed4194a 100644
+--- a/libfdisk/src/wipe.c
++++ b/libfdisk/src/wipe.c
+@@ -133,6 +133,7 @@ int fdisk_do_wipe(struct fdisk_context *cxt)
+ 			DBG(WIPE, ul_debugobj(wp, "blkid_probe_set_device() failed [rc=3D%d]",=
 rc));
+ 			return rc;
+ 		}
++		blkid_probe_set_sectorsize(pr, cxt->sector_size);
+=20
+ 		DBG(WIPE, ul_debugobj(wp, " wiping..."));
+ 		blkid_wipe_all(pr);
+@@ -176,6 +177,8 @@ int fdisk_check_collisions(struct fdisk_context *cxt)
+ 	free(cxt->collision);
+ 	cxt->collision =3D NULL;
+=20
++	blkid_probe_set_sectorsize(pr, cxt->sector_size);
++
+ 	blkid_probe_enable_superblocks(pr, 1);
+ 	blkid_probe_set_superblocks_flags(pr, BLKID_SUBLKS_TYPE |
+ 			                      BLKID_SUBLKS_BADCSUM);
+
+From 54f9a79301dcf492cab8e07134f96a921d367aa0 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 14 Oct 2024 15:47:03 +0200
+Subject: [PATCH 2/4] fdisk: (man) improve --sector-size description
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ disk-utils/fdisk.8.adoc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/disk-utils/fdisk.8.adoc b/disk-utils/fdisk.8.adoc
+index cb72b4a3ea5..5941aa34968 100644
+--- a/disk-utils/fdisk.8.adoc
++++ b/disk-utils/fdisk.8.adoc
+@@ -40,7 +40,7 @@ Note that *partx*(8) provides a rich interface for scrip=
ts to print disk layouts
+ =3D=3D OPTIONS
+=20
+ *-b*, *--sector-size* _sectorsize_::
+-Specify the sector size of the disk. Valid values are 512, 1024, 2048, an=
d 4096. (Recent kernels know the sector size. Use this option only on old k=
ernels or to override the kernel's ideas.) Since util-linux-2.17, *fdisk* d=
ifferentiates between logical and physical sector size. This option changes=
 both sector sizes to _sectorsize_.
++Specify the sector size of the disk. Valid values are 512, 1024, 2048, an=
d 4096. The kernel is aware of the sector size for regular block devices. U=
se this option only on very old kernels, when working with disk images, or =
to override the kernel's default sector size. Since util-linux-2.17, *fdisk=
* distinguishes between logical and physical sector size. This option chang=
es both sector sizes to the specified _sectorsize_.
+=20
+ *-B*, *--protect-boot*::
+ Don't erase the beginning of the first disk sector when creating a new di=
sk label. This feature is supported for GPT and MBR.
+
+From fd38ee2274f7a30393d3839dfce556260355c3fa Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 14 Oct 2024 15:48:46 +0200
+Subject: [PATCH 3/4] cfdisk: add --sector-size commanand line option
+
+* improves compatibility with fdisk
+* add ability to work with disk images where libfdisk defaults to 512
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ disk-utils/cfdisk.8.adoc |  3 +++
+ disk-utils/cfdisk.c      | 15 ++++++++++++++-
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/disk-utils/cfdisk.8.adoc b/disk-utils/cfdisk.8.adoc
+index 97fad621d12..759f39f0e1a 100644
+--- a/disk-utils/cfdisk.8.adoc
++++ b/disk-utils/cfdisk.8.adoc
+@@ -55,6 +55,9 @@ Use exclusive BSD lock for device or file it operates. T=
he optional argument _mo
+ *-r*, *--read-only*::
+ Forced open in read-only mode.
+=20
++*-b*, *--sector-size* _sectorsize_::
++Specify the sector size of the disk. Valid values are 512, 1024, 2048, an=
d 4096. The kernel is aware of the sector size for regular block devices. U=
se this option only on very old kernels, when working with disk images, or =
to override the kernel's default sector size. Since util-linux-2.17, *fdisk=
* distinguishes between logical and physical sector size. This option chang=
es both sector sizes to the specified _sectorsize_.
++
+ *-z*, *--zero*::
+ Start with an in-memory zeroed partition table. This option does not zero=
 the partition table on the disk; rather, it simply starts the program with=
out reading the existing partition table. This option allows you to create =
a new partition table from scratch or from an *sfdisk*(8)-compatible script=
.
+=20
+diff --git a/disk-utils/cfdisk.c b/disk-utils/cfdisk.c
+index 2e0aada474a..bc1c87d83e4 100644
+--- a/disk-utils/cfdisk.c
++++ b/disk-utils/cfdisk.c
+@@ -2731,6 +2731,8 @@ static void __attribute__((__noreturn__)) usage(void=
)
+ 	      _("     --lock[=3D<mode>]      use exclusive device lock (%s, %s o=
r %s)\n"), "yes", "no", "nonblock");
+ 	fputs(_(" -r, --read-only          forced open cfdisk in read-only mode\=
n"), out);
+=20
++	fputs(_(" -b, --sector-size <size> physical and logical sector size\n"),=
 out);
++
+ 	fputs(USAGE_SEPARATOR, out);
+ 	fprintf(out, USAGE_HELP_OPTIONS(26));
+=20
+@@ -2743,6 +2745,7 @@ int main(int argc, char *argv[])
+ 	const char *diskpath =3D NULL, *lockmode =3D NULL;
+ 	int rc, c, colormode =3D UL_COLORMODE_UNDEF;
+ 	int read_only =3D 0;
++	size_t user_ss =3D 0;
+ 	struct cfdisk _cf =3D { .lines_idx =3D 0 },
+ 		      *cf =3D &_cf;
+ 	enum {
+@@ -2752,6 +2755,7 @@ int main(int argc, char *argv[])
+ 		{ "color",   optional_argument, NULL, 'L' },
+ 		{ "lock",    optional_argument, NULL, OPT_LOCK },
+ 		{ "help",    no_argument,       NULL, 'h' },
++		{ "sector-size", required_argument, NULL, 'b' },
+ 		{ "version", no_argument,       NULL, 'V' },
+ 		{ "zero",    no_argument,	NULL, 'z' },
+ 		{ "read-only", no_argument,     NULL, 'r' },
+@@ -2763,8 +2767,15 @@ int main(int argc, char *argv[])
+ 	textdomain(PACKAGE);
+ 	close_stdout_atexit();
+=20
+-	while((c =3D getopt_long(argc, argv, "L::hVzr", longopts, NULL)) !=3D -1=
) {
++	while((c =3D getopt_long(argc, argv, "b:L::hVzr", longopts, NULL)) !=3D =
-1) {
+ 		switch(c) {
++		case 'b':
++			user_ss =3D strtou32_or_err(optarg,
++					_("invalid sector size argument"));
++			if (user_ss !=3D 512 && user_ss !=3D 1024 &&
++			    user_ss !=3D 2048 && user_ss !=3D 4096)
++				errx(EXIT_FAILURE, _("invalid sector size argument"));
++			break;
+ 		case 'h':
+ 			usage();
+ 			break;
+@@ -2803,6 +2814,8 @@ int main(int argc, char *argv[])
+ 	cf->cxt =3D fdisk_new_context();
+ 	if (!cf->cxt)
+ 		err(EXIT_FAILURE, _("failed to allocate libfdisk context"));
++	if (user_ss)
++		fdisk_save_user_sector_size(cf->cxt, user_ss, user_ss);
+=20
+ 	fdisk_set_ask(cf->cxt, ask_callback, (void *) cf);
+=20
+
+From ef7b76baa17ddb5414691fa8f49d61415c30871c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 14 Oct 2024 15:50:40 +0200
+Subject: [PATCH 4/4] sfdisk: add --sector-size commanand line option
+
+* improves compatibility with fdisk
+* add ability to work with disk images where libfdisk defaults to 512
+
+Addresses: https://github.com/util-linux/util-linux/pull/3235
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ disk-utils/sfdisk.8.adoc |  5 ++++-
+ disk-utils/sfdisk.c      | 14 ++++++++++++++
+ 2 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/disk-utils/sfdisk.8.adoc b/disk-utils/sfdisk.8.adoc
+index 26ccad5a3b2..ce9e97b7682 100644
+--- a/disk-utils/sfdisk.8.adoc
++++ b/disk-utils/sfdisk.8.adoc
+@@ -208,6 +208,9 @@ The default list of columns may be extended if _list_ =
is specified in the format
+ *-q*, *--quiet*::
+ Suppress extra info messages.
+=20
++*--sector-size* _sectorsize_::
++Specify the sector size of the disk. Valid values are 512, 1024, 2048, an=
d 4096. The kernel is aware of the sector size for regular block devices. U=
se this option only on very old kernels, when working with disk images, or =
to override the kernel's default sector size. Since util-linux-2.17, *fdisk=
* distinguishes between logical and physical sector size. This option chang=
es both sector sizes to the specified _sectorsize_.
++
+ *-u*, *--unit S*::
+ Deprecated option. Only the sector unit is supported. This option is not =
supported when using the *--show-size* command.
+=20
+@@ -256,7 +259,7 @@ Specify the maximal number of GPT partitions.
+ *grain*::
+ Specify minimal size in bytes used to calculate partitions alignment. The=
 default is 1MiB and it's strongly recommended to use the default. Do not m=
odify this variable if you're not sure.
+ *sector-size*::
+-Specify sector size. *sfdisk* always uses device sector size. Since versi=
on 2.39 *sfdisk* recalculates sizes from dump if the script and device sect=
or size differ.
++Specifies the sector size used in the input. *sfdisk* always internally u=
ses the device sector size provided by the kernel for the block device, or =
as specified by the user on the command line (see *--sector-size*). Startin=
g with version 2.39, *sfdisk* recalculates sizes from the input if the *sec=
tor-size* header and device sector size are different.
+=20
+ Note that it is only possible to use header lines before the first partit=
ion is specified in the input.
+=20
+diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
+index cf402007b51..5e7c1d926e4 100644
+--- a/disk-utils/sfdisk.c
++++ b/disk-utils/sfdisk.c
+@@ -2155,6 +2155,8 @@ static void __attribute__((__noreturn__)) usage(void=
)
+ 	      _("     --color[=3D<when>]      colorize output (%s, %s or %s)\n")=
, "auto", "always", "never");
+ 	fprintf(out,
+ 	        "                             %s\n", USAGE_COLORS_DEFAULT);
++	fputs(_("     --sector-size <size>  physical and logical sector size\n")=
, out);
++
+ 	fprintf(out,
+ 	      _("     --lock[=3D<mode>]       use exclusive device lock (%s, %s =
or %s)\n"), "yes", "no", "nonblock");
+ 	fputs(_(" -N, --partno <num>        specify partition number\n"), out);
+@@ -2191,6 +2193,7 @@ int main(int argc, char *argv[])
+ 	const char *outarg =3D NULL;
+ 	int rc =3D -EINVAL, c, longidx =3D -1, bytes =3D 0;
+ 	int colormode =3D UL_COLORMODE_UNDEF;
++	size_t user_ss =3D 0;
+ 	struct sfdisk _sf =3D {
+ 		.partno =3D -1,
+ 		.wipemode =3D WIPEMODE_AUTO,
+@@ -2217,6 +2220,7 @@ int main(int argc, char *argv[])
+ 		OPT_NOTELL,
+ 		OPT_RELOCATE,
+ 		OPT_LOCK,
++		OPT_SECTORSIZE
+ 	};
+=20
+ 	static const struct option longopts[] =3D {
+@@ -2246,6 +2250,7 @@ int main(int argc, char *argv[])
+ 		{ "output",  required_argument, NULL, 'o' },
+ 		{ "partno",  required_argument, NULL, 'N' },
+ 		{ "reorder", no_argument,       NULL, 'r' },
++		{ "sector-size", required_argument, NULL, OPT_SECTORSIZE },
+ 		{ "show-geometry", no_argument, NULL, 'g' },
+ 		{ "quiet",   no_argument,       NULL, 'q' },
+ 		{ "verify",  no_argument,       NULL, 'V' },
+@@ -2450,6 +2455,13 @@ int main(int argc, char *argv[])
+ 				sf->lockmode =3D optarg;
+ 			}
+ 			break;
++		case OPT_SECTORSIZE:
++			user_ss =3D strtou32_or_err(optarg,
++					_("invalid sector size argument"));
++			if (user_ss !=3D 512 && user_ss !=3D 1024 &&
++			    user_ss !=3D 2048 && user_ss !=3D 4096)
++				errx(EXIT_FAILURE, _("invalid sector size argument"));
++			break;
+ 		default:
+ 			errtryhelp(EXIT_FAILURE);
+ 		}
+@@ -2460,6 +2472,8 @@ int main(int argc, char *argv[])
+ 	sfdisk_init(sf);
+ 	if (bytes)
+ 		fdisk_set_size_unit(sf->cxt, FDISK_SIZEUNIT_BYTES);
++	if (user_ss)
++		fdisk_save_user_sector_size(sf->cxt, user_ss, user_ss);
+=20
+ 	if (outarg)
+ 		init_fields(NULL, outarg, NULL);
--=20
2.25.1


