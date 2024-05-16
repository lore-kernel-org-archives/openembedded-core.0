Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578E0C25B79
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 19:54:00 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web10.23676.1715889232715986146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 12:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rioaM1I7;
 spf=pass (domain: siemens.com, ip: 40.107.8.72, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iepQ5gKFrnkR/s4+3OJmYhlQlIqn0mCacUvoJAWGLUBE09iDJA717uhhhSAyDyCy7zEc3qDVCb+FyOZys+ohR/7+GmRnd2VyOhJlqgt/1M7Oh6MoDu5ayOv+8KtaNS+dcnIVhgBbuHKf9dLLgXYWQ51PKsu2fBZdvRaW9K48GrsWMrw9Jd95GYmW3b5Jyz1B1fcb/TZqTLCPGjipz6HREebjUcRAbb6HPutkyimZLsq4I9fnkaeIYEsWAcPwlDzNZ8msZmDr1RYum6rFnvgXb70Jy+szsHcQcBe7pCsm88MSRF/fiMhnNsOIJF8XEy5mD6Q9jy6+xklonwNWLQgYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxV98ml43dFU5SbQhU0vvoUxK65VPfUrOeQBjWyloIU=;
 b=Pn6auumislk5BznBcBxsamYGbU/LQEnvz7onYWPt4Z6ZQDi894hLvHioKqhp8TVg4S8wmSYqqEkCEOW45m7SP//x61J44xeu1xPpTmMUVEpRqPSV7FrCeoVnsVa7ET1tL2wms+uOT7H85Qy99WJSb7sR7qf9ABgX33/3dxWvuQmjwu0WKCsimSgvTjo1tRhwHIAgqnKjU5qshFwXszB8efyozS4Nm/hZ2TilxQHVXwDK8//6XYNa0dIt9yWwUgDkYxVJj0KLnURPv/sAvIM4XlgOSQa8mm4XKBrsmuj17ACiYsMmnFo1+JoFtnkVy2GLM1NxuSBVpJRaC+oOhdPJrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxV98ml43dFU5SbQhU0vvoUxK65VPfUrOeQBjWyloIU=;
 b=rioaM1I7D8aD3QydDEp3tfYheEVLpPP5/QC3X8HDXTzZeWaR+tY1sBuhmmEayHz8gCgk7nC+NCfrib2u915c2LeCh+1w2t7of3DikmBr4PXRfTDyg/D/DtuI/bzrm4hilgOHOC/Z/TMf/qumuvvh+lzBhvjlBKF0UmvCj3tET6LTNnP2LSeSGYK0Wl4S0VkwwuwRN46SjXfQ1eWkPtzGGbkljG0KdPNTzMzNM31TybFBjTSD8nc3oMTucod2FG2tbVwJKZSXfbaAYtun4cQorLEywnX6KmhVRMBOyk48R4MIjTAgoLV9XJO3Ouk+Nq4RHSPsfglCc80OO25sV2mquQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB7361.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 19:53:49 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7587.026; Thu, 16 May 2024
 19:53:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2] glibc: correct license
Thread-Topic: [OE-core][PATCH v2] glibc: correct license
Thread-Index: AQHan4mMj3H3EUP+AEC8x+j/8nOGu7GZZPuAgADg9SA=
Date: Thu, 16 May 2024 19:53:47 +0000
Message-ID: 
 <AS1PR10MB5697440FA2BA75EB0597E6CAFDED2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240506074548.16296-1-peter.marko@siemens.com>
 <CA+chaQdY=sq6egqkXewCq0BQutX4Z7r+coWG+3Vz0SJihJFWjg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQdY=sq6egqkXewCq0BQutX4Z7r+coWG+3Vz0SJihJFWjg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=30662ff6-ca3b-4332-8ff9-955a04600e75;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-16T18:54:40Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB7361:EE_
