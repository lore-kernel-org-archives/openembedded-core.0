Return-Path: <alban.bedel@aerq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0FED1AD21
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 08:05:55 +0000 (UTC)
Received: from mx-relay17-hz1.antispameurope.com (mx-relay17-hz1.antispameurope.com [94.100.132.217])
 by mx.groups.io with SMTP id smtpd.web11.18264.1729065951597623301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 01:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=nLlYg3r8;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=taM58xpo;
 dkim=pass header.i=@aerq.com header.s=hse1 header.b=ciAzv0SP;
 spf=pass (domain: aerq.com, ip: 94.100.132.217, mailfrom: alban.bedel@aerq.com)
Received: from mail-vi1eur02lp2044.outbound.protection.outlook.com ([104.47.11.44]) by mx-relay17-hz1.antispameurope.com;
 Wed, 16 Oct 2024 10:05:49 +0200
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=C1tNA+Rl9Va6C2VJlRUqTLcu5mTDlMWthPsVDUU5IvuqZdZf+Quer+WQ/rQPxkYtO0YDfSkpQs2VDuxKpddZJzgypiIkS4u5lbv1uAIa7hTNCIvMP9xBPBTRPJDM1I9jvSBCDv5HqJxsGHmJNAJ2gz5MV0iva1Pf6Dvo4+qrz7HOaP2aB7aEV+ht3LgCoqoPGsDekbG7Ai8943CqWxQENd9pe81++SFTgK+MdPNac3LTXsB3opD8pYuIxw+xkmf7vf6TcF3FLxm6jlYpvOAAx/2VlJbLrHqiJgTtuSPU/clOuzs36cF7yeuy1DA3lC4IU5wYYEJoQqx3LITufSxUOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjoZQOWRANo4w1h9eloRWHnz9cpgQXVgIrPQ3A197h0=;
 b=MVcNaIYDIDPx03B0ggXyeGmppmIyx+Jzn0NFqMLbGV48/xEEjxU3XiftN1VkCrsZck9anJ+GoqV19agIeNJQsIOIcCWGB/YFfTRgnBqPuWBG0A5KFVTrt78E+BbArNuQ6IUuUVWzf/B77jbgsv5/QX4lIzB2Z6ZrfLdDeQfql9WrumI0gHM56dU6nWZt+8u7qC7ODSJfjHajEzoUQVL5uw6dFMkrcFtgkU+mPreq9HuQveVEqYwdaq0JkYyrSRXZUhuVSmLxFiFYwa6k79UKCpo7U1YpwzWVuPwdRnaLVUbV3bFrfwaFQP4idg3Ix4dhg/7AaEtmECut2qj/RmFzPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.40.229.156) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=aerq.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjoZQOWRANo4w1h9eloRWHnz9cpgQXVgIrPQ3A197h0=;
 b=nLlYg3r8NFbax8KgF0TVSPoZHOq8Emk1DmZSM2yvhyZGWgBsFiypJsm2iOUQE+qcKGHanIZ5d4SzJmuvD/kkleIuD6YzYUZl7UtKVtqnsG7UGAoYDDwsUjpL05TIy/GjOeSvZkt9njq7uMOJmx2nE11am62JswWNIikR2Vde4TM=
Received: from AS8P189CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::20)
 by DU0PR10MB6411.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:409::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 08:05:38 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:31f:cafe::42) by AS8P189CA0018.outlook.office365.com
 (2603:10a6:20b:31f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Wed, 16 Oct 2024 08:05:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.40.229.156) smtp.mailfrom=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com;dmarc=fail action=quarantine
 header.from=aerq.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 aerq.com discourages use of 104.40.229.156 as permitted sender)
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Wed, 16 Oct 2024 08:05:37 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (104.47.11.46)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_DIFFIEHELLMAN_WITH_AES256_NONE); Wed, 16 Oct 2024 08:05:37
	 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 6818838
