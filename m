Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDB9CCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:47:21 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8086.1762462033688173503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=jwANj7Ul;
 spf=pass (domain: siemens.com, ip: 52.101.83.62, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjwbGo0+qampyWyVeK65l6aPXoNT2YMNf4Ij1EXyej3HuNui9Oat8M3E18SK00a7kxO8X1KjY2xmhjxb/j6Zi6GaAo/qTyAjzMfejnu61wSxj2i2Vo1ddp5nqVASvkMVWsj8/giZPRwdM4GIKQzSRmQdOgI/8L7Ck71kpaRUa8Ps8rmktJJ0kbenl2Sa9eS3Cdr74RQmG9RyW3jxCr3uLoswnsoPPMerSvBAt5f9SdfVGftQCq0x3DW52u5+GQNqqPllE1IM7G67DumLwCKti8nvbLuoq5OBzMAvIReZKs7q/IPaL3FHb7dG5fYaPhrifZoyMJq8uCiHdm5EgtlzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASgF1lhGEGQ1fYZVN7kKCXyPztPVj1ngivqlf8CAkhk=;
 b=Jm5zvxNPY8E/SPt8KaZQZaJjZ0Hj4zQDE/+T4jiALZUBhTdG07q7/4rGzVQpgX3LQy7kqkZ9eH/8gwF51emjLw3nG4egtd7QonNk7kk8AGwv3pC7AaRZ2LL89Du/RrR+iPvBjjE2yUgZppQ093PBXdMCnywyBwSdNCOBbqO4NFwnvxW5eqzgQDHF/79+92H3+UH24xlzs8chYs3tQ02+NNqcZtNEx4uyfvmsDoxPXgVMy3guzjhkz/U9AdJcGYQFF9qf2G3W0CzDexdHiMl1uKD63H9cMgeHtAws/C57IV0FkD00zPW4x5shHwimue7w7YziP3mEnxRLIRCcWUxPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASgF1lhGEGQ1fYZVN7kKCXyPztPVj1ngivqlf8CAkhk=;
 b=jwANj7UlooOwfV6L9j4kV5KhHxHyM/HMgp/B3mfvp252fDaAQRSwzjbPj2HWq5Qh0zgNh8PjsqYqP6k144kyvjZO1afkJphEYv8DBBJRehqm0i1oW6GRvFhSctBxPsBHAjYanHHag1SMUq8VJyOWBnU23rKVh4saLP/o42ItIOVrnlU9VDIhzWhsst9XRaJy01+UIMJ2FiLxTkC+cdQdt50Ni1wRGRR6jsk28b5hpgrwQEkoBvCCjMXtxGJtEEK3YXU/b7i3/X7qr3D76QHXcPB4pjSWgCDZSHZI+sswMJMXoRRwECcW+gG3yiLOpD0AnB1ptG+9+wPQ/hT/8LoN/g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB3PR10MB6882.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 20:47:09 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9275.013; Thu, 6 Nov 2025
 20:47:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH] curl: ignore CVE-2025-10966
Thread-Topic: [OE-core][scarthgap][PATCH] curl: ignore CVE-2025-10966
Thread-Index: AQHcT1rJLHb3bSEluk+cZNceM9j/+7TmHRuAgAAA+1A=
Date: Thu, 6 Nov 2025 20:47:08 +0000
Message-ID: 
 <AS1PR10MB56972E44BD591D3BC005DAABFDC2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251106202021.3084656-1-peter.marko@siemens.com>
 <CADySD0EgHBdCVRD0evUJ+tzwTMpSZBnG6qMOC+z5NqnMKEg9bg@mail.gmail.com>
In-Reply-To: 
 <CADySD0EgHBdCVRD0evUJ+tzwTMpSZBnG6qMOC+z5NqnMKEg9bg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0a80589e-0c7f-4565-a4aa-5442191e3c67;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-06T20:46:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB3PR10MB6882:EE_
