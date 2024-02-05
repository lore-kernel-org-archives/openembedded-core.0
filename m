Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3049C48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:31:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.61758.1707136306124919131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qelf5bBP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2765d7cc0f=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4156nVkI017579
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 04:31:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=BlXpwAvzTsFMvjXZm2nuzjEaSgQp9REBUcKWkKlB6TQ=; b=
	Qelf5bBP4ImZktHsfBMmEEQEpCM9JrR0EmS5WfLqlm64VqtFqABKp2f8x2aGKbmf
	LXCR429hNjFwS2CAw0CTYHulAoUFCi7H8Jd9ZBIUNcl3F85YIF19J+r7jFq0FaYz
	G5XpbK96PcFyMndsBzR9xdvo8XYxJzh0+rrg1zUOBPoyCSQI/fxzc1NnBvI1sDyf
	GAFA4OJN+2ZFphf5vtGuA9xRdQ6+ESQX5vvBvXXbwKMNK4JdzcZ41wwPqv+QCmid
	+IJ29giLTRv9jJMcJgw8FX8l4YB5v2BCQzazFXyQoRu8oviBU95KlZ2k7ogk9oR4
	aTokSaZno7uNtdjF3Xqg1A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm1e8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 04:31:45 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 415CVgHf032740
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 04:31:45 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm1e8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 04:31:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fu1DBaQeC90npVpKUrLSEX849hElYa7tB6hvGhhKPd09U5NfjBtJqZqYAVWXYkQ/QwFzQVTZ5klUkYyIWI9yagUUjA+XFERUu6/TYQ5ci9AGcpZRpxCYkOGboaWsy4gd3QA2hb9SoSVHq3qUQaKbYnKD1Q/l7aVgOhDLjL+ksPcSN+dE1ywRMcc87h2R3BNGxBPdSDuI6Hkb0KQdaMNCEVjMh0AcLys4ek9N+rWwA02KQ/LX1xCyUriFebJYEdHAzfxLaTH1jPcvYcV5ClLZp895icx95mqKSt2WaOU2uedhUfItQQ6cqMXOO0+6UcpuC89iTRB+oTqF4ZmT3fcdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlXpwAvzTsFMvjXZm2nuzjEaSgQp9REBUcKWkKlB6TQ=;
 b=Qy2+2tMJQOseG40Km0STKU71t8BBbToq7ZgL6fgSh1MHEUSsbfgFuQKWWUjNEi5T5d7KYp6UvMbkSf8G00V2Cm1xfxXg6Sl5iWBBT69K2f17cT5NhYmr0ndIH4Or6zcitUvW4pzkXd0gAwNdirMMm30cOkhacLTjEy6ArZtZbSl9uN1IKUEtJJeMG0FauebcJFt9zvHR7jgDwZfkq5FpjaV/q57tW1MyXgbr82Kno5zK92b67myBmb1BNfnqTkLHPhFZ95KlwJsFDwow8R0tornEISfIKi0Ccc0bCUJuQjgvepTR2IPOKAuoS4qJlT4kdhR3aL1q4hWfheQUH7IP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by BL1PR11MB5511.namprd11.prod.outlook.com (2603:10b6:208:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 12:31:42 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 12:31:42 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH V4 2/2] gdb: Fix CVE-2023-39130
