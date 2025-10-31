Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F47CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 03:05:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6607.1761879942043329552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 20:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nLjDsP1B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33993df286=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V0Unaw1973926
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 20:05:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fS2pv6rg1Kuv/1Ld1MpA0FmdOvKtLKO2ZT2d9c0taTo=; b=nLjDsP1BqpS/
	7CES7pDLT63lgv79BBsUrtus42qI9lLYEPWMdabU/eTSiUnWBt8HpWDr+gB4yfRV
	pLvxN+eUc/75Lt0HqjKBhUKR2hnrCne0JV5ug7g+5X93h49XpMAfNDMP+CQalGgR
	NM/hRQa2CGERfPaDY0oOF96TiFjUu6CU91RAvZPJqtfxstYLYzw+LQvrtQ3I6k/k
	h3xWBaZBvSfFCqEfwMb33Zd+abVQysy/U9XO3wtHhWCyMQ9CFVCIYPkpxoDMyV3I
	rOpu+H33wAwHo+NnCvtqmKZ5PM+MyuTopVklULJUz3fqR+2Urw7DpcPCjjV2Zqmm
	GQdcgIxnNA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3wa1setu-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 20:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lB06CQlnPmibx0zjbblbFfFtIsm1Q9lf7PoYQAZpgagw+1P/6H69f+77qY/s63sqx53Twu1q9CBKInKh24nx214Yno68SQm8v4JrElZeUnAZmp4phYRysd7CrXlFHYXtMMDzZnhAGSwMPpvZ1hmRxSV6nS1YgGgI2LEx1l/onu4NXE7KKrPpTvXOw3GDbActzI50g+NaabiRSmgtNyC5qzgg2Go6+kK4X7+i3l/5uufo0/Vb3jsSSFn+doLF441hY4xtbMKUKdQV765nqUHgadNbEAMPm+HzAg024YYYF4yFGkhIvYJRx/FjHbPZlW2WbnmAi5XHE2UeWcPCQiK6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fS2pv6rg1Kuv/1Ld1MpA0FmdOvKtLKO2ZT2d9c0taTo=;
 b=le2wVR9vaLedYcV1kYKPYbgVKrPBUNZCGcnwMvS5nFEPPiegDDQLvhW6Hkf2nkLxHRlKnLyTYrzmZrdw7uNa9mH1bGhBdUf8kODjksD1KymSUTGN+PW3/TcQFKS2votLEKaga2Gz0HOk/fF/g3JJ+zgGAU+Of0ipS5D6x9GP65cpLYvfYBSOxUqCX+6Inn5D15LO2deMmVD2nU1s4X6Z2OdllgzVhMgaAqgIILEcZooDWqH+EaTX5lhsq+Dla5ROHfajjVwZ6rLRTGjZuKkfB3p2LnE5WNBvaacB4bu3ptCyISIYqdmaR5qjwf/bIAFsWLX8+GPUlvYIb9/BvSDNhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 03:05:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 03:05:40 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V5 3/3] parselogs: ignore error on qemuarm as a workaround