X-ExclaimerImprintLatency: 1404674
X-ExclaimerImprintAction: 4a8ba5d00eba4fc5ba7fd4caf90d2601
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4z6EPKq6JbjJ0sKu8hTJBEdrZY7eZ/oRYcM+Rq+wBN/a0IBRApQUo5N2CJxPWsCNey/MWIoRWZiwYeya6m13Cbd9tUJe3TDaqwLYJXt/BZv/4mGQgtu/lYno15SVSytndSFXDxZXxxJUqPlU5TZ3WP3JOLdcFxMrE6NZihSGzNSikTP11dWS4UBEeBHC8IrTNiAEBHUxweRv/lJ6vw8rH28r2unoEZAK8rJ4/Hs0AqhFRggHnTKkj6P7EfR8CipxzQRRcWic1v1wtD89hdYJdrUrrY9Lxh5FFgJtTd3dWA4cfRP7ceuI/+BAtl0oVPc3/OxAhAVJIARdg4jCQcDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lidkNpH+mmtMtr6zeZf1yPZHx3zEfuU+uxWEAwMI0HM=;
 b=Mi8CUS5q6B/SQkDYzYnNWESvH/zPcXXn3jDHmVyUPjkisidLx711ihdg8JqbujQGQowEL4nUI9/il1GYbfzWmGY+2bXYzDH76ZJI1+Aa6C/eQJrG0V96t6mUweRLr0WDVC0FurJxjpikQwUg/kHdLo/WzW04/NiAgd/S669R3yYn9QXdcW9Kk33ZIN46lSza2ZIkwA4khuca8iSeXcWYZaXm2i1GbbmX01+Q9j5DJh/f3IR+jtHh0kRe04oMpLGZcZiot1Ei1hCcbJrrG1u5GGCkvQlr00TyDcErwfsXhEP+BGSmEBby8QRP2A3Vjn4xERfa/wzTaM361dqGceLxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lidkNpH+mmtMtr6zeZf1yPZHx3zEfuU+uxWEAwMI0HM=;
 b=taM58xpoCA5mIF+Ceo8ELZgzya6aDQ2zruA1dpNulb4Gh9Mw9pGtDRkAZmI4crrmbvYnD2HmA2OtzKwA2eVrcvM2buhddYULgUfWElA484N2U1eo5ChhKc2uOrXiD8eYl2DEvxu4TRwR/rPeELe2E/yXydCxkpsL1/2w3ZrKZGc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aerq.com;
Received: from PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:208::13)
 by DB9PR10MB6545.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.16; Wed, 16 Oct
 2024 08:05:32 +0000
