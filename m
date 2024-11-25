Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528E3D5808D
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:09:14 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.87])
 by mx.groups.io with SMTP id smtpd.web10.17217.1732536552009663781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zO0o++Jr;
 spf=pass (domain: siemens.com, ip: 40.107.104.87, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onbJYzbGlwAkmZ+Z+7L/fci7p7nEySs8kfFiWP7duj06vqyci8pEZdrm3rePcilOB8c81upIR0+X1gd3Q9hpcvz9AJ/hNaAASPA/nyZ9c0lpk17ZaQ09SMFjZvPCd19m7O6pPD5cDEbpOYSCGgWQ9bLxLSIsM749OsMDqpabfT+414rZ7SszF2VW/EnTiaw3UI20Hh/vCv+9dSZweLL6T2c3e7k/COl45kiiYK/GmLH1pVrgqFLFOUjBBB8tsr1X1oN7qWXjgs4ZT332tJjlewIBNyTcAv6kmCOhb3gIIGGWxejix7nteqgIAPltC/5fQs7pjS8jZaYcs2wjMwUFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOF80xNmhPSIrlgtGkVPLb7cZvz59gE3kgE/ccv/b8I=;
 b=Nm0HaUOhH4lb4i+bv+0Svjey9oWhCA1qewF5PQAox5qmx4R3y2vfSMYIzt7GHooKhnF6LGbd1h/sLu71+4GumjoW+B7BArT1Md4eIrChW+ScRAwdl1Utf0//aBQ9rh+0Xv2vyOXqTgXoa61GMsGG8EFHrwVAsnhOpvI1K/wwUttnvy5C70+u+Zc6p7uOTAARtwOjMW+74jxrvtG/UEdUH1o9o9ueIQbO3soq2I/k/ie3WEyN+unucn3u3FoVkZuar5nR6opxMimdUrKWTNynwqQAhg4767AOvKzDwtyoq52/SiPl5KFRh6xteCjQrrJtJXGDg5mmPEgIJH/NYLgTUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOF80xNmhPSIrlgtGkVPLb7cZvz59gE3kgE/ccv/b8I=;
 b=zO0o++JruLOaxfOJoHHbG4RXxabpmTc5hkXsVFYMaaJsl3P+nXckTa8OxRHgtmEKOrzvYE4ieUkJSm76A/HeAgB4hmI6Q5iTGaK9phGtWvP3FrNKUNsmWWwukak6HDXqbFcJuthRXC0nIuy707ZWC+2TBiPuWHEV9sNWgg2u0lhhz4oKUvlmBrINUJS7/V54iV3lRINhdRT7TZoKWE+dj/TNGC5v4D6TqECGEQb7xR5hbyp5gqmO9M/Q34U+03QVJF20JOjPGmwqvrtjJuVrnE83CM73BMGUGyE3QCQrcP8I382K32MJXAQ3k59AQHCoP392PQ83DD1Lp//Gjio9xQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8320.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.11; Mon, 25 Nov
 2024 12:09:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 12:09:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] builder: set CVE_PRODUCT
Thread-Topic: [OE-core][PATCH] builder: set CVE_PRODUCT
Thread-Index: AQHbPmxOxFENhDdNtUiz3qqIv8wjg7LH3fEAgAAJ/uA=
Date: Mon, 25 Nov 2024 12:09:08 +0000
Message-ID: 
 <AS1PR10MB569758C88F50C1C49C70D595FD2E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241124122711.18001-1-peter.marko@siemens.com>
 <7E848D03-BCBA-4C6D-8986-3B4DC9135287@arm.com>