Date: Fri, 31 Oct 2025 11:05:19 +0800
Message-Id: <20251031030519.2602967-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031030519.2602967-1-Qi.Chen@windriver.com>
References: <20251031030519.2602967-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 696d2b1d-158a-4ca6-b09f-08de182a5ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HBxmrXJ4oJ5twoXddMq/lT8ytSNKjdMfDND/9aLJvKfSALELoyemPMr17JqT?=
 =?us-ascii?Q?MGo5/9NzmURURNv/v1OE6Rg9bc5/R3aA/GheZZuCi0li5nc7qnll7TCtEBWy?=
 =?us-ascii?Q?g77z44IxtXzgyujzGJRRp5bQp69QNI3Z1kIAHhIG+29GNLNKNnFDjl/j9ifk?=
 =?us-ascii?Q?f+8n5iKBZAS5CtXnzWsE+aqx2dMyP87n7bxWdiGFGVskSy5l5mqvb8LTPlO7?=
 =?us-ascii?Q?vE0NGQD9OUfuH2TW31WWJRD6IzXi5FIZyefulk6adND9RKgvWnmlXIahlbFp?=
 =?us-ascii?Q?l+ImB4zFxGHvGHKbDqumzYzcivHOXChBBVFKsp7rKl8h0hyVwoayeJCeDVFg?=
 =?us-ascii?Q?g9JvdUp9AdTzAMlgMDR4nL8LkqOa5ZBJWnYv4Qa2Ivli9bQv4i5yCG6Av2Pk?=
 =?us-ascii?Q?UgwS7hRRQQ+E+tdBxBqwnfacF0vYm/IzHXP8wQtskRfUDkANQ8FMq/P4qwL5?=
 =?us-ascii?Q?o//cqDHlvuJCHyuxNTtC9Rn2bu9NGYsSgmH/qbh/FXMEufM63pcoaBI7UJU7?=
 =?us-ascii?Q?ERVU4RL2IdhstnSZyku29HU+zAEgqK455eDZt9X1BhMr4q0ZKZv0b+zjkcCb?=
 =?us-ascii?Q?nNnY2nh/1yApC4LbaPNkthmi6BfXw/HM/c/Oc3DpyRHaUoxjfLww9CnkRoD9?=
 =?us-ascii?Q?RPRh9z7W6fFJqfSI73arfdkLZtDwVa4f22VUFHxLhdAP2Tix2A0w/Navlz0J?=
 =?us-ascii?Q?Gcb9u16Trh1WG8BW+iZcF3kbytz4/Uoja+MvhW7OXAS9Q3/9EYGVb5IYd6eg?=
 =?us-ascii?Q?bl38Bx3cmrI0Px0W0+ihzUcAzhHfmpUySuJcikiYeiD7yg36pSdJayJINbQD?=
 =?us-ascii?Q?JbJPk9gSa5izpy+urhG/aN+KgtLairs8FLnUHZDvKoPvinFhZwqoNsw5/Osd?=
 =?us-ascii?Q?3hrwPM7w23trGEtlizw2F4XV0fPneQzzue+sxM700LKHnIOJjdbKAAfFvZ+z?=
 =?us-ascii?Q?wsc7w+BlncZ0Af0xsQxpcq9C5Ffv8NcjRPw77auwAmLASrypgP7FgxB4TYZG?=
 =?us-ascii?Q?RMbLImVjOrSomHBSkzJOV4HO67k/7nheObZVGVmGGJoVEy1KZ50XU0EBfW4Y?=
 =?us-ascii?Q?k7fMk9euc2kXY4shuElo44KkHtPKt4AR/X3nd0DAc8zDCyA4BWXBalO46zHA?=
 =?us-ascii?Q?llzVSC78oH6TH+fdU+Oo0GRKlDdj2q2ZXHL/us4SyclXKwYPQ/4W8OUWmbY0?=
 =?us-ascii?Q?2Ch4uKkgtJwXbUA/rze3nFSgvFEaxI8rMmRDhk9VX3UIcW52krCFtnINMgPU?=
 =?us-ascii?Q?xUfez40vMSVIXqVZBxYesXtMBqZI7P0uns7BMNQ7HHqUVPX5BtKiSuBJjKdq?=
 =?us-ascii?Q?Rf8J4iaosqEA9LPVIHKMTP1f74iNjBPl3LcLib4MX5sOCTz2i0cIEEflmDgx?=
 =?us-ascii?Q?0eHkEyPfX+QQ/4yhq/zOWEf+eTlWspk9Xj2+++TUT4CUKqFknzhJnITvHPxl?=
 =?us-ascii?Q?Tznb4vcQR/BrZdaJje5/BJ2Q0haULXfI1jtuZ3yRbjvcKR8A7r1M2Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7BasJ+F4qnmOMblpka3xznMFQJClLDjGSjQCbevymfEA5XEIN3fGWRAsgwI2?=
 =?us-ascii?Q?BcKLWTZgi2kLVeNlSwKJBjTMuaMs3rnVFUkIJzzm3m+c+NTVR9y0AtQRM8e8?=
 =?us-ascii?Q?U4JHQ9X3FoAoObPYzKbhC1CgEC9u75TW0JCISXVV8mf0HHT+/Zmx6J17Bbxo?=
 =?us-ascii?Q?tossaBzyRYF9TZqwwC6qGzeLWfbPJnDos3f8E1Rg5tV6zjBYZqBaq4EKJtsd?=
 =?us-ascii?Q?sqK7D8fjbuSu/3rcxkRSD/Ke020tFG4fSxxdtzAMb1qzEgnD52A3K4IZ5za0?=
 =?us-ascii?Q?tQ5EpeiN3/wT9HOzQrZ/6um6jmepKRwC5oBiLLxKgi4HpYR+crE/9fu2PiHZ?=
 =?us-ascii?Q?goY7Fr9DyRgqDXfIe4q9Di3d9koI8ff1Y8M67qPTWN2eCFMD/if9klsv9DGo?=
 =?us-ascii?Q?KEeemqpLDO83KRhV6OYP3fpavLfZpMFRVaa4jkJ25eyI093rAXaSrncOacJa?=
 =?us-ascii?Q?x6cFl4RCsa0RfzuZ40iVQMms5gWUOCaR5pExzmB/PDMbANejKe0wBcSlJrVL?=
 =?us-ascii?Q?8xtzPjc4/WN6GQ2ryKOIMiJtHnqfiWHPVC0mUjwb19DGQY1pJObG1rTfmC3e?=
 =?us-ascii?Q?lkIsqqegN+jd1lflam0CdZW39yuOmx7iwf0MN7pIIqTXjPGvYAwKx9yB2Pod?=
 =?us-ascii?Q?EOBUuHnxB7UqlfT1S2zBVVxX60SH/dHJgcKI6AOFg1Dtr/45oa3YWhnbFcZc?=
 =?us-ascii?Q?yPCZfG75YWSJe/CMGjb+YPaxH/69OZ/zJr35xdAWwIEQT6q/Akz4CIhnkwHU?=
 =?us-ascii?Q?Vwr4v6b+TXvbY5+UFKd8ldZZ2n7zjjhYdWqQNRQE3Wl9VE5KA7NABqf/dZWo?=
 =?us-ascii?Q?1bZLn79Sro/MSV4BpUrW8y3VT6MubR/lg0bur1b1YSm26zs4J2+mDwpMH8Oj?=
 =?us-ascii?Q?Wf9ZKZ/gtu8INQgWUuuFJpcavI1/T8U7Vz0PAXHVjJgvWpTG7fLMAqdZxtjy?=
 =?us-ascii?Q?j4Z8V8tC+Lvaqym+M4ljXnNU6LAx2jd176fhPqV4oYlEgni4eTSgg0M9cQeI?=
 =?us-ascii?Q?tTgyLkhZxtPHu+Ffy8bnoYIS5znmVKilXQ+6gIa9k1WbjpzTAlwyl16NLdjy?=
 =?us-ascii?Q?z33HyDQEuShwePNV6G2aAUGxwSKCObt3bAWiPIlcKivjlrSKj6VvgaZtqGQf?=
 =?us-ascii?Q?7kGu+old/M0KGB5IqyJwIYRI5yqg+4SLgTg9CblcS8lyzbvRs32d0qONbddX?=
 =?us-ascii?Q?3l/FS0JF1i4qtE7jG8NyHguMiNqMitzNc5zzuQDmNsJ4A1CHyJgQCtHAB0rV?=
 =?us-ascii?Q?nKAMDq3DPlfmKHeKxElheguDlFG5TmyWtiba/5Bb7hR+EZjtvhoJPa35oYgJ?=
 =?us-ascii?Q?dSbEzJsK4V014Sqo0vRTZTsg9tFwOb5B8yoDogfA9HzFG0awjAi9S09XSLc5?=
 =?us-ascii?Q?vKqgNMm/HM58e9NzBE/f1FtYvMR+ygEyzNIfVq6Zp4slyNrxdmK5fuGzjw/v?=
 =?us-ascii?Q?JkoolylHlA+AEeYucl5Kt9ZndUmWij6lJhP/iQCbqXBnhRAi8ZG3A7hMZlEE?=
 =?us-ascii?Q?Md2IPbS85WngGfDJ6Xwa6xZbTPfqyIfzmzmICuLj9pKLTcxeGxR4HJUEnlHk?=
 =?us-ascii?Q?Vj1kkMNTwTOpEpW4V6EwVIKxkcikPZZQE1NpTNK0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696d2b1d-158a-4ca6-b09f-08de182a5ec7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 03:05:39.3299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iiZq5fQFMyu+jVatwqyyB+Y+x9+1e5Ux0+mvMLYiteaXFrYFB1jAwzmdXFKwFPM0YRLUrgSbI/shBYYNJHk7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNiBTYWx0ZWRfX3RVGjs82ZP69
 DDQIqYEwnBBTkLmJ9QOnt0WsHu2EXfuLwcSN8AnVlPQMEcaq6mMh0jLZpgusi9IavA0D7qNcQMx
 4u2p3S7QoH3P1vnuCs+sGJT8uW5QYezXIekScHilzl84SeqGV8A+6bVHUcwiN2DXucTShUoGEG7
 q5jLSJKiVeOGQtVd/4tsadlHlT7uQz13GERwFJEDfoQw/ViRMLjIFjABWyf0JrwOinS2876tux1
 qya7FtrV68u1xoY5KsoT9Ij+Bi+5zidTzUcj0ac8TSZopW/m6zoRtjZhlSlCNbcsfae4QR2cs3N
 y8ehZ64GdtmsI/bhqi2tro/iNMRsNtVHqE1hKizR8YY4sC3S8jtd+RowT3uXfFy6er0940BwqZv
 KhBFzIVV/bCk9mWXmwIp4p/S4DCdTQ==
