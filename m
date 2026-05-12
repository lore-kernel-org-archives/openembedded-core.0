Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89DBCD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 03:26:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67446.1778556396586517516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 20:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RLjIYdZe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95926deccb=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C0eSXF2992667
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=PQS4ENWqP
	sVL6xNfNx7RuuiRDSQtmNYBYl3+kFy4wYE=; b=RLjIYdZe2ITuywzmVHQjbjPeM
	NfylQcUB6XBbQWL9MmFOT88gkW1z9CfWwc1DEHwdpvdEnKNjjDH5pusRlSySJA7M
	ngNaaXUBTWVCETUiFTIWIM7GcY5wx8aQa7XJIMAowJvAR1yhYsPT7NyyGwCJ5Ukl
	JQWUtCp6C8LcF7vOF8Nr/9nIh9GD4ROs0JSwpL4DNlZxMEwI5N5A/J2mTcw2coWf
	khZldMyJ3hpFzAozyD/fm1Zu7uQAMMMQ9UQm9M+prDrddjlBCKmtyljnQaiUW9Ph
	O50A01N8bGAhBdX2AsPgIvqxYZQ7X+EJjQr2mr9EtgAQ9BaOnCyzrIFDzE90g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011036.outbound.protection.outlook.com [40.93.194.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvhrc65-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 03:26:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EU3D275is1SG6kW4JrpijulstPVbzzm4K71JBVe2myQaST0uReKkV0wnkYJJsojTTtKIkVo+mBOWkD/h3nGYa6yE1Js8oqqke4OAq6kSh7AdcVKz2/rncrc3a2BJUkaV2wbx0EfFm5fajgNVqol8iZBiAcwZHWY2VjSdHQAyCs/5jeVw3scTh3frZbhFU+k2dKakkiS6Pc8SjWwSoU7oFyYlmruvdXKKYUYe3ASNdWpDfVCiUwDcND1u6O2ec3fjl7riE5NglaPk4u95zOWo1+KtB0cHlvpjeCcup8YHZTxyZ7iAPd/Vb/pN12aDp7EnlaLrSuXsilGjFAiWFoo5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQS4ENWqPsVL6xNfNx7RuuiRDSQtmNYBYl3+kFy4wYE=;
 b=Lm3BtyJRTz9GnGO3leEK7BJ0F409c/KEDmdKr5DIYevAQ6K7VDajIYjH22zJqpjv3wxgGbL+fDidWCP1PuzTOjSlvgEELvbIa260SnodkxsaCy+QRs8RunmHZAa+2i5CNCEjHcPHjknG+k85MgQ++ZyNhi0voffw13kbZJak9l2oZzpuWleKy6FrN7a2euwUlxoijOFg6R+ULwYYWFCZqZqd3lS6HhZXHBYCPEl4AA3JW9EcbCUERnhx/s6ONy7EeZnicVrxXupuyjQPJagJM8aGiMAqO1RQcZotyqJs6gPc7fFHScBlroL45M54cQ4ynZbDLVH3tu3mxXFXIPxHzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 03:26:32 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 03:26:32 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V4 1/7] recipeutils: add optional stable_upgrade parameter to get_recipe_upgrade_status