In-Reply-To: <7E848D03-BCBA-4C6D-8986-3B4DC9135287@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9c4d3a9f-97f9-40d4-b324-5b58ff35b3c2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-11-25T12:05:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8320:EE_
x-ms-office365-filtering-correlation-id: b61b63be-5183-4dac-8317-08dd0d49f738
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?V2kxWC9PWlIzTHV0Nm9BVmJjTTBTbEEzd21FeGNmN0FocmlMOWNiaElBazlG?=
 =?utf-8?B?TE81SmJ2cnlXT3NtNHZ2cFZ0OVlnQkhnZjc1VStSQVB4VERYTEhrSlgxNXpJ?=
 =?utf-8?B?b29vRzQ2YnB6R3FNUUsrU3RaQkVQdUtIZzJvQUFwcmxZbUlrbFJOTy8vUVl3?=
 =?utf-8?B?RlE2enRxWWk5M0pVVGRIbU5KVCtseitxOVlnZlh2TzdJUDVYV2M1YlZyYWdx?=
 =?utf-8?B?Q1pYcytnRDQySWR4dzRGMEhKelFFaThCNENreGgxd2dqS1JTNnQ0dFB5aHhS?=
 =?utf-8?B?QjZWd1VpMng4MEkrR05GSkVzcWpINFpNM1dkUWlkMDAzaXhuMlo5Z2dRa2Vj?=
 =?utf-8?B?SmtOMUsveGR2bVdKa21BRzRDbkFLMHdUb1pxOHdGN1BDY2RFdTU3VkZDSVlx?=
 =?utf-8?B?SURCMG1zQno1UTNXVWFsams2anVUY2NFUVYvNWhrdVMzTm9rYjNsU2dUSzhO?=
 =?utf-8?B?U2I1QjNOTzY5dlc1MjJWeUROMks3M0MxYVlMZTJOeElmb0FCVE0vclNJTWY5?=
 =?utf-8?B?WEZ1a0l1Z1NPWUlqUkFIcTR6QkNNUW9Na3ZINmhBdDBuOXJwcHFvRWo4NWdX?=
 =?utf-8?B?NG5RWGpZc3ZUUUhMbEY1YkhKUytxMUhxbHFDTWpMMmJOREdYaGdRRU5EUzJL?=
 =?utf-8?B?YVJWcmpFZzAxMUo5cTZabFYramdyazF2SkFDTTdKWkNQU1l3S0hZSkpyaXQv?=
 =?utf-8?B?eUV4RGwrYUkrL0pqOFgrb0JIMEtCRTlkTFlDeHBEOTFsaytwRnNNZXJ5TU1Y?=
 =?utf-8?B?UHlQZHpPWHZXYjZOazM2YVBmODkyT2Y3Y2Z0bnFKMUtYRXpvMml0dUhhRVV5?=
 =?utf-8?B?SXlodExmSk1NbFlEdm1oNzVDR0QzQWRnRHVwbkQ3VjZxT0U3UXYwdVZyZkhN?=
 =?utf-8?B?ZHU1a05QbUQ5bmR0Z0tkV3RQQlp5bGlVTmhEeDN1TFBhWTJEck1mRjlNTGU5?=
 =?utf-8?B?VVlYOW01SHpZaVYwd2dzQWh1L0R3dDJXRVBrYmNQaldwTVRhb1B2RmNCR3cv?=
 =?utf-8?B?dVRaMzhZRTRyclVEZ1JvRloweWRyU3NzcEh6MUZncGdCTDQ4WkRNUkkrc0RT?=
 =?utf-8?B?RHZrZWhOQkdtUDdPbzRuNDcrZDRVeWFSeXhkbHhVbGJsZUh0YkZnbVhiNWxl?=
 =?utf-8?B?cXErVTgyUnhGQnR1MXNvV0REK3Y1OWpQY1VOZTgrdVRTQVdCT0ZEVVFUV2Fp?=
 =?utf-8?B?NDE4eFRqTldJNnpvSy9qdG80NWhDdmtMNVpUZzJVTTc2ZnBpVFdDWm5GUXlw?=
 =?utf-8?B?dEZHeHFSU2ZqS3lNMzVxQ1lVZFEzcXFES3JIdFBIVFd3MUozSnMxaXpEY1N1?=
 =?utf-8?B?aFVQSWJCSjJPeUlCMXN4S29XUG5DSGZ1YVJpUCsvS09JSW5GcjlxdERPWkdk?=
 =?utf-8?B?OGRKdWpPL0plOENOcGhJTFZHVG5nUE9qMnpGbUlna0gvMW1LYUtYNVZRTmlu?=
 =?utf-8?B?ZFNZRDZ6S3FUelFVL2hqWW9Mb1JqOE9SbFlBdktGeFFJR2dMK0toV3FrT0wy?=
 =?utf-8?B?bTgrczQwMTBBbmR5WWJZOTM2ZFJDSXJaSWo1YXhnTG9mbW4xd1ZUdm1VTERU?=
 =?utf-8?B?N0RWaU9oanVhbkIzaFZ0cVQ1Sk9iWUZUZHdqWkRqcjRLa3BaMlpSOWE3TWpZ?=
 =?utf-8?B?RUJpYlh2UmwzdXZsREU1TEpjNzFsNTY5QUlKRDZVSEhjMnA4UUhUY2NUOHFG?=
 =?utf-8?B?VWFBNnNIbGs0VFlBSDZ0WUtTbG9sZHJjSHE4Tk9ya0hhNDN5VjBVRmlWeUhZ?=
 =?utf-8?B?SnhseDlHWGxzU096L3ExL2lCemRVYTNkS2liOHBNUEZaRmkwTzZTOHk4ZnRj?=
 =?utf-8?B?RFFMZDJ2V3BtQUpWNVZHL2ZJZmZsdEo0bEVyb0M5bHdwVENnWWlZcVgwT2pB?=
 =?utf-8?B?dVJUSXJMOXBXVys3cmVQWGZTMFFQNUlsejljL0lOYzFtWFE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U2FsTjgrbDB6eDA2ZW1yTGJ1ODZxcE53Rm94TnpHbFBoZVVlclFvTTBlQS91?=
 =?utf-8?B?dVhQQ29GNUNuN0QzNzh5bllIWUw2ZTFnTTBlQ1Y2NlY1cUJCbXhlVzRvZVVt?=
 =?utf-8?B?cmRlTFByQVZVZjZBdVVBT2tVK1F3N20xcU9WMEx2aWx5b2tvV3M1bU45Tkgx?=
 =?utf-8?B?VkNvc20rOWt2SXMvYlArd2gzTXpuTWloVmovbzdKbW4zOC9mdU9TKzQ1L2d6?=
 =?utf-8?B?S0w4U2ovRWlEaWJjY2N6RERPZUJXMzNnQlMxRVJXZFhzM3Fzd2lENkd4dCtz?=
 =?utf-8?B?U0wrdFZXeDJ1bVQvYTFtdlFHSTM5Y0pGRU50THlFS3lsR29EVXk3MXBDWkNy?=
 =?utf-8?B?V2ZaU3Qyd3pMeFZZUFV2ZkxrN3grR3Aydml5cFFqeWhESWRqWGF0Q0c1YzE0?=
 =?utf-8?B?bkF4MVlob1ZTUjg3TzZpMWJ1ZzdkRksyQU9odzllOERxd0tGam1uckRsVVBK?=
 =?utf-8?B?VGRVRktsK0JhRDhOdmlyT2hjaTZ3b0tJTjlkNUlab2FjcEZ6S0ZzTERiNTF1?=
 =?utf-8?B?cGp1RUNidEhkVFluYkdBb09qdGJ0K2x5NVhsTE02WmpocFdndEFQYlMvcWNy?=
 =?utf-8?B?M0dqMHJ0aUdOdDFidVV0ejQvOHRldUZCOHpNRkp2dVlTOElpVkRyNU5ONmRH?=
 =?utf-8?B?SFk5SE0wYmF4VmVQV0xGUDErSHYzckVwaE1FVWlXTGZXWjI3MnVGRXhpSWdV?=
 =?utf-8?B?MUxjQTRHbWQvSXJyNDVJdjJram5PTEJhaGsrb1ZWbXJSNG40VDloOWFZUjRk?=
 =?utf-8?B?UmIrb3FVejRSWjFxV1plZHY2RVQ1NnA1S3lvanJUUGJVSmhhMVdldWlWNUw0?=
 =?utf-8?B?MElzQ2FML0lKUHcyMmtKMnNZZG9ucnhZUnh2STdZVkFuTFIwUXBoYWVjNERD?=
 =?utf-8?B?eDFBUVg5dk9RaWI3cFpnNVpwZk9MN1hRNjV6UVBMeWh6SlNpSlM3aGtLV2FR?=
 =?utf-8?B?Wm5zM1B5T3JVNkxsbHRoRXBtMllPUjlwSDlNajIzUm5MV1ZQYXIyOTBzcURK?=
 =?utf-8?B?Yjdzajh5N1NYMUNtMzRoVDMwc1VVNGNyTDUva1NORm5nWHJRMW80NW1taGJB?=
 =?utf-8?B?UWZrRWQ4SHNsKy9UWWVteDNKVE1DbDFWWTBveDBrcnVLdGpTU0pyY2xRdFlY?=
 =?utf-8?B?THJHQ3VlREgxSDZVSG9IRVUwUXpEKzhvc2NKRmVMaStKNkFqTXdYUVdOMTh0?=
 =?utf-8?B?a3JwaGhoNFpsRThBVEdCOGppK21XRU5SRHU4ZVluLytYU1lRdWJxTkNEeUJB?=
 =?utf-8?B?S0oxc0ZJenZ6cko3UHpTRkEvc0VXMVRuRFJXbkJRN2xxdFpyOTF5Uzd3TFBW?=
 =?utf-8?B?OXU5TWhwTXNNenBLY2pGbDEyYzJLaXBYYTlEMVEyUEh0Wkw3MlRUS24rUGhX?=
 =?utf-8?B?UnlGVVJXeXoxYkl0cHlOS2w2a1EwanVCRjVFejlRMXRsbHRZd2Eva2dEQkpP?=
 =?utf-8?B?UGd4S2xxMTRQQjcrK1M0SlBNS0U0ek9tRzFFVlgzdkVmc0o4WEpLSkQ0NW5W?=
 =?utf-8?B?TTdHeXZNcTBYNndjMXQ4YmZ6Slhyck5xZGZ6M1pvanl3U24vNG11KzhXakky?=
 =?utf-8?B?amU4SHBzM2VGalVXR2xzcHRRRWtYTTBXUkt5YlNscGFPdmsyV3BmZ3d0Mlo1?=
 =?utf-8?B?MitJQjN2L25FR3hiZXJuU29FRzlZMkg0WGIwalAzRmJhdW5HeU80NENWc3d5?=
 =?utf-8?B?ZXllZUhPbmZZVkM5WVJNWDFQZm1GSFFBYVhaTmZFRUdHMXBYLzV2cmo4Rnpo?=
 =?utf-8?B?WjJ4a01Kb0taU3JTRHgycjI3NW1obnphaXF5RXNPbmRoU0w5SWtZQ2k5QTJz?=
 =?utf-8?B?YktSdXRwMWpIZ0Jkakk2Z21mNkM0c0xBNCtQV2k4eGM4RGNPMkF3ZUkxRU4w?=
 =?utf-8?B?OG1RK09Vc3QvRnYvWGxGQ2FWbWpwRXZKOFV3RWg5ZEdjVk5FTXVva3hUbmw0?=
 =?utf-8?B?amJTL2szeHRyaUFrc2hqdy9BL1d5enlSQlBWRW0vOGFhWVJRK1VYVFE2M3RI?=
 =?utf-8?B?NFZTaW9Mc0dwMEtESENKRGd4SDFZcTFYUGk2SEN4a2dHUXR5bXB5dk8xQ1J2?=
 =?utf-8?B?NURVZXRJNHh6MUwwUnRXa1VUdmJVMWg0Q1lsNm1tN3FvQVp6b0JZbFB5QjBL?=
 =?utf-8?Q?LPJEnEZ5OIKJAjpi15Ze1ZjpK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b61b63be-5183-4dac-8317-08dd0d49f738
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 12:09:08.7504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGMrUXgrGONPxe6HJHKtUugXctNZUOQmQVpg5ilpbGr5bSVb7G/KnoOCFsDih1CqXVMxYVLkwt8DU/AfTT5ugw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8320
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207784

