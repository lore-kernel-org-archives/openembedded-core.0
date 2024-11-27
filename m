Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C49D6ACEE
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 15:33:10 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.62])
 by mx.groups.io with SMTP id smtpd.web10.74364.1732721582883172777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 07:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=C3LvgU/n;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=C3LvgU/n;
 spf=pass (domain: arm.com, ip: 52.101.66.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Fant28yc/SV2ylGHCbU6hEr7a9HdB7jTNI3YFM/YrPIJtSKG5vFRYJfwnpfizRM9iX90jM4mLjWnIQjqiEO/4XiMKM9R2Mu5BIaXoGY6F4HEAs4Bns/9BrV4WJt3AKeSFgVIHFUaTtfnISX6D0Qt/4obp2lOm7vfatqYyXP15AezA7xQ9Rb3odsztB870dDnNzgcxWFQi01gapzIlvOyblJbAra/3hCyR7AlbTcmijy/SL+mRix5qvJwohQt4Dkg7rhoRX/oBTif1BJ3t8I6EbAhI9lZDvj7ch8niCx/oTM8X9iPGHQOW8sfz1HUgQCpwSFhv11LqRa0ORunh/Y50g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mC2YhZMhTnvX+hGXglxWFcSflsCDE55Uah7CO4hZUCw=;
 b=sjKQnJd50FwUB0PplSSt2UXIvrEycd9vOdVpwoXTh1S5WSlMo2trulXXxTWW8AI200dOvDvkq3LwDuKLO0tWeiFjffxzQ3iaOuBy3oNVPkPqlAVGliblV3tfZW6aTKKOBaPIt9bw2/+tlS6RgyheMybuWYjnha/RLateYN2kIuVojj5Ch5HahXFhANFatQyk0bR52No1MaMxZbaWuA3huxzGLKfhDh+wjJV+MHRZ4V/j8Dad/y4xmo0jwZHZ7EmUF9LoqFINIB3rQ/LdTximbNiJDFrkdx4X0PZUVxxrvfXslxId46cXFxH+yuNpr8EoOKLFuWmTfwqHJVT0+9Hl2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC2YhZMhTnvX+hGXglxWFcSflsCDE55Uah7CO4hZUCw=;
 b=C3LvgU/nL3CRNNHLFkaW8bFh6FhAgG4wc+VSpoZS++4VnpCVHcy4PoVvPU1CQ1B763FVtPfP8szXwHvsF5ex95h+1Jj+vXxxKQEt/4Bjh9eo/4Jyv7PBOrNb5cxw1HB+cISlevrV6sr2fktPVKeGim/FkUUvLv0KSXyPH9jiQrg=
Received: from AM0PR02CA0171.eurprd02.prod.outlook.com (2603:10a6:20b:28e::8)
 by DU0PR08MB9584.eurprd08.prod.outlook.com (2603:10a6:10:448::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 15:32:56 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::11) by AM0PR02CA0171.outlook.office365.com
 (2603:10a6:20b:28e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Wed,
 27 Nov 2024 15:32:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Wed, 27 Nov 2024 15:32:56 +0000
Received: ("Tessian outbound 4eb3d11e9250:v514"); Wed, 27 Nov 2024 15:32:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb2b8bb837342bd3
X-TessianGatewayMetadata: ek85C7ed7JwsWlz3qtJ9/wyBqp71CrrXUW6GLgwTRYd0gzSgVaP4g9uZ5PDp0wbfvl0h7gMaDA6cgPSMM0SMM11Nhpkg7sKYFbdJwawu47GYikabhI4qi+5A5gu/ROhISaH4atkdoa0z3zsxXA6bQ3LI74yDFyxHI6widI/feoc=
X-CR-MTA-TID: 64aa7808
Received: from L901384c5216b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 215F7612-72A5-4337-AFC4-E69BD6E3E770.1;
	Wed, 27 Nov 2024 15:32:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L901384c5216b.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 27 Nov 2024 15:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffjSkdTWDXTwf1RjYPD//4wU3Cukg1tzJOPbVQmFhryUv4yUqd5wFNqZ8KczW2qXnxIYnhQVF4JtkgzDlKtB2tNy9y8fJkFh2+tv2J0bE+8DAgGbpxoM65iN4fISiTrT/GZKLAPqKtSOXUw+wE3dqj5LnsIBiznQn1PiKrPofn/Fb2kJ5miStrJXWye+1LRBDw/kdNZLdHqpOhuiqY4OIliggRC3mary/44R3KBjiyzdxlS0Eowtawtf19EPTlqmLnFR5zr2eoSgp6RnCoG/Rz3mnNsbA5m7831b7rmdT1CAsbbUe0LYdGsoogd8v/BWxFfsIQfHyf81ciCGrIITcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mC2YhZMhTnvX+hGXglxWFcSflsCDE55Uah7CO4hZUCw=;
 b=BKYiQnUyWhKeN8sOgiDv//uTKM5n6D9yAP7Te8ZV+tX5dGl5P+XZxGsyK2GjmqLZdPVC+f5nu+1gDmAfoGqqIE6eB0sarxC9FrvJtkqz8hQHfyQlX/TuHaxLK6wljCqk9jqFsPYLrwdV7HFTIXr66vOB7umSi+6h1cH8LQG3ZDZu9+jG0UWUV/sCzlVu7LnK6vKG2PK6xX4PgUMFWD/rWEnoHs8lNCBaXQ/UnoNvlGinNdoq7vY8CJ9l7S4pCwFplRnyoHx3w1dCngTFxwoGN8CyRiphlfsyJckMHvs7djN42LFINExqQjHCJLe+EalT1PXxyj026yS7kx+E+TyvJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC2YhZMhTnvX+hGXglxWFcSflsCDE55Uah7CO4hZUCw=;
 b=C3LvgU/nL3CRNNHLFkaW8bFh6FhAgG4wc+VSpoZS++4VnpCVHcy4PoVvPU1CQ1B763FVtPfP8szXwHvsF5ex95h+1Jj+vXxxKQEt/4Bjh9eo/4Jyv7PBOrNb5cxw1HB+cISlevrV6sr2fktPVKeGim/FkUUvLv0KSXyPH9jiQrg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7441.eurprd08.prod.outlook.com (2603:10a6:102:2b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 15:32:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 15:32:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 04/16] libinput: upgrade 1.26.2 -> 1.27.0
Thread-Topic: [OE-core] [PATCH 04/16] libinput: upgrade 1.26.2 -> 1.27.0
Thread-Index: AQHbP6LeJ7wIocou10SKuJ8RNCWG+rLLQ+UA
Date: Wed, 27 Nov 2024 15:32:46 +0000
Message-ID: <6A5C53C8-FCEA-425F-B09E-207D3A366D13@arm.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
 <1732584602-4785-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1732584602-4785-4-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7441:EE_|AMS1EPF00000045:EE_|DU0PR08MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbb47ac-88c6-4b22-8d2e-08dd0ef8c445
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SUdrNDNjcXdab0U2N1lWTEdXajRGT240bVhUd1IyR1g0MlBESnJwRUJJYlBk?=
 =?utf-8?B?RjM1TnBuSnVXbjFETjJmZDZDRDdjbjUxZzgzWHVKMm9uMXlWZXVaUjZoMjdo?=
 =?utf-8?B?ckF5cG1OdEhBZVZHdXFMcmlxVTloYURucmJZcFdOd3ZwWGtHZlA5NGhoNDcz?=
 =?utf-8?B?NnBsMlpnc3IwWlNzVmlsaVpJUUduSVEyY1RNd1ZWczRwbjExQVJ6cWs2NXVO?=
 =?utf-8?B?cGZRVFhrbVFHeVhoMlQ4c0QvRThmRDhOcjhSQ3drM1Y2b3d3L2NteFZvdGFq?=
 =?utf-8?B?VmJoaWVCTU9JbjlIOUtXRCtPN1VuWHZFS2RKREN6NU1oVCsxS0tnTGR1YUow?=
 =?utf-8?B?M0VYSTRpcHN2TlFYZGZ6M2FVWWlSRDZqcy9XbkZmOU5ORU1rMWRQZHV0VTBU?=
 =?utf-8?B?QWpMYzIzQURXYktYRGRRZURtcElNZ0FObFNKMTRjWFZLQ25kaVcxT1NTVDhW?=
 =?utf-8?B?NjNuaG13dHVnZ0duUjNiNDhxZkNHb2VzWmljQmkxUmhXUVNiNDJXVjU0OUZG?=
 =?utf-8?B?N0duM1grQUQ1VjlsUStmRzNBSC85QmJId3B5c0ZMd0YyOXFjelp4V1ZLZ1Rk?=
 =?utf-8?B?MmJ2bkMwakUveUdQQkVlRWNPaFdjbE9WVWh3N1VsSkxFbzY1bXdiV09NS0ZB?=
 =?utf-8?B?UmpQVENkajc0bXd4NnZteStpcHJwMW8raHppQ0NRZ3EzTldlWWpKRURmK2F1?=
 =?utf-8?B?QWY1eFpVK0taVnFyMU5BSnBQbVNqcHRDdXI0eGorMVRheFNHQ3B1alRpbUow?=
 =?utf-8?B?cktFUEtQcHp5ZEpXYTVxUjcwbkVsWmtSSGFzSXc0eDFwMTFJNmJmTHE3ZDRL?=
 =?utf-8?B?VStWeC9oWm1hVFRTQ3FDeWo0VDV2UkJTTWJRYU1aVkhUTGpjNzVic2Yvd3VQ?=
 =?utf-8?B?di80K2FVTXB2QkJ2MTlsWHB5eVhFbU5raGxaNTc4amZNRi9QRE9jeU5LSTdp?=
 =?utf-8?B?K3JVc1BjM1FuVTBNeG1iZEY4TGE4dTg4ODZvTWJHeCtCVzdkWWM5eDB5aVYv?=
 =?utf-8?B?R0tUQ0RkeGNzd2ZBR0hHL3QrZU5NSWQ1b1ZneGhlN1hzTjRUS21BL2RsVXJX?=
 =?utf-8?B?SkdnbjlKNWpuWWkvRTJGdTEwcHY1U1FIcnZZOGdDV0FjdXBtT0lqZkVQZG5U?=
 =?utf-8?B?dWs2aHFnN0tJUDE5Q2J4QTdqUXNXOUdsWVN3ZmI1ZENnQTZBVGJnV2hqUGVE?=
 =?utf-8?B?NUVPajU3L05IVE1GN1ZnUHVJU1Qwdm4zZDBZcUpXL2N4VG1JUXI0WjM4UWxz?=
 =?utf-8?B?b3ZEMlR3N2NVVWNTMm4vRFh0TkFhU2NnKzFDR0ZkeVZlYVV3dUR6N0w5RUJ2?=
 =?utf-8?B?VFFudTF0VWVZcGhwV2prMDlGWC82cHBnR1V4R05zaEdtQnlhM1ZYU09wUEh2?=
 =?utf-8?B?THhtdGNNaFd5Zi9MQTIrN1BhUTg5MnR2RStsdWM3Y0liUTNCaS9INFpWNzdr?=
 =?utf-8?B?eC80OTFZS3ZzTWg1d2hlK0dObmpIZDlCRGZBbkxBaVZveUZPUXUxMzhYbmdD?=
 =?utf-8?B?ODFBUjZWSHhCQVQvd0haTDFwaGhOZW5iL3o4ek5OMmtRaGdRV2hmRGlmdDZU?=
 =?utf-8?B?V3BHd1VvdytYeHZ2djRUMGM2WDlaSXVPS21wRHBadVdreDhHbkNvQzZoR3Mv?=
 =?utf-8?B?RENOU2RqVTBQWXh4d1FJckVsTk11Z3NMbFBYQVJNUGF3NmpTcGRkQ09qM0Ev?=
 =?utf-8?B?Rmx3MUdvbm55WGRsRXQxbU83NFE2NHNuN2FHRlM1QyswRkhEdlFlb04vb2tZ?=
 =?utf-8?B?Y3VEdjkrdzJWYm9YTStFOUg1ZHI4U1VCV2NiTGJTTUhqelZvSnRhbDV6MHZm?=
 =?utf-8?Q?96AJgSpiaUae/8SJhY5W3mBfBX2b8ELt/W49g=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7A951B438931148B550EB78730BAAC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7441
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f59b6fcf-2520-4225-8d05-08dd0ef8be6a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TW1zd1ZjdFFRUnlMTTlIMllqUVAxQmYvTTZsNThWWis0TXNrRit3S3NaR04r?=
 =?utf-8?B?ck9ITWQxVm9xZytUMUJqSGI2WXdjR2FxbmcxSUNGeFJEN1UyM3lMbU1NTFRq?=
 =?utf-8?B?S0d5MGVFNnRJbVdLa1BtK1B6dGpRdmtSL0VvSk5nT3lKWnQ0SGsrbjFSYWl6?=
 =?utf-8?B?NlZ4UEVtSm1taitGSERuZUF3UVFlbVl0QzNCSWlFc2dZUVFYbklvVlRIejJl?=
 =?utf-8?B?ZC9TemNpMzNEc1BSZUk1SnVCVFdUV3pkTkZqUVZGSlE5ZW52bHQrSGk2dGw0?=
 =?utf-8?B?N1BjSjlJM3E4V1I0aHFpaGN0aVpSYVhQckJwMTJZbFlGUWZOckZSaHpMZWxZ?=
 =?utf-8?B?UmQ4UDI4ZjRFc2VRV0ZaQnVDNTBvRnBZbFFTSk9tYTgydXNLVmdqVUw1dXB6?=
 =?utf-8?B?aVFMWHo0US9HeXBNMGJ4NUQyVFhOTW5Yd3pWM2N0Smk2RmkvQ3kyMU5kS3JY?=
 =?utf-8?B?U0tOWEdSYXVodHBrZldacVBIb0c0cTNXQWdUbTlzcXVVYnFJc1JZNnJJVjJ4?=
 =?utf-8?B?MXRrOW9OQ0JFR291YlpjVkpkcmJDZ1hsaXg1cEhCZUZtbWQyWWZhbUJmWG1k?=
 =?utf-8?B?RS94czRSMUZId2RWb2tQRWo0TUZReVhCUkpUT292aGNRbVFkVTVhVE1JVFZk?=
 =?utf-8?B?NkpxSW81MXNTYnE0SUdoUFYwMjRkSVFYcjFoOVZzZTJIOWRvRlpodnlHUERi?=
 =?utf-8?B?bDBvN0pLdWJBRVROaExQTHNNK0tJcVlwa1JuSW9lMkdCWEYrdUtOeHdRVGxE?=
 =?utf-8?B?dHoxZGhDUi9IYzFXcmpPWm4wTkR6bGVuaGpHQzdkU2Q0M2NMN1V0dG0wRGhs?=
 =?utf-8?B?aFY4T2w0UkkrVFcrNUlTSjhXeVVaV08wQzNCNElmRjJabURHTWZFV2RUYzZT?=
 =?utf-8?B?Qm9rVXBpdWF2N1QzUWNHS3FCWDRsNUFUakNEUVVJN2hhd25MYS9KNkIxTFFE?=
 =?utf-8?B?Q2piU0xEb3FZcysyTnZ3bnVqNnQrdXJpS2NJNyttcll1T245c3cyNWxQWGFG?=
 =?utf-8?B?NWtTdmZVMEZwVWFLUTdYNTRHRjFYbEtES3BGVWFGMm5tQVcxZzBTQXBRWmZQ?=
 =?utf-8?B?UFNucThSL244QUdZUzJyT3hEWTlDVGtwSTBtMm1kaW41RVdTWmduYWk1VVU1?=
 =?utf-8?B?dGxSQmhKNFJSTm1WVEpycjVXQmJxWjJlcm1aakxJb0Q3eERSSG9nVW55RkNs?=
 =?utf-8?B?TGMvTkhyWmx2b1BNVWVJOU14Tm5VaDJCUnBINCt6NWc3R083L3J1RlhESVdE?=
 =?utf-8?B?Ym1tOXltUHNyd0czS01nUUdEMTNzbm4wd3ZRYXhldm05RHVOUnFvNFhzVTRJ?=
 =?utf-8?B?OXBhbjNLcW5BN2tQZ2FIc3R3WERiM1p4T1dIeDR5NVh5UnZSSHc5cUZBQkdT?=
 =?utf-8?B?ZU9BREY2UTErMk9zU2VtRVB4YWxlUk5WaWphd09scnhhR1Vyd3BnTStEUktO?=
 =?utf-8?B?RmFVOW4vYjRVL2tsRm15VTIvaHBJdVU2TjY3WCtnakhpUFVoNlZVa0tPSXRG?=
 =?utf-8?B?Zk1vMjJRd0N6NDZTaFo1eWpJZXptL2p0ZUlGbUl6bzZpQm43S28xb1JNaktN?=
 =?utf-8?B?RkYycXltVVBaUG4ybGVXdlc5TzhueFNzK09DY1JTckdtejFEZ3p0OWxjNC9Z?=
 =?utf-8?B?YlpLdGMybDJRNmZQLzg0WFR4UHl1UWpqeEc0amx1TWI4WXRJUndkVmNqUkdE?=
 =?utf-8?B?TnJrYzBrNG1kU2JCaGFnNUFOLzdFOFQwYWNxR05wa0k4Qkhnb25HYU84NHEz?=
 =?utf-8?B?VExBa1RzbGtRbmFSVTJyOERKZFpVMHRBejVBL3JzRlZEdUp3ajNKOSttNkE1?=
 =?utf-8?B?dzU4dENaWkx1d2h5N2IyUGVud1FuRDc4eEZiZFZJOHhkd2VWZGV0dGpydWpj?=
 =?utf-8?B?OHp2bWhOalVzYjI5b29KT05QdG1SaVlvYnNDZGVwaGVLelE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 15:32:56.3580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbb47ac-88c6-4b22-8d2e-08dd0ef8c445
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9584
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 15:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207935

T24gMjYgTm92IDIwMjQsIGF0IDAxOjI5LCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4g
LVNSQ1JFViA9ICIzNDAyZjM4MDAxOWRjNGY4ODJlMWQ4NjI3MDI5NjA3YWNhM2Y0YmU2Ig0KPiAr
U1JDUkVWID0g4oCcNjRkMWYxOThmYjI3NjRkZmI4NTJhMTliZWNhZjZmN2YwOTdmY2UyYyINCg0K
DQpJZiB5b3UgcmFuIGJ1aWxkaGlzdG9yeS1kaWZmOg0KDQpwYWNrYWdlcy9jb3J0ZXhhNTctcG9r
eS1saW51eC9saWJpbnB1dC9saWJpbnB1dC1kYmc6IFJSRUNPTU1FTkRTOiByZW1vdmVkICJsaWJj
aGVjay1kYmciDQpwYWNrYWdlcy9jb3J0ZXhhNTctcG9reS1saW51eC9saWJpbnB1dC9saWJpbnB1
dC1wdGVzdDogUkRFUEVORFM6IHJlbW92ZWQgYWxsIGl0ZW1zICJsaWJjaGVjayAoWyc+PSAwLjE1
LjInXSkiDQpwYWNrYWdlcy9jb3J0ZXhhNTctcG9reS1saW51eC9saWJpbnB1dC9saWJpbnB1dDog
UkRFUEVORFM6IHJlbW92ZWQgYWxsIGl0ZW1zICJsaWJjaGVjayAoWyc+PSAwLjE1LjInXSnigJ0N
Cg0KV2hpY2ggaXMgaW4gdGhlIHJlbGVhc2Ugbm90ZXMgKGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9saWJpbnB1dC9saWJpbnB1dC8tL3JlbGVhc2VzKToNCg0KIkZvciBwYWNrYWdlcnM6
IHRoZSBjaGVjayBkZXBlbmRlbmN5IGlzIG5vdyBvcHRpb25hbCwgYWxtb3N0IGFsbCB0ZXN0cyBj
YW4gbm93IHJ1biB3aXRob3V0IGl0LuKAnQ0KDQpMb29rIGF0IHRoZSBjb2RlLCB0aGUgb25seSB0
ZXN0IHRoYXQgbmVlZHMgY2hlY2sgaXMgdGhlIHRlc3QgY2FzZSBmb3IgdGhlIG5ldyB0ZXN0IHJ1
bm5lciwgd2hpY2ggaXNu4oCZdCBpbnN0YWxsZWQ6DQoNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9saWJpbnB1dC9saWJpbnB1dC8tL2Jsb2IvbWFpbi9tZXNvbi5idWlsZD9yZWZfdHlw
ZT1oZWFkcyNMODc3DQoNClNvIHJlbW92ZSB0aGUgbGliY2hlY2sgREVQRU5EUy4NCg0KUm9zcw==

