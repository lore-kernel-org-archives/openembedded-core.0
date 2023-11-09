Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE43C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 04:01:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.114421.1699502478077516614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 20:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9677c0d58b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A93p33b004002
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Nov 2023 20:01:17 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t1few-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 20:01:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uo5lDpSIMrQmmL3zLY1qWGv12jcFPRcNQ5AOUhLCoWiKJJp7QG1Y7oSIGONF9QtAe/nGayDz91E27oeqPAwnkITWI6N/jBOH3cqgIWMG8+zy1FXr/5LIrvdAzAUWPG/dizhWC896BYrO6rjsQNyA6JzrWrWsSYDKxUSh7pYdK66y2cbiqM1Z3N9MVKZJlRObEqMqwO4phASVQzY891qhqpMVX1K5g7Q0xX+5E3NNp68lJGUzR8SfFvxEDrupgvWa2js9sa9hcuEyh+BeOVewLPgXtZbIjfGI7l6UPFVwBL8VU/WMAJIG7TZ1Sj8RgPlkxY5iHtsG7bqD4lhl6vYLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUoH9MIHotDlyx4LhOOBGuHvuAiRZaXYrfZb6i9fHwo=;
 b=KD+VOdFIJvpZVt4pR01gROwMeP9YQIt3tpU2iAM7G3pajFpjVqGjh+sWseUfZ4AYZqK9D3mlPTfQ6LF6hiHhh4a4la4e/KwWzl3Z9IoZ9gOt0FHuAVf/WRDz4IC3+/pt7ZWkNQ9wSXAVlJ+KWKOMNDxUUsItXRDwQcDygTWVw1jLwvc6LGiNmxhei8cjUQQkOTo5lo3QqtS/ExCU57VpPD7T5kecEsv9onEcS6L7HkJzq9Y9DDu6HXO7ImHL7I0LGD6QtBIlkkBi60CvpZ3PnLSPjEn83k6IBwn/AfG6t7oMTmFysupPHbW2VCmrdgojSX84vT6CPEQJt0wino90cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 9 Nov
 2023 04:01:13 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 04:01:12 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][mickledore][PATCH v2] grub: Fix for CVE-2023-4692 and CVE-2023-4693
