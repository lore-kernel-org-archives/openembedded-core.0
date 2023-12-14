Return-Path: <Sanjana.Venkatesh@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEA2C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:10:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18777.1702548654241858186
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N/ZyEQlZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0712efe949=sanjana.venkatesh@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE8TJM1014046
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=aemEfb02LA4zy8q7/s
	ycqbtv1OcWjhw6HU7UY/7aNLA=; b=N/ZyEQlZNRhqW+fZ4lwEVyHR0ekVAfzfv0
	rZLPZ/g5r/QgerSGXfFIgH50wKf01hQJeUnZ+yOh549tUY4ZLHrOq997J4IhYoOv
	mFB4zmOmpnb2EDIaQsoWIEaYXj7PBhvNEnmChTVcW2fHyp2elqxSrTIHO5tsx+oh
	vciP6F4gTZ+uwz650QebBGur2JkkYbRKS/uEo6R4n7TqIioEf81+UbTn9hLLml0Q
	LYaLDIvq3hJX94aHdI3+Ag1wptEdiXoXVhWldfAscZQq2IT2G81zONgrkvLf/09b
	VTTGhefR2211DbSh1yUlgve6WCpmESvC5pG5P92TbcwH0E0d67vw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7fgagk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:10:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqNoBaNSo2IKo0J0BhhU41tfC0v6iRmN0WODram3SftX9PpwKoVdZsVdVH9jGABaka+aWqbR6lrK6t0E9isP+NRPhlUU0CMDik64C9mu2Rj3HJ8gb1IVmtsmPUBP9TZdZkkhB87kjuZjiIrmFQApHIau8SuAfZv1oLmxjneMlwCbnq1Fg/M9LjDDqXq6jFLllgRg4PvwpUppS2ktmkXIDowi32d+8ZkZRFvq6dha7B/N0g45sbYweqmeP9maKbfY+Rol0LOBD1GS0LRCQj3LBCpDAZSLdfVgA4V+65RQJCQ0On4zVodUWYNi1oU3iyy3X+m3hyWNbsSgIu3fnMo/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aemEfb02LA4zy8q7/sycqbtv1OcWjhw6HU7UY/7aNLA=;
 b=UmhJY6ixDjc/4N3cMLHlV7AfrKVjOmIj0yffD70xhU45zO4gnnuJbLAdF1d9XhD1ebq0kqWkKAW2WGAZ6m7+MM0zDH0cGr2plugTHS9dELU60fYy9AZVanitwTJZMhx4O6h42GImSbOVGMRfO/TYC6GOD0CtMLE2Rf7D/jDr3OVoBmEs88iybbRpczg1ebWH/RPWxjG+/edwxw9DxqyvpGY5BJaitXZ+om85fgH6cc4/KbQi9SM4sSQQyN9Uu+KuzGcQKOOubfqo4Qi7B+HsiBGHNSOKQsZkYJfhK0zgpDYcasWH5GwEiEmqKGfzIa/NrZy+YZUz003zI3RcERBZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 by CO6PR11MB5666.namprd11.prod.outlook.com (2603:10b6:303:13a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:10:50 +0000
Received: from SJ2PR11MB8540.namprd11.prod.outlook.com
 ([fe80::e754:f759:8551:f0d0]) by SJ2PR11MB8540.namprd11.prod.outlook.com
 ([fe80::e754:f759:8551:f0d0%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 10:10:50 +0000
From: sanjana.venkatesh@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com,
        Sanjana <sanjana.venkatesh@windriver.com>
Subject: [kirkstone][PATCH] gdb: Fix CVE-2023-39129
Date: Thu, 14 Dec 2023 02:10:31 -0800
Message-ID: <20231214101031.978735-1-sanjana.venkatesh@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0366.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::11) To SJ2PR11MB8540.namprd11.prod.outlook.com
 (2603:10b6:a03:574::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8540:EE_|CO6PR11MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a663bfe-9cb6-49a2-8c1d-08dbfc8cf273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BUCtxTPUxvIJgtMuxqDa00zwq57imm4CMBgF3/RcFLCMLlr0zDbv3AUPLEAvTg+axlzvyhjXoUtI2GlrhmxNev6cE+7WFXViQOVGDJ6kcIZ86JvLZRtofy5rqGjrd0FNwhL7/Mz9IPAWa3KOekr+1WJtmnN1v3Gb2ZrxgaAGMOqnZ3TwASp1FguGjKqkg5RbliMGlcH2m6lvFWUJBATdhw4STiU41zGfpeQX6+JxHZqiXXDyIljSZ4meiiMhD0hRN0UwJGY85nD1EcADi6GFoJ/xVPVzrD/RUR5S5I/+JmXL/nJY/eaawDahVp93N6WZYR2lb8Uk/eNyA66ing3F4wWfpqXKxJ2xB1Vh4ygVs3ey3N5Uux6oI6QfW9PHzkWzzsc9ivBOzwgbqs+blCrYf6Qe+wBhmhUl+TfdprGiBHpr14f6EAbC5mtwzwoHV6u8rHzW9Y0ukWXTiBKt84C5ccswO9apMYBYYC9W+EIB6G8d7b5BEqNOWPR+JAIKWIy7pH5waJxHiCy9v2HJ2npNnKL9IpnNW/iBK6fP/y1fnp3zJbNxYm4pIse4IsCi4zkgHcl8KYy4FslZI7zrFAaRQK9Tcwg2HVPIl88GWl4VXsI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8540.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(366004)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(66899024)(83380400001)(107886003)(26005)(38100700002)(2616005)(8936002)(6916009)(316002)(1076003)(8676002)(2906002)(5660300002)(4326008)(66476007)(478600001)(66946007)(52116002)(66556008)(41300700001)(9686003)(6666004)(6506007)(6512007)(966005)(6486002)(38350700005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SV6vakgpEotFestXjqZ1TQlwDCnWomwPkpdyJzMbkoCDf01LZrE6lwV7B/X3?=
 =?us-ascii?Q?hEqjEmjhelXTBaLCmQmylTJvuku0nhjygKzmzp35jQvyh5/SwviCelOiwrYv?=
 =?us-ascii?Q?5AahoB3xnlOTUwg4U6/8nmfGQEfoxkWkK9H+W4Wnf1GJCEsbkFZtSOr5Tk22?=
 =?us-ascii?Q?hIE0y94EBilea1vA+v/ZsJhlHy+ZF37Gmsi2BD9I/9gwJudjY2Nf8loKYvjP?=
 =?us-ascii?Q?CMpiEQta5cG7j+fXnAXDpUQNFAARZKNuvnVQYYnDz9UAPzmL2jsE9ybRQ9yv?=
 =?us-ascii?Q?8qrx2GWwkIXDa8/aL1eEUvPI/NCbSEFr8LIuWLnl4BC2DQJ/HjsakX+yLNm7?=
 =?us-ascii?Q?2+e6CeSARNih0sRCmaG8SgfHpdG06MYuriqC0/Yx8PlqiLT1zDdDPrT+Qcwt?=
 =?us-ascii?Q?R/7ELgfc6XfupPpC8/xzegRo4VJv7JuQHHT6zk7Wr26tH/TcJbKH+riaOVFq?=
 =?us-ascii?Q?S1MHDRxNqWxgitZyu7CSjqSOKOMKhKjApm13g/qxpZWyz9jwWczn6ihMFFM1?=
 =?us-ascii?Q?Lkgb5fO6BiSRWnIze6CxpCjQRjDG+fNQMcAyz3Y4DPLdiy9LFQ2nf5rBk9cN?=
 =?us-ascii?Q?rewxTNe4TJ4WqsMSEXQNUrfGkhSlw/u7/7NZi4EKrTPevYIpe4eSmm758SnB?=
 =?us-ascii?Q?C9buVwVO9g2KDWLGjmAfYfoYyNg7h8LpgtkXctr2ux2QM0mUoZaBnmi9dqpV?=
 =?us-ascii?Q?a07juM3ZUrPr6FhQw19FaZbbtt7uIkOQ6WA4PK5XPrb6nhZXdOegKFQdXcFM?=
 =?us-ascii?Q?E4KAN6Jobm0V4FCprt1TRi6LQOmytthe3sfSD5miTcy4tCLx69dp3EpcYSY/?=
 =?us-ascii?Q?TXcB8rISFex6exOm8trHMdRoPhBZ0e6vbLTa7CiiJ2o/T4w8pTHALZ8Gxzea?=
 =?us-ascii?Q?SY9GT3JM6Q+dMuAc5BOAWU/QdXZtlgDHUzL9vM9ideH21g5j+GfVq/OxyDhu?=
 =?us-ascii?Q?Gb3NfeQu7mpL/sTlrb/yEB1sBR54R94QYNNT2gr1o6YESnTqAsHoKNnQbKq3?=
 =?us-ascii?Q?GljRKziF6JFE9V9s89FUBVHNwasweyZ0nyqnfq/ZEZkLHeGWl33FgElsQHgJ?=
 =?us-ascii?Q?SFqhacd4gvcvkoQgbGBFkktuhyKZlp5OFgtWSQrnFp8xBk4/1+L+QaER7DXp?=
 =?us-ascii?Q?adFMn0DD/adNFlkogqtdWn9GomE7zQ+M3T3xmYsuL3I3snOeEgEYHFrPhCvW?=
 =?us-ascii?Q?UpEq5VogKrV0gazTuOx+un/Bz8S5Zb6VKiBfHjCQRYjbMhq5Tm1XAu23LyOo?=
 =?us-ascii?Q?a6Er9EQbSswyLlMysgZV3z5KDCXMLt2bfRzReSExt0uqIvefmgTTb+3KzCUF?=
 =?us-ascii?Q?l0g7bF8Q1/b++dioaJsHKDCbymnQTwQ1E1HoQTnNl/W8u4IZ5wn+zWWpFH0b?=
 =?us-ascii?Q?wotv2p3E6TW7guPP/Dst2XO4QsEWHctr3qGl2qPSam5kWjDDx0cs+eqDISfj?=
 =?us-ascii?Q?uSaTVNfluk4C4qblWerM/k7jY8uWHpTKqnqr4S8GDw/2NdQqTeqvo4tS6nBC?=
 =?us-ascii?Q?QwdQaLNS8KwAnOSZfGlB1Uj1hqAMo204ylKzmGgccujhO1zcItH42JrjFnCR?=
 =?us-ascii?Q?MVhSaKCVr7qFSY/Q+Ahrj3D0ddTnGtGqmd9hiM+mHOSR111yN6DhDKIfAZRz?=
 =?us-ascii?Q?IK+elGNXfVIrGvBfQLhblAo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a663bfe-9cb6-49a2-8c1d-08dbfc8cf273
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8540.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 10:10:49.7624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlDmvEwz4QPSwMLri33dCsBo1On5oSJ130F+085v29WeJYF1srA7QbyKNo9tXSciFN+FojA8L42WvUY5qn5qvTgbamuXaBVuX0L5hmlhv6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5666
X-Proofpoint-ORIG-GUID: PtvWLEAVK71CYH4TBfYlYAlYqA4YE037
X-Proofpoint-GUID: PtvWLEAVK71CYH4TBfYlYAlYqA4YE037
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192345

From: Sanjana <sanjana.venkatesh@windriver.com>

Signed-off-by: Sanjana <sanjana.venkatesh@windriver.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/0012-CVE-2023-39129.patch         | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 099bd2d8f5..f040d0b4e2 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,5 +15,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Fix-invalid-sigprocmask-call.patch \
            file://0010-gdbserver-ctrl-c-handling.patch \
            file://0011-CVE-2023-39128.patch \
+           file://0012-CVE-2023-39129.patch \
            "
 SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
new file mode 100644
index 0000000000..39d96a9d6f
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
@@ -0,0 +1,51 @@
+From: Keith Seitz <keiths@redhat.com>
+Date: Wed, 2 Aug 2023 15:35:11 +0000 (-0700)
+Subject: Verify COFF symbol stringtab offset
+X-Git-Tag: gdb-14-branchpoint~473
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=58abdf887821a5da09ba184c6e400a3bc5cccd5a
+
+Verify COFF symbol stringtab offset
+
+This patch addresses an issue with malformed/fuzzed debug information that
+was recently reported in gdb/30639. That bug specifically deals with
+an ASAN issue, but the reproducer provided by the reporter causes a
+another failure outside of ASAN:
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=58abdf887821a5da09ba184c6e400a3bc5cccd5a]
+
+CVE: CVE-2023-39129
+
+Signed-off-by: Sanjana Venkatesh <Sanjana.Venkatesh@windriver.com>
+
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+index f8e14d8ad93..ae7632d49cb 100644
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -159,6 +159,7 @@ static file_ptr linetab_offset;
+ static file_ptr linetab_size;
+ 
+ static char *stringtab = NULL;
++static long stringtab_length = 0;
+ 
+ extern void stabsread_clear_cache (void);
+ 
+@@ -1303,6 +1304,7 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb::unique_xmalloc_ptr<char> *stora
+   /* This is in target format (probably not very useful, and not
+      currently used), not host format.  */
+   memcpy (stringtab, lengthbuf, sizeof lengthbuf);
++  stringtab_length = length;
+   if (length == sizeof length)	/* Empty table -- just the count.  */
+     return 0;
+ 
+@@ -1322,8 +1324,9 @@ getsymname (struct internal_syment *symbol_entry)
+ 
+   if (symbol_entry->_n._n_n._n_zeroes == 0)
+     {
+-      /* FIXME: Probably should be detecting corrupt symbol files by
+-	 seeing whether offset points to within the stringtab.  */
++      if (symbol_entry->_n._n_n._n_offset > stringtab_length)
++	error (_("COFF Error: string table offset (%ld) outside string table (length %ld)"),
++	       symbol_entry->_n._n_n._n_offset, stringtab_length);
+       result = stringtab + symbol_entry->_n._n_n._n_offset;
+     }
+   else
-- 
2.42.0


