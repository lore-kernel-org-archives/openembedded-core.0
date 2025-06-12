Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB86C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:57:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9249.1749722243594875091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258e96b79=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3Yba9027382
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd95bnx-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0A6VRc7LMxjdwjc2LxYgNF9O6IrW5bO5u2arJJmpnr2EOQ0mTqv9i8RI37jzrcA+chUclEsxtIqya3A0lgfqv/Gmj7t8SCJ6P6CbY31agUSVeO4zg01Vr3dM5WQxgXZybAtA6BRme7xExEM6+/WGr5xHWdi1+77NM+XlT+tgxOhgi8MvcolxiBklxBF/jRML4oMqG7RhOXbDeG24VRoxPF4WRq0CTMb0OL846kq3Rrwgwle5zWbrw6OMCZVyhTbljpmdvgKDLcax3ztEt1JIasPaAPfKyiq0XAM4WwxHwOLJZI3FTa/WLeAjbAvJirsG3eHGLL0iDRPrr5QPmxorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LddEci4mqEhCz85k/mCCtq9cdvUQpY8pYijXwCNkp7M=;
 b=K0xNnPvWz4I5GD67l9qkAlet8lvISolUtCqC7/Kax02ZbOmpjrNKzPpipXzrF0L9qHOzQCrsuOOUFAtzFL0DlXDujErPjiwn2YfVkys1gdGyy3brrg1GKrS7K+5dVJ7+EFZL4TGvZLR9t1MQuMVyxhA8jvahTFmf4DMvvj6jlnsMTKZfJHeokANdJO+kT+/CIxSeDitvS5pcp3X61hYvNqnw/c/VVkzvowCURKEqW7hapr1ZFJtwP1I7CadgOqpqruna8512sRbQIy+cfLCvFR42AocTwugKXiSK1R2tar7sUv6/rmxErQJQJgGYAuJoNO2ot2p5JwbgxsBpIsJDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 12 Jun
 2025 09:57:21 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:57:21 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        =SunilKumar.Dora@windriver.com
