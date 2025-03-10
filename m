Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19066C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:57:37 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.54])
 by mx.groups.io with SMTP id smtpd.web10.36875.1741611449891030866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 05:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zydUfs3w;
 spf=pass (domain: siemens.com, ip: 40.107.162.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ivc6p3vH7CwMyCyjrglskWfL166w3mTuwmUTqgaXRcVSwrsv2Dczkf2fweKzbuEtz3vaSC/QLq068u7N5iPLd6h0mUTZtSkBGav8rYfBNTGkOvbzbGjVVBJcgoW708WSt6mcfvlBcSO7jMi+ZleNhEwGf091mzu6PhIMVhGzybml0UqM1edxissX2w/7g552GFbWQey2AoWie/adnu10VwHxnz+/K85DfCPxOV7KQtr+kU7K+qPiQ7nQMerwGZganMWjWpUvY++USCurHpa5wW7/lqaktmt+qJke1WZcHszNH9/AgAwtWN7N79H7jjuImXIlwdiDjKt6fzeXsyZJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2WzrmzBtnRZuBo4TJTFDDncAxRHsHwHddrrXeawZDY=;
 b=J5GYW7eI1nzgzIz5YB85yBp+BKgIpLX6UhOWWvWCyQ4Lbfd0lYWaVIChE/RtdAF4MByRHHDCM4kLlq9r9s05IO6HHqv8QliiE2IjakaLeEnIAsprXjPshJ/vRiYfzr2pBlA2T8Nd/RHa3FDqe/CWcrsjIyhlrh5NFMBciHkQD+XNEP5Mks+iEQ7AZWNPufYyuFEuVHnVNvzmy5OFzQoV8lpFRSaGGHMBdE1HymsMdJyw5ZdHGNoSLE5JDkJAXCzGFPxugc2K8u6WusM3i+t3E4ZG8XHxWRqr1Gh6tQuEpV0bfUwLm6F1rVUsqDzfGsQWeaTCr/tbz6RnBTjqpvaHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2WzrmzBtnRZuBo4TJTFDDncAxRHsHwHddrrXeawZDY=;
 b=zydUfs3wQ8FJbSNmg8MS0XyP54wU3lgd5hjNnfSB3oDvuYsL/dJCSKc5qdyiZFu8eVeVpCp5DA3NtHjZKVubNQQE2gHxlHdKj7zmkj5S8lqXSb3E7sxP3hRPascCX6aGcEizAV1mYlNPPcY2neimYSRsTO97IjFW2RmZWi4bkXag6oi1tTvISjbvldAD/t5E3cUrqd8IuPTWeSdcFsqadZzTCCG0eYmhXwt2P/Bp00x4aYqLsToB6h6sHNBfXPfQWGq6KXacYprz04ii0ZibQhJeCSk4FARS6XLgzteGlmTXkDdqbm6XbwHiYxKVBtplbmnlevQtyazW1ISUx68C+g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB7533.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:57:26 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 12:57:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] xwayland: mark CVEs fixed in 24.1.6 as fixed
Thread-Topic: [OE-core][PATCH] xwayland: mark CVEs fixed in 24.1.6 as fixed
Thread-Index: AQHbkbsRN8sfhIqob0KOL2yaycfjLrNsUxmAgAABHZA=
Date: Mon, 10 Mar 2025 12:57:26 +0000
Message-ID: 
 <AS1PR10MB56973C195061C8E5FBE5D8E6FDD62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250310124949.2414614-1-peter.marko@siemens.com>
 <387AAA58-90B2-4F98-9CA7-7287198371CD@arm.com>
