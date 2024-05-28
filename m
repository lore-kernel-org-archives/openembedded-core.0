Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63060C25B7A
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 05:21:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.115])
 by mx.groups.io with SMTP id smtpd.web11.15448.1716873659391460214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 22:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=Fsahda7C;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=tiVeGn5E;
 spf=pass (domain: topic.nl, ip: 40.107.22.115, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=XFsdo0CDqk/VfKFjOW+8UXcDXJdp5GN87pQWo89LkXHaActMQ2p3tZSd22mCyhEdBQ7Kw2H+2UyNrA+QGDZMC/Hft0dlYI15BTQRtT+npVxAqIbMly2Ta3zZY0yZghVIwIwDfoUKVyv3ZMlkodu0mkC0NuTo2LWL0Z8YMZhDKNOWfomJSbw9EDwcZumLIA82txxXQQhhXts2+QpOXpQ5VqVGz0UcNFYH+btb3qhac++mRx7pPrte3988Oi/ydqWoPD+fOL57W7adFkysKu3hsAzWLA0YjeNjluyakNTKkAdPFHGGEmhPzxQPUeT+LpD5+rWSKQkpd/xqhJIBs9MAFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lg6B780TsbFDAeO+whFAWXn16oh9z0zYbCgzgkYCZCE=;
 b=YEEioCIhf3FU6OLd+B/Of1rc6P23uJG0FiVwcAFA8HulpD5BYuukQpyJ8DhMRlhev186zCWU41zoyxfBVr1RNiZccl4kmdBOb5JgQaxboov2heBcKeEjJLXAtEEDm2ssu3HE5swzLWlIrPgROhDAEJkEZa8i07G+f360n4Fj5asNvPYHIWfolbFL21Vm+LqPce47avJfm+AZ12pU15vVPj6aJ/PV9T+EDvVqRt/bDXHYWn96zRI3aUpFe8gRZzPbZWojXDJ04dOoEH39BfbWSDEEeIsCDYi1jh8TX/jG/BKVcdBpFapDpz8tLw6W2WoWXzo9bii9CQ40KHtcedHj/Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (signature did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lg6B780TsbFDAeO+whFAWXn16oh9z0zYbCgzgkYCZCE=;
 b=Fsahda7ClYKKj3PlFF1QENfab52BKk2dp68OUwKNst5TAp9PwQ7Ul1ZM7YDPjjKbuyImWhnsz9kXPf+2UUQQlbbrv52UBzTs9SBnluy1OwRjHLM0JIMIwfq+GzhBbcWnTIXJ0rTGohO9yZlugyu6xI1ydV7ljeg7nwGxEYjr0qRuO3LWZBSt0H2jHsyjqjlOKR+J3Lq7y9botrAM+jmbCvmyFAsXFzurnbTs6yMhG+XigqGB5rQW0gi35S7Zng0srMP7JNRYp0x4qST5LBQSEp6bZbUBwuNVrdHoZblqkpt4innOvLjKrDlzs8wWt2nzDIo74r3PXkogYb7dLl6r9w==
Received: from DUZPR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::14) by PA4PR04MB7775.eurprd04.prod.outlook.com
 (2603:10a6:102:c3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:20:55 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::ee) by DUZPR01CA0088.outlook.office365.com
 (2603:10a6:10:46a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 28 May 2024 05:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 05:20:54 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (104.47.11.41) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 28 May 2024 05:20:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bifYZ7DE/heKBxuszzkpS3bfSlChHjWbYlUHAYDM1mugrCagSfZFjq8i+72WcL2x41f4Fi0aJQ0kdvkl533gpVyInUhxnKgzUl2+hqK8mrYeYFfOVWxNMQdQHS6k807RdjDVaMvqyQFEBXsiQ1RqAGkeXbKP4VAYdp5GkEzkm4q46MigddXX/shvJTN6YOOInaiXc6kSgLiV85Fk9yXGQhxY44kxiynjfUR7eK4g25vwK5+ea7HrgcB79rooHgj1vS3xy8GQD45JQkJkUBot1f3LEYse4aGEoOCX401xVJ6HvhnAAO9wqApVukKDJGnaA7PZI01MBUQ1tYsPq68p9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTXqCt5Bg8ugeXaqreHu1NX5eIX89rfO3bYhV372RKA=;
 b=joOzQevUJwqETnUUPKjFnBmSE+IkR635ql44J3JOGkFz6kTb1lQ9q/QlOjiI+SvCXDG0q5VBqzOhIrcET3GSV35ezijZS62oM0t/DQvsaiwf0FVzhUsRS8v1IYZKN0kPn4maChjt1fAIHBfpc+m4/Vqthbsjs6UEKaDNWFHLG7QxIS3frcup+8UTLtwtEJyXt0Nwjwfc5G7Be/0gROJUx5szlnk9hDpiCH+AhHYql6cZeOaOP7fyUgqnZ0UhodwJEsCKFyiQ/zMkPCdU8vS68oCSv2zufK0NJVyeWTYsht0K9xJrmppjil56oG5rCwdYUPeF1r55Rm2PmJTLpwngRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTXqCt5Bg8ugeXaqreHu1NX5eIX89rfO3bYhV372RKA=;
 b=tiVeGn5EdR5FcIG0o+LP6lP6g3ufMfLCMSr0a8Qnru1FxPciEh5TcBcSN84sffebYJH4fI3hwkW3a8ljylPBxaUPpWiS84YsZcaseLRulotWsTUIqZLJIWZpS5oSzdC5ye1IAuoBr/1AnZ0t69JhHiNFzI3W8bWJ7Mhu4Z3LurheEPk/6CivoKkvR53nGNofKi4cK7MQ6WDAdx8z4qCYTW3hgvdPjEcOW4QZY8NuSc9O+du/JHJfQORpl9f3b7X99D95WQFQmRniNgS+O6FdJgC77oW5B/JCURvCfI4pverAEfwTU4Xb2Z+7LfKbQJimeoT2/Fb8DXXsR0Ys7VVsng==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PA2PR04MB10130.eurprd04.prod.outlook.com (2603:10a6:102:408::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Tue, 28 May
 2024 05:20:53 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:20:52 +0000
Message-ID: <f3d14378-3a29-45f3-bea4-9a8ad0396a9f@topic.nl>
Date: Tue, 28 May 2024 07:20:52 +0200
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [OE-core] [PATCH] meta: uboot-config: Fix broken menuconfig for
 "fitImage" kernel
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.cc544a93-e646-4932-8496-82717a21cde8@emailsignatures365.codetwo.com>
 <20240521135705.444470-1-mike.looijmans@topic.nl>
 <5340825db3c98197e448c58b88381562edbed66f.camel@linuxfoundation.org>
 <023cbca2-b5e4-420c-b109-445d7d8480a4@topic.nl>
 <5354eeca5b37a4fd3de0f9afec23ccc834f993a8.camel@linuxfoundation.org>
 <802ee008-2325-42a0-be6d-a2d0ebbea050@topic.nl>
 <da23b251-8a2e-4bf1-8c96-812593f52d96@cherry.de>
 <4a28c790acf8e06fd67761a6867dfe5fe412d8b3.camel@linuxfoundation.org>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <4a28c790acf8e06fd67761a6867dfe5fe412d8b3.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P189CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::8) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|PA2PR04MB10130:EE_|DB1PEPF000509F2:EE_|PA4PR04MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 8909f1f9-110c-4bad-0d5c-08dc7ed5f306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?N2J0czhseXBMeTlHRUJNQzZYV3J4MUJKcFBtZE15ekY3Zk83b1crRXQ1bXNX?=
 =?utf-8?B?SEN6VXJVdWF4WW1zTHJKd0dpcUhxdnNLV040cDNQLzQvRTFSTWNTajFwTnNV?=
 =?utf-8?B?UHAvZFM5eHBYUHdPeE1lWVpmVEhBbXdFbVhsK3p3VmdiN1puYnBEQXBaMXVx?=
 =?utf-8?B?bEZDcjZtZlFJRzJzWkRFVDZwK3JFck5pZzY4dU1qYlp4cnc3ZnJuMUJEaDhp?=
 =?utf-8?B?c0l3cGlXNVFMTUdsS1RHdnFmeVAwVVVOb2RoWTNJb1oyV1poR1lKZDBzK0ls?=
 =?utf-8?B?T2RvTE5tR0IyMEJiUHZLYTE5bGtWbnpkYmpoTFN3TUdMSFY1LzFHR0hiVnVk?=
 =?utf-8?B?bU1uQzB3YXhpTWkyUUVjZEVRQVpXOFc1d1I2dzd6L21ZZ21RNnpqMFZXcTZW?=
 =?utf-8?B?MjlIblJIazFUSE5hVi80R2tJT0JsRUl5eW0ycU16U2hnRVVzMHl1SlpYRi9v?=
 =?utf-8?B?MzhKdmx2c1N3cjdmMTBRKzRnTTcvSGlvaXFZWVRYSEtKM2JVZmNSN2k1L296?=
 =?utf-8?B?eTlzR3d0UHZFOVFQVlQ4amVtSmhSWlEwZ1ZsbitQeTZrY0xtbWdyZjd0SjJD?=
 =?utf-8?B?b202Mk9rN0VYY1lTSWYyT0k5N09LYU8yMEQ1elkrZmdyeklYeVR1SlJIelRv?=
 =?utf-8?B?U1hqWWJQK20yUkVhb2l2Um5ycVhVQVltTTJTVVpheU9PSy8xMThmSXNjYkxt?=
 =?utf-8?B?UFpOc25GNzdVeGhtbnpTb2tUVmlwZzYzL1E5d0QvZmc1U1VMUEwydThSWEtW?=
 =?utf-8?B?ajVJaTYway8xUnhYS0huWlpLdnJPMTJnNXpNcHRVYU1NcDRXbGRGNU42cWV5?=
 =?utf-8?B?cHRQTStveWYzb3VlSHgxM3AzMGlHb2lFMHExdFF1eUJHbW9wQzA3QklKL1ZJ?=
 =?utf-8?B?N2p4NTBkR1F1WVFEMjFqR08xbG0zK05JS0g3RERmZGFtUGw2Y28xK3hTNlRv?=
 =?utf-8?B?cnNyYUtMMGxVMG9IZ3NPRHo4NXpnOEdmeTZBanhJRFJ4bWZFM25EdSs5K1BP?=
 =?utf-8?B?bjY5VHQ2UkR3eTc0cTYxQVNWS09vdGJ1RnNGY0t6WjNVVFdZb1NjeUQ0dFJO?=
 =?utf-8?B?MGxHTy96a1hheGNCTGVEeHVPV1lsNHFzNHM0RVAxS202MXdDWmYxaGw5TnRC?=
 =?utf-8?B?eTY5bm1jTkdlREl3Vkd2OEZjVHdVcFViU0FvdlNOZm41eEtGd1BWRUI1Ynoz?=
 =?utf-8?B?a09EYURIcEtUQUxuQUduRkpac3dMWFpUYWc3am82dG02TW8zZGM0amJlcm1v?=
 =?utf-8?B?VG13aVNXZk05ZUQ2emYwWmZTeTBxSzZuRG0wYnM2bStDWVB6cEt3UEEzQkxQ?=
 =?utf-8?B?WnJjTmhmeGtyaGRDWU9ERnpMOFRRc3p5SUUxVWhMV0lMVWhoQW94UjZjaUVC?=
 =?utf-8?B?c01HakZZYmI0YVNWQlpJNWhDTTRHS1RvaWJQT1A5MnJCSjRzcE5SL1djMUZB?=
 =?utf-8?B?WkE0a0ZJTzVNSGI1Y29FSnd3dUU4YTFFSWZ6UDZ5WklKMlEyQitwN2M2Q3Bm?=
 =?utf-8?B?Wm1kT0NXeE11dS83dUpPM2FkTjBnRnU0bnBqTmVIVTNncS9kWEZUVGFRbmNT?=
 =?utf-8?B?c0RWVUdYN1NXSlNXSWpmazdSZ1hZeUUzMVYyQnJxNWphbUVQeHU5bjdUdWtY?=
 =?utf-8?B?MU5FRzF1aUhQek85YTJBZ2ljZzhJRjlWOHV2b2crWDI0VmFhaW4wRlhwQWhY?=
 =?utf-8?B?b0dmRFh3UFA1azFUTVhXeXZ0WlVvdXkyN2dSRGVQUDdxNHRSQjhVUGVnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(52116005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10130
X-CodeTwo-MessageID: 25c139a0-e210-4763-8b8a-773e6c3bce4b.20240528052054@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b7957b72-80b5-4374-8821-08dc7ed5f193
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|35042699013|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Rld1Vm15cXNkS1J1K0NKMjU2ZFhRSmdIa3kzMHpvUFhEZjZsVEo0cXAwbEZv?=
 =?utf-8?B?UndlQnMxZmsySElHWHh2VytETlFwQlhCS0ZNNllwV0lYWXRwcW1TWktQRHBT?=
 =?utf-8?B?SzF3N2NLU011VnUvMWt2Y25jTk9EQlZFV3JuQVZQdnVXQ0JycGtRS0toMTNJ?=
 =?utf-8?B?ZTZBTDRwWGtFc0Zwai95UDZteURQM0lNSHlLWDBtdWoya24xR3JZdVphVnBP?=
 =?utf-8?B?V3lqV1U3MDEzSWtYb0MwNmFTVHpISll6TXg5Mmp2ZTh4emtzVnN4SmpzZHYz?=
 =?utf-8?B?dGFySDFseHhkaXI3c3JTUy83L1R6ckRud1haMm50TU8xV3ZObDdLRVZjZnV2?=
 =?utf-8?B?TXN3UGozc2xUN254dkNSclIyUklKZ3BIVS9mMkpOVEliN0NGNmxNZEJvNzBJ?=
 =?utf-8?B?VkxhLzYwNDNOYW8xSTVFY0oxbXJJZzRmV2JNWHRNM0xjckFHVmlrUkN3bTdU?=
 =?utf-8?B?V042b2YvS0JDM3BRbC9pRGlGc1dZenc2dzE3UGlsekpTRGEwdUJZZldUNk5m?=
 =?utf-8?B?TWM3TTRJUjlXdy9BdWNUTm9WNHBNQkc4UjJ6cEJPTUZZRFp3ZkZMZDNGVTVT?=
 =?utf-8?B?UC9tUnJoWTI0RGNkaE0ybHBWd1lEcytrWGp2NmZ5aDhRM2NXeW9Zcy81V0M3?=
 =?utf-8?B?UW5vdUR6Qys0MU5OZmxPVnI4bW5adVNIcFFvQ1MrMERZcUpBNzFvS3duR0M2?=
 =?utf-8?B?eVZKVHNTb2FyUFZTVnZUVmNEVjVxblp0eHcydWRYTmh5Z29MZU8rYjhUQ3Uy?=
 =?utf-8?B?OEZFaXd1UGwvbVpkNDQ4TWNYVzdFSHpqYlRmMkFjMXcycGJhVVQwb3hseHBX?=
 =?utf-8?B?ZE5pd211aHdtdTN6T21qbVFZNTBVTldDV3NxZDErUHRER0lRVzI5cGF0RXhG?=
 =?utf-8?B?ZnJDVStkK1BQWnkxRmlMZjk2eDdsblNsQ2xodUd5L0ZSSVcxZGNmZ0d2eHpj?=
 =?utf-8?B?YjRESHk1VzMxZzRmZ0R2L0FoRGxvY0ZKM2wvN290Rm1XZmswd2NYKy9aeGly?=
 =?utf-8?B?ak1KbjFPditFb0pUVXExejdkSmxUNW5RWi94RDdmNDBiVWdFTTJTQU9YQkFV?=
 =?utf-8?B?aklHZ3dPeGUvbzVKYWRtamxOZUs0bnZwdmQ2b25GUUxDSGs1R1pWR2RhZG4r?=
 =?utf-8?B?bTNKQzFlZ0FwUGZ4SkwzRDJ0cnA2clQyUG9PVHV2b3lrL0dNbWZPamNyUzNi?=
 =?utf-8?B?UGYzRmxiTmRVWHMvWFl2eXd0K2lJWVNkWEhQMFRnaUN3ZmUyUkIzRklnMnhq?=
 =?utf-8?B?Njl1Wjc3T3VDckc5L3BHQ0dlQVdqY2wrQ2U3RjhwRDByZ2hKVFVvcFh4MGlV?=
 =?utf-8?B?NUU4ZW5xem1hK01Zdy9GT2pxSkhLVmNuaER0WGpuanJ1Y0hMM2Qrc3JMck85?=
 =?utf-8?B?enlDUm5jNXBueFQ5RGJWVEZta0IvNVZGOHBIOWhsMUxlMGRuRGtscUJCK1Vv?=
 =?utf-8?B?M3hmeElUZXFlZ1hQSkMrMG1VRnU1K2czeTZhbFdqSW5oTFZOVXd1TnJvRXhF?=
 =?utf-8?B?cStETlBRbkJGVnZpWXJGWXAxY096NkFzNnNkUlI0R3BhWGE4Ny9qTFVoMUlL?=
 =?utf-8?B?blo3eFRqTkJQc2xDT0I4aEYvcFd6VDZUeml1S2RLUUlKTmhWU3JveVBMNjZ0?=
 =?utf-8?B?dGRxb2tLSUpQeU5PSThRQnhwUHJpUlZwV0tGelNXckRaT1IxcmM1eGhES1Vp?=
 =?utf-8?B?WHNsNFFtSGRJQTJEUEl2RnVmMmFjY204NG0xOHJ1VGMrWFg4SDJsTWYwUGFM?=
 =?utf-8?Q?1TOH7Bnbyxc9qrgIQH+3lsAQFmMb69Ze5GAKat4?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(1800799015)(35042699013)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:20:54.9380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8909f1f9-110c-4bad-0d5c-08dc7ed5f306
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7775
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 05:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199951

On 24-05-2024 12:22, Richard Purdie wrote:
> On Thu, 2024-05-23 at 15:43 +0200, Quentin Schulz wrote:
>> I was about to comment on the v2 that this should rather be a class :)
>> Do we have some information on how/why this is the direction the project
>> should move towards? What are the pitfalls we're trying to avoid, or
>> benefits we want to gain? Or is this just some better/best practice we
>> want to go for?
> There was a post from me a while back complaining about repeatedly
> splitting class files into smaller less manageable ones so that people
> could access some variables without the task/function side effects.
>
> I have a belief that more configuration files would help this kind of
> problem and make classes more specific/focused and usable.
>
Okay, so what is now the way forward? v1 or v2?


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




