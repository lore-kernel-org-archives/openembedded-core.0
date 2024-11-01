Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D78E67498
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 02:57:52 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.119])
 by mx.groups.io with SMTP id smtpd.web10.29226.1730429869337971359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 19:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=GvuhJkaj;
 spf=pass (domain: aspeedtech.com, ip: 40.107.117.119, mailfrom: vince_chang@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwFD60YTuAau0AB8BX6I8uOuPo+3iHPnXe8t/spNYhtrdbC2FU1Dasy4bhgeMciibasCH+MjHMSeoYH7aTRn+Mk+PnIghXPM9Mk2Q6UXElWIoJD9Dx4eRaMBOE5GcwrPipVpbx1AezgDNjILFjOgfqkT/w9dvMgTA1jIlfCbyaB/u4oB0s3sMnh7pDE07ZmfvoQisWjcj8GNcJGz4RIIOpwCh6uOkvPAw7sVjw+Xh/SyFnIIUZ8gSmycWuuwRnF6qngG+1IwX4Rf0tVoHF+qY2KJwScAmvc5AdMWyl7fBASYtPv5MDIREVILXdfzqfci0lna+Z6jlxy+4guUPaWFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXEeK6OF0ElpwUkXem3pdfcS0UpM5Bp8nHgCjV8M9DE=;
 b=NKZt+BS7YWdDGjaGY2iUMXkYKkyg4oGhzEwNaTKj7L6kQUe0A/zKbT+BoFE/k2zIAhAKAYDcBXrgxL+pqmBFexZrKGZMJ2N/pK0BkM+RtLcpdWArjg+Z6WLUwu0EI9Agg1hafmkKRZQdpR0WudmiOEyiVxCottwtPfND3vaDxi+5ktL4kXFe5xOuvlDlap37Pzw5IgOtJ6tEqci27byNIvIHWHAGCQ6QqMytFwASVAQiulXbhpgAf5vb7Sc5xjJxgx+EPErKfGq+yo6iU9slg7Rglb+LSbzVo+CP6PbAvCkjjHgrpwBo7fz8e91JHrUqLZMXiQvzwzAn0cAk/8yn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXEeK6OF0ElpwUkXem3pdfcS0UpM5Bp8nHgCjV8M9DE=;
 b=GvuhJkajXNWfEoCpYUAFAPgy6jf0Dnh7IwgjM5HMiIk78DERDesC31OR72oE0Tnv3xm5oO2iwNDmL9fA5hYxP04DMZSNZKJImQyrcKjsXMFhB3rTKs4X2LPSNA8wv4Kg11q0kJh2js2gSF5i68u4YlTuwkVovtL8Xh17zQaTG225mW9mw1iOEtWiJGNnFe8Gf1NMKXTz57jaLE2advPu4ZxsI8aNolSNPiJTksciUWcik28EDf9tYY/m047mufSm1ynZwLEJrs6XzVuSx1LRn3shmnqXwIcxe3MzWNIObYi3j/4ZIzEBRI/jXW9CetWkmuZwz+40B/PXgKKnEh81cQ==
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com (2603:1096:400:271::10)
 by KL1PR06MB6257.apcprd06.prod.outlook.com (2603:1096:820:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 02:57:42 +0000
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b]) by TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b%4]) with mapi id 15.20.8114.011; Fri, 1 Nov 2024
 02:57:41 +0000
From: Vince Chang <vince_chang@aspeedtech.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Jamin Lin
	<jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>, Khem Raj
	<raj.khem@gmail.com>
