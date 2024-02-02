Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85190C47DB3
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 12:08:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21173.1706875681815538996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 04:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XWYx+vtu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2762b925c8=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4125P6CP007365
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 12:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=RA9w2vjFlA1KKmRKeBX2TQuMiMOH44zZB6jYnj+Apo4=; b=
	XWYx+vtuoiCCKlr1iumOye2tDGfChd4Tq2g3eDFB4kNgQndxxhVy1jbgHX6Eeh4g
	KzkJBUQo+pZNN2LT0LkRu07FVXDngv9XUPvYXZ3amtrqFd+Q708F+IyujM1LuJ1I
	/MGmuXg3tcV2gvYPQ3+bUYtaV4UPJc+GYFqOEp6VAYHCy0QSnds85JNRW4AQpun4
	MBpubE48tIqBC/Zyvj19flzRZnwUox1xmS6XFfOo7Ai9MP0NM2tDWxH9OEHL0Ikx
	9zFAENGDdTCxufFRA0MbS3woSan99p42UiEMK75Nz61OO59YeWwm9SByCPa/VjKG
	iQbPyZw2CwwsMTbUuOGgWg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvg0da5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 12:08:00 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 412C800W030009
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 12:08:00 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvg0da1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 12:08:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOXLydGCfUiFHPPvWG+ZwVwcbAdCpsw+XxzwQUW24GcxL7C5EUGy6BIx+XExqNnIMUsYZjZpdYJQQVAli6QUs3chbqX2SnhJvCr8J2BkcliqH+bz+nDJy/cqBORGdLMmTtsbWJLCNC27f58H7Yb/vUdAlQZCt4BstZjeto0V5qD3SifKVFWQOyBZ9oNb2WzI0oiXmoBnhUBAz7xiI/fX4FSKlhkmnPfRWDr71WfSt8+ZGvbzydsPia4YYxIaddOWdVSKz6Ex/V0frOjNSSB4isGAbqpQFyiPTDu8550g6QJs5Fm+7E9hFMI4IxchRHOnLTdT2Ox7Vw8mydmEP4vlng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA9w2vjFlA1KKmRKeBX2TQuMiMOH44zZB6jYnj+Apo4=;
 b=QEs7ez389habrDAhiXItasbledIbmOsSCsrlbzdCHZWp9PF2DHzMuBttZnSOWZAF2lqLcN+FMcUsvnNS+i9vtKDOOGDz9t56RptMygat8yKoOFuMmnMFsye9T8LFki6WiTbysT3Fqj+Porm4hbKxwtqi6mfFWf5ZN5RSHjZOMQoYo969V2/w4RaFJPBnC5YQ+FtpamAAe1pYbGZo1gt984hEnLsaBL7BwNai52kPMTisutKgasrVHjIr4EQyxfxnnzOk9CXQPFJUBK0Imzgst4dNJaG1XMXNovz6fjFawOZ/YLObbC8WmgQqn4ysmIvcq03zUYWHF/K3Qh7SvRJQiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by DS0PR11MB7359.namprd11.prod.outlook.com (2603:10b6:8:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Fri, 2 Feb
 2024 12:07:57 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260%4]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 12:07:57 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH V3 2/2] gdb: Fix CVE-2023-39130
