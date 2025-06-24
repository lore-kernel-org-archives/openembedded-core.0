Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A9EC7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:42:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5517.1750761742705128462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 03:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=827047d704=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NNo3ZV010089
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqajxfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgruluY5Oie4BaaYcOSLKnxYnESaa6ccwIhtyjjaARC3T3FivjEnCXbWVOU9eQTIM+qNl/9iTPkTI/xcO7Yk2rPKDcyWR3xN05paTHl/PU5Rq2dVzxqk4+5U4TqqrLr1SjQNUT5EDw81yqjQIQXhS7NJkNOJYRrxTvPTMXRKwFX422RyV/zSRFvmJHlzFmaITSsuKcbPrOdLYeDFhNyJbLpxzACu+LsYIUhHg1iXQ0qY0+yZqv0190J9789Aun9xnaOc7kBwjQBHoA78JIVbSgawNKaa3lybDrOjnQZc6rlkSpgA2aLT5QA6ocYtxJXCeBvrV49uK21OjixQ3ZqP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CLEaXo7qkaQDJC0bQ+WGjo7VjJpIkFEHVfZW3YAxRE=;
 b=AmsZdYWNddfn7lhdKMZMf1LvzF1zLw7Ev0BUAbfOWoUSBcZKTZFAAKiBB7qNBZ0RbEzBHxYFOSXtRNcaUp78n2UeY3L7UDBKV4sJuq2C1TKdITtloDbsahNUOJqINv7UVQqqFtvQNj9UiyHbjTxhkDbFkdS+KEhJemKWE7gkWAjJt+VjzAQRI9OVQv2023T4U/Tai2CwD0YTWt3IrvF7mQdAypmdZsTRtxG2Q1kXwl9N8RCo8cOsBWx5/sSjo0/iyaQ+hidaOqxmEKb8qGWgCDlrYUtO4q6sWacIrIJipWDdWGi951ke+Q6+5t7WHaek+kULg6ks1qnhrWExCrI9VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 10:42:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:42:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] psmisc: fix runtime version when using git shallow tarball
