Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C639ACDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:29:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.50098.1697790538721769115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=865775a26a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39K7uCdV019859
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 01:28:58 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tueut8afp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 01:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvjXtVP+nsIjNqZcoQPpc+r5p4CQLUJeZlQUahKfgLdHDjxKN63auiNTGnXzQoiXJ/sXVyYE7s9f/Vt+3XGqlg9zyoa8yz9fSqy/4UpcD72XXPuLVYLBDZ6g9l1yqdtALxbIfu2+0kyOCsoTURgHr7UoxSywpTAAKyPA6K/WgXikwY4VIVwm2PRXS7xNyDULv+ZKBCC22t+bcPMHkWka80WVj97L5/ntbjvjSa1F+ODUzw2GRjbF00cU9VlNqnazl5zom1mx1MeJL/FbssK8taV1szb3loQNOBN7islCftE5vQMRSmOhnKfLe+KH3Xi1Pt3ODYWIRQU9b0JLbx1sww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faifjvg45Pk2h1CWa00tlEUx0e4Luw7ldA/0PYqc/2c=;
 b=gipUqfyGviHf5ULotuqWimBepG1/zFu9YIDegp4bEVrjaUvEinGKOJ6/VJ3XiTPPBPeAp69I3cZ01gmou8HI4hwo2MPqgtpKmqFCboIG9s4VnekJD/oLUPGg1WbKYINvGMeIDmc2OnXht0IDmz964dutBV9sLr2Ek242x0gvOQCrB68h94kOSmiq4XMyNVACin58CVfzWSXWEjhL0ZX42hl+OktDkL89C4jPJJ71EBnjwixVPHZOsVmuUb9Td2rLcjgq80C5U1YVUMC7Fb9RuMqvk9+Ht/rWNrK8HqP/1WspbSY/RwHevfwuoMsvzOhQ2H2JlKw2J3fCwnj5zNBMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Fri, 20 Oct
 2023 08:28:56 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::4e4:7eee:356e:cfb7]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::4e4:7eee:356e:cfb7%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 08:28:55 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][mickledore][PATCH] grub2: fix CVE-2023-4693
