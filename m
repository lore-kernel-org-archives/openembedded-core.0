Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E68C54ED1
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 02:09:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6521.1748398186354489639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 19:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7243b7192d=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1qCnm022130
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 19:09:45 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm36ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 19:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smrlZErFkyMG5zXhH+P5fH+vcEb5M75Uc99jxA5BAkJixcFChzPqOuJm7sKtnf6QrlyQwFyvQDQn21Ale/ST6VtnwcIaTMS79sxGL2fXEY7MhA+6415jlkUNVH3spy/oXZJPJDGgXaHOMiySQa8Hz3/FmfuA/o9Ur1wa9En1MQxbt5vN3Vj63750kal4mvuYfhesqRvyWI0Pzv8hNwraDt4v9yvxRpUIYt7kQXdgCjo+I4zfm+YAzFdrcdZWU6+uiiaRNzjV031SeL4cUjndmrPBv1KDnGTTLMEEIu6YBf6qs0b0X0A4JWV2IrbIJEoWijrE2YnW5Vs+xrkSnPkDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14z9WDkVu/wYGo6iF8/AcL+ETOA/BZgd1gKEyqN0gkc=;
 b=awX+LS3lPAaK/48g6BqTD3iz31BQqJdUbreaWO6hNYVUzndT1hPK5MD33cxmQ9jG6jlEDv8eq9l4xfKmYyhBdCHnLluddtlLpwwanpcj+AKaANF22lK1n6lh2j4me+rck+rMpGF1dt+lHRkNJ8OUEmIFLa666LZ6/quRDCWXluojBI8RWaMmtgRay5HDZxKe9c1sf2TA1YEAisKGVJg2WKeQvRluWdUprqfy+SGQi++oao4DxIbBHxipQXRZkr1lGZzxroTT+tgRkNeFvCPEEBlKCHldhcPnaLIVleBWx1Ssu27M2LInpSzHfVPxCmj1NJcvux2z9bzVqI+pEfwSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA1PR11MB8522.namprd11.prod.outlook.com (2603:10b6:806:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 02:09:43 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 02:09:42 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH 1/1] nfs-utils: don't use signals to shut down nfs server.
