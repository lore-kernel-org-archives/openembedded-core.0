Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44183C28D13
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 22:27:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1130.1660948068505366557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 15:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cMm1CBBq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5230d6c6ac=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27JBJ6fd002391
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 15:27:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=YEbcwbUOjCrYVI6GxoKQzNtLeXEsBneamvc+8pe6rVA=;
 b=cMm1CBBqaRy/MZCCB/Xy/n441A9yD45xq574gnf6QwDEGVH+iLus/3L3dc80VAAj3aRH
 joHiJ//m6s3J9LfCAuLWhQLvNut0800cnsSJ3a7h7JY//8P5QchywIgmJ/lMd8QfLj0n
 18onPlLP25Wa6U6TkS3JAQ7yonVRgNjq4yPOpQiRodyYJSOJaNhwYc+LUQ9jAVQ95UXQ
 LWe96CCI5/gfysrs1cmgbkquFlK5LWOSmvZrSe/cs/bnREYZ1D9yaX3YhMrkIyjvH2DR
 9lwi5/bD/v1oZ9EjQ5J3tO98ThgtO6NEN9w1Ds5z9vFlvPHzBknhJ/wcsOSEr3ACPiWW pw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjnjwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 15:27:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bk/WvLQXaVYoO8Hc/kqNtFOJ9pGKnMEVaMYTwqqwE3jEmjVvE+9OIAIdJEQYTW73BvrX9YK2yjUTeU/jxAoIck+SkAciZBYlu59fUN3DaUPpyF/Z3EIFzUTjaM7mliVbFkx3q6fQp8Ya9GOGipEYil3R+VjQxEgmW2TYpSx0lOU4aiwR6CWRkibn229HGfY7+QpS/zkWisDw4hqoM77Z3EmfzbgBKGhALKp5sShp3j49p12UyQg1hfeINhGQWpak7aU49yMdJ99q91XN7ZdvHxo3vCg10BVOhDy4CrEDH3iEoVF9dbxsAg/hJiavarwu5mhszobvgWl8vzc3dFCzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEbcwbUOjCrYVI6GxoKQzNtLeXEsBneamvc+8pe6rVA=;
 b=J+rHoMb1yyGGOEAMKaV8qacpEo0tbuxKh/6IRMiMvqlhO4mzJroNnk5Lop/NC3+gGcXtYgHZMi8xmxAM6qBNTGcNczxZ2FJYMhXMLuy6er54BShDJXixx6MPw7KlXAu4+WEFHHcpLfVXlVr0Ax0t2973dB4vsNxESNSETRWNnE4wz5KhZD7T8Nuk14eHNFYwyf4m5kPYSGKCxFCwsKDTNp1x08AC3Wc7KJAm7dnWGhvQr0kEa6Mor739It3OVExG8zbFW7ZQeEUsyhuENh26wNZMCO0e/ivJ+FVS9dw7fox/6fKqqREI+nR8+qe53NAcHQZBDsljRPmK6+4d6lYBdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4579.namprd11.prod.outlook.com (2603:10b6:5:2ab::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Fri, 19 Aug 2022 22:27:45 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.027; Fri, 19 Aug 2022
 22:27:45 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] u-boot: fix CVE-2022-33967
Date: Fri, 19 Aug 2022 18:26:50 -0400
Message-Id: <20220819222650.393-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::29)
 To DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2ae99fb-2109-4c86-c3e8-08da823209ce
