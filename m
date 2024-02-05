Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEB7C48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:29:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.61730.1707136182211992014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ejLHixZO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2765d7cc0f=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415B8BUt024542
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 12:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=onoIVFNl1qLUJekq747oWwl5AV/b9+GMaJ3X7wwS4zE=; b=
	ejLHixZOTHCsEF0/V6CQIyuE1FdgZ7cSS/3IS8yPKtQ37CtV6ifgO6qRarbkkLeS
	hjSv2GpzrlesaOnVwleqosjGXgEtLc7V2AXpycgt3bo14616Jh0BuM626w2UFInp
	It/yTssAyw6jMwl/vLnw8xi/lIq4PH5SbWcEM1FDPDI0vUXgia87EealwNaLHuef
	Opqh7I9eYhSbMo4WBFlJvwss1mKtaCW+4ZqEQInWgrZtMK4H6ZBkYFCYML6ZJi/K
	/ewolUm+L6X0KSj6cUqwNiKRblQuuVm7AOWdnQdzNAHABIMEqMm0TwXCJyfgnYed
	0dO21mkSaGfJT9BnuG50kw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs79rqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 12:29:40 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 415CTec7023462
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 12:29:40 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs79rqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 12:29:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcpgYL7qKGvB2bJeh/0Si3dtf1SFZz5K0WDi3XWCrj4df5qIh0nkIj2QfXw+qGAVTEjOLrGHHFRXZYZ1Lyn8+FLhn33Um93PV66zjb1KV3xazc21lw7qZFucWF7oXHFjSkZB1ClGwtSbA0ZOe4I/V0FW9qrpAXoisAulltJNbVP41G7k3kqCCsbvgzt7tfN69gC6oDbG7JmeS4dad4uMLAFqQK9q0g0JleUE/P98MbOmCyxkeL8jNYFUdDREZCc86RuI6Q3v9HTVYTKSl+FiQZI5kFASuD0dt7epnqAJRjmLpGqK4RQjW2/fIUSzVoWvJpevtU6qN5ytyPAy8NDyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onoIVFNl1qLUJekq747oWwl5AV/b9+GMaJ3X7wwS4zE=;
 b=PjPRn/m06kcRJfocrkX0bRbC6LBgXqEZXgVWcXgy3SfMM8X5/eM5ynbpopGMs4iVTXCI6O+MGaJCHmzNzo43WOsDKifGIuXRKf/2vkrGeEWQ7UvF7+66GUMr8EB3MR6Nvp/WgZC//49yMy9hjR3gBuLrLFdGJq56mjrXGYOD4H9p3rqhD4pztSeMCSJ3HLM+fVDk23D7g3WwZsoOGtBmeJqtdksLsuA1Igg6hlyEmuIBIN7EVOZVwmp6gchFcRzfTVjB8phCoRN1Xuv4SYUkMwqrmsK8FeeBwsm9yjZUbGlBinDY/APT25Zpb+hOFS30q9JqgptSxaV47WOlcEmOcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by BL1PR11MB5511.namprd11.prod.outlook.com (2603:10b6:208:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 12:29:38 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 12:29:38 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH V4 2/2] binutils: internal gdb: Fix CVE-2023-39130
