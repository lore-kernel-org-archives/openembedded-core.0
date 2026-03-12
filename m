Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA411067038
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:10:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22564.1773324606721510671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HRTZB2L4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAkDF1133876;
	Thu, 12 Mar 2026 14:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Hs49rMt4aTz5nlR9wv5dKUHwhLoR1zKDfGJoHTJrBHE=; b=
	HRTZB2L40W9VQ/ot5dRSndMK1zv8eLRI417Ti2RwF5uB2QTJL+cCbmY/1FXc+Eeg
	gvO0GhDsiI/v0aVvFln4Ada5ES/BfC9Q0NNeChDCjhI2FaqCuWSSL0Hjhx2h3YXm
	9Cgf+hoJP/i6G8JIDlkTGEWTpHyrR/FFL9TNIeRQpjdjO6rQ29g2AQ84JF8gYZTt
	1C5CT6Y5J9SD3i3ERzsChZsBaY82maMZqbfv46c7/s4xJPG3Dm0nuJMmYuBWAWod
	eEGWyXq+BanDjXwzxcJnKCdOIZjkc7YD/wHGLa+i5Wd80CCePwo7tUF4fUa83lEc
	ntvPZnB/e0kuVvfvTJkHhQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqr9qb-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 14:09:45 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 12 Mar 2026 07:09:41 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 12 Mar 2026 07:09:41 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
        <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>
Subject: [PATCH v8 9/9] libarchive: Make it work with rpm 6
Date: Thu, 12 Mar 2026 07:09:39 -0700
Message-ID: <9ee544efe319d8a002a88c0401da0a2e5ae007a9.1773324129.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1773324129.git.liezhi.yang@windriver.com>
References: <cover.1773324129.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: DbsTO7YhVio7H_k1uO_kaf-U0zC8uvW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExMyBTYWx0ZWRfX4JpDeiBDvi5z
 mroxE94Ntr1VJ0fH3zCte5sKx+vDYon7Ea5/iuOLoKApcJ+FDRziyHFtayayq+xAcixAVDSgxFt
 YrB3LtlHvWoNwRDgpTD/oFeY63mMEN7GiYav7CvnZGp9OaSEsKvoaLIngcaKw0rz8GDqyq6ySYA
 EaIfJOUwA39Wc3w28SGJDGhUH5Ahy3s3RY2kUx4dcAVJg8r3tfJlJ/w+4uT7AQvHr8FtqAKnxtM
 SnZ9XNXTVAKH3DNI87jb2EmMOqCD/3Vsj11xOgnx7JqMz4TY1rx8NSKvRUja40/ZfpZWpbPuWnh
 3JW1/TQEjhf2xyCBWXun2ob6cVRy/QuuSB6XQwYGqvyqiv3xcunfh4Igr6lrG59Zj+ZLSSNotg4
 5ZTofZdSt8XsoWamAedX7TLkH/KBZso9ap6Jjl3jxhy2LjWzrGTTtuInbKY+Bak7kHDyYMSabRd
 rbyqetli2x1qWuGxVtA==
X-Proofpoint-GUID: DbsTO7YhVio7H_k1uO_kaf-U0zC8uvW0
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2c929 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8
 a=NVJG4ytxkcP8Wv6WfFAA:9 a=o368JN8bwFOL8RRm:21 a=fYNom5PXsM5enKJDCoVv:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232963

From: Robert Yang <liezhi.yang@windriver.com>

The patch is from:
https://github.com/libarchive/libarchive/pull/2846

Fixed:
$ oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native

cannot open archive from pipe /path/to/tmp-debuginfod/work/x86-64-v3-poky-linux/xz/5.8.2/localpkgfeed/x86_64_v3/bash-locale-vi-5.3-r0.x86_64_v3.rpm
libarchive error: cannot open archive from pipe: Unrecognized archive format
exceptions encountered during archive scan

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...end_filter-Keep-iterating-even-if-na.patch |   48 +
 ...egister_bidder-Allow-ARCHIVE_STATE_H.patch |   45 +
 ...er-into-a-proper-format-supporting-b.patch | 1723 +++++++++++++++++
 .../libarchive/libarchive_3.8.6.bb            |    3 +
 4 files changed, 1819 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-archive_read_append_filter-Keep-iterating-even-if-na.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0002-__archive_read_register_bidder-Allow-ARCHIVE_STATE_H.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Convert-RPM-reader-into-a-proper-format-supporting-b.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-archive_read_append_filter-Keep-iterating-even-if-na.patch b/meta/recipes-extended/libarchive/libarchive/0001-archive_read_append_filter-Keep-iterating-even-if-na.patch
