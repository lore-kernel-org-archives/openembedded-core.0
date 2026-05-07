Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34373CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:32:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1559.1778175159220294345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 10:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eYLbduUG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9587ffd4f1=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475xivq3068463
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 17:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=snbnFRmpahOf14giXxZ42SZ5xNoIS1ps285J/Ldtj2E=; b=
	eYLbduUGYCZSmL0T/XJYQRsThoQAIt9RKjKZlXCIV4j1Y4W0TqnN0HZv9GwZNz8S
	i0uUHhIWp4tBFSsqzK35/0RETZAOZ5Fcdxj9V1uBo5oBJfWWonulrrRkLZp3WMn7
	6PGwsNZoxfabriKGKpXEcaAUJH+AJ6QqMUmnv8ttBD08T+g2UVC8xtTVrLFfBa1f
	LumKZsVZQbpqyS0DkotajNKC/tr8zm7DFA9WbOBB5ip0X+5F8hyFIYFlEGHcvty2
	C2MRm5JhN5+ZTUvYLa+GvyP0e+7NmRwH0MToTZCLmqDqNmKL3I58fYcuXpGrv9ob
	d7ojfKORaP6LaxnfgfXbxg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011010.outbound.protection.outlook.com [40.93.194.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8pu6x72-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 17:32:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ71rAdG1YizM1lEM2//fPXti5tNFHlo0KNw9UQCTFBf0MGctmAXhrrMI0SNz0s7P5qUTJJVxKgMhY8Hd1qzvOIfzYWARAIRM8MMsj8g2wDXlZJqd3AbacNbwYytaX0gtgdSq3vhuV3JuLBzm00OCtlCg+BIG4w2cCIbrTs1EwJxHkgs/8ZxR5IkBMxJn9wrfwU9enw/37fGyAJJWYqmp4voq7dQNKAXZRGLLDgNGKWrXY40LNAFxo4z3+nhMnglMGFm0vog54pqbCr0FpToKPHDI9jDoVWmH4pEciN92K75tp1PBGB2uatOL3+7wUSaxxQo04pfenhwg5uvIQMTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snbnFRmpahOf14giXxZ42SZ5xNoIS1ps285J/Ldtj2E=;
 b=oMQsRGVPSRLaXD04Zm6FWe5Z21Il3pKJ8Uk0m9WhvksgWDcORLWgsjwwf3QpLuaXONarcqy8dYUxX5PihcDIcgaw2rLp5XVlwr9a5jm+97nsV2gAoNpVXWOilnpLXPu8ISzsEWUasg6ukqCUvxjdq/MxGAPuJrDVSdrhwi/veN/8cN+la7sfw68tWzucfJtn7fL5EsSp2hqfaVfERTzCWc9PMfLc+15bUHTXBNQZxgPJUqm46QF5Usw9VDqyb+iuwW+Qye36bzB93SGv5vAe4vn21ohRlfLdiW6uPKBwV+RZ+n28uk4fkfaMhtMFJr7dTdIUejEgfSKDfF0sZmEs2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DM4PR11MB6288.namprd11.prod.outlook.com (2603:10b6:8:a5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Thu, 7 May 2026 17:32:34 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9891.019; Thu, 7 May 2026
 17:32:34 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        khem.raj@gmail.com
Subject: [PATCH 1/7] piglit:backport a fix for building with gcc-16
Date: Thu,  7 May 2026 10:32:05 -0700
Message-ID: <20260507173211.672855-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
References: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0462.namprd03.prod.outlook.com
 (2603:10b6:408:139::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DM4PR11MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a974e1f-e47e-4b32-6aeb-08deac5e9ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|13003099007|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	GVlupSXRu1bKeg7PWQe+PYSWLFESiocI/GV6ZxG4+QS3tFPcU+YxSRiF7TNNJYNJcvRx0UTjqMpJQppiimAXobdqWAuEn2W0QqRn4vvFsM5XXmloYE1qDJKahxtptVUjZ12Cku1M61ipEjkAj0/jnnN0Y7Xh+IjU8lM4ZrLu3QUh2MXZ+U1tIQwTMqFVCBUmNgzb3A/JbqfNep2ACOAvz5zmaYQozUlThOcO+EQmEuGecXMzWMYa+oT8UMyA0YX+OHzWbVSX8NwWWmPji1PM4OEd5AY8eaovKJtczY1iUXuB1Z3FA2564uN9o8jgmFkEEzmkYrj3zmd7MyYuyzUW3MXqLO+3ALQDKCcc1FiVHKxFX7eWSy6jwbTyabojlufdd/vHD7PVa3t+dTzrOgO+0nV2G+xQZFcdxngBKmDiAZGt6F4kJ8E1MFYIEo3sMrI/iesBKSrMQbrKwx1HJrmQrSn5S2qzI3vTrRapmmX/aGuaOA6UGT/JaeNqsGQKrL1RVeSo9WkN4o1HPLVdc4T737bdAaJsEp0vBRdAI2DUAO1oNvNxW3L8tP5/T9kZg8Px0rwhIivG0mLpYmzqA8gBcDHtdMnjHeRP70wInHf/D2rOk+VVSVP7qnFgFPO0nLtgOlZicuunTgTf8rJa2oSsnh8NKrAkFfQzwrzQUEd2BbiIDS6n10Y0EVjVDEPYCFJpqajBpNUO1r2mPozobYf33Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(13003099007)(56012099003)(18002099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rrRyzPPvrgr8OoMZHyUjt6S/2TbuIDL70H74z09dV12IVRWcGdSLxU8XJYQo?=
 =?us-ascii?Q?IgK7Qqm0dx2xBXpgESALwmDkmTzKNMJutKR2RIULaiw8LctjCFVaBFcGHyL5?=
 =?us-ascii?Q?vQ5wriweSPKht1kRe8OiBkJnc7dYrpLX/dZ6UO6+aY2yTQhfnFFMbItlxIe/?=
 =?us-ascii?Q?+Jeu7o4I9XQkGOfP7TauGHXKwGSsQIJ8sn4YtoIwqjbbuHxOTUgrs0/W5sZZ?=
 =?us-ascii?Q?KlnuOWZPP7ssXh/XvJ3Qb08f1nt7FclCqd1pLH4n41ejwX2L9P436G3c6Mp8?=
 =?us-ascii?Q?LdHxh2Vj6GXGEgdpHIYuKqLePKWR9HKRv4cypwmGmQwKLe3yC7qYPeDKR/fH?=
 =?us-ascii?Q?bpmZrgWWr5wPZh0Ank5GaoR/RUujAspGEB2mtAarSDX3W3gz/uhb2B3oVgNG?=
 =?us-ascii?Q?dXCBO+lxtXTGgIjj2yqgBNyNNij7hcyXrueGgao1dRrKRegmvVjwWXyP/wbG?=
 =?us-ascii?Q?CZabHim75B8WQq3tGwXT7itqI/ufSFOkK0YXCYSpra9F35WRXOYDeIsdwcEE?=
 =?us-ascii?Q?H9P/8qCWzCgFlPNXsOa2qeq6aExGx8GnvNIyfzusE6BQOIoVGIqoG+jgOGHy?=
 =?us-ascii?Q?jazMeanyNzW61F7NIwPD7J9kbI2VNP4zt8TRnmMVK+KfFhU37IJCCEwS8JNq?=
 =?us-ascii?Q?h3m0racZz3YwQVsd0Rxt1lMYOztwxZu/iLHde8DLkQ+D7deSfHcaCagMnDUb?=
 =?us-ascii?Q?ZAP7V+DXK8YFXrZP9vnOUq/XW11/WzHfui/gbSaQWP8PL0PRI7twPC7chLBl?=
 =?us-ascii?Q?M2EXvMJNTGOWPsX11L7YNz47+4BFL+ZNRbu0fS2sUDv7Gal7znxKS4dEogjy?=
 =?us-ascii?Q?fgBh2e+sMqpA6WVYgq8+VfKclrzcnwq/aokDHIMMZVNi1ndkFeOZadNpK91H?=
 =?us-ascii?Q?+PaeUtcgrDvfYIRHN1g7gBcCKBjouQXxanjxWsJPsVUtHd1teoiKlbaqBaky?=
 =?us-ascii?Q?1aDbFK+tS8Ix1NZDynyniYoJ/AG/2RAvVBZTLt4ciFY3Y553J1JO1AM3VOc9?=
 =?us-ascii?Q?fZjymtVlNrKiDGeyvPF73L+5WyHsschiw5VS9YutOkc1XyhExxT6Y+a8h47b?=
 =?us-ascii?Q?c1rB7QfA518NxypaTDUhRWdOh2ZvUvZmPMI0Xie1F0hUYoKEGhwdWVhXo9QM?=
 =?us-ascii?Q?1iqfDJ06QCQAeR9djmZWlcKXgVOf3H1B4U9ZOXfQgj7xfDrTbfTZ7AYRbajV?=
 =?us-ascii?Q?UoD4qO51jUcsMjy4yCIKaaDcaqwIpVsoxSFLU/vP2ytfvtM0MZ2ZjONa4l5f?=
 =?us-ascii?Q?tFr7JZI8r3o8wq1AgwE4wPHNwLSaSRe8wWng8coPQ2N5+caPiJ//wXyiK0uv?=
 =?us-ascii?Q?UEOhor2UsPkVe5RdlKXnqfefqAcfpckXiEP1GTXMc4rt2QwUz6Y7i1OlqFIc?=
 =?us-ascii?Q?DQwaqv6roYuYUHc31M2EZ7XIGfn9DuDtEjkFeGWeYtHiTQaennubz9iC/bMB?=
 =?us-ascii?Q?3mn/+GMf0vp7pyNxFbeGD2UVzYdJzQb2R29OHCKvwked1aWjGRNdwP85jcDk?=
 =?us-ascii?Q?+ktEtJfPTBwozr/aUPnEsoYnhw8sWzNsTkvKVpr8YJTUMQELeGMMTRpQShQW?=
 =?us-ascii?Q?lYHq4VeSRhlGUK1uWXdPwM506I+dMlulhIqhWsOx8ViYH4NhZJVZZgXD9G8x?=
 =?us-ascii?Q?cHrukAvghGtGn+8TYsPmwyPc0PumTrUQF8ZZBm5gkFzvibyp4mv6srNb/x1e?=
 =?us-ascii?Q?U4jzCJmb459lEOr48djuJnK/gOOxFgE5qEHtE1QBU27SDE1gsWlytDLiurXi?=
 =?us-ascii?Q?Vi8skGHkrlkNzQ7CTLz1mb0hd0hTRPY=3D?=
X-Exchange-RoutingPolicyChecked: 
	puYR/ugjpUtMQXyfo5ptluTKffVX1IoULJcjWzQQfoivRPTblbvpWN6Ex37cc+p9/0Eon3s8eu+Iwh7OQARADnfBL1kd9hukGILGAGHOdZvesKdQ7EJ6uq4mHhTzI/scuwelpXN7h1TkiSmq90dKjnyWgWmljfeuGmiiQHwuV8awQAyOjq6JX0CME3VC1wH7OTFrEmPVxbCMfY9ZOwLFCpSbwxA/nNm3SnwKPBzNaEcilG75EAAaLOxM0DAmPcp3ejnZ8FvCyrgFOM8Kjp3gZ1LzyL41HHS1Rcsm2A/pW+oHQjUefLWyfjY2Y1D0pHJYkVTBMHrnxwW3Tnj6ZmOdiw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a974e1f-e47e-4b32-6aeb-08deac5e9ff9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:32:34.5782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCVTyJJZ9Xi3gbpIubLnLAVh244IMZk879/f4zWwCj0p/RPvQPl3Rsk9uXll/k78s8TrIrt8lovou6WlA831X+lRGRoHSKD7WaZjTatgPDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6288
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AdaB2XXG c=1 sm=1 tr=0 ts=69fcccb5 cx=c_pps
 a=PJn3dW4q50A9PoMJtOr6Ng==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=0SOlGnYWBby2Ja47d9QA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3NyBTYWx0ZWRfX+VT63y7VRgdh
 kLk/R+FpiGExBOyqiI0DWtuijR4gQYU6WdVCahxiyCDCNTGRxVD/xb2ydJfqMIrmNqV9kULWt6f
 Ggxc4RkHUNckEmy3llfB768Z5gDSMNOjDbEHL+yONqb95dqIlO1ZclhFjCv1Ifi6oz8ozsbg2nL
 La/JX/58XpTH4kKplxfnBKA0bplCjNBDq1M1Zop6vRPH44S4xNa8ou9+v9a63U6c7Oxu8rsfiEZ
 0s0fJOYgfwklY0Ro4TDxIV5HxR/tEf9JvXNdnhp7qHDLSVVbLY+N8wAXVhhfCxBPk1qTQSe4lfC
 PnxzuiVHNRQ4nEJ8o4WQe4Ucnr73V7SwBAL+1jUb0zZbeCKd2VCF8xATIVuf3UbTkSqazro1rgY
 vUebkwoOvqZTzq3Jo1wsku5q9dAPkrsVrw3ymF+EIgFXQgwZJBcIWsmqv5rN8MGmPwuB9xU8YeS
 Ly64D2YjV9arZn6VeGA==
X-Proofpoint-ORIG-GUID: WUP6X2s5xTYWbhMI0DPDjXylKbliNoGD
X-Proofpoint-GUID: l4wc1giUkXIxWXMdOOL7aCqcP1paRcZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 17:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236610

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Avoid conflict with C++20 std::lerp from <cmath>, which
causes redefinition and ambiguous call errors with newer
toolchains.

Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/piglit/-/commit/ec0fc2fef0755b1595c3799ab25129174a4b2007]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...h-rename-local-lerp-to-linear_interp.patch | 46 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch b/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
new file mode 100644
index 0000000000..05f1dd687a
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
@@ -0,0 +1,46 @@
+From ec0fc2fef0755b1595c3799ab25129174a4b2007 Mon Sep 17 00:00:00 2001
+From: Vinson Lee <vlee@freedesktop.org>
+Date: Sat, 7 Feb 2026 18:39:39 -0800
+Subject: [PATCH] fbo-blit-stretch: rename local lerp to linear_interp
+
+Avoid conflict with C++20 std::lerp from <cmath>, which
+causes redefinition and ambiguous call errors with newer
+toolchains.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/piglit/-/commit/ec0fc2fef0755b1595c3799ab25129174a4b2007]
+
+Signed-off-by: Vinson Lee <vlee@freedesktop.org>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ tests/fbo/fbo-blit-stretch.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/fbo/fbo-blit-stretch.cpp b/tests/fbo/fbo-blit-stretch.cpp
+index a83288c0f..b0d362ecd 100644
+--- a/tests/fbo/fbo-blit-stretch.cpp
++++ b/tests/fbo/fbo-blit-stretch.cpp
+@@ -173,7 +173,7 @@ clamp(GLint &x, GLint xmin, GLint xmax)
+ }
+ 
+ static float
+-lerp(float x0, float x1, float w)
++linear_interp(float x0, float x1, float w)
+ {
+ 	return x0 + (x1 - x0) * w;
+ }
+@@ -181,9 +181,9 @@ lerp(float x0, float x1, float w)
+ static float
+ lerp2d(float xy00, float xy01, float xy10, float xy11, float wx, float wy)
+ {
+-	float y0 = lerp(xy00, xy01, wx);
+-	float y1 = lerp(xy10, xy11, wx);
+-	return lerp(y0, y1, wy);
++	float y0 = linear_interp(xy00, xy01, wx);
++	float y1 = linear_interp(xy10, xy11, wx);
++	return linear_interp(y0, y1, wy);
+ }
+ 
+ static float clearColor[4] = {
+-- 
+2.49.0
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 7659635062..0dd9c58714 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
            file://0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch \
+           file://0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.49.0