Date: Tue, 24 Jun 2025 18:41:55 +0800
Message-Id: <20250624104155.559827-9-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624104155.559827-1-yi.zhao@windriver.com>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:4::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1b75b7-4cc2-40fc-25a6-08ddb30bcb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cF7dSp3Xl3WT3tcdk8Zc6/hfLKu5xh/S1TgyA3Kb1jlBtmhdRLajXqa5f8Nn?=
 =?us-ascii?Q?wCrgnY1+PL5LF+XSNDHA4EQheM/7kq0vGXlGuuOEFcxZhqfu2NAQnKnEXHRt?=
 =?us-ascii?Q?3eGpfyOvmvBPrVhjYNBofxorT5jWqmnmPOkhd5Dzwje/zJ/oQiSYsBPyzTGP?=
 =?us-ascii?Q?J7vsyjHWv2TUMv/3M3LIuojmQiFkx/xqJ/hmTdsoen/QB3P4aAaVi2RJkgC9?=
 =?us-ascii?Q?ljWDF7sKCjqqX0bumSyuHf3LDxlBinghpX0wfbCjz4t1cc48ipXsHkz7y3+Z?=
 =?us-ascii?Q?522mNTOH+E0FDQaSkGM++BM2e9NzDc1oVeksNNmQkQsFyH70QwYDb5ZENwiH?=
 =?us-ascii?Q?35dBUhdGjoivsmCphJZOGIcrZSE1nzxM1dBoeBLjEJfkRxxpnT8Bks2SMAms?=
 =?us-ascii?Q?/t0+/syiH/1NMHaSV+PHsU9UB4KuB29MQoYCEoF2Qu8v7654MN/M40yNssGQ?=
 =?us-ascii?Q?pYw7lX8d7Pdrz4bAB3lI3NJI3GNxF9y3rltHWU/pJdH0YQGBpN/v3YZ7XfTG?=
 =?us-ascii?Q?/e2PrtDwDWkNz6ZibAkoeiDanoOmSmEywb7NMpUjwl8HhNW9oo8Dbxrx1F/T?=
 =?us-ascii?Q?s331wSpDWSX3SHv+8LyC/x7tciSa7szLe0yHjPncQlua/LCsHUDS6nIC/GRx?=
 =?us-ascii?Q?5u/TMk5H/LkwTNWxzdtlvQsbPJRvI0G09H8KgRd5AKzs2H1XNlgrOeiyjrh3?=
 =?us-ascii?Q?5l0WINBH5aE9oK2+CiArw15mViTv97nbOJyZm0Gl8dsTvYe2HWTeWfzgVKR3?=
 =?us-ascii?Q?drhbIudAiDSYnhT/HTvZ1ZeB8TJUlmxL4JEPaKR2Dd/KIWJnO47imFns0Pe2?=
 =?us-ascii?Q?QWoYnMUQcDB8OBT2t3HIiInubPveCM+GmW2CICVzjKiOQs0tiZOXUCOaZD7U?=
 =?us-ascii?Q?23QYI5oHyHXzb3VCmgHIQGWyZwVsZi/7R9eIGA9sw6ZgvIUnbxZQs1cbGm94?=
 =?us-ascii?Q?2OF3qPxr7MBUQKGEqgoHaJMgNvPLoW8ZoyXsKEcRm2d7kl3jSJ81BgoTJkXD?=
 =?us-ascii?Q?AFiKSP5D9Kprg/vtJhLCW9ptyO4XAzdLyI7uCo4W14T+jyLR4HHGLrM0nKJi?=
 =?us-ascii?Q?PcC+NBRWBKD5cCoqJKOuO8ve5BRf5mqh8R0C9CQI71X1nPOUKgbb7kLcdfN9?=
 =?us-ascii?Q?g3tiopCsqcqBFIW+ykbPZFwnw+pBih/qCLNESfgGH0qS1NkG4Xv/c4gePs5g?=
 =?us-ascii?Q?Fu2y9byhC7Nu3CVHFAwTtcfrFRRYhqamvqat3INAUiVecVOwrRpLStIz5//l?=
 =?us-ascii?Q?QMK6S7Z8WA3NyU33knIWlN/1p6glSyPkKZwK1YA1rpoOfwgYdkeBU34KNaYO?=
 =?us-ascii?Q?Vl1dMUQTzklvP5yfua8Sso3MH8rMwmvFiNL3jGLfbvsVj1mG5aPsGecJ2o0R?=
 =?us-ascii?Q?oKBXkig3Nkn4TIJetcwNlx1Ix+WLciX7IzdK9jk+jtzIW0IXTw6Q1y9OLJuA?=
 =?us-ascii?Q?tN0J1YCIrxA7dG9DCbyIb30dxNrH0AVZ0uKqDIqNgLpBRBIRrDHXJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q4KEs3h6fA3ROVjdI+qfLbnzUTD9Wzv26DtdmZhtXS9OgpXBZq++s6b/27R0?=
 =?us-ascii?Q?kbLP5r1e4AWofmjcPzzb0aaIIt4VRS2tag7eFk/j3bbqnT29jQtwZ3rB1nC5?=
 =?us-ascii?Q?uVrZ779dOd6gof9S6mUAus8VWDn/XUseBUQP6ux1PWu/VOarGQ171OWfujJ0?=
 =?us-ascii?Q?Juo1D3fRuzQ1Idc+vSAmquEoIQPB4TKg5JRbAdnkIU0CvfCNHGseorW36rTT?=
 =?us-ascii?Q?/AxfOxRKHPo38Z8zjfeLXYTbjPLDJ5kt7NgzOfK58lmHQ37DXcwNV51NJBOz?=
 =?us-ascii?Q?zHaQcVzDlj0cPE6TX6MegjBpiUcApj8SdPe9Ww3wDyV6gX20f3ZbfAWpiWES?=
 =?us-ascii?Q?X/gAWgAJwdTd7wcfMH60h9bJj4QBl5vpHyrsl0V8s4iun6rPeiaj6hZv10ID?=
 =?us-ascii?Q?o+u74MN0tdfWALvGyF6n23UZlJ1qfa6OKvH4ruF6R1753u9kXfp/6WXiSm7b?=
 =?us-ascii?Q?lo3b3SQERHi+epUeEvTKhyoUQbvDAIk94jyPEQ9nkSRGJeUxKvQOMZznFn3P?=
 =?us-ascii?Q?zUaqWxXXdzi5/qnWVa+xyiXn9DbxOx6ye/h14mEATSACCEODDS4h2p6pZQzY?=
 =?us-ascii?Q?U0fBpyp2rYqiZ5q0Z/xEI10DSVt/uSHfE4aG1nS28CIrq384G0GnB+8gVXsp?=
 =?us-ascii?Q?64iak0DWUcu2l2/qkxsPyVPOxShpZ2Ml+4QYcQX8jgQ9sANNKAYx0CgNFCm5?=
 =?us-ascii?Q?s1KZxAYq97cDZDgpMoMpQVcVld90FSQCH0vczRKYYfiQmh7i5oN1NbfFfXQE?=
 =?us-ascii?Q?jj/sJ4s4gAZj3+PpmveZTJwD9pNqUhRnOkyl2WvLE0qtrLm7Vjb2qDM1Uk+c?=
 =?us-ascii?Q?TkRMIcB6c0FvRZOCMc5dVT2HDlPMQiA9EIuG/0o9xvOagF2nywyuJSDoQPCI?=
 =?us-ascii?Q?6rojmUeSdaRI9SM1ku1+FHRCI95QmFTEbCw84C/+pyz7npthZfK0ZUrpRfOQ?=
 =?us-ascii?Q?QIlqn/gdfnHnxB8A/Mnrgn6/EbPid2xiADDhlPtmwWo9HAPSDAXs12f6iHfd?=
 =?us-ascii?Q?1cb8gYv8qcZmzCuIENiyrQ0BY128mkPfhlA9TvrVN8bLo6rKu7WZMyFJIk7I?=
 =?us-ascii?Q?PMVDZw84GJvU1RGVt8YAxG1kr2ivZe2lsqbHLoiYh72lL33ALKuht/DE1GQR?=
 =?us-ascii?Q?ElNz9l0s8c4595J1lvA53GNqeHQT8Lt0I/pEDGVWQe0Y9FjGavht9/gblX0y?=
 =?us-ascii?Q?rd7otDm1mLkKj3MjzFv6KNJpJW02ThYepsuHTfH1jacQes4d5qlEJGOLLjhg?=
 =?us-ascii?Q?NwVEahyNL6eiiQMOsuxGJnP2DT2tiRFnffXWmODWqlsCjoHjShDRj7TMxxR5?=
 =?us-ascii?Q?yPZY6jtl9esMq6LmFld290RhckRfFip8Cu3nuDy9FZRGd3b22awO4qjpjF7m?=
 =?us-ascii?Q?5JhORRHjGbuKau2NO50zXRPru/U/BK59y3JOEUAI30SxXsyMqk6HH+TiERfu?=
 =?us-ascii?Q?Upe2b0IVNERw4afyklPl3OCn6UApveLThBgtOzsk/vjni4s6DkQPwr5O8XLr?=
 =?us-ascii?Q?6R2t5W6DCknp5IDd5E71wzXW+GFucPDJO/Zh5W5a/Z0n7zFLZMF2+kVSdRu0?=
 =?us-ascii?Q?eCmXTMEoxvY0BkbjTw5CXzDEsjc7/hJ8geg2F0eS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1b75b7-4cc2-40fc-25a6-08ddb30bcb8b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:42:19.9912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Y4TOC1q05vDxfj3BKGE+2MqlipM4Vu4krUYrHRYfFI1FEhy/2Ga5lf7xhXK1whVY7TetvjkfGbEyOPGm8NXoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-Proofpoint-ORIG-GUID: 7byl04sfrzt7JLDbNV5glTn02pMWL7hv
