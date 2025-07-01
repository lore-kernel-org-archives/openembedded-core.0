Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B820C8303C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.501.1751384872443143972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927761a2af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5615S6Id010135
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:47:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1b8t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:47:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hT2uf24m6lldm9WQDI9X9QaTN/J9sFrOcZ/Pgl5/7RXfSO3BYnRHMFhw0ZGI8qnj7sx1TqXXMAJD6x8f0LfQz6gJFn2zpMapg7nEG70/2NSVhKx8Dbm8FSXT3TATTDYnl9LHxBFvoQaEfgU0EQvctS1RNi3Owdlmq41jaAx8HYDKRarPQlskGXaWgRHPDidGUSJzbrTS2aCJyjjqOEy6JKOZwKFWFs+Se8EarH3selo7jMS/Z0zOFgRIba+nAu30A+aQAA+t5EBNFp4cgkDPe6dnNBl+W+24dnNHQjbxr2qxFlYL+uhkAk8k5fVIGR4aP0r0MpyMcqvJNT+SAyWGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKV65dZgsPr5lwEeKXhNhFNdfeYfPZVqmpcF7sykPmU=;
 b=PXyTsYQtI/2q85Ud/G8Q2xocSfJ8avB/3P1AkZWXuJoAlyKuEqiQLv1LMvyhQ8Xb8KL9ppaXCFtk1yyjuCUPyS6irk09jSyN5hvQ5j9iyUzZNB/7ZzU7Q/46Qchv70a7Nxd1INVleJCqRx+BOBkn7eS7GKhh/iNObTeyic4p5QPwAnO0KKVQ9GXf34vJNXn8i1t//q7S1mpL5xYZd+Bf4lynFucaGYqMsynfuOY2Pxgtt/BKkmiXlENS2UkVlJi33uQgsm6x5rAWjoaZAxg0y/CXTWZyOzBb3VeGh6o38yG4cKnPPeXJNbEvTBIwjZ22O7BDTQHcLbsq1qmtZmNpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 15:47:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 15:47:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9 v2] fix runtime versions
