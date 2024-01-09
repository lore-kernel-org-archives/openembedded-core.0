Return-Path: <Sanjana.Venkatesh@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED54C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 11:17:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14311.1704799066585473898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 03:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SIjAN2Wo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=173808f1a8=sanjana.venkatesh@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4096mrLJ002663
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jan 2024 11:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=yhTd0fXJqzIY3mLxM1
	LJlG845kTHq7q9Ti9zdR2xabs=; b=SIjAN2Wo0p9jefBprSLfnBbtGBqDtaTI3a
	P8lC26WRnfY2fW8LrFUE7xdH+fNgvA8bP2fpCKIbnewQ2cfBr7Dny6B1i3ypJ8es
	ckQS5YCoAVL65sBCzewdvWBYnaJoBg/t5k/toa2rcfBtlPFOMwWmpzqorAVIaiwD
	JqbRqbSmYEMyyFqDS7OUVbGbPepMIQzO09p4qUUPSQW4sxAlXem3SkfzRFZZL3Sm
	RioWLI7pNq/ppc4eE1e7qIbmkvvTiMap609ZAQPyz0uYVEwFcEDhV5DRqjGv14lx
	YemF/5+8j7kuB9x9MzRYYnLLYCKP0kc3h7nvbu39iKYcy54+gSpQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vewu5b4yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 11:17:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyFbYy86E+dK5Zo+VN644dsW08VesQ5jTh01y5U9Gu0hD1qOq1ECRcuawDEd0JhLw8vxbZl5kRyt1VRvyPCxinj3onfpm6bxJTt/ZgNNjrP5mTOI0yPqU/nYeQV3d9PW0WhLfDFAZaFTX5qY+o+MpEmyLFeEIVHKo4GrzgmKCm9N19L849FuP4QUjAXMAVib4Y7L0uC/+9C21aUTuh5OdnQTBTfo0NAol5hRP1Rcrk8w6VunFwD2XGPOkF9yF/cHZd0ZD0YiT246eETy96L7h1M0yRtQUH5v58u/nMfuhkSnXzldnPLoSnyORbfoFOvtyfhnxHMOqGIUQ2eS2jDCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhTd0fXJqzIY3mLxM1LJlG845kTHq7q9Ti9zdR2xabs=;
 b=W+EviVDCSPt0ziaRojFIPQ5z+5dYrwj+xn3Emod4SdqTGLTQo9u+0oLV6tCrZWDeagSPwD0ohMcpnscjPGNDAk/2SzfokQbvbiWbjpwx7F5sv+8M9tcOuRu5wVkCZPsvBN0HDyLZ4VSgsM8hpMDSJJscmYzUMl8ZB15LH5PhhPX7qxyzcGk+h8UsWx6TbqjV4Wfqu9b/q+G83rDiaJvekdcSa6ZonPRlqcMiId4ZovV08hpKmpcq62KPbLBsWgLLvyIL1JyuhDF/UoMfOVYP7KpFRGCLtO9vFuc2NEiADwgP6Tk+DLGQethBuri1E8b7swMB0hfY4KShBz5KyAAZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 by MW6PR11MB8368.namprd11.prod.outlook.com (2603:10b6:303:246::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 11:17:41 +0000
Received: from SJ2PR11MB8540.namprd11.prod.outlook.com
 ([fe80::40fc:cfa4:4690:3b82]) by SJ2PR11MB8540.namprd11.prod.outlook.com
 ([fe80::40fc:cfa4:4690:3b82%6]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 11:17:41 +0000
From: sanjana.venkatesh@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Yash.Shinde@windriver.com, Sanjana <sanjana.venkatesh@windriver.com>
Subject: [kirkstone][PATCH] gdb [V2]: Fix CVE-2023-39130
Date: Tue,  9 Jan 2024 03:17:19 -0800
Message-ID: <20240109111719.3908417-1-sanjana.venkatesh@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To SJ2PR11MB8540.namprd11.prod.outlook.com
 (2603:10b6:a03:574::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8540:EE_|MW6PR11MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: bb616296-2455-4b5e-d4dd-08dc11049824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fl+XViaBPC8yygWJ1Q/Krjy+X7cvXBiXoy4bLRRxPmMkobp0zoIBreOhkcUnJfdoM3nQUBvZtzOm1kSqb55FLyEON0bISrQDp3Hi70L0qEqKzfbfoB/pByKe3llTJH1mdRSrjSsy9Q6kbnlJ+OWtX0flZmz0hHAzg/B9+Y/SSBNazMoFH3XGCS/33ROJiK0AAMxhTOMxEK6vUbQvlqn2/RtPYa60rlTqwY+lzgaw/gPiGYg0ANgCG9V1WP8MczitT0vTxDCwC7h2MUd4w9YN5oBschCIdV7tfHbHxWWChMl+K1cgSGmjLJLFJqdblqUc3AcGHuXPOZGL5I8AH2AY2CiyLH/CqnU9KF9TjRLhlMijbhjydMunMg2WjQjfZXEydT/+l63c0GloEBhuGBwNP+s/9Uwwfj5jVlh3p0hKfrzHFIHBvpDFQllCbhE6EfrfzUbP9ddedHV8KtjciLbTVfu0mweRo96iWr8IA08BGMHohy17xZLRPygEhbWwLUSsjBTVrrFp5I11PROe0wpR9qpJPmF6WoAGCgEDwJR3rTB+Top8y6i2d6eTYBz10yEZJE6hpMdRKv1/XvDFmFf2nyH/SUTpuv9OSJa28BbTYenmTF4bn+FyIxkDfmIobuQuovxx3RyJEK96KCaMogKTcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8540.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(136003)(39850400004)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8936002)(8676002)(4326008)(38350700005)(86362001)(83380400001)(5660300002)(2906002)(30864003)(41300700001)(478600001)(2616005)(6486002)(26005)(1076003)(52116002)(6506007)(6512007)(6666004)(9686003)(38100700002)(66946007)(36756003)(66476007)(66556008)(6916009)(316002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PPNMjN9MFaLZ9PI2FKhXBSWD/ls3TYx0tl17Ntzo+ynqwzmY3MOW69XWXDXu?=
 =?us-ascii?Q?QL/hAsAJ6VTfcIBa/Y+0NyiUXwW0A06v/x4brMcowcvIx9KL533amL/g85DE?=
 =?us-ascii?Q?y8HWJrsHcRGLRXY0mp5iTl9P1H3vFhvgi1l+uD3DRUChKO5mOW6tt4rQSsR1?=
 =?us-ascii?Q?AF/UIbrpURmPf691rPYnEb6oYOLtn/1aAMvK8KMaV/2jLA7KxntYt3ttDOQ+?=
 =?us-ascii?Q?4J5lyMD2nNC6peCJuhF3jcAhotXiFR+M9HmsA10nQo8j7X/0zotm0zp6/TIb?=
 =?us-ascii?Q?IMdFvBQXlxc3BixQSkhMK/ejPiW6jltldsfQqqwx3Y/IgjtcchT/hwt3i/kk?=
 =?us-ascii?Q?xu1F+VE7fkWsoWGakW6eBgZr9MEwh5osmpmFZNcewJ1UoBm8J3f/Dfk+Rocb?=
 =?us-ascii?Q?IhUOME1CdA/zhhAv+LAVvf9sr79WeH7qqb1vTYubyacRfQJjtSAKKhvNcf2l?=
 =?us-ascii?Q?0GMAVxB1LU+Qz2nLVTLvvII1LFF9dpJquVCIGhKu3pjljlEIdHVV74cDseLA?=
 =?us-ascii?Q?0UUHaQPFOuC4igHy1r/TyxstWzPG9+dSkWsKbI4c5ETmCdFCzNOUTE9CKkDY?=
 =?us-ascii?Q?LrxuUbIB43gv0ommPApgOQg4L2osH41J4HYUEBFkJ7ZzfV/Zu34sEIpFWXKf?=
 =?us-ascii?Q?jOInmJ9uBMwkRYLNttNerbDY10ESpVbUkE0qAqtIp6cVVd3Y2pCT7jr9dakt?=
 =?us-ascii?Q?ZYc8/3+V3a4n1BwB453N4wCZRrHD3gAImGaH4rGG//DOLGS6h+dO9qR3hp5+?=
 =?us-ascii?Q?2yhZRblxXEGEQE04tycrt1mDTPIJrevFv8dS2Pzsa1DwvRbjtWbRYZwLhsJm?=
 =?us-ascii?Q?u6cBLKEQyg7U4oOap0QDOrWN/00wqZZiFYXQT7FKpTDHgFliLkGnKa5NtGDd?=
 =?us-ascii?Q?27Gq5RZQuU0yU4fy8f+YtMoCLJxyhXUlv1B5oP6FLNCHOholxZ1RHjg8sZii?=
 =?us-ascii?Q?lgAaSWn86vs5dFtxSFjjtKj82kc+HO84VCiWfvdQQjICeRBbSOD6Vidr646R?=
 =?us-ascii?Q?hiw7uPBPlyouJ6gPg50MReFrn8VNOlN3AhFBtcDZQcDtWSQ1DxjfypltCr1t?=
 =?us-ascii?Q?2sE5/BlMiBN94fm25/cx+ppXK5AzuL44rMw0jX4UwSxEQU8UJLDkO9c3Rwpb?=
 =?us-ascii?Q?pzhkLWyqmA6XusAqPlsXy+4vKxAI9c0f2IZ9rZyAgrgrtVbG154jqKBbwTko?=
 =?us-ascii?Q?7yj7KDBdHE4DSXA3YLFbG1elACKW0qqMvbXjxjkEZnXau/F/eFlmuJobfNnc?=
 =?us-ascii?Q?ShU3ur9q+mtAR2E92DYD/ARKQYHAnnq2Pnwi/kMYRzTzOc1qfTmq4DCpV0m4?=
 =?us-ascii?Q?M9X70ojhd8QgtLAiBZrsQu1GfWCBCAZHI8B3fpzhgRFE6ZclTeX4FfRhDqY6?=
 =?us-ascii?Q?hrBTcGN2ck0EOl2xlO0IGa+mrU7jqQPT3F7FiYvCDFjb/yQTpeBkPoLYgDvx?=
 =?us-ascii?Q?FHr1CD2RGWF146mjEuzpgsa1iPPe6oJ0KJsmnCuIaaW4Q4tscEPbYTt7N8vv?=
 =?us-ascii?Q?PyEbujZBDFYW0VnCJgVTGbyFDmMe+Hdo+bBTlpVRpOaxd1WhGYCd942CgyVh?=
 =?us-ascii?Q?yUDh3bt7mofFt7RFg8uRVNhqD1nLgURx0o1BviHeQgkOpQoIRwxgh1A/Nwfc?=
 =?us-ascii?Q?DDagBxKCgeqXJMd0WOvl73Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb616296-2455-4b5e-d4dd-08dc11049824
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8540.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 11:17:41.1486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1L3ADMsCDKuvf3gP1t4AVKKNRJVyiymvN1odE0YZz6381MUyjQbDFRCM+mmRaNa6Gvth9gWPxa/sERo8hUvAra4jMr/dTa5D9DrPNMTkmpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8368
X-Proofpoint-GUID: EJZQQqVur4qJ71nY08nzFGJuWgk1k77I
X-Proofpoint-ORIG-GUID: EJZQQqVur4qJ71nY08nzFGJuWgk1k77I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401090091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 11:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193452

From: Sanjana <sanjana.venkatesh@windriver.com>

Issue: LIN1022-4855

Signed-off-by: Sanjana <sanjana.venkatesh@windriver.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 .../gdb/gdb/0013-CVE-2023-39130.patch         | 326 ++++++++++++++++++
 2 files changed, 327 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 099bd2d8f5..62b813d5cb 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,5 +15,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Fix-invalid-sigprocmask-call.patch \
            file://0010-gdbserver-ctrl-c-handling.patch \
            file://0011-CVE-2023-39128.patch \
+           file://0013-CVE-2023-39130.patch \
            "
 SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
new file mode 100644
index 0000000000..c659f8a08c
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
+Signed-off-by: Sanjana Venkatesh <sanjana.venkatesh@windriver.com>
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
2.42.0


