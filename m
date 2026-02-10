Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73883EA3F2A
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 09:04:13 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15851.1770714245583843731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 01:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 10 Feb 2026 18:04:03 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO sniperexo2.lge.com) (165.244.147.12)
	by 156.147.1.125 with ESMTP; 10 Feb 2026 18:04:03 +0900
X-Original-SENDERIP: 165.244.147.12
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO SEVP216CU002.outbound.protection.outlook.com) (40.93.138.50)
	by 165.244.147.12 with ESMTP; 10 Feb 2026 18:04:02 +0900
X-Original-SENDERIP: 40.93.138.50
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: jaeyoon.jung@lge.com
X-Original-RCPTTO: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNzdJ/LaG8ykBzN0u81BLsSPFKO671oMkpW5CVsbfmW9LhLIJREcFjjZlKNlJXOza+l5xHoR7L7cXPfyVLUWLcIiZgcUFSceIede9S+OuU3PQ7Wj4CvxHVdo6zf+H26p4z/Zo03cYu89Pm6bOF6G8zwlUvKrJG0dw1hUWXv+Vp9RcAQLx3MkzNzttIrXNZSS5CcbqRCWiJY8Jh1dN64HLe0dilJN66iZEKZdVcX+SjUMM1OZLEWHlA193qvPEOQX2ZtPBGc1jTUdG27aBacphPqzyGjkBSmCv3mgmTjzDmk8K9Sy5WemBnmbvC47nCB77pbEjNswmFcrNwGGLQyeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwRj8jc6W8CwGoyeleawieetR08CaNeTxsrGzq32T9k=;
 b=DD6Zq9LS2Q5SX0lmPZQJ6r8hETvSbEjzXgkd2Oa9N/bLA6NNWEkp7DJncenm/okcD8stHKhA7o5/sOKM63R2yqMzvmgMGuAUOD2wrrGc+ja5px8hADEqFfbx08QlVA390UwM81ncKRkCBbzbpm5x9koLVbhtz3slRO2tGYOW1sm6ZUdXw53ctQLYpsd9r072N3Jcfq/H+vU51XkCCbi3hugGCr+I8jyPovjtoZDcTyWfF0x0TvTNRDagq15CMbBQ/x6/6dV+WC5mc9cThb7h0e9WUs3lU1DvOn/avQkI6mSr0wx4xJJSUzKnsN6MUWZnEqftcjNIoQ1M1kFA6mFjig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lge.com; dmarc=pass action=none header.from=lge.com; dkim=pass
 header.d=lge.com; arc=none
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::13)
 by SE5P216MB3238.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 09:04:02 +0000
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e]) by PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 09:04:02 +0000
From: =?utf-8?B?7KCV7J6s7JykL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKOyXsCnshKDtlolQ?=
 =?utf-8?B?bGF0Zm9ybeqwnOuwnOyLpCBMaWdodHdlaWdodCBTeXN0ZW0gVGFzaw==?=
	<jaeyoon.jung@lge.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: fix libsystemd LICENSE for multilib
Thread-Topic: [OE-core] [PATCH] systemd: fix libsystemd LICENSE for multilib
Thread-Index: AQHcmlADBFFxn9txHUSRJnN9zE6LqrV7myYAgAAFi48=
Date: Tue, 10 Feb 2026 09:04:02 +0000
Message-ID: 
 <PU4P216MB11330708E3BBE2CC8996C2859A62A@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
References: <20260210054147.838158-1-jaeyoon.jung@lge.com>
 <9f46cb53a43c6f01135b8a8e18269e92cceb1725.camel@linuxfoundation.org>
In-Reply-To: 
 <9f46cb53a43c6f01135b8a8e18269e92cceb1725.camel@linuxfoundation.org>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lge.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1133:EE_|SE5P216MB3238:EE_
