Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9B8C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 19:17:49 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.53])
 by mx.groups.io with SMTP id smtpd.web11.4981.1716319061674928468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 12:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Z790NIzK;
 spf=pass (domain: siemens.com, ip: 40.107.249.53, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZ62VRAPWbqCkiy1hdunyLrSkU72bL+TaxN74VF5rhSpaellAWKTlw3w3G4meHhq4IAgYOIYFpANKgl15YGhJnlUHR9h57vFqo8XSYQFNnFpzcTq9SEBnN6t/meK5FqcEjzakGyB3l9zeJ2uGwgw8+3+dtCL4qUfJlgiViqF7KJwldt+IoYNYJ+9RvhjUr6R8NnrAqyx4g/NGPP4pqsMZkn0kx/nZPgrGUBEzDqM95FKIhCZMSoaVWkaRZjKZpebHnVoq5WHON3+XmRr+3ne3+kPDWeBN7IhxPpD0TeFo3zJfPeDWo4Nf7rrnhGgzk2KSVxCjKblFNgDQjd5wXKqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufWOB22iCZzz1KlWmYUbp6hifVnzKugk/N9wrdvRiFA=;
 b=eYFJzYqPcWBeIVH4x+JuKg3JU5BVfyzdewSjwKxzthdtOCMqFqYQa1HM/2onX7BW3MRnUJ3n00BGLTeaRWctuW5jTjC/Lm+AvcAfOiuJplWn1P0zzS85zvxTuBo46VkkJUC2MpLtlQ2Pct47T1DfNA2K+j6bUoMJvdD84cEjZXgMA8/bay4rg3lnyIxWOyWUhWKol8VFVdb33wE77OEu6tZJN6M0rgW3gw/XcIsmnIXXNFVjNC0DIunCDkPqvmQkRACKBP4HU5C0bs49Eas4IFmXVWr9GgzlPcxVaWE9UVu23p7mLoa4J65STGQDvg+RVxn63vMxBQ/UpBRHZ7bTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufWOB22iCZzz1KlWmYUbp6hifVnzKugk/N9wrdvRiFA=;
 b=Z790NIzK5IenxCqMqVl60MtZh8v0gFU+utI0S/Ho1lDHXYSh8jeeMDKME+9v09Mwt8W7tDN4d2j1hmBOq71vohGytOe0MGSlc18XDIblAvFssQR5IqbZxqoKmlyWAMyvzCYunuzJyzxcL8hhWa/uBCPD8nZm5pQ8TTkbt2K0C/j9Ag/s4ERJsJO5vemydOxLjElQrZ7pOpUvhyBsMziHUA/jU7bfpjgSxPtA4mpaS0yffKK5nH887jdx9VYydDQ7C0eM35cJRUPJSrVHAYnuCH6DhCFEl+PJGngzzWSCD8S2ldZYqLz/tcCtoTEZP8TwA+P9dQV19ATkRZ9W4/Sdhw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7165.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 19:17:38 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 19:17:38 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/2] ncurses: switch to new mirror
Thread-Topic: [OE-core][PATCH 1/2] ncurses: switch to new mirror
Thread-Index: AQHaqWqnM5JSS6yj202DJz6gAqY4P7GhfTEAgACSfIA=
Date: Tue, 21 May 2024 19:17:38 +0000
Message-ID: 
 <AS1PR10MB5697E1CD2E2A7DD06150D96BFDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240518212954.788524-1-peter.marko@siemens.com>
 <CANNYZj9H16P4fPcphNiXV_8Wx3eapUeCQu+f5uL+4HGKRGrzBw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9H16P4fPcphNiXV_8Wx3eapUeCQu+f5uL+4HGKRGrzBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5bc779f7-b111-40e6-bdbf-c1ff3e2ff32c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-21T19:01:15Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7165:EE_