x-ms-office365-filtering-correlation-id: 1e2089f8-a87d-455c-0479-08dc75e1e675
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?S2RBMCt4akJKQzdYV2Vodm00UXhkUk14Y2lpdllrUGkzSXU4ZGkxUWIvNldl?=
 =?utf-8?B?Y2tCYWpza1NuTVcwZzI5SFlVeCt6L1hoblNDb01WVGlJTit0MTlEZU1oZXVM?=
 =?utf-8?B?VUhNK2c5OTBmS3FZOUNreUUzenNJNzlsb1FLY1g4Zm9EODhYT3M4VDVhQmw1?=
 =?utf-8?B?OEhBb0JhdjExNGhodzZLd3dCNkV3MDZOSDd1ZGRna09HdmR3UjR4K3hEczJB?=
 =?utf-8?B?YlpVTnlzUldGTHpjUFZyVHRjTnJ3YW9IeVRJUlpQbngydW9leFhWTzBmbTha?=
 =?utf-8?B?OXIwU1J3azhoRnNoNGNNZFFCWTdpUzNQY3lHVjA0UzlDYjIzaFlrVXVlaGc3?=
 =?utf-8?B?UDJDOFlFK25lVTdxMkJNYzhLcnBmYjBpaWpncDlIRE5rV0tzUUpXQVlXQXdm?=
 =?utf-8?B?Z0k2K2N5RTZVL05uR21acDlwN2cvVlFYVHg3bnlrTnU0VjNKdnVST1M0eXI4?=
 =?utf-8?B?aUdETUVaRlJnYzA4dXIwaHQxeWNva1Z4cWhJemYxWTdWTzZocjlsWjkwRjhR?=
 =?utf-8?B?RndBMzZHSSsrR1VSVmZLUWxlZ3dkYjU5WGkyYnJ1dzlzd3orOUxCQk5waVQy?=
 =?utf-8?B?N094K1h4bGFNdjJPWVFaSUUwUFlmUXhkK1ZpNjE1c2xEbFFSWEx2YUVVVE9L?=
 =?utf-8?B?NnN0NmpvWStuaXl2ZElJYUEvdWZqbkNLZUc4TS9rTEk4VzRhbFBNNjd5c0dK?=
 =?utf-8?B?dUlPdThSVGpNWUhKMmZoSXREZXpZTHhVMldlazYyNXFuM0pPcG1hSHB3L2F3?=
 =?utf-8?B?cVpSMUgwdUNBOWNrNXNpZFloQXVpakdXaEo0eVV2WGlBRWoydTJBekRGNDZ4?=
 =?utf-8?B?MG9pVnVkV3ZIWURhYjFLSU9QdVhYd0hDWmFzSEFqOFQweC9CcThrd1BRb0tv?=
 =?utf-8?B?RFVWQWdjcGxvaUdSblBsQllPNnU2ZHRYNnE2UGlyT3h5WDBXcmRPcG41R05y?=
 =?utf-8?B?SHE2bFQ2Zzg2NEJVU0FuUEV0cnJrK005Ny9KRkVxT3B1eGJycDdkZEdyRFBw?=
 =?utf-8?B?M1EwMXpDRlhsaU5DNVI4NVgya2xPZysxNVBGaklia0V0Ykp0VnFkZTRCam1t?=
 =?utf-8?B?NzI1R1F0VjcvQlMyeUxOMDdURjFhTElIdGprcWlqTE5JSjJhRit4WXJNdTFE?=
 =?utf-8?B?Z2JTWHErV3ZMT2JZQjRPN1YxUlFNVERLNGJ5bTBIblMvblY4cFJRaVArZ3ha?=
 =?utf-8?B?bUJYUi9OWU5mcldnVy9zVkZMbGRVbmpjU0lvc2Jwdnk2TFdPVkcwZ1RqUitj?=
 =?utf-8?B?VTVQL1g1ZzlFam1SZ0dzc1pRNjFIMkR3QU9OSjNrMnhHMllLUi81aHRzUjFx?=
 =?utf-8?B?SmpsWjgwa2IrdmtvTW1pb2tJTXZwN3M1MmVuY3F6bEU2bkh4WUE5SlFjYWhK?=
 =?utf-8?B?RS9uZ0pDOXB4enlQZUpwazVBYW0vUzd5UXRCTDlKOW5LajlGMitzT05hUjY4?=
 =?utf-8?B?cGFoa213SDI1d2VqaFpVa09iNVI1bk1adHZabXhGSFB2aHJMdzcvdTQrd0Rm?=
 =?utf-8?B?NGMyeCs4aXVheWtkQ0JFWkdMVGF6Rlp5NkYzR3FGdTdWcWNBTjRnVkZjL2Jv?=
 =?utf-8?B?ZHVNR2lNYUtSemw1SFhTR0lZWjk5YW5MeUNNZDZPY29EQ2d3M1pKY0Ywa3E5?=
 =?utf-8?B?NEVUcUdhS29IbEYzYVZmNHB0blQ0QXlzUGJveHlPWnhDZmI0Nm81RlArdUxy?=
 =?utf-8?B?ZFhZNHgrNkR4RjVDWmw5T29RaGUzL1liR2ZTRzYrK0dyQXd0MkJ3c3lnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T1dGYTgzWG1SRkNOMlJKUnRmYlRPOFlwL09UbjVQU1hRblR1OW54ZFZNVElk?=
 =?utf-8?B?SjVGVENuc3RQdno0WUkzdElzc21mY01KVnF4SDJhNGJnNkcrdTJXWWJqQUhP?=
 =?utf-8?B?TmtNc0F3UWpSQnVseDBBS1Z3M1ZnK2daY1JaSEkwUXlNL0RORklBVXJ6VWd3?=
 =?utf-8?B?TjZINHFGcEs5OEZFRGt0MmZ5TDdrZG1FUjJvY3VpTC9CV0FSVEY2QjV1djA5?=
 =?utf-8?B?RUtrOGNibDl3SGJ5Y0JUaUF1M1JjZDRjcFlCS3pBSzZFdzVxd29aZWNwOHVT?=
 =?utf-8?B?MGR5MnBuNmd0NlBpZUVIeGFESnhLa3UyLzczWnhCMndvOFQ1dzBsQnpjcWR3?=
 =?utf-8?B?Z1UrTkJRMEpGWjVUYUhUK2JMSG1OZVh6N1drT3dzaXdIQjlTaElPZEdLRytU?=
 =?utf-8?B?UFhUYy9LR1VORlc3eDQ4NWpqVU9EcFBPbHZOejZBZkl4d3FVTlN1SnpQaElu?=
 =?utf-8?B?clFwZFhxRW40VjFCckw1eUUzK1JIMitndDB3Q0tDZXBBU2ZTa0FUUGFFbStW?=
 =?utf-8?B?RTBVNGlWbWF2YWF3RTFBWmh5ZUl6bGJCOFJzQmE1R0xkYTFUNE9KcDNFREY2?=
 =?utf-8?B?MHlMRCtmaGM4Wnk5WTIzWFlrWnpFdTBRWnVJVll0dy95bS94MCt5elBXa1E1?=
 =?utf-8?B?NG5weURtSHJ2aTlVa0tNUUFsNFl3SDNHcGFNUndxMkdjS0xsTkZ3cElNdUlJ?=
 =?utf-8?B?MTR1Y2syM2N5WVZHN00wNWFkZHhzY2RuQ1BpWmJHY2JQRmdKKzAzWjRHNS9q?=
 =?utf-8?B?WmkxZDFic3V3ZXdPYWFqMFdOZFZpUi9oYmNNWEp2ZnJIYllOa3RaSS83NjRQ?=
 =?utf-8?B?czJ3eGdjNmxteFkvenovUlRRYXV0cEo4cGp5b0JjekFNWis4OXlTZU5OR0U2?=
 =?utf-8?B?RFc1a3lJS0pVa0xlVHNXRGNjVmFvbnlad2llMWozMVFXOHlIWEM1akpoM3FP?=
 =?utf-8?B?NVRtMzZVQUdZdW5sZjdYdWVjNDZLd2Q5RU1oTElINitJOFBXZktjYkY1OUxR?=
 =?utf-8?B?WGhnczErcEluTHhWTlFleGZ5YUdtbUVuMW52OUNMdGh2d0tmRHJVNWpYWndz?=
 =?utf-8?B?YkE3bkpDNmk3SkpxbEV5NTBFY0dJOUJGT3JDTDBwdHd6ci9tSHFCOTFMbksy?=
 =?utf-8?B?RlA2ZVJUYzU4U2FTc1NUdXcwVEVrdzhmRWg4WENmejI0VndCUTJOU0I5MnBa?=
 =?utf-8?B?MlRjNW5DQThESjRUR0FpRXdSditIamZyL2pNT0JYOTd1RjMzbVJsTndDcWJW?=
 =?utf-8?B?QmFicnNOL3VyR0p6YklDaE1EdmQ0YTg4UmdJSzhhRldzanBWL1VOMnVrdGZw?=
 =?utf-8?B?VnAzVC81a3pvb1MyTlM0TXp3cmJNeXpJbHdzWG9GOHlHQmN1UXZoNHJheE9p?=
 =?utf-8?B?TDdOS282TjN3TnB6c2ZFSGYrRW43STFQZUlEYXc5Nm5lcjdGL3RnaDJOWEc3?=
 =?utf-8?B?S2ZKZzVGYUJldjRvWUtiYzhOaXgvM2w1WTArNnNlMy9nR21PY3VtbDdhbTN5?=
 =?utf-8?B?NWd3T2QyOVhkWjdHMUlVUGFLTXRpaHRqL1d5M05sZDZsdnBKeDlUZUF2bzA4?=
 =?utf-8?B?M1k2clAwd0xBalFNbEtPZ0pYaGlLd280b2NXOU8rYzJWV21XUU9EaUJ1VFlW?=
 =?utf-8?B?dUtWYWtEbGR3RWJLRU9URVB5UEtJZGxDdEFocTJJajkyTDc2RFRnbk9jMUhq?=
 =?utf-8?B?WnM3MElLZG5ISUdoM0FXSlZpdzUrK3VxdVhGRW5qREIzRVV0M3puWFpkdUI4?=
 =?utf-8?B?bGx6Z0cvUlg5UFNzM25aVGxUMmVhRncwbFBzWWsxNnRSdTNCTmdUdEVQd3lL?=
 =?utf-8?B?SXhZZ2JhcnRydTdMS2tRZEk1SndybUVvS3l6ZXBmRVFMSWJQV2ZITGJXUmhG?=
 =?utf-8?B?bmpYemdIZFhQZnlTWlJuVWl4WTJnZytPYUZLNmVaQ1o5QTh1OHFWdXFPQVFE?=
 =?utf-8?B?U01LRzFzTlhHa1JCY3FrT2RJdTU1ZjVSc3lZYjFBeDFXcUo3NUR2MEhON3Fa?=
 =?utf-8?B?N2JkcGROQllZUzhDR2dhbUN2T0tRS1ZJcWNNVzJuV1M2YVRzT0FFcTEwQytX?=
 =?utf-8?B?aHZWbkdMaGZqUmo4VUh0NlZqR2VUcHQ0THVtaElBVFV3TFVzQ2FoUnkyMkc1?=
 =?utf-8?Q?4dhE5OPik4+j4BhdWmrX/LHAP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2089f8-a87d-455c-0479-08dc75e1e675
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 19:53:47.4226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JXYlKqxJlGWQGukKGR2ZuwiNeriWUJp3H8a0kGTXZt/S8hg26cs/j/XNmoIDWgUC6nxPKITufW/2IRMb3hgUqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7361
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 19:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199496