In-Reply-To: <387AAA58-90B2-4F98-9CA7-7287198371CD@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c3ecc6f1-974e-40c6-b17c-f721acf2df35;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-10T12:56:28Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB7533:EE_
x-ms-office365-filtering-correlation-id: f2104219-54de-40b3-c176-08dd5fd31be7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Zk5Dcmw4ZHozUHJJV3hraGNIRGRnblVCWHpHNjlCOVhqT3FhNkg0d2VWaWRK?=
 =?utf-8?B?b3F3WmdGMjYwdkdEQWF0K0k4aFRnNjlKczVwZVV5UVJJZjVETEJrZGFSYndw?=
 =?utf-8?B?NjNLdmxaaUczTlVQaE5JWlI4c2s5R0lVT3lUWlNlaTlwQVNoTUNXUDR6VUVz?=
 =?utf-8?B?ZWJtQmtpOWhuNndlODV6eWtmQXVYSGU2MjQ0Q01XZyszMzlwVC9LK3RoOEMr?=
 =?utf-8?B?d1JFd1AxK29qaXlmMkVPLzdyb3U2MSthaDJ2YWREUk5JNjhmTit1WWVHWStB?=
 =?utf-8?B?bS9jeE9XK3BjY0NSdHdyNU4rV1FXR1Frd1RoWEZnZEZ3VUtlRVB6cms1Q3dh?=
 =?utf-8?B?RGdscWFiZ3g0OHBtbTNqU2swRlFqVyszRUYrR1NSS3Zhb0l6akNUeURKYXd2?=
 =?utf-8?B?S2J4RzhCMFE3ZVIydzNCdGdNc3U0RU1mMkdVTE9nSDNUTitXTGZoYVZhSDd5?=
 =?utf-8?B?bmJXbGQwZk81Z1NUY1NWSGJLUmxidmpnRDRES2QvM0wza2RnSDRRUk5KQXV2?=
 =?utf-8?B?YnkwMHloK0R0U0NST0lhRHJHY3FDeXVEbUtBUjVuNTUyWDQ0K01TcHdKcFdl?=
 =?utf-8?B?RW4rM1diWnVuTEdmR1QvanZnMGE0Q1g1Zm42WHNsbWhFdlFHTGNOSXRKWElz?=
 =?utf-8?B?TGdvWU8xS2Y5blBNSTdGTEkxbEpSRE82d001cVFKVkYrcU15S1JocW9jRnli?=
 =?utf-8?B?V05nakorek9jY1ZFNkJIVDdVNjZZY1FnbnNuS2JneWQvNjUvUUk2UFRtVUJy?=
 =?utf-8?B?MzdDcHdMZmd4bVI2VFI5VG5ENERWM0QzNVBibGFDUVJWQ2YxSXdRSzY0TGlM?=
 =?utf-8?B?RUs2NnlLQllMSFI0ZW1ieVNTcVpnT0xDUThmWHVoR2p1MUVOcTBsQ00rN3JR?=
 =?utf-8?B?S28xKzM3ck1vN2FCS3Frc1d0amdsWHRvL3J2UERHZ0hodW1TcUp6SXZoQk51?=
 =?utf-8?B?aE1heXVBODBrZ0dCaStHNjIyQ0svOEdueWp6eUMzUWk4RXlyZm9FeTkzMlNw?=
 =?utf-8?B?UFRrYTRyMkZTTWM0YkZWaGhlNHluRjlYZ2hNYlNPVXgydzRVMXFzTk5SQnlJ?=
 =?utf-8?B?THpGMkVqVmYzS3orV2NORnNBa3U2U09XOWdUTU00MHQ5VysrZGh0c3ZpdDR6?=
 =?utf-8?B?RXRZRTVQQ2UvWEEzR2VoOFFiRWdyNndhKzRud21QMGN4MVhTTi81K1lVSEpa?=
 =?utf-8?B?NHZ3NXlmN1g5TnJXODhTZHVrYVA3eXZ1NSt3Z1ZnTDM3UGFLNnNpZXRyUmlj?=
 =?utf-8?B?YVVBV1ZxYVo3Q3ZvVUJaNlJmL2lpdVBuRWJRdDR5Wi9PT1lMUEVmQ3F4VStI?=
 =?utf-8?B?MjFZeVUyV2JpK1ZuOHhNTFpvT2FONU5YQU5yam5yOGpiZExNVEJHcklFWisx?=
 =?utf-8?B?U05oQlRyNFMvUWlqTk9sdjY0cjFTYkNGd3hhWHI5QlZRSU1kTXRTVHl6eTdZ?=
 =?utf-8?B?U2xXQ1BrQ2RMNy9DcVB5U3NMNXVsMENjMWo2aWtVY0FVK29iVktveCtUT0sx?=
 =?utf-8?B?bEZDMnFXa3BDaXdNdnJZYTN6RHE5WjBQMG5LTnQrSDl4OHdwamxDcWxiMkU3?=
 =?utf-8?B?ZTFQanlGT2pRREs4RnVYRWRVa3ZUaVVzZUYwbndJNEp1NmphZGJ5TU95SWJC?=
 =?utf-8?B?Q25BaWpJOUNobWNHeTVkTVNpWHBaekltYXo1WmxFN2xrTERBaUZ4R0pLb1FF?=
 =?utf-8?B?amdWbGNwZytQaXM0Z3AvUk1XOEVSNVpkKzhLVGRGYkdocWsyRy9ZQVlUaWpu?=
 =?utf-8?B?MGdFOXhhWHpCdmZBR3I5VUwxOU8yektEVHNUdXhiWHF6b0lTQmk0R28wdDkr?=
 =?utf-8?B?R3VxWmhxcWJUbXZJOUhZaGFmdTRTY1VGMWVBSUkwVCtxTlBaWGRBYkE1Rnhq?=
 =?utf-8?B?TWNhekJNcGg0Unc2ZWh1dDEwR0o2Z2tnZ2lvNjRVaHkraGpTQ3czRU5VaHRE?=
 =?utf-8?Q?4g79L+2AOXygVRSdfkHJSNd4hea9CraV?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MVlBdFlnd0xRTVVLbG1RZlBRcXBHTUdCRFNnUytqWDJsSE9SOW8zUjJvY0Ni?=
 =?utf-8?B?OGREVWlvcWp3NXQ5Sm1ZTm1nVWVyY04wbTk1Q29ZN1pkQkxIOXNoNmtHdzNX?=
 =?utf-8?B?WXcrTUFFaUw0VWVRRFA0MHBSUzk2NjM2NE85bGVnTm9ycGFxd2w1V0RZL0Z0?=
 =?utf-8?B?M0did0MrcFZzbWUyTGpQNm9GNWJsTnE1U08yMnRTUDNnQVhvWHl2OThpaUJ3?=
 =?utf-8?B?cE1TVWJ2TFBLbVoyV0JVN2daUVd6Y1duVWs5bmVJYnZRS096dkVYN1I2ZmZp?=
 =?utf-8?B?Mm13UHVkb09tMEdFWVZMMlpKRFh0VWdaWDlHdWNJMXgrb1lUelMwTGdYVVRR?=
 =?utf-8?B?dVFucWh0cnB5Yys0RFpHLzJoTUR0TUpIL3JDellxUFM5NXhXSnlURnNiNHRk?=
 =?utf-8?B?UGxVMCtHTTMxUFFQSUlac0FVWG8rcXhSQ09pRFJXcFVKQUFRWGpYRk5KbDVz?=
 =?utf-8?B?RXZBcVk4S2wyb0FKVzVZUGxsTy9JbW00S3YrRTdvdFJRUi82bEE3NTZTMmpw?=
 =?utf-8?B?RzJzd3plWURteWNjYmE5WkxmWkg0S2JqcXFSU1pUOXRha3JWY3JWcWRIeHU0?=
 =?utf-8?B?VlB3TTdlc2k5WnAwQjRsUDhNWm5XSFpLNXNVcWh3N09TTVVUcW41UGs2aVpQ?=
 =?utf-8?B?dlFjZE5KT2luOEEyOUFIUGlhNGQvZlQwbnVuTjkwNENZOWZ2U1g3OE1yTEtD?=
 =?utf-8?B?VmNWekx2UzYyUkp2bEZQNU1UbGtBQXZUcGpCdzhhbUFuU3k0OENDZ2FNRHFC?=
 =?utf-8?B?WWloTC9iSk9rcElZWHpNUEorbktqQ0JwWTA3SXk4cEw0M1dHZVQxTUR5a05s?=
 =?utf-8?B?V3RLS2w5c25rbGxyWno1RG04U0Z4MzFJcW1IRE1xb1cxQmVzVUVSOFJWYjY2?=
 =?utf-8?B?NzV2bTlycGt0akdsWHQ0MmcvTDhLMW4vM1c0cWl6ZUFrbkVuTXJvM1ZaTkZX?=
 =?utf-8?B?U2ltSi9UNFFsdE44TDE5OE5RVnorSGppWmNmbkE4KzdXUEtzT2xzOEhPcEJx?=
 =?utf-8?B?enZBdVo2NHNWdUlTT1RST0NjNFBSMjY2b2c4enJXeU9Rd0dxcDU3RTdBSHd5?=
 =?utf-8?B?b0ZyRTA4NHFubDRHMG1jVktXa1k4NXdOU00xeWpHS3crQlhGTENoR1dFTWMx?=
 =?utf-8?B?NnBWcndMckozQmp3MUJDUXl4Z2s5Vk5lbi9VNDVaTjFIUkFRMlN4TWNPQWJj?=
 =?utf-8?B?Q0xNQVpQeVNaV0p0Skkwdkc5ZjlobEJzWFBsdEYrSkdGWHlKSDVpRjhPci9s?=
 =?utf-8?B?c0RsZ25ndFBYaFhiNEtOWkNuc0t5REVKRDZJRlo1WVR2TlZQandrWHhiUXlT?=
 =?utf-8?B?QXJ4NUR3UUMzc0liN0p5bGFSbElNWlZNSHc4WkI4VGJRVnN6eHFBS1pQY0tH?=
 =?utf-8?B?emZNdWhHWDY0MzN0NzEyM1Q0eWt4SjhOY1d2dHQrTGkvQ2tXeFF6VktBT1Bl?=
 =?utf-8?B?S3JJSlRsa3lwZUtDLzIxeGtOUU9GbzBrQURBWmJWNEpvRi8rcmJQSWRJdWw5?=
 =?utf-8?B?NWErS2QyZHVrdWsrYzdHUVRqaEZnSFdVODMxMXB5SnlmRm93dCtjREdXM2Rr?=
 =?utf-8?B?dzNrYUs0alZ0aUVSOEI5dlJ2T2dmT29tdlp0Vmc5UWpQOU1HTStBYTFicklX?=
 =?utf-8?B?WWFSK3d1d25xRzdUeHgvMEwwclk2aWlzYlhXRUJ6eHkrN25uZnJxTWxONFlD?=
 =?utf-8?B?REV5ZXZEaVQzT3BtTEVuRmNkT3pUTXNBdWM3TSt1Qk5FKzJBZndDVHM4eGJ2?=
 =?utf-8?B?Z0RkbzRhb2grMGp3djVwSG9lMUtXNHQrZDJRTW1GSzlpTVRuYkxrdTRDdDQy?=
 =?utf-8?B?QVo1d0lLZjBxK0E2Zi9nQ2lIeDBLcTlKQkJlRUFHeVhJQjNLdVh4SGFJcE5P?=
 =?utf-8?B?Z0EvbVYyUktHWWV5V0tZNlRUTU94QTJ5YzBNZUMrbnhaUU5OaitBYW1iMG03?=
 =?utf-8?B?SlNWUTB5aUU3YWNzOFB5THphcWl1NlIzZmFwV2VheGowK2NTcGhlMUNLb2Jp?=
 =?utf-8?B?R1R3RXJkK3VpcGRuWkM1bzRDSjRYY1dUd2dESVhaNWVRd2VGTVF0ekRXZU1q?=
 =?utf-8?B?bWxsTTA3OGkwOFRxdlJHLzRRMmVocnErSm5KdThQZVY4c0kzOEZycWtyQnZj?=
 =?utf-8?Q?PXsdfHtf0Kr02YDiIUANsIg21?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f2104219-54de-40b3-c176-08dd5fd31be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 12:57:26.7336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yX+HN1hxx3xy1nnVJmafJVHOMdnxjSOpzYeYYWB5bqsws893ftnDoaweesJEqYdx6/J1OFS7YmEwkMnmOqtTQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7533
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 12:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212519