x-ms-office365-filtering-correlation-id: 0a137b8f-cea3-4a4f-a428-08de688355c1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?K01ZY2ZIOGFTM3Jndm9TdlZYWGdOOWxUVjdQdjZLQTg4SlFKWmFqQnZtZ05i?=
 =?utf-8?B?WnBKYzVRODJqUDA0VzMrMm1tZXhZZEpNclRpaXpCUXF4OEJLZ2xoTmRwOFdJ?=
 =?utf-8?B?YWhxbk9jS2ZYZ2JFazBsbnNNUzRPSWFRVXc1KzFWMUhkaVJDK21CRlZsSVBJ?=
 =?utf-8?B?UFJqV3VLRG4wMzVRNkh2NHQ0T2VtZkdnQXkwQWpoODFsaE5sdk1lMVJ5dVlF?=
 =?utf-8?B?KzNBUzJoSTdKTlI3Z1pYTHJVSm5lNDRjbFVOMmI1K2hvSkU1b09OYWFOZnVD?=
 =?utf-8?B?TjlHamtaWUJLbHlYOVlmdU42ZW53aXdwVmRzR3ZVaUhSWTFvOU9CR2RXenor?=
 =?utf-8?B?Y2FEUTRxWGlOR0JoczYyNElyek95MDlYRnV5cWJ6MzU2NTVoNjdzMjMyejB2?=
 =?utf-8?B?TjRLNmkvbW9nUVRET2tETUVmMmNmbTVOSDF1bXRkM2krK1FPMFlNdVJaSW1S?=
 =?utf-8?B?NFJ0aUphei94T0tvWnFnVjRGM0xMU0RuRUFlRlZvdHoyY2lFWUF1UytKMDRC?=
 =?utf-8?B?Y3JxUFVYSDRSeTFZQ2w5ME9iM2xqcEdibDFRVEFkNzAzdGwxU25jUTNpQ25m?=
 =?utf-8?B?MVE4MmVnTUhxSGExMFkyNVptQmRDVk9SVHNFeS9TWnF5Smd2Mm5XbTZpNnAx?=
 =?utf-8?B?RjlyVVk4dFZZUDdsa0tNcmtIZjA2SEthTVRMTzV0dWMvY1pSbjNXNnpZcGlL?=
 =?utf-8?B?SWwzTXNTWnFKdktPVDR6dENQSTJiajUya2RsWnhwL21UVzVXcWltSm5ETzBr?=
 =?utf-8?B?bWpJQ2Q1dlh5Nmt2RFVUQWEzOGxvcUpRVm9nSzRQYkNBV2VmcFE5Z3pyaElW?=
 =?utf-8?B?YXJ4cUttUjRsajc5U1c3bkhFUnB3UG1PcUZFUnVUTFA0cUl1RFZDNkpLTmpX?=
 =?utf-8?B?azhRYkIrb21zOUIwajJaWXBZTDl0enVPN1c1SlBkYURSYTVnYXpvTHM3N1Ni?=
 =?utf-8?B?cnF6Mzh5akdkZXlYbTZDYXIwS3NmY3JldlhyUnFRbitXVXhudHVzRFpCQjFo?=
 =?utf-8?B?cVkwZGRBaWJkM0hCalg2ZG5wSmg1UkExaWpqMGRCbTJBSnhpbjNPZHp1K3Vu?=
 =?utf-8?B?d3ErZlFpOU1nS0RQemlMRndIS3VWa2NNejlvQUsvNTE1aEhQaWYrMWFkZytj?=
 =?utf-8?B?S3FnbjlxdVA0NS82dnYvd1lvLytRa2c4TGRuYW9CMXlvbE1WSWQ4OFRGdmNh?=
 =?utf-8?B?enVydE1tZkFSMkNnNFdQWUM5QUtwdlFPaTRzdFVvQ3ZmRm1tZ2FuUm1zOUVU?=
 =?utf-8?B?THloQmJGZ3JnUEp2V3RZTU83RmxGbjlST0dDeCt3V1JCeCtQMEJJOEpxeGtM?=
 =?utf-8?B?SEdLWXE0MHh5em5SVzV4ckNINW41Y3Vtdkd3SzhrRWtXOGk5ZHVKOU9wTWFT?=
 =?utf-8?B?bXNWM0Vhb3kzWVpjMXhmWTdjanRkLy8zYVdSclJhMkE4M1p4RkhUTlVmQnFB?=
 =?utf-8?B?NmJSSkY5NitadHF0a1dZVWtPMWxOandSRkgrN09WRnVXRXhmRFI1dnJjRmtD?=
 =?utf-8?B?cjZjaDNsTk9XaWsrRUdMcmc3NngwOE52cDhPMGhDSzBKeWZTVkQvdVY2OFp4?=
 =?utf-8?B?SEp6MGd4d1RGbi9aQlphUW9IUkp3TTdDc1V1L08wa2tpdGFvcDVNK2NjU05r?=
 =?utf-8?B?bWtyajFSd0Z6QnNGTk1KVi82OUQ3WEt6TFQvbkZ1RG11WEVDemE1cHZHUmQv?=
 =?utf-8?B?anFrU1ptYk80Sk9FSHN4Zy9XUmJpRXQ0Ly83c2VDb2FpSVl6Q2piY0g3dkp1?=
 =?utf-8?B?WEhtSlp4THpCSndENFVOWTdROCtGcjVDTUZSUEg4bGxpYjJ5ZVlqTklYUEQ5?=
 =?utf-8?B?VzN0TXkvNUFiREFNVnJxSGFONVpWZitmM2ZYRWwxZkZtUnl2SWhENlJsbnMw?=
 =?utf-8?B?cGN1cUtOb0xTYmtZYmFsd0Jhb3k3dUloNWNkTjh1UTlDQ2g2TkJ1bkJDUXhT?=
 =?utf-8?B?aUNOZ0xmY2p5L0JEdXUwNUZvQjFBSnNrZlhzTTBORDhYaFphVHJOazhZa3o0?=
 =?utf-8?B?QnhFa0pVUDlPSVg4TDByT25Qd3RvVWdnUmtyZ2tKMGpSckxtMlFHci8rV2s4?=
 =?utf-8?B?bCthVkxFRGdMK2ZWNXB1OUZKcWYrUnFLWTdSNUVPK1FvOHp5dGt5dG1QMXFr?=
 =?utf-8?B?dG84N04wdWZ5NGNqd29pM2ZEeXFXcklaeEYxRFpqVFUvcUtvam9PMlRsbm5k?=
 =?utf-8?Q?fR/ae0ek+1S4Mm3EjMcQV/Q=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1133.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cFJpNXpJNGovTy9wSU0ybkdZSHB3eHVya0ZmYUs0Lzd3SkZTM1pmdkhPUE5h?=
 =?utf-8?B?WEUya25LNEVXKzJUNDJzK2ZuNlZ3bnhJMFZ5UmxSdTR1TnJpUSthOWkrVXJ4?=
 =?utf-8?B?M3J4b00xSUlPYlNIeGcrejUxT1VxU1lvdHBCajkwcmpObTRhYVpvcnFvMWlv?=
 =?utf-8?B?dWl3QU9ZUG5BeHMwVjVHS0RMQWpjVUFPYmp2b0dXeW1lRmJoTkJ0OERuZWx1?=
 =?utf-8?B?ZFpTUG00YS9IUW9pVHFSZ1craHkzWEtvQ08yUFRiZFhyTUY1V2N3bEdjMlly?=
 =?utf-8?B?aS8xK3pZT29xOFlrUUxrSTRSSURGU05jZWs2RHU2bENvQm1jMmU5Mkh2dDh2?=
 =?utf-8?B?YkhHV3E4aVFoWlhzeE9pcEZjd0pVMTZDbTBUcXUrRnFZWitYUG5DUDlGc2hi?=
 =?utf-8?B?ekFHOW5Bd3krK2N2Y2RYN1BKQWJFM1ZqK204TjMrT1AwdzN3elRhUndSL2Y1?=
 =?utf-8?B?S2NNOXhTOW9BUmYzRGFNSStMdittSHFud3lBYUlFT3BPbDJoekJCRkx4TE9U?=
 =?utf-8?B?S0RCL3J4aTFMNEhwWEZHSzFDbVFZNGIzTm85K1VvTVdGNkliYmlwdDB6Zkkx?=
 =?utf-8?B?dXYyaisyd0s5aEJVSGRzRVFyUG1DQjMvVEVXelRDWlFlLzZJT2pVaVRoU2Vv?=
 =?utf-8?B?a21TTUU1b0w0NEY5OUZLSzdWYXVPRlRYRXIzekxxY3ZvSzFrMm8rUlNSN2Ru?=
 =?utf-8?B?RlJ1cEx6RmZRd3VTNFg0UnAyVnVWUjVSOCtZeDV3cTMxOGI5MjVFM0RjaHli?=
 =?utf-8?B?TEFFVjZHbTVJTXJyRys3eFhPTi9LaUJVdCtkVm9YRWNnYnRGSkZiVnJIOURB?=
 =?utf-8?B?OWVhdGpqOStYQzg5a1FwZFZzSlNpOFI2QzgzNVJUUUg4VmpTUitQSC9IdFcw?=
 =?utf-8?B?QmgvazNWMWZlNlZRdlBwNFJXb3pweUxwMzdOaWlYT2pTK3RpV0xOdkJqbEJm?=
 =?utf-8?B?aENzNy90WW8wbkErWnI3azJVYjQ3bzNOejVTeGpoeElUcExOWnRGek81UjIr?=
 =?utf-8?B?QmRmb1hOMGVGZEhJdnF5SW1LbG9UNXdvMk1CcWZIZ29oRm8ydTEzYzNzUnFH?=
 =?utf-8?B?VC9BTTlNb2tYd3kwM09lRjFFakNDNG9NRUVVbXJ6dXc3eUpMK0cxZ1draTJw?=
 =?utf-8?B?NXBjQjRBbExsenZ5ajRWRU9RYi9HTXoyQlduQnc5bnp0MzRNOFV0aTJsYzky?=
 =?utf-8?B?SVdVR3Q1ZlVaSlBRYi9Jcm9tUXhRSk9OeG9BVVg0cGp1WFFCV3ZjWGNqejVt?=
 =?utf-8?B?djlxajJvdzJhWklZcXBKMFJTYW1pQ1pwQkNMOHdvVVZQZGZBNUFITzNTR1Vo?=
 =?utf-8?B?Y2lJdHUvZEpGQUg2c0JFWVZwakVDYnNsdk83NFliWURHdDIwdzk5emxtY0Y5?=
 =?utf-8?B?bVVrd25rdXU0c1R0ZVVCT25UTktsd2FQOEFJalNiSE9DS3BzVVJsN1ZhQmd1?=
 =?utf-8?B?WldGSUpXWVlObWw2K0EzWHhOamxHNmlyOGZycFFtaGxTSTgwNVdoNUlTaHV6?=
 =?utf-8?B?a01QblIva01lS3paN3ZqT0FmeEJBOFRkaStxQm0wTFZtT09EeEY3N0FyYUQ0?=
 =?utf-8?B?WmxiOTAzNHkvV0JnS3ZSQnU0KzFtLzNpZ3kyeDBFL2VzY3Jma2h5Q292V3Va?=
 =?utf-8?B?SFB4b3hvdW5VRlVQOGQ4MXlZNFVIM0gzOS8xaXRPOWVUSHNKQ1dVc0M1eXh4?=
 =?utf-8?B?NkYyNDdlRC9mTkozQ1VURkh4MndPY01wbUsxTi8vYk5EcFdCN3JwMTgrVzBV?=
 =?utf-8?B?V09pdnpybFdJb2toZ1NEYXJ2TFl0bGlPb0RVa0g0dVJxZmx5U2tpOFlyQklt?=
 =?utf-8?B?VUdhZzVHK05jeVJHRWVLbUg2d2hFWVpMcWE5TlZTb1JSc0cwSGltUjlvM1oy?=
 =?utf-8?B?T1BaS0w3SGF6OGJ3UjN4RW9CM2J1Ukg0YmppZkhiTTNyYmxITi9yb295anJt?=
 =?utf-8?B?MTJKei95RkVzZGd2Lzkzdi9rWXh0cTgyUXhKbjJyV1NvdzVvcEJYcjljTzNT?=
 =?utf-8?B?NVRVM0ZJV1ljKzVBaGFLT2tHZ0IzRys0aXZyWkN1NDVVOGJCNXVkUDE4MzJv?=
 =?utf-8?B?OVEwN1F0cHVKSEs0azNZNC9INDN6ZlZBamoyU2Z6QTJjbEZjblFXZC9nNEsx?=
 =?utf-8?B?UytrRnpJRmg1VjVXS3ZVTUJRbitTckZoSWdsbHllZ0FucS9ncnlnWGJLVjdR?=
 =?utf-8?B?YXZQVlNrYXZhVHd1TXFLenlHdy92ZjVkWTdqNGtkanpXRmpZQTFrUG9QekhG?=
 =?utf-8?B?Tlh3QkVNcVl4aTJtYlR1NFAyRVhxa0FBOG9pa3FLb1pBZEU2ckp5WGkzUlhk?=
 =?utf-8?B?bUpJWk1hQUV4UzRmZW81VTFoNVlnQU1RbXFHMEpLdnFndHYzZlgxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a137b8f-cea3-4a4f-a428-08de688355c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 09:04:02.1849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5069cde4-642a-45c0-8094-d0c2dec10be3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJNnWxtX1fyAPrpaJ9St4EoevSeDyb7KfS4r7LvFO1FBKgPRDmFsKXTARtOrClJT4fxqFWI/POmIwyWosfFqog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3238
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230867