x-ms-office365-filtering-correlation-id: fe3223dd-4038-40a8-4a25-08de1d75a75d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cXo1ZU5qZGV2dmVJb2doNkZveGtCQmFvQjZxVWV1WU5GY3VXK0p2RUQ5WjMz?=
 =?utf-8?B?R0VlcEJYdFFFd3lRRVNHVGIrc0dvWWdkeWFXQkZBMW80RFFXNHBZVFBaU0Rz?=
 =?utf-8?B?UmNpcjBvMDY1d0hqM0MvdnhuNUhiYVh3c092aDdsY3ZuWU52L3dRdURubXl4?=
 =?utf-8?B?MjJRWEFzUnRPbGhGd1FHYVRsblJORUNBbkNwR2pORDVleHhseGxKRWI5M3Jw?=
 =?utf-8?B?ditTQ285eG5vTktKWVBTQTJFVzhZNll6SUdmZCs3MS84eitBQVJFZjRHVEg1?=
 =?utf-8?B?a2Yyamp5aWwrU0J1Y0prYlF0VXkzQ0lESFZLb05wWjhCdXRpeFUvN09iaTcv?=
 =?utf-8?B?T2J3TGpXUVYzYU82R2pIWlBuT3BSbzVYc1V3OXdFZWhudjFMc09iaFQzRkJx?=
 =?utf-8?B?Y3NzOW9sWGsybitUbHpmbUFQT2s0YXVQQmhDbmFJYmU2dWJKdUYxN2F5Q1ZY?=
 =?utf-8?B?ZlFyVnVxeVVPbjFiS0R0Uitkc0N1UDhQQTYyTlRrdnpJWVZTckh1cCtOd2Ey?=
 =?utf-8?B?SVR1QTI4L3dWMk9kQk83L1AyQUpXcXhsSHFrbGd4VVFXU0xJc2Z1SE5YVXNZ?=
 =?utf-8?B?NmFRaDUrTlJMT0ZvR1RwTjQ4bFVjd0lOWDJwZ1hCN3FLdjg5Y3NxeHJ3WlU1?=
 =?utf-8?B?NXF0OVlDTEt4UENNb1BqYkJqUHdmbmpUVStzQVBLbE8zTlo0YmRVMFBPenUy?=
 =?utf-8?B?ZndYTm9UZjY4M0toaEd3V3Y4SFFIZGtSc1l6TzhWeGFJaFBIdGhibnJqbDJJ?=
 =?utf-8?B?cnBGeCtRQkRUZk9nUWVaM1lSL2lkZWR2Wk1WQlRvalVDcGY1QlEyRTNYK3Ju?=
 =?utf-8?B?Z3owMEpUS2M2SE42Z2lFdUdESkU0SHo1N3NXM3YwdGJPaldod2dDODR6am96?=
 =?utf-8?B?cUVRT3pjaTloUXhISGtSeHRGYVZHcStSYzBJUERPTWlCbHhDTTNwSTdIUklz?=
 =?utf-8?B?cTk3WG5nclhHV2Y5RU95R1JzN3VaNllkRzYzK3NnaUMyeXErVnI5TmRwOUlM?=
 =?utf-8?B?ZGNTTjJNam5yR044dXgwYW9nRkplWisrWVdKRE9mTy8xTDZZSERnR1pKTndF?=
 =?utf-8?B?bzRybEhjU0dtQnBsWE82ejlBZG9ZNlNBVXZ3Ync5VEdUNnlMVWZnOVMwUUQz?=
 =?utf-8?B?ZVhwOC9SUEdkemViSnhmSmxGUWJueTYzTUYySW5hdmZnODdHa0gxK3pSTWxR?=
 =?utf-8?B?UlpybldSK1pROU5Kak9JK2xBclF2aVUzVjI4aStVelpvenpIdFNFM3N2UC8r?=
 =?utf-8?B?UTl5WTUweXJQN0hpdlArWGhMUzAzNWdaam56QjlEa0lGK3NudUlZYXNTdFlN?=
 =?utf-8?B?enI1RWtvOGlWVnhucVFvQkN3NkZ3ZitFcW91cmJmU0dHeFpvYjdweWlob1Mw?=
 =?utf-8?B?bWhzNTF6ejBBOGY0aTJMS3IzREVZYXc5L1huU3hKRTNVY3VibXYrU3h3Zm41?=
 =?utf-8?B?bGFaOU9UNWw4b2lJWnpTYlRvdXJTd09DU0IwSnkwY1h5T2srcVhGRC85NDVS?=
 =?utf-8?B?M3ZPbUI2c2VFUEUvUUxwTlM5K0RMK1U1OFdIdDk0dTh3Z09JNWhqUnBVbWRD?=
 =?utf-8?B?eGJObUFMMUcwRWx2WDRiWmJMUGxFckE3YnlsWVpVYWU4K1NNRGVkaGhqTVpR?=
 =?utf-8?B?eUZWd25lS21mQ3dyMmtHelQ4eVU0OGtkZy9ScVpBa3RCOVJPdTFRWldwNnJh?=
 =?utf-8?B?K0NTSnhiRXhic253YkYwM2V1SjN0WndnTVVMalAwS3N4QTlrYTVuNEhnUVc2?=
 =?utf-8?B?bmhVVkVmRlg0eGRnN1kwcEVERFlXd1IvQTlUVFRKYWVvenp3TTRtaVJKQ1Nj?=
 =?utf-8?B?S014N0crdUJuWTBGOUs3czZqTkorb25vSG96NlBUck9yUVFjeWRxVm5KN1NW?=
 =?utf-8?B?VmNrSVV5YjIxbTZGVjZCcFA2R3NLRWE2NmNUN0F4WUZsdDVyQUh2SzYyclFy?=
 =?utf-8?B?OVpUVGRHTTIrdU1pYVdVUG54RHZ0cUIrQ1FXMG80bkxFSlhHZHkyelJZck5O?=
 =?utf-8?B?dDBsZ0h1UVFBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R0IySGQ5Q1pLWlJCcWZXTk5kU296VE1WaFA2bi9UTWlFMmdMcGxmUmFoRjVV?=
 =?utf-8?B?ZngySGJaRXlENHFOY1ArRFYyZHVvcTgxNG55T25ISWhUUlYrZys0djNUcHdh?=
 =?utf-8?B?cWt5UkM3dENqeEdBYkp6MFhDQmZCSGhLZzNaaHd2YnFQSFlXeFJsQVJOSWIx?=
 =?utf-8?B?WHZCZjBnUTN6Vnd5TEpreVZqdkpOYlpKWGRjT01WUkNoTEY4a2pldVlPRDIy?=
 =?utf-8?B?amNQci94V0FsV2FxdXFFTHFlZVFyamdPbi91N3cvakNINWh3MEU0bXRMeTNw?=
 =?utf-8?B?U0t3aWJ0bTIyOExxYmUyaG1Sakt0Uy9vSlZvbytzbUFUNFEza2VkY09DNE0y?=
 =?utf-8?B?di9rWmFOSzI3YmROeFVYUk50elZrM0c0M2poOHZIMC9IWjZWOFc3V2dkYnI0?=
 =?utf-8?B?MXJIOEttc1NHTVNiRzhVYndLTVgyTHcvUzEvWlc1WWxXU2FLTFU5WmpsRzhn?=
 =?utf-8?B?RVlENDBmejVZWDdFL0g1WTBJQlRITVE2MnZKRWpDQkJjb0FkYlZmMXM2ZFVL?=
 =?utf-8?B?Q1FPenRmcXlEcVV0cVBHdFRkWkhCbHN4Z0FhdWMzRGVqdXpuZWg5RGtpRWFD?=
 =?utf-8?B?RkRSSTh0RGkveW5JdHVYWlB4c2JWcnVCYmx2MmxhRWFSVVVqRWhlY1dHSnQy?=
 =?utf-8?B?all6OS9pWC8zQ0tpbDk1eEZWUEdVVGlHWSt3QTR1Z3FzZURRNWVHcUZMSCtN?=
 =?utf-8?B?RmRoaXpST1ZtbDdkM1g5ZXJVNGtGQ280MmtUcUtSaVF4TUJrdlorTEU4MEhm?=
 =?utf-8?B?U1E5V3ZmK3FRODR3NVgzT2pYc1lLdDhQRDF1QzVkbzFNaHA1b2xQc0JkbXV5?=
 =?utf-8?B?dWlRbmRqMDBjUUhyRGMwaFR0dG4waURFaTg4RVN3cWZEamkvM1FxVmh2b01j?=
 =?utf-8?B?VngvNzlBWFVUQStYQWF4SXYyaTdaOGo5TEpFZlVDK1M4T1c2azh2NnczYlFo?=
 =?utf-8?B?L1JBMFcrYWNZaXpyQVlVbkJwUTRrbDdlQVF5cTZ5MFNlTEtZVTdQbjdIck8r?=
 =?utf-8?B?L092UXVaRmI4MDBJY3NZY2R1dFB4aUgvV1Y3L2crbkZ6cDlBMkphcmtDWlcy?=
 =?utf-8?B?Ri9SR3hheXZNWjhMSWZGM1dwWnZvaWthS3ArVmVtVkx5UVRZT2U5V1JKUW1I?=
 =?utf-8?B?UkN3T2toK0c5SWVMZVpUK3BWeHhpUWE1VnNEMFE0NXlBcFk0c216eC9vems4?=
 =?utf-8?B?SEl1QXBlSkdyQ3JhMklGOHhZTUY1Zm1uaHc5R0RHd1dIQmJVTHhHOXBRY1Bn?=
 =?utf-8?B?MU9MK2swTG5NOU1qQllnV1ZVUFBBd0RRalc4QzhzdnRYYVZheGRTUlE2SlNy?=
 =?utf-8?B?a2VtaGhnclBPb28xYTRHQjl4bDFMUWJwMjRna1NaSGhlQlk0M25PT3piOS9F?=
 =?utf-8?B?NldBVWxqNkN1Z2trbDZHeFA0azh6ZmFYM1JjNGE3ODVuRG1yMzlnazh2TjhR?=
 =?utf-8?B?RmFnTW1mVzhCVVJoVmxKbzRWb2Q4TUtYNW5sR1lnVHU3QmwwZTBGTXBsdnkx?=
 =?utf-8?B?NUJKYU1CWUZoN0lMRTM4ZldQaUtJUGN5ckZVMmFqTGJBOG83YmFNa1dwYmZO?=
 =?utf-8?B?S3RhOG9PcU1EbXJJN25aS3ZreFpxWDgxemRtb3NVNEpzVElhWUhDR1VVRmdt?=
 =?utf-8?B?UCtMK2VjL29MakpXeWl3S0hOZTJSZ01oQndCSlA0SUMxeS9JVE80SkxpdmdJ?=
 =?utf-8?B?RzZFWndZdE1CR0tSRW1ZRktRak5SejNUeW1BSVJCK3VnbmdDcTR4ZE14bzhR?=
 =?utf-8?B?b0k3Tll5cXN4NWdzbXdkZlU2TWhQUWg3dlBHbjFIZDZBL05nR2w3RjU3SWVs?=
 =?utf-8?B?SkJjOWlHR3B0UFFzME5QRmFnMkVVMWlFdWJSQmkyejlDN09RQmhLQjRZYlBt?=
 =?utf-8?B?KzRSL2hMOE5TZHlHbzBBUzVIVTBjWmNxVFluZktyUW9IbGpBbjlyTjFPcmk5?=
 =?utf-8?B?VjBPQ0REa0RMRFFacmhMRUpDUmxLdzNBWUF2OHhIMnVrdXZOSWIzZnlObmNo?=
 =?utf-8?B?emswM0s0QWttTjlxSks1WkVGdi8reHR5Z3FCVVhsamVxNVZ6cTZTTk9pcVpx?=
 =?utf-8?B?MW4wV1RDY0NrajgyRWJXdTlJQ1dnMGNkTU1EOHRtdTkrSVJQZmh4cW9yQ1NK?=
 =?utf-8?Q?ww9M0K2jV0l5dvGQngkk13YBr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3223dd-4038-40a8-4a25-08de1d75a75d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 20:47:08.9408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o+Ey85Jd/4E2TX+Xc7etEL9CZx/0BHZITeR4q92zRhmcaKz5/LwO9HpnKyDEhlBLEWjTlL25wmWBIw3rBQBPSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6882
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226001

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5rdXIgVHlhZ2kgPGFu
a3VyLnR5YWdpODVAZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgNiwgMjAy
NSAyMTo0Mw0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJr
b0BzaWVtZW5zLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtzY2FydGhnYXBdW1BBVENIXSBjdXJsOiBp
Z25vcmUgQ1ZFLTIwMjUtMTA5NjYNCj4gDQo+IE9uIEZyaSwgTm92IDcsIDIwMjUgYXQgOToyMeKA
r0FNIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxwZXRlci5tYXJr
bz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IEZy
b206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0KPiA+IFBlciBb
MV0gdGhpcyBDVkUgYXBwbGllcyBvbmx5IHdoZW4gd29sZnNzbCBiYWNrZWQgaXMgdXNlZC4NCj4g
PiA4LjE3LjAgcmVtb3ZlZCBXb2xmU1NMIHN1cHBvcnQgY29tcGxldGVseS4NCj4gDQo+IEJ1dCB0
aGUgcmVjaXBlIHZlcnNpb24gaW4gdXNlIGlzIDguNy4xLCBzbyBob3cgaXMgdGhpcyBhcHBsaWNh
YmxlPyBPcg0KPiBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KDQpBbHNvIGhlcmUsIDguNy4xIGlz
IGxlc3MgdGhhbiA4LjE3LCBzbyB3aGVuIE5WRCBlbnRlcnMgQ1BFIGZvciB0aGlzIENWRSBpdCB3
b3VsZCBiZSByZXBvcnRlZCB3aXRob3V0IHRoaXMgcGF0Y2guDQoNClBldGVyDQoNCj4gDQo+ID4N
Cj4gPiBbMV0gaHR0cHM6Ly9jdXJsLnNlL2RvY3MvQ1ZFLTIwMjUtMTA5NjYuaHRtbA0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0K
PiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC43LjEuYmIgfCAx
ICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguNy4xLmJiIGIvbWV0YS9yZWNp
cGVzLQ0KPiBzdXBwb3J0L2N1cmwvY3VybF84LjcuMS5iYg0KPiA+IGluZGV4IDcxM2Q5MGEzNzg3
Li42YzAyNzQ2Mzk0OSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJs
L2N1cmxfOC43LjEuYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxf
OC43LjEuYmINCj4gPiBAQCAtMzksNiArMzksNyBAQCBDVkVfU1RBVFVTW0NWRS0yMDI0LTMyOTI4
XSA9ICJpZ25vcmVkOg0KPiBDVVJMT1BUX1NTTF9WRVJJRllQRUVSIHdhcyBkaXNhYmxlZCBvbiBn
bw0KPiA+DQo+ID4gIENWRV9TVEFUVVNbQ1ZFLTIwMjUtMDcyNV0gPSAibm90LWFwcGxpY2FibGUt
Y29uZmlnOiBnemlwIGRlY29tcHJlc3Npb24NCj4gb2YgY29udGVudC1lbmNvZGVkIEhUVFAgcmVz
cG9uc2VzIHdpdGggdGhlIGBDVVJMT1BUX0FDQ0VQVF9FTkNPRElOR2ANCj4gb3B0aW9uLCB1c2lu
ZyB6bGliIDEuMi4wLjMgb3Igb2xkZXIiDQo+ID4gIENWRV9TVEFUVVNbQ1ZFLTIwMjUtNTAyNV0g
PSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLA0KPiAnb3BlbnNzbCcsICdu
b3QtYXBwbGljYWJsZS1jb25maWc6IGFwcGxpY2FibGUgb25seSB3aXRoIHdvbGZzc2wnLCd1bnBh
dGNoZWQnLGQpfSINCj4gPiArQ1ZFX1NUQVRVU1tDVkUtMjAyNS0xMDk2Nl0gPSAiJHtAYmIudXRp
bHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLA0KPiAnb3BlbnNzbCcsICdub3QtYXBwbGljYWJs
ZS1jb25maWc6IGFwcGxpY2FibGUgb25seSB3aXRoIHdvbGZzc2wnLCd1bnBhdGNoZWQnLGQpfSIN
Cj4gPg0KPiA+DQo+ID4gIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBiaW5jb25maWcgbXVs
dGlsaWJfaGVhZGVyIHB0ZXN0DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+
IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+
IFZpZXcvUmVwbHkgT25saW5lICgjMjI1OTkyKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLQ0KPiBjb3JlL21lc3NhZ2UvMjI1OTkyDQo+ID4gTXV0ZSBUaGlz
IFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE2MTU5OTIzLzM2MTk3
MzcNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiBbYW5rdXIudHlhZ2k4NUBnbWFpbC5jb21d
DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K

