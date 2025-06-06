Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6126AC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 09:40:39 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.31])
 by mx.groups.io with SMTP id smtpd.web10.29764.1749202828104756773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 02:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=jR4q5ien;
 spf=pass (domain: prevas.dk, ip: 52.101.65.31, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inQhiADtTOVTMBXFQ2Y0kr4heebEwq1XllSDeD5/vBVcDde0nlpnkoK9M5vVjidlQCXLhopIY9E183gQaP1f+b0WzibsR3BcG5OtnDLv66BSz1eR4p4njjgc06KPDzc8zfRw7xN2Eb72fnvOahfyLuy7Ol/zdPXbk53yaCHs/6WVwXELU1KY2sFAdT/Wp/Mp/A59aIsMDirtOFtJz6uCS+/A/ABQX79+/NaxE/vWOnkrh0/HzM/DW9dg5ttVusST+FZqFj2ekGYN6x7Pw2Cpj/nnOImV8xDedcFuOirP0on4e93hoQJw3zdgpAuG77ehYJ5yOJuoW44VpVwbbM95cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ax+rMhV6aX4KkmYtbFvz4dIMeFaHr7pZJShzO1r+hSE=;
 b=QkPZqzEOsjSLqogjnNnI0XqCUZ+6Ybh9LUAPfbG6KnwTRsN9J4DcNVjpVGZ/YKk6aNzLCR/meDOmRj816zI5sG+zX7joJ67vnebvpPHG3yKnnlqAjaPI3j43eqmdbpRX2gYehRlSU6FHHegPcVfXYF8oOqJF49OySQqtC490QfWyLI5pHIZXsQsyT78R8k8fiepo9PAL6SUokTi018ZKfLOqIETDDdQnPvJ3v/n7rzzxTJxUWPB7613J7B0bPjAjnxkyVlCjP040xHzsWwa3UVwQ42b7bmhIG+PhOVXJoE0fQZXLdsO5ffGTo2cfxDkhzWP+fjcCOzCwToZePg/AaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ax+rMhV6aX4KkmYtbFvz4dIMeFaHr7pZJShzO1r+hSE=;
 b=jR4q5ien5fCp713Sxjj/hBamfyhJoR4rFH5JH7Psz6w0yVMLEa2/1lk8N+FgMThkJ9Bwx37oB2WweexfYHmlxEq8MTzRUCpGHSYm0LAl2NRGQ3ZD37TEKhM5oKfTz98Grg9IYMkFNP58zXenrfz+UHgvBxTClC9bD0uyqLB40ik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AS8PR10MB6079.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:570::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 09:40:21 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 09:40:21 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] sstate.bbclass: apply proper umask when fetching from SSTATE_MIRROR
