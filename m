Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B1FC982C4
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 14:48:19 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16835.1789570092617111305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 07:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Xw5R1gPa;
 spf=pass (domain: siemens.com, ip: 52.101.72.70, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2HxH8msXI3WRqI/iUlskY/g9zFspm+DKjb8tx2/dIc4WAcqr0cPc+3gzag1rUWfLJQpQctAtPShBRejIuCsrOXRI3785RnIFecGGjyTcsp0x4Z7RwVyIlFX6d5ceuBxR9R/F4Q7cMXnwMiCTZYQH5UsDIQNtzAsyi9Pe5msAnOOF3jscFO2X+Y8yDCZSJFCKIBkvSG19kMjJSepcMB4HCVXGO8T3PWtmzshQ6YCUMmoifhzjcp1VF5+kXbUAZC+eiqRZzkldt6A38edAd+VYSQfz+SMT7ZVs6DSnJFO55cqvc1p8Xdj3X6583aBbOeHdcfQjDSxbWLi/PworNBjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9asW+xBzzgQNa8hP7HxDEwPXjSxlfkM90e43OKAxXg=;
 b=huW8BHVawdBJdXRtmWCWjq8o9ignCULklN218lp0CEAhzJ3Q7PF0k4X8v6H3N39X8d/DdiWzwPqoR6dnbVcJWE+i0AePMgUqyFX0A9ZHoJ8j+okk9aPEQ+UHMotpDLwNjYEJVh5Jr7H0jRAQVrpR3Jg9xBGe+ZrWpgBL4Ep88joDC3gKQ/h/YZnXetcBRhOE+Wj2WEmparrPc1ZARFmEqZzrXDmhg/gia3IHdQO8jNdONH/Sen20uI8ibruaNrfyDrI5y8q3iNP9htW440mpiEFgtjkxX85ixNYmAvrrIVi8x9+jG9EpOs4y7RltPYjXdb/yDHB4zOTtGxZdtO7zNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9asW+xBzzgQNa8hP7HxDEwPXjSxlfkM90e43OKAxXg=;
 b=Xw5R1gPavRCh4s7WAcFjzWiLozFjvTDI4MVlx+4RpnAINyUms50HdJfeHDDdKUQOQeQw9DcsiULsgaeP41UhgYGwADzVrBH3kWqZ7GFU7Cuc6WdIlDx+2ziDO+mJLjG2ieb9vxvwaKsfPFi74i7z58jdswVjZ2Z+pSPeq2nGMLlTLLibh710z4EscB1m9R0+pW5Ho3NogS55I3BYIAA7/4lbsmBnoH3haeR8PktmGPTEPml9e7G+WP5rV0DBWLVP/hILfD/3Yfq8K+KGO6CLre4LZF2kVGmVQ3E6A3urniiTOlTv59JcVvm6ECM8c7XNR725wkK75UX4P9B4tjAhdg==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by GV1PR10MB409108.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:137::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 14:48:06 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 14:48:06 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Antonin Godard <antonin.godard@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/6] devtool ide-sdk: cleanups for the upcoming
 release
Thread-Topic: [OE-core] [PATCH 0/6] devtool ide-sdk: cleanups for the upcoming
 release
Thread-Index: AQHdQ7thE8ZBsvBxnUSc2nQmY8CJg7bQx2uAgACF4gA=
Date: Wed, 16 Sep 2026 14:48:06 +0000
Message-ID: <bcfceef717bd5960aa3931a05bbc34eac14fb11b.camel@siemens.com>
References: <20260913200624.331753-1-adrian.freihofer@siemens.com>
	 <DLGJGK7BLL8S.3CPNDSZM9ZQZD@bootlin.com>
