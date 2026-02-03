Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E48E83069
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 09:13:44 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12664.1770110018832705455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 01:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=okhOf8dm;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.49, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFmu3I9hbv5vUk3FnlCYPkaVGPVPj/y0fo7zvy/T8e9J5S591AGEfXBNgxM0qOjVfaVgf5DJsW2ZAnViN3lVPzLnjqUpIXkHty4l+WBlmBvLCTeIVfCJPQ7ugd0YFIpC6nkffTgIPJw7TGKgDCHRY0hGtFike/ZwZ6J+5HoA2aFVA68932lw7q51OCY+a75bttrk2XFnLlfhZq9WsSHZaeGbwxJpLiN4H7T8vZWKI3LfBYIkGN2hRk4UkFR2R4bspcX9rb7SuE7yjI2xdLLEhnxdsUy0GnBysyhQkbiAYCtyVoPlPf2ycjzZQ/Fmy1p3Eni3szz4VAV2i9saloZ8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxEA8okBRE0BLcaQbnU1NTnnmF1sMWjO7kqxJpdT30M=;
 b=dyPm7oZGGfBdxxgkseKm3eCy8S53xtwjFWk7b1cnSZQInIDDz53DKKwL2VWi6n7LoV6Nj2ksgRFaJOycwk3sB2gA6ATdQd33Wa/oDg92mbIqfY4TeYh2PizFaSUN9iPkH8RmTLe4btFxYK/0ICJqsGTjtDwNjCXhFW9VOUtbL+xPi93VVFflGn7CqIbPV7cj4BoaroYoATPPMaENsOJAjN7x8R1pTIZqIfMAG2kUJo7W7zPEWWXp/d1lKXZXyWx/4Toumh/UWBZ0ycoJ5Ue9S6kkL91otwdGkLlbtT+t8GIU+9u5qpHMa8pU+TdPDCaYHCl+797Hla/+e7MIuK/W/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxEA8okBRE0BLcaQbnU1NTnnmF1sMWjO7kqxJpdT30M=;
 b=okhOf8dmNPJCURc5+/GvNzwWn5ynOeucD2Zmn+1qNpDDA0/6TTVGPXF8GPtLV9+uUnkqcxL1JJtwGdLA4Js7J9tatJSTvo8KnNEpFFUTr68VLgK9PNMHCki+I0+W6ZpLxQ9Soe1ZkthTvyYuuBWDlp5KaKbuSSoMltzx7lRxlxaQ+3QBFWgrd46AZXUnY8Z/4hT84em2KRMyoWcq2e+0HQJVE9LgdlW1L6MFLHa4AFktPmdo+Qw5kf/C0iMKNmN959ceqnNdjUSP2+1YsWKqmNkUq046A6XNZfYrYUqmU9NnOE/AQnFg3pHkNPnMiXYUN8nYnmGC5O7f0F97BvZNlw==
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TY3PR01MB10387.jpnprd01.prod.outlook.com
 (2603:1096:400:253::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 09:13:34 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8%3]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 09:13:34 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 16/17] python3-wheel: upgrade 0.46.1 -> 0.46.3
Thread-Topic: [OE-core] [PATCH 16/17] python3-wheel: upgrade 0.46.1 -> 0.46.3
Thread-Index: AQHcjsDC1KJcyp2YnEKoPdFnjY+xYLVnzUOAgAju87A=
Date: Tue, 3 Feb 2026 09:13:34 +0000
Message-ID: 
 <TYWPR01MB11861B4947B9FE63E4DDEE869DC9BA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <20260126123844.1052-1-wangmy@fujitsu.com>
 <20260126123844.1052-5-wangmy@fujitsu.com>
 <DG0DGSLH43T6.27SQHKZ8XUB43@bootlin.com>
In-Reply-To: <DG0DGSLH43T6.27SQHKZ8XUB43@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NmU3ZmQyZDAtM2ViOS00YTgxLWIwODktZmU5ZTVkODE2?=
 =?utf-8?B?OGY0O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI2LTAyLTAzVDA5OjA5OjU3WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TY3PR01MB10387:EE_
