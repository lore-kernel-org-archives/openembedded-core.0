Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3E0E64AAD
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:56:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web11.20159.1733234209239789879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=enREz9hN;
 spf=pass (domain: siemens.com, ip: 40.107.22.74, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPyiVjpRmaC9uqNTisYg1Dgb1DkPZDWLbRUiK+EgKAdLD+A5i/4vcyETvkP62kkzJ2TOyaNz3HDIKH2UgIIFR7uzpFvyB2wY+B+3dLjW3aMbKSSOZ4trKkpYGJNxhdB2XmszNzMN0w0teRR8ADF2irBw+z05LH0N+J1Jg34LiaBAGW9qdYkNLnF3LmjwGTpi5EhKG9jWCsXGKqkn2GpuKj2Vkh0RAwCkZGS9c9SzXy6Z0noBFGRAD8cnajsQug564o9WOP9vnIsq0NiOGThCZi/JuGxOhjWcdMb86UaAvNJBQcL4+DOKyQyUqOmKEpjkFaXFWyllibVunE/pYRMWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryH543hdzo144OzfNVPncXvsCetxnfn2cemDHKPQm9Q=;
 b=ibHEOkyd88PohrwdsN2m7yFRJFx9sUSAlivsrkZYwGf1gTYN305e0Ca6MhhgZorDxLg1DkkPOh5NI9XQvQV+BX8TmClpcMG2lybHRzskb1Kxei8aMpg+r3Clf2j/zlXR68G6xe5dTyofRWriNgUOJuyW2DVMdcdU6Adw4ZsuuXqaki8cikYXHjlf5s7INfysBlNcv0YjTeQ91v8cws/Gn3AZtRwdlLLQTE04P1tqpEJsRp/qQ4XAM1L3fSWUEUcIBJaiR3fanGSJbXwq3FFrsWLsykKg3byqsTafmSmu52DwdczzKC/+EAitxsyBTJA4WDAH1FZKEJ844qds2YjLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryH543hdzo144OzfNVPncXvsCetxnfn2cemDHKPQm9Q=;
 b=enREz9hNSGpByNBSUHyZH6lgMwOD3VPJsPgkNqXPzE7rgC8g6THf/YDeFo1IVBARx31rJYuCqxyk8rxwzZ7H5MrI2kFvi175z7pPT6E/oRwcEENMbn0d86vbvxdWeE8kgezWDVuaDfR1srF4te+o9AGvjX6ka0js5A8JgnioSK06oQ5MC9gG4PysD4fqvrpq77peUWnzpCf5Sc/nn/ttNLyYredx2c5CYPjeEKeOu7skT8eJIy6Gnv5jnAhHlCuHKz+IduPeclJvKVeICCDeGyBlXgCJiidIyIuZeXRtkhyCpVfZgzDQ+Y0LPKho0kGmRSdxCNyJDlWJyvhNiF2iLA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB8139.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:387::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.8; Tue, 3 Dec
 2024 13:56:42 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8182.018; Tue, 3 Dec 2024
 13:56:42 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH] qemu: patch CVE-2024-6505
Thread-Topic: [OE-core][scarthgap][PATCH] qemu: patch CVE-2024-6505
Thread-Index: AQHbRRNyO9I7qld0xU6BoQ0pq8t0KrLUiwqAgAAAwPA=
Date: Tue, 3 Dec 2024 13:56:42 +0000
Message-ID: 
 <AS1PR10MB569775163BFB74FFE0FFD849FD362@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241202233844.2808663-1-peter.marko@siemens.com>
 <CAOSpxdZ4Nd0a+7mEcs2cgvtNNJpC4ypOM1TNsYAKp0qDnCLY+A@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZ4Nd0a+7mEcs2cgvtNNJpC4ypOM1TNsYAKp0qDnCLY+A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3146543d-0613-4eee-9688-f64164a04bdd;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-03T13:55:12Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB8139:EE_