Date: Fri,  2 Feb 2024 04:07:35 -0800
Message-ID: <20240202120735.3742584-2-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202120735.3742584-1-Deepthi.Hemraj@windriver.com>
References: <20240202120735.3742584-1-Deepthi.Hemraj@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0032.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::45) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|DS0PR11MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 729a6cb3-a27d-4373-96e8-08dc23e7981d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LBmyo/U/PXgcdNzcorK3uNc3Hmb1ARBMzTKmmesPW9EcQyKn1FRzEWv6dNGGK5yG/rR+XXmPwjgIYKdLquAGuJFrc4QYeu/iz4zduWTxHgSbv/EqZOGxlpguf2JlUkKGGkk8NG4gUf0moOSJHwEHsP9mCeNNgM5HiKesQn9Q7PDRwgtzXWPM8adqdaU/mT19T8uwto2IlZLj821PIXw9J4ooVQIE+A0be539tqNjeJDzHn7GmdIcksphONGZvVbvPASmWv4pJLjHRJeXOQPvcxjsm07dh80sc+FOwh4cGoqxBBknBEw+l+YYrMvjXhUVvMN49cR92mWbdW+pGhN63h7c9qWKkZyzoy+GV4zWCpt8zV6S5gmpl1JiJGvGsVddydGyGK1lKbEoXGXeyCmWq11KzwhU1t6lNXPco2X+7XNN2gY51csB8OdHMum8RiYWp8j8WIKACv1sP6gidHiQkXemwxmtL56rfnUEKKXMzT6MFoA3ujRsWVt1292oj8CPwyRmMT8Z9d9mqo5xmlf3oB0i1n4yxbGTJ7SHhr2K9XNhwlZOogL0FGF1Xrxi/M3lh+HdBhizOdlUcd+zyfWzQefP2JXRoYSkRX9n8gByZCiPIcYwWBitztxXbi5J4dwHFPr1Wb/hhz+A0w4hSOqhig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(136003)(346002)(376002)(366004)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(66556008)(316002)(6916009)(66946007)(66476007)(4326008)(8936002)(6486002)(86362001)(478600001)(8676002)(36756003)(30864003)(5660300002)(2906002)(38350700005)(41300700001)(83380400001)(2616005)(26005)(1076003)(38100700002)(52116002)(6506007)(9686003)(6666004)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z82k7FKyLttvW7Pm30EPxEN/Lptd9HdsvO2kQHbTs2dBnrlj0MKE6N3h3Qiy?=
 =?us-ascii?Q?T0Ha5tH87i2Ch0jrXuM8dMF+b8nVfBZal/CVtlLk3EEPBhRDsFpVDk3Qdos8?=
 =?us-ascii?Q?SaxHECUNacKIRbzvkLgCyZiQJK8HftzAbeYvw3/dr8XdsdQc9G/AzfyNp0jy?=
 =?us-ascii?Q?Z0FMyRALuexwT+E2EJGJEyY3JMqZj60zGT7BqYvKDUXYmgOyWflc1hMYU0OJ?=
 =?us-ascii?Q?MKOGiN/ANTr7mAioWa7AJhFcdOnQ9GP9coLbpqm9z9ZktAc2hsYmZuOTXIqU?=
 =?us-ascii?Q?asJNaFI1/oqMuuZJOflbXVcdzMn0OxhKD6GYEKM7Tqqx9lfL05jTv2Axwdsm?=
 =?us-ascii?Q?zKX5ymAdNUtIOpfYQs25yEflw9cDqrZZ+O/7B4CXHpl3Hg+iMRr9dZEVAFih?=
 =?us-ascii?Q?Z9dp+aJM0mpvbnfB5H/QteNgzna1DGpIvCWEVNKrfByE+oVICnavcRixvAad?=
 =?us-ascii?Q?tWXshDXvBwpf2fayUZ4Van1PQDrzcq2W3wUB9vlfiZkN/ky3zy7lLVoB3F62?=
 =?us-ascii?Q?FBz5E1CLT7F/KB91K/kadFoCqw4yyFOo3xpierJcw1Wew8ySASbT3Q4dPKVz?=
 =?us-ascii?Q?hiVB6hA5puSiZOtCGXYAUPCmWbb0Cxji86y2ItgVSYqDl9NeQ5FweQWa9ZbD?=
 =?us-ascii?Q?upPi9ldqJkxgL0BMC7fzKwq+PAOaQmcd1r5FDifpPDos4MXZbVnsYEV07s/C?=
 =?us-ascii?Q?FmKy7I51CXU/5OkV0YCD9yClbLkqdi/LCxmGMEQzw/2nQ/W76hiQy+sivfTd?=
 =?us-ascii?Q?gjxwI3wYmQwnsesUw+VqeNYCBgeNSt7VI28kW56i3XmqTqkiLF8HCk60K/jm?=
 =?us-ascii?Q?Z6wI6Q3+HRBMdrGbr2YP+CRJod9KNy4hX1Hiclj6pL9r0DFN93aYCU9DnMRM?=
 =?us-ascii?Q?giQhL/PG9qmTYmAeRxkNOTyxO9JzK++Hq3glQDIJvyhzE5x17joHjkicVNTk?=
 =?us-ascii?Q?wTJMtv+MaeywfbDylE8o0d7jVBP/QYaO2VRwcFU71OvuIJTQ9Dw7a9Z2aV7Z?=
 =?us-ascii?Q?ARHJxD997Mrn/M5I+V+Q3cSuR2Ha7BTp2Z5zoVfFvhMFt8I7pp7l5Z7stgpB?=
 =?us-ascii?Q?AY1uJe0Eng9xVIQeyLsoz7x1bh/czzRj+aslbBZFRjLSfDeoCRgbgPQzLm6s?=
 =?us-ascii?Q?K03RWbjnDojBUinDBrq3wYZon+v6mVtzTywnKh0Al2hBos9DPax9vmKHF3FL?=
 =?us-ascii?Q?xyrt3qLTdyu+b91p8TR+BGPRFC57XOMEDTGNAEnmoiD3GzcvJvs3P8mWkyb7?=
 =?us-ascii?Q?qTaXRz3Fz2hI+L6bPaCRYFaGMZQ7lFXdKPu/+o4eANLYxVZSpCIZtbZRu8yv?=
 =?us-ascii?Q?iryokrJekTpyDUVhz388ibvF23GSrOnWawQOpZmEw0YRVrk8K+8GMSn0M8Ro?=
 =?us-ascii?Q?m4xiCrTUcA2TxW/NQnmPspOGsa8ql3TvjfuJX/0bEar3OQ8nOO7apViiOKav?=
 =?us-ascii?Q?/J2wasPmIIfMBGjUxPn5+fjCQd1jqte7AWaKGdfSD+qSo2MczSheMbofCSfp?=
 =?us-ascii?Q?2IGRc/MEv2XJsDu/yUvyf8pbq7nJCXQ3PttIESuIizso1saLCoEKHfR70dsQ?=
 =?us-ascii?Q?a2n3ANspd2yD0SnfOlQ8NGRI3cGpxApDcMubjfPzeK7N/h6YoxDMaiCKgS2e?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729a6cb3-a27d-4373-96e8-08dc23e7981d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 12:07:57.7478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MriQLggRBAgSMTstIGSU0q9EcWJp+pyn6pFI+Y1a8qdn3RBh5P95zOUUNOYmEE68DIH+i+AJRbCQv1e9GoRSuXGIc/Qt4oqpMeSCvFPy1c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7359
X-Proofpoint-GUID: CAI_566ggmxv1FsvubLj0QFQhAfPCQes
X-Proofpoint-ORIG-GUID: lP_Bs2plGWh_FOQO6g6OaBNt6aZIBAzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_06,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 12:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194790

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Issue: LIN1022-4855

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0036-CVE-2023-39130.patch        | 326 ++++++++++++++++++
 2 files changed, 327 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0036-CVE-2023-39130.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 83dff20855..bbe7bb57b2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -70,5 +70,6 @@ SRC_URI = "\
      file://0033-CVE-2022-47007.patch \
      file://0034-CVE-2022-48064.patch \
      file://0035-CVE-2023-39129.patch \
+     file://0036-CVE-2023-39130.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0036-CVE-2023-39130.patch b/meta/recipes-devtools/binutils/binutils/0036-CVE-2023-39130.patch
new file mode 100644
index 0000000000..bfd5b18d7d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0036-CVE-2023-39130.patch
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


