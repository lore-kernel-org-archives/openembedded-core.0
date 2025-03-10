Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3948CC28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:42:46 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.web10.33827.1741599761526044683
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=x1795PBa;
 spf=pass (domain: siemens.com, ip: 52.101.70.24, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sW95T/OTkMWwmUW6jHXaqzxcAsGft5Re4yjfAq/2mQdJT5Gvb/QLxK0g0WaTNhf5TrLTGEmwhSCG8TZzSdMdJAeLjL0Wzb6hfVrt6p3QjtYvxZB9FluAv7TC6BMJQZ13zUOI2zKBgWHqlXAOxJ1MrqhOfFEvPjyyjbHgjxmLBNZsZd5HVxBwRq7F9OHXQK8Psa9zasKohhIhBZN3XHSEKGbQbdFWWUA3NnNIk/QPetnJVI510tJPCEYiU4w0uMYtcYEyAuEB5+hVO0Yq3A7PyQ7vkwJccN7H6FPzKB5k6KOX3tGboVFksrGPmf2KH9/OHMpQkCB0G21Uro7KOyOMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1MuUn/D1OrVDUHAY4Mn4rybuuXR6uTRNQycH2VOoGY=;
 b=IITb5VDtCOFQPf7PTyw1zWt2sIwh2ZNRueg3VvVBLbLWj+K7cVbKKEtWhubc/R8exjTcRGutfZzssrD3gEVy0uzfy7iNVRR4qzYXEGlvS4R/VTaOIvTHib9eH60TpXwtS5oHI8i8KPay5uL22iUB7twB0Cwz+uq/xsySmosC5EdOR4DizecNei6ITHNX9sMNs6QVBJaeFrzFBNMBE9X5INqtc7wLwcTqjAnC12UJ90uR5Wdx8QRiiZcRQcWXV3z8T8kYWAYOQZUKZoFaxvuwPPcANIqcLsNmvx6r3KAm8JHKXS0uj5eMvabp7pDtN0susl/oqx9aMsWDGfQeBsvmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1MuUn/D1OrVDUHAY4Mn4rybuuXR6uTRNQycH2VOoGY=;
 b=x1795PBaDc5xuZgMgMAEGpmPjrXQSiwFAzpHFjc0EUnvSghqtj7nAiPCGYnzT+YhL+l3Knh3ZOurRFDt/uqnbwbgf6rUy4YpBGtFs1plWvWTAlHRc1E9sICNCEYBFr/JUoilh+cTGFhVzb5ToMg8ITT9p1Ihpo7XDzvounK/m8BhX2aacyVjEDZhFrJI8UuokYXeSMZQbzDKneo0ED9C1x6Irs26YX+IgQPkKIU49VgRh9pnW0y2i8pFeKKdstfHU2hgA406IQw9rX+mv0Her0HVLcd8sMiWs8j1lg2J6z/N4wyPJC0DJTDiRFvoclO4tW22ctX3+r57eiCwiT9tOw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6156.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 09:42:38 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 09:42:38 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
CC: Ross Burton <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: RE: [OE-core][master][styhead][scarthgap][kirkstone][PATCH] puzzles:
 set CVE product
Thread-Topic: [OE-core][master][styhead][scarthgap][kirkstone][PATCH] puzzles:
 set CVE product
Thread-Index: AQHbio558aRH/kYGPUOTvZFOnmdsZLNl8KYAgAAeQNCAAWnwAIAEsygg
Date: Mon, 10 Mar 2025 09:42:38 +0000
Message-ID: 
 <AS1PR10MB56978A36923CDD474E996707FDD62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250301094303.10707-1-peter.marko@siemens.com>
 <CAMSfU+6N6xHjqxCso_09sb6ia7dYJbPDoh6pFYMFeHaMivkePA@mail.gmail.com>
 <AS1PR10MB569775A17468AB0D08EC7F4EFDCA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMSfU+4fGUgBnYqDmTWBdw3cYfV7c-09WQ1WkTwwjkOxG=ZcQQ@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+4fGUgBnYqDmTWBdw3cYfV7c-09WQ1WkTwwjkOxG=ZcQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f7b87e38-5727-409c-abea-1ec03960a572;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-10T09:41:10Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6156:EE_
x-ms-office365-filtering-correlation-id: 368cfd5b-475e-40b7-9160-08dd5fb7e532
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aXpHc3FKWFhUM3AydFIxdDFUR2JtamFpeXJUMHVtUlJPZ09XSGFLTE42YUpV?=
 =?utf-8?B?Zk9Qb3plUG5CTVZQZ29QYnNmd3ZKZUhoaUp1ZTBQK1pyQXF6c2diZ0pSMWdo?=
 =?utf-8?B?eFhsd1FwaXdXWjRML011ZjJrc1RydlJaamgvVENBQldKMGJxRmV5VEdUc0Yv?=
 =?utf-8?B?Si8vSnVMUC9nazJ3MDZXRUJTQVFCMWl3QXUrWXRtZCsyY0dyY0FQQTFTSFZu?=
 =?utf-8?B?ZEw2ZS9BeGtGZHpLNnR5YnJOcS9QUFg0Rm15YWdmU01HTTFPTjQ2ZzdDTUwx?=
 =?utf-8?B?cmVIRVVtTklWSXBEQ3p4MEprMGR4SDZnWEdKY0p3bVNiUUprdGpHUUtKekp0?=
 =?utf-8?B?Rit3S3VYVW05RFpDMUkvTS94ZTZSNlhMY0ZuZTl1bmZkdGJoOWsyakpyTnVS?=
 =?utf-8?B?ZDV2WjZHd0t3eUVRVGN1azJ0RHBmNjBwYzRIQmJBS0Jpa3BOQ21RU01aOHR0?=
 =?utf-8?B?aDZjeUJXR0p3UE1XWVN2bnJ6cEoyaSs2TXVKK0xEaWgzUjBOeld4SEgxMFJI?=
 =?utf-8?B?MFFrQlVQcDZnOEIvNytYeGdLQUZVcWJnUGdyUS9UYXJ0RTZnbGJkTHZpMExQ?=
 =?utf-8?B?b1diSXY0Z2hpdmhMaHpwTXI2Sm1IUXpsell5R1BqdEZ3dU9nR0tSR3VMSUU5?=
 =?utf-8?B?ZTgvcXJ5SFgzbW9pQmRJMmJNY0JkRlZ5RFBrR0JUZUlKQThXdHNZb3pEL2w4?=
 =?utf-8?B?ajZaQ0pIaEU4Z09rM0pUclR6Njg4NngydlUxTmRpdEczdU9uSW40S3VnMVc4?=
 =?utf-8?B?ZiswRTZkOTFUM0RDa1ZUaXAyMkZzK1B6WGRuUkJSbUl6aHd5bnBjYjM0dEM1?=
 =?utf-8?B?RlZDb1RmbVl6YnJXVklXbXJJQWlCK25aUDVXOVM4WDhERm52UFpzeCtISjV1?=
 =?utf-8?B?NktETnh3Smd2VmtsMDdoVEozdVVyZzAyTE12WkRoNkhNK0xYOVRMbkw3akV4?=
 =?utf-8?B?eXlNTEpSbERkbkhYTmZmZVlCYVVJVzhmL2JjTWd0cGN4MmtGaHpTaFdNSXBt?=
 =?utf-8?B?enFBQ09WUjlWV2pNWTRsTlFVd0dhN1o2djFtTFFreEV5Y3JMSDIrVExqdjha?=
 =?utf-8?B?OEZ6cHVSazNYMDBFVlhuQXNla3FZUEFkeUxnenREck56NkNHVWp4OTlmWFhQ?=
 =?utf-8?B?eGRtMGpGRy9STnJ3Rm9XTUhCNDNyWGFpNnJVZjBRazFUZXErb3dxVmVGaTRI?=
 =?utf-8?B?YnZpdGNLd3M3bjhGQktTTmNsSnhtd3M4RmVTY0xZREo1RitGTTRESk9BNEt5?=
 =?utf-8?B?MjNXK3Z0ekhpdTRXVUxocnJZeEljSy84aTkxM0U2SGdQbEZ5MkFBL3M4VHNz?=
 =?utf-8?B?UC9XZXB0bVN6YWNHU2l2QVpQRVkxUjVTUlpBUENaOGd0Y1VUaUxaM29RNnd5?=
 =?utf-8?B?WGl2Um04Ujl4ckVLdDd6V0RDUXFib1ZPVkhUc3dtQUhubCtDald0ZTAyd0hE?=
 =?utf-8?B?QnpNQjh3cm16Y0o3VGthS2NnZndwY2p0elB2SkVHRVVWMDErOE1kY3l0ekdW?=
 =?utf-8?B?Ymsva1VZSHRBMFl6ZFBXVWwrOE1Kekx3eitaMWd3b3c1aXRLTzRaTlBLc09N?=
 =?utf-8?B?QXBEai8zRWZLMGtnb2dyMlBJcU5XYnVxZENSYUpwdFBreVhPd01mQm5obDNZ?=
 =?utf-8?B?UHVaMG92b1Qva1Q5TFBwcGVOZkFEQTlub3JMUEZ5V2M4ZkVVMkI2Mi9LSU1J?=
 =?utf-8?B?R3RQNHloWTJiQkJXR1lTRmVQcEYzS0paRmVGY3l4cG1hT21IeDZTUi9PZFA5?=
 =?utf-8?B?dWF4YkFBampQWTF3OUxKWnFXekM1Qmx0TU9pZmh5Q0VpdHo0YVJhS3VtWEpy?=
 =?utf-8?B?VzBCUnB5ZW1paVUzK1ZFbXN0ZDRscFhDUDJ5QllPcFJlNWVsaDc1VmIwYjBS?=
 =?utf-8?Q?FXZrxsCwjiesb?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dkp6TkUvUkN6T25MNDJSUmVXZFBhWmhVeFYvSmoxSDVESUc5VE44MWtKb09V?=
 =?utf-8?B?U2E5c1NkS1FmZHdpY1JXNDlpaHlBb0xPajF6MnU1cldKRlNDdnFVSXk5V05S?=
 =?utf-8?B?cSs1K3BIWEF6R2RqcTNCeFZZemhCYTdoU1o1SjlCMGxkbi9CdVBXLzlzVFRT?=
 =?utf-8?B?a2lSaEV2S0ErUXpRelUvNkVleTlWM1djak04R0Riak1Cb1BIOFgvVHVvQWtX?=
 =?utf-8?B?MFdzTEwrQzVLVGNXT0lIRm8vWWJPdldZbUhNQk5MWU9adWxPVk9ZSjJlM0dL?=
 =?utf-8?B?SWhZZ2tFd21FbnFTNmgxSTVyaW1BRHNMeHZQRE12NnlvOE0vb3lpVi9xT3VW?=
 =?utf-8?B?dFdKRkdUOG94Ny9zZm9LTEJhSS84dHBuVUo3SDVPc3JSbDZDY3J0OGhJOXEv?=
 =?utf-8?B?aVpGSUt3UDlHUGRmNC8wbFFHbG12Unoxc0JWNGVBd2JRb3hZOFZGOHhYV3Z4?=
 =?utf-8?B?Sll3VjdvYXBZdm1YeHYxeHFYU2NhT0lqUkJ2ZlBGSVlRQjMrR0ZoL1dta2pW?=
 =?utf-8?B?UWhESXRsMHhMWEpNQm5GVFBxbitIVExybnRyMU9TVm9HSFIxT3NnNXg1bjFY?=
 =?utf-8?B?b3M4OG5EK0hKUzVxYXVNOU11a1p0V09LSXpHUVBaVGdnaHFRU1NKaTlSNlZY?=
 =?utf-8?B?SWtWQjZ2VjczM0V2MDFnRW1ydnZJT1hvLzFyeFdQOFdiTTJkV0t2WjdDcXFt?=
 =?utf-8?B?TEd3QmtBKzBESUE2Vk50WElUN1YrYkNMdVJkNldYZFFiQUpTL1BIS0RZMlVF?=
 =?utf-8?B?T0hORm1UTUQremZiQlhDbHVydXV1alpkUkNydWZaQy9FNUZhVnU2Vy9mVDVu?=
 =?utf-8?B?T0xuT2Y5V0xzTExqNHJWVTQzUTU2TndqU1pkcFd3US95bkw5b3kxcWNXMU41?=
 =?utf-8?B?TFFzZFpKZ0k5QlBGMFl0eW5sTkdPeS80QkVWbUc2d0dQTnJQWnlpSEVVR2lx?=
 =?utf-8?B?ek5XY0xQQUhLQnk0SHpVUTR0bVVlSWVVWDlBWlZRazZjSWxjVUtST3Bvelh5?=
 =?utf-8?B?T3F6OU5sNXJ6R3JPZTdKSlpqVnRJT29lcUFDY2tYUHpFTXBGYnlYalRKT3k3?=
 =?utf-8?B?b2xCWi9nODBnVHl5VHBkU0JiUkVQZWZXY3BpbDczV2x2ZTRNUitvTVNPSVp4?=
 =?utf-8?B?ZWF2S3FNaHBCVjRqMzZmUWJuc1dxWGVLTDdTYWZwcjBzRS9aTENUaWNnbFlL?=
 =?utf-8?B?QUFxQWJTY2pnUmxuSWNKOEh2aEVxb2Vyb05EZHBKT3JJbGdTNGpJdFdmb0ZQ?=
 =?utf-8?B?S1JRcTVrc1h4cmdsSVA4RWdHWG1jUFY4RzRQNGlIWFpOcy80eENkclRCYm1R?=
 =?utf-8?B?ODVhNmhqTlpIbFhaWlMyNjY2Zy9wb2V3UDZoUzBncWFNVHVxTFgrdXJrQ0gr?=
 =?utf-8?B?R0gxM3c5YkkybjM4ZC8rRloxOGNzbmVyU0EyWm5ZcmhaNUQxMFZvbjlHL0NS?=
 =?utf-8?B?NEJXMUdzTEpEOFZqaHJxQWE5NnZ0RWZnUmdCMEI4NE5GVktLejRqNGRTM2dT?=
 =?utf-8?B?cnJWNUpBQXRid1pyZUt0SEloa21DakxCK2VnempOUm1EbFl6UTZqdCthcDVm?=
 =?utf-8?B?RWk4dFpqQ244cjNKck11d013aEpCa29QTGdOaVl3K2tuYndhc0NTOWE2akFZ?=
 =?utf-8?B?bnhsTUtxYk1Kek5KWGdZN2JmdGZhb3lzYXdMZEsvOEFPZUFWZnZFZmdLNFJz?=
 =?utf-8?B?blRNNHBGb3I1TWxiaWVaQ2NUd3UvTFNMT3RkNEpiM3FtdkJqSmx5QUdEMExl?=
 =?utf-8?B?U0w4QUhhQzVWcy82RWplcHdsd0xRbHEyTWZ2ZFZOUS92TWhDOUd5a0JzakYw?=
 =?utf-8?B?R1FmZkcyRFk3eS9CY3lPdU1FNEpxS1RZUUhlVWdZNHMxTVJScEI2TmtLUWUr?=
 =?utf-8?B?N2w4aHFKUnFTQTZmdW8yTmdMcFBwWEw4N2paZzh3Y1RhNitFR3g2OW4rRXlh?=
 =?utf-8?B?YkJZN3daY3VWVnJQTDcwa0pPYW1NZEFBbWE3L0hOcStwTjhiVEZXR2luSmR3?=
 =?utf-8?B?cWRsdUxIQ1U1dmdyWXNSY3dFb0duNkZqMWNZMnBsY1B2VjlzMzh3bGZ2cXVC?=
 =?utf-8?B?RGZPNitacDAzVi9PTmxaWjU4S3BLZFY3d25lNEtHU044KzI2NUhEVmdXZHZl?=
 =?utf-8?Q?1HKk9Ql71K6HW4gICBqoFxZ/k?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 368cfd5b-475e-40b7-9160-08dd5fb7e532
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 09:42:38.4970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EaQh0e1ytkyat/qkTQtBZh3GOOh+YxJAYkqpmkVzTNDM8GXSS6rNT3yqb8unS71LufvQPUlT0ytiSVFJ+n5AYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212504

SSBoYXZlIHNlbnQgYmFja3BvcnRzIG9mIHBhdGNoIGZyb20gUm9zcyB3aGljaCBpcyBpZ25vcmlu
ZyB0aGUgaW5kaXZpZHVhbCBDVkVzLg0KQnV0IEkgc3RpbGwgc2VlIG15IENWRV9QUk9EVUNUIHBh
dGNoIGJlaW5nIG1haW50YWluZWQgaW4gbWF0aGlldS9tYXN0ZXItbmV4dCBicmFuY2guDQpUaGF0
IHNob3VsZCBiZSBkcm9wcGVkIG5vdy4NCg0KUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBZb2FubiBDb25nYWwgPHlvYW5uLmNvbmdhbEBzbWlsZS5mcj4NCj4g
U2VudDogRnJpZGF5LCBNYXJjaCA3LCAyMDI1IDEwOjU1DQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZU
IEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KPiBDYzogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGFybS5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZzsgU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV1bbWFzdGVyXVtzdHloZWFkXVtzY2FydGhnYXBdW2tpcmtzdG9uZV1b
UEFUQ0hdIHB1enpsZXM6IHNldA0KPiBDVkUgcHJvZHVjdA0KPiANCj4gSGksDQo+IA0KPiBMZSBq
ZXUuIDYgbWFycyAyMDI1IMOgIDEzOjIyLCBNYXJrbywgUGV0ZXIgPFBldGVyLk1hcmtvQHNpZW1l
bnMuY29tPiBhIMOpY3JpdCA6DQo+ID4gU3VyZSwgbm8gcHJvYmxlbS4NCj4gPiBXaWxsIHRoZSBw
YXRjaCBmcm9tIFJvc3MgYmUgYmFja3BvcnRlZCB0byBhbGwgdGhyZWUgYWN0aXZlIGJyYW5jaGVz
IHRvIGNsZWFudXANCj4gdGhvc2UgQ1ZFcyB0aGVyZSwgdG9vPw0KPiANCj4gV2UgZGlkIG5vdCB0
YWxrIGFib3V0IHRoYXQgZHVyaW5nIHJldmlldyBidXQgdGhlIGJlc3Qgd2F5IHRvIGJlIHN1cmUN
Cj4gb2YgdGhpcyB3aWxsIGJlIHRvIHNlbmQgYSBiYWNrcG9ydCByZXF1ZXN0IGZvciBlYWNoIGFj
dGl2ZSBzdGFibGUNCj4gYnJhbmNoLg0KPiANCj4gPiBQZXRlcg0KPiA+DQo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5b2Fubi5jb25n
YWxAc21pbGUuZnI+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggNiwgMjAyNSAxMTozMQ0K
PiA+ID4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2ll
bWVucy5jb20+DQo+ID4gPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZzsgU3RldmUgU2Frb21hbg0KPiA+ID4gPHN0ZXZlQHNha29tYW4uY29tPg0KPiA+ID4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXVttYXN0ZXJdW3N0eWhlYWRdW3NjYXJ0aGdhcF1ba2lya3N0b25l
XVtQQVRDSF0gcHV6emxlczoNCj4gc2V0DQo+ID4gPiBDVkUgcHJvZHVjdA0KPiA+ID4NCj4gPiA+
IEhlbGxvLA0KPiA+ID4NCj4gPiA+IExlIHNhbS4gMSBtYXJzIDIwMjUgw6AgMTA6NDQsIFBldGVy
IE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiA8cGV0ZXIubWFya289c2ll
bWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gYSDDqWNyaXQgOg0KPiA+ID4gPg0KPiA+
ID4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gPiA+
DQo+ID4gPiA+IENWRSByZXBvcnRzIG5vdyBzaG93IDMgQ1ZFcyBmb3IgdGhpcyBjb21wb25lbnQu
DQo+ID4gPiA+IFRoZXkgYXJlIGZvciAiVGhlIFB1enpsZXMgdGhlbWUgZm9yIFdvcmRQcmVzcyIg
d2l0aCBjcGUgbGlrZQ0KPiA+ID4gPiAiY3BlOjIuMzphOnRoZW1lcmV4OnB1enpsZXM6KjoqOio6
KjoqOndvcmRwcmVzczoqOioiLg0KPiA+ID4gPg0KPiA+ID4gPiBTZXR0aW5nIHZlbmRvciBzb2x2
ZXMgdGhlc2UgZmFsc2UgcG9zaXRpdmVzLg0KPiA+ID4gPiBWZW5kb3IgaXMgc2V0IHBlciBnaXQg
cGF0aCAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9wdXp6bGVzLmdpdCIuDQo+ID4gPiA+
IFRoaXMgbWF5IGJlIHdyb25nIHZhbHVlLCBidXQgc2luY2Ugd2UgZG9uJ3Qgc3VwcG9ydCBuZWdh
dGl2ZSByZWdleCwgdGhpcw0KPiA+ID4gPiBpcyB0aGUgYmVzdCB3ZSBjYW4gZG8gbm93IGlmIHdl
IGRvbid0IHdhbnQgdG8gc3RhcnQgbWFya2luZyBhbGwgd2l0aA0KPiA+ID4gPiBjcGUtaW5jb3Jy
ZWN0IHN0YXR1cyBvbmUgYnkgb25lLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gPg0KPiA+ID4gVGhhbmsg
eW91IGZvciB0YWtpbmcgY2FyZSBvZiB0aGUgQ1ZFcy4NCj4gPiA+DQo+ID4gPiBGb3IgdGhpcyBw
YXRjaCB0aG91Z2gsIGFub3RoZXIgcGF0Y2ggd2FzIHByZWZlcmVkIDoNCj4gPiA+IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjEyMjgw
IChub3cNCj4gPiA+IGluIG1hc3Rlci1uZXh0LCBzaG91bGQgYmUgbWVyZ2VkIHNvb24pDQo+ID4g
PiBUaGUgcmF0aW9uYWxlIGlzOiBzaW5jZSB0aGVyZSBpcyBubyBDVkVzIG9uICJvdXIiIHB1enps
ZXMsIHdlIGNhbid0DQo+ID4gPiBwcmVkaWN0IHdoYXQgdGhlIENQRSB3aWxsIGJlIHdoZW4gdGhh
dCBoYXBwZW4sIHNvLCBpbiB0aGUgbWVhbnRpbWUsIHdlDQo+ID4gPiBleHBsaWNpdGx5IGlnbm9y
ZSBDVkVzIGZyb20gdGhlIHdvcmRwcmVzcyBwbHVnaW4uDQo+ID4gPg0KPiA+ID4gUmVnYXJkcywN
Cj4gPiA+DQo+ID4gPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIG1ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIgfCAyICsrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLQ0KPiA+ID4gc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiDQo+ID4gPiA+IGluZGV4IDY3N2E5ZTI5MWUwLi5kZjI0OTFl
Yzg1MCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6
bGVzX2dpdC5iYg0KPiA+ID4gPiArKysgYi9tZXRhL3JlY2lwZXMtc2F0by9wdXp6bGVzL3B1enps
ZXNfZ2l0LmJiDQo+ID4gPiA+IEBAIC0yMCw2ICsyMCw4IEBAIGluaGVyaXQgY21ha2UgZmVhdHVy
ZXNfY2hlY2sgcGtnY29uZmlnDQo+ID4gPiA+DQo+ID4gPiA+ICBERVBFTkRTICs9ICJndGsrMyIN
Cj4gPiA+ID4NCj4gPiA+ID4gK0NWRV9QUk9EVUNUID0gInNpbW9uOnB1enpsZXMiDQo+ID4gPiA+
ICsNCj4gPiA+ID4gIGRvX2luc3RhbGw6YXBwZW5kICgpIHsNCj4gPiA+ID4gICAgICAjIG5ldCBj
b25mbGljdHMgd2l0aCBTYW1iYSwgc28gcmVuYW1lIGl0DQo+ID4gPiA+ICAgICAgbXYgJHtEfSR7
YmluZGlyfS9uZXQgJHtEfSR7YmluZGlyfS9wdXp6bGVzLW5ldA0KPiA+ID4gPg0KPiA+ID4gPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+ID4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1l
c3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiA+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMy
MTIwOTIpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
DQo+ID4gPiBjb3JlL21lc3NhZ2UvMjEyMDkyDQo+ID4gPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMTQ0OTgxOC80MzE2MTg1DQo+ID4gPiA+
IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiA+ID4gW3lvYW5uLmNvbmdhbEBzbWlsZS5mcl0N
Cj4gPiA+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiA+ID4NCj4gPiA+DQo+ID4gPg0K
PiA+ID4gLS0NCj4gPiA+IFlvYW5uIENvbmdhbA0KPiA+ID4gU21pbGUgRUNTIC0gVGVjaCBleHBl
cnQNCj4gDQo+IA0KPiANCj4gLS0NCj4gWW9hbm4gQ29uZ2FsDQo+IFNtaWxlIEVDUyAtIFRlY2gg
ZXhwZXJ0DQo=

