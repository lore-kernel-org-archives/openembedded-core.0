Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F5FC00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 19:19:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.11130.1658863144916376046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 12:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CVakw0NM;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4206887e6d=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26QIIkHq018939
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 19:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=cLIWwjZWKL6IlDCvM/jAvfEwzfoEDPXfFKUMqfAidyA=;
 b=CVakw0NMA6TxeASCfhxi9K0Eocmno27+Q8L7sp/fYvdNZ33e1BUQaAnD1KUaHJqEnkT3
 Q7zVKpSIFSSuGR+EhrYDoD/flnYQDNKCiZdHulsaw879w6Ai+x90W63Ud77vlHlPAWR0
 Lkd3iYzkfR+Urvl/ppaYr37NvtGQkTRqBM65GPdy8EJL+sLgFHtRSdKvzwSWx3NypFZ7
 ucxKTEtWdoimGWCNUuH5a1QZI4/Y/lZuonK+UOn0hTNeAaYxv9uJ6lRhoOia+imbublD
 yJdJSy0x6EHFdn0JVQMx9FdCvSYG6G5+raV2ipQenXll1fc1aXtqysh2utaXFDIFzqUD 9g==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hg7y8tnf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 19:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5lT3AVMRV+rRK9imJtrvlLOSmHwhXOxTJl6FdAdMO8M6QdiomR7byyoqtlovoJn3t6LkXTnJg5s3V86IO1oXqyRHmz448uDe5rVkbHdK9NEQnP0Z4rIEgVF7PLOUHAL/9syk9O9h3uw7+0rKXOHraEMROfrLaxeY5n6gwlu41BQHX1yUyF2uENaGqpLz31t7fkhd+8Wx4soQYWcsqg/nWGNoEXSnpE1VFoIkGlDthoD7KjkZuoqqeL4hOP6DhYOh7ROuvQxYvALClf/O5QLwl6gdjOPNVncjM3gfUcwRLbWtGFVnD80kxdgiZOztWImqWry1MnwZZXK1rL9S0yqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLIWwjZWKL6IlDCvM/jAvfEwzfoEDPXfFKUMqfAidyA=;
 b=h6EkNEeDnQS1JQVEWPeJwv7696Lb/hapWHGEJumgB/Sw9Uc7DaoQxRH/E1AyRxwA/yG5smYiTqWXa8K2F1IPXRw01fJ4VutQW57cnjcfwpaprmwJQkRSlAv5Msj2pEbhA9e6yGVrtEnpFeIUlpMi5rGfwVREHiS62XsUEZtzds/Lxi+a8L/TnfXxCcPwllNEQV1oTFZ8w7f0DBvRb4gxqba5YqkEskzyOSDeDAjvmsoICw4eDJFnwz1HQ4ZGDtLiTGlDUvqrtn7fEP7Gm3uphjWvkmB2QK0kyWQj7Gk6178JQGUdXxkvWR3Kl7c9O3Jmf3crpUPthFQl17BOyC8LNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4217.namprd11.prod.outlook.com (2603:10b6:5:1de::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Tue, 26 Jul 2022 19:19:01 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 19:19:01 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] u-boot: fix CVE-2022-33103
