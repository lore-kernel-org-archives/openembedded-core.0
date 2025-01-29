Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D712DC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 08:25:44 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.76])
 by mx.groups.io with SMTP id smtpd.web11.7818.1738135942671638314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 23:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vimar.com header.s=selector1 header.b=Z07NfC5n;
 spf=pass (domain: vimar.com, ip: 52.101.69.76, mailfrom: alessio.cascone@vimar.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geRmoR2cgZEV+Nq3h1R0nT/vj0kz6psbv7fV7tG/AXmqXQA//7qajINdQKucsa+tnQfIR4GHasIP3Q1jWLOkMr54e2BjJasMo6lbm+0wy7kINFK9jiC3bEdbtxps+D4yzj1Zg1RuGYJrFfNGVK3YxgK6oj9cmvrc3jSlzVAwJuuKk1PU1wT8rIp037D6G41QAeQWdWT4oPz5c0SyrHbsFmkfQOYEbgC6SqHzBYe9dmagSMVxHYl/4C9rhPLPhR/eYneuAELsBSj+EnYOurcF5TupfWm9aWleihLwZ0sWK4gZX0kQ5ZRdrwTdMPUST2z16kxTB+T6p6S1lorwiVz12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T20FpgVt9xlUg2o6RL6Y4zKotz3vuklCGwUewA1EagA=;
 b=v1YYPUqhjcLccuEo/CPaOu5Zkx9u7ElCiDbZUoUre3Q9OVOc5/arjUmc8Zn7WJC6mxU/zYxzNe7jFnBR/j311U56Hqv0WbW+eVbuJPaBouaCPRez/h8J9Fnon5rhIX5Is2iFIGsBROZikMeWn8bes32sHLzb7IMsosLYBoGmp6BagB+4NfgkrSImVCQlEEuERszWVT/oBrG3gER5F4JoMis4EnOoNTpoWfzxdw3GZDKaSqQxGVocWl+ACfBDbo1iyeL8+8jKujiXf3lpqSirl4KaiCytZEXE806k5kcSkvjxEndXwiUBsLNKUOJOG2vd9rDjq/2+eTUhYMEBq45cBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vimar.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T20FpgVt9xlUg2o6RL6Y4zKotz3vuklCGwUewA1EagA=;
 b=Z07NfC5nsJa8PIG2Pnyd9SU1+NWAOcDDrSeXFJwhRbavSAYbSax+iK4QAqYx0Y6gFdxKAzJ/bRm0q7CaDgzOTIM6XdQNX4d+alISFMnuq3b5Xb1l+h1jhz7js4aacOc0rOLxab7E3DmDOWneD3QeMqPFlE4mCs+OxcBgOTGcO8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Received: from GV1PR08MB8305.eurprd08.prod.outlook.com (2603:10a6:150:a2::16)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 07:32:18 +0000
Received: from GV1PR08MB8305.eurprd08.prod.outlook.com
 ([fe80::41ad:bb80:2674:d25c]) by GV1PR08MB8305.eurprd08.prod.outlook.com
 ([fe80::41ad:bb80:2674:d25c%3]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 07:32:18 +0000
From: Alessio Cascone <alessio.cascone@vimar.com>
To: openembedded-core@lists.openembedded.org
CC: Alessio Cascone <alessio.cascone@vimar.com>
Subject: [PATCH] tzcode-native: Fix compiler setting from 2023d version
Date: Wed, 29 Jan 2025 08:31:29 +0100
Message-ID: <20250129073129.8734-1-alessio.cascone@vimar.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZR2P278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::11) To GV1PR08MB8305.eurprd08.prod.outlook.com
 (2603:10a6:150:a2::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8305:EE_|PA4PR08MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: c836faac-5d65-4ec9-255a-08dd40370f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9TG4C4xG10SdCuiq0fYZ9y4HOvM/cZEsXZ++ZfKpg5VlF2KbQAPP4ZUQMzHS?=
 =?us-ascii?Q?E498E6dlpeu+hLG3VI+ZuM9Yep6um8T+nyzI6cAg44NUAzhhbjKsshgfF60E?=
 =?us-ascii?Q?JHZ4Y13lSdHVCP8IHh6zSebLsBGjC+BDzPQWCmwYuE+eH3ZVyRB3ZGZiuiC3?=
 =?us-ascii?Q?rQG58bvZbSSQuREiU2iCrCb50ypmEo/38AOtNNrStt2i7tKqXJNtRb1eU5eT?=
 =?us-ascii?Q?fqEWev6j60xHqnPcr2okYgzMjg6A5xrz/ackH+pp6e2bQBx/zMmapilKku7a?=
 =?us-ascii?Q?5EZnxrNZLHyPflbNwYBm8u3t1uG15pubfreySk/sh+dzDRMjjzUryWQDIS4Y?=
 =?us-ascii?Q?A2gmFS8s3KWLvBCTNWd0QCqyeA+V3Ij81j/XscjFI1bYGbQ67vIB+Kw2EI/c?=
 =?us-ascii?Q?t06zK4Jx6eEe4EqHGaFIQKuyFGXYZ1P9s6gn8Tb/9b+Z0bLh4vTNzWIh1/Wr?=
 =?us-ascii?Q?PIaZi7azgRFCvsJcyJLw8/xR17EsRC+HfJI8xpFONNv/9JjVbLfyGZHh8TBH?=
 =?us-ascii?Q?suAwl/ntWUQdLnjiFzE9L2bOnQk+bEhfFujJ3dibmidPjoIIgB/s8ysXVcRe?=
 =?us-ascii?Q?/YOTVLSl0eFjfpOeKfsNeffcgP5nerCmsETZXedV6bM0Tkrf4Lnz1k2WhuF4?=
 =?us-ascii?Q?a1+VA9ydbtiefnrFrhVTwbxm0fon+N4QTscWUgDCKsXjy4gIdsV5Nh+PUVHt?=
 =?us-ascii?Q?/3tkict2iDtACQeZQzM6GK7Scz4TCOlbmPkmklBoZvO9ty91KL1teWs7pkFq?=
 =?us-ascii?Q?LDAvd0pch+zX7WhgIDHzwkM1RROF+CvUW6eFZ8bwNicCdoGe32vxVD5Mej7X?=
 =?us-ascii?Q?UHZg8UISjhAJ14SET0SY1Mu89dfzZg2CNZ4KCAPuvXUIKLgogi6mLsCj/KJO?=
 =?us-ascii?Q?gWIvRDev8VmDhCrgGkauXiReI+NTPtb0QyFUGPorjAyOQoiblzibLZZe4XYi?=
 =?us-ascii?Q?uHcTf3u+eYY/YBH32vOTnz+Yyk4fyUNwrxI/B+zkBXWnFWfQ/642ScGGeJg5?=
 =?us-ascii?Q?e7PFSMCNjN1Ntkg6bkQc3vh44ptQHt22vz9Tz0/L1BEExSAKB/ZJVVIAa9p4?=
 =?us-ascii?Q?k5+ItkH1nLZEQWw4i5a3h+o3D1sBy77FIzzA2809hNYIDFHt0zwMpPFJtTYK?=
 =?us-ascii?Q?kAL0iyjCeq1p2NAnVWjcb20bXeL6uBW0d9ehpd8680wUjdUXZYvTStE4fFfB?=
 =?us-ascii?Q?ajrksczKsKQX67kI2z2qrN2J1eAiW3UlxNWhjcGcfoELAdKUQErUmxZqZn9D?=
 =?us-ascii?Q?YobQ7uN5/WoCNcRDkTUo78eXfrepU6wZy4b5PKwZw1VH+/4vPIlc6681NVlJ?=
 =?us-ascii?Q?lD8pZuDYvUdCx54s0vt4HUPOuu4cDK4yS64vAdzdpCVUK0OHYiGj7z41qSWs?=
 =?us-ascii?Q?7twzNLyC+uiB7GC8IT1g7o4EzHt0H9YjKgU7RQBUljsyg9f9+gbBj7nFZHOb?=
 =?us-ascii?Q?t2Kb3LebgOzO15cCzoavY8A4kkVhJXuA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8305.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eJthAF8+P6lNgKNZsYs1y5qEmIoyZC9hQLVtSqgS+C0DcRgW6IaLkCqX4d3f?=
 =?us-ascii?Q?5K6/dM0dxWeGzc6txz/F0+LuQuNAbcxxeolZvgC6blK5sxvdZCJPfylalglF?=
 =?us-ascii?Q?LVv5tUzYGCr5y//odAGD5oktcCNf35xL5/O8u6v0gQ8m/H7h4GPqhLh70U1Q?=
 =?us-ascii?Q?KMpqWDdvGpLSu2DqGKPsz5MbPy7y2MVph21BxhQ0jQLXXbiqJ55dYVXlBez6?=
 =?us-ascii?Q?RcTCTiHME7HB7kq//547k7Di/bg2OGMv+aOSeZKBz0Eczw8h8XoE0K1Jz3Nr?=
 =?us-ascii?Q?cB8GRvX8V3kcckOXR5Zrom/21NEpoDobIyTdboWyEyzaYGxaUVNp8D8IPWd5?=
 =?us-ascii?Q?YlUDo2rb8kjh3zBhgpsm033brJeLEpIcegRVbD01kVWIBLaguR8u1SHDWTho?=
 =?us-ascii?Q?mrtgsuLdEKjGmWzihAC+XX1SWhmTF9dXwvMX+5opgeazRSwsesT2OBuZhNZP?=
 =?us-ascii?Q?WFKqqtdi9kEbnumiZ8Nfn2q1rcNTLCixH4QdU1DqF9M83nic/K3+CpOJMhXM?=
 =?us-ascii?Q?lVC1OLlhD0F4VKIwWHwUn5AWabd5Ls9UpQ/CjvsgFS8XOXpqNrPOhWI6bNcP?=
 =?us-ascii?Q?6uu18vuEaamyMdd32m1f37WwP0qwlbuWP10AsYF19zxdt1uOHqJ86gokZ0qt?=
 =?us-ascii?Q?mnwWk+s3HrN5aBa+cnB1VZXGYRtTYxJ8booxzIiqX4Ao/jFwx9G7MdwW7Rhf?=
 =?us-ascii?Q?Et8HfcWN1945R0PlhjVuwQ+mnm+aDZ0gef9Jm9V46t61y9z7nqG1Zzl6J6Uk?=
 =?us-ascii?Q?UOYiRL1IYom93JjjQ36UH4u5kRgvC2is9Ru+/qdohQ2RroDMDDMHvQYqb3oa?=
 =?us-ascii?Q?la8SJTErvU4Hxj60HX51TbiVu6Fvtg5srrf1Na4sFYfwfac6yXgKEQrrci4o?=
 =?us-ascii?Q?htXaeWzBMZM1peiU+9QUkRmE2sVp1gV1SV/VVed8AKkOx6+KBz3q5QAjrkzI?=
 =?us-ascii?Q?phN37sCGTyQyEzcLMn+BEg8iznyWMjcOsikiAOeBzxfsoyz+BEf+8BWNblk5?=
 =?us-ascii?Q?/oDIeQW90tweYrbWu0O28blrm3cadz1cGNcjbjSm+wTWly5J8oPZnMTxebb+?=
 =?us-ascii?Q?VMAmPWESog5yfkG5tHW1IkHIaipOcuIgSkb0wM5ly03USFv4GM1UMIgAKTEH?=
 =?us-ascii?Q?TZ0jfPxNbRlUGzNIxgDAm6oLhqNz53zYghOktVhC9UyBS/RDOG4HGvmlDC4G?=
 =?us-ascii?Q?puZvd6N1YpzNE8HSsdx8jcUUDiu6vnlFK3mJ985Vr2KNK8q/1qqe8xHZf8EA?=
 =?us-ascii?Q?EAdVLVOy5OGspUKaaH4D32tF6hxgZ0A5aBrpUVGkoGEajHzf7bs3IBaDFuIb?=
 =?us-ascii?Q?jB+RaGpRqO2jzNhnoApr/6px/yZR4GiKyWgnMzJ5UjVGgEjHaRSASE/Sl8v2?=
 =?us-ascii?Q?ye6OnXsi/VHJVa1WPC5ztf4oDVkjmj5BaEXuozrY7g0Zt8OFvWJKCLVRUlwh?=
 =?us-ascii?Q?wqaMsUICcpnqM8TxY9b79qOBzgUfcCu9QaSZ9uDUtEUL0xCSZvm3dJ5Qq29d?=
 =?us-ascii?Q?kRb4sZtTEGZtuk+yKjikGBaF+8RtJCkwPXJYb5zYVCLakN1tepN0fp4lvDCX?=
 =?us-ascii?Q?GZfEfaya6wA/fA/iOCI3lXinDEvW+7nckQ5SdYduEwXK+QMBffyxVDFS+tVX?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c836faac-5d65-4ec9-255a-08dd40370f1e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8305.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 07:32:17.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dg9KtF5mftAWq8gCnYeEa11VpiRf8CCGkBKuBOxv2lqN3XkAe68D+H9QeiG9E4J9ITH+rPNuwsxlrTEFOz4QVrDNGFr8gZYNSqTXLN0wuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210350

Starting from 2023d version, tzcode makefile does not use anymore "cc"
variable for C compiler, due to Makefile refactoring.
Replacing "cc" with "CC" fixes the issue.

Signed-off-by: Alessio Cascone <alessio.cascone@vimar.com>
---
 meta/recipes-extended/timezone/tzcode-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes=
-extended/timezone/tzcode-native.bb
index d0b23a9d80..dc9f076377 100644
--- a/meta/recipes-extended/timezone/tzcode-native.bb
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -4,7 +4,7 @@ SUMMARY =3D "tzcode, timezone zoneinfo utils -- zic, zdump,=
 tzselect"
=20
 inherit native
=20
-EXTRA_OEMAKE +=3D "cc=3D'${CC}'"
+EXTRA_OEMAKE +=3D "CC=3D'${CC}'"
=20
 do_install () {
         install -d ${D}${bindir}/
--=20
2.25.1