SGkgUm9zcywNCg0KSSBoYXZlIHJlYWxpemVkIHRoaXMgYW5kIHNlbnQgdjIgd2l0aCB5b2N0b3By
b2plY3Qgb25seSAxMCBtaW51dGVzIGFmdGVyIHNlbmRpbmcgdGhpcyBwYXRjaC4NCkkgZ3Vlc3Mg
SSBoYXZlIGZvcmdvdHRlbiB0byBjaGFpbiBpdCB3aXRoIC0taW4tcmVwbHktdG89LCBzb3JyeSBm
b3IgdGhhdC4NCg0KUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4NCj4gU2VudDogTW9uZGF5LCBOb3Zl
bWJlciAyNSwgMjAyNCAxMjozMA0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEp
IDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gYnVpbGRl
cjogc2V0IENWRV9QUk9EVUNUDQo+IA0KPiBPbiAyNCBOb3YgMjAyNCwgYXQgMTI6MjcsIFBldGVy
IE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxwZXRlci5tYXJrbz1zaWVtZW5z
LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiAtQ1ZFX1NUQVRVU1tDVkUt
MjAwOC00MTc4XSA9ICJjcGUtaW5jb3JyZWN0OiBUaGlzIENWRSBpcyBmb3IgYW4gdW5yZWxhdGVk
DQo+IGJ1aWxkZXIiDQo+ID4gKyMgZG8gbm90IHJlcG9ydCBDVkVzIGZvciBvdGhlciBidWlsZGVy
IGFwcHMNCj4gPiArQ1ZFX1BST0RVQ1QgPSAieW9jdG86YnVpbGRlciINCj4gDQo+IFBsZWFzZSBk
b27igJl0IG1ha2UgdXAgdmVuZG9yIG5hbWVzLiBUaGVyZSBhcmUgYWxyZWFkeSB5b2N0b19wcm9q
ZWN0IGFuZA0KPiB5b2N0b3Byb2plY3QgdmVuZG9ycyBzbyBsZXQncyBub3QgYWRkIGFub3RoZXIg
dmFyaWF0aW9uLiAgUGVyc29uYWxseSwgSSBsZWFuDQo+IHRvd2FyZHMgeW9jdG9wcm9qZWN0Lg0K
PiANCj4gUm9zcw0K