SGkgTWFydGluLA0KDQpsaWNlbnNlIGhhbmRsaW5nIGlzIGEgdmVyeSBjb21wbGljYXRlZCB0b3Bp
YywgZXNwZWNpYWxseSBmb3IgaGlzdG9yaWNhbCBwcm9qZWN0cyBsaWtlIGdsaWJjIHdpdGggdG9u
IG9mIGZpbGVzIHdpdGggZGl2ZXJzZSBvcmlnaW4uDQpMaWNlbnNlIHNjYW5uaW5nIHByb2dyYW1z
IHdpbGwgZmluZCAxNSsgZGlmZmVyZW50IGxpY2Vuc2VzIGhlcmUgYW5kIHNvbWUgb2YgdGhlbSBt
YXkgbm90IGJlIGV2ZW4gYXZhaWxhYmxlIGluIHlvY3RvIGxpY2Vuc2UgbGlzdC4NCkkgc3VibWl0
dGVkIHRoaXMgcGFydGljdWxhciBjb21taXQgYmVjYXVzZSBJIHdhcyByZXNwb25zaWJsZSBmb3Ig
YW4gdXBkYXRlIHdpdGggY29tbWl0IHdoaWNoIHdhcyBhc2tpbmcgZm9yIGl0Lg0KDQpUaGUgZGlz
Y3Vzc2lvbiB5b3UgbGlua2VkIGFib3V0IGFkZGluZyBTUERYIGlkZW50aWZpZXJzIGlzIHNvbWV0
aGluZyB3aGljaCB3b3VsZCByZWFsbHkgaGVscC4NCkl0IHdvdWxkIGVuYWJsZSBsaWNlbnNlIGRp
c2NvdmVyeSB3aXRob3V0IG5lZWQgb2YgYmlnIGRhdGEgc29mdHdhcmUgYW5kIGFsbG93IHRvIGFj
Y3VyYXRlbHkgc2V0IHRoZSBMSUNFTlNFIGZpZWxkIGFsc28gYnkgU1cgZGV2ZWxvcGVycy4NCg0K
UGV0ZXINCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hcnRpbiBKYW5zYSA8
bWFydGluLmphbnNhQGdtYWlsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgTWF5IDE2LCAyMDI0IDc6
MzANClRvOiBNYXJrbywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVt
ZW5zLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpT
dWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIHYyXSBnbGliYzogY29ycmVjdCBsaWNlbnNlDQoN
Cj4gSGkgUGV0ZXIsDQo+DQo+IHdoYXQgYWJvdXQgQlNELTQtQ2xhdXNlLVVDLCBCU0QtMy1DbGF1
c2UsIElTQyBsaWNlbnNlcyBpbmNsdWRlZCBpbiBnbGliYy4NCj4NCj4gSSd2ZSBzdWdnZXN0ZWQg
dG8gYWRkIHRoZW0gbG9uZyB0aW1lIGFnbyBpbjoNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdG9waWMvOTEyODU3NzEjbXNnMTY2MDA1DQo+IHdo
aWNoIHJlc3VsdGVkIGluOg0KPiBodHRwczovL3NvdXJjZXdhcmUub3JnL2J1Z3ppbGxhL3Nob3df
YnVnLmNnaT9pZD0yODAwNw0KPiBodHRwczovL3NvdXJjZXdhcmUub3JnL3BpcGVybWFpbC9saWJj
LWFscGhhLzIwMjItTWF5LzEzOTE2Ny5odG1sDQo+IGJ1dCB0aGUgZGlzY3Vzc2lvbiB1cHN0cmVh
bSBzdG9wcGVkIHNob3J0bHkgYWZ0ZXIgYW5kIHRoZSBvZS1jb3JlIGNoYW5nZSB3YXMgbmV2ZXIg
bWVyZ2VkIGJlY2F1c2Ugb2YgdGhhdC4gTWF5YmUgaXQncyB0aW1lIHRvIHJlLWNoZWNrIGFuZCBw
aW5nIHVwc3RyZWFtIGFnYWluIGFmdGVyIDIgeWVhcnMuDQo+DQo+IENoZWVycywNCj4NCj4gT24g
TW9uLCBNYXkgNiwgMjAyNCBhdCA5OjQ24oCvQU0gUGV0ZXIgTWFya28gdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPHBldGVyLm1hcmtvPXNpZW1lbnMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiAuLi4NCg==

