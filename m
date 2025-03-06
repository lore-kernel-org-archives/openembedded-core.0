Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FE4C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 12:22:52 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.45])
 by mx.groups.io with SMTP id smtpd.web11.11682.1741263764009815620
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 04:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=BN7Tqm5j;
 spf=pass (domain: siemens.com, ip: 40.107.241.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1qDwyjzmC5yySiNZ2TR09+6c8S3OF8ursqjONmuKK26zeiUEh2ZA5bkADmF7BQR/DHXIiyeIKX+a1s3a93ZZSBNDuCIgV2nxM6a0Xb6BesagiD/NZHpCUU7ZZO82ZkFrMR++MAEJgv6KdNZ1GQiWt4W8yOYhXyIfNN6+U0EuW6dwZTxX0vXsfzUiLrzF572tnCNBoOQ25y50Wq/LYO6Iew1vFAsc/t0nGB2Msi6ohi9oigfIaBWl395lO4wNBMxhOjcVDk0w0iyrqEaunQXFXuft4TYOEC1n8oGwyNhENWMKhFx5opfaElVFHQck07QC/bCKuq+UiSIQ4pq8Keeuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHj4RwIzdM4v6uVfbXz7qkhSc6KwbkroJ0DnPSrQW90=;
 b=Iv/kiMZPWAxvvuXMbNTzqcbU+SsqB/0XdFf50ucDY/nWQU1hxwqQ9q4YSV2kd16Ac4OqpKHIG/EWS7er9jF+iKNCoa0omhmN2OQPGZ+2CfCAJl4jKfYdz42Xh5IOhNBg82JFCOdiTrDF8m47zN2WTzMDQwlKiPleKaEhj2/UC1CIsZzODtwX/DLNexRjeW6f9ES0ekZcyn1sEu8UcODENMGuY0/BCpMOmJIuYXMIGCybcN137vb45jEFo9vT1cSJgwVHgnmfOpxfIcmNVwKj+g6GU4n0xfst+PT70KcF4A8B9TF7AM3bHzhrgLhLaTCSbhjNztvO8RXwBZcqSJcBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHj4RwIzdM4v6uVfbXz7qkhSc6KwbkroJ0DnPSrQW90=;
 b=BN7Tqm5jT6acllfyV1Q916trOOoU0coSViOzNjIjZ3RWSGNjK0HA9wFE+XzLeiujtsCIyAIDNgErDtLH/FFFOtW0k5WXyGe5229Yiyi7Bi/9Hj1oeU8Yn/3KyfEFFF2zCUxu1kvuGD15P6FKTCQzlSrEfCP/9xN1ySOqderB2Vy81W9vFh1XoM0B442kJ1HUWIEQqSbjVHLiWMzH1AvZtVMQiHZHATGljQVzUs/EdEVo8i34MlNJZpIsBaLyWWcdssG6ucSWF45tBjrYrFCP6tu8WTVsbOy0IXYqqwvsS7v68HN3jKGVdSRP8Mch3L97uSmDqyU/DAWDsb/6lmsFFA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3174.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Thu, 6 Mar
 2025 12:22:40 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 12:22:40 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>, Ross Burton <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: RE: [OE-core][master][styhead][scarthgap][kirkstone][PATCH] puzzles:
 set CVE product
Thread-Topic: [OE-core][master][styhead][scarthgap][kirkstone][PATCH] puzzles:
 set CVE product
Thread-Index: AQHbio558aRH/kYGPUOTvZFOnmdsZLNl8KYAgAAeQNA=
Date: Thu, 6 Mar 2025 12:22:40 +0000
Message-ID: 
 <AS1PR10MB569775A17468AB0D08EC7F4EFDCA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250301094303.10707-1-peter.marko@siemens.com>
 <CAMSfU+6N6xHjqxCso_09sb6ia7dYJbPDoh6pFYMFeHaMivkePA@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+6N6xHjqxCso_09sb6ia7dYJbPDoh6pFYMFeHaMivkePA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5283712f-7db9-4026-9590-8bfdd9085748;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-06T12:19:28Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3174:EE_
x-ms-office365-filtering-correlation-id: 2b4cd683-b6cc-4530-686e-08dd5ca996cc
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RFB2SHpDcGU3M3FQcVhMSE1QL2xydDMxd2lmODIybk8yZnpGNkZJZVlyUDFW?=
 =?utf-8?B?UnRqVjVJYXVJV2xFSmdIbFk1eXVHd1dQOFFpMnNzNTNKbzBFdmZvR0w0M3J6?=
 =?utf-8?B?SlJsOUdnaG02RWFFZEg1QUZVWWlFSmpPL2hPcUJJNXM1a3lLMko1TEhIalkw?=
 =?utf-8?B?czRWMXcvZDZSMWtzclBJSUNyL3NiSUllUmJBcHg0N2FTb1loNDlTL0ZCYTNJ?=
 =?utf-8?B?VS85dzM5TEM0TlhqZW5tcnpjNDB4ekp0K3RoQlo5b3JJdm9OU3p2Y1IvRVdh?=
 =?utf-8?B?dS9kQ09tclNiSE9XZDJqV2xBUWhHR3RLQnYyL1VtWklKdWczcnJFQjQvM2ho?=
 =?utf-8?B?YkYrSkVVSTRVanBuakhPcE5wODR0b3VPdkdkUWV1dk9SK0pCamxzamR6SXlB?=
 =?utf-8?B?KzFjUUdaWGFpK1k0QitJMXdlaVV6bi95VUhLUnJZbS83RWVPdnAyeFkvT1Rk?=
 =?utf-8?B?NUhTemxuWXl5TXRrMkoyRjRFWTNOQ3IzbDV1Zk1PKzJ4Si8rYUFVaWsrcGlp?=
 =?utf-8?B?ejgvcW9weTVhcmVPMFFpaWlpMGJxK2dSKzd2N3owaE4yeENIandJQ2tDcWk2?=
 =?utf-8?B?aHhUSFhBWElTcFZ4VFVFcUh4QnRYN3huLzgxZHZlNmVMUXE0anBCUVhHU3lo?=
 =?utf-8?B?TW5FdS9jcjVURkE2S09lbnhQVXN3Zi9CMnBiblpHYXgvUzgrNTZkeXpoYy9V?=
 =?utf-8?B?Z3FBMi8veEpzbXhkNkFIZkV4WjhONnZXenRPUTBwY3lKd0EyMHN6SE9JVTJv?=
 =?utf-8?B?OE42SGh6ZVFLRXk3UnhlQ1loWVNrbE1hR2xpTStvbFZmRDNMbSt0bmtoWG93?=
 =?utf-8?B?aDdWcGNRb1ZUeGxCdlpHdlI4WTZYR1RJOVFJTzQxVm9BM1JCM0trR1NNTjBL?=
 =?utf-8?B?VkdYdUVwbzMvcFZtenQ0d1ZSUlE3Sk9LVklVQXRBU0Y2KytnaUJzL2YrT3Zt?=
 =?utf-8?B?dlNTZkhKZ3daYXNBTWF6akZ3UEdtUTBBcWYxd2M3NDJQNEM4KzhHbTFpZVkw?=
 =?utf-8?B?Qk5HN1FkaXpOemZMRlFhVFRiOVFXamdMK1ZQQWY3bTB0UDEyZzhuaVRXNjRP?=
 =?utf-8?B?bVFUa0NQdHpBQ0tZR3YzamxpYUlhSSs3NXlIQU9PTDMzaDllYmFVNFpzS1ZM?=
 =?utf-8?B?dHNnTUg3N3E5Nit1aXNpQkxCdEpvdUJsOStIRkJabXhjRkRmM0FYdDNUOUUw?=
 =?utf-8?B?UVhhNERwMHBEV3pWZ2lkSjkxVE15Y3lnaEplZEczc3RQQ3R0WDF1VklsVEQ1?=
 =?utf-8?B?ODdlMEZMV3JBeFQxajlhQ2x4MXhsOXh5dHRzYjZkUndxZlRzTytQTVJJbXd6?=
 =?utf-8?B?WHRxZTNzRXZUUlh4dmp4YUd4T2c4enRuVVQ5SHlLcjJtejB4MHVqSCttZGhW?=
 =?utf-8?B?VklVMlRvbGlQVFZJZTVMdUVJelNOL2NDOURWdFlHbDVUY2JHTGxZdW1JQ2hi?=
 =?utf-8?B?djBUSEpaRDZwZk9MWThMMFBaalFVbUpZc1R0NHVWa01waWNsbHJxdTcvenlu?=
 =?utf-8?B?NG1EeVh6ZHhHSWtnMENrQzQvN25KYlYzcTY1UmRmenFCdHhKb2srSzgzTk1S?=
 =?utf-8?B?RGlKR1lhcEhyZUwrVjBwTmxyUXA4ZENmcmJaZDRrU3JqanpmdFdQRW02azli?=
 =?utf-8?B?Ri8rNHdSQzBZYVRGL3BRZ0poWnp3eTduQ0lIVW1CaXBYZDJockNHcS9NQjBP?=
 =?utf-8?B?WGo5TWdmWFVYWGcwUmNoenQ5QVRjOGFKMTMrNGd1blB1U1MwVThvQy90elFM?=
 =?utf-8?B?c3ZUNVpRUlk3bmpDUzJRYjlkL0dLTVhFSlNCZllUOTBuMDRPbVMwdkx5WUF3?=
 =?utf-8?B?ZVgyUmNsM2V0a1A2M09yT2ZVWlhqSlgwVXlFakpNdjhSdS9ZSjNiMDBoSVlK?=
 =?utf-8?Q?EH2HhQYH/kO6c?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SE0wc0ZmdWRSeE1JdlhhbGZGbHdPNGVMcmsrYVVQekMrV3NIOXltRW80Z0VC?=
 =?utf-8?B?UW5vNTZRMnR6a0JpcTlEMFd2T2wxRUxWR2tTd0dHeU1vMmhPc0Rrd3JUZTRw?=
 =?utf-8?B?NzEyU3ZGU2ttdU1jdjVJZDVJNXd5OWNOSmlPM1FaSFVQQXNYUUNWWlRBejVY?=
 =?utf-8?B?a0R4bTQzTndmM3Y2Z0pDc0pIeWFnZmppYURkeG90Nkh1Nkl4d0FXU1VXK3Bs?=
 =?utf-8?B?ZDkrb3FJOG5odEJVRVVXVXFudDZ5bWVQd1VTRDIyUUFIajdwTzVsV3J4dmFY?=
 =?utf-8?B?MDVBcGYzZ2luVWNvd1BUdFdLT2J0TXY0K2xzTVdiR29GUkdVcHlSSitFejJv?=
 =?utf-8?B?b2pRTkZNTitaV2dkYTViSjBNeTBvdVl6N01uMEt5WWc3V3FYYVpDWXRkTGox?=
 =?utf-8?B?QmlLTFdqMDZJZmZ6R0VDNUlLZEpBTUZoUE44b0w0UWsrMThWZXRRVDM0eWUx?=
 =?utf-8?B?WG5nc2pBeGxkaTFBQzhCQkZtRnNDRVZjKzBUdnJQVENId2hHdVphRDBPNW5Z?=
 =?utf-8?B?TXVKYVpicHA5OVlkRFdaVW50cHNVK1UxdDFJVVVIdlQyTkNtVFNGcHErVEJw?=
 =?utf-8?B?dFVyU09FcEhsWDhPMEx3dHBXNTJXaVZycTI3VUNKalFnTHhKSUZqUmJvaEd0?=
 =?utf-8?B?aGxLcmxCeWpQQ3BUODA3cWsvVjJ3dE5yM0tzWTVGTlFqNFJtanlrZ1UwN3lj?=
 =?utf-8?B?aUVmN0xzaG5DV1VGWXc3NDBwTHVnc2RzMXV0UW4yY0pYWnhlRUx5UlR3a0VP?=
 =?utf-8?B?bFFFSXQyQTVLWXlQR1BVNUpUWWRBTUtPZWdnci9GQ3dQS3RPZ0VzRzdBQzRL?=
 =?utf-8?B?QzdabnFzbW1jdFNlUzVENkZSUHN6R0ErRGp2SHhhRUR1UzJpM016VXZrNk93?=
 =?utf-8?B?T1BLYmdZWmZtNTZidjdDNFkvMlpZODlXTFdWY3I2c2FwYVZxVkI0V0syVTYz?=
 =?utf-8?B?Y2t3bm9rWFVEdkU5elFqalNQWlB5ZXpjWllzWmo2ZUhRR2tLbkhxT2FnWi9q?=
 =?utf-8?B?aFBVekFNTk1pMGk2NUhMSjc3KzkrQ2h2QWpZdVRPbDR3UVN2MXVTMWQ0WnNJ?=
 =?utf-8?B?M2xZSkFWL0F2bnNodnQzMG9NUHNUM05rRmFXUzdnWUdMYUVwMm5FWXVlK0RX?=
 =?utf-8?B?YmxBRkw2anZyUnl5cHZJYVhiTGFHZXZXSWw1QWhrMjBqamZFcW9wZFB3MWRK?=
 =?utf-8?B?a3F5eEtMMUFldVZwdGVkc0FYc2YybGhxUWV4V00zalIxcjBXMHY5L2MyTlow?=
 =?utf-8?B?T1BPVFd3VWs1bkhUK0JtMXhBbVJ5c21sZXNUcklXdFhSYTJLWmltNnlxZXhJ?=
 =?utf-8?B?MUlBUllYenBUeXBsNGozZ2hjT0ptc2crUk9NNFJ6K1BZM3hTKzNSZ0p4elZZ?=
 =?utf-8?B?MTRQOEhJTzVrN0NCNlRaMGtsWTlDTzBlWC9hMHNCTEF0MTd2ZTQ1T0FzZml3?=
 =?utf-8?B?SDhZaUJsZlRSaFhYWVFsdkNrY05NVktrSHlWaEpPMHBoZkNvR1I4cyt6dlJQ?=
 =?utf-8?B?aGx3SElrUnFRZS9ySjJmNklKUTNWQ1RCKzNnWXN0eXRUSGgyKzBadSt2U3lV?=
 =?utf-8?B?WkdCSVBWSGxHVkJvU3NTRkJneVM3Umlxc0wzR2tlZ3FiVnErd3JvYkdrU1pH?=
 =?utf-8?B?L0s4WFpqTXdyVEltSjZxdXZ4eFFKQk4yK011dVlXNmpMY2xnZE9yK3pBZnZG?=
 =?utf-8?B?ZVNqbGlXNTJWeDNXM1VvdXBmL1FSSStwWnFxYUNJVnBDOGxzOVNRMEtuYlhS?=
 =?utf-8?B?VGxFSDE5TlcyenlrdVVvNjFTbEY1UUJtQmRxNGRCNkxTYnRRZ1FMeUdaV1Yy?=
 =?utf-8?B?VkRUbXZMRGZZVXNJUjVWR21aTlc3dWVJOVF2bGFwbGJtYzQ4RWRPaHk3TE45?=
 =?utf-8?B?L2d5TStqejlwbStDMEJaYk5DS0N4VG5OemJpV3ZWYzZtcVBSS0tZRU8xeVZj?=
 =?utf-8?B?cWZibWNCU2VsUkVmNFg1eGJHYTJrbVRDQ0hQcFl5azZHdEpoa2N2YXFaeUgr?=
 =?utf-8?B?RHQ4eGVuQ3FMZEpPTUNzN2hxWm1xZkVlQXdlMFpIRy9MMHVnNEQwTEJkU3dV?=
 =?utf-8?B?QytTYjNoeUVYSlJobFZncUtnM2drNHlCKzY4ZWNGcXZTL3RoaEttMk1MTnYw?=
 =?utf-8?Q?OjuV6EZs3ihYEFmTCd5RmjoFp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4cd683-b6cc-4530-686e-08dd5ca996cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 12:22:40.5315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r/79Ff9zJSZWB8Jen8UyaIWXuOOO7ptaI33Cu+vtIf0qEWML2riJ1c6OliDQj+ubvW3aZt/vgNNglAKGkY9FEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 12:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212387

U3VyZSwgbm8gcHJvYmxlbS4NCldpbGwgdGhlIHBhdGNoIGZyb20gUm9zcyBiZSBiYWNrcG9ydGVk
IHRvIGFsbCB0aHJlZSBhY3RpdmUgYnJhbmNoZXMgdG8gY2xlYW51cCB0aG9zZSBDVkVzIHRoZXJl
LCB0b28/DQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
WW9hbm4gQ29uZ2FsIDx5b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IFRodXJzZGF5LCBN
YXJjaCA2LCAyMDI1IDExOjMxDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkg
PFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZzsgU3RldmUgU2Frb21hbg0KPiA8c3RldmVAc2Frb21hbi5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bbWFzdGVyXVtzdHloZWFkXVtzY2FydGhnYXBdW2tpcmtz
dG9uZV1bUEFUQ0hdIHB1enpsZXM6IHNldA0KPiBDVkUgcHJvZHVjdA0KPiANCj4gSGVsbG8sDQo+
IA0KPiBMZSBzYW0uIDEgbWFycyAyMDI1IMOgIDEwOjQ0LCBQZXRlciBNYXJrbyB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gYSDDqWNyaXQgOg0KPiA+DQo+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVy
Lm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+DQo+ID4gQ1ZFIHJlcG9ydHMgbm93IHNob3cgMyBDVkVz
IGZvciB0aGlzIGNvbXBvbmVudC4NCj4gPiBUaGV5IGFyZSBmb3IgIlRoZSBQdXp6bGVzIHRoZW1l
IGZvciBXb3JkUHJlc3MiIHdpdGggY3BlIGxpa2UNCj4gPiAiY3BlOjIuMzphOnRoZW1lcmV4OnB1
enpsZXM6KjoqOio6KjoqOndvcmRwcmVzczoqOioiLg0KPiA+DQo+ID4gU2V0dGluZyB2ZW5kb3Ig
c29sdmVzIHRoZXNlIGZhbHNlIHBvc2l0aXZlcy4NCj4gPiBWZW5kb3IgaXMgc2V0IHBlciBnaXQg
cGF0aCAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9wdXp6bGVzLmdpdCIuDQo+ID4gVGhp
cyBtYXkgYmUgd3JvbmcgdmFsdWUsIGJ1dCBzaW5jZSB3ZSBkb24ndCBzdXBwb3J0IG5lZ2F0aXZl
IHJlZ2V4LCB0aGlzDQo+ID4gaXMgdGhlIGJlc3Qgd2UgY2FuIGRvIG5vdyBpZiB3ZSBkb24ndCB3
YW50IHRvIHN0YXJ0IG1hcmtpbmcgYWxsIHdpdGgNCj4gPiBjcGUtaW5jb3JyZWN0IHN0YXR1cyBv
bmUgYnkgb25lLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1h
cmtvQHNpZW1lbnMuY29tPg0KPiANCj4gVGhhbmsgeW91IGZvciB0YWtpbmcgY2FyZSBvZiB0aGUg
Q1ZFcy4NCj4gDQo+IEZvciB0aGlzIHBhdGNoIHRob3VnaCwgYW5vdGhlciBwYXRjaCB3YXMgcHJl
ZmVyZWQgOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS9tZXNzYWdlLzIxMjI4MCAobm93DQo+IGluIG1hc3Rlci1uZXh0LCBzaG91bGQgYmUgbWVy
Z2VkIHNvb24pDQo+IFRoZSByYXRpb25hbGUgaXM6IHNpbmNlIHRoZXJlIGlzIG5vIENWRXMgb24g
Im91ciIgcHV6emxlcywgd2UgY2FuJ3QNCj4gcHJlZGljdCB3aGF0IHRoZSBDUEUgd2lsbCBiZSB3
aGVuIHRoYXQgaGFwcGVuLCBzbywgaW4gdGhlIG1lYW50aW1lLCB3ZQ0KPiBleHBsaWNpdGx5IGln
bm9yZSBDVkVzIGZyb20gdGhlIHdvcmRwcmVzcyBwbHVnaW4uDQo+IA0KPiBSZWdhcmRzLA0KPiAN
Cj4gDQo+ID4gLS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQu
YmIgfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIGIv
bWV0YS9yZWNpcGVzLQ0KPiBzYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmINCj4gPiBpbmRleCA2
NzdhOWUyOTFlMC4uZGYyNDkxZWM4NTAgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXNh
dG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmINCj4gPiBAQCAtMjAsNiArMjAsOCBAQCBpbmhlcml0IGNtYWtl
IGZlYXR1cmVzX2NoZWNrIHBrZ2NvbmZpZw0KPiA+DQo+ID4gIERFUEVORFMgKz0gImd0ayszIg0K
PiA+DQo+ID4gK0NWRV9QUk9EVUNUID0gInNpbW9uOnB1enpsZXMiDQo+ID4gKw0KPiA+ICBkb19p
bnN0YWxsOmFwcGVuZCAoKSB7DQo+ID4gICAgICAjIG5ldCBjb25mbGljdHMgd2l0aCBTYW1iYSwg
c28gcmVuYW1lIGl0DQo+ID4gICAgICBtdiAke0R9JHtiaW5kaXJ9L25ldCAke0R9JHtiaW5kaXJ9
L3B1enpsZXMtbmV0DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcv
UmVwbHkgT25saW5lICgjMjEyMDkyKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLQ0KPiBjb3JlL21lc3NhZ2UvMjEyMDkyDQo+ID4gTXV0ZSBUaGlzIFRvcGlj
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTExNDQ5ODE4LzQzMTYxODUNCj4g
PiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiBbeW9hbm4uY29uZ2FsQHNtaWxlLmZyXQ0KPiA+IC09
LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCj4gDQo+IA0KPiAtLQ0KPiBZb2FubiBDb25nYWwN
Cj4gU21pbGUgRUNTIC0gVGVjaCBleHBlcnQNCg==

