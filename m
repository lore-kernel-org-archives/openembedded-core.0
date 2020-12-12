Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.43])
 by mx.groups.io with SMTP id smtpd.web08.3203.1607777351687767445
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Dec 2020 04:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=hBp+bEIc;
 spf=pass (domain: kpit.com, ip: 40.107.138.43, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGU6c4F5kGCZjD/mvCRywTSusE5xaRwdpfYxLk36sxPcMsz1B9QQJ9ZuWWSK8xObfdJQeLReu482dzOGBN+AandhecA4/ZgmtEd9wLV+2sr5mm+6UE5yGeXvhWYzeRxvoKaYH5VkCB9w2c6SwjQ6EATkGDV8SmcHRe1eBYNK4edD+i0bCR4+LtgsqkH2JN1eALHGepotV9yIFqrZhpukP5wwTsBR2eFQjuIKAwO/ndd6n/8bBlg1v0TiccEQOEBkoIvgSD5cPdO8kFQx28x9R8vXmE67fvGnlfxPJa3SlTfzRRy9eU4JW+rZZyf8t2tJX9+mj183N8MoVbZx8qY0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQpEAdDeDmiA5mWTxLk/YKYFbpBnB0DafmuX+r2JvNY=;
 b=Jb0WkZcE9BTw0qM3XH0Rrfy5WVrMwqjh6djTvN+OLsBLhLomv4MtpgHkoN5sZux7dNVXIH3Bqg+9ozDrdfxVHIxtlY7dWGhphDOIC6kwrt46uD+RlxLkUDTtrumPe0aosROG5cmYshpBhsLpf/p0BSR43Wol19XJAFiKLt/J8breUdi9NfXC/tR9ukc5xyUM8iSD55ttOc6JZWdUQZm7iWSScqNVaLu6MWUL8/iit8lMu0K1DqVbXkFVQb0zxMfKU2axVDnjA2DnWWKjVfSOY8Vg8q5/+NYHOtATHOy1yC8DiG1ZXOSiAUNj3AY8+zysktO+0mAuUChrRqqur/+1ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQpEAdDeDmiA5mWTxLk/YKYFbpBnB0DafmuX+r2JvNY=;
 b=hBp+bEIcbLhEiMhTyTOZEgWAfj1t8HX55X3LKMFKGXrx3AvpZ9fUH6x5IA1AUrMzX8jLuVh0+TDBJ3ukbOsIqUGuEHt4OMXRLjp3oKewHv5XgTOpfHvXXKvq2cpkcfVlv1ua76OxDEaIqDdxqjADdzZdLZLomu6QQc2Cdm+hyfM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:45::20)
 by BM1PR0101MB1171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Sat, 12 Dec
 2020 12:49:01 +0000
Received: from BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e4a1:7a45:f267:6e56]) by BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e4a1:7a45:f267:6e56%5]) with mapi id 15.20.3654.020; Sat, 12 Dec 2020
 12:49:01 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.chougule@kpit.com,
	aditya.tayade@kpit.com
