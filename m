Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C3EF531F4
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 06:38:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12943.1776148698560686171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 23:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HXpxkd/q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85643df1cc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4n3AB196049
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 23:38:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+S0sfA6nUWP8yJZt9hH8Ez2YoLRLmVwnk65DI2VoxuU=; b=
	HXpxkd/qb6bHl69o9HgaV1oSeSHwaS/NWsUX2KWRAQ0mdIgorrhl/wOSmaOWmKFn
	yaFdcoNmPSbGAUAQbcNitrpFwT964NXcFio0BZ9i2SzEBw6jjp4Arz1swenNNoE5
	7JF+ZqlDamzqi9BDLvqpRJ5H0BRR/cLtLWp5dAgoBbD72CJ/pq8TUJSBXFpXi4MC
	FKHZj5wiU2u5hcrKpwvoESpILU2lMOjS2+ABt7he4wPQ5747SJIPfBJuQXuhAmN5
	nhNCFulYRTKOqAc3PXUtZYFLECG3cj3Vnvk6FNmQm9FnwO2GndT2v5xmshvkIUJ7
	ivQooLNnoOa8qnT49Bp8Sg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87mrc5q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 23:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/1i/Wisi2S6XYxcQ63D/RTjLC/HuG2g/GQ5jXD1xMqEzAGRCD0yX3OOkLr2AwdDC3KJ0+wnItfLgjFPKzxLbfT2zcBUlgZrvzYx9ZCT/jdSDdQi/PAQbCJ1zqNlsXA6mW680cfVDe6EDeDJgeoh7hBM3R0zsw0mHwyCftrWjdog+oVYdp/mAGLTKFx0snuRJzNqqyK0lp+ET6ef499C9yvBgsb+26HSWQUxDdmlethDLUYX71vqBiVUkPECa+UbFA/xw3WQ288P7j4W2tek0WU7TceZ/a7srUU5mcu1N08U2uMUh0hJpB1JjVH9a+at85nePW1R/H6zosmKJzwfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+S0sfA6nUWP8yJZt9hH8Ez2YoLRLmVwnk65DI2VoxuU=;
 b=MdhZhr1tekuGFrq6xMHaDf5BsnCfXun6dMWDJjEdQVIjYKh+1W0QdecAcb0LzP64cyrqhjDB2hmOp5lRmHuPglIJLVprV2FmzlukwALdY3kb/WE3SF3ysxg7OH9hN3eJqiJnfQwys7/EageStsVlEzQBrwVUaZqZOwPc5iHg7vM8KheR+PF49TrHXIpuKI2DI++xUHzfMMYLhI8aQrqT9CIiTglw/VM4rnzo9WHtc9i1dRyHln974yhgpyTMvU+oJgoBNFJ56Yz6GrxPArvC4TfBl85vDKa16/oA+s3Ni8cfz7RKRd9J5LChq4k9WpxPrW2OdswlLc85xWMlXThZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 06:38:16 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 06:38:15 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 4/5 v4] oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