Subject: [kirkstone][PATCH V2 5/8] nptl: Use a single loop in pthread_cond_wait instaed of a nested loop
Date: Thu, 12 Jun 2025 02:56:36 -0700
Message-ID: <20250612095639.3630518-6-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
References: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e1adcb-60f2-4088-2595-08dda99785fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kKceHYpcpI1GZBkU/siLEH4h8DkyuKHbGIjZDT5Vo3dNDYJ3hX+6RWiCEvyQ?=
 =?us-ascii?Q?S5BD8JDJcwOluTKtekR2iPQSGPJ9yw2hc+Oa2nppbKUJ4KSe01ZWXCmF/6wO?=
 =?us-ascii?Q?WbX0zcIPRLywjQ+cClQzkkp0iWEhALQ7+Agp+6kHEVJyRyCQUm3tjLJSMoRM?=
 =?us-ascii?Q?2uOyYSZMTGaXb0+SDsC9lbb05dwOTjSLd5XFZ/QnYeYIacV6MKfnSkLUjoYH?=
 =?us-ascii?Q?myhauebVRQIPY5PwpOQ5IftL95EFTIgLPdZZvxeawwvS+HuwrWdV3sVnPs18?=
 =?us-ascii?Q?eZsiVXiErz1bImjcdQPq1koYsWWOopdRWjDnSumu2bIYsLL9RDlDy8yYySPc?=
 =?us-ascii?Q?czPJOD2SovHvcvs6vqCE2lt6HbpoSOJSR56G/g915L/5XWIeeWlINio1krVr?=
 =?us-ascii?Q?DQ9hMnOZrsjtMZBDMYbQBal16tPw8eY0Y8wHu0t4XkLUKUvkwr+763ShPvhF?=
 =?us-ascii?Q?PhnF/U4q/FafKnhtO3sM2zxEcgmb+fsML4a0E8TCiGeIfUlcudJDBjPxITDy?=
 =?us-ascii?Q?2CMeEoe+XGWBQ1+lNrOW6Xzu0IrKrmuBIlcU2kIIcRNcIdaqPzj3UjMwle7f?=
 =?us-ascii?Q?x2C9VRnV809tPHrUNcacNnnu11d2etQPkcT+Ypnv4mRcwy5VQsZIH9uqALrx?=
 =?us-ascii?Q?k5Ga7HT2m8H31C1++QUq29uSKvZYh5vtHlFmVXfjMnw2mIpVFWwu6u4l9ITc?=
 =?us-ascii?Q?p8ShR7C9zGEnrT++3cA6umP+rtv4sAb707ZxkeHjKamhRsOySCx2OKXP9uEL?=
 =?us-ascii?Q?HIOuSfDSXSEBboO+m2noL9A+e53xrrqTJuMQ8AKjYWaTqKI1vCjtXwgkMOcK?=
 =?us-ascii?Q?wynTmBi3JOZuXi7689lodBs5incdKb9S9Qa1qYLRyK07F0nNYTyMzpgLoUDV?=
 =?us-ascii?Q?zP9Xmi7da/sBo7MYiSluNpb0ItD5pe8luvmCv/ie5iG8LnTzS2nrKB43oyiY?=
 =?us-ascii?Q?uwryhAm5RIG6QFtCe5dRY24d31ZLy+gBcvL3P/hKGmTzQNvPzMtkcDvNwLnS?=
 =?us-ascii?Q?m2htD3HBXiHjzcshNpeaaG567vWG2DAO1B66PEBzn21ZzGt2pCvFIGUoX893?=
 =?us-ascii?Q?TSq3DItrgZSgxn78uVLVhRqxVLLYBwthlZOwSStGnHsUauBLYu5aLKv5C7s1?=
 =?us-ascii?Q?gah9snwEn0kOXLfX12nnnrSkmmyFaLFA/2z8OoAEZ4zV8h1ZDHwnZmKB/4jb?=
 =?us-ascii?Q?yJTkZLOd1XC03P6oDP6QLodkYgFaKeOFQqb4f1LChk4mBYiTYoJbqV0TOt16?=
 =?us-ascii?Q?zus53E7+u6AzZXN5bKzzbzTXMo8iOpTXjFAoY4ELbhgQT/VrV4JTq+UuzbsH?=
 =?us-ascii?Q?hcH1UEvRtbrPm5Grg2smHjsM+LEvDSW5UZnjoerNEikJB5EwbgXgJDtXsjo5?=
 =?us-ascii?Q?K9YO3DnbrdcZOlqgHvpvViUGayFj5KGCfIodMmUKBYphqnFKscFMwGQIhP5k?=
 =?us-ascii?Q?6E8XA+IVHvoOcbYgmvC3TOrWBjIirkE/aDHkQt37/iHyamlbYfSyJg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mWDC+GHsHw98XE6zNMHjOxMEVxzY1W72XC4uQ2OyiKM5Ej+cBQ545EwZN1jg?=
 =?us-ascii?Q?iNnJOWYGBi7KulhRMJvNTDrFS0vscfSftSNEAb+zVz8uEXiYtG8SE0iAct/u?=
 =?us-ascii?Q?1K9/HURUOzIZnV5+yYNY7m+CZC4O2YRCM8lPmK3eD26ckkejubV7wJ2WT/14?=
 =?us-ascii?Q?s9T0zihjmC3fw2IBQITpfFMllliLA7KinwsWxTowe/LKtYF2R8YoJOSg8LMl?=
 =?us-ascii?Q?uqDBoTHfwBmXrLKbaOPNPWCGx7WggyPfJyuLsrKsFKahVNzag0hpF7THQfby?=
 =?us-ascii?Q?f02WZXLPo+i/BLuuZTDuQAq/glVcIo/DZk3t57Ju9kX/ri/E06M0JDe417wL?=
 =?us-ascii?Q?9kBt6JXgOOddzp3ZoxR3kUpRRcShjfvn80Ja5QgvnBtbSUDceJvKY8ccY0TK?=
 =?us-ascii?Q?Mn7vOyxxMZ4LlHeF8nlFmsb7BLqE40q0mxZS4AHELvs2tbGqJjtplgZyquhn?=
 =?us-ascii?Q?0Ck56wX7M9hEsw38iINJn+WQBSh8+h/F1ryxLOr+01p3vR4YFQkyrTfD1NeR?=
 =?us-ascii?Q?OULMmcJmqRorUPsLrHDvhjpj3BcEY0/r/qcbF/2Ni7HvaAeynRyYaI446xUf?=
 =?us-ascii?Q?R2GH14yRka260DvAjDUQVszuRUUa0+5CBNb1bcyA09lWp4vYd6jVjh7U3GJJ?=
 =?us-ascii?Q?pTC2iM1LUdAhCs1Y5yAmU51XL/ADgKtb7Xsj+VCUgo1rW/Pl4b9ehjtsRJ5G?=
 =?us-ascii?Q?E8pU4OiB4Yo5GYbhxuzkoOf5cLpqYeZdQwncIRtjLt8KmH0eZz7g30ZZUo5b?=
 =?us-ascii?Q?7sRJ/IT9aXGyBrXpTCFnEM3tFZ+BLKUcs4lEGNmQPvqWZJRH84AWCpgxahJA?=
 =?us-ascii?Q?TXAA32dMRLT+tP+YpersBXrXGGmelYveDCQAylenXk+MeT+j1JawXVgyPf5p?=
 =?us-ascii?Q?BISvYO2+t7squEU01JcD01TI3gmGMvDaMkCrpmQiZF7bdJIoCy2m9okJcXZN?=
 =?us-ascii?Q?5Aycj3CtpjysC1Gfx4Se+FOoUnNDPJbXlv2x9BTEsm9mh0/WTFzs11Egx+lh?=
 =?us-ascii?Q?YB5fUcVACdINp0pUX0CX+l18TcTF7ve3MN3PnxNnSsPqR5tkyD7tjhR0MusO?=
 =?us-ascii?Q?6PtbdYKeBlW/8pugJXM228gJHHbzWMM53j6wQEX/AsXYgSU4+gQQ0fnFMDOP?=
 =?us-ascii?Q?EPNPTH9LZ39kSRC4hMQ57leQMN9kAbuDaAkD1zrGp6UwjiBQrDyZ5xufjpmf?=
 =?us-ascii?Q?Ge3QiTdpwaq+uBL9K+BcUyVl8khMV5gfcXxWfOxctv0Mucgg0OglWV2pr8md?=
 =?us-ascii?Q?qr5ImrBh/ZyeVdqYV8PEIJ9w2luBFrZAzMCj+cUSzqpMID8LjBHtO0Q7bv93?=
 =?us-ascii?Q?u3i/cKshj5SAfeO/CHiIQEInPonzm0WdEKKcwYlxPZR2+ncbnbeQn0qKcGlc?=
 =?us-ascii?Q?qbvtcxWbIZKYaZgyqOlTz0lrTEqE3mdKvFw7vZTNdGgXfR4jmjstYhEgQjg+?=
 =?us-ascii?Q?Qbyf/3/LTXIpyjcW+HN/YS0shGSZgzxDNhtYt+oGsTkV5j/IKgWkuKkaaque?=
 =?us-ascii?Q?VTOmOKuUYDrK/uLn+LPGPesCP2ARfu2WSjx+u2jBqrcTYcp1xErgAd2f+NNu?=
 =?us-ascii?Q?CeRhr6QiVkjwtMzglN1980gQZtge1dYt4QzvG1FnYv0AVBUui0XVkrBjGRfy?=
 =?us-ascii?Q?bgtY5MKfR0AwpEg0KE1jN0Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e1adcb-60f2-4088-2595-08dda99785fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:57:21.1059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nU73Eomdvp+iPB3gEccWnH5NTR6/2JkrcsAEDH8WeT7DxScvAM+WGNn0l4gPDLbB4sws2M0LGzEiaxJfJTAMAOK0zZKB990rFZDg+muPTGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684aa482 cx=c_pps a=oHfdRNjjH91Dx1UII95wnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=CuBAfw1dTLWtH10FsFEA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX8uRcdlsghpfV jjXHrsLkr9NoXhrCsDVqxKSgBmaX5vZi7TlOqfvBcfPZObm7lH3Xr/FpG6XysA7yYPygswwTRqe fWzC+0z79IJ2wQHdjSDMjSy9y7bBkFN9pPqP5P1m83U6kB5XcX551DP99cpnnkICuuucv1vkQWJ
 OhnoI2LcP489LQgS2ZL48O5rxFMpz/cCMJ9fCrRbNOms++eKahFRpLB+cl+p+ExnGL9lyyF/LI3 35g+FI+z32TJmeuoWPrPIlxKMGmJl9h86ML76O+vgqLClVO0s2tJilddknQcoDzoJACw6jVa0pK 51O1Th+okh0ySSMWIM+gFkfvSguUHykka+ltEFqUNObVYJa4xvJ87zbekt3IOTamCH/pTDlymDo
 KMcNlM1pCftZateSfKvjyt27Nl/4c42AMPbp8iUU/4GqipW3kuYhI7VetXX1RenUNtcvH7PR
