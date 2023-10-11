Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04D4CD6E68
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 13:26:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16449.1697030807714887261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 06:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IN+m6Sx3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86481965b1=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39B5dRra005634
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 13:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=v1N+j+MiJJAiyRzB9/
	tDQBjXV6dgWDI4v1eaDDDiEBE=; b=IN+m6Sx3hXu0Mc6qNdDte/7yBw6OYvCGE2
	v0YDGfTd1PoGgcun+d86g6XyWz9jKk1GPxMqH+IIbiurmgHIeAG8kfDCzdavzylu
	9WdxXzEr/SMA73oe3LhogZ38srIne3BmiLhS11O0odJSIWc/Gxke5IUpOdI/9X8q
	0b3z7gFCqK5mCWmQNcdf/MFkEiZwHPIAcwEsE6GG5cvVBYAHqmPWsPCkrM5/+Vhy
	RnurkymoQhXDFAZHYFCLmSHW26HRSUGlwIO9OP1dXMBBoOnOM9undK/t5xwkNt6o
	t41dtqLtixe7PFktZtjiH6YNJRFsjyh30s7XVp8HAN56sYX4dEaA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnht88f3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 13:26:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bux/dYti6LwoJ4dfwHO+nKiAXEyHQrgJRY4kuVSO4hbcSgxPtY5hNt0pJyUsFOF8ePlMI6AdAfx4K3QX1GbHqAQi05h4UxemgHdiPH+bMd79Rm41Kpmax0CcJHdOr5Ywc0PxUOSi6otu2ASprfUw1TyT6h4Xs6dnua2Mcqr/uZoxQcpObIocuwWNJVRMrMBlo5d53ZQ1GXThz/RqNiZZSHisTWgbppmzUVR3K83s4XPuhC+pyAXipmKga0/d4ByU6zdrkI2BkfL6TOjc1EvQkHtSKU7eDrSWKTTyY9UKupzhqxLf3u7uJGLpSJMlEe+S9/EWLnuRZL3VxRoGtfqWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1N+j+MiJJAiyRzB9/tDQBjXV6dgWDI4v1eaDDDiEBE=;
 b=W8Ky7dopd+lIGamKtKX5m22ifhT3p2UHlzDg9v5Kg1Dbto/L/UqjCtKl6FB56LcfyCfq75wzNu7aKM5FtYJi2IWOitzZHoYdFFsj9bAwpbVbtFKF7lQIysJ8sXfb1e/+hD3vW7+6pgvPLukTfRLyqtR7anyH3zSgr0W3W26yfrlysVRA+NH09LP9XIYN29zSjl1YKAVog5c7t789Rg/jt79aKn5s80bWVomgSIudKoHG7zjFPlI8EPblKwAQR7jdifT5sXi5hChzrXPsFc5svoFkPyWJ6q4mX7wn3mf5ieyg3t+PUVxu+F22TWnQRROQdbOtXPMlTdr2xgT4VVHg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB5678.namprd11.prod.outlook.com (2603:10b6:a03:3b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.40; Wed, 11 Oct
 2023 13:26:41 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 13:26:41 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [kirkstone][PATCH 1/2] binutils: Fix CVE-2022-44840
Date: Wed, 11 Oct 2023 06:25:49 -0700
Message-Id: <20231011132550.1977777-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::28) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: d2bc00a0-7978-412f-d509-08dbca5db495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/E1LgUnwsWLOcWMpY+DQF3yFlBVJ1UfRPpNuHYKyk6TlCn/GrP3QqpP+sSEHXLZLEspWocxXWKtw/oT/lRdCygimphUZcsSFquBIfMt8xsss/yFgogSrfQauI5tZkjIskwVgwsJE/kJr3AZ31g+yUA1S2yxguPwkqB+2E9LUGByRxu4sEZek2WDbI1yHnqnWFavrBKKETikBjI0mYdvvPUQboSqLgX2906WZtVEn+W4lj+ta1VmZ4Orm/qi/G6lemBIykyDKjYaK9xcW8Yi8rPH+xCgJtLikWgDeTzdgHe6z7HCFJH+5DKyB1IhwnMS7Fn/kPQ8OhO5VsFj9+JFxgvU1u5ih4KkHzcf6k2wAyz5NuA9kNYQBUxOtd9hYJmReQvUkgn3rQXtOWaXQeEt5M5I+oiAMMbP+yut9u3UzkLE2h46CzyQqhGqXKvEsr0QOXoFsmcwk6lG52mZ5Wt6w607FZ3dzKq+P3pFWLcaiP6huWoSaTQQ5jPubfWNW7/csfoy1nNzTfWlCspklhJnyOlTg6ndUoITBwpAjE6PjbNj+NDfCoQyUpWzKLBMQgnE0uc/04RuZcREl9/qNKV4MWNPLQKW6pRuKJMfY3le/u1EJAgitgtY1ZHOS5Uk4YhZ91TxejSwwsJEqueUC6djXfw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(396003)(136003)(346002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(107886003)(6512007)(52116002)(1076003)(9686003)(966005)(6486002)(2616005)(6506007)(26005)(83380400001)(2906002)(6916009)(66556008)(5660300002)(66946007)(66476007)(8676002)(4326008)(8936002)(41300700001)(316002)(38350700002)(36756003)(478600001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8YZlG4ci72TSMR1ig7xqjOGqw5dL+lDHfeExnHyJxroMZIWGpOIqczz0q30J?=
 =?us-ascii?Q?MtRWvqqT01w+tGfiR6cLlrpnlry15TkeUcew/YbvD3EyKiAK68aFJGS5gxAb?=
 =?us-ascii?Q?MOVg+UgZ72BvULXFhYdp9NJvesl7IreZ5dkTDmUbe9f2OrlCpRR+w5TfISxm?=
 =?us-ascii?Q?1pDfrEEHqU7A843oxM8LkmPTFcpUXikpC5UXgJLXGbrdYujmcnXjTxHITgGk?=
 =?us-ascii?Q?8uQBNRTjoagdDDQymE55kJOyYgFWtB/GwwK3qNjmSxny3Q4HT4aDxGpid2Ph?=
 =?us-ascii?Q?IPDu8AZRg8b/AzcUSf+/vrFWVMs69+tozMD+L7MjMSSn7ggmRcBEU2YRqC0E?=
 =?us-ascii?Q?X/e05UMcfgM0/uZfI5Qn/yYtMyhC347widMdtUTg/fvfJR8jS7fqTxL2J4pr?=
 =?us-ascii?Q?bGe6Aw1C/hlwyiQFiifp6TwTXVEIH6wbYu/9lRBdZ1Qqa1+yyxBxmyjiprlf?=
 =?us-ascii?Q?+qczJemkDUbGb0kTdLBTlgWZWTXVkunFE7M95/+tWlG0NKWUrkvnSo4LtZai?=
 =?us-ascii?Q?nlcWxwpgjQ+c2DLDVHxq2jpQ9PqfIvcObvw7t+y9V+ziAQBLAbSEp0KTCeK8?=
 =?us-ascii?Q?+YR1EgGbj5ubzT8F++n6UqW0WrAbXCgFBCYanSlBF3yZBSyqlRmppASliy2+?=
 =?us-ascii?Q?DLDkUI6EbRBot2ad1m0HziCMq9y43/TW+q+PGZqQdOFxRkW4t+o/hvEAINrm?=
 =?us-ascii?Q?32N+gMtsZmYxVR+XOb3U1W8cmf7MgGfyDcfAiOQaB1mn0OLb2yTMourQBrVh?=
 =?us-ascii?Q?Y1wp80ne2Et/s/2qlIbYT29AJEJK4/lztlypxfBfFPN5IW336F6FQ5IVBWf4?=
 =?us-ascii?Q?7fODa7HMibrn880yvlywCyuUPJzFhATIn1hheyuwOW4RTustMlqUPtPASD0D?=
 =?us-ascii?Q?emLR/RCmvtgzLzXlN0NjT2Q/1QRgOb8HaJ7Zop6JX8PgmktLORReYb1rI2nv?=
 =?us-ascii?Q?ypPH2Y29S7buBOY0a5RaRIG4s6uWcZvjGgRWhzwdwJaYb98aeERQpKOao5wy?=
 =?us-ascii?Q?E1hV8/ooOB73W9kE4MLHIbMm0RPPXwCZFTypmqjhHMhH2rjlRLEwS/c3DOoN?=
 =?us-ascii?Q?bjAtgDwk/5lDfEz1qrZOMkC1dG0dlURskwkagUP967kWXTpzKsw1ON5o+y66?=
 =?us-ascii?Q?t/HoG8YxNB5z/wIx3FN7Zc19cgd8I3fA1ABbDoeTRHsL6y5CfLELby0rkiQt?=
 =?us-ascii?Q?2pTSGlVBXfxvlp4mhrgLw1UY6MsbXCGTC3d4KhbqB+pvOzn+933kaVXRwMXj?=
 =?us-ascii?Q?5IWNgE8tgocgdhcvF6K5HFTM79yeS3MVYLV/SD+D9BqEnwbMPBHG4rVjRplY?=
 =?us-ascii?Q?NsuaWZcripPaQXjv0wMOej+UEThkBJp9+wPdMmQVFur9IwVaHa7jLNOWC/Td?=
 =?us-ascii?Q?XZLSKXiJc5fUQEYK62vwywXcE4Lwsk1zqjWSyuILfwVqKbUaTyUvzAA8tcur?=
 =?us-ascii?Q?6pKUR43C8v5uTK+X2Av6qj0xI1h+k4O3RmsMkOajvhKMKHPSlUYUhmkZGveb?=
 =?us-ascii?Q?USienVeaIjBKOPF69SHuFFc28p76uKUldHwsJqQSKyxWDd0cXcVexlIVdqb/?=
 =?us-ascii?Q?bywD2mKMUOz2v00g1Afz0ZOVQ2gfZpgRYAwhYObKT+m2HB9spuYFbVZ2KhKM?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bc00a0-7978-412f-d509-08dbca5db495
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 13:26:41.5599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kTFD1IDk6BafwGV4Vg08hIAQKXEoQirv3+yIp2LBM4FV81ZSfmW+3EFdzflK1VC0vQqmJ56t2nJfBQq7PygQVXY2VRFv5hl+5TOTm5WYGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5678
X-Proofpoint-GUID: 9rRYP___qOs4HGw0H0_gVkdBFx-QDmb0
X-Proofpoint-ORIG-GUID: 9rRYP___qOs4HGw0H0_gVkdBFx-QDmb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_09,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310110118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 13:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188958

From: Yash Shinde <Yash.Shinde@windriver.com>

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0030-CVE-2022-44840.patch        | 151 ++++++++++++++++++
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 638b1ba93d..7c5d8f79ec 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -59,5 +59,6 @@ SRC_URI = "\
      file://0029-CVE-2022-48065-1.patch \
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
+     file://0030-CVE-2022-44840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch b/meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch
new file mode 100644
index 0000000000..2f4c38044b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch
@@ -0,0 +1,151 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 30 Oct 2022 08:38:51 +0000 (+1030)
+Subject: Pool section entries for DWP version 1
+X-Git-Tag: gdb-13-branchpoint~664
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=28750e3b967da2207d51cbce9fc8be262817ee59
+
+Pool section entries for DWP version 1
+
+Ref: https://gcc.gnu.org/wiki/DebugFissionDWP?action=recall&rev=3
+
+Fuzzers have found a weakness in the code stashing pool section
+entries.  With random nonsensical values in the index entries (rather
+than each index pointing to its own set distinct from other sets),
+it's possible to overflow the space allocated, losing the NULL
+terminator.  Without a terminator, find_section_in_set can run off the
+end of the shndx_pool buffer.  Fix this by scanning the pool directly.
+
+binutils/
+	* dwarf.c (add_shndx_to_cu_tu_entry): Delete range check.
+	(end_cu_tu_entry): Likewise.
+	(process_cu_tu_index): Fill shndx_pool by directly scanning
+	pool, rather than indirectly from index entries.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff_plain;f=binutils/dwarf.c;h=7730293326ac1049451eb4a037ac86d827030700;hp=c6340a28906114e9df29d7401472c7dc0a98c2b1;hb=28750e3b967da2207d51cbce9fc8be262817ee59;hpb=60095ba3b8f8ba26a6389dded732fa446422c98f]
+
+CVE: CVE-2022-44840
+
+Signed-off-by: yash shinde <yash.shinde@windriver.com>
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index c6340a28906..7730293326a 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -10652,22 +10652,12 @@ prealloc_cu_tu_list (unsigned int nshndx)
+ static void
+ add_shndx_to_cu_tu_entry (unsigned int shndx)
+ {
+-  if (shndx_pool_used >= shndx_pool_size)
+-    {
+-      error (_("Internal error: out of space in the shndx pool.\n"));
+-      return;
+-    }
+   shndx_pool [shndx_pool_used++] = shndx;
+ }
+ 
+ static void
+ end_cu_tu_entry (void)
+ {
+-  if (shndx_pool_used >= shndx_pool_size)
+-    {
+-      error (_("Internal error: out of space in the shndx pool.\n"));
+-      return;
+-    }
+   shndx_pool [shndx_pool_used++] = 0;
+ }
+ 
+@@ -10773,53 +10763,55 @@ process_cu_tu_index (struct dwarf_section *section, int do_display)
+ 
+   if (version == 1)
+     {
++      unsigned char *shndx_list;
++      unsigned int shndx;
++
+       if (!do_display)
+-	prealloc_cu_tu_list ((limit - ppool) / 4);
+-      for (i = 0; i < nslots; i++)
+ 	{
+-	  unsigned char *shndx_list;
+-	  unsigned int shndx;
+-
+-	  SAFE_BYTE_GET (signature, phash, 8, limit);
+-	  if (signature != 0)
++	  prealloc_cu_tu_list ((limit - ppool) / 4);
++	  for (shndx_list = ppool + 4; shndx_list <= limit - 4; shndx_list += 4)
+ 	    {
+-	      SAFE_BYTE_GET (j, pindex, 4, limit);
+-	      shndx_list = ppool + j * 4;
+-	      /* PR 17531: file: 705e010d.  */
+-	      if (shndx_list < ppool)
+-		{
+-		  warn (_("Section index pool located before start of section\n"));
+-		  return 0;
+-		}
++	      shndx = byte_get (shndx_list, 4);
++	      add_shndx_to_cu_tu_entry (shndx);
++	    }
++	  end_cu_tu_entry ();
++	}
++      else
++	for (i = 0; i < nslots; i++)
++	  {
++	    SAFE_BYTE_GET (signature, phash, 8, limit);
++	    if (signature != 0)
++	      {
++		SAFE_BYTE_GET (j, pindex, 4, limit);
++		shndx_list = ppool + j * 4;
++		/* PR 17531: file: 705e010d.  */
++		if (shndx_list < ppool)
++		  {
++		    warn (_("Section index pool located before start of section\n"));
++		    return 0;
++		  }
+ 
+-	      if (do_display)
+ 		printf (_("  [%3d] Signature:  0x%s  Sections: "),
+ 			i, dwarf_vmatoa ("x", signature));
+-	      for (;;)
+-		{
+-		  if (shndx_list >= limit)
+-		    {
+-		      warn (_("Section %s too small for shndx pool\n"),
+-			    section->name);
+-		      return 0;
+-		    }
+-		  SAFE_BYTE_GET (shndx, shndx_list, 4, limit);
+-		  if (shndx == 0)
+-		    break;
+-		  if (do_display)
++		for (;;)
++		  {
++		    if (shndx_list >= limit)
++		      {
++			warn (_("Section %s too small for shndx pool\n"),
++			      section->name);
++			return 0;
++		      }
++		    SAFE_BYTE_GET (shndx, shndx_list, 4, limit);
++		    if (shndx == 0)
++		      break;
+ 		    printf (" %d", shndx);
+-		  else
+-		    add_shndx_to_cu_tu_entry (shndx);
+-		  shndx_list += 4;
+-		}
+-	      if (do_display)
++		    shndx_list += 4;
++		  }
+ 		printf ("\n");
+-	      else
+-		end_cu_tu_entry ();
+-	    }
+-	  phash += 8;
+-	  pindex += 4;
+-	}
++	      }
++	    phash += 8;
++	    pindex += 4;
++	  }
+     }
+   else if (version == 2)
+     {
-- 
2.39.0