Date: Tue, 12 May 2026 11:26:08 +0800
Message-Id: <20260512032614.2814369-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: df9c5700-5d3e-4028-065e-08deafd6434e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|56012099003|18002099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	MhUsM94InO71AqB4RtYFzW4+fTuppetz1AF0xHAvFCxMMY3DL5BHytGMR5JfhX0SPsU6T1LHTtx9pL1zPgJvwpVa99e/Svrwoq66Veqg/TWesguhqwBb/5NKXpA1HEAmDpaMNzklo4Mk+zOY+H3ztcymLCufPYl4zHY9eMZwrfIp/MR0PNvqZD8+qapDtlCToYP48YCrV0llXHaDDJ20nfe5HCrFj1VcfHnMjw5Q+pBpFvYf+UdINkJA/PjEvgkS1qcxsPEOZYgeq3jx6EKAwZz7qL30tVW7wzdZpxEnbDCrVUe8k66Moi1TCBtaHWDZmdLaBDZgyJISE/CuFyVxYCCSJHEZeQqHpWc54Avh9yb9LLPK4oOaZgwBh9sfixoOWkycN4kM/irS7R2ej5d+fDwn9L7lxUHW6U7WAYO4RqpMJa2RyoNbvTweqEOmIYVUkolwZu4z+Rs4xM1C8yjj2VqkIOp9OrG8evnnIqoULTpv6ebyw2uXcVVOxR3LalISkq778TRcBnCgDyO/IARvjQrjF4KBjt4EvGWQe63NNA75/OkaBHpf/MW382YGFFCT1Y7D+nH1IxzRnIdK1OH4LojWC9grNaUq1aYCwEUjHeuQVWWTykWMLZmCioO6fRQ0WyIyfq/wQZeQAbbqz4TkizWOkNMK8CZperrI+IdnZltwTQ/KfehlyLv62l7Vv0ooz9MRqg3nG2KnW3sPAedC/HMFUF8kDsDOQPoGHPn6jLD+lil0/MeKzW7e0ax/qogh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(56012099003)(18002099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?utR9gwkLuqDVaDIbRXW5BX3hdC+1NkDVhDlJu0e9UVk8VAn4jN2QIG55/JLj?=
 =?us-ascii?Q?22kt9CcYGrbosiKvLYmsC+LAIZeFhqlGwrReNFMVVgN4wD2LiKAt2XLox51V?=
 =?us-ascii?Q?b8nOXVWFXqbVy/C5m0T1OOnWqvp4mund1Gfcnb1/fXH4xHo5GDh/iLG/leBo?=
 =?us-ascii?Q?XqtOe99h9LFoaI8Y+E2ZuXr+4OOh4qeyxQk8Hx8XbdMbdMB9kVh2r42/kHPN?=
 =?us-ascii?Q?F8UyTFkC46jr5S+O5ldg8SlN6++9qGaE/uUfgP/QBPnJiu86K6gwrS4btizj?=
 =?us-ascii?Q?rXi1HGlTW6AxSPrRCnD+ABVZ24H7e9urx7LQ+HiyojSH6mHNrmqKnz3DcgdC?=
 =?us-ascii?Q?KziLLkV140/CRVizPu4+Qn+HsvWhz9VIIB8hJ3kUks1ANNoz3iYFNayPVw4T?=
 =?us-ascii?Q?6bE5YhNlkQ2IK8YbZucwjkKueg12R7FpLBcWddaTr8YARDwTJLPZiqULUYlL?=
 =?us-ascii?Q?EnhBHWqsgDY04hokmTcK4qlfHGdMzzfJs2ijQ8HcHM7T3TKIgVw1DYk43BxI?=
 =?us-ascii?Q?THRk4SHuusGWbblKc0hE2E7/GKblifbADmnDyjCfWYxQiO1SPTpNfN1M6yQk?=
 =?us-ascii?Q?uHEVPcKQvKrg47AEZOt0aIENT2t/S/UoWPuEOHE36wFS0UkxiLRUHYl5wz7d?=
 =?us-ascii?Q?6ehMBw08qlPZIv7LzY+5tY+eUBdxl9n/vfaJaZPeMlE2YsTHEEabpKX6c+DI?=
 =?us-ascii?Q?vkgGEY1MoMeTYd+Fmho239GWiHk2cIy/RAccmLtCNIe0DNdUk8CZDFr5aIrK?=
 =?us-ascii?Q?4v4ctLoU1xRi7kOKoFE2B0/dWKrli9pJrk3CnM3xKYtm9WcxZLFOPrWDoxI6?=
 =?us-ascii?Q?uConI0+CxoTK+TOQ+6ZThgy2fioZajIDtDY8Iikr20pemKLiYRrvrB5n1gNY?=
 =?us-ascii?Q?3jBsgNAyWhkG3ljviESovBRg7ZttH2kRo6hcUbZPDeK0A8l7HeyLDEzpZa+N?=
 =?us-ascii?Q?UPLHCsvIGnTOok2G9Xwv5kqKEMpl4Z2OrZ1iWuqI6kdqgdWpdogwT1aZnzBF?=
 =?us-ascii?Q?FCOTpkeCoiFpCIvD/5F6US7YHqxQ7FcAMDHhHgKsHlxdquyb4MUob0hlRTkW?=
 =?us-ascii?Q?G/p9MERDVWyTEhl2RQpTtNYXC1+vGZNukXYfjzvdIwCJAB74VvxtgN2nmaR7?=
 =?us-ascii?Q?hX6GToinV7E5HcEe0S6RVD/7FgS0XjtnaRi7FwMB2MkfLaZoIzApEMc2FOwI?=
 =?us-ascii?Q?goJogyIt9lapTwxI1juEyhVllRWTre+gfxChbgJgjdvIfIGF3bgHQlZ4K8Dj?=
 =?us-ascii?Q?Yg/7UiSaLTN7Pyt/17Sf+WjIfv5me53engJAQB4SRk7BVRM7RgieC7UyNQpG?=
 =?us-ascii?Q?4tAzL2pgX+vskZi/bp/3kTutt/WUpHcNllPX8+3H83AOJcLm+FvaYQbJqDwq?=
 =?us-ascii?Q?KRL2wq8HCa6hFcxBK2OGpjkGHPSLL3GbElLmdiVDygIAEqJNZiMa3tf9y4SS?=
 =?us-ascii?Q?btbRkXM5MGGdsDyqrouPmVb8fDZ4zeBQMwTITCOUSWF++nnivKCH3aGj0F5o?=
 =?us-ascii?Q?MpGglQUF2VJYXmfmCbRy5uHkAfRTO+Ak0us2OtrxFPo5pkidl/JWvuhyit5k?=
 =?us-ascii?Q?f2pgHCzoO2apLpHf59jvOk+sZZqFYMkp/0IIRKvDTvbVJB5vuZC2jyH4O0Kd?=
 =?us-ascii?Q?7+SIquASA2rtEgSYc+LeFQjXUkBFiH5jLz+TVAWeiECe7SFDsk5IHEjO7IbR?=
 =?us-ascii?Q?QowTeTEBVYGpsNoSGEYMW7cBZDmmWqUDazrdmj+EOkjeelmjOVUCdfwaHo0A?=
 =?us-ascii?Q?+IoSMOEmHQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	tuZUhmmKQ6MN4/whKDH3j/oz6Duw5njts889EX1Au29vhvzQK7wQEIc/iR5mqnm8f1Gg23vqRMLIUnKSKXcToY/cv0rnr7D82cfF59GdVAk7R6Zz8A2tAYtsP6eLGyKAhtIW+CcbF0NcsHbnkZwFi54KbfkItjxxM/UM5T60qJ6269rIDDdlPcECYgQjx96Il/438yIgDo539R1EdBlCxVfkUBYrwvDk6ukbhVEAiCV0KDZtqjpVKPnP+cS+A7BX70NNLcTiDXAFvAKlvEsyidQJsy+EP7GEQtfECpNqgb2bSqc8W/eI2zTSlMWwPJGWiJ5R3sNCGg2yuklJclq3bw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9c5700-5d3e-4028-065e-08deafd6434e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 03:26:32.2963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZvwYtx7IH06dIBEmDuroGDqILZ/pDdDD4JAVKrbtZmSaIWq5yxlFYfUrJsxRcf/YEuLxGly7OJaMFECEdIDWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: F4V76TzxK9AsdhxVdqSn8QGsi6UsbGu8
X-Proofpoint-ORIG-GUID: yH89Y6VdzWlX_Aag8nxrKI8G4CnMLxGQ
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=6a029deb cx=c_pps
 a=xjw7YmzweVlW3QpdpNkTiQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=9yvo8pdFzNs4Kck5P0oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyOCBTYWx0ZWRfX0FrrGbbmLl1k
 a/zBZqF42aD0BNrbdJdfeck5whijL6zYwv5dPdTjXnm1PK77ABDqL5gxL7paxZUAJhHVCnO2AC0
 izIbFlexJNxy4oMRtrPFoydbC1kPNLEABxgi2RrVFYMM8d1cCfOV+X10qg7XPR/QqQpfZU0hT7q
 06AuyBIiLfZEJ0r6PRJYP7hOSMNtICA7CS0f+fcH1mWrsobBn63nqKqJA6KIty8sntH3V8CRtEE
 /S0Rh6qTISbUvHJu22dR/PijN2Oz83KP+sU24//ErII9luhXO8FEOH0Ak17qSE2kihV83IQbvD1
 D+w9zfv0I6/LevhsTYbeihhs7JE+RLWyMPkg2TwdIaG5RWRBs50RSXQmdyQPrJCF+UdAOF9CV3R
 8XI6v8a8yeWzYtuOosAGPVNJLbXBwEzBCz+sMQ5q+LnPLrnTp0AQD8kBFr0WnxQqw1jvAD404zL
 y6fbSFwJy/3nhdg+g/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236844

From: Chen Qi <Qi.Chen@windriver.com>

We want the ability to do stable version upgrades for recipes.
To this end, add an optional stable_upgrade parameter to the
get_recipe_upgrade_status function, which defaults to False and
when enabled will try to get the latest stable version of the recipe.

The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
it, it will be used as the filter_regex. If it's not set explicitly,
it means that there's no stable updates or the recipe hasn't been
checked yet.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/recipeutils.py | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index c6604f536d..7c1df518a8 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
 
     return (pv, pfx, sfx)
 
-def get_recipe_upstream_version(rd):
+def get_recipe_upstream_version(rd, stable_upgrade):
     """
         Get upstream version of recipe using bb.fetch2 methods with support for
         http, https, ftp and git.
@@ -1080,7 +1080,15 @@ def get_recipe_upstream_version(rd):
             except bb.fetch2.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
-            pupver = ud.method.latest_versionstring(ud, rd)
+            if stable_upgrade:
+                stable_release_regex = rd.getVar("UPSTREAM_STABLE_RELEASE_REGEX")
+                if stable_release_regex:
+                    pupver = ud.method.latest_versionstring(ud, rd, filter_regex=stable_release_regex)
+                else:
+                    # Not explicitly setting "UPSTREAM_STABLE_RELEASE_REGEX" means there's no stable upgrade
+                    pupver = (ru['current_version'], None)
+            else:
+                pupver = ud.method.latest_versionstring(ud, rd)
             (upversion, revision) = pupver
 
         if upversion:
@@ -1094,8 +1102,8 @@ def get_recipe_upstream_version(rd):
 
     return ru
 
-def _get_recipe_upgrade_status(data):
-    uv = get_recipe_upstream_version(data)
+def _get_recipe_upgrade_status(data, stable_upgrade):
+    uv = get_recipe_upstream_version(data, stable_upgrade)
 
     pn = data.getVar('PN')
     cur_ver = uv['current_version']
@@ -1119,9 +1127,10 @@ def _get_recipe_upgrade_status(data):
 
     return {'pn':pn, 'status':status, 'cur_ver':cur_ver, 'next_ver':next_ver, 'maintainer':maintainer, 'revision':revision, 'no_upgrade_reason':no_upgrade_reason}
 
-def get_recipe_upgrade_status(recipes=None):
+def get_recipe_upgrade_status(recipes=None, stable_upgrade=False):
     pkgs_list = []
     data_copy_list = []
+    stable_copy_list = []
     copy_vars = ('SRC_URI',
                  'PV',
                  'DL_DIR',
@@ -1134,6 +1143,7 @@ def get_recipe_upgrade_status(recipes=None):
                  'UPSTREAM_CHECK_REGEX',
                  'UPSTREAM_CHECK_URI',
                  'UPSTREAM_VERSION_UNKNOWN',
+                 'UPSTREAM_STABLE_RELEASE_REGEX',
                  'RECIPE_MAINTAINER',
                  'RECIPE_NO_UPDATE_REASON',
                  'RECIPE_UPSTREAM_VERSION',
@@ -1180,12 +1190,13 @@ def get_recipe_upgrade_status(recipes=None):
                     data_copy.setVar(k, data.getVar(k))
 
             data_copy_list.append(data_copy)
+            stable_copy_list.append(stable_upgrade)
 
             recipeincludes[data.getVar('FILE')] = {'bbincluded':data.getVar('BBINCLUDED').split(),'pn':data.getVar('PN')}
 
     from concurrent.futures import ProcessPoolExecutor
     with ProcessPoolExecutor(max_workers=utils.cpu_count()) as executor:
-        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
+        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list, stable_copy_list)
 
     return _group_recipes(pkgs_list, _get_common_include_recipes(recipeincludes))
 
-- 
2.34.1