Date: Fri, 20 Oct 2023 16:28:41 +0800
Message-Id: <20231020082841.1377923-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 28967ebc-b3cf-4f1c-e70d-08dbd1469988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OoPvXfQHbmJiAAw64I0vBk8wSh6QGneuBbyv66Pr9V75SjXZWpGDk4qfHj4quIpw8PtN0Uy1xFTsgg3giP9025KiZ3lcF6VsLyX3SkSaWh/Wv/ru2DzODzJeEBc3+OeKLiBMlZJXCEZNpnXMxHddcbiLEOlCB8zjrVu3x2si1WSYwPYG3V3wq+q+dzA1/OKpF92hqvXXDD0VUaJBHEWAoPBeZTxW5REFEJKiewkNnk8YevwUAae1yT2pewS26dl7ywitpyy5YNSPMk6CaaD5IuKvVhRfTuFfb+2+4n4etEbyYl1l+WbDsiQTvZ3BPtBzJ92dp4SncdSgDfbEqS12L7vJQYfl9V7+trJm+Oyns5s9YqTic67ei5Rn9JCVwNTRdF+sGSqD2tbsooJ38v39Hej1F5oaPzVLCSPhtmFfvqDlPrKWuAdaOG/j80/8cfH7VolSmGPfBV3AsyWzNVEbUD8+BL1sZOWs9gYfWSpOfh7Oo1dX+2Acglt9JKu6qiReZx1hPD536APZ1SzgiWyD+qRuIJHBpNzJn+lnVd5yAcf2KVuEeNFf7mjPO5yRj/RuizBxJVwyRr1S4FQwBUm2bBaiD8LBGFfHxS+06ApoVIE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(366004)(39850400004)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6512007)(1076003)(2616005)(26005)(38100700002)(52116002)(316002)(6916009)(66556008)(66476007)(38350700005)(6666004)(478600001)(83170400001)(6486002)(83380400001)(6506007)(66946007)(8936002)(8676002)(5660300002)(41300700001)(2906002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IzW+sS3socFpskPqKv1VQsy6PkI67MmCkuFNb3yJ3cXepipJOIzME26DcqQQ?=
 =?us-ascii?Q?3X8xE+2JGEUCV4s37oc1GOq4mPcT3NXGgm1oi7O7bOOhQ7sudVrErtAkBoAF?=
 =?us-ascii?Q?X/okwijHnvjmWfhyeshevcbMnGLzRd42PGIme0d5sG5CzUNZj7uOTGLWEMpz?=
 =?us-ascii?Q?NdWv/tr59O0dffaUqhsWxjZuooGgAW6hJqInZ38ZGuOlx6IF+swZVnISbEM9?=
 =?us-ascii?Q?4XAsDL/TiG5EnvwbAOZ2b3Kmgm7rjI/3xSIy66FjX+8y5uSFWyl+eFDVJixn?=
 =?us-ascii?Q?iKP3UdYvXyWvjwayD6u8h3PXA7d2W7fnjjTkU1PK4U+uS2J6LUWuT37CC50g?=
 =?us-ascii?Q?iuGLsNOeYk7eKrQytL+0t4gSpaYpA1rNDGKhEWNyqo2akZhQp6D1nNBnNdMw?=
 =?us-ascii?Q?KkEnZbYDukpbxtlU9Oo4uHMzPzVPBFnSvtIE8bijT5HTkmK1VOtJer8FQSvy?=
 =?us-ascii?Q?GM4QHyvHEqwsMPwEI05A6UFm4t2IHv7BRP6reNxxLGtPRU3VB54ZvMw3YWPQ?=
 =?us-ascii?Q?01d9D/OLIvk3gWIwJQeh39RP+Gn3nEFLbk3sQMJs/nOPfn0/1N8yBQuifJiA?=
 =?us-ascii?Q?IA6LtAFwcvoZ6criWn0yCtz3ZvNTLcwBdR12ZGUyaRgydV2U0TLviUpoNkfn?=
 =?us-ascii?Q?GNPkll0A6T+lGNmrPecHDb6ERtzqK7cykbKjQTB9NoMjdDyu0dMt+t9OQ0KT?=
 =?us-ascii?Q?BwdvELghhogZpeDamuLZMt2NXnhKg1sYs++K7pnH8pUUjZRsHiBUfMSFqcwd?=
 =?us-ascii?Q?tFh3/1/uPo8gpGMDLErc2YSWnV43w/JV+Spq78xZhgCGlbYwzoc2EL4Ebg5x?=
 =?us-ascii?Q?aSrreWJ16vRnZrpGhIhp1ZXYqRoepjWT1v8g3w+5aLuJ4ch/HcBA0DHfwIrN?=
 =?us-ascii?Q?klgoGfVa+7zcQpLX2zsO1TGy4071azPSDsBLewyq1d/LwijE8GdKYy3UdxmR?=
 =?us-ascii?Q?+Ig7DA0+z3Yi1g5uXsGZsyhjrovfBajKu2ZgMxl+56JIR+kt9oR0pRUdx+ab?=
 =?us-ascii?Q?YklU0t9fGJ3IyaR5Cbm4oDHJf2M0fPj08xyXCNE6wwTY6oMXuemRUU11N362?=
 =?us-ascii?Q?9Qjytf5BIuZQ3Hf4IWTAdcG+NlYGS4ges+baiIHqcnZX2PiL5BzInf10m9fT?=
 =?us-ascii?Q?XdNqtU7op7yBRcyjQZRmdptIS8jLa3DdJ0Fb2yfQT86DpR23z/1zARMuEE0r?=
 =?us-ascii?Q?A2OF3oQhFD4FtW6VC6EXxB6l2OD3E1QeMo1jogi7/68KF0oCLayezhQhxZdv?=
 =?us-ascii?Q?3Z9fa9TWufFCBaCXPBvMA6q21P5lm8Su1Iv+mK4C2PnUGnbLOeXGB3UC7twY?=
 =?us-ascii?Q?+v/ODykcH7Jh5y87X8WpvsgO619MjJD7bbysudkFuzUR0xg3BBtUanYMdR1S?=
 =?us-ascii?Q?YT4hhPujm08yhzA4ESIB74jDsfqAUQ80LR/jHKBX1rZVFPsGKqrPbSVEizFe?=
 =?us-ascii?Q?5J+df2cKMSGSBKpqcfbx5GXMbCCvOgG1kCuLMQH9E0yZZp5UQFuToss71R1O?=
 =?us-ascii?Q?ubw+UQTMoH58dgewyoO4SwWZIawc/jjJrhzuYESTsUvHVcqt9/0GPlqnxNq2?=
 =?us-ascii?Q?c7twfhHXisxDQ8Ki6CZqpcWHE0P4ZJq7U64zHFNCi+Qe0bwqJsT3o7Zr7UGJ?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28967ebc-b3cf-4f1c-e70d-08dbd1469988
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 08:28:55.9405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmI5ypYzep2Din/XiVNldkXmdp5bXE7yYsxx32WzCdOl1D07J3bI9lRASsbvGwyKOx1ZkwdayJJli1JTUc3SgvXkT0XBKrLOZKUQ0HW9+PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
X-Proofpoint-GUID: 0smD95pvfz3S834PnLGyOFyPs9mzgJtb
X-Proofpoint-ORIG-GUID: 0smD95pvfz3S834PnLGyOFyPs9mzgJtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_07,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310200070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189509

From: Xiangyu Chen <xiangyu.chen@windriver.com>

There an out-of-bounds read at fs/ntfs.c, a physically present attacker
may leverage that by presenting a specially crafted NTFS file system
image to read arbitrary memory locations. A successful attack may allow
sensitive data cached in memory or EFI variables values to be leaked
presenting a high Confidentiality risk.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../grub/files/CVE-2023-4693.patch            | 63 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4693.patch b/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
new file mode 100644
index 0000000000..544226a9aa
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
@@ -0,0 +1,63 @@
+From 0ed2458cc4eff6d9a9199527e2a0b6d445802f94 Mon Sep 17 00:00:00 2001
+From: Maxim Suhanov <dfirblog@gmail.com>
+Date: Mon, 28 Aug 2023 16:32:33 +0300
+Subject: fs/ntfs: Fix an OOB read when reading data from the resident $DATA
+ attribute
+
+When reading a file containing resident data, i.e., the file data is stored in
+the $DATA attribute within the NTFS file record, not in external clusters,
+there are no checks that this resident data actually fits the corresponding
+file record segment.
+
+When parsing a specially-crafted file system image, the current NTFS code will
+read the file data from an arbitrary, attacker-chosen memory offset and of
+arbitrary, attacker-chosen length.
+
+This allows an attacker to display arbitrary chunks of memory, which could
+contain sensitive information like password hashes or even plain-text,
+obfuscated passwords from BS EFI variables.
+
+This fix implements a check to ensure that resident data is read from the
+corresponding file record segment only.
+
+Fixes: CVE-2023-4693
+
+Upstream-Status: Backport from 
+[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0ed2458cc4eff6d9a9199527e2a0b6d445802f94]
+CVE: CVE-2023-4693
+
+Reported-by: Maxim Suhanov <dfirblog@gmail.com>
+Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/fs/ntfs.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index c3c4db1..a68e173 100644
+--- a/grub-core/fs/ntfs.c
++++ b/grub-core/fs/ntfs.c
+@@ -401,7 +401,18 @@ read_data (struct grub_ntfs_attr *at, grub_uint8_t *pa, grub_uint8_t *dest,
+     {
+       if (ofs + len > u32at (pa, 0x10))
+ 	return grub_error (GRUB_ERR_BAD_FS, "read out of range");
+-      grub_memcpy (dest, pa + u32at (pa, 0x14) + ofs, len);
++
++      if (u32at (pa, 0x10) > (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR))
++	return grub_error (GRUB_ERR_BAD_FS, "resident attribute too large");
++
++      if (pa >= at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR))
++	return grub_error (GRUB_ERR_BAD_FS, "resident attribute out of range");
++
++      if (u16at (pa, 0x14) + u32at (pa, 0x10) >
++	  (grub_addr_t) at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR) - (grub_addr_t) pa)
++	return grub_error (GRUB_ERR_BAD_FS, "resident attribute out of range");
++
++      grub_memcpy (dest, pa + u16at (pa, 0x14) + ofs, len);
+       return 0;
+     }
+ 
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 5ce8699363..f594e7d3a4 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -43,6 +43,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
            file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
            file://CVE-2023-4692.patch \
+           file://CVE-2023-4693.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


