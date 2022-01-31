Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EF7C4332F
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 11:37:42 +0000 (UTC)
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (GBR01-LO2-obe.outbound.protection.outlook.com [40.107.10.95])
 by mx.groups.io with SMTP id smtpd.web10.31198.1643629060795760279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 03:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=Qe4QyqTr;
 spf=pass (domain: sancloud.com, ip: 40.107.10.95,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSxcsVcYs7OehuL06TSKVIbG3PAlDs2qXBtDIzJm1UxYXZGFthkUyBC4wZDGgFa1luiKI21jsxImB2uccKrpqUFQAHygFJRxXCLQ/J3vzo49X7DxS15NSzbVCTFX+ocw4jQj457Ahb38PB5jYIDs76HfIcRvye22tPud9ksmCguTcOVOxzq453ro68AL3F6xbO1zqASKQ/4kcCs16YcVHZ3Gxm1HTAZcxRO7e7Xf4TrQLeT5SlR+Pkl5l9hTlRXP8w7jPl+KimyAkKgDvJoCHQgpcJ551ieXySi3JfwgyuepQvC2h2nPgOR4rdbAN5FnC4Wh/O8AgpCRSe/c+rqR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fre3C3N8TCRe9IZw+R1r8JE49DbKXBpsmya3PnAjH3A=;
 b=gVXcVw3xr7osCEfoNo/zmlihLuatkQmpVsyHxhn4e6247iPsnxTERPcdifWWRBfsWV5FmfkkjSjEzBTbEVC/i5OS5eKzzcyewBxe0bQbEgPnQb1O7SL5ljLqwEXHdrIbwZiYh17j7zYlPOSZz7TfwXuiEZuFPOv6Lf6LCnJYF8/BgHRitf0wkMoK/Pz/b+pCqi/LZJxikIfJJXeXT8QDPWZcNkxtXbWTrxtrUx4hI1e5MOBTnXD19IULGtsezZb972F1Xv7xKWdsCuEL4OCI1wjYMnVbyGYnwrgQvF6BE5zOPbNN7y+TetnRM/ka9jGJevLNZFSFgurRvILV7puTSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fre3C3N8TCRe9IZw+R1r8JE49DbKXBpsmya3PnAjH3A=;
 b=Qe4QyqTrDkL/pSoNuPk72hrCXqnxwtCY88IgifZe6dVG0TQ/pOrKG+NzgzCVsBD540OPzTbsmZsPH2/U0RAgFxQLJZONBbP3xPmr12e0rnXN4Gl3J6k24n3Hzk/yuu6hzVYvmPVM3aT8rO5VH9rfY5ILpZwiAe5Ke2BXKleMNCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB3000.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 11:37:37 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::5d88:2deb:7b9b:838d]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::5d88:2deb:7b9b:838d%4]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 11:37:37 +0000
Message-ID: <20df8397-23e1-cc7c-afa3-fee12998d6c7@sancloud.com>
Date: Mon, 31 Jan 2022 11:37:35 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [honister PATCH] kernel: introduce python3-dtschema-wrapper
To: openembedded-core@lists.openembedded.org,
 Anuj Mittal <anuj.mittal@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220114132150.2604-1-paul.barker@sancloud.com>
