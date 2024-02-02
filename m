Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F55DC48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 12:01:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21088.1706875305834617488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 04:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Sni6T7dk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2762b925c8=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4123woTN004111
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 04:01:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=x4U8CDxNa0NRWZMqrEXlHdLswftyZRVYvWmcc7K+Yjo=; b=
	Sni6T7dkhn8WxvQzap3xkL/qhtuDeheOURxjoOlt5Omyez9TgA01xWz3Vs3S4XL+
	1tKHj1EFGj8rAzGwhQlTl0Ma8GiNthS0eXe3fLm6EWQPc1JiSTE794MkD4gtb1NI
	8XDYblHzCWMEGGxY/1D1/Rl/sQ+1zz+6PePy3CdctHYeB/hOsNMwX6q1YvfZAVzZ
	h+uWJiBAsEqZM5k+JzKE4klYJ18hWmmuq5lY2Lw7rB1MIyajermREzWuDmJj/88r
	AossHukirQDPbHKJ0+jTvKk+CkIPP8cd0NJzQBwsmzwUSbSZXDoLsbWx4LceK72m
	/GA76z72eBWowso2BgKTCw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0puv0ddx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 04:01:45 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 412C1ixK027799
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 04:01:44 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0puv0ddt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 04:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqpAT8SqfDKBurE3/qigfxD+HS9BnY5OS0lfJKhWCyf2h/qCaoF2u8Wb0cAh12csXHz071idNlWqFHWBv2r4DA8riNc2wdfEeZiLS/bu+t3qlneVBYo4o7WHqJNKcDOw/DRMUbnXnOQi8XPGc48bbwzynG8C8bI+C6BLMqSnxAWciJ0IaSyt0cQByXKsbek+mLG9dI6lH0jy3sCHfpp5Er+cqg1x3cNV9qrcP/3l9EnG3mwdSGjWbDzBLYUNAUFVJGe9xoXewL+0Ntsrqu3Xq6ztiuUt4sZQPXEKL2XLf0CRO3lG/gA3e6p9iPOW9v6BE/3WiBFv/sA4PLDBRiNn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4U8CDxNa0NRWZMqrEXlHdLswftyZRVYvWmcc7K+Yjo=;
 b=E2+63tm8455zR4qMc8A3j6dXWHBs3OBuCCOJPvGIq+1IYi9uR/DGfv0h9rfffd8GHwRwaeEm4VfInA45pT14WkoLXwDLb6hr8xBSx9itUJK0gh6hn/GQJAcdUG6r6hD2TEtcKo1SXtonVEQ/dGE5ueYUqOUn6rXffsjn3aUSjWXXbJ8wf3AvZbjUXNjw/deFDhXimVxlr/XZcI6Ixd/zNS8XTOOgYwzIm/3JlD8rCjTTIA841Det6BjzWK6jtx47WmoSi88yiBEJSJ2D1JJYK2+IOhWRchRCqfSmftGFbijWT8iHJ1y9xmbtDR8rh5uK+eA/ggEpihlzt9h3iyVwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Fri, 2 Feb
 2024 12:01:42 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260%4]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 12:01:42 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH V3 2/2] gdb: Fix CVE-2023-39130