Subject: RE: [OE-core] [PATCH v2 0/2] wic support different sector size
Thread-Topic: [OE-core] [PATCH v2 0/2] wic support different sector size
Thread-Index: AQHbKsvcoIRhmSl0kE+pCMCxVX5HWLKgHE0sgAAMCgCAAG2SAIABBg1ggAAWNFA=
Date: Fri, 1 Nov 2024 02:57:41 +0000
Message-ID: 
 <TY0PR06MB57070328EF6E490CA8B8C0A8E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
 <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com>
 <TY0PR06MB5707BE94581CC7F425214A2EE2552@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <CAMKF1srdKcP7HMPkQF+iCqOkCfpGv6oB0M8R7=qbO3C216xgmw@mail.gmail.com>
 <CANNYZj8v9LUJFDXqBms6Yg7F0t=xQZAcCg417x00zJxqeYqtog@mail.gmail.com>
 <TY0PR06MB570732A6C54A787FB10C50B6E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
In-Reply-To: 
 <TY0PR06MB570732A6C54A787FB10C50B6E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5707:EE_|KL1PR06MB6257:EE_
x-ms-office365-filtering-correlation-id: b9906b38-dcf0-48a7-1d4c-08dcfa20f3e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TktOcW1Vbk9RRkZiQ0dyNEVUa05Gb1IvR3J5dzY1bU9GS3NQODhUZkljeC91?=
 =?utf-8?B?MUJxYjNHRkE2V0RoUC91YjdpRXhkY0s1QlhDK0NsY0NiaTlaQzhQUFc0YXF4?=
 =?utf-8?B?MmJFU1cza3ZYMFdKeEc0TDZuMUpWbktUamVDUmxuNkhra0loK1hIWk84OG83?=
 =?utf-8?B?RFhKaCtlNGcyQmRRdVFWWmlLOS9BaytaVXdVTURTQmZLbnhkMnFYSGdESkxP?=
 =?utf-8?B?bE1keUh2V0RTNm1wRXF5WkFiaDFocEFtU3A1MFZxTU5naUVUSll2VmpQU0ZL?=
 =?utf-8?B?ZGlONTFhL0MxTEVJakJ6dXJmWGQ5SStuL1NsODZCeUNuY3ZzNzVjZ0RUOTly?=
 =?utf-8?B?dEQycWNHb09pczY0cU5DU09VNUF2QkVST01aRHlCYzFVYUpRVllBTS9YSHlY?=
 =?utf-8?B?cXA3cE9qcWpIUDJjaUk2UVZoYXR0VHcyV3h0VE9uaDduTkhocTZkLzFaTmNB?=
 =?utf-8?B?Yk9RcnBQTDIzT0VPY0VLZ0dkazlxZGN5akg1NEF3dXFOdS9xK0VvUS9zcmtu?=
 =?utf-8?B?dGFvUy8xemliRnBCbURDejNQaE9pVlFOZDBWWUJSOUpqL21mSHY4QlZHSnlr?=
 =?utf-8?B?YW9vN0Fidy9kWExZY3l2Z0ZGcTBBQ1VHSHZlOS9pNkhFbHVPb3JBZWl3N1Qw?=
 =?utf-8?B?b0lwN3RZb0hUMUNQNklLVGl2dGxmUGZNb2syOGpVdGJGUHFlQ1JLMndzM21I?=
 =?utf-8?B?Sm16Y2VkZ3hVSlJ6V0RVR2llU0wxSzZzRzRGK0MwRlorZ1lybWo0TmxxRDJK?=
 =?utf-8?B?YU0xRTB1RU9TbytxZTZDNzEvcnNJYlpPankvMjdwTnZyZUt2RU1sZ2FqQWNk?=
 =?utf-8?B?NmdJSnZQNjNZMnFZeVZPZUhhOW1sOWRnVm5jYVg1a29pMUg2djRMK1YrUXFG?=
 =?utf-8?B?SVZkeFJkVTNhVy9DOXBOU0hvWWdNQ3A4WGpUcnMyVXNORWVPRyt5M1BjU3c3?=
 =?utf-8?B?S0w5NzJaMXlSUkRsbnNyenR2dGw3emVnUFRlbDVsblVHM3RXK2JmblJDdG02?=
 =?utf-8?B?N28zS1EzTTNlMTMvK05mOVhGTit1QW5ZQmh5dUcvWUYxNU52WDZaMk92UzZi?=
 =?utf-8?B?UkVaeDd5ZFdxRmdSNU9pcFBTT05HZyticzhxQVFvYVFFeFY2aG55bWdlZnh3?=
 =?utf-8?B?TzBSTk52YzFJemlQNlhTNWxSNC81dTlZMTVnalA1eVd6K1pQdERNanA3Tk1y?=
 =?utf-8?B?dEhJZ1M5T0hHMjdxbVpSR0xWdW04dXN3a040VWU1cjQrY2NRNEVNYXFwamo2?=
 =?utf-8?B?Z3hwb3BWSFNqRlZ6V3JReTVuMncvTDZ2MWJDUFhhUXBER0FMWUxrWGdLT0Vu?=
 =?utf-8?B?K0ZZQnJjQjB2d2RKSS9kdElMY3FIbEk1b3I4bFRQNzBpSEQyOTl1QlZDRTk5?=
 =?utf-8?B?RjJiS3ljTWJPeUVFSDNxRmpKc0pYUUpJaVY0elFQbEg5Wk1Lc2lodngxZjFF?=
 =?utf-8?B?SmhkY2pzRjJkNWRaR20zMmUxUUxlclM1ay9YbE56QXVjRXl6V3hEV2U0UW1G?=
 =?utf-8?B?YzNEbThoWFYvQ1pGcU4rVjI1UXRoR05reG9xK1dTenc5YmE1TUZLaFNzWnIz?=
 =?utf-8?B?SnlCSTQzb1dlbGNSanFYaWJlWC9BZGt0NjVGMi8zcW5Cc2p0amwyckJkSmJn?=
 =?utf-8?B?Z0NiWG80ejFWMWs3NE1WYmtML3lPRHVucWpDNDlFMGRoSG52VHdZQUNsSjFn?=
 =?utf-8?B?d0paVUZyL2IzRUlhOHVyNVF5VEhwS0lBMktOMmVFbEVxZHhvRFZXM1dxTWZM?=
 =?utf-8?B?L09IaGJOR1M0V0Vidk9KZ1F0dTZob21aK29RZkt5SEtuSGd3RkMyK0hXWWhw?=
 =?utf-8?Q?2EYOU9Gikgsi9f6mIvLTIFiyE2AOyH1XXssKE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5707.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Rm13ODlGQTVIZUF0cmxXUFQwaE5teks2aFd0TkdNbDJ1c3d5K0FrckFpVTdK?=
 =?utf-8?B?emdaOFBQWkZtLzZjcFprS2YvelI3L25lVU1PMjU1b2NWcGRybGY5QnlBYWxq?=
 =?utf-8?B?bGRIamVzUmd1MkplUXJsQzB4Y3JINFRmYkR4VGlycjI0czBuclQySnRnd1FT?=
 =?utf-8?B?dzdVNzI5V0pTUjZSaWkxNzNxOHlXM3lGOG5Ib0liWnpoQzdsN25KOFEzY3VK?=
 =?utf-8?B?QkJwYXd3ZGpDWkhpMHhEcmd3VVNpUWpTYzNweDJmK1JjQ0k1bTZDenMvemFm?=
 =?utf-8?B?TzAzVDVSSldFQ3dGS3YwRzVhNEVDSFdZMnNhTGxaRDgvWFovWGNTRzVaUGRu?=
 =?utf-8?B?VzU0bDZlZmxsUnJqZlhVeGY3SVcveEZRQ3JFNDVGbVdVVGh2UTZXV3BsT1lm?=
 =?utf-8?B?UEdhM3NCNC9rM01SOGVRcDZjOFhkWStQakFrQjkxY3dSUVgxRnp3NEtQM3Mw?=
 =?utf-8?B?bVFFT2tPby94eHBQeDBlQzQrMFBDYWFDNmw3SC9vbi9ObDJjeE9uaVR4QUVF?=
 =?utf-8?B?M1Uyek5HRnk1SjBmcXRBTzU0NUQrZ0JHSE53b1E0bmJucldSZ1hVaWNPWlp1?=
 =?utf-8?B?eDJYSDlWb0dRdmI5dndYUHpwRGcxb2VmZ2k1aEE1M0NiZnUwdnZYNnpDb2VX?=
 =?utf-8?B?WnNjZHNVY01MRUYxL1drL3BwdlpyZkdUeWRNQ3BjU1kxdDgvZGV5cEFVb2Fi?=
 =?utf-8?B?akdrTXNSV3p4WG9nRFpmS3JpSkdOL0E5Q3dUOHIxRGhhMTdOb3krVDg0NCtJ?=
 =?utf-8?B?NmlqbVhKKzdjYTA4NnNUc0ZkVWJVTGw5bEc2ekxYaUJjZFJVcXlhRFFLZ0RX?=
 =?utf-8?B?VWRJT1dqZTJLQlUvRGZ1cVE5WThKaUdVbUYwUVNEZ083a3hMa3B2ekZuMEtY?=
 =?utf-8?B?cWtNSEZmRWFKalJOVXhGU2JGa1NIeHM4SkQzU0Vrak93TU9GaDhBVExhNEli?=
 =?utf-8?B?Nnl2M2IzL2VXVXFncS9JcmVWdkp2eHRIM1hXZWJTZUFHYVY0VnNrTnZJZFNy?=
 =?utf-8?B?RWd3bkVYbzdBWVdOSWpLVWlXWUNDY3A4c1gvNC9zYVVDNnhua0dKUGdYR1I4?=
 =?utf-8?B?aVhJdGFrcFBiTDE5dkc1Ym9XRDZJMWw2ajVQalZncFNtWFpHOFZvenZZdmNq?=
 =?utf-8?B?bkk5b2EwOURLUVNjM2QzMERpcXpvZDVSUENvWU1pRFZCSW02dnllOU5vYVA4?=
 =?utf-8?B?Q0M3RFdrdEVrYkxYLzdFN2JLRW1hRGMzOERXMldxL09WMGlPK3ZDZ0FVbnho?=
 =?utf-8?B?bTJ1U2hvRkR5cE5tWUwvWS92TURVRktWZFFGcnFJcXBOa01WelN5aW9jUjdz?=
 =?utf-8?B?SnI2MlAzVmdrVHBndkZiWEJHeXZXTTU1WWtRR2xFbUZCVTgzQUU4L1lnR1BY?=
 =?utf-8?B?czBxdU1SaFViTnpCZEx3N2FsTGJEaGpCRVRpYnFjMXIvOUlYVitiUEVlaURS?=
 =?utf-8?B?N1pMYkxXK2gzNm5LV1g5S1FMTU43aU81MnZqTFJYOTJxTUc2SDk4TUFUWXZP?=
 =?utf-8?B?QWdoWWNNUW5odUhlQlV3Mmhub0c4TDhXUjBUdGZSS2x1Nk9Fc2Nnc2FITlYz?=
 =?utf-8?B?Z09jMnNkVnJyQmRKcGdoUkVBM09STXd2U1FxbG1kVmNNMXV4cmhkUnVodUZ6?=
 =?utf-8?B?cHhhaXpzOUs5S3lEelROa2FYMkZ0V01rdS9jTFBpT0d4SGVMdHQwYTYrUWhQ?=
 =?utf-8?B?aEJGTDQ1eVNic01jV3pLTHdwYWpFWFoxSTRZdnVkRFhBdmh0R3RXVFFDR2Nj?=
 =?utf-8?B?U0FLMUU5Rnk3bkZqZUxNR2s4b2UvZU5OZFZwRnhoN05Jd1FYZnZqdGFwWW5I?=
 =?utf-8?B?NVZHRVNJWW83WWZWbHF5UUl4SG94aVBRR3B1dFFjZXN5V0x0aWlwYmNUT2Vl?=
 =?utf-8?B?WUcwRno3cUROUGdsdlFuM3JyR00yS3VaMUVMN1YvdkZxb3lHclhRNTE3NitN?=
 =?utf-8?B?QWhHdXlIUnFtZE1ZeTBxWS8raXpyVWpTRVcvTXlTelUwQklsZHF1aG9YUEdY?=
 =?utf-8?B?bUxRYXdnSWY5RVUzekhWenpVOU16Z00wY0hQbzh4K3laRkFManNockI4N0lm?=
 =?utf-8?B?amZmL0xDOVU1aHRzUHhCVGVBd0JXeFpkWUEwZmJ1OHAza3JNTlZFUUw3TlRq?=
 =?utf-8?B?MUU0NXZBd3M4Z01od0s0Tlh3ODdvOFdtYjZUNFRzS2FlSnpUbG0vSW1yZDg5?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5707.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9906b38-dcf0-48a7-1d4c-08dcfa20f3e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 02:57:41.7332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iP5GTyk18EaOk96dSHz4t73mVTbunSSzDuxRpqtP7fF0GYxhgW7C/7S9thj7cbGNQ+CGS3vckpPUPFZ8GsxPhoL+n/aUqle9TGBX6V1kgfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6257
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 02:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206599

