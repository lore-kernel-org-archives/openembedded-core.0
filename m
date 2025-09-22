Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C55CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 13:54:30 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.web10.52564.1758549267593694446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 06:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=psWGtHUb;
 spf=pass (domain: siemens.com, ip: 52.101.65.1, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgaJWGcirBl9weyWcHVmGfJ2oQ6+3eUSHZqKmi/qiDquRo4H13ZaOFo1vGmRZdfpcIhILxdFhUM4w+bElhUkfTvrHfYM21DufJe/5B5cpqRsBM/nVNd8e+c3W3JrBJyLCW992zHwHcX0r6sgBF4uEp7Zkd57BqZwkQWoJ/KrywwlELBAKvutmc/w7YamUByFspi/YYF3Q4RiNzitXS8m1rSdnrW+V6cYj2plXYBgdpO6aecAnfq/I/AGiqP6PBToAMkokWP1WfQjIuIyJ2yhdMp/PTaCTnH81w7tWKAZqnETqMyCAMrgd7u9lX3sZIEdbAaHRrgOPMGVbegWKeVdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRtA5xOqaeNZTTTvyPJL8dOFlL445EEgR9aVfpnolto=;
 b=CAOhcPpGuzsnY3QuYc+7KFXoHCTfLo9fGC6i3U67ngIIi1699XxftAEk/viKCp+hPv2u+8ZC9yJslMZXiNFnPrpiXxfWxbpSnfYiRJKpn4xc2JgPqo/bqaLjqdP8EaFr0rheMUb7k+oi6aWDKUId2BPwa8LFS/ZwJs++1hJBnLhBNW5pTqeEK4b3KsS/EHHWT1Tn+w0lmMH5j9DSgA1/ReI1xI/MQ2SCShSVyQMMs9hB4NoSGjJFEfUbF3JZKJ71NRND7RCeiTt4dxEaOqjO14JjHkw6a3W4rlxFNiV59kJ5aZtqeiw5cJulzbiXc2k62QrKwPQU0xcZLoVDTdbkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRtA5xOqaeNZTTTvyPJL8dOFlL445EEgR9aVfpnolto=;
 b=psWGtHUbeq0wHIl5Z88FRPVmC/Pxv0cARcoR7koWGrjUSOa3co038uvORiWjG6qkzOIsYFLfjKNhAFbWiwvkNCtOA3ZeNrQLIntLnbGfFNOQ3bcHW2yr8CcB5JZeR0+Dt4gcsyAiAG1lPh8OQNY/4XLfQp6h7NXDkK1Ks7iGknWlJB/cToNLhkFjgWce7lV5YeUSHH4gSI8mqADBsPWhVE+jBDod9ppdpm3pj2YauDfiSZD+48LvBIU2dpizRPX+A1QBfQkktAsO+22bl+nweU7UvbOAC+IYTXho5HVw6Q39+n8fhtb/lpKDHDsg/3Sbr4uYhe8eU34pGFzgv0hnzQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS2PR10MB7048.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:594::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 13:54:24 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:54:24 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, "Marko, Peter"
	<Peter.Marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH 1/5] poky: bump default kernel reference to 6.16
Thread-Topic: [OE-core] [PATCH 1/5] poky: bump default kernel reference to
 6.16
Thread-Index: AQHcHn+CT0/uySgwXEWM2SQUTMWYW7SahqCAgAAD5PyAAAHtAIAAArEAgATErIA=
Date: Mon, 22 Sep 2025 13:54:24 +0000
Message-ID: <8f537cc82b3a42d0f9d960992926a36eca4ca066.camel@siemens.com>
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
	 <0074b1cd80c242493c1e50d9ff58cc4427272a50.1757088383.git.bruce.ashfield@gmail.com>
	 <AS1PR10MB5697E637960455A217026DBBFD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <1866AF8ECC88AFA1.22280@lists.openembedded.org>
	 <CADkTA4NRGBeFNS_UE4YYOXh+RFPnTM8QoZYMizUAsD_d9tHKww@mail.gmail.com>
	 <AS1PR10MB5697EA7DF788318E41839751FD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <CADkTA4OFS8WJmggeqTRMwQbifmanQxGxtJos8FEzr_KzMev=aA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OFS8WJmggeqTRMwQbifmanQxGxtJos8FEzr_KzMev=aA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS2PR10MB7048:EE_
