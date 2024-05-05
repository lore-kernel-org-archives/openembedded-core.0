Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03495C4345F
	for <webhook@archiver.kernel.org>; Sun,  5 May 2024 20:44:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.79])
 by mx.groups.io with SMTP id smtpd.web10.6496.1714941836392791734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 May 2024 13:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ULHFs9FV;
 spf=pass (domain: siemens.com, ip: 40.107.21.79, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lS5lhswFWJxEEnr5YoWjSOuz146hc/IcGR5jxFgnJSxsfa1c5wpGFni+ry+8MGVAuULY+s2zRLnbQJiGu+KjoVGeYDKtmwiGNtf+l9Nxk7B/tHF8R9Q37IxzxBl4aidaarNuqSXkqmkD4V/coKKa3jvsI5riW51/grnsTn4m9AodIPY7W/4vVC2z3JnnV2SMsA3zPgggWfoOnXBshRRqKpRzOI0L9AYTnVjqPU0g9papgQ6QxoaDJIRFr/ac9Bddk+MittveCT9vTah9Wvq1lEbM9/lLCh2OTEIXxWWQdSuaiVZoP2UbMKMoVQ+d6prbTwarUrcqUNsKY067CcqK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVEQpc5JYuWwThKTAQDu2q/W4GPMqL6t/OQ+El795CM=;
 b=Su8Khx6zXpSJRvMQTyCJGUQVYz+PgvZA27Gtvfxg9D7QSVvqJXLZiPAD7s2wnWU0HH+LTYs6eDd50+w7TU1e4aPtTasX1i5OaVx6+FpE7TA3CeIlRysnSuddGZT/dfLHEkIgkCKe9e/zV9OZ49UJTyeGKwOqD3+pHciRtHbodG7P579zZlFW7GVps9xbCZMaKunIFdq3cmueqkBB5CXmeK53RIYrZ1iU2fWOD/KTfqFQWTYgxQio0OdEUuDCmLisMUQlnliq1rUcl/1uLTukNDJIexNCbfasOC1ZGum85Pr6XS60RcBRd72FwHXSdxJux/5x3s4lpEUr9/gb8f2Duw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVEQpc5JYuWwThKTAQDu2q/W4GPMqL6t/OQ+El795CM=;
 b=ULHFs9FVAR/dEv+2dTh5t2cNJOrmJQMHwCvM8Ca0xmFqmYuQ8GcVKE26umVeNEX8Cpw5xxOGm3dUdFNV452AB/D/H853/FZOXKk8Rs+L25RFHzpWRV28Ox2ss+eu5CWtW4vrSgDj3sh07i8kBCZRgo7rXBxqhtfE/KkAM06ciX//SXNIlK4/8KGiAcBNkGEvWTTnzeFH5ygSZZ04FfNiPIlBszhflTNqPlOyv7DpV0eryM1V3dGEjqpeT8/yZynEdYDKmzPqvFs7x/2GZoVIkm2gsziZ6eOm1cjjaAjnMAfMrR0rgwd7eQi5WUGLRdK1Fn6laY/8nmb7j2njpAjA4g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB7178.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Sun, 5 May
 2024 20:43:52 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7544.041; Sun, 5 May 2024
 20:43:52 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] glibc: correct license
Thread-Topic: [OE-core][PATCH] glibc: correct license
Thread-Index: AQHans0l/jk2PEjbEEmdiWfRXhr8b7GJBYgAgAAURJA=
Date: Sun, 5 May 2024 20:43:52 +0000
Message-ID: 
 <AS1PR10MB569772E4AD10E6FAA803DBDCFD1D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240505091720.8682-1-peter.marko@siemens.com>
 <CAMKF1sp1=f6Akrn2NeYtS6EuOO+_PVxpbc+oSCNyFSVsKnktDg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp1=f6Akrn2NeYtS6EuOO+_PVxpbc+oSCNyFSVsKnktDg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8854fda9-8ec3-4e82-baa6-2c1d778b542e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-05T20:35:00Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB7178:EE_
