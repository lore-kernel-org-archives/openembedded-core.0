Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C590C54731
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:48:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7467.1724377702796046352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MBhYIo018581
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x11n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTFKgcoxlsgFnqGw7TBwQDhh6skEbtd/BtG2tpmNsZdv52WizSCIiWWMFgp4BtleNIBhrTYwj8xQAMfsUWKcevPWEs5Ycn1SioQ+u3ESIbGSrJhspdw6SVqrtPfcvfHODAfbgbDm4bHMs1GZ9ZFaJWgegqbAJ+wGX27JATWRh2ZSkvg4nfTaDstlC1+mh21FLbIePCq/NBySLn9oR1PraVmoBsn2I9lgnMtpU2O40529/x6tPQjD86ctcS+cns/1U+FckySzrQr0QuVLpbz9AR234+cFszh9MWc55b618zZoA3SEYo1ICCw0nf/KVBMOREBYhVjW63cC9FV82TDc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJ4tIZy9yi1SLmf8Ug9lPhUW2Mq+x0kgsZuwjeXzcOU=;
 b=NbzINeQGiACpN5SK+xAQ4+Q9Weblye1xFazEoc8OnMDJMa/Y4GOtvn1yFwfqjc0/q2ZIrPPyDK/W5jxqnb9lvH4QPY4ZAlcIJkt9lVj2k4q4VWvB/xKthyRIyKlAHmtboLls7QnNb/Qiyj1jHpVjEcwz+yyhS1ikWrdM+FIXKKsdzvo5AMdm0heWbB+7J65rUSzq505r97E2nt5+SWZtHV+uFaKY+d/RTlLjxXMytapHXxN6v2+pdGkG+IT8QpP8VqBZ0zsuDI9ghOfb/0Mv9oi3H8VhguwxWkX3i9+LEPsX6UCC9+yRth11OzEqw9zqaoeaKhzVjPHismfxqG9myQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:48:17 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:48:17 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 1/9] libgpg-error: 1.49 -> 1.50