new file mode 100644
index 0000000000..8e236cedc8
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-archive_read_append_filter-Keep-iterating-even-if-na.patch
@@ -0,0 +1,48 @@
+From 26401df2e74e6d72e86fab165445949c9dd3eba9 Mon Sep 17 00:00:00 2001
+From: Davide Beatrici <git@davidebeatrici.dev>
+Date: Sat, 21 Feb 2026 02:55:40 +0100
+Subject: [PATCH 1/3] archive_read_append_filter(): Keep iterating even if name
+ is null
+
+While working on the RPM format I noticed the zstd filter failed to append.
+
+Turns out there are two unknown filters that are registered with a null name:
+
+bidder candidate bzip2
+bidder candidate compress (.Z)
+bidder candidate gzip
+bidder candidate lzip
+bidder candidate lzma
+bidder candidate xz
+bidder candidate uu
+bidder candidate lrzip
+bidder candidate (null)
+bidder candidate (null)
+bidder candidate lz4
+bidder candidate zstd
+
+I'm not sure if anonymous filters are expected behavior, but I believe this change doesn't hurt.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/2846]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libarchive/archive_read_append_filter.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
+index cd88df11..9475b704 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -117,7 +117,7 @@ archive_read_append_filter(struct archive *_a, int code)
+     bidder = a->bidders;
+     for (i = 1; i < number_bidders; i++, bidder++)
+     {
+-      if (!bidder->name || !strcmp(bidder->name, str))
++      if (bidder->name && !strcmp(bidder->name, str))
+         break;
+     }
+     if (!bidder->name || strcmp(bidder->name, str))
+-- 
+2.49.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive/0002-__archive_read_register_bidder-Allow-ARCHIVE_STATE_H.patch b/meta/recipes-extended/libarchive/libarchive/0002-__archive_read_register_bidder-Allow-ARCHIVE_STATE_H.patch
new file mode 100644
index 0000000000..3ddfedb27c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0002-__archive_read_register_bidder-Allow-ARCHIVE_STATE_H.patch
@@ -0,0 +1,45 @@
+From 8eafdb93fd551bfed7184bc7519f5d455811cefb Mon Sep 17 00:00:00 2001
+From: Davide Beatrici <git@davidebeatrici.dev>
+Date: Sat, 21 Feb 2026 05:33:36 +0100
+Subject: [PATCH 2/3] __archive_read_register_bidder(): Allow
+ ARCHIVE_STATE_HEADER, check if already registered
+
+This allows formats to apply filters when they know what they need.
+
+In the case of RPM, that's after parsing the (uncompressed) header.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/2846]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libarchive/archive_read.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
+index c9b9d598..bc6305ae 100644
+--- a/libarchive/archive_read.c
++++ b/libarchive/archive_read.c
+@@ -1232,13 +1232,18 @@ __archive_read_register_bidder(struct archive_read *a,
+ 	int i, number_slots;
+ 
+ 	archive_check_magic(&a->archive, ARCHIVE_READ_MAGIC,
+-	    ARCHIVE_STATE_NEW, "__archive_read_register_bidder");
++	    ARCHIVE_STATE_NEW | ARCHIVE_STATE_HEADER,
++		"__archive_read_register_bidder");
+ 
+ 	number_slots = sizeof(a->bidders) / sizeof(a->bidders[0]);
+ 
+ 	for (i = 0; i < number_slots; i++) {
+-		if (a->bidders[i].vtable != NULL)
++		if (a->bidders[i].vtable != NULL) {
++			if (a->bidders[i].vtable == vtable)
++				/* Already registered. */
++				return (ARCHIVE_OK);
+ 			continue;
++		}
+ 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
+ 		bidder = (a->bidders + i);
+ 		bidder->data = bidder_data;
+-- 
+2.49.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Convert-RPM-reader-into-a-proper-format-supporting-b.patch b/meta/recipes-extended/libarchive/libarchive/0003-Convert-RPM-reader-into-a-proper-format-supporting-b.patch
new file mode 100644
index 0000000000..b231042f93
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0003-Convert-RPM-reader-into-a-proper-format-supporting-b.patch
@@ -0,0 +1,1723 @@
+From b31625af1c540e26da4c387eb0a6a81f7cf9b5a9 Mon Sep 17 00:00:00 2001
+From: Davide Beatrici <git@davidebeatrici.dev>
+Date: Wed, 4 Mar 2026 22:58:41 +0100
+Subject: [PATCH 3/3] Convert RPM reader into a proper format, supporting both
+ stripped CPIO and SVR4
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/2846]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.am                                   |    2 +-
+ contrib/android/Android.mk                    |    2 +-
+ libarchive/CMakeLists.txt                     |    2 +-
+ libarchive/archive.h                          |    5 +-
+ libarchive/archive_read_append_filter.c       |    4 -
+ libarchive/archive_read_private.h             |    2 +-
+ libarchive/archive_read_set_format.c          |    3 +
+ libarchive/archive_read_support_filter_all.c  |    2 -
+ .../archive_read_support_filter_by_code.c     |    2 -
+ libarchive/archive_read_support_filter_rpm.c  |  294 -----
+ libarchive/archive_read_support_format_all.c  |    1 +
+ libarchive/archive_read_support_format_rpm.c  | 1126 +++++++++++++++++
+ libarchive/test/test_archive_read_support.c   |    2 +-
+ .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
+ .../test_read_format_cpio_svr4_gzip_rpm.c     |    6 +-
+ libarchive/test/test_read_format_huge_rpm.c   |    4 +-
+ 16 files changed, 1142 insertions(+), 319 deletions(-)
+ delete mode 100644 libarchive/archive_read_support_filter_rpm.c
+ create mode 100644 libarchive/archive_read_support_format_rpm.c
+
+diff --git a/Makefile.am b/Makefile.am
+index b6bf5482..ec4cf678 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -183,7 +183,6 @@ libarchive_la_SOURCES= \
+ 	libarchive/archive_read_support_filter_lzop.c \
+ 	libarchive/archive_read_support_filter_none.c \
+ 	libarchive/archive_read_support_filter_program.c \
+-	libarchive/archive_read_support_filter_rpm.c \
+ 	libarchive/archive_read_support_filter_uu.c \
+ 	libarchive/archive_read_support_filter_xz.c \
+ 	libarchive/archive_read_support_filter_zstd.c \
+@@ -200,6 +199,7 @@ libarchive_la_SOURCES= \
+ 	libarchive/archive_read_support_format_rar.c \
+ 	libarchive/archive_read_support_format_rar5.c \
+ 	libarchive/archive_read_support_format_raw.c \
++	libarchive/archive_read_support_format_rpm.c \
+ 	libarchive/archive_read_support_format_tar.c \
+ 	libarchive/archive_read_support_format_warc.c \
+ 	libarchive/archive_read_support_format_xar.c \
+diff --git a/contrib/android/Android.mk b/contrib/android/Android.mk
+index 20e46a69..dc54c6b5 100644
+--- a/contrib/android/Android.mk
++++ b/contrib/android/Android.mk
+@@ -74,7 +74,6 @@ libarchive_src_files := libarchive/archive_acl.c \
+ 						libarchive/archive_read_support_filter_lzop.c \
+ 						libarchive/archive_read_support_filter_none.c \
+ 						libarchive/archive_read_support_filter_program.c \
+-						libarchive/archive_read_support_filter_rpm.c \
+ 						libarchive/archive_read_support_filter_uu.c \
+ 						libarchive/archive_read_support_filter_xz.c \
+ 						libarchive/archive_read_support_filter_zstd.c \
+@@ -91,6 +90,7 @@ libarchive_src_files := libarchive/archive_acl.c \
+ 						libarchive/archive_read_support_format_rar.c \
+ 						libarchive/archive_read_support_format_rar5.c \
+ 						libarchive/archive_read_support_format_raw.c \
++						libarchive/archive_read_support_format_rpm.c \
+ 						libarchive/archive_read_support_format_tar.c \
+ 						libarchive/archive_read_support_format_warc.c \
+ 						libarchive/archive_read_support_format_xar.c \
+diff --git a/libarchive/CMakeLists.txt b/libarchive/CMakeLists.txt
+index 4fb91713..19134451 100644
+--- a/libarchive/CMakeLists.txt
++++ b/libarchive/CMakeLists.txt
+@@ -92,7 +92,6 @@ SET(libarchive_SOURCES
+   archive_read_support_filter_lzop.c
+   archive_read_support_filter_none.c
+   archive_read_support_filter_program.c
+-  archive_read_support_filter_rpm.c
+   archive_read_support_filter_uu.c
+   archive_read_support_filter_xz.c
+   archive_read_support_filter_zstd.c
+@@ -109,6 +108,7 @@ SET(libarchive_SOURCES
+   archive_read_support_format_rar.c
+   archive_read_support_format_rar5.c
+   archive_read_support_format_raw.c
++  archive_read_support_format_rpm.c
+   archive_read_support_format_tar.c
+   archive_read_support_format_warc.c
+   archive_read_support_format_xar.c
+diff --git a/libarchive/archive.h b/libarchive/archive.h
+index de472a18..7d776699 100644
+--- a/libarchive/archive.h
++++ b/libarchive/archive.h
+@@ -312,7 +312,7 @@ typedef const char *archive_passphrase_callback(struct archive *,
+ #define	ARCHIVE_FILTER_LZMA	5
+ #define	ARCHIVE_FILTER_XZ	6
+ #define	ARCHIVE_FILTER_UU	7
+-#define	ARCHIVE_FILTER_RPM	8
++/*#define	ARCHIVE_FILTER_RPM	8*/
+ #define	ARCHIVE_FILTER_LZIP	9
+ #define	ARCHIVE_FILTER_LRZIP	10
+ #define	ARCHIVE_FILTER_LZOP	11
+@@ -383,6 +383,7 @@ typedef const char *archive_passphrase_callback(struct archive *,
+ #define	ARCHIVE_FORMAT_7ZIP			0xE0000
+ #define	ARCHIVE_FORMAT_WARC			0xF0000
+ #define	ARCHIVE_FORMAT_RAR_V5			0x100000
++#define	ARCHIVE_FORMAT_RPM			0x110000
+ 
+ /*
+  * Codes returned by archive_read_format_capabilities().
+@@ -476,7 +477,6 @@ __LA_DECL int archive_read_support_filter_program(struct archive *,
+ __LA_DECL int archive_read_support_filter_program_signature
+ 		(struct archive *, const char * /* cmd */,
+ 				    const void * /* match */, size_t);
+-__LA_DECL int archive_read_support_filter_rpm(struct archive *);
+ __LA_DECL int archive_read_support_filter_uu(struct archive *);
+ __LA_DECL int archive_read_support_filter_xz(struct archive *);
+ __LA_DECL int archive_read_support_filter_zstd(struct archive *);
+@@ -497,6 +497,7 @@ __LA_DECL int archive_read_support_format_mtree(struct archive *);
+ __LA_DECL int archive_read_support_format_rar(struct archive *);
+ __LA_DECL int archive_read_support_format_rar5(struct archive *);
+ __LA_DECL int archive_read_support_format_raw(struct archive *);
++__LA_DECL int archive_read_support_format_rpm(struct archive *);
+ __LA_DECL int archive_read_support_format_tar(struct archive *);
+ __LA_DECL int archive_read_support_format_warc(struct archive *);
+ __LA_DECL int archive_read_support_format_xar(struct archive *);
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
+index 9475b704..23e6a79c 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -80,10 +80,6 @@ archive_read_append_filter(struct archive *_a, int code)
+       strcpy(str, "uu");
+       r1 = archive_read_support_filter_uu(_a);
+       break;
+-    case ARCHIVE_FILTER_RPM:
+-      strcpy(str, "rpm");
+-      r1 = archive_read_support_filter_rpm(_a);
+-      break;
+     case ARCHIVE_FILTER_LZ4:
+       strcpy(str, "lz4");
+       r1 = archive_read_support_filter_lz4(_a);
+diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_private.h
+index 0c374f48..7efcf51a 100644
+--- a/libarchive/archive_read_private.h
++++ b/libarchive/archive_read_private.h
+@@ -205,7 +205,7 @@ struct archive_read {
+ 		int	(*cleanup)(struct archive_read *);
+ 		int	(*format_capabilties)(struct archive_read *);
+ 		int	(*has_encrypted_entries)(struct archive_read *);
+-	}	formats[16];
++	}	formats[18];
+ 	struct archive_format_descriptor	*format; /* Active format. */
+ 
+ 	/*
+diff --git a/libarchive/archive_read_set_format.c b/libarchive/archive_read_set_format.c
+index 552ab12d..6a176e3b 100644
+--- a/libarchive/archive_read_set_format.c
++++ b/libarchive/archive_read_set_format.c
+@@ -81,6 +81,9 @@ archive_read_set_format(struct archive *_a, int code)
+     case ARCHIVE_FORMAT_RAW:
+       str = "raw";
+       break;
++    case ARCHIVE_FORMAT_RPM:
++      str = "rpm";
++      break;
+     case ARCHIVE_FORMAT_TAR:
+       str = "tar";
+       break;
+diff --git a/libarchive/archive_read_support_filter_all.c b/libarchive/archive_read_support_filter_all.c
+index cb46d120..0f91e326 100644
+--- a/libarchive/archive_read_support_filter_all.c
++++ b/libarchive/archive_read_support_filter_all.c
+@@ -60,8 +60,6 @@ archive_read_support_filter_all(struct archive *a)
+ 	archive_read_support_filter_xz(a);
+ 	/* The decode code doesn't use an outside library. */
+ 	archive_read_support_filter_uu(a);
+-	/* The decode code doesn't use an outside library. */
+-	archive_read_support_filter_rpm(a);
+ 	/* The decode code always uses "lrzip -q -d" command-line. */
+ 	archive_read_support_filter_lrzip(a);
+ 	/* Lzop decompress falls back to "lzop -d" command-line. */
+diff --git a/libarchive/archive_read_support_filter_by_code.c b/libarchive/archive_read_support_filter_by_code.c
+index 4c8b6cb5..1c9a405b 100644
+--- a/libarchive/archive_read_support_filter_by_code.c
++++ b/libarchive/archive_read_support_filter_by_code.c
+@@ -49,8 +49,6 @@ archive_read_support_filter_by_code(struct archive *a, int filter_code)
+ 		return archive_read_support_filter_xz(a);
+ 	case ARCHIVE_FILTER_UU:
+ 		return archive_read_support_filter_uu(a);
+-	case ARCHIVE_FILTER_RPM:
+-		return archive_read_support_filter_rpm(a);
+ 	case ARCHIVE_FILTER_LZIP:
+ 		return archive_read_support_filter_lzip(a);
+ 	case ARCHIVE_FILTER_LRZIP:
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+deleted file mode 100644
+index 25ace4a2..00000000
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ /dev/null
+@@ -1,294 +0,0 @@
+-/*-
+- * Copyright (c) 2009 Michihiro NAKAJIMA
+- * All rights reserved.
+- *
+- * Redistribution and use in source and binary forms, with or without
+- * modification, are permitted provided that the following conditions
+- * are met:
+- * 1. Redistributions of source code must retain the above copyright
+- *    notice, this list of conditions and the following disclaimer.
+- * 2. Redistributions in binary form must reproduce the above copyright
+- *    notice, this list of conditions and the following disclaimer in the
+- *    documentation and/or other materials provided with the distribution.
+- *
+- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
+- * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+- * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
+- * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
+- * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+- * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
+- * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+- */
+-
+-#include "archive_platform.h"
+-
+-#ifdef HAVE_ERRNO_H
+-#include <errno.h>
+-#endif
+-#ifdef HAVE_STDLIB_H
+-#include <stdlib.h>
+-#endif
+-
+-#include "archive.h"
+-#include "archive_endian.h"
+-#include "archive_private.h"
+-#include "archive_read_private.h"
+-
+-struct rpm {
+-	int64_t		 total_in;
+-	uint64_t	 hpos;
+-	uint64_t	 hlen;
+-	unsigned char	 header[16];
+-	enum {
+-		ST_LEAD,	/* Skipping 'Lead' section. */
+-		ST_HEADER,	/* Reading 'Header' section;
+-				 * first 16 bytes. */
+-		ST_HEADER_DATA,	/* Skipping 'Header' section. */
+-		ST_PADDING,	/* Skipping padding data after the
+-				 * 'Header' section. */
+-		ST_ARCHIVE	/* Reading 'Archive' section. */
+-	}		 state;
+-	int		 first_header;
+-};
+-#define RPM_LEAD_SIZE		96	/* Size of 'Lead' section. */
+-#define RPM_MIN_HEAD_SIZE	16	/* Minimum size of 'Head'. */
+-
+-static int	rpm_bidder_bid(struct archive_read_filter_bidder *,
+-		    struct archive_read_filter *);
+-static int	rpm_bidder_init(struct archive_read_filter *);
+-
+-static ssize_t	rpm_filter_read(struct archive_read_filter *,
+-		    const void **);
+-static int	rpm_filter_close(struct archive_read_filter *);
+-
+-static inline size_t rpm_limit_bytes(uint64_t, size_t);
+-
+-#if ARCHIVE_VERSION_NUMBER < 4000000
+-/* Deprecated; remove in libarchive 4.0 */
+-int
+-archive_read_support_compression_rpm(struct archive *a)
+-{
+-	return archive_read_support_filter_rpm(a);
+-}
+-#endif
+-
+-static const struct archive_read_filter_bidder_vtable
+-rpm_bidder_vtable = {
+-	.bid = rpm_bidder_bid,
+-	.init = rpm_bidder_init,
+-};
+-
+-int
+-archive_read_support_filter_rpm(struct archive *_a)
+-{
+-	struct archive_read *a = (struct archive_read *)_a;
+-
+-	return __archive_read_register_bidder(a, NULL, "rpm",
+-			&rpm_bidder_vtable);
+-}
+-
+-static int
+-rpm_bidder_bid(struct archive_read_filter_bidder *self,
+-    struct archive_read_filter *filter)
+-{
+-	const unsigned char *b;
+-	ssize_t avail;
+-	int bits_checked;
+-
+-	(void)self; /* UNUSED */
+-
+-	b = __archive_read_filter_ahead(filter, 8, &avail);
+-	if (b == NULL)
+-		return (0);
+-
+-	bits_checked = 0;
+-	/*
+-	 * Verify Header Magic Bytes : 0XED 0XAB 0XEE 0XDB
+-	 */
+-	if (memcmp(b, "\xED\xAB\xEE\xDB", 4) != 0)
+-		return (0);
+-	bits_checked += 32;
+-	/*
+-	 * Check major version.
+-	 */
+-	if (b[4] != 3 && b[4] != 4)
+-		return (0);
+-	bits_checked += 8;
+-	/*
+-	 * Check package type; binary or source.
+-	 */
+-	if (b[6] != 0)
+-		return (0);
+-	bits_checked += 8;
+-	if (b[7] != 0 && b[7] != 1)
+-		return (0);
+-	bits_checked += 8;
+-
+-	return (bits_checked);
+-}
+-
+-static const struct archive_read_filter_vtable
+-rpm_reader_vtable = {
+-	.read = rpm_filter_read,
+-	.close = rpm_filter_close,
+-};
+-
+-static int
+-rpm_bidder_init(struct archive_read_filter *self)
+-{
+-	struct rpm   *rpm;
+-
+-	self->code = ARCHIVE_FILTER_RPM;
+-	self->name = "rpm";
+-
+-	rpm = calloc(1, sizeof(*rpm));
+-	if (rpm == NULL) {
+-		archive_set_error(&self->archive->archive, ENOMEM,
+-		    "Can't allocate data for rpm");
+-		return (ARCHIVE_FATAL);
+-	}
+-
+-	self->data = rpm;
+-	rpm->state = ST_LEAD;
+-	self->vtable = &rpm_reader_vtable;
+-
+-	return (ARCHIVE_OK);
+-}
+-
+-static inline size_t
+-rpm_limit_bytes(uint64_t bytes, size_t max)
+-{
+-	return (bytes > max ? max : (size_t)bytes);
+-}
+-
+-static ssize_t
+-rpm_filter_read(struct archive_read_filter *self, const void **buff)
+-{
+-	struct rpm *rpm;
+-	const unsigned char *b;
+-	ssize_t avail_in, total, used;
+-	size_t n;
+-	uint64_t section;
+-	uint64_t bytes;
+-
+-	rpm = (struct rpm *)self->data;
+-	*buff = NULL;
+-	total = avail_in = 0;
+-	b = NULL;
+-	used = 0;
+-	do {
+-		if (b == NULL) {
+-			b = __archive_read_filter_ahead(self->upstream, 1,
+-			    &avail_in);
+-			if (b == NULL) {
+-				if (avail_in < 0)
+-					return (ARCHIVE_FATAL);
+-				else
+-					break;
+-			}
+-		}
+-
+-		switch (rpm->state) {
+-		case ST_LEAD:
+-			if (rpm->total_in + avail_in < RPM_LEAD_SIZE)
+-				used += avail_in;
+-			else {
+-				n = (size_t)(RPM_LEAD_SIZE - rpm->total_in);
+-				used += n;
+-				b += n;
+-				rpm->state = ST_HEADER;
+-				rpm->hpos = 0;
+-				rpm->hlen = 0;
+-				rpm->first_header = 1;
+-			}
+-			break;
+-		case ST_HEADER:
+-			n = rpm_limit_bytes(RPM_MIN_HEAD_SIZE - rpm->hpos,
+-			    avail_in - used);
+-			memcpy(rpm->header+rpm->hpos, b, n);
+-			b += n;
+-			used += n;
+-			rpm->hpos += n;
+-
+-			if (rpm->hpos == RPM_MIN_HEAD_SIZE) {
+-				if (rpm->header[0] != 0x8e ||
+-				    rpm->header[1] != 0xad ||
+-				    rpm->header[2] != 0xe8 ||
+-				    rpm->header[3] != 0x01) {
+-					if (rpm->first_header) {
+-						archive_set_error(
+-						    &self->archive->archive,
+-						    ARCHIVE_ERRNO_FILE_FORMAT,
+-						    "Unrecognized rpm header");
+-						return (ARCHIVE_FATAL);
+-					}
+-					rpm->state = ST_ARCHIVE;
+-					*buff = rpm->header;
+-					total = RPM_MIN_HEAD_SIZE;
+-					break;
+-				}
+-				/* Calculate 'Header' length. */
+-				section = archive_be32dec(rpm->header+8);
+-				bytes = archive_be32dec(rpm->header+12);
+-				rpm->hlen = rpm->hpos + section * 16 + bytes;
+-				rpm->state = ST_HEADER_DATA;
+-				rpm->first_header = 0;
+-			}
+-			break;
+-		case ST_HEADER_DATA:
+-			n = rpm_limit_bytes(rpm->hlen - rpm->hpos,
+-			    avail_in - used);
+-			b += n;
+-			used += n;
+-			rpm->hpos += n;
+-			if (rpm->hpos == rpm->hlen)
+-				rpm->state = ST_PADDING;
+-			break;
+-		case ST_PADDING:
+-			while (used < avail_in) {
+-				if (*b != 0) {
+-					/* Read next header. */
+-					rpm->state = ST_HEADER;
+-					rpm->hpos = 0;
+-					rpm->hlen = 0;
+-					break;
+-				}
+-				b++;
+-				used++;
+-			}
+-			break;
+-		case ST_ARCHIVE:
+-			*buff = b;
+-			total = avail_in;
+-			used = avail_in;
+-			break;
+-		}
+-		if (used == avail_in) {
+-			rpm->total_in += used;
+-			__archive_read_filter_consume(self->upstream, used);
+-			b = NULL;
+-			used = 0;
+-		}
+-	} while (total == 0 && avail_in > 0);
+-
+-	if (used > 0 && b != NULL) {
+-		rpm->total_in += used;
+-		__archive_read_filter_consume(self->upstream, used);
+-	}
+-	return (total);
+-}
+-
+-static int
+-rpm_filter_close(struct archive_read_filter *self)
+-{
+-	struct rpm *rpm;
+-
+-	rpm = (struct rpm *)self->data;
+-	free(rpm);
+-
+-	return (ARCHIVE_OK);
+-}
+-
+diff --git a/libarchive/archive_read_support_format_all.c b/libarchive/archive_read_support_format_all.c
+index 3b53c9ad..067f2745 100644
+--- a/libarchive/archive_read_support_format_all.c
++++ b/libarchive/archive_read_support_format_all.c
+@@ -58,6 +58,7 @@ archive_read_support_format_all(struct archive *a)
+ 	archive_read_support_format_empty(a);
+ 	archive_read_support_format_lha(a);
+ 	archive_read_support_format_mtree(a);
++	archive_read_support_format_rpm(a);
+ 	archive_read_support_format_tar(a);
+ 	archive_read_support_format_xar(a);
+ 	archive_read_support_format_warc(a);
+diff --git a/libarchive/archive_read_support_format_rpm.c b/libarchive/archive_read_support_format_rpm.c
+new file mode 100644
+index 00000000..fe0e5009
+--- /dev/null
++++ b/libarchive/archive_read_support_format_rpm.c
+@@ -0,0 +1,1126 @@
++/*-
++ * Copyright (c) 2026 Davide Beatrici
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include "archive_platform.h"
++
++#ifdef HAVE_ERRNO_H
++#include <errno.h>
++#endif
++
++#ifdef HAVE_STDLIB_H
++#include <stdlib.h>
++#endif
++#ifdef HAVE_STRING_H
++#include <string.h>
++#endif
++
++#include "archive.h"
++#include "archive_endian.h"
++#include "archive_entry.h"
++#include "archive_entry_locale.h"
++#include "archive_private.h"
++#include "archive_read_private.h"
++
++#define MAX_NFILES		100000
++#define STR_SIZE_LIMIT	(1024 * 1024)	/* 1 MiB */
++
++#define LEAD_MAGIC		"\xed\xab\xee\xdb"
++#define HEADER_MAGIC	"\x8e\xad\xe8\x01\x00\x00\x00\x00"
++
++#define CPIO_END_MARK		"TRAILER!!!"
++#define CPIO_END_MARK_SIZE	10
++
++#define CPIO_HEADER_STR_SIZE		16
++#define CPIO_HEADER_SVR_SIZE		110
++#define CPIO_HEADER_SVR_PATH_OFF	94
++
++#define CPIO_MAGIC_SIZE			6
++#define CPIO_MAGIC_STR			"07070X"
++#define CPIO_MAGIC_SVR4_CRC		"070702"
++#define CPIO_MAGIC_SVR4_NOCRC	"070701"
++
++#define TAG_FILESIZES		1028
++#define TAG_FILEMODES		1030
++#define TAG_FILERDEVS		1033
++#define TAG_FILEMTIMES		1034
++#define TAG_FILEUSERNAMES	1039
++#define TAG_FILEGROUPNAMES	1040
++#define TAG_FILEDEVICES		1095
++#define TAG_FILEINODES		1096
++
++#define TAG_DIRINDEXES	1116
++#define TAG_BASENAMES	1117
++#define TAG_DIRNAMES	1118
++
++#define TAG_PAYLOADCOMPRESSOR	1125
++
++#define TAG_LONGFILESIZES	5008
++
++enum rpm_cpio_format {
++	CPIO_UNKNOWN,
++	CPIO_STR,
++	CPIO_SVR4_CRC,
++	CPIO_SVR4_NOCRC
++};
++
++struct rpm_file_info {
++	char		*pathname;
++	char		*uname;
++	char		*gname;
++	uint64_t	size;
++	uint16_t	mode;
++	int32_t		dev;
++	int16_t		rdev;
++	uint32_t	mtime;
++	uint32_t	ino;
++};
++
++struct rpm_inode_info {
++	uint32_t				n_files;
++	struct rpm_file_info	**files;
++	uint32_t				n_processed;
++};
++
++struct rpm_inode_temp_entry {
++	uint64_t ino;
++	struct rpm_file_info **files;
++	uint32_t n_files;
++	size_t capacity;
++	struct rpm_inode_temp_entry *next;
++};
++
++struct rpm_lead {
++    unsigned char	magic[4];
++    unsigned char	major, minor;
++    short			type;
++    short			archnum;
++    char			name[66];
++    short			osnum;
++    short			signature_type;
++    char			reserved[16];
++};
++
++struct rpm_header {
++	unsigned char	magic[8];
++	uint32_t		n_entries;
++	uint32_t		data_size;
++};
++
++struct rpm_entry {
++	uint32_t	tag;
++	uint32_t	type;
++	int32_t		offset;
++	uint32_t	count;
++};
++
++struct rpm {
++	enum {
++		ST_LEAD,
++		ST_HEADER,
++		ST_PADDING,
++		ST_ARCHIVE
++	}	state;
++	uint8_t	first_header;
++
++	char	*compressor;
++
++	uint32_t				n_files;
++	uint32_t				n_inodes;
++	struct rpm_file_info	*files;
++	struct rpm_inode_info	*inodes;
++
++	struct inode_hash_entry {
++		uint64_t ino;
++		struct rpm_inode_info *info;
++		struct inode_hash_entry *next;
++	}	**inode_hash;
++
++	size_t	inode_hash_size;
++
++	ssize_t	 entry_bytes_remaining;
++	ssize_t	 entry_bytes_unconsumed;
++	ssize_t	 entry_offset;
++	ssize_t	 entry_padding;
++};
++
++static int archive_read_format_rpm_bid(struct archive_read *, int);
++static int archive_read_format_rpm_read_header(struct archive_read *,
++	struct archive_entry *);
++static int archive_read_format_rpm_read_data(struct archive_read *,
++	const void **, size_t *, int64_t *);
++static int archive_read_format_rpm_read_data_skip(struct archive_read *);
++static int archive_read_format_rpm_cleanup(struct archive_read *);
++
++static int rpm_add_entry(struct archive_read *, struct archive_entry *);
++static int	rpm_parse_main_header(struct archive_read *,
++	const struct rpm_header *header);
++
++static struct rpm_inode_info *rpm_get_inode(struct archive_read *, uint32_t);
++static enum rpm_cpio_format rpm_get_cpio_format(struct archive_read *);
++static uint8_t rpm_is_eof(struct archive_read *);
++
++static uint16_t	rpm_be16_at(const void *buf_start,
++	const void *buf_end, const size_t off);
++static uint32_t	rpm_be32_at(const void *buf_start,
++	const void *buf_end, const size_t off);
++static uint64_t	rpm_be64_at(const void *buf_start,
++	const void *buf_end, const size_t off);
++
++static inline size_t	rpm_limit_bytes(size_t, size_t);
++static char	*rpm_strndup(struct archive_read *, const char *, size_t);
++static char	*rpm_strread(struct archive_read *, size_t);
++static void	rpm_strcat(struct archive_string *, const void *, const void *);
++static const char	*rpm_strlist_at(const char *, const void *,
++	uint64_t, uint64_t);
++
++static void	rpm_free_inode_temp_hash(struct rpm_inode_temp_entry **, size_t);
++
++int
++archive_read_support_format_rpm(struct archive *_a)
++{
++	struct archive_read *a = (struct archive_read *)_a;
++	struct rpm *rpm;
++	int r;
++
++	archive_check_magic(_a, ARCHIVE_READ_MAGIC,
++	    ARCHIVE_STATE_NEW, "archive_read_support_format_rpm");
++
++	rpm = calloc(1, sizeof(*rpm));
++	if (!rpm) {
++		archive_set_error(&a->archive,
++			ENOMEM,
++			"Can't allocate rpm data");
++		return ARCHIVE_FATAL;
++	}
++
++	r = __archive_read_register_format(a,
++	    rpm,
++	    "rpm",
++	    archive_read_format_rpm_bid,
++	    NULL,
++	    archive_read_format_rpm_read_header,
++	    archive_read_format_rpm_read_data,
++	    archive_read_format_rpm_read_data_skip,
++	    NULL,
++	    archive_read_format_rpm_cleanup,
++	    NULL,
++	    NULL);
++
++	if (r != ARCHIVE_OK)
++		free(rpm);
++
++	return ARCHIVE_OK;
++}
++
++static int
++archive_read_format_rpm_bid(struct archive_read *a, int best_bid)
++{
++	const unsigned char *p;
++
++	(void)best_bid;
++
++	if ((p = __archive_read_ahead(a, sizeof(LEAD_MAGIC) - 1, NULL)) == NULL)
++		return -1;
++
++	if (memcmp(p, LEAD_MAGIC, sizeof(LEAD_MAGIC) - 1) == 0)
++		return 48;
++	else
++		return ARCHIVE_WARN;
++}
++
++static int
++archive_read_format_rpm_read_header(struct archive_read *a,
++    struct archive_entry *entry)
++{
++	struct rpm *rpm = a->format->data;
++	const unsigned char *p;
++	int r;
++
++	a->archive.archive_format = ARCHIVE_FORMAT_RPM;
++
++	for (;;) {
++		switch (rpm->state) {
++		case ST_LEAD: {
++			const struct rpm_lead *lead = __archive_read_ahead(a, sizeof(*lead), NULL);
++			if (lead == NULL) {
++				archive_set_error(&a->archive,
++					ARCHIVE_ERRNO_FILE_FORMAT,
++					"Truncated lead");
++				return ARCHIVE_FATAL;
++			}
++
++			if (memcmp(lead->magic, LEAD_MAGIC, sizeof(lead->magic)) != 0) {
++				archive_set_error(&a->archive,
++					ARCHIVE_ERRNO_FILE_FORMAT,
++					"Unrecognized lead");
++				return ARCHIVE_FATAL;
++			}
++
++			__archive_read_consume(a, sizeof(*lead));
++
++			rpm->state = ST_HEADER;
++			rpm->first_header = 1;
++			break;
++		}
++		case ST_HEADER: {
++			struct rpm_header header;
++
++			p = __archive_read_ahead(a, sizeof(header), NULL);
++			if (p == NULL) {
++				archive_set_error(&a->archive,
++					ARCHIVE_ERRNO_FILE_FORMAT,
++					"Truncated header");
++				return ARCHIVE_FATAL;
++			}
++
++			memcpy(&header, p, sizeof(header));
++
++			if (memcmp(header.magic, HEADER_MAGIC, sizeof(header.magic)) != 0) {
++				archive_set_error(&a->archive,
++					ARCHIVE_ERRNO_FILE_FORMAT,
++					"Unrecognized header");
++				return ARCHIVE_FATAL;
++			}
++
++			header.n_entries = archive_be32dec(&header.n_entries);
++			header.data_size = archive_be32dec(&header.data_size);
++
++			__archive_read_consume(a, sizeof(header));
++
++			r = rpm_parse_main_header(a, &header);
++			if (r != ARCHIVE_OK)
++				return r;
++
++			rpm->state = ST_PADDING;
++			break;
++		}
++		case ST_PADDING: {
++			for (;;) {
++				p = __archive_read_ahead(a, 1, NULL);
++				if (p == NULL) {
++					archive_set_error(&a->archive,
++						ARCHIVE_ERRNO_FILE_FORMAT,
++						"Truncated padding");
++					return ARCHIVE_FATAL;
++				}
++
++				if (*p != 0)
++					break;
++
++				__archive_read_consume(a, 1);
++			}
++
++			if (rpm->first_header) {
++				rpm->first_header = 0;
++				rpm->state = ST_HEADER;
++			} else {
++				enum rpm_cpio_format cpio_format;
++
++				if (!rpm->compressor) {
++					/* No compression. */
++				} else if (strcmp(rpm->compressor, "zstd") == 0) {
++					r = archive_read_append_filter(&a->archive, ARCHIVE_FILTER_ZSTD);
++				} else if (strcmp(rpm->compressor, "xz") == 0) {
++					archive_read_append_filter(&a->archive, ARCHIVE_FILTER_XZ);
++				} else if (strcmp(rpm->compressor, "gzip") == 0) {
++					archive_read_append_filter(&a->archive, ARCHIVE_FILTER_GZIP);
++				} else if (strcmp(rpm->compressor, "bzip2") == 0) {
++					archive_read_append_filter(&a->archive, ARCHIVE_FILTER_BZIP2);
++				} else if (strcmp(rpm->compressor, "lzma") == 0) {
++					archive_read_append_filter(&a->archive, ARCHIVE_FILTER_LZMA);
++				} else {
++					archive_set_error(&a->archive,
++						ARCHIVE_ERRNO_FILE_FORMAT,
++						"Unrecognized compressor: %s", rpm->compressor);
++					return ARCHIVE_FATAL;
++				}
++
++				if (r != ARCHIVE_OK) {
++					archive_set_error(&a->archive, r, "Cannot append %s filter",
++						rpm->compressor);
++					return r;
++				}
++
++				cpio_format = rpm_get_cpio_format(a);
++				switch (cpio_format) {
++				case CPIO_STR:
++					a->archive.archive_format_name = "RPM (stripped CPIO)";
++					break;
++				case CPIO_SVR4_CRC:
++					a->archive.archive_format_name = "RPM (SVR4 cpio with CRC)";
++					break;
++				case CPIO_SVR4_NOCRC:
++					a->archive.archive_format_name = "RPM (SVR4 cpio with no CRC)";
++					break;
++				case CPIO_UNKNOWN:
++				default:
++					return ARCHIVE_FATAL;
++				}
++
++				rpm->state = ST_ARCHIVE;
++			}
++			break;
++		}
++		case ST_ARCHIVE:
++			return rpm_add_entry(a, entry);
++		}
++	}
++}
++
++static int
++archive_read_format_rpm_read_data(struct archive_read *a,
++    const void **buff, size_t *size, int64_t *offset)
++{
++	struct rpm *rpm = a->format->data;
++	ssize_t bytes_read;
++
++	if (rpm->entry_bytes_unconsumed > 0) {
++		__archive_read_consume(a, rpm->entry_bytes_unconsumed);
++		rpm->entry_bytes_unconsumed = 0;
++	}
++
++	if (rpm->entry_bytes_remaining > 0) {
++		*buff = __archive_read_ahead(a, 1, &bytes_read);
++		if (bytes_read <= 0)
++			return ARCHIVE_FATAL;
++
++		if (bytes_read > rpm->entry_bytes_remaining)
++			bytes_read = (ssize_t)rpm->entry_bytes_remaining;
++
++		*size = bytes_read;
++		rpm->entry_bytes_unconsumed = bytes_read;
++		*offset = rpm->entry_offset;
++		rpm->entry_offset += bytes_read;
++		rpm->entry_bytes_remaining -= bytes_read;
++
++		return ARCHIVE_OK;
++	} else {
++		if (rpm->entry_padding !=
++			__archive_read_consume(a, rpm->entry_padding)) {
++			return ARCHIVE_FATAL;
++		}
++
++		rpm->entry_padding = 0;
++		*buff = NULL;
++		*size = 0;
++		*offset = rpm->entry_offset;
++
++		return ARCHIVE_EOF;
++	}
++}
++
++static int
++archive_read_format_rpm_read_data_skip(struct archive_read *a)
++{
++	struct rpm *rpm = a->format->data;
++	const ssize_t to_skip = rpm->entry_bytes_remaining + rpm->entry_padding
++		+ rpm->entry_bytes_unconsumed;
++
++	if (to_skip != __archive_read_consume(a, to_skip))
++		return ARCHIVE_FATAL;
++
++	rpm->entry_bytes_remaining = 0;
++	rpm->entry_padding = 0;
++	rpm->entry_bytes_unconsumed = 0;
++
++	return ARCHIVE_OK;
++}
++
++static int
++archive_read_format_rpm_cleanup(struct archive_read *a)
++{
++	struct rpm *rpm = a->format->data;
++	size_t i;
++
++	free(rpm->compressor);
++
++	if (rpm->inode_hash) {
++		for (i = 0; i < rpm->inode_hash_size; ++i) {
++			free(rpm->inode_hash[i]);
++		}
++
++		free(rpm->inode_hash);
++	}
++
++	if (rpm->inodes != NULL) {
++		for (i = 0; i < rpm->n_inodes; i++) {
++			free(rpm->inodes[i].files);
++		}
++
++		free(rpm->inodes);
++	}
++
++	if (rpm->files != NULL) {
++		for (i = 0; i < rpm->n_files; i++) {
++			free(rpm->files[i].pathname);
++			free(rpm->files[i].uname);
++			free(rpm->files[i].gname);
++		}
++
++		free(rpm->files);
++	}
++
++	free(rpm);
++
++	a->format->data = NULL;
++
++	return ARCHIVE_OK;
++}
++
++static int
++rpm_add_entry(struct archive_read *a, struct archive_entry *entry)
++{
++	struct rpm *rpm = a->format->data;
++	struct rpm_file_info *file = NULL;
++	struct rpm_inode_info *inode;
++	uint64_t idx_ino;
++	const void *p;
++
++	const enum rpm_cpio_format cpio_format = rpm_get_cpio_format(a);
++
++	p = __archive_read_ahead(a, CPIO_HEADER_STR_SIZE, NULL);
++	if (!p) {
++		archive_set_error(&a->archive,
++			ARCHIVE_ERRNO_FILE_FORMAT,
++			"Premature EOF");
++		return ARCHIVE_FATAL;
++	}
++
++	char hex_str[9] = {0};
++	memcpy(hex_str, p + CPIO_MAGIC_SIZE, sizeof(idx_ino));
++	idx_ino = strtoull(hex_str, NULL, 16);
++
++	switch (cpio_format) {
++	case CPIO_STR:
++		__archive_read_consume(a, CPIO_HEADER_STR_SIZE);
++
++		if (rpm_is_eof(a))
++			return ARCHIVE_EOF;
++
++		if (idx_ino >= rpm->n_files) {
++			archive_set_error(&a->archive,
++				ARCHIVE_ERRNO_FILE_FORMAT,
++				"File index %" PRIu64 " out of range (max %u)", idx_ino, rpm->n_files - 1);
++			return ARCHIVE_FATAL;
++		}
++
++		file = &rpm->files[idx_ino];
++		inode = rpm_get_inode(a, file->ino);
++		if (!inode)
++			return ARCHIVE_FATAL;
++
++		break;
++	case CPIO_SVR4_CRC:
++	case CPIO_SVR4_NOCRC: {
++		size_t i;
++		uint64_t size;
++		char *path;
++
++		p = __archive_read_ahead(a, CPIO_HEADER_SVR_SIZE, NULL);
++		if (!p) {
++			archive_set_error(&a->archive,
++				ARCHIVE_ERRNO_FILE_FORMAT,
++				"Truncated SVR4 header");
++			return ARCHIVE_FATAL;
++		}
++
++		memcpy(hex_str, p + CPIO_HEADER_SVR_PATH_OFF, sizeof(size));
++
++		__archive_read_consume(a, CPIO_HEADER_SVR_SIZE);
++
++		if (rpm_is_eof(a))
++			return ARCHIVE_EOF;
++
++		inode = rpm_get_inode(a, idx_ino);
++		if (!inode)
++			return ARCHIVE_FATAL;
++
++		size = strtoull(hex_str, NULL, 16);
++
++		path = rpm_strread(a, size);
++		if (!path)
++			return ARCHIVE_FATAL;
++
++		for (i = 0; i < inode->n_files; ++i) {
++			if (strcmp(inode->files[i]->pathname, path) == 0) {
++				file = inode->files[i];
++				break;
++			}
++		}
++
++		free(path);
++
++		if (!file) {
++			archive_set_error(&a->archive,
++				ARCHIVE_ERRNO_FILE_FORMAT,
++				"Path not found");
++			return ARCHIVE_FATAL;
++		}
++
++		/* Pad name to 2 more than a multiple of 4. */
++		size += (2 - size) & 3;
++		__archive_read_consume(a, size);
++
++		break;
++	}
++	default:
++		return ARCHIVE_FATAL;
++	}
++
++	archive_entry_set_pathname_utf8(entry, file->pathname);
++	archive_entry_set_uname_utf8(entry, file->uname);
++	archive_entry_set_gname_utf8(entry, file->gname);
++	archive_entry_set_dev(entry, file->dev);
++	archive_entry_set_ino(entry, file->ino);
++	archive_entry_set_mode(entry, file->mode);
++	archive_entry_set_rdev(entry, file->rdev);
++	archive_entry_set_mtime(entry, file->mtime, 0);
++	archive_entry_set_nlink(entry, inode->n_files);
++
++	/* Hardlink: only last entry carries payload */
++	if (++inode->n_processed == inode->n_files)
++		rpm->entry_bytes_remaining = file->size;
++	else
++		rpm->entry_bytes_remaining = 0;
++
++	/* Pad file contents to a multiple of 4. */
++	rpm->entry_padding = 3 & -rpm->entry_bytes_remaining;
++	rpm->entry_offset = 0;
++	rpm->entry_bytes_unconsumed = 0;
++
++	if (S_ISLNK(file->mode)) {
++		char *target = rpm_strread(a, file->size);
++		if (!target)
++			return ARCHIVE_FATAL;
++
++		__archive_read_consume(a, rpm->entry_bytes_remaining);
++		rpm->entry_bytes_remaining = 0;
++
++		archive_entry_set_symlink_utf8(entry, target);
++
++		free(target);
++	}
++
++	archive_entry_set_size(entry, rpm->entry_bytes_remaining);
++
++	return ARCHIVE_OK;
++}
++
++static int
++rpm_parse_main_header(struct archive_read *a, const struct rpm_header *header)
++{
++	struct rpm *rpm = a->format->data;
++
++	struct rpm_header_parse {
++		uint32_t	 n_files;
++
++		const char	 *basenames;
++		uint32_t	 n_basenames;
++
++		const char	 *dirnames;
++		uint32_t	 n_dirnames;
++
++		const char	 *usernames;
++		uint32_t	 n_usernames;
++
++		const char	 *groupnames;
++		uint32_t	 n_groupnames;
++
++		union {
++			const int64_t	*filesizes64;
++			const int32_t	*filesizes32;
++		};
++		uint8_t	is_filesizes64;
++
++		const int32_t	*dirindexes;
++		const int16_t	*filemodes;
++		const int32_t	*filedevices;
++		const int16_t	*filerdevs;
++		const int32_t	*filemtimes;
++		const int32_t	*fileinodes;
++	} hp;
++
++	const struct rpm_entry *entries;
++	struct rpm_inode_temp_entry **temp_hash;
++	size_t hlen, temp_hash_size = 1;
++	uint64_t i, ino = 0;
++
++	memset(&hp, 0, sizeof(hp));
++
++	hlen = sizeof(struct rpm_entry)
++		 * (size_t)header->n_entries
++		 + (size_t)header->data_size;
++
++	entries = __archive_read_ahead(a, hlen, NULL);
++	if (entries == NULL)
++		return ARCHIVE_EOF;
++
++	if (rpm->first_header) {
++		__archive_read_consume(a, hlen);
++		return ARCHIVE_OK;
++	}
++
++	for (i = 0; i < header->n_entries; i++) {
++		uint32_t tag, cnt;
++		int32_t off;
++		const void *p;
++
++		tag = archive_be32dec(&entries[i].tag);
++		off = archive_be32dec(&entries[i].offset);
++		cnt = archive_be32dec(&entries[i].count);
++
++		if (off < 0 || (uint32_t)off >= header->data_size)
++			continue;
++
++		p = (const uint8_t *)&entries[header->n_entries] + off;
++
++		switch (tag) {
++		case TAG_PAYLOADCOMPRESSOR:
++			rpm->compressor = rpm_strndup(a, p ? p : "", 0);
++			break;
++		case TAG_BASENAMES:
++			hp.basenames = p;
++			hp.n_basenames = cnt;
++			break;
++		case TAG_DIRNAMES:
++			hp.dirnames = p;
++			hp.n_dirnames = cnt;
++			break;
++		case TAG_FILEUSERNAMES:
++			hp.usernames = p;
++			hp.n_usernames = cnt;
++			break;
++		case TAG_FILEGROUPNAMES:
++			hp.groupnames = p;
++			hp.n_groupnames = cnt;
++			break;
++		case TAG_LONGFILESIZES:
++			hp.filesizes64 = p;
++			hp.n_files = cnt;
++			hp.is_filesizes64 = 1;
++			break;
++		case TAG_FILESIZES:
++			/* This tag should never appear when Longfilesizes is present,
++			 * but checking doesn't hurt. */
++			if (!hp.is_filesizes64) {
++				hp.filesizes32 = p;
++				hp.n_files = cnt;
++			}
++			break;
++		case TAG_DIRINDEXES:
++			hp.dirindexes = p;
++			break;
++		case TAG_FILEINODES:
++			hp.fileinodes = p;
++			break;
++		case TAG_FILEMODES:
++			hp.filemodes = p;
++			break;
++		case TAG_FILEDEVICES:
++			hp.filedevices = p;
++			break;
++		case TAG_FILERDEVS:
++			hp.filerdevs = p;
++			break;
++		case TAG_FILEMTIMES:
++			hp.filemtimes = p;
++			break;
++		}
++	}
++
++	if (hp.n_files >= MAX_NFILES) {
++		archive_set_error(&a->archive,
++			ARCHIVE_ERRNO_FILE_FORMAT,
++			"n_files out of range");
++		return ARCHIVE_FATAL;
++	}
++
++	rpm->files = calloc(hp.n_files, sizeof(*rpm->files));
++	if (rpm->files == NULL) {
++		archive_set_error(&a->archive,
++			ENOMEM,
++			"Can't allocate files data");
++		return ARCHIVE_FATAL;
++	}
++
++	rpm->n_files = hp.n_files;
++
++	while (temp_hash_size < hp.n_files * 2)
++		temp_hash_size <<= 1;
++
++	temp_hash = calloc(temp_hash_size, sizeof(*temp_hash));
++	if (!temp_hash) {
++		archive_set_error(&a->archive,
++			ENOMEM,
++			"Can't allocate temp hash");
++		return ARCHIVE_FATAL;
++	}
++
++	for (i = 0; i < hp.n_files; i++) {
++		const void *hbuf_end = (const uint8_t *)entries + hlen;
++		struct rpm_file_info *file = &rpm->files[i];
++		struct rpm_inode_temp_entry *group;
++		struct archive_string as;
++		const char *dname, *bname, *uname, *gname;
++		size_t bucket;
++
++		if (hp.dirindexes != NULL) {
++			const uint32_t diri = rpm_be32_at(hp.dirindexes, hbuf_end, i);
++
++			if (diri >= hp.n_dirnames) {
++				rpm_free_inode_temp_hash(temp_hash, temp_hash_size);
++				archive_set_error(&a->archive,
++					ARCHIVE_ERRNO_FILE_FORMAT,
++					"dirindex out of range");
++				return ARCHIVE_FATAL;
++			}
++
++			dname = rpm_strlist_at(hp.dirnames, hbuf_end, diri, hp.n_dirnames);
++		} else
++			dname = NULL;
++
++		bname = rpm_strlist_at(hp.basenames, hbuf_end, i, hp.n_basenames);
++		uname = rpm_strlist_at(hp.usernames, hbuf_end, i, hp.n_usernames);
++		gname = rpm_strlist_at(hp.groupnames, hbuf_end, i, hp.n_groupnames);
++
++		archive_string_init(&as);
++		archive_strappend_char(&as, '.');
++		rpm_strcat(&as, dname, hbuf_end);
++		rpm_strcat(&as, bname, hbuf_end);
++		file->pathname = strdup(as.s);
++		archive_string_free(&as);
++
++		file->uname = rpm_strndup(a, uname ? uname : "", 0);
++		file->gname = rpm_strndup(a, gname ? gname : "", 0);
++
++		if (hp.is_filesizes64)
++			file->size = rpm_be64_at(hp.filesizes64, hbuf_end, i);
++		else
++			file->size = rpm_be32_at(hp.filesizes32, hbuf_end, i);
++		file->mode = rpm_be16_at(hp.filemodes, hbuf_end, i);
++		file->dev = rpm_be32_at(hp.filedevices, hbuf_end, i);
++		file->rdev = rpm_be16_at(hp.filerdevs, hbuf_end, i);
++		file->mtime = rpm_be32_at(hp.filemtimes, hbuf_end, i);
++		file->ino = rpm_be32_at(hp.fileinodes, hbuf_end, i);
++
++		bucket = file->ino & (temp_hash_size - 1);
++		group = temp_hash[bucket];
++
++		while (group) {
++			if (group->ino == file->ino)
++				break;
++
++			group = group->next;
++		}
++
++		if (!group) {
++			group = calloc(1, sizeof(*group));
++			if (!group) {
++				rpm_free_inode_temp_hash(temp_hash, temp_hash_size);
++				archive_set_error(&a->archive,
++					ENOMEM,
++					"Can't allocate inode group");
++				return ARCHIVE_FATAL;
++			}
++
++			group->ino = file->ino;
++			group->files = NULL;
++			group->n_files = 0;
++			group->capacity = 0;
++
++			group->next = temp_hash[bucket];
++			temp_hash[bucket] = group;
++		}
++
++		if (group->n_files >= group->capacity) {
++			group->capacity = group->capacity ? group->capacity * 2 : 8;
++			void *prev_ptr = group->files;
++
++			group->files = realloc(group->files, group->capacity * sizeof(*group->files));
++			if (!group->files) {
++				free(prev_ptr);
++				rpm_free_inode_temp_hash(temp_hash, temp_hash_size);
++				archive_set_error(&a->archive,
++					ENOMEM,
++					"Can't grow inode file list");
++				return ARCHIVE_FATAL;
++			}
++		}
++
++		group->files[group->n_files++] = file;
++	}
++
++	rpm->n_inodes = 0;
++	for (i = 0; i < temp_hash_size; i++) {
++		for (struct rpm_inode_temp_entry *e = temp_hash[i]; e; e = e->next)
++			rpm->n_inodes++;
++	}
++
++	rpm->inodes = calloc(rpm->n_inodes, sizeof(*rpm->inodes));
++	if (!rpm->inodes) {
++		rpm_free_inode_temp_hash(temp_hash, temp_hash_size);
++		archive_set_error(&a->archive,
++			ENOMEM,
++			"Can't allocate inodes array");
++		return ARCHIVE_FATAL;
++	}
++
++	for (i = 0; i < temp_hash_size; i++) {
++		struct rpm_inode_temp_entry *e = temp_hash[i];
++		while (e) {
++			struct rpm_inode_info *info = &rpm->inodes[ino++];
++			info->n_files = e->n_files;
++			info->files = e->files;
++			info->n_processed = 0;
++
++			struct rpm_inode_temp_entry *next = e->next;
++			free(e);
++			e = next;
++		}
++	}
++
++	free(temp_hash);
++
++	rpm->inode_hash_size = 1;
++	while (rpm->inode_hash_size < rpm->n_inodes * 2)
++		rpm->inode_hash_size <<= 1;
++
++	rpm->inode_hash = calloc(rpm->inode_hash_size, sizeof(*rpm->inode_hash));
++	if (!rpm->inode_hash) {
++		archive_set_error(&a->archive,
++			ENOMEM,
++			"Can't allocate inode hash");
++		return ARCHIVE_FATAL;
++	}
++
++	for (i = 0; i < rpm->n_inodes; i++) {
++		uint64_t raw = rpm->inodes[i].files[0]->ino;
++		size_t bucket = raw & (rpm->inode_hash_size - 1);
++
++		struct inode_hash_entry *e = malloc(sizeof(*e));
++		if (!e) {
++			archive_set_error(&a->archive,
++				ENOMEM,
++				"Can't allocate inode hash entry");
++			return ARCHIVE_FATAL;
++		}
++
++		e->ino = raw;
++		e->info = &rpm->inodes[i];
++		e->next = rpm->inode_hash[bucket];
++		rpm->inode_hash[bucket] = e;
++	}
++
++	__archive_read_consume(a, hlen);
++
++	return ARCHIVE_OK;
++}
++
++static struct rpm_inode_info *
++rpm_get_inode(struct archive_read *a, const uint32_t ino)
++{
++	const struct rpm *rpm = a->format->data;
++	struct inode_hash_entry *e;
++	size_t bucket;
++
++	if (!rpm->inode_hash)
++		return NULL;
++
++	bucket = ino & (rpm->inode_hash_size - 1);
++
++	for (e = rpm->inode_hash[bucket]; e; e = e->next)
++		if (e->ino == ino)
++			return e->info;
++
++	return NULL;
++}
++
++static enum rpm_cpio_format
++rpm_get_cpio_format(struct archive_read *a)
++{
++	const char *magic = __archive_read_ahead(a, CPIO_MAGIC_SIZE, NULL);
++	if (!magic) {
++		archive_set_error(&a->archive,
++			ARCHIVE_ERRNO_FILE_FORMAT,
++			"Premature EOF");
++		return ARCHIVE_FATAL;
++	}
++
++	if (memcmp(magic, CPIO_MAGIC_STR, CPIO_MAGIC_SIZE) == 0)
++		return CPIO_STR;
++	else if (memcmp(magic, CPIO_MAGIC_SVR4_CRC, CPIO_MAGIC_SIZE) == 0)
++		return CPIO_SVR4_CRC;
++	else if (memcmp(magic, CPIO_MAGIC_SVR4_NOCRC, CPIO_MAGIC_SIZE) == 0)
++		return CPIO_SVR4_NOCRC;
++	else {
++		archive_set_error(&a->archive,
++			ARCHIVE_ERRNO_FILE_FORMAT,
++			"Unrecognized magic");
++		return CPIO_UNKNOWN;
++	}
++}
++
++static uint8_t
++rpm_is_eof(struct archive_read *a)
++{
++	const void *p = __archive_read_ahead(a, CPIO_END_MARK_SIZE, NULL);
++	if (!p)
++		return 1;
++
++	return memcmp(p, CPIO_END_MARK, CPIO_END_MARK_SIZE) == 0;
++}
++
++static uint16_t
++rpm_be16_at(const void *buf_start, const void *buf_end, size_t off)
++{
++	off *= sizeof(uint16_t);
++
++	if (!buf_start || (buf_end <= buf_start) ||
++		(size_t)(buf_end - buf_start) < (off + sizeof(uint16_t)))
++		return 0;
++
++	return archive_be16dec(buf_start + off);
++}
++
++static uint32_t
++rpm_be32_at(const void *buf_start, const void *buf_end, size_t off)
++{
++	off *= sizeof(uint32_t);
++
++	if (!buf_start || (buf_end <= buf_start) ||
++		(size_t)(buf_end - buf_start) < (off + sizeof(uint32_t)))
++		return 0;
++
++	return archive_be32dec(buf_start + off);
++}
++
++static uint64_t
++rpm_be64_at(const void *buf_start, const void *buf_end, size_t off)
++{
++	off *= sizeof(uint64_t);
++
++	if (!buf_start || (buf_end <= buf_start) ||
++		(size_t)(buf_end - buf_start) < (off + sizeof(uint64_t)))
++		return 0;
++
++	return archive_be64dec(buf_start + off);
++}
++
++static inline size_t
++rpm_limit_bytes(const size_t bytes, const size_t max)
++{
++	return (bytes > max ? max : bytes);
++}
++
++static char *
++rpm_strndup(struct archive_read *a, const char *s, size_t len)
++{
++	if (s == NULL)
++		return NULL;
++
++	if (len == 0)
++		len = strnlen(s, STR_SIZE_LIMIT);
++
++	if (len > STR_SIZE_LIMIT) {
++		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++			"String too long (malformed?)");
++		return NULL;
++	}
++
++	return strndup(s, len);
++}
++
++static char *
++rpm_strread(struct archive_read *a, size_t len) {
++	const void *p;
++
++	if (len > STR_SIZE_LIMIT) {
++		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++			"String too long");
++		return NULL;
++	}
++
++	p = __archive_read_ahead(a, len, NULL);
++	if (!p) {
++		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++			"Truncated string");
++		return NULL;
++	}
++
++	return rpm_strndup(a, p, len);
++}
++
++static void
++rpm_strcat(struct archive_string *a, const void *s, const void *buf_end)
++{
++	if (!s || s >= buf_end)
++		return;
++
++	archive_strncat(a, s, rpm_limit_bytes(buf_end - s, STR_SIZE_LIMIT));
++}
++
++static const char *
++rpm_strlist_at(const char *p, const void *end, uint64_t i, uint64_t n)
++{
++	uint64_t k;
++
++	if (p == NULL || i >= n || (const char *)end < p)
++		return NULL;
++
++	for (k = 0; k < n; k++) {
++		const uint64_t max_len = rpm_limit_bytes((const char *)end - p,
++			STR_SIZE_LIMIT);
++		const uint64_t len = strnlen(p, max_len);
++		if (len == max_len)
++			/* Unterminated or absurdly long string. */
++			return NULL;
++
++		if (k == i)
++			return p;
++
++		p += len + 1;
++
++		if (p >= (const char *)end)
++			return NULL;
++	}
++
++	return NULL;
++}
++
++static void
++rpm_free_inode_temp_hash(struct rpm_inode_temp_entry **hash, const size_t hash_size)
++{
++	for (size_t i = 0; i < hash_size; i++) {
++		struct rpm_inode_temp_entry *e = hash[i];
++		while (e) {
++			struct rpm_inode_temp_entry *next = e->next;
++			free(e->files);
++			free(e);
++			e = next;
++		}
++	}
++
++	free(hash);
++}
+diff --git a/libarchive/test/test_archive_read_support.c b/libarchive/test/test_archive_read_support.c
+index b0c92802..bc256a17 100644
+--- a/libarchive/test/test_archive_read_support.c
++++ b/libarchive/test/test_archive_read_support.c
+@@ -91,6 +91,7 @@ DEFINE_TEST(test_archive_read_support)
+ 	test_filter_or_format(archive_read_support_format_iso9660);
+ 	test_filter_or_format(archive_read_support_format_lha);
+ 	test_filter_or_format(archive_read_support_format_mtree);
++	test_filter_or_format(archive_read_support_format_rpm);
+ 	test_filter_or_format(archive_read_support_format_tar);
+ 	test_filter_or_format(archive_read_support_format_xar);
+ 	test_filter_or_format(archive_read_support_format_zip);
+@@ -140,7 +141,6 @@ DEFINE_TEST(test_archive_read_support)
+ 	test_filter_or_format(archive_read_support_filter_lzip);
+ 	test_filter_or_format(archive_read_support_filter_lzma);
+ 	test_filter_or_format(archive_read_support_filter_none);
+-	test_filter_or_format(archive_read_support_filter_rpm);
+ 	test_filter_or_format(archive_read_support_filter_uu);
+ 	test_filter_or_format(archive_read_support_filter_xz);
+ }
+diff --git a/libarchive/test/test_read_format_cpio_svr4_bzip2_rpm.c b/libarchive/test/test_read_format_cpio_svr4_bzip2_rpm.c
+index cff64d72..c775e6f4 100644
+--- a/libarchive/test/test_read_format_cpio_svr4_bzip2_rpm.c
++++ b/libarchive/test/test_read_format_cpio_svr4_bzip2_rpm.c
+@@ -97,8 +97,6 @@ DEFINE_TEST(test_read_format_cpio_svr4_bzip2_rpm)
+ 		return;
+         }
+ 	assertEqualIntA(a, ARCHIVE_OK, r);
+-	assertEqualIntA(a, ARCHIVE_OK,
+-	    archive_read_support_filter_rpm(a));
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
+ 	extract_reference_file(name);
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, name, 2));
+@@ -121,7 +119,7 @@ DEFINE_TEST(test_read_format_cpio_svr4_bzip2_rpm)
+ 	/* Verify that the format detection worked. */
+ 	assertEqualInt(archive_filter_code(a, 0), ARCHIVE_FILTER_BZIP2);
+ 	assertEqualString(archive_filter_name(a, 0), "bzip2");
+-	assertEqualInt(archive_format(a), ARCHIVE_FORMAT_CPIO_SVR4_NOCRC);
++	assertEqualInt(archive_format(a), ARCHIVE_FORMAT_RPM);
+ 
+ 	assertEqualInt(ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+diff --git a/libarchive/test/test_read_format_cpio_svr4_gzip_rpm.c b/libarchive/test/test_read_format_cpio_svr4_gzip_rpm.c
+index 345760c1..913dc793 100644
+--- a/libarchive/test/test_read_format_cpio_svr4_gzip_rpm.c
++++ b/libarchive/test/test_read_format_cpio_svr4_gzip_rpm.c
+@@ -97,8 +97,6 @@ DEFINE_TEST(test_read_format_cpio_svr4_gzip_rpm)
+ 		return;
+         }
+ 	assertEqualIntA(a, ARCHIVE_OK, r);
+-	assertEqualIntA(a, ARCHIVE_OK,
+-	    archive_read_support_filter_rpm(a));
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
+ 	extract_reference_file(name);
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, name, 2));
+@@ -121,8 +119,8 @@ DEFINE_TEST(test_read_format_cpio_svr4_gzip_rpm)
+ 	/* Verify that the format detection worked. */
+ 	assertEqualInt(archive_filter_code(a, 0), ARCHIVE_FILTER_GZIP);
+ 	assertEqualString(archive_filter_name(a, 0), "gzip");
+-	assertEqualInt(archive_format(a), ARCHIVE_FORMAT_CPIO_SVR4_NOCRC);
+- 
++	assertEqualInt(archive_format(a), ARCHIVE_FORMAT_RPM);
++
+ 	assertEqualInt(ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+ }
+diff --git a/libarchive/test/test_read_format_huge_rpm.c b/libarchive/test/test_read_format_huge_rpm.c
+index 729c1e18..b56dfbed 100644
+--- a/libarchive/test/test_read_format_huge_rpm.c
++++ b/libarchive/test/test_read_format_huge_rpm.c
+@@ -40,9 +40,7 @@ DEFINE_TEST(test_read_format_huge_rpm)
+ 	assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
+ 
+ 	/* Verify that the format detection worked. */
+-	assertEqualInt(ARCHIVE_FILTER_RPM, archive_filter_code(a, 0));
+-	assertEqualString("rpm", archive_filter_name(a, 0));
+-	assertEqualInt(ARCHIVE_FORMAT_EMPTY, archive_format(a));
++	assertEqualInt(ARCHIVE_FORMAT_RPM, archive_format(a));
+ 
+ 	assertEqualInt(ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+-- 
+2.49.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.6.bb b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
index d579cdb65a..4e1f6b08b5 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
@@ -31,6 +31,9 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
+           file://0001-archive_read_append_filter-Keep-iterating-even-if-na.patch \
+           file://0002-__archive_read_register_bidder-Allow-ARCHIVE_STATE_H.patch \
+           file://0003-Convert-RPM-reader-into-a-proper-format-supporting-b.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-- 
2.49.0


