Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF68CC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 12:23:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14121.1699791807876212694
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 04:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=968033d13f=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ACCNRvE002145;
	Sun, 12 Nov 2023 04:23:27 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uaa0kgjua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 04:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeXwtkn8Xc+4pwoor74wh5cdznNy79ZMVb2Rj5DXJUcwWnPRScCl5cRc7lucqmQkURFNuSGYOXl94XTRccskjoDktC6wh+1sMdQyma/5QmK16DFmm22SHwqUql8N/UILaCH2YZqwwW+7ngSxjq70vwc2cI9gNhv972nqhFOaiEeGP59AxbS0HLFTCK9fgN9kbb1QxoNVU5OlhSD3cUJ/xwL37ld3HGId9e5892YPugq1zhDLJ5R0MoF3yIioROi/1nMjEW3GB6+l8kD++EesHAnpKngH6i7J5AtxYfyDKbFTsXsJBzeL/UCGEJPpMxpb7s3U8lESPcFVyWCxON69VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQSNK7eOCpJMppdli/upft6ZjzyDriGUg0Tg86oGZfc=;
 b=S7otT+khRSQ5Fju76ejkbQqbpecjiAv0+o01G42/YNBQC4e4Sw3aZA+AE7LZ8uf/wffFeSXlu3pKSy7ggEnFTQU0yhAb1/DoViXZTmIkHleD2EfnQBBbp/A1HTZriEAYp6rUyF8WYTNg3pMHzYw6ju+h/vNnn/2k4kJZBse5CW9zV6CHcZ+NONxGuPCFUAVzeE7HjFMIdZdX2jqw2lsqxKnBkYDrY+o/YnEtoC4jIg7x7AbfZNxhDuHM0efgjkGIhNz0i97pgxzT3sqVE/jsGe8A/eUaZeTmuQs2h/VGMPmZPKBIkCWUXKaHLa2Djj9n2dpqOPrwwTArCme5Fd3v3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Sun, 12 Nov
 2023 12:23:24 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6977.020; Sun, 12 Nov 2023
 12:23:24 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH] grub: Fix for CVE-2023-4692 and CVE-2023-4693
