Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA271C44522
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:19:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12144.1784290754449352336
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IXi8BSA5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1658a50258=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCJELh998128
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:19:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=eoxnxSg8MuDdzpQJZiR+yFWJ5SbGM760uLk86SCxd3E=; b=
	IXi8BSA5qjJ+7Hcg0tmGQFcETPz3QiVGXr7TgP45EXtyOjgYmj31/pwEJQupI284
	8zc9oicclxfXylidM9bIRx8FIkGZb21aQczxdD49z5rXdECRauUw/6U9wTG/P2hv
	s/r801CvD4MlfQbRaeqgOYb4Dq+medooUIM4jcfWDuESlN3Ju9bnLq2J+uWLbl5H
	Pj6tlk/t7BJRwLsxrLR2nPCYnkUu9NSW2yKBFt9SjoJwD5bPjNEYEFVuLK8Ig+HR
	7hwzlXffFMOl3eOzprAwweG7xKSZKx8VCQMRHxdMJOK/1U8PjlzWXhIdPY37QVX7
	9KzjmV69a+AQu2ZLZEDfKw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012049.outbound.protection.outlook.com [52.101.43.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbnbdsuhg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJfq/jk0cJXalJ+6SQTTsslFT9j3hZrUTZ73rvhK2PM9t5o9hs+SuknywFFiQ5xoYg2gAYoG7UQpAYN2VkaolIWlXpxRb9Ah4lOKUuDbX9b7A2UTcUoNlUo8dSrZQ/GeFTOMzAMoWwGF/qvvZ1QKG0tyhWZFs0PTzntDwmxsjDoRGU6XM48wDaad2L/wESxplrBZlGjFjFkzeZk221NjttgO5xS694eqE9LoUXUc8/Jzk8eQk6J8q61f0orLkHb8Sqh2gF+ByGqeVxJLysLnhCXreOo8uBg8LaQDaTO00qQbx6ugWgK/0DxKxQgNMOwnnJXIr+XQVUyBIWgnAyw9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoxnxSg8MuDdzpQJZiR+yFWJ5SbGM760uLk86SCxd3E=;
 b=VWSxD7haMGBkvFqSFMqh8AvsmVR8S6/a4NWvZo5ltgqOfdSXnoDnhCXyaJ2syhB/Qwnv1WNF9rbvdQ7kn3hXdII6sxevfargwMUEnpALgX2Hj86LwMKwDAMEfGPI+ELaduM/bTS75i26pwXbZZ1pS/WPJacO1/FOPwAMy1N6bkr0I3UkYvjpO/WVsEH8jRefJeQWC6t/BaA4YTTDJ779wsHzJm2m2Wu571rM+gTOI7P/A7Z9Vy3i2LCPkpoOL/VRALiPMPDz73EJCYSM7hjTib/xBAPsb3m83/YTzWEUxL/GFd9F5ZkaLhB7mZsfGxNHMx0NKr1B3XxgAHLFceWVAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 12:19:11 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 12:19:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 3/4] packagegroups: add nativesdk-packagegroup-sdk-clang
