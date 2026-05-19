Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CB7CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:42:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19364.1779190931322631587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 04:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NhnSbnt6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599896a81=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9HqM53507076
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 04:42:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=KVm9DCXcE
	HWx5IqYtPRH2PoGCEASUmYunF43UkeFIsw=; b=NhnSbnt6TUx7EN0gJk/FRGBlL
	J0W9EWQlWPRnG9oGpRQWqgleCZWrKNrg5wD0VeSoRfm3odTsWoVuuBLgQu5TTLAc
	eT095SO4yKanq5b6yoQTDCQVEoVHk1q6sdKlsK7ncWEWlRgoAKGtBnCGaYBBHhmF
	Rd4NBOhdr8m4VEpCcGzNnX0O/7smKXXpGBGtTHtildTlJ1dVaCgQrU/nXAkRTlno
	iHhVbfbfZ0gVU/CW2Nf794h7m4tuu1ADT+Ocs5Qw9kerNJNoYhlxXlQ5zBrm+pHt
	T0yJilfPfytATDqYw4tto5SEghbdFD3FTXOq0k87YXD3g9WWE88l1/WVIy2+w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gb9k0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 04:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSuzVGoVNZAzrx4Qwibibx2lx34gNl2VtUWlCJEN0HEQlNwVOoggiiNknrvuVMgbl/TAs3pLiW903bjlTbf0Pu0J54JR0QuggHbQ+a9RZV5473vKPmF79GgB48Agp01suXzRI2jnf9da77lx1EUS9zBlvjb5fYL//jslQp/KZBV17lECZdRYvLRMk42R8gMd7/t4QiW3hMC8PuKD3UT5m7zy7MpkBFaRhrrmbfHbtPuOdeUpUbogm1wtXZp1QNsQQKeRZN9rcExMtue/6OhYPEkUNoVNiv9iaRfQs3T1+mtrlRBU70K7v7WduZ+cihXkHtT7CcdQR8Dr1PIoBU6ynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVm9DCXcEHWx5IqYtPRH2PoGCEASUmYunF43UkeFIsw=;
 b=kpjTJfC0QIV8Z4qw2dEMti+Adz2sXgeFeex2LIyz/NRdiDu7kO6VNqPUr2rRav8sxbWdxcjIDoSmdHix/XVUBQNl8VR/Ub5N0EYXnqNbfY6kdv6F2tTryFWpjnPDL7gF12s+l+MP6IbECdg2+5YmEAq56Y6cORMShkLc726XeJrXTwTR59EeQ1W/fABp/VsimnFtO2Ktn53bAu7h5wDwTcQFi1T1Yj9XCt3vyXVaIWsGHP7IVyf9LSjLEDYktCkGtBr7yWjwN/kb/l5lCVE1o/0M4vQG7XZosnHHA6zTrukTTjucS8lTzntqBYAJ7BR/3DJssfDNJ2jNJGqfBok7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 11:42:08 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 11:42:08 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] perf: disable BUILD_BPF_SKEL when rust in kernel feature is enabled
