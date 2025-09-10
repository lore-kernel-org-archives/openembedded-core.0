Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AF2CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 14:41:42 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.11])
 by mx.groups.io with SMTP id smtpd.web11.19952.1757515294448269326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 07:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=onfK0Ol5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=onfK0Ol5;
 spf=pass (domain: arm.com, ip: 52.101.66.11, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WWRVDlFyNsftL38V9afecoO1TXQfUdpXSQ0zM2TxlqT6xSRQlO7Am31Aq8JwSeLjCZ9vcaVQLxTvomUk4shD6h2IBzODwZbU5wHNQfze5nBBbAT+/IDHZScZsczcJVX13X2bSZa8seRoK/CYTG9wNGhhIgNtkYS9aCOP0eMXtluu6x+BLCywSVLyZkKHaKZUNBmyIpltedOMqog9OzA10kAZU7Ylq1u1IVHYIie7UFOv8HA+iwvcflVVXJIh8C0St2VnDsBlZtspYAwmqIVyOILG4Q/sTKdwvnh8y1b7EKQFiMsipn519UrnrWyvGpaYMdEM8kJZ4ipzURez9AUrdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdGL0qhuzdZf4Sh4xuxj3E65hF5N3y4lonlv31DGeX4=;
 b=ok4FQULmKPd3Rh09CjzOU6SfVyPGzYX3gpJGhRN8VxaGqFeuLQlI8CbHkDQC0R+E39T0AxjUFEysCtc5Td9AUHA0ObTIQmZ1C5bq0YYN9MJOGbkTs+P9QbMmgk/08KJjo/UhUaDlTecqGM2SHcd321u4wcIAJtbaSm3HCSTd7VChvkUqz/Qk2X0T+phKEXqh+cR79S33hB/mLFo8tEvLR7QhGXix6RlzzTb96r0JsfaPivqIYDqHYFPrgxVdCZhS4/LS8QUcLJ6COsjyXsPrcUH5Ls9Ee4t71nDIShgn/G8XKmU3OUNXC7+MlRgdcOxwuB7sC7k1WnBVrCqXiohkiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdGL0qhuzdZf4Sh4xuxj3E65hF5N3y4lonlv31DGeX4=;
 b=onfK0Ol5mzZ74MsrmHu+bJi9ofBVuwauwGEyFKFjdOKn11ZReCbMGzxaYrrthW69Hr0HLJwfVbKq6r09GoNM8d8UHihYT/2RghaaEGALv41UpyJ6cdGvsUCB7sehQKMhu4QvBoJTGDy3dyB8Om2kZuGJw/ZJthNrMQLeU/OOmjM=
Received: from DUZPR01CA0225.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::22) by PAWPR08MB9968.eurprd08.prod.outlook.com
 (2603:10a6:102:35b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:41:29 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::da) by DUZPR01CA0225.outlook.office365.com
 (2603:10a6:10:4b4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Wed,
 10 Sep 2025 14:41:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Wed, 10 Sep 2025 14:41:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxTKmTOUeDWYicB3CbhirEBkCq9kh3kjNch5sz9jo7ENGs2tQHZKoGrJ4nh7Wc3qsY7sRxw9ThXFoqITsQN+v4kt9m1kouZDE+Qg/S+IaTBBHxPO26AMcYEsqkz7nXbWd88yvy+fKTOTgzX/Sk1HamkkguzEbUDBgsNhBEHt9kmtyCF9ZEMJ1Tx2CtJFmv5XNb1UfahxcBKfWgJnl7NHC3SuD5QNDx2zUI0pTVODnc5GkvJqLGVYYHI6XgSL2MIDyHiwcaJnePH2ei12ne0CoeDwUycclDKZEfnpjOV0pC3+gpR7m9jAl58q2PE8e0Xw8veDYoRu4qP7d2XexzBRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdGL0qhuzdZf4Sh4xuxj3E65hF5N3y4lonlv31DGeX4=;
 b=xDs7ohg2Kd7kIjxmpFHVwqV+OrWGemoTgMKAAs0LjtvQwDDXI9Rz/ggq5sAcxJIQqKGrKosvRkP7LyqZzcCarF247+3qCSl2e74oldDwcUDxEJM/h5ZLTe35SM/H0knOogydT0Xru8xPOrA+4z6BgUmoeJjZWU+EBw0WG0Q70fIvNtxa+kuTnk6SfCm6/fgHsRXJrqxJNUWdp90eFTFANq14dKXe7KSdcTuBa0gYVLdQIPovwoRru4guVbF4q2JO9EWOloo96VIqr+MYXjZGp13Rm8Mc1TdtpxY4yJWpX3I6Fv1XqImlCxgHGkn1jne+1s4MO4kef2Ee4CwJzd/X5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdGL0qhuzdZf4Sh4xuxj3E65hF5N3y4lonlv31DGeX4=;
 b=onfK0Ol5mzZ74MsrmHu+bJi9ofBVuwauwGEyFKFjdOKn11ZReCbMGzxaYrrthW69Hr0HLJwfVbKq6r09GoNM8d8UHihYT/2RghaaEGALv41UpyJ6cdGvsUCB7sehQKMhu4QvBoJTGDy3dyB8Om2kZuGJw/ZJthNrMQLeU/OOmjM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB11014.eurprd08.prod.outlook.com (2603:10a6:102:46c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:40:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:40:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] wic: add --extra-space back for compatibility
Thread-Topic: [OE-core] [PATCH] wic: add --extra-space back for compatibility
Thread-Index: AQHcIlqQ+KJ0FmzJCkmzW37nV+eRaLSMfHgAgAAAnYA=
Date: Wed, 10 Sep 2025 14:40:57 +0000
Message-ID: <60D5134B-0F9B-47CE-A160-A96877EE5A4F@arm.com>
References: <20250910135508.2383081-1-ross.burton@arm.com>
 <c6eb2187-b5ac-4a51-9bf3-e7fffebe969f@cherry.de>
In-Reply-To: <c6eb2187-b5ac-4a51-9bf3-e7fffebe969f@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB11014:EE_|DB1PEPF000509ED:EE_|PAWPR08MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: be95f646-ad10-46df-1e5c-08ddf078210b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cktIa3JlbnpCLzM4MVZvRlNUOXZRdkRUYUNPTnVxQWQwaVJJL01jMkxsKy9F?=
 =?utf-8?B?OC8vd09nK3dLU1AvbTl4aVUwR0ZBVWxkczNXdzBRRHgvR2hWLzhIYkN0cHcx?=
 =?utf-8?B?VmNoVWFDZFNwWXVTeWt5d3VaaEp3MkZJejBGV2JnclJ5S3V3anozbzdzVmNa?=
 =?utf-8?B?RFFMcm5CVHlmd1dMbzJZWXV2Wjl0ajlFcDhBU0Z3TXFDenVpYTZtbmR0QStG?=
 =?utf-8?B?Z2ovaytwWmxvbHc1aHlKb2RHWDFJVGFycUZPbW12TDNWczlrbWE2b25OM1RR?=
 =?utf-8?B?QXFlUzREU0RXRFlPbzZFTlFJL1V3ZXVPUEVLVjBQQU5SMitYOGFaQzRla0lz?=
 =?utf-8?B?M0VTWFFJbTdsWGpWaHRRZm1KTHkxMXJJK3ZVaDlTTXRaSkhwR3N6NG51eTNP?=
 =?utf-8?B?NkQwL1RRbnJmRmJJaU1MWGwzdithNFdxbkNwZG0rWkZMYzZqaHNnRldWMmFN?=
 =?utf-8?B?ZmhXS0F0MURGUE1ZRk85QmlrZGl2bzhocWY4UmpJTys3aGlTMmlLUXR4ekJC?=
 =?utf-8?B?V3gxTjJnY2RwUkdHa0lrRm5oemZoZktMUFNzOU9DOFUrdC9xU1RjUHdWZWc4?=
 =?utf-8?B?UjlYeVB4MW96aVFwNFhleHdwSk1vOGRHYmlnUmYyTTJYVFFGc2ZYc0Q0ZlM1?=
 =?utf-8?B?cC9sY2RXU1ZFaElkWmVYSjd3N0lpcDF3VGt5cG50MHB5cXZlUE1tQUJ0NXky?=
 =?utf-8?B?T2pWdHVGei9DKzlNUkJOblFFOFNTcGtrV2ZZMGhKc0Fnd2t5RmtXc011THlX?=
 =?utf-8?B?cFNDZUxoUlBVN2lmbzhIU1M3RnA4cWhjczhudHNRQytibXpQVzZtU05IS0k5?=
 =?utf-8?B?T2dwc05yY01PVHpMeGFEL25wSCt3R0xaYjRETHVrQzVJRlE0TjBrKzdacVQw?=
 =?utf-8?B?RkdOZ0hRcTUzWVB0MHQ1WUdyQUtiTVRWcml0cktGYTgzTGRVbzRhaVpUeGdQ?=
 =?utf-8?B?Smw2bTI0cDEwWTQ2K1dpbTFxejJwdTRUb0dyRXcxa201Njl1cDJvVStxRGRB?=
 =?utf-8?B?b01USjduVTVJcXZsY0VsaGtqRk5NT0VoQ25pVmZnbjNacjVhUWtJK2FvSUhw?=
 =?utf-8?B?TVJtZ1d0Tm1YZm9wNnZUSlBqMlR1b0RwRFJJK1Q1NjluOTQwNGNiVmFaSS90?=
 =?utf-8?B?d1N2Ym43cnJBaEJtSUdmWUwzUWtvcUlHOGVQck12dHVud29JaU5WL0VnQXF4?=
 =?utf-8?B?U1FIcExYNmE1dlpKOFZTbGY4d3BMczZBRW1sRmVHRHhUZkVjNTVxYXFZeE5X?=
 =?utf-8?B?ZXVwSFdjOFluYVhmTEFkb2t3aDd4aDRMbkNicExoR3Zabjh4dmJjMTRxY0Rr?=
 =?utf-8?B?L3lWVFdMa2FJRXI1YVdPMHFGeDQxOVNYUFVrcXpUd0wwVFRkTWVSempMYWhQ?=
 =?utf-8?B?QXdidlFuRkUzdmlpZWpCeXBrbTVlL2NqLzNPSWcvRStsdHpqSTdteW5iTGFF?=
 =?utf-8?B?bFNDdlNFNU5JWElFWVY5MGh5V2M0MFcrYW5JWi9VVkQ2ZWc1V05oa2FCNmwr?=
 =?utf-8?B?Nml3elR3dGZncEpISVR0WjZjRWIvSklnVTk0SXdkRmJaTmV4NnRnZTdWS0Nu?=
 =?utf-8?B?enhDNXY5OWplaFE5RlZvY1hSMk9tK25vRGJqeGlLRUtNK252dThHMlRjdm9i?=
 =?utf-8?B?V2Q5WlVidWk1Qm5sRVZ4bHlWZFRhRTJIeU9VR1RENnJ0RGFZYTNMbW90MHAw?=
 =?utf-8?B?cjlyVXBUajFSOGVtaFhhemtxVTNwSzA1bjIyMStacEFacENaNEJ5MEZtRXpk?=
 =?utf-8?B?NDRndkdrV3YwVHdlRlUvVmxPWGN2WmV2R0VOUFc1QjkwV0M4SDNXOXZnTWhk?=
 =?utf-8?B?NnNpNDArOHZ5VzJmcVc5OWE5Vmk3dGsyTWlpcit6c0J4U0F6djN0Z1d1NG9E?=
 =?utf-8?B?aHF1RDBFQ3hydndTcWF6MC9Pa0VhRmxxWDl4d2I2TldvQjBQMWgrdHNRRzA5?=
 =?utf-8?B?dUI4VE8raDVsUUFQc3krbGtBZTUwRFJTbDZJSDVRSlQ3T1g2cHVHWWg4YnBY?=
 =?utf-8?Q?QHy7hgKX8i7BHxdj340wJPV3xMitag=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B08D8DFADDA714C8A529CA77D0A8A36@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11014
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	55cdc537-f4ae-4cac-fbce-08ddf0780dea
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y1hkY2JpbHljZTlVZFIyc1dES0IzbTNTUy94TU1sK1lKRGJRbDkxSkhDUDBq?=
 =?utf-8?B?VUVDeUF0b0g3ZW1pWDVzdEhKRWZvTnFqMnJTanVmbnJrWS90b1FqR2ZRV0Ju?=
 =?utf-8?B?SGxuNDhNYmdqZkUvYXY4UkRJNTZRMGRoM0tLb3l0ekFvaUZRempsb1FGRXcy?=
 =?utf-8?B?NWpxd1g0cGNORmRGbFQvMmxFSi9kdVB5MGpaOG9KRGNyRzFTSlNpbWI3ZHVo?=
 =?utf-8?B?OWJTb2s0S3RLY2h1T3poWmlWaHA2a3UwSDkrcElOdStvWmp2Tll4d05WK0ZI?=
 =?utf-8?B?Mld3ZnEwNC9QVTBPRU1WenhQeXVpY2owN3VSZSsvWm4yMEx2NHR2ZGEyenN0?=
 =?utf-8?B?T3d2TzJ4aU5OT1JvTlVETnZTOVdpajNMOTh1RVNsSEZzZk9XaFk2dlhKRHcv?=
 =?utf-8?B?S05BK2NsaHV2VFU5UG1tWW9mS2VFVWxnTU5INWFBcG5lUGV1dE5lL21ybEd3?=
 =?utf-8?B?SjVSSmhhUUpSUTJrM2tpM0hId3JYaE4rZGwxR2ZxQzhHM0tUTWRUeVdjeFdG?=
 =?utf-8?B?N2gwenl0emZHb2cvYjY1S29TQXpweW1oRGJ6b0N3eTk2YlVHNjRQUTZzVzA3?=
 =?utf-8?B?MTM0NGRkNHB1RWxCOURFSkpJTXVIekRMb0h5QnBzVkh2NjFGTHNXcEtrWGxs?=
 =?utf-8?B?bnNmaTRoeVFwQlluYmFWOFRkTzBSL3lCSUl6bFh6bVh6QlFLdit3bzMwTlc2?=
 =?utf-8?B?alZSazY2MmYvTnpYRnFsbjRweE1zcncwRUhhUWhxNEJrYnRzZmFzUEFIY1E4?=
 =?utf-8?B?elJ3Y0RLQjVGbGRVdWR6Y3ZYZmFQUmtoc3pUNmU0NmlXUmtvZTFocXpWRHlp?=
 =?utf-8?B?b0JiY3JaekJ1UVlWSEJVM3V2UGpTUTBFMmphK3dzNG9RYlVzRnFXTlYwV205?=
 =?utf-8?B?b0ozWGg1Q3hMSXRnNEE0WWMzanZpcWxqNTdLREVrek9EUm9vTFZEaWlNTVc5?=
 =?utf-8?B?bWpwdEcyMzBOZ1Q2SlFmQjgycjJBWG5WZGE4YjF6UDY1SE1UQUhtTjVTTGlC?=
 =?utf-8?B?ZkN6OU02eGpVMEtGOFBNQTdVK1NIdncyNVBQdXdqVXd1djJDQVhZbXZTOUZz?=
 =?utf-8?B?MkM5ZTNPMzRMamh6R3VVeXl5L1E0TnJaNUhxdU1mYXdrWWhwcnh6WTVSakx6?=
 =?utf-8?B?R3lWVGp0bHZ4MlVqVm5lREJvaW56aklxaDBFRmZRR3B2bm5wV0F3emdFVzlD?=
 =?utf-8?B?MXNXalZLN2pkUEc4UlVrTHNTajdDcWlGQ1dZU1lFVUw5ai9QZlczNm9RZEtS?=
 =?utf-8?B?WDhuT2ZvOGJlRmNzQWNOczBqQ2RjTGJmNi9hb051Z2hpQWF4ZmVPUnRCT3R4?=
 =?utf-8?B?eXlINEg5dVJIemxuSExzcU1oVWEzelM1Y3VYanRLTXJabEJ0NTRDanNrUG9Z?=
 =?utf-8?B?UHhhN3BjL1libTZWV1pVS0duNjEwYTI0U2pTbm5EaThlc0NSN0Q3QTNHTzJL?=
 =?utf-8?B?VElqY211RWN4Qmo5YnVDWTRqdWh1emxoTEhTS0N1dnQ3OXU2Q09jVkQ0RXdE?=
 =?utf-8?B?elFDdnVrM3haYlF0NHYvSUhvTXZwTzhoalhrTytaZElNMzZaa2F2TWRGK1hI?=
 =?utf-8?B?NGdWbFdOUUN6RUlrdVZaOVNBdlQ4V3RRU2JQMDdWY3Q5aEN2WVRiTlRzTXZW?=
 =?utf-8?B?emhRZ29GVUl1bkk1bEpBOEszdHRuZ0Z5YXVmR1pVVkhIVHRhZVpsRU11cW9q?=
 =?utf-8?B?Z2xKUWlid3BkdmpBWWtWaVlPK0lHVldCd2hzSGc2VVc3OFdmSUZxODNWSitr?=
 =?utf-8?B?YXJsekIrYmZ0WkdaUXhmblBrU3BpTTJ4ckV6aDl2T0FoTmRRVkNlWUs3aEc0?=
 =?utf-8?B?VEhtUVF5R2M0SDB6TXg5SjJDZkdTb1NzNXVVN0ZMTisza1UvbG9hYldsNDdZ?=
 =?utf-8?B?OHg5OUlqemFIZ0R6OGlBY2E0Tm1BUlhaN2t0ZldYbEYrNFYrSFRBZFZrM0hP?=
 =?utf-8?B?bGkvaVFKOWY4ajdITmp1Yjd6c1NOWWl6SFBTbVpMYm9XSXlROEp2Q3Q4Z1h1?=
 =?utf-8?B?dGVsL1ZndE9rK3g1YzNCcUFDZ3dWRWxtaW1CZ3Z6NGJBQVZNc09tRFEzK21U?=
 =?utf-8?Q?ojC35P?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:41:29.7151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be95f646-ad10-46df-1e5c-08ddf078210b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 14:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223222

T24gMTAgU2VwIDIwMjUsIGF0IDE1OjM4LCBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPiB3cm90ZToNCj4gSSBiZWxpZXZlIHlvdSBjYW4gc2ltcGx5IGFkZCB0aGUgc3Ry
aW5nIHRvIHRoZSBleGlzdGluZyBhcmd1bWVudCwgYy5mLg0KPiANCj4gPj4+IGltcG9ydCBhcmdw
YXJzZQ0KPiA+Pj4gcGFyc2VyID0gYXJncGFyc2UuQXJndW1lbnRQYXJzZXIoZXhpdF9vbl9lcnJv
cj1GYWxzZSkNCj4gPj4+IHAgPSBwYXJzZXIuYWRkX2FyZ3VtZW50KCItLXRlc3QiLCAiLS1vdGhl
ci10ZXN0IikNCj4gPj4+IHBhcnNlci5wYXJzZV9hcmdzKFsiLS10ZXN0IiwgInBsZXAiXSkNCj4g
TmFtZXNwYWNlKHRlc3Q9J3BsZXAnKQ0KPiA+Pj4gcGFyc2VyLnBhcnNlX2FyZ3MoWyItLW90aGVy
LXRlc3QiLCAicGxlcCJdKQ0KPiBOYW1lc3BhY2UodGVzdD0ncGxlcOKAmSkNCg0K8J+kpuKAjeKZ
gu+4jw0KDQpZZXMsIG9mIGNvdXJzZS4gRm9yIHNvbWUgcmVhc29uIEkgYWx3YXlzIHRoaW5rIHRo
YXQgdGhlIGFyZ3VtZW50cyBhcmUg4oCcc2hvcnQgZm9ybSwgbG9uZyBmb3Jt4oCdIGJ1dCBvYnZp
b3VzbHkgdGhhdOKAmXMgbm90IHRoZSBjYXNlLg0KDQpSb3NzDQoNCg0K