x-ms-office365-filtering-correlation-id: 7365681f-83ff-40d0-a735-08dd13a25172
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cm1UV0Q5M3pvUWVNdnRXc0dqR01TZDRWV3I0YTNodzJiTkFTcnh4OUdkdUJq?=
 =?utf-8?B?YnRzME5BUjZwM1RIZlRaNWsxMVNpL2FLRTMrbUY5Tk9ZT0RkUjR1eTF5ckNj?=
 =?utf-8?B?OGlZWHNSZ0hyelJLcmVxN3A5R1VEWlQ1YkRQbWRDNU5yYllqWWtBK21MRnBK?=
 =?utf-8?B?bUpMWGdTMnRnZEdDelM5c3dYeVhZSFBZUmJ2QnU2cEVLVUprMkFFdUJ2aTZW?=
 =?utf-8?B?eDhENk9PRWMvYzZiSHVjZWMyQjZJZFhZbG10RitSTnNpdEVLQUxENThOSW9a?=
 =?utf-8?B?aXFqQitDcVlCcmNsdFNaclcwUnYvMENlak1DdVR5MnZzckVWZTljWUxJdmFn?=
 =?utf-8?B?a04rT1NQakRtV3ErVjRoRmdTWHhoVUI3dmpzbExRdTVSRGZueTJyd0VES3Va?=
 =?utf-8?B?NUIyWXgyZE5zOFRad25QNE5uMnZpcXI1VTloVWlXQUo4SU8xcmJXYi9mbjRE?=
 =?utf-8?B?SUpVQzVKamFSVlJraGZQWVkvZCtRQnVRV1VYdS9oK0pkc283SkNrMm9TQW5J?=
 =?utf-8?B?OGJTUWRHOXJZNG9hM0pHbEhRQmJVOFJ1WW5FUDRrV2hCaHBZOGFCcm1WRnh0?=
 =?utf-8?B?d3FNMm1FYnJVUnJmdXFWOFM2dGM3ZXQvOXluVURSMFFSWjRjOU1qZGphSXZX?=
 =?utf-8?B?S0k3YnlSbmVEc09iK2JnSUp1NzhlZmZRVzI1ODByNGRZSndTSDd1Y21aM0JN?=
 =?utf-8?B?RXltWkJOUk1pM3BWU3N0bHdMdDF6NTlDNVJKcEU1MzluWEl2ZEFWc0hUczFZ?=
 =?utf-8?B?dUlyd3dXbFhLRVhSSFNIZis1SU5aWS9iNlI1TUJUdU8rSEhBSk1OVjdxTzZj?=
 =?utf-8?B?SUNYeWtHNitIbnJNVTVJd2RJa3RqaGthbDAxb2xsM3B0U0UyM2pxSEdUK1BV?=
 =?utf-8?B?WXdxOWtxU2MyVWJlVkg1MkpUZTA4WkF3TU9Kb0ZYUG9ZY2pLMSsxM2I3MlRp?=
 =?utf-8?B?NXg2WUlCcE1Td3RxZHkzdVViVzVIVE1xZnJHeFFyTFdYY0ozMjlIclZhd0N3?=
 =?utf-8?B?N0VPd3ZrdXN2NXNYNjVvZ1c0YlE0WUhTMGlOclBaNE1tazhUR0NSSER4dzlr?=
 =?utf-8?B?U2s0MU9qY3ByZTAvTXEzVFNZcVZtZ3BMT1NFUXFPT2ZnbGU5SmkzcTZDd3VC?=
 =?utf-8?B?eUdFbDY5R3B6Y1lkdklIVVc4TUtJN1RhMFFhSWZRWjlJU3gyY2NsblRkUGFl?=
 =?utf-8?B?TDFQZ1I4Y2NCQVdoeExUSkM1eFgzVlRtQjJVb09ScllTMmZKdVA0cjUyUHQv?=
 =?utf-8?B?SjlSVUxZUlR1SHhlTFlYQlovZ0Y5M2dJdmhZRSsybFFwWnpGNVVwQ1J4K2J4?=
 =?utf-8?B?R0VZNjZ6STFlS01JV1dYbDJFd0dtVEhSZk8wOGdhSjZRK0w5S01oR29oOEFM?=
 =?utf-8?B?Kzd1VElQTlBrYjV2NEhuL283eHFsRkxzTWltNmVFeVBJaHZJUEJHSDVTakR3?=
 =?utf-8?B?VGNxV3BDakZtZmtuMXJCRWp2c1ExTFN3M3VxNUZvNG1zRHRiUlR4aHllWFhn?=
 =?utf-8?B?cmFDSWY2UmJBK3p6TDM5dU40Z3p6dVdTSEh4Mmd5ZGpLUGRCUW05L1M4Mzk3?=
 =?utf-8?B?Q1MyUjZ0TWpYcWkrTDlVcTRaVTNzdGNmR0NIVTlRYk9VNVFHTUtEMXFMZDdi?=
 =?utf-8?B?RnhQcmMwa2g3ZG1VYVFDTUlOUXk0bEJSQXRUcHBzYnF0MHNTSDBJZXBzYm1Q?=
 =?utf-8?B?TW9IbzVIUjBDeVZLYW4wYi9jeWYyQlJZdlpDUC84WHNDaXh0d1VIVHYwcHpB?=
 =?utf-8?B?MXM4SjZtKys4RFZYemVLVnVhVW1FN3FJblR1T3FiR2NNb2RTb0RuV1ZTSjVx?=
 =?utf-8?Q?ZewgemdupTRW8QZtLiypwFgJ55mvz9YlpB7FQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0lTcDkyQ0VxeVI0WTRablNaK3QyS0JUVk93S1laRmJvSHlJdXZVOFliZVds?=
 =?utf-8?B?aTg1bTFDSEFBSEN3QmQ5ZjNsQTRaVG9RRmhlbzRVeWRDYkN3MWxqOTFDRkx5?=
 =?utf-8?B?b3UzdXhVVms2My9EMmM2eWtEVkVRVFhEcExKeDdnMG4zSlFBYWh0WXQzdUQr?=
 =?utf-8?B?SGs3SHlSZ3IxY1FaYTAvNTJtcEh1TW5XcTNPUjJodnJmcjRUNXJmajV0MTN2?=
 =?utf-8?B?SWxHU2Y4aEZEbmk2RTZtYWh5aFczUlA3R1M1Nkd6cUFHNFBmd1FXbkNZZFNr?=
 =?utf-8?B?cDY0ZHlPMi96VDRYSmh1L1h4djdWRnkzOTVOR0VhSUlMamVVU29RMWY0aFda?=
 =?utf-8?B?c0hZeWxaMmhkQkxpSWIwbGhoK0ZLbTNpTXFBN0tDVEhidEpKSjQ3MU9jd1F1?=
 =?utf-8?B?cGdGaVAvMWhsRWtBRktIc2lyUFp1MEJhdlUrQ3doejVJVEdjc01GMXpvMTVG?=
 =?utf-8?B?ZHBsSkUvVDRtazA2S0t3MzdrTUJqQmNteTIxVUVXcjNjRDZBaUl2ZHFTL2hD?=
 =?utf-8?B?aFBoTTk0Q2k4V0RJekdEZ2hMb3RhcHdWbVU1T09tSE10eHZyZ0dGOVdQTG8v?=
 =?utf-8?B?aU5kQmVNRmY0VzFHRVdDQU5vYnNTV3gra2w5bXd6OXpDZHJjNjRKNUQ3Q25O?=
 =?utf-8?B?akUra2QreXdDbEkwdnFnWmlXMUVIVmJwUUwvZ05lRWV5RXBXY2JuQmUrdWV0?=
 =?utf-8?B?azZyZEZTdFFsTnNXVTd5NnFjK0JjOXkweUNXZCt1NkZpKzVHZ2tIV3RsSGhP?=
 =?utf-8?B?ck9NSmp4QWFmZFFobndCellWOXFJVXFlTWIwY2pvRk9KSW5pQVptbnNjWHJH?=
 =?utf-8?B?aUtUOFFBVVplMFdaVGpuYlRLaVlsTm1XZzdWVllWNXRoenN1eXpDVnVGcFJC?=
 =?utf-8?B?dDFTMklxZWwwOENuRmgxaW40YVZZY09lNE1vRTlBMklCbGhVcUcxK1FFYmhn?=
 =?utf-8?B?UXc3MVA4SHRqbEhzVXVUcHpFdk80NDdHTk1ydHd6cVVyRE1waWhEMk11dnVs?=
 =?utf-8?B?alhpY2EvaFZYanVJZXJZVnRsRnNNZCtnUlViRnpMU0xnZ1Y1QXZoZzM2M2tj?=
 =?utf-8?B?UTJURldkUzJ2eU90cHpRa3VWS3hvWGhxb3VlYmNLQTdablhXN0cwdHJMdDNz?=
 =?utf-8?B?VHluVmFmMm1JZDZEMGJ3RWJnblhJRER5cnBLOWVMcmRyQmUwRkF5U25vY1Ur?=
 =?utf-8?B?RFg5NWdpMGJXTXJjNlFmbnlBR0h3VlF4bFROb2g2dEdWc0tJR0R3eXFwc3dK?=
 =?utf-8?B?YnRvcGtXSzg3ZWJzUlhIc2lNMkdMU0M3WExBdHFqenB3cno4OGpWRFI3aDNF?=
 =?utf-8?B?UlIrVWYrdmFSOE1vVUZLODdRWlFCbXZrTEk0UjZad0NxbmhUb0kzSUZsK1Jm?=
 =?utf-8?B?T1NyL3B3L0JJaUVEa09jdXFKMXp6Ykk4Uks3Y0ZlVHRTQmpRbzllbklkWHEr?=
 =?utf-8?B?Uk1nV01yOUtteEwyU3NwVnZidlFOTUpoQTJ1UDZGNEJ1WERucWpwQlliSkJr?=
 =?utf-8?B?Q0phWDNET0d2cXBDcGFoOHlGb1o3R1dTK1djb0FHMGl2ZFArQzFHU2hVZWdV?=
 =?utf-8?B?NXgrOWhkSGpSdFR5ZzNheml0YnorQXY1RW84V1BNZko3OS9WdmFzMElTa2Mx?=
 =?utf-8?B?Uy9LNzJGcGo2S2gzVEprMGhXWGpvZWpuZnQ2alBTSVVjbWpXbzdnL1dCazhz?=
 =?utf-8?B?c2NiTFdaRWFiLzlkcFg1cVJPZlRGVjRvV3BTSlNhWklpd3ZyTk5aeXpodGt5?=
 =?utf-8?B?WUoxSVcxdUpiaHV3YXA4LzBoUEFKb3FkQ2UrdmlkSlBRTWFYYXlhSXVPa1l3?=
 =?utf-8?B?OWRRbEpWbkRQUGFGUXBKVEVhMXd6bS9panlBT2Uvb09NOEpyNjFDUEYwRUJ5?=
 =?utf-8?B?RVc5VWhyYm5ZcDdSWEdSVWpzR0wzYlJFUlZQNWNIZU12cnhwK00rdXBjNlIz?=
 =?utf-8?B?bDYza01XYmIreWYwcG1wNlZnblRmQ01GZDRqa1IvZkFrODZQUlRGUjBDRGZ3?=
 =?utf-8?B?d3krVmZIdVhDbXpvbi9hMFk1MUh1d201cnNudVpWMS9Rcy92VUhWdmVYLysr?=
 =?utf-8?B?NU80S1pYZ1VhNmpiWk5IT1ZGUCttdGFNVEFTSUVmMUp4cTNoWVpCMVB5bmov?=
 =?utf-8?Q?YtGC8dXfnViakHiKiZLJqQOdv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7365681f-83ff-40d0-a735-08dd13a25172
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 13:56:42.8384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jy/lNxEXZWhtHh6Mb8UniUEsWQX8qCheaup1ANarkyWFK148NJqqWtPsA5PkwXgP6N1sBVm8QrYJfl9G7e14CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208212

