Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BF4C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 08:47:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.65])
 by mx.groups.io with SMTP id smtpd.web11.3729.1722847670298093549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 01:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zZeIfyo+;
 spf=pass (domain: siemens.com, ip: 40.107.20.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQND1ZWo1JV4X2P0S0K0JFTuEnhGCr4IwE3gQYKT19TTvR2CpTwEAjy4ueODyK2gd2kznam7n+uVz6WxSZsRTFYD3OL5ehVWuhZTL1hSLkcjc03ptbajjvyv0n41rGA/9J+DAOU5oSfsequmVMuhgoJ0wtLKPjq/1IDzN+83KqqpWKjoEBqUv67uDHsBVES9wG4l0vzcZFiACL6VYV1wxfamsaH+a+bONtWYCdBNt/pN6ZoqewlE4DAwKmvDo3TFp/fuz8a2knB8tJ0uuRD1sS6aNshmv3sIn6Cc71Q4guHr3Vy1ohqnqjfMFR8EHArW8SznGoo26XZOV2s+XBiyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMg6VpmphCJSoxsiSO8owipBMVggHCXPfbsll4YZaX4=;
 b=ZBqFnfPlTWKwEOyqnTr+nq5g6YDNd2htReUWzvKTeIB7Ru9oa/T9G4hogifwOG6yJcUPNQ/Zfk9aKp7PFPIcgk7k0OqT511XqHqGWYTRvJaNe8bNOJ13KuL86SFV0/eCfdCe9J+td6KcKyCMFHzj/3lwrpHbYCxN/8IPJknJe4xaP4eE+rMXaOpqxnRSnv6ySK9z79SfxzPABhRlToqb6XT7L4ab6+zA8l/dIci7gh4+vcEPN/mVwtaveFtjWnFeo3KxajmRDgF/LGEwk9CU/Rd5G4WQpN9f5Nf5fVgQKjgEZDK9gfRzu5h4Mn7DHp6+W0ySvsKnlo9kCJbRAINOzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMg6VpmphCJSoxsiSO8owipBMVggHCXPfbsll4YZaX4=;
 b=zZeIfyo+QqveIlfbilYNOwDale/ymGVCIrtjlnjZ9Ul2IcFmiHZnCuVC6PnQlgf3SOyNdGLWxGjaNtviklms1eKwznDURvkCNtR3UBpzYQBWDn3wnWKSf21yUPaUBENCNteIExrPsw3uZgEQEgCRiD43b9AuzQL7jqdO4vhPMbWmcxPcDf8DTINVBOR8LKY8UQbPJuAc6Jn6X2lcfgMUbAzl40bWDLFSCS4sdG5ULy3rqJfJS8j9LiowXq2Rc2VX1m1sapWQQ3fI7p0Cd0bqYLwscR5DunBq8eaJR2ilbDi4xNyxfoxeMz6oQVB/Z7HrK1LXveFCb7ctL0hxVysDIw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PR3PR10MB3916.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:48::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 08:47:47 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 08:47:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap 18/18] rust: Add new varaible
 RUST_ENABLE_EXTRA_TOOLS
Thread-Topic: [OE-core][scarthgap 18/18] rust: Add new varaible
 RUST_ENABLE_EXTRA_TOOLS
Thread-Index: AQHa5pFbFRadFYagK06dXb9O+vDfUbIXnn+AgAC8TlA=
Date: Mon, 5 Aug 2024 08:47:47 +0000
Message-ID: 
 <AS1PR10MB56972C3696EF9F76596EABD7FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1722790925.git.steve@sakoman.com>
	 <136a25567499191b23a4d000a06bf83a473224ca.1722790925.git.steve@sakoman.com>
 <76a9b1972d61073056cfa0b3a181c3b876269eb4.camel@linuxfoundation.org>
In-Reply-To: 
 <76a9b1972d61073056cfa0b3a181c3b876269eb4.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=1e986067-defc-42bd-a137-76ef4d1bdd9d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-05T08:46:31Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PR3PR10MB3916:EE_
