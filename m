Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02DECA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:59:19 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.23])
 by mx.groups.io with SMTP id smtpd.web11.36085.1756983553528355240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=N7YFrwNy;
 spf=pass (domain: siemens.com, ip: 52.101.66.23, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDJFLcNDK7rADESCYybsTXrL0wTd9gc8XSnMpaTASZQv1nutkOQF0TbQqe+JpKnBC1hIfVlzPfr/5BrjuOb4aSVIX3uBqJV7ZtRM0GZlH6xRuYor+/cYBF/Tk3KdpFv1DyOZyE/Is6eONYFFWLab2FK6JlMqzBb64iF4UwbbApTXQOLQxJZLR8ht0aIdb84bsnYDFq6F65H4c/bHkMnacQzo7EpjB1EfM+jTEa5WWLjiPXZUos6klE21xpSrnYEVWzFMIkE+Q3dHuV7eTckZJG/eWKfqvDfP6iBaS0T+6zUOLa9BFIjr7OXx5ueHo5s8Dbs4eVKDPWzQJoBdWuN78w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egCrGpaN5wgnS86FWxXSfCo0DL53FbkkxfNclzK02ks=;
 b=k/QgD6yLavZ+2yc0F9QG86sd0AXrfakgQ/mbSEYjsSLkzvKB4NNIDG/QZo3NJ7fHsBmBKqfPd8/6yyoVTUfFWvF0jwr6D+8u7Qw2RTiHcsil9Cp541uHOlZoPixR8Zes2MZ03FtnHgI+wJE1hTdGdH4WZm53SJXlZW5v9mWhxnHSLvtbivg790D9NofN+i59bwBXvAbf9/YPIYOW0UBPmqYEj80Dj2e6xgvy7Lpq5rFbI3OCF7YwF5Bo1/sljNNNS1ZEa/Sgl1bHjpBnQmeK93RwfW3jB8g5JLLFJ6PL5Ge2bE+NrhaIBH9eu9QZSZTKnyinSyg0CWCh9z5hdoYLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egCrGpaN5wgnS86FWxXSfCo0DL53FbkkxfNclzK02ks=;
 b=N7YFrwNylSzOCpJqCEFuqGyjJafRI821Szcuoh3l2cD7COKCHURaGwOBJAt95gHZNBD0+gwaCzQC23Ut8Osp1s/zDg4jfFjSeK3kUH7oZPseLORw076PIQDF0zkv98+PTfwTd551R17cl+9jF64FGSMc+pyoSx3OIdGx5j1tLrNd47mfzpzpSi9EvRkwxI6rvAXRhup1d+8RQWgXLUgl0bfOhFZ+pGAvMzQwqBs40uRRiJ5ClYeicrjp6/KwSIr1lkIM+hmk+cgkHaHE2QeEi07rQHEluAzrKjNl3IgmJnd61aqEDbeQjzXKBHedk8NiVTlubXb+rW2DmJmndpGcmg==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by PRAPR10MB7621.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:294::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 10:59:09 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 10:59:09 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Kavinaya S <kavinaya@qti.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] image-fitimage: add FIT_LINUX_BIN variable
Thread-Topic: [PATCH v2 1/2] image-fitimage: add FIT_LINUX_BIN variable
Thread-Index: AQHcHX7G1R2N3SmVSkK7BxNHuvuVg7SC2uOA
Date: Thu, 4 Sep 2025 10:59:09 +0000
Message-ID: <0ea0062ae79ab5878d1240c668f165f11754c987.camel@siemens.com>
References: <20250904093122.593125-1-kavinaya@qti.qualcomm.com>
	 <20250904093122.593125-2-kavinaya@qti.qualcomm.com>
