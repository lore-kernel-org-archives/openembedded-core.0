Return-Path: <alistair.francis@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0B6D25031
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 00:09:19 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21777.1768176557393203136
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 16:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=ej34YMk/;
 dkim=pass header.i=@sharedspace.onmicrosoft.com header.s=selector2-sharedspace-onmicrosoft-com header.b=s/3uPZeE;
 spf=pass (domain: wdc.com, ip: 216.71.153.141, mailfrom: prvs=465c3c755=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1768176557; x=1799712557;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=Dv7KqVUb5trElCU0WyqbQ5i/sjYVetCS+C6m1zhV52c=;
  b=ej34YMk/xStpMrACMvYcKGuGLF9cdPuD+SOr+SfEzHtjNRQf+EOdOtmX
   qxZgPY8IHThjzt1yq3SN+eyNfhXabybfkeJ/S8kZu5oX1pb2EiuxBG8fx
   TaQWVKoTWQKfRgi4pguy8+3VwxYbOx7+tfkKdhFInWgHlbCiwwxzjVPXM
   GX0gKxVWCtupiXZZC03pXKAbciiz8RZUTX3e9a48hQN6+DMvF2YNjvBEg
   JzDfG2XG268NUN8CLtJJHkQLK++YeYr2qneYwEaOBN7oT1nLDeCCWe+7h
   K4qtCcWmyNA8vbPEdxMsBDCCMidRPxoXEudzFMLFRAo5PIV3Zz46FqvHa
   w==;
X-CSE-ConnectionGUID: lindMxfDTMyYrAjyc7HluQ==
X-CSE-MsgGUID: 5SK3LuqATFOlF+egcjrNJQ==
X-IronPort-AV: E=Sophos;i="6.21,219,1763395200"; 
   d="scan'208";a="139293152"
Received: from mail-eastusazon11012042.outbound.protection.outlook.com (HELO BL0PR03CU003.outbound.protection.outlook.com) ([52.101.53.42])
  by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jan 2026 08:09:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pvc/vA8OMaiNH9lDDDUy52t8nFPmkoQxeZpnSyMvH3duJ5v4oj8ZgFVByigTIwkj8xaE/WZy8kQwrJS4OETeFZEH2f/QCW2C/QWjBTwWIxoLRv8bJlj1RzkfrwxGzoUVS3SezqhRT+tBC0xnXUV0xpV4kOvC9BepvYP2RDoEJ1pbGfGIiDkYlmiH1c/kxLwU59OYItq39D2IsVHzlgOSh9cYeag7d+KPzUsdvne41toYJbsM/llRJ4a9KJJ+YZpfdVT/BgBJ7vULMMaUjwoCRSwDQ1Ogrr/BMrlGkWid8v2LsMhU2lYVcgkOXxIwON1fRUxPaS54hvBM/ZDoV1EPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv7KqVUb5trElCU0WyqbQ5i/sjYVetCS+C6m1zhV52c=;
 b=qwhgwuE1sx57HINA2drrnCD5+jgl4t2X6uQMshmssWzTny7mmK0XqFpas/GVXYAnTMSxzMourPc0T806s+eSJgW2PyzWL8mrl9fipvnhs1x545rbumcQlzMteY4FdcOVaxbe6k037ZSSS8KghfmWHzGk1dRVdfDli/nBsclFkWohAAx6mGPtWkf6piGaJefbKMTyfoiUntgSZunLHVsp+xhSP6zpiuqaMW2KzuOkAiLUJqToYG1jFBZ62q40BrMu2QlM2TFDoPHP2WGAq87eIcRbA413nQjcx5Hyh5K113KrroO5b5uok/08IVp2MiqqE7wW/1XZ0P8mR7WoZMni6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv7KqVUb5trElCU0WyqbQ5i/sjYVetCS+C6m1zhV52c=;
 b=s/3uPZeE6tWMuoR2o7qvoWBfsK39JiOZVX/U6LGMKirnKp5At4pXfABdv0pSmsWfQStBGw7c2QzVgt302Qe7Xmqbqb7L+VAzj8YDRH20WEjwcrzht0X6bKJbiamzGf7JhG21noRlvvQoSxZA5VfGTm3UQoPwGPtjUVWKzqLm9jw=
Received: from SA1PR04MB9849.namprd04.prod.outlook.com (2603:10b6:806:4a3::15)
 by SJ0PR04MB7232.namprd04.prod.outlook.com (2603:10b6:a03:294::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 00:09:02 +0000
Received: from SA1PR04MB9849.namprd04.prod.outlook.com
 ([fe80::6d33:c5b6:16f1:29d6]) by SA1PR04MB9849.namprd04.prod.outlook.com
 ([fe80::6d33:c5b6:16f1:29d6%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 00:09:02 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-Core][PATCH 1/2] rust: Install the Rust source
Thread-Topic: [OE-Core][PATCH 1/2] rust: Install the Rust source
Thread-Index: AQHcgSQg2VZdO1nIM0mARx3iVmzv9LVJol+AgAQKp4A=
Date: Mon, 12 Jan 2026 00:09:02 +0000
Message-ID: <a074f141eca7b2b761634b0cb3ea49aff466a1f7.camel@wdc.com>
References: <20260109045447.1933604-1-alistair.francis@wdc.com>
	 <DFJZIGTTZE9I.AD2NHXSEB2TS@bootlin.com>
In-Reply-To: <DFJZIGTTZE9I.AD2NHXSEB2TS@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.2 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR04MB9849:EE_|SJ0PR04MB7232:EE_
x-ms-office365-filtering-correlation-id: 79d1ef57-7c0d-4ab3-bcf5-08de516ecaec
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|19092799006|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UzJkQkJnTDl2alN1akt1T3BIL016UENURXlZa2dqdlB6T29uVURSd3FtOUN3?=
 =?utf-8?B?QjFHRFlEMUhjSTZraU5xdENZMUtOdkxBS2tYZW9ZZmhHbHBLSTRFUFVmUHNJ?=
 =?utf-8?B?RnVDRkhwdDZmUGZ4cFpkSkxaYlQvQWdacC93cjdTUk9JL0s0bUdSNkh6Slhu?=
 =?utf-8?B?ZFJUeGZsYmtqMFh6eUdkSXB4TVJJN1QzVGNRd0hCVHlPU0tFbi9nYkZSR0g1?=
 =?utf-8?B?aTV6NTF3VjYrdGtFMU5kK243SjBRRWFVcGhWQW55U3RwZWk5cUU2T0NJK3pP?=
 =?utf-8?B?OEp2WkcxcXd3SHh2emtZZnVzbHBtWXFiQ0hhMitTN2xwV2llTDRHdHAybzRO?=
 =?utf-8?B?L2RxR0dWZjJBMVZEd1lxK3FrR1Vya043ejRnbHRMSGgxOTdOSzUyc1hSNVpq?=
 =?utf-8?B?MW55MldPejRIOVBpcmRWckh0S2JxOHE1WDlxbmJWQTZqWllFckZWTzZUZlgx?=
 =?utf-8?B?bHZ2OThzQkpkWWZheko0UkEydkhlMUU3Q2xYZ3UvR1FwZ3hBL3JBcnMxdGNN?=
 =?utf-8?B?L28zM1YwQnFTdm5mSmN4b3FwNmhhNzFRcjJsOVdhdm4xcCsrL0YyN3AzMWVh?=
 =?utf-8?B?TkNsZEtSM2FDRUNOQWhBRFFHRk9QWDRUTStqZjdaTFZIdW5aZnhSRklSZzRU?=
 =?utf-8?B?eURqaEg2elprUmMrandHa0p3djFHeTJjTGl0T3ZtWjVkbURWNStyNzlJTXJX?=
 =?utf-8?B?R3RlK3lFRlVzNkIyZjFMRUdodHFVcmFCYURTQmRqc2JTK3RraVcvQ2lmeS9E?=
 =?utf-8?B?UThwckQ2dW5LNUtNTlVBUkpCck14TzFaclJBNlczK2cyTSs2VnIrcVl2dWVI?=
 =?utf-8?B?QTJES1ZsMFdQa0V2M3o5bjBwc1pqWjI0TGFmMnhTT3pCNVJHUDZUa0wvQzF0?=
 =?utf-8?B?emRZSTFlSHp5TFIrYTZZSGNVSWNiMTlkNng2SEhwMThsR2tFQm9LUkdRcE92?=
 =?utf-8?B?bkFmTU81eGlKQXZ4L3ZZZEZDWVpzODJ0ZDZOdHcxWk4rR2hIdWp1YW50OHEr?=
 =?utf-8?B?MlM3ZTdpVGhRYkhjNE9tekd3SDZUTEllK3JNeXpDSVJHL2diVXRwem5wdE12?=
 =?utf-8?B?WjExUUFrZ1JDUmJBM09MajlMbDFyd3E5TmpRTnV2VU1oWVJSRU5BVy9KamVV?=
 =?utf-8?B?VDAyOFZaM1RFVkNhOGFGRTRtRjQwTUVqczF6cXJ5eUIrd1M5MlBNeXdqcm9C?=
 =?utf-8?B?NG1TUHQxYnJ1MkF3aDV0bzZObEhPZVlYUWc2eUl2Sm9YbW5xamNuTFRrb28w?=
 =?utf-8?B?MDhLRi8xUGEvcWVnYVR3QmJhSVErWTV2dGx4blFwV3lleXkvVjdSVHBCMGhn?=
 =?utf-8?B?RTE0R2srTFdhaUVGVlhBcW9FemNBWFJNMDRwZU5wUGR2S08wT00wSE5xVmlh?=
 =?utf-8?B?WWpaQkZaYWJjUXpjeG9DTFZrdjhEelJLTjNTbCtCMFJIamNPZ1FmYjFFaC9q?=
 =?utf-8?B?S0dHaGxHZkY2SXhSRG5mUFk2bDBBQkZvYXBWaTNwZk1DZjRwRE4vM0F0ayty?=
 =?utf-8?B?Z2RidE00S1hhMTZwWjNEaktJZFJSRmxIOUFESnlyZHJxNUJpNEU4QmZqQWZv?=
 =?utf-8?B?ekpHcTJJOG1maFhhTnRuckZ0YnRKU1V0VlJLS0M3L2RnbG5CRytHQ0Y3S04v?=
 =?utf-8?B?VzFPaENJOHNOdXY0eUthNG9uQjdHMU56NmtmSm81cWQxQlFnOVRPbjBzRitN?=
 =?utf-8?B?bWNiRDJrTnZYUGZMYjI5bmc1T0lsaGxPZ2F4OUFldzJVdjVXWEVCdHVRTFhE?=
 =?utf-8?B?MmdhaHpkbXpja0VjT3JtdGpBbUhjMWROT2V4N3NtSWc3U0dzem4ySERtS2dB?=
 =?utf-8?B?bDk5c1JDY0ZRcnVxWlB6WE1HTjhRM1JTOEdlbHF0QW10NU9hemQ1ejJjNXJh?=
 =?utf-8?B?ZUhVSC8rUG1Pdkhud1JMMjhFb1labjRNbkpMVmxBdVowUURmc28zc3FGRFMw?=
 =?utf-8?B?VTdtTUZ5NlVzY2RZOGt6Z3VhM0JIU2JHZTlZZHUrWkZwcEdMZjJ1OUxSZnFh?=
 =?utf-8?B?ZVZvMHhNZ1NBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR04MB9849.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z0ZaSDBEQkw2SmFrclhOdEsrWDhWdlA0R1F4VE4zN24vOElQZEtOU09neDhm?=
 =?utf-8?B?MklrL1RNT2FzRmNXc0VSeVhicEdxakJ6VnlTdkJxOTNRUFJ2dEN4Tml0VWdU?=
 =?utf-8?B?YnJyVEo2NXh6YVlvV0ZXUGk0VXF0UTBtWG1GOThQSHAvWUVHMnJRemxxaEtD?=
 =?utf-8?B?WlkrL1lGU0UyWDZNTmV0UEFNQ1VkUDJLaFZtMUk1T2RiUTlRcFFqUHBSL0M0?=
 =?utf-8?B?WE9wMnhObTZQOEFpM2txQytUYUIyazB1c3JWa3ZUcTdobU9BR2F4MThUZ3Vs?=
 =?utf-8?B?cXNudVB3MlFWVkxkYnEzdDNYOGNmQmwyNmJxcWRRaWRwSEhaRkQ2bTV4VTRN?=
 =?utf-8?B?NHlLQndtRnVaSTRvWmluR2J6cTQ4RE1zWm5ySlZDM3VmVml2K21hQ3FsNzhP?=
 =?utf-8?B?clBoWXpCRGZNWVk3QWt6TFZ5ZFZmU2RzQWV2QldHRXdjTmVxcjVXUHZoK1VN?=
 =?utf-8?B?c2NYNVBJbVE1WVp5RmZpUmE4ZEtvSGZqd2xmdTFVUjdQUHg2eXFROEgyL3Ft?=
 =?utf-8?B?a3dxUDN2TW5UYXk1TFkweXlyMlpQVTdXT01KdUhhUGtDZWlUQVQ4bnUzQXpv?=
 =?utf-8?B?Rmt5Mk1pR01ETGZmZDBoUFFHL1ZQYmorSlNoTEovSExoUFprQW5kT3lLTXRF?=
 =?utf-8?B?NkxMTE9hQlk4TlFrbTV1SmFXYVVvNkdWMENIaUhxb1lrbTFvNDc2bUtBSkpx?=
 =?utf-8?B?T0c3WGhtNkUvUTRhM3VzL0ZBcHpWUDI1QnFXS0xvNTNMVWhtR2JUQlIwZkRV?=
 =?utf-8?B?NEZUOXNFSzFXaHNuMUJvbjRJK3o4MFFHRkdDUjJDYTJDWUVwVWFxNGF3SW00?=
 =?utf-8?B?bVcrVlB5eUpMZjdYcmVFN0NrMXNCdm9OODZxdnpLNGRMc0pSV1dzYkoxN0pI?=
 =?utf-8?B?ZGQ5dkhxbU9FZlh4UWU5UmM5SEFLS3RBRWo2b2kwNUxhaDZZeEdxbVRKV0E5?=
 =?utf-8?B?djhFTGdmcjNGOTlObjNxVHNacWwydm9SZ3RFSDlxcEJRTjJ1K1U1VllJVlNP?=
 =?utf-8?B?YUdmbExNVnRaSlJQdzJlc2pIM0pnenJheEZ1Tkp0ejhLWGVUNFNGcVA2Q2Ir?=
 =?utf-8?B?TldxdnQ1VEpDTW1aSWJFOVRNZ1htN3p1dVVPRm8vWTVreGZwN2o3bllwcUhq?=
 =?utf-8?B?bHl5QnFwTkJMbnZnRWZvSTNzTUJXTU9FNDFnN0UxdzRxdm92N2ZoNE8xREdu?=
 =?utf-8?B?QktEOXFkNkU4NStXRzJqSGxoaDVBVkROaEpISXFNVi9lYWJSai92TXQxR2o0?=
 =?utf-8?B?ZW5SdDhHV0I0bGNQVXBqemplWXBqS0N2V3pTcEltMVk1N3c2SmFUTit1MjVG?=
 =?utf-8?B?QWprckZRWm1SZlMxbzljVGcyYmR2bklJWUxDTEMyaWFyd0VUMWNvUUFSSUFL?=
 =?utf-8?B?STAwR3lxTlRvSFQ0RUZzdHB6aXdUbGZVTjRpM0dnckx2OHhkblBQQlRXUkJ0?=
 =?utf-8?B?aUg5eWYrMnRKUVJuWmFlVG40UkcrTG1CcHBGLzNHd3NXNGtzOFJySVQ5dUpM?=
 =?utf-8?B?eXpmNFBYdGRGbnZCSXFNY1kvNjgySW0yUHoxbW1KNVRFSkU5alR6R0hnUTBZ?=
 =?utf-8?B?Wkh2YllMdnc2QWcvOUx3RHh6a1M0VGt4UG1BRDBGYWdnNDU2eGQxKy9Nd0wx?=
 =?utf-8?B?SS82RXpMVTAvckM4ZnZkUkhtWEJYcUZDdnRacGpwOFY0QmUwWUZ5cEgrMitD?=
 =?utf-8?B?Z3lNRGx3VG5HQVJkZEdEYjBkbFNiU3QwMitOK2RhN0NYOEhoTFlqdXR0MnBk?=
 =?utf-8?B?VWdrWjlFMXRKR0U4ZXFTcnBtbUJqV2I3UmM2MWVGT01QazdYS25BdjBXMHNK?=
 =?utf-8?B?dUQvcmk0VnBzTjJRd3NvbVpYOEQwVlYvbzFpbXhpcVl3Z0pXVlNqaDJDOVhm?=
 =?utf-8?B?UHpUVjNHaWlIalFGQk1YOGlEUjV1VXYrbHAwazB5d21ob1p0QndSa3RQR0xV?=
 =?utf-8?B?cmR0b05FdzRNVEJjWXVrZGFuSzJlSHZMVDRDSHZnZzl5Nk9maTJWS0lHOVJs?=
 =?utf-8?B?NmxweXQzWGx6UkJxK3R2bmJZRU5rdEVnbjNpa1lySzh6NzlKK2NEWExkRzg3?=
 =?utf-8?B?VUVqWUYzaHd2VVQzSnU2ODJXdVplMzRQa1N5bG5RVEdVSXYyQVFYTjAxVmcx?=
 =?utf-8?B?Tlcrc1E1MXIrQlE4cnlLU1hselBlek9nQlhWdHRqRVBNUUhRVmcxRURrWjNp?=
 =?utf-8?B?QUNkN2owSHFiRGhIdW1INUdRK1dGQjArRTFmYStJMDRMbm40MXpQRkl1MmF6?=
 =?utf-8?B?eG9kK09jcmpjSjZicFNJZ3crN285R05hV2lwdHZ6Y0Y5b08zR2lMRkhlNC9r?=
 =?utf-8?B?V2ZZOG1GQUtSZ0VFWURRVndKcEdqUnAxbjRzMEg4VEk0YmdveFN3VGtrMTVx?=
 =?utf-8?Q?ZUofU5tdaC1gYHU8x5ey2OeYQ1PnNsi1dohlIJrbuCLdy?=
x-ms-exchange-antispam-messagedata-1: LWFFR2P6pMkfhDDGC21D9PC51Xqdwk2vxxo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB5F1D1DC195394C80B510485878DE5C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	HcjayENJbeQ1kqcr6TftK90zpR2pT/PtYbciFDEGO5PK4/9R1XjY2PBKtpm+CDDAkh1TlukDENjclIfHHnhHLBP3GXWdhIIs2MvVcXcYjlelroXUEK5vU6NBq7LaGhmblrkoosvWlSHCHmSzioOWKBbcrzq2tRF+5jqGlvFDijN+9T0uTdJXx3R7aZl4qgeo9K3p/GXd/nsBorxU/c2kvl4aRzN54foTG9H5el+tDFImGzV90BZpsckRfDghfLg8r40LCUjPTz1uK1R/mNff8gYLBh+phQO+2RIued8vyC5qAOWaG+kBTbogrR9oLXlTHUXGCECzKd07+7aQDfqND0Hn5ihAMYnX1300TOMBTyVjwsHZPpYzFi5v6tS5z+D61VT2uGinS4e91Esml7DJBJsNDIzhnVK6+RzjPzIkp79QKCyVejV3GMoXMDQCMEGavcZBf1DfJsURmS1ZABpN9Qs3l/788/CG9LtblgMo8jY5IIDYgQt0irLtgE4MKVvatkYMizTMq+lhNo8t2UIR2lk8owNk82AAcNHL2AgGQspYlyni9mn8reWuw6UBSa5SpIg+8jp0zfT5jcjQ6F3cd6hR3jgBrtVS7Q9E4v94oOGE0bGC2h0YSefEsT70v0T5
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR04MB9849.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d1ef57-7c0d-4ab3-bcf5-08de516ecaec
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 00:09:02.5409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I1luKdxGgrr9jPa20PYgZ+w07HW/llLpYKcw0tQpe8dRoVNiKHoVheI2Hl/cvA1aHPFjMcUKoGSh+vfzJRlwXK2lwhz1Vub9OwOKjajGPGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7232
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 00:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229178

T24gRnJpLCAyMDI2LTAxLTA5IGF0IDExOjI1ICswMTAwLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQg
d3JvdGU6DQo+IE9uIEZyaSBKYW4gOSwgMjAyNiBhdCA1OjU0IEFNIENFVCwgQWxpc3RhaXIgRnJh
bmNpcyB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBGcm9tOiBBbGlz
dGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+DQo+ID4gDQo+ID4gV2hlbiBi
dWlsZGluZyB0aGUgTGludXgga2VybmVsIHdpdGggUnVzdCBzdXBwb3J0IGVuYWJsZWQgdGhlIGtl
cm5lbA0KPiA+IGV4cGVjdHMgdG8gZmluZCB0aGUgUnVzdCBzb3VyY2UgYXMgdGhlIGtlcm5lbCBi
dWlsZCBzeXN0ZW0gd2lsbA0KPiA+IGNyb3NzDQo+ID4gY29tcGlsZSB0aGUgY29yZSBsaWJyYXJ5
Lg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggdXNlcyB0aGUgUnVzdCB0b29saW5nIHRvIGluc3RhbGwg
dGhlIFJ1c3Qgc291cmNlIHdoZW4gd2UNCj4gPiBpbnN0YWxsIHRoZSBjb21waWxsZXIgYXMgd2Vs
bC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5m
cmFuY2lzQHdkYy5jb20+DQo+ID4gLS0tDQo+IA0KPiBIaSBBbGlzdGFpciwNCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaC4NCj4gDQo+IEl0IGxvb2tzIGxpa2UgdGhlIGNhcmdvIHBhdGNoIGRv
ZXMgbm90IGFwcGx5IGNvcnJlY3RseS4gSXMgdGhpcw0KPiB3b3JraW5nDQo+IG9uIHlvdXIgc2lk
ZSBvbiB0aGUgbWFzdGVyIGJyYW5jaD8NCj4gDQo+IEVSUk9SOiBjYXJnby1uYXRpdmUtMS45Mi4w
LXIwIGRvX3BhdGNoOiBBcHBseWluZyBwYXRjaA0KPiAnL3Nydi9wb2t5YnVpbGQveW9jdG8td29y
a2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvbGF5ZXJzL29wZW5lbWJlZGRlZC0NCj4gY29yZS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9maWxlcy8wMDAxLWJvb3RzdHJhcC1FbnN1cmUtaG9zdC0N
Cj4gZG9jdW1lbnRhdGlvbi1pcy1idWlsdC1iZWZvcmUtLnBhdGNoJyBvbiB0YXJnZXQgZGlyZWN0
b3J5DQo+ICcvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvZ2VuZXJpY3g4Ni0NCj4gNjQvYnVp
bGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2NhcmdvLQ0KPiBuYXRpdmUvMS45Mi4wL3Nv
dXJjZXMvcnVzdGMtMS45Mi4wLXNyYy9zcmMvdG9vbHMvY2FyZ28nDQo+IC4uLg0KPiBDbWRFcnJv
cigncXVpbHQgLS1xdWlsdHJjIC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9nZW5lcmljeDg2
LQ0KPiA2NC9idWlsZC9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvY2FyZ28tbmF0aXZlLzEu
OTIuMC9yZWNpcGUtDQo+IHN5c3Jvb3QtbmF0aXZlL2V0Yy9xdWlsdHJjIHB1c2gnLCAwLCAic3Rk
b3V0OiBBcHBseWluZyBwYXRjaCAwMDAxLQ0KPiBib290c3RyYXAtRW5zdXJlLWhvc3QtZG9jdW1l
bnRhdGlvbi1pcy1idWlsdC1iZWZvcmUtLnBhdGNoDQo+IGNhbid0IGZpbmQgZmlsZSB0byBwYXRj
aCBhdCBpbnB1dCBsaW5lIDMzDQo+IFBlcmhhcHMgeW91IHVzZWQgdGhlIHdyb25nIC1wIG9yIC0t
c3RyaXAgb3B0aW9uPw0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3Jn
L3ZhbGt5cmllLyMvYnVpbGRlcnMvNC9idWlsZHMvMzAxMg0KPiBodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy85L2J1aWxkcy8yOTgwDQoNCkFy
Z2gsIEknbSBtaXNzaW5nIGEgYDtwYXRjaGRpcj0ke1JVU1RTUkN9YCBJJ2xsIGFkZCB0aGF0IGlu
IHYyIHdoaWNoDQpmaXhlcyB0aGlzDQoNCkFsaXN0YWlyDQoNCj4gLi4uDQo+IA0KPiBDYW4geW91
IGhhdmUgYSBsb29rIGF0IHRoaXMgaXNzdWU/DQo+IA0KPiBUaGFua3MsDQo+IE1hdGhpZXUNCg==

