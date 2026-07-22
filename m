Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611C4C4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:08:53 +0000 (UTC)
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com [205.220.173.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9029.1784750926692846572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=Dy5ZLHfq;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=V+7oYN6p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.173.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MK2es0351555
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:08:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	BWWsER/kwfPrEcsGmnNyqFw6OymwiyPT60cmW0uoOMc=; b=Dy5ZLHfqfkNFWy8R
	hrBaMcetrzntmO9qfUTP7rojidicmtV8mIThi4CLImi/8O07zjuvGIS80PwHBQVJ
	yItrNUFXUgepgqFX+2QQySygxoUsSEdZ7Yysm1ijLZpdJ/vC/EfiXqA8bruAAb7R
	+HpMWOaA/ZmMluXeWa96Mpgqx+LWl/x6+fDCb6R5BxygcDIlEhkcBXwOBVIj5U1F
	EbimviA+8k12vjT7S2NE/X2wsMU/kKXOz7/YTI1CeAKYJRJyBWuktSiXXcODWJ12
	kbc32UmcWg6UEzeZIf6pxA2/wjP2p9aPgxP4FBxQqdTyRB32HRHJ5rUFasZKwq7R
	0zmplg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010044.outbound.protection.outlook.com [52.101.193.44])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4fk4j2g0s1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPLmmWQQvSh0OStLdBcG58mJq53M5uGOwUQlK6u0kbk62GoLjw0tqVbac2x8Iz8wVyljd+GgNeX+38Hpzkmmsg6EjDNCYfmYYQXdE4vqJLKKVhgt/J7TeCeXLHvgAo788aRf+0YpKrtG5GvRq14wVa8JWSs51DSVlXonJp34AO9o3whU4CrKjdwHWeqQp17z9M6sVwJlbrTz1TT1ZKBFbMBatPz8XkYa+zpewqxEVITANQlBidFMwXupSybuvrIi0zEaeffnh0nOzjueFWRgZwA+9WSrbbeaPuOC9GfgrRMG7ACaJzJotxGgAV9zFUMHYmoPCwq37SUXr4waJSY56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWWsER/kwfPrEcsGmnNyqFw6OymwiyPT60cmW0uoOMc=;
 b=qCX3IGzMt9czddwOPY0vJ9nhiuE72lwRjMSgJwF1viTJu//ayPJacVsQw98JL6x9LLpMgHHQ3ljurjjyK3/jGEDz6dqXx+VzoAK6kC58vx/9MJjfhhxcOkUXT92o2WHy6RLIk9Ak0S0Dd7fVc6jXwzsQnKXL9f3+TtO3T+v7whkWIcMz72zI0/9+gqdp8zkBiY6ULoSIn23BGYveUDViNPwFJZvo61AI69OrBfnm4zjjcmpZ1ybRkoaNkTod1dV6GC4MzgL5+wY4JjdJVTnmoGW7GJOPwsqYohBgJENz+dfhKzuRTiWyqEUGyavmmrNQAOdgx29Xew5KgCV2gncspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWWsER/kwfPrEcsGmnNyqFw6OymwiyPT60cmW0uoOMc=;
 b=V+7oYN6psyNWntBceb4evIbXlFFgxcDuVSrJ+Q2zTlG3nIpcCO4LYEMLGf1wbQ0jD4rzs9OiNeOnexkjSfP8bigj6gTM8K+L9xDqZF3LLxZMXDbp/4Ji5unMWU8YESXqQnLTVYPsIvGminJpLzq3x0U39KvxlMuWeXueAq6/b0Q=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by MN2PR17MB4094.namprd17.prod.outlook.com (2603:10b6:208:200::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 20:08:41 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 20:08:41 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v4 3/3] go-vendor.bbclass: Run vendor_unlink task under fakeroot
Date: Wed, 22 Jul 2026 14:08:29 -0600
Message-ID: <20260722200830.2917254-4-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722200830.2917254-1-john.ripple@keysight.com>
References: <20260722200830.2917254-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0224.namprd15.prod.outlook.com
 (2603:10b6:930:88::19) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|MN2PR17MB4094:EE_