In-Reply-To: <20250904093122.593125-2-kavinaya@qti.qualcomm.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|PRAPR10MB7621:EE_
x-ms-office365-filtering-correlation-id: 0b1972de-4f9e-4e1f-a08b-08ddeba21353
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aXVTMlpBYmVnSkY0ZnRjYXBhRXhMQjM4T0o1NEFpT3RDNE1lNU5sOStxL1Z2?=
 =?utf-8?B?OUp2Vkx4UFo2emRtUTA1aE5LdnJIWDhDdDdNeE4zVEo4dWpNdDRhY0NBUVFq?=
 =?utf-8?B?M2FzbFFRNUdPdEdaWXExZGszU0FaRTNzSFFseVp2YThDa0t0UVM1cmp3dTBk?=
 =?utf-8?B?dW5RdHFCMmxKUms5WnQrcUw5RGtnRU9DallGbkx4WXZMYkZjZHRtMFl5YnI0?=
 =?utf-8?B?WitwNEtORVF6dkJQTEJmekErSXc5VGlXY0g1cEZuWUU4WVVvN3JsWDlXMDFT?=
 =?utf-8?B?clBXQ2xvOUJYa2FtZ1hUcDNsYnRSa3pyQWxjbnMvd2p5eHhtR0lyMWUzNkpN?=
 =?utf-8?B?dHk1SEYxZjJVQ1grSURYTHZickNyR3pPNTRmVWpkVFh5U2dvejl4SExnMDZW?=
 =?utf-8?B?MzRSZXI1bnJOeFJYT3dqRVZvSXpRQ0IyRWdYMkxHZEpuOC9wZnJRWXZVNUNh?=
 =?utf-8?B?bjJKVXZteEVDMjE0RUh3YnNKUTg3SGJMN1F6a2FwOXVyREtJdFdxWE1CUjJW?=
 =?utf-8?B?WkQ1MlB2VUptclBseUV5aU0zaVlGdWhnRXB6VGIrbFM0eGpyMytvUHlMRktT?=
 =?utf-8?B?RXZadldOYWlQTHFHME1KZkdoU2JCdWVKS2hacHhlSUk0WDJEeVNHaEZJRWpY?=
 =?utf-8?B?Q2VwUkNEczNtTEJ1STh4cDc0Q05DQUk3bFBBcmpYWmtjRWpVS1EyaHZTaXk0?=
 =?utf-8?B?a3B5cXRuVUNIMmh0K2hUeHpxQjRwcGtlZzY1bDA1TCtDa3VNeGxpN0lhUUhv?=
 =?utf-8?B?eDg4UHEwR0NlSXZzRlFQR1JDUlJlUjVjTkVzdlk2ZHNKM1lrRnNYMlZjOE11?=
 =?utf-8?B?WDFZYjFPdVhSZ1lsN25jMHhXL2dhdnE0cjNSSHBGbW8wejNCR1hwZ0xoTmlt?=
 =?utf-8?B?eWNRVjdRVWw0T0FDZUo4Z2hTa1hDeWxJRGthLzVFSitXYjdabFFLN2gvY1Nx?=
 =?utf-8?B?QlNTZzBWYkIyQ1JRdmhzNkR0OXJXcktoSHVDOFBTRXRkaTFSZVd1cndsM0dM?=
 =?utf-8?B?ZEZ1TGwveGs4bHdaZGhZVWxIc1cvOUJBOTUyeTA4cDkvZXBMNHJYS29QbEsw?=
 =?utf-8?B?SEkvSGQ1QWNRZ3FQd2N2YUJ6YlZBWWx4RDV4Uk15cFY3VUt3OVVFdS9VRU5V?=
 =?utf-8?B?SjBzN2xzYjZmZGxIbWllM3MxRDc4QUNXWGI0M1hRaVdaRmVzOWpLYVZybzJD?=
 =?utf-8?B?dUNtOUV1MXYyMDBhUFFQMHhVUmp2TXRCQUtuajZuVE1jNVZHVklVWUUwZkhH?=
 =?utf-8?B?TlJUUFFNdHlEN25WbXFpa280SFhsZ204SlYxdGVVWm1NcFJuWlFTNTdQSWJP?=
 =?utf-8?B?Smhqd1Y5N0x2bVVpZW5vTDZ6NHJNdGQ5L2V6MXBCOXZkQ2NFZC9KSlBGK3Zz?=
 =?utf-8?B?WEEzNFpkUlhlblg3VUFGOUpaNlg1TzBOeFo4Z3NzSk5PdmIvZExuNGx0d3Zw?=
 =?utf-8?B?QmxrdUVubTBRNFBrRGlVdFpKNmJuSGsxUWdDbm9FUFBsVFlydEE3TDJJR0p3?=
 =?utf-8?B?SFM5MnNZZHNmL3FqM2l1dlVTbEZuOExWUzNNbkdKdTJWOXMzZ2NOWHF0bnJJ?=
 =?utf-8?B?Rmp1TllBNTIzQk80SDA5SUFTNHdjeUNUQkRsZDNnTW9hVXdRbUh5WlZRaTdQ?=
 =?utf-8?B?dGkzUmpnSlVUTUp1bUNidFgrb2gxSlNRTjdxODNTRjFuYy9QWTkyUlJDM1hm?=
 =?utf-8?B?Z01iaDVkQ0d3NFR0aDRFVUwwaHJibGVrcURNMTJKLzM5cXF6ZEJlYmptUHVP?=
 =?utf-8?B?cDJYL3pKUjIvWWdySDBGYS9uTStRL2RLcENHY0lwYjZCZ0JSZERvM2xlVUp3?=
 =?utf-8?B?UWowTktDMk96K3BqYTc2c1oyYzE3T0ZwRmFvOUJ1QnljZm4zL1R0Q1kzcG1Z?=
 =?utf-8?B?S0o3MVdnOFVONjNrbHcxa2Zhc2gvbzJGeGhDc0RhTWJ4ZWFUTzhPZ0RzQ3FF?=
 =?utf-8?B?a082MjBuK09QMDg1eWZMTUFETW1GRjNQaEF2QTl6MlpjalRLREgrdlJHQTI5?=
 =?utf-8?B?ZDUweE51T0FnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WHdicEZndm0zVkZtb0JVS0QvSHh1bHZNemsrQW43ckVjNTg1TkM3dVIySVRu?=
 =?utf-8?B?UTI4ZXdSMmhnR1BXVFFYTy9jSllFM0V5b2pURzQyWEdDUCsxYWtWaU4rVXNo?=
 =?utf-8?B?VGRSbmc2Y2I1VHhiZWRPR3lNR3JYSDVVVmoyZHBST21LMUhvejhSREduWGxQ?=
 =?utf-8?B?dW0wbjBFcDcxTGN4ak4yaW51NTk4QjdDRjhPRjJOWFBOYUlZUW0yZTQ2ZGtt?=
 =?utf-8?B?MEFGUGg5NWd6bEVzdE5vYkxxU082WER5THVFckxGMXVXaURNVnNFcVc1RnNC?=
 =?utf-8?B?MktpZ3I2M2k5MitxQ1o5KzhmYWNFNnR6Y2FhcXBGaWJoZERhS1dVNFpWQUNV?=
 =?utf-8?B?ZW1TT041MVFaMkpZNWVFRGs0V1B0aW4vNnhHNkRlSllnWU9ib3ZLZmJTWG05?=
 =?utf-8?B?ZkFNVmZzWWY1SzIrRmljS2hidCtzdU1aQ3Y0dVd0cDRzTlhoYjhSVWhEdnM5?=
 =?utf-8?B?MGtTYnlNNVlWZG1uUWlyQ3B6aDlZdFkzRUUvTkdKOXNZeWJadkg3Unl6cmlR?=
 =?utf-8?B?V1NxUjhkbXJxVVY2UCtpQTlzOGttcms4TU1MODRiZTl6c0Vqb2FGMEROUWUz?=
 =?utf-8?B?bjY4aFQwendWYnV5YTVDQnNRd0tZUklzMUxDRzhGM3ZOTGJzR05PcVJMc0FO?=
 =?utf-8?B?ZTMxa0xXWjV1cVg5VlNJRkxPS3hSQ0F0aGx0bDFndUgxVkhoZlI4ZHA1UE45?=
 =?utf-8?B?ZmkxWVMvMm1oRlAvMWdkbnpybkNkbUErbGlzYm1nNVNvU0tVT0ZwUUZoZDVJ?=
 =?utf-8?B?ZkpRZVJXeVdydnlBOWNXeDl5MlBYczhhbHFRSy9HeTdHWkg4NXJMNHk5aDhT?=
 =?utf-8?B?ckh5Y2haZ3FqOFNjbzlMQmtSRUZxaWlyT0J0ZXRteVRLQWc2SjlpQUxxaHc1?=
 =?utf-8?B?ZlN0T3FFZnR5aHlCRmUwZ3ZwMkxvYmw0N3cxcnhsSmxsbUoyS2ZVQThZV0Qw?=
 =?utf-8?B?a0pVSWluYXQ5eklsYW13T2lhVjRubDc5cHFKTUsvc2ZjelNmc0pWK1l1ZWZ6?=
 =?utf-8?B?d1ZFYUJFbHplbXJhVjMya21BTStBU0dITm1JTzl4U0svb1R6cURtM1RjNFh3?=
 =?utf-8?B?RXY3U0NZU1lUSWVDM0NGR0tha0dreFhhL3NaR1lDUU5CbXJ4L09aSkZtYlI5?=
 =?utf-8?B?Wi9UeFNSYTU5QVZJVlRHRFRHaXhmUW5FK1dqamMzV1dOSTdZNVo3K0cwMzJa?=
 =?utf-8?B?QTdNU3d3cXVLZ0QzOUtHVzEwckZvNWNHamlzdkpCTzNWUmpiZW56ampRZGpF?=
 =?utf-8?B?cmR3VWxabnNuYzU0OFdFSXNnRElrbk1nZ3JSKzg0dGtsM25KUVFadHdVMkQv?=
 =?utf-8?B?eDc5bGFSZDNJdnFIQmJZdG8wWEpkbkFxV2ZyaGZ0NUExZVdXMDZhbjM3a0hX?=
 =?utf-8?B?dkY1b3lKVFkvMDJEMG5jYWlYTlJ6WVl0eEl0dEcxeHhoWTNkbUhYMVFwaURy?=
 =?utf-8?B?Q3oxZ3JDYUg3VGlCWjY1MTNrYW5PeFVTbGdNQnJtSU9vdmpYOFhvSGMvQ1Jy?=
 =?utf-8?B?SkJxYklkRE1CQ3l2d2dnOCtEeUJ1TUJwNnN1ZE5zTFZlenpETkN5cUFtZHhz?=
 =?utf-8?B?MEFMR2hkS0w0R0tpQk9kMXBkRGpHMWFBbVE5SFczTFZCZDlYc0NSZyt6K01K?=
 =?utf-8?B?ZEsrdGJiRmQ4MVNXU1FEVlFCV2x4THNBTXpWcmhlN29JNG93OXhEZ3M3em85?=
 =?utf-8?B?V2lyaTd6eEpjRnE2N0ZhS1IvSWh6cXRyNFcwYTU4OEVwbWJFM0NpTENLcFp5?=
 =?utf-8?B?OXcyWm9JNXVUMFkwb1U5dnFkZGhBaERSdnBlY1NOY3Z6NktGWHAxUklYVGth?=
 =?utf-8?B?VzNwM3BOanA2QjJGUDlRdk93ZnZJdVRKcVlGVERoaUdWem5vOGEzclJpUUEr?=
 =?utf-8?B?dVo3clp5UTlPeDhwL1Nrb2N5ei9iaTNQWkdBdVJ6a05RQjNRcHhuUzJKUU53?=
 =?utf-8?B?K2xoOW5HY05tZ2ZhSjVWb1lMSm1tN2lob0NWMmtQY1BkOCsxeVd3ajFjVFBL?=
 =?utf-8?B?SGxYNHlxM3JPY1ZqZ2J6aUhHUlhOMEN4QS9DbWZwaGZqdWFUL1VMT2VBSUI4?=
 =?utf-8?B?anJmSjFPSm5XU091Zm84L2Z0aFFGU0E0YUx2a0duZzZES0dEOC9BZllGMWxy?=
 =?utf-8?B?UjZ1RW9xTWs3OGJWWWVrM2J0UEhPeUpUcUZUSldFYmlwK1lxSXQraGd3QmhH?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6A48C67B7A653408DA848507C50CE4F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1972de-4f9e-4e1f-a08b-08ddeba21353
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 10:59:09.7893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xRnmMoxTiL1Y/Bik73wBNV4leVqFIcoKTmnI3A1jpZA0xV4+9Di7rWjyUolzwVcaEt1dX39PlOwwwPLALxdd10ctptSxd/OKBysq7+DHD3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB7621
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 10:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222917

