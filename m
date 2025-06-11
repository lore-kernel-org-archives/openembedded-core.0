Return-Path: <yongxin.liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934B3C61DB2
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 02:07:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.920.1749607653064741494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 19:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8257843b84=yongxin.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B1K1aZ013980
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:07:32 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm3m5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MI2bsH1H07dDkrhifuyJJFsCASJtv0lCVnTDTe9uEyaNt4doyWYYDYtlxdw97vpeaTB5w6rU5bq9xbLTanEHDdXBMXB2ObidPm8cKdPJY+NUYpbqlRJCeXpfNnWH35HvZCHPzzcTMokjXN7b7CBOSE/WJIHU1dQ5/fJDTx7cE0ArEYsMs9qg2sa3oKWs6TBqFeie4ooreq9YUc6vDt0jkb07rUiUjF340Ul1qh/qqZ0SIEhNyXXCTRJoDwbEd4Fjbo9KoaiPNc7aR8B0At+RqY1IJx6SHlmuM6aOF34ppr7O2Ch9d7WrJ+jBoGAiwjUFSqh4sJFppg9H4NsQHKD6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMUv3Z0G+9n+xgBperWjntcCiPtQrUk9eZbtGxs2J1Q=;
 b=V4iLb8ZB2IrvJCohm30spSzL3Yt3Bi9Gu9E/kE68bg2/0sAujkYrJaklS70BLBbsSwxJIMJm7cQEwp5LJI0vhRbxblJ/d0LnNi4np0luIvjsr1ovUDIWJADSxf5wR+TTdQMakJj7bKGfqzJ4iae1qlSU2B3PveB15kOWP/h3JRHE8HA+RNTb9kNoHkgQGAxd+S6J5vrsp5h2q+SXsZx/Hk4yuTOt57twlnG7jlmjKT8uZYC5nyEpV1RUGVt0rpUyUH3KMtr86V9BJQJ6PbfLZH+EzzhLzudjjry+pGuYpqYd2JTezT3TbzPr07gjPYRDfjrP6QOwl/thB+n5DOW37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18)
 by DS7PR11MB8854.namprd11.prod.outlook.com (2603:10b6:8:256::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Wed, 11 Jun
 2025 02:07:28 +0000
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8]) by SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 02:07:27 +0000
From: yongxin.liu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar][PATCH] util-linux: fix agetty segfault issue
Date: Wed, 11 Jun 2025 10:07:01 +0800
Message-ID: <20250611020701.1005436-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.46.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0343.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::11) To SJ0PR11MB5072.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5072:EE_|DS7PR11MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 810ff1c5-33fa-4618-0549-08dda88cb6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BcNwgrZ2ltcnZynfyAj1YzbG5wT6Jn7vJ5OsaR++w8d9mJ10S9OuignC1Ejw?=
 =?us-ascii?Q?yaUzLx6JZeoTG0n0wQSAFcm674E6HVofAQ34iuC9+5mLuE1IGU/IKKggNd5N?=
 =?us-ascii?Q?hOKFgz0UPVPhd+sVfrrk9n8ZIvp0cQWJKTu11BOnsfjOZaBXFq3DdMD/O9US?=
 =?us-ascii?Q?pmXhry1f1Hz9PeHMKIPTjB7q70q8414bHXwQJyFOxbOmlQIZjqzLWeXX82RM?=
 =?us-ascii?Q?riC6RKvNbddQE4NMB80rK6Z0Y1uhRFIgh3aRkvATgVEWLtCTo8FCMP1l2kwd?=
 =?us-ascii?Q?mESRHWwe74uAd0VXh0Q7BdRhCSdujXpSNDuM+TjVJ9iFqKzvhFDQRZ/i4aWw?=
 =?us-ascii?Q?VhKLtd8AO5UCSn8MccMIMqMlCGf/kP/jxJKdAT1EHQIcdrDt3QG6/3OSZ/Ei?=
 =?us-ascii?Q?oRstj40biL+raKjbY5vtKJ5YESlf0cQkldipB3Rse5iV72w7CZHnRXxW6AKb?=
 =?us-ascii?Q?zrLNx0p8mNXW2g20XgOixDV+TXNdiAzqLRyp96TFuBa8cOFuA9arGs9RSQyU?=
 =?us-ascii?Q?x9PQT150U+ko+RFIeLMLNmIekFakG9TPiPm0iMDXK9zT9CVWtMW8bxLlxMRY?=
 =?us-ascii?Q?7maYTQxnCDouoRSS5u067YxYpOWLb/YamUo2rn+aBjqe6AsuD1S13mRgEcrv?=
 =?us-ascii?Q?MTs3hqPtb/PI5jnx9/YJqoh/+EoeSzfodPA8Osrck9xnb6G/4u9iiA1nkSfE?=
 =?us-ascii?Q?sHGQQgjXpiG5LnkjOyoq46GAJr192ED4FU7Rf2hgTgF1X/OudmzZRLOzh2P4?=
 =?us-ascii?Q?3BLVuXvNWVYT2xdJjrj/0WC6yDQzPbtJQGz5/eTLVwhUNDM0l8vkvxpzUsyq?=
 =?us-ascii?Q?k+X3xnFPnuLmbUIK/fJhMZMLuXoZB6n/ulv95a5CLZH3x05CfG0wXhKXeGd9?=
 =?us-ascii?Q?48Bbk2WGXcwdk1GwhrR3C9bgKQfRcZ5whWldFPJ4azihkS61uWZmSBg5BRg4?=
 =?us-ascii?Q?rGou9t7cEFUSy0krzMaPjJ10J3X1DJ8NhwNOqg8C6yu5s/jFaXY0aYOMmSBO?=
 =?us-ascii?Q?/PHu4KJRUFU9/vXGAr6FQJ5bHEPP0Sa5Z5rnLYbYGHODBdX5IbpgO7XJ6xyL?=
 =?us-ascii?Q?LCDyvUKp3bpXl20uPGtwXx9/QTe5mYyJBA3WwNn67nh2oFvox3EKeAeSt4JA?=
 =?us-ascii?Q?cMZzeyIlEatiKCsZEdB8N8Bdbw2jdOUF3xo4IRrnhtQQur4/FrLZOWCDkE3n?=
 =?us-ascii?Q?RbvfnoOMjgc4ZcBWrunjIRzdxQMbNjMmrrCNYTg4gNRB/pgZ5Ye9bAv6fLAd?=
 =?us-ascii?Q?9tczd9nspG/+mCK3nypT4WZCUXryrRew1Da1J6Axp3hAwZb80blMz/LkO7JE?=
 =?us-ascii?Q?xT+yHj4GJpe/NrHC4TmuWguZuRb3hDHxYNTIP6bdzEWyqy0Vu+yY6YnU4H9V?=
 =?us-ascii?Q?GDFHbUG5T0m8jSpk1YAEMF8xaor4ZLDRihEOmIHJGdpLDkOw2OoxMpznd1aK?=
 =?us-ascii?Q?z36TfOxmKDK6OwQeSh5lMGTObqdt+XMCamALyJb4ZyqvKuTkrg2zf6UkDwt3?=
 =?us-ascii?Q?Y7khMCw4Hlzotq8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5072.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H8Kzc8+JS1EXRS1d51kku8fdvrpW694TG5/GdxsEIKXkRh0mOg86ZyGChNe4?=
 =?us-ascii?Q?IgQuVP13tQOq4yaOVMKrkMiELuq1KIjewM0fQdremguvYMWDdFJNdc+EPQJ8?=
 =?us-ascii?Q?sxEHhm8+7FELnZGenfN51OwpYYZgmLc67JKuNzDmHniqqnaEoCV+GCgnbzDZ?=
 =?us-ascii?Q?6Ysg0EWN42pbc3PE4LQFGCNTDU08LBlXwCCFuBwIjqo3GEnlMx733lPWNfyV?=
 =?us-ascii?Q?WcKW/WJCgP881f9B1d5fYTElbCScW3t5Ok4lZ2KDe0E91a6EvczzHCbbJ6+C?=
 =?us-ascii?Q?6bM2fXZO130RDJ9mtjeqn/0rdUaNBRVjsTDJ/I2LByC/PYcRK7p+//RUinUR?=
 =?us-ascii?Q?FshxQxFyzTrkzxlmJNz3xLhI1gCRPBLwCQPBXKtJh9sWXyH4F/uu9wAa9N2J?=
 =?us-ascii?Q?IEdUet0wbUluZND8UZ1MAiSXvHVnRQXRwSF+Ebf6SC4FScokb1CQ0k3Z1s73?=
 =?us-ascii?Q?ZAZTn9UNfTMFjtrbPq2o0Bl/e7mA+UJpt+bPYppxZUI7iKYJPm5LXROS/+Lt?=
 =?us-ascii?Q?gwfLHw6yzx1Ktpa++YTrkiTj9LZpIwZEAaJiDVu6vXX1sj2coRSlN2LEnJuY?=
 =?us-ascii?Q?lqzjd7J+1YEo5z0Ire0VKrzqDgyGKi+rstfHgOlM/ey7lATdQ1DLXLtF0zT4?=
 =?us-ascii?Q?JHQilKfSHI7+lvB4/fdarFVLXTliuESeVfm8/p0hPM+dBrA9j1/hJSva7q32?=
 =?us-ascii?Q?i7zDUijADVr09dPmCbi1bMP9wgW9EsjvlL9Ud1VrSZdWaiL/TiRbwZrwNqjZ?=
 =?us-ascii?Q?LPdL6GpDYX1r38TXuz+k0c7trDyf6sWVHJskvAJLJy3jWZVUTHCJPOYhy4pC?=
 =?us-ascii?Q?F8h7ub+PDPgXoE/CV4ArEdWgoLDXHi+CgTjCqSLcYIPzFBPtoPvrKauniTIn?=
 =?us-ascii?Q?XA00aiEngUp5EG5GdWjYpaKKd6GVGMHJFGbwS3BIvNneA98c7hAf0vHBLyYe?=
 =?us-ascii?Q?r1H8bwJ0IstcU4pSbeI6KTsl+p312P6x0Uwi6pXd6mLlxExnhOa3iKdI+Wca?=
 =?us-ascii?Q?EeQgC91Yple9VweUybMKA7MhcY7fhfSOX8ShdvJYL0R0JJ6Isaw/wwuXVUML?=
 =?us-ascii?Q?CScXlFqcayNrKA75NN1R92IzNfs2o1ZBKgKqbIkiBEtM4ssoRmOHWhNbOQUs?=
 =?us-ascii?Q?nhqvu5fh0nnAnOb7id/Q1HOysxBjVqQghTSOwqNtdPHL+f1hAUnX7sg4w4m2?=
 =?us-ascii?Q?44Y2MxOxPBeEV5L1eMMhhhU86Lxv5Imcgz9lIzeRN19rrIcosLD88yhjOCEU?=
 =?us-ascii?Q?DMyr/G4nwvC+DTnzhnoJoH7LmX7Vtb8eMSh+eW+JedFEMG7vkdMPDxo1aGV0?=
 =?us-ascii?Q?y19Zazh6h2FUuAol3/gVLap+gKhzIMsmXj/niKHm4Xj7Rn0omUvm7WsQfmKJ?=
 =?us-ascii?Q?gAJ9w6Sqtnr8zU4qlcJUYu3PStz3RawK/EXXGv4qGV3F20EWjVhxTo3Qr6oP?=
 =?us-ascii?Q?iYav5N7jplMPPdDkD2rYgRpWgLBcljpMaskSpECHOK6T3OwvPTK5LE+EjMaH?=
 =?us-ascii?Q?qUMPY782pGJUpDShPABnAEvuFhaGn3eqULRwxP01IQiVclrrjZQOohcSkgfd?=
 =?us-ascii?Q?oQid6NTQnwoszhS5hQDObm7uUvXcJkzvW3yQSCMlXsx/Am1Qzz/bRY4Ubp/v?=
 =?us-ascii?Q?7g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810ff1c5-33fa-4618-0549-08dda88cb6fc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5072.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 02:07:27.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAqtRzptwWoWpt79tiUtzwGvbQzHoHGfQr1nW70gflkUMOcnBI69LAcYetD/EVXawK2P8VidnCai1lGU9WkNJThIVpKBtp694rq+X/Nk2nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8854