From: Paul Barker <paul.barker@sancloud.com>
In-Reply-To: <20220114132150.2604-1-paul.barker@sancloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d32DBk5AODLyj4OkfaJ2g7IM"
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 438bf5be-42f1-466b-0930-08d9e4ae14ea
X-MS-TrafficTypeDiagnostic: CWXP123MB3000:EE_
X-Microsoft-Antispam-PRVS: 
	<CWXP123MB30003AEC51AAF5CF6B567E5B93259@CWXP123MB3000.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+jBvX/alxbstNTtDHISXFHu9q1f/JDGK3z1uz5BiEqB7rUfS6Lli+JdpLVuw2TwTppNOHl6KpCP/by5L8RfGgdreIxqUca02dPMh5MkT43ijelYl4sk6fXXV0O6szg+xywDLOdYWqB7FDRMO8oc2iW5jDqwVHJm5iGhAI2vEvaRKZGu9Owf1mIZG/dhYk86VgcwtYqGBjz/p29kIBzfPDveAp0P5HaeUSG7fZHnlYnp/9gHzRneUwentMV/yMeuP92ygfOrm0KrDtaYoaA1BLBFSDMDYveG1o093ymUH5U61yKneVbJ9FB/Dk2851vSHKzazMcyRRDyKJknptSWWLy3NyFpgjuz76NnU3Uz1k2EnMGuL+vjOab97IzEVH+L/AL0no0vKiCMr5dnWLOOtIAinHKLFyEat7WLCRzERCMM6PE7uw5j1hYv9IOGRPg8ZnTc46dpjxeaAKSQhyEjMNymRhw0yziQiRoIv2GBzLyoGRAEv1oIlLBlR7Kb8iI7D2YwJN93e6eRtB89/isAiJGRxXqNixF5qNHF08rzRGZnJjJ+mRLd7apC4oPXC2KMaL3Dm5BSHJ5xSse8CpAWxJQLagBi0IRH5B3W05JreaYpnqLHvTWwN7on3u8EFbExCWCieHTbAaPbgihE2BgHV0PEGHltoYJgl4bI1lQP8FwYKBhKtJF1frLwDAKwLSp1fXWwEBMaTb84kq5XnbSnmtDnwuKL1+Z5IkHKeYOVxiLGzwWTNcIk5DjK3UqRnYFkaDh3hoSncL82U2WCd5wK3WJcNFzPC3JzseX8uBU2NMDXh90SFFCZB91OIfcpJGf6vzD9PoyziuKuBN5PA2RVTX8J14UYm8+iHikGLaWehrLc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(376002)(39830400003)(366004)(346002)(136003)(396003)(8936002)(5660300002)(31686004)(8676002)(508600001)(6512007)(33964004)(966005)(6486002)(6506007)(36756003)(235185007)(66476007)(66556008)(66946007)(316002)(4326008)(53546011)(52116002)(54906003)(6916009)(2616005)(44832011)(83380400001)(186003)(26005)(2906002)(38350700002)(38100700002)(21480400003)(31696002)(86362001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?blNhekI2bU1UcnRVS2hWamlIeWxnbEFCWklPd2QvQ1dWQ2FSTDhSdTZiTldv?=
 =?utf-8?B?Wnl5and5SWJjbTVOODcwRkdpYUxFdjBhQUg5by9Wa0k1eXFvd2RrbWhJZ3Rz?=
 =?utf-8?B?bitZZDNnTWRYQnM4Q2hMeENFMUZBUEs5VU93bzc3S3VwSFdLYkJjdy9HSW9m?=
 =?utf-8?B?UlB3REFKSkhBQjhxc1hXakZXYStLL1Mya2NkaDhQWVRkQXdxMzM4T3h3dzhp?=
 =?utf-8?B?am9HUGRwbWJoWXRJSXZKSnB1YURScW9PNEZLcGFuVmZRNldCN2ovTXh4ZFNK?=
 =?utf-8?B?dDlnSkUyMUpBNnhJYnpteC9jVXhOa1NpdGlvb3VaZ3JqT000RmhEYXF1amVo?=
 =?utf-8?B?STlNOS9udERQWDNNZGhHeE5nWmdVanhKNmpzVDh4RHRXZGYxc0ZBUTVHNWZx?=
 =?utf-8?B?NDhteFE5UGVOeVhHb0J1dExsNGdzanN0QzQyV1BsSGtCVGtvV1BsQ09OdVRj?=
 =?utf-8?B?bTBqdCs0QWgzQ0JDWGdQSmYrZ3hqK2RsWjhNUG10Vmo3ZUJHY2VqTGI0R3dE?=
 =?utf-8?B?Z0JzemlzQis1WGtRelhOeDJlNTAxakMwWTU3S0xydFVRbmlnNEh1cmJnWi9j?=
 =?utf-8?B?ZFlIblFha2hGZGhlRG8zZVptVmxpNWhmTm8yeXF5czNpbGZSOWw3VnVLai9h?=
 =?utf-8?B?QzhIVlhwTVJYaHRkRzI4MDhPZEh1TFc2ZHg2bFFadzlKY1ZKUkIwMENSSXFK?=
 =?utf-8?B?b0pVeUw0a0ZhT29IUWY2OUtKNVZLeFgzY0FtQ2o2cU85cDZOajJCcVhUVW56?=
 =?utf-8?B?UWFPVHZtcmllOE5IV1RpaVBBT3BOdnBtUDBFNmR5SjJ5Y3BDQjhKSHJKeFBE?=
 =?utf-8?B?Q05NZ1cxZUxGemppUmZoSEQweDJiUnErT3I1SE10OWU3VWdCVy8xcE1HMlNQ?=
 =?utf-8?B?MWFzWkhpd21NK0k1OSswWFZ6ZzhhOG9xdXZmK0d3S0hwT1lqNUo2bG4rS3dU?=
 =?utf-8?B?VXZkNkJRaG1KOGE5TU1RYlNEVzVaTmhFVlNROWY4ZWhXSmQ0L0ZCVzVBUjV0?=
 =?utf-8?B?Ujg3dUZ2RGdSbzJiMFFQNEk3R3ZWRm9zTXJEb2xzRzlZcmorK3YrY3d5d25D?=
 =?utf-8?B?SzBmRnhoamphdXdWbXN4RWhyTm91YlBnR0t3b0pscW53VXQ2cWFDY2pKZ0Iy?=
 =?utf-8?B?WVBYN3Foc1J5eS82WnN1dnF1TER0WjVwbjkyY2d3NUlLM3RBTEs4RDd3Y21K?=
 =?utf-8?B?M2kwOXNLelR1dzdwT1BOcW02blYwUThUUlBvUE1GNy9DOUkyeGZHK0htcXlS?=
 =?utf-8?B?WmJpRHU5dVNEaTdldW1YOXlMNzJuRG9DMm5IMnE2S1czaW9JVG1hditiVWlX?=
 =?utf-8?B?YUlnY2RHTDRZVjhNQml0dzZ4VVBxamZUU1JDVGVGc3ROaU42S2pxOVpjbm91?=
 =?utf-8?B?cHZEN0ZreTBucEQrczA3Ym1FYVd5c1ZYZ3oxYWZGNGFLbStSRzBPMkJzODkw?=
 =?utf-8?B?a1dRR3VobHBNVUJURlU2VTJ0cm5DVTYxRitOL1JpdCtYZTBqVFNUS1BUTjhF?=
 =?utf-8?B?NURGVU4yOUpqMDFYUDZKZjlwZ0tHWXUzR21ZcWVDNW96MEt1VU9naUh0Qk1j?=
 =?utf-8?B?bmgxRHN6TmtaeEN1L0RsY0hlTnZBSEdNdm1HNzNDNXhhbjlFOElORFdZZmlD?=
 =?utf-8?B?THlLYlV0NHdNdVVOZ0IvTER2bjlNVXlGR24vNlhhUXp1dmFURjVuS3RteDVC?=
 =?utf-8?B?cjlZaEpRZ0kyQkZRSXpONVlzU3JPak90WU5DZEJTcXlMelNjRjAwcjhDbTVF?=
 =?utf-8?B?VUNLMFVvbzNaWHpJNWZjR05DS05YZ0RFdnlCYlJ2a0hWNkRITURHQWlVdHVN?=
 =?utf-8?B?TEFvdGphcEZQV01qcXMyVmxyNFFHemgzZXU3ZlRZRnZlZXZMWHd0cis4MFVy?=
 =?utf-8?B?ZlA5aUY5NEpjMFM3WjNHSmE2MThhVmROb01zTGRjSHhpaGQ5M2I1Nnh4aW9L?=
 =?utf-8?B?cXNjTVEveFgxTlVObmVBQ0VhWUZJc3pNWjVnUFdxZ3RWN3B6Vytoa0JNYnh2?=
 =?utf-8?B?dU0xampRMHkvZjJxMExlOEIzRWRRUUF3MTlXMWMvaWUyL3kzQk1yZDNRN0FG?=
 =?utf-8?B?K0RFRExhTWNrYzMwYTUxamZ6WTJHV3NhcWpGQ2VxSFpSZENLbFJqOHBxZkdq?=
 =?utf-8?B?bEhkdzBZeGpadmdwSlEyZm91M3Q3YUl4SlN0Zm1IUTU2eGtSeE9jMFRwbGg0?=
 =?utf-8?B?WFhuZGFQNWIxVGZTdFVQNTVEaS92SnhIZ3RTTmQrL0ZMc2lpSmdSVUdJMDRu?=
 =?utf-8?B?Z0ZzYytnZml3S1NMTnpOazdIN1Z3PT0=?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 438bf5be-42f1-466b-0930-08d9e4ae14ea
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 11:37:37.7522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f0ZlaU88vtbUesODEJ4SIdxBk5fWNwIp4Aos6zUbC5wVTiBK0TxqsqNMb65D47beC9+fMtKcv2DuC5NzE/8YAkslI9zqfIYTGZTpM0CuFQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 11:37:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161121

--------------d32DBk5AODLyj4OkfaJ2g7IM
Content-Type: multipart/mixed; boundary="------------dKjZLTxW8lNDhzkbZUobNCXL";
 protected-headers="v1"
From: Paul Barker <paul.barker@sancloud.com>
To: openembedded-core@lists.openembedded.org,
 Anuj Mittal <anuj.mittal@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20df8397-23e1-cc7c-afa3-fee12998d6c7@sancloud.com>
Subject: Re: [honister PATCH] kernel: introduce python3-dtschema-wrapper
References: <20220114132150.2604-1-paul.barker@sancloud.com>
In-Reply-To: <20220114132150.2604-1-paul.barker@sancloud.com>

--------------dKjZLTxW8lNDhzkbZUobNCXL
Content-Type: multipart/mixed; boundary="------------QbI45xWgVESWjhb6c9nk7hSj"

--------------QbI45xWgVESWjhb6c9nk7hSj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQvMDEvMjAyMiAxMzoyMSwgUGF1bCBCYXJrZXIgd3JvdGU6DQo+IEZyb206IEJydWNl
IEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+DQo+IA0KPiBUaGUgNS4xNiBr
ZXJuZWwgaW50cm9kdWNlZCBtYW5kYXRvcnkgc2NoZW1hIGNoZWNraW5nIG9uIGFueSBkdGIg
ZmlsZQ0KPiBidWlsdCB0aHJvdWdoIHRoZSBrZXJuZWwuDQo+IA0KPiBUaGF0IGZ1bmNpb25h
bGl0eSBpcyBwcm92aWRlZCB2aWEgcHl0aG9uMy1kdC1zY2hlbWEuDQo+IA0KPiBUaGUgZGVw
ZW5kZW5jaWVzIHRvIGVuYWJsZSB0aGF0IGZ1bmN0aW9uYWxpdHkgaXMgbm90IHNtYWxsLCBh
bmQgbWF5DQo+IG5vdCBhbHdheXMgYmUgZGVzaXJlZCAoaW4gcGFydGljdWxhciBvbiBhcmNo
aXRlY3R1cmVzIHRoYXQgZG8gbm90DQo+IHN1cHBvcnQgZHRicywgb3IgaW4gZGV2ZWxvcG1l
bnQgY3ljbGVzKS4gSXQgbWF5IGFsc28gYmUgdXNlZnVsIGZvcg0KPiBhbGxvd2luZyBhIG5v
bi1jb25mb3JtYW50IGR0cyB0byBiZSBjb21waWxlZC4NCj4gDQo+IFRoaXMgY29tbWl0IGlu
dHJvZHVjZXMgYSBzZXQgb2Ygd3JhcHBlciBzY3JpcHRzIHRoYXQgd2hlbiBhZGRlZA0KPiBh
cyBhIGRlcGVuZW5jeSB0byB0aGUga2VybmVsLCBjYW4gcGFzcyBib3RoIHRoZSB2YWxpZGF0
aW9uIHRlc3RpbmcNCj4gYW5kIHZhbGlkYXRpb24gc3RlcHMgb2YgYSBkdHMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz4NCj4gDQo+IEJhY2twb3J0ZWQgZnJvbSBvZS1jb3JlIGNvbW1p
dCAyNTY2NTYzYWQ0OWQuDQo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQmFya2VyIDxwYXVsLmJh
cmtlckBzYW5jbG91ZC5jb20+DQoNCkknbSBzZW5kaW5nIGEgZ2VudGxlIHBpbmcgb24gdGhp
cyBhcyBJIGhhdmVuJ3QgaGVhcmQgYW55IHJlcGx5IG9yIHNlZW4gDQp0aGlzIGxhbmQgaW4g
aG9uaXN0ZXIgeWV0LiBBbnkgZmVlZGJhY2s/DQoNClRoYW5rcywNCg0KLS0gDQpQYXVsIEJh
cmtlcg0KUHJpbmNpcGFsIFNvZnR3YXJlIEVuZ2luZWVyDQpTYW5DbG91ZCBMdGQNCg0KZTog
cGF1bC5iYXJrZXJAc2FuY2xvdWQuY29tDQp3OiBodHRwczovL3NhbmNsb3VkLmNvLnVrLw0K

--------------QbI45xWgVESWjhb6c9nk7hSj
Content-Type: application/pgp-keys; name="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
4yvD5AdHy8s8HYtBP5oowjSllz6aOtP0BiQ=3D
=3Duult
-----END PGP PUBLIC KEY BLOCK-----

--------------QbI45xWgVESWjhb6c9nk7hSj--

--------------dKjZLTxW8lNDhzkbZUobNCXL--

--------------d32DBk5AODLyj4OkfaJ2g7IM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYffJ/wUDAAAAAAAKCRDYN3IfEvob6rMr
AQCaU3+DZhD/6PBQzEdzQPnsmbsJE1o4STZGo5pVysX0ZQD/ZOi6D1KWFwvOyx6TBgUMHFFBKzZx
MKNX7FqjqQMbQgk=
=zDyN
-----END PGP SIGNATURE-----

--------------d32DBk5AODLyj4OkfaJ2g7IM--