Date: Tue,  1 Jul 2025 23:47:22 +0800
Message-Id: <20250701154731.1465906-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d834fd3-4845-4d32-5006-08ddb8b69fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wrU5e8n4j9BPpKkKwu0pKSBsqH6cl4j/oFqu39hEwm52qxN76+jgVSFMnei6?=
 =?us-ascii?Q?AuAJdVqtzrpTfDkG2wTjYDseWxanVZvH/9GI3fiNz4av3l0tiPjXYjEjI5zb?=
 =?us-ascii?Q?tCK5v8Tf3L6h0PvBEYam9exhSwnXZXAbXJ5qTb72CcW4Sjgr/E0xHxLLWNeA?=
 =?us-ascii?Q?UbyOxGnbDwqPlta6l3vIoHk6pDI6OxI72kONfD44AKsKRQhMG0RNSS+QPG+V?=
 =?us-ascii?Q?bNinIpuZIvvdefczOz4KykeXbpvL5unv06Kgts7dCTs7vwXuyek8XLkTp/uP?=
 =?us-ascii?Q?XVmVzTpw86vPUupRTkWP8remz4+JWuijN/LiCQnWSFInz7mXx2P/ReUquMek?=
 =?us-ascii?Q?XO5h8e3jB7GfrAgQgQz5iF0ukmdgyDPYN3lyynRMU/Fa510317xn/XlBCi97?=
 =?us-ascii?Q?ex6HuttCECnAQd+5sgQW8llPsEwu+3514NOVbPLNjNkoYyl/lVsDamOU1OlZ?=
 =?us-ascii?Q?MSb6TUs49p19eNVujnmF//VUk3TYBY3IYhhYJdST6lNOqtmGICDqwABRnc+I?=
 =?us-ascii?Q?liHO8wQVNKuZ3l6ipbbjwWMi04QwD3UOPsFmcE7pqxP7YQ785H04tUSzlNub?=
 =?us-ascii?Q?3nB5A5GxLbs9OUwhU7f74zR2V08jvBhrd59Bay4//vJMRvpN3rJ5FNBYwLAj?=
 =?us-ascii?Q?/TzHWrUuZOE/ggsB6XZYvMJfoe1U8xywiHzEYV2SCVY4qSSRnDcrTqIGTSKR?=
 =?us-ascii?Q?VryrlepNTU25H477i+Pxxs7pA5k9b0Nivqn9EqQrv8P5SUNWwdx7X8PsyN28?=
 =?us-ascii?Q?j6x79pr11Lae3LCqpTYnt6ryLGv2+MXM6emNUB1MQ0Wk0MRSSkArn8meAK4u?=
 =?us-ascii?Q?lR1x6nZA0VloWq2VUXA4nt5KrEIyL3kx651cNsxyO7y+xfQnsj8Wx6OqIxa3?=
 =?us-ascii?Q?cvTSZkVfyX416yhZcumoNasxuQNWHx+wgDblvx8Rf92o8quKjQC9xL8tZgNb?=
 =?us-ascii?Q?k6y1FxQiSu6zIejjuGtjjPbc5iWXAHYPealsygkCANeHs3q0SklmKbofH8yL?=
 =?us-ascii?Q?AXKKmnzSsr+X9HK61hzI0DaMuxYKu0nkzxSK6ltIUYXWoSLlsLWOESe9Fi3n?=
 =?us-ascii?Q?V8MTuYS0Xq0H/Ad657SgJTZe5cMzwAFRVcetQ9dFp6ubOeZsw1UBgZUIWAxg?=
 =?us-ascii?Q?GNLtkh122fhl6MdIP6Js/h0gQTb/zOT0cjId90nG4uz2mTOBZbLKAVSzq3TT?=
 =?us-ascii?Q?3FKKgFnR2smkj4x0TS5ZmYVa/HyjBvj/iAcgja40kZkzW9ZAmRO2yaQRpXNH?=
 =?us-ascii?Q?qSZAvuQxAcsTHruJ0CybT1EejZ+iVSwBzKnyQeFgCOpXZE3f8MzR2D46mL85?=
 =?us-ascii?Q?RsjLOR4i++v4wHN9jsYQuNWRfMVQ/kbeD2yb8yjsqdvfCGmfiXjlf4umq13u?=
 =?us-ascii?Q?S2wSP/hgQmycYbuXCqqfCsnRHQZG3ZvL/waTGKSk99Smf+xhw3qi9jKp7BhQ?=
 =?us-ascii?Q?z5GdPCU9s4755G7b5jDdNs3M4MXU8GhbZ96uoQyEjNQvEH0h6mRGrw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QvDXKOjk1zTcBF3TyY1BYpH+J+PR9hP8W2OzEHDL/7Zq9v6D4gX1tZwysh5w?=
 =?us-ascii?Q?gzSwjL2he00U3GXHyaEj2qEdTlSZiw3B0xIJyO+bi4zgk5Hn0X2NnuugAD97?=
 =?us-ascii?Q?TQRP56cvLJNktVQ4IajwwC4+cxfLIIc4GJb407J3r2EZbI+8cFst9R3vCwa/?=
 =?us-ascii?Q?XMd0w8xt0DHT/uxbx5eoxh6Wf9MxpcyMWb9LYNtXdGREcxafA2XK7A3IMX68?=
 =?us-ascii?Q?hJ35HHaRde4USSig/FIW21xRYqQCuC5/AM/DZquuuqMW69KGcre0SnAL13bu?=
 =?us-ascii?Q?saxTNeU9NDVcLKBCeaEzih2Gu46gPQxKsp7d2w691DBG6DcBsCtzEMXhfICz?=
 =?us-ascii?Q?AVcrrKa1HdDj4nXHhsYBHAGuIkTB09sz/PINWY/EA/HoofDFZ5YCZflMhcE+?=
 =?us-ascii?Q?x4CUgKG+Cu66hJKLtROeCswMMGLVUNW2/bl5aA/Cy4+ouGHae4qHn+fkcZkz?=
 =?us-ascii?Q?efRphpHc7VEUZzA4wRy1jsmZ3XQ3W0tLAb3jvBRxCUIkwOgQrMR9ZdYOSzWS?=
 =?us-ascii?Q?IvICpEO2ww4nBl37JOPsOhRZbFHeM+JtrHLEo8bfjgLjZK+7QTmuvgjmZgV6?=
 =?us-ascii?Q?6U9rIEYWifLHlV26cFugfw0oaHSc+Vy4l25GwmXMEu+9I2joj+qoivNXn+10?=
 =?us-ascii?Q?bx8wRG2XJXBYt791oFbEYHNKJfWpwdiNRMy8iM3P5YYjKbEsSD253vWtlYdZ?=
 =?us-ascii?Q?9yC+mH00qcSRgKto3EfCJWVlTsDvzh9sGrS53iMHAodxffpuCh20EJu+0lG1?=
 =?us-ascii?Q?nPUc9pvCObiYY9mpJDwZ+oSSk2RqIFT0nF4bsSuwP9fjZ7K7XbsPlYyTTM5e?=
 =?us-ascii?Q?QhIGdKelprE7Dp3hNb7HyCjpZZBcRtzkCyEUxHG02RhhdhyCWgNzcMZSbwXt?=
 =?us-ascii?Q?Pzqv4AzuinjfXJNehcqVxbqdRxqqwNXUQD2G4zLMhxYDqDma/8hRPjf+uN2U?=
 =?us-ascii?Q?RLzpfGrd1RocgCYq7kacdM054VMhDbU/MgMTZPldhsGAQ+xxLt6UTaDVepA6?=
 =?us-ascii?Q?pGumu2MTDdfv2abQEoQP+yev1HH37Jqu9028jIG+PbKM7DLCWpS/VZOSIrCn?=
 =?us-ascii?Q?bDQKLW8+NVZvPWyFuA9JrGEatNBQEshKm73UyZzzwf6B/NSdTms2rgNbgQNx?=
 =?us-ascii?Q?hOGph4xXqlpypBwxgNzGnuxCustTsTMXzQEmVU8IznajXr5je3n2G6kk029l?=
 =?us-ascii?Q?VKA/sGXn5AE3CFKr0P9QXjyAQASdFhbLosy7bsxVZbHIPOv9EgxMcFq6iOwD?=
 =?us-ascii?Q?MOyUZxgoXGGzoBsBxReVOOa6MyDitYAY8GT4x51PDKoXwczIX/CgxyBQUFoB?=
 =?us-ascii?Q?kqq+alTht8ARxQZmskYorILe35TzJOMrxhAm4xzpJS6ewK1rqyEKoNLwysr0?=
 =?us-ascii?Q?+UFN450jSGM6SbGLCXtRM4ax/cxSlG1arXHx3bOgOBLCl0zMlr/JTO26LgLi?=
 =?us-ascii?Q?zGTyNUeVmuZbUOire3XuydORTfxajNhJBfilaPmYh4eNo+hVu8WhVAlA/R2K?=
 =?us-ascii?Q?0smjZgXKMHX9e1yBvyCCIj2w+ahWevOgqnz/YXCFfI1BJxNpCQMg0ohNj4x5?=
 =?us-ascii?Q?vUfp8b+3UxxwLiOR89Z3imjVHNmeNsy4aUfuJ7bu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d834fd3-4845-4d32-5006-08ddb8b69fb2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:47:46.3492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+xWjiQam9qQLXBQFJV9gaCNjMZI0UhehU4q/jV+52o3j4Es9fFsKeCiI932BAK+EPnuKdGktmzPxLCjJOtQ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNiBTYWx0ZWRfXwb8OpYys5PYL 6hkNCYgy+Izg5riFyGNodfeiDtMUtIE5Zk8GC5+Z/cUuq92HRXLDrg3g3BKc/FDAosYtkSM9TE0 ++Aq9Q8CeGh2nnonHaH3kWyB0aGVJuhbU9qkoZ8+fzSXkA9y/3td+IKngLgwJjPQbAf0WQS1H4J
 a84628M3OmUjcaqycFoj9OMJIoMqzeMdk5RzEA4R1i7SFZ9B+kRPeeTf+5wjRdvNOFvTAI1pgKA d0DyZZ/MYWP478a4JKpYX02lMc/dlRpr2SLi+xpUUbfY6hLUBfXvpgfF7aeUEhHxHGEjPGs3yY9 SQ84jpNSHYU6ytwATG0HtVZVpF3aQvwpgsKqSZ6Pk+WFMuaYGTluqkG26s8cx+PKxUMJImbuVyM
 Lk5MbrvJWu3z7hS36TCgtnJE57+DDwTj/5fWQ7T+mFWzc6dUOPzjGqrP9oISf60dKx4GZb3f
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=68640327 cx=c_pps a=kuLTmBVh2a3dvdeKPdY0HA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=xpBfXC-Up9hPEs8xGMIA:9
X-Proofpoint-GUID: 0wqbtiyRLxKGsK3zIVuvxCx6hlyr4Xvf
X-Proofpoint-ORIG-GUID: 0wqbtiyRLxKGsK3zIVuvxCx6hlyr4Xvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=868 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219589

