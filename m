Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F79ED462B9
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:48:42 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.47])
 by mx.groups.io with SMTP id smtpd.web10.13490.1731509320827266023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=m0lQczij;
 spf=pass (domain: axis.com, ip: 52.101.67.47, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyZJqAKu0CyYBCoexCPOxGtdNl8b+0qq0vYP0eKABKMQYo3+Lhq436zoNyUhpCgX1mqTdGvfACFYeqLPIzwAU5rfNrNF2fGJJ2qLEp7PCB7in3ZvuPZpT1JPHgQNacY4oiHyNPJDVT7P9THbaaMRjVIHcpF5mTA/kU9kwHgFba3Q71Db0i+9reNzYh9zBiPa/6UAoQD28Sx/joxImawFo87MqAkygN82k8wOtNNhMEGqbJSniU3gB4THpGEvBZyiRulL7QKYd4imSZq63jmcENET/hLuiaQbqVcgLPop0KRlGQUAH5wvxjpvIlqSWHWy4j0FU900sUr6Tr8LKYI/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enYfyeJpZ/RJA/NFLjcN5VSRQHXdNAbaZsNwb8Vx9k8=;
 b=X/Tfg+BQrWovLAd2bKDEQWAlxsxBTjiRMzPgqbuzsoD04jJbMLbI7xFV7UaZEzxeqDa57SYBKARDie+4IRq+J0W4A4I0EHLt1P2exE+ZOSfNhjgsIOUUG7D8klvtL4ytnIhrLqXy3vUaSTBL66OLH5KTjSm3Shk9RsJ6aGlW12TP5O/EVS2qNKV2OpszrDHMdbNCOymQIUBhT7/FyPFXTa95VXaC17+TkE8Tkl7R+gZjWCKdF9htbh3m0LncCHUe0hBNTtPeOH8Eg5tNNzw3j3YF6uya+MRIFr4R5u3I6i/csOaQ23FkkCCSFtzy/hCJ+TIDsjr8cjVpxPLLdVJR3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enYfyeJpZ/RJA/NFLjcN5VSRQHXdNAbaZsNwb8Vx9k8=;
 b=m0lQczij3VLuu6hHQQKmS/BguEEvlysyGQGlnbSnl+7gCprVWNjrpREdwo6Aztup1grj9UUp8AqUhsfwVdf8l1dB7IiGaA+dR6qlewnuu00to68TosF2LvdieNDdKUceLGwSxmuIhD2KDh6K5AEkC/fT3epslXGGHBxKFISFLvU=
Received: from AS4P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::7)
 by GVXPR02MB10617.eurprd02.prod.outlook.com (2603:10a6:150:157::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 14:48:31 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::98) by AS4P251CA0011.outlook.office365.com
 (2603:10a6:20b:5d2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Wed, 13 Nov 2024 14:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:48:30 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:48:29 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:48:29 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:48:29 +0100
Received: from pc58073-2410 (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 76B0A162;
	Wed, 13 Nov 2024 15:48:29 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: <olani@axis.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 1/5] attr: Fix the ptest path to test-driver
In-Reply-To: <621a6b4ca59c8035218d47c2194d19aecc922ff6.camel@linuxfoundation.org>
	(Richard Purdie's message of "Tue, 12 Nov 2024 09:35:39 +0000")
Date: Wed, 13 Nov 2024 09:37:31 +0100
Organization: Axis Communications AB
Message-ID: <jwq4j4btdli.fsf@axis.com>
References: <20241111083541.291594-1-olani@axis.com>
	<20241111083541.291594-2-olani@axis.com>
	<621a6b4ca59c8035218d47c2194d19aecc922ff6.camel@linuxfoundation.org>
User-Agent: mu4e 1.12.2; emacs 31.0.50
X-TUID: femYq6Wsz8jF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|GVXPR02MB10617:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a10d46b-1e2f-4bde-a570-08dd03f23d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?anhGcHdvZ3F0RmhTTDZUdkk3K2Uya0tycFpodjBURmVoZThEQ2VwRDNUZ3lV?=
 =?utf-8?B?ZURsOWpXSC96eXFjVDl2OU5xT3BzWXFVSGU4QU5DeDBjMzB3ZTM3RUR0M05z?=
 =?utf-8?B?Q3VoNFJRNldkS3lRdjJYd0RvalR6UjF0NWxoSmpBS0lmMDhYUTlHaHlvdGxw?=
 =?utf-8?B?SEl4c2tGOUNDcGdRTlRhaVBVMkhGTmhLZnBSQW8wTEN6RVJ6Q3c3eDZYNFhM?=
 =?utf-8?B?VVUzSFdlL1RvdmZIZGdkVmI3MUg0NXhuV09HTTFOS1Nsajg0ZkM0R2ZMblJW?=
 =?utf-8?B?MEF1RXlUNUFNZ21nQW5USXIwSDB3WllPSUp2UlcvWFlkTVVVb09UUnFkWlhw?=
 =?utf-8?B?b2ZkMUdTS3ZIVlNVNWRUVXBZVytQT0tnZWRmbk1vRTlxclk0VWpPdVBIOFBX?=
 =?utf-8?B?R1VwZ0JQM29sdFNyQ2wvK0s1TkovRURuVCszZ1VnVkkvNU9KamhXQkVyMDB5?=
 =?utf-8?B?MWkxVkNJZjFrQU5RY0hQcGVsSG9sSUUxeWQ2WjhFbnFKVnBJd01vUWZRSHlv?=
 =?utf-8?B?Ung3ZmNjS1ZKRTc4Y3BCZnRYdWdHWG02VzgyRVdZbkp3MXk2VFArN0g3WUZN?=
 =?utf-8?B?MXlVRGtDZ2t6bmw4TU5kNmVxai9EZG9IQVhGVWRETDMyMEZVdW5xU2M5ZzVV?=
 =?utf-8?B?TkJqTHJpazFiMnJVYUd4dDFHb253TW5EckZZQnZQdTdTUU9hb1dIcDg2NHVh?=
 =?utf-8?B?eDVndXF5bXd0NE5wdDBXVUdBa2JKSHNXakJicTdlbkRpM3hDa05zVVJuaThR?=
 =?utf-8?B?YnF3ZU1sK1JkMW1SajAyWVpUZ2lyM2NFVjhlYlNPVzgvZTNzakVLcld2RkJP?=
 =?utf-8?B?b1QyS1FHdkt1WjQ1eklPQnV0RFkyaU1wM1ErcHFDQ2JvYno0dEVaeDNqWTlS?=
 =?utf-8?B?RS8rSzRDMjd1dWZNU1l0UFUxNmkxbHY1RDVacE9CeUJad0VmMWZNUjV4MVYv?=
 =?utf-8?B?M05rbUVLYzJyODg1T0pWSzZzU1p4QXB4TXU2WkhyN080K1lCYWd6TUp2bFpw?=
 =?utf-8?B?WXdIeEVzQ2c3ZlRUM3VyQzlpU2NsYnZtTk1XV2hEUVNMOEcwZmxaVFBaNDdE?=
 =?utf-8?B?SnhmV0NDVTNuc2tkbkw5bXphU1pZdjVGM050UTYvYUpTRmpMTnVsZ3ZNa3FH?=
 =?utf-8?B?V004cEM3bml1bHRWdlgyKzRRRG1WeWx0cGFYV3lSd3d1SWU1QURhc3llSXFn?=
 =?utf-8?B?ZFFuOFlRdSt3WVJnQ044WEczbjFyaVJQNDJPdDJRUzNOM3FWS3diYkpOcGFx?=
 =?utf-8?B?R0c5NEFwczNoenJ6WW1uVkhGbzlVVzEwVjlWL2ZTU2FObTRkWklCOEhHTWhL?=
 =?utf-8?B?eklrV3N5NGUwMklVenNKSXZCaGFaTWlqUm5pa09pUlFRTkpEc3hNakE2Mzl6?=
 =?utf-8?B?RW9vRjVoT2NOQUt2WW02SHllSDNQV0VOTXBqa0REN0ZxSTBYYUNEKzJQOUxX?=
 =?utf-8?B?UTlMc3NzazBqdGFLdVhkbVUreTBpb0hDZFlLcjMwY2tIRDJOUXI5dFp1ZFhG?=
 =?utf-8?B?Z1pqenRyRGVSR0tSNkpJRVE3ZVRYdkxSbTg1Z2hqZEVQdzhQaUllcWY5bTk4?=
 =?utf-8?B?ZjhXYnVSLzNvVktNRHVOTHE0Q1lGdzE1N3hSRVJaTnFaMEVQaWd2QUkyMktp?=
 =?utf-8?B?cjFITVZDUlA3ZENKTTRFQkdiVi9vR084anc4bkgyY3VNMVNLWnV1dVJZc09L?=
 =?utf-8?B?UzB5Q2JndnE0ckdXdi9GMThoU05LM3VzQXhFTEF6Y2RBbUtSdnM3TkRoRkZD?=
 =?utf-8?B?ajdrWlFPQ2JEeTlodFJUQU14aWVTOFpxdVRURnMyZ3lXbFlFVzVMeVJKT0dF?=
 =?utf-8?Q?xvBCLZx3WyWGKLHHM6+AF7m9l77mRt20eMwNg=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:48:30.0847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a10d46b-1e2f-4bde-a570-08dd03f23d41
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10617
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 14:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207112


On Tue, Nov 12 2024, Richard Purdie wrote:

> On Mon, 2024-11-11 at 09:35 +0100, Ola x Nilsson via lists.openembedded.o=
rg wrote:
>> From: Ola x Nilsson <olani@axis.com>
>>=20
>> Add a sed substitution for ${PTEST_PATH}/Makefile that transforms
>> =C2=A0TEST_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
>> to
>> =C2=A0TEST_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
>> which is where the test-driver script can be found when installed.
>>=20
>> There used to be an oe-core automake patch to do this, but it
>> broke non-ptest use of automake.
>>=20
>> Relates to [YOCTO #15635]
>> ---
>> =C2=A0meta/recipes-support/attr/attr.inc | 11 +++++++----
>> =C2=A01 file changed, 7 insertions(+), 4 deletions(-)
>
> Your patches are missing Signed-off-by lines. There is also a
> consistent ptest failure in acl:
>
> https://valkyrie.yoctoproject.org/#/builders/61/builds/366
> https://valkyrie.yoctoproject.org/#/builders/73/builds/366
> https://valkyrie.yoctoproject.org/#/builders/73/builds/367

I've found two recipes in meta-openembedded where ptests will fail if
the patch is removed.  Patches for those were just sent to openembedded-dev=
el.

I don't understand the issue with acl.  The error in the log looks just
like if the updated sed substitution was not done.  I have not been able
to reproduce this, but I'll keep trying.

I've resent the series as v2 with Signed-off-by lines, but no other
changes.=20=20


/Ola

