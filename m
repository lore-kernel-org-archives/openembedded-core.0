Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B236C3ABCB
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 06:51:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web11.96461.1747205475810105232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 23:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DK+OkYLX;
 spf=pass (domain: siemens.com, ip: 40.107.21.77, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxaBIp31sQ6T6vJxjI3XKnyG5d3upkb2YeFN10i/pCf/5OA43Lt8rJ3PvdqEzS5sya3TbaTgnWNDZ4u7iFHAzVZ00IY6ojBkpmwoEAy0ELupoIBroUD4MPm4BYmm0Nf+lHKcLMlVaD2sxAJnRoHaouTPKe10e8JoDm6LJ9IccWIuHhfcAP2TQUiSgxRVKW60HRCRN7EscjfjkrmtUwBjhGYpliG5SAMF7XTmTEN4z6HOoFR+dX9onrW+P9dn4E7xD5+lrzbntpeO+imLuD3W7BqId+yFS+3I151MAzyt/wP+luWA2NgtaRjUuVvC+ZIU2yBcc5mvVg9vA4C5Cjj/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFZzG2jHcwUDHHhc4ma+B2Bj5Txun7nQylKupB+CDVE=;
 b=rr/zUfv9EpKmB6o5YjGCCT2OVSxAnIU1qJfMsLTBJG/mRLP08DhgLEGikb+NPDiLUhGtRdOi96YBReQSNuo8MCfX/562lbFpaXWp9Dmk3OpVYpiib1bJOjQRu6kmRJkbLOaCbhv8aNMWa0PWPtF5Y65pK6mZRDbCXvsTVTrR4gOpUCLwQaQ9qMTMBn4Y80TNBALYV7VjqXFHoJjtHwqhP+Q5AKOPAJsQ1wWCEsbcipSHXCc9xC+C6XtoJbB62c0OFgqsdvmBeKA2WY++f6ENhEJvXVs6HTYCSK3/IcLjgmQaZE10NV/lB32pubNa+uGfwxdNY0aKfQLCfyiMyWprHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFZzG2jHcwUDHHhc4ma+B2Bj5Txun7nQylKupB+CDVE=;
 b=DK+OkYLX+rfFnJGYzt1Xgg+TBlcJgT5rQP3WEnHdaw+8pUSeMB6U3SMrk+Md2KBWAKhi00whQi12WbPjD5O6f/wRw3YaL+6vMR+0mNno8PBW5hT4aHNQ5ltcAZ06FF1q31tlXg1/Dv6CHIWMw/XwuGUJh9L2QjbYb4DGfYfYhenA+9O8E9AUeXaxnyhXtFOj1BzK4bvKc811cHr+ipp3mFTB2WriRxAv/VEV1yrBOacLgrNgKVe269t9sBRePCXUOUZ+6WcirweueboEky5KTcPmXyI/LOaKhu9KULTt8rZfFeBIaUvnEBWFuMmGbPPass8aVrs/LawGaoBfvzgDXg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB6767.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:32c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 06:51:11 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 06:51:11 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "steve@sakoman.com"
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [yocto-security] OE-core CVE metrics for walnascar on Sun 11 May
 2025 01:49:49 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for walnascar on Sun 11 May
 2025 01:49:49 AM HST
Thread-Index: AQHbwms4yI6Y9ZGS1EqNnHRedONdv7PNwtwAgAABmgCAA+174IAAAOSAgAAAlVA=
Date: Wed, 14 May 2025 06:51:10 +0000
Message-ID: 
 <AS1PR10MB5697AF8F027BA971886C12DDFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250511115243.D83E9100407@builder.sakoman.com>
		 <AS1PR10MB5697B496C5947EC961F51DBFFD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <3a5a047bd48aae6576a4422f421616211b1a262d.camel@linuxfoundation.org>
	 <AS1PR10MB569724059D582CAF8A6A2A8CFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <08371b2e9910aae9eef58828773ed8c196ea3c0f.camel@linuxfoundation.org>
In-Reply-To: 
 <08371b2e9910aae9eef58828773ed8c196ea3c0f.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ec33ff47-908e-4f82-80e2-1bbd6a221914;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-14T06:47:57Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB6767:EE_
x-ms-office365-filtering-correlation-id: e09b9d6f-857d-4a1c-30bc-08dd92b3b639
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZitBYTcvSS9BcHp5Zjdta2MzZVNPZFNteFpuaTlFbzFqK2J6R2FyUHZsVkhw?=
 =?utf-8?B?NUVmWTRHVEpXL1Y3UmJLNyt2YjVMNWtUcjBSOW5aZ0s4TlJVcktySHFMSFQr?=
 =?utf-8?B?ZDdLOVpWMmw1Q2loWjVRZVNTTUUxNE1kSzMzbEllRnhXNUdBTTNLM0JzL3ZZ?=
 =?utf-8?B?YnFMVEwxQ1p4YWpPY1ZUR0FZZW8zU3A5dDIwbDFCSWFhaVdRaS9oU0hHVjhl?=
 =?utf-8?B?UWNiT3FyYlpYMm5tcytXK0tDSm5od3ZickhoQ0hzVmtDaGVRN1VtUFpWSE82?=
 =?utf-8?B?b1hxOHNjVW4zTlZYZ3BBU3F0enRMRDhhU0RjVThkcTVtSWFBTlluUXMwbjYy?=
 =?utf-8?B?andwTGdMNDBmVHk4Qm11KzBFUnJVYVhTYXkxRE90ZHNuTmRiZUtyYVdrbjRM?=
 =?utf-8?B?MkNJbldIYWxTaUw5d0FVakgyYmR1YXFsMTU3czFzZ0JXWFlzTXJwamxrNWtU?=
 =?utf-8?B?MDB5WE0xSjRHblBFS2RQZE5YTGpodi91b1ZCS1J0QW9tcW9MMXBmcEt0SDJj?=
 =?utf-8?B?SWpKQkhWYW9Jb2JGTWdJSmx4VDk3TGNKY2FMeWkyTnQ2bTA3MEFndDZzUXlu?=
 =?utf-8?B?QmRxMG5KZjJ5cFBqWjdwTitFS2Q2K1hEWHFDbFZBTk1CdFJvZDhmN1RGdTho?=
 =?utf-8?B?THRZZWx0TzJtYXlHcDYwN0pKYUR6bGRiay80VmErRXVpWm8rNmNIRWdVUWM5?=
 =?utf-8?B?TERsY2RZTW9QaWY0M1hnMytvZi9TLzgwWi9XN0JDV1VYTUY5bFZ3Q1U5NzM4?=
 =?utf-8?B?dUxkdzZURjlLVjdSclc5emRFbmMwWGlrSXc2U01mckl0VEJQMDd6WFBGTTZS?=
 =?utf-8?B?TmtVY0tJSzhLTHc2SUszV2dJYTV6bDM4SWpYeTJXa0dFdVAydk1yazgvQWtj?=
 =?utf-8?B?M0xFeXVHRTVQQ3VOR2xDUU5FbG9IbVBXK0ZwR3QxeE9NMkF3aGF4cE1GWE0y?=
 =?utf-8?B?MjVuVjdQOGlYWnlnTW1uZE9iT1lMTXlkanFpaXdXWEZ6ZmpTNWMxY25HU2FE?=
 =?utf-8?B?dm1uOG1ud0VTQjNoRmV0SkVwT3JnK1FLNEFhcy9JZWNsWnFpYkhIVUtZVXhM?=
 =?utf-8?B?QldUcG13WVFQaDYxU3RVUEU1NnVnU1Baa2M0cTNyVXRGY1BXRWl5NC9oR3Jl?=
 =?utf-8?B?dnFiaVRMMVVKN3AwMWoxZnhCMno4YTBkQTlSc1JqeTlMazRBRnBURURMS1N5?=
 =?utf-8?B?TEo2ZjZGNzgwcWVMMjk4djVkbStYdnprOVhUYVM3WVYzMmpNMDM2VTJvblFo?=
 =?utf-8?B?N1FHRHdDSEZsQ0haOWRBSithbjBiQTJyeWg1NkpqR0VyQVp3ZlR2VEludlNM?=
 =?utf-8?B?WkJmMlZ2c0RaU2VqbFQ3cWNTSlcvbjdoV3hjSDdIK1B5TFVuc2kvVmQ5b3Ex?=
 =?utf-8?B?Si9Ibzd2cG13Vy9CdTExWXdYZ3BVaU9od2VmS3c2Y085c3lyR2k4d0dyWU1Z?=
 =?utf-8?B?aUJXVlBGbzdNelRMdGFycmJpbWJyRXQvOUREand6TDQ5cDFmTU9oUjNjLzky?=
 =?utf-8?B?cU92TVdLL2lGbCszb3phZnQ2VmoxZHVWTCtVU2pxMktvZVYwSTl6VHBpU1FU?=
 =?utf-8?B?Z0puZWU3M1dEbklmU2xublZDZyswNm5qN0lrSko4RzNVdEx1UjFYMVBqS2dl?=
 =?utf-8?B?alA1SFFhZUFtd0Fady9PVm8ySlU4VDEwczg0VDZpRXJ0ZEJDZWdhR2t2NjI1?=
 =?utf-8?B?V3NuNjFLZEJlMSswcFhiVi9mejlUSnduS2JOTDY0TFY1WkdMalNQQXpUdVdW?=
 =?utf-8?B?bHpoMElSYTY4a3BncDg1SkV5QkxzVXZFelhFUlY0RjdydGhNQldXR2NFOTZR?=
 =?utf-8?B?MlhIbEhQVHE1Y2ovUkd1QkNPNVVIWjFRSWNFRGtLMUFHcU9ERTlEREVMQk5E?=
 =?utf-8?B?KzNIUFpabkt3MUhNQ1JPeWozcXdVZzY5d3JEbDRXUGlUU0NrWkdoZ1dFYmVH?=
 =?utf-8?B?NVZjSU02bnd2bmtLMmxOdlR0biswRU5JMDUyS1BqTGg4cFBqRkRPWmd3NVFm?=
 =?utf-8?B?dktBbFFXTDZBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ODZGcWxLcVMwbE9VVFNURFJzYXgxeTRZM2U2Q0ZDQUR0WmY0dzQzSnhNZFR4?=
 =?utf-8?B?Y1NkZEdnY2N0Z2RBSnVVcXVTUk9PQkhOVWNkZURlOEU0Z3ZQVjJySE9pVkRC?=
 =?utf-8?B?Y1V5b2FYaXhYNjhENjNJQ0ZwWDgycFgxSnpCcmZHZnM1NC8zbThxb05qb2xX?=
 =?utf-8?B?NlFhQzRYR05HSkJuT0dQY2trVjBVcTc2Nmx4TUdoWHBtVWNlM3Z3ZkZaclVh?=
 =?utf-8?B?UmNtems1ZjEzNFk3ZmpuRm5TbDZZK3VPK1ZqTnFVOG11a3hzSmNHdi9hSFdX?=
 =?utf-8?B?eXEraGxtbjQxTnROeW1kTFdqakNtLzM0Z202NmNoV0xsdXZyRDdDSXV3dnhr?=
 =?utf-8?B?UHRIeDc4Wkw0WEtKTnc1ZElqendENlVqcXdJdEJHZVdSOGpzQ1paNUtrUDFs?=
 =?utf-8?B?RmNHRVM1c3RtNCtRNzVUOGRjV1BYWmhMbXRaYnRJVnpML2ZGUzNBSFBrV0Nt?=
 =?utf-8?B?eSswMktPcDFaaXhiU3Bpa01lUkRTNjU4azVLbUV1M3paNVAyenYyOGxiWWQv?=
 =?utf-8?B?MUJlZE4zV3hRWi9ab29HYys4TUthRm5teWI1Z2l2RFRKZU1RVkRhSEE5SVdS?=
 =?utf-8?B?M3dGWG8vUzM3ZlZpU0FOSFo5N2JndURyVmNBVEVWNGxZUGo3Mk9xNnJMWTNl?=
 =?utf-8?B?cnZtSitxSVJ3VmRXOFVPM3BkS09EQzhrN1Y2MTFFQ3RmbmJBa081V0NTaHRE?=
 =?utf-8?B?Njl0N3hUcmJzdUFOVUFQb1hhTHE5ZXExUUlGYmVPY2dMRFV1UThWaTFlQTh3?=
 =?utf-8?B?OElwc3VpbnMxblJCZkFSeTJheTBWQjBPUHhJVUMxOERwZG82eE1zaitFUnEy?=
 =?utf-8?B?OTJmVFFvcFZYYWFqYzhyUHdZd2FRS3Jna1lrNFNFeExhNkhUdVNzS0ZSK2ZI?=
 =?utf-8?B?STh2b3FOYTNPc2pKNWVuVFJYclJ5eWF5blFjSnh1SStFaXMwRjBLaktibEk0?=
 =?utf-8?B?RTNRSUpDbWplTHZ2NVV2VXJtdC9SZFpmQTdXcnNFdEVNNUR2WHNQK1hLWlp1?=
 =?utf-8?B?V0d4V25GMkIrb0tySy9kNFpONlFlem9vbWxiV3crN2RZenY5VlJhYTJzbnNT?=
 =?utf-8?B?K0wwb0J2S3JxblRia2pvN1BQckt3eVdpQk5tWXZYZWJxSlhaNmZobVpJakg2?=
 =?utf-8?B?bUhPd20vc1dsRnNNd0p6THdJUC9EeS9uZDd6Tk1mYTVGcUxNbDhxTmRnVjJC?=
 =?utf-8?B?U3F0alZVSU4ycEtLVWNyVGVmcXdobWFLSzBRd0w4ekY2ZHlZWjAxV0U5MXBP?=
 =?utf-8?B?aHpiVHRnckxDN1dRZFJQRTdiVW9Ld0JaZXo0L3hVUVlNaUh3Vzhyd1JzdDVO?=
 =?utf-8?B?eG9wa2JTQ0ZhSmtIRSs0b0VQalc5NXkvVmNQUXdpNDhpanMwcnpva2d3ZWVY?=
 =?utf-8?B?Sm5rcE5nOXoyZlpIOERublhNVHJhNjAzc2thdVdCdzRJTjBiUUhyS0JtZnB6?=
 =?utf-8?B?b1JmZmlKdjk1VDFiZUNKellnN25LOUFOOU1mSGxCZmNiNkdzY2VVQjduRndi?=
 =?utf-8?B?Um5qeDhQU2V4VFFWaFJSeXB0YkhhM0ppOFBwWlRjeWg5c1dBbUxINisvVXIv?=
 =?utf-8?B?TGZpRlR1VEplQ0k4WTNQZi83dW44QXR0WlZPblBpQVlUUDlXTXFDb1ZsQ052?=
 =?utf-8?B?T09qbkdVK200TWpCNEZGaEt3TERneHZ4MHhvcVltYVRGMFlpakVXeUxsUlFO?=
 =?utf-8?B?V3hvaU93RDhDaU84K05jcHdmVGhNOHJRSWNxZnV0ZDcvRndaTXMwVDNjNHhl?=
 =?utf-8?B?SjUyaGo5SFJVNndYcVRXS3NGNFM3d0tsNHhKRitsN1g0VEp2aUdaS2l6akVH?=
 =?utf-8?B?WTNpRXQwNC9FallVMmJQT1dudUYrNXhhYlE1Z1JIRjFhUGEwZEd0Z25aZWI5?=
 =?utf-8?B?d0FuekZ1eC9mMGpUY25YM25TSDVjeERPZHo2R3ZKWk5zUUdCSi82RkhQcUZa?=
 =?utf-8?B?WHFMMzlnS29ZTWZhTHN3ZzNKSU41d0hka2VzK1Nxam92Zk41Y3VDYmVtVjhz?=
 =?utf-8?B?RkRYd0lqbUJoM0ExS3Y4S2dBMmNLbUxHYkVCY21XRGdJeXA0ZUhTYVArcjkz?=
 =?utf-8?B?d0xhdUluUXVrWjhVdmZINzBaNGMrUTdIS0kydVZtOW1VZUlUMWdsak5LZnpT?=
 =?utf-8?Q?FZZu15jmrROPZXimNakN2Uf6S?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e09b9d6f-857d-4a1c-30bc-08dd92b3b639
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 06:51:10.9876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8xNqIuhM9jN1D7YpLqbDihSK+unerL8YKMY4nTgwIhR5pyIpgIBbVMs8Ytr954Z3Q02X98W7pWK+7yB8Nv76w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 06:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216477

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
TWF5IDE0LCAyMDI1IDg6NDYNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8
UGV0ZXIuTWFya29Ac2llbWVucy5jb20+Ow0KPiBzdGV2ZUBzYWtvbWFuLmNvbTsgb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgeW9jdG8tDQo+IHNlY3VyaXR5QGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFt5b2N0by1zZWN1cml0eV0gT0UtY29y
ZSBDVkUgbWV0cmljcyBmb3Igd2FsbmFzY2FyIG9uIFN1biAxMSBNYXkNCj4gMjAyNSAwMTo0OTo0
OSBBTSBIU1QNCj4gDQo+IE9uIFdlZCwgMjAyNS0wNS0xNCBhdCAwNjo0MyArMDAwMCwgTWFya28s
IFBldGVyIHdyb3RlOg0KPiA+IFN1cmUgdGhpbmcsIEkgaGF2ZSBzZW50IDMgcGF0Y2hlcyB0byB5
b2N0by1wYXRjaGVzIG9uIFN1bmRheS4NCj4gPiBTbyBmYXIgdGhleSdyZSBub3QgbWVyZ2VkLi4u
DQo+IA0KPiBTb3JyeSwgSSd2ZSBiZWVuIG1lYW5pbmcgdG8gYnV0IHRoZXJlIGlzIGEgbG90IGdv
aW5nIG9uLiBJJ20gbm90IHN1cmUNCj4gd2Ugd2FudCB0byBzdG9wIHN0eWhlYWQgbWV0cmljcyBx
dWl0ZSB5ZXQgc28gdGhhdCBtZWFucyBvbmUgb2YgdGhlbQ0KPiBuZWVkcyB0d2Vha2luZyBhbmQg
SSBkaWRuJ3Qgd2FudCB0byBwdXNoIGJhY2sgYW5kIGFzIGZvciBhIG5ldw0KPiB2ZXJzaW9uLg0K
DQpJIGRvbid0IHRoaW5rIHRoYXQgSSBoYXZlIHJlbW92ZWQgc3R5aGVhZCBtZXRyaWNzIGluIG15
IHBhdGNoZXMuDQpJIGhhdmUgcmVtb3ZlZCBvbmx5IGNoZWNrLWxheWVyLW5pZ2h0bHkgYW5kIG1l
dGEtb2UtbWlycm9yIGpvYnMgd2hpY2ggYXJlIEkgdGhpbmsgdXNlbGVzcyBub3cgYXMgdGhlcmUg
YXJlIG5vIG5ldyBwYXRjaGVzIGFjY2VwdGVkLg0KSWYgdGhvc2UgYXJlIHRvIGJlIGtlcHQsIEkg
bmVlZCBhIGd1aWRhbmNlIGUuZy4gb24gd2hlbiB0aGVzZSBqb2JzIGFyZSB0byBiZSBydW4gZm9y
IHdhbG5hc2NhciBhcyBJIGFtIG5vdyByZXVzaW5nICJuZXdseSBmcmVlIiB0aW1lIHNsb3RzLg0K
SWYgeW91IGhhdmUgYSBzdWdnZXN0aW9uLCBwbGVhc2UgY29tbWVudCBvbiB0aGUgcGF0Y2hlcyBz
byBJIGtub3cgd2hhdCB0byBjaGFuZ2UuDQoNClRoYW5rcywNClBldGVyDQoNCi4uDQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo=

