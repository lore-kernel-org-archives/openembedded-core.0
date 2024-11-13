Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51386D41C3E
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 12:52:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10654.1731502328262870306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 04:52:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1047230667=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADCRd5H009265
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 04:52:08 -0800
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwppa1c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 04:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSaVJccSkC7dIfgL+nkMK7RS9pDRyzMpD9PbxQcPp0lsG8ttAyDaHy3mudxpTbZbae4kWngUolBzLfJpt+gd4sUmBxJDNqr5ruHyqCtJ0f9NSv4rF+0SxmV+IDJWKY2JdflxaR74E3Ra8kGFxhWfJTdr0UWK+h7mMMoUcgruUO0sb58swxQtIttveEoAVtXIvIC4kb4NI4SFhODFcFcIgfMk/Q7CXGBQk11t1OGqJtVEVnfKiHu/m2o55kmoz88FNPjFOmRs7WcJznW2CmaXacDBpQ57Tq+QV80qIj2hN+fQY0/9ztNGlqNlHX/mMzZikvdSioMsaNxBs5tnmencXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUKkXzyYCn3D4JiVqOYv3lbqObT0CodzkHx8WEdhJGI=;
 b=XWO4jCNJ9KyrnuToBD3wj0WseG3nicYZSMFRwU3zLuqXVk8K/EozeWm2NtONi+IvCXMnFvvIZvh3WWWNek5PdlmshoxGi2KuySm9oBFCCh+WA3yhfqMR3Ut/T0EviMxMtHp+3MGcJYJe4sO0gTj57UvNKnszEcOJ0cEYk9VgXRIYOFFEP6JhbCvt2tJHCUQBGd4yDSpTOwBj5zFhLkOP99xzW2BgVCt5P/16l5j0pwCaE2PZoDi9oVqt84AcZYyXKEETOEbvp+V5EW9kKtK9dl+xyC6PAELaLA8pCObpaZPyCwVfFQzva6KV92Je/s+63GejLZBOIPpVQziMF8+ZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by IA1PR11MB7245.namprd11.prod.outlook.com (2603:10b6:208:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 12:52:04 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%3]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 12:52:03 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gcc-target.inc: Fix gcc symlink handling for multilib support
