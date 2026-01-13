Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93A0D2D10A
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:08:12 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59782.1768313287909643588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 06:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=VtNRHu/Y;
 spf=pass (domain: siemens.com, ip: 40.107.159.60, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2YsxBBzdQyi/pUqJzkyJkzaq85IRn+p38liXrPhm3aXj31pETPXMZFNpyczHao+5NlNbacsLuIrZR+rMslDZ2d6BB6vFzEOU9BG4zgJi1YozFGa4Yt6Yoh4RPbhvtYDbTFJYz/WNDkStYUBjznONgKQTjSPY0lHUPABshlNAtDCNCuwa/DlMu9IuGNfhnjUZLojOrX+laalFsGhE+KvqGpx0ifaGF9qS434FwOjUF2AP8OF3bI240CQIQNf9A1H/7e8LmZufRfk/DJSZtTr24d6ULkxZV2NA5oh6Ms7eOkHXzBFAs/bGO3nJreYIx1ZPpTlDuCxkLDf4apS55tVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1tUBAUufZjHLQuXYgOMWgvh/sjzgC+jawkz7/Ea2nA=;
 b=ZDW+rvCsTgFx887tjV0ADUh5pD+SvkDSG9ZX2uJS7+HFpBMc7e/4qWoGGrGj8PgkUv7VtUAgxwfCDxtVHiKk0AAWIuLWqunpdNetJovKTNis7L0mUZu+FxkDVpGoYl3YfyVWTGyoPoVouYuUHf6XFpROWo4dHHX1oVErfxPIhrI8nGdgAXYoh2RVzPnH9HfLkAByx/toa9zw/tO/KHkbngYdGirKWKOeFqRTOvD4Y4xha4+jsrfy2SFkWqs0yRq8IZOOzrnQRQlOtIxgIf0tSNUKb0MvWJARpT1PfnsZ6tNVu1KprXLqsgdfmzV7/kSGQdWyi8TV9bv+ig+NCg0ZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1tUBAUufZjHLQuXYgOMWgvh/sjzgC+jawkz7/Ea2nA=;
 b=VtNRHu/Y0n1plY/J6NuSabeVN1AcT4Z8IfzEHO1jUIX3If+1o2Qo7hDIbiqxWCRIzkx9skRnzbuw6U/H4bfqMFUcR+PdHaJ+BWAxgyhUhwIyXFiTYmLotWgrHq009Bp8F6qxYxemIS2gh1Xjj6i6NP75lKul3WqquB9xTFOvdDKfRnkvenXINLHfvHtTFWybQQhE24axWSHVQ2hn1MmfUYBEdTc8Px2Xzd9h9ZtWpguJS9qjERGwFsKt5/kpaEpo4ykL6IhkIQK+h6tXwUUxHAMZ+kgnvvpIPONEdCvHfThpxYhQPP+WsMsZblBRRpNg5dMs9RgswEOlqU5MZwBfNQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB5988.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:08:03 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:08:03 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH] qemu: ignore CVE-2025-54566 and
 CVE-2025-54567
Thread-Topic: [OE-core][scarthgap][PATCH] qemu: ignore CVE-2025-54566 and
 CVE-2025-54567
Thread-Index: AQHceqCsnyYyjtPjPkmWRyu6qOMEibVQMWqAgAADh+A=
Date: Tue, 13 Jan 2026 14:08:03 +0000
Message-ID: 
 <AS1PR10MB56975A5A95E98D0FA05F738CFD8EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251231215843.487608-1-peter.marko@siemens.com>
 <CAMSfU+4Tv5mO2sLgxitWvRceF5mM3MnuszSLMMSY+0jbG_9ZBw@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+4Tv5mO2sLgxitWvRceF5mM3MnuszSLMMSY+0jbG_9ZBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=fc76ee76-9f3b-4142-8c0d-c37ca8ad84e6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-13T14:01:22Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB5988:EE_