In-Reply-To: <DLGJGK7BLL8S.3CPNDSZM9ZQZD@bootlin.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|GV1PR10MB409108:EE_
x-ms-office365-filtering-correlation-id: b009fbd3-e13e-4325-2139-08df140184c4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|55112099003|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 sNs2+Gr/kry21KelHRlz3eHD5Rs4yRpbRMWq3berDyswCUulEAMbiMD7MS6H7ybATZmZoTc9XAFtMTnKxq9Yw556mWdIOarWfp/XjdW8RHK6GvuhW4RtBhlNnwNTCsm19HnNjc3JSskIjlOzj1BujIvImvnep8N0YSIVqBSdR+3yRY8INKCtPxp3EHfxy/Iy7ag7EwQpVZSEV8dyAxAQ5L16z/X7zcgSBizOLwuymiOjENlTXj19M15rb6IBYMy+AMMSNot0nzeNOve9SZsibFyyQExF/lKCJSJN/Q87tvRs/9ajN+nczCEI4eIr7rcNljKhHdXbdcN8XNA9aTd5RBjQcZN6fuvP6sU2+DwYBIUI+LNMU5wfzJ2vQAS1lKat2FX04KNI6/7gtW4qkyfAKqxtT5gr3MWR8KYjvjD51/rHRC405JDmGVh28h/kupud1skIEtZiiIvJ41XpvAnsnXUwbva8HyI0ndCAKE1z9KzaeEKoDTR/fpCibaIHlwOGfoLU8JJbgi123BqNdoj0moZ3/oYj2i5QT0Kq8Rvk01yME2q1LiwmW+lNanLhUDzO4VZS2aQL3bOvUSPtiRhDjy5jBeCKWHR+DA0T14Za48+B2gH9D87tDqROgAafntKapHwuNgcrA+tM1PHJuW68p2AEZstD1bLSdO8uwDtOn1wh753vl5XoB+TsmNkCeXnlpq3X0xoyEhmC+6GDBg/YZZTDEeEmYoMXjPCoWqnVAdE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(55112099003)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RlY5NFE5NnVscGRYU25haERMaGlUYmFMcVp2U0YyL0pic0lqWWdtUkZDMzVK?=
 =?utf-8?B?citmUDc5cjhNb05xZVVHV0RIL2IxdWlpbzFkczRJOTZIZllkS0J3b1c3WlJm?=
 =?utf-8?B?cFc3Q1hFKzFFVmtaZ1U4UUpHRUh1NGtrazZ5ZlczWFhDUFJkdEdvU2c3cVU3?=
 =?utf-8?B?OTdKNm1SVG83UEZ2RC9sVTBWTHQ2SjlhaWpQeWhXTnlSYTI2VldqRUxJUFMr?=
 =?utf-8?B?YmFYTFhlZFI1bTRrT3ZYTklka2g3WW5ETDJyWFpka21HaENaWXYvbnp4bW9P?=
 =?utf-8?B?dDE4bG1nekdoMlBOWHVNbGpOVTRUaStiMFZNNWxOS1hyTWlNNk5ra3Fod29Q?=
 =?utf-8?B?YmNoTWU5ZE5QOC9ZWUZrRUNoWjZTVGJ5cUFJNzNJbURDTW5HUGtMaVdGVmtZ?=
 =?utf-8?B?LzJGN3A0QUxmT0JyenAyS3loNGhjTXdTMzd3S21VKzAzNExLNHB6MzQ1NTJZ?=
 =?utf-8?B?bnI1VlJqUnVYSHBSMndwZTBTQVNuZjdTOHZva0R3S01GOWQyRjJGZWRtREUw?=
 =?utf-8?B?aVRHY3lHL3BYaWdFZXRCTUhLNThZWGtmOGtDVVVTRHB0bmpwc1NXUjFnU1M3?=
 =?utf-8?B?dnlmODcreTE4SUJUTHZmTjFUWGV1SVlBemtCRk1zclJVRUZ2MHRaeUhTa25T?=
 =?utf-8?B?a3RxbUwyTi90Z2sxZG4zKzBYWWkxdmUzRHJ2QVZVNzcwVC9KZlFvQnV5YkdM?=
 =?utf-8?B?YWFxRFlJbFRXdVg0Vy9SS2VGbUFOMFNnSWVSMThqTVExRVpiMHVaa2syMUk4?=
 =?utf-8?B?S0N1SDhXQTYxQW9Hd3IzM0VNVFQvbnIvSjNQYlBGd2Y0LzJxcjVRN0txRlVS?=
 =?utf-8?B?a0s4bG1vZ042UmZHOWZBYnI5aCtkTEZKNjFXRXZtWWJjc1NWRTJRNjBqeXpW?=
 =?utf-8?B?angySHRibFBpT291NUlLcGNpRTNYU3R0NzNoQjQ3Wm95RlQwbXplSzVKUlFQ?=
 =?utf-8?B?cFQ0cFU1bEhOKzRwak9hdTdGZ0JkMU9qcG5IU3ZzMGJrVjAzNVdlTjZpcVNG?=
 =?utf-8?B?TUlCMHBPWFlyeFFKQTFJdnU1TkZ1cXljM3VhUDZVZm9BcDE3Wk52ZndOTmJW?=
 =?utf-8?B?ZGIvWmxqdFB5K3JoUDljM29pRnJvV0NvdjBPR0dmUW5PVHcybFQydlViUldC?=
 =?utf-8?B?dDZxVkxaUzBzS0FaVlFCdG5WTkJrN1EzcW5oRk05OUZ1dEwrWnd0TkhaQU9j?=
 =?utf-8?B?TzJyQzJibURTeDZlWWZ2dDZzNjFHWWF3L25DcWhOK3FmQWs2OTViQUZ4M1Mr?=
 =?utf-8?B?ejZnc1JsNmhTQ2k1Y1B1ai9UQ09lMzUyZVJZbVc5ZVFlZC9mUnNuT0NIaHNK?=
 =?utf-8?B?eHcyWDUrZW9jRmdFQVNscmp6RWozMy9ieFAxY3phYllWbTQ2SEV2dFVKclJN?=
 =?utf-8?B?NVJ0V01Nc2JiaDdXdGZaME5Kcm1ydTF4RFdRNTJoSlE5SlJ6VEdSUjJRU2h1?=
 =?utf-8?B?eGpRc1dzTWcyQTE3YUJVM1JWREdMbVorVVcwZHhweXh6Z1F0SWhNNXFsUFM2?=
 =?utf-8?B?SVUwZUdkV05rdTRKNVpaUGRPMnhhM0xRZGNIYlY1MFpOQ0NjdVNoS1hoSW5B?=
 =?utf-8?B?YjF1NmRIVXFhNEg5cVZraThnVG1jRTcwa0dCNUtTTUpaVlA3d1pvRUxvbk9H?=
 =?utf-8?B?R2R5NEx5TTVXS0ZvNFBjQXFFcWVFU1pnSmU0a0o1Zm93aVRXcXE4aU9XdWhQ?=
 =?utf-8?B?dEVxdWFYN203RnpHOFZEd0VYQUlSdFloQ0xlWXVJb3NaSjNPN0xTSmVPTnZD?=
 =?utf-8?B?WDB0SXpUNktyMlBYRGJzdHhvSDZuWVkrNEp3MkpLVk9SWG1CeXZtK2FBWGp0?=
 =?utf-8?B?TjRKdFJTV3M4M3pQTlhsNFFiWEtBUTVJNlZhVW13cjdMb1c2VStXUjZqMElx?=
 =?utf-8?B?b0xoejI1RDlmV2drUFhFeEQ5WjRnR1RBYTFwTExGVjh6MjVWeEVuaTBVUElv?=
 =?utf-8?B?emhEMi9PQmVLTXFiV1N5elNwTFR2cUhHWWZ3Qk5rQ2trODFLelZkaExHb0ZV?=
 =?utf-8?B?Y2xWdTdZWVNrdGtCdUQrYU5ySjdxeW81S09OalJWV0FWVm53T3JMTUVNTDZQ?=
 =?utf-8?B?ak5NRi94L1pxWklEZHhzd1ExUGpTTitsa0xRWi9QNHBsbVZkYTNpQmVHS2Rn?=
 =?utf-8?B?Y3pQQWNYRVBvYU5uU3NFSXd6b2JjQ0ZyWTZCVVRnbkZHa2lpVWdXTmJNTXdL?=
 =?utf-8?B?SVM4aTdxUzdpNTJIdHFnUHF0c2RtNDAvblZNeUxQU3VMZGYySEx1MVBwWW92?=
 =?utf-8?B?UDRpSnJtYm9uaVR1WnFJbzJTQXhOOU9LUUFnY1MvZllhckNsN3UxOERsV0x2?=
 =?utf-8?B?azh1bVpWYlhYQjZqNThxTGdsbHgrY09UcUZLRFR6K3U2eTEwVHA1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E51CADC2906294CAA9C8B5F05035057@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b009fbd3-e13e-4325-2139-08df140184c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 14:48:06.4539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ABMqubbOB4OM808iP0qpfAwduK1llAhSWO+5bd3xo0eq4g3DjprQcTO4kXvcOPPoMXRORpoEXGrsIB/EE6LqgR78pq0Cy2uPpTfNNS06/RY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB409108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245980

SGkgQW50b25pbgoKVGhlIGlzc3VlIHNlYW1zIHRvIGJlIHRoYXQgd2UgZW5kIHVwIHdpdGggdG9v
IG1hbnkgUWVtdSBpbnN0YW5jZXMgaW4KcGFyYWxsZS4gSSBuZWVkIHRvIGludmVzdGlnYXRlIGZ1
cnRoZXIgaG93IHdlIGNhbiBzb2x2ZSB0aGF0LiBCdXQgdGhlCk1BQyBhZGRyZXNzIG9mIFFlbXUg
aXMgbm8gbG9uZ2VyIHZhbGlkIHdpdGggdGhlIDEyNCBhdCB0aGUgZW5kLgoKcWVtdS1zeXN0ZW0t
YWFyY2g2NDogLWRldmljZSB2aXJ0aW8tbmV0LQpwY2ksbmV0ZGV2PW5ldDAsbWFjPTUyOjU0OjAw
OjEyOjM1OjEyNAoKSSB3aWxsIGxvb2sgYXQgdGhhdCB0aGlzIGV2ZW5pbmcuCgpSZWdhcmRzLApB
ZHJpYW4K