x-ms-office365-filtering-correlation-id: f88a8225-a07a-458d-8885-08dc6d44133a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y2FPeDNCQ1loSkNBbjAweXNiYTdJK0ZXL3g0ZHFtM0FzYk9JemlYdm9oM2hH?=
 =?utf-8?B?b1pCSEQ0Z1dKVXVaMVRJdDMvVmN1bG1sZEdkTk5jTmxISklwWFRNNzRGaHVz?=
 =?utf-8?B?M3l5aXA0bWZORFV4NGhzSEk1eUMxQnhOcEEyYlQwMkZmSHVoc010ZWpweVB0?=
 =?utf-8?B?ZVc0d3UzM0RCZFFleXJ3VWdVd2JXM2pMNXJEbDR4bnk2ZmJuRm12cmRUeTVX?=
 =?utf-8?B?algrNzdCclphOUFTeS9ZK21CQ3lkOWwzc0ZRN2NTbDM4cUhBVzlMUEJaSktQ?=
 =?utf-8?B?SUFKQjkwZTJxc2RFdFFqa2J1RGQydzZPdjByc204R2w4c3lmQW5lRGw5bUR4?=
 =?utf-8?B?RmJjVVRRWnd5b2dVaGZ0VTQyQ2ZCQktFYitwN29xZEEzWDZ1V3hyS0xIT3B4?=
 =?utf-8?B?c1NOSEUzMEN5a21UUlZySEw1K2tCeksxMEN2cnFabGo3WkhxVCtqTHlJbEt6?=
 =?utf-8?B?enlHaVlTSGkrMU1nNUl6OXJMWG84STZaYXVBaXZOWnhxN2RnUU5RcWhVU29F?=
 =?utf-8?B?RjRRZ1d6NW1PTHhXUjkyZDE3VGg1MUgxWThEdTdXVnVUWTNHQ2htYk0vbGNV?=
 =?utf-8?B?WklTTlFpSjREenpQa1pFcklHbXp2RldjTTZlYUd6alNDVXRNK0o5SnZNK3hV?=
 =?utf-8?B?em5qSjZOUUpwelU4djN0TjMvdW51d1dubGtidm9tNWtmZHRBWVkvY3V1Tk9H?=
 =?utf-8?B?U2IwSzVudm1zTnBqdXRsOTlHQ3ZJSXJjbysrU0gwcUZCU1YvRVVuRURia3RF?=
 =?utf-8?B?SE1oTFNLOHIrL0tod3IrdHl3V2N3THZUNTluZm9Xd1g2TDRURVVLeXVrNFFs?=
 =?utf-8?B?cDBrZGZnMDNpT1IyU3B4TlMvM1dub201VkxWZGFvTzZLcFpXK1FkRTNQZFN1?=
 =?utf-8?B?OW95S0JmQ2pJcjNkKzFNNzFpcjlCMm10UEkxOTZwdGdNUjBqM3dYMmlVeC80?=
 =?utf-8?B?eGhNYmFrTTRhaUpiVVF5bXpUOFRtdUJNMFl5VGZ0N0k3dlRBQlRQYnBnMit1?=
 =?utf-8?B?Z20rVE5iMUV6OTVBc3dWVkxBRFFJMHlmRkx0RXhQMEw4MGZFSVA1Y1NldW9p?=
 =?utf-8?B?bjlEbUpodjdkVVNHUXFQTngxYWVBRmlUa1JsL3JKaEtIbU1FbG9ySkNpRCtT?=
 =?utf-8?B?YXJLVGEwcXdFUXA0Y1BMYmt1VzVYN3ltRUU0aVRMYUF5NmNpQ2FtQkFTUmto?=
 =?utf-8?B?MUhEY3hyWWF2TEpkekdvb0Z5T1Rwdks1MTMyemEyTnowWU16VmNaVXdlbFMz?=
 =?utf-8?B?MUxwNVFGdzI0WTJmbGdKdlJuOW9aR2VXTHF3ckVoVE4rYTduY0t2THl5YkVR?=
 =?utf-8?B?T0QxNTFaOXY2YnptZDNXZlV6REhQM1dBWnZEUzlnVHFOQzFsakVubUx0bERX?=
 =?utf-8?B?dXBYOHVuN1FPY3gvUE1ZN0xUemxQS0sxb0ppbC9EKytvSGs4cDBobS9OQlJK?=
 =?utf-8?B?cG5VQjRmRHA5aVBEOVpuNUdRLzRSRFg3eXhtdjZmOWxnSVp6YmdjR3hFNXBu?=
 =?utf-8?B?NkowOUgwTWo4YjFENGp1RnJveStrVXpLWSt5NHZIRi9FMTBaV2VUaXVHak1h?=
 =?utf-8?B?U3daWXN1ZlFTbTQ4OXdZR3YzR0JaTGxNeTdTMlgvNzQxcFBHbzR3TGw5Q0pu?=
 =?utf-8?B?TmpKT3JYejVsQ0hMWUdZMDdSUW1mZlhxU3JVNHlXMFpFYmo1UTg5dnhpYWNk?=
 =?utf-8?B?MkRlSmhXaDFvNE5jbCtQc0xXemVaTW9iNlQ5a1I4T2ptOGtLak1hZE9BPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c0xuaU9McEJzVVdWNStMS1Y5eHk5NUFZbWdJR2lGR2J2Y1AzRm84TEhxbmVx?=
 =?utf-8?B?eHlRVXZUNEcxOEI3KzlKYzZiaWpRMUlaTFhvc1poNXdzaG5OQWRQdjRJV2dv?=
 =?utf-8?B?bWJnd0h4K043VkJjcHlrZ1o2WWhrMDNuWjl4MU9kWWJRaER2RW14aW9rUkVV?=
 =?utf-8?B?QXVvVENxV1hzMXpUR2ZFV0EyN2lIaWZTcnRUSi9CM3RYck15VXpQZlFnQk5x?=
 =?utf-8?B?S1ZYMXJETmR3SWRTTTNPZFNoSjJsR1BrQWdDb0dOQnkza0V1ODRLUkVsTEI1?=
 =?utf-8?B?SXVKT05CWWxZblBUcndzWGlRd2t1bzlrMWwyMUk1RnRvdGVudnNVcGhoRENT?=
 =?utf-8?B?bGxkazJaTTQvbjZ1RWpUQzJkbGJDMitLS0x2am1kNkUvSEhvQnFEYkt6SUJv?=
 =?utf-8?B?M0pPY1dkTVRpYVkzZTA1RWhTR3liSzl6bDNBck14d2ZsUm0zWFQ0KzhTczhP?=
 =?utf-8?B?cTM0NTZVL0ZmTDQ0QlF4RDRXZkFmMmNESXB5ZnFXT0xudFhvaGlLeHZnRWFs?=
 =?utf-8?B?REFLWmt0TzdNL2FTeGdkcVVEek1hdlBmNncybDAxUkROYVFTRDRyQzF5N0RO?=
 =?utf-8?B?VzMyOTlOSXlsZ3FEeGcxdWFOVk4rQUwzKzlMRU1sVXVjcWM4cDVxZkVwVnNz?=
 =?utf-8?B?TXcxdUdpblpFUXlJSXA1T0dmZ0NIa21kZDVaUnh0UUdiTFRqUVVESjNldEVH?=
 =?utf-8?B?Z3FJZWhrNUc3aURMT2l6VEJiQnNxQnF0anhPaEgza1RBcThYWHhHTkFaZVhp?=
 =?utf-8?B?VVk1a3BSQmo1RVptQlNOdFExL2lrMGRvRnpOSXJOS0tJVVptYnYydE0yQ1ZO?=
 =?utf-8?B?V3NjWEs5ZWJJTFZNTGU4eHJHMDdaOTlOV0N1Y3cxRmttWjI0NVdNL3lTL0Vo?=
 =?utf-8?B?aC9NS3FyazFpdTNOS0xmTHdrS0dhMHYvaTB6dmprckpKWlVUbnFaY0Q4b0M5?=
 =?utf-8?B?b2p4dUcxZi9kNzZWSW43RkVRbmdzdlJCd1dUWWwzRFRtSG9ZOTJ6NHE1QjFL?=
 =?utf-8?B?SHUyRTQ2aERqRmJORkpVR1ZVNjJrSzNaNlhwZjgzNE02T3lUYkYzRnlKNWRU?=
 =?utf-8?B?eWVHVzl0T0wvQW80cTFsODJReTRIcmEzNkoycTZRdFhZay90cXE5eEdnZWFl?=
 =?utf-8?B?eG9OTXNrUmJPci9rTFdzTjVLQ2l1M1J5UEpOTGgwaVcwaVFkRHllNE9vYXNw?=
 =?utf-8?B?Ukd5UDJSZFFJc2VONXVUaDlIdXpPT2tWTVgwYzBJMkdwcTJuaWZCOHptUkt2?=
 =?utf-8?B?WHU2VlBXYmh3YlZnSDd4Vk0zbTVhYmRaQkd4WmpQSWFCejJ5NmRXNzRHRUxk?=
 =?utf-8?B?SWVJdm9MdmRlTEs1TnhlUkFkSmU3UFoxK1JpY3QxdGtOVHdsOXVWbjArYm1T?=
 =?utf-8?B?Q3dONm9hWmd1TzBQcDV2aklCc2VkUEQweUs4bG9nNFJXU3JERm9GUUVFMjNM?=
 =?utf-8?B?blYyTzBTVkRyT2xKTGlsa3dPZ1RaRlVGT2VseVJNRjM0Vjk4bnBaR2VIWElo?=
 =?utf-8?B?MWd2NTRQck1iZFo3cllyRjR5aWdWVVNUTWo3dnpUdGJtb1RkZC9VUGk1QnlP?=
 =?utf-8?B?OTNvV3REVDNZOXZqdWp2allaa3R3Mys5QzhtdDRqVVJoZklhMzNwRHNCYnRG?=
 =?utf-8?B?d3hRYUxrSit1TEtKaTZXb09POEFPdEJhVFNvWFBjRW1mbXR2UU05WjNTUHFi?=
 =?utf-8?B?cUs1dWxqQ1E2T1U1Q2dkVGJsL2k4SVlzalhGdWhObDVSN1EwWG43QkEwQ1NX?=
 =?utf-8?B?eHkzR0ZCdlRuNGQxYkpERk1IMzc3OGpKcjh0WUZCcmNLR1lpb3NUQmZoZSti?=
 =?utf-8?B?Wi94Zk9ST3poM0o4K2JqRVRsVmFvN0FGYXJOK294Smp0UHE1dll3cE5uT2ha?=
 =?utf-8?B?TzZFaGM0SUgzMUtHeExKNDVyc0V6VjBveWJnWjBZc1ZGdG14bXY1NGx2N0Qx?=
 =?utf-8?B?ZXJFU0ppOFQ0OXVDRjU2TWJUOTMvWmZ4Q1psUVdyMk9nWCtCZG1FckRUMm9z?=
 =?utf-8?B?eVB1L0ZYUGRYTVpWSXJscE52S0JxNC9rYlJCZXFiengzUnA0RUVRM2o5bkZ6?=
 =?utf-8?B?cDdYc01GdmY3S0VlNEd6dHdSNGNDSUFpUHFvVEFnblQ5cUZiZXVnR2xLcVBJ?=
 =?utf-8?Q?3OlftI2OpmtFPqve2MATzRtbG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f88a8225-a07a-458d-8885-08dc6d44133a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2024 20:43:52.7100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4uu8VIJEC62IKGENT2GQQFg9g24839Vd1XpBEEEiouH4BzgythwkExpjbrlpUi5LP3cL54/J9mnM0Y2NIcr98g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 20:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199026

RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gDQpTZW50OiBTdW5kYXksIE1heSA1
LCAyMDI0IDIxOjIyDQpUbzogTWFya28sIFBldGVyIChBRFYgRCBFVSBTSyBCRlMxKSA8UGV0ZXIu
TWFya29Ac2llbWVucy5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gZ2xpYmM6IGNvcnJlY3QgbGlj
ZW5zZQ0KDQo+IE9uIFN1biwgTWF5IDUsIDIwMjQgYXQgMjoxOOKAr0FNIFBldGVyIE1hcmtvIHZp
YSBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cGV0ZXIubWFya289bWFpbHRvOnNpZW1l
bnMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IEZyb206IFBldGVyIE1h
cmtvIDxtYWlsdG86cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiBUaGUgbGljZW5z
ZSBwZXIgaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9saWJjLyBpcyBMR1BMLTIuMS1vci1s
YXRlci4NCj4gPiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1nbGliYy5naXQ7YT1jb21t
aXRkaWZmO2g9MjczYTgzNWZlN2M2ODVjYzU0MjY2YmI4YjUwMjc4N2JhZDVlOWJhZQ0KPiA+IGNv
bnZlcnRlZCBsYXN0IExHUEwtMi4xLW9ubHkgcmVmZXJlbmNlcy4NCj4gPg0KPiA+IExpY2Vuc2Ut
VXBkYXRlOiBjb3JyZWN0aW9uDQo+DQo+IFRoaXMgc2hvdWxkIHJlZmxlY3QgcmVhc29uIGJ1dCBv
dmVyYWxsIHRoZSBwYXRjaCBpcyBvaw0KPg0KDQpDb3VsZCB5b3UgcGxlYXNlIGJlIG1vcmUgc3Bl
Y2lmaWMgd2hhdCBzaG91bGQgSSB3cml0ZT8NClRoZSBsb25nIHJlYXNvbiBpcyB3cml0dGVuIGFi
b3ZlIHRoZSBMaWNlbnNlLVVwZGF0ZSBmaWVsZCwgSSBqdXN0IGFkZGVkIHRoZSBmaWVsZCB0byBz
YXRpc2Z5IHRoZSBwYXRjaCBjaGVja2VyIGJvdC4NClB1dHRpbmcgdGhlIHdob2xlIHRleHQgdG8g
dGhpcyBmaWVsZCBkb2Vzbid0IGxvb2sgcmlnaHQuDQoNCkkgZG9uJ3Qga25vdyB0aGUgaGlzdG9y
eSBvZiBnbGliYyBsaWNlbnNlIHRvIGJlIGFibGUgdG8gYXNzZXNzIGlmIHRoZXkgbWlncmF0ZWQg
cmVjZW50bHkgb3IgaWYgdGhlc2Ugd2VyZSBqdXN0IHdyb25nbHkgY29tbWl0dGVkIGxpY2Vuc2Vz
Lg0KSSBqdXN0IG5vdGljZWQgdGhlIGNvbW1pdCB3aGVuIHVwZGF0aW5nIGdsaWJjIHRvIHRoZSBs
YXRlc3QgaGFzaCBhbmQgZGVjaWRlZCB0byBjb3JyZWN0IHRoZSByZWNpcGUgTElDRU5TRSBmaWVs
ZCBhY2NvcmRpbmcgdG8gdGhpcyBoaW50Lg0KU28gImNvcnJlY3Rpb24iIGxvb2tzIHRvIG1lIGxp
a2UgYSBnb29kIHNob3J0IHN0YXRlbWVudCB3cnQgdGhlIHJlY2lwZSBMSUNFTlNFIGZpZWxkLg0K
DQpUaGFua3MsDQogIFBldGVyDQo=