x-ms-office365-filtering-correlation-id: bf9c0a9f-34e3-4606-c851-08de63048228
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|14052099004|38070700021|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?M016c2pvbDV0MlRzUGdqbXM1T1QwcnMzeGgzam82dWJBaUdnYlhXRXM2UGlP?=
 =?utf-8?B?bjJoSzVuKzdrOWhWTG9aaDk5WTJjamo1SHRGbHBpLzhkQldWakM3bG80akQ4?=
 =?utf-8?B?OFlEMHdYanAyMFBYVWFmTXRBMlRwYUZqdHQxT3NqbGRtdE5vYUoybUFDSjkv?=
 =?utf-8?B?MmcyL2NoUlpuNmhtQTRxcG1Sa2VkTWZqSk1pbFRMZW4wV2FFejBHWitKWlp5?=
 =?utf-8?B?RThUKyt4MVR6dTR0TGpyYmFVZVlJZm43eHZBblYvM0hpWGhoRzFDM05pZGJW?=
 =?utf-8?B?b0Z5VEJEYit3dmh2dklUeHcxTWhzUG03VXV6Z2U5L0k3VHpYUk9hTk9PTW9t?=
 =?utf-8?B?aXFLVWtTaXVlTFYva1BmbkdDUUg1VE9Wei81M3NFOStGSjE1L0N0czhLRUU1?=
 =?utf-8?B?YWRlZzFtRTFwOStTYnJxd2hoUTNiV0tBdkFYU0dCWkFVRHNZTDBHZW5JcGJ3?=
 =?utf-8?B?eWNkZkVnYVdNNGJ3NFBDZmdBRjRSemlJUUtKM0sySDEyRG5rV3BjZWFsNUNk?=
 =?utf-8?B?dGZKTG81R0pITTYvT0NDUzllQUpwL09Ma0gvd1NKUThQUFJmOUM5NXRMdWN2?=
 =?utf-8?B?WFgrZTI4Wm9ZMWQwV2diWXlrK0NnY0NkK0Q3UCtRRXpFeFZzL2pFNzdMWGFx?=
 =?utf-8?B?MHI4YzN4ZXNQSmErVEdBSzZKb0JnMlJ4RWxSMWNLdjNjRlJoRXFZWWpOM0lt?=
 =?utf-8?B?bk5YYy9ZZmsweGZ5YkkyZWdSTG5MMHB0M2dHNTFhTlpMazlnQnJoTWRtTzRL?=
 =?utf-8?B?UUZhZGsvVTlSODJzTG1qTmp3RnBwbDNQZms5Q2hCcFdYM2ZVUGdRQjQ3M1Fq?=
 =?utf-8?B?eEhVU2V3STdpOTQrVjNxUldKOHJ0cXViUEVxcHNSR0NITGNzMkliWlRBQTBz?=
 =?utf-8?B?T2FjNmZHSkR4c2EvNW5abmIvRmJqK3RiWWxrZmc5dDMxZFI4Q1h0YzUrNmtJ?=
 =?utf-8?B?NlBGemxhY3V1KzltVnZNZjQwL1ExZTVib1pIS2lXQXV4dWc0T2o4dGgxUVU0?=
 =?utf-8?B?czFvcVpRWTdWWG44T2NaNVgwbkhDYmNrRFVzS2pNdG03c3ViN1N3SWNVUnpY?=
 =?utf-8?B?WU0rRzJBenFyZWVLZS85VmR4MEtFQzRITXhyWEVPdGhTM2lseC9sL2NhOVRx?=
 =?utf-8?B?VEVKTFUyK2c3SlpXVktRVDdyYWwvOEVSR0lGR1MzWWZvL0pRaklueHA1eGhP?=
 =?utf-8?B?K3YydmxNeFRlbHIxalFLaXF1SzhSK25Ud0FMa212dXFEeit0ZzBGRVN3Tm4x?=
 =?utf-8?B?enZqUmpUREQ0Nm1laWZSVjBoZHZqMDMwZGk2OXgyOEpPb3ZkSHdXMnduQXQy?=
 =?utf-8?B?ays0Z2lRZk1vY2tNcXZnTThWT29jazdWSmpJSFhNSHpKMnhjcHk5WHR3Nm5Y?=
 =?utf-8?B?MDUxRGFNdGJPTXZSTEJPMFk3V0Y5S3hhOXF1TDNacTVKNjFhdFkydzBZODFN?=
 =?utf-8?B?enlsQ3I2bjQ0Vm5uY3FDRlZUN0hYZmNFYkV1OHlvTlBOS2JWS1NMOEE1QVNr?=
 =?utf-8?B?MjhrY2orM1JsbS9LSkVQNkRUN2xuMHdOb1NBTFI0eUZRYU9xZ1ZxZDM4MGVT?=
 =?utf-8?B?NGhhZ0xwVUJWc2t6VHE2V1I1SnNKdVpYZzZDSnk4NmZUZ20raWhUQStwZDds?=
 =?utf-8?B?NU9nVjhua0crNzYyMEpCdE9mVXU1N0U4b25mdVlCSE1VTWlVS1NPdmJiWFpx?=
 =?utf-8?B?RkRDdlNScENNSHNoTlBtakl2QSticXJ2TGJmWGdQVTIrSlYybEtnaHAvaUNX?=
 =?utf-8?B?a25XQUROTDRpcm5KYlViaE1yZG80Wi9PaEZiWmRXK0tTRUxDK2VDM0NTd0dW?=
 =?utf-8?B?VW14MGZucGhMNzJsMUtGZUpBd0ViaFlLNWYzd3RrVDRURm9PWmo3eW14cSt0?=
 =?utf-8?B?cU9HMFhWOW5DZnl4NTdGYi9rS3MyUm5acDFpeFlDekNnVm9LeVJoUVJRRmVz?=
 =?utf-8?B?ZDdoekRwaUtnMFVHTjZQYlhHTXJPQUZuSFV2ejcvYWxNaEt0S1Nib1k4MmpL?=
 =?utf-8?B?Mzl4VGV1SDh5WmNkbSt6QUJXMit0UENRZkh3cmxPZndxdERaSXByOEJ2aVBR?=
 =?utf-8?B?TFlZb3NmU0dzbkYzSFhIbTU5N0VFK1E4TzF6cjh1cllqclo5RzlyYlZkRmps?=
 =?utf-8?B?QTIzbXpuODM0d0NqeUhXWUdHb2U0anFxdEtxL1UrcW5YTmZwaG1YdEllWWJv?=
 =?utf-8?B?WFE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(14052099004)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VzJmbEk2cm1mNisyVlp1MEpJalRpdTJ0ZHlyb2ErcG5wZ3dNaUNrUG1DTERh?=
 =?utf-8?B?SVRDS1JOSnk0b1V1M0JTS0xGekdCVmlFaXkrcGJ0M1JtSXRSUFp6aS9qT3hy?=
 =?utf-8?B?aUR6NXZPa3hKWkQxVzVYSlNtYXEvSEl4Y1BjRU96ajVHaWV0YlFoWkwwZ3Fr?=
 =?utf-8?B?VGdCckpIMVVQNVA5RGJLdDJOMkJiN1ZHb2MxTGdDb3lsdHBnTTRzdnhTSDVU?=
 =?utf-8?B?dllQMmlHZm9TcFJVUGlkTGd3L1dMMW5uNFZBWWZjM3VzR3BSa2EwWXAwUWVB?=
 =?utf-8?B?TUVkeVVSM3BqUU00VE9mUXAxMnNFTTBvY3QrSVNyNUxwUnlyejRXK0FDbE1l?=
 =?utf-8?B?VUY4MnRJcFVqdkJtaWRjY0p6dEhwenRXTmI4M1ZBWkFubUNWTi9qRTlsZGl1?=
 =?utf-8?B?MVJaRFVpK1huaDhNMG4zbWlPTzdYU1FvWmF6UjlwY2s1ODcxYUd6eVBzcnRr?=
 =?utf-8?B?cmxhTTBjRTY0Y1lBV01oK3d6SDNaSmdZTlFVYlZ4QmcxR2NueFJQN2RnaUlo?=
 =?utf-8?B?ZFl5ZFhvQ2lzSjJLUWhYUU8zMlpmamdtS2QxVzZwSjBIaktQckVCK2ZVY2xv?=
 =?utf-8?B?SEFIbUxPeURrTlpUa0h5Ym9zQU5xVWtBUm53eUlOVEFnQ2hEQTZlc05QQ0Nv?=
 =?utf-8?B?cjFkOU5sZ1ZteVl4TVh3SXRpM0pieWw2OE1VREVjcjlkVWtKckUwcEVsWFhh?=
 =?utf-8?B?cTYwc2lza3hJa0h3QVVrQnp0V3F4bmExOXhLNHZtZGFZUVBwNTNPR0N2Q2p4?=
 =?utf-8?B?djlyL1Y4cFdVbGt2Z2psM3Q0bkJVcDlZcm1GbDZtRzByMmFPYXNaSjZxVzlq?=
 =?utf-8?B?NDl0Z24rMWdBU0tMdDhSQ0dzZjhDSXdEUmdPWDlIejA5UWZDU3JhU2NyRlZJ?=
 =?utf-8?B?c1Q0WllMaUhwR0ZIUWpPbGZzZ2lEQ2U5VUk1VFNra3IvRzVLT0FMNWNwRGZx?=
 =?utf-8?B?R3pxN1l5NUtOK05FcEwvWjFreVljdXpxTnRIZXVhcEZqU2hMZFB5UDZlUWFL?=
 =?utf-8?B?cXR4Z3JDZ1JqdFY0S09USHc4QXA3N3cvQ2dlS1NRKzV0ZGU4TmlTOHA4Qy9V?=
 =?utf-8?B?WTdZNXJScmswRk8xczE1RUk1QUpFa3NVdlNPQ3BOQWpsYW9NRTJMbEhwMGk5?=
 =?utf-8?B?d2VEdkZ4N05LY2NBb25kZ2FFaTJvbmNtdm1weUs1RmR3Z2p0T3puUkc0aUhN?=
 =?utf-8?B?VGlNRStRVDk5NnhUcjZKR2dYdTlqMjVFanMvWlhOTDI5Mm01UEZKdTh3SlVW?=
 =?utf-8?B?ZnpvNkFGT043M3BlczFMRzFzTE1zc1hUMUNSWUhLUHVCVk5adldqM0MzUTIx?=
 =?utf-8?B?VjZjTFNuVEZyVGVjWi8vWlV2QVpmRVZxMlZvQ1YwcG9Rd2NpdWkyOUt2Q3pZ?=
 =?utf-8?B?blR3MDloV3pvdDBjSlRFdE9OSDVhOVdyZThGUTUrcU9qbko3Wm1wTFlyRVRr?=
 =?utf-8?B?Z3RoaEF3dDRoRm9MR09QZGVxRVVqYVR3RWdrdnQvbmxZVkZiMWdLSm92Y2dN?=
 =?utf-8?B?OGZZM3lOaExVeU9lemY1T2dmcXdUQ0lIdW1Ja0tzeDErN1lTbU9tdXp2Wjla?=
 =?utf-8?B?cFhCbFJXS1JSOFdqSFhvU3ZYdEJsSG52TGo0b0d4WitKS0xsUFE1SnpUNWcy?=
 =?utf-8?B?ODNadXFHcGMzYWJGQ3M1R1Mxd3ZwOWNmZTJ1T0U1Y3JQeVVEUU5QRjBTc2FN?=
 =?utf-8?B?V2NxOWtNOTJlN2NzMFFBSEdEYXMrV0tCNjlUOFg5Z3ZTVTFoSHE0OFNFdTg2?=
 =?utf-8?B?OXNyZWVqVlorK0JmUk9RRlpJbVpNaTJYWEZHY1U5emFWNnZjelpWajl6RzJS?=
 =?utf-8?B?LzNyTnp2dm9LVlM0VlRQeGZpa1NkSnFNeGg2OWhralpYUFlEUGZ3WTc2Wmhv?=
 =?utf-8?B?OW5wT1hyS2hYRHpPZ3dBYjkxMUFLamt3U2pkdHJqNXRCKzZCSGZmd0lmNU5X?=
 =?utf-8?B?UVZHYkFsbVdyL2hJcWRkY1RQcXoxUjFQS2lybHYzOWN5S0Vzc2VJL2RMSzNG?=
 =?utf-8?B?NlhqQnlLM1YycGh0SVZlaDVBcldKN0htWDlMb2tjeTNreURpcG1hZXVMR3pB?=
 =?utf-8?B?T0dxM3VYdVd4cXpiV2d5MGxPb2VCMm0veUIxWjh3WXF4Q1ZLQWQwTzRKZitI?=
 =?utf-8?B?c0Q2ZTJRaHhuT0FyYjhRZnBaR3hQREFraVNmU3pJZklWUWw1enpQbUF5dU5K?=
 =?utf-8?B?Z2Q2czhQQzBzUEE2U0tWQzJaT2pPdTRhVGJNYzFZTXpLdytPVm02SGNLWXgw?=
 =?utf-8?B?ZTI0QmYxTzV6T3RxMVpxc2FQUE5IVVF4M3k2amxkVURuOXkya3Y0cVJlaHB4?=
 =?utf-8?Q?RrLg91pYDZPDXzhnwp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9c0a9f-34e3-4606-c851-08de63048228
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 09:13:34.7555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xAxf7Nk1DdAN/aP9Ye9Q2ZhoRXbm5+yCrL55kDvwM8sLtuWAgpTGGJhszu48KEmOOeVaQcmzFQrDWhs8QWY0iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10387
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 09:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230422