X-MS-Office365-Filtering-Correlation-Id: 55fd8e54-780a-40b2-60e8-08dee82d0603
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|10067099003|56012099006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	d2Vh2Xc88FVLeOwEDI8aV9+67EMEUXjCW3oltlZdNrKVtnoQgpU9xLJGj9mrTmAfSf1OtVNgyGU7X1ZCfMBfmIL6MaTmlt/+7Z+Ht7uX7MuBO4hyQL/3w1tZDATjqkwyOF8W3XDk9QA5AnY1lWvv2Xj3GgeKkLL3lJOvphNlvL7UqGlKBr7ahPdHKXHjl4XBfhv2BvWpHuhRsrvdvivooiBb8/xkXbLbBltZnqe1/2Ahx3va/3i3ppRdOOjsi3bDxUWA7LBxKnjl8hsmDsRKG+N8Diyzk5rXO20zcxP1/ygDFvG1epMFpAPxhQ6kuUjFlg0U47Wdl3RqabacFc957n2wtfA/0L+OFmsj0U+6wrDgewHXT4FbnpiLWH7lGSl1nEtqSFZ/jiRNLM+celsGCg3W4WJWmtQKIxoz1OVJYJBmbZV0QeuOXstv49HM9YbvLtPCdBlVDom2eFRtFOWyBarvIcH8HiF27xq6Nfmgmbz6HLWyFcPgPRAi0+R/pZLDGC5zjj/6JAhjkGhl50fKwnX+GacQ6kRrPivwbDJDuDCqDtSTZIITFxxD/8Kh8E0d2w4ke+rrFvuWeeJy5DwKHFqsQKCD0VZXW3TKMHYTQz0/td3tENYWKk+CBoShwfoSiUzfZF3DjuFkLAqp7diqII3jOkYahFhExZq0Yu6LUG0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(10067099003)(56012099006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MNiJqdct6O7peeFnqVYmOCRQftbpYQIE0PPZ8qAhLwySmB/UIcZkvP32hiGT?=
 =?us-ascii?Q?/8I3jmJJST9aCAUoFIFHrWVu/xQBAjujCJbbq9E9B6FNcJ6cMPQlqDvLntxv?=
 =?us-ascii?Q?HUzSh/pFXpcbDo0vpglh46/NhEC7PS4w3EQMRjCdqqd7SbERoVhoGBq5wWN3?=
 =?us-ascii?Q?8JjfUHeSAiPZU8adpA0rAZ5B+9uzGw1Fwu0kAmalwNWoynlrih6kdXheKymy?=
 =?us-ascii?Q?36HkDvR46ZDyW3BAAKOt0XecgFifOEb4WRwYL3Yeb/nfbI8BDrSo3L5RhypA?=
 =?us-ascii?Q?64XPneMlROzNAnICmBA9vT1oxpxtJPaBa8uWRBWPoVbsZzC5QRBBy9Ye5/WG?=
 =?us-ascii?Q?LTZjoz3tGhju5fQK7/Cga8ycksnAlZE76wHBE1wYhxMSTG9v9oMk0iiOokDA?=
 =?us-ascii?Q?pi/2Ugrry84J3rgCZbLfUeUVjdb69OfP4zGI6SdegNL6npoFQ+5eWG8XK4uv?=
 =?us-ascii?Q?VTTqxJaWZwVzPkvRrTP5hEaRMY2S4Iqji6OXxMZyZnUsviSpA8r5F8HngA3o?=
 =?us-ascii?Q?fcegTl80wAz46MEx/Gn+4UQO8rW5jj14lsfKdHtYYj/0+BXGoNNZu8hU6iRC?=
 =?us-ascii?Q?0jhVBtQbfNCOylYNFXQAmg924R/acKcohvfYarZV0Fu2z9XmJjUXrYWAHTkk?=
 =?us-ascii?Q?MIt9G2BlD22Mt/J0X+VD9ui39CYUkb1xxWqlJWBCSlhf7POzzkjnoRSrxYEw?=
 =?us-ascii?Q?UFIHvM84V2W7sGzc/FvYYoAdTkl7tmNNZJFLbKR7jSvrqCHiuQ9YnLaIy0QD?=
 =?us-ascii?Q?wSuA+phljzRPhYH/sN1Tq/NdIVBcmb0bLHM3rNjdWzMjlzyzRwlx2fKZBVYj?=
 =?us-ascii?Q?L+RYMBDHzMVNawX3nU3NM+GpI+S9t8uXprYPAezLZpobWifr7odXe3JokUa2?=
 =?us-ascii?Q?xLNN+QOWaka8KjFVDhpfCf/BcoYSlNtCUcpNFRcJnELy1VE4PLQ8TgAj0YKn?=
 =?us-ascii?Q?TyZXYVVf2XNro6uUZ919/92QDVsCAENH1v3QKpEDh18nGSpyE2Iz974otx8n?=
 =?us-ascii?Q?KKG6WpKSH8V/kJyHz9ONVDlPFv2tsPoApK/ZjHVZ+sPWoGNThq4wDNTgRJWh?=
 =?us-ascii?Q?tJ+tgKdH/9PLenrdSFDsm+p/YB2YO/Qyo8uIK6rWFXRTTLg6DTQhD0yC10yX?=
 =?us-ascii?Q?/7PyrZVuZc8adW7O5WaWS0DUaPRoqEulIUFJPlTFuMH0+mBFPBq19zF0NqcV?=
 =?us-ascii?Q?e2RY5RnkIMv1AKZyKp5xkZ7SZxiO+cbfHCXhkZfsfhsB8O8wM50ZmPgel7Ip?=
 =?us-ascii?Q?b/zIYcakQC6z5sE4a0SJ+RCi//Qz5cx/f2ZbPVmMYuSP3vADV9t94m8vGy5N?=
 =?us-ascii?Q?bLspWHAxHo1ii4uRgLmtInsfRPFxOT/J/NtuaaoTucWqRyOdSDvkH0OYUUS/?=
 =?us-ascii?Q?L1inumbz0Ce/IVNeZcqnVHKaF+D5oXD43L6PLxqgsQnXzh6M0ZwrQVnfAKx7?=
 =?us-ascii?Q?kqnjNxf4KAPXqqHSKn1oUGKCato93GmmTKrpIyYa/idfc1pQxWMP74HfYgbP?=
 =?us-ascii?Q?z15rMn/diqjJMFpRrvd1yx4Umh1Vzhna1MXspnf9gqnNhOX/WkASpVrFT8ex?=
 =?us-ascii?Q?mj3WEspIjb35f2l3rzq+9lWJJ1Qo7D3lpgZRicuNHpyQLAgbozpn4UxFrwv+?=
 =?us-ascii?Q?nEta8N86oZHsuv8by9EqK4xYB5opkWBYWPhfc2YWD5wFpzIGXH0aYY6aBZAw?=
 =?us-ascii?Q?f4nLP5CPHVAfqeP8IvvjTIl+PgHlh7Rk8WVM1ZOPPuL5iN4Deflnm7fWN1M7?=
 =?us-ascii?Q?+KiXa+1tjg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	aahZM//izZe4jjuifE312M/rHQ9I/OZ+ZHTuNP/qKaf4h7hBDfMVZ+DrPPOr5c28x9o4V24BR4A5i6amTDCm9OWYcrWw/o2bbeRpLm4Buuy3pW7VQEHfsSxbTx2V+XrsiLwmLmmhSFiziAJKSTM8iKHVjBK5qe56vT784wFt8hX0gN8Z3prjZ/ZLHjviws9Vg+E03qx4oYk6Ol4SuKSWQu5hczI7u38s8xrMtjGKzfurh5BpyyI3y8n5hELbhmBq5/+6NdcmUvhwuNTb9ol+Xt7QBaQNwnNqbAy998E/ikJ1raF5w9/GeV+S1vO3IWnri5i1i+dqDuuYcF6eh/wnqQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	UARfFXgj3Y+x6zzmMHz6bOsJ4Sum6o3RGyE1fHsbTFdM6qhsbcFW0I92/xwEK4PXV6jEAXSNJxPV5jkxalNtCLOkkgBlQfUzXW4WqfZWq4H1wlmr/hb4YmbW0dXf0Ow9YFbB4Mm/lPx142tkxAcivmQQ2rm7Vr2x5NjIyXeM8LwvpaMC49JOMYBSvz6jcUQT/uob/cV5V1phwqMXbG/FPVT5SyeSXE/X8pGg/1034XkRHItSPOdMMipKMYy6B//hSaa41JC16s4YWXZmU2c0qk7CBophMFz9G3auXQGarNfXCWWsSCXJ+f0rmg0mOuwlPToPTgev/EBoQflWh5wP46UXypQwQ892ufjp5gX8q08QPSNb3LohN/XD07O4miByg5BiBSYPHEYxZyh54QavmXc4QYcJ74GEWLyT3JS4HNxL5nl2FBr4+XxwUAZnvJ9sRdPjqnZN4CoWw3EGHEFhVH/9W/z/r8iQtGB2QQIkQvzbTwl1d+X6FDsOPZJKa1ZXzh82vKtGSrQvM8qxy1VWi/2DMLmOxylS82MJfyNrbMlIn0oV3+39SFZqgtusFEHcxHRQSL0MaohD9VG2m627riqX6aQdbORJitXx3RYz4p4DN8oqYpgGLINb8CY1IG3L
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fd8e54-780a-40b2-60e8-08dee82d0603
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 20:08:40.7412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Z5tp3IqszwKfMuNqY/DZTQklBrcExsXkCHnMlR1TgB6zmGBG0MauSELFdL4EqMZaG4tyavUAyHUzUhfAAcUM8f+UgCk48jQTHZNHWcdS4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR17MB4094
X-Proofpoint-GUID: IJ3n9rwhnopAoEnJFk74JTH-jJX2dDQI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE5OCBTYWx0ZWRfX3QwwvRwIJtfT
 AQliXSugJecxY7zEXGUUei4RVEOQdGk9qeIvEuHmyrF0YOl9fjE7sWWTHkAunZKF6WpkuTN7mPC
 V0//9SCSJHNxHj50jItH3f18++SDi6qWRlHMwbfXVARqhujjiMqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE5OCBTYWx0ZWRfX/RAeQOfEW0sp
 2/lL/8KGSCH3bbi/XHe9hfCDp42v9H/UO5BYhVRLH+RLKpR9o0Y4jac95Ud9qpMNpPxz/FnWX09
 kp0ct0skQa5PTlje4O+NDhdMnqf1yHUs6xXQaJb1TYsQHn7/PsXnPP0Q06DwRjAYYBeznqPyqoQ
 QISuf3OWD90nMxnNqmgjUudfkfVri2FIGAEosF5H6NC1eaXjcF3NTJ99uXOjJ0+eeFV6j69wsPm
 5Tk50L44yMfr/keQ4mgozioHJB0haSyXWfWFqhYxwaxwOHlm6+CbOQkPwdHLx6h2s5GNxxhJDVO
 s26JY1cNYmKGMwza36Eeifazg5mWDvMrzy4BqJvOprc1qFelNa5EDWr839zCLrBpAokTUI3m7z9
 L5nbt/jV1jOSTy5P3Y31e2V6mpBP3VG0E8x8/TJOUEtbX5wvuYlnzgrnsWBjvoXuzM8Fgj91P1H
 P5TxJrh2FgU6Hx1jBmQ==
X-Proofpoint-ORIG-GUID: IJ3n9rwhnopAoEnJFk74JTH-jJX2dDQI
X-Authority-Analysis: v=2.4 cv=PrCjqQM3 c=1 sm=1 tr=0 ts=6a61234d cx=c_pps
 a=8M1/PN84ODQM9BgHet7h7w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=ylRlBDd5bHdllK8znExr:22
 a=F6MVbVVLAAAA:8 a=Yyp9YMqRlRMKTZWmAgcA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11854
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241744

do_install and do_package both run under fakeroot (pseudo), which keeps
pseudo's ownership/inode database in sync with what is actually on disk
under D. do_vendor_unlink runs between them but was never marked
fakeroot, so its os.unlink() of the vendor symlink happened outside of
pseudo's view: the file disappeared from disk but pseudo's database
still held a stale record for that path/inode.

The next fakeroot task to touch that path (do_package) then finds the
on-disk state and pseudo's database disagreeing, and pseudo aborts with
"path mismatch" / "inode mismatch" errors, failing do_package.

Mark do_vendor_unlink fakeroot, matching do_install and do_package, so
its filesystem operations are tracked by pseudo consistently.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 85a3c1b586..5bb4e8e876 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -40,13 +40,14 @@ def go_src_uri(repo, version, path=None, subdir=None, \
 
     return src_uri
 
-python do_vendor_unlink() {
+fakeroot python do_vendor_unlink() {
     go_import = d.getVar('GO_IMPORT')
     linkname = os.path.join(d.getVar('D') + d.getVar('libdir'), 'go', 'src', go_import, 'vendor')
     if os.path.islink(linkname):
         os.unlink(linkname)
 }
 
+do_vendor_unlink[depends] += "virtual/fakeroot-native:do_populate_sysroot"
 addtask vendor_unlink before do_package after do_install
 
 python do_go_vendor() {