T24gVGh1LCAyMDI1LTA5LTA0IGF0IDE1OjAxICswNTMwLCBLYXZpbmF5YSBTIHdyb3RlOgo+IEFk
ZCBGSVRfTElOVVhfQklOIHZhcmlhYmxlIHRvIGltYWdlLWZpdGltYWdlLmNvbmYgdG8gYWxsb3cg
Y29udHJvbAo+IG92ZXIKPiBrZXJuZWwgc2VjdGlvbiBpbmNsdXNpb24uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogS2F2aW5heWEgUyA8a2F2aW5heWFAcXRpLnF1YWxjb21tLmNvbT4KPiBDYzogQWRyaWFu
IEZyZWlob2ZlciA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4KPiAtLS0KPiDCoG1ldGEv
Y29uZi9pbWFnZS1maXRpbWFnZS5jb25mIHwgNCArKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL21ldGEvY29uZi9pbWFnZS1maXRpbWFnZS5j
b25mIGIvbWV0YS9jb25mL2ltYWdlLQo+IGZpdGltYWdlLmNvbmYKPiBpbmRleCA5YmU3ZTQ1MjM4
Li5mMzlhZjA5OWFiIDEwMDY0NAo+IC0tLSBhL21ldGEvY29uZi9pbWFnZS1maXRpbWFnZS5jb25m
Cj4gKysrIGIvbWV0YS9jb25mL2ltYWdlLWZpdGltYWdlLmNvbmYKPiBAQCAtMzcsNiArMzcsMTAg
QEAgRklUX0NPTkZfUFJFRklYW2RvY10gPSAiUHJlZml4IHRvIHVzZSBmb3IgRklUCj4gY29uZmln
dXJhdGlvbiBub2RlIG5hbWUiCj4gwqAKPiDCoEZJVF9TVVBQT1JURURfSU5JVFJBTUZTX0ZTVFlQ
RVMgPz0gImNwaW8ubHo0IGNwaW8ubHpvIGNwaW8ubHptYQo+IGNwaW8ueHogY3Bpby56c3QgY3Bp
by5neiBleHQyLmd6IGNwaW8iCj4gwqAKPiArIyBBbGxvdyB1c2VyIHRvIHN1cHBvcnQgc3BlY2lh
bCB1c2UgY2FzZXMgd2hlcmUgdGhlIGtlcm5lbCBiaW5hcnkgaXMKPiBub3QgaW5jbHVkZWQKPiAr
IyBpbiB0aGUgRklUIGltYWdlIGl0c2VsZi4KCkEgaGludCB0byB1a2kgd291bGQgYmUgaGVscGZ1
bC4KCgo+ICtGSVRfTElOVVhfQklOID89ICJsaW51eC5iaW4iCj4gKwo+IMKgIyBBbGxvdyB1c2Vy
IHRvIHNlbGVjdCB0aGUgZGVmYXVsdCBEVEIgZm9yIEZJVCBpbWFnZSB3aGVuIG11bHRpcGxlCj4g
ZHRiJ3MgZXhpc3RzLgo+IMKgRklUX0NPTkZfREVGQVVMVF9EVEIgPz0gIiIKPiDCoAoK