PiBGcm9tOsKgUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+Cj4gU2VudDrCoFR1ZXNkYXksIEZlYnJ1YXJ5IDEwLCAyMDI2IDE3OjMzCj4gVG86wqDsoJXs
nqzsnKQvVGFzayBMZWFkZXIvU1cgUGxhdGZvcm0o7JewKeyEoO2WiVBsYXRmb3Jt6rCc67Cc7Iuk
IExpZ2h0d2VpZ2h0IFN5c3RlbSBUYXNrIDxqYWV5b29uLmp1bmdAbGdlLmNvbT47IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+Cj4gU3ViamVjdDrCoFJlOiBbT0UtY29yZV0gW1BBVENIXSBzeXN0
ZW1kOiBmaXggbGlic3lzdGVtZCBMSUNFTlNFIGZvciBtdWx0aWxpYgo+IMKgCj4gT24gVHVlLCAy
MDI2LTAyLTEwIGF0IDE0OjQxICswOTAwLCBKYWV5b29uIEp1bmcgKExHRSkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBKYWV5b29uIEp1bmcgPGphZXlvb24uanVu
Z0BsZ2UuY29tPgo+ID4KPiA+IFByZXBlbmQgJHtNTFBSRUZJWH0gdG8gTElDRU5TRSBmb3IgbGli
c3lzdGVtZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWV5b29uIEp1bmcgPGphZXlvb24uanVu
Z0BsZ2UuY29tPgo+ID4gLS0tCj4gPiDCoG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVt
ZC5pbmMgfCAyICstCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5
c3RlbWQuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwo+ID4gaW5k
ZXggZGFmMzcwNjBkNy4uODBhNTI3ZGQyNSAxMDA2NDQKPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC5pbmMKPiA+IEBAIC0xMSw3ICsxMSw3IEBAIGVsYWJvcmF0ZSB0cmFuc2FjdGlv
bmFsIGRlcGVuZGVuY3ktYmFzZWQgc2VydmljZSBjb250cm9sIGxvZ2ljLiBJdCBjYW4gXAo+ID4g
wqB3b3JrIGFzIGEgZHJvcC1pbiByZXBsYWNlbWVudCBmb3Igc3lzdmluaXQuIgo+ID4gwqAKPiA+
IMKgTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkgJiBMR1BMLTIuMS1vci1sYXRlciIKPiA+IC1MSUNF
TlNFOmxpYnN5c3RlbWQgPSAiTEdQTC0yLjEtb3ItbGF0ZXIiCj4gPiArTElDRU5TRToke01MUFJF
RklYfWxpYnN5c3RlbWQgPSAiTEdQTC0yLjEtb3ItbGF0ZXIiCj4gPiDCoExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9YzA5Nzg2MzYzNTAwYTlhY2MyOWIxNDdlNmU3
MmQyYzbCoFwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW2Zp
bGU6Ly9MSUNFTlNFLkxHUEwyLjE7bWQ1PWJlMGFhZjRhMzgwZjczZjdlMDBiNDIwYTAwNzM2OGYy
Il1maWxlOi8vTElDRU5TRS5MR1BMMi4xO21kNT1iZTBhYWY0YTM4MGY3M2Y3ZTAwYjQyMGEwMDcz
NjhmMiIKPiA+IMKgCj4gCj4gVGhlIGNvbW1pdCBtZXNzYWdlIGRvZXNuJ3QgZXhwbGFpbiB3aHku
Cj4gCj4gSW4gbW9zdCBjYXNlcyB0aGUgY29kZSBzaG91bGQgYXV0b21hdGljYWxseSBoYW5kbGUg
TUxQUkVGSVguIEFyZSB0aGVyZQo+IG90aGVyIHNpbWlsYXIgaXNzdWVzIGVsc2V3aGVyZSBhbmQg
c2hvdWxkIHdlIGJlIGZpeGluZyBzb21ldGhpbmcgaW4gdGhlCj4gbXVsdGlsaWIgY2xhc3MgZXh0
ZW5zaW9uIGNvZGUgaW5zdGVhZD8KPiAKPiBDaGVlcnMsCj4gCj4gUmljaGFyZAoKWWVzLCB3ZSBo
YXZlIG9uZSBpbiBvdXIgbWV0YSBsYXllciB0aGF0IHBlcmZvcm1zIGEgY2hlY2sgYSBiaXQgZGVl
cGVyIG9uIExJQ0VOU0UgZm9yIGVhY2ggcGFja2FnZQphbmQgaXQgZW5kcyB1cCB3aXRoIGZhbGxp
bmcgYmFjayB0byBMSUNFTlNFIHdpdGggbm8gcGVyLXBhY2thZ2Ugb3ZlcnJpZGUuCkl0J3MgYWxz
byBhbiBvcHRpb24gZm9yIHVzIHRvIGZpeCBvdXJzIGJ1dCBJIHRob3VnaHQgdGhhdCBhIGhhcmRj
b2RlZCBwZXItcGFja2FnZSBvdmVycmlkZSBsaWtlIHRoaXMKc2hvdWxkIGFsc28gdGFrZSBhY2Nv
dW50IGludG8gbXVsdGlsaWIsIGxpa2Ugb3RoZXIgTElDRU5TRToke1BOfSBjYXNlcy4KCgpCZXN0
IHJlZ2FyZHMsCi0tLQpKYWV5b29uIEp1bmcKU29mdHdhcmUgUGxhdGZvcm0gTGFiLiAvIENvcnBv
cmF0ZSBSJkQgLyBMRyBFbGVjdHJvbmljcyBJbmMuCgo=