Date: Fri, 23 Aug 2024 09:47:58 +0800
Message-Id: <20240823014806.4154590-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240823014806.4154590-1-hongxu.jia@windriver.com>
References: <20240823014806.4154590-1-hongxu.jia@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: f47dc455-d684-4e78-c8dd-08dcc315a8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ecpyCNr/ZwMMNMMoWoriG1ZXuCIUy8NgOuaha0XagGYyerzlIbMB4dwMNxYH?=
 =?us-ascii?Q?toFcUmZoOBE2GiN0l9hO8NkYdDp0rXOQgQHLlOrWCeSMn77djRr7vNByaUv6?=
 =?us-ascii?Q?w9jaQfhkT50epOkmCcNQHNu+9YtCtJsFjeoShqMkB3Oga8eTa0ijG7A580ky?=
 =?us-ascii?Q?o0BEz8YC1Lmf78Dk0VFznyMZ7g4U66ItPdvCcBKu4loGj7sx9ghpuk9cpMWH?=
 =?us-ascii?Q?c/X6mo8pJ+iwbb5V8WBiVPQfZN5vlRkup4tX/y3PNe/vqr3tzVcpnmcWO1Ah?=
 =?us-ascii?Q?tQ25PhmjF2StbiiKdCU2gYfp0aMuHF4CtS0Qp97/Dux8PUiSpvyRwSBoTWh/?=
 =?us-ascii?Q?1FBC8+7sySUNGpqAI/a5h/pyUa1SO26W67mAgj0j2/juBMFHiqHpmTItH6Xj?=
 =?us-ascii?Q?Zp8wnoeS8jsCf6Kt9Z4j+Rw6RY8AJ8+JSzjLGD0GxVqxZF2bY1qFAKNSC1PK?=
 =?us-ascii?Q?ln2kJdnfdFB8VwShbTjyGrsShBWcC6RdMJ892BFus0WSlLu5IzBTXCijJJdJ?=
 =?us-ascii?Q?9WyQagc/SZjyx1q3pxmyiGnemrZHZXXCikp5chXSuYSYv2Zwi5EwCEsC716f?=
 =?us-ascii?Q?aS9Ahad0TG2meuxgQN7Bkz/kflZomQ+513NdJJArHccRAQesOJCEYPQP2AiV?=
 =?us-ascii?Q?xcPMCwGPoovOV8Kp6BI3MeJfc/k6JZGXrI5nDS+l2OuojFwm/mOjd/D+ICfD?=
 =?us-ascii?Q?mZkAykpWiHzkVT/co/xXk7yLvni7Wc2keQciAVY0Sk5h7MoQdfRVYuGa9tnr?=
 =?us-ascii?Q?RC7gQSySAeOkMb3uDX2cB0HPTCcJe2nGzAc8xeRD7GgZexbHeyrMJjkP6C2Q?=
 =?us-ascii?Q?H5O9dNSS2wZpNzuKkClne6zVqcvRgAFBZnZrzkQ5qXJkjY2e2sxWZkhljNdc?=
 =?us-ascii?Q?S7ZlbvQ9VtJ8nqLRgL4AAWYVX+0NkHPJKW53MxEgQoJXROPewEoAhg457lk9?=
 =?us-ascii?Q?lUN6MuquedUDhl6pGCsORN/4nHxc/O9K2CAJuhWWmMpWHBkH2QZY3/CBCs60?=
 =?us-ascii?Q?WEcigWFpbkhdN33u6KMzbjs6qInRuQ4wNFpJqGYPAznut5EEKoL2XjvoCtoL?=
 =?us-ascii?Q?rDCuOFfgp/Ok3p1fLD0pf124Out/DPTyM2mcvZldcStqfrpIf5UJD0x9WyCt?=
 =?us-ascii?Q?dAp8gCAYCLdhenYHY0Izk1W2qu4Q1jPwHIzLBHWGEMfc8JXTnQ+vEmmi5WWs?=
 =?us-ascii?Q?PhPw5YGqdK1E103dt8JXaS0Siwjgu0fcIA6ChvhfAK/kMP9JrRuesTy7/KFv?=
 =?us-ascii?Q?uynqPzV9RFp8CO2NktjZhwA5G4O4eN3EwMfxLbmlV2dzt1O74VWAEfoAjnmD?=
 =?us-ascii?Q?ZaDPZzFXuxOp5XzNg6ndQrQBskl5mvTvhR0hCipGd3Lg+4zxxQel5qZstYqn?=
 =?us-ascii?Q?Z6cMLmc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WtA/TtCsZuOoXFyBAru8nkugSLdXuazjGtC/iulRUzdcbvn+t0T7UwQJibR9?=
 =?us-ascii?Q?Z+76FlZINWeUxGsUDQMAfYHGJzz9WoGfEvHOupklfz2hZDnwwBq3/9MJ6KID?=
 =?us-ascii?Q?A5X2fMrn9W4pjXX/mAiyfAlIYJNFwplGS1AlroZRFjkU/w5OcRy8XQ3YVdlD?=
 =?us-ascii?Q?UH5b2o1gcDIGjH21JbN8Gs294xiZiWyp16GGp/PZXAB6BIRBcizPgVPCB/Fv?=
 =?us-ascii?Q?j0O4C7cj/ylSX3EGdh4E4VMWIw2vK3rpeSojJijEjhl2BkIFhdQWjEg57+j9?=
 =?us-ascii?Q?xmknH4CnqBqNvr8T47IYdfhyroVMYgS0cFSK+LnfykHzMTVwha/7V8UcjcMD?=
 =?us-ascii?Q?28pxnjOHz5tmtuRzoDtGTVA+o2+8dg5kknrwsprnoPVSPb6JUv3lt7I1FLt8?=
 =?us-ascii?Q?lJ9vFbiHAaM0Hi6MBj2TUrjtVhFIY/XPPf4eXT4/EP9eQykAhvWRJh7i8vXL?=
 =?us-ascii?Q?4MlA9HEb8qbGyTEu83B6PqKJjw6+c3oM3Z34tijru2NVhQCNYYDqvw+bGb+w?=
 =?us-ascii?Q?3uOmrFpQ6I0KWHrDAfv7hmYfQx0WdBzSIj5eCtrCueGcDF2lP80Eqxcy5/mv?=
 =?us-ascii?Q?HkzUg/sqOotdcUqGrUY/CYlm7wEb3Z8MaZPxRy1GvVoqgLlV10eW/buqXgfS?=
 =?us-ascii?Q?EqVAJDsFpBxjNfSlBwI4HVGjE8aCo0+Des72S3ShtLAIPzkZf5YYEanWZimv?=
 =?us-ascii?Q?Vsvxw8QDaqVAL9HIdHB4u1jLB97pIFStN4j1JGC9Ud3VQJSato1wGrCrfPhv?=
 =?us-ascii?Q?261Om8RXS0mP8sLh+bUdNN7gLC5EBst1klBGPBDKUxGtJ25PGwfsLjm8icGK?=
 =?us-ascii?Q?+fTIGRcOa5ThkANH+U5f15CTnTafyUxGxPnaHuvEvFusQGEpUdQ7sFxkCsjy?=
 =?us-ascii?Q?xYF0BX3yX3hHaj/vK31cHkBsSfce450I+7ZPET1kY/AYn6qVdfqZfkPHMUMo?=
 =?us-ascii?Q?APF65eXo5Qb654jDdu5Qi4I1uX+m6/fmOhLnk2RVbIph6EyPa0p2BOg4N16A?=
 =?us-ascii?Q?FigMrmcGP15phXpa5CT4OAu2aA5InC6fZ+ZPsqw/7HRPf/7LvC9UXMKzOStC?=
 =?us-ascii?Q?LO7KTNsx3ysIlW2STFT7C9U0AH06jqKHkl1jrLfLtDXcwESCKG5qwdTLoXkq?=
 =?us-ascii?Q?aEvMxA+rwkoDnn+pCVmFKWbk1UYzOB3A8znW8ZgNgyEkOcfTtgh5t7RyiVX6?=
 =?us-ascii?Q?W7afxNkHMWr3liPXReNw2OWKq23VL8VBfqLPl7tpWm73ERfSkQt029opt5gh?=
 =?us-ascii?Q?oL+aQ59dM1OJhKimjsOe/VgQn453/2Kcy1RC4bXt+KoyWBX4u57S/DwghTZK?=
 =?us-ascii?Q?TsRkmS3B3xtEV1QosItkwcaWtMD1z2QydhlZ9oXATFoyUxKolAxbfZdgxB4Z?=
 =?us-ascii?Q?VUsTSptp3RrYSUpu4GSD4B38g90mHf/JY9bvJdkXmZ09pzcXHZvp/wnSKNqs?=
 =?us-ascii?Q?0mXH51A+Qd40Fq7hIEWhhj51LzeozprplGeW1MhP8dJqlPvYFBibk/DZ6jbr?=
 =?us-ascii?Q?4uMy5luJsgrqMalefM/yCAHRuYFLNkGyw0OZZbt8gRTXle9sAP/Fqc5qMXWr?=
 =?us-ascii?Q?wjIljN488e8PLxgWLA9nfDr/nsssHcHH6EjClC75bL9+/zTNDcLFDgcD4twv?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f47dc455-d684-4e78-c8dd-08dcc315a8aa
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:48:17.3308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V68Fvd8w4p9rHZrL5ZBqs7Id20P9JnAiWp77pVJcel4XC17FO9zq07bcLen+Pb+uxiS5Y40Qz0ZXKAE58R3z2pJJyN5f2j8Fy94OPnsnTY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-Proofpoint-ORIG-GUID: WVoUcAn1-7xRskq5XtoDQKO594HEDpEU
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c7ea65 cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=omOdbC7AAAAA:8
 a=vKivue9HAAAA:8 a=VJGigZ2ANXXWYna6CC0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=czFSAQ7kI4cueanBugmn:22
