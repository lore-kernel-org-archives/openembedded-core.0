Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72274D3ABED
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:47:01 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.43])
 by mx.groups.io with SMTP id smtpd.web11.67340.1731350817643483258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rWwMYTQY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rWwMYTQY;
 spf=pass (domain: arm.com, ip: 40.107.247.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=f0JBZaKEo/mSXLq6v4N5smwSBB/TXE2kLbUJtdSqbjqHpEyBKKgi6NiKbwXPlCGURF4OcL4k4kM0H7gkY0k6WoSGi7OQCMMIKOPht08ZsfnEQJRk1AfjFBTY5H6+Zk6PvGc4x7v0HxGKn96e/0AIF8JPPeE2Wllj7hGyBWVW6SM5i8KiIPltnF7us+gN/hIFJ73euFId6SMGgSdtAJ2vRhlkkeKgKrvaMAL11Nj5pmcfHQ5j3OImAr86ws1TfslvJPPIn3Sn5gLdCa0aJVCN4zwneOe5z7WmfYd2QuAPk9Qo6LiiDi63AYc5kXPDXKRd+RLIXjnv3XP1wKpqFCDwCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KLTW7liD4ry2mNjcDyNyiHz32n27zYX7Daf3LEeDk4=;
 b=ZPNbII/oN2hPOWPOM5DfwtNW5zgUb8ELYw2PcJ0fJyIRD7RdtZsTa9CsVuAZZDaHfQEMzG9VrMzQieWs5iyPTUX2ojN5SlcIh0jC06bz6JoZGqtSF0V3jO3jHQ3hscknSsDoihNmK9PIPZGTc86Db7Hr1QAEZNXaWLtHVylvPBOlhwyk1CeazVxxUeAmmhZcMa66SftVLUQ2nK3qjncvljcjEPh5tpW84Z5O/ZVAdknPO6a7ZZT5Jh6cPqu2r57L6nEqyKsw3Pn7iGSJltwkph04xk5rejNwZNTMN0fKpeBQ3onUHf1rgNpHCOePibizFNBS8/P/SzYF3e7qSWtktg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KLTW7liD4ry2mNjcDyNyiHz32n27zYX7Daf3LEeDk4=;
 b=rWwMYTQYu3f8ExTz3rpQPJ/gi0M0x6+Oky9zu6diASgyr7y9HRLlPPaper1V6Q3ZhuDD6kplZj7FhZkO8JtQqscxJxfEVPDfKHH7ALfbEhRxilrej8ICxk0hVjtEymjBa2ORVdeNcJbhxSVcznK9vqxTgoUMDRnNa0GHEb+FJBE=
Received: from DUZPR01CA0093.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::21) by AM9PR08MB6148.eurprd08.prod.outlook.com
 (2603:10a6:20b:284::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 18:46:53 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::8c) by DUZPR01CA0093.outlook.office365.com
 (2603:10a6:10:4bb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 18:46:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 11 Nov 2024 18:46:52 +0000
Received: ("Tessian outbound aeb378f8fa33:v490"); Mon, 11 Nov 2024 18:46:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f1da5c971d2944e
X-TessianGatewayMetadata: NNNstYM1rtU+YM04K5IWA2qGXmhI3wR3cqANc5JYf+9bX4OLuU1STXKJLj7sjUaFoLju70db+jLGWuj/VUiGpApiueyUetpQ/X2CJDE0RuZ60Qw9uvn/+CmbRpCnTQwkqLumO43oEJ+gQDzD68khjYIEbhEMlsT9AbWh9q61FOI=
X-CR-MTA-TID: 64aa7808
Received: from Ld3ad539d35ba.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E45DA004-AC2F-4FF0-B904-D8DCE09BD5BD.1;
	Mon, 11 Nov 2024 18:46:46 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld3ad539d35ba.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 11 Nov 2024 18:46:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffvpBSFHwomq282PyJgaqWm53w08Qec/NUTo+Nc6nA3MeOs0tjn1GtH0vzpJ88cuZP5edoLEyNTXW7QxxOonwP3y3ti4TVeWHoKcQnWJimyn33eY6mDvaT0nGkNqvNKJDiUtByxpVVh21j8Cu1oJDsCxPXvsjycvhv2qyQD86Pd3m0uvvf+KoC8tKRGoAA87kOOQI9jNedDAT3/g27uiGqEfROMMGgKD/yv5SmQta9uU3HOlQMc6OyuvdLQY3sqV6oF3XE9fjTn3Qu2OcIyPFNHkPcd+I6KH42DYNvO6SU35YBJ8cFHLli+CKFxs4bN4HFzEtwtpQPX9Asyq9qqfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KLTW7liD4ry2mNjcDyNyiHz32n27zYX7Daf3LEeDk4=;
 b=Rm3oKoZmOHzmuVd1k6wnwZ9m5sZh9lls+WcmwzBU5mA14LMFo7dEnNdq8WCYtm+66qXdx0JGljiG/rRVRK/RbS8QZfvuITeyPyqquat3ioKY05O/VEXwM4vWYkzJIDJ4Lur6rXGUyDxVEHLJZHjbptqLTmD/CQBwv/JTWHBhsQkh2yMAXb5CmBdefxXfkKgA5fTH1JmWUJVKAfcBj3hHU+I632vgy8x/f3eIxUdW5ppaJ1U9B9hFlFZPFrzwZfcriWypYplnYyN/k0XrjH2kCRkdtMXkV5i6CI5GfoluOfxLI3T8uQIsoXomgnOjrLlswYsvX8JmxYTi/0IT7sPd2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KLTW7liD4ry2mNjcDyNyiHz32n27zYX7Daf3LEeDk4=;
 b=rWwMYTQYu3f8ExTz3rpQPJ/gi0M0x6+Oky9zu6diASgyr7y9HRLlPPaper1V6Q3ZhuDD6kplZj7FhZkO8JtQqscxJxfEVPDfKHH7ALfbEhRxilrej8ICxk0hVjtEymjBa2ORVdeNcJbhxSVcznK9vqxTgoUMDRnNa0GHEb+FJBE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB11184.eurprd08.prod.outlook.com (2603:10a6:150:1fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Mon, 11 Nov
 2024 18:46:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 18:46:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 9/9] systemd: don't use deprecated meson option
 values
Thread-Topic: [OE-core] [PATCH 9/9] systemd: don't use deprecated meson option
 values
Thread-Index: AQHbNGWnV13PQvEld0WcaYyN8MCo/bKyZqgAgAAElwA=
Date: Mon, 11 Nov 2024 18:46:41 +0000
Message-ID: <35F7BF55-B4F4-4DEA-8B0F-C7473B366158@arm.com>
References: <20241111181341.3296523-1-ross.burton@arm.com>
 <20241111181341.3296523-9-ross.burton@arm.com> <ZzJNLFKLeUVGKDoQ@nuoska>
In-Reply-To: <ZzJNLFKLeUVGKDoQ@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB11184:EE_|DB5PEPF00014B9B:EE_|AM9PR08MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d04b172-0929-43d9-ae35-08dd0281355e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?S1pyc0plT2kralB5QXhiRzh1NnF6Z0xRMXdmaWhScm5Cam9nRFVKR3ZDV1dk?=
 =?utf-8?B?a2U4SUhuSnNocGhkeTRETHQ3aERvbG1ZbjMwcG44SHlYcjF1MjMvL0E0b093?=
 =?utf-8?B?QlYzdm82ZnRxd1JqUVo5SzBxeUNQWFFWNzVmNzlFa0tKdGZHK2dzNzNwUnc5?=
 =?utf-8?B?Q1BwOTh3VEdhMEZHa2M4elMzUFFyLzJOMnQxeGF6dUg1YVdTemhtdFptMk9p?=
 =?utf-8?B?MGMycTZ6dFZtZVpwKzdjSWNYdFM1Q3R6Mit3K2I1QytaMldkUGJLMXZpRklw?=
 =?utf-8?B?ajdXc3lnMFowTjVaa2V1S1JVWEJFTFdmOXcwMnMzUXpkY2pwQXFlY3Yvd05v?=
 =?utf-8?B?aTVuaklwdGFQdUpuTHlDbXh0WkJlT1VQSWRSYXN5cmdFcTliZW5hQXozZC8z?=
 =?utf-8?B?ZlJDWFlQMTZwa3htaGZSUldBQmdPNkR2d2NDNHNhVVJmaXl6Zy9XQ3g5S293?=
 =?utf-8?B?RkdHZHZCNWhNZ0dtNTd1Yko1U3ZNNWIzV3lPdFVTcGNQekpHTDg5b2psRzBu?=
 =?utf-8?B?T0UwM210NVRrL0dMWThOejc2UVJuN0VpWE5aL3grWHFzUEY0cUh2RUNydGVI?=
 =?utf-8?B?SE44VlQzNDRROXllNTF3TC9yYmxMUGlteXpCZ3VWK0VVKzRSbVQzYXJ2RTlH?=
 =?utf-8?B?YVBGOE02dFVRMEtFYVZ0T3NNcTRJRXQrZk9pN3lLa0F1bm55VzRqaXRoRlZh?=
 =?utf-8?B?SWlaWUh5cUgzYzJVd3JoODE2QSt5RzV2RFpZek0wZjJpV1FWeDNBcHF3amdw?=
 =?utf-8?B?QUJOMC93YldTeDA2eGgrZ1piSHZrNWswZDVKUnFEdUlCUnA5V0NQRGtzdUk0?=
 =?utf-8?B?ZU1KUXJGcTJPM3pUakVCVW9qeCtrZVN6eFprQ3FyRVQ0WGhMem1LVUlWTXZQ?=
 =?utf-8?B?M3QrZWp2T1d4clhhT0NIM3hQODNMUWhNUytoZ2s4KzBGL2gzUkNYK00yZ0sx?=
 =?utf-8?B?dGRoUVd6K0M3RFR1blVSWU1abmZ0RHk0QUhESHd5TzByNlV5MEdCbWtZWWFR?=
 =?utf-8?B?L2xMQ0pGWGxJSExxUkU1eU5rME1VYVVJb2dEdlhudTBCbUdQcEZCMllDK1VS?=
 =?utf-8?B?S2FQazExelFvNWFYeVNTM0dyK0RRVzFqVHRQYm1TQzlFNlJuZmNKSW10WnVr?=
 =?utf-8?B?N1k0MFVKdjJWeUNNK2dKZUxmT0x1SDduRDlmdDUzdnAxdk1XN3BkcVJ4UFd4?=
 =?utf-8?B?MW5hb0ZuUVVwdnUrTmFFcDBLUjgyQVB4RlcwVHBYTHgxSHBSa0ZIMERVZDl0?=
 =?utf-8?B?L3IvTVBSSFZFOXJMNWw1cU5jYnBLdDhaVXpsWjBZRXprQVVhWmtETWluVzhs?=
 =?utf-8?B?QUJQL1NNam1GOE4xVnI4bUt3RVdKME9RY3g3Y0hGR0ZLZXdjSGViYXFFNUxC?=
 =?utf-8?B?N0VNZmI0aE83Yk1jaFVEU1BJVVZBUVpuZTlteXJ2K3M2ekhTU2pqb1lmVzRU?=
 =?utf-8?B?Rmx0ZkNJdk9zOHVYcXdwdUVsS0NvWVdLWUVjejYrL0pZMW1FZGVKdU10Z1lq?=
 =?utf-8?B?YjlSd3Jpb2xLRk4zZlM5VTJaY3ZYa0puT3ZoSEdhWkZ4Snp2SVV3S1Z4dXla?=
 =?utf-8?B?NVlHbUtQM2NCejNEclFtYWlBZFlzbkQyL0c0WloxT0RFOTcyaVpqTGlBNzF6?=
 =?utf-8?B?MzJtWlVGTDFrU3EwdGUyZGpJc0E3aVlsNzNncWErT1pvaVh3VG9uTDNTdFJ2?=
 =?utf-8?B?YmlYcHRnY1pwUklxU0NmcEg4SUpybU00cStLM1RlaGJ6Q1lZVFg4bUhzdmc2?=
 =?utf-8?B?ZzRMVHhIeDZMd3pSN2hlT1dzckxwbHlwd0ljYnZoTUZ4b1hESGZ4TVpOdHJ2?=
 =?utf-8?Q?5MzgH25xUjY8/YdB3WsR0x0+e/xZQQaOXQcpA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <87E41AAE5FDD1F4EABDFFBA91238DF23@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11184
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6d6ae227-a6a9-49ae-ca5f-08dd02812e84
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|14060799003|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Zk5uSnVyVGxWelRUQnV2VDNybnRJS0ZuaGdqZjkwZzdwWlgwT2UrUTBwKy85?=
 =?utf-8?B?OWdpNHhxcER0akhBZ1BadSs5aElhZEVPWjVXekcwL1l5QjJKOXlRRTk0WnlQ?=
 =?utf-8?B?Q0c3WVRRRlcyQ01RMmM1cEs3YmZ5Mi91S01IaWlOMStTckNheHJWZmNsSmp0?=
 =?utf-8?B?dnVDVjhOQThVSG9rNUFXQ2F4Qk8rWCtmUENNSHNMVFFiSlczTlNpeCtXZWJQ?=
 =?utf-8?B?WHVMYXRWZksvY05VYWRXM2NHYkt0K04wRU1VeUxnNHFIcmw1T3JSaURNcmRP?=
 =?utf-8?B?ZW5zNzhGdEc4WEVKVXAwOUJMemdtYUQwelIvLzFrVHlDZjVEOUdwZVMyMEFE?=
 =?utf-8?B?cCtiNHJ2bWRscEJ6SmozUXl3aFJSalc5Ly9YWGVaMEcxUHdsTkxsamNJZWha?=
 =?utf-8?B?UE1lTWRUWGNxbDNhUmhrWHJkTS9XVEttb0gyMFNGWWZOTUVFVHJaUnBwVFor?=
 =?utf-8?B?UWVyYk8wOVN0QzUySGxoYWdrTUhObGZrQjAvMnJzYlJIUy9JVkkvUUdiWDhV?=
 =?utf-8?B?L0FCY0EzUVZYdndnWWlGRWQ4ajJPK2NQS1hQc3Jydk9FK0dxNWN2WnllNkJ1?=
 =?utf-8?B?cDF5NW5YTWxRbUtHV0h4SFhHdVBWODNPL1A0blZybnJpR3hpSEpnY3g1TFNT?=
 =?utf-8?B?SVJOMWFXTU1QTDVLd0VacHp4UDVXNDBQVlh4VDVMdkZUQnlESVJIdFBBbXJo?=
 =?utf-8?B?M2NHR3FwdElXMXNEc3AvOXJOK1RmNmRrd3o5aSsyNXNNZnF2ZFJmMkRUaCtT?=
 =?utf-8?B?RC9XVElvcCtSblhFNFMvNm9KaVRXa3NqdDMvMUUxOCtIOVpaRVBocHN4YWs2?=
 =?utf-8?B?ckxyRzNWd08vWkw0NE9BMGFUcTl0NWNmSTF1MDlDeTdOU0VZRzBBV0hlOTVK?=
 =?utf-8?B?VlprVUNSWktPQlp5THNwWWg4TCtpMlJpK29OUWNnM2tJYUlzQUNEMUNBcVhY?=
 =?utf-8?B?aDJIK2p2WDcreklUVjJTSXJCWU1iSkpLdXNlclk1dnNLaEdpT3BtRVg1bnJh?=
 =?utf-8?B?TzZyaWgxWDJaMEdKTWViQ1N6WWdncENLYjAzajFEZTBNVWM2dm1WQzZoejIw?=
 =?utf-8?B?RHJJdEVLb21WUktLdE96ZVloNzdISVlZNTc3NWVHa1ZuZmZTYTVrb05KODE1?=
 =?utf-8?B?RlhaQlNlRnFCNmp3ek15cXU3VmdOeS9TNGpHSTByS0JjSEw5aGlROGQ4aDFv?=
 =?utf-8?B?anR5M2RsdlVLVFMxZEtMeDhubWVRcXpyMGdkMWNvSmd6M2RLQVRDY3JQelY3?=
 =?utf-8?B?cHlsT3hPTy9jMHdodjdCV09ncDVwMTQ3M3grWmx6Wlc4eTRYREk4OFpNNSsy?=
 =?utf-8?B?bnRuc2RiZkxNK3NxcFhXL0pNRUFRYlA5dHdvMGVlNE9GYzFRcTkyMlNYZWpF?=
 =?utf-8?B?U2NSTzNIY2VmK0haNHVEc0MrZHdnK0Q1TGVOSXhKRllENkVzM3NqdkJuS2Fh?=
 =?utf-8?B?TjVFcit3M1BxQUdGc2xYdDlsT0I5djRBUjBUbGJXeWJoUmw0SVdQMnJMRFNX?=
 =?utf-8?B?Y2tGQ3JCdTRpK2pmWjBtZ1VicjVpdWVQYnhXSHBlbzhHa2hIdWhVTjhOamhm?=
 =?utf-8?B?YlROaDd3U0Zqai9xZFptR0J0aHY3U3Jwc3c2Y2tid2NLc1czWGo5aDFZNDd4?=
 =?utf-8?B?bFRNcmFSVWROZHQ0VjRSN1poc3N1VFdoZWpZTENRdDdvQ1FWVHlTelI0ZWMw?=
 =?utf-8?B?cU15WTBRUkwzbUFINXNHQ2hQb2lzQ2NZSFpjT3ZndlJKNkQzaEtQOEpaeFRs?=
 =?utf-8?B?aVVJL2FwMTJMdFRBSkpsQnA4QldQd3hiOSs0NExtMnVaRkNUZVBGMEZSM2JN?=
 =?utf-8?B?SmNqbXZVSFVMN1laT21kRGFJcnkyK3UwclhMNWczZnpOemhXWk5GSGRyZ0dJ?=
 =?utf-8?B?cDBNMlNQTCtkNjZOWnpFdVJ6RGk0OVdFMnJVdDkzM2FPaWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(14060799003)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 18:46:52.5912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d04b172-0929-43d9-ae35-08dd0281355e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206978

T24gMTEgTm92IDIwMjQsIGF0IDE4OjMwLCBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5h
cm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gRG8geW91IGhhdmUgYSB0ZXN0IHRvIGNh
dGNoIHRoZXNlIGNhc2VzPyBXb3VsZCBiZSBuaWNlIHRvIHNlZQ0KPiB0aGF0IHRvby4NCg0KU29y
dCBvZuKApg0KDQokIGdyZXAgREVQUkVDQVRJT046XCBPcHRpb24gdG1wL3dvcmsvKi8qL3RlbXAv
bG9nLmRvX2NvbmZpZ3VyZQ0KDQpJbiBzeXN0ZW1kIHNwZWNpZmljYWxseSB0aGVyZeKAmXMgYSBm
ZXcgZGVwcmVjYXRpb24gb3B0aW9ucyB3ZeKAmXJlIHVzaW5nIGFueXdheSwgYnV0IHRoaXMgc3Rv
cHMgaXQgd2FybmluZyBhYm91dCBhbGwgdGhlIG9uZXMgd2Ugc2hvdWxkIGp1c3QgdXBkYXRlLg0K
DQpSb3Nz