Add a bbclass to modify autogen.sh, then we can inherit it in the
recipes to remove the unknown suffix in runtime versions.


Yi Zhao (9):
  drop-unknown-suffix.bbclass: add class for removing unknown suffix in
    version
  gnupg: drop -unknown suffix from version number
  libgpg-error:: drop -unknown suffix from version number
  pinentry: drop -unknown suffix from version number
  libgcrypt: drop -unknown suffix from version number
  libassuan: drop -unknown suffix from version number
  libksba: drop -unknown suffix from version number
  procps: fix runtime version when using git shallow tarball
  psmisc: fix runtime version when using git shallow tarball

 .../drop-unknown-suffix.bbclass               | 29 +++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.5.bb  |  2 +-
 meta/recipes-extended/psmisc/psmisc_23.7.bb   |  2 +-
 ...h-fix-find-version-for-beta-checking.patch | 31 -------------------
 meta/recipes-support/gnupg/gnupg_2.5.5.bb     |  3 +-
 .../libassuan/libassuan_3.0.2.bb              |  2 +-
 .../libgcrypt/libgcrypt_1.11.1.bb             |  2 +-
 .../libgpg-error/libgpg-error_1.55.bb         |  2 +-
 meta/recipes-support/libksba/libksba_1.6.7.bb |  2 +-
 .../pinentry/pinentry_1.3.1.bb                |  2 +-
 10 files changed, 37 insertions(+), 40 deletions(-)
 create mode 100644 meta/classes-recipe/drop-unknown-suffix.bbclass
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch

-- 
2.34.1