X-Proofpoint-GUID: WVoUcAn1-7xRskq5XtoDQKO594HEDpEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203669

* Rebase pkgconfig.patch
* No license change, just update copyright years:
  2001-2023 -> 2001-2024

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libgpg-error/libgpg-error/pkgconfig.patch | 58 ++++++++++++-------
 ...gpg-error_1.49.bb => libgpg-error_1.50.bb} |  4 +-
 2 files changed, 38 insertions(+), 24 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.49.bb => libgpg-error_1.50.bb} (92%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 3d886bcaa4..794a3993e7 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,7 +1,7 @@
-From b0df1cb468264a9bb9113524f0e1318c456b2348 Mon Sep 17 00:00:00 2001
+From ba5ec5615d76dfa4afb429a4e11f3e7e3bc9de76 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 29 Mar 2018 15:12:17 +0800
-Subject: [PATCH] support pkgconfig
+Date: Wed, 21 Aug 2024 20:03:29 -0700
+Subject: [PATCH 1/2] support pkgconfig
 
 Upstream-Status: Inappropriate [gnupg upstream will not take this, it has been tried with other components]
 
@@ -13,15 +13,17 @@ Refactored for 1.33
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 
+Rebase to 1.50
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- src/gpg-error.m4 | 192 ++---------------------------------------------
- 1 file changed, 5 insertions(+), 187 deletions(-)
+ src/gpg-error.m4 | 200 ++---------------------------------------------
+ 1 file changed, 5 insertions(+), 195 deletions(-)
 
 diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
-index 7fa52b1..15a0859 100644
+index 2d24071..c561725 100644
 --- a/src/gpg-error.m4
 +++ b/src/gpg-error.m4
-@@ -15,187 +15,14 @@
+@@ -15,196 +15,14 @@
  dnl
  dnl Find gpg-error-config, for backward compatibility
  dnl
@@ -135,17 +137,16 @@ index 7fa52b1..15a0859 100644
 -  fi
 -
 -  if test -n "$gpgrt_libdir"; then
+-    # Add the --libdir option to GPGRT_CONFIG
 -    GPGRT_CONFIG="$GPGRT_CONFIG --libdir=$gpgrt_libdir"
--    if $GPGRT_CONFIG gpg-error >/dev/null 2>&1; then
--      GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
--      AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
--      gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
--    else
--      gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
+-    # Make sure if gpgrt-config really works, by testing config gpg-error
+-    if ! $GPGRT_CONFIG gpg-error --exists; then
+-      # If it doesn't work, clear the GPGRT_CONFIG variable.
 -      unset GPGRT_CONFIG
 -    fi
--  elif test "$GPG_ERROR_CONFIG" != "no"; then
--    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
+-  else
+-    # GPGRT_CONFIG found but no suitable dir for --libdir found.
+-    # This is a failure.  Clear the GPGRT_CONFIG variable.
 -    unset GPGRT_CONFIG
 -  fi
 -])