Date: Mon, 13 Apr 2026 23:37:49 -0700
Message-ID: <20260414063750.2315189-5-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260414063750.2315189-1-Deepesh.Varatharajan@windriver.com>
References: <20260414063750.2315189-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a02d0ed-daca-451b-0c45-08de99f06886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|56012099003|21046099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	BloX7E08lK5wEJzL0L89xGJOwYSomWKZOwwSFyWRNPZ5fxg/DlhGY9u6ysK6IGZqkOkSDX4UkRT2dY7uPOS68Apd047TIsc6TUS0Xm8jaeyjla8hDIrWIhoN5pkr+ROaWCp3jvPoG92gOI2nJjhc5D1YNQERfSU8/5L0PD390f45/V8aZHnuHqcETQVSZ/kOMwLMWhAATSTZfZDKO+nuhtUVb9fEoxcl2uHKF4Udw+q7fyPDCDrNWs3Q9r0CdYS+TxNjcMUUUguOxjJVZU7v9fbvZpxoLIDACJti4V9ZPdaDZOK2xDJWxYl715LGnUSmHGXV+uIfZujX5ACPHCFHnw9wIo0uO3XTjSHanKYTBM9Abh35HW+eRu3ep5XllpIl6Dv0gNg6XNyZ4lO1mJE1OThFtHthMTXI5DddIbISJS6jQ11+oNEzOutcRZp90Ht4o5VZ/ij7iN3i3/+GPXqJZylGir2iayaKq34qU2WBgK0HXivPiZFWmUS3Noj/EaRNuPuI5fRRf+JA4Xog/wMOhwnz4s4bVFhg72XyiYSHh2ftPYDilQbPcz0Ng7aQH5GunUWpnQqMmYSim+/NMHjVHIXof95Y7ZzKrFxYOWtM2fEg/4fP/nfNX0SNzXQDDUk89XZZZx5/VxWWiOmhNRNq0uEcScGcR+vMqFVrcAM22OQx/f3mNS59/V+qLDzVIlqPoQKv4D2afpcwKdLX7e6DDja5FrY9dj07UdCjwkOUGLw1DQo9j3C3ikXh66xFj+21bluVCF5NUSDmISkmGVXX/caC1Yz1JaiplNcX1C6lwLc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(56012099003)(21046099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fry4qfsxfb68xjIyx9yYhuc9qy5N4OlbkbximwOqhr3J/deNdJ5TbBi/weuE?=
 =?us-ascii?Q?0B8G8fwEr8FSa/mYL1ay3ndfS6U6o4m2yqEsSlAzTu5Nlc0fmYxVvo33oiAR?=
 =?us-ascii?Q?eB8pZgkSs44tL26MFtxbQBNaLie1RmwCpCHCqtgKQUNn1hLoL0zxyD+Md7Dk?=
 =?us-ascii?Q?fFdMNpV7swkHmDmwGSYIvhfUY2wl4Sj8SZIEFpj1UcIEqSoGBkaKM4vxA38R?=
 =?us-ascii?Q?aSpaYd78CVtO1/1l1pjjvBg8xfM24EMUw3qKi9YWuUOM4NozagO/9RKmxEau?=
 =?us-ascii?Q?sun8rSGXKUK9fCVsQXrjABVKgmTx0vTAZhJ/IT0OaNtkcq1UJgCs0aT0HcG/?=
 =?us-ascii?Q?Ld2wBKw05iRgdwotUHS7MrvUmS81oGRYDwuqGWoMWMd4nITLiUpGErLJSQAp?=
 =?us-ascii?Q?3XL45d+HWlQTp7WVX1+5hhIp0iE7rFCjpzs7FzyXKF7fnJP0UI5rwqvfm32b?=
 =?us-ascii?Q?LwpKF6atXR5YQ2vgpkL+N/rJ/l6BeDmNH/YKLs56ogLgQMoDY/HUjpGUe5uY?=
 =?us-ascii?Q?ZEwaCapk7IYf03vNJB4gzl/edJ9V5ytYb+c8HYDeudTQXJewSmqhoDsC/8lK?=
 =?us-ascii?Q?zBAO4Ea+ll0naiTDIPFg7seZtpH1E1QeHHaRjMAvyvP08cke5dWoWyBwsbSn?=
 =?us-ascii?Q?jxyuXZcAqOf0viCdVkO7hympP1sZSMQTFWEn6lUfncUu7UGZE5cGaHMlQ6os?=
 =?us-ascii?Q?B14II8EAEzdlnReQYYIFwFABiDIR/a2eQEFLJrFtGk5yVO2IiNxFFUOXE8+M?=
 =?us-ascii?Q?m/2U0Jz17kqa0J5BrPOIi5eSPxuK3Za53GBKsygHwZs7tv5i4S6/DOWemcMf?=
 =?us-ascii?Q?PvMyowXXVAKg3inzI4xOd0IIWgnzba9YBGBkB2Ol8z8rN3uEmzLu2gF/53Pi?=
 =?us-ascii?Q?pnflUkJmMb8poq6NJiKhf3T0Wr5ZhiJVgCdD8C3cRaeduePuOdtBbXZC/3ak?=
 =?us-ascii?Q?36a2a2OgVw4tUCc8gMQZMBSdschGrnF0j7NelKOI8uODBPQvv6RB4qaUtGY3?=
 =?us-ascii?Q?QSSmfqDkOt5cTJOYEsoGU2/NWoSejK8AoVmX6hAgUQzXH8kqmJSzsjMOFGuQ?=
 =?us-ascii?Q?2gtVZj8BwNGfEQpSqMTQIdo+rUhfacBQsjNFYsVA5Nol2TDuCK9nEwEyoz19?=
 =?us-ascii?Q?Qe0yBLBCJbHkgxE+T6jNYyJlfP1yTXJmfJK+t+Fy4WQpsc19fJfahxpBsgNk?=
 =?us-ascii?Q?VzHTmEFw5HeKZPH5pGwgSQrRQLOkcuhNKySgh3YHTWtc1uqixca51Ix889zz?=
 =?us-ascii?Q?HfY19r75mFHnqZEWarwLYSGfkYtaMl3oMypLYulkbteZ0agLXPsOiOYbWTzJ?=
 =?us-ascii?Q?xnqW0vipV5/c4pw2nnKmKlKmAUFdG3Vt4A0X4B6CFk1HBAuPDH4HYYs6okFA?=
 =?us-ascii?Q?WxrIiZz7sea0sH/0Ut/XVmA4DlHSyzIi94ntBbtdhUe2Am/3lnIs22cuKI56?=
 =?us-ascii?Q?AxN2SE3Gj2D8uEARPJujQ+1ZXgqoy5dV+wb/GKKcdTBzS9yEiu4GDybKpWBk?=
 =?us-ascii?Q?D/nt87QgFvBAsbpcmj5gUy0PWbpiW3qEUktncIX6+S4ZI0g6bdBYYPt8SRYu?=
 =?us-ascii?Q?9OyFVCFv0HrpGipd62AfPHiz40Gal8W/VF+T6H0G3zsAO6MfWa1fvKSROn1B?=
 =?us-ascii?Q?pl87BSHztqBHNykNk90PqjWZI5uoWTlsXADmtqp/8ehGlymUhCkWmLcskPLT?=
 =?us-ascii?Q?N1r8Z8wQMdzBSGjITvfuA17N6ycqqJPKSpcKWlS7fCa3hVdX+pTiV3ItawXK?=
 =?us-ascii?Q?5hxA7T8CI41LbqntQNlazcBrixBE+yU3WXYiJFtVS6h1tqeqAiGw?=
X-Exchange-RoutingPolicyChecked: 
	sqElWEoWXsMd3wTgBviLBLLvk8qw3lrPUJrG3GtuBG2pJAJsSjtqAqVzJsTKxhkQt3qLHMqKXv0PJZ9+I1zyxmHko5t3FGU0HWI3Ktp1MF1xDBVM3+/51Tp3XEQgX4ksJl83gY+oup00jUHD8YuS9TkWAUqjVl9XtBs1ue9lpqydJHzLFp0accf21h0M64tEKWHpgaQXzGqDZITXsNF8FPxF8vCGcjWSn/4szkaYr2nt6qwnCjagx2blFdQprSaJC97h1XDp/Fj2cMl5yL5gR+cJ8zAdkJdhVPoj2oQyPqETNUwn3gfzxLdiYoe+eO+5Vypw6v/p9OqMZ3gT0zYDaw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a02d0ed-daca-451b-0c45-08de99f06886
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:38:15.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVuF3IYxvHZvK9XUnESD21ouDk2KY17AZoiRPBm4c5SOuRAmbYRdad/42O6e0z6dh43rkWt6KIm4NsasC5d2AlVBK9LT8qYiHZsIcfnavsblQWwv1xQt1Oi3EbaonI9Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MCBTYWx0ZWRfXyVRchEQymaKR
 WiQuoOts1+sSpvzq4GCnNEuYEEt/o3nPlRkuKYb3wuYAqBVOzwXXdg96NozfuZxEDgokVIusXrO
 LOyupGMkapVkMHfuSfIm909PunWdA9bLGrR4Jm0jXmYI0xmXhlrGcm7mHOReHIlX7swCf4qxj6L
 2EuoqNJvjZbVzZHC59mWIOvMVh9ybzkbf3vQh43yVWovY7uN3Tcku6os3ilIdUxTQYSY75BKGVA
 w3jswlRGIZZglPoZfUPhbYzGbO4EHewcXSkfc0/9a/MuQa8W7uTWd7Uiu0+Srw8Kp+ppBIs3ji8
 Afio57wT2rxd7eX5YN8B6Ukpbu2y7/UzoCxW5wPJnZz1EAsZI2530x6/MDF4GJiYouVfEEwGUGi
 /iRsQ4IVYKpke/MumRPXor7L60Th8AJj4TyVGj6KdhFmbNCDZWWzgKb48QnSRsiBtmTsEchcDHT
 dJAgM6AyGJ4n+62tT2Q==
X-Proofpoint-ORIG-GUID: wKSWhfTL-6Re5Jbb8Q3dAJWK4vubrSyS
X-Authority-Analysis: v=2.4 cv=GupyPE1C c=1 sm=1 tr=0 ts=69dde0da cx=c_pps
 a=Av3Y+FYNlx8hu8JbWhmVwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=iG7WmaLeum_H_6XJk-4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wKSWhfTL-6Re5Jbb8Q3dAJWK4vubrSyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235140

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Introduce selftests to validate LLVM, Clang, and LLD test
suites using llvm-lit for target builds.

The tests cover:
    - Target tests execution under QEMU via NFS using llvm-lit
    - Architecture and OS-specific test filtering
    - Known failing test exclusions
    - LLVM testing is skipped for x86

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/clang.py | 324 ++++++++++++++++++++++++++
 1 file changed, 324 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selftest/cases/clang.py
new file mode 100644
index 0000000000..21d422a006
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -0,0 +1,324 @@
+#
+# Copyright (c) 2026 by Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: MIT
+#
+import time
+import contextlib
+import subprocess
+from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfArch
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu
+from oeqa.utils.nfs import unfs_server
+
+class ClangFamilyBase(OESelftestTestCase):
+
+    ALL_ARCHS = [
+        "aarch64", "arm", "i386", "x86_64", "x86",
+        "mips", "riscv", "riscv64", "ppc", "ppc64",
+        "hexagon", "sparc", "sparcv9", "msp430",
+        "loongarch"
+    ]
+
+    EXCLUDE_OS = [
+        "Mac", "macho", "Darwin", "OSX", "wasm",
+        "Windows", "Win", "MinGW", "COFF", "zos",
+        "FreeBSD", "aix", "fuchsia", "ve"
+    ]
+
+    DEFAULT_PACKAGES = [
+        "libgcc",
+        "libstdc++",
+        "llvm",
+        "python3",
+        "python3-core",
+        "python3-modules",
+        "nfs-utils",
+    ]
+
+    def setUp(self):
+        super().setUp()
+        self.target_arch = get_bb_var("TARGET_ARCH")
+        self.tmpdir = get_bb_var("TMPDIR")
+        arches = [a for a in self.ALL_ARCHS if a != self.target_arch]
+        self.filter_out = "|".join(arches + self.EXCLUDE_OS)
+
+    def build_core_image(self):
+        features = [
+            'IMAGE_FEATURES += "ssh-server-openssh"',
+            'CORE_IMAGE_EXTRA_INSTALL += "{}"'.format(" ".join(self.DEFAULT_PACKAGES))
+        ]
+        self.write_config("\n".join(features))
+        bitbake("core-image-minimal")
+
+    def start_qemu_nfs(self):
+        ctx = contextlib.ExitStack()
+        s = ctx.__enter__()
+        nfsport, mountport = s.enter_context(unfs_server(self.tmpdir, udp=False))
+        qemu = s.enter_context(
+            runqemu("core-image-minimal", runqemuparams="nographic", qemuparams="-m 3072")
+        )
+
+        status, _ = qemu.run("uname")
+        if status != 0:
+            raise AssertionError("QEMU SSH check failed")
+
+        status, _ = qemu.run(f"mkdir -p {self.tmpdir}")
+        if status != 0:
+            raise AssertionError("Failed to create TMPDIR on target")
+
+        mountcmd = (
+            f"mount -o noac,nfsvers=3,local_lock=all,port={nfsport},mountport={mountport} "
+            f"\"{qemu.server_ip}:{self.tmpdir}\" \"{self.tmpdir}\""
+        )
+        status, output = qemu.run(mountcmd)
+        if status != 0:
+            raise AssertionError(f"NFS mount failed: {output}")
+        return ctx, qemu
+
+    def run_llvm_lit(self, recipe, extra_filter=None, timeout=None):
+        build_dir = get_bb_var("B", recipe)
+        workdir = get_bb_var("WORKDIR", recipe)
+        lit_bin = f"{build_dir}/bin/llvm-lit"
+        test_dir = f"{build_dir}/test"
+        guest_result = f"/tmp/{recipe}-target-results.json"
+        host_result = f"{workdir}/{recipe}-target-results.log"
+
+        filter_regex = self.filter_out
+        if extra_filter:
+            filter_regex += "|" + "|".join(extra_filter)
+
+        cmd = (
+             f"cd {build_dir}/bin && "
+             f"python3 ./llvm-lit --filter-out '{filter_regex}' ../test -o {guest_result}"
+        )
+
+        return cmd, guest_result, host_result
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLVMSelfTestSystemEmulated(ClangFamilyBase):
+
+    LLVM_EXTRA_EXCLUDE = [
+        "BugPoint/compile-custom\\.ll$",
+        "BugPoint/replace-funcs-with-null\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice-absolute-md\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice\\.ll$",
+        "CodeGen/Generic/fp128-math-libcalls\\.ll$",
+        "CodeGen/Thumb/2009-08-20-ISelBug\\.ll$",
+        "CodeGen/Thumb/2010-07-15-debugOrdering\\.ll$",
+        "CodeGen/Thumb/2014-06-10-thumb1-ldst-opt-bug\\.ll$",
+        "CodeGen/Thumb/PR17309\\.ll$",
+        "CodeGen/Thumb/dyn-stackalloc\\.ll$",
+        "CodeGen/Thumb/frame-access\\.ll$",
+        "CodeGen/Thumb/frame-chain\\.ll$",
+        "CodeGen/Thumb/ldm-merge-call\\.ll$",
+        "CodeGen/Thumb/pop\\.ll$",
+        "CodeGen/Thumb/pr35836\\.ll$",
+        "CodeGen/Thumb/pr35836_2\\.ll$",
+        "CodeGen/Thumb/scmp\\.ll$",
+        "CodeGen/Thumb/smul_fix\\.ll$",
+        "CodeGen/Thumb/stack-guard-xo\\.ll$",
+        "CodeGen/Thumb/stm-deprecated\\.ll$",
+        "CodeGen/Thumb/stm-merge\\.ll$",
+        "CodeGen/Thumb/thumb-ldm\\.ll$",
+        "CodeGen/Thumb/ucmp\\.ll$",
+        "CodeGen/Thumb/vargs\\.ll$",
+        "CodeGen/Thumb2/2009-08-21-PostRAKill4\\.ll$",
+        "CodeGen/Thumb2/2009-09-01-PostRAProlog\\.ll$",
+        "CodeGen/Thumb2/constant-islands\\.ll$",
+        "CodeGen/Thumb2/ldr-str-imm12\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-1\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-2\\.ll$",
+        "CodeGen/Thumb2/thumb2-ldm\\.ll$",
+        "ExecutionEngine/MCJIT/.*",
+        "Other/spirv-sim/.*",
+        "Transforms/LoopLoadElim/.*",
+        "tools/llvm-cas/validation\\.test$",
+        "tools/llvm-cgdata/merge-combined-funcmap-hashtree\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-concat\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-double\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-single\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-concat\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-double\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-single\\.test$",
+        "tools/llvm-locstats/locstats\\.ll$",
+        "tools/llvm-locstats/no_scope_bytes\\.ll$",
+        "tools/llvm-objcopy/DXContainer/dump-section\\.yaml$",
+        "tools/llvm-objcopy/ELF/basic-binary-copy\\.test$",
+        "tools/llvm-objcopy/ELF/binary-first-seg-offset-zero\\.test$",
+        "tools/llvm-objcopy/ELF/binary-no-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-segment-layout\\.test$",
+        "tools/llvm-objcopy/ELF/check-addr-offset-align-binary\\.test$",
+        "tools/llvm-objcopy/ELF/dump-section\\.test$",
+        "tools/llvm-objcopy/ELF/gap-fill\\.test$",
+        "tools/llvm-objcopy/ELF/pad-to\\.test$",
+        "tools/llvm-objcopy/ELF/parent-loop-check\\.test$",
+        "tools/llvm-objcopy/ELF/strip-all-gnu\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-keep\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-only-section\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections\\.test$",
+        "tools/llvm-objcopy/ELF/update-section\\.test$",
+        "tools/llvm-original-di-preservation/acceptance-test\\.test$",
+        "tools/llvm-original-di-preservation/basic\\.test$",
+        "tools/llvm-reduce/temporary-files-as-bitcode-split\\.ll$",
+        "tools/not/disable-symbolization\\.test$",
+        "tools/opt-viewer/.*",
+        "tools/UpdateTestChecks/.*",
+        "tools/yaml2obj/ELF/custom-fill\\.yaml$",
+        "tools/yaml2obj/ELF/header-elfdatanone\\.yaml$",
+        "tools/yaml2obj/ELF/header-sh-fields\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-end\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-settings\\.yaml$",
+    ]
+
+    #Fixme LLVM module testing is broken for x86
+    @skipIfArch(['i686'])
+    def test_llvm(self):
+        bitbake("llvm -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "llvm", extra_filter=self.LLVM_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=7200)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for LLVM: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy LLVM lit results back to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class ClangSelfTestSystemEmulated(ClangFamilyBase):
+
+    CLANG_EXTRA_EXCLUDE = [
+        "APINotes/yaml-roundtrip-2\\.test$",
+        "APINotes/yaml-roundtrip\\.test$",
+        "AST/ByteCode/builtin-bit-cast-long-double\\.cpp$",
+        "AST/ByteCode/builtin-bit-cast\\.cpp$",
+        "AST/ByteCode/builtin-functions\\.cpp$",
+        "AST/ByteCode/builtin-object-size\\.cpp$",
+        "AST/ByteCode/c\\.c$",
+        "AST/ByteCode/codegen\\.cpp$",
+        "AST/ByteCode/complex\\.c$",
+        "AST/ByteCode/complex\\.cpp$",
+        "AST/ByteCode/const-eval\\.c$",
+        "AST/ByteCode/const-fpfeatures\\.cpp$",
+        "AST/ByteCode/constexpr\\.c$",
+        "AST/ByteCode/cxx20\\.cpp$",
+        "AST/ByteCode/fixed-point\\.cpp$",
+        "AST/ByteCode/floats\\.cpp$",
+        "AST/ByteCode/functions\\.cpp$",
+        "AST/ByteCode/hlsl\\.hlsl$",
+        "AST/ByteCode/intap\\.cpp$",
+        "AST/ByteCode/invalid\\.cpp$",
+        "AST/ByteCode/lambda\\.cpp$",
+        "AST/ByteCode/literals\\.cpp$",
+        "AST/ByteCode/memberpointers\\.cpp$",
+        "AST/ByteCode/neon\\.c$",
+        "AST/ByteCode/new-delete\\.cpp$",
+        "AST/ByteCode/placement-new\\.cpp$",
+        "AST/ByteCode/records\\.cpp$",
+        "AST/ByteCode/spaceship\\.cpp$",
+        "AST/ByteCode/unions\\.cpp$",
+        "Analysis/dead-stores\\.c$",
+        "Analysis/exploded-graph-rewriter/.*",
+        "Analysis/scan-build/cxx-name\\.test$",
+        "Analysis/scan-build/deduplication\\.test$",
+        "Analysis/scan-build/exclude_directories\\.test$",
+        "Analysis/scan-build/help\\.test$",
+        "Analysis/scan-build/html_output\\.test$",
+        "Analysis/scan-build/plist_html_output\\.test$",
+        "Analysis/scan-build/plist_output\\.test$",
+        "Analysis/scan-build/rebuild_index/rebuild_index\\.test$",
+        "Analysis/scan-build/silence-core-checkers\\.test$",
+        "Analysis/virtualcall-fixits\\.cpp$",
+        "C/C23/n3018\\.c$",
+        "ClangScanDeps/module.*",
+        "ClangScanDeps/multiple-commands\\.c$",
+        "ClangScanDeps/optimize-vfs-edgecases\\.m$",
+        "ClangScanDeps/optimize-vfs-pch\\.m$",
+        "ClangScanDeps/visible-modules\\.c$",
+        "ClangScanDeps/Wsystem-headers-in-module\\.c$",
+        "CodeGen/builtins\\.c$",
+        "CodeGen/compound-literal\\.c$",
+        "CodeGenCXX/int64_uint64\\.cpp$",
+        "CodeGenCXX/pointers-to-data-members\\.cpp$",
+        "CodeGenOpenCLCXX/constexpr\\.clcpp$",
+        "Format/docs_updated\\.test$",
+        "Frontend/rewrite-includes-bom\\.c$",
+        "Interpreter/cxx20-modules\\.cppm$",
+        "Modules/crash-vfs-umbrella-frameworks\\.m$",
+        "Modules/double-quotes\\.m$",
+        "Modules/framework-public-includes-private\\.m$",
+        "Modules/implicit-module-header-maps\\.cpp$",
+        "Preprocessor/embed_constexpr\\.c$",
+        "Preprocessor/header-search-crash\\.c$",
+        "Preprocessor/headermap-rel\\.c$",
+        "Preprocessor/headermap-rel2\\.c$",
+        "Preprocessor/include-header-missing-in-framework-with-headermap\\.c$",
+        "Preprocessor/search-path-usage\\.m$",
+        "Sema/arithmetic-fence-builtin\\.c$",
+        "Sema/atomic-expr\\.c$",
+        "Sema/auto-type\\.c$",
+        "Sema/builtin-expect-with-probability\\.cpp$",
+        "Sema/constant-builtins-fmax\\.cpp$",
+        "Sema/constant-builtins-fmaximum-num\\.cpp$",
+        "Sema/constant-builtins-fmin\\.cpp$",
+        "Sema/constant-builtins-fminimum-num\\.cpp$",
+        "Sema/constexpr\\.c$",
+        "Sema/c2x-auto\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-1\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-2\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-3\\.c$",
+    ]
+
+    def test_clang(self):
+        bitbake("clang -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "clang", extra_filter=self.CLANG_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=3600)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for Clang: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy Clang lit results back to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLDSelfTestSystemEmulated(ClangFamilyBase):
+
+    LLD_EXTRA_EXCLUDE = [
+        "ELF/fill-trap\\.s$",
+        "ELF/lto/cache-warnings\\.ll$",
+        "ELF/oformat-binary-ttext\\.s$",
+        "ELF/oformat-binary\\.s$",
+        "ELF/partition-synthetic-sections\\.s$",
+        "ELF/reproduce\\.s$",
+    ]
+
+    def test_lld(self):
+        bitbake("lld -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "lld", extra_filter=self.LLD_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=3600)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for LLD: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy LLD lit results back to host")
-- 
2.49.0


