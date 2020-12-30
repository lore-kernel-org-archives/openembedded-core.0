Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.47])
 by mx.groups.io with SMTP id smtpd.web08.1825.1609296009818225721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Dec 2020 18:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CT77l2el;
 spf=pass (domain: windriver.com, ip: 40.107.76.47, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBpBW+4bRAoaRa3ps4qNjiZc6B2xaDlEyNQsQ2fzRqIbUXbTr7DvPzJ1cqdS1+23AJoZ4eK4iYHJw1Dq7wp+TbOXD2H4nqC3kubGza3HjWzRTlk2VwDjXgmLq2tD34PJM0bTzR3CKfs02+aVz4Osr2S8nf/hqFqUSMx9YhhudqviyredLex5/OJpivm3x0zFk/ACJybJX6spF/qN6syxEqjTIvE/R6krKpbrNpCpqaFUVQT05qZm6+Smd0q/TjVEs55wVq7f3SR0Q6i+KmcRwq9bD3Q5p0Rw/NNjEEtMORNuxM6Jods4Xc3fK6oHXN35/uWLWfHFyj45RpCWpB1pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dp4yfXvxbFRtL0huz6pySRwiAq4ZTIRP10RoVn3IdeA=;
 b=Cd8DQXD7NCJXpB+nMYi/ijIlH6IayPM434cjx1fvZlEKvVMcqOQn9xw5wZVxyyrcTgTwDU8rY1KwMcvXoeN6bOTSeQ13qqUX55ABFE564Bci38609m1m4HhDgwL31A7h5SalyCCiRUyUNWryEDZGpg014NbEywDFJXH0C3gdqthEE7c/LVx4i5vVz0MPqTdDavJfczkRkdQ25CjRIrIr5GsRqa2asVmavT6wD6yuuADB8iHSN6bztf+3lTItWYSDFBvR+3jJuL2OUNl6oqVOTVK2FVYKFuMS6wEG8hNOvX1ll6TFCEnglwKlUM5PQ9I5rVHZp43VSwonFjbmvuQSBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dp4yfXvxbFRtL0huz6pySRwiAq4ZTIRP10RoVn3IdeA=;
 b=CT77l2elTZa/xlT5jnruQnXVT9DW/NT8r7A42xrzR9jyHDXtFtSOtY1BgIKmeV+SsB/EmeemIhIKXv4tR3Erj3ndX0V0o2tZHlHxJdwR1v111LT3k76NHlREtdkVXCAVWfhaQu/D9Xx+cS/v3dYZwfTyeCrAMrSTPeqt2v+37h4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by BN6PR11MB1876.namprd11.prod.outlook.com (2603:10b6:404:ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.29; Wed, 30 Dec
 2020 02:40:05 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::2cab:3fc4:7f35:c8d1]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::2cab:3fc4:7f35:c8d1%6]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 02:40:05 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] libexif: fix CVE-2020-0198; CVE-2020-0452