X-Proofpoint-GUID: 6vhFx0-26QsS6zeF1fh4mwjfEln8pUkp
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=6848e4e4 cx=c_pps a=jCnb3yOdQC6N0W1MV5DAOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=zYFN5UzSIAfY-ava1X4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAxNyBTYWx0ZWRfX+F92s+z6CiBb yL4fJZv4IclqDUxKGlJJHBgsEM/5+PFu5X7z2rCA8z9hXd3gxQ4Cg9KL8RpkVw9r/+hZlCyEp4X lK3X5aQsOBWTC5yLnAFUhz+olIDw62SBr6a8g5venuqta5mY7tL3jXwEX4adOV32X2ceB1dCklg
 wAJg7HadEnA8YQ4rCMhY6Wp+WTYdmXDNF/6QlFuPU/NvLwFu+zZ+i5dnFlcsAWdU782nypwOhqb f+mEHINezOeoR+zBShFddPtEe5QICQhNDK4UBJAwvSa2y2gJ6BBTP3EPY35o+OE2zRfLE6TLZ6Q aqypXhR8niuRqsC8O4mVslO7EnLQSKQLBNRO636pupHqOOosrmixpUlHhYbsyz7VHUdK3Lkdi3+
 ac2no9X9cdtZjNlybILjcGmA1wysOo/OJQp1D0J9ws29MlSF3LTCZVuC5RNIwMX02BXS6eIL
