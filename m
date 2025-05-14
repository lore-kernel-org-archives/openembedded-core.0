Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBB7C3ABCB
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 06:43:38 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.69])
 by mx.groups.io with SMTP id smtpd.web11.96395.1747205014843646597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 23:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=aZqixS+2;
 spf=pass (domain: siemens.com, ip: 40.107.247.69, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irFOUoGeiuZMiUIORvqXMtbBS1+Kde+73jnXCIKF/XN4RaXmqbBYnFWRZsnKTt3eQ1d9VMN9b5+MQXyMPlK75TrvkYp4ra6VtmRsqcTKdEOEIvyr1cNmUnqvQFq+C7Mn19thLz6oWvqIe1uTR0bg08vu22367n8g5wepjvgFg+bwe1BA+oteMVsJ6MTnJ7aw/zsxg2wIiG65rZ+RTdG7FIfhQlxsTZJq+MYBPSM8GsxRsN9gUxqBBy2dyiFMTfpVJeeAvRW75wWmpmvvfiDa9Ned5dmuDgdgjNypD6f8ee4HqegKyxpH9DTMEjyzQDBeELcAz3kTGd/luyotC4uMgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Wo21vEy/GR5MT2iCa3Z2aIxwh+2DbS0/MxRVWL1zvY=;
 b=w0Fqc9Y17rLpvlUduCGYJ8/9kIXbiy7zLIS0OU1kwqEtgwxOqeYEpKof7+WXmKVCHXGE7peLqEJ1v8GzG4Oj5ho09CDhyrFLPT5Th8xEJ34gZY5D125umpU0vrw0GUIX+oVUTINKkKi4/4ph79NMja6OlalxX5VRy0sX48nEjELyiGZgl9FcrqOJpNuTAUyVA/PRks23ApFJL8ut4rz1suttptXL959XERbsKy4rvk/VxUHP601KvEVc9kQnISgPLTggGig3Y9mz0m/aVjynUJNZg9Ruc7WMi2RZg3oI1SAkZx8eDOD8Fvxbe7WEhyc6FxlXy4nL8WHGvhErylfksg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Wo21vEy/GR5MT2iCa3Z2aIxwh+2DbS0/MxRVWL1zvY=;
 b=aZqixS+2m2FeMIdcyyG34u7ZdJUJc75XMSnPmaKpfZNsQ8xnAl2k7wDQ061hqqYY2jvRNItK/WgFGxDyc9AgmKR5aZaWik6EtHWkIbf5WLGYbmE385OW+LgiIOkLnlRyRall4SIW7aSeTYhKYeTIEI/cVkXdp9n4D/4J78+v49TO8duLgsZKoEERmbk7A4XYC9Q7oj+awFbcLTgl1DerBlgT7+SJ/J2j9ZxkYF+sOxMe3MzRRR9U8LC0sJ2z3FPMnPI4xeMn+zLeZLCuhpbeDacGb121/tlvX6XCf60nIkAtBjXw/A5SZr8wQyo4AYdX4Lvvq5T1et+SyJhmCIAgqw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB5844.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:53::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 06:43:30 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 06:43:30 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "steve@sakoman.com"
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [yocto-security] OE-core CVE metrics for walnascar on Sun 11 May
 2025 01:49:49 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for walnascar on Sun 11 May
 2025 01:49:49 AM HST
Thread-Index: AQHbwms4yI6Y9ZGS1EqNnHRedONdv7PNwtwAgAABmgCAA+174A==
Date: Wed, 14 May 2025 06:43:29 +0000
Message-ID: 
 <AS1PR10MB569724059D582CAF8A6A2A8CFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250511115243.D83E9100407@builder.sakoman.com>
	 <AS1PR10MB5697B496C5947EC961F51DBFFD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <3a5a047bd48aae6576a4422f421616211b1a262d.camel@linuxfoundation.org>
In-Reply-To: 
 <3a5a047bd48aae6576a4422f421616211b1a262d.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=35049397-4f35-4676-ace0-a840e7e15f01;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-14T06:42:41Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB5844:EE_
x-ms-office365-filtering-correlation-id: fc7d527b-567b-4fe4-eba4-08dd92b2a375
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TXpoWXE1QThxdnNtcElNQ3dkQ2R5RDdLRFc3STJxcUFIMUpCQzAyUjdBTFlp?=
 =?utf-8?B?amIwRkZmNXo2cjZYYzg0Y3dGTFBTb1N6SUkvOVlONU9ucG5MbDd6c2k5MEZT?=
 =?utf-8?B?KzdpS1VrRWVxSFRYSkkya1plLzF0YnNvR2VsVWJZMnRzSGhVOEF5bHl3V1Br?=
 =?utf-8?B?Z3E3UHBCUkJCSityTFlzNVBETjJaNFZSTmNXcjJjaFlZbkJ5N1p1MzRTMG1W?=
 =?utf-8?B?Y0QwWUY0RGRMK0pxREYwY1N2N1hPYXdjalEzSDZwUXdBeW9aTWVGNWdHSG9u?=
 =?utf-8?B?YURGdm9OSVNFQ3RXRGtyOHh4RlhiczNHRUlPZHU1eTVkR0ZwZkkyVWRPR3pL?=
 =?utf-8?B?TWxsdllqTnZUZXBaMEZlNzMydDVRNkRFanArNXRpeFloc1hQbElrcEV0a3hK?=
 =?utf-8?B?dmp5OENYc0xkTEljNFd6MGg4a0Y4KzZod0M2NzB1WTdRUFVLNUxiL0RFdWZk?=
 =?utf-8?B?bmJuK1RrL1JxUjRCZFBNeGNyazZvL1VnMEpJTml0L1dFbU1CdDJOWktLM2I4?=
 =?utf-8?B?TTFORmdTdUs4dmpkOGV0blVTeXB5UVdFY3N0U3dxelhtOC9RUmVYaUJIbnVs?=
 =?utf-8?B?T2c4SW1CV1RnSWR3L0dIcTJIc1ZlQW5Rc0J5T1gwT24yZ1JYbzBRV1VZYjRC?=
 =?utf-8?B?SXdCaThCR1pzTzM4NG5wN2xsUEE0RFJMa3ZtZ2hkdTFOZWNwdHp3Y0lReW5H?=
 =?utf-8?B?WlVsb1hhS1NmczEweFlpQzFEdzNMSGZiRDRuTHBXdW9yM1dzZEd1aS85NU9t?=
 =?utf-8?B?V0VVYlVXM0VsRFZ0OWpxMi9iaUNrTlFHQTd3a3Jmc3Nrd0RrOUNaem9IRkJ4?=
 =?utf-8?B?Rnl6RVBOdnB5dFRBZFBFWG15MVlWRUNZNk5LbC81SEtqdWNXaVhnb2tvTEJP?=
 =?utf-8?B?R0FBV2NXdVZDYTNXZUdCM2hPMC9hWlJ3azIySHkzcUM0ejI0Qmh6MXhweEda?=
 =?utf-8?B?eUtxdEhaZ0ZmeGlzcXBQUGRUY2dtV0gveUpUbFFKWk1wVzJ5NnZubmUzUmE1?=
 =?utf-8?B?UUJrZXVkbThNVDFTbTh5ZTRSN3RWcEh0bnJWOFNZb3lTUUZ4dHhwbThJOTh5?=
 =?utf-8?B?Y0ZMTk1aemRrczBSc3cySkRSalFPd25HVm9XNy9KN1Z2dTMxWHN0cHN3amxD?=
 =?utf-8?B?RTFiTGZkc0x1dWlhamRYd2hYYnVjMlc1TWx1dE9VeGJjUUV2c0JHZjRqMEoz?=
 =?utf-8?B?dm84a09mRGtsUFU0VUxZL0d5bCtSMVUyR0dKaHVZTDlEdk9OS1lLelBZU09L?=
 =?utf-8?B?US9zcERaSTVGVXhWZTZaWGY0a3h3b0xzYkFoZUt6U2hsYzlKZGx5REh0UlEr?=
 =?utf-8?B?VnByTDV5SWJYTkZMaEVWdTRnbHJ2bEhrZDNqdGpIMjBXT1ozMDR6aGhqaXhB?=
 =?utf-8?B?a2IzbkZRdE40UlVWMVJDemtCb0VqUmZsejBnVTNla1VoV212clVWSnI3M0JJ?=
 =?utf-8?B?T2pQY2tKd2JqREZ3OXcvb2pPUjhQaGMyaGpZL0hNR2hxVFRCRWwzZU5HdXg4?=
 =?utf-8?B?cXQ0cTFPeTJQb2wyb3pFZ25kSjRYR0w1MEZEL0dSOTN5d2JWTDBZWC9DNWVr?=
 =?utf-8?B?NXlSTmJHL3ZrTzdRM0tZU1BUYXl5WDJKZzRxUTdETDJObXQrVG9jMEMvUXoz?=
 =?utf-8?B?d1ZNM0ZuR0FDbk1LYXRzNzAxaEdmem9hNWxpeGZXSXBodGhjTVRaT05SWFpD?=
 =?utf-8?B?UnBqMEF5MThwaldtMmFMVmRVMVVCc2FqcXMvcVFKcmRJU0ZvZTBwZ3Bnbld0?=
 =?utf-8?B?bmg0MkJORHB4UkxQLzB2ejlxNVk0aVF5ZGliNTA2ZHNkTW5Ddjl3UkwvN0ZZ?=
 =?utf-8?B?eTVLK0RSVmRSUjFvVC9hOU5mRmdabGRpQ2hjdmgwQ1BVSUxkWm5VZjNzOWc4?=
 =?utf-8?B?Qmt4bXdBeFd5SG1la0hmcExvTEtWL0FYZGJXeCtSVUdteTBVOTBvNVlkQ1gw?=
 =?utf-8?B?RWl1djQ0azhCVW5SZVZYQmlBTUMxVE9NaUFadk1nMzVrNi9lelJJcGtoaHox?=
 =?utf-8?Q?ShmsxjzzD3lf3i2XzXWxbZCfbLTbCs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NWVsMmFKZUZXc3M4MHBUd29ZMXdiT3FjMDRsRVRLam16N0FCRkNOVm10ZkVN?=
 =?utf-8?B?bDNKeVozdkp5dW1aU0NuUmtQVTFEa0N6NFppc2ZNd1pmbU9oQWtRN0tNS0VC?=
 =?utf-8?B?MjEyQ1Mzcjd3aTVmRkl6bDQ1WGtQeXNWYklGNzVvRkEwVmkrd3FoVmhGVHpQ?=
 =?utf-8?B?QzR5b2JnQnNjTnA1N0NpcC95Q2oydGxnTEtJMk41emI0RUMyYmhTMEtUTks0?=
 =?utf-8?B?Mi9qaDRrN1NDNzhPQ3FxaGxRN285ZldldnNucWlOVldHR2pMVTRBSFRiQ056?=
 =?utf-8?B?UExPeTBMMXJBOEVRT3NmR1JxazZKTFhjMDQvbFBnOUtJWTJWUFE1Z3NrRWFo?=
 =?utf-8?B?YjJtc1dCNGpuanNKQjh4ZGJhV3hjb1FpeWZ3RWZvd05QUHRuVXJiM3RlUzlw?=
 =?utf-8?B?YUY1SFQzNUZEcmp5SzFzUDFEcXp3eDBPNkxpaEk4Q0lXdEdmVTRNelNqdy9j?=
 =?utf-8?B?b21sWUNiQ0xiejdicGpBLzlNd3ZlYmJ0Z2UvT0VxRGVSRkNhdGYwR0MvcHhU?=
 =?utf-8?B?M1VOZ0hXSXgyemFaU1hXa01NclhSc0ErbTBZQ3VBY3UzVXk2Qk40Y3FCdldq?=
 =?utf-8?B?V0dTYSs0RkYvNE9KeWN5Q1J5cm5OalkzdlpWTXJyMUw1bExyalZBZVo4R0RM?=
 =?utf-8?B?aU1oekdxNFlzS250Q2VjcmcyQUZvci83enBTZk95MWk3Rndua1lGM0RmQllM?=
 =?utf-8?B?UjVqc1RQVmxaN1o0UEZnVVJxWUIvQ1NuUkxIR0VKMEM3Y24rVHZCMkczQzEr?=
 =?utf-8?B?R21HSHNFOS8yMURxKzFSSUYwUjVwRURiaEZoZGJZWlUrV3pmNCthdFA2U0NQ?=
 =?utf-8?B?Z1dXeHdKTnNYR1F3VVdSMnhtRVIydk5SWkRRZThjUld2Y095K3hIQ3ZVUzhK?=
 =?utf-8?B?ZTZyTWIvdkh6emFyL3kzRzN5MkVIWlFOYnNNN2tEUWtWM0dPam5RMzJsNWNV?=
 =?utf-8?B?WENZQnJxVnlNRGc0VjJISG5QZS9rRGVsRlFVU09RdVNRR0xrVUdiOUVwOVN5?=
 =?utf-8?B?YUozUlIwM1pjK2RlMW5oQlJnU3FSYlpRNklYN2RYMC9ZRU1VTmhvM3dWMkt6?=
 =?utf-8?B?YmZWMnNwblZ1ZisraDdtRDlUSnhqaDRrM3JndzVGdGRHZnVzcEpwaW54TmlW?=
 =?utf-8?B?L2JOMXc2dkJyWGp5VCtML01veDN5V0tYMHBZT3pDKzFuT1FGVjNzUkJ5TnM0?=
 =?utf-8?B?RmRERnp2dFJoc3NNSXVqSmt5UXBkTFhqMmhxcmFDN1AvRndjWWRLN3pZZDA5?=
 =?utf-8?B?cnhvTE9hMmpvWFNVSjNYSTdlUzIybW0ydjdxM1BhS3huMTJscW83VU5Cd1Fk?=
 =?utf-8?B?NGR0SWVpQUsyU3ZUY2t5VmZIdmRKcnJDbE9JSC9MaStNdk4vV0NSaUdwdXJC?=
 =?utf-8?B?Z3lYVFpMY2tRdzRSNURsZWYxWVR2N1VaNVBGZmlOdVZ3allHTW1GSGs5eTl1?=
 =?utf-8?B?RW1YbWc2MngxYXNLTTRjWm9FcTJBM3plZjhuT0tFRG4rNVZlVHRYM002SFgz?=
 =?utf-8?B?a25zSmdDeFdLR2w5eUZRZVljQnVxZ1JYS25JVDZFekJqc2ZOUTNHYjhaSzFK?=
 =?utf-8?B?eWFzcVNHQjlLbTlYc1IrNnNXZUpOVnpITHYxR2xHenpsdlNYZEl6ZnUrUUp6?=
 =?utf-8?B?UlIwaFB2ODQ3MUl0UzhHMDlRREhvUTNPeWRaZnBydUl2QnN5dDRkUE1qMGY0?=
 =?utf-8?B?SE9zYUs0cXg2QUQrbG41VnhaRTB4ZXpnaXdmVzU0Y29jRHkvNEQ1dHhXK1hV?=
 =?utf-8?B?OUt5aVpGM28wQ1VFekNmK0NVR3RsYkhQRHJCb1BLckNacjFPWXJFMU5RSlVq?=
 =?utf-8?B?L2dSTlFiMGErZzRoOG02N0M3NDVFQXdsbm1mcU0rVEVvc3lyMTUreTZaQk5G?=
 =?utf-8?B?UGJTampkZjFjcUpXTTN4RE9UbzN0WXFmYVpoYVBkZjljR1NvUnJZRzZ5WExG?=
 =?utf-8?B?aFRmb01ld2s3enVwbnYyckRvaG9xbkFRU1ZsZEp1ZnRTaGdRbE11YUpweEJP?=
 =?utf-8?B?dkVoODBVeXdaWm93U2FyNTBhY1hiWjBpa0xwckplNGlERHFvWGpYdndHb3ZE?=
 =?utf-8?B?NUd6NDYrbHFwL2xsSDJJM1FDQzR5cGxnaEVTWTVOUTVzZHFjb3pjL0Rta3Fu?=
 =?utf-8?Q?IYEe8PXMiLbzYHsY5ie8d5NCV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7d527b-567b-4fe4-eba4-08dd92b2a375
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 06:43:30.0669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RH62p36rjB9LTlnovF64DiQnU4nQ4DeYnlhxvcVNAGMC2NybO4Gdo5cvg/bQjLWRXXkmaVuLw/uuLqlnVFlSRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5844
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 06:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216475

U3VyZSB0aGluZywgSSBoYXZlIHNlbnQgMyBwYXRjaGVzIHRvIHlvY3RvLXBhdGNoZXMgb24gU3Vu
ZGF5Lg0KU28gZmFyIHRoZXkncmUgbm90IG1lcmdlZC4uLg0KDQpQZXRlcg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmc+IA0KU2VudDogU3VuZGF5LCBNYXkgMTEsIDIwMjUgMjA6NDQNClRv
OiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29t
Pjsgc3RldmVAc2Frb21hbi5jb207IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc7IHlvY3RvLXNlY3VyaXR5QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJl
OiBbeW9jdG8tc2VjdXJpdHldIE9FLWNvcmUgQ1ZFIG1ldHJpY3MgZm9yIHdhbG5hc2NhciBvbiBT
dW4gMTEgTWF5IDIwMjUgMDE6NDk6NDkgQU0gSFNUDQoNCk9uIFN1biwgMjAyNS0wNS0xMSBhdCAx
ODozOSArMDAwMCwgTWFya28sIFBldGVyIHdyb3RlOg0KPiBXb3VsZCBiZSBjb29sIGlmIGFsc28g
YXV0b2J1aWxkZXIvdmFsa3lyaWUgbWV0cmljcyB3b3VsZCBpbmNsdWRlDQo+IHdhbG5hc2NhciBi
eSBub3cuDQoNCkFsbCB0aGUgcmVwb3MgYXJlIHB1YmxpYyBzbyBhbnlvbmUgY291bGQgc2VuZCB0
aGUgYXBwcm9wcmlhdGUNCnBhdGNoZXMuLi4NCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQo=