Date: Thu,  9 Nov 2023 12:35:29 +0800
Message-Id: <20231109043529.3755015-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::25) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MN0PR11MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 6087cd8e-827e-4ae3-7548-08dbe0d88388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fS4TZGiJud3FOlGGNiA8IFFeXqtGgvhbs1GgXUJEcFNJQ0nqKCthIsp9Jxipa+QVnrGqacZ1NoO48UF1WmCCVJIjoxjT00vbYeatT13IpsrT57Cb2UQ9HsEreasxCIMaVykSi3fVeDUJeyU+USqSZ9DP8Ea4FbsGNn2Y27PPx7phy4kTRcwLk7KlkKh6RtCBkyXrU2q45eHPGsG93qpEppYIwCoZte7Wg1Ql/BWZAAJA09QyvsPq6l6PacbB/o5onnj3s4PCQdAu/MBQVnoL7L8EqRmstzEdLgFTfrO2ASp3d7e0T1dIKoSgcGNGvCYaom8MaoaP5BJjqVe7C5vppFcveQuXKs9CiQhsleDR9uvX38Nx4CEvYDYi+RMRZh1Q3i/9HzVJBgschVufssAZFrDhRcTNYSI4WrmIxa1Ik2XGsu9wpJIWPH+ZVO2/2gJYTbVWOZY8DEIcbC0EMztcF8SByzJC6wIW0Gi3PywmHTyiLGT1ZZjyNC+pfuxKS0im1bVK/7TCsJudQqB4UY+a9Ep/aKP17y+CXCU9LpVuj6EQ8p7bwfqYYyQirOBiXgJoOMpUpn9BhJYH+Qd15DjHKY+SJMDRUfaNPr2UidhXObAjxc+ggYHwDnosPjO714kNIeUTGoXGzzPH7LPauscddzIquxfNT5qHsZ7LTOb4InCvX+0g34XA0u8XEodSji1z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39850400004)(230473577357003)(230273577357003)(230922051799003)(230373577357003)(230173577357003)(1800799009)(451199024)(186009)(64100799003)(8936002)(26005)(83380400001)(52116002)(2616005)(83170400001)(66946007)(6916009)(316002)(66476007)(41300700001)(38350700005)(2906002)(8676002)(5660300002)(44832011)(38100700002)(6512007)(1076003)(66556008)(6666004)(6486002)(6506007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ITenMH7S6hK2xVQaWovmYwFvnHqfY8JOJhilN/w0FH8LrCGS1OOQ6bEhXSBM?=
 =?us-ascii?Q?EacDOQ6KVUiZxfNXgNrtZqtZm3uGcI0xDl+Di3E/889VSh/ZRlLv0NBrfryC?=
 =?us-ascii?Q?X2oz2ciX4FadUcRnzPhXPFzN2turV+D9FY1/TMCkWqqb/NfTge02cvMkBlBS?=
 =?us-ascii?Q?NRJz3VMvlRKHWDUGV4yHaqcE3ENTQUFxxbro4zNAeTfIarqKTT8iMavQqKTl?=
 =?us-ascii?Q?Vhn8kGe9REsL0Z50OS0F0+wA2sb6p6+DYbQVP4jJIqCuqZJD9Hh8/fZtoHct?=
 =?us-ascii?Q?E8z8BEXQBS0TmK+GJ8qrLjP+/U8CTVbRnYq0+VdTa/7ogG8RTVDkTzgLWThJ?=
 =?us-ascii?Q?fSYkQAy2WOMHSqMAsH2BYBAO2g5pn4SqCzElq1TXE57yPq0pW3l1nY7yfBFD?=
 =?us-ascii?Q?ctn5iNcSSO+cpMqaJ42TQ2rhfmJDtfXxX+/F27voieCUvxGgOehGPueVfLog?=
 =?us-ascii?Q?IKEk9htKEwqNWY6xBpVsEQED+qvHwRwPJY25Dtu/byur0tEBvps/6GMYYWKJ?=
 =?us-ascii?Q?nRAO+zYXBd3L5l4w59NDOKQ2uTj28XQtnVs2hdrNUQV0UZdXqY1gJdr7L5Cq?=
 =?us-ascii?Q?Rr1ZmZKA58LffDwptrbp3LJO6a5xQSRR4hIhr6E108WIXM9rGkkYds8HJffe?=
 =?us-ascii?Q?yvAXsgeSLqMbn6kvM4z0Lh5PJTy5rm0PEW8PyOhFhqB3vOgEMdoGYfMji/Bq?=
 =?us-ascii?Q?ozXBNokJFJpVoReyWqFNC0kT3d5kzFddIgQ9odtUUJH5KIK9jkj0b+YPBqXd?=
 =?us-ascii?Q?/c9ANB7ihcWCnwcUHQJyK0camSgaef+5qV/WLfiLQcxya0jx2mDKfubq5EJ6?=
 =?us-ascii?Q?h23CEQhLVQSCEoqjyWqtNNVJ0dzvBO18yNg186RPgu1W6vwqfdvSJyCuV4AV?=
 =?us-ascii?Q?LkyGcnvGxBtodX01r1XQqoLKNgCSO/f6eptsg1OX9lc4HAErAybDTlyuJ5DX?=
 =?us-ascii?Q?R59nICTw11GRItfObK0PaY3YnC6vlhfMveem5KGuMynqaNEBZnuG31MQb49Q?=
 =?us-ascii?Q?l42oxGz2Kbz6CzeKoydiyLoBgdQ5D8QZxGvjoL0Z2UOuu71iXr4Z2D5St62n?=
 =?us-ascii?Q?+FrSJNac/lX3Gvgdj1srYH4SO9m0gST3G/tfBb2LsFlPvNwNVHW7xZiyAu8g?=
 =?us-ascii?Q?iSvxCueNhzjrfutb9a7+JPTEI3cWYO7ox2IzH4UlyxiF/uNO4r/6vl36HcQ7?=
 =?us-ascii?Q?314ux34VadMaY80sYgEccU1iwlOGJYRWwpFoRmQMSwkYstDikqFTO13CO4lu?=
 =?us-ascii?Q?rv/dHF9Mvg+PvRqC2gg16uLKhBIGhgCVHA8hp2krJF+9Z+8g+VXeqKjUgqMB?=
 =?us-ascii?Q?wfmn/sbqCbISX63byEHeCfZYhLyzrRQOVqSSKs3qLS1W5BdZvvZAHZu++Nu9?=
 =?us-ascii?Q?20XBi2rovG9dqDW7mg3ZF4uY8ag8WA254Gkrfv2T4PbcOz3VkVrtNdhpqzdL?=
 =?us-ascii?Q?c7OcxPB7A8nMxnZtRWsVVWvBi23Tqv0oLoPms+C2TcwsvQgPxC+apTX5xa4w?=
 =?us-ascii?Q?/oYOdz7rRZIbCPwKaL43Ll6tn4GwhMBbyXHE/JaOnqraFSObBEI+HvNzp+hB?=
 =?us-ascii?Q?mvIhu5hEBz7BN7p5QbDns79eayoExO5g4LhX+pS+ldYMJleuiuWNN3J24pPk?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6087cd8e-827e-4ae3-7548-08dbe0d88388
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 04:01:12.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R83zfkDKaliwJ+L81QQ976n8a2zi+Fvs9KteCpDY5BVOHTclAruhH2op5xI0vVHQPknbDxCdyJoQ/bVhdKFh6Irv9LhJEdIpEJrrbCPz4As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6207
X-Proofpoint-GUID: _b92tIekobcQRTfr9fPDT0KLNGgerQpq
X-Proofpoint-ORIG-GUID: _b92tIekobcQRTfr9fPDT0KLNGgerQpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_02,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311090030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 04:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190375

From: Xiangyu Chen <xiangyu.chen@windriver.com>

CVE: CVE-2023-4692

Crafted file system images can cause heap-based buffer
overflow and may allow arbitrary code execution and secure boot bypass.

Upstream-Status: Backport
[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=43651027d24e62a7a463254165e1e46e42aecdea]

CVE: CVE-2023-4693

There an out-of-bounds read at fs/ntfs.c, a physically present attacker
may leverage that by presenting a specially crafted NTFS file system
image to read arbitrary memory locations. A successful attack may allow
sensitive data cached in memory or EFI variables values to be leaked
presenting a high Confidentiality risk.

Upstream-Status: Backport
[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0ed2458cc4eff6d9a9199527e2a0b6d445802f94]

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
v1 -> v2 : merged two CVEs to one commit, updated the comments
---
 .../grub/files/CVE-2023-4692.patch            | 98 +++++++++++++++++++
 .../grub/files/CVE-2023-4693.patch            | 63 ++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  2 +
 3 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4692.patch b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
new file mode 100644
index 0000000000..305fcc93d8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
@@ -0,0 +1,98 @@
+From 43651027d24e62a7a463254165e1e46e42aecdea Mon Sep 17 00:00:00 2001
+From: Maxim Suhanov <dfirblog@gmail.com>
+Date: Mon, 28 Aug 2023 16:31:57 +0300
+Subject: [PATCH] fs/ntfs: Fix an OOB write when parsing the $ATTRIBUTE_LIST attribute
+ for the $MFT file
+
+When parsing an extremely fragmented $MFT file, i.e., the file described
+using the $ATTRIBUTE_LIST attribute, current NTFS code will reuse a buffer
+containing bytes read from the underlying drive to store sector numbers,
+which are consumed later to read data from these sectors into another buffer.
+
+These sectors numbers, two 32-bit integers, are always stored at predefined
+offsets, 0x10 and 0x14, relative to first byte of the selected entry within
+the $ATTRIBUTE_LIST attribute. Usually, this won't cause any problem.
+
+However, when parsing a specially-crafted file system image, this may cause
+the NTFS code to write these integers beyond the buffer boundary, likely
+causing the GRUB memory allocator to misbehave or fail. These integers contain
+values which are controlled by on-disk structures of the NTFS file system.
+
+Such modification and resulting misbehavior may touch a memory range not
+assigned to the GRUB and owned by firmware or another EFI application/driver.
+
+This fix introduces checks to ensure that these sector numbers are never
+written beyond the boundary.
+
+Fixes: CVE-2023-4692
+
+Upstream-Status: Backport from 
+[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=43651027d24e62a7a463254165e1e46e42aecdea]
+CVE: CVE-2023-4692
+
+Reported-by: Maxim Suhanov <dfirblog@gmail.com>
+Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/fs/ntfs.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index bbdbe24..c3c4db1 100644
+--- a/grub-core/fs/ntfs.c
++++ b/grub-core/fs/ntfs.c
+@@ -184,7 +184,7 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+     }
+   if (at->attr_end)
+     {
+-      grub_uint8_t *pa;
++      grub_uint8_t *pa, *pa_end;
+ 
+       at->emft_buf = grub_malloc (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
+       if (at->emft_buf == NULL)
+@@ -209,11 +209,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+ 	    }
+ 	  at->attr_nxt = at->edat_buf;
+ 	  at->attr_end = at->edat_buf + u32at (pa, 0x30);
++	  pa_end = at->edat_buf + n;
+ 	}
+       else
+ 	{
+ 	  at->attr_nxt = at->attr_end + u16at (pa, 0x14);
+ 	  at->attr_end = at->attr_end + u32at (pa, 4);
++	  pa_end = at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
+ 	}
+       at->flags |= GRUB_NTFS_AF_ALST;
+       while (at->attr_nxt < at->attr_end)
+@@ -230,6 +232,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+ 	  at->flags |= GRUB_NTFS_AF_GPOS;
+ 	  at->attr_cur = at->attr_nxt;
+ 	  pa = at->attr_cur;
++
++	  if ((pa >= pa_end) || (pa_end - pa < 0x18))
++	    {
++	      grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
++	      return NULL;
++	    }
++
+ 	  grub_set_unaligned32 ((char *) pa + 0x10,
+ 				grub_cpu_to_le32 (at->mft->data->mft_start));
+ 	  grub_set_unaligned32 ((char *) pa + 0x14,
+@@ -240,6 +249,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+ 	    {
+ 	      if (*pa != attr)
+ 		break;
++
++              if ((pa >= pa_end) || (pa_end - pa < 0x18))
++                {
++	          grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
++	          return NULL;
++	        }
++
+ 	      if (read_attr
+ 		  (at, pa + 0x10,
+ 		   u32at (pa, 0x10) * (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR),
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4693.patch b/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
new file mode 100644
index 0000000000..420fe92ac3
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
@@ -0,0 +1,63 @@
+From 0ed2458cc4eff6d9a9199527e2a0b6d445802f94 Mon Sep 17 00:00:00 2001
+From: Maxim Suhanov <dfirblog@...>
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
+Reported-by: Maxim Suhanov <dfirblog@...>
+Signed-off-by: Maxim Suhanov <dfirblog@...>
+Reviewed-by: Daniel Kiper <daniel.kiper@...>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@...>
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
index 41839698dc..f594e7d3a4 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -42,6 +42,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-3775.patch \
            file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
            file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
+           file://CVE-2023-4692.patch \
+           file://CVE-2023-4693.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.25.1