Date: Wed, 13 Nov 2024 04:51:47 -0800
Message-ID: <20241113125147.4193489-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::16) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|IA1PR11MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: d4687de9-b32f-4b81-509c-08dd03e1f91c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+ef78gV1yC8rIEkODWrqylAMwM/tKcvFGQytu/Nm1DnI/XV1nVKzXwCgOtjS?=
 =?us-ascii?Q?u791fq8v6wjNCqI3y7qanPrJWqf+GSDYxSUllUKDgO6mhA+zFozR6VQs07PT?=
 =?us-ascii?Q?KZM9OXM4teoDEmHyOEf4DDQFjAk2akkgCQ5CHUepcXFB0thY3nHUzfLLCgOR?=
 =?us-ascii?Q?LhCrBgUHrMksEwEDiOG3qqUz+ZW8wkVVxpRO+4n6P8mvFOmqQNawv8fmgTuQ?=
 =?us-ascii?Q?kxbCgZUK/1qkDykLaEORLbYomABRyaUhKFvLoI3fQqTKZf/nWSP2/rR4cFT8?=
 =?us-ascii?Q?2rRlMTEtjIQQv31ZPvrKSHkva1Gm9JCVVWeROCAGy7I2/rN8F+884o/jbPg8?=
 =?us-ascii?Q?K4RgbVFqt7c3TSq4peWNrOufyVOC9xTwGl51gW8qwrNApK52fF1vS6ogqMAs?=
 =?us-ascii?Q?LHm+3Po0OsBdysI0dSz/rbl8pZoL/RAZ/Ku2O1pCifMfz6xmGvk74y3LiIq6?=
 =?us-ascii?Q?COuCTBwkTfB+JpCCMNqdxaMFQl4u1nO91BVF3wtWz/oI5uWlRYzQ8bE+vdd6?=
 =?us-ascii?Q?I0vmEc1sFmuIZphkQXQg2DZn7NFv74zfrqlA8sxR3KwO/TVXUcDgcFXkG4Wi?=
 =?us-ascii?Q?gM6knISRBAv1djP3N97BlKNIlAHbE2fXg2urCq482VyJfkLtCq2MqUgaKUCN?=
 =?us-ascii?Q?Mw/HR3UznL4OfdcUhK8jDH0mjzj5DtZeqQff4aHeFQbILBeL0nhKpzVe6ldm?=
 =?us-ascii?Q?E83DDWi4bhjc98yu5VGVYv9hPJN8Rp48HXFubNRNIrqZ9bpODCnoyTwCMueb?=
 =?us-ascii?Q?QVhByYPvuIWonRBu+undedVP3nOhgA2+LcIqHCy6wFBjTLsj+UmzFpvCp4Z1?=
 =?us-ascii?Q?Mkv8tKuvGXTRBoqa4pPIgzDZ+1pXd2hZNTDUjSPMI2BUBK0VSWCErtAmJJHC?=
 =?us-ascii?Q?ORICqbsoR7Ev1FFhR3QxQWGhPouvQTNSNykfMpo0BqnBUma5GVvf3nPGrhww?=
 =?us-ascii?Q?BvIMKEYYdHiH+EgrfO66nWgkfKiFL+UDAu0XN+uCLZOKSbnl9JNWq5hh/Ihh?=
 =?us-ascii?Q?dfGlJcaJ2dxGYasDUfwwa73cBemF3A3fFvY4mfuhyUq3eYZ4EJsnfcYzjK+7?=
 =?us-ascii?Q?RWgPRQcxyTi4GeKYV1kBt7G76MYS7TFmUFO8e0AXzMrUPQmXDPQKRZzICB1U?=
 =?us-ascii?Q?n9TUMXqkcvNxpUKInK5NX6O+6LryCIundVMYUlQqVIkickQdgNBy36NHd6Jl?=
 =?us-ascii?Q?Rq5q9YUjm1StcacLjb3ZMW3o/G/jQHoHcszqPHDLR6R20MfBv1eQ8mTxbHad?=
 =?us-ascii?Q?/ORUHedJ8vyEncMhk23EBWb9Qbm6+NErVhlI4zJGBkKgeOHVf5MHyvDCmTev?=
 =?us-ascii?Q?UXdljC25yvY+LrHlyXVNkwTppKRx5LAwyQ5JFDfdb2eG/D+OWlTqQkSer2yg?=
 =?us-ascii?Q?cMRjDmQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c1o2ucR63mYyCCTbf0ITUwumYW1ttpti+vwU/K6lYOThzgWxBqXPVrETQDMa?=
 =?us-ascii?Q?S0Ln95jqatfigKQBbH1wEWfexRpeod1cBgggzVdqn8Un+mRQKvvB06pYa8ti?=
 =?us-ascii?Q?/LsMnJ/BMqNLlGLe3dZ8IXROgByYNvAqoEMPggAFgVFwiqjin+L9V5tX71Fu?=
 =?us-ascii?Q?l7gbhCHZZBp+HdjVDOoLRLzW1+Ftv9wzIjMMhC5yUdnAziJ/bIVOX2v8YvKZ?=
 =?us-ascii?Q?WoYRfC5wu24sh/cOnXo5HSHv9s37r4kqpia6/M6Z5Jc5GY+X+ZWmBLJ86CcB?=
 =?us-ascii?Q?FLLiUgdedk/+mIcDF9wzBFvCByqpVDw6aYll+OkE/wal3XO5GgYiHag8+0IP?=
 =?us-ascii?Q?TZkpiIiiUrlhVEffBZge8gGVzFeM4mvhE1alj9Vn2CBamuVxfZabcnzJQjFf?=
 =?us-ascii?Q?Rb8HkKQDnXvfcGObEgVPeN8Exl72p3J7Igi/P0aJHrNlKAUo/ETeSo23i2wy?=
 =?us-ascii?Q?2jUAMVDXGBJKoqFc5/fWG//RSYiBPavfd99HKUdamsm+s68HEBBev8DPGdCg?=
 =?us-ascii?Q?JV8rfHHVB7b9ZxsOPKvzAjG+ANBobrHB1PLBqZibRG/evKVS98ZEINhP0ZF/?=
 =?us-ascii?Q?6QE+L3BIurVvpGZvqlkAPu9U8DG747l/JY/1tNOsI6bUyO6LRu7s6JBaMIXK?=
 =?us-ascii?Q?t+nsp2THYQ4CEJxn+9jOVlRrciQf75ooqhN35mTY6d+gyHjWe7A1W8pQsfH4?=
 =?us-ascii?Q?KH0nWvWlrbju9Wwhv0GENMFoBDWkRMxPH9iZxkVGBOV9ZIJ+t4zrZeLdcM1W?=
 =?us-ascii?Q?VWiIt8B3g1gLcIzppcm9Ud6ax949kJMIsTu04J96Pu2Pgvb6PXiIJbk7e6DT?=
 =?us-ascii?Q?UTS94HBaYBdXLKXFIOqngcjfVmqXJjg2DPxy5W4ibahTTqyeFUzmd3GLvdUt?=
 =?us-ascii?Q?DGEb/1+VBt4Y5pq0/kdndjP3KhJfuXMaVDiBaFszi6NwqvHKD6EHTLajOpcJ?=
 =?us-ascii?Q?RE/R6JxvRuxzlE2v5UKBshAoPofxW2bnujXpSrCgGSOOpXzQrKg8OUP/ZV7G?=
 =?us-ascii?Q?CWFkvmV/pED58lIQGZX9T0R0ASyfXHujIuKh0+OCilvJp89nPNHa9hDTTCyh?=
 =?us-ascii?Q?c0QS+IcKY5vWFHU3IpyOX9dQ2Ch2EI7bu2fzDoPrjI9fR2t0UB93h73GXYd1?=
 =?us-ascii?Q?u0cPgogY8kWbXDL9wfdOMU+iZsbgt6GPK1nXJacZmKTB1b3HVsR+n6IbwXO+?=
 =?us-ascii?Q?OcjebZ4XFVSRNVrD2H6DFteL/BN3SY1N1sd3uRESUAFzBAYu5iIpHsWu+YMF?=
 =?us-ascii?Q?TrRe1Ta6SJjX07wmq1TCPxt2FbBDM5FxU6Dwn9g64tMdQPmHJd81+LsRKFWP?=
 =?us-ascii?Q?N3UoQLCbLvAGJcRWgqOX03U2yd5taCnjf3qdVTGuJbFM+84Wz8+OVXuEC7ci?=
 =?us-ascii?Q?4MnTkzuZjh90cl3N1ydvXHs+ljNAMY3UEv3Zz2GXYlkh66djqF4ChhdM5Var?=
 =?us-ascii?Q?4Q10fwMXvolK8yg3hSlxUlFG6ASbYIFYVrxBhJpcBTJYKIBEi6FLIqUmL0KW?=
 =?us-ascii?Q?ZB08CQjPrbbHczk17oX6+4zii23iXlmxOTIc2h94I/ZYbFmLnEmBAl4zYZ/6?=
 =?us-ascii?Q?5P1wEoWZLZrhHrGh8MfT1Q2ON1gBgqZLejvVWfhfzlDMt95t2bG2VEj6bMz5?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4687de9-b32f-4b81-509c-08dd03e1f91c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 12:52:03.9348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JibYp878cAbhqoD5Y6PCEasmCFJi4rc9BqERE5ce3kRgoljJBC7ggjrTzAPwcl/0g19csuowvKvD01B0TGuH12u8VB+WMWUxFCil2TvYxYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7245
