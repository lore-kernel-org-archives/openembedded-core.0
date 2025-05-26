Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9F5C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 17:48:33 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.87])
 by mx.groups.io with SMTP id smtpd.web10.34062.1748281710706270492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 10:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DMrYGDFo;
 spf=pass (domain: siemens.com, ip: 40.107.20.87, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZErWpmkZ8+G/vVU8/konkrB9FZjptSAK8zJeVnCx7d+rIpgONvgpcuttP80G43TNECFRsJDSZR+Z4dQ1kiThQRYIy1Mj/DPtLvRAVrS/lsL2hJWE9srK6ujVuVWwnMXpOvuo2SCV39Rq0vbhJooy0tIPYlRtOO92C263kS4tQAZebnPQgev4Xw5m6x4Eud0Cr1BtWPTQmuIfFD1HvaFuA0GHbDfg3xemh17pLdreyRNPE1uJLaT/g4W2j5Pp67g3qk4AmN35+irZJwtn4URRRJrYBYqfHndHHe/hqIFbyHw+vqPk/dwBNBFfutDx2jpw1h0GJB/kfkPXRxL+psMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maMtVSGjQREf9aKIYND0T9nS2GCDy1XuYZNaKFleAbo=;
 b=VF2TRxwHPyqDmgtLRontkYxF0MVjbOWE45QUyPr9N5U/PeYDYC1wdXiOR/Wje8xGY5DyzFNTcO18IMxbXel2dsnjA3M7yX4AIdKvLgu59wDPPW1wUutvLmap5kK1838ZamF0fv2eeJ45zq2vIv1pyBaL/cwPZKKXh1Vp4WddghcfWm0owhuQtzsQbHhwrAZLDxlgSheiChKPJZ6oSKxm9t2UI/kuZU2+MevywIadRfRpC5WCmAswBqDfxZPm7HFw/ULOQILvA77LAeroJ0VcHOMH6b3NGrFSeROzA8HlKb8vJPNryNY0LLEbTpgzPuxGIAsapSlm4eV2ro966k1IZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maMtVSGjQREf9aKIYND0T9nS2GCDy1XuYZNaKFleAbo=;
 b=DMrYGDFor8Pu3J0wrsl3N2tnPr1ZAQiIffCGi4FW1XqnEt+6u9Fiz4eaMq325xFmTiGwob1EPTdhrSs6fnTSKnvnST9KJVWG1gxPyiZvDmPn642emETDjqJvQsk7K4EjG/zWE9UFuNiJWpfahcUgAO+bM/rzd3c7vgSLQaeAO1GPIESjLbibT+Pmcrok7gpTB6WxSrKhhwjeHyz27cwjGsAm54CeQlZuPMiqPUR92cnRiMDSUKLhbtUoTne2I7uF56NFdcUfQQXgB9MRfEa4u1CcCjRTEw1NJyhmRSoRNl6zygh8v9Ox1RWS9FOQlKWzCxg5BP0FE+KZtz8InryDxw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAXPR10MB5433.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:28b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 26 May
 2025 17:48:27 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 17:48:27 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>
CC: Hongxu Jia <hongxu.jia@windriver.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
Thread-Topic: [OE-core] [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
Thread-Index: 
 AQHbyiezz4/hWYLLWUu2UN/JWqui2bPeMcAAgAAAPDCAACkdgIAANbVggAAD/ACABZlmAIABBJkA
Date: Mon, 26 May 2025 17:48:27 +0000
Message-ID: 
 <AS1PR10MB56977F36FC787279594F0831FD65A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
 <DA2H7Z2IQH15.8AQHUB50F8SB@bootlin.com>
 <AS1PR10MB5697E603603C2156BCF1DE5CFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DA2KDA7L7YRZ.2I1CKTLPP29LZ@bootlin.com>
 <AS1PR10MB5697DC8D007471A68D8709ECFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DA2ORDMJAWTX.2XH4RND735F7C@bootlin.com>
 <CAMKF1spdgbveyFvNWoouh9XEdU+RAOX9pNoUgFGe4N2=XcpUEg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spdgbveyFvNWoouh9XEdU+RAOX9pNoUgFGe4N2=XcpUEg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=01c2ae04-d090-4c46-bd8d-c6ef89e07552;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-26T17:28:09Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAXPR10MB5433:EE_
x-ms-office365-filtering-correlation-id: 1b66f079-7e36-4c62-57de-08dd9c7d852e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NnJoOGdBeHJTamRKajZsVytTbDlPZ3UvNE40MWFNNHhMbDAyZzk4ZytYL1lU?=
 =?utf-8?B?NFRVNXhZRmFGVE8yN1hubnczSlVacFFrM2E2cFVmNGVRZkoxN3FxaWZ2QXpS?=
 =?utf-8?B?NEpVR1NsQUFoeDFlZzdtQ3gzQVBJd3ZEblhleGc3UmtCalY2c0NRcEEyKzBY?=
 =?utf-8?B?U1dHN2VBaGJ1ZWQ0cXVwZU1iNnpIVVgrS2VjMmt1MHZjSFcvaVFUbWhoeW1B?=
 =?utf-8?B?S1YvUzl2cWQzK2tQUnlTT21sdGJiRkRCYmMzNzdENVRKanJxWmN2dXN0aFlM?=
 =?utf-8?B?TFJYK21Bc3NFcEYxZGdRTGY2aHFYSTc4UGQxTk9TcXFHTG5iTDgrOGJPNUZU?=
 =?utf-8?B?cExER3ducFpnUVFUOGtqUnRhZm5vZFFEUzZHQUlzNERGdjhoblJQNzFKWVFt?=
 =?utf-8?B?a1piM244MzZ4OXYrVEdackgrMDFmbTdrZ0Q3V2RzdUh6VDRmbkQyL09oRy93?=
 =?utf-8?B?MmV1Z2I4eFVGZ2pKMUY4dk10V3hpY1hRNzVaZ2piV2s2S1ZmakxBNExMZDdo?=
 =?utf-8?B?QXVWdlEzWnBNNGtXU3pFNDJFWU01eUQ5VUprYUEzYUxKR21BNXRPZkMxNm1Q?=
 =?utf-8?B?cGVZNDVTZWw3NWdFK2UyMnVwL2VjRzNHeU9LRWtIMldhWjJTcjdNYzRyYVJE?=
 =?utf-8?B?cDVDeFF2YmQ2T1ZrYWE0Wlp6Wk5PQ0VMYXVkaEJxNUFoZUxkVHhIT09WWXVP?=
 =?utf-8?B?dCtDZWhUb3l5U1dFUDR6K2d0V3IrWVlrbFhXVmF6eUxZeVVvSVhxL0cyTlNl?=
 =?utf-8?B?VHpMSlBGWWQrVE0yL0lJcllYeDhwdDRIeUE2a3liRVZLNlFaNjMyS1J2MzBI?=
 =?utf-8?B?NXlKSnZoRU0vSVd5Wk5LQkNXQWdtT3RqZ3JuK0xWeUliUE5XVDZwcmk5N3Bj?=
 =?utf-8?B?TUVNQm1DaG1tZkFmN0FjeG10WDhGRVFGTndsbXpmM2UxVUYrRzBLU3lDZVV6?=
 =?utf-8?B?REJPeldzM08xbmJLbUs1MVdyVXNHM0VvZ2xlKytQRVV0RWp3TU5Sa0t0Yi9Q?=
 =?utf-8?B?SlNsZHlRN3dVUHpsbEFSNzh6NmZnMENvd2tCdUpaUHNFUSs2TklsZkIyNFU1?=
 =?utf-8?B?VVA4bVFkU1lWc08vbmxkZWwxdmViT2t3dWptUk9kWFVQdTRoR09tL1BhV2tC?=
 =?utf-8?B?WWZibHZLV294bi9jNFNBamhPR0FFbUdMU1F2dW5jVlF4ZnRVeE01V0NwMW1K?=
 =?utf-8?B?bUZrdVZ1N2NxSVpPMHBHYnRYbitVbnErNHRab3B0V0s0d0RGK2dCRGhFZVo5?=
 =?utf-8?B?dENVWElyN0VDOWE4bEJFNzRzYUplOWk1dTZRbGM0UjdWOGM5cWZDUmVGN0Vj?=
 =?utf-8?B?cE91RXZYUjFTNWVidmlxMXVPVmlNendvSkpkd3VIeTRUZ2RGSDVzMDJubkNG?=
 =?utf-8?B?L05ZaDA5R0dTeGVneE1uL0ZVUlJsRHhrcm9XK3RyUzJxZU1TUHBHQUVRSUsr?=
 =?utf-8?B?NzFFcEdTb2dPV0RrWEtCdTUzZ2h2UTVKK1ArT2VKS25CUEZXcUEvdDN2ZkFi?=
 =?utf-8?B?b1NSbVJxKythU3ZOakh3SzlpMDc4Rk5yNE1FZ3Jkd0Y2d08zbWFodzZVMXpD?=
 =?utf-8?B?MmJ1V3RZZFdlMVZYSTRHYUhqT24vM0gzK0RKNE1uczlBQUJJelNXWTN6SDdu?=
 =?utf-8?B?UW00YWQ0ZFFqNXRZU3VDVlh1YmcwREFZREFZR2U5bmtla0VDYUZidHlIRzd1?=
 =?utf-8?B?WVV5NzE2a2x1UFJMdnBkWXFJRWJqQ0dKVE55bklTUElQYmMrcUp4REFlVkIv?=
 =?utf-8?B?d2xSakRiL243emtnODlBUGtQS2ZKZktpZHpMaWJSWmlGYytwQlk2WUYzeW5h?=
 =?utf-8?B?bWo1a1MwZ2tIRzRUZmlwTVEzQWx0Sm5PQ3VNY0hCQUZFeWVTWk1TSFJaYVVr?=
 =?utf-8?B?ZHJjSDF6VVJXSjBKak5QT21NQll2N0lvSUFEdWhqdlg0N2xOV1E1NTlHeEF2?=
 =?utf-8?Q?IZ+8ruTNDPo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R0VrWnExSjAzSWZFZ1VqUXRCNXhISzNNK0VqZkY4Z2ZURms4dnRYOXduczR5?=
 =?utf-8?B?WFh5WjB0a29mUUh2bGxGL21yTHVDM0NTSktHN1QwMnFya3ozampzMUZldnRQ?=
 =?utf-8?B?dlZvUml4QXIwcnpucGNwZG1ydzdFcWFHK1IxZ0xack0vbVEra1NUNW5BREVl?=
 =?utf-8?B?cmNRQ3o3eWxCdis5STIzS3FBeTkvTSs3MllCcTJHajFDbVM2ME9meHpheXNT?=
 =?utf-8?B?VE5scHRYbWRkQjZYQ09HOWZDNlFPVUdySENQSEJTci84dWRxOVJRc1pYb2lw?=
 =?utf-8?B?SmplMDJWV3k4N1cvU3VTWHc2bDQrZTdmcGNSblAveXV5L3BOVm83dVNySWo1?=
 =?utf-8?B?TmdPNEVGaHl0eGhrdE5SVjdpaE1iNGdmbjg2TDYwSTNWQ201MUlrNmRDeFN4?=
 =?utf-8?B?enl1NE9EWVVyeTdTdXhUVTA3WkRxb2s0aVJnMXJhSmFHK0pSS3ZaOGtQSTVP?=
 =?utf-8?B?RmVvZ3hWWWQwNjNRMVVzWHpUd0lweWppQTJHTi9TTDF3RjA3R1pkSm11S2dS?=
 =?utf-8?B?MG80NThUSFpVd1hXLzZJM2hzTERlTEpNRkMwbGJ0SFAxK0NFaUFkNHh2bU9J?=
 =?utf-8?B?clNUbEp3OEdISWkwUnQ4Smw2V3JycFZZWk14MUxCOExoRHYrclNQNEVWQ3ZZ?=
 =?utf-8?B?am1XSjF4R28zUXMrZGFoMlBaNmlJT2ZtdU1iR0hUV3R0TnZTQzZnd2xKc1Iz?=
 =?utf-8?B?cEpsOHVXTmpmd3pLTmZreHo4RDJ0TzdhdWlBNnRPb0FGY1ZGMngrNGhiNEkr?=
 =?utf-8?B?NzRrL3A4QXpUZHV4bU1ab2R6L0NkOCtqMEU4T2VWQ3liazBiM0s1TmdQSDRP?=
 =?utf-8?B?VjBnWjA5c2dHRnhNcnlaaU53cDFSRHdHOHdaeFFtaUFqWXA4TTBja2Jab2p3?=
 =?utf-8?B?TXBMOFZUQm5aZElWOWJqdXkvZmVDWFY2YkExbzhTU2JnQmRFY3ltWGZYS2lk?=
 =?utf-8?B?dmh5YVZZdUdzWmpaUlVYdjhVVWt4TlhqeGRBVjlqT3ZWNnJWSEpGMEkrNUk3?=
 =?utf-8?B?YytnQ1p0THQzVllLZFF2a1RudnY1S0JGYkpoVExjR1orSDJJQ0kvQnJLbEdU?=
 =?utf-8?B?RktscFdTbGdscElUN3hrRlAzRXpjWEtkY3gwVXNPcC9ES0VlSjZwa0hoS1FH?=
 =?utf-8?B?VHZKcGtlT09JZWJEUDFISEdFNk93cEpSY0hNL2VlcFpVSys0Mk9hMEVkZ3RM?=
 =?utf-8?B?dFJJOXZ0NmhtRTNhaDU0K0UyTHpyRmZtNGd5SFVjZ2dGbXZpakZER1A0YS9s?=
 =?utf-8?B?anVHMDQ3RHRnQVZ5NnFqMGphMlVheWNEWFM2TStkOTkzS2VhdGpZQWhGdUl3?=
 =?utf-8?B?RmVLMkM3OGhtVit4dmVndmpBZFZnV3JMekVPMCtFYi81bllkUzRUaHpTY0FR?=
 =?utf-8?B?WCt1bGQ5VEhhMFI2K05qVVh5S1RzcVJ5c2k1TzBwSkRnMUx3L2RuRUY3R2VN?=
 =?utf-8?B?cWV2aEhTTktLdFowcE9lbWFQcnlCTW9kNVI1a0lOM1hWMjIvWVFNNTM1QTR0?=
 =?utf-8?B?V09SclZWL1JMc1hCWnFDNEVlZWNJSUVBTWRDTHVhWEpPa0ErRTYxS2dXZENR?=
 =?utf-8?B?VlpsWWRzdWVGMDJlNGlGSmMxVkUxTUU2OGRwdm16Wjgrc2JGbHZxWHpLcVBk?=
 =?utf-8?B?RHU0Nld6WWRrS0oyZ1l4aVo5L3dJRWRBSmdGZU5RSjgvRWtaTEJ2Z2FqaFpL?=
 =?utf-8?B?MGtoMUxRZEkrWVRZaERsU0ZEOVZOVEZER2E3WDNSdGtVOG83V2pwMVpHeFpj?=
 =?utf-8?B?YmhkaHVXZ2dLMUxlMFZnTmpXRElSQUlaQ0lqaWNtSzNoaU5pRnBkb1ROdUJC?=
 =?utf-8?B?alcyT1h0MGE1Q2tlSUdZaGlFK3BNMURZMkRnRDh2S3dtSXBBTFhadG1zMnQy?=
 =?utf-8?B?SlpXaWdqVkF0dnhodnF5bHphVGVrcEw2RFVMLzhkMmI2MXdyYjlhcmxCNnhJ?=
 =?utf-8?B?VGxoMkpjZUtDb2FLcEFCSWM2UFZMSzM5SlRCREQvZ3VkOFVHUDJKcUpnSUU0?=
 =?utf-8?B?YzA2L08xenVXaDl1a0F4QW9RZDBpb1U0dnk5VW1zdi9yV3dQMWJhd0NXS1Ru?=
 =?utf-8?B?dHZ5d3RiRWNMOUVSdVJQNU1PTzllVHNaUkNYMS9XNzBtK1VVY3hHRU1oVE1K?=
 =?utf-8?Q?iy/4eibupEVsSYaEmCfO3GwAb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b66f079-7e36-4c62-57de-08dd9c7d852e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 17:48:27.5493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e2YRwZ9XTaIxSBuViRnSly2Ubirq5Y0v0ToNPKtrkt5cNbOavPwkW4rWc80QadjLnF/EmJxXcdfDWIBZVzbAMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5433
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 17:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217272

SSBoYXZlIGNoZWNrZWQgdGhlIHByb2JsZW0gYW5kIGNtYWtlIGZpbGUgZ2VuZXJhdGVkIGJ5IGxp
YnhtbDIgcG9pbnRzIHRvIC91c3IvaW5jbHVkZSBub3cuDQpCdWlsZCBzdWNjZWVkcyB3aGVuIEkg
cmV2ZXJ0IGZvbGxvd2luZyBsaWJ4bWwyIGNvbW1pdDoNCmh0dHBzOi8vZ2l0bGFiLmdub21lLm9y
Zy9HTk9NRS9saWJ4bWwyLy0vY29tbWl0Lzc1ZGRlNTBiMjAyMTVhMmEzYTQ0NWI2MmYzNmE2N2M4
ZWQzMzdjYWINClRoaXMgY2xlYXJseSBicmVha3MgY3Jvc3MtY29tcGlsYXRpb24gc2NlbmFyaW8g
d2hpY2ggYWx3YXlzIGhhcyBhIHByZWZpeCB3aGljaCBpcyB1c3VhbGx5IGNhbGN1bGF0ZWQgZnJv
bSBjbWFrZSBmaWxlIGxvY2F0aW9uLg0KDQpTaW5jZSB0aGlzIGlzIGluY2x1ZGVkIG9ubHkgaW4g
Mi4xNC4zLCB3ZSBjb3VsZCBmb3Igbm93IHRha2UgMi4xNC4yIHdoaWNoIEkgc3VibWl0dGVkIGJl
Zm9yZS4NCk9yIHRha2UgMi4xNC4zIHBsdXMgYWRkIGEgcGF0Y2ggdG8gcmV2ZXJ0IHRoaXMgY29t
bWl0Lg0KQnV0IHVsdGltYXRlbHksIHdlIG5lZWQgdG8gZGlzY3VzcyB0aGlzIHdpdGggdXBzdHJl
YW0uDQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBNYXkgMjYsIDIwMjUg
Mzo1NQ0KPiBUbzogbWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tDQo+IENjOiBNYXJr
bywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsgSG9u
Z3h1IEppYQ0KPiA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPjsgYWxleC5rYW5hdmluQGdtYWls
LmNvbTsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS81XSBsaWJ4bWwyOiB1cGdyYWRlIDIuMTMuOCAt
PiAyLjE0LjMNCj4gDQo+IGxpYnhtbDIgdXBncmFkZSB3aWxsIG5lZWQgc29tZSBwYWNrYWdlIGFk
anVzdG1lbnRzIGluIG90aGVyIHJlY2lwZXMNCj4gZGVwZW5kaW5nIG9uIGl0LiBlLmcuIGxpYmlp
byBmcm9tIG1ldGEtb2Ugc2VlDQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVj
dC5vcmcvdmFsa3lyaWUvYXBpL3YyL2xvZ3MvMjQ5MDQ0Mi9yYXdfaW5saW5lDQo+IA0KPiBPbiBU
aHUsIE1heSAyMiwgMjAyNSBhdCA1OjI14oCvQU0gTWF0aGlldSBEdWJvaXMtQnJpYW5kIHZpYQ0K
PiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxtYXRoaWV1LmR1Ym9pcy1icmlhbmQ9Ym9vdGxp
bi5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBPbiBUaHUgTWF5
IDIyLCAyMDI1IGF0IDI6MTQgUE0gQ0VTVCwgUGV0ZXIgTWFya28gd3JvdGU6DQo+ID4gPg0KPiA+
ID4gT0ssIEkgaGF2ZSB1cGRhdGVkIG15IHBhdGNoIHRvIC4zIGFuZCBzZW50IHRvIG1haWxpbmcg
bGlzdC4NCj4gPiA+IERvbid0IGZvcmdldCB0byBwaWNrIHRoZSBsdHRuZy10b29scyBwYXRjaCBh
Z2FpbiB3aXRoIGl0Li4uDQo+ID4gPg0KPiA+ID4gUGV0ZXINCj4gPiA+DQo+ID4NCj4gPiBUaGFu
a3MsIEkgd2lsbCB0YWtlIGJvdGggcGF0Y2hlcyBmb3IgbXkgbmV4dCBidWlsZC4NCj4gPg0KPiA+
IC0tDQo+ID4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+ID4gRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiA+IGh0dHBzOi8vYm9vdGxpbi5jb20NCj4gPg0K
PiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUg
YWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAo
IzIxNzA5NCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC0N
Cj4gY29yZS9tZXNzYWdlLzIxNzA5NA0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL210LzExMzIyNTczNS8xOTk3OTE0DQo+ID4gR3JvdXAgT3duZXI6
IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1
YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNv
cmUvdW5zdWINCj4gW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiA+DQo=

