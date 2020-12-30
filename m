Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.89])
 by mx.groups.io with SMTP id smtpd.web08.1745.1609295470607554144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Dec 2020 18:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=josci0vI;
 spf=pass (domain: windriver.com, ip: 40.107.94.89, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG5xUiP+rEgYB+31uU13VbRDn9R2R1kIL+pJeznDbNV8DkFgpgJPV1unAqVebc7D3f2jXo5KjXhg8dUKlkG8vVXFBBKn08ejE4Di435mV6adaUAiMWqy0IrcQqZuJSDFt073Gj7TxbPY4smKVNial39UByTkllF0xtVf61euDebCegZCEmzhFLymPDentAofc70YCwp9FPgoQSW7Y1dyYXJRpEaNi2XkEQzT4ZHbN+DTRTjNoBJ7ZCV0GpJEI2u2Y3ap0NKumphcmskveQekYxbXpMpRgVdnzx77RfNtm7ZPacU2e+jcEAkl45StRXrMSuPAXZfZQNQU5W3rBO5E/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIFV5GEW3gcQQfQ5OlwA3h3w3aygxJCuz0LGBhQ8fIg=;
 b=bW8OrSu8fiGuCYoMux5xCMa7pkFK0h2J8u59tKsru+7FmdhLQCa64hLSFVHMYY0cXHv6AznBS0xmr2S4GclmTQ7alGcy+nMNnPrfkeZT50q39//ugXzu1nhuDKIYnxWgayTPXn5+yHaoGDXtlTJIghH7rXIUWjCBeIO1ezgQsUrlJlxFMkNZiNKiR1ESJvOaMMOU1+aYeDSXkLH7CLu1cI6em44zhnC95N47czGG34PdOhYaGBwmzxoP/SuOFshZoIf6YfRvCxRBm5vhVGlH4n93NMW/30ZEXNqmQHyh2oGEF1yODpH6Otp/Je3Pe6n1lSBk2l9RNoGfVS30Jg9SUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIFV5GEW3gcQQfQ5OlwA3h3w3aygxJCuz0LGBhQ8fIg=;
 b=josci0vIsYUXOGuF2W6Fs6NoH/nqdSl+aMfXGi9s1sPgMR0tx5+KG0kQyATaJgatJS8k3pIe0QjLzelk+1wQLfJOnI9/g/WYWoctzjBV6K6yYH+T36BOJeQBFNcfyD2YFfNbxoSkgAkx6HYBbQvhtMgNHPHGEubNgQdkTbpT0pk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Wed, 30 Dec
 2020 02:31:09 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::2cab:3fc4:7f35:c8d1]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::2cab:3fc4:7f35:c8d1%6]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 02:31:09 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libexif: fix CVE-2020-0198;CVE-2020-0452