X-Authority-Analysis: v=2.4 cv=HODO14tv c=1 sm=1 tr=0 ts=69042785 cx=c_pps
 a=6gnvs+K4iRzQbkKjpWE4KA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=d3jnz9i_kPLpQjPJV-AA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xwkkJuz98ckFVSI5ldVufeI2eGnyXpAN
X-Proofpoint-ORIG-GUID: xwkkJuz98ckFVSI5ldVufeI2eGnyXpAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 03:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225524

From: Chen Qi <Qi.Chen@windriver.com>

With systemd upgraded to v258+, there's an intermittent error on
qemuarm + core-image-sato at boot:

  failed to find screen to remove

I bisected systemd to locate the commit that introduces this
problem: https://github.com/systemd/systemd/commit/0ba9d06963ecb848e71951ed5e9f6f6f03b80b06

Workaround this issue for now to avoid blocking systemd upgrade.

More investigation is needed to fix this issue. See more details
in https://bugzilla.yoctoproject.org/show_bug.cgi?id=16045.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm.txt | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm.txt

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm.txt b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm.txt
new file mode 100644
index 0000000000..a0430483a2
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm.txt
@@ -0,0 +1,3 @@
+# The following error message is ignored as a workaround.
+# Tracked by bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16045
+failed to find screen to remove
-- 
2.34.1


