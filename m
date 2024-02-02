Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A788C4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 12:08:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21170.1706875678783142370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 04:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=laAYp6rf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2762b925c8=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 412BRKlB013871
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 12:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=6AmLVysJXvymWLhGes
	PcWbNSuPoMeYvJxmBfs01NZK8=; b=laAYp6rf508Zb3JlEsWj1voKCZnZE5BCql
	41WQFXhYaw1v//vwR4RW5h3HKdjCqjPDns8v4i1GUnlaaKCdCZfBaacNxbLUuAjh
	Ppf2gdWNFxnl3b7BYRFMeQLd27eMrAjZWz8XxOOwEM/gE0Pz9u5EMq9AsRjfNBKZ
	7LBJB4K3D3KjQ+gHpJMdsjtu4gh2QzrMQA1ovVkiHAIsZ7U1aN1kHKIWDmQvs/v0
	At2L5THUZNfQ6Xc78CD4xuzB1wNn91u2q7nIH2/TQLDnY+mhKfT8bPZjbJNLUdoq
	8cNrfHINvxau/9G6cHPoQ9VeIzd79T4BIY3gIsKYaobLoKFGIvdw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvg0d9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 12:07:57 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 412C7vZ9029956
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 12:07:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvg0d9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 12:07:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzeaL1kb9HAlLQwOyP4YytMp0utzoqOUPFdySCv5TmO6Tt5ihSKL61tpVMR3nkkI/lKzK6MLtffLnLgBxy8K+uApDptDqzGvpFnIpdguHR40IsS5bRbk8rYA0ixqXYc36CQ5mSA0zznUP8rBimL/IsFxoem78NsI7y5nLtr/iJ/hoMTbsxRlT3iL2aOsEIAp6Tt5XjI5jlkGMdnGMlou1BurfXsFTS1NXj20X+8vsvWr/ucX2eEsHvFOiuk0g9YS6Iap+jTC7T0ufCoHj/PR/zbED+HblZeA/6BQKJi93rkPTXhJzxLoMLaHTqD7JdiTdjMknghLa/iCRweQsFnWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AmLVysJXvymWLhGesPcWbNSuPoMeYvJxmBfs01NZK8=;
 b=Arbv6HU3cNFhzip6jrRTL9T6LNxYOvLgzUz1w51aNAoI5aqBCYlYUOVuPuzMzXMAAE8wnUo09bPrOHApm9sQVFlN9HBRnqNEOR7s2nJx1Xjo4DLVwAhKHXcqLVTojRVT/IO2DjrUEqFwLLYZbU9Gu8bQWGiB3zzLrXBJCtvX2UnNjGQprE60HO1l+W4yJNFPOLDIGujIK0wmVcROwx6Ibb1f0M3okQ5rpIC2Ft0E41xI9LqOQye4CNy65JE5vIhQxDjyyTZ5J3mDTf/x9umEVU8pS718OfIPvWkWISmpuJJhfzKx/VlKTHidHrcGRP5DzkOELbPcsnE8+lRpoP87jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by DS0PR11MB7359.namprd11.prod.outlook.com (2603:10b6:8:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Fri, 2 Feb
 2024 12:07:54 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260%4]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 12:07:54 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129