Received: from PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bf5b:5ee4:7d6f:7e4]) by PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bf5b:5ee4:7d6f:7e4%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 08:05:32 +0000
From: Alban Bedel <alban.bedel@aerq.com>
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] util-linux: Add `findmnt` to the bash completion RDEPENDS
Date: Wed, 16 Oct 2024 10:05:20 +0200
Message-ID: <20241016080520.1532567-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:208::13)
X-MS-TrafficTypeDiagnostic: 
	PAXPR10MB4996:EE_|DB9PR10MB6545:EE_|AMS1EPF00000040:EE_|DU0PR10MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: e6cea053-bde9-4378-018e-08dcedb951c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|10070799003|376014|52116014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?D9nhGi+9N9ZxvegxThOYEcKo5lobb9ry9qBhaRTvP+TYAwhCUgPoMTXV1OeT?=
 =?us-ascii?Q?OlWItYTmS8zzwCPf8uvcrvan8dZ3saVdPTA4Gq7XU0fRQyUp5vH9zAcMn5NE?=
 =?us-ascii?Q?zQYqz0voKxDN4+4G2wtY1c/3iTjTdjOFHzN1gd/NlHmZ8MyejxAOJkfYzvpR?=
 =?us-ascii?Q?S6S6cLA/Td7H6Ti1ZUHTseohqGXSK2l7pdMxOlrmSf+24R153d82XagVrjV6?=
 =?us-ascii?Q?0lCGgF7xgWl2it8e8xcXzsyX9ToJNBl8fijk4tek/07LebXNJGjiox12JYh4?=
 =?us-ascii?Q?B+fJJEVP5z0SHwHHA6qXhYyOqVB7pQui2R/kmJg7RhDp3ajtLQlbczzf020c?=
 =?us-ascii?Q?Bf2QRjdUwPOi9kLeX36g/X29wI3ydin23r0ZDFD0q9WdburVGe6mdnTuPwPT?=
 =?us-ascii?Q?aaQ4yRO2UUghudM47LdpG1s7weYjD3F/7bSnPE8gvh4FKKeplkHdc6O5UGu+?=
 =?us-ascii?Q?aPxRJY8lu6BW3Pj2O+UoBymj8YBYFiC13qydAttPT47VbMe2m7TEOwzup4WK?=
 =?us-ascii?Q?9WUI932TuuIe1uw4qVqgW/mXVl8wKX4B3k0ssj+P+u3I+ZpHWGm8gdnb0nAE?=
 =?us-ascii?Q?xWmAi1VCScvNmiBsBn6LSoRkBdxBWouVHRVT1ELp3HZnpWLiWUUETimbJojJ?=
 =?us-ascii?Q?+KzVFEEmY7luQfOBh5zES5PV7tkPz0EhdrfgRC2pg/0USAPX3knG8fCI2mLg?=
 =?us-ascii?Q?Vxt3QT5UJj96BgcS+mliv4gevIn2r7WsWlk69j2vHZpz8b4Q0vs4Gyo8QtqC?=
 =?us-ascii?Q?QWeJ4ANbcupmDD+k1vMn54iko2FI0y+AvxUMWMldFf8/jOSD6+EPEAvj7FkW?=
 =?us-ascii?Q?wq5t8f2Gt1+XUnbNvcfXOvPN2M0rpwUmIYZJ9s668of8uG1nIjsWdRZKcb7e?=
 =?us-ascii?Q?l9LlRxSJ6QFt6mIp/DFSvGWFMt/Na80Dv/I2NoLjpwE3ZA4BwoDd3yOnZftQ?=
 =?us-ascii?Q?iisdMcZn81WZmtgKBwSztVjc3J14H0wA01kVv7JoYxtyWIWauytHHpe8eLHi?=
 =?us-ascii?Q?kCzqYkTEWt0LkkFbpzkegA4aInr1vOk5rJlgHK6uO4xzbPZYh+fLFxEimXJt?=
 =?us-ascii?Q?JSBVtNkxdqe2nsSpuNcXaCdWch1KzOxRgsrFTWzOof1aRr5x2GfRp/0DH6Jg?=
 =?us-ascii?Q?4WAecrPzZsGHN0dfsW3TGCfUzjCAPOFkC06e/OXyHnGB4ix5MaIcuZcPXh/B?=
 =?us-ascii?Q?1pZv/RPO7lOfF0R+huNxm72b3JtdN21ZBKK7GarJ866YnZphomOTk1DgARtj?=
 =?us-ascii?Q?huccl4kufIwA2dqtaHnnTJXz/FzjSN02JfrN0kJMzA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(52116014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6545
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	67699d2c-e417-414a-3830-08dcedb94e70
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O2rOjWedae8+4kX+THVGz0xVuL1mnXdXtk+0Xy4nwLMgyINzLy5MLNQbG73D?=
 =?us-ascii?Q?lhy+VUztXTkjNNqFm7Zveu0mmTUrMQDdRbJ9MGi2Z2QZ0/7bVT9rGG0wh6KM?=
 =?us-ascii?Q?4OA9xi2bq/MmfVCd5XMi+pQoZFA9/1uC9MjpJHoEr4r/IuU/F9o3VGiV5dz5?=
 =?us-ascii?Q?fu0h3QDPAKpN44PCX2fAIrfzpwlQ5GwU2jxRBbwJLkFkKev5kg9y2hCHibEN?=
 =?us-ascii?Q?cD4xwhO1dbyBJLdNMTzeRmCsaENeDzO5KDN+KlfZw7vhZqP+RGojI0fXgjgq?=
 =?us-ascii?Q?4Pxjrcp+c5o5V141hmjuYDZ6ugeKAo+XyStZXMth375lBu34l0WNl35BgHPi?=
 =?us-ascii?Q?f3FxbhdTcGiKi9N7kvoxLXSHmlGFhenJrQtSqLzjtpNEqEmWIJkBEHMNbYB5?=
 =?us-ascii?Q?VmDN0SkHpvvLzua7zEjulzKz02Z0z8MIUJhL4c0eAGypYVrr5iQV0++mxDco?=
 =?us-ascii?Q?fvfSzuYEjX8WGmRegccntW3lHkGfSEjhLuTaNu5fV0r/UPxMcVVhBv42VwHs?=
 =?us-ascii?Q?1n2d/L1AQNDGUdcxKus7AdUn59gF6jmmGSJloA1xnZ4r+2wwx499A3tE1UKv?=
 =?us-ascii?Q?0joqhBHdfGoxhPEHIdnQP4Yck/uvaktK9sfjFa5YC1M3iFvd7V3s8VLjwov2?=
 =?us-ascii?Q?7+G46fjxms83qOkJsRXrxs0H2SpM9VCGDLGe20D6Y3VA0ZR2xx5ctqen+/a0?=
 =?us-ascii?Q?PcVmXtDFDz4BxQfomr7rFXbNuCKigOUvMQ3+6GQi2w1Z2/j/UZ7pStWZthkZ?=
 =?us-ascii?Q?P+T2NH8lZ+Oi/kCnzwFHbJBsJyTAmAIFD6KWp7tCn7osu7RfJO2hEh8ff2U/?=
 =?us-ascii?Q?UI2TK1ifVaZi4zOzRj7WRx/HQjCCJ/R0aoDrwcwglqdjXgfOYcAvd7nlf0Y/?=
 =?us-ascii?Q?eD7cO52G9rvi/EfBqahBQVey+1a9AmZse3NTl5CKCc3239drQ/WB0vurLqPX?=
 =?us-ascii?Q?8csPq1lvffrTmQ1XFPF2gA9u7WKX6OAxjAiZYxUMhB9yuaw39Yznw0lSUBDR?=
 =?us-ascii?Q?FU7slzFSQMsk391NCdth7ym/tY/lVqeZJU+JdCumJefxwl7sZb6qd297YQ8q?=
 =?us-ascii?Q?wrHcCzHOgPPNwC1iHAD74X0jU+0JxyjlUqdz+lUMQS3v7dNzTCSqcF0xzQYT?=
 =?us-ascii?Q?Gtz06JiU4SymNvS+gfYmhnwjLXG1d3ks5sTcim/U9++E7UKA7WQF+HNDe5Uz?=
 =?us-ascii?Q?NfiT2Mg/P/ppGoE/gPYeXl1Oy+MteAtSDw0w/YSI3W3521ysmz9kMk0fpVlt?=
 =?us-ascii?Q?uzgHyEK4JhSDMyUUrycO3teiaJicRR+Jw6q6irQdX+h0XnARJSMkzduTcY2x?=
 =?us-ascii?Q?x5MOnoy7BV7uSdZKTVldCeLVdCkFzA+nPtvh4p1NQ6eLNJzjL2JPcAb8nIQt?=
 =?us-ascii?Q?q069agrMu0DxbrzvFs74dZL+GsrX?=
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 08:05:37.3422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cea053-bde9-4378-018e-08dcedb951c3
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6411
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----656801F75A4AEE054CB07F578D5D2A42"
X-cloud-security-sender: alban.bedel@aerq.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-crypt-policy: TRYSMIME
X-cloud-security-Mailarchiv: E-Mail archived for: alban.bedel@aerq.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay17-hz1.antispameurope.com with 4XT3S46CLSz3khgZ
X-cloud-security-connect: mail-vi1eur02lp2044.outbound.protection.outlook.com[104.47.11.44], TLS=1, IP=104.47.11.44
X-cloud-security-Digest: 3d32cb116253da813185984f5f3957ad
X-cloud-security-crypt: smime sign status=06 sign_complete
X-cloud-security: scantime:2.188
DKIM-Signature: a=rsa-sha256;
 bh=150eq/NNput0j3Jvd6eNoOygm/kNM4lSW8zMxFiy3fw=; c=relaxed/relaxed;
 d=aerq.com; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1729065948; v=1;
 b=ciAzv0SPo2busdzz2ztoslKw4neZZX40CJeSqof3YkiwQzhB8TdthH3uiiuNw3t7ObmTI3Ew
 nsgN0r35Y6zp0hb+pSuoZAF5c/y11JV3yO29uh8LHWX0flusTncIm9OzDARsIy0ZvgVBPFxoxmc
 DtYYiFGJ2oTegosodDqKvZA3h6zwddWd2IFhVGaOPiWUATtFpqD4CZktipmaS9/U5ojyjtrJMjR
 4hqFrjvihM7CbtzzywNDgTAytYgDHrF6X1nIaLPJ6ue/MPyjFhj6hZpljXrzFuDAsS/Nutk9f1E
 eLrUS3cBmpSgG6Tp0S6iFOFxZysknAiDNswSW1JIOoY6w==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 08:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205955

This is an S/MIME signed message

------656801F75A4AEE054CB07F578D5D2A42
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] util-linux: Add `findmnt` to the bash completion RDEPENDS
Date: Wed, 16 Oct 2024 10:05:20 +0200
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

