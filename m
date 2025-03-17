Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E52C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:44:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web11.51393.1742215441698174220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Jt4pRydn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Jt4pRydn;
 spf=pass (domain: arm.com, ip: 40.107.20.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zNa4hFesjFG2hXnlJHl5qAwAyIDjQRs3GmcpNNK35PbogkHUpIJlE206VHVrTquyDAwP6G5xj57RTAwIbmkeEL40eff5daLVTWbHKNqAvo9tvbCVFID9W/ulASvqYLYK8ivVrZM8+gaPke91LJeWZr7SfSFphhRgKbYjgaSa3K0OxkMLVPy6r9Dt4zyMUoFyAEVl1TEaot4+vmg6IhZzk33oMclj26Gb9Hv6GPiSHHnjeEXcPC9ImsM+/eMXwQFnEGsRGv2TRvvKWM3WqhvLvd4CtJX/KwZM/4JL8DKKZgU7z6nJ37gJ9T8RdB9EH6k9zM7gZ5Z4yup6nc/Fp7Ev6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSYCEt9FjE+ZEngDDB/8QZNLQaLRm6SJnYXCczhjPYE=;
 b=FJ0qFPrzeF2ZmMZ2wPbT7G+rvUfOwDDmgeaYbO18ASYKXp2Be783rgPeVuURlrgx7j7c1a7XuVBQdkTSSy36zayOfy3Zs1DvbW+wWmYOAQV4IEZ/+HSEwSFX7JJwZ5dx2QHrAHQjicKN3o9p1DfihkQE6qGcu7rji8Akuv20ML5l9W61MjUF76KRl9um0LVgUII0vnZj+AHHkQ8VJcKKQ8QAI0+x+smmIDK9VEtLO0xmcctfjhXteypRuj9tAO0ux0vJUzvx3/wZFPIdDY4a3C/CwaPVIxlBQBKjHHi9Up4ehLeDpQLMf5m/wXN9X4TKPa4SypuLFdCmL9FObECK/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSYCEt9FjE+ZEngDDB/8QZNLQaLRm6SJnYXCczhjPYE=;
 b=Jt4pRydnhvhrB/MTzAKDKaOhnEia08QAR5etcoDNhvlGgNebjJdnQnXf29rVIym7EX5l41gF4fn3GRqKsR5PHW6DAyZufDDiiKYRzOF/HKZ6w3qa4WAZCIC27QQdnJAuIsQTu/qj1bmQuP9odf3lKorlol0ozMpg4rOyMcSsZEI=
Received: from AS4P190CA0033.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::13)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 12:43:55 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::d7) by AS4P190CA0033.outlook.office365.com
 (2603:10a6:20b:5d1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 12:43:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 17 Mar 2025 12:43:55 +0000
Received: ("Tessian outbound 95d47b41fce3:v594"); Mon, 17 Mar 2025 12:43:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74461d111a42798d
X-TessianGatewayMetadata: sB9kFzFHXukZjAOLxLjxzilhC8cIN2B5Iu/81vANuuWZV+k7C4UDntg2IdfbmoN3cVJezQVJ5nxZVA0+UeZa+QWAwHZhnTyE9GITAUeJ4EDE85v69JhnA6Lpwc0fX7JbanCM8QGdZhon4Vq4cpijJzgr8WiRwaMElg2tzC2WuEQ=
X-CR-MTA-TID: 64aa7808
Received: from L6ff936cb5fe8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5ABBD999-F241-41BA-945A-FCCF3A7E0804.1;
	Mon, 17 Mar 2025 12:43:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L6ff936cb5fe8.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 17 Mar 2025 12:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCin8i1OhtvlAexXEJIINuLr9nvi0+bJRVxtO2TB1ihDW4EWqVMFanC526OJ7BzjMmpT31pjh0G/HLIXCMF4ClErzGocP5W8SXADMlH1StKFU1cuO0U/xU5kdms7KKq8bgfhj4QOmIuD2ln5dp2dlbB2EVSKE4cJ9OOjoGIWttXE1pDYSQq898tF9W7vqfRRH7h8GGsicGeg0KnsS+PiHRiZDufyl8lxIbpuzAJlsHaLJeB93Ylvyyga99Ji4fqtq0+qIGw+pAS7y4UzfVxsZCJYNwr0z8Nlu+cz/87ptP8WN5iT1mShb0Fgd4iD/T6Il0zo8UELLOu+Us//K3QO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSYCEt9FjE+ZEngDDB/8QZNLQaLRm6SJnYXCczhjPYE=;
 b=GZY4p2UuqT3mARZ+SKUaFJLMlUe1lu3Dzhau7ZzPLylRa96ewUpCvLu7bgr9UiDfyv9ji1IO3H2idI4aT67LKeGmgkDHWOBPhEfyhhbG6TYwr4Jlk4o/Dtyy7cJtJGZdYB+Eu6Zx7pOGr3WfNMnlia7XNYIQ+60dOH4qnV3UI+esMkZqpkJqnWsnjYG2pfecY/mijy9s+DkmvXdvbdjbC2wz28aBG63zmnqLU8s6o+yjsIjvaqm3M6rjhnScADeXgW4fonKi6uP2/6tyD7pMqGjzpK76LQclO6FZdXfI30zgDy8/j3od7KwCrIYo1te5XeZUs6ir5YmBoiZTIgHhZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSYCEt9FjE+ZEngDDB/8QZNLQaLRm6SJnYXCczhjPYE=;
 b=Jt4pRydnhvhrB/MTzAKDKaOhnEia08QAR5etcoDNhvlGgNebjJdnQnXf29rVIym7EX5l41gF4fn3GRqKsR5PHW6DAyZufDDiiKYRzOF/HKZ6w3qa4WAZCIC27QQdnJAuIsQTu/qj1bmQuP9odf3lKorlol0ozMpg4rOyMcSsZEI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6455.eurprd08.prod.outlook.com (2603:10a6:20b:338::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 12:43:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 12:43:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] docbook-xml-dtd4: correct license name
Thread-Topic: [OE-core] [PATCH] docbook-xml-dtd4: correct license name
Thread-Index: AQHbkYvl9oTqkcPiaUiouVrQIUOyZrN3UU4A
Date: Mon, 17 Mar 2025 12:43:47 +0000
Message-ID: <892349E8-2E4C-4C7E-9E14-0034B85CDD14@arm.com>
References: <20250310071234.2370628-1-hongxu.jia@windriver.com>
In-Reply-To: <20250310071234.2370628-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6455:EE_|AM4PEPF00027A5D:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d70a0e-bcbc-4641-c8d7-08dd65516157
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?d0lKd24wT3lpdi9rZUJ4ejhHK2w4aHRLYUV0ZW1tdFhsMkljSmxCU200V2lS?=
 =?utf-8?B?aE8rdVhmUmVrUDBwT2xvSmRWc0ZGS0xTZXpsTTFjckNQakZTSHM4aDhITFdt?=
 =?utf-8?B?b3JYVmZSNGxuSWtOUmZlSkRpSGRoelI0RThIVHdWMVF6VGZ0UkdDOWZMZWlr?=
 =?utf-8?B?d2I2R2tDRzB0ckdZNFBuM3lWT0t2RFlHR0RNczRiTVZKSFd5VENIakdMTjNr?=
 =?utf-8?B?ckdTQkR1c0xZaVZRYlZ2MzdIb0tHa3QrNXlRc2l6anp1TXZGZCtkM2xPTGRj?=
 =?utf-8?B?MXVBZHpOY0FFdG04UHVzVXhRRTJqOFpVNzdtOWF2Rlk0WkYwb3FkSlBQOEhv?=
 =?utf-8?B?elBqeVBZTUlSeGVCZXEwd3VlYUVsVFNzYzFxT09KeHVCY2UrejArVTNzaXBZ?=
 =?utf-8?B?eEdjRThYTVdaRmhlcENxRE1YSTJVTEVCNE1jbEVleUZEMWE1bGxWS2hWVnQ5?=
 =?utf-8?B?ZDZ6bkJPQndDYTdkTzFuNXlSWEZVcVR0RWpaL2pybUxLY3dPMjJObkhUZ25E?=
 =?utf-8?B?bXR0MWNrM0MxSkxFM0IwWm9vTlF3S1VrODJFMHdUeWp5K1dsYktsQXNITXFp?=
 =?utf-8?B?QlJZc0RFM0hnV0U3bkZnTnladytFRS9UeGNRY1JoZ3BWclZmRVk3c3hRNnM3?=
 =?utf-8?B?bVpZemEzSE9UUDRXUVI5NTFFSUJQSnZmOW5Fd3dDR1lvNWVWSFZGV3p3UnRj?=
 =?utf-8?B?ZC9wdEJocDFBNGlJV0pvdzhGVlpzZE13NDZndHB3ZUhXRERCZERTa0pRVUNn?=
 =?utf-8?B?NFFBY0hkQWVvQktaZXQrZVNuaENRTUNCcjhYNGRWU2N2cEcyVThaYXUvNUoy?=
 =?utf-8?B?Ym5PaHR4Nkl0S3h2alo0RGZ4V21NK1g1dlV6VlhtejVkY2gzUTNXWExCRTFT?=
 =?utf-8?B?aFFIN1Jkcmx2R3ZQSHhYUzdjQTZrdHdRRnZ2bFJOalZtbEwxbEJUOTQ4ZGJ6?=
 =?utf-8?B?SlRORHY3WGdQTnNqeUliYk5vOE9sNEQ3a3RxdVlJSG5uNEZpY2ZJaHR0TkQx?=
 =?utf-8?B?NzQvMlpjbW1XU25Hc012Q3g4Rkgyc00wM2x5RkErK3pOalBVbXJhRkdURUJV?=
 =?utf-8?B?RmdudHQ5S2FJbWRvT29BaEFJQ0UwTzJlR3FyWTRPZ2VTMUtia1Uzc1BKTDVX?=
 =?utf-8?B?dmVuckpNeXQ2MVZqaW9JeFVPa0R5cEwzVTFkQ2oxMTFVdjdpTkhjOTdrL0tj?=
 =?utf-8?B?bTUycnlOc0JkMkJ5d2dGaU00ME1UVVVKK0pPVWwvUmhwcFhtdmgxbnVOU244?=
 =?utf-8?B?TGJrZUo2V2MvSCtiZUx6ejZWSDlXZVV0ME94WG1YSHVJYmRGUStob3UveVYz?=
 =?utf-8?B?anJGdzFoOU9wM0V6N0RnNDlOV2xCUkgwYnJTWEtudVFCTUFUZnB2ekRMUWZu?=
 =?utf-8?B?QjZ5U0k0VElFZGxaS0VuNDYrNGxpcXREY0lBY1hvYkZXb0RFUG1sRHFVMmtn?=
 =?utf-8?B?cEd2TlJiMXBaN2ovZjM0bC9ncFlGV2FoUEpHSW9GRS8wWjNHdU04aENWei93?=
 =?utf-8?B?b0xpSXgzY21uRUdralNTZDd5YUxNazJvUGhmWE5qM2hROUFaUXdLUlFZeEl4?=
 =?utf-8?B?MHdwUElBNjhVajdLb1FWdTJQWis2N1BRSlhkSmgzQ0pzSlN0WVRPR2RhRWgr?=
 =?utf-8?B?TU5ha2lGa0dFV0FYYUFhZkVnSHk5dHJsaUJaOVVqelFBZWRZbitwQmNGekJC?=
 =?utf-8?B?dGhGWDIzVm9BSGVuTE0rQUd5YUZEd0s0WGI4NVRGL2NkdjVGYUNnQjhQOXpG?=
 =?utf-8?B?SkZoNTVzYzhuQXNISmRxMHFnQkdvRUNtVURudElaR3lFSWxpM1B6VTI5ZjM5?=
 =?utf-8?B?UVA2Snp6Nko0TlJzM21jZEVydUtjcXNRNU55VWcvSGhXSkZQZzRoWWs0Z09a?=
 =?utf-8?B?UzlFS1JTd0FzNmU2RzNESXNRUG1yRDc2RGhvcG9wbHQyeEdkTkx3ZVN6UnN2?=
 =?utf-8?Q?5RZOKEFxA6pytQpDodhw7fbc/TVWxycQ?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA8F8AE3C99695429E331F5D11B17A1B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6455
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1395d6a2-0bd2-45a2-4c0d-08dd65515c6b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|35042699022|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NFpCdmhsOFhmSittbHVUVGhWcmZkcVo0d1hRUEx3eENlZStydG9yV21RZ0Nt?=
 =?utf-8?B?VmVPZGljVXFZSVd6WlF3RXloYXQvSXdEd0tyaVF2ZWxRbFprMS9VNVpSaWIz?=
 =?utf-8?B?UlJPN2s0Ym5sbjJTN3FQakxjd1FRM2Zudmp3bGRiRWZ5NHU2Y2t6WVczWlg0?=
 =?utf-8?B?anZJNDZzMDVLY1J3Sm12NHNlN24ycHFUMnlLSGJlUDl5THNRZW5FWTZab25S?=
 =?utf-8?B?TVFva1lUVHNrRittYkxQWE52ektVejNPWWtlQWZwdXF4WkR2VVgrYTRZTHIr?=
 =?utf-8?B?MUJjeTR3MzFBY3l3OG1yTmFKUGxqZERWTXZxeUVwZ1VVNllCVEZ5V3BxVit1?=
 =?utf-8?B?MUMxZHVsWVgzNG12aXBCbm45L3JUWE9uNVZ3K1RHSVZFYTRWaFJCc2dzaS96?=
 =?utf-8?B?dkkxTlFFQWhDSVFhZEJkUEZ6Nnh1TXIzazBJVW5DVGV5QnJQZmJQdFM0Ym92?=
 =?utf-8?B?LzZnZ255L1gxODRjQlVUb2l1VFVITTMzRmg5bE0wMDBvbmM3RzlUWmRIR0k3?=
 =?utf-8?B?eE1aOWF5S01odi9YVWFMMG1nQitJbzVQRzVQSGVjZFhrelR0ZUp3K0pjZENZ?=
 =?utf-8?B?bXZGd2NDYnJKM3NXRmZuNUxXbHEyUVRtNmNDb3QxTUd0TUwyNHFZOHJ6MDA1?=
 =?utf-8?B?ZER0Sml2YjJyeiswUVNhejdYNi80SDRvcGM3Qk5TVlRrVkpVMmtWRFE0cEkx?=
 =?utf-8?B?KzdnTHpsM0d5SE4yYmVuV29uV2NaMGRJQkhRbWxZT0tmV3NyalF4RFVXS0Fh?=
 =?utf-8?B?MXluODJPblMxQjI4TTg3OG5XWlFoYXAybXZiREVZSWxuVDJrZy93VldSQmNX?=
 =?utf-8?B?OUpSRlU3b2ZhUHMyUVJxTjU0MUc1Wi9Vckpmbkc2OHRSSXpQQzBqa3lnMk1a?=
 =?utf-8?B?MVNYTHZqTnVWQmkrQWFDYU9QaXBGWWFYK0laSHgrNVhoVlNCcGUyeEEwbWFt?=
 =?utf-8?B?T1dXa054V3lLSVljUlJmTVhMZ2MrWnA4Q09FOVdRNGo3YnFsU3dhb2NtVUs3?=
 =?utf-8?B?V2pneXhRM0dCeXRPMzFPY3R3QnZ1V3JtWjI5VGZqY2VGMTYwUVNua21xdXJ6?=
 =?utf-8?B?WFlpb0czbktUV2IyZlZGUDRiZHU3ZkRxMDBqeU5FUzhpOURLSlYwOEY5QlpL?=
 =?utf-8?B?QzVORStHUTczODl1ZVhSRmpDbnU5WDZhczFXNk1hMEo5emxnZkZ0SW1nZitJ?=
 =?utf-8?B?c3p4RU9VT3R0RHk0bDVXL25zdW4xRk1NeE1vMkgrRG1YU2NBMWFjSG9PUG9a?=
 =?utf-8?B?bUFKZ2lKVnBoTWpLVlc3SDRCSUtRMWs5YWVYNDZIL1JLU1QvTENvajRpdW8y?=
 =?utf-8?B?ZHd5QWNuOWJIRnFqcjg4V2o3cEhiYW5PVFd4UDZxK2wyU2pDOWxqQkFkWTRv?=
 =?utf-8?B?d3VEU1F0ZG1IWUZ1S0V1WDdXVUJ5MFp6Qmk1c0ZZbGtGWVIzeW52VnBHeUcy?=
 =?utf-8?B?UnA4MEFLek9USFdqeE1sb3o3VFBBQ28rQ0tzVENWOE5WbDN6aCt3Vzd2NDRw?=
 =?utf-8?B?NGNLWTl4bjE3M1BTbU9iMEtpRTNCQ1Vtd3lpdTZPKy9oTUZxem14ZHhOZVor?=
 =?utf-8?B?QnExejdORXgvYTlic20vNEhqUy9vUlBSMlFxSkYwNjJ1WFJuR2hOTE0wbjZy?=
 =?utf-8?B?UlJqWHRGQXZ4dnp2aGFxUWpweVVkQUlMTnF3Y0ZEOFVoaFJFelZCbHhPTWlp?=
 =?utf-8?B?TVQrREwwbjRuUGQ5UG9xTHYyeFFlb2toM2wrekJQdFgvckJyWDc4RUtST3V5?=
 =?utf-8?B?TVE5UWE0TUhqVmdaRXI2U0NEM3ZLQnFEUXF1dVJFenkwTWJjQlcrNktaNG91?=
 =?utf-8?B?bjZJU0Z0RU04SFJLSDMxN3NmL3BEWGZLY3kwc0YyWHg0cGd0eThXU2Q2bE9k?=
 =?utf-8?B?OEhmZ1gwMXBlNFFET0wvdmdlUG5VVmphbzQ1V0pOT3FXakpSSDVMam4yM2Y2?=
 =?utf-8?B?K0wrMEs4UGl3Wklabk05ZXU0K3NLejE1L3p3VG0vbkc0ODEvOVNCdWE1SWRx?=
 =?utf-8?Q?BkwgARPWT9H8PQ1kD0NubeS69fTECQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 12:43:55.5909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d70a0e-bcbc-4641-c8d7-08dd65516157
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213086

T24gMTAgTWFyIDIwMjUsIGF0IDA3OjEyLCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiAtIFVzZSBsaWNlbnNlIGluIHNvdXJjZSBmaWxlIHRvIGluc3RlYWQgbG9j
YWwgZmlsZSBMSUNFTlNFLU9BU0lTDQo+IA0KPiAtIFJlZmVyIGRlYmlhblsxXSwgcmVuYW1lIGxp
Y2Vuc2UgTElDRU5TRS1PQVNJUyB0byBEb2NCb29rDQo+IA0KPiBUaGUgY29udGVudCBvZiBsaWNl
bnNlIGhhcyBubyBjaGFuZ2UNCj4gDQo+IExpY2Vuc2UtVXBkYXRlOiByZW5hbWUgbGljZW5zZSBM
SUNFTlNFLU9BU0lTIC0+IERvY0Jvb2sNCj4gDQo+IFsxXSBodHRwczovL3NhbHNhLmRlYmlhbi5v
cmcvZGViaWFuL2RvY2Jvb2steG1sLy0vYmxvYi9kZWJpYW4vbWFzdGVyL2RlYmlhbi9jb3B5cmln
aHQ/cmVmX3R5cGU9aGVhZHMjTDI4DQoNClRoaXMgbGljZW5zZSBpcyBlc3NlbnRpYWxseSB1c2Vk
IGluIGp1c3Qgb25lIHJlY2lwZSwgZG9jYm9vay14bWwtZHRkNCwgc28gaXQgZG9lc27igJl0IHJl
YWxseSBjb3VudCBhcyDigJxjb21tb27igJ0gdG8gbWUuICBGdXR1cmUgcmVsZWFzZXMgdXNlIGEg
bGljZW5zZSB0aGF0IGlzIGluIHRoZSBTUERYIGRhdGFiYXNlLCBidXQgdGhpcyBpcyBhIGJlc3Bv
a2UgbGljZW5zZS4NCg0KSW4gdGhpcyBjYXNlIEnigJlkIHByZWZlciB0byBjbGVhbiBpdCB1cCBi
eSB1c2luZyBOT19HRU5FUklDX0xJQ0VOU0UsIGFuZCByZW1vdmUgdGhlIE9BU0lTIGxpY2Vuc2Ug
ZnJvbSB0aGUgY29tbW9uIGxpY2Vuc2UgbGlzdC4gIEkgaGF2ZSBhIHBhdGNoIEkgd2FzIHRlc3Rp
bmcsIEnigJlsbCBzZW5kIGl0Lg0KDQpSb3Nz

