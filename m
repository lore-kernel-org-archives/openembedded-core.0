Return-Path: <diego.santacruz@spinetix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59532CFA772
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 12:08:34 +0000 (UTC)
Received: from ZRZP278CU001.outbound.protection.outlook.com (ZRZP278CU001.outbound.protection.outlook.com [40.107.167.137])
 by mx.groups.io with SMTP id smtpd.web10.20186.1728043705908563544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 05:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=NNal2B1B;
 spf=pass (domain: spinetix.com, ip: 40.107.167.137, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxdeKTD2M5gGY2NOEW7dwQRqS6tT2B3HwlvhU+UzhIsLsS4kzkuQfcUcW+VLUeglrfjMWUactPd+9GctX6zFrsJ46KqOaTFhwKSoH6hNSEvTxJEBUP+P2qA9LxvZdZ0YW41WtbUAi7iLA2mbjGqvdpDFM+ZofQKXGwzX2aeuh1nMK/Iqqm+0i4+bbLykoWIAgsMCWcNUVGp7J8X5aszJBWwXqWufSodXctKQMZ39aZ20Rh6iGHxNahN6S6FjawQ9jEgU+zSgn/MgX3VSMZoReA/jubl/+w+5Nw+5nsEXVPWAb89ANNgIP/FmLS/EFYjMTdf10Ab42+9cRopMdSRKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N1bM0Tr9OpEMQJDKKzBqb/hRWep3x1kF2f9SMNZxTY=;
 b=xQhWuBv3SSBV9bN69gYhZg0rqWItxTosBwTIJEpkhRGLA8YWZTe+hL3dX0oglxwiS2odFTJ8eMDPv4p2ATMGwW1IGInJI6tkKLLRKxNQ+m36tA4rtTY1MPgXXPupthb3Yc4Vgtv4R/lhfoR6sdhu2Q8c+4K0iNoP96y/HymZhMj3bjl+q2Vp2LuUwH4/JzBYKSgl0msqLrLCAtFRadgBb77v7jzoC0+gzGwzaX/R79g27qiTCkM0eYxb+jSEYpGu4IEd+6p2ta7t+z2tqzazN50/DJEiXRQnrjhXcP6BsvAtnuegUQz9TuxDeLR4apwyPqt++s/vOEiAhafAgMHxYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N1bM0Tr9OpEMQJDKKzBqb/hRWep3x1kF2f9SMNZxTY=;
 b=NNal2B1B12QglgfjYXSaxUXVJ1wxyf2VRqNnDjWmZWbsfeuuciwHRg5FDq4t7P/xd7NWQywYiBgfHoDYX7FLVJNR16VJGFvQiperGdINx5cHvAhy2DjQoG6cAAbxffayA2VJEn7P/yM8SZuR5UQozC86TCvlm3m7bc64OhLsNA0=
Received: from GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:33::13)
 by ZR1P278MB1117.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:58::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 12:08:21 +0000
Received: from GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b32f:8f10:6660:4c30]) by GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b32f:8f10:6660:4c30%2]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 12:08:21 +0000
From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] pseudo: add man user and group to fallback
Thread-Topic: [OE-core] [PATCH] pseudo: add man user and group to fallback
Thread-Index: AQHbFkaGzTNDV4cs4kiCw3yosgAsXrJ2Y66AgAAB0rCAAAyMAIAADGxQ
Date: Fri, 4 Oct 2024 12:08:21 +0000
Message-ID: 
 <GV0P278MB0241AA7663023F359DE64A1588722@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
References: <1728037005-31667-1-git-send-email-diego.santacruz@spinetix.com>
	 <5cb8922b31b537468a104e48c3f21a88af41514b.camel@linuxfoundation.org>
	 <GV0P278MB0241E4086F65AC9938075ACB88722@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
 <c8b8242480e395790b8a7c921835834027da5fe0.camel@linuxfoundation.org>
In-Reply-To: 
 <c8b8242480e395790b8a7c921835834027da5fe0.camel@linuxfoundation.org>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV0P278MB0241:EE_|ZR1P278MB1117:EE_
