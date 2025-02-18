Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE74AC02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 14:47:41 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web11.21023.1739890051594825923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 06:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YavGnYm7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YavGnYm7;
 spf=pass (domain: arm.com, ip: 40.107.22.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wwuRJkFKLgp16eLYST410afiRH2m/Lx5MZECJIoyajEdyZTpPA/awPjXJpcMWUrrcmPhY84VjdbTPfRaCQp0dA4zILzqUQVUdP3IzwM/tQ44YdGcoUmNhUQPEC+ANQKkU30S0Sgk2JyKb2o5oDXbZkfYg1MyfE5T/hehLQcDrowC1QgApx/Fb5vFePKTV8n4tK/+t4zeIaeMsVNPcIN7J6awxCh6PT4hXBj5YA9ob1YU0jaMSKXW95BmNP2YyiSdHBmQXcPi9YQq1TkyIHGl8sk8LK9WkJDJnfmxVPO1x0RSn6qv22EwQlFGDWLVrSkNGZVjusVzUvaaSXvcqoKqoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6JXxU4vzF8XM3MiWyszcsoRy+cmu7cll5BZ9NGYvyM=;
 b=hRq/qytLkcfI3JaMzjRP6XUDEZhIpkyPDGLgzc0yaJBe2ZLTcoWwtSnBHt7arflHjYQNNMllowDPDXZy/W9e3eKcimesE9psZeeIiuwLRvyrvgTddrTiRsDgd0XE7Z6s59rA8PTJBMbbJH4unjrM9DXxD1cJ0HsVlfzHqZuZg8Zb8VjRqON5InH2qJl7n4QAMDiP3mptSl2s5OWzdU+71Pj4l1F5NB4DHbvRSptJryFIWFPLBBPE5RsXmthL1dzFfc8hM9blby9DMJnYy8lAhW53QMPZPx2o3hgAy60Rs2exP/R4DJf7hSkIoBkCdxCuhWJzg6sZ1CB8XDcyQueKDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6JXxU4vzF8XM3MiWyszcsoRy+cmu7cll5BZ9NGYvyM=;
 b=YavGnYm7oHKd/NUlxwqzjkc1NIdMWQIdvX+oL+CzJ9c7ASNxlYIzKmNhuLe2cMgPTYelSn2BwYj9P8b5JHAzaA+j4MpaafLTxFrGrZitgiWt/GRvN9e3GuLcqPZsCfCDDo3SFa90s0T6hOuB2sbhG22JQ971da0qTQNkdpesBN0=
Received: from AM0PR10CA0094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::47)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 14:47:26 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:208:15:cafe::6) by AM0PR10CA0094.outlook.office365.com
 (2603:10a6:208:15::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Tue,
 18 Feb 2025 14:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Tue, 18 Feb 2025 14:47:25 +0000
Received: ("Tessian outbound c2a0e6651601:v567"); Tue, 18 Feb 2025 14:47:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4531b9f0304d43b8
X-TessianGatewayMetadata: wVM9VS+GGxg2Pxz2HRoVdVB/+TEEeADEkaGkPxDiSyM1atFLm0aSWda8lFOk3lrGFVtcCsmiv91hsKZULl8CvJVQQ0y41N/giEuyQZoWk6LIJv+lGpkvsWqv7qd6KnpUrOXWTN4m9vuNNhO040OwAVg3e4+FKtXqzx55+IObCcc=
X-CR-MTA-TID: 64aa7808
Received: from Lf654e0127acb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D16E742A-3F9D-4F0E-847F-7C8F58B2D710.1;
	Tue, 18 Feb 2025 14:47:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf654e0127acb.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 18 Feb 2025 14:47:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iw43prYF5HTi6TiKnuzC6ucHHi7zBuXeQ/XcMyArp+c9UCNf9FvtjHVyuoJOZcX9//Uv1TgJxC8vgF/CwWzMLFE87JrN3cZiIMJWC/+IL5LC9mBR0sS/dNJMiOAfTVygzN5qPf3AAI5XB9Af1ynWa264euduMfVjZP0flxbus7u1KHihay1eJliwMxDEKuto3KgzOtKGUseigreXqlJd1TRRRHrrTXlB8gwB/ylNRRTL6RAexWjsaFhSMTDDPB6s+JJLIQ76cV/33R48C6QcuQpjp/OTdjfB87yH5wBudXSs0HPPjKanMfNkW6HTse2I3957lIS5dD0H2RXc4E45qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6JXxU4vzF8XM3MiWyszcsoRy+cmu7cll5BZ9NGYvyM=;
 b=hkWb4oAKhpRghYPOJ4uvQUQCKO1uT+UC/gDA8GTWajHPWc7peWDXxKtMENbeFyFy5+idNy7wNjiw6ne7LwK8GfKAuy8MkF8srYI0HIYmpjfoalIBxw960lnLwVHVBArDkNfjfYmgpdAHvay0yMsiWbiKYgA+NhmEhrr4JMJ6REn6mBqhE0uT9VG0iJuA2N7DDtqTPUFdbg84WbzckOIDJ0vYkEAvfADnGP05WxwzjSS+4P7zUzhNeg/6y6+Zx7OW2q6I49RY1pon8ShYh8I6zfuU00HtzhRtxnSRusF+SfZcrh8TcF1bbFmpYmDzh/ZMYk2RprPojcrL9awvjcOLOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6JXxU4vzF8XM3MiWyszcsoRy+cmu7cll5BZ9NGYvyM=;
 b=YavGnYm7oHKd/NUlxwqzjkc1NIdMWQIdvX+oL+CzJ9c7ASNxlYIzKmNhuLe2cMgPTYelSn2BwYj9P8b5JHAzaA+j4MpaafLTxFrGrZitgiWt/GRvN9e3GuLcqPZsCfCDDo3SFa90s0T6hOuB2sbhG22JQ971da0qTQNkdpesBN0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5799.eurprd08.prod.outlook.com (2603:10a6:10:1b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 14:47:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.8445.015; Tue, 18 Feb 2025
 14:47:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2 2/2] setuptools3-base.bbclass:
 override default subprocess timeout
Thread-Topic: [OE-core] [scarthgap][PATCH v2 2/2] setuptools3-base.bbclass:
 override default subprocess timeout
Thread-Index: AQHbggpUA1ffowk2aEWAUzb2rQeAwLNNI94A
Date: Tue, 18 Feb 2025 14:47:15 +0000
Message-ID: <478482DF-623B-496B-B897-1243655F2E16@arm.com>
References: <20250218133736.2113804-1-hongxu.jia@windriver.com>
 <20250218133736.2113804-2-hongxu.jia@windriver.com>
In-Reply-To: <20250218133736.2113804-2-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5799:EE_|AM4PEPF00027A60:EE_|AM8PR08MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: acd48d26-6344-44d8-d87d-08dd502b28aa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SzVzVXBLWDNKMWdWRkZId2FqcWp1U2xPVGJVSUhFUmdVQ1RiS2Y0NWJRM002?=
 =?utf-8?B?TjRmTk5XamVzbHg3anBHb0N5dUJnYmpVay9DZmc0TXJudzlPMUtvOXczMFlY?=
 =?utf-8?B?Yy9BS0xYQW82NUo5V251N1Y1amZCTDNCZW1wZm1Hd3ZtYnpPMmFMRVJ0NDEv?=
 =?utf-8?B?QVh5anRUSnk2cXRTTUxqeWh2TW5IVEd0Q2FMTDJKVXhYOUFxTmZaUjl5WE1n?=
 =?utf-8?B?OC9XdTBnaDRLUGlZYjA3eTN3ZG05ZUQ1QjZYSE05eHVxdW5zVVRlcnoyelk5?=
 =?utf-8?B?L1p3YXNTdkpTSjBoNW0ybDdJaUJSSE5FQ0VTMWFYNzJiRDRMcXBKaDRPMjRh?=
 =?utf-8?B?NlRBTDZsNnNydU9GaXRZcmpubzMvNEtWcSt1OGFzWmpzNzltbThkU28rWklx?=
 =?utf-8?B?MFI0SHFBbU4zUytMQU5oeWs1Qm9XT3hPWXN1M3Bkd0dRT2tLckl4NVI1OGtr?=
 =?utf-8?B?cTZvaUV6cWlMWnh3WG9sZFdOeDVkdmhwT3lkU2NVSWlGb2gzOFJIZEVaajZK?=
 =?utf-8?B?VW8vbnFqM3BsdTVRcTl2VzNMb1lwOWhEeGR0aXAzN3kxS0k5VklNcldLVkp6?=
 =?utf-8?B?YnNLYXFQWmp2S3F5QlRaMUVSR253YlNRTWZ5bUVCSXdMQlVZdVN3UVlGWDAv?=
 =?utf-8?B?ZnF2T1AyZllNQlFCbFVaWXlTS2g4dHRMR0xWR2Y4RHlqbHMxS1hpdGkzbkZM?=
 =?utf-8?B?QVl4bWNVYUNaTVRCemFlZzVUWmhvM2NBdGdUMm5hNTg5QTQ4ZGpBVkVTWGU0?=
 =?utf-8?B?V1FqWUk2NTlQWmhKdUtUQnBSNEJFRnZIbGNwcXR2OGc4cHdiWmZaVUVvT0tN?=
 =?utf-8?B?aHFrQ2x4MjdzM2s0NXEyMk9IU3M4MWZwRXVVcVp3Y0xCWU52UXR3SXVTK3E4?=
 =?utf-8?B?dlFYT0p3VmF2aVQ4ZVE3ZUswM0N4NVlBZzg5TENYcmxkWTlxb3JITHJxMml5?=
 =?utf-8?B?c3dPU1N6cUwzWWhaMlNsWWVqaUVNcDFtVFNsZ0hyU0g5d09rYkF4cXFjWitH?=
 =?utf-8?B?MlFWdDM1VEtNblh2dEQydm9qaG9YcnZPbGVhajg4MlZveStrU0M5QlVaOXJ3?=
 =?utf-8?B?ZjhNK3FCYjB3NmtxSHdFdGFqT0JyT0xVckFnSC90Y3AyRi9NaUwwK0Qva2N5?=
 =?utf-8?B?NW9wbVhBWkZ1TXZRNDhiRnFFVzhSc0NkZUMreXdjU3J5bzdiSjlQMU84MW5G?=
 =?utf-8?B?SWN4N01wR3l3ZS9nRmwrSUJIbHZucW9meEsxZWlHWkVJdkJRQkR0VUJoV1pX?=
 =?utf-8?B?Wk9ZTHZZNThOTUpWS2l6QktmWDBxLzVrWDUyOW9jQVpmUmpHbnlEajVCV3I4?=
 =?utf-8?B?T1ZvRG1vWFI2aEJBbWlPTUhOQ2d6WENsN3pMNGwwSUJUdktsTWpyV1NwL2p5?=
 =?utf-8?B?MHRkVUcxQlJhakh3Z0NNc1k1UE8xVEpYQ1p0bU5IcmxEaW9BaGt5UkcwM2M2?=
 =?utf-8?B?SE51OXV4VDdBM0JaTHYrL0hQUnZhOXc3a3dySC9qN1Y2NkhRTmZFdzROcWhN?=
 =?utf-8?B?U0IwYnRnN3c1TEFUSXoxVURPSFZOQnhBL1greU9DWlFlamNNdHA4ZmJSeWdF?=
 =?utf-8?B?UXFTWjh3Q2NCMTZyVi8xY0Q1cStjbTNMaEFvL1ZLSStpUUpEaDRWRyt0R3Rr?=
 =?utf-8?B?MWdxQ3NQZEVuZDk2NW1TSFNMZjdqYWloUFhLUEJHeVVGNlRncldkUkZKVHgy?=
 =?utf-8?B?VWRxQUx3NlEwUHh3MG52azYxeTB3SHEvcjE5OHl6RVJ0dU5LL2FIdDdjMEd2?=
 =?utf-8?B?aE5ONTcwMS9CTFpwQkhKYXBZaitrK3BHb2tuZ2JiSGpkSFA2d2szdFdqR1B5?=
 =?utf-8?B?bEt0YXk5QndZV1dCZzhDRHlCMjNiN2wwZjljbDBMMzY4SUdRcUNBU3grK1Jn?=
 =?utf-8?B?cjcya1dUYXNRUXpoVGhUeXM1WVBXak40NHFRTlhoOXJZNnRsUkY1aFBWVm5u?=
 =?utf-8?Q?EFRZUvQuIzgLeK4lqt2yeTWr3E1fnxC3?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <66D912F7860ACF46B72E85E60E0E68A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5799
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6f388fad-bd9e-4384-74c4-08dd502b22aa
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|14060799003|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2tPNUVDRzRzTFdEVGpsU1RFM3RGL2owc05BdlB3UzdwQUtvaE1pWjVTb1hZ?=
 =?utf-8?B?RElvWEVUTjBCWTgwRkV4RGkrMGRvY2V5Nnh3ekJGK1dadElMNkh0aE5sY3U3?=
 =?utf-8?B?UnB0Ty83UExlZld0NEkyQ3o3RDU5L3VwcHoweG42NW55VCs4V1NIQ0hzd0w5?=
 =?utf-8?B?REViVUg1T0N5U0M3VklHdVJETFZYZ0EvYmZBNStGR0oyL1hIcS94enlOWlNk?=
 =?utf-8?B?aUpSWEt2L0taZkNnRkVaM3d3d05qLzVqYTNoeENNOXhuRFR5bHRTb3RORnRr?=
 =?utf-8?B?am9ZUHEvZ0QrS0tUMjkrRzFBWm1OMFBLbkpHUWVBZXR2TDF4N0dLOGNtZ3BG?=
 =?utf-8?B?TlpGdjlhdVNlUC9KWC9BaGl2NzJja0lJQXZVRnJ3dTRSWkloMTZjUkg0KzNH?=
 =?utf-8?B?aVhOZExiOXdaUXJuYnhleUJLWEVFRGJwQzhOYThHUHJ2dnpVeTZnYWduSUJh?=
 =?utf-8?B?SWlWcjg3UTAvS3RiVk1oTDJLUDg3VmFVUUVmcjBGWWlkU3VSbXI4RHR0Ymtq?=
 =?utf-8?B?NitJR3lhbnJZVXB3Tk5UTmVhOFptbEJuZ0V2Zkg3TzVuUGVsVEVYMkRhcVBO?=
 =?utf-8?B?bk4reTZFUVErTUh3M3N2RDBVeEg3NVNJTnN2Q2MyaDJROWV0blNTR3NJTGJF?=
 =?utf-8?B?dElnMHR0N3BBa3JycWpGSmRVUGRJNElySlFaTTg3cGxIZHN1TmtNWnc3WnlZ?=
 =?utf-8?B?QmRTK0VpSFdSSExTZ0JYclVIbmtsQktYclRuT2NFelBBeGsxMXpvVnNpM0FL?=
 =?utf-8?B?NGxmbE41d0Z0Q2tiZVZCbkxmNzNyak5RMk14MEc1NXY3SGVaZzRMNlptaVhk?=
 =?utf-8?B?M0R3WmcvZzlTSDFLUTJjN0tBb1lodHpaRG1qeGZTRkF3TDBiLzlKVVNiK3pH?=
 =?utf-8?B?QTRzRzZOSEhzeW9Qa2VtbU1EK0Y3dU50NXFPY3hIYktmMXVsNUdKU2x3akgw?=
 =?utf-8?B?MG55dEV6MFlpREN2MXlPRkwrdWxsQ0ZwdWsvMkE3b0FrS0EzVDB1c1BCaEF1?=
 =?utf-8?B?U24yZlNEV3VrWEFXZzBIOWNJMFZTWWJPeTdtTnZTc0FqeUhCd0FMS0tjMExt?=
 =?utf-8?B?RW84d09PRWV0dnhnUFF4TG0yK0lmd20vRmhqNmU4Tk54bTBFajdWUUZxY1JP?=
 =?utf-8?B?TUhUVng0dUxyKzd6dFd3NmtRQ3FMbXo5VjIvTHRvQ3lyVHBzUHBSRk9FQ2dD?=
 =?utf-8?B?akkvZlJzTGlJczRiUUd6K3RuQ0NEOWdyWFVoT0h0QUZXNzdIZFdLRVcvdncw?=
 =?utf-8?B?WkJrNnNzSUVsTkIwTmY4QUFOOUFhYlJqSjBXSUVxRGdLaUg2b2lVdmgwc1NK?=
 =?utf-8?B?Y3lFQzN1OHJVT3hoK0xZUFJjYVZOS2d3UTk4QW5yUkNnSDlEanVXb3NkdFNo?=
 =?utf-8?B?VkM2RS9LZ2RsNjBXbENNSW02RnFtdzV4eGNSejgxeGRSNDgvaWkrdWdjN2RW?=
 =?utf-8?B?amJieTFwdDRVRnE3bEpNaWdTTjFNTSt6djYwWnRRQUpReE5CMkdzNEk1Mzdw?=
 =?utf-8?B?UVArNFVnMnlQaUZUV1p6OFhXZGJWY0E1SEhiY1BKTmNDcWRydFBaaGtURUlO?=
 =?utf-8?B?aEp6eE1tVnMySnk3TWgzYWExZjU0MDdCd3k3NGtwZ1hId0xMSGp2WGZuajRz?=
 =?utf-8?B?MklNWUlVNXZxOFVZNEhGL1JPSzB5WkJzN21vVDc0dElNM0lZNlhSSHlXaTc5?=
 =?utf-8?B?YUowSGNjZWU4azVuSUJLTGF6UFR2Vk9OdVpvMTU5S1JMN3dyRkpBR1VQVXFz?=
 =?utf-8?B?MTF5aDJpRjlMaU8yWUpoWVpCd1JDa0I3MDVCMmtOQTl0UmFram9LSlZZVVU3?=
 =?utf-8?B?V1V5YUpST3RvZUUzcGhhKytrMmNYSmQyMUhBMWFXeFJhZXI3R0RqeWs0aEdJ?=
 =?utf-8?B?YmVQWHNpSmczQzgrUUpLUitxdHF0M1hSZGtxL2xjOUc2eTFYNFc1ays1anp3?=
 =?utf-8?B?dVRJZG83ckt4L2ZyRlZSRHV2akJ1OUxjSzFnamVCMlhUb3QvL3BmTlYwTEdu?=
 =?utf-8?Q?eGmnsksf3E6vPjJs4SBq+w2d8LpT4I=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(14060799003)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 14:47:25.1954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acd48d26-6344-44d8-d87d-08dd502b28aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6466
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 14:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211625

T24gMTggRmViIDIwMjUsIGF0IDEzOjM3LCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBUaGUgZW52aXJvbm1lbnQgdmFyaWFibGUgU0VUVVBUT09MU19TQ01fU1VC
UFJPQ0VTU19USU1FT1VUIGFsbG93cyB0byBvdmVycmlkZQ0KPiB0aGUgc3VicHJvY2VzcyB0aW1l
b3V0LiBUaGUgZGVmYXVsdCBpcyA0MCBzZWNvbmRzIGFuZCBzaG91bGQgd29yayBmb3IgbW9zdA0K
PiBuZWVkcy5bMV0gSG93ZXZlciwgaXQgd2FzIG5vdCBlbm91Z2ggd2hpbGUgdXNpbmcgZ2l0IHNo
YWxsb3cgdGFyYmFsbCBhbmQgc3RhcnRpbmcNCj4gbXVsdGlwbGUgWW9jdG8gd29ybGQgYnVpbGRz
IGluIG9uZSBob3N0Lg0KPiANCj4gfCAgIEZpbGUgInRtcC93b3JrL3g4Nl82NC1saW51eC9weXRo
b24zLXNjYW5jb2RlLW5hdGl2ZS8zMi4xLjAvcmVjaXBlLXN5c3Jvb3QtDQo+IG5hdGl2ZS91c3Iv
bGliL3B5dGhvbjMuMTMvc3VicHJvY2Vzcy5weSIsIGxpbmUgMTI2MywgaW4gX2NoZWNrX3RpbWVv
dXQNCj4gfCAgICAgcmFpc2UgVGltZW91dEV4cGlyZWQoDQo+IHwgICAgIC4uLjwyIGxpbmVzPi4u
Lg0KPiB8ICAgICAgICAgICAgIHN0ZGVycj1iJycuam9pbihzdGRlcnJfc2VxKSBpZiBzdGRlcnJf
c2VxIGVsc2UgTm9uZSkNCj4gfCBzdWJwcm9jZXNzLlRpbWVvdXRFeHBpcmVkOiBDb21tYW5kICdb
J2dpdCcsICctLWdpdC1kaXInLCAndG1wL3dvcmsveDg2XzY0LQ0KPiBsaW51eC9weXRob24zLXNj
YW5jb2RlLW5hdGl2ZS8zMi4xLjAvZ2l0Ly5naXQnLCAnc3RhdHVzJywgJy0tcG9yY2VsYWluJywN
Cj4gJy0tdW50cmFja2VkLWZpbGVzPW5vJ10nIHRpbWVkIG91dCBhZnRlciA0MCBzZWNvbmRzDQoN
CklzIHRoaXMgc3BlY2lmaWMgdG8gdGhlIHB5dGhvbjMtc2NhbmNvZGUtbmF0aXZlIHJlY2lwZSwg
b3IgY2FuIHlvdSByZXBsaWNhdGUgaXQgYWNyb3NzIGEgbnVtYmVyIG9mIHJlY2lwZXM/DQoNCklm
IGl04oCZcyBzcGVjaWZpYyB0byB0aGUgcmVjaXBlIChkdWUgdG8gaXQgYmVpbmcgaHVnZSwgb3Ig
aGF2aW5nIExGUywgb3Igc29tZXRoaW5nKSB0aGVuIEkgc3VnZ2VzdCB0aGUgYXNzaWdubWVudCBj
b3VsZCBiZSBkb25lIGluIHRoZXJlIGluc3RlYWQuDQoNClJvc3M=