@@ -155,17 +156,27 @@ index 7fa52b1..15a0859 100644
 -dnl
 -dnl Test for libgpg-error and define GPG_ERROR_CFLAGS, GPG_ERROR_LIBS,
 -dnl GPG_ERROR_MT_CFLAGS, and GPG_ERROR_MT_LIBS.  The _MT_ variants are
--dnl used for programs requireing real multi thread support.
+-dnl used for programs requiring real multi thread support.
 -dnl
 -dnl If a prefix option is not used, the config script is first
 -dnl searched in $SYSROOT/bin and then along $PATH.  If the used
 -dnl config script does not match the host specification the script
 -dnl is added to the gpg_config_script_warn variable.
 -dnl
--AC_DEFUN([AM_PATH_GPG_ERROR],[dnl
--AC_REQUIRE([AC_CANONICAL_HOST])dnl
--AC_REQUIRE([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG])dnl
--AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
+ AC_DEFUN([AM_PATH_GPG_ERROR],
+-[ AC_REQUIRE([AC_CANONICAL_HOST])dnl
+-  AC_REQUIRE([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG])dnl
+-  AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-    GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
+-    AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
+-    gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
+-  elif test x"$GPG_ERROR_CONFIG" != x -a "$GPG_ERROR_CONFIG" != "no"; then
+-    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
+-  else
+-    gpg_error_config_version="0.0"
+-  fi
+-
 -  min_gpg_error_version=ifelse([$1], ,1.33,$1)
 -  ok=no
 -  if test "$GPG_ERROR_CONFIG" != "no"; then
@@ -188,7 +199,6 @@ index 7fa52b1..15a0859 100644
 -    fi
 -  fi
 -  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
-+AC_DEFUN([AM_PATH_GPG_ERROR],
 +[ AC_REQUIRE([AC_CANONICAL_HOST])
 +  min_gpg_error_version=ifelse([$1], ,0.0,$1)
 +  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version], [ok=yes], [ok=no])
@@ -214,7 +224,7 @@ index 7fa52b1..15a0859 100644
      fi
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
-@@ -211,15 +38,6 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
+@@ -220,15 +38,7 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
@@ -230,3 +240,7 @@ index 7fa52b1..15a0859 100644
 -  AC_SUBST(GPG_ERROR_MT_CFLAGS)
 -  AC_SUBST(GPG_ERROR_MT_LIBS)
  ])
++
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb
similarity index 92%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.50.bb
index b7d41ab489..02cdf7707d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=20f4cf5d81ea2fad18f6297500018654 \
+                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=badc79a9308e1cbd2657b2441c7cf017 \
                     file://src/init.c;beginline=2;endline=17;md5=f01cdfcf747af5380590cfd9bbfeaaf7 \
                     "
 
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "8b79d54639dbf4abc08b5406fb2f37e669a2dec091dd024fb87dd367131c63a9"
+SRC_URI[sha256sum] = "69405349e0a633e444a28c5b35ce8f14484684518a508dc48a089992fe93e20a"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.27.0