SGkgQWxleCwNCg0KPiBPbiBUaHUsIDMxIE9jdCAyMDI0IGF0IDU6MTggUE0sIEFsZXhhbmRlciBL
YW5hdmluIHdyb3RlOg0KPiANCj4gPiBBbHNvIGlmIHlvdSBjYW4gKGluIGEgc2VwYXJhdGUgY29t
bWl0KSBkcm9wIGFsbCB1c2FnZSBvZiB0aGlzDQo+ID4gIjI+L2Rldi9udWxsIiBwYXR0ZXJuIGlu
IHdpYyB0ZXN0cyB0aGF0IG9ubHkgaGFybXMgZmFpbCBkaWFnbm9zdGljcywNCj4gPiB0aGF0IHdv
dWxkIGJlIGhlbHBmdWwuDQo+IA0KPiBJIHdpbGwgc2VuZCBhIHNlcGFyYXRlIGNvbW1pdCB0byBy
ZW1vdmUgIjI+L2Rldi9udWxsIiBpbiB0aGUgd2ljIHRlc3QgY2FzZXMuDQo+IA0KDQpUaGUgd2lj
IHRlc3QgY2FzZXMgdXNlIG91dC5zcGxpdGxpbmVzIHRvIGdldCB0aGUgY29tbWFuZCByZXN1bHQu
IElmIHdlIHJlbW92ZSAiMj4vZGV2L251bGwiLCBpdCBtYXkgY2FwdHVyZSBvdGhlciB3YXJuaW5n
IG1lc3NhZ2VzLCBtYWtpbmcgaXQgdW5hYmxlIHRvIGdldCB0aGUgY3VycmVudCByZXN1bHQuDQpU
byBhdm9pZCBuZWVkaW5nIGFkZGl0aW9uYWwgY29kZSB0byB1c2Ugc3BsaXR0ZWQuaW5kZXgoIkJZ
VDsiKSBhbmQgY29uc2lkZXJpbmcgdGhhdCDigJgyPi9kZXYvbnVsbOKAmSBpcyBhbHNvIHVzZWQg
aW4g4oCYZGVidWdmc+KAmSwgSSB3b3VsZCBzdWdnZXN0IG5vdCByZW1vdmluZyAiMj4vZGV2L251
bGwiLiBJZiB0aGUgc2FtZSBpc3N1ZSBhcmlzZXMgYWdhaW4sIHdlIGNhbiBtYW51YWxseSByZW1v
dmUgaXQgdG8gc2VlIHdoZXJlIHRoZSBlcnJvciBpcy4gV2hhdCBkbyB5b3UgdGhpbms/DQoNClRo
YW5rcywNClZpbmNlDQo=

