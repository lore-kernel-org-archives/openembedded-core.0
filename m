Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FC8C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 15:56:02 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.46])
 by mx.groups.io with SMTP id smtpd.web10.166.1721145358347345704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 08:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=H102/Z6J;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=H102/Z6J;
 spf=pass (domain: arm.com, ip: 40.107.247.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=moVt33GXVz3sFCIzojoE8oxHNrzZ7wzWLTP0sjddTJ3w0kK7257l8VaJhTfRNQbkfcpXSc1G2+Poi6YfuIExJObcscefqeoNetihBUxdgI0YvwifalhCeanklvR016KbmS4Boq8ZoV8Tn4tgToaFhhqCr1f0v8PBA1RzoogIZIm2ynoPs6JrAsWMi1GmOtqHnuEfyzYMHlUhWO+PAJRajEYsji0dw+YhVyVS1KDmDFhsy4/OaGEOXz3JHVpFMdepjLhv7brQ/henc8Gn50d18ZQ/kBuAoTZvsdkYJHO3t/SUfvjxuxJ4s35hOOpORa9Rm/Mx+pd68N3L3HdmjbEFKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvRDSrbOH5yMrHUH/jtzhAMnlguytQi8ljhJAn03Z2I=;
 b=jZ1/Pbh28FYuIG1yQLgjP+DNIB9n5Ocj65e7AIH4WcBR2QYG0/Unnwczs0hXqKhXh2ZayzA3IZhsrEiR37qHJ9x/h8gqwyhiIqsvIj3vOVNqX1wW9jS72tQl7df1jHTMEV0CcGwdlcwXIKbgqt1PFL6psLPap+jCi+6jGq0fPgz8O1ezznPKFxcqSVU1fW2RWzEdHf4OFXG6LTXi/8aBIWV6OQz50YBm0JCaDm7wD5WT8oFVqp+U9XPZ7q6nbjnth60LjqW33cDUnbSzA0WwohDUZ2CxON7l+Usls0v4xlLvurfWm36XIq1Uh9vrMQqFC/5V+MhgGbMJTcyoWvgVkQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvRDSrbOH5yMrHUH/jtzhAMnlguytQi8ljhJAn03Z2I=;
 b=H102/Z6J26tsbyYB1Rp29VxN9MwLB0dxTC2ES3P0iMB4ff31NZe5zka2YpjvWTNhUldbKVSG+SiSuUSuJsbkZwKN7b6ADSxaXw5nRhxGiHmo9UctBVP1I6DmabhvGIwauwi8FC1mYe9H5Gi3X2JhngjKNIqjlpErngClxkiwvws=
Received: from DU2PR04CA0259.eurprd04.prod.outlook.com (2603:10a6:10:28e::24)
 by AS8PR08MB6261.eurprd08.prod.outlook.com (2603:10a6:20b:295::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 15:55:50 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::9f) by DU2PR04CA0259.outlook.office365.com
 (2603:10a6:10:28e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Tue, 16 Jul 2024 15:55:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Tue, 16 Jul 2024 15:55:50 +0000
Received: ("Tessian outbound ca5638866b89:v365"); Tue, 16 Jul 2024 15:55:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f74e34e34c7a5242
X-CR-MTA-TID: 64aa7808
Received: from Lf63e26e9a7e5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 548B94EF-6BDE-44F1-82EA-F8795C1673BD.1;
	Tue, 16 Jul 2024 15:55:43 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf63e26e9a7e5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Jul 2024 15:55:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HE9UNT8i8PnLZT+X9JuEWf/mlStRYQZ8+c6sbCJlZrixFmvfMcKb8+XsigOB8ofccdREM4Dt/0/hjd2OfJDcZq0WaTlYLCr2oH5DPFOaJqhQJEgvo5OZPgPg/TMWQJI8AwSbquznTQJqgWrHzhu/pm0ogHFCL1VmcQ7JDpiFovgfqTpwEfw7sMwP8ynKVSfoWfa49WJ6h0rYoJHaL3AnMPdHWMg7/4W+mgfxlidixm7AnXloectcICWc8ZUqGekYwur6WPU84/qVNNklrJykeqX/zphlSzJRCvV+f4V3R+w8p3IghNs+nM8MM7ipoTsAZI5tRyUW9vW4e0z/K6UECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvRDSrbOH5yMrHUH/jtzhAMnlguytQi8ljhJAn03Z2I=;
 b=LmLCgFOuaKiCJHLb3PamzFPCGm8a/pRbnbWoe6ueyoK/ggzMbibecA1wb3t/OHcYXFiVLx0b0vRfBlXv9+/Sf0Em9pF6B12Lu1iNRrKPnQmCjssrtTSnF1aXs3H+JRHI/14f7RzdBmY7IkyVRKgvlWjNObGVlq2xMu6gkVdGG0d/3DND5flhO3LPes6SXR1IRJcOUFyO8H61J39x1pHpv7PLerZQdpoMgb7WNLmnolMNzSUwl5QGctDJ5JGxji6C2cG2ZY8q5Mo89Jt/JthZr3EtEaYEI3S3UlepqkWNlFr2GTONVe/9U7QdoHZVqcjF4cpv6KWgrCINVcV+mNsHGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvRDSrbOH5yMrHUH/jtzhAMnlguytQi8ljhJAn03Z2I=;
 b=H102/Z6J26tsbyYB1Rp29VxN9MwLB0dxTC2ES3P0iMB4ff31NZe5zka2YpjvWTNhUldbKVSG+SiSuUSuJsbkZwKN7b6ADSxaXw5nRhxGiHmo9UctBVP1I6DmabhvGIwauwi8FC1mYe9H5Gi3X2JhngjKNIqjlpErngClxkiwvws=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7601.eurprd08.prod.outlook.com (2603:10a6:20b:4ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 16 Jul
 2024 15:55:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 15:55:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][master][PATCH v2 2/2] apt: runtime error:
 filename too long (tmpdir length)
Thread-Topic: [OE-core] [scarthgap][master][PATCH v2 2/2] apt: runtime error:
 filename too long (tmpdir length)
Thread-Index: AQHazc+2+HO57nUjeEOTYd+4so8GA7H5lYmA
Date: Tue, 16 Jul 2024 15:55:40 +0000
Message-ID: <39BB54A8-88DA-4443-BD0B-DDA45ABB5138@arm.com>
References: <17D9FBA6511B427C.27929@lists.openembedded.org>
 <17DA13C5DEE6F556.1999@lists.openembedded.org>
 <beeb3ef4-f2f1-4de8-9ddd-d63ebbe39a06@windriver.com>
In-Reply-To: <beeb3ef4-f2f1-4de8-9ddd-d63ebbe39a06@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7601:EE_|DB1PEPF000509E6:EE_|AS8PR08MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a4afd0-bcda-48af-1101-08dca5afc3bb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?K3F5RUo4dWR1a3VZQlZrY3A2UkJXbTI0VWZpRGdOSFU0YXpVZytESHBLZmRM?=
 =?utf-8?B?RFRENUpHclBnaFFiMjBNMERsTTYxaUQzMmYvZGlrN1NxeG1aUzNKUFBMUjhK?=
 =?utf-8?B?OFV4YlR4aHl1SW1qVm0wUldrY2FNZGI0SCtDbGx5cWFFaEoxb29MQ3VxLzRn?=
 =?utf-8?B?b3lCZ2xxaGZOZTNnaUlDbkNoakRSb3hWS0F2aWdjbTRVYjFQblI0MUlSVGp1?=
 =?utf-8?B?L3ZXUUREdWZkeXdoSWlOL3EvYWpMQWZrZjhxZHFVTXVhVXFvTjlDdTFhZEJJ?=
 =?utf-8?B?eFdyMkhaOGw2YUZyK2lJVnNVYmdWdmNSajJhbXNIbFErY25rK3VyRlhTRkZD?=
 =?utf-8?B?NllDNzVxV3ZybVEyZ1RMejNNazcyNlB1WHNPaDhHL2NaS01pRnZWMnZ6QVBi?=
 =?utf-8?B?RFNUeEVHR3ZrVlZFTTI5eXhvWVBPd2txS3JRMThmZXhCYkNRU1ZFYUxDd1Zx?=
 =?utf-8?B?eGV1WHU0MGJHMHYzcTY2RStwZHh2YjZJbDkvc0dMZjV5a3BQaHFYSzNzRWo3?=
 =?utf-8?B?eldKUjI4ZVpNVmV1bVBqM0dQbHdYTDByc3JFS3ArcnF6T2lsZnZGazQ5RlNq?=
 =?utf-8?B?aWdRRjJ4NkJVVXVjeEZYWFNMMk5Eem5YRDlFSlZZYlp0NVhBeHNVc2ZWai9G?=
 =?utf-8?B?ZVdLeHFxR1N2TXk2NHMwWnZVMWJabkhlOEdzejVIdzRxL0t4ZXhHcEFwK1RW?=
 =?utf-8?B?OG83cm9YeWtOd1F0Y1kySnA3Y0RaeGMzUCt5bEM1cXZrQ0JHeldadTlBRzRW?=
 =?utf-8?B?QjVxbjJhdFdESDlOa3FLWFJuMm1vZ2dYeWIxSnUzdFR1OGxHUDdNWEhRZWRj?=
 =?utf-8?B?L0JRNmhjaEFhQ3FBSXo3TnJHUVpVZnRqVWwzV0cvQmprb28wMmdKWU4xa3R4?=
 =?utf-8?B?QU96NXRQWDB5ZWx2bTVlN2R5M3FxT1E3bkZPa0xKUllaUnBtdS9PbEk5MVRN?=
 =?utf-8?B?S1BKVWYyb2RDOWNWbTBXYmRLMDRkOUlhbVVvTEFjTHZuNGMwQXdKZjFZVWNE?=
 =?utf-8?B?UlZ2bmpocHZ5MWdMQ0lzc0djUDVFTTJLbkVCb2h4cVRFenVFMllFblNWenND?=
 =?utf-8?B?K3dUWGxZTEl5ZWlIdThOVlJzUnB1S25WYU1pM0lHTnZFcm9VaHlLNEJ6Y05k?=
 =?utf-8?B?b1FRUHlvSUNxcDlWM1d5MnRacnRkNnlsR0FYY2FJM1BMMERhajVoaTRvcTgy?=
 =?utf-8?B?cjNPMzNSVXdXamJyQ2tsLzM1MDJsNnJWTXhTMnA0MjVISkU5UlV3UVRuTDE5?=
 =?utf-8?B?RmVBbklWMnBCK1dXSW0xWkZ1d0I2VEluTXk5alZDN2crTk15UUpsekZrcko4?=
 =?utf-8?B?VFJnNnhEMGIzQVJoQmhjckVSUC9rOERlMUtWak9zTXpxNnc1VUtnWDdPZnps?=
 =?utf-8?B?K1VwRk03VUE0cDJLWWd0OUdMSExSVXVDTk9wbm9OV3BjR2xldUpaK1Z0dkUx?=
 =?utf-8?B?SnVNTHJBL0p2OXM3eWZLaTJFZDN4WW9zOEVucmVzMjByelh5VTJNMWk2SmhO?=
 =?utf-8?B?Q09QNmJkZ0lPNGtEU1pGUTdxUTNnY2k4bldqeFBwdzZtTXdvYUNjM21xaDEx?=
 =?utf-8?B?RnJnWTBBdHZzSU5YK21jR3VyZTlDRGg4TExLN09CbEYxVWs1MzNra0xLQTEz?=
 =?utf-8?B?LytGUjdSeGswdnpHMVUyT1lzV1ZHdnpRNkdFc25JT1RXSllmRTRSckJzTkNB?=
 =?utf-8?B?UUU5VGIzY0VmL3FrUWdKa2hjK2FhNDdJWWJ1cWxXNms5ODBYdW92bnJYb1pw?=
 =?utf-8?B?QmlNOFFNdVF6aVEwVEtMcVAvc2FMbVBQQnNyN3BWR2VvNytrbm94SGxqa1Vs?=
 =?utf-8?Q?THnAoWSNpGRAOjP7BYwwb3LXSNpuN6pMvi1JA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <28A1C28DE675F14F9249C7C9180210DC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7601
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b869752f-ad6d-430c-eecc-08dca5afbde1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|36860700013|82310400026|376014|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NDZWdUZEWkxML0UyNDRtNDJwRDdadVlMeUh1WkEzd20xTnJ4YXNJN2xUZERz?=
 =?utf-8?B?NEkxRklZSmFzYWcrUlVUUTRtYzhVWkZ5QkdYbnRuR2JTSXV1N2ZVSnVKQitY?=
 =?utf-8?B?eERIYzVTYzhQaTNUdlJSWEppdWNVVXZPQXZHYm5WWDBTM1RaN3J0dGRRYW9l?=
 =?utf-8?B?SEF3WVFsYmNnZkk1bkZlekV4dnBGL1RtMW01cGNyTjZtV3JmdGg1ZU9nZytr?=
 =?utf-8?B?bjVtaWl2V1hPRnlrdmQ3UUpQOWJyWWRrVStYWXFweDA0TUFCL2FBTzhGZjEx?=
 =?utf-8?B?cU1xMExCSUhaN1pkMjNoRVVQVlBGU29Ob1ZMNWc4VGhvb2k1MDBCQmEzSW01?=
 =?utf-8?B?Yk1uTXF1N01vVk9IYWF2TlV5Z1lBejYvUCtaMHhPamtCZUNkZ1IyZlhXTzEw?=
 =?utf-8?B?REhJcVBGSHUyRW9HMzZBRG5hUzN3TUVFYWZWZGRndTBqVHVJVnU1YklIV2l0?=
 =?utf-8?B?eG0xS3VvS1J4NWFvb1pSMUdhcHhtTDh6WmZSbUpXczlqT01IQTZkTG9EbWVO?=
 =?utf-8?B?eU84YjU4d3lkd0ZRVnNRVWNxYkQxckJKelVGekFKK1luZkMzZ2h4Y1M4d2dH?=
 =?utf-8?B?OUJJSHIxQ0lvVEh4R1lTWDdtblBweDZWcUFVWm9MV0NjcnFFZzc4RlhCdFBM?=
 =?utf-8?B?WFFTeDdrNENZY2dJaThXSmU1eFpUUmNyaEFMVUZ2cENmQllyZC9uNFVqN1Mw?=
 =?utf-8?B?ZExjcHhwcjJINE5hR29qbTZaRlI0TXJkNk5XdXJqNTIyQVlvUXhONndkZVQz?=
 =?utf-8?B?eUJJSjlrcWVRcm5Od092OW1EbFVQb3lBZnRlZUsrdFFWajQrY3Jtc09XNS9P?=
 =?utf-8?B?V3QxVUxRZnYrUDJwbklaWFlvY2VWdVFSRks1YUY0ZmFNWmw4SkJuR0Vjbkd2?=
 =?utf-8?B?Q3FScDB2Q2pOUk0ybDc0bitRbDdhQkNYeGZ6NldyZmllTVpQVjlvVUlsR1Jy?=
 =?utf-8?B?Vm5PUEN2ZklrRTFiOU9rcVo0OExBSGRRUS8ydTJQMnlhalN2bjFPWURidTM2?=
 =?utf-8?B?bWtRMGNUdVZkbHVLVnZRY1BydnpMNE1CWkxrWlRTaW1FQ05QVGgvWjJTQS9q?=
 =?utf-8?B?WTdtNUF0Z3JqQmtJYVQwQzRBa2h4S0lGaFltbUdoUkppVEltaWYraW1uS0s2?=
 =?utf-8?B?a0FUV1FCdjZBVUlPR3RlQXJIVTR4RjJCWmY3QkhXSjE5d3FsWkFyWjNaMm5W?=
 =?utf-8?B?V3J5cml6VEtFUUE3MnQ1S1ozdFpQd3RBRG8zQ21Oc3U4K0toQzIvRkxTWVlG?=
 =?utf-8?B?d2JaWVpUVCtKVllCUnM1QThpcDZWMk9VOWxqVitoNmdPdFh0NWVhd0JJYUhY?=
 =?utf-8?B?QnNkaFhyTDlRU1hWbkJDSFdoOVlsRzN6c21FNjdlK1pZcHRSVnAzNkMyaG10?=
 =?utf-8?B?aGh1NVNJU1Z2QkFHTzRwcmtuRisvdXIyYU11MWxuZ1BnZ0xsYUJnRUZZd2hS?=
 =?utf-8?B?aGRqNlpVbDBseEgyc1YwMHdmOCtMckM4cDFmdTZSQ0VqUElBVEN3R1hvUHlX?=
 =?utf-8?B?eUNsK2dtbXUyanBBcjRCMXA1eDFub3YxdGo1MzNDeDZOZ0p5QnVZWm01SmdB?=
 =?utf-8?B?NGluVlVOQkZVVy9Ba29IRURLa1VaS1FZdW1RRnB1Vm4vR3dtdXgwR2NUZFhT?=
 =?utf-8?B?WGNKZ3prL0dsK0h6N3I4MkR0eE5LbGJWendXRTRBbWJWL3R4MGF4UjNBTVJy?=
 =?utf-8?B?bG1lK2FFdWJhd3lxQlBCOS83R1BOeEF2eGNtYzIrL2gyb1JGU1FibTZ3dGJ6?=
 =?utf-8?B?OWFtRkxyZDFmY2p6S016NmFmR2Qrc2tEYm8yRUZETkU1V1dwNm1WM1djRy9a?=
 =?utf-8?B?LytqMkdkd2FnWTZiaVRyQkJpSU9qSEIxT0tpaWh0T3RxTEJ2NEtodTNaVlcw?=
 =?utf-8?B?U1ZkdWtKeFZJU2FKcFhaRENNeEZqU1k0U0xIUHBScE1zZGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(4022899009)(36860700013)(82310400026)(376014)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 15:55:50.1444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a4afd0-bcda-48af-1101-08dca5afc3bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6261
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 15:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202121

VGhpcyBwcm9wb3NlZCBwYXRjaCB3YXMgcmVqZWN0ZWQgdXBzdHJlYW06DQoNCj4gSW1hZ2luZSBh
cyBzb3VyY2U6DQo+IGRlYiBodHRwOi8vZXhhbXBsZS5vcmcvdmVyeS92ZXJ5L2xvbmcvcGF0aCBm
b28gbWFpbg0KPiBkZWIgaHR0cDovL2V4YW1wbGUub3JnL3ZlcnkvdmVyeS9sb25nL3BhdGggYmFy
IG1haW4NCj4gdGhhdCB3b3VsZCByb3VnaGx5IHRyYW5zbGF0ZSB0byBlLmcuOg0KPiBleGFtcGxl
Lm9yZ192ZXJ5X3ZlcnlfbG9uZ19wYXRoX2Rpc3RzX2Zvb19tYWluX2JpbmFyeS1hbWQ2NF9QYWNr
YWdlcw0KPiBleGFtcGxlLm9yZ192ZXJ5X3ZlcnlfbG9uZ19wYXRoX2Rpc3RzX2Zvb19tYWluX2Jp
bmFyeS1pMzg2X1BhY2thZ2VzDQo+IGV4YW1wbGUub3JnX3ZlcnlfdmVyeV9sb25nX3BhdGhfZGlz
dHNfYmFyX21haW5fYmluYXJ5LWFtZDY0X1BhY2thZ2VzDQo+IGV4YW1wbGUub3JnX3ZlcnlfdmVy
eV9sb25nX3BhdGhfZGlzdHNfYmFyX21haW5fYmluYXJ5LWkzODZfUGFja2FnZXMNCj4gDQo+IFNv
LCB5b3UgY2FuJ3QganVzdCBhcmJpdHJhcmlseSBjdXQgZnJvbSB0aGUgZW5kIGFzIHRoYXQgcG90
ZW50aWFsbHkgbWFwcw0KPiBtdWx0aXBsZSBVUklzIHRvIHRoZSBzYW1lIGZpbGVuYW1lIChhbmQg
d2hpbGUgSSBhbSBub3Qgc3VyZSBpZiB0aGF0DQo+IG1ldGhvZCBpcyBVVEYtOCBzYWZlLCB0cnVu
Y2F0aW5nIGlzIGRlZmluaXRpdmVseSBub3QpLg0KDQpTbyBJIGRvbuKAmXQgdGhpbmsgd2Ugc2hv
dWxkIGJlIGFjY2VwdGluZyBpdCwgYXMgdGhpcyBpcyBleGFjdGx5IGhvdyBpdCB3b3VsZCBiZSB1
c2VkLg0KDQpSb3NzDQoNCj4gT24gNCBKdWwgMjAyNCwgYXQgMDY6MDQsIENoYW5ncWluZyBMaSB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8Y2hhbmdxaW5nLmxpPXdpbmRyaXZlci5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBwaW5nDQo+IE9uIDYvMTgvMjQgMTg6
NTIsIENoYW5ncWluZyBMaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4+IEZy
b206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+DQo+PiANCj4+IHdo
ZW4gdGhlIHRtcGRpciBkaXIgaXMgbG9uZ2VyIHRoYW4gMjIwLCB0aGVyZSBpcyBubyBmaWxlcyBz
YXZlZCBpbg0KPj4gdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC92YXIvbGliL2FwdC9saXN0cy8g
YWZ0ZXIgcnVuIGFwdC1nZXQgdXBkYXRlLA0KPj4gdGhpcyBpcyBiZWNhdXNlIGFwdC1nZXQgdXNl
cyB0aGUgcGF0aCBhcyB0aGUgZmlsZSBuYW1lLCBidXQgdGhlIGZpbGUNCj4+IG5hbWUgY2FuJ3Qg
YmUgbG9uZ2VyIHRoYW4gMjU1IGFjY29yZGluZyB0byAvdXNyL2luY2x1ZGUvbGludXgvbGltaXRz
LmguDQo+PiANCj4+IFtZT0NUTyAjMjY4OF0NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0
IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+DQo+PiANCj4+IFRha2UgYmFjayBmcm9t
IGh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0Lz9p
ZD05YTBjMDM5Mzg3MWVkYTRiYmNlY2ZkZDRiNTk1ZjBjMWI4ZTQyZWRmDQo+PiBTaWduZWQtb2Zm
LWJ5OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPg0KPj4gLS0tDQo+
PiAuLi5oZS1maWxlbmFtZS1jYW4tdC1iZS1sb25nZXItdGhhbi0yNTUucGF0Y2ggfCA0MCArKysr
KysrKysrKysrKysrKysrDQo+PiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8yLjYuMS5i
YiB8IDEgKw0KPj4gMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspDQo+PiBjcmVhdGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1zdHJ1dGwuY2Mt
dGhlLWZpbGVuYW1lLWNhbi10LWJlLWxvbmdlci10aGFuLTI1NS5wYXRjaA0KPj4gDQo+PiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1zdHJ1dGwuY2MtdGhl
LWZpbGVuYW1lLWNhbi10LWJlLWxvbmdlci10aGFuLTI1NS5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9hcHQvYXB0LzAwMDEtc3RydXRsLmNjLXRoZS1maWxlbmFtZS1jYW4tdC1iZS1sb25n
ZXItdGhhbi0yNTUucGF0Y2gNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAw
MDAwMDAwLi5jODhlZmEzYWFlDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLXN0cnV0bC5jYy10aGUtZmlsZW5hbWUtY2FuLXQtYmUt
bG9uZ2VyLXRoYW4tMjU1LnBhdGNoDQo+PiBAQCAtMCwwICsxLDQwIEBADQo+PiArRnJvbSA5MTgy
OTVhYTEzMjA3MThkMzQyMTE2Zjc2Yzk4ZDIyODlkMzc3ODAwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQ0KPj4gK0Zyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+
DQo+PiArRGF0ZTogVHVlLCAxOCBKdW4gMjAyNCAxMDozMjo1NSArMDgwMA0KPj4gK1N1YmplY3Q6
IFtQQVRDSF0gc3RydXRsLmNjOiB0aGUgZmlsZW5hbWUgY2FuJ3QgYmUgbG9uZ2VyIHRoYW4gMjU1
DQo+PiArDQo+PiArVGhlIFVSSXRvRmlsZU5hbWUgdHJhbnNsYXRlcyB0aGUgcGF0aCBpbnRvIHRo
ZSBmaWxlbmFtZSwgYnV0IHRoZQ0KPj4gK2ZpbGVuYW1lIGNhbid0IGJlIGxvbmdlciB0aGFuIDI1
NSBhY2NvcmRpbmcgdG8NCj4+ICsvdXNyL2luY2x1ZGUvbGludXgvbGltaXRzLmguDQo+PiArDQo+
PiArVHJ1bmNhdGUgaXQgd2hlbiBpdCBpcyBsb25nZXIgdGhhbiAyNDAgKGxlYXZlIHNvbWUgc3Bh
Y2VzIGZvcg0KPj4gKyIuUGFja2FnZXMiIGFuZCAiLl9SZWxlYXNlIiBzdWZmaXgpDQo+PiArDQo+
PiArVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2Nn
aS1iaW4vYnVncmVwb3J0LmNnaT9idWc9MTA3MzU5MV0NCj4+ICtTaWduZWQtb2ZmLWJ5OiBSb2Jl
cnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4NCj4+ICtTaWduZWQtb2ZmLWJ5OiBD
aGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPg0KPj4gKy0tLQ0KPj4gKyBh
cHQtcGtnL2NvbnRyaWIvc3RydXRsLmNjIHwgNyArKysrKystDQo+PiArIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+ICsNCj4+ICtkaWZmIC0tZ2l0IGEv
YXB0LXBrZy9jb250cmliL3N0cnV0bC5jYyBiL2FwdC1wa2cvY29udHJpYi9zdHJ1dGwuY2MNCj4+
ICtpbmRleCA2NzEwMGYxLi41MDc2YjM1IDEwMDY0NA0KPj4gKy0tLSBhL2FwdC1wa2cvY29udHJp
Yi9zdHJ1dGwuY2MNCj4+ICsrKysgYi9hcHQtcGtnL2NvbnRyaWIvc3RydXRsLmNjDQo+PiArQEAg
LTU2NSw3ICs1NjUsMTIgQEAgc3RyaW5nIFVSSXRvRmlsZU5hbWUoY29uc3Qgc3RyaW5nICZVUkkp
DQo+PiArIC8vICJceDAwLVx4MjB7fXxcXFxcXlxcW1xcXTw+XCJceDdGLVx4RkYiOw0KPj4gKyBz
dHJpbmcgTmV3VVJJID0gUXVvdGVTdHJpbmcoVSwiXFx8e31bXTw+XCJefl89IUAjJCVeJioiKTsN
Cj4+ICsgcmVwbGFjZShOZXdVUkkuYmVnaW4oKSxOZXdVUkkuZW5kKCksJy8nLCdfJyk7DQo+PiAr
LSByZXR1cm4gTmV3VVJJOw0KPj4gKysNCj4+ICsrIC8vIFRydW5jYXRlIGZyb20gdGhlIGhlYWQg
d2hlbiBpdCBpcyBsb25nZXIgdGhhbiAyNDANCj4+ICsrIGlmKE5ld1VSSS5sZW5ndGgoKSA+IDI0
MCkNCj4+ICsrIHJldHVybiBOZXdVUkkuc3Vic3RyKE5ld1VSSS5sZW5ndGgoKSAtIDI0MCwgTmV3
VVJJLmxlbmd0aCgpIC0gMSk7DQo+PiArKyBlbHNlDQo+PiArKyByZXR1cm4gTmV3VVJJOw0KPj4g
KyB9DQo+PiArIC8qfX19Ki8NCj4+ICsgLy8gQmFzZTY0RW5jb2RlIC0gQmFzZTY0IEVuY29kaW5n
IHJvdXRpbmUgZm9yIHNob3J0IHN0cmluZ3MgLyp7e3sqLw0KPj4gKy0tIA0KPj4gKzIuMjUuMQ0K
Pj4gKw0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0XzIuNi4x
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHRfMi42LjEuYmINCj4+IGluZGV4IDI2
YTZkOTlmODQuLmI2YjU2YzAwMTAgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXB0L2FwdF8yLjYuMS5iYg0KPj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9h
cHRfMi42LjEuYmINCj4+IEBAIC0xNCw2ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtERUJJQU5fTUlS
Uk9SfS9tYWluL2EvYXB0LyR7QlBOfV8ke1BWfS50YXIueHogXA0KPj4gZmlsZTovLzAwMDEtSGlk
ZS1mc3RhdGF0NjQtYW5kLXBybGltaXQ2NC1kZWZpbmVzLW9uLW11c2wucGF0Y2ggXA0KPj4gZmls
ZTovLzAwMDEtYXB0d2Vic2VydmVyLmNjLUluY2x1ZGUtYXJyYXkucGF0Y2ggXA0KPj4gZmlsZTov
LzAwMDEtUmVtb3ZlLXVzaW5nLXN0ZC1iaW5hcnlfZnVuY3Rpb24ucGF0Y2ggXA0KPj4gKyBmaWxl
Oi8vMDAwMS1zdHJ1dGwuY2MtdGhlLWZpbGVuYW1lLWNhbi10LWJlLWxvbmdlci10aGFuLTI1NS5w
YXRjaCBcDQo+PiAiDQo+PiANCj4+IFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXA0K
Pj4gDQo+PiANCj4+IA0KPj4gDQo+PiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+
IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBW
aWV3L1JlcGx5IE9ubGluZSAoIzIwMTUwMik6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjAxNTAyDQo+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwNjczODM2Ni82ODc1ODg4DQo+IEdy
b3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gDQoNCg==