Date: Mon,  5 Feb 2024 04:29:18 -0800
Message-ID: <20240205122918.1896592-2-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205122918.1896592-1-Deepthi.Hemraj@windriver.com>
References: <20240205122918.1896592-1-Deepthi.Hemraj@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|BL1PR11MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 533b119f-adc6-4138-0d75-08dc26461e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LtHdUpt+hc0lQ46vEzkEdY28ytECiUkbD8x69ssQ82o9ZMQ89ckZI0qypHGxuHWxPgJN5JyKiDR5eZGJLMV6FCZtbjm3/AKhJKbGMaIMFhwUhbl4RLSbcok810Sfr9KeNvznpu2xTe6mpinQrvStvUeE6J4bhfHYSTy3nTE6neoDK6Es6SoCuQIHGcxMK8gdDYYQmb2VMbst6n2gOXf0Rx4jxiOmiuTGr8fDVcsAkKZZoOrEJR3TWUfUJvkwDFMjIfZ+AG9gexOZEflxtXE7NfSK+wSci08bQgOoHh2CSq5BZUHiprjCrViYu8i2Nj30hnL+jGoFOt71uZ3v33qw7mHFLikCQao+IIRencsdGh6Xz7rAEjX4fnkwwCm2HiBzQ9NhvdPdEdLaj1W9f5g8OAu9hh9nweyyXcc7K39kdlcYOE8Qv0pmgOGGadqEo0vRYv5LBkc9Lg+uNGRGPmsdhirqrOIaKfIwNusI0/8Gt05Y/GzrRfO+DdoXFlSxZ0HlyOAxakgziFEUsOC2A3oiHioBJNThqvDNash94bEWLngwT18tSPCHQDGYKe/+8mgwu52EuHGChZHqOrT0u/8HQqINVxjy0paseGcy1YRxfAk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(366004)(396003)(346002)(230922051799003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(86362001)(41300700001)(30864003)(1076003)(5660300002)(2906002)(9686003)(6512007)(52116002)(6506007)(6666004)(26005)(36756003)(38350700005)(66946007)(83380400001)(66476007)(6486002)(478600001)(316002)(2616005)(6916009)(66556008)(38100700002)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZbxBfiVOwXK8mPjB2++5Mfq2LKel/+P9VAqA3aNO5WeTMvMFTZRN56UdMrfG?=
 =?us-ascii?Q?40trq3lW5WSYfF/32Ox1tX/Ytt7Z41AqIpF/G1sIjMO14NP+lpaJIUWqDM91?=
 =?us-ascii?Q?z1axoSEwvk4HARCMlQtawrIVCinrAJ3AjZpzHmYYEmw1kAMZnbwd5bnQXXXO?=
 =?us-ascii?Q?/OLVCCPyg/4UkXMFgF/sQYEmgwEEXdRmJGF9Oc62n5cpTAvowUfvvLq095/V?=
 =?us-ascii?Q?LTRf9FPTaq3jvu60uB1zSSz5UYsQPb48g+Up/njizWvovSKiGdLlQq+UuEAL?=
 =?us-ascii?Q?FPKkXHB0MKdJklh6xOpwn0B4iLZv2UcPiY4xDIkj6jCbrU9HMza4ZHwixOXM?=
 =?us-ascii?Q?3/O/1ryUoMF62tmuutc8Y7XqEL0sK44B/PmotJCn74euQTr8X6WR/Wn9y3JT?=
 =?us-ascii?Q?4H6a9+fnv3oCM8A4O1CQZrCAdTxfRzmF078+6hOFi2IPO6uRJVNcFzGKA2fY?=
 =?us-ascii?Q?n/nLiVg3UBdgbztvcOQjDs3P5QwFqV8ZZjTKxIpNmE7+YApFHWztCqj+27rq?=
 =?us-ascii?Q?M8NBBiov/hip/E1kuwkh1rrcGzm7XARsbQoQOcX+2SdOSzPbdsAWaeb38M5o?=
 =?us-ascii?Q?XK1MYFbdPyFTGfoUvzKvwdwubG9XZo7yzOYJDstqKxYeR5bFE1Yu667h7VDB?=
 =?us-ascii?Q?1jx1tdOFOhE8isKX1RYDVjTSyZfcC1NdSKnH3kxFPyJfxH+g0Vw8XBSL6sr5?=
 =?us-ascii?Q?pFfHDrcSdP3xX4z8VTCJ1J/embj8ARvoEFbyjr98gtUBAM6L0FXjTZhGj3zK?=
 =?us-ascii?Q?zToF2VUbinGG+X20NwtM6Ut3rujqVK6w4176fgAz7F+Memi2yy7OJKTRr4zz?=
 =?us-ascii?Q?pCnz2HVxfIGUS/AV1Bn8J8cZkv99qomMHp3B0JvIA4RXHMq0ieCwBz1kYhM/?=
 =?us-ascii?Q?JrL4WPopJ0jb0Pu06sJxpnvGG5YLszmZAEoGFoE2wfIXo2jLTeTySF73EYQw?=
 =?us-ascii?Q?krh85w03gxwFroGdhVHGtGx+j6Rh3yDbbwuz2pe5UHm2YdC4oAau+kke7UPm?=
 =?us-ascii?Q?vDNWPPh5z4+j6fkjNYXfUhMOfs/pBxzWxWbgIRp8+4K1esopOhZ8V6kFQql/?=
 =?us-ascii?Q?AwY3f7/K0uT1kMZcVS6PQLJnPeC0tYJAhyWYaTS/krzHnRUYxWFgpEG5kaMa?=
 =?us-ascii?Q?WfI5e3lc5RTR0zP86CU3hCbCVaX6PJ4EGRNL2/0sc712bsBYf1iJT1fvK9TX?=
 =?us-ascii?Q?SlneeBAxnYNkjl6j+vNro1SHBW4XMK0MEOoERXp3m8nRetRm9O0rZ4ENtQc0?=
 =?us-ascii?Q?Feyv/MvYJKbG652gjSvpy4tZ5uhY6TSz6YKcVKOj7P29FPbmEEBSzwfiJ4T5?=
 =?us-ascii?Q?z8fJwLV4HTba/cFPJlUzZiVs8SVs+7STJlZx1YIC3NzlSYpo/BSjddd+mdIE?=
 =?us-ascii?Q?KtyCcPFpFz+Fs9ZsneqE5YutzlVHZ6fZ8HI+QkRx+jDuBu7mYlhqJan6WzsJ?=
 =?us-ascii?Q?a0/pwschIXixcJJXpMvbcXmwcdOrqJaF3ivtQI//3wuAFpCpXl186vNnYz+S?=
 =?us-ascii?Q?euzBwpFCuxHlS10Irrc85iro8asWe5/62AKbSVkFA1H4ho44oO6dxn3O6IJ1?=
 =?us-ascii?Q?6fIOMBSRa4P5pRtwXXC4Uk+Yxf2YyRA8TJHvHT0e+5h1sHQ826Ciw2KesATy?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533b119f-adc6-4138-0d75-08dc26461e8a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 12:29:38.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5x/kxMZDLTweljeR368balNHQqlzCEHTeeERIDUlS16tWSDBPmh2MwyJEBmCYWWrRRr2FrGfJH09gRAOWqsWdzqGDTQXbapK03ZHVII+i4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5511
X-Proofpoint-ORIG-GUID: _wLo0nxcPBeYD_kep9KDRWhNC-Dufzpz
X-Proofpoint-GUID: xHdmkpNo76U37reHFtF0by-w60hxOe8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_06,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402050094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 12:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194929

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

CVE: CVE-2023-39130
Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

---

This commit fixes the subject line in version V3 from gdb to gdb internal to binutils
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