Date: Fri,  6 Jun 2025 11:39:05 +0200
Message-ID: <20250606093905.2715221-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0068.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::35) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AS8PR10MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 947df437-625e-4b61-a8ad-08dda4de2777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QWG/It8LTf1/2M9Qh3CRxpuy6inEJC53Cl76F4Wcopt3mSciz0xfyIkSzX6p?=
 =?us-ascii?Q?ZNqBVNbKWyAOR2ux42VFFEjw3t7JRg1Rtq/JCM6604EUoR9uOGjUJd7CKaJ/?=
 =?us-ascii?Q?dyNDVLzMErU3njP02NIQhxEsRYeMTUXWwT42paIFqpKMM/RvRVhwYz5ew27t?=
 =?us-ascii?Q?pkkBa0Bbj6S9kUpdxL67zUQPK6zuAL4RFs9ct3OiM/kTDqLvpOPWbIT/A+H4?=
 =?us-ascii?Q?A+fLvwayAOgxrwJDf8YQbHcb4T0qMI53B6KpG/zKCCCg34AbcpbYJiPDNrWA?=
 =?us-ascii?Q?zKb5YYl/t1ht0VuxZmopwtpkeg8NtbIwbnMel8bGiRx4CVe8Z1dG8kpLwomW?=
 =?us-ascii?Q?mNX63ouHrJckcMw68GgWFoBo02NFt5v2IQrRhjZrzTRm0sNOD95CpoHOEyiQ?=
 =?us-ascii?Q?ocRdUVrb+FwX6P7+D1mdkAEEGbzkn7DTsNUiW23vghDJBrEUkx7X6/ZHamgU?=
 =?us-ascii?Q?lhFXZvgF73koQYyxmxnuAv4mb+GttNksaIqsJVTOGyHsnyfjyD/089WrOhCr?=
 =?us-ascii?Q?VL08chm2LemkgivF73xOE5yiV87QWP8papowmxgMPczzCUycmZKH1+9lxR7P?=
 =?us-ascii?Q?O95ra0INmPnYkn+nyLjDF9PR3pQNYVP79t00+eP3f4G5FK6N7IncB13ysIm3?=
 =?us-ascii?Q?lhVWnG1r4x5UcnD+ez7nAAKj/jJ11DzFCk1N/UsJ/uL88PR083t16vFefXSq?=
 =?us-ascii?Q?IiURnxQDeWQZ46OapaPtys8atILpavn+FDSWkiZaBECZksIdpfQ/YvIBDX6u?=
 =?us-ascii?Q?hId59wnf+3DA3zJolkmLsB5UFSAJanX65lJ7dyB72cqoSpdZcCbx0VSGGr8v?=
 =?us-ascii?Q?FWY/JPgq2AvWiHXjVSb+Ewglko7TBSN051DcuA5lF8xnTWl5zeIxACcnCqIW?=
 =?us-ascii?Q?9Y82rWNq589miaOQ7B6v0o/rqO9UBTxtorDMgUcKi7jupNO3ttF7mkac76iW?=
 =?us-ascii?Q?IpTC4S/OdBjLH0dtlZm0y78mvGDT2WqQq/ZEubIhUWlO1qjNJlgzZUSQsM/5?=
 =?us-ascii?Q?xkNq9AQHFVyXerENhEDqllANfAGs1cHzOV+nqW+ssexeb57q0XJeOfU0n8HR?=
 =?us-ascii?Q?7cYHQiOxxK0/YdsLC3u5xBoFLSirXH4G8wbi7MkBsNnGyEI8LdyjLhjreIkY?=
 =?us-ascii?Q?EQZdp7c5QFOQMyEfYwFazlikAti4IQktg9SOr0N30re/glOUtOvNm/4Lnjd6?=
 =?us-ascii?Q?tYRPlXuGUAOQU3ebvDCJZJcEr5HG9NnrmvT9Ut0XqvApLLFIZYLhYgf2rnW8?=
 =?us-ascii?Q?eav6NvpjJLxu1W2AgrXaxYRq5HDbHus9viza5xlOGRgrE1BhMgCsRZTaEl7A?=
 =?us-ascii?Q?54OIQf3+0a/6fUSb5Jh1ml8UGiIWZpQku4nAdZ8yd+27HRbDdIrt9IshvRQE?=
 =?us-ascii?Q?BmWaYxtJOXyCqtVhsziF2uxHhqG0huPYVGktfx8hv95xmxFu+NNUmPRlXW2t?=
 =?us-ascii?Q?zR5DbzXMKypnDhmAL/1ZCpjXaIIRC2a3XCPC/d/8KiCLwsoqIHrSMrYhnDd+?=
 =?us-ascii?Q?D9XNJkfyc5/j/Ys=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XD7eYhaHKtMAS00aqHm1v7Gb9P6Vb6Xw/fTKTi8Apv798LC7SLJ49IPpXP7B?=
 =?us-ascii?Q?w0C2CMGQPwAz+3S/aIO59EuGwyOiKwSM8D6quxFXDwrHMVgAYChnQ+RIbQjo?=
 =?us-ascii?Q?E7agM7p80tIWq4EEi83/MyJXtBKdUlhXytxe0eGrYQJMgeUS0/YhCYegqzHA?=
 =?us-ascii?Q?f6nNDW5WeSQ0pu6n1d0V+C6YjG2xC04FVeJnFblb9qD1HWO+1582l7IktJDx?=
 =?us-ascii?Q?gGazFA61tsODYMdLuojJwmAvmGVZH7PwsIOD+1p54sht9ZbGsrS/bmH745jT?=
 =?us-ascii?Q?O9uFzy958FcSUBL2/DLBBDsvK8tldgpbo2dJ873gv2ieroejn39fax1UUNka?=
 =?us-ascii?Q?oHEeKg4L/QJNgRjTPnHb9RK9jaKL6f3n6iPe7VS0CJ4Ro+WV2dvBtNPfoLL7?=
 =?us-ascii?Q?GWcxkmvEzLOS+3VDXjDuKEttVXxfvdPIPYeWuvGp/6T4KoaJK38oeTMjX7Ee?=
 =?us-ascii?Q?PKPXu/M5/wezcG/6NcvjQOjGcfkRZ0n7MbRWrNRA9Nfmgq8O3zQyiKSwEWOh?=
 =?us-ascii?Q?Sdi4cM3R38KqhYeltoNOc0/rhl+uc1dgs4yzttNno0P/efw85urwmWu4mZlh?=
 =?us-ascii?Q?W+QvHru7SL+fsihnxq+sdSmwi0hAXN9dQ7NcWQ0rzGGlVr6Gm0OnHaezyZrB?=
 =?us-ascii?Q?rLdIEZ0beng7FsRPDbUzNipSCiWhTYNohLrZ4ArHjOWgdKEgFb3u0HqkG+AF?=
 =?us-ascii?Q?vzcCxP6NT8Br73s5b6I/l4KAo9RPCreoDE1QiPae1YrtUiW7ls0lO4DYx6+J?=
 =?us-ascii?Q?0CdTBNWg7W9hVAtAuBSy+eQ0UdwPme8r9pIGuIP1aHCz97pUBQAMN5VPJVpY?=
 =?us-ascii?Q?Jt0phPhP3WacJUHNueiY2LIqBikFRq3nsd16/nlAATaqrfYfQUDoOIg1lWza?=
 =?us-ascii?Q?kqS1cu8DB93WRHh/2bYHdxX1b1aagJOqebyYKzb1wX8FpLpr+jIuEMJocErG?=
 =?us-ascii?Q?DlmD4UGxToHDi5VPFnlS5K+waJExSQGnObh0hTFefXna7q1sGlQ8ubs6OT4K?=
 =?us-ascii?Q?/ae13V8gJ7KhohoE1FiG0h/Uy2hWl40vBn2wk2zAatYKpbZc6tzF8GqmukxA?=
 =?us-ascii?Q?9J11fgwSHMeOUu0xsFv4kgm3XIOa6B61eVtijEPbm7O9efYEvUt5Kbs97UPd?=
 =?us-ascii?Q?3E6fJ6asy5gJmZPBJjQHKbrWGfnaS26KVKyzpqO0uMqwcs7B3/mvDqaL0hEh?=
 =?us-ascii?Q?YCqiyhOiAdYCCX8d6vOl7gKKZiGFCXkDkJPy47CRtx9gBjm2PTkii6zpJexR?=
 =?us-ascii?Q?+JVflbuhabvXY5ktcqD5bXHvKtCxxChOBudHUY84lXG9D5nFlH0oohDrXjZ8?=
 =?us-ascii?Q?a45M96ENoUtxoG8KyNWMMXgrZqBX7TZxLuM/ztHYGGsG1Q7moc2C3oHZCxtZ?=
 =?us-ascii?Q?Hy5zlU7uIDB3wj9xtfRetW31FjW1Lq0y4oSFOqWgjGknxVuI7VJ7OSd/wiy9?=
 =?us-ascii?Q?b8bUcUVXHCtKM1XgfG/w2VD+qYovW5HtuzUbYNAFC7x2gHHDpatxLPAIJhfA?=
 =?us-ascii?Q?/t0zF8toBTjzd+c9H4LV1pf2rP6LGadi2n2SkbL0BRllKsiBhF+P1vkix787?=
 =?us-ascii?Q?VUnZ8F7zdcMVXS7nkdNzNKCVDQE/QAZmrKyoCqBqLSA4jkYw2vjwR0oTmjTz?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 947df437-625e-4b61-a8ad-08dda4de2777
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 09:40:21.0665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0sGJ5ur1P71IUwwNI50EqRXnk5N2mdLVJhECHbFd/u8oOVXA88TKkaIJcfJIoD8RFNuOGlrFMny4fNVetch6t52OvwNwryMJlEbQMzl6sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218125