x-ms-office365-filtering-correlation-id: dffe20ba-238b-466e-42f8-08dc79caadc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aTBDT2lKMnV1WnpHa3ZXMG9jZkErWEFXRUlvOXJ6ZHpnWDRkT0t5YzRFRFRp?=
 =?utf-8?B?b29GMmZOSU1BZCs4UTIvZFFXQVJIYkVtdmRKQVh3WDNLOVkxajFrSHlDWHZh?=
 =?utf-8?B?UUpLWlpISVhTcVFreHhJTVNVdDRINDd6bXJqUmdZcEc2Vy81YklPN0JBQUhO?=
 =?utf-8?B?aWhqbE1nT0w2Ym5oVXRkQnhGK1htZnk5MmFqZ3RUVjhwbUhXaHk4a1lvcG4y?=
 =?utf-8?B?WDlXT0NPVXE2UjNuUFR5QnpMNW5wWWxwS2MwUXNKSlZOdDNURUhGcnRETXE4?=
 =?utf-8?B?K0JEa0JsNDJrZ0FsZEEzTWxrV2RRdVg1R3Y1dlZZaE5Sd0dmWkozeUtLSGFC?=
 =?utf-8?B?d2VCTzdFejQvM2hlNTJWTFpnMlhSc1N2TXd5MklvRTFtUVU5VFBGNFN4SUY5?=
 =?utf-8?B?aDdodVBlMEVFeStudVpZK1ZZOTB5ZTNwN0NvM3ByVmR5Nm0rTnhUV21LL1l3?=
 =?utf-8?B?TEcwT29udERycG02Qmx1cUFIeGgxNTRIclg0ellya1l3c3MzbFd6cVZ4NUdk?=
 =?utf-8?B?QnUxbk9rNVBIK3ZHYnZrakJ6N1BSeGJ5V2JTeG5GcGc5ZW1FSXBPQVVHR0dL?=
 =?utf-8?B?aVJ0WHdCUEdxMm9Namk5cTNqUVFtYkxVQWZzWi9nbk95M2d3Y2JsTytLTXht?=
 =?utf-8?B?V1JSZ3VGY3VCcHU0cnc4QXBTNjd1Mjh4cDRPYXkxekZRYXEwN3NtdnBHcmN6?=
 =?utf-8?B?blFKaEdudVpzdFVVMXRWdUZsdnYrTXlGUGVuVXZ4UXQ3dWJYNGV0QWhiOTVV?=
 =?utf-8?B?VkZtOHo2Z0xVZGUzRWN0L1Z2aFdtR05QS2ZXcTFvbG5Fb0haRmR0QUViY1VW?=
 =?utf-8?B?czVlOHBtTjYzblNVQXkvOVAvR3ZBalA0RHlJMCsrcmdEa3dCdDQ0T2RHSll2?=
 =?utf-8?B?bEEwQUs1SU1KNWV0aXB0VXdad05Ib3hZZW1SQXZKYS9FbHV3RGp4WVF2SXpx?=
 =?utf-8?B?UnBlRFJ1cFpCdjJqcVBLUUNHOUFvNEwycllUVjVBWUlsclNvRHM1a2JaQ2Fy?=
 =?utf-8?B?K3luZkhtMWJXVzQyY2srOWZLUjNjZGJidGRFdmFOY0NDMzdQRi9oOXNrd21V?=
 =?utf-8?B?L29FWmErekVFdS91TXdHdzRFRk9IT2k1aHhwQ0NYdlRscUhTbDAvZE5VR3hL?=
 =?utf-8?B?c2N3MzhVZDFtR25CV04vYWVyblRJOWhXZkFWaDFjN0g5aFVHMGgxbFBrWEda?=
 =?utf-8?B?ejZBUDlvcFE2cjdVVEdxQ0xod2YvVG41aXFkcEtidWdCU3pkNUdlUGtKSXV4?=
 =?utf-8?B?WTc4QysxTWRtaXV0LzkzRFBFVzJteG9KMHNhZ2diNVpRUmNnczloWDVkbTV0?=
 =?utf-8?B?dWZxUzhBUHpPU1gxTi9JL3VOUlg1OG0wQkdDSjNzVVVDd21Bcy9FdlBFeG9Q?=
 =?utf-8?B?RUNVSHNvRWkyaENOZk1SaXY5MWh5Q1VJeHFDTFJEZEF4RlBWZk4xRVcrNWY3?=
 =?utf-8?B?c0NINnV3MGUxZWxQajJVOWVyTU9SWjJWZVJFL01pNFllTVBEdktya29hNEd2?=
 =?utf-8?B?Rk9jV1ByTVdsU3BEZHB0T3JJRFVLTWtaQk9Dc1kvaTRMZlJvNm5ZNmJJZlVV?=
 =?utf-8?B?YWdBVUtDWFkyQjk0TTQ4NitIei9aMmwzaGJkUzd0UVA4SUtUTERhdmU0dkNi?=
 =?utf-8?B?MFY5Q1NYS2liT0FnbTRwZExrWkpXT1BFV2EzVXJvZmhoYjRpZTNXSjBOZ2Rt?=
 =?utf-8?B?Z3hpTzE3OHlmZW9SR2x0eE5iOExBREhUNEN1WHRZZllHUGliWG1vcUt3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dFhEdWg0T0kvNEw5cXhRenhqSzF6cUlnRnJIUmFXNkFCM2VSNDVRY0NqZEZv?=
 =?utf-8?B?Vms0eHQ5WjJMNVorWVlMWlcrUXNkR0xEU1hBMGRHTkQ0NmczSmxCVHhpSTEz?=
 =?utf-8?B?Ti8zUHdEVkR4ZmJQU1JNcmtaM0tHdlB1eWoxUHpTVGJiOEVuWE1DdU8rdUhl?=
 =?utf-8?B?Q1BlMnp0KzZXTDVtaUhRUEZZeWRXWFlMRDdvVnZRYU5Gb2x1bUZaTDMwL3NC?=
 =?utf-8?B?R2drRDBGUjF1RFM4ZlJuKzJZbThEQnNodXlFSGtVMU10MXBFcmV0dlZiYVFv?=
 =?utf-8?B?TWdrV3lUT3RaQzg2dlg3dU9FVnNqTlNKaHZqM2pFcHNPLzlBOCtuTWdVSXdZ?=
 =?utf-8?B?UGt4ejFSeDlIV2JVZXFRTzdrWGR3bE1aZmZMM1BsemlIaVNHdjhtMzhHMzRP?=
 =?utf-8?B?WjlSSXJzVS9lTHYza3BESXQ0ZWpZb2NrYVh3ZU85MEViUURoa0VqalJBTitS?=
 =?utf-8?B?cWJ3WThhNHNMcGM5ZVFLMURtMVBWS1lucmt1RmpiTXQ0WGdCSTJCL1dPUDZ3?=
 =?utf-8?B?RFN0ckRtKzc2dWZNTGVHSFVJUmZGWDhtUWY5WDhNMlk0V25Fb0pueXBCeUFG?=
 =?utf-8?B?N1YrNjBhbHVEbG56dUNlcWRhZWk2VERRRnZjWkhtSmZOcTJOSG13K1BIMTl5?=
 =?utf-8?B?VEhZU1Q0QWtGN2s5djUwZjBIOHpOQ1Vod291d2RyR2dBNUplSUNjRmJnK2xy?=
 =?utf-8?B?NlVyNGJxa0V6N2pwSWE2MkpDVkJYRGFPWjdmUGJTaFRrYlF3SE5lNHZZNDhV?=
 =?utf-8?B?Q3FxVWN4YWlzU05zZWkyUWZOSjdiU1ArcFpXa3RXS2hJM3hhd0VVVDhxUWlw?=
 =?utf-8?B?dHluWlBGemJXVlN1TkVmZXprRDdTL0xxekg2dm1RNnkwZnV4S3Zrc0lab1hO?=
 =?utf-8?B?a21OWTBmZGoxa2twYlVhS2ttbGxpd3JoRzJ1TmRPcGdWaWQ0ekkzWU1BNi9G?=
 =?utf-8?B?RGNHbDNtOW9jaThyYlUvS2xqOFJuaHRoNWM1ejNmMktPZHRVdXg4bVc4cEFW?=
 =?utf-8?B?bDJCSE1VUjArRVIwOHgvV0djWlU1N2k4UVRDampRVFBNcUFqdWhna3hIQWIv?=
 =?utf-8?B?TmNaSWZOanNMOWdTS3NvYU16eUtkN1g2dWY1N1hTTTlnRDR0QkdpL04rM1RW?=
 =?utf-8?B?enJ6b0ZaRGFJeVRrSTU3aS8rVXZWVFR1WEpYRkVISURFNjh5dTg4UmdaanpX?=
 =?utf-8?B?cDZCMWJlYm52WEpEZmhjb2I2NVQxVU1MMkpjT3pIMmZSQ2dTaVppMFgvL3Zw?=
 =?utf-8?B?cGJlUFlHK3hMRGxEK0YxUkxxa0V2MFNXeC9MMUhCSHluelB5UWRMV2d4bnA5?=
 =?utf-8?B?ZGh3cTd0WDRKbDdUYnpCN2hKS2I4THdXQm5sMG90TDZ1NmxEb1UwWE4zdGp5?=
 =?utf-8?B?aDdpUnFsaHdnVE0ybWlQRWxvK09tMFFEMzU3K09KQ1M3Tlpud01XTHo4V3Rl?=
 =?utf-8?B?OHdVazZnTUd1Vm5LbXFVVFBzNkxpb1dPTkFTZThXSUtNR2dSSVpaYktnVTR0?=
 =?utf-8?B?UHlwRUJHd0h5NjhheEJzWGFHd2FaczhmanRBNmIzMGRWSFpHNHAvOXJYYXlj?=
 =?utf-8?B?L1V6RHErNGZzNklUNGYxajlSM1ZvTWJWUXJraHNhaytlM1NDYncxTjZFcHRS?=
 =?utf-8?B?KzQxQk91Mnp0cXBjczh5OVYweDBrd0syK1V1a2psTVJBQ2JzVWs1RHg1QVRF?=
 =?utf-8?B?WGlMekdSSnplTzhkbkM3TVVWeTREb2l2ck1VQ2lmeFdzaFQ0TEFSS0NUNmFy?=
 =?utf-8?B?aE5RMmlSOSsyUmJwNjNMeUM3RW5NcHoyRTkxZTVNamxSc3kyaE9sWE1Tci91?=
 =?utf-8?B?SVZwT2wxZFd4ZXdqakppcDF1dXJNV2t6cWZHcmdjaGFhTzVtaFIzNkVHZ1VX?=
 =?utf-8?B?ZUpjWGxNeFozR0lWbUIxd1FPWWxTTzk5bWdoM2cyNjNmSVFlMnBOWkRiVHRt?=
 =?utf-8?B?S01XZ2tkNVEzTllXbGgvQSt1dGJ0a2g1cWdjZk5JcTM1cmpsWDgxdjlBYVBN?=
 =?utf-8?B?S2VtWFRlVnBiK3Z6cFplTm5JT283dEw2UEZ3SDdrc2lLZ3JvYW1jd08yVXk0?=
 =?utf-8?B?bHlnUHlrckUvTmhqWlVWdmZudzFCNWJjYUliV2N1d2ZKQ1pIU0ZJdm81djdl?=
 =?utf-8?Q?cTs7D31V0zdoGEVTOJQsIoKpm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dffe20ba-238b-466e-42f8-08dc79caadc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 19:17:38.5292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCHspga9VhOgyco8X1eqrP0Q6jtTaUBN+VmdFSDw6FLOzfNgr1w1eEAVzaALj6of4duV5ByUk2rNqo2XzIUx/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 19:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199671

DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+IA0KU2VudDogVHVlc2RheSwgTWF5IDIxLCAyMDI0IDEyOjE3
DQpUbzogTWFya28sIFBldGVyIChBRFYgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVu
cy5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3Vi
amVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCAxLzJdIG5jdXJzZXM6IHN3aXRjaCB0byBuZXcgbWly
cm9yDQoNCj4gT24gU2F0LCAxOCBNYXkgMjAyNCBhdCAyMzozMCwgUGV0ZXIgTWFya28gdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPHBldGVyLm1hcmtvPXNpZW1lbnMuY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+ICAjIFVwc3RyZWFtIGhhcyB1c2VmdWwgcGF0Y2hlcyBh
dCB0aW1lcyBhdCANCj4gPiBmdHA6Ly9pbnZpc2libGUtaXNsYW5kLm5ldC9uY3Vyc2VzLw0KPiA+
IC1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbWlycm9yL25jdXJzZXMuZ2l0O3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYXN0ZXIiDQo+ID4gK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9U
aG9tYXNEaWNrZXkvbmN1cnNlcy1zbmFwc2hvdHMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1t
YXN0ZXIiDQo+DQo+IEFmdGVyIHRoZSB4eiBiYWNrZG9vciBJJ20gbmVydm91cyBhYm91dCBzd2l0
Y2hpbmcgdXBzdHJlYW0gc291cmNlcyB3aXRoIG5vIHZlcmlmaWNhdGlvbiBvZiB0aGVpciBhdXRo
ZW50aWNpdHkuIElzIHRoaXMgcmVmZXJlbmNlZCBhbnl3aGVyZSBmcm9tIG5jdXJzZXMgaG9tZXBh
Z2Ugb3IgbmN1cnNlcyB0YXJiYWxsIGRvd25sb2FkPyBTaG91bGQgd2UgdGFrZSB0aGF0IHRhcmJh
bGwgcmF0aGVyPw0KPg0KPiBBbGV4DQoNClRoZSAibmV3IiBtaXJyb3IgaXMgbWFpbnRhaW5lZCBi
eSB0aGUgc2FtZSBnaXRodWIgYWNjb3VudCBhcyB0aGUgb2xkIG1pcnJvci4NClNvIHRoZSB0cnVz
dCBzaG91bGQgYmUgdGhlIHNhbWUgYW5kIHRoaXMgcGF0Y2ggc2hvdWxkIG5vdCBkZWNyZWFzZSB0
aGUgc2VjdXJpdHkuDQpJIGhhdmUgYWxzbyB2ZXJpZmllZCB0aGF0IGJvdGggb2xkIGFuZCBuZXcg
dmVyc2lvbiBtYXRjaGVzIHRoZSBzb3VyY2UgdGFyYmFsbHMgKGFzIHN0YXRlZCBpbiBteSBjb21t
aXQgbWVzc2FnZSkuDQpCdXQgeW91J3JlIHJpZ2h0IHRoYXQgaXQncyBub3QgcmVmZXJlbmNlZCBv
biBob21lcGFnZSwgYXQgbGVhc3QgbXkgZ29vZ2xlIHF1ZXJpZXMgeWllbGRlZCAwIHJlbGV2YW50
IGhpdHMuDQoNCkxvb2tpbmcgYXQgdGhlIHJlY2lwZSBoaXN0b3J5LCByZWFzb24gZm9yIHN3aXRj
aGluZyB0byBtaXJyb3JzIGlzIGluc3RhYmlsaXR5IG9mIHRoZSB1cHN0cmVhbSBob21lcGFnZSBw
YXRocy4NCmh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvY29t
bWl0Lz9pZD00ZDNmODRmODQxNDcxNDVjZmQ3ODYzNjJkOWNkNzU0YmJiOTM4NzNlDQpOb3Qgc3Vy
ZSBpZiB3ZSB3YW50IHRvIHJldHVybiB0byB0aGF0IHNpdHVhdGlvbi4NCg0KSSBhbHJlYWR5IHRo
b3VnaHQgYWJvdXQgdGhlIHh6IHNpdHVhdGlvbiBiZWZvcmUgc3VibWl0dGluZyBteSBwYXRjaC4N
Ck9uZSBvZiB0aGUgcmVhc29ucyB3aHkgSSBkaWQgbm90IGdvIGJhY2sgdG8gdGFyYmFsbCB3YXMg
dGhhdCBJIGRpZG4ndCBrbm93IGhvdyB0byBjb25maWd1cmUgQVVIIHJlZ2V4Lg0KSWYgeW91IGtu
b3cgaG93IHRvIGRvIHRoYXQsIHN3aXRjaGluZyB0byBpdCBtYXkgYmUgYW4gb3B0aW9uIGV2ZW4g
aWYgdGhhdCB3b3VsZCBtZWFuIGhhdmluZyB0byBjaGFuZ2UgdGhlIFVSTCBvbiBsdHMgYnJhbmNo
ZXMgZnJvbSB0aW1lIHRvIHRpbWUuLi4NCg0KUGV0ZXINCg0KDQo=