Date: Sun, 12 Nov 2023 20:57:44 +0800
Message-Id: <20231112125744.3321879-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ0PR11MB4829:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6baa44-1598-4c56-c7b2-08dbe37a2ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kx/YyI0HEdr4j1008zolM3wmlpNx8DBxd5EX+klsed5NpLSdOYZD22am8IZXTdSRSvPK2mbwlj1D/PvlyM/Jmsf335OHPwlOmk5o4ogvZE2eg0uYzCEhaSEWtgYB7SePcvUUiX2K55SowKlo3+xTrmWnOZuuv22rmIb2wdNkWWMXi1GkKbrHaND0rV363J5vSuVh7SeAmn0VskNWdFlUpcfSM6scYuNClvB7Rmv5hobahwZ5q9Sr+egcdWd3C1K5eUwg1RWJ4JXdRp6M74zE/ga1MwF94MmhtY4pV6/EqZhtvR6YVDtV0nqk053h5Nv3ds+rYmKUo6VEDSZDkhFDUFYQpFPpy4obxOI9cEdyXUyhN3l1C3Y3/Q3dp0G6Ft92k1QRbb0gQMMII0CYFmZbEzUZbOXU0/vk/c9ds9f7xkCMoPLn8PJwHSrQyng5QX6mAHAOzQBvkomuld6VCJINXPJKJWWLuGRQsaJT6fMteEFnyWBesVWUp5CTL9u5KyjwmIN2B9XLBcisUzWNZgU/SxARDDnT1Nd1550XU5fSLinjtPfejO5nBn7QjPW5reFNPLjoV7xL7Qy47Bs/E8IT5QnsLUT3FnKwW2e/TZDDsnFKNbrYzDHOK4ZEmwxRkPaju4uodGCfeAqUrdbO/1rkfqhTSRWyPnECjWw9Qo6r8oe2mqFeIlf4QH0509IDTRFsjc01r6rxThwxlRtP3+nouAxYMf5KGUEJxuNFnEmh9nc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39840400004)(396003)(376002)(136003)(230473577357003)(230922051799003)(230273577357003)(230173577357003)(230373577357003)(451199024)(1800799009)(64100799003)(186009)(83170400001)(41300700001)(5660300002)(38100700002)(2906002)(38350700005)(52116002)(2616005)(83380400001)(8936002)(8676002)(6506007)(6486002)(6512007)(316002)(66476007)(66946007)(6916009)(66556008)(1076003)(44832011)(26005)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lnKRNPSvBnRO5YQr8BaKz+d1jCkXlODxUillfp1h11RhP/8a2u7QYWuJyySz?=
 =?us-ascii?Q?yc6335Mb9wEl6SYoP/QUjdeZs1X6uVk6lLoWov6DQUy3jV/IGWcMcg8Y7q9V?=
 =?us-ascii?Q?2JJZr9dav1Ei/hqWDcgyD3xuPriufLFtZJ7lTLuV7je00q4ubzcYVNFBZNVx?=
 =?us-ascii?Q?86x24xp5Tsnn3xvtCnaRowjweb9nY2loHNGREZabuaEy9rp1wcVfKe4koBhx?=
 =?us-ascii?Q?9e7aHAsC3DZ8wXW1NJZvSVUOI7WtPEO9OrnupN2N9f8qvRE6MKfnChHxI/oW?=
 =?us-ascii?Q?/+wYlVWA/8VG9zgvFAtEZnU3MKmFw+Cgn7XhUUxQKqu4LNuAUOA42ZSXo9af?=
 =?us-ascii?Q?gkJKTP9tYCFkLnLHprqXRiVrCzbfmuM6kOfXUX57ltizEWzNHWrcS1m6PVeR?=
 =?us-ascii?Q?B8l+9VV3mywooyZ3Fy9qZ7IuWo6GAFO8v6gi2ESEF6bKzz4MgF2Hf/J2tKpG?=
 =?us-ascii?Q?WOl+WdlAJAE/JdpP0aJ7rPpo7+fFKyZqPIvf+PRZq2ZHPcySTpwIhtSXgGL1?=
 =?us-ascii?Q?uFxKxuQDLeHzcGr4cfYxxGlJZVYTZhC3Jrs9pvCoE5yUjDRVDTCnfugv5C+M?=
 =?us-ascii?Q?G6MlOx+aHFqBMoCvNU0vsz3PvXaaEBLi9rcSF4VmE76nZbcndbKqLlFRpmFk?=
 =?us-ascii?Q?EPt0y3dH2mGNBdL0tv0OQzqUDMEVHN9daoRk8fZqPcUm9alvQHLuXxyyIqDy?=
 =?us-ascii?Q?54cTkXXU5fGqoLwG4x7mrZOlQfUamKQVUktcqOy+doqWhH31sraxYaBQkQvd?=
 =?us-ascii?Q?I6Y3lFhz7nCOSS0n4Ftr976IroX5fUaJ2YrUi/zOLR2EuWkIIIGmqBcxMcYf?=
 =?us-ascii?Q?h1G0wtnsODSkIC5ERXlvuXjQQBKNvBKYjc9loed13zayNraXJPJm6MiDBAKG?=
 =?us-ascii?Q?1ABo/JAcQ4U7WUzHhwwNfpyHvvrZrHUwRqYN+0A1KtkpfJl2rwmoWbgcvCLP?=
 =?us-ascii?Q?CJ/ai1UVpX/OhRSSyy5Rywc2eSVFcIxtaf288C6GSpHxNPRAH+hunprEsQuc?=
 =?us-ascii?Q?Acml2RLPchAY+kUnKjsz8ckA+RcM+jh1qmEsrKNo106j8CQVyVZT6XHvdP87?=
 =?us-ascii?Q?IQgaXaeFDkrjIYSxsuckvGz+yru5q7LrunxtXquWRZE2H8gHqXvZx0Wmjube?=
 =?us-ascii?Q?h42OrffDOBwVjk7C/fLunXdHb5jUaG78J6u3U8I3eCen0ueFQieyLLCO6k9b?=
 =?us-ascii?Q?A3wpMgsUEy4Nz8DXcpnBjAEMt4mOmU4h76eUvbxI3ELqXyNbz6/Pt0e9Z3KM?=
 =?us-ascii?Q?uIxpY516rLwg067HjLJmaqgCi6djbevibWePTo61EJXpu/aLIOS9Mth0iMdG?=
 =?us-ascii?Q?xJg4XVaVf4BE6cbNPFP12ij4fx4VMPW8ehODFrwX4WAgtU9gA89L79KWDDU8?=
 =?us-ascii?Q?euVQ7H6DPECX9kFwL3l6ccg18Je9IMYlAgKX7LRPK5CrfICofaC+WhHNP85a?=
 =?us-ascii?Q?5c1NnZs8azvP5xtbqr/Du8yxlAyMBhgBsTIvEbKFHsdxLoilXe/JJ6C+K7xC?=
 =?us-ascii?Q?SB3CpZuWyUuHz2S14K/uFXdAX3JkjhhFbehojKbKqc2nRThDa6O5Pw0SCYKi?=
 =?us-ascii?Q?/PE3w0Y7zggi4wrlRyOaY1kMyxyDkU+c8z92/G+vgjbLz5W3YTX+kZiDV3fq?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6baa44-1598-4c56-c7b2-08dbe37a2ac9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2023 12:23:24.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAqVs2MlSK5PRW75g53T+RtPDoA0+1GG9MSlAsKMkY+7J9hOQkaFvxCwWxYNbY1UEF4NPtgIdlYFzjx9fGAyGx3PrYa6QbgHntuPN/Aezks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
X-Proofpoint-ORIG-GUID: e6ga6UQdrhrZsuj8e_58wETIozuPVf9h
X-Proofpoint-GUID: e6ga6UQdrhrZsuj8e_58wETIozuPVf9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_10,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311120109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 12:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190448

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit: a8bc6f041599ce8da275c163c87f155a2f09369c)
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
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
index 58b215d79c..fa949fc081 100644
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


