Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FCDC47DB3
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 12:01:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21056.1706875300178035796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 04:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kaCkL+12;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2762b925c8=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4125P6CB007365
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 12:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Y4biGq34sYV2SRQIL6
	MQpNqtC3Kg/lmD+cORM6UvON4=; b=kaCkL+12L+XGSrpkGXawauHkI/X/4KVOOb
	8uPEAOxu0Gs8XTEwJbfnPuSpwP4KfCtJHuoV1usAPph6XOixS9iINtv0uRPayya1
	/U6amfkUQLBIwm6y2qTivdAtIwU51jpBr9GexXmAgZYzl+rIKmv12bzlWw8WhQmF
	Ql/O+ZMtMQyxMS3iM8+lKbPV+5AGdY0hbszsltZnFvwEZdmQdWlnQcvfkFhUx9fD
	YkhL9qLXb5jd+lS2srQfPmMeoKdz5nL6AWcNYpeqMiS8rgjMKqX0vR54nH35rhd2
	xEr/29+o0CUF93X22siycw4ORjgPR7AqMBq9AOaSnVPKriaRwBrA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvg0d4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 12:01:39 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 412C1cn3023743
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 12:01:38 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvg0d4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 12:01:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQvPGxDEbzOshrl4EgLKddq1PsXubv+9/rbwQnLsqeri/vxHMNBhtpknKsD8IPf3ulIlaRCGfDyn7pmHQ9nFxHAAtxmUQReYjlBxukila+NhJsQvkFzZDVwSKDm1IcfrU6vBQDdzzzRFjBm1qmnjrbzSgG0YW74iUUNSBqjX0yo1O8P2DGNlIUBYuvgpJiEJXyyVe/kUnj7AOPfrdQTCUSI8OPPEg25irMa8v4VsZekLmNoOPKDv23d7p0dMyB73iFRA5AG0PWzG4CeFJvb5f9lNqPfxyQVOR2IiwZ2k0q0QL0ltRpmtMGRI15JqJSSdkguTbQLpdEqygFM4pyRDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4biGq34sYV2SRQIL6MQpNqtC3Kg/lmD+cORM6UvON4=;
 b=JCe0dUL3iOfnKIW+ZqRKH107OW0cL5VM4rIRxUvrRk+9IeVgKd9I1xc0tFN6s5YPWwrTyhsICGrB+WK75oNJAk0TrNwm3nrcs8kPjSH0gjXvFRkVxV/GqTYVezqc77lcPcLsbkVJL9KsWQ69s9ApLl4RMO/sgzTcP+xj3SnZA1vAYiv8BZbwiG4aVT4O9S5FVphTQ0KY/OAiI+NfJrm5xvM/+NLe2pmDnkS/9YdTcNT0kQniw28rCxOVa+k+K2hvE2FEc/VpHLVB/nuXTybzClJ1pmfC0c/j5UwN6OHMEIsFSeijow/I+1V/+AaDzlQuA/ot/FmLFWsT5RpRZ1xKIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Fri, 2 Feb
 2024 12:01:35 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260%4]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 12:01:34 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129