U3VyZSwgSSBoYXZlIGFsc28gc2VudCB1cGdyYWRlIGZvciBzdHloZWFkIHdpdGggdGhlc2UgaWdu
b3Jlcy4NCkkgdGhpbmsgdGhlcmUgaXQgY2FuIGJlIG1lcmdlZCBhcyBpdCB3b24ndCBzaXQgdGhl
cmUgZm9yZXZlciBhcyBvbiBtYXN0ZXIuDQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+DQo+IFNl
bnQ6IE1vbmRheSwgTWFyY2ggMTAsIDIwMjUgMTM6NTINCj4gVG86IE1hcmtvLCBQZXRlciAoRlQg
RCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+DQo+IENjOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1b
UEFUQ0hdIHh3YXlsYW5kOiBtYXJrIENWRXMgZml4ZWQgaW4gMjQuMS42IGFzIGZpeGVkDQo+IA0K
PiBPbiAxMCBNYXIgMjAyNSwgYXQgMTI6NDksIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVt
ZW5zLmNvbT4NCj4gPg0KPiA+IFRoZXNlIGFyZSB0cmFja2VkIGFzIHZlcnNpb25sZXNzIHJlZGhh
dCBDVkVzIGluIE5WRCBEQi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxw
ZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveHdheWxhbmQveHdheWxhbmRfMjQuMS42LmJiIHwgNCArKysrDQo+ID4gMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjYuYmIgYi9tZXRhL3JlY2lwZXMtDQo+IGdy
YXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuNi5iYg0KPiA+IGluZGV4IDM1MGI4ZTkzY2Mu
LjA3NzRjMWJiZjUgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXls
YW5kL3h3YXlsYW5kXzI0LjEuNi5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
d2F5bGFuZC94d2F5bGFuZF8yNC4xLjYuYmINCj4gPiBAQCAtNDgsMyArNDgsNyBAQCBkb19pbnN0
YWxsOmFwcGVuZCgpIHsNCj4gPiBGSUxFUzoke1BOfSArPSAiJHtsaWJkaXJ9L3hvcmcvcHJvdG9j
b2wudHh0Ig0KPiA+DQo+ID4gUkRFUEVORFM6JHtQTn0gKz0gInhrYmNvbXAiDQo+ID4gKw0KPiA+
ICtDVkVfU1RBVFVTX0dST1VQUyA9ICJDVkVfU1RBVFVTX1JFREhBVCINCj4gPiArQ1ZFX1NUQVRV
U19SRURIQVQgPSAiQ1ZFLTIwMjUtMjY1OTQgQ1ZFLTIwMjUtMjY1OTUgQ1ZFLTIwMjUtMjY1OTYN
Cj4gQ1ZFLTIwMjUtMjY1OTcgQ1ZFLTIwMjUtMjY1OTggQ1ZFLTIwMjUtMjY1OTkgQ1ZFLTIwMjUt
MjY2MDAgQ1ZFLTIwMjUtDQo+IDI2NjAxIg0KPiA+ICtDVkVfU1RBVFVTX1JFREhBVFtzdGF0dXNd
ID0gImZpeGVkLXZlcnNpb246IHRoZXNlIGFyZSB0cmFja2VkIGFzDQo+IHZlcnNpb25sZXNzIHJl
ZGhhdCBDVkVzIGluIE5WRCBEQiwgZml4ZWQgaW4gMjQuMS424oCdDQo+IA0KPiBJ4oCZdmUgIGp1
c3QgbWFpbGVkIE5WRCB0byBnZXQgdGhpcyBmaXhlZCwgaG9wZWZ1bGx5IHRoZXnigJlsbCB0YWtl
IHRoZSBjaGFuZ2UgcHJvbXB0bHkuDQo+IHNvIG1heWJlIGhvbGQgdGhpcyBvZmYgZm9yIGEgd2Vl
ayBvbiB0aGUgb3B0aW1pc3RpYyBob3BlIHRoYXQgdGhleSBkbz8NCj4gDQo+IFJvc3MNCg==