R29vZCB0byBrbm93Lg0KVGhlbiBJJ2xsIGp1c3QgaGF2ZSB0byBzdWJtaXQgQ1ZFIGlnbm9yZSBw
YXRjaCB3aGVuIHRoYXQgbWVyZ2VzIGFzIHRoaXMgdnVsbmVyYWJpbGl0eSBpcyB2ZXJzaW9uLWxl
c3MgaW4gTlZEIERCLi4uDQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIERlY2VtYmVyIDMsIDIwMjQgMTQ6NTMNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBT
SyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bc2NhcnRo
Z2FwXVtQQVRDSF0gcWVtdTogcGF0Y2ggQ1ZFLTIwMjQtNjUwNQ0KPiANCj4gVGhpcyBpcyBmaXhl
ZCBpbiB0aGUgcWVtdSBtaW5vciB2ZXJzaW9uIHVwZ3JhZGUgY3VycmVudGx5IG91dCBmb3IgcmV2
aWV3Og0KPiANCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvbWVzc2FnZS8yMDgyMDANCj4gDQo+IFN0ZXZlDQo+IA0KPiBPbiBNb24sIERlYyAyLCAy
MDI0IGF0IDM6MznigK9QTSBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+ID4NCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+
ID4NCj4gPiBCYWNrcG9ydCBwYXRjaCBbM10gYXMgbGlua2VkIGZyb20gWzFdIHZpYSBbMl0uDQo+
ID4NCj4gPiBbMV0gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjQtNjUw
NQ0KPiA+IFsyXSBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTIy
OTU3NjANCj4gPiBbM10gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vY29t
bWl0L2YxNTk1Y2ViDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIu
bWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUuaW5jICAgICAgICAgICB8ICAxICsNCj4gPiAgLi4uL3FlbXUvcWVtdS9DVkUtMjAy
NC02NTA1LnBhdGNoICAgICAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZFLTIwMjQtDQo+IDY1MDUucGF0Y2gN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11Lmlu
YyBiL21ldGEvcmVjaXBlcy0NCj4gZGV2dG9vbHMvcWVtdS9xZW11LmluYw0KPiA+IGluZGV4IGU5
ZjYzYjllYWYuLmYwNzg2OWNjNGQgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS5pbmMNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LmluYw0KPiA+IEBAIC01Miw2ICs1Miw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9h
ZC5xZW11Lm9yZy8ke0JQTn0tDQo+ICR7UFZ9LnRhci54eiBcDQo+ID4gICAgICAgICAgICAgZmls
ZTovLzAwMDEtdGFyZ2V0LXJpc2N2LWt2bS1jaGFuZ2UtS1ZNX1JFR19SSVNDVl9GUF9GLXRvLQ0K
PiB1MzIucGF0Y2ggXA0KPiA+ICAgICAgICAgICAgIGZpbGU6Ly8wMDAyLXRhcmdldC1yaXNjdi1r
dm0tY2hhbmdlLUtWTV9SRUdfUklTQ1ZfRlBfRC10by0NCj4gdTY0LnBhdGNoIFwNCj4gPiAgICAg
ICAgICAgICBmaWxlOi8vMDAwMy10YXJnZXQtcmlzY3Yta3ZtLWNoYW5nZS10aW1lci1yZWdzLXNp
emUtdG8tdTY0LnBhdGNoIFwNCj4gPiArICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjQtNjUwNS5w
YXRjaCBcDQo+ID4gICAgICAgICAgICAgIg0KPiA+ICBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJx
ZW11LSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIg0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZFLTIwMjQtNjUwNS5wYXRjaA0KPiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZFLTIwMjQtNjUwNS5wYXRjaA0KPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uZmJiN2FkMzFiMg0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
L0NWRS0yMDI0LTY1MDUucGF0Y2gNCj4gPiBAQCAtMCwwICsxLDQwIEBADQo+ID4gK0Zyb20gZjE1
OTVjZWI5YWFkMzZhNmMxZGE5NWJjYjc3YWI5NTA5YjM4ODIyZCBNb24gU2VwIDE3DQo+IDAwOjAw
OjAwIDIwMDENCj4gPiArRnJvbTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBkYXluaXgu
Y29tPg0KPiA+ICtEYXRlOiBNb24sIDEgSnVsIDIwMjQgMjA6NTg6MDQgKzA5MDANCj4gPiArU3Vi
amVjdDogW1BBVENIXSB2aXJ0aW8tbmV0OiBFbnN1cmUgcXVldWUgaW5kZXggZml0cyB3aXRoIFJT
Uw0KPiA+ICsNCj4gPiArRW5zdXJlIHRoZSBxdWV1ZSBpbmRleCBwb2ludHMgdG8gYSB2YWxpZCBx
dWV1ZSB3aGVuIHNvZnR3YXJlIFJTUw0KPiA+ICtlbmFibGVkLiBUaGUgbmV3IGNhbGN1bGF0aW9u
IG1hdGNoZXMgd2l0aCB0aGUgYmVoYXZpb3Igb2YgTGludXgncyBUQVANCj4gPiArZGV2aWNlIHdp
dGggdGhlIFJTUyBlQlBGIHByb2dyYW0uDQo+ID4gKw0KPiA+ICtGaXhlczogNDQ3NGUzN2E1YjNh
ICgidmlydGlvLW5ldDogaW1wbGVtZW50IFJYIFJTUyBwcm9jZXNzaW5nIikNCj4gPiArUmVwb3J0
ZWQtYnk6IFpoaWJpbiBIdSA8aHV6aGliaW41QGh1YXdlaS5jb20+DQo+ID4gK0NjOiBxZW11LXN0
YWJsZUBub25nbnUub3JnDQo+ID4gK1NpZ25lZC1vZmYtYnk6IEFraWhpa28gT2Rha2kgPGFraWhp
a28ub2Rha2lAZGF5bml4LmNvbT4NCj4gPiArUmV2aWV3ZWQtYnk6IE1pY2hhZWwgUy4gVHNpcmtp
biA8bXN0QHJlZGhhdC5jb20+DQo+ID4gK1NpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+DQo+ID4gKw0KPiA+ICtDVkU6IENWRS0yMDI0LTY1MDUNCj4gPiArVXBz
dHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9x
ZW11Ly0NCj4gL2NvbW1pdC9mMTU5NWNlYjlhYWQzNmE2YzFkYTk1YmNiNzdhYjk1MDliMzg4MjJk
XQ0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5j
b20+DQo+ID4gKy0tLQ0KPiA+ICsgaHcvbmV0L3ZpcnRpby1uZXQuYyB8IDMgKystDQo+ID4gKyAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gKw0KPiA+
ICtkaWZmIC0tZ2l0IGEvaHcvbmV0L3ZpcnRpby1uZXQuYyBiL2h3L25ldC92aXJ0aW8tbmV0LmMN
Cj4gPiAraW5kZXggOGYzMDk3MjcwOC4uNTYzNTYyMGEzMSAxMDA2NDQNCj4gPiArLS0tIGEvaHcv
bmV0L3ZpcnRpby1uZXQuYw0KPiA+ICsrKysgYi9ody9uZXQvdmlydGlvLW5ldC5jDQo+ID4gK0BA
IC0xOTA5LDcgKzE5MDksOCBAQCBzdGF0aWMgc3NpemVfdA0KPiB2aXJ0aW9fbmV0X3JlY2VpdmVf
cmN1KE5ldENsaWVudFN0YXRlICpuYywgY29uc3QgdWludDhfdCAqYnVmLA0KPiA+ICsgICAgIGlm
ICghbm9fcnNzICYmIG4tPnJzc19kYXRhLmVuYWJsZWQgJiYgbi0NCj4gPnJzc19kYXRhLmVuYWJs
ZWRfc29mdHdhcmVfcnNzKSB7DQo+ID4gKyAgICAgICAgIGludCBpbmRleCA9IHZpcnRpb19uZXRf
cHJvY2Vzc19yc3MobmMsIGJ1Ziwgc2l6ZSk7DQo+ID4gKyAgICAgICAgIGlmIChpbmRleCA+PSAw
KSB7DQo+ID4gKy0gICAgICAgICAgICBOZXRDbGllbnRTdGF0ZSAqbmMyID0gcWVtdV9nZXRfc3Vi
cXVldWUobi0+bmljLCBpbmRleCk7DQo+ID4gKysgICAgICAgICAgICBOZXRDbGllbnRTdGF0ZSAq
bmMyID0NCj4gPiArKyAgICAgICAgICAgICAgICBxZW11X2dldF9zdWJxdWV1ZShuLT5uaWMsIGlu
ZGV4ICUgbi0+Y3Vycl9xdWV1ZV9wYWlycyk7DQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gdmly
dGlvX25ldF9yZWNlaXZlX3JjdShuYzIsIGJ1Ziwgc2l6ZSwgdHJ1ZSk7DQo+ID4gKyAgICAgICAg
IH0NCj4gPiArICAgICB9DQo+ID4gKy0tDQo+ID4gKzIuMzAuMg0KPiA+ICsNCj4gPiAtLQ0KPiA+
IDIuMzAuMg0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcv
UmVwbHkgT25saW5lICgjMjA4MTY0KToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMDgxNjQNCj4gPiBNdXRlIFRoaXMgVG9waWM6
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDk4OTE0MTAvMzYyMDYwMQ0KPiA+
IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC0NCj4gY29yZS91bnN1YiBbc3RldmVAc2Frb21hbi5jb21dDQo+ID4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K