Subject: [poky][dunfell][PATCH] busybox: Implement dd iflag/oflag=direct
Date: Sat, 12 Dec 2020 18:18:21 +0530
Message-Id: <1607777301-27257-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [103.207.8.108]
X-ClientProxiedBy: BM1PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::14) To BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:45::20)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.207.8.108) by BM1PR01CA0120.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:40::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3654.12 via Frontend Transport; Sat, 12 Dec 2020 12:48:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e8c09467-1ca1-4233-f9a2-08d89e9c4cca
X-MS-TrafficTypeDiagnostic: BM1PR0101MB1171:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR0101MB117183FF84B71DE357AB73028EC90@BM1PR0101MB1171.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c/qGNKIsjTPiB/OTf2itr2hg9K+UhN9PrjMq1IZcBd6sFbmqxNtzzFuGUGcLatCO/fS9puPfiEYE6ksYNo7SyAGgmcZGdwCf2ajV+PWmWWr04T8bPp+tTC802gJcIUyDFPwFQEsgt1cWYtQmud5WslGlAnDA38AmG/4hxKRaJNGImpFpvVw6tP+Gs7abONjAkMek45vMoAXfJuRxS9x4Th6h65WkXCF9fQacU6++fgODdm6VJpnnscjeVt/k8g7sn23BXiQGtFGzBqp0w12mjK1CvAC4I8Yi0DoZeBK62cv+yX1kBv2JwvcuTfKOnoW08/k6EndkHC2I7XIGVF7VwuI/8yaSDJikXa+tKFPx/0wqFL+gv4Too7PVUEZNDAAiq884Wc1uNPrOvyt7aUxgi0ESNSMqqmfkGe/gBkWTsqZbkX4i/QtYc1NrmWeXrcqUVitkRBd0r1aaRA/gD0OIs1AMbB7wEfRE3xocMMMCiRo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(366004)(346002)(396003)(86362001)(186003)(2616005)(66946007)(956004)(6666004)(2906002)(4326008)(8936002)(52116002)(66556008)(66476007)(6486002)(69590400008)(6512007)(6916009)(83380400001)(107886003)(5660300002)(36756003)(478600001)(316002)(8676002)(26005)(6506007)(16526019)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ZMtJQEcY/coDsDq+JqwJKKr/UjZJH1B10HxPEnuoz2+FZh9s03nKthHuMlOV?=
 =?us-ascii?Q?gV6bIH45VhGR8z14DlZsXGnuhJ26V6Vdzdhf3N0lWdoOL8gduYmWd487s8wi?=
 =?us-ascii?Q?17lVtxfICxEYbIte+t2fbBXb07mH3BT3kEj0dZkAaa2kOUEGd7zbSBLVIbG0?=
 =?us-ascii?Q?XzleyhDfPZOPhUN1Secj/mhHo2CfpwmAMHEOymKMwnhXQaZyiQvtxTZ3TrPd?=
 =?us-ascii?Q?2hFR0JliC64hZG1X9OAPKslBMknKBo32+SBZyb9stMwq2EUTmpS9AGeAShXw?=
 =?us-ascii?Q?tO+B95PndDBucz9rbpNbPAdxhFGCg3BxNKZWkMvVm30KtNRu8X6zm3M0d0Ft?=
 =?us-ascii?Q?fiHNt8DqxQbvhZxFzLDmCsZFxHeRJoHI8x+hr2eoQ3XxJr8VUBQFpTnKWpRZ?=
 =?us-ascii?Q?zzPCnVP1WRBiB1BqBg1cO9wb80TFKTYP1BV8vbztNYHIQTLF+Zg3Mlh3pg9b?=
 =?us-ascii?Q?7rsF1NPkRfy0VwKEQNLocCz8GOYk+6aVBj1mB5OqOi4syJIGiOiZzjUK09Ll?=
 =?us-ascii?Q?IlktmQlFENVLtDKH35dsvhNs8lfuG755SRcAFE4RF6U+954DIhFsRupCPCKB?=
 =?us-ascii?Q?b80AZSI1KBODP1EZ8ww/V9zZRezCsjxwk1a9NrqpthMQD7GxBGqqIqYiHzsp?=
 =?us-ascii?Q?5Aut8cZXkqb7IfdTW1wgIpfQoQ+8gEjcrmByzQj666HCLEfXWKEgzodWGU1w?=
 =?us-ascii?Q?LzacZa0RlXA/nE+la2zxGde2nGhlJQ5BR5WKnKH9mYW+eYc0RQi//6iViRgj?=
 =?us-ascii?Q?AoaC+9+jFwRcXTl5coCoAj0ZpkXqT2yIbWqWxBzIe8AvZZJe8jEHLv6avNct?=
 =?us-ascii?Q?dylLjzhEJvcZR5YO1BEMtss5LLo9ohwYe4+Z635JoJkAM6idw5dfdSc1Mlsy?=
 =?us-ascii?Q?JW9DM4w+SBwETGwbdV2SgTu/G/P19KM6m0kXtwwAglp2+oHNOcALst4TDSDp?=
 =?us-ascii?Q?h762gERh/u14ZcjLKt9Lj8QLBNmry073TmFxEcvMrCDf09fLBJejUx7V/Ll6?=
 =?us-ascii?Q?CmB3?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2020 12:49:00.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c09467-1ca1-4233-f9a2-08d89e9c4cca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/WSGCJzwdcCXmfey/JoWl3V01c5ijIG5JxD0tLh/VWR/WGj7S9t/Qr9sBmPryYyJ4qJTuv8aj0HXFk5JwW6pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1171