Date: Wed, 30 Dec 2020 10:30:53 +0800
Message-Id: <20201230023053.14119-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0066.apcprd03.prod.outlook.com
 (2603:1096:202:17::36) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR03CA0066.apcprd03.prod.outlook.com (2603:1096:202:17::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.14 via Frontend Transport; Wed, 30 Dec 2020 02:31:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be6c9273-a002-4264-97de-08d8ac6af77e
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB41310E58A8BBAF584A66196482D70@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EZYwxtd2JGyNTmorgwt2D5jHPQZbcYFDcksvEqGa20oKYBwxMx4dnJyKnksWcEhZdsY43ZyOHKfw+r+KNpmloqkslb9vbzOFlEmD8L6Fqz/jtvylLfEpTYhPvPhcxKKKNMtpwRVcAFrlvH6KlPT/sVY1zZIDQzMLqUDuY3Icgbf4PvqsWVJ6X5IcYXpMQAofenAHCaPSh7AdPeEWZ8RIWV3te/CNKrl8RD+m/Km/on7fny444Yr8Dylemt7rtQ3BH3YyczEGpNjBOJPQ9bxC9Cq05A+CrrNIwo7KOyRDPt3D9CDJ4Z+4EZpGkWGku+PEeJuXqsuBQjWAyItsFRlh2YQPKaaI0uI2ZUEDRAuL9Nj1Bcy2L3/NXA9MWxFycnojTktyTQPcuxsb8uXLkDFfvQ+2QdW9Tzvr0wgTrk1tIUn99kzifDS2m+0yWOZtamoUYYvi4SBg86/WEkeu1zg0TA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39840400004)(52116002)(6486002)(6666004)(86362001)(8936002)(16526019)(66556008)(478600001)(66476007)(26005)(66946007)(36756003)(6506007)(956004)(186003)(1076003)(6512007)(44832011)(8676002)(5660300002)(6916009)(2906002)(316002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?f0wqOdOdBrDEC+6QWiZhCg5Q+U8N8iS+1m7w0LS3ye4bHOd+Dq+stqpXpbtu?=
 =?us-ascii?Q?KAd5ZoRyuLvmCsevLkQ6JkrTEssX5GFnfutHj2pYOB6xLurKRSid8yO3sfyQ?=
 =?us-ascii?Q?j9v0JEp9sf+xxj7WoMwiqzRCOc+g98Q5o+YfGDBYpdOuZxU6dDGyNpTsev8A?=
 =?us-ascii?Q?mSGjvb+7UGjuqaulgOjY+oCfYGlQuCp2NdRDFc47bI5hqAjzUUc9qTP2cOgz?=
 =?us-ascii?Q?tfTcLuPeEJm3EXT9D3ElJXN6SG7INbsKJ5lQ1wEF8qiRrupBviOEqZuGhqL2?=
 =?us-ascii?Q?zjP5LlVro4wtyT78kAMhPV+TBsRU2LdWnp0IAJZAFtW3rceUC3zLZAlWyAc2?=
 =?us-ascii?Q?+WLyWqEaqGv6Iwe+bL+SjQlNtQiT4nc72cGJkYK+VlSgpHul95XOazJXRoQT?=
 =?us-ascii?Q?M6AEKqSL60CpxBwVi4DWqFfjXL9I+0kfeCjaqRigjQNDGlQPn1elD5/DrTZ5?=
 =?us-ascii?Q?btwbO4KVghHckKZQCuthkvqGSzKBD7MaoWeJU6vO9jrG820xLNW31Yc1zPnG?=
 =?us-ascii?Q?hWRKOeQ36h4bT++d7J7jTk5VIzxjsSCmyisXqBxlNmGVwjxTlvmWOsH/fRbm?=
 =?us-ascii?Q?obRZvrEhFxr6c0/veEYYpvgFYflk5atCqnVLVS8YRiF3ZZUvvR2KnYMQu5bJ?=
 =?us-ascii?Q?ER74Ps9KmluuASHc6A4YQdfuy5TWceB5TuCKFpNqQMv+0QC5u1PMB5RFPT1F?=
 =?us-ascii?Q?xdMvqXGCnK0fK4eztwPZ79Jq9MXNeMUDorpERSs5veV61kdNnBv7vFjBf7Ov?=
 =?us-ascii?Q?uI446FI8SeDMZxDv902LvjdVsFrOkHlQUEWXFeKwp9FrnwKpJBdjh0SGIcEa?=
 =?us-ascii?Q?Ycc7X60JDv9pW/PYleEIwrm1N4y2kiznXEL0tET649Fhb7KNu8YfOKfwGx5O?=
 =?us-ascii?Q?PFg27/7ntnqevyNhoPCXK3F3/VEGwB/lHzoPTcnK2UPy7YNlcETQELIdmNqI?=
 =?us-ascii?Q?LNWB8F444DgC19rEdD9x1hdZwnx168hHeEq1p+p7P5c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 02:31:09.0465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: be6c9273-a002-4264-97de-08d8ac6af77e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6PAETLEhH8g0bAXfYUy82MnwvK8rIY3C25RWr6+pym9rkS0i7j87HPglaSo8BL/XTgUfsr5fexZeq8lxiH0BvIlcWN8ZOqH9KB8qP26Y/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libexif/files/CVE-2020-0198.patch         | 65 +++++++++++++++++++
 .../libexif/files/CVE-2020-0452.patch         | 38 +++++++++++
 .../recipes-support/libexif/libexif_0.6.22.bb |  2 +
 3 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0198.patch
 create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0452.patch

diff --git a/meta/recipes-support/libexif/files/CVE-2020-0198.patch b/meta/recipes-support/libexif/files/CVE-2020-0198.patch
new file mode 100644
index 0000000000..9b80aa7087
--- /dev/null
+++ b/meta/recipes-support/libexif/files/CVE-2020-0198.patch
@@ -0,0 +1,65 @@
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
++        if (CHECKOVERFLOW(o,ds,s)) {
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail size (%u), max would be %u.", s, ds-o);
+ 		return;
+ 	}
+@@ -420,9 +422,9 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 	}
+ 
+ 	/* Read the number of entries */
+-	if ((offset + 2 < offset) || (offset + 2 < 2) || (offset + 2 > ds)) {
++        if (CHECKOVERFLOW(offset, ds, 2)) {
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
++        if (CHECKOVERFLOW(offset, ds, 12*n)) {
+ 		n = (ds - offset) / 12;
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+ 				  "Short data; only loading %hu entries...", n);
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libexif/files/CVE-2020-0452.patch b/meta/recipes-support/libexif/files/CVE-2020-0452.patch
new file mode 100644
index 0000000000..3b85637c4f
--- /dev/null
+++ b/meta/recipes-support/libexif/files/CVE-2020-0452.patch
@@ -0,0 +1,38 @@
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