x-ms-office365-filtering-correlation-id: 9c6c9a7a-84f5-4585-6bbf-08ddf9df8a10
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RGNnWVRBT0lpTmJNSDdqZG1PSlZTSTJ1MGNIMEg2V1d5c0FIcGswR01rdm9M?=
 =?utf-8?B?UDdLM1B3bnZjMVl2b003dHJCWVlwYllsZXpjWGNJdnRoL0dOQVJCMHZIUlo5?=
 =?utf-8?B?cDVHbk5HZFlyNlVDZGpVc3Q1aUhFeHFET1Z1WE5MMW12MGUrUE56d2FCaUVJ?=
 =?utf-8?B?V0VrODZENFl6M2FtNW85Zmp3Q3gxZEphNm5KckxoRUZNS1B1NjdMNXh1Qzk1?=
 =?utf-8?B?MVVkYkFyaWNFWGJFNTJ0SDRoOGQwUTJWUkFCWnZhME5CdjVsdlljT2l2S2Ny?=
 =?utf-8?B?MDZ5U2xMNFJ2WW1KQ0tqWlJkbnp3eFlyOXBNRWZHYW5qa2Q0a2ZBdjd0UmVY?=
 =?utf-8?B?dWtsUk5DV2F4b1hUU2dJOFZkczVja1hDaTlYWkg1NWhlRjNpRVRVTUhGUWtT?=
 =?utf-8?B?Q2lSZ0dvMDN6bEh4QnVnUndIcDVRK2pIVEtlYVpWMGdyaUpEZzRFTTdxQlFz?=
 =?utf-8?B?Z2dNRjlUTlVNR2xIeHdmcHdMWFQ0SmhURzc5NGJERWxSa0tLNXZxMTUyaGJH?=
 =?utf-8?B?Rm16VVJ3NXJSRThXWElsVndmSFhqQWxoK1RCLzhob1pGMXd3UlBCWGRqMnhB?=
 =?utf-8?B?SENQdzI2YlpySUU1OWRsR2lEWU5rT282bFAxa200R1dSRkhVa3pPM3NyeUNR?=
 =?utf-8?B?SkhvYkJpTGpmOUkyWnlQN1kveWFvVlhCWUUwTW44YkE4Z2xRd3c4MWVUTU9K?=
 =?utf-8?B?YjdTODRlcmJhNlhrcHZUNzhDVlNzS3hpMkJ0RzFXVXNWTkVzc1VtSVJmSDR1?=
 =?utf-8?B?VFk3eEw5NzFPb3owMjBCTXdQQXhDZ3p4TitFYjUxbVpTOWxSZ0ZVL2dJSk1V?=
 =?utf-8?B?djIxNXNKWS9aOXRnc0V5UUJKc01ya0J6NEhBb0JSbCsxT3FuR1A5L25BZmRw?=
 =?utf-8?B?dWkvUFpEM05FMUFDbnlOdDg0QWNQbmhxZmJ4NUdubnN5SWtjaENEVlMwZldu?=
 =?utf-8?B?L1Rad1o3NXJxUGdScmlLV0lMeWdoVWwyY21ReE9ISVhGMWpDcTdhb2lYeFhU?=
 =?utf-8?B?M0o0dW1Va3dsZVQ1dUZlQnIyemV0TU84Qk9jdmM4RGxwV2NteVFMQzZpM2dZ?=
 =?utf-8?B?bGVsVnAvd0hGdFA2OFVXQmNDMFhSM05DSU9pSStackN6b2xKbmRHMno0K0NZ?=
 =?utf-8?B?ZWNES2srTjU5RzNtQ2Z4dzJTKzV2Z0xkbDY5aHlQb2NubTFocEI5cFcvZ0Jj?=
 =?utf-8?B?Mndvc3dKblRyV0l5WnVjR2VyT0xzMmhSVk45d1YxR2tZNTVDZFBSZHNFY1Zz?=
 =?utf-8?B?WU9sR0gwVEtTRlFWcUdMelM4eE1QajJTcU1QRlpWL0tJblA3WkFrSXRBQ2Nt?=
 =?utf-8?B?bWJScnRJVisrcktDelh1akdIRG9ISVF3Y2J0UmdFd1hXLytHcmROWWFlT3FS?=
 =?utf-8?B?Tm1zQUNRbWQzZWZaa0lmdnM2UGdqSUs2QmxyYUdXS29UMmJzVUpjQ0hNNEtJ?=
 =?utf-8?B?YjBKcHNtamFvRXNUVW9xSUxyb3FsOTVsb3hBV0RLSzMyZ2dSS1oyeTJJMDhS?=
 =?utf-8?B?a1ZNUjFEcnFuL2JlZURRSUZaUHQwUGlTNFRsRFJnc3RETGJxUGd5OGc4N2xP?=
 =?utf-8?B?ZTNvS0UwOHJZbVBIQ2pCdy9KM1VNK3RMOHhZV0tOOVVBSjhNUllJZjlqWDN3?=
 =?utf-8?B?dXpmTGRCKzNIbFk4YSs5WGVreFhSbjRrTFl4bjBYeWErei90bmFyS0VTR2p0?=
 =?utf-8?B?cHhmaVFteEV6MVJCY3FNcUlCZi81RmJSbEFwdjFzWEtocVJXNjNKZWlzSkkz?=
 =?utf-8?B?azR3b0ExQTdFYlJYbG53NHJtb3hibzByNlF4RXFvQWtjbEhBbzlDd0NuUmtU?=
 =?utf-8?B?SEVGcndBN3VjUDFJeDMvNUJaRldzNU9jSzFnTFJBQUw1aUpKMG0vL1pJc3JK?=
 =?utf-8?B?MHFYbDdIRWJaZWg1UExEZUM1bCs3bmZLSitRcEs1S0pkbWVYeHVObTM5VmZP?=
 =?utf-8?Q?PZhtrFxaOBo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MWdVcGFDNkw3aW8yOGlUMmVRRkJodS9GZmVtVXJXN2FibHQ2Z3pHSEI3YVBI?=
 =?utf-8?B?RzVBRkl2b3hOTkF3dTQwM21qYmJWcEg0OGtjd25BR3FFSzlCT0Z1U0ZLUVBz?=
 =?utf-8?B?Q2pYdDR6TGVPaVlRQS9ZcTErcUlaWEFnbVd3R2xQNGdHb0xoenVYczhwTkUx?=
 =?utf-8?B?bnpkc05FWUdXU2dUNHJqVC9tZ3J3TVBVR0l4MlFBUlJCa2JvVTdlNm5hVzdQ?=
 =?utf-8?B?NnFKMSszVzg2dllRZFFxc3VSNXJkMlUrTWxoS1FHenFrZ2dvdTZVSjZ5amNZ?=
 =?utf-8?B?dlBxLzV3R3hkMklMRHNJWUhvUlRJSk8vNDl0QktuWEQ0QzhLRXVTcm9sM3lH?=
 =?utf-8?B?SktwQnR1Vk9SN3pKWUowVDBoTlRkRExLSXZNVmNuQ080d01xUDQ0d215aXBz?=
 =?utf-8?B?Y0dJaEI3MkoyRXBrdzhqdkF3bGt2WWtJZ1dxMzZwMWE2K1JpOW43aTZ1SFRt?=
 =?utf-8?B?QklHc2JEY3cwUytQRkpZYmZ6STkzOGJNODZuQTlyb0xhZEkyaEthdjZIcndq?=
 =?utf-8?B?dlZLY3dJYXRjNWx1a0t0dXk0ZlJOemtGUzJ1a25USE5EcXVZclJmT3E2M0Vo?=
 =?utf-8?B?YkMrU3A3SEdMZ01xYjBEUkF3c2ttRXBjMFVYK1cybFlLUC8wcHh5UVBCQU9B?=
 =?utf-8?B?eWl0NzdlN0c5ZUxjQ2oyMGtoWXVuSGM1bnJ1c1I1OVBwUzBoYXRySERqY01h?=
 =?utf-8?B?OWlPSWVmNlJtZ1d1RjRZTlI1citzbkpsRDRzT2wyQklOb1VhWkpGZlhDOTZo?=
 =?utf-8?B?bUxLN2RySkV0NzVpdkFsZDdhcHZCQXZtYjBzaWIvZkxVYk1aTEsvUkJsRm1u?=
 =?utf-8?B?T1F3Znh2bDU5dzE3dTVYRWtVRnZCSEt5SUlZRmxmUlF5eGNuUVY4dzNaVzdI?=
 =?utf-8?B?dm1XK1pxc3pON0wxMjh0YmFsNUluNUg4MEo2TUpLeEJmUXNFSTRscFk3QUtO?=
 =?utf-8?B?Z3MxcURTMm81VmxXWEFnaWRTdGhnNVdJV2JuSzU5VFczUFdLVThRUmZ6V2Fk?=
 =?utf-8?B?bjhJOUNjN2F0TXBFK2hTTW42UHZUR1JCVlp5c3BZRUZzaUJ6VjdabUR5NlI4?=
 =?utf-8?B?OHgzNGt5Z0dPRXRucU5iZUE3TThTNVZSQ2t5c1R5UzlXWW1mSGY2Y0hpMFVa?=
 =?utf-8?B?dnh5dHR5RlNiQkg1WDFBSnRiT1BCc1VqT1dCLzRRM0NoQ2x1dDNZQ3VkdEJs?=
 =?utf-8?B?bERENlRrY1pXaEFIb0RGV3JjVURreXFzZHpsdVp2RHRueVJBZE5XajlaVHNU?=
 =?utf-8?B?cWFQL2UwcS9yaG9RTDFjbUtUT0VTa1VoL09NbDFLa3FDcnhGOFhudVMwQlJ4?=
 =?utf-8?B?WmVWRWFyRHBmNXU2U2c3UXVKSklRbytBelhqNXlEbVZhRU9oQ1VYdXBaU2g1?=
 =?utf-8?B?a1FvTktJNWtOVE5PbFM2NHBkaW1hYWhHa3hjUVF3alhzWUVxbGtwSEFsR0o0?=
 =?utf-8?B?ckdpN1Z4Z1RoUWxtR1NFT1FwTGM3RExIbURoRkMxTE80VnpmejlFRTV1T1dH?=
 =?utf-8?B?QVJVaUNnWVNQUHlENGFpWks3SWMvSHR5TmRGK2gxVjBPQ0RaZjVmMkcvb0tG?=
 =?utf-8?B?U0RlaE4xam1GejNjNm1JSFpucWJ3YzRZTFZKZlZISERuYk50WnlsWTFjVVVn?=
 =?utf-8?B?ZldHYWlQQW50MXJWVVd1K3VRb2FQVXNMelZZWmN2dURUNGZBT3RLWGVZU0xZ?=
 =?utf-8?B?czA1VWpYNmhrN3hVdDVGVzdEMklGczMreks3bncvVERNbDVQY0w0cUlzcTJv?=
 =?utf-8?B?UmZVaHg2SWhvQmFKVkhValVpTmMzSmt3OVJJTVpKTUpHMytDb1dqd2RXZE1Z?=
 =?utf-8?B?eGs1azFuM3UzNTZXdGx5TFhKK2lQOTQ5b01ZeXRMUmxFVkY2akwrZklXOGtj?=
 =?utf-8?B?N0o0UW5hRmRMS3V2K2RDanhnbkpuaWN4YTROa1dGVjFiZ3VhNklYR3R5OC9z?=
 =?utf-8?B?UjZkY2t6VFZxVWlqMFIyNlQzT1FjYnVFWk5FVEFKZFB4cWpLSndpalFWYkNr?=
 =?utf-8?B?aEltYk1YaWh2SXV5MURyN1NuTVloQ0V6ZnVkM3IweVUvUWYrVFREejZtZXQ3?=
 =?utf-8?B?RVpqbFFJRGdqKzdnNndRSkl1ZGdGbmRFaXhtSkQyRWt6bnFwTHF3dzlPN2tr?=
 =?utf-8?B?eHgrbjZHVzJDeDU2bkRaU1JHbFBVWUlGWW1jNnpRM3dnQ0RQRGFXZHQvOFJL?=
 =?utf-8?Q?1HWkSzqm7tuZQ9IP/ovLxTo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FF7DC08D98F4D43B6DDF6FA74B6A31D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6c9a7a-84f5-4585-6bbf-08ddf9df8a10
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 13:54:24.5216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tm93CsAm9BLM2XqLVcSbhshpOpAqmzKVbPNLm0cQsUgwUeHbu4ZuLxaNyJ2QoSjaVOqog/eXm8L/tXXEyUi4j3sprXzj7aTsdD/i2Wpg1do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 13:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223822

