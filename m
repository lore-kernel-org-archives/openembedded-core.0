Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68405C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:15:09 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.81])
 by mx.groups.io with SMTP id smtpd.web10.22385.1747916101348792831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ogaJAGDu;
 spf=pass (domain: siemens.com, ip: 40.107.103.81, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9diMK4OtyM4V/mF0Yi4mvB17r96TteT4YxSI5XLHO0wZLIi4WpCLdg79IyedmbK16GQditi9UksKidv3rMDJ3eDEUrT9gASqcXTwzH6oXZ6/GhmmvQOxI4oWl7InAbisCY8dL4YPboEPVk9qcknuuP2rU+W3EslgkhfCx/vep48eaGw/2ka7sawiFbCZl3ktdeh8Q52E3MRqB0fSl7Q3aUJTVBS73ceSTwVXa/js2kF8RPxfH75JHfFpX8+Bxnji6POWVh6nsFujlorTGhfrGVrc9atSezpdwM1lAVs7yksKnOAJ8rrWwAsv3PCCMKeLM0rYD8pCE9WWHvrEHq8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5b6Dh0VK5xb3t4pFA9X8ODGx2WmtDAvIU9LRhpY1Yc=;
 b=yTHAvRKRIZORcH6mdzpVLnFKf7nq/JJg/elkiyovGzZeU20OvTuv/QM15RJTAf4pJOqyx24bwRvmHyu+cuY7VSwkd8nHyWeSjoxPxipsKrzEgzaOZ+EQuaP3FoGAq4aWqb4/X3G+tpbtkwu/Z5kGqtPeh+S4aD5YVh0Qkc/ASZGBjA0ZYmIHyFlJd8i4g7cQ9GmGuMgrHQouEEb6MCakG46x2hGMNzKTN2IO1yDYQ7FUQdAhling5nBbDFxoVQFhMjuAdTe0W3ihKkfBzLA8DyaRtyghHB0n4Kol/BEijysxGqB33NwfsqPDO76KfC6AspIuq1BVMch0eRQdstWThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5b6Dh0VK5xb3t4pFA9X8ODGx2WmtDAvIU9LRhpY1Yc=;
 b=ogaJAGDuTZiqEtlz6hHTmvfau0c43Ce8g2HjNhA1WPLnh/vFB7b93geT8sUSHyRg4rTk47viqtWOkMOJhjAtvlrr6MtqbgztQctgL6l0Kd1kpvywSRDT4O/IOzL85ohgpuYKWpBRv5wTS5bfn4icz84jn/TQLTqsDMi/kFqyby2qlklk90EfyQvqKLVTVzSilVKcmrHfX4UVMFKehdjYqWSAhyhSdfZ3UfQR5kXo7TLkWtfFBN3bw/YL2KmgsvG4dahFrQSKxLLA5LYzmRBOgr7JZ2HVpiWIMr2K/SZT9ppUGmoP1zN21sPptZt1vDnKJHv6VOh65vkH/s8sSutL0w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VE1PR10MB3901.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:164::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:14:57 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 12:14:57 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Hongxu Jia
	<hongxu.jia@windriver.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
Thread-Topic: [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
Thread-Index: AQHbyiezz4/hWYLLWUu2UN/JWqui2bPeMcAAgAAAPDCAACkdgIAANbVg
Date: Thu, 22 May 2025 12:14:57 +0000
Message-ID: 
 <AS1PR10MB5697DC8D007471A68D8709ECFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
 <DA2H7Z2IQH15.8AQHUB50F8SB@bootlin.com>
 <AS1PR10MB5697E603603C2156BCF1DE5CFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DA2KDA7L7YRZ.2I1CKTLPP29LZ@bootlin.com>
In-Reply-To: <DA2KDA7L7YRZ.2I1CKTLPP29LZ@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=725a50a8-93dc-41d2-ba20-875726c4ddf3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-22T12:10:50Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VE1PR10MB3901:EE_
x-ms-office365-filtering-correlation-id: f4b41b3f-9f11-4242-b9b6-08dd992a44be
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|13003099007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UGdNaHpranRXcmFsTzI1NFNjRHFpdjZldnZIYS9QM09xYTFRSWZzUkhENFg5?=
 =?utf-8?B?VDdFcG0yT1BkTzVJSnkxNE9TOVo1S0lTV1N5UzMxODYwWW5iaXY1bk4remdn?=
 =?utf-8?B?SGlYdmJwbk9vNGFQTDNmenlmTHNiWXlYcnBQbGVURDhMdUNiMkNPblYrSG5C?=
 =?utf-8?B?NFV2ZGx1ckJ1VnZhN1hvZTNSbmtMQ0VHYWF5eXRVMXgwSWRhdXB0M241Z0E0?=
 =?utf-8?B?TUllbGQzK2MreHVSSXZ5cG5DL1lBRDlxL0RnSitqcitwL2h1VmRReWVlRE5n?=
 =?utf-8?B?N2RvbFNQZm5ORGwxREZzcDBPb2RMOUdXNXc1N3hrb2dvdFp6V0hYdEdQd2FB?=
 =?utf-8?B?REdxUjZ2RVVqRmluV0p4L203Rk5aL2R1MjJHL1QxblVuTDZGTlVFNURpdlZr?=
 =?utf-8?B?K21XNVhueHQ5cnZmbTVEWG0zWll0MzVHVEpVWVhDeUFjZzZ2elhhS2VPU1Nt?=
 =?utf-8?B?OGRuV0dJbUFJWnVnbnd5cWp1eXJSdWYxUjdIRkVpOGFHNHpERENLNnNaclRp?=
 =?utf-8?B?YlkwNTRUQktQV2tPdGlUcnFaZ1FwU0xaY2hOai93aDZoSnNpZU1tcnpYbDNS?=
 =?utf-8?B?OTJza3RleEwzM3M4NCtmRldNejl1N1ZUL0FGdDhDbmRzMElqc2lDMkYwNnlR?=
 =?utf-8?B?RTg5OWFMUW02VGhQNTNJWDhRbzBKdkpFN2FhK1ZyMHZNS25HVTNLVkNjVVVx?=
 =?utf-8?B?RFlNQkd0Y3lNWnhSZms2UTZycExNL1czMWxpTlFrMWFhUzN3K2Z6U3NHNUJ6?=
 =?utf-8?B?WGl1UE02a1hYcVdqR3ZWSE5OQWRyNG8vQ01uYlJ2SkdXaWlRRDVsVGNpaThC?=
 =?utf-8?B?eEtSNW43bGFob1FKU1BRK1FzelFCcHdXV1BDYWtlM3FYejRUTFFIOUx2My9R?=
 =?utf-8?B?c25jQU1rV0x1YmFKSkEzS1FMRTVaQjk1bEM2Ui9ZMTlvRXRDZUlhSEpVSmFK?=
 =?utf-8?B?SSs3ZUtPMVV1T2JqTjNnc1ZTemtGQ2RGTHpKK1MxM0gxYWMzdEl5UU13MFIr?=
 =?utf-8?B?ZFkzaWZRYVlaSS8zRlBobW1EL0NsMS9lTGt6bzlOTUxLdlV2K3h3R21tQTA2?=
 =?utf-8?B?Zmo2SUFocDEwdGliMmxISExHNVh5RUc2NDdnZDEvejgxbFY2ZHFOd1hRWjFu?=
 =?utf-8?B?S1BNenlUMFNGQU53eWU1SEJHY0ZLeXJQOE1Va09MV2pYTVJ5UVFBeTNlVVoy?=
 =?utf-8?B?NEdnL0JNdExRSnczdEVWcWcxWlJVVTdQU004OTJhKzVHeStZT2E1Qm83QXZI?=
 =?utf-8?B?RE9sNDU4dk8xVmFrcktZOHMvYkNnU3NvblZwTVZFVzloYU5WNS9QK3dMUnpi?=
 =?utf-8?B?dHVsd3FvbkdnYVcrR0RiRncrUXE1U1N4RDR3MXRyMVRoZmprTGlpSGpWTzhO?=
 =?utf-8?B?anJIem5PeTlvRzlQcGV2VWJ1ZXdxVEJSa2ZSeUcySXg5TnNpV2xZZjB6c1pM?=
 =?utf-8?B?Z1A5cUZ5Q1hWUk5lM1lBemttMFdiYktWZWlqc0VJNVdCZStJMkhPSHludGFV?=
 =?utf-8?B?aEIzeElYallsbzlVQUtYUWx6ZDlyeFRDUzIyeVY5RnVnSEd3TkVLNzlOTzBh?=
 =?utf-8?B?Q3oxNm0xRStveU5qNmVRYVhYaDB0VFZrYWNVK2F3cGowZnlpQlBGU2kwTW9q?=
 =?utf-8?B?SjRRZ0Y4YnNxZkp5RnlMbXV5ZnFUSDdVa1dZTDBiR0JaVDVpeEpMdUhsZy9h?=
 =?utf-8?B?K0t1bVpveDRuZi9pWjlDdVJtYmlzdk5uWUtlczQrNG0xMGt3b01iNCtQV1VP?=
 =?utf-8?B?OFE1MnB2dHdLaHI0bk1SdWlUQUxlcEJ1QUVwc1Jqa1UzRGRWcjRtdER3SnZ3?=
 =?utf-8?B?a3kxeHcycGkvMXRkL2J3YUN6RXpBNWIyYlltR0pUTXp4TXpPd2t2d21DeFJh?=
 =?utf-8?B?WVZSTVoyeEdnTmFCZUtKNXRSOXYvY0dQOXdSMHBSK3Nmdmo3elp0Vm1mVEZH?=
 =?utf-8?Q?ulgVDDiSPoY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tjk3QWtLKzdnWmNJUTExcWwrcUhSbGdYOFBzcVJiaDhZais1amI2QmJIMDNi?=
 =?utf-8?B?Zm0waWhlN2lmYmZEZVZYZS9YS0djK2xRbUNqa3Q5aXlhMWRJSTg0aU8yQ0Fp?=
 =?utf-8?B?OEY5U1BhRzlvalBJVUFlMm1pOEkzY0g2Vk4vL011VFNwaHRrQUZreGthajV2?=
 =?utf-8?B?RE5JaEI5N0FRU3QrMjM2VjkyTXU5OFhFa0xEUEw1TVdGdUJlZ2FRTUF4cEV3?=
 =?utf-8?B?TW1lREtDb2ZOd0psbUZvZVlqZGVKeUNHZ3lxNlNkR0lCd2ZJWjRMeTQxemZh?=
 =?utf-8?B?Qjd3L2ptZ2xoSGwxN0dGcHprME9Sd3pJMjJLcFJUa1pid29HeFRldW55K1hG?=
 =?utf-8?B?Zk9zQVFTR3J3Qjd5K0hwd2J3amNCeWtvMGd4akpTU2NDSzNjREg4bkEyTjl3?=
 =?utf-8?B?T1hEeEZ5Z2FqblU5OWxFaEZ2bWphRVlOdEtid0kvS0phMTFVSlVTQnRrNFFB?=
 =?utf-8?B?UWpQc21LdVYwektYZnExMkxHYkQ3SitSM3BuZDlUTGphcXhqSnA5VCtWSVpK?=
 =?utf-8?B?a1RuWVpIMVYrdC9CYjlKS095MFhwTlZyYlNaWmlWTTJMWENrZTZqTDNRZDY3?=
 =?utf-8?B?RDVaK3M3c3AyQ1Bpd2NwSktIUjZEb2JtU2tJejN2bGpDMkRTazN4WU5sTkRD?=
 =?utf-8?B?alp5RzZ1MFU4ZWhBNHI1SThaNkR5RFVHM3VVOFNibndHWHVZb1h2YXpJK3VW?=
 =?utf-8?B?U0l0ODlqajFwV0xaUExETmJRQ3Nsd1c0Tmw0R1BTYkd4VnBvWXRqQUhTUGJQ?=
 =?utf-8?B?TklPY3FHbThUeW1FWXNyci9kekRqSENxMDFvUDkweVN5VndhMUx0Kzl5eW5J?=
 =?utf-8?B?c0pZMGpTZUNWZW0yZEszclk1OXQwOWZpODlQTzFhRTk2Z3JSVnd6bHFRUnlK?=
 =?utf-8?B?Qmw0WkVTZFdEb2s2Qkp3d2N2SWJTeGNRMm5QZkxnOFNxUm9sRFQxTUdoa256?=
 =?utf-8?B?MmFtVW0vNlBYNTlkNUM1WVZCL3RPVjVVWGVRSWFtNzYxemZJM3pOc3hnYkw2?=
 =?utf-8?B?SmV5TFJIeDhwM1NTbldWc3h4MSs0OVY3SW1MSDFSblVOTGhFSCtpRkUrMTF6?=
 =?utf-8?B?dnFOSitDK2FPL1k3MkdGaUd6c3JoMnNTRFRFUFZiVngrVEpLdGU4UGk4RUlh?=
 =?utf-8?B?Mk1zbHZ3UzhIRTZETUdnTWZrbWlPYjhXZVB3QVd1VDVVTktKblZidkpLRHM3?=
 =?utf-8?B?aXV1aDZXZnd6VDgxSzhCcThzVkgvK1Q5bWpqYzVyS1dvU2ZYdE15bm1kcDBX?=
 =?utf-8?B?QXpOVGlXcTdYd0RXMzNRK0ErYnVVMUgzSmZjaUYydzY1S0c1S1Q0TGJkbkJY?=
 =?utf-8?B?Z2VmTVJEUm9GMHdLQTkvbTh1UTdud0NqSzhqUkxTeWp5UUx4RUpYUXFiZ2V4?=
 =?utf-8?B?N3dJanQyL3ZMNW1MSk8wUUxEL1FNZE9IUlQvcHFib2VBWU0vQm1xYS9vTVcr?=
 =?utf-8?B?S0RZdGYydWthY1YraFNwakVWMFlybzJyWjh3cmFGZXlNaFZBNHpBSjc1VFZB?=
 =?utf-8?B?Uy84VEovbGFPb2p2OUc3TlFrVy8xNjV4RFRkOGZwQWVrZEVMOVBEYmdKY05r?=
 =?utf-8?B?T0R0Q0J6TlA1bTVHMnh1RVZBYW5ORml1SE5FUTIrVDZrVm40OWhwV2dLQlJE?=
 =?utf-8?B?VldtOGdDdGRtTlkvRzlPeWw5UUpxMWJXMmRuTW9OMjZyaTFzMzFiQzRGKzBz?=
 =?utf-8?B?WXRIOGMyeFBtZzZ0TmhNbG5YTW1sTTQvK1FLZUdTbEE1a1JRWUQvRitpbWgy?=
 =?utf-8?B?ZHRmWU02TElJZDNQbVA5eVVJN3dwNnVZOTcrRWxZNE1xZ3E3cnhnUGhyRVRs?=
 =?utf-8?B?dDYydXpiTGR3WlptQUhFZ1Nqb003cGdkdmsxV2h2cGtlREFxc3psbTZMQzdL?=
 =?utf-8?B?THZHeHBEMytLVUFNalNOZ29yVWpCKzZ1VjBYdU5RdnhhdDRGSm1aMHFSOG5X?=
 =?utf-8?B?cnY1V2p6QzFKZFF0Vmc1UG5RaXpxVHU1RFFLUEo1MEVZM1YvblRDVGpxcEFr?=
 =?utf-8?B?UEpWTUpuY0pmN0QxOXZxY0c3TE0xVXhXaDgwUVRtSHRrc0pDa2N3NCtkbjJ4?=
 =?utf-8?B?bXRxUUVXYy9IclJia3ZEb0tNZUQ2UWRIc2trSWVBNVRTMVJNT3B5Lzd1allO?=
 =?utf-8?Q?oZGyA1tS+DEmPKaxqTx1YrSHd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b41b3f-9f11-4242-b9b6-08dd992a44be
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 12:14:57.7180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QHkidlA3ZiE2o3OwrIxsW9tlSJwCsGJLSvxgdpcGSpjsQjVYas4Gg+CDWvNp0/htBcuRTcENF1rincHjKO6H2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3901
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217091

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMt
QnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBNYXkgMjIsIDIwMjUgMTA6NTkNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBC
RlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+OyBIb25neHUgSmlhDQo+IDxob25neHUuamlh
QHdpbmRyaXZlci5jb20+OyBhbGV4LmthbmF2aW5AZ21haWwuY29tOyBvcGVuZW1iZWRkZWQtDQo+
IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNV0g
bGlieG1sMjogdXBncmFkZSAyLjEzLjggLT4gMi4xNC4zDQo+IA0KPiBPbiBUaHUgTWF5IDIyLCAy
MDI1IGF0IDg6MzUgQU0gQ0VTVCwgUGV0ZXIgTWFya28gd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1Ccmlh
bmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gPj4gU2VudDogVGh1cnNk
YXksIE1heSAyMiwgMjAyNSA4OjMxDQo+ID4+IFRvOiBIb25neHUgSmlhIDxob25neHUuamlhQHdp
bmRyaXZlci5jb20+OyBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkNCj4gPj4gPFBldGVy
Lk1hcmtvQHNpZW1lbnMuY29tPjsgYWxleC5rYW5hdmluQGdtYWlsLmNvbTsgb3BlbmVtYmVkZGVk
LQ0KPiA+PiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAxLzVdIGxpYnhtbDI6IHVwZ3JhZGUgMi4xMy44IC0+IDIuMTQuMw0KPiA+Pg0KPiA+PiBP
biBXZWQgTWF5IDIxLCAyMDI1IGF0IDEwOjA5IEFNIENFU1QsIEhvbmd4dSBKaWEgd3JvdGU6DQo+
ID4+ID4gLSBSZWJhc2UgaW5zdGFsbC10ZXN0cy5wYXRjaA0KPiA+PiA+IC0gUmVtb3ZlIC0tZW5h
YmxlLWlwdjYsIGR1ZSB0byB1cHN0cmVhbSBbYnVpbGQ6IFJlbW92ZSBjaGVjayBmb3IgSVB2NiBd
WzJdDQo+ID4+ID4NCj4gPj4gPiBMaWNlbnNlLVVwZGF0ZTogTWVudGlvbiBjb250cmlidXRvcnMg
aW4gQ29weXJpZ2h0IFsxXQ0KPiA+PiA+DQo+ID4+ID4gWzFdIGh0dHBzOi8vZ2l0bGFiLmdub21l
Lm9yZy9HTk9NRS9saWJ4bWwyLy0NCj4gPj4gL2NvbW1pdC80YmQ2NmQ0NTQ5YjJlODkyNWE3NTJl
MGRhYWMzYTE4OWQyZmVjOGY3DQo+ID4+ID4gWzJdIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9H
Tk9NRS9saWJ4bWwyLy0NCj4gPj4gL2NvbW1pdC9kYzZmNTVjZjZlMDNhZTYzYTQwZTNhZjlhZDY4
Nzk4MjE1NThkNmE3DQo+ID4+ID4NCj4gPj4gPiBSZWxlYXNlIG5vdGVzOiBodHRwczovL2dpdGxh
Yi5nbm9tZS5vcmcvR05PTUUvbGlieG1sMi8tL3JlbGVhc2VzL3YyLjE0LjMNCj4gPj4gPiBSZWdy
ZXNzaW9ucw0KPiA+PiA+DQo+ID4+ID4gICAgIHJlYWRlcjogRml4IHJlYWRpbmcgY29tcHJlc3Nl
ZCBkYXRhDQo+ID4+ID4gICAgIHBhcnNlcjogTWFrZSB1bmRlY2xhcmVkIGVudGl0aWVzIGluIFhN
TCBjb250ZW50IGZhdGFsDQo+ID4+ID4gICAgIHNhdmU6IEZpeCBYTUwgZXNjYXBlIHRhYmxlDQo+
ID4+ID4gICAgIHNhdmU6IEZpeCB4bWxTYXZlIHdpdGggTlVMTCBlbmNvZGluZw0KPiA+PiA+ICAg
ICBSZXZlcnQgInZhbGlkOiBSZW1vdmUgZHVwbGljYXRlIGVycm9yIG1lc3NhZ2VzIHdoZW4gc3Ry
ZWFtaW5nIg0KPiA+PiA+DQo+ID4+ID4gQnVnIGZpeGVzDQo+ID4+ID4NCj4gPj4gPiAgICAgc2F2
ZTogRml4IHNlcmlhbGl6YXRpb24gb2YgYXR0cmlidXRlIGRlZmF1bHRzIGNvbnRhaW5pbmcgJmx0
Ow0KPiA+PiA+ICAgICBpbzogRml4IGxpbmthZ2Ugb2YgX194bWwqQnVmZmVyQ3JlYXRlRmlsZW5h
bWUgZnVuY3Rpb25zDQo+ID4+ID4NCj4gPj4gPiBCdWlsZCBzeXN0ZW1zDQo+ID4+ID4NCj4gPj4g
PiAgICAgY21ha2U6IEZpeCBpbnN0YWxsYXRpb24gZGlyZWN0b3JpZXMgaW4gbGlieG1sMi1jb25m
aWcuY21ha2UNCj4gPj4gPiAgICAgbWVzb246IEluc3RhbGwgbGlieG1sMi5weQ0KPiA+PiA+DQo+
ID4+ID4gSW1wcm92ZW1lbnRzDQo+ID4+ID4NCj4gPj4gPiAgICAgcGFyc2VyOiBNYWtlIHhtbEN0
eHRHZXRWYWxpZEN0eHQgZGVwZW5kIG9uIFZBTElEX0VOQUJMRUQNCj4gPj4gPiAgICAgaHRtbDog
QXZvaWQgSFRNTF9QQVJTRV9IVE1MNSBjbGFzaGluZyB3aXRoIFhNTF9QQVJTRV9OT0VOVA0KPiA+
PiA+DQo+ID4+ID4gU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2
ZXIuY29tPg0KPiA+PiA+IC0tLQ0KPiA+Pg0KPiA+PiBIaSwNCj4gPj4NCj4gPj4gVGhhbmtzIGZv
ciB0aGUgbHR0bmcgZml4Lg0KPiA+Pg0KPiA+PiBCdWlsZCBpcyBub3cgY29ycmVjdCB3aXRoIHRo
aXMgdmVyc2lvbiBvZiBsaWJ4bWwyLCBidXQgd2UgZG8gaGF2ZSBzb21lDQo+ID4+IHB0ZXN0IGZh
aWx1cmVzOg0KPiA+Pg0KPiA+PiBGYWlsZWQgcHRlc3RzOg0KPiA+PiB7J2xpYnhtbDInOiBbJ3Rl
c3RUaHJlYWRzJ119DQo+ID4NCj4gPiBNYXRoaWV1LCB5b3UgY2FuIHRha2UgbXkgbGlteG1sMiB1
cGdyYWRlIGluc3RlYWQgb2YgdGhpcyBvbmUsIHRoZSBwdGVzdHMgYXJlDQo+IGZpeGVkIHRoZXJl
Lg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3Jl
L21lc3NhZ2UvMjE1NTU5DQo+ID4NCj4gPiBBbHRlcm5hdGl2ZWx5LCBteSBjaGFuZ2VzIGluIHJ1
bi1wdGVzdHMgY2FuIGJlIHNoYW1lbGVzc2x5IGNvcGllZC4NCj4gPg0KPiA+IFBldGVyDQo+ID4N
Cj4gDQo+IE9oIHJpZ2h0LCBJIHJlbWVtYmVyIHRoaXMgb25lIG5vdy4gQnV0IHRoZSBwYXRjaCB2
ZXJzaW9uIGRpZmZlcnMuIEkNCj4gY291bGQgY2hhbmdlIGl0IGluIHlvdXIgcGF0Y2ggd2hpbGUg
cGlja2luZyBpdCwgYnV0IEkgYmVsaWV2ZSBpdCB3b3VsZA0KPiBiZSBiZXR0ZXIgaWYgdGhlIG1v
ZGlmaWVkIHBhdGNoIGdvZXMgb24gdGhlIG1haWxpbmcgbGlzdCBiZWZvcmUgbGFuZGluZw0KPiBv
biBtYXN0ZXItbmV4dC4NCj4gDQoNCk9LLCBJIGhhdmUgdXBkYXRlZCBteSBwYXRjaCB0byAuMyBh
bmQgc2VudCB0byBtYWlsaW5nIGxpc3QuDQpEb24ndCBmb3JnZXQgdG8gcGljayB0aGUgbHR0bmct
dG9vbHMgcGF0Y2ggYWdhaW4gd2l0aCBpdC4uLg0KDQpQZXRlcg0KDQo+IA0KPiAtLQ0KPiBNYXRo
aWV1IER1Ym9pcy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCg==