V2hlbiBweXRob24zLXBhY2thZ2luZyB1cGRhdGVkIHRvIDI2LjAsIHRoaXMgcHRlc3Qgd2lsbCBw
YXNzLg0KDQogIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkZVSklUU1UgTkFOSklORyBTT0ZU
V0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5hbmpp
bmcsIDIxMDAxMiwgQ2hpbmENClRFTO+8mis4NisyNS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5
OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMtQnJp
YW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBKYW51YXJ5IDI5LCAyMDI2IDEyOjQ1IEFNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eR
nCA8d2FuZ215QGZ1aml0c3UuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxNi8xN10gcHl0aG9u
My13aGVlbDogdXBncmFkZSAwLjQ2LjEgLT4gMC40Ni4zDQo+IA0KPiBPbiBNb24gSmFuIDI2LCAy
MDI2IGF0IDE6MzggUE0gQ0VULCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
d3JvdGU6DQo+ID4gRnJvbTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4g
LS0tDQo+IA0KPiBIaSBXYW5nLA0KPiANCj4gSXQgbG9va3MgbGlrZSB3ZSBhbHNvIGhhdmUgYSBm
YWlsaW5nIHB0ZXN0IHdpdGggdGhpcyBvbmUuIEknbSBub3Qgc3VyZSB3aHkgaWQgZGlkbid0DQo+
IHNob3cgb24gbXkgcHJldmlvdXMgYnVpbGRzLCBlaXRoZXIgaXQgaXMgbGlua2VkIHdpdGggb3Ro
ZXIgY29tbWl0cyBvciBpdCdzIGEgYml0DQo+IGludGVybWl0dGVudC4NCj4gDQo+IEZhaWxlZCBw
dGVzdHM6DQo+IHsncHl0aG9uMy13aGVlbCc6IFsndGVzdHMvdGVzdF9tZXRhZGF0YS5weTp0ZXN0
X3BrZ2luZm9fdG9fbWV0YWRhdGEnXX0NCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9w
cm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzU2L2J1aWxkcy8xMDA0DQo+IGh0dHBzOi8v
YXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzYxL2J1aWxk
cy8yOTYzDQo+IA0KPiBUaGFua3MsDQo+IE1hdGhpZXUNCj4gDQo+IC0tDQo+IE1hdGhpZXUgRHVi
b2lzLUJyaWFuZCwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K