Date: Mon,  5 Feb 2024 04:31:10 -0800
Message-ID: <20240205123110.1898532-2-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205123110.1898532-1-Deepthi.Hemraj@windriver.com>
References: <20240205123110.1898532-1-Deepthi.Hemraj@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|BL1PR11MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 7257b19b-6b73-4d95-8ede-08dc264668ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NY/HedHlZhncoA6c6WwrAx9VF2c6KRaJETeZ7zxGvp+wHxMh9xQG5jmGjiZexu5e/I4Rp1D1KH1Twrj17u8oY5sSrNhItWUEYGnnHw+T4KmEelCkfyPJq70xZznvJp/LD3RgIvOmR4x2fStt3IMUTryjjJit76mlSNY4/kFfMc75Dwc3VlMlWljsMQEiarGnQ/Txrlilu5Znd7J+hKZA1gOaS5aQUGhf6ucc+xVEZ0v2HKzVeA71ORMREbPBmtg+j6VGCtt0fpq+1f0ja+eR8uOwMg4O454C9nh5k6nitROQXfaVC0q3WaMHyaUGuU2iq9NtEubikKtTYXj3n+8KykALwy7oQReKvGfweKYPtOrejJrX8au0zCFgJdrxLYZHO0NgtE4yIdSZGIYGLO0nM5Q+3pdw9cH609eNlUMFYFvvkUFUiTcKfzxXbD9DshvnjnpRbiC9P5fcu3l4ejGfOcSbi+m+NdBuAziOkuHyvcee3EP+2zNWbVVAiqmQCoLIEQaqjziiYAMjMUvpV3fFVs8tsMNnHRDupk7OcIsKuZ5oNvbPCo3DIZZSkjS4twq6ahjSXqOOMLQgrMl2G0wXr0rL80mmxhTIj2g5NLVz5cM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(366004)(396003)(346002)(230922051799003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(86362001)(41300700001)(30864003)(1076003)(5660300002)(2906002)(9686003)(6512007)(52116002)(6506007)(6666004)(26005)(36756003)(38350700005)(66946007)(83380400001)(66476007)(6486002)(478600001)(316002)(2616005)(6916009)(66556008)(38100700002)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GshOrD+2UIt4XEbf9srwtt0KpuFsSQ2cXqCniaLgcBykXaHLc+P/t8AA1ssu?=
 =?us-ascii?Q?YecrWp8HCukl9aaFYJsk4/BaNRMrrtBjsQqZk4AQZFNOFAiw+unTig8q6MTz?=
 =?us-ascii?Q?tzV3ua8JiU1w7v0TSfofOV79K4MvEtMg3a078jXRB73kxAB6AJELWpocprGb?=
 =?us-ascii?Q?ZzKJhv58djCr6V1Nl8d+R05KL62k8J0R6SbPDuy8+LBKI3giEYu4u61Xka/z?=
 =?us-ascii?Q?rflaxUtcorCt//LInJGUzNJFJu/H4tbc2wQPceFghrvuA61Yysmdg7sJy3Jq?=
 =?us-ascii?Q?Vp50mb3jEeHGqFMK4PPbmiq57QVXJhqBdFSCTh9WY8qlX/dK4jTLZLwSTJ8R?=
 =?us-ascii?Q?t1LlK9w0VJ4EYIsC7fERSW6O8/qG/CAo3uhwrliNl1Z13WOUc6VFiuxh36xP?=
 =?us-ascii?Q?MY3Abfa8LO9dz2w+nym2Sdme4eBqwfr+v/CRptGPnA8BBXO6vI8BSkd5Q8ZZ?=
 =?us-ascii?Q?2Q2DGWHiRad6v7DcTl6uxcq9ZSv3s/u9uMHrb9JN4a6FUCry6Bc4oRt3Jy6p?=
 =?us-ascii?Q?gd/4Fhkkks5nG8zvJBDWBk8wiZZGdlCdzlF9OzUKyjUulWJ4k7iFzL4/9q5N?=
 =?us-ascii?Q?cmExnuyE9FnGTmBTMT4zbeg1jko+e23j/v0soDUw+VEBsjkfec3n7yl05L+y?=
 =?us-ascii?Q?QdqH/fJlE4dpev0eBqggTEYvz+nfE+jOhrU9Fi6eVCryiVD2zp37MGRfpAm7?=
 =?us-ascii?Q?kq1ZktHemcC7dKadpcyw7D1kNrBXEZlb4E1I/HuQkHvSceCNpdOWc2ZmE+gy?=
 =?us-ascii?Q?1V2bdl6wcG6wyhwUqdG+Mm1pVQaO/b1DyHaOygqsZV9f6GwCF+RlTWheNFOG?=
 =?us-ascii?Q?1vwGmVbWWvIDMjIRtsTXHVZPtHLA5c0y3Eg2R+/Dnv1lN4J1Hx/NBT5x3G2g?=
 =?us-ascii?Q?IQ2ChjV37BOoPvKw26wR4sckWtQbJW3fZlSFNMDEG1fV29t8SqrYFp/iIkg7?=
 =?us-ascii?Q?AisJ4cqB9hZRuvNqlsTGEQrkQ5rBW7yD73aXkvYDugktAcTUqcUsztiasTC3?=
 =?us-ascii?Q?IbSzI3lGrCPjX1wfvhgxoJthUvX61tjU7x4U16G0fL6RosWdSZ+BgjxecCQT?=
 =?us-ascii?Q?vl1LRyRJF9X4goLUQp1fZdhMFAkkU26Da6rOlC/IlbHuWv8PWgFhkWD0j+YM?=
 =?us-ascii?Q?MBViChGt5YcVVMNa0m6lBJIkgWY2/PcbrjPs9m+Tu8oafgEqz6E5LxPLuNFc?=
 =?us-ascii?Q?55Svm5N9NKd1NrL5QRxqUKqpBPAPXPPRa39F9hRqLRcouOgxH4ciguCYs0bw?=
 =?us-ascii?Q?NIweqyvmCT9GQCDYWYnyQs5ye5P5XSFWe1YuqN3i4NXNpErq9eKsK5o78vzh?=
 =?us-ascii?Q?qe6iwSFbKNUWRDPL3IHE7QebuDgGKnsC8EeajPsptXJ+RTfIpnfrnnWRt6nq?=
 =?us-ascii?Q?ymtQSxN8CyZzqtCmBbZPmqAY4kDlYUsGHrCzPR1of3a3V5sLo/Xvh5hAh8ac?=
 =?us-ascii?Q?EsGddjBCfDabyMFKeH5K4EhN+zzLs/YNV3J96YMAADZJmQ8YELKcskyWNzBU?=
 =?us-ascii?Q?ESyijFKEd4WJc0y/DPadxQxYMi8olPo7uNPQbyr7ygucG8U9ukLPsAJDwavF?=
 =?us-ascii?Q?jwEBKxipUSgyPHjypdr9HPnd2SPNDZxYZ+XsoOAL+ArhwE/BarZNrIZVzeNE?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7257b19b-6b73-4d95-8ede-08dc264668ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 12:31:42.6874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quvSnaVWkCHRiiqGpZ14CeOTNmiQP9knmlXdjyQy8Kr8tTLugMLH9ZR5o7v2p1c6CmlfrDtcWvL+accWJmDD9LFBCyY0An2+Tvl9F0AWRMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5511
X-Proofpoint-GUID: lDIey76cja_oeGxYw3dm70nLnjlIe551
X-Proofpoint-ORIG-GUID: dVE3TkGXbpltrSYJEUGMs810O9-8RsxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_07,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 12:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194931

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

CVE: CVE-2023-39130
Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

---

The commit replaces the internal issue number mentioned in the subject of version V3 with the cve number
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