x-ms-office365-filtering-correlation-id: 325e50bc-52c8-49a9-e315-08dcb52b47fb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y1Q3YTNlM3k0VEk0WDZ4eHdmZFJ1T25WLzlRZjhZREFxaEN3eDRPNWJ6YXhR?=
 =?utf-8?B?NGNtOFZnYXBCSDlYVXNXSVl1MUc5TmJrRzRiMnNUTjdnVlFrc1JuRjNWRmpy?=
 =?utf-8?B?V3VybURPd3RpTXh6cy91REZBRWllWnJ4Ui9mcFNtNTJxM3FnWUI2T3UvYnFq?=
 =?utf-8?B?M2dZYVlTQnZEelg3TFlqZU1pR0c2cmZHWUVWUWhMand0VEdPMzhMbVhROVla?=
 =?utf-8?B?YUtKVU0wcVUzdTU1anovRTd0cTVLZzkxTUtDNnNTeTE2LzVlZWhmZUpySVMr?=
 =?utf-8?B?Q2M3VHJvREJyTG9EQU5oS2w2QzhENkFVaUwvY3ptVHNZU3lzUDMxUUlQdGNI?=
 =?utf-8?B?dno4cmlycGgxOTErL09xK1psb0g0QU9EVXBCOTZqZVJvNkdGNFRjMDJPUXNB?=
 =?utf-8?B?ZEVCUzRyV3IwQmRkK1BvZEJBTGRQRmlrcWcrQWdUdVFoNEVpdTdUam44SVd1?=
 =?utf-8?B?dUZWWm1tRjR0TUxUYWRZSjI5d2FyNmY5NHpreWRjRUwrbkcxdEoyOXc0K0tQ?=
 =?utf-8?B?SVZES3hQZk04RFVrSVlXaXVoRmhxMlVuSDdjcHMxTGVUTzdQQW1WbVd4NGdY?=
 =?utf-8?B?UmdOVnBhTjYvTXYvRDNwelA0cUg4MC8vKzBLeVVzQ1M0WlBaR0psak9FQWdn?=
 =?utf-8?B?bUVoelNWVXFaNVp0SWxJNzI4V0l5QnBNR2gybzFuSVBXRFp5UUtuTlBwbTRa?=
 =?utf-8?B?dGNTVDR4d29DV2l2eG1MMm1jejQxUHB6S1oyVEZmSkVGOHUwbXZCeHFrY2xZ?=
 =?utf-8?B?VjhwV1ZzNXEyVTJzUGFmMFlHSnFJTXpELzJKUFFEejBSR0hKNVZCMDhmcFNT?=
 =?utf-8?B?VVRqMEVxdk1lV0p4bEFqWFYwbTBSQ2txNUE2L3JuR05OYjF2dnZqa1lpc2c5?=
 =?utf-8?B?MEZHenltQmpYdE9nWmEzR1krMmdpVC9MK3hDUU9kWlBqMjc5YVZZcmNSS1lW?=
 =?utf-8?B?R1oySkZSekRlaGtqSHlYUjBaU3YzbG5hNi9GNkNVTzlKZ2FVUS9hU3pzcUkz?=
 =?utf-8?B?VjJsRUtFRnE0MmFnRyszZElqYWpYTDF4UVdocDZ1UTNwVVZRazcxaFB4RE5R?=
 =?utf-8?B?UHNwb3VLOWNrUkozbW5TM0NERUVUNkVSdjJZYjA0M2liSXlQTUJ4VGY3UEp4?=
 =?utf-8?B?a1ppSG1lZi94QXo3WFZsTEZuMlRVSEFiNmsyYWNpZFRmQnNzd1IxRWhYdndn?=
 =?utf-8?B?WDA0QnFycktkcXlKZ1JaejN6cldER1huZEt3bGlieGkxeTRtdlpLSm1SV3Vs?=
 =?utf-8?B?cStjRmgwVDJaQ1BRU1c3STF4YkhXb3BvNGdLZ3VxTmxZQnNUU3MvdnB3anlo?=
 =?utf-8?B?L1plcXd4N1BTbW0xRnpoY2NTVllwOVF6VXNIUFUwLzJmR0JCdnhwYW40SUs5?=
 =?utf-8?B?c1VUZjVsZktKWUxRT3J2dDE1blV3RStxMWFFQnFSS1RJZEJmekFPRFdEK21P?=
 =?utf-8?B?bUdtSU9wcmNWSUt1YVB3MXU3a3ZVdFdscmVId2hlRFpjZFd2RTN4dEQwblNx?=
 =?utf-8?B?NWhhQnB0Wnc5NWxhWkVkRms1aHArSXUzMExsTFdJRmFBb3ZJMko4bGZnazZV?=
 =?utf-8?B?bUlqV1RFTEIybExEcW1LOVdyRXBVVFpqMjRBdTN5QVA2VkdGdWFaNlFMNTVK?=
 =?utf-8?B?NHViOFVxNEJreE9WTFQzSHFWcjY3NEVuZ3VmZHMydk1Ub3RPV1lWU0ExZTVa?=
 =?utf-8?B?R0dhbStzakxpbW0wNlRyU2xmeEVGckwyS2JJdmFxSFdkbHEvNUs5ZjdsZk8x?=
 =?utf-8?B?MUUrOTNERmtNa1NJeTlKeFNVWlZIQjVzeGVUNGFSOE02bldaZXhkem90Uk5B?=
 =?utf-8?Q?w1D0Xroh4IxSWjoey2Jsgs9Nsp9lbfC3T2DIA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dGtRSTlnaVN2eVVzOWQva3pyOFpJbUtIeVBISTdML1ZPemNFNFFKQVZRd3E4?=
 =?utf-8?B?cWthTCtvRURnbkRqa0RYd1pRR0pkZU5SVXdCYmNjKzRQdnhFd1ZybURPK3N2?=
 =?utf-8?B?MyttSjE3STQxWU8xVWNXOTBlR2RDZFhtTk40Uk8xMWRpbTI2UTZ0MmV3OHBH?=
 =?utf-8?B?c04xbVd5bGtSYllTTVRrM1F5dDB2WEJqUmZyN1NlZk9jQk5tNFQ4WXh1K212?=
 =?utf-8?B?M2lsUG9nU0ppTWV2VndDa0FvVTRHS2l6a0dkb3I4bmREY1pZWFRzYkN6c2t0?=
 =?utf-8?B?L2x6TDVKSFl6NWFiSFhXZHhIOWlzWmIycjg5aytKVUZuUDFjQWVzbkJhamhC?=
 =?utf-8?B?T2FxU0ZXNWcwQm5RQmJUTXJZN0hYRFV1ZCtQTURzWndscURCbTlXTkppRFJ5?=
 =?utf-8?B?UU8weElMVHdBVTZNeTd3T0JNVUtHdHh6dnJSN1hMMXNxWkFUZnFXZEoyNi9B?=
 =?utf-8?B?SW1lL1dlUHdIdXlKV3BkOEJXb0cyNS91WC90UnRzTEdwemJIRXcrQWh2SjY5?=
 =?utf-8?B?ZUNyMWNpZWJqWXJNTysvRmFxMkdNVm92eGhxUkhCNHMvZ3Fxa2UxSDg3OCtt?=
 =?utf-8?B?TEwrOUp2d1JFb3BUVnluMVlCdy82TThNQkNGM2pOSDd0NEs4YnQxbVloZEU5?=
 =?utf-8?B?bHlQT2Z1eVFIVjJxQ0pHdWZ0MHhobStlWFFrV0FIUXZBaW81Uk0vME4zRWVD?=
 =?utf-8?B?VUlQUzFKVGZESk9rZ3NXVFljM2VicnJmTmgvL1U1K2xqSit2b01MWlVmLy9I?=
 =?utf-8?B?YlVYM3BWQWpaajMxeTIxRjFYTGtjY3FiYndqeUYvbFYxemRHUUlScXhnM0lh?=
 =?utf-8?B?SWhDUGxxVFk2R282VjczS0tPaHY5dXYxZSs1RU8rd3hIeVFaZExpdklld1l5?=
 =?utf-8?B?VVpHbmNRQzJCTTB5bk1KRUtHSHlnMWM3cVFRM1JKa1VNUlFsQnZQWWgxMHdD?=
 =?utf-8?B?ajFacy91K0pvdjVONmdlRThFbU95ZWowalRKL211aHhVUEhiODJqcEgrek93?=
 =?utf-8?B?NHRLVUF5eHIxOWVtTXg1NTJTRytiWmZrQzNVRDh5V1hsV1MzY1BsVm1pYU1E?=
 =?utf-8?B?amRNbWd5bkU3MmlJeHpPRUF0RjZ5SmdrNXpIckRhRXhBQlp1QVlTYmVxMGZv?=
 =?utf-8?B?UEx4SkUzRzRXc0lPcG4weDhaQ3dudk5EZzRuR2pTTXcwcVdqSmtpTnhnZWND?=
 =?utf-8?B?TGZ1LzZMU1FxL0E2WW05UTRSelFZb0JsbXZVMXpLZWF2a3ZYcWNWcDlXRUJR?=
 =?utf-8?B?bG1SMzF6YVoxWEMwQ29HOFdsRzN1TmovK2g1YThLeCtudXhVVUFiUVNFc3Jx?=
 =?utf-8?B?cGsyRGI4dmg0Rm9qZkE2aExiU1dCRWh4SnhjbUJEVmZCL1dYbkl6d25KRU1T?=
 =?utf-8?B?OUxyU3dXT29ZYVVaM1RKTTFnZEhnTlRKMUM4Ym1LZXgzN1JWT01LeDk3Mmpl?=
 =?utf-8?B?TGh2WXN1VFFYTnliSnM4Qjl0TXhSdVFyeHJnbHVVejhONGp0c2VlYnpEN04r?=
 =?utf-8?B?ZTFseS9LZHRFMlhCTjhlVnZrbElwbkZCOW51NWFIWExNVTZsQmlTVGRJL2k3?=
 =?utf-8?B?SXhabEgzU1FkdStlRHFCaXdqZWc2WnBiYVhhZE50Vnk0K0xXNGRhR3lPbDNo?=
 =?utf-8?B?dEEvaG0zbkREay80WTd5b2FKb0VHL05zc1lWWWdpb05EdmxuS1h2Rjk2MW9q?=
 =?utf-8?B?cTdYN1RRUkNnT0wyZWpjSnEyMjRWUmJiNzlFNlBIdWdLd2hzdFRFZjRlaWQ4?=
 =?utf-8?B?UFhLdUhrdjBxSEdWZEs3K1lRR0RVVUpZL2F6S2tSWmpNTU92WlpjdmhTMnZH?=
 =?utf-8?B?Qm8vc3p4OXBTSUVUTTNTa0JBeDRXVFVVekc3UU0vSkdGUUVVUkd0aE9RZHEz?=
 =?utf-8?B?RExIWFNOM0pJTDdBSGd6TzkrNUo1VjljU1h3TkVwRTBVMCtOR1J6cWVwY21p?=
 =?utf-8?B?UEdlU29hbGFTblA0V3NDU3l3UmdXRnRPdGZQZVV5UGtkeXFTelU5RzFzdHdy?=
 =?utf-8?B?MUFRZWVHL3d3bWE2UnhESmYwaVJOL1JnOG5RZTNYUnFEaVRXZjMrM3lYS0FP?=
 =?utf-8?B?aHNIWlZHL2EwTHE5LzlNbm5Od2pFdWdncnYxdU5uU3ZhZjNhSHRLN3F4STNm?=
 =?utf-8?Q?Om9/C+uftIcbIYktqEmY603qa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 325e50bc-52c8-49a9-e315-08dcb52b47fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 08:47:47.5366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltYNkuA+VBZDpq/Dfj5byHWSw9UOBWRkfuS5bA0ivMVD6PIjAh2BK0iK6RK3TMHDt5NDcczrSqBq3DzzHUufwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3916
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 08:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202987

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KU2VudDogU3VuZGF5LCBBdWd1c3QgNCwgMjAyNCAyMzozMw0KVG86IHN0ZXZlQHNha29tYW4u
Y29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBS
ZTogW09FLWNvcmVdW3NjYXJ0aGdhcCAxOC8xOF0gcnVzdDogQWRkIG5ldyB2YXJhaWJsZSBSVVNU
X0VOQUJMRV9FWFRSQV9UT09MUw0KDQo+IE9uIFN1biwgMjAyNC0wOC0wNCBhdCAxMDowOSAtMDcw
MCwgU3RldmUgU2Frb21hbiB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4g
PiBGcm9tOiBSYW5qaXRzaW5oIFJhdGhvZCA8cmFuaml0c2luaC5yYXRob2RAa3BpdC5jb20+DQo+
ID4gDQo+ID4gVGhlcmUgaXMgYSBuZWVkIHRvIGVuYWJsZSBzb21lIGV4dHJhIHRvb2xzIGZyb20g
dGhlIHJ1c3QgZm9yIHRoZQ0KPiA+IGJ1aWxkDQo+ID4gYW5kIHNvIHRoaXMgbmV3IHZhcmlhYmxl
IHdpbGwgaGVscCBmb3IgdGhhdA0KPiA+IA0KPiA+IFRoaXMgdmFyYWlibGUgdGhlbiB3ZSBjYW4g
dXNlIGR1cmluZyBkb19jb25maWd1cmUgdGFzayB0byBhZGQgb3ZlcmFsbA0KPiA+IHZhbHVlcyBh
cyBwZXIganNvbiBmb3JtYXQgaW4gYnVpbGQgLT4gdG9vbHMNCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBSYW5qaXRzaW5oIFJhdGhvZCA8cmFuaml0c2luaC5yYXRob2RAa3BpdC5jb20+DQo+ID4g
U2lnbmVkLW9mZi1ieTogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+DQo+ID4gLS0t
DQo+ID4gwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0XzEuNzUuMC5iYiB8IDYgKysr
KystDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+DQo+IE5vdCBzdXJlIHRoaXMgaXMgb24gbWFzdGVyPw0KPg0KPiBDaGVlcnMsDQo+DQo+IFJp
Y2hhcmQNCg0KVGhpcyB3YXMgYWxyZWFkeSBleHBsYWluZWQgaGVyZToNCmh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjAyNzMyDQoNClBl
dGVyDQo=