X-MS-TrafficTypeDiagnostic: DM6PR11MB4579:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FuS5bNREP2tSgAE8YaghzzUQ1qA9XZApGik7pY4KuIZ+4HN7kCTkW9gcpjofXOWaHbBcsCVzp9HY8jk38CiwoH5VqIpnNS+eV3AqqHBBKeJRlo/6gVYYKDvxpsIrhEUYzuzIyiMmk/1clB6nwzTXhzrHoZUKyNry7rcz+jFZWRMINZxiv0eYw4vD1Dwfe+VVfGgk1IhNUEimQyyBzIEh2qmK9Zyxis9ffRnLewEmEQEoYjKMEfLH51lsP9e9zRmoUpPkFfFhMFgNpSNsCVSQa6gBXp0uqiOHjD6B1eV8Mxb9AFohDNINrrqLG07ULrXhdOZqh5CgyTVZjLEtLU2dVlOa7QcngGV2UfCcS5vRXpg5eD0jbLUQVCEz3l8FX3uioXdSSRmeXD65Ld0MBuIl5oy4Us/MbypjJubdThqezo1++vToS94AanIF9UTdcER4y4GMw9PbOdLBlrJ5VdlGw/twiQQSjrFsiZrys1DKc5raDkdIap+WPPO/tf8A8IVMFzIhTdJIQ+iLEnAEqz5xzHw2ibLQNUleeQhF3923aA/yIMmxyxQRN4EggEY/ar/gxh3bBd2zCm1+XhLduKGQ/6qXohKm4k2BFp9CCwDU3SYGmYAinyd+jIofqHyoZnW25BMrwXwlN0hh7sQowwje86CWMeVdZdUw+Od06E3ZCGfGHgQVfvSbZTgW8ibI6nCEi4voqUBTvQPIIryq3dS/J+S3T+dxFCqeBkFS/nEyhCIc6W8ZP0sYUpQU1PgK7jxb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(136003)(39850400004)(346002)(66946007)(44832011)(66476007)(316002)(8936002)(5660300002)(36756003)(6916009)(2906002)(6486002)(478600001)(8676002)(41300700001)(66556008)(6666004)(6512007)(6506007)(52116002)(26005)(2616005)(86362001)(83380400001)(1076003)(38350700002)(38100700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9WDaVxfXBB4jCOdgpOTkD2VLABShQ7YOr9+uE0P/TAENcYR+BSwUDljVQoT6?=
 =?us-ascii?Q?noSPzDVvEps+rlKjadU127AxdmLBoMIkEgUOFSZwxWxAYPYCBEN8wDiJ7MgO?=
 =?us-ascii?Q?DORpWaqOHsjzswuDT77+wDemWDzy71p/r6Tw+OGNQ4r0On4XInyshv3/X6eT?=
 =?us-ascii?Q?LLfXnbatTxxN/raL0UpqjHTz607w/ydby5osQB0hcMkn+hys9GhwHHUVZowf?=
 =?us-ascii?Q?XW5V0LXTZYky+GB9mSo88pj3z5l+Ju6TUprp6pWxLmC/3NTTG6t95tjVx2Df?=
 =?us-ascii?Q?eAzwLKJP16ZliWd5mfJhzBBz6HLYavSatrlVoIyR7/jHxpzE1nIeDjk7tm/Q?=
 =?us-ascii?Q?adiwRA019r/XgcLsDKfDs4DLvLdccuPEcgULEG8d0swEG4Sj84bSXx6C5sLh?=
 =?us-ascii?Q?EfRg7hOhA0zDYWcARVzZwf/cBN/RCBA4upVGXhNG5I36qT4aAv8hv+HHj7YD?=
 =?us-ascii?Q?CzVtLXfed41+TKHS0lRes1YDPUhQKoD0TnmgorwedjkUpELXqi3htxuaWyXr?=
 =?us-ascii?Q?wdEBEWT/LsiqqawopcqkIn2zTdhMUgPdpDLy0nL2v7mnPku8SIFhC8Qh6qkT?=
 =?us-ascii?Q?p09EJ/QQRQFSQYcXzYBS0wrpCKr/Wr2BAaWMFt08P6/IpL3N9qDklrqDuEp9?=
 =?us-ascii?Q?eaypjP2DhOR2gLAt0JC1/6+akUwwjT26vH5/x2b37rfOp8NiTugScZWkzSwc?=
 =?us-ascii?Q?5mxlzIPqK9SpxCt+FkJMqwAeDlfYLowLIyqlRjJ2uRJ9q1cWvr0BfXZThgRs?=
 =?us-ascii?Q?ZqGmTTktb/gO3pimNq/K/E1FZzMQr9kuxJ64Ue1mZzfkZs/BBomalkSTUoMS?=
 =?us-ascii?Q?Qe7EtUDdB4vhMIw6AQ/4s7rQBwzt2m8SL0dspT+evcYYS6AJ7mQkrKmvJEfR?=
 =?us-ascii?Q?vVwG5CZUlHgoFzsg9JkRJGlPJdzgREhzuqR3cMepx7zhWwQ14c8lHe776LXN?=
 =?us-ascii?Q?IXiShNPvlpNab7y2hjZ2PvcHPtmAnAa0lrOhTLIzZu7vh4cx7MWkGSAH3+DN?=
 =?us-ascii?Q?hD32rjFZowZMDDf0YylfpluDOp6MR75FN1rLUJHVzrgcUue+zQkuXB5etqVB?=
 =?us-ascii?Q?5QgvqN/swGfkfJHkllHES/UCJEbFcKB5/PfW+CKtgi/5NRTVBYiDd9nG4sw4?=
 =?us-ascii?Q?oWgV9MnmfBpJXQP2QFxIMZWOvQ6XrsGO+ysXxZnh6P56Bgh/jcMg4h36fToU?=
 =?us-ascii?Q?csELFhxxcgVJ/HHwerShk+iyAj8DjoiDCGzKyeV/IOyVbix0GV3lcCHKQTEJ?=
 =?us-ascii?Q?/yaa59m87PJ6HHwa/rekXD18Gundlkq4PhiW4QpkokTrZ+2v6q2Z8XR1f/ud?=
 =?us-ascii?Q?W7QNWoco1hTglXXmhKcWzgk2xtrUPX4poRRhkSc4VMFfES0QgomZLmTSGKys?=
 =?us-ascii?Q?+8c2XFXD/h2pJCdGX+OUdoSokMZTZThy0nYhnUnzjQXku2wrj3S0EP0N64H1?=
 =?us-ascii?Q?81C/ayXfD7s8FYPeZssEMtbD4s9rTBIKX/7nYL9PovSsAgTGnKS5IkmEkbMK?=
 =?us-ascii?Q?+IodoD/ZOe1CNgPlnIo9B1wB6Qrrqu+g9P3w/ExmEwe7fQlyysCcDoH5J3TS?=
 =?us-ascii?Q?cnSkO4fPa7J5m2JPBAHv47OoEH3xieJZCo5UUS6EqZbUoPTVmRfcArrUD6Gk?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a2ae99fb-2109-4c86-c3e8-08da823209ce
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 22:27:45.3055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 01THTfWJ41bdUtpcohermpKJ7fFF371oTMRAdiKoksL48ExfhiNseGe6v4vFuM6xK9lUpsb0de9WYqQztM8h68+qG9o/S4TCHV0pX2ZIZ2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4579
X-Proofpoint-GUID: k9GA-GXybC_lSmUZGD-tQsQwxvEcZZRI
X-Proofpoint-ORIG-GUID: k9GA-GXybC_lSmUZGD-tQsQwxvEcZZRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=969 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208190083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 22:27:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169645

Backport patch to fix CVE-2022-33967.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...s-squashfs-Use-kcalloc-when-relevant.patch | 64 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-fs-squashfs-Use-kcalloc-when-relevant.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-Use-kcalloc-when-relevant.patch b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-Use-kcalloc-when-relevant.patch
new file mode 100644
index 0000000000..70fdbb1031
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-Use-kcalloc-when-relevant.patch
@@ -0,0 +1,64 @@
+From 50d4b8b9effcf9dc9e5a90034de2f0003fb063f0 Mon Sep 17 00:00:00 2001
+From: Miquel Raynal <miquel.raynal@bootlin.com>
+Date: Mon, 27 Jun 2022 12:20:03 +0200
+Subject: [PATCH] fs/squashfs: Use kcalloc when relevant
+
+A crafted squashfs image could embed a huge number of empty metadata
+blocks in order to make the amount of malloc()'d memory overflow and be
+much smaller than expected. Because of this flaw, any random code
+positioned at the right location in the squashfs image could be memcpy'd
+from the squashfs structures into U-Boot code location while trying to
+access the rearmost blocks, before being executed.
+
+In order to prevent this vulnerability from being exploited in eg. a
+secure boot environment, let's add a check over the amount of data
+that is going to be allocated. Such a check could look like:
+
+if (!elem_size || n > SIZE_MAX / elem_size)
+	return NULL;
+
+The right way to do it would be to enhance the calloc() implementation
+but this is quite an impacting change for such a small fix. Another
+solution would be to add the check before the malloc call in the
+squashfs implementation, but this does not look right. So for now, let's
+use the kcalloc() compatibility function from Linux, which has this
+check.
+
+Fixes: c5100613037 ("fs/squashfs: new filesystem")
+Reported-by: Tatsuhiko Yasumatsu <Tatsuhiko.Yasumatsu@sony.com>
+Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
+Tested-by: Tatsuhiko Yasumatsu <Tatsuhiko.Yasumatsu@sony.com>
+
+Upstream-Status: Backport [7f7fb9937c6cb49dd35153bd6708872b390b0a44]
+CVE: CVE-2022-33967
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ fs/squashfs/sqfs.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index e2d91c654c..10e63afbce 100644
+--- a/fs/squashfs/sqfs.c
++++ b/fs/squashfs/sqfs.c
+@@ -13,6 +13,7 @@
+ #include <linux/types.h>
+ #include <linux/byteorder/little_endian.h>
+ #include <linux/byteorder/generic.h>
++#include <linux/compat.h>
+ #include <memalign.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -725,7 +726,8 @@ static int sqfs_read_inode_table(unsigned char **inode_table)
+ 		goto free_itb;
+ 	}
+ 
+-	*inode_table = malloc(metablks_count * SQFS_METADATA_BLOCK_SIZE);
++	*inode_table = kcalloc(metablks_count, SQFS_METADATA_BLOCK_SIZE,
++			       GFP_KERNEL);
+ 	if (!*inode_table) {
+ 		ret = -ENOMEM;
+ 		goto free_itb;
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index 147f6e8183..0cb0e33282 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -5,6 +5,7 @@ SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-riscv-fix-build-with-binutils-2.38.patch \
                    file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
                    file://0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch \
+                   file://0001-fs-squashfs-Use-kcalloc-when-relevant.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.33.0