x-ms-office365-filtering-correlation-id: bb8f5a9b-fef5-43bd-86c3-08dce46d3d79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZnpJdm1BMEJtbDF2US80Q25aREwwVW1pN08rcTBRRDBaaENuUG1pNGYzb29X?=
 =?utf-8?B?dFB0cnppMitiaGRuQUkxQVA3bkZuMGpHVGNVQjByNXNidG1QQlByYTAyWjFL?=
 =?utf-8?B?NWZqQ2Z6d3hFM0lDMDFJc1grMEFYWk5LaW54QlB3ZlkwWnFQQTkxaG9naUR2?=
 =?utf-8?B?R0xMQVJ6bitxcnREQS9qaVpLTHY5VFZOUHF0Vm9QRnlPUVI1WCtwbld4QjIz?=
 =?utf-8?B?YktRL0Y2WXlwaVNRUTIrZ3luZEVQRlJoZUN4L2lGNXo1cStMRnRxVEMvUHVO?=
 =?utf-8?B?SDd5Z2U2eGhnR3FreTVWUUdONUJHbGZVWHRVcnl0aS9idVVBMDROLzY0ejZm?=
 =?utf-8?B?eG9mV3QxTGZCVm9FZFl6NVBrdXBpeDc0bmNCbjloZWljTy9iU3docVRZT2ti?=
 =?utf-8?B?TFBaZGxzTkRQQi94anh5cmJkb2JkVWZEQWZSMkpLTitwdit6QXRnbTlSNHEy?=
 =?utf-8?B?Q21LSVZ4dlA4dWRvekZNS0I0MHNkMW1OaTVnaHQ5M2lkMWZMWUx2NFNQTGtF?=
 =?utf-8?B?SUo3UTI0UXVFdlh2RUo0Rm1ieXJjNWxML2ZhbTFHTy82OXI3S3JPa3F5RGta?=
 =?utf-8?B?WWI5b3VYKzl5U09Jc1Z5LzAvalljQlR2TXFxZEtVazNmNUcra2RqMXBSZkpB?=
 =?utf-8?B?ckFxSFNxdzZsb0Z0cUJITmdJbUgxTW9Sak9CYktKWjVWSVlSaFpNODFiSXQr?=
 =?utf-8?B?bU5DdnBhT3o1dFpHZ1pvOHhTS0sxcERpUGFQNDZxOTZ1dmhwc0RGb1NrQnFK?=
 =?utf-8?B?anBSTU44RFJKcUF2WnlxWWoxOS91ZmFBNU40NXJ5b3hscGx5d1F5WmZFRktB?=
 =?utf-8?B?OGNjbkk1NWZCb3ZPTzNjdmgyLy9PSUJsOEY0WnV2RHBJWHpBZGZmNjE0Wk1K?=
 =?utf-8?B?c0FkcGplMkY0U05ONmsrRTRQVG5oTnMzc0FxWmlmMUFJRlpvSjRNVTRPTjFj?=
 =?utf-8?B?S0hVZ0dnQzdILzRSb2I3aVU1WlhzOUtRTGlNdW5wOGxVRUpheEJHb21va1BY?=
 =?utf-8?B?NkRpWE5mdmFzekdiN0N2T2NqQWFFRDNCRTFSN1BHeGYxR1lQRDVBZ1hYQ0dz?=
 =?utf-8?B?Z2NnczJmT0tTRmdqYlBDaSs1WThrZkFiVmFtelZxaUU0NGpXTnJmVGlBUnA2?=
 =?utf-8?B?OXpXektnZDZRR1kzRU5MZndWLzl6VmI0Y09yTEFQVHZzZzA5VG96ZmFMN3o5?=
 =?utf-8?B?eFZYU2V3R3Z3V0lRbXo1d1RQQktqbnAwYmtpMHUxZXhKdjVscGtKeEhsc0l1?=
 =?utf-8?B?TXJEbnZvdEMrZ0hrNUdKSDFhVkRlWHpzRENSUDMwS29TMUhLS013TUpiRm9t?=
 =?utf-8?B?VWhKQWVOamtQVXVqd0EvbUVmUU41QS9ISFo1aGhXNmNyd3U1ZUNYVnBnQmQr?=
 =?utf-8?B?NlliR3ZwTi9ZR2pjZHhmZWduT05yMmUzWVNNeGN0V0VReVRiR0taTm9sM0N3?=
 =?utf-8?B?VWU4N2tXSzh0ZFZJNTRiVXkwMU4zQlVhWm1xMzlwVmZoTWF3cFY4R1dZWkhM?=
 =?utf-8?B?SjJWL0pVZ0libE4xUGRiSkl4eFhUZVN3V01zeXpOUkM0dGhEcW50UTV0OVQy?=
 =?utf-8?B?cGMvVEVEZTNVQWRuMTNFdjFZTkZFZjY0UmR1Y2RQaDVUYzh1WURHc0ppWWo2?=
 =?utf-8?B?SFNTQWtLSkhxYXk1K2hlQURaRmhCd0lBYjVtRGt0SmtTQzdsV2dWbXpVZG5j?=
 =?utf-8?B?WHQ3MVMwbTdRVmZjNjUvNUt6dGpOTHJvR0FFM0ZHdnZNZ3pERlpBY3d3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SkZXMERTK1FpNzJjWmNMUjM1RTZRckIxem82RHVKeHVBRzN4a0hHQnVwZnJ1?=
 =?utf-8?B?TTh3ZEZiNmRIRldEZ042aFE0cEZEOVJzY0ovZzhBWHNmWFE0bVlaL0pUUG5Q?=
 =?utf-8?B?djU1Q2FlR0szOTRWVlpoRGszRS9KOEdxYW44eEd0bDZORWNPWGdzL282WElY?=
 =?utf-8?B?cTNubE1BOXVzYlhzQ0RmZktTOTFGSENLZkhkVXozS0JCZGFacmNjalBBRU5H?=
 =?utf-8?B?eitZdWJEQ1F1WmFtb1dBUWEzM0RPaVRuUTBsVnpESUlCeEJFOU1QZ28zUnI3?=
 =?utf-8?B?eENkTXpyRnVTQjBUR3lUR3ZmT09GNWNHV1N2Z1JZMDZrOGNLbVB1djhsKzE0?=
 =?utf-8?B?amtzQU1MTmtuVFIzSS9TOVBNd0szRGlSTEZiMlg5Q2EwMzV3anVGMjdIclhT?=
 =?utf-8?B?Y0tCUlArbEN6UTBJTGExQndzbmxZTndaM1I0ZEhFODAxMTVEUEp5dzJjZi9l?=
 =?utf-8?B?YWNvUXlNblhRV3c2RWRZRzBoSlhHUmFkLy80cHVwNG9FQ2laNytrMHo1MURF?=
 =?utf-8?B?eUJQVHpuL1k1V2pKQndmdjhnMUJNaXBneFc3d3ZqS0hEOWxyVzkwS1U0dkVR?=
 =?utf-8?B?SVdEUmtiRkw5MllnRmcxR1ozazExYjNYVGNDU083cG15dUphaXhmQmdqK2Fy?=
 =?utf-8?B?bDl0WElVMDlsYjB1R0VyY0ozRTgwSTBQSXRnOGNOSGdWN2I3d1k3ay8vYmpF?=
 =?utf-8?B?RHNYUE1FMnZmdHMyVWpNTEZ6b1VCV0phajF5NlZxdjRpWGMxZUl3ZkNnQzNx?=
 =?utf-8?B?TE1nc0JJdnphUE9tNHJZeFhUSURoRVlRSEs1WFVLNTdIN0x5V1Q5bWtTeVdJ?=
 =?utf-8?B?cVIwY3RvTDRoam01Z2g2NWZkTXYvMnJDMSs4T2hBbDN6cm9yMWJiM0xqOThJ?=
 =?utf-8?B?bXpqbHNmdExpU3R4ZTUzQWNYOHFpQk9OSVVyVTQ2VGZUemh5MEFSaEV4NlBo?=
 =?utf-8?B?UDVZWE5GMUc2VXV5cFBQc2ZjUmJLY0QrTFpVN3FHTVUyNzBDcXVLRWJ5dXVo?=
 =?utf-8?B?Skd5dEg5N1dpcWNZZnRVdEhvOW95YnhGaitpUzJmWXNZRExqZUd4RUVDNUFI?=
 =?utf-8?B?UWswWFF0SUdvbyt2WTI1cTN6UmJva01FZlZjMlRVM0h3aHFGbmRiQ0RvM2Ro?=
 =?utf-8?B?cjRkeUQyVXJDQmU3UzNiTkx5QmhINFlndjkwNDUrZ1RjeHR1aWU0YzE5ZVdS?=
 =?utf-8?B?dWdUeCtRY0orcTA2RGxxV3B6TUp0VXVNTlRkc2hVLzNINlI0dmN1NDZuODFL?=
 =?utf-8?B?cFdJakRTSWlaNURqdWVjeUdsRjdmTndTWkUveE9QMGdNL0RqT3lwL295RVMr?=
 =?utf-8?B?MmdEamRJZ2hLQzdmWnptNk9XYkhSa1d2YmVnbDgxOXBDUHNhWkNiUWlHMXo5?=
 =?utf-8?B?b1FsN2V0UlUyMFRhditjZS9zT2grL3dCcnUzV1RwQTVXY3pmdzFyMVRiN1Ux?=
 =?utf-8?B?YlZ2M042WklXWlFZUGU5T2Fpc29HdFB1a2RQRG5UNGR3eFJVNkdRdzJ6cU9T?=
 =?utf-8?B?YjB3K1JYelAzNlN0YzZ2VDNuTmRKUC83S2kwR25MMThTV0JieGRSVEJWOTRT?=
 =?utf-8?B?WWdJNEt4ejZRWFZmdzBMZUlra0RzbllDWVh0d3BUeFBxY2JIOGJyV2hLaHo2?=
 =?utf-8?B?Z0dRQTlXLytiQVFFWGxQc01PS3hLbFdMVCt2TmlCaWM1M1k3RkRFbUpGR2kv?=
 =?utf-8?B?bG5xQWVUN3NaTVVOVVRrMFdBN0IzOFE2RHdZQmszbEppQ3VXUklpMkh0Qk1p?=
 =?utf-8?B?WHY1QnRFU2NzQWU3dkpXbHdxNVhodHozdTVuN3l1Z0N6OXZPOEU4NjMwbGVv?=
 =?utf-8?B?THpkb0I1QnFRcXNOVDhTeWpEVUoralQ2bThacWZYTzBGdW1PZEZ6VVl1SStS?=
 =?utf-8?B?bytNUmYyQUROZ21tVWk1K0JwMk5uQnUyNmRRWEFaVXFhVnVZN1dVZDcxVmFB?=
 =?utf-8?B?enY0czRhS1NmY0ZuWkVqME9qaG8zVHRvdmVVd3d2ZXJDWXFJVzBjcThIT0hk?=
 =?utf-8?B?eTZhREI3SHpZYUdaa1lJYms1YVlOa0ZYRWZ4NVJoa0xvdG5NeW4xYTJLMnVO?=
 =?utf-8?B?eXM0OStLVm5WNTV2SmtIQzNxYm5SMDAyTFQvaVBGYUpzOW14R283V3o1SUNr?=
 =?utf-8?B?N2V6Sis3SE1nZUovRGNnVERaL0UyTDZJNGNvRFJGajM4bExoZlhUM3hBS0N5?=
 =?utf-8?B?SFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8f5a9b-fef5-43bd-86c3-08dce46d3d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 12:08:21.3539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYoFa0GcTsYQLLyZ6JO2uajYVDK1fa88KdkqC2ODP0A02NazeKrEkoaH0ruRCFV6FzkozCVMPqeoaV3ZYz9rHrIRFyzU9fuDGsBQpw3R94o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 12:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205232

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCi4uLg0KPg0KPiBUaGlzIGNoYW5nZSBt
YXkgbWFrZSBpdCBjbGVhcmVyOg0KPg0KPiBodHRwczovL2dpdC55b2N0b3ByLw0KPiBvamVjdC5v
cmclMkZwb2t5JTJGY29tbWl0JTJGJTNGaWQlM0RiNWRiZGZlOTA0OTc4NjdhNzBmY2RkNjlhM2Uz
NDc5DQo+IDUyZGZmN2QzYSZkYXRhPTA1JTdDMDIlN0NEaWVnby5TYW50YUNydXolNDBzcGluZXRp
eC5jb20lN0NlMWMyMzYwOWZkDQo+IGQ4NDk2MTA5YmQwOGRjZTQ2NjcwNjAlN0M1ZjQwMzRmYWVk
MmQ0ODQwYTkzZmFjYjFlOTYzM2I5MyU3QzAlN0MwDQo+ICU3QzYzODYzNjM3NTgzNDMwNDA4MSU3
Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3DQo+IE1EQWlMQ0pRSWpvaVYy
bHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMCU3QyU3QyU3QyZzDQo+IGRh
dGE9ck5GWmhLWGolMkJBQ1hJS0M1aGklMkYwZHU0UzNzR0QyNWY2S0ZFM29jN29QbDQlM0QmcmVz
ZXJ2ZWQ9MA0KPg0KPiBXZSBpbnRlcmNlcHQgY2hncnAvY2hvd24gY2FsbHMgc28gdGhvc2Ugd29u
J3QgaGFwcGVuIG9uIG1hc3Rlci4gVGhlcmUNCj4gd2FzIGF0IGxlYXN0IG9uZSBidWcgaW4gdGhl
IHdheSB0aGV5IHdlcmUgd29ya2luZyB3aGljaCB0aGF0IGNoYW5nZQ0KPiBmaXhlZC4NCg0KR290
IGl0ISBCZXR0ZXIgdGhhdCB3YXkgdGhlbiwgbm8gbmVlZCBmb3IgbXkgZml4IPCfmIoNCg0KPg0K
PiBUaGVyZSBtYXkgYmUgZWxlbWVudHMgb2YgdGhpcyB3aGljaCBjb3VsZCBiZSBiYWNrcG9ydGVk
IHRvIGtpcmtzdG9uZS4NCg0KT0ssIHNvIGlmIEkgdW5kZXJzdGFuZCBpdCBpcyBiZXR0ZXIgdG8g
YmFja3BvcnQgdGhlIGFib3ZlIGZpeCB0byBraXJrc3RvbmUgaW5zdGVhZCBvZiBteSBmaXggaW4g
dGhlIHBzZXVkbyBmYWxsYmFjaywgcmlnaHQ/DQoNCj4NCj4gQ2hlZXJzLA0KPg0KPiBSaWNoYXJk
DQo+DQoNCkJlc3QsDQoNCkRpZWdvDQoNCg==