X-Proofpoint-ORIG-GUID: RQV6zWvnJ5iHrdKKRIFrgwOwf9PKr_5Q
X-Proofpoint-GUID: RQV6zWvnJ5iHrdKKRIFrgwOwf9PKr_5Q
X-Authority-Analysis: v=2.4 cv=J4f47xnS c=1 sm=1 tr=0 ts=6734a0f7 cx=c_pps a=yneE0G6ieORTwLKR6pgPXw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=BrrSfYcgqE9Fv_f99M4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_09,2024-11-12_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=865 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411130110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207099

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Enabling multilib support and adding both lib32-gcc-symlinks and gcc-symlinks
to the image installation results in a conflict between
gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_32.
Following error occurs because of the conflict:
"file /usr/bin/gcc conflicts between attempted installs of gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_32"

The conflict occurs because both packages try to install files in the same location,
causing installation errors during the build process.

Updated the gcc target recipe to correctly handle symlinks for multilib support by using ${MLPREFIX}gcc
instead of just gcc for the gcc binary symlink in ${PN}-symlinks.
This ensures that the symlinks point to the appropriate multilib gcc binary for 32-bit and 64-bit configurations.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 6b47c10413..ff59eb1b52 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -71,7 +71,7 @@ FILES:${PN}-dev = "\
 "
 FILES:${PN}-symlinks = "\
     ${bindir}/cc \
-    ${bindir}/gcc \
+    ${bindir}/${MLPREFIX}gcc \
     ${bindir}/gccbug \
 "
 
@@ -182,7 +182,7 @@ do_install () {
 		ln -sf gfortran f95 || true
 	fi
 	ln -sf ${TARGET_PREFIX}g++ g++
-	ln -sf ${TARGET_PREFIX}gcc gcc
+	ln -sf ${TARGET_PREFIX}gcc ${MLPREFIX}gcc
 	ln -sf ${TARGET_PREFIX}cpp cpp
 	ln -sf ${TARGET_PREFIX}gcov gcov
 	ln -sf ${TARGET_PREFIX}gcov-tool gcov-tool
-- 
2.43.0