Date: Fri,  2 Feb 2024 04:07:34 -0800
Message-ID: <20240202120735.3742584-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0032.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::45) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|DS0PR11MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fb6cd0-64bf-4d24-5f8d-08dc23e795e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ze63qyQZs2zJ/4Cuo5FjOMq2uBCNEduvLcTKCNo5o+oFe3kdSday2OXMWvwTCu00HF+Js9Xb7270s29rzjTFOoF556/rOEyASeYAqRyQcGuWXePeKtmXZglIVrPpRiwiQsmLD1Vb0M4nXgPsX0xDsSkagvU5vX90bLiInCJTAiSMeQLX1i3FdXiCxT39S0sAuXR9vm9x+CDxNG9E2SZcGBT0K+Rh83PzA0LuulY0cxbt3urPJfmvI8oh50+miefOoN0+kdG9dgD/IQtJX6De0ZuzGLs2Lpqlf/WcLd0wZQr05e/dsw65Ur//GwF8rS6LU++7ocREePKzqIDD6vPqWojhP57xgzPFBOljPfEd1fy/mW6ED/bgwf90FVIVQF2II6a+6jQfPR9oGjiYvC4zO6h855/e20eYQRlBN5w6V8EO7NL0HOlUnjficF+gNjOD7sflnyBdzzq55M1KFrUAw9te3a70HXL8ae0FpXSGdyG1Bewg9boZwIW0s+Pumx6KoN4s23qxRf4BMVMfsND7VwPT0tsGLkaI4L9CLWNSRhjLLRvFaSXu9DBcyT9AtjMvStCbCRoF2njS3oQPgKtEV1AqkEc6s7k1SL2rNuP/Z5c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(136003)(346002)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(66556008)(316002)(66899024)(6916009)(66946007)(66476007)(4326008)(8936002)(6486002)(966005)(86362001)(478600001)(8676002)(36756003)(5660300002)(2906002)(38350700005)(41300700001)(83380400001)(2616005)(26005)(1076003)(38100700002)(52116002)(6506007)(9686003)(6666004)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a/wRXLHrFFNIclZ/RocOPk3Xog9HpoZoxFTW/KWiAdffDi3CDPMeJPY2s3M2?=
 =?us-ascii?Q?yglOhP7eHF/ygX63alNogXIDXpxqrcM4KEG/RkXfnxBAzVwnnyfF0n2GNlHw?=
 =?us-ascii?Q?5USlfzqkKQ5ymmPGSNHXo9RAdKIA1892n5cp+3BQT7F3RzB5ufAEU14llDQr?=
 =?us-ascii?Q?kCbTD8kHfiHc2+nT1RU/aHRlcjfTxJgRR1rjg5Boo11CbyjJ4lS5HWNtBW/3?=
 =?us-ascii?Q?ssAxd6BAqg7ReUDNm3DJaEA/uHNBZ0IPKCF3UPlnPYUvI+KYZRVhs6G7BrBs?=
 =?us-ascii?Q?jJk+PfvhVpV07Qt5WNniw9uuCtxdh8Qr1diPBxa8CKJFNSkJy7gEGzQEpYXC?=
 =?us-ascii?Q?EjJOb5csqxLlkoClHAbMaI8n2gTdo9b3fLn7oKBTXsuJXW/klOYV9dQvaIAH?=
 =?us-ascii?Q?kqVC++lqeev0r1gZSVxQ7YEJCAPbTNCsJ+HFvjf4/Fvt3LXex7tOTGDIrX0+?=
 =?us-ascii?Q?2pc0Jg3j9H3Je8ez06elvDzvW32b5uCxRD49Gimd6Q9+ZrO3xiZB0F79tz05?=
 =?us-ascii?Q?vIao6wPOCnBW4mTpWkw0xfRhAjLnJFQIyNRdwcRdWgw+6F30sTfyx7OjRAQZ?=
 =?us-ascii?Q?PSA26Rvx+UesjjdrZTEaVPEi25D8ix3GAFXqac2W3EPe8RxqS3TKyu6cXJnR?=
 =?us-ascii?Q?YmN+MHCSScyOlN36sw0HtsS9lsq9V+jrjIZNyQBOh8IE0DGE4k/5KtG4cAQ+?=
 =?us-ascii?Q?mF5CwQnBH/kSej1URejx5bxIOgssI6lzd946r1RFrnyyCxwycZCkSvF/UFCx?=
 =?us-ascii?Q?I8aX8d5nWvi7iJWZnO2+Fn9FmeVxbrMFZAQGuWOSBsTpbYsapXLiQ81/fRwe?=
 =?us-ascii?Q?HkIVWrusIjRisRB9jKzZETd2ujpGQ02QlQvUz93UJntv5qU7mXxLyFFWhv7P?=
 =?us-ascii?Q?O4itp/KzwSsoaVDwtuxkde2ZL3y+toEPdY5a62LZN+f4K+GzMmaf+B3Vp39u?=
 =?us-ascii?Q?aGAJck95yRhXlLrHL0wKTmEn8vZCKo+HXpZlw6h80cHgt1v9o/z7UQX1Ullb?=
 =?us-ascii?Q?HHYlmIkJCTN3j7BhAo4EmiqgASgFDtrfyb6ppCRvzDU6WFIG46Ri7dKTT1gG?=
 =?us-ascii?Q?74qiIIuZPmLwCy11hiqBTmll2CTXv14jBZyv7HW6Bj0ITY7spRt5fz91d0HJ?=
 =?us-ascii?Q?icokPPauHZr+2D0I5IbYKL22C+2xxzGFzoK3xu3Fe3dqwSC2BrxKOnIeeyTq?=
 =?us-ascii?Q?slyMhS30mZJ2dmUZ5YIlB/oJH5L2+09sjg2kgYOpN9hl73dr66G11g5MSj69?=
 =?us-ascii?Q?aaeBqsR/lz3WYH+r/Y7cKc7V37Y+s5jP9LGumG+fNzyun+Bdovve0njVnOM/?=
 =?us-ascii?Q?/iKr9mP/VzwoP/K+UFGxXiRA70Rd7BYs0A5P2RqQcfGZvhaLjUvv6gICm9G1?=
 =?us-ascii?Q?lzbiTZyzRPndnAvEYGD1lTBOU3u4Jx8L7zwPwYJ/5y53FUsMgPwfpU90SvWB?=
 =?us-ascii?Q?U2zgj7cALvBzAq69NmCgpoACXpGUZSxJ5SC1KCuVX+4+VaaQgJ+psYEu1bDp?=
 =?us-ascii?Q?9R6Q1oL2WV7SIZr8luJ1c+uXtEXOyBqK5sUNPrdlm2stGWBSCuxFy74aSz8s?=
 =?us-ascii?Q?LgmilBGSg1k6L59JRX50zGwZlSS6YXiXDHfeW2nf+BbxC4qdvsW6r70j5gqb?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fb6cd0-64bf-4d24-5f8d-08dc23e795e6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 12:07:54.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38tiI1PqAu7df13vkkXNgHqHtGV632AkklnQEdp5v5bD6rwYFZ1Cs5+gr82t9leYt8ScXyYhr5qCpbjPIZTmG9+h//6uLYTV87ixfB2aY0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7359