The bash completion scripts for `umount`, `fstrim` and `fsfreeze` make
use of `findmnt` so add it to the bash completion RDEPENDS.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/recipes-core/util-linux/util-linux_2.40.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recip=
es-core/util-linux/util-linux_2.40.2.bb
index a8e346539aa6..646bc0556448 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
@@ -148,7 +148,7 @@ RDEPENDS:${PN}-dev +=3D " util-linux-libuuid-dev"
=20
 RPROVIDES:${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev"
=20
-RDEPENDS:${PN}-bash-completion +=3D "${PN}-lsblk"
+RDEPENDS:${PN}-bash-completion +=3D "${PN}-lsblk ${PN}-findmnt"
 RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs finduti=
ls grep iproute2 kmod procps sed socat which xz diffutils"
 RRECOMMENDS:${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-sd-mo=
d kernel-module-loop kernel-module-algif-hash"
 RDEPENDS:${PN}-swaponoff =3D "${PN}-swapon ${PN}-swapoff"
--=20
2.34.1

------656801F75A4AEE054CB07F578D5D2A42
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIOJwYJKoZIhvcNAQcCoIIOGDCCDhQCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggstMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkq
hkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkx
FDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5l
dHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRo
b3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqS
vysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEib
ivHbSuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHK
RhBhVFHdJDfqB6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFb
me/SoY9WAa39uJORHtbC0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManR
y6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMC
AwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0G
A1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMCAYYwEgYD
VR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwu
dXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNl
cnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcw
AYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEA
QUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFu
SUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TEoGg65FWM89YN5yFT
vSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav2VuQVHwp
Tf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn
2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZG
Xq6F2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMG
quITn/2fORdsNmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmd
WC+XszE19GUi8K8plBNKcIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4
hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVnLernF6pthJrGkNDPeUI05svq
w1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggUVMIID/aADAgECAhAV
Bbr0bzRtpXqrU7KDa4UuMA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEb
MBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgw
FgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENs
aWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIxMTIw
NzAwMDAwMFoXDTI0MTIwNjIzNTk1OVowJTEjMCEGCSqGSIb3DQEJARYUYWxiYW4u
YmVkZWxAYWVycS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDD
bGac2SHb2eIa+m3KUo/AJiZDcBR5eFitNMqkBYGzLH3NwmL+2qbl5vKerZ+M3jaS
sFeMmr6P9lXTjSR4Qkcdv+ZmTUNTaJ/vLFqEgWx+sCszay9KK5TM5w4tpkCQLX1T
4Fiuans6EUUPZETMfjKBjLafMenQuGZdn/ul9a0DrkgsEe/qJUNnhsRXzY8zd4mm
mcTaiqI7elLXQelS7FUaWh/BTSjd6c+hFW8YvYxFLEsTp1di/PcBOlb9VgD4+/D4
zxHDQkfsJ7xiy/Xig3PbZmmhF/T4d9hab1YrVv1rXJqKbtjZyG7Cfsdwfz9Tsodj
HEFItk2dLR5ROV6LRWR7AgMBAAGjggHNMIIByTAfBgNVHSMEGDAWgBQJwPL8C9qU
21/+K9+omULPyeCtADAdBgNVHQ4EFgQU7sc2WNoWAgmlONb7GCP/BCyMuEwwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQG
CCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUH
AgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0
dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0
aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEF
BQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0
aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0
cDovL29jc3Auc2VjdGlnby5jb20wHwYDVR0RBBgwFoEUYWxiYW4uYmVkZWxAYWVy
cS5jb20wDQYJKoZIhvcNAQELBQADggEBAF9U2htHftfPRwJwvN9bFBpXNA69+Em1
a4zxDLR77PMBkmc8pwgbl12rBuwJ9BzUsOgeCLfdCmQiurLsnGhrvGj1JV7L1s8e
S5vKKemLAnPZJ0czTzQeIGlLY0ZAvBWbgkjmWLpsOjeZmLOOMFLTDa/5QZzDXo/E
ZmvxqRqsfirSYWVzKWdIoIbpfBIdqMM5sj/p+L9vXDle3143c+orA+1L6tp/7Mw6
tFIzedrBWu4wv4XgGb5OuouhiBL8+fzVlsY67M04A/6lQ83eJXEn3JM7GCMIPIdj
N7fLO4fWbhwndi+1xdmlTY679FwT+mpoPXVARs7OOLxuuitpqPdw4jwxggK+MIIC
ugIBATCBqzCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hl
c3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVk
MT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5k
IFNlY3VyZSBFbWFpbCBDQQIQFQW69G80baV6q1Oyg2uFLjANBglghkgBZQMEAgEF
AKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0y
NDEwMTYwODA1NDdaMC8GCSqGSIb3DQEJBDEiBCBPlDen6u7i9QTxywtD0/ojgNkN
6t3Bltv3woBt4KZrYTB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASCAQBr3TFmKcJ8QdkGr4BpwtrfcXsW2DsqvQw3UvTRp5zu4MKAnNOM
40VLqRGa56sHDvhdwA4ZFTpgVk74U8IujPmHCz8CeuOIH+TLrQSdVjkV0FwoW6+B
2NY2KbBjiBqpKdjq9sscnAvKIXyj82A22oMqEtLs7UFtooHuW2pCcRtCMiPB2AjR
XJV/8nwgNn0uMmtwq0S+/NyCAyaeTGVqMQ3tVHTlVgQt28r6bKc3F2TdyYT3Z1xY
nJzZYngerht2E/KXweYdLBRy5T1NctT4w7n6GNB5yxEFhCHoH4SBVcm/FNcuL0Oc
y+d0zdU9oWKJIZY5pqTkYez+shKC1HuE1XVn

------656801F75A4AEE054CB07F578D5D2A42--