From: Rasmus Villemoes <ravi@prevas.dk>

Currently, files and directories created under ${SSTATE_DIR} when
fetching from an sstate mirror are not created with group write,
unlike when the sstate artifacts are generated locally. That's
inconsistent, and problematic when the local sstate dir is shared
among multiple users.

Wrap the fetching in a bb.utils.umask() context manager, and for simplicity
move the mkdir of SSTATE_DIR inside that.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/classes-global/sstate.bbclass | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 1d7b033b80..2968cc4c2e 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -726,7 +726,6 @@ def pstaging_fetch(sstatefetch, d):
     localdata =3D bb.data.createCopy(d)
=20
     dldir =3D localdata.expand("${SSTATE_DIR}")
-    bb.utils.mkdirhier(dldir)
=20
     localdata.delVar('MIRRORS')
     localdata.setVar('FILESPATH', dldir)
@@ -746,16 +745,19 @@ def pstaging_fetch(sstatefetch, d):
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
         uris +=3D ['file://{0}.sig;downloadfilename=3D{0}.sig'.format(ssta=
tefetch)]
=20
-    for srcuri in uris:
-        localdata.delVar('SRC_URI')
-        localdata.setVar('SRC_URI', srcuri)
-        try:
-            fetcher =3D bb.fetch2.Fetch([srcuri], localdata, cache=3DFalse=
)
-            fetcher.checkstatus()
-            fetcher.download()
+    with bb.utils.umask(0o002):
+        bb.utils.mkdirhier(dldir)
=20
-        except bb.fetch2.BBFetchException:
-            pass
+        for srcuri in uris:
+            localdata.delVar('SRC_URI')
+            localdata.setVar('SRC_URI', srcuri)
+            try:
+                fetcher =3D bb.fetch2.Fetch([srcuri], localdata, cache=3DF=
alse)
+                fetcher.checkstatus()
+                fetcher.download()
+
+            except bb.fetch2.BBFetchException:
+                pass
=20
 def sstate_setscene(d):
     shared_state =3D sstate_state_fromvars(d)
--=20
2.49.0