x-ms-office365-filtering-correlation-id: 46ed714a-b8f9-4e06-8825-08de52ad2aef
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RUQzbnVRSnZWdlNSaTRDczl0SzB1elZvVHdhb3hpZFRDM2dsKzJsRzhnNEVt?=
 =?utf-8?B?eHlpL2EwMjE1UFlKN2dUTFpIemErT2hKd29RQXFNckFoSkZiQVlSanNIYVRZ?=
 =?utf-8?B?OCs4VjJwRzExc1FEN3VkMHBwNkZ5SzczM3I2WTVMUDdFSGZhTkVvTTAyQWlw?=
 =?utf-8?B?QWd4TUIxRlRsKzZQNTJCWDE0cCtUMXYyYU1Kd0JSL1YzNldja3pyMm5nL2ZG?=
 =?utf-8?B?L2ZqdmVSSVZTQTF4THFYSGszbjRmUFhma3FoVldUQ3ZKSXo2eDVlejZ3enp6?=
 =?utf-8?B?Vy9Db3E2NWxuMm9nMm9JOU50bUxmQXF1SVdFSDNTdWIrbjExaE5uQ040RlNO?=
 =?utf-8?B?cFl3OWlkM2Y2RWp1NFhTNkJHWlBlUitHVDR3VTJicGVGWEhQMmVIR1R3WGps?=
 =?utf-8?B?RXU4TzdpNFp3NnhXU3RYWjh4dHN1RGhUSTExWGRrMzlCdG1FSUhBeUxhNUhY?=
 =?utf-8?B?SENacmQ0dSt5WlVXcjNEaERrVVBqSGkxaEVubGVObFV5Z1Y1YzZ2L2ptWkZz?=
 =?utf-8?B?c1I5MXVJT21aMnJMT3pMUjg3NjZ6cGtNc2NJNGZYanZsQW8yTkF6YS9WanNF?=
 =?utf-8?B?WERBMlRvbWN5SGJKd3dTenIxQ0VCTlVoa0ZWVVRpNlJsMjhYdWlFK21sQUhF?=
 =?utf-8?B?a3hDSk5IdWxVUVN4RkFobENndFR6UFdQcDNHSzVlbENXTVM4UU00MWhQZUJC?=
 =?utf-8?B?SUJLaUpyenNMRE5sazNiRC8yaERKRU9XTFIwbmFXajNCZnVUYW45SlhUYkpy?=
 =?utf-8?B?VUIyYko3M3Uxa3puRzdFWFBaR1JDdVZSVEZ6a3hCMndvYTBRTjk1WUdxMVp6?=
 =?utf-8?B?b3JPK1lNdTBKSVlYemwyMnNvUTFmcjZ4VGloMWhvdmpNaUx3ZEYwbnIvNzVG?=
 =?utf-8?B?NHFBQUxHYkpVZ28zbzNxSzhFSlhPeno3dmw2elVnSHhPKzdYWHV6Uk03Ujlj?=
 =?utf-8?B?ZlJ6K1k0a0hhbkdUK2tLV0tkOWpnZ2RBZFFxNHZjT2k4S0NOUytlN0pkMWdF?=
 =?utf-8?B?SjBVMXBIWXh1cG9Sa1VFU2hNRG9EZmJUUG5XY0tSOGJzcXN5VlcwQkxxRDVt?=
 =?utf-8?B?ZHlrSEx3TTNnUUt0d3VjWVIyekpOczFjVDg4SzhwUTNteDdsM1l3eUxZeDNV?=
 =?utf-8?B?OGFVdHpvSTVmUjkxNm4rRWN3VURmbERwUzdZQk12V3pEcWkvKzlON0xqWTA4?=
 =?utf-8?B?N3BuWCt2ZW5ua1FMQVNYUjA2MHNFY3JqRHNtQ1NyVlpoblVhdzRZajd2TERQ?=
 =?utf-8?B?WWNNT1JvSytDTmc1bXRWcTJ6eERVdFhhdmFYY3l3MFZjU0V2bmhiQjhHMUlo?=
 =?utf-8?B?TXM5bjRsWHMyT2FMSlIxMU9CM1duemhneWtKY0NEU1pWd2FYTlhUSkF5b3pi?=
 =?utf-8?B?eHlKMFMzMWFCQTA3N2ovazBnajJCSEJvRXh6cWJ0R2dXdk9YK0NRdkl4RXNU?=
 =?utf-8?B?dS9WL29ITFJWS0tZZzFhcGg1MDZlYUQvSEZtcXludG1zZXl5ZGpsMmxCQkRW?=
 =?utf-8?B?Q1Q2aUJkYlNXYVVnak8xdnlmbWdCcCswWHNjWkVtSTJtb0UvRmJFVXBGUkx6?=
 =?utf-8?B?aXpFbFpQanpLSENtTWhVRVNvTFFFaXNVV1BsZ3RjVmhZZjE2ZGMxVkF4YzRT?=
 =?utf-8?B?bWtLYkF4dklPQW9Qa24wM2pQazd3bnNNbElMU2RtMkdyVGg2MHZ3eTdKMk9t?=
 =?utf-8?B?UnFDR0pocWdFamdEUE9iek1LYnhBbnpydlJGTS92b2lvVjRZa0hWOEFKaWNz?=
 =?utf-8?B?Uk8ydVpNckZteW5Jc3ZmZDVGVmdCUklCNVEvNDQ0Q3R0MHhXaVZlWjA3Wk5D?=
 =?utf-8?B?cnhtdm9qTlJBM2JacUlYUEdBUFR5bVB6SXVVQmxhdFJjVitlQWNnVXMzZmFz?=
 =?utf-8?B?MExDT0QxU0dnUzRQdllUeWhheU1RREZaNG1HUEdTcjhtNE1mUUtMK0JucXBU?=
 =?utf-8?B?UDhXTDJzM3dCdnQvRHFQWGpwSHdUK2hzbmlDZDBLU2IyeHFUTXVQY1ZMYTc1?=
 =?utf-8?B?V2hFS29rejFhVHVaLzRlTEd0M00rbHVXWEJHY3BLNEhEaWhUM1RFQVpadm41?=
 =?utf-8?Q?aQAM+2?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M1JaQXFVQzl4SFJXTHBvNVYzRkRvQmQ4dGJnYUN5RVh6WFN5eUVIc2lmTFFV?=
 =?utf-8?B?UmZ0UG1rZVExajJaaTQ4RUViRk1DaFlQelUxZzNnbWh3cTdvY2JBY0NUYmJi?=
 =?utf-8?B?TjZxcnhkdUMrRmRhUHhscGpoYkhrU0RHYWRRT3k4NVlQQncwSitEcDU1U0dy?=
 =?utf-8?B?bzNMZDhmdUlZSDNGN1o1REFBNG1aZ3ptQno5bloxWE1JZlNMTE9YbW9rL1p0?=
 =?utf-8?B?VEI4dU90R29ueDBlRWpQRHlCWGt4aEcwY2dqQ0RsaWRXSGpod2plR295MXgz?=
 =?utf-8?B?RU5SSkp1RDQwM3FNNG1CUmpqSGlTcUVGdllva3p6TjBVZkZibXNVMzdxdEgz?=
 =?utf-8?B?QWNYVUEzUE1Ia3A3cTRCN3QwQTlhY2F0QTJySC8reW40NVc5bG9IUjJOenNn?=
 =?utf-8?B?aEtZcm84L0RJbWdXbzRWZUd0di9QaG1nV3hUcVhTQmsza3NueEQwdGc5Z1d3?=
 =?utf-8?B?N2E4Y2E0SGNRUFd4Qk9PMUlQVjZUY0VNVkZiKzlEMmEycDBTbjZqTnZiczFt?=
 =?utf-8?B?WGg2dmJ6QUpOSDZXSmU4aVJNdk16N2plSnBKSHJhNGs2SDhzUDlLRVl4VHlX?=
 =?utf-8?B?ZDJKVkFhV2J2ZjlOamJmN1RjTktIYkFHS2VQdUJ3eldYdExZR2ZSNlhkQU1B?=
 =?utf-8?B?ZW5HSVA5UnJzY0xTaTdjYzFYbjNTZml2dkhmNE9EbjcwWG5TckZ4Q1VqK0M2?=
 =?utf-8?B?K2p2ZUdURjRyVGUxbVNtWTM0ZU55ZlpOLzdJd09FOW5sR2hyU3d0R25WVkpi?=
 =?utf-8?B?cldJc2laMjFFbGwzVEdYVzd6SGVGc1dkV0d6UW54LzZZSlFOWVlpdGpSbmdt?=
 =?utf-8?B?K3U5K3VoZzdRdU9yRmwwTnN1Z0hhMWRucG15Q3dpazVNanFxM3lRa3pWVkd6?=
 =?utf-8?B?TXZrV1VULzZHZFhmNm1HeldmQ3FiZS94SEw1Y0pDNExJWGJJczZRb2JTWEpw?=
 =?utf-8?B?SGtLdENYcEgyVnRVb1Z4RTMybDBvMlVzNTNUejh6QVdYSTNseGg2RGV2OS9w?=
 =?utf-8?B?ek9qM0RXNUNFNGlxTGpLbUgyRk4xcnFUZTFVblVtWThLaDVhcGxKUjcvMzFq?=
 =?utf-8?B?d1lPZDVOMDUxWGFvZzBxYVVuN0NvYmRQUUtHdWVaRGtGUWhobFlaYTZ3QTVv?=
 =?utf-8?B?VXJjM0t6VDI0a0pWb1FiaXU3bzY2cWJDT3hOSE5PY0RHYm5xUGM1cDFFUTJE?=
 =?utf-8?B?SThmWHNNQ1NrZjRBVEc0VGtzRml4NFJkSmUxZkdycU9mUndWVGtZeE9jZ2w2?=
 =?utf-8?B?VHJuYThJcENnM21SVGx3YWtFYWgyWk4yL3prVDFhMUt6Y0lCaVFXVnJXMmE5?=
 =?utf-8?B?ck9GUnFMYWdLU2htQ1RDaGlaMjFGRzFvc1B0c3licXIzUnpDZllOa1A2S1p1?=
 =?utf-8?B?c0hEZTVQSWxsNXU2NDdIc2t3UDEzYkZlN0EvM09PUFdaaHJMMUprZFBMUmpa?=
 =?utf-8?B?SjRTeHl1U0lGaTRuY0gySEQ3ZVBtL1F3cWM4c24rWlVnOXQrMVpBUk5IczBo?=
 =?utf-8?B?aEVjWmUwdExhQlBJV0lDTUluR3B3cm9rbVljd3U5ZUdJWUZic2FrMEcwMHlQ?=
 =?utf-8?B?QlZyOU1xZUQ0RVY1YjFNc292Y0RzOFhVY05OQldsNE1UU3JzQ2YvcXNrQ2J2?=
 =?utf-8?B?WlZoMGgycE5qWWYvYmtEK1JYRE5SUVc2U2VqVDZHemdBcXZFNVJQZ1JuS09J?=
 =?utf-8?B?aXJDYmVDL1piMytFSU5PY1FWUjNJZGd5ZmlhcFFkQXQ4R09SVWk5RTZNLzd1?=
 =?utf-8?B?MnhHaExiM3hLcDM5Rlk0eHZGcktHSXRxVnRFSHRjSHBXNWVxOUVhcVJselFk?=
 =?utf-8?B?UCt5cEIxNDVVTFQvTGVDVURDdHdGb21KbXh2NFNoSGdLZE1LMGFIYWNVNitw?=
 =?utf-8?B?VkMxT3l1UE1tRTMxbVE1U3RDaS9ZVXZIL1RxZ3lDQk9tem5NdmhYZGtoTGJk?=
 =?utf-8?B?N2JBak11SVordnAydnp5UkYrazRqbTVoVXhydGg4Y24yb0NJWWtFN1BtK1hM?=
 =?utf-8?B?NWFCSTJocVlBRVhIR1BTT3MrUmkyNlR3R0JIenBrWHVQdGE3ZkhGeGp4YldW?=
 =?utf-8?B?ZEhYVUExSit1TytvRkREaGhOMkFUQWJ0c1lXOUVOcVJHdklkOFFkY3RUYlBP?=
 =?utf-8?B?WlkxanRqRnE0RHhVQmtGRTFRRHV4bURacFJiNFR2dWJrS0JERkEyMXFwRjlY?=
 =?utf-8?B?SEJpK2dPUk9kb09uYzV0R1E4S1JrS1I4QkpxNlJiQ1diTmUrK01xenVkakRl?=
 =?utf-8?B?M1F4Rk4ra3hCV2JVaFl1T3JhNm1vZ0V1TjZJR09EZWlBd1JzRkM4WGU2LzZN?=
 =?utf-8?B?WHVLbDJSYnhUNmJPY0pLMEh1M1Zvb0xKL2NaR3ZQY1U5V1c2aFkrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ed714a-b8f9-4e06-8825-08de52ad2aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 14:08:03.5263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuzuFQEsIUybl2sI/X3uUwE6wL7S/B+TMd51Fzaj/461OCQVzo6AAjrKWjlTO5y8hkJ+chk6intKpNWk6OHdDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5988
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 14:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229266

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMTMsIDIwMjYg
MTQ6NDkNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29A
c2llbWVucy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bc2NhcnRoZ2FwXVtQQVRDSF0gcWVtdTogaWdu
b3JlIENWRS0yMDI1LTU0NTY2IGFuZA0KPiBDVkUtMjAyNS01NDU2Nw0KPiANCj4gSGVsbG8sDQo+
IA0KPiBMZSBtZXIuIDMxIGTDqWMuIDIwMjUgw6AgMjI6NTksIFBldGVyIE1hcmtvIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IA0KPiANCj4gRGlkIHlvdSBjb250YWN0IE5WRCB0byBnZXQg
dGhlbSB0byB1cGRhdGUgdGhlIGRhdGFiYXNlIHdpdGggdGhpcyBpbmZvPw0KPiANCg0KTm8gSSBk
aWRuJ3QgYW5kIEkgYW0gYWxzbyBub3QgcGxhbm5pbmcgdG8gZG8gdGhhdCBpbiB0aGUgZnV0dXJl
Lg0KU29ycnkgZm9yIGEgYmx1bnQgYW5zd2VyLi4uDQoNClBldGVyDQo=