SGkgYWxsLA0KDQpPbiBGcmksIDIwMjUtMDktMTkgYXQgMDk6MDUgLTA0MDAsIEJydWNlIEFzaGZp
ZWxkIHdyb3RlOg0KPiA+IEnigJlsbCBwcm9iYWJseSB3YWl0IHVudGlsIGl0IGdldHMgbWVyZ2Vk
IHRvIGtlcm5lbCBtYXN0ZXIgYmVmb3JlIHN1Ym1pdHRpbmcgdG8gbGludXgteW9jdG8uDQo+IA0K
PiBUaGF0J3MgdXAgdG8geW91LCBvciBJIGNhbiBhbHdheXMgZ28gdHJhY2sgaXQgZG93biBvbiB0
aGUgdXBzdHJlYW0gbWFpbGluZyBsaXN0Lg0KPiBXaGF0ZXZlciBpcyBlYXNpZXN0IG9uIHlvdXIg
ZW5kLg0KPiANCj4gSSBkb24ndCBtaW5kIHRha2luZyBpbi1wcm9ncmVzcyBwYXRjaGVzLCBhcyBt
eSB3b3JrZmxvdyBjYW4gaGFuZGxlIGl0IHdpdGhvdXQNCj4gbXVjaCBmdXNzLg0KDQppdCB0dXJu
cyBvdXQsIGl0IGhhcyBiZWVuIGZpeGVkIChieSB0aGUgdmVyeSBzYW1lIGNoYW5nZSkgYWxyZWFk
eSBpbiBGZWJydWFyeSENCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51
eHBwYy1kZXYvcGF0Y2gvMjAyNTAyMTgtYnVpbGRmaXgtZXh0bW9kLXBvd2VycGMtdjItMS0xZTc4
ZmNmMTJiNTZAZWZmaWNpb3MuY29tLw0KDQpCdXQgcmVtYWluZWQgaW4gbGludXgtbmV4dCB1bnRp
bCBub3cgKGFuZCBJIGRpZG4ndCBjaGVjayB0aGF0KS4NCkl0J3MgNDYxMDRhN2QzY2NkICgia2J1
aWxkOiBBZGQgbWlzc2luZyAkKG9ianRyZWUpIHByZWZpeCB0byBwb3dlcnBjIGNydHNhdnJlcy5v
IGFydGlmYWN0IikuDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cu
c2llbWVucy5jb20NCg==