Date: Wed, 30 Dec 2020 10:39:53 +0800
Message-Id: <20201230023953.2665-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Wed, 30 Dec 2020 02:40:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1049c2b3-33dc-4027-0cc8-08d8ac6c3712
X-MS-TrafficTypeDiagnostic: BN6PR11MB1876:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB187674F1ADFB62CF2DD7B0F682D70@BN6PR11MB1876.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yOQh6Iq/xIMvLt16omKndxTkE7nGHUD3iO6CGUeZI5/QRujCnbJw8P8PDhYMFq3kc7ji6N0V0DOOhjp3NsjsC/Vaj2/6x5KmOheV893DwnYP7664/jyu/lbm63neBBBG9XFOE0bmEHqe+PfiMn6aIqJzaMoX4uHnH9/euWzbi0lbF3q1Ica1Qxp49dxomSQ2SNSflwYY8hEjz8n2BRxVl2p7qYP9Pw+3czLADgR95ek5mQ8wfkkY4rqHLv8ecgB83VbKyPq+SML80z+kJvCWPm+BAtKepcK0iMp1xwboJMFd9PRMmGXfHTUXu1dA4tEr2QM6Z8hPwKoerct6F+/sKjCchvDgKZ9H8T+feZXSjenEZhh77tnhd/4TBIKf8wX4XKG2swZuUb7WU/e5qDlrQtlRpBdkiQOWTYpnvobkStEcdAZEc9q3JxhG1f9nkwv59MOYSLquI+i1vZ4rKRssjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39840400004)(2906002)(66556008)(8676002)(6666004)(316002)(44832011)(5660300002)(8936002)(83380400001)(1076003)(478600001)(36756003)(186003)(6512007)(6506007)(16526019)(956004)(86362001)(66476007)(52116002)(6916009)(2616005)(26005)(66946007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ozdwjv32f8x/xZR4v8wlJBfAlckO+2shIgbBcPquhDr9Ky722lXH4S6NXqU1?=
 =?us-ascii?Q?AoSXIIG1gRulJL3KOXUcf8800VMDcuJlA2Iur5Oq6xxnbqHAsyXzpI8h3jMP?=
 =?us-ascii?Q?zRbcgHpQtgJkFsqTtQuAtqA8d2L3afUqwbUz9K4fBnDzpH10iAgTFNORY/n3?=
 =?us-ascii?Q?dkrIx3DIlV6r97cRyZXpdIXafCYZRO+cqr3OFtG38/zcG25+V9YSZS16Zsz0?=
 =?us-ascii?Q?gfvlP4xEP3+GwYDbCc4iq6q3T0prWSu6nD8Gq+2TdcalomnlV7mPkerfPLfe?=
 =?us-ascii?Q?1RN73hTdBX4725+X3zlWtRUk48QpgC28NWeE1ntT8KqBF0szieLphbQJZvAb?=
 =?us-ascii?Q?vULSysQIOofQtrmZagmtorTVXwKG4b9z4LeWXbE1rO+2gkOFk0yX1h6IRWsw?=
 =?us-ascii?Q?rkxIeHieonPY6otYWjI0DuKXwxW/hd1YGrjm2B+8VfDxoNRMr6KTmUfBb6kZ?=
 =?us-ascii?Q?+ThfW/KbZf1DVVRFpZ5HgXQm/TUzfJ9KrOljzc0afyF1GuGoiMWkGXDusTZ3?=
 =?us-ascii?Q?nD1Y+2PB2VGkYcvZgSndRDUJFNW9YPJkqwCXJdtgN8ZajAVwGnsFqR6t7IZx?=
 =?us-ascii?Q?MXquh9CB9uNk/VTWUNnZNv4HDNyj99/9X9epNDEo7joTAr0Hd10adAeoAq7k?=
 =?us-ascii?Q?b1EQL8AfT6xLjZdv/171eXVcBAX1PJxMja3GN5B7mqgUQTUcOR3Bh2G+68Yt?=
 =?us-ascii?Q?BtUWaAJRuFEFmp6LKlP+ekrd1edrA5jLEWSrZEm3uODTVRG/eUitOnGIJwKZ?=
 =?us-ascii?Q?dVvJCovqaxzpJW15Qd+zjr1VNSRzHAADcH9jlCOyHsE12Pg9mJGQutjdC2at?=
 =?us-ascii?Q?IlDI5bFgVpqCopFgtL/b56g2e117hMM0ar+w/v2W9bEepksJ58nVjKY783bb?=
 =?us-ascii?Q?CptF6rF7xhkI7PnYJ69+EpN7wPGRIozRDZ6P6lOasErsxTyXiO8EJ8+XgIwr?=
 =?us-ascii?Q?cYtMuongbKe3QobGWMjg6WA0Q6sBGxUrHG7JYtIlU3Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 02:40:05.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 1049c2b3-33dc-4027-0cc8-08d8ac6c3712
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rcxhh1vko98N3OFDxoGakAfDC+fgVZ6x43JE2etXYqtjq5iPcO9s9R7PKO0riFf1b59M/sttSDD10gU9JyWKWSa5QT84MIVbPys1Lt1CPIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1876
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libexif/files/CVE-2020-0198.patch         | 66 +++++++++++++++++++
 .../libexif/files/CVE-2020-0452.patch         | 39 +++++++++++
 .../recipes-support/libexif/libexif_0.6.22.bb |  2 +
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0198.patch
 create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0452.patch

diff --git a/meta/recipes-support/libexif/files/CVE-2020-0198.patch b/meta/recipes-support/libexif/files/CVE-2020-0198.patch
new file mode 100644
index 0000000000..5a051204e7
--- /dev/null
+++ b/meta/recipes-support/libexif/files/CVE-2020-0198.patch
@@ -0,0 +1,66 @@
+From ca71eda33fe8421f98fbe20eb4392473357c1c43 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 30 Dec 2020 10:22:47 +0800
+Subject: [PATCH] fixed another unsigned integer overflow
+
+first fixed by google in android fork,
+https://android.googlesource.com/platform/external/libexif/+/1e187b62682ffab5003c702657d6d725b4278f16%5E%21/#F0
+
+(use a more generic overflow check method, also check second overflow instance.)
+
+https://security-tracker.debian.org/tracker/CVE-2020-0198
+
+Upstream-Status: Backport[https://github.com/libexif/libexif/commit/ce03ad7ef4e8aeefce79192bf5b6f69fae396f0c]
+CVE: CVE-2020-0198
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libexif/exif-data.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/libexif/exif-data.c b/libexif/exif-data.c
+index 8b280d3..34d58fc 100644
+--- a/libexif/exif-data.c
++++ b/libexif/exif-data.c
+@@ -47,6 +47,8 @@
+ #undef JPEG_MARKER_APP1
+ #define JPEG_MARKER_APP1 0xe1
+ 
++#define CHECKOVERFLOW(offset,datasize,structsize) (( offset >= datasize) || (structsize > datasize) || (offset > datasize - structsize ))
++
+ static const unsigned char ExifHeader[] = {0x45, 0x78, 0x69, 0x66, 0x00, 0x00};
+ 
+ struct _ExifDataPrivate
+@@ -327,7 +329,7 @@ exif_data_load_data_thumbnail (ExifData *data, const unsigned char *d,
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail offset (%u).", o);
+ 		return;
+ 	}
+-	if (s > ds - o) {
++	if (CHECKOVERFLOW(o,ds,s)) {
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail size (%u), max would be %u.", s, ds-o);
+ 		return;
+ 	}
+@@ -420,9 +422,9 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 	}
+ 
+ 	/* Read the number of entries */
+-	if ((offset + 2 < offset) || (offset + 2 < 2) || (offset + 2 > ds)) {
++	if (CHECKOVERFLOW(offset, ds, 2)) {
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
+-			  "Tag data past end of buffer (%u > %u)", offset+2, ds);
++			  "Tag data past end of buffer (%u+2 > %u)", offset, ds);
+ 		return;
+ 	}
+ 	n = exif_get_short (d + offset, data->priv->order);
+@@ -431,7 +433,7 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 	offset += 2;
+ 
+ 	/* Check if we have enough data. */
+-	if (offset + 12 * n > ds) {
++	if (CHECKOVERFLOW(offset, ds, 12*n)) {
+ 		n = (ds - offset) / 12;
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+ 				  "Short data; only loading %hu entries...", n);
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libexif/files/CVE-2020-0452.patch b/meta/recipes-support/libexif/files/CVE-2020-0452.patch
new file mode 100644
index 0000000000..a117b8b369
--- /dev/null
+++ b/meta/recipes-support/libexif/files/CVE-2020-0452.patch
@@ -0,0 +1,39 @@
+From 302acd49eba0a125b0f20692df6abc6f7f7ca53e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 30 Dec 2020 10:18:51 +0800
+Subject: [PATCH] fixed a incorrect overflow check that could be optimized
+ away.
+
+inspired by:
+https://android.googlesource.com/platform/external/libexif/+/8e7345f3bc0bad06ac369d6cbc1124c8ceaf7d4b
+
+https://source.android.com/security/bulletin/2020-11-01
+
+CVE-2020-0452
+
+Upsteam-Status: Backport[https://github.com/libexif/libexif/commit/9266d14b5ca4e29b970fa03272318e5f99386e06]
+CVE: CVE-2020-0452
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libexif/exif-entry.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libexif/exif-entry.c b/libexif/exif-entry.c
+index 5de215f..3a6ce84 100644
+--- a/libexif/exif-entry.c
++++ b/libexif/exif-entry.c
+@@ -1371,8 +1371,8 @@ exif_entry_get_value (ExifEntry *e, char *val, unsigned int maxlen)
+ 	{
+ 		unsigned char *utf16;
+ 
+-		/* Sanity check the size to prevent overflow */
+-		if (e->size+sizeof(uint16_t)+1 < e->size) break;
++		/* Sanity check the size to prevent overflow. Note EXIF files are 64kb at most. */
++		if (e->size >= 65536 - sizeof(uint16_t)*2) break;
+ 
+ 		/* The tag may not be U+0000-terminated , so make a local
+ 		   U+0000-terminated copy before converting it */
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libexif/libexif_0.6.22.bb b/meta/recipes-support/libexif/libexif_0.6.22.bb
index 2478ba07d8..dc30926c59 100644
--- a/meta/recipes-support/libexif/libexif_0.6.22.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.22.bb
@@ -8,6 +8,8 @@ def version_underscore(v):
     return "_".join(v.split("."))
 
 SRC_URI = "https://github.com/libexif/libexif/releases/download/libexif-${@version_underscore("${PV}")}-release/libexif-${PV}.tar.xz \
+           file://CVE-2020-0198.patch \
+           file://CVE-2020-0452.patch \
            "
 
 SRC_URI[sha256sum] = "5048f1c8fc509cc636c2f97f4b40c293338b6041a5652082d5ee2cf54b530c56"
-- 
2.17.1

