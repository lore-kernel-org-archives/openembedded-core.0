Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A34CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 11:42:02 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.41])
 by mx.groups.io with SMTP id smtpd.web11.20538.1758109320384372523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 04:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=PWfSUp/W;
 spf=pass (domain: siemens.com, ip: 52.101.65.41, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgNfzkMhZhF77+iWNU6mY7GORBMlgED1GMs6Bhnj0enwGPyY4a8EpVctzHjfmZYkKnbrqqmNV0k1xt/o0n9/Bm9nLIln0pdcwgt3ceC6rTkDmLV67FL+6Z1pwBIVGOL6NayNnZcduh4cZdjPm30WE4JuvBspzN5khL/cbUMyFUXK+zw4AITibu/d/tz7WLANZ/3Pt6HdIr/eMe+rHUdsR3lghUJJnnRVLtB57deDxCyWgbWuRSyw9i3mo/bRzj0zfspIkn+P6Dm7rUCh1tQKKPjoFOhM4H2nNli005/YrCpnG5d7xZ3itNqcxufXjiS5hPQpzjciqjwsxfg+EeyygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1TwooBKxc12kF4I1ERGW5+gfQBUv/hyCfVF87rMVVo=;
 b=x3shyORdmxGDlJcYftciKMwNkoMXhELIRbto4SxINXUWpUiX8QGg7CvJQmuh74UeXodCZVk9E06nRaQBYoacrVocyJseOWmRtF0kxerR+bmk1Wr5ZLr6VbJpRNkKZYbEb6E3kA1cR3qgzBCdQQW+s8SHAuAOYlaKYgwX4L/Wq9rizBBq3dELaAZPi/puRBjsAtRAzhtPd5Iep0FUv0VIPT/EEDGo77sIN8DZfNjfY10gKHc2ZfuXxAm52rOVZpRbULpDatCHIIzpsjY/W8TTzACvx6XYNnEquS0xu9vYs2nhkWoKKwt+Ci2+i3ky8JK91dyARtTuwDYJiuMv9ygzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1TwooBKxc12kF4I1ERGW5+gfQBUv/hyCfVF87rMVVo=;
 b=PWfSUp/WsgwkLbmlACEb1RNDI40e9hfBU3o4xWmTNbO3eTq8+Ye96zSiC3qDoeVlOYKQEc7kVmuKtU/IlgZpzVGOqXA3EAIBdZLMUru6B3t7JbGJY9EyaSG6867HSifDB5SzwJ7+Z24pHk6GBuBt2nII/wXSJKrD/oTtMp8BKMGshpqA13ca1AlXlSkqXqy0Sb41Z/3kDkRtc4bA4ECBlOlPDDTmphHOUP9bUVFi+iGQqUm8lZ8Jkr0GW+MX4xjIcvOo3pLL2lM9gDDcl0knM+rgBRLFAIoW6OSSYgHTsg+3r8ejXLB2yVswIKZw/1tn5xa9sJs7WWw6U9KirmRRPw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PR3PR10MB4141.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 11:41:57 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 11:41:56 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>, "ross.burton@arm.com" <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Topic: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Index: AQHcHSH7LwGpFd3oNU2f86SvOYVM2LSKvd4AgAAcmICAASSvAIALVYMA
Date: Wed, 17 Sep 2025 11:41:56 +0000
Message-ID: 
 <AS1PR10MB569745D68FA97FAFC6C3BF00FD17A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250903222658.3929743-1-peter.marko@siemens.com>
 <DE61F3AA-CA08-41FC-8F66-04910F2AA132@arm.com>
 <9D9FCA93-9D8F-4F86-A080-C1CCD08B70B5@arm.com>
 <CAMKF1sorn6=C9n7NZ1o6rmXDdCLW267HoncP=fViP5zZ2_n10A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sorn6=C9n7NZ1o6rmXDdCLW267HoncP=fViP5zZ2_n10A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c6aa4561-a4f3-4f5e-95ba-bf32975b216c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-17T11:37:34Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PR3PR10MB4141:EE_
x-ms-office365-filtering-correlation-id: cbb0600a-4c11-451a-f5e6-08ddf5df34cf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VGdDU0JTRWtIalRabjVlNnFvbVV2aWZodnY2RGNZZG15bGFKd21tTU1xaS9s?=
 =?utf-8?B?am9rZTllc1JCSDNvU3NpK0VyZDFBbHJEb1QwTElyb0UxaU5ZMWptUkFNL2do?=
 =?utf-8?B?cWNGSEtuZzNyQnpZQUdQbGxpRXpEUHNyWjRJRE5MNVZ5S2RpMjlIcktTZDQz?=
 =?utf-8?B?NC8wRFpha0o1S201TDQzbXBra1JYTGZXdklRZE91NWpMS05DL0ZIVndocno4?=
 =?utf-8?B?RE1iRUhLU3lHbFRIb2tJVnlZS1puU2JsODRvR3haTFB2OW5FRFRQakhrUW44?=
 =?utf-8?B?L2h5dWkyWUkrUWJWeTlNOGlXMEpJRGk4QWdGNjdiK3VQV29ZNjJuNWkvT1di?=
 =?utf-8?B?ZlE5a3BaL1JpamRRS1htSTZaKzdJMkMvWTZZNE9qMFFBY0RscnkrUldmazZv?=
 =?utf-8?B?U0FxWTl5bHlNZnFFOEFaU3N3bVQ1Qno5ZUc0OVM0c2J0Z1p6L3NSTk1ablV0?=
 =?utf-8?B?QWFoMlAvRE1NOXphc2h1MnhOVXFEM2hIMXVtbkkzNkYvTHVnZ2s3MTFyZmFH?=
 =?utf-8?B?dEZQOEJpZUNEVnlENmVKYkpqbC94OGpsSExwTTRmd0UzV0p2cWNXeUtUcWtq?=
 =?utf-8?B?VjFxUS8xOEZad3g3V3VZSlB5cVFZcjFxZGo0dFYrVkluMFg3QTl2ek9KQ3RC?=
 =?utf-8?B?SXVTakNPU21MR085OFJwTUVmTWZsYVh4Wkg2QlhXSzUreHd6bitGbzJLNGoz?=
 =?utf-8?B?VjdyZm5vQ21naTVhYTNtd2tBTjNxU1FyWUFLN3lQcHo1UzZGNWJuYmg1RFFO?=
 =?utf-8?B?WEtBVXBEem1sU1NtWGtqTlgrYzA2dDY0Z21VdVdKeFl2N3BxUnRZYWJTTldL?=
 =?utf-8?B?M2d3bEVpaVFEN0pQZm1CMmJLUXo0cnZNR0x2Umd2VFFUYVNRZktxa0htR1JV?=
 =?utf-8?B?cmZQc25udzZjSGFaZmtOZERkaXcwT3pHZlppaXJpRHZMK0w5STBnL2FnZUZG?=
 =?utf-8?B?ckhrRFpzV1Q2RXp1RmhrbHp2RFdoQkU5OUVyZGMxWHk5d1dGdGs0ZjFNeXkz?=
 =?utf-8?B?Sjl3eWl2T2tnNm91amFvTFlHRUJDNVRzdkwwSDQ1SGs3TFlXNUFySHRZWm9t?=
 =?utf-8?B?SWRrY24yNWFWTXM3M0VucXNlemxhUXNOZnpNblBBTTVvM0owM1JReXJXTmps?=
 =?utf-8?B?Z2lBby9Pd1J0Y0t2UzJjQWdIVEZsckVJU1QzeVd6a3JvNzFMWndVR1hlN2c2?=
 =?utf-8?B?Uit6OHdRSWdXSTBCL25sdW8vL0dlV3JabXBRRUlrbjU5dnZVREJKOTF6TVJR?=
 =?utf-8?B?ZWVFZWFvbkVuVHg2UDdUNmVxTGNQZTRTREdXR091WUxZZ0g4ZDVtR0RYMGhK?=
 =?utf-8?B?eUVxWklBcmttMW9ESnVEdGxyU3NkT09yb1VRTXF2SmVnWmR2SU1VNVY2TW9V?=
 =?utf-8?B?TjlwV05PYTJORkRtNVNXTlk4dWZqYk85NWpKS29YbTFuSEFWWUxFV2QyM2dY?=
 =?utf-8?B?bTVpR3RWMC9KL09lOWUrSnN1VlRWaERzYlZwTWd5a1JReUhwRXpFL3JtMWdO?=
 =?utf-8?B?Wm9ZbzdrMnNBaFFKNmxjTVFDKzh2REZWUVF3SzJpSWY4Z2J4SHlveGdZeTd2?=
 =?utf-8?B?cHVGMTVwVHBsLzBBcE9HdWpDZHRjYmg1cEY1T25XQUE1RGkzQjA1aFRJSzB1?=
 =?utf-8?B?dEgvY2loWTRmOE0wMkl5YzZ4QnVnbmt5RmNuV3Bzam9DSE5SQmJ2ZUJNZHM4?=
 =?utf-8?B?cHBQcDQwVkpybGh0UzM1Z2E3aldDVm1RalpTbmpyUUpmcWp3TERTa3h2Nkx4?=
 =?utf-8?B?dHpoUW11bnBTWjNsc08zM3FaMUpROUZaR1BGQmp0NHYwVVljRTFLNkRRS0Vz?=
 =?utf-8?B?bDBKNG9DTnVFcXVKa0ZnYXRWazN4RHRCQ2lNbFN2dmhWMWhZK2l6QXlRR2RK?=
 =?utf-8?B?dU1peDNUblRWNjVVdXFOa3EyWGJlUWg4QjgvZTNIYVFVOGgwL1R0RDdZVDRC?=
 =?utf-8?Q?/5CZBYwZAU4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MzNVaUhxTkdGbjdxeFp2Zk8wL3NlcEtlM1FsYWwzSGhNSHVtcHZIcnVBK3RG?=
 =?utf-8?B?WVdHRGoySllVTEN2cnFSZkdCUTNRRFIyQ0tIanZza0xzWU1oSDFCejYwTThB?=
 =?utf-8?B?UjlQMkUrcDhLc2VmMGtBVWhrMDV1N3hUSzdZbHNhdklDaGx0MGFsSjE1MTlX?=
 =?utf-8?B?YmpMOUZBUmZFc3BZNldrWDdUaXJNcXFoejd3bDVaYnJIL3lzUlgxTHp5bmpC?=
 =?utf-8?B?T3o4ejRyODV3YktpNFNPREc5Qy9PdXdYNUxPMFAvUzM5Y2YxWkpBUHNVaDF2?=
 =?utf-8?B?Q2o0M01mVzdCSFA1azZMeVZQb3U0aFc0VGhDUThYU29iYVRrTm9CZnltKzQz?=
 =?utf-8?B?a2hzaGtGQXFXcVhEd0xJU3hJc0d2NWlhVVprZGlrenpLSk9EaEVGZE5obC9W?=
 =?utf-8?B?Q2g2aDE4dk9RL09iYVd2T2lmTHRFcFJWaVBPVWlpZmo2b0RDaG0vNGMxbllP?=
 =?utf-8?B?cUFpUi8ybFdxRXc3UlZ4NHF4Wktib2p2ZmpLYnE1WnRnQkJkTUxwQ3FzMzJ3?=
 =?utf-8?B?SUxwMkVFUG9kOFFZQ3NNY2VuZWdTMlJkamdjRHdFT0lwKytQcS80d1lUcjly?=
 =?utf-8?B?UkkrTUh6V3dnWU5HWTI2V3pxQmV4aW15NGVLSUlMSkNjd2wzRFA0NjVBWEpQ?=
 =?utf-8?B?aUNJd0ZDVEpkL2t2R3V4Ync0ZzFPT1VXVXRFZ2tqbFZrMVVKTnhKZEJMN0dR?=
 =?utf-8?B?QUZDSm9mcXkwaFh0N2NPZjJZOGNTQ1hueWFrZzJCc01JVFlXa0d0emwyZVNZ?=
 =?utf-8?B?N1FCQ2kzRURqU1p3alRWM3VKUFgwblR3ZkRnc0pBMk9NYkYvRkZWR1JBbEFt?=
 =?utf-8?B?NWdTSi9ZblRtMHhJYkl4VDkvME9rOHFjZUFWOFBPZ29yZXptdERZR2Nuc1Zy?=
 =?utf-8?B?QmxKS2t4Vm9SbDBhSGpKM3B1TnNubFRYWUc5T0pwaFJUbGF4QmRJM241Rzhv?=
 =?utf-8?B?eUdFUloxNXlLQksxSG9xYkNiUXFpSnQrRHdyaE1LelFLMC9NSGtvVkRDS3pV?=
 =?utf-8?B?TnR2V3BRZGZ2bXBvY05NazlXVVVldTZTZ1ZwTktzS0JFUDYxbjgyZHdjNU13?=
 =?utf-8?B?enZoVkhmdlFnT1lFWDB2eGJGWDQvNFcwcVZEOFdBNXVmVzMzTWJFaHlUZjBw?=
 =?utf-8?B?d1pJNkdZOU9LcTJ1L1ovbXRqdkxuNlVtK05rcFIxL3BTVGdzb1loMFlreGFX?=
 =?utf-8?B?TGtyREVLdm90eFE1TVUwa2FvZFZJZ3BON0w2czU4aWU1akNieVQyUkJCOWg0?=
 =?utf-8?B?b2F3NVRGSjNiU1UvRWhJMGRXN1VIYVdURXZiRFIydnhoTnViVFpHcGJjMDFW?=
 =?utf-8?B?YURaMHJyTnYvMHd2ditGWnJmZjRNK0dhZnRKcGFEM2RCOEM0NXJhRVBjYzVO?=
 =?utf-8?B?RFF2Rnp2UzdLamtTcDRGM1VMWENqQ2dRVFFiU3Rxa0dDOHQ5VjNYemM4MCt0?=
 =?utf-8?B?QkZNUW5MRWNoT1c2b2EyOVNSeHZMREpXVURzTTJ2VUU2YUpNTXQ0cTRuL0RH?=
 =?utf-8?B?T3NhOEcyWHU4ZFBObkpEdEdHQjY1dkkvSmlDQnJWc2diczIwcmFTT3E3OVRK?=
 =?utf-8?B?LzFQUytHakNNcGVjUUhqSlprdHEvemtnU1Z5clQ3ZHNhaDFsY1lxMXI1N21B?=
 =?utf-8?B?cUNDcXM1WVRpUFdWSFdPUWZTZkh1cUo5T015ZFZHUmN0YXF3NEtPUXUwTmJM?=
 =?utf-8?B?b2d4L0JFNmt3aU54cTFaQmRTUTAvaGEyeEtpeXZ2TDRjdUIxbXN5c2FsSGl4?=
 =?utf-8?B?bFdFNnVlNytCT2IycUhNd2pVdlhQRzc4R21BMkY4dW9vMEIrdzRFR082MWlM?=
 =?utf-8?B?czdtclhkNytEeWN0U3Fnd256WjZMK3pRL295K1B1Rjh1WjhlNVVVa1kzYlJp?=
 =?utf-8?B?ckxxWXJTTld0NTdKS29rNFpwQ3NOOERIR2lpT2dFZGhhbUQyVUxtdnFKVi9y?=
 =?utf-8?B?OU9kY05PUUViRnkwNWhaWU5FOXQ5RGlrTVowcmZ1ZEtKZStUaUpPRGdUNjZL?=
 =?utf-8?B?VXNMUSt4eFJKQ3hYaVpvQmhld2thTzFBMnJ6aGd1NTN4ZU1KWCtwV1lmVnR2?=
 =?utf-8?B?R2srMjA2RE1KV0NQZXkvaVc1NzZHZzdaS2sxTFFVL1NCRW96Y2hQZHAvVVo3?=
 =?utf-8?Q?aPO35IQU4Flx2k1P5BL+YRPQ3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb0600a-4c11-451a-f5e6-08ddf5df34cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 11:41:56.8633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tsn5bEykd/SjO9MimsOFqxV7HBB8cMpBaWwQMgcOK5TntYgDH6u8FGD7URYZH3kQuL93OAK4W2y553/tc6Pqdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 11:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223597

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTAsIDIwMjUgODoz
Mw0KPiBUbzogcm9zcy5idXJ0b25AYXJtLmNvbQ0KPiBDYzogTWFya28sIFBldGVyIChGVCBEIEVV
IFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0g
c3FsaXRlMzogdXBncmFkZSAzLjQ4LjAgLT4gMy41MC40DQo+IA0KPiBJIGFtIG9ic2VydmluZyBh
bm90aGVyIGlzc3VlIHdpdGggdGhpcyB1cGdyYWRlLiBwcm9qLW5hdGl2ZSBmYWlscyB0bw0KPiBi
dWlsZCwgaXQgZGVwZW5kcyBvbiBjbWFrZS1uYXRpdmUgYW5kIHNxbGl0ZTMtbmF0aXZlDQo+IHNl
ZSAtIGh0dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMvODgyMjAx
Lw0KPiANCj4gcHJvaiBhbHNvIGZhaWxzICggZm9yIHRhcmdldCApIC0gc2VlIC0NCj4gaHR0cHM6
Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy84ODIyMDMvDQoNCkkgd2Fz
IGV4cGVjdGluZyBzb21lIGZhaWx1cmVzLCBzbyBoYXZpbmcgb25seSBvbmUgbG9va3MgZ29vZC4N
CkknbGwgY2hlY2sgdGhpcyBmYWlsdXJlIG9uIG5leHQgcmVzcGluLg0KDQo+IA0KPiBPbiBUdWUs
IFNlcCA5LCAyMDI1IGF0IDY6MDXigK9BTSBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gPg0KPiA+IE9uIDkgU2VwIDIwMjUsIGF0IDEyOjIyLCBSb3NzIEJ1cnRvbiA8Um9z
cy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+ID4gPj4gKiBhZGQgaGFjayB0byByZXdyaXRlIG5h
dGl2ZSBiaW5hcmllcyBhcyBuYXRpdmUgaW5zdGFsbGF0aW9uIHdpbGwgc3RyaXANCj4gPiA+PiB0
aGVtIHVuY29uZGl0aW9uYWxseQ0KPiA+ID4NCj4gPiA+IFRoYXTigJlzIGRlZmluaXRlbHkgYSBi
dWcgaW4gZWl0aGVyIHVwc3RyZWFtIGF1dG9zZXR1cCBvciBzcWxpdGUuICBIYXZlIHlvdSBsb29r
ZWQNCj4gYXQgYXV0b3NldHVwIHRvIGtub3cgaWYgaXRzIGEgYnVnIHRoZXJlLCBvciBpbiB0aGUg
dXNlIG9mIGl0IGJ5IHNxbGl0ZT8NCj4gPg0KPiA+IEFjdHVhbGx54oCmIGFyZSB5b3Ugc3VyZSBh
Ym91dCB0aGlzPw0KPiA+DQo+ID4gSSBqdXN0IGRlbGV0ZWQgeW91ciBoYWNrLCB0aGUgZG9faW5z
dGFsbCBsb2cgZm9yIHNxbGl0ZTMtbmF0aXZlIHNob3dzIGl0IHVzaW5nDQo+IOKAmGluc3RhbGzi
gJkgd2l0aG91dCAtcywgYW5kIHRoZSBiaW5hcmllcyBhcmUgbm90IHN0cmlwcGVkIGluIHRoZSBp
bWFnZS8gZGlyZWN0b3J5Og0KPiA+DQo+ID4gJCBmaWxlIGxpYnNxbGl0ZTMuc28uMy41MC40DQo+
ID4gbGlic3FsaXRlMy5zby4zLjUwLjQ6IEVMRiA2NC1iaXQgTFNCIHNoYXJlZCBvYmplY3QsIEFS
TSBhYXJjaDY0LCB2ZXJzaW9uIDENCj4gKFNZU1YpLCBkeW5hbWljYWxseSBsaW5rZWQsDQo+IEJ1
aWxkSURbc2hhMV09NmU4ZDJlZjc5M2E1YWNmOTI3MTE2ZjhmZmE0YjI5YmNiZTM5MzRhMiwgbm90
IHN0cmlwcGVkDQo+ID4NCj4gPiAobXkgYnVpbGRlciBpcyBhcm02NCwgdGhpcyBpc27igJl0IGEg
Y3Jvc3MtY29tcGlsZSkNCj4gPg0KPiA+IFJvc3MNCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3Vw
Lg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMjIzMTEwKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLQ0KPiBjb3JlL21lc3NhZ2UvMjIzMTEwDQo+ID4gTXV0
ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE1MDU0ODE4
LzE5OTc5MTQNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiBbcmFqLmtoZW1AZ21haWwuY29t
XQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