Date: Tue, 26 Jul 2022 15:18:46 -0400
Message-Id: <20220726191846.7245-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::10) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e880a7c8-387a-4a72-b90a-08da6f3bb21c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4217:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KOiAHMvJo/DJmHfagnDh0JjWts+iCug7eoTCeI01MOEhGYyY6zs3oxJePK5I1PFkmGImA0Z17CfTxc7D3uElzrc7Oo0sBxSCh+i96S1R84QTb5mDXqC/TFn7bOzvAtgOOHem1xcfohAOdpuDlhZ5uXS3B58L3nlkUkYNMbO4IkdIxyDhAo+/2YlX5JG8SBsvYKUDJeYt/RQALlenHn+9KEMn9vP2Q47kpM3Vpng2OXTnqxag/T0tT+H5JxNOqRiPi315vYaz4UjykEB58i+cmF3L/+TnpFFcB8oFxL++z1opdOwtK7wgfhVSxNaVUcYFjCaYexFX2LzNIOCswf7J0QrWK5fbQbLu9Vomtao0O/0CvG3tYZyy4SglPxBZEgB+LF/8CTJO0m+iR0Cm1tNJMKL0y7f+jZFfS7sV6gnUCAHI6GKmPMOpmCwy4YshbrHXQCgbH+NwQFiFkEBDsHWPH/9Q/TfZX6VAA8qGgPQYEd4V3pzpkOxPBEh1f7QBWnsS8Q7NU38ifrgHYlQPykpk6YPFIdaM3IOKmjzEBAtdDSx8R2CSzP3ZFDKyTItvqAlAAWmMz4BDSNwc5rHksWdY9GzoxYup9mEKACFqqxDKrV8q3+MXK+1umVY7P5PvgTc5fPSo5jyj9X6KGhLl4/maW56yLHiYsKCKYo9pKoL2WJgkqPgtHeMdCcCuyjBFA/qx4zynhy8QiSl22tP7h/9z3psKW7DtYsTdhW2c2NX+/AmbfAkGhLplkHvi8KG5GqIkbgRfYJ8tpzxKNYfQRa2z24vui5b9z8rkySPctZjMmYU7KSS9Iuuw7MJKDc0uSfLw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(39850400004)(346002)(136003)(186003)(6666004)(1076003)(6506007)(966005)(36756003)(66946007)(41300700001)(66476007)(66556008)(6916009)(8676002)(83380400001)(478600001)(6486002)(2616005)(6512007)(26005)(86362001)(44832011)(5660300002)(316002)(8936002)(38350700002)(2906002)(52116002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7U3sOhD6/0qZ5szkx6kR+SOhJBA01D9galV0qJIEjXPJcUHKkEYA4t5E+xyz?=
 =?us-ascii?Q?bzVvu2kZCRkPcK1udgFH+0uXSXHCPi1Iu9hPMv/cDFCQ4fVZtvR2SY4LvpT5?=
 =?us-ascii?Q?iI4jGbZw3crK8veOCfUR+Mt3SPYNVDGQRcHXzsE/p4rzq/Ru+1E8W3txTmqK?=
 =?us-ascii?Q?z4UcVHGEHMXYPKZTOIGZ/XDpU5w2nI6LeK/qQWw/9tsuaE7G/m5FaejHgddG?=
 =?us-ascii?Q?g10oX+UBX0xFq5gNAl/lzAwRgHT5WxjZ+htNFCkl68NBMsxgQzwCxzWjzU7w?=
 =?us-ascii?Q?lzcxKK6iCCam9PXbvdqEJUCG49nv1Ln3fnkpvkulIxFu7/OUupIX9FL2e8Wh?=
 =?us-ascii?Q?XqSGNd8saAq8XRi3AdDlCSNqgq8WJYt7Ws4KXiKXDch6jUAMc9k0Cplc4R23?=
 =?us-ascii?Q?GZiunYV4wmMQQkcVUlwv2NtiNfLhjHzxEvYhhbixShrXRU4U3OXBjXDEt2td?=
 =?us-ascii?Q?+G3/OqEGIXd5MvPXv7k9YEJypzy0K+D+giX/rrpu5o3m5/A+l2bDbZ/Ury76?=
 =?us-ascii?Q?p8tCp0Q6oBFWMTpie/H8kWn1PjKO/T618++az7q40JHvnR76lPJrWGUfBNG9?=
 =?us-ascii?Q?XhqqXF3u+IdaLQDjqE+9dx2aBar48P9U7EoaSs2lbvFCCehZTm0vFTbtxZPH?=
 =?us-ascii?Q?Il/7B8IMMtduHVXE4THZkph0OfyZQO1IsIaEOBMSEFkNgMTmq15W60csVd/4?=
 =?us-ascii?Q?TsqhI+mqkH5e9cGxvH5HdB9d3WKvgrqP8fJSJz+Zj42lJw04ln3BR3kQQGNX?=
 =?us-ascii?Q?EQDqnjDKJlRna9fu8c/QvR+iccAodcJgczJueg+WM6yfOekvf2DHoBbl8Gcl?=
 =?us-ascii?Q?Qx4M1W23/98LJvX0JZ3WNtUo6SaQen54MQHpFgA8eyUr2k1xUx+9DMF5W/kg?=
 =?us-ascii?Q?58xZ3BoOexE7pdMt8dcZCsayMJcBzGy1jxd8ZGwyq+D+s/G5bgyOmHPRwwzA?=
 =?us-ascii?Q?0CxURnE0PcnG7M3Ciq82AalTkGVT5UFJAkTzfgcKOAOiZJpnzhIw9gYHDd8+?=
 =?us-ascii?Q?pklZvaqP+DU3SLi21HeUxDjMNcU/FI3C98Q9fm8h6w2C7Z0pnVcFxYy+bcL7?=
 =?us-ascii?Q?Vb4qnMsKWuavoDhCVx09xE3//bygY1ic8rU1ZBgJ0UnqqgbA8EeZZ2RrMBWx?=
 =?us-ascii?Q?ruHlMxLMyxrJb2hE3v5yDn5V73flgdtCzlm9ks9iauVPc5rlT9hCepMeKdUo?=
 =?us-ascii?Q?liEyMTOsG+gs9F8sL0mRcoinAGk1QTW2VqaNDJbyCM8hYzGddvGY2OBpGg+M?=
 =?us-ascii?Q?aFtIaafacizqFAbnrOQ04mR/sRU3N4bo6Zd2OyDjR56SeQJbC1g4TcmMOCw9?=
 =?us-ascii?Q?KUCGSEjP9MGu5KVKOcExANXGiszhxbkblRSPfUFci+FWpcV7UHPY+/WU57Vt?=
 =?us-ascii?Q?ju5USxeFxgrYYuX2FEvKmybZA8wrL9/Ct1nBUVxxzPyL1DpCAyQFqibtbA4T?=
 =?us-ascii?Q?bA2hn5A8RHUVpa8DykGJYEfFC8ZnxpuL4wFo+kDFUT6cbwUtWGSpXc37kTO2?=
 =?us-ascii?Q?4LXPUEqmoDNXQ58ruqF/T5FMJObMe8zDHUXYoeZVez1TU4JNFqLF41TnK59+?=
 =?us-ascii?Q?5CkTgkFyFDZfqiyDFmgaRD2uKZtQ+Fj9WVi0HNBOC5mhkWebOm/J3qUbRVc3?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e880a7c8-387a-4a72-b90a-08da6f3bb21c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 19:19:00.9576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a9aYh85U7RBfb9j029foM07FR8GfoicI3KKRoVQlSplxFTiiTr68lIMZ/G+SQrTwALeT3p+1jH6z+4Pfe0ZA1j8MvKDuh/Oep8ax52goR8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4217
X-Proofpoint-GUID: 5J1PGNU8nRtm-ZAngraozmsDaMKMrous
X-Proofpoint-ORIG-GUID: 5J1PGNU8nRtm-ZAngraozmsDaMKMrous
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_05,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=772 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 19:19:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168511

Backport patch to resolve CVE-2022-33103.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ..._read-Prevent-arbitrary-code-executi.patch | 80 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
new file mode 100644
index 0000000000..b1650f6baa
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
@@ -0,0 +1,80 @@
+From 65f1066f5abe291c7b10b6075fd60776074a38a9 Mon Sep 17 00:00:00 2001
+From: Miquel Raynal <miquel.raynal@bootlin.com>
+Date: Thu, 9 Jun 2022 16:02:06 +0200
+Subject: [PATCH] fs/squashfs: sqfs_read: Prevent arbitrary code execution
+
+Following Jincheng's report, an out-of-band write leading to arbitrary
+code execution is possible because on one side the squashfs logic
+accepts directory names up to 65535 bytes (u16), while U-Boot fs logic
+accepts directory names up to 255 bytes long.
+
+Prevent such an exploit from happening by capping directory name sizes
+to 255. Use a define for this purpose so that developers can link the
+limitation to its source and eventually kill it some day by dynamically
+allocating this array (if ever desired).
+
+Link: https://lore.kernel.org/all/CALO=DHFB+yBoXxVr5KcsK0iFdg+e7ywko4-e+72kjbcS8JBfPw@mail.gmail.com
+Reported-by: Jincheng Wang <jc.w4ng@gmail.com>
+Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
+Tested-by: Jincheng Wang <jc.w4ng@gmail.com>
+
+CVE: CVE-2022-33103
+Upstream-Status: Backport [2ac0baab4aff1a0b45067d0b62f00c15f4e86856]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ fs/squashfs/sqfs.c | 8 +++++---
+ include/fs.h       | 4 +++-
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index e2d91c654c..a145d754cc 100644
+--- a/fs/squashfs/sqfs.c
++++ b/fs/squashfs/sqfs.c
+@@ -973,6 +973,7 @@ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
+ 	int i_number, offset = 0, ret;
+ 	struct fs_dirent *dent;
+ 	unsigned char *ipos;
++	u16 name_size;
+ 
+ 	dirs = (struct squashfs_dir_stream *)fs_dirs;
+ 	if (!dirs->size) {
+@@ -1055,9 +1056,10 @@ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
+ 		return -SQFS_STOP_READDIR;
+ 	}
+ 
+-	/* Set entry name */
+-	strncpy(dent->name, dirs->entry->name, dirs->entry->name_size + 1);
+-	dent->name[dirs->entry->name_size + 1] = '\0';
++	/* Set entry name (capped at FS_DIRENT_NAME_LEN which is a U-Boot limitation) */
++	name_size = min_t(u16, dirs->entry->name_size + 1, FS_DIRENT_NAME_LEN - 1);
++	strncpy(dent->name, dirs->entry->name, name_size);
++	dent->name[name_size] = '\0';
+ 
+ 	offset = dirs->entry->name_size + 1 + SQFS_ENTRY_BASE_LENGTH;
+ 	dirs->entry_count--;
+diff --git a/include/fs.h b/include/fs.h
+index 1c79e299fd..6cb7ec89f4 100644
+--- a/include/fs.h
++++ b/include/fs.h
+@@ -161,6 +161,8 @@ int fs_write(const char *filename, ulong addr, loff_t offset, loff_t len,
+ #define FS_DT_REG  8         /* regular file */
+ #define FS_DT_LNK  10        /* symbolic link */
+ 
++#define FS_DIRENT_NAME_LEN 256
++
+ /**
+  * struct fs_dirent - directory entry
+  *
+@@ -181,7 +183,7 @@ struct fs_dirent {
+ 	/** change_time:	time of last modification */
+ 	struct rtc_time change_time;
+ 	/** name:		file name */
+-	char name[256];
++	char name[FS_DIRENT_NAME_LEN];
+ };
+ 
+ /* Note: fs_dir_stream should be treated as opaque to the user of fs layer */
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index f2443723e2..a6a15d698f 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -4,6 +4,7 @@ require u-boot.inc
 SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-riscv-fix-build-with-binutils-2.38.patch \
                    file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
+                   file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.33.0