Date: Wed, 28 May 2025 10:08:52 +0800
Message-Id: <20250528020852.3765606-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0266.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::19) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA1PR11MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 900497ac-f459-4138-02b4-08dd9d8cb5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CAXEceuGln0Ceqx5t23HLg90M9wv5fUHhp9Y6LsmBKxw9I9B1UsepbJ7Pxv8?=
 =?us-ascii?Q?bHEmEqyL/7k8ufDnly1GVbUu6+vnh5QGKgz2IVMp0CkRKLg8mc7uNyExtbMl?=
 =?us-ascii?Q?FzWcvu0Ezv8taQ3Nui9yUBK+0h9wuqxxa0ZPBTd+bMtsIVhE078fxVZzowVB?=
 =?us-ascii?Q?fr5Y32mWFQiJ2RAZ5Ngi03ytKmr0O6zfXNeLLoZupb8B4IDejoGD0K6Qiq1h?=
 =?us-ascii?Q?xy8VTp3KnAoei8V2bekkdFkPxA7p0mJgfkHbRmxKjhcrjKxQrEd3R/nobCa4?=
 =?us-ascii?Q?lAJoyhyV3c1eqH+h25DoZYNh2+LxfrXLWfitSwjV7hOJ1OwowgOK/d9DRgii?=
 =?us-ascii?Q?lECuMoAKV53JKbCT3iH1FaiPKwT0/9rn7Br7j+GeHTIMDHX+lEn3Nh9pf5lM?=
 =?us-ascii?Q?RBTJ6BThAhJeOaRBZadVz7rjxLL6My05qC2dOn2jzQDL+huaNEsT1ezt1SoO?=
 =?us-ascii?Q?8e3AfAosAcr0B6mfwT/QCVhGAaw9KqieZldqVVRP6wcih4vKIIdpwEefiwhc?=
 =?us-ascii?Q?CwoitVedn0ok28gCc8svUv7wO1zP+niy1CJ7jRdShwFGWACjD17QFIJNcZE3?=
 =?us-ascii?Q?3ZJ/JPqrJaMkqfn+uDbvU9hbwMwPP4HJJeN0GQfSICVh5cFCTAE/5sGmU6RF?=
 =?us-ascii?Q?aYLTGx3PIX2yi8TTMJ1fyOyc0Xr0uMdugpY5SQ1RcW0JZUbNeDAGZGIlL9ES?=
 =?us-ascii?Q?CUxt4Nj0634Zi8ZGXmPR14pLEBP7ekWNJPZPjMAUKqhpm8vOLya6JI928HDB?=
 =?us-ascii?Q?qnrk5CTpED10K5v2mYJwlvPXs6qz9RBP3VEgNgKN5Eq1HQaSM9RSF5LK0c6p?=
 =?us-ascii?Q?QVl7Zv3y05L4CDUWQQQqPVqXa+ODvz3M1dpela3BDGpQfkvB+K0H7Fnp6fVl?=
 =?us-ascii?Q?VqWpHAvcfts3rNAFzcB+Omde3/r55HuVojaWkdtbKiqig94L3ZNOmZ2gVisD?=
 =?us-ascii?Q?FEQTIecBpNmHsYg+KSWz+pJgBIYyHP8Dg2X4p/OVsM95to0xVj8tkXT4si9g?=
 =?us-ascii?Q?YSD8JM83bij1c8aGpXLNwwSPgoTHVrW+8Dvhkeu7zOm752FtsAMx300JBgMr?=
 =?us-ascii?Q?35lAzclhMmMLDNNi7nAfJTJq+JID+knLgqNilyDgTy5ageDahs7YV4eRDPF0?=
 =?us-ascii?Q?nkJvT75Dk2yFjiR6iHnk1scheB+vYPs1APxDRsM+qlqrLjX+gQuNboUIQppb?=
 =?us-ascii?Q?D5rryEaRD4H87qx8yCGPI33ur1Pc0T0ZHi1PLDUT6NNbItk4giTsA8+rabX3?=
 =?us-ascii?Q?weSRgLMy5FqmaCSvPTXGxwYydNdniPpQtJ7+1B4KhpKw6+fcaCAB74diXDjo?=
 =?us-ascii?Q?JNKJ+MpxhhqoO/VW7RCm9AtbnseS02D3oBE9bwQoT+Rj7xpWNuJxv5TrPiWp?=
 =?us-ascii?Q?brw2ipJqirl95uSfQiFMjK+ZLzXiodr5EdwdsbHeP0LCMk/3lEsnpfY0wp+P?=
 =?us-ascii?Q?hNir0rBtuRK705NKnBHN/6gU5c3HIQLZEAMyFpVm/IdIoWxUoumOBQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3Pa3sj+v9AMJcH4SLyx9UWYTYTrtCiK+JG6eq7hP6sgPPvexynYw5K1vbzZn?=
 =?us-ascii?Q?06/n0XmG6JjOLVwWu2ibbR63T8Jz1w4X5uVelsp7+iMNh8slPIi9UV+zxUSc?=
 =?us-ascii?Q?srEx72vcogW7O4c5NcgZAza2oI3uuRiYu+Nc1ejbxUG4w04An3fwZmVNlimt?=
 =?us-ascii?Q?OisgazR0vsDptV/6wKRbR5y1T+qSpY6tkkDJu4Ftzu6phxGL+e922Wm9M82g?=
 =?us-ascii?Q?Hweh42Qbm5kuqwWL/5BHf3li+gNTAR31cdnD+hOWAE59QDAMUBq3bDM259UY?=
 =?us-ascii?Q?cb1elNxTcGFmXk9l5gpxYa5z1e3O8kqD75wADiieQMr8OhluQe4xKCpnejSc?=
 =?us-ascii?Q?4gphPL+d+TuCSTNdrIeN+ymidTnRkBsFfvC2rIKm0iiGf+Nc6IxQ2nALDGe4?=
 =?us-ascii?Q?ge3Thiixk4q5WnLzwDhcnKe6W5N52/RZTBY5dEl19PsIpv0nPrdAlvtmMuyw?=
 =?us-ascii?Q?tJT+z7UqGJCMILOH7bIluXrkCR0Hvrxsz+Eznk0KuMuHbZFkKJlCT1TrSTxx?=
 =?us-ascii?Q?PLjrtCposRjMAgr2E/eLxFTolJAL/lPs8eSpwzVo92U89Eb1WINdyY9pNgu3?=
 =?us-ascii?Q?GFHg11wmXN0SIYdDwSBA4g04r9VMwEtsVnlBan4WDPxZ3Y9WZBEtnzzeRBm6?=
 =?us-ascii?Q?UHiwWT/1OYVy6FoGUz4KDJnz3JkUZuCWjrZ8bENxYfE8Ebm+VqJO9xqKP8i4?=
 =?us-ascii?Q?QpM1M0/TRgjBgCTUtSYhyrPjWFH72z3GH/PvZOgzWEad8RSBdtV1EHY7D6ru?=
 =?us-ascii?Q?vQqxYsktI/Ytq6MkZOL5o7OoqnrgJTKce1w8ytv5F9RxUGO5+6M4t9jT8hhe?=
 =?us-ascii?Q?u52Ud2BYreuG+S6+HRW9HnLvaJfGFRRaq4bw4+qrUXXuAbt6hDE2akpyrgJP?=
 =?us-ascii?Q?OtRaDnswXEFXa5eDxO8wqTuFHSRRUk+0ZrraGhVombwX2q3E6NLHSpHyOONM?=
 =?us-ascii?Q?/AXg+F03wDAYpDxHv4M94/zbioVNyAGE+0gVjjIkiQEJxz2B9hL076Bd895D?=
 =?us-ascii?Q?hmLR7uwu4juVYJCrqPdhbDdltdCBdsupHjeJl3FkTkaqpgZv1DCOt95guRYO?=
 =?us-ascii?Q?GgkkyWZrkciZVVjDiOWfgqHxFuyQ1nDqsfDbFwvxmubM5sO3td0ARTzl+/Km?=
 =?us-ascii?Q?tBxw+vGEuY3ZliUWm6mkjyPQ9fP0tW50w7Nf7gMmoKBIF6jfnHnqfieBGFlP?=
 =?us-ascii?Q?V1PTu0jiLiPexwIrNmenX5tW4FQ/hCT7oRyBa43nriEcCXpShGcsJAGE2SN/?=
 =?us-ascii?Q?TxQY3UlL8PYSsb7pdiUK00dHmEOA7UJY061YnDsMRYQoN6N4texvuL2rE/jF?=
 =?us-ascii?Q?00LyiP85L7Nf+5Z3paWqwegA+vsO4wv73FlhSwduAkwcrRAlfbzPTEl380AQ?=
 =?us-ascii?Q?G9gGJi1YgCXCxZZME3WEAxxGnlG7SCLJ4eCgE+1HhXA2Dh6hJRy1fV7Fr9hk?=
 =?us-ascii?Q?fPwRzorbpX7OTtkHum3NL4Ep6kkg4ZAHPhGw1ndUiycocwlMFrQqN5BjHDIV?=
 =?us-ascii?Q?AfvPxhO4RBDcweOY+Y8Pg3uAeYM3auZrv05NhSFnVOh0JPfqXBTEneUX7xEz?=
 =?us-ascii?Q?Sx3w+eqfcun9cgfsYoYtPBhbJGgeFpTdVxWh7zlE27xl3ZPXUUZAwU+2GuJf?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900497ac-f459-4138-02b4-08dd9d8cb5bb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:09:42.8471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EG+kzNEBA2yoPEapIUn9jBOEBoZEdFxyIg1xqyVQ7no9v4GyjPvMGehF62vFkVL0Ad6qgC4boIyxW3tt1Nh3XCRILJew8mayVW8YcPtP59g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8522
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=68367069 cx=c_pps a=5SMz4P2gKhLJVQMJtRKoOQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=38rMEbfbbFn23TXZ:21 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=gbk0yKnyYj3XjN68PW4A:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDAxNyBTYWx0ZWRfX6xj2TutHMBBj zMOnnE1Rlegfrs+MrRfgPhvnrI2PifXsqA8LEgQGooUzQZMVsX7A2OdRb6/xpfnpJ8LDxmpkMoU wlcQiuXmgdceRdn3mWdacFEOPOn941CW99rLfayXYyT+HgzbzRE3keBbhYIYXfZ/znnRWLJ7+11
 ZYXfaIoowhENlhJPfYVT8kimB+3P6NFqGllHKc96wI9ZQF0HZCzQt8GYhaOz1K6ixrAp7aez8+5 74+F9GfiUIUnpUq/tsQ407Uich6CvCFXY6yrhdTOgzcUVqquMzy61/6SxIyWdqW2HBrvNMg8B/3 RvForEyynmPftDUUxCvDiq609gwDL4gXrAmD9WuF5dl5QBsj2xGhuMDlf5MPvMrqdkE+tHbeTWV
 CakzMDT+hWzeN1sEEy4fVpAuHXMWyHnMtJSrUAg8942OzHJRUloYFaVSPb3XAt4c0yW/gEWR