Date: Fri, 17 Jul 2026 05:18:48 -0700
Message-ID: <20260717121849.2163115-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717121849.2163115-1-Harish.Sadineni@windriver.com>
References: <20260717121849.2163115-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0438.namprd03.prod.outlook.com
 (2603:10b6:408:113::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ebf7e0-8a30-491d-93c7-08dee3fd9be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	fw6rUcAwJP9Zh+YO8sUU7GeIeOTMuphdyWJlymtBiqs6U2bTEIIO7s5r2D9ONOTYQEowHg6GzZVTtW6DV7+FkBPO7RdetE7aa3nDmDwCoqE4qgowlboJyxscd/SnYLXmSG6qPEpwXtM9ALiz9hBFXRXIQKDASrcMQNh4YFpt8Rhmwu0o0vqUmWlarMjCh9e4fmqJgI54+AQXHjp0MDmG99g1WyUxo7ogYYeLlvyc4nZD/eOPDx3y72n4rtoBZZ6pSFGKK/2ZZ6HLvAmbZqVGbpl0zkUFVkHFfPSjbDe9S4O0kUf55xUtA48uCe/8UkPRCb4zR3A8rHAdUFiOqeDOIGseHQi2H71VusinEWBIGV9itdiG9ZhEOhjZjeSwnz8BWqYavaoTB2Ag3wajO8kXYXm/9clUZ7GYrKm/Plx3GkgGmXJPMGKL9srau0+fd91BHinS3pAizmZPgbdQyz8OrjVOOBnAHH4enm5k11lP31JsXHplwtH2lzOMvh+P6MzNYjaxotSVvv0A0qLghyA+K1/X8n7sub89ZVLGQGgcThyZx1oyEwXDJQH/aDplgPUxriTWyy/+lNLiO6RkwWVFYIl0gRfO6V2ptF752FsfPxuz4BjaTfnaOmNFcefiB70WBfwLJ4aFj0UFVrVyM4qQFf8Qd6FMIY8vv2B8p925QWkKohD48BST8C5MOT4qD8IsulMtjhBFJU9GMmsdmxDF6+H9AyDy2yFx11fdrP2dIGI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DAVS/ZkJ/B+JowtwbRfYxJU/CgpSKEr/VVM2yaLln/TSx2TmvXvaPEgbRm/a?=
 =?us-ascii?Q?AapXzEika6KOWh2YL5C/1T+CazVCdCuXqmJhitdlA28kIANgd3MPJQvB0y+Z?=
 =?us-ascii?Q?5Oflbo+DAOzeY1rmQtBap+bxqdZwSBny+p8TX3+IsCsC9hLXoK/6+1NZPZlU?=
 =?us-ascii?Q?kCfjoesXGrfV4JrTmZzg/4zzwuxuMBJBTtuhl44E3aThUyPzJwTrSe/R3umN?=
 =?us-ascii?Q?KM2a0+9EOjn493NQQXj8Kp5E1djrM7dsxJZqgR1FZvSGxwCbgsZiyx7D8gZo?=
 =?us-ascii?Q?HnmW8GpmIcdULiAsUbHROTT3FSHurcOoY8hzIlWVafffzhDvwlSfzfAMXuf6?=
 =?us-ascii?Q?KjUu5HXcWbyxIfLM8qYpraaL/dZRnHCGkRLCrR01dNl9wTNwTJNScOZvFIwI?=
 =?us-ascii?Q?v73hVa8IrKa7sCWKtu/PjB/7FhQPTymaQiksDyqCmZ2lROCq9PgHal41a5Fu?=
 =?us-ascii?Q?c+qTF7utHKJDRJi+7rRd4U4ya8TExmTGM0rkBPM/Z4WpLEhu1vore7l1sEQt?=
 =?us-ascii?Q?KdEzhrxK5ehWfQtIQSJ+xPV/T3xNVVn/AZrScqkBGqcsHWVX2lzMZL5AuX4V?=
 =?us-ascii?Q?IxCLtG+vMGQ+jqsoRwrq34knCBfbszG5/gPTji+u3A7KXxFk5iMXkBBrJXCD?=
 =?us-ascii?Q?vBjg6ZmjO/eC3xYXzJzZ3gNyof87AtWlog3U69H1wrDJitQIt7rPNq/wGWSq?=
 =?us-ascii?Q?SIjcL/uZVfIaJT6G+MhKt8mx65QVjpB4jUHeP5UDBMmHZFpbFaClZ2Ywu+yz?=
 =?us-ascii?Q?JX/95nRq0n35a5kajEhWFJAfTmO2O/kx376MK+CYhwOlVlT8jB040tyR2lIe?=
 =?us-ascii?Q?RpvE9gKZkrbZZM7cCtsERR7lQa7bjq/p8tNrMOOSA0YNdgjNYr9I0GlEOSXU?=
 =?us-ascii?Q?Q85Y9PccZ4lZSFt87KzhUvPNN7pbQsnZYGlccArddLQG/33kFZmolJHbM5wH?=
 =?us-ascii?Q?xPDrKHaLzk0Fh2obEKJlNXc7THuTyNcUv4169O1MCxWndVbJB5w742XK21Jl?=
 =?us-ascii?Q?JujmknUazWW6XIOjfvfOI/DBX57eiNeZk0Guxtby5kFu0zKrEh77N80dM0AD?=
 =?us-ascii?Q?akIr/45LDpkXkfCJox/7mo0aFGDwWS5lRG7aKcayOQmq+l4DZOTXlkaNpNWT?=
 =?us-ascii?Q?0Bu2NtuUhzlzq9fP04bsAJGYZsRZ9NeqdHdIcU5Ff70UpgI/p/g1quvs2Aoz?=
 =?us-ascii?Q?2F6RNotiPf263Ja9mlKeionOghUM3NIRbQ1mY8/CJWM2+7TWRo/MsglyIl2e?=
 =?us-ascii?Q?ejYfeHcP+9cQQ+ofkId3o9GcJQbAPK7nf5zzcB27xBWeS2R8HfDoNL08dHH0?=
 =?us-ascii?Q?RLms+QQco0o62pj+73I61kcLg2nBblkQX6nT7S2o7onaPqpR3ptKi8uG5Gra?=
 =?us-ascii?Q?YVbfJwwCqNARQa4hgw5fyfs1HlrbHmM+WDtv6Vn4q56zIOdc8wFOPflcEeBf?=
 =?us-ascii?Q?Zi+mas8JzLMACAWYs6h0/kewe71ZNSqiWPflNBC74Gtbp5HKtcluFtfcbF4C?=
 =?us-ascii?Q?Oy9A4T5rws7X5N7Q/S+QNA5VtRmi2o9oPz3Uh4dn97yD0WC2l3/kwboA3ygK?=
 =?us-ascii?Q?ql9D0rZ7Dxa88W3N0PYb6NdG6u6vZC/T0KtCH61cFAz8El5inLs1AP0TPaBm?=
 =?us-ascii?Q?1E6nteysjsmQ3d9j/Dxv6oQz00Ge7T5/x1mMMARkdynxf00MBeugBRuPdyB0?=
 =?us-ascii?Q?czwuoIfORFC09XRsK0BL1bBwtYbkRrASQY8uUTuLwskuyZ4yVRJHZK17V8F+?=
 =?us-ascii?Q?fnmUYYBxyyp7bSGSGmUib1tL8gYRzUU=3D?=
X-Exchange-RoutingPolicyChecked: 
	VlihbHX5yGshA7q/DdyiLnoywktyw/R7ka/lLS7xiTkcy0BpksEdqq7FK1D37uf3K4gt8KsrBSwiw1HqKn4k7telbMk6NRyKZqWsJlf4cQ89vLpMqjY+IPj88vQzTGMzdDGSpe6pOAOHQDe49FVR6vtCtoBk9LgCBEHuFjIvNjhjKxS8Z3KbiWyS8OqO4FG9B09WvzoQfS8YbItHuK9JM63FO4rr1YaeN7pcvRW6WtOwiuYra3ON94btXHN/xoM2BXhGckiIw2rbBDI+GJ/TdAAIfpEz2kzEtkkGt3iLlUGBsECkaSa5IHQ0iJ0im1JwXjGtHmyVfk9CiMgqoSb27w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ebf7e0-8a30-491d-93c7-08dee3fd9be6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:19:11.6725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2o6k13L63rmNSjEXRB97pXLAP1fRPSvg4zrEM5x9P9yJ/3rOKaOuZAss5M3O5LNUeG90fItZZVk6GcT8gZ5J3G/EgJvZhLdc4TNheEmzsI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyNSBTYWx0ZWRfX/sXoQR+Xi6Qe
 hhbvgVyMUQ2p/wawT1mNcFNlPeDrEaEJmOyvTRyDo3MdaScBAHzEDFjvPvPicpMLLdj7+IPqBFB
 cUEONwZZCuMvKiyNDghNPix8XEa+WYV6eD3yZgBUFnXbvsJuA5GnAQPBto5FequpKDYscU5Vahv
 HomAYYP8L8cw15TedHu1SVIoMPuJKswXj3cdThAkkY26p19HjpLIXRxsoo8cGLQUS2xUwxFLlfh
 KlElbRV+fC9Da9H/Sl3fHW11d2QeMBZpPFkrmsZ9YDGAm3O5hnXn2xkkQYTqXrvElGAqT5z+ur3
 gfJiFKAeHIIfJG13ajLz/AaaWnzU+W5QyNMCLrerA0ytSWitXRs6OYXVf6xmzQW84LCCSpUHn9N
 EqcKJnDxI9T2e3tVqQjjBhzbJ0fQNpHITT9WqHvwCDGgQ7lpblEZ0E4Q/8Hm9hG+XtqrSUBR3W8
 iaIj2HXSQA44LYzj7Tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyNSBTYWx0ZWRfX7x1qpTzvbCFW
 hWkIV+6xVbMHxXAN79Tsp+APZnkVlhfvB2SQ5ag6IUu5XExlWQj3ubPBJlNK3KYlXhuO5VWBEFi
 W4tHwrCfAbShjzaVlrhUFB+wixFN2Oe7B0aQer3td3HiMRagL+GZ
X-Authority-Analysis: v=2.4 cv=VI/tWdPX c=1 sm=1 tr=0 ts=6a5a1dc1 cx=c_pps
 a=cGw96uMdUXN41aDBKcSctA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=MtlQTh2GuE9gw5VxKJ8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ro2LIUBqPxhT-_M7ODILKNHU8gFHv2Zh
X-Proofpoint-GUID: Ro2LIUBqPxhT-_M7ODILKNHU8gFHv2Zh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241166

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add a new nativesdk packagegroup providing the clang, lld, and
llvm-bin dependencies needed to build external/out-of-tree
modules in the SDK using the LLVM/Clang toolchain.

Rust support in the kernel on riscv64 requires the LLVM/Clang
toolchain rather than gcc, so this packagegroup is intended to
be added alongside nativesdk-packagegroup-sdk-rust when the SDK
targets riscv64.

Add this to TOOLCHAIN_HOST_TASK to include it in the SDK.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../nativesdk-packagegroup-sdk-host-clang.bb       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb
new file mode 100644
index 0000000000..d6ee2120cf
--- /dev/null
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb
@@ -0,0 +1,14 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "Dependent packages for building external kernel modules using clang"
+
+inherit packagegroup
+inherit_defer nativesdk
+
+RDEPENDS:${PN} = "\
+    nativesdk-clang \
+    nativesdk-lld \
+    nativesdk-llvm-bin \
+"
-- 
2.51.0