X-Proofpoint-ORIG-GUID: gvnNeS7_XSCBbAV9jm_diLmLGktPboYg
X-Proofpoint-GUID: gvnNeS7_XSCBbAV9jm_diLmLGktPboYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506120076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218497

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from the Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport [929a4764ac90382616b6a21f099192b2475da674]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-5.patch          | 103 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
new file mode 100644
index 0000000000..e896fbe2fd
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
@@ -0,0 +1,103 @@
+From 24662c8d9fcb49cb529cab328df90969b961073b Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 9 Jun 2025 05:32:35 -0700
+Subject: [PATCH] Use a single loop in pthread_cond_wait instaed of a nested
+ loop
+
+The loop was a little more complicated than necessary. There was only one
+break statement out of the inner loop, and the outer loop was nearly empty.
+So just remove the outer loop, moving its code to the one break statement in
+the inner loop. This allows us to replace all gotos with break statements.
+
+The following commits have been cherry-picked from the master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport [929a4764ac90382616b6a21f099192b2475da674]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 40 +++++++++++++++++++---------------------
+ 1 file changed, 19 insertions(+), 21 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 47e834ca..d1714a0c 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -410,17 +410,15 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+       return err;
+     }
+ 
+-  /* Now wait until a signal is available in our group or it is closed.
+-     Acquire MO so that if we observe (signals == lowseq) after group
+-     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-     store and will see the prior update of __g1_start done while switching
+-     groups too.  */
+-  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-
+-  do
+-    {
++
+       while (1)
+ 	{
++	  /* Now wait until a signal is available in our group or it is closed.
++	     Acquire MO so that if we observe (signals == lowseq) after group
++	     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
++	     store and will see the prior update of __g1_start done while switching
++	     groups too.  */
++	  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+ 	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+@@ -429,7 +427,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	      /* If the group is closed already,
+ 	         then this waiter originally had enough extra signals to
+ 	         consume, up until the time its group was closed.  */
+-	       goto done;
++	       break;
+ 	    }
+ 
+ 	  /* If there is an available signal, don't block.
+@@ -438,7 +436,16 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     G2, but in either case we're allowed to consume the available
+ 	     signal and should not block anymore.  */
+ 	  if ((int)(signals - lowseq) >= 2)
+-	    break;
++           {
++             /* Try to grab a signal.  See above for MO.  (if we do another loop
++                iteration we need to see the correct value of g1_start)  */
++                     if (atomic_compare_exchange_weak_acquire (
++                               cond->__data.__g_signals + g,
++                       &signals, signals - 2))
++                       break;
++                     else
++                       continue;
++           }
+ 
+ 	  /* No signals available after spinning, so prepare to block.
+ 	     We first acquire a group reference and use acquire MO for that so
+@@ -479,21 +486,12 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 		 the lock during cancellation is not possible.  */
+ 	      __condvar_cancel_waiting (cond, seq, g, private);
+ 	      result = err;
+-	      goto done;
++	      break;
+ 	    }
+ 	  else
+ 	    __condvar_dec_grefs (cond, g, private);
+ 
+-	  /* Reload signals.  See above for MO.  */
+-	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+-    }
+-  /* Try to grab a signal.  See above for MO.  (if we do another loop
+-     iteration we need to see the correct value of g1_start)  */
+-  while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+-						&signals, signals - 2));
+-
+- done:
+ 
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+      to allow for execution of pthread_cond_destroy while having acquired the
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9aab1466f6..05f408065f 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -65,6 +65,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \
            file://0026-PR25847-4.patch \
+           file://0026-PR25847-5.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