X-Proofpoint-ORIG-GUID: 6vhFx0-26QsS6zeF1fh4mwjfEln8pUkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506110017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 02:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218444

From: Yongxin Liu <yongxin.liu@windriver.com>

Backport a commit from util-linux upstream to fix the following error.

agetty: segfault at 0 ip 00007fc65600295c sp 00007fffa8dd67e8 error 4 in libc.so.6

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...tty-fix-stdin-conversion-to-tty-name.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0003-agetty-fix-stdin-conversion-to-tty-name.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4e8701ffdf..cbf148073b 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -40,6 +40,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://fcntl-lock.c \
            file://0001-cfdisk-add-sector-size-commanand-line-option.patch \
            file://0002-sfdisk-add-sector-size-commanand-line-option.patch \
+           file://0003-agetty-fix-stdin-conversion-to-tty-name.patch \
            "
 
 SRC_URI[sha256sum] = "5c1daf733b04e9859afdc3bd87cc481180ee0f88b5c0946b16fdec931975fb79"
diff --git a/meta/recipes-core/util-linux/util-linux/0003-agetty-fix-stdin-conversion-to-tty-name.patch b/meta/recipes-core/util-linux/util-linux/0003-agetty-fix-stdin-conversion-to-tty-name.patch
new file mode 100644
index 0000000000..2766ee2c0d
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0003-agetty-fix-stdin-conversion-to-tty-name.patch
@@ -0,0 +1,40 @@
+From bd6c104f931329ce6fbc5a1250c8c80a1d8223ee Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 24 Feb 2025 13:37:04 +0100
+Subject: [PATCH] agetty: fix stdin conversion to tty name
+
+Addresses: https://github.com/util-linux/util-linux/issues/3304
+
+Upstream-Status: Backport
+[https://github.com/util-linux/util-linux/commit/bd6c104f931329ce6fbc5a1250c8c80a1d8223ee]
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ term-utils/agetty.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/term-utils/agetty.c b/term-utils/agetty.c
+index aa859c27b..0dfe52c90 100644
+--- a/term-utils/agetty.c
++++ b/term-utils/agetty.c
+@@ -928,11 +928,15 @@ static void parse_args(int argc, char **argv, struct options *op)
+ 
+ 	/* resolve the tty path in case it was provided as stdin */
+ 	if (strcmp(op->tty, "-") == 0) {
++		int fd;
++		const char *name = op->tty;
++
+ 		op->tty_is_stdin = 1;
+-		int fd = get_terminal_name(NULL, &op->tty, NULL);
+-		if (fd < 0) {
++		fd = get_terminal_name(NULL, &name, NULL);
++		if (fd >= 0)
++			op->tty = name;	/* set real device name */
++		else
+ 			log_warn(_("could not get terminal name: %d"), fd);
+-		}
+ 	}
+ 
+ 	/* On virtual console remember the line which is used for */
+-- 
+2.46.2
+
-- 
2.46.2