X-Proofpoint-GUID: 1gXllQyoRvCBdL38StqJpttHwwOlwFf0
X-Proofpoint-ORIG-GUID: opJZgDkDwrCujOOfX6-q7JW2AorQhP2E
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194789

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Issue: LIN1022-4854

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0035-CVE-2023-39129.patch        | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 3787063cba..83dff20855 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -69,5 +69,6 @@ SRC_URI = "\
      file://0032-CVE-2022-47010.patch \
      file://0033-CVE-2022-47007.patch \
      file://0034-CVE-2022-48064.patch \
+     file://0035-CVE-2023-39129.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch b/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch
new file mode 100644
index 0000000000..63fb44d59a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch
@@ -0,0 +1,50 @@
+From: Keith Seitz <keiths@...>
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
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -159,6 +160,7 @@ static file_ptr linetab_offset;
+ static file_ptr linetab_size;
+ 
+ static char *stringtab = NULL;
++static long stringtab_length = 0;
+ 
+ extern void stabsread_clear_cache (void);
+ 
+@@ -1303,6 +1298,7 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb::unique_xmalloc_ptr<char> *stora
+   /* This is in target format (probably not very useful, and not
+      currently used), not host format.  */
+   memcpy (stringtab, lengthbuf, sizeof lengthbuf);
++  stringtab_length = length;
+   if (length == sizeof length)	/* Empty table -- just the count.  */
+     return 0;
+ 
+@@ -1322,8 +1318,9 @@ getsymname (struct internal_syment *symbol_entry)
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
2.43.0


