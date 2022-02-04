Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77AAC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:02:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.12001.1643994124532153007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=e2wWS+7F;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=903448d3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 214GOe1o023764
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Feb 2022 09:02:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=BGLjWm4pJFksK5rdLe1wIT6CtnmYsOh4tM9QdW9IBac=;
 b=e2wWS+7FwZiQZVz43aq1RBvpY0Mfzh0cTAAfAeDqjkfQZ/9CA9+kdB1QJzYTgt5SNRyf
 PC5xVF/clCDhH6QCEAY1erfxFDpia0o0sYsmphDrVIjvCAMupMh6u3xtn89ZRjZhkXl3
 weCnPIBz2r3S7TnPQEYHwwv53o6jKTDXPIGKF16vlbCwGugEcZW8BHFZNeAJU/+7Xn4m
 tzxg98aI0qMPrPuNHk8v0v4Erdm/IiA9n+jqdAZDfcyRN6EimTGpPN/RGzikI1/nsWqh
 HI70+yXFHbZSXVp/U10na71DkpNHVWknztXtXpEAp58EC0ahx6e9xJng8R0LZA3cAHpb gg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgguu6-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxqM4fcf0iti7pSPBaYgGnALFK4nJjOf7ZfRM2apnFwFKlOK/NsiuJYhu2q5fLvruEwHgHxfuJyN8og/kmajm1qngnWf7b62ac0wTcT5N1TT85ZJ+RAhEbYoYTkISC+99jIAwc1RR0nIM49RndHQ5T0GgTOMvmYXZarB3ahg9U6fla4P5jB9l8qd5z6ZDJ8Wt534lf/DADBc7rlDv8ZJ1avmnz4vne54yigKL4slPgVI3CmIXscD/ti1cG+Y8/G6uBQFQzfv4vE/BeCXuvyWv/XbS6Pie0gDEDAxxyGatbCFTwOMj+PULlael99Z9X+om+JiA3xX5GCp5QhAFql8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGLjWm4pJFksK5rdLe1wIT6CtnmYsOh4tM9QdW9IBac=;
 b=X6q7xWVNx86bQlXBjhi3gCJ7H1Lm3LYpl0OA4IkCz+yCxI7apmGK2h18djzCbs0ch9xFgXaJqSkH5yXTNTcrkwhBTkBgX5E8t4RQFeDh5rKSq8QZSrnse/L4ERN76S1qF3eqkGoJmwnoBEFN4RJqZvQA6n7Wtyxj8aiVkWZ5YMNf3q32d1LnVbAhpigU2pxL3qsc8Po8+35FA1yyNGtIWHVcXjycQN/5phf6hnOoVQpJkMyaixkldIEsHsm2IDCdgyzARyXobGR7TCXy4k+gasoPohBo3DTGRHURxz5HqqUwkfPG/9wgxnP5WszYzVyrV9XNwpIySyWISdBwbGLJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 17:02:03 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 17:02:03 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 4/5] dnf: Use renamed SKIP_RECIPE varFlag