Date: Tue, 19 May 2026 04:41:52 -0700
Message-ID: <20260519114152.903563-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB4846:EE_
X-MS-Office365-Filtering-Correlation-Id: 2350bb44-2af3-4ebb-ae8d-08deb59ba7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|18002099003|56012099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	c6MqUnPon4ikXvs35+3i0MLmGDKSX/xTUjEwZK/+W5LYc7g5jprsy8Nki1NolZPFSGV3u180CRH30IUTPSbRK0vEUqfeLwclq6dGfosJzwVg+MEqEMW0s3ahkacwJQQkN5CzQfiFm9bj1VZrskEHYiZVJmMxqfPGZ87xsTUKDwe1KVijSBcWMt3rytCagVwXT6UIT/UcrOpReNj9UC3a5utRQPrPWh/nwCAcu76YKHKyxVKO7jFqd1z3vnCq+kyaa7QQFXuKFGrw5FTBz0+NTsILvejDwr3knXyLBeVLRm68mWfSg6Dvh+iUC8nS7F93w5/RZ9jE0VddPWl1/3aHYr5iaYT9U4AS3d11NLj66RtIdGQiM0xzT4bY5tcsaxNU36QwmFgu2Zh5JUDae5gHSNcuwW5McuX3ZlbH+vcbJGU9BpzqqZwKcT6qwPJUGLDGPibJYJsJAFekiibW9TVem0+MfXkyt9KdcsEEnX3tiN7E0rn+FhDZod4hC6q69ZwMopo3STzmdVVmdQ/Nd/TnRBaZ54JGvjsLgPwN/9nDhX00zlig0B3iPSr+xJN5C9qYW0RaOLx1Wj75u5q0HuEroFK6Q61P7+Yjks0hETwMNomcjgetSUYkvn2U6w/1POjcBJvUVqL+ZLr1gphsKzRVfixx6H6dgcqFHtFtHdqhsrwhL1PigRSz1ohe2BvHUtSJynLgOM7nfCSykNO3ysuAUBkElW8nTyCAxfFXiTMPGU9EeINed6mioUED0AoDhuIC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(18002099003)(56012099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hKiQI8t1yojRS0AkpTL7DEottIGZRlLsHneTVPAVTXBCLzxERhbRb3nMmsXl?=
 =?us-ascii?Q?/z3Yc3U0Gv7EEuQvUNSs1RAtvieNLR9B11lwlwfTenA6uRWGnYMf1YxzUSwj?=
 =?us-ascii?Q?7KqGoTSHRB3ttlPpkrmgG20/Tb7zvefG41oggwCRLkJfvDWN7AUAyKUfWM1M?=
 =?us-ascii?Q?EOrGLdmgYrrne3x/C9vmbajV58o13hQI9CZEOxosHjAeFGMJUspF0qoa+llS?=
 =?us-ascii?Q?AQXySqylu37oa7wFArHrecesCx/Q+0DU9Wfw5XVMELe8XL3YOehzlLKNh8d2?=
 =?us-ascii?Q?Wtpmq2N0ePfMbD/VeibNutcD3VPNViG/1rWC1X6AiAxfhcKY1IWTk+tY7jV5?=
 =?us-ascii?Q?70HW6BZO+Y5wGX4pj9peBho4e1N1LzE/wJLwc1bXfOYREmgpB57BMdKvfqSG?=
 =?us-ascii?Q?FdOiVlOvqsiGQbVq/qghHu036pgHtIIJHJJZtzWZaDqKN/pgPX2FAPiXZal8?=
 =?us-ascii?Q?TwOX7lgmgkWdpsxz6hQni8Okx2dRCiyYK2tje38zKuJTNpUCLU/HlTCelSCr?=
 =?us-ascii?Q?0O2B8htXyOTFFkU3/dqOa98E2qG3nHtmazgOrBCKe8m1Z4w7vGoilPWmGvvL?=
 =?us-ascii?Q?Rue/YpFD7hLmaBficTd6v186peUL7SPALG9hrI4b3lCRbz0NSaA7Sl2YABGT?=
 =?us-ascii?Q?WwYMeArWXk3HUd6HMgWPx+jwwLEDON5GQI1DLRX1ayLCvLiY8maxrZy48kmn?=
 =?us-ascii?Q?ZPEnSghA3W6yoSbnTlBRFfQottFbWcS2EQUac6GaI13jVWAfNC/VwUN87nfa?=
 =?us-ascii?Q?9dOwCgSE5KwtIk22xRKlAKB+yZDIC7+eJa53cLUKjGwdE1+gSenxw8QjrdCx?=
 =?us-ascii?Q?MoyXCaRNz4DbCZE/olN9q3H0WLbP0h4mg8Y90bawppTP5frX7Kk/71Bv4koD?=
 =?us-ascii?Q?EuKVSR4qEjmI9rs5QeO1uwDp7ZfJ0LFbIFhvYzrfhrjp9i8TPe9/29kEEaME?=
 =?us-ascii?Q?v269fs0wdiMzozw7grQTxQIsEmUjODCiJFIrxc4B5Y8V/r8ToXFq4sXskl/B?=
 =?us-ascii?Q?umKWvbOykZU1HW22YxuR7GHEAosyz8yt5WcenErmS0XpAJ3MJ9QF+semH0v8?=
 =?us-ascii?Q?5u8qLzNscaTk7eNFURhrwvZ0dP01hUVDhWWIOHudn+Xxh3UVwAHyE2U9cY/q?=
 =?us-ascii?Q?wDNS7NQc3iPrdE6d69QeiRZ+ZjmbkadZYeqsp3FFmHraZhaZzYrRVTcsra39?=
 =?us-ascii?Q?EMI99OaeTl9jjmA/80gDPwZR4+PzQ6c3ZXGJE6ZHFKKpUSC5hFk4C+hM0zhG?=
 =?us-ascii?Q?KpqBVTb/zxWbgDOdarGJ5CuNSarVjtYizeoDQsEJ8YI5ilD9G94pYT0iB25p?=
 =?us-ascii?Q?mm7Jz5oGGWl7NNbCvEU9XRFV0w+8OcmgO52buwg3k3WD6pT7T9+WTfQHcSo9?=
 =?us-ascii?Q?bqhJGqBQj9PJcv07bdyp3Pk1cnGiaLLnxIo7yXbFYRUv+rYfY+J/xHR5iHHU?=
 =?us-ascii?Q?klIFOBWXPj50PacrmQBBDgI1CmFny1FyQdMlvkDeaRSckPGef90YhI5ADF3P?=
 =?us-ascii?Q?BSWipBndue1+fi9MWbLcfWl/UIHqtIkzub3Wms5LksjX90fDeHmR0jxKdczJ?=
 =?us-ascii?Q?Sc/VFEL6BwPyTwFwemLjtNkko9B1UBxTxIt0aiNrZ6n/jg861O7DMxlSZg7L?=
 =?us-ascii?Q?zUtcakPx1AuT//VOr+9Ccz/ry5j5sKoGuues8r85dWLrZs4WblR48WQMu8+U?=
 =?us-ascii?Q?02RLyihIkC13Fo2iuY6lAeOAKI9JRCi8YzgrWPhcTzJSQ7yxSx8C5Xbj//jj?=
 =?us-ascii?Q?GUNNeir4p8I+kIHoFux3uIJnKpqcRRE=3D?=
X-Exchange-RoutingPolicyChecked: 
	BLfghBxgqefGAsCeap30VlJgjTR/AyBHlcpgW3MDQO7o6aCj+CrXv5lLJ91hWBrrptoDIVOAmCFgk1SgV+F9p7GaoUoq+epI4J+wo82rjihPRTDqT7FjWhvecBCWl4jpjz6bsfXIgpzzG9CPbut3u5poEhROZeWNaHevRDan4WNF9WR283BKWBduWM8RPB8nqSj9lNzNGlo4e4TZ7ahRU+6qlCYX7P3PhcdL4SOMlFddtBhVjpkM2LFMzacE/ShCWhAd8d2pjFLNlTG0OQR8/ww/ZjKAHQ+9tUWGKloWBxMIQD4EA7VJ/9S4N0yJrSn4LMJRCYgVWz2EhgyB52ZQfQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2350bb44-2af3-4ebb-ae8d-08deb59ba7cf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:42:07.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6kT8FBNPlnuf3jt7pSNicFX5x6BTLZOS1QPDjJ7ivjQpPCWIrj6JEkvWPHSVMiL1R/LFh+5DyPvqfKgjSWmdmeIccYJ0AAEBkmdrHtSlZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
X-Proofpoint-GUID: V0Zq4w5GIPkfrWoQAKmP97OZ3tnIS_rn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExNCBTYWx0ZWRfX4gs4N00MtvLi
 9exJ1iMGgj42y449+Xe9F8HqefqYnPwLSWVmv62B5UDYZbJXTWjevT2xKnTQ9ISogaUAdiieYkp
 +ObH5KryaBlzczz/5/TDnW4j+CAsJUgdDiNZ4kzUxjXxATgloRTz2VzsgMFvD1zIX58pKdT3Kwl
 yjaUKIQ3fbacGJUrIaqK7Pl6gFnIs3fc11ux62NVZWXUEQkP7LnKaswshaN5Bpc3Oq2OdSlmdH4
 7EnDANXQqG6PgiSOqb3hX7Xnl6VVvXHlRWyvdmQtme5Yw4BQsJ1q6onwIN5/wcYvHypkA2xv7S6
 18hE/IaZKr6/mbaWT9GpH8nI2bK6XvAp1MPz67JLxT74l/lO/Agx3zjGg1Eyxkai2rsWXFNsL4+
 Kb0R8y2jb9jduQACNb3OTzGZ/NI1zSYscXdc8+9zw7bHABbaDFjrEoWdKfz9ZKcn51CynnCRRPu
 VbByQBNKnU9D8AC5NDA==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0c4c92 cx=c_pps
 a=5zjvB78PlnLPEzvzEo0MXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=tfS-ctL4uiHXehzguyEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: V0Zq4w5GIPkfrWoQAKmP97OZ3tnIS_rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237318

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Enabling the Rust in-kernel feature pulls in clang-native as a
dependency for the kernel build. During the perf build, the presence of clang
causes all BUILD_BPF_SKEL dependency checks to succeed, which makes perf attempt
to build bpftool as part of its build process and make build to fail.

Previously, When Rust support was not enabled, BUILD_BPF_SKEL is set 0 due to missing
clang dependency.

Error:
| make[3]: *** ../bpf/bpftool: No such file or directory.  Stop.

As a workaround currently disabling BUILD_BPF_SKEL to make perf to build.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index c3ef25fd99..9fc100e961 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -438,3 +438,9 @@ perf_fix_sources () {
 		fi
 	done
 }
+
+python () {
+    kernel_features = d.getVar('KERNEL_FEATURES')
+    if 'rust' in kernel_features:
+        d.appendVar('EXTRA_OEMAKE', ' BUILD_BPF_SKEL=0')
+}
-- 
2.49.0