Content-Type: text/plain

This implementation assumes that iflag/oflag=direct will be used only
on block devices and files that are multiples of pagesize, and makes
no effort to solve issues with unaligned or partial reads (unlike gnu
coreutils dd)

Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 ...d-implement-iflag-direct-and-oflag-direct.patch | 197 +++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb        |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-dd-implement-iflag-direct-and-oflag-direct.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-dd-implement-iflag-direct-and-oflag-direct.patch b/meta/recipes-core/busybox/busybox/0001-dd-implement-iflag-direct-and-oflag-direct.patch
new file mode 100644
index 0000000..9682323
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-dd-implement-iflag-direct-and-oflag-direct.patch
@@ -0,0 +1,197 @@
+From 52bce91b58dd9d9ee51c1b84ae53f91e2a3e156d Mon Sep 17 00:00:00 2001
+From: Ricardo Leite <ricardo.leite@criticaltechworks.com>
+Date: Tue, 10 Nov 2020 16:21:51 +0000
+Subject: [PATCH] dd: implement iflag=direct and oflag=direct
+
+This implementation assumes that iflag/oflag=direct will be used only on
+block devices and files that are multiples of pagesize, and makes no
+effort to solve issues with unaligned or partial reads (unlike gnu
+coreutils dd)
+
+Using iflag/oflag=direct will also limit usage block sizes, which must
+also be a multiple of pagesize
+
+Upstream-Status: Submitted [busybox@busybox.net]
+---
+ coreutils/dd.c | 80 ++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 64 insertions(+), 16 deletions(-)
+
+diff --git a/coreutils/dd.c b/coreutils/dd.c
+index b5f3cbec5..b4fb71a49 100644
+--- a/coreutils/dd.c
++++ b/coreutils/dd.c
+@@ -59,7 +59,7 @@
+ //usage:       "[if=FILE] [of=FILE] [" IF_FEATURE_DD_IBS_OBS("ibs=N obs=N/") "bs=N] [count=N] [skip=N] [seek=N]\n"
+ //usage:	IF_FEATURE_DD_IBS_OBS(
+ //usage:       "	[conv=notrunc|noerror|sync|fsync]\n"
+-//usage:       "	[iflag=skip_bytes|fullblock] [oflag=seek_bytes|append]"
++//usage:       "	[iflag=skip_bytes|fullblock|direct] [oflag=seek_bytes|append|direct]"
+ //usage:	)
+ //usage:#define dd_full_usage "\n\n"
+ //usage:       "Copy a file with converting and formatting\n"
+@@ -83,8 +83,10 @@
+ //usage:     "\n	conv=swab	Swap every pair of bytes"
+ //usage:     "\n	iflag=skip_bytes	skip=N is in bytes"
+ //usage:     "\n	iflag=fullblock	Read full blocks"
++//usage:     "\n	iflag=direct	use direct I/O for data (limited support, file and bs must be a pagesize multiple)"
+ //usage:     "\n	oflag=seek_bytes	seek=N is in bytes"
+ //usage:     "\n	oflag=append	Open output file in append mode"
++//usage:     "\n	oflag=direct	use direct I/O for data (limited support, file and bs must be a pagesize multiple)"
+ //usage:	)
+ //usage:	IF_FEATURE_DD_STATUS(
+ //usage:     "\n	status=noxfer	Suppress rate output"
+@@ -137,16 +139,18 @@ enum {
+ 	FLAG_IFLAG_SHIFT = 5,
+ 	FLAG_SKIP_BYTES = (1 << 5) * ENABLE_FEATURE_DD_IBS_OBS,
+ 	FLAG_FULLBLOCK = (1 << 6) * ENABLE_FEATURE_DD_IBS_OBS,
++	FLAG_IDIRECT = (1 << 7) * ENABLE_FEATURE_DD_IBS_OBS,
+ 	/* end of input flags */
+ 	/* start of output flags */
+-	FLAG_OFLAG_SHIFT = 7,
+-	FLAG_SEEK_BYTES = (1 << 7) * ENABLE_FEATURE_DD_IBS_OBS,
+-	FLAG_APPEND = (1 << 8) * ENABLE_FEATURE_DD_IBS_OBS,
++	FLAG_OFLAG_SHIFT = 8,
++	FLAG_SEEK_BYTES = (1 << 8) * ENABLE_FEATURE_DD_IBS_OBS,
++	FLAG_APPEND = (1 << 9) * ENABLE_FEATURE_DD_IBS_OBS,
++	FLAG_ODIRECT = (1 << 10) * ENABLE_FEATURE_DD_IBS_OBS,
+ 	/* end of output flags */
+-	FLAG_TWOBUFS = (1 << 9) * ENABLE_FEATURE_DD_IBS_OBS,
+-	FLAG_COUNT   = 1 << 10,
+-	FLAG_STATUS_NONE = 1 << 11,
+-	FLAG_STATUS_NOXFER = 1 << 12,
++	FLAG_TWOBUFS = (1 << 11) * ENABLE_FEATURE_DD_IBS_OBS,
++	FLAG_COUNT   = 1 << 12,
++	FLAG_STATUS_NONE = 1 << 13,
++	FLAG_STATUS_NOXFER = 1 << 14,
+ };
+ 
+ static void dd_output_status(int UNUSED_PARAM cur_signal)
+@@ -252,6 +256,13 @@ static int parse_comma_flags(char *val, const char *words, const char *error_in)
+ 	}
+ 	return flags;
+ }
++
++static char *ptr_align(char *ptr, size_t alignment)
++{
++  char *p0 = ptr;
++  char *p1 = p0 + alignment - 1;
++  return p1 - (size_t) p1 % alignment;
++}
+ #endif
+ 
+ int dd_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
+@@ -267,9 +278,9 @@ int dd_main(int argc UNUSED_PARAM, char **argv)
+ 	static const char conv_words[] ALIGN1 =
+ 		"notrunc\0""sync\0""noerror\0""fsync\0""swab\0";
+ 	static const char iflag_words[] ALIGN1 =
+-		"skip_bytes\0""fullblock\0";
++		"skip_bytes\0""fullblock\0""direct\0";
+ 	static const char oflag_words[] ALIGN1 =
+-		"seek_bytes\0append\0";
++		"seek_bytes\0append\0""direct\0";
+ #endif
+ #if ENABLE_FEATURE_DD_STATUS
+ 	static const char status_words[] ALIGN1 =
+@@ -310,7 +321,9 @@ int dd_main(int argc UNUSED_PARAM, char **argv)
+ 	//swab          swap every pair of input bytes: will abort on non-even reads
+ 		OP_iflag_skip_bytes,
+ 		OP_iflag_fullblock,
++		OP_iflag_direct,
+ 		OP_oflag_seek_bytes,
++		OP_oflag_direct,
+ #endif
+ 	};
+ 	smallint exitcode = EXIT_FAILURE;
+@@ -320,9 +333,13 @@ int dd_main(int argc UNUSED_PARAM, char **argv)
+ #if ENABLE_FEATURE_DD_IBS_OBS
+ 	size_t obs = 512;
+ 	char *obuf;
++	char *ibufptr, *obufptr;
++	int pagesize;
+ #else
+ # define obs  ibs
+ # define obuf ibuf
++# define ibufptr ibuf
++# define obufptr ibuf
+ #endif
+ 	/* These are all zeroed at once! */
+ 	struct {
+@@ -427,13 +444,33 @@ int dd_main(int argc UNUSED_PARAM, char **argv)
+ 	} /* end of "for (argv[i])" */
+ 
+ //XXX:FIXME for huge ibs or obs, malloc'ing them isn't the brightest idea ever
+-	ibuf = xmalloc(ibs);
+-	obuf = ibuf;
+ #if ENABLE_FEATURE_DD_IBS_OBS
++	/* because of O_DIRECT, block needs to be page-aligned */
++	pagesize = getpagesize();
++	ibufptr = xmalloc(ibs + pagesize);
++	obufptr = ibufptr;
+ 	if (ibs != obs) {
+ 		G.flags |= FLAG_TWOBUFS;
+-		obuf = xmalloc(obs);
++		obufptr = xmalloc(obs + pagesize);
+ 	}
++
++	/* most filesystems will refuse O_DIRECT if read/writes aren't pagesize aligned */
++	if ((G.flags & FLAG_IDIRECT) && (ibs % pagesize)) {
++		bb_error_msg_and_die("iflag=direct needs bs %lu to be a multiple of pagesize %d",
++			ibs, pagesize);
++	}
++	if ((G.flags & FLAG_ODIRECT) && (obs % pagesize)) {
++		bb_error_msg_and_die("oflag=direct needs bs %lu to be a multiple of pagesize %d",
++			ibs, pagesize);
++	}
++
++	ibuf = ptr_align(ibufptr, pagesize);
++	obuf = ptr_align(obufptr, pagesize);
++#else
++	ibufptr = xmalloc(ibs);
++	obufptr = ibufptr;
++	ibuf = ibufptr;
++	obuf = obufptr;
+ #endif
+ 
+ #if ENABLE_FEATURE_DD_SIGNAL_HANDLING
+@@ -444,7 +481,14 @@ int dd_main(int argc UNUSED_PARAM, char **argv)
+ #endif
+ 
+ 	if (infile) {
+-		xmove_fd(xopen(infile, O_RDONLY), ifd);
++		int iflag = O_RDONLY;
++
++#if ENABLE_FEATURE_DD_IBS_OBS
++		if (G.flags & FLAG_IDIRECT)
++			iflag |= O_DIRECT;
++#endif
++
++		xmove_fd(xopen(infile, iflag), ifd);
+ 	} else {
+ 		infile = bb_msg_standard_input;
+ 	}
+@@ -455,6 +499,10 @@ int dd_main(int argc UNUSED_PARAM, char **argv)
+ 			oflag |= O_TRUNC;
+ 		if (G.flags & FLAG_APPEND)
+ 			oflag |= O_APPEND;
++#if ENABLE_FEATURE_DD_IBS_OBS
++		if (G.flags & FLAG_ODIRECT)
++			oflag |= O_DIRECT;
++#endif
+ 
+ 		xmove_fd(xopen(outfile, oflag), ofd);
+ 
+@@ -601,9 +649,9 @@ int dd_main(int argc UNUSED_PARAM, char **argv)
+ 		dd_output_status(0);
+ 
+ 	if (ENABLE_FEATURE_CLEAN_UP) {
+-		free(obuf);
++		free(obufptr);
+ 		if (G.flags & FLAG_TWOBUFS)
+-			free(ibuf);
++			free(ibufptr);
+ 	}
+ 
+ 	return exitcode;
+-- 
+2.29.2
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 7563368..f7df4a6 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://busybox-CVE-2018-1000500.patch \
            file://0001-hwclock-make-glibc-2.31-compatible.patch \
+           file://0001-dd-implement-iflag-direct-and-oflag-direct.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.7.4