Date: Fri,  4 Feb 2022 09:01:43 -0800
Message-Id: <20220204170144.105536-5-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220204170144.105536-1-saul.wold@windriver.com>
References: <20220204170144.105536-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:40::24) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e3e1c70-1ddb-4526-8bd6-08d9e80010cd
X-MS-TrafficTypeDiagnostic: CO1PR11MB5042:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5042D268F987C05B7A0FE5E7EE299@CO1PR11MB5042.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I60Gni/eLOJx32fCj3m/LsAkgDvd/VS9wQToCCtO9vDBnhYhuqD4oU/a8L0WSvmfez3sX6WimusjjZ8Lq2Fvz/Asdt+9RHreCpcDaNR6+dkAbIjh384bhB3wzdnevQzSgSOUvi0NIBB9Kky7mWlkGMfrlMSFKE2bG8n0/O6EEpphc/DnzWER9wcuLZbE0V5z9ddfsNtiBmSciY9357hmMdDqdyoreE5PF1LAVfr0qCBVVPS5afK77C/ZWgLi4NcmZOYgZUmipd/2lLCnMjaJgvoAKpgR5B3SYSeZ09juLv1e+TP1kqS2TjDLV474ItlfFD0QD7PKiHpwmTG/zSkF2GzpEIKcmGNc/xEB2BLwGmMTgdgoJwCKIzNBgnn+aUwF5slV0FqNf8a4upEv/l+6pNRS27/dgR5Tmrd9ZVsRDy2nEoZM+QuArPakdtxkXdJvGFeYXob6U4n8RYpnYQwR8WApHJuk2Wzw74f1Quk2/HPpeLEV4VrBQbafJU4AZ4JVX+Sz9syyrA2rgaatNzJVZh4IWP9gIR659sVrS2pD/eml6xQujQZQmrqAxssODIG9iF4vYivM0AvrXGBxgY2lDpMFmiJByuNSrjJbp+RdBXdDP+GKSU6jPvZTzwMPwpbu9dK6d5Q5dCvjyWIWaTwct6hmjeaHQz5bO4Z9ZA9EnhbDF/JdQhZeuVPrI0WHd3ZhPcCf0CgfFEBtZZkORFpyKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8676002)(8936002)(4326008)(66476007)(66556008)(107886003)(66946007)(83380400001)(5660300002)(6512007)(26005)(2616005)(186003)(1076003)(36756003)(52116002)(6666004)(6506007)(508600001)(86362001)(316002)(6916009)(6486002)(44832011)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J+Cuq9zteEpBMpM8rlhjaxsa+HjXPkUwk2UigeIrrgFCsWkz20vXxFCA0fyZ?=
 =?us-ascii?Q?oOHU43iYw7cKHclBxmBQt9i3hu+Ccg91NqUACX3cMAknSBFb7bpRqCCFbpSN?=
 =?us-ascii?Q?87ciubRp7BjAtdz4MXjZj2zTsfZncAPezMVytTIfuq1yzzUjm1E1z3CBOC3g?=
 =?us-ascii?Q?bSGdV4dpVsVg+xDvwbKqsjNEGDmV/KeVsImqPEqMRA31aM2OnTbKZlpNcuXk?=
 =?us-ascii?Q?jn6ujVohSiiw+7+3NsseLc8XA94QsA+B3k0CsEYz7tIIk3QzEU9X2hloqopS?=
 =?us-ascii?Q?jR+JHFDqoeqtlaNF6E+W6M3/9JBNlx3nySAjnKIarSvHpQPa/W/FbBKsSb8j?=
 =?us-ascii?Q?lUT6KRWRDXbezkxM4SR2d1znA6voVpiuc13i9wRxDhcbIv+MGNLgncGwFeIu?=
 =?us-ascii?Q?sZcoOfCpalFkSOPcxLn9RmPw2Wj6+4DCCDnGobCrjvBbssvKgj7pgw+tWglK?=
 =?us-ascii?Q?9JZ0eNYB7BFwS0L5jIhSrsEsmKzSP8JWEfpZrijpeTYwkniaGDyt9Ph+sUsO?=
 =?us-ascii?Q?henly+4HoINvVxmAqEu3qErRBm6NUA18zqgB7RJ2ySRisE/Ir5dS88WXpCTA?=
 =?us-ascii?Q?Ne/11tScNvzoZiXaDQo6DtO00vXK0/vs+zIUYtKF32WPgAl9Qyne88NtdS3c?=
 =?us-ascii?Q?aIeGuChyP4J8jDuMpShpl82uGJMv4h4X7YQqL/W3NKwvZ9xKp8jXxaeaEXgT?=
 =?us-ascii?Q?zpfARQLvGHvgkvvz+mClfHrEWzLBq//4m6D1NvGedjyBdeEKKLwynLWk0k+U?=
 =?us-ascii?Q?aBdGlVMdnBjrMWfh/a9hUfyIddrDeTQssVpxkFV3n2gI5VFWW9RoFNvOK+DJ?=
 =?us-ascii?Q?1HF2xcr1DmrTKKZPqECjnY6ST9zghwf1VIR7choUcpdubxIqfH/TfBGaO7H/?=
 =?us-ascii?Q?/MfGp20TZ9fWW4ngsgnHOrANYls1VmlgoUx/WXqasHHbxsipCdesGQEFghvO?=
 =?us-ascii?Q?Tws/vNV783vGx/iq9bIfT9a3WeBqnNljARPYP+YW3H+EvgqxZTwFnE1ZB5a/?=
 =?us-ascii?Q?xMxIbRc6HbMz/6Y37VrtAmDKysgbRad74Cnuwv2U80wXc0szZiNz0DXGL0dH?=
 =?us-ascii?Q?+xy5f2x1hlf8jMqO2ZGiX87hM4UY1OyBLvOOin46XhWYnAgcUe3SbiKS++GZ?=
 =?us-ascii?Q?Nh6NdihLx6wS8hYI2LfPCPkh35cns545JQ7dd4s/hsDQI/0GGloFISyXunw8?=
 =?us-ascii?Q?xOn/jnxImOiTZAMycwd0jWj2WEz65V4ADyrbBSHXT72MaxMbg/jRox49HNCZ?=
 =?us-ascii?Q?Z4LSFn/rDpetqc9KfK3EwKZfMN7jbu2GR4K2xAoU35W/VPgjKtvOx7QuuTq1?=
 =?us-ascii?Q?P7v1mJVtuCcAeijGGVVPKYfBP9pVHQJxYPcueEYrzn6lw0lbtdZQH+b1f39q?=
 =?us-ascii?Q?+dymtOP/vpuzz4oxTzCmr7tGRMOqO0CCAzpU9zKkpi70nHKp8C2Iy4g9JWNa?=
 =?us-ascii?Q?6srFqnV8kIr+r2p6mpzyknHyffIVQuQQW3HOEoywf+glxONbgse8/zmXOvA7?=
 =?us-ascii?Q?MSS6KuqaU/ZfKGs6TDdYgHHJ1eOKMVPUOfQ2bJUkAK0FpNn9sl7QC0Q3D0UF?=
 =?us-ascii?Q?2xBdlG1agwvf1Nhx2z8FDweRbvNfoV+U+3mqKixLn9TWcL0+HqsGPY6BCn2O?=
 =?us-ascii?Q?5FdoATKnTjSD2RCqLbsF6A0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e3e1c70-1ddb-4526-8bd6-08d9e80010cd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 17:02:03.1060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AXIbpwyvqS2obz9UMyfiJqaCBjjt9H61UzKO9V2rvxmaw2lTDLY6i7knNkl+wh27d/DPzuSxoLk4Umt1GviknQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
X-Proofpoint-GUID: Cw2NYbZU-tnz3tM4k2u3KBWdJYItqulz
X-Proofpoint-ORIG-GUID: Cw2NYbZU-tnz3tM4k2u3KBWdJYItqulz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=323 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 17:02:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161368

This is a more descriptive variable name updated in base.bbclass

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-devtools/dnf/dnf_4.10.0.bb       | 2 +-
 meta/recipes-devtools/libdnf/libdnf_0.65.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.10.0.bb b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
index 3fc24b132df..3f22c1d8f2e 100644
--- a/meta/recipes-devtools/dnf/dnf_4.10.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
@@ -87,4 +87,4 @@ SYSTEMD_SERVICE:${PN} = "dnf-makecache.service dnf-makecache.timer \
 "
 SYSTEMD_AUTO_ENABLE ?= "disable"
 
-PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"
+SKIP_RECIPE[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
index 81da04c9ca1..092ad98d4b7 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
@@ -34,5 +34,5 @@ EXTRA_OECMAKE:append:class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE:append:class-nativesdk = " -DWITH_GIR=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
-PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'Does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"
+SKIP_RECIPE[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'Does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"
 
-- 
2.31.1