X-Proofpoint-GUID: 7byl04sfrzt7JLDbNV5glTn02pMWL7hv
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685a810d cx=c_pps a=rtGweklF6W5co68B0IbaYA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=GNo9ETF_xeVcIxxexpIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfX2R0xv1URfr0K 9RXqqG4Iu0xpAMXYpvQr5hIz4EYzUOyGBqxVz/imWghDSNusYhFsBAIbjLbyKWatHjcrle2a8A9 FFST41SgO0dsbezBLWseSNvSKkSsvg1TxeOO/2qaO9Yd8EpnJrVGLa/rUd9KP3X8uK50f+UmR+E
 AcWrlFaczZfqbpMUThY4qpmt69pO/Maule1HR8Iabbd4Xj2fsuTRzFCg/SUaMmIftz4gjjX/9N3 cpqC4q+5pS8JVQDWPFdD9wSa1UsOyQWC0GFqooB8UQJLmZZI1WOwsMKBWXa4d4l89/HjfvPJJtX iofX2I4WNTaMB/0tT4tGzHFAI/eEBb1y47km8foBTqv5RdUhZlv6UREuMn1M9Hc5cuasGzLCYKH
 otkWPN1Cd7XKrdQ92A1yfgq7x6D13EeHboIc08wzjobykLUKnJ5YieD1hbbeDpt3cKtDvKWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219249

The runtime version of psmisc is generated by 'git describe' command in
misc/git-version-gen. But when using git shallow tarball,
git-version-gen can not get the correct version due to missing git
tag/commit messages. This actually breaks reproducibility, since the
generated binaries should be consistent regardless of the source code
packaging format.

Add a .tarball-version file in source directory. Then get-version-gen
can determine the version through this file instead of 'git describe'
command.

Before the fix:
root@intel-x86-64:~# pslog -V
pslog (PSmisc) UNKNOWN

After the fix:
root@intel-x86-64:~# pslog  -V
pslog (PSmisc) 23.7

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/psmisc/psmisc_23.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
index fff1f218f4..a53c27017d 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -23,6 +23,7 @@ inherit autotools gettext
 # doesn't believe po/ is a gettext directory and won't generate po/Makefile.
 do_configure:prepend() {
     ( cd ${S} && po/update-potfiles )
+    [ ! -e ${S}/.tarball-version ] && echo ${PV} > ${S}/.tarball-version
 }
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.34.1