X-Proofpoint-ORIG-GUID: _cuCd-teD3OxdulVjVqnbS0uBlZvDg0D
X-Proofpoint-GUID: _cuCd-teD3OxdulVjVqnbS0uBlZvDg0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505280017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 02:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217328

From: NeilBrown <neilb@suse.de>

Since Linux v2.4 it has been possible to stop all NFS server by running

   rpc.nfsd 0

i.e.  by requesting that zero threads be running.  This is preferred as
it doesn't risk killing some other process which happens to be called
"nfsd".

Since Linux v6.6 - and other stable kernels to which

  Commit: 390390240145 ("nfsd: don't allow nfsd threads to be
  signalled.")

has been backported - sending a signal no longer works to stop nfs server
threads.

This patch changes the nfsserver script to use "rpc.nfsd 0" to stop
server threads.

Signed-off-by: NeilBrown <neil@brown.name>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b09ad289a36)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../nfs-utils/nfs-utils/nfsserver             | 28 +++----------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index 0f5747cc6db9..4d78312929e2 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -66,34 +66,14 @@ start_nfsd(){
 	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
 	echo done
 }
-delay_nfsd(){
-	for delay in 0 1 2 3 4 5 6 7 8 9 
-	do
-		if pidof nfsd >/dev/null
-		then
-			echo -n .
-			sleep 1
-		else
-			return 0
-		fi
-	done
-	return 1
-}
 stop_nfsd(){
-	# WARNING: this kills any process with the executable
-	# name 'nfsd'.
 	echo -n 'stopping nfsd: '
-	start-stop-daemon --stop --quiet --signal 1 --name nfsd
-	if delay_nfsd || {
-		echo failed
-		echo ' using signal 9: '
-		start-stop-daemon --stop --quiet --signal 9 --name nfsd
-		delay_nfsd
-	}
+	$NFS_NFSD 0
+	if pidof nfsd
 	then
-		echo done
-	else
 		echo failed
+	else
+		echo done
 	fi
 }
 
-- 
2.34.1