Date: Fri,  2 Feb 2024 04:01:04 -0800
Message-ID: <20240202120104.3735837-2-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202120104.3735837-1-Deepthi.Hemraj@windriver.com>
References: <20240202120104.3735837-1-Deepthi.Hemraj@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|MN2PR11MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: 67580379-41b3-478f-e88e-08dc23e6b817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tYdK+Fn7ABB8Ujc0IeQrEidXEvSIJI4g4BHu/VpQ7fMWVF/uvZ7JF6FpkAt1va5IBLDF2mmloCv9bAwby7dvanFMmtO9J/PV+yuSI8LncZFkKapBXjEXPudYbTCQaLcAxJhCiysg2X8Nor3omRrpMomVh9QitLn6+ycsGlqonoF+zi+w6ur5dYCnsUygEQA7kH/mAFt9p6Dps1WCnRFV/eAm38bO19Ck2xvMNz3/wtx+7ZKdVO2VgTgCq93ZTjBKK6dS3TvpagR7tuoJ+CiW431loZk/Yp6wfid79n8AB7CEb6EX9UCICnGwUS2/LN1rX1hrf1eG0fToJ4uW5rR2ahszP+OeKHWHVxNdOwf9k7YF/i98wDbUVZX0EpxZn66Yc4i1VMWsciUVYO9TsZbN6cJa6QFnYhzFv94XwKLJ3U30u8pxFagAiHKb3TaNP1S6wZ9c9LPIiYStrlaCIJLcZT8yua73+iD1iypYsRDGAh9QvXv7nbhzmZoNYjIGpWu6cISU2yl8YLCRjXqE4CFBZzteJpAN21Sewnxn8yPDb+V2Dfz09HxzhEVzMQ1gDJaBMBXheK3FDNsko1xIFY03jn6vQ2/O/0UOj6Q4G5yAms2C1bRuUml89mqjUVi1qleevbDaVxuWr5x8/wmWk3wXxg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39850400004)(366004)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(86362001)(8676002)(8936002)(4326008)(9686003)(6512007)(30864003)(2906002)(2616005)(26005)(5660300002)(1076003)(41300700001)(66946007)(66556008)(478600001)(6486002)(66476007)(6666004)(38350700005)(6506007)(52116002)(316002)(6916009)(36756003)(38100700002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eWuinNz1OUCQS+mdybLbWpun25K31KDcyMh/nuFTNxm2Vf4gCGtWZWnyNmQ8?=
 =?us-ascii?Q?uDS0m9UHno8jzck7FtPQxfsM4ymdqQbC3NnK8sLgzu/LwWQSXvRdakWQSXDd?=
 =?us-ascii?Q?T4uSgOVc85SzEJbrDyFkzxzvg9FBHzulyNF6F0B8I6/0LljfuvWFPounP1x6?=
 =?us-ascii?Q?//8aE/YtNTZmxR0t04K5p/eszz99e3XLNWzYGa9JKUrx7gcWXJ0b4sY5TA7x?=
 =?us-ascii?Q?G06KgpVZR0yWGfz02ZfDoTocQSvFoP0RuDQT1GLjGboVxk/zOrpeP0LZWN1n?=
 =?us-ascii?Q?/4M3HufcT1jegbg06sx8JMwG3FiKjqgR4zlcrm2k5j/Je2yfOLVSkqq+1i/u?=
 =?us-ascii?Q?k1HVPLBuYD8L68eeY1XReRwlMAmCBJ//MOam5Yd/w6gDL6mfirs1muADnH6p?=
 =?us-ascii?Q?CJZ159OGWdMax3d9kki13xYBYlJ04kUzVIEGO9EeOBh80tY8wLiUpBmsUO5q?=
 =?us-ascii?Q?Q/gYUVAhfaAEPH8IqkTbztGvwY+FHJGc0gdBi+xsfSoT9f+QWYdIuiuBvqyz?=
 =?us-ascii?Q?fmfAFy22Z16VLnJFO6FwACaTHgdxtWWHFq4oC4Yguv/0KGIfkXFBTrYSppOE?=
 =?us-ascii?Q?qlu6u+5F6JTYaOfXvSInx+r8Gl6tqLi+LetXya49EgwDugVH0loktA6jJPzt?=
 =?us-ascii?Q?zG9nr1JH12VLNE8XnDdCFDS5sJ7QQEVgdO6niDXPebbAzStwZRytlKNAG7nP?=
 =?us-ascii?Q?o2sLicfeZJGbMmajE0xKE91C/S94bdPnD+vdJor/+SdawiGa59EtdICOi0o7?=
 =?us-ascii?Q?4RWYQ4HgO2qCgtzc2uzqXpxQbsnRydbf8O0Men1KKgMxV846RLcv8Qd43+O5?=
 =?us-ascii?Q?NYhjXaEo89UB4cKPFBlGaE8GwBNZd9w3sHnkiQRte5CLbM97+2GThMuGbWV3?=
 =?us-ascii?Q?QFGAAZfnfTtCtQ42l46MAhBF5vI/5qBB+jWH0TXrzm0HLxg6Wero7Y/vfLob?=
 =?us-ascii?Q?6Y2DSXoXR3BkrMtsulBa7khjI6FvnF9Ldqb23lrILZCjV202RCbBNHCnI+2C?=
 =?us-ascii?Q?9ezGBaSCAyDTlpusE8AALikRxX5QvKzLrr0TG4sLFhm7BHX6s7Rfbs8f3ls/?=
 =?us-ascii?Q?B+9u+itAolz5a23vKOl+4tJZLr1WiNsn3RMDhVjE9MOMXmuMJIUvHwXhZRLl?=
 =?us-ascii?Q?KeP1uTLZDMNeeQ41jUPspgCEYzD3910tX9WwgV/Una6kZNBQJla+uy0bZacL?=
 =?us-ascii?Q?CkK+3aOYL762Q9QJj8h2Exohuq+zLydlIsg7SEIwr3U0E1kYec5SAdPaEkgw?=
 =?us-ascii?Q?QN52kamoxGsXoq43/f9cpju9Hx5JsjduTMIfBcAl+vgi4+NRORFq7wRLyzNM?=
 =?us-ascii?Q?69abkGf4DIpUvM41U3e/tlQsatwh7DUJ2ZAdoxdO4YAI1gIvUZvDxnpyIn9P?=
 =?us-ascii?Q?TJW2THoqAo8jYQVpBRcY2JfXNxyfojBLX/fB+icTJl+SRuJ5veYQZpW48Ng7?=
 =?us-ascii?Q?Oh39ZciIoi9EkT4M933bCdb54bSnr7virS0LKNFzzKgGv8GSuDfubSBktgG6?=
 =?us-ascii?Q?XL1RhuqbuAjgcvc9nU5xN3iXXllSz/AlmLvcSn6fP+b3LHW/kK1174VvOObg?=
 =?us-ascii?Q?be9X4VJLpMDLwQVXHEDR0kBw+1h1ZgcqkEEQjNdIYlTF+wfu+PNPYWySPwRA?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67580379-41b3-478f-e88e-08dc23e6b817
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 12:01:41.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xtm0Fk7PG/LG89iPm9CerAtlQjTmmDdNOR7CMR+s7cJz7ZmtOv131EKsYUPeDhgBeDB/zA9KcYjJiVSKdCggDWzOHu8UV49+e7S1qp/lu30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
X-Proofpoint-GUID: EQcBNgyMBLRc133QMNSTP3vbE51G1iw6
X-Proofpoint-ORIG-GUID: 4XOauoh64njT3FVeGv9vPISV6tGiP_NB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_06,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 12:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194788

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Issue: LIN1022-4855

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 .../gdb/gdb/0013-CVE-2023-39130.patch         | 326 ++++++++++++++++++
 2 files changed, 327 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index ad2b3ad4b7..6c9fe60cab 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -16,5 +16,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0010-gdbserver-ctrl-c-handling.patch \
            file://0011-CVE-2023-39128.patch \
 	   file://0012-CVE-2023-39129.patch \
+	   file://0013-CVE-2023-39130.patch \
            "
 SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
new file mode 100644
index 0000000000..bfd5b18d7d
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
@@ -0,0 +1,326 @@
+From 2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 9 Aug 2023 09:58:36 +0930
+Subject: [PATCH] gdb: warn unused result for bfd IO functions
+
+This fixes the compilation warnings introduced by my bfdio.c patch.
+
+The removed bfd_seeks in coff_symfile_read date back to 1994, commit
+7f4c859520, prior to which the file used stdio rather than bfd to read
+symbols.  Since it now uses bfd to read the file there should be no
+need to synchronise to bfd's idea of the file position.  I also fixed
+a potential uninitialised memory access.
+
+Approved-By: Andrew Burgess <aburgess@redhat.com>
+
+Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80]
+CVE: CVE-2023-39130
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+ gdb/coff-pe-read.c | 114 +++++++++++++++++++++++++++++----------------
+ gdb/coffread.c     |  27 ++---------
+ gdb/dbxread.c      |   7 +--
+ gdb/xcoffread.c    |   5 +-
+ 4 files changed, 85 insertions(+), 68 deletions(-)
+
+diff --git a/gdb/coff-pe-read.c b/gdb/coff-pe-read.c
+--- a/gdb/coff-pe-read.c
++++ b/gdb/coff-pe-read.c
+@@ -291,23 +291,31 @@ read_pe_truncate_name (char *dll_name)
+ 
+ /* Low-level support functions, direct from the ld module pe-dll.c.  */
+ static unsigned int
+-pe_get16 (bfd *abfd, int where)
++pe_get16 (bfd *abfd, int where, bool *fail)
+ {
+   unsigned char b[2];
+ 
+-  bfd_seek (abfd, (file_ptr) where, SEEK_SET);
+-  bfd_bread (b, (bfd_size_type) 2, abfd);
++  if (bfd_seek (abfd, where, SEEK_SET) != 0
++      || bfd_bread (b, 2, abfd) != 2)
++    {
++      *fail = true;
++      return 0;
++    }
+   return b[0] + (b[1] << 8);
+ }
+ 
+ static unsigned int
+-pe_get32 (bfd *abfd, int where)
++pe_get32 (bfd *abfd, int where, bool *fail)
+ {
+   unsigned char b[4];
+ 
+-  bfd_seek (abfd, (file_ptr) where, SEEK_SET);
+-  bfd_bread (b, (bfd_size_type) 4, abfd);
+-  return b[0] + (b[1] << 8) + (b[2] << 16) + (b[3] << 24);
++  if (bfd_seek (abfd, where, SEEK_SET) != 0
++      || bfd_bread (b, 4, abfd) != 4)
++    {
++      *fail = true;
++      return 0;
++    }
++  return b[0] + (b[1] << 8) + (b[2] << 16) + ((unsigned) b[3] << 24);
+ }
+ 
+ static unsigned int
+@@ -323,7 +331,7 @@ pe_as32 (void *ptr)
+ {
+   unsigned char *b = (unsigned char *) ptr;
+ 
+-  return b[0] + (b[1] << 8) + (b[2] << 16) + (b[3] << 24);
++  return b[0] + (b[1] << 8) + (b[2] << 16) + ((unsigned) b[3] << 24);
+ }
+ 
+ /* Read the (non-debug) export symbol table from a portable
+@@ -376,37 +384,50 @@ read_pe_exported_syms (minimal_symbol_re
+ 	     || strcmp (target, "pei-i386") == 0
+ 	     || strcmp (target, "pe-arm-wince-little") == 0
+ 	     || strcmp (target, "pei-arm-wince-little") == 0);
++
++  /* Possibly print a debug message about DLL not having a valid format.  */
++  auto maybe_print_debug_msg = [&] () -> void {
++    if (debug_coff_pe_read)
++      fprintf_unfiltered (gdb_stdlog, _("%s doesn't appear to be a DLL\n"),
++					bfd_get_filename (dll));
++  };
++
+   if (!is_pe32 && !is_pe64)
+-    {
+-      /* This is not a recognized PE format file.  Abort now, because
+-	 the code is untested on anything else.  *FIXME* test on
+-	 further architectures and loosen or remove this test.  */
+-      return;
+-    }
++    return maybe_print_debug_msg ();
+ 
+   /* Get pe_header, optional header and numbers of export entries.  */
+-  pe_header_offset = pe_get32 (dll, 0x3c);
++  bool fail = false;
++  pe_header_offset = pe_get32 (dll, 0x3c, &fail);
++  if (fail)
++    return maybe_print_debug_msg ();
+   opthdr_ofs = pe_header_offset + 4 + 20;
+   if (is_pe64)
+-    num_entries = pe_get32 (dll, opthdr_ofs + 108);
++    num_entries = pe_get32 (dll, opthdr_ofs + 108, &fail);
+   else
+-    num_entries = pe_get32 (dll, opthdr_ofs + 92);
++    num_entries = pe_get32 (dll, opthdr_ofs + 92, &fail);
++  if (fail)
++    return maybe_print_debug_msg ();
+ 
+   if (num_entries < 1)		/* No exports.  */
+     return;
+   if (is_pe64)
+     {
+-      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 112);
+-      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 116);
++      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 112, &fail);
++      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 116, &fail);
+     }
+   else
+     {
+-      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 96);
+-      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 100);
++      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 96, &fail);
++      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 100, &fail);
+     }
+-  nsections = pe_get16 (dll, pe_header_offset + 4 + 2);
++  if (fail)
++    return maybe_print_debug_msg ();
++
++  nsections = pe_get16 (dll, pe_header_offset + 4 + 2, &fail);
+   secptr = (pe_header_offset + 4 + 20 +
+-	    pe_get16 (dll, pe_header_offset + 4 + 16));
++	    pe_get16 (dll, pe_header_offset + 4 + 16, &fail));
++  if (fail)
++    return maybe_print_debug_msg ();
+   expptr = 0;
+   export_size = 0;
+ 
+@@ -415,12 +436,13 @@ read_pe_exported_syms (minimal_symbol_re
+     {
+       char sname[8];
+       unsigned long secptr1 = secptr + 40 * i;
+-      unsigned long vaddr = pe_get32 (dll, secptr1 + 12);
+-      unsigned long vsize = pe_get32 (dll, secptr1 + 16);
+-      unsigned long fptr = pe_get32 (dll, secptr1 + 20);
+-
+-      bfd_seek (dll, (file_ptr) secptr1, SEEK_SET);
+-      bfd_bread (sname, (bfd_size_type) sizeof (sname), dll);
++      unsigned long vaddr = pe_get32 (dll, secptr1 + 12, &fail);
++      unsigned long vsize = pe_get32 (dll, secptr1 + 16, &fail);
++      unsigned long fptr = pe_get32 (dll, secptr1 + 20, &fail);
++
++      if (fail
++	  || bfd_seek (dll, secptr1, SEEK_SET) != 0
++	  || bfd_bread (sname, sizeof (sname), dll) != sizeof (sname))
+ 
+       if ((strcmp (sname, ".edata") == 0)
+ 	  || (vaddr <= export_opthdrrva && export_opthdrrva < vaddr + vsize))
+@@ -461,16 +483,18 @@ read_pe_exported_syms (minimal_symbol_re
+   for (i = 0; i < nsections; i++)
+     {
+       unsigned long secptr1 = secptr + 40 * i;
+-      unsigned long vsize = pe_get32 (dll, secptr1 + 8);
+-      unsigned long vaddr = pe_get32 (dll, secptr1 + 12);
+-      unsigned long characteristics = pe_get32 (dll, secptr1 + 36);
++      unsigned long vsize = pe_get32 (dll, secptr1 + 8, &fail);
++      unsigned long vaddr = pe_get32 (dll, secptr1 + 12, &fail);
++      unsigned long characteristics = pe_get32 (dll, secptr1 + 36, &fail);
+       char sec_name[SCNNMLEN + 1];
+       int sectix;
+       unsigned int bfd_section_index;
+       asection *section;
+ 
+-      bfd_seek (dll, (file_ptr) secptr1 + 0, SEEK_SET);
+-      bfd_bread (sec_name, (bfd_size_type) SCNNMLEN, dll);
++      if (fail
++	  || bfd_seek (dll, secptr1 + 0, SEEK_SET) != 0
++	  || bfd_bread (sec_name, SCNNMLEN, dll) != SCNNMLEN)
++	return maybe_print_debug_msg ();
+       sec_name[SCNNMLEN] = '\0';
+ 
+       sectix = read_pe_section_index (sec_name);
+@@ -509,8 +533,9 @@ read_pe_exported_syms (minimal_symbol_re
+   gdb::def_vector<unsigned char> expdata_storage (export_size);
+   expdata = expdata_storage.data ();
+ 
+-  bfd_seek (dll, (file_ptr) expptr, SEEK_SET);
+-  bfd_bread (expdata, (bfd_size_type) export_size, dll);
++  if (bfd_seek (dll, expptr, SEEK_SET) != 0
++      || bfd_bread (expdata, export_size, dll) != export_size)
++    return maybe_print_debug_msg ();
+   erva = expdata - export_rva;
+ 
+   nexp = pe_as32 (expdata + 24);
+@@ -658,20 +683,27 @@ pe_text_section_offset (struct bfd *abfd
+     }
+ 
+   /* Get pe_header, optional header and numbers of sections.  */
+-  pe_header_offset = pe_get32 (abfd, 0x3c);
+-  nsections = pe_get16 (abfd, pe_header_offset + 4 + 2);
++  bool fail = false;
++  pe_header_offset = pe_get32 (abfd, 0x3c, &fail);
++  if (fail)
++    return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
++  nsections = pe_get16 (abfd, pe_header_offset + 4 + 2, &fail);
+   secptr = (pe_header_offset + 4 + 20 +
+-	    pe_get16 (abfd, pe_header_offset + 4 + 16));
++	    pe_get16 (abfd, pe_header_offset + 4 + 16, &fail));
++  if (fail)
++    return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
+ 
+   /* Get the rva and size of the export section.  */
+   for (i = 0; i < nsections; i++)
+     {
+       char sname[SCNNMLEN + 1];
+       unsigned long secptr1 = secptr + 40 * i;
+-      unsigned long vaddr = pe_get32 (abfd, secptr1 + 12);
++      unsigned long vaddr = pe_get32 (abfd, secptr1 + 12, &fail);
+ 
+-      bfd_seek (abfd, (file_ptr) secptr1, SEEK_SET);
+-      bfd_bread (sname, (bfd_size_type) SCNNMLEN, abfd);
++      if (fail
++	  || bfd_seek (abfd, secptr1, SEEK_SET) != 0
++	  || bfd_bread (sname, SCNNMLEN, abfd) != SCNNMLEN)
++	return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
+       sname[SCNNMLEN] = '\0';
+       if (strcmp (sname, ".text") == 0)
+ 	return vaddr;
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -690,8 +690,6 @@ coff_symfile_read (struct objfile *objfi
+ 
+       /* FIXME: dubious.  Why can't we use something normal like
+ 	 bfd_get_section_contents?  */
+-      bfd_seek (abfd, abfd->where, 0);
+-
+       stabstrsize = bfd_section_size (info->stabstrsect);
+ 
+       coffstab_build_psymtabs (objfile,
+@@ -780,22 +778,6 @@ coff_symtab_read (minimal_symbol_reader
+ 
+   scoped_free_pendings free_pending;
+ 
+-  /* Work around a stdio bug in SunOS4.1.1 (this makes me nervous....
+-     it's hard to know I've really worked around it.  The fix should
+-     be harmless, anyway).  The symptom of the bug is that the first
+-     fread (in read_one_sym), will (in my example) actually get data
+-     from file offset 268, when the fseek was to 264 (and ftell shows
+-     264).  This causes all hell to break loose.  I was unable to
+-     reproduce this on a short test program which operated on the same
+-     file, performing (I think) the same sequence of operations.
+-
+-     It stopped happening when I put in this (former) rewind().
+-
+-     FIXME: Find out if this has been reported to Sun, whether it has
+-     been fixed in a later release, etc.  */
+-
+-  bfd_seek (objfile->obfd, 0, 0);
+-
+   /* Position to read the symbol table.  */
+   val = bfd_seek (objfile->obfd, symtab_offset, 0);
+   if (val < 0)
+@@ -1285,12 +1267,13 @@ init_stringtab (bfd *abfd, file_ptr offs
+   if (bfd_seek (abfd, offset, 0) < 0)
+     return -1;
+ 
+-  val = bfd_bread ((char *) lengthbuf, sizeof lengthbuf, abfd);
+-  length = bfd_h_get_32 (symfile_bfd, lengthbuf);
+-
++  val = bfd_bread (lengthbuf, sizeof lengthbuf, abfd);
+   /* If no string table is needed, then the file may end immediately
+      after the symbols.  Just return with `stringtab' set to null.  */
+-  if (val != sizeof lengthbuf || length < sizeof lengthbuf)
++  if (val != sizeof lengthbuf)
++    return 0;
++  length = bfd_h_get_32 (symfile_bfd, lengthbuf);
++  if (length < sizeof lengthbuf)
+     return 0;
+ 
+   storage->reset ((char *) xmalloc (length));
+diff --git a/gdb/dbxread.c b/gdb/dbxread.c
+--- a/gdb/dbxread.c
++++ b/gdb/dbxread.c
+@@ -812,7 +812,8 @@ stabs_seek (int sym_offset)
+       symbuf_left -= sym_offset;
+     }
+   else
+-    bfd_seek (symfile_bfd, sym_offset, SEEK_CUR);
++    if (bfd_seek (symfile_bfd, sym_offset, SEEK_CUR) != 0)
++      perror_with_name (bfd_get_filename (symfile_bfd));
+ }
+ 
+ #define INTERNALIZE_SYMBOL(intern, extern, abfd)			\
+@@ -2095,8 +2096,8 @@ dbx_expand_psymtab (legacy_psymtab *pst,
+       symbol_size = SYMBOL_SIZE (pst);
+ 
+       /* Read in this file's symbols.  */
+-      bfd_seek (objfile->obfd, SYMBOL_OFFSET (pst), SEEK_SET);
+-      read_ofile_symtab (objfile, pst);
++      if (bfd_seek (objfile->obfd, SYMBOL_OFFSET (pst), SEEK_SET) == 0)
++	read_ofile_symtab (objfile, pst);
+     }
+ 
+   pst->readin = true;
+diff --git a/gdb/xcoffread.c b/gdb/xcoffread.c
+--- a/gdb/xcoffread.c
++++ b/gdb/xcoffread.c
+@@ -865,8 +865,9 @@ enter_line_range (struct subfile *subfil
+ 
+   while (curoffset <= limit_offset)
+     {
+-      bfd_seek (abfd, curoffset, SEEK_SET);
+-      bfd_bread (ext_lnno, linesz, abfd);
++      if (bfd_seek (abfd, curoffset, SEEK_SET) != 0
++	  || bfd_bread (ext_lnno, linesz, abfd) != linesz)
++	return;
+       bfd_coff_swap_lineno_in (abfd, ext_lnno, &int_lnno);
+ 
+       /* Find the address this line represents.  */
+-- 
+2.39.3
-- 
2.43.0