Date: Fri,  2 Feb 2024 04:01:03 -0800
Message-ID: <20240202120104.3735837-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|MN2PR11MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: 6428eb5e-8071-454a-0100-08dc23e6b3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	95b/c4UgKGu4S1MxLPx4WD+Q62Xv4vZtUEzadhi9uSzcMh/tesnAqyUzLwUF3fxshPAaewbJgie9ykej9/8h/tLJJIssfOH48qx0I7g9m1M0ySm15N7/1gSeD3+78FvIPrEbuF5mc2UBIRQolXAAc3deq5o/w3wJ6xFF+WdD6Zmo5h+SQveeqCiLv23TM25hPksV4qJ8LF5wUzH6+1Ij4+LKfAdG0dWIFSvCDnUYC1VyXlQ9gKTuGic++Ufn3eLx54GhizKRvvWY5OP/IWWZG+ENTEDBj48GUR+kMAicSqsgrK1f8Rq7v5P1J2BsL0RVHWBDYLpswx7qZIx+XBTuHelJid1NNeEhjkfCs0EuJaRgxO52cIx2PBe8T2brF3xtULCKLnPzDFpdqs3hJ3cH43PUpo1U9YzcaAEmlhVsZlrgqAZiGExETYZr0q8JLQj9+ppc8KwoLUa295R1ZDZUgVn+NFtXZEMdBPlPYRDRIMLEhc9UfMpAvmHYxM7k/Ynv68+0tNqCca4vDXAww6pbP2HXN2jmeys0TtvdBi2m+osKEiFa1690x7MUSAiCFDuxnlQTNJ2G/DEz0O07aUgp1wjH2tOQGMeJjF1q2jhJSPE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39850400004)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(66899024)(86362001)(8676002)(8936002)(4326008)(9686003)(6512007)(2906002)(2616005)(26005)(5660300002)(1076003)(41300700001)(66946007)(66556008)(478600001)(966005)(6486002)(66476007)(6666004)(38350700005)(6506007)(52116002)(316002)(6916009)(36756003)(38100700002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dt0uP6w2shZmuwSlGVZipCdgMiz/YOJJukPtHalviqSaGsHCUZq4rDSMEYUM?=
 =?us-ascii?Q?nK9t6ET03+GmQ92IxcHdPC7WkevGGOw7Lnh+QSW4ihYUKvLo11Y7LWRU7ODK?=
 =?us-ascii?Q?4AymZBLt+ZtJa4tH5Ysro+vFCGxlmKmVRrwWY7snmf4XAc4gon2GqGlAtqdM?=
 =?us-ascii?Q?L8ttypjaZCsdkAMaonYrHQXTaGgNEfUlRC5Rfh+cM1OlAdUjpGBZyxpa0pag?=
 =?us-ascii?Q?Md61egVGa51MEkAvUs5S6sEpo6K+HhV9NFvUilwmw62/vctTM/wcyvKB5kKE?=
 =?us-ascii?Q?JAxBC+71uygwkDWLsWGF1B6QRCKJBJ0gNJRiOX2xr7huKV62TSu7iqj0K95J?=
 =?us-ascii?Q?ccaQYYNokw98PtihMh6ePNzsky/8rTpH5MKGt++P6ylyKuR4uXVQ8+iaRt8N?=
 =?us-ascii?Q?OBBoJKaL5nsilqhyYq0kFVPS5rsuVVCrAzQC4fsxNCMresa8+KkrG6R3tN8m?=
 =?us-ascii?Q?0tURfNWGrdL920RJY+OWGs5wW1y8+0DpnFCjYKYbAuXMaZ+Loh/jrhScsXWS?=
 =?us-ascii?Q?4C2tp1e/2itdR16z4O03FrfS/6w/KzgIzqqLgQClsVB3vLZq/Sl7kALaCd5v?=
 =?us-ascii?Q?kIdwiZBxVdd8SpXDCR9biZZT5KIqrLLR0P3L/lrIZoR87aVEw1tU2ihIMKa2?=
 =?us-ascii?Q?xulLJaSWtKqE65A5eRm+LiCjmEiHH9e/9qMTOsA2seFu6NMrok4ONJLi4rI3?=
 =?us-ascii?Q?jBOAmRrwpaZ096FQ0Hjj7seXxTz4KZQiLocpZLs5dQ0PoydWZwABVtEFD4Id?=
 =?us-ascii?Q?5wuU/1KMVlvv5qEHR8SETKE14BDUGd4dwURHyvononUj71aNhjfHtgCPI53o?=
 =?us-ascii?Q?TOQgmToWUZfLwZmDJ61zd6rLVdypCY4f9aAuiMsLHMJEqdEr7NcEnKGc50DA?=
 =?us-ascii?Q?ris8YFY2q3hGbzIF3VxmqjNmp87VeJo9E60SNRoV3QmGNQEAHs9bM4XVqmP8?=
 =?us-ascii?Q?PJiSGgm1TxlGdqfri7e92OkU+F0fpIPQ0Csrf3Z3z4IzH6AZK99couuaOw4x?=
 =?us-ascii?Q?MOCG7ie7OW9Drs8ZSETzWI6E5pCXHpy3jxEFZaeXQLFWI26rgmSYUsENvnig?=
 =?us-ascii?Q?twsjn4wo2b/gt+HeYeM9oqZ46HyJipj3nuxUl7UUcnSQ5Mgr94z27PCFMSqS?=
 =?us-ascii?Q?SFyDyb2oMV+xvX/+3Yusw6ab5cg45y1CSLWG26LBTxgXSLcTbcw2JMSq4goR?=
 =?us-ascii?Q?D5DdaZGtF0cdoE0DFKce3yB/+szDCusFY+JiUs6/N24SbdIImchB8BWrmVUT?=
 =?us-ascii?Q?oLy9XW3nP+P/+TLlEzyMePoTe7kWRSFYZi8QrwhMCBK8qXW0im6WbZ+VJSwA?=
 =?us-ascii?Q?s3sBb55HqJ/Kzlg4IMJWv/2bqvQMODNHFYu2ygajsD4ZyIp94m+CB1b66tlZ?=
 =?us-ascii?Q?F9QsXuYQ4xHjTxfNAkvoCqgYzk1Gyg8zerNDReyIE21xYaZEyss+CwRGX44x?=
 =?us-ascii?Q?LnFPRGurhuVo85tQUPWcuG4VHY08ydbK3kg7K2HO8uKwS+gMiAv/gdUQ0ET0?=
 =?us-ascii?Q?9zAUms1VkNKXYCI0n9aV2m9+lvI2cvbt2wrhKOsCpXZXkKNEAhtKf0I18r07?=
 =?us-ascii?Q?+qQljsQQTjkZfa4LdDIXi4IvkfNHerh+gHjm4cUd23fKDxF4Y6mOgBw6Db/5?=
 =?us-ascii?Q?ZA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6428eb5e-8071-454a-0100-08dc23e6b3e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 12:01:34.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5aSruWaqHCsG88ra+Azg1aUizBKqek5wo0kJk20/bOvNOFwH8L8fSSQnAfKWeHGv+DmM4SxMO+exOsbds5K/9NpWGK503LhPDocNrUznyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
X-Proofpoint-GUID: J75oNbGbTAydx6vJm-3ZWbpbA2QyYe7D
X-Proofpoint-ORIG-GUID: tPvid3D74z_Z7Dr-A9W_LdAsyzkkV9MX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_06,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 12:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194787

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Issue: LIN1022-4854

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/0012-CVE-2023-39129.patch         | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 099bd2d8f5..ad2b3ad4b7 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,5 +15,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Fix-invalid-sigprocmask-call.patch \
            file://0010-gdbserver-ctrl-c-handling.patch \
            file://0011-CVE-2023-39128.patch \
+	   file://0012-CVE-2023-39129.patch \
            "
 SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
new file mode 100644
index 0000000000..63fb44d59a
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
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


