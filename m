Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AEBC5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 19:36:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web10.36021.1748288207821695334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 12:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=cJ2TV/Sn;
 spf=pass (domain: siemens.com, ip: 40.107.22.57, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjZx1jK3HKcePyEkg+4MW5B3bYogi8j2ax4CfE5vTWEHJdQfC5t5PI+mkfw/JYdIz+eqgiLfxvD6tgtJtyu+WyfoMEmC2ZqcDKs9tsLi9yEhuxg7R6E826CKa7SCs7LtbwNYhogyWmTSBWz4ZJsJPcCudgqsxDRpdkBdS7RR49wJGpLVBctv+JTqvD8vMW1zlxTkdPg5EyjaR1lahXWqJE7akLzYJBL3yJ/rkxBWqBKAIJ0g1sXCzLGokCkY27PJJnBaTCMPd8cMRP1K057nBP1LEIdSV1GEGByoms3NgvnlCMKAiBuh7GxqCt0t16eER6itWtE1uexZuSRHUh1FQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQOBlFC7fYh1S7oaKEp0q6iYSq857pknJk0i0jtkGKo=;
 b=q4/GcVl9t7szVHoxnzOSi3bZrfdU3kOlzNmuIn3LqKhL2+KYpErC9vMwxLjRrDDTavWDmGarDUELTdgTJnhYAZQVdHBxPNZJbFShj86MlJuNouGSsjYPoYbjfXr+5h5/vkar3FBF1iOhr8LW/GOZcKAydny2ROv2iICbatrTSF/hN0YHL0Dd36wZg9HmPoi0BVUtcvuVNDAlj2/JZk6fvWa/Dq+H2cs15h27d9l5GMGLe5SKiQBu2dd2mi1lWc8il4OxGBlxd+iqsjdP01z+wLxKOa9XunWF94+kKU8ezPVbDr00bWIdJdxBkUI/rqXXLYiVqow2LG9TVDKx4GZEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQOBlFC7fYh1S7oaKEp0q6iYSq857pknJk0i0jtkGKo=;
 b=cJ2TV/SndEVKAezvoB3N9JSxAwoz0ZRjIvUB1IVEi3NuequSBCfv7OIr404BcpxNfKobChPEIND0Y2t4i6a3VK+GhDVZBHReC1leNv4dgoa04gciIvRFgyvthgNtTrEbjs3451GyjJXHnJ3k1Ohx71xGrmNpAt6/iohTgRJJS2As4YcKPrFZMRB+oFqq3cmiHgZVvijJ1IU8LHf2NFnHDIKzU0FMFfJ1ngA2A2cWlqfWNUiX6w7Cyl/0HboPpFLRmLcGkD0bE2DmNkmgnVQhIID+FrphQz4Je6eaM1yYFl4x9J9g4TZO27bATah1giJE3qfa+7ACn87iMlCUSvlrhg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8657.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 19:36:44 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 19:36:44 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	Hongxu Jia <hongxu.jia@windriver.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
Thread-Topic: [OE-core] [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
Thread-Index: 
 AQHbyiezz4/hWYLLWUu2UN/JWqui2bPeMcAAgAAAPDCAACkdgIAANbVggAAD/ACABZlmAIABBJkAgAAY6oCAAArPIA==
Date: Mon, 26 May 2025 19:36:44 +0000
Message-ID: 
 <AS1PR10MB56971B74D740A860175C9FC3FD65A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
 <DA2H7Z2IQH15.8AQHUB50F8SB@bootlin.com>
 <AS1PR10MB5697E603603C2156BCF1DE5CFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DA2KDA7L7YRZ.2I1CKTLPP29LZ@bootlin.com>
 <AS1PR10MB5697DC8D007471A68D8709ECFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DA2ORDMJAWTX.2XH4RND735F7C@bootlin.com>
 <CAMKF1spdgbveyFvNWoouh9XEdU+RAOX9pNoUgFGe4N2=XcpUEg@mail.gmail.com>
 <AS1PR10MB56977F36FC787279594F0831FD65A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1srrVUB7Y-AtkBcMnHMzw=195=SLonLdaxnjkBT+MrMXNQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srrVUB7Y-AtkBcMnHMzw=195=SLonLdaxnjkBT+MrMXNQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=35203c9d-b57d-4345-922b-6cd9cb6a3e6a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-26T19:36:00Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8657:EE_
x-ms-office365-filtering-correlation-id: 74b457ff-f1b5-43ea-0d3e-08dd9c8ca57e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TitLTjg3Y1EzbmNWQUo2SDZ1aU5yZmtaNldYTnkrckZ1ZVZHMk9obk1RNFNF?=
 =?utf-8?B?OXpvRTQxZXRjaGhLUFV2VEtxb2hzeUlSdVpqdGNpb3RZbTZoOW8rQW9ITnlo?=
 =?utf-8?B?bFdubXdsb2h3ODlKQlB1YTNadlZwVlV5bW8yY0VrUWtHRm84QkdtemlkTXBr?=
 =?utf-8?B?aGRqTDdMaXBPekltOEhidkx5cHZqQTViWStqUjk5Qk9GUjcwaWswKzJ5QmpR?=
 =?utf-8?B?Vm9Rdk1ITXZYcXYwSS93ZlQ1L21BT2h5SDRvRFJzQUxqVjhkNXlWUXNvWEs1?=
 =?utf-8?B?T3NHL0srVXl2eWNZRjNTOVhyVkpvNDZHSjVoRzY0ZVdNVFludmlNMFVSd1lG?=
 =?utf-8?B?RU9MOTdBYWp4TWVhMGJ6SXJ1a1NKVXJCV01tUitJazZNYjA2Tmg1ZFhIU25s?=
 =?utf-8?B?S0ZTaTVkajRCQlFiOXI0eFYxeTNiaXBLWmpPQjlFMG01K3ZXbUUrM05vaExD?=
 =?utf-8?B?NXBkODhkeGVpYnZXc285MC9ZOC9GcDBQaUY4dzVBRk9CNEIrSDNZSWUrdE9L?=
 =?utf-8?B?ZFVYQTRrdWFlZDJqbEJ5VlpSeExCSlRIUDFGZEpZTU15NWhDYjA0TjNoT2Nt?=
 =?utf-8?B?U3ozV20zUHJSVkFyVDNaMXNPTE9hT2FmM0pnRk9GSXJjZDVyUzlQd2EwWXBi?=
 =?utf-8?B?amI3MStLejlMcnBzVHVKZjJSZkJDVEN3Mjk4SURTYU9CbmhtM01iRUN2WVJT?=
 =?utf-8?B?V2VGN1NoZWJsVjRDLy9DZWhUVjVIdGNCdk9aQ2JFSlQ0WHdmdGNYS0xGRVl1?=
 =?utf-8?B?WEJrWTZ4SkYyNGRkRDZDaUFURmhFVUdZbldnenlTZmQyV1VxMHJPMTF2YkF3?=
 =?utf-8?B?NjV1KzVva2FtQzJIZVJYcWpaVDhhL0NwQ3NSdEtVUEVSQ2JoVXc0L3M5NWE3?=
 =?utf-8?B?LzMyVklIZmxOWThqR0Z4NGh0bWYzODdMSm1VODEvTER4bm50WWhQVllReFBH?=
 =?utf-8?B?UGhWWWk1MjF5Y3lPY3MzdHFSY29yK0VqaVhHODF6ZnRpVjJ5dm40WGJES29Q?=
 =?utf-8?B?ZjlPNEVpNk83MjEvc201U0ZkQlZMTjFEcmdhdVYrQXN2UmxIU2ZuTGxOQXdF?=
 =?utf-8?B?VmJBVXg3MnFIVEhMZUZTUHFrNGFhZzVpTG45Ykp3R0FrSkx2M215cVR2Z3J3?=
 =?utf-8?B?bG5PNVJMWi85TEFTZGxBaVNzMVoxT3BWdFY0THI5aGlLdU9GblNxZTV3TmJr?=
 =?utf-8?B?QjdKWkZQQ0RURGlKQmVvMSs3bVNoUEZSQVpqWWh3SThqcUh6cmM2dTVmV3h6?=
 =?utf-8?B?NHo2Zkk3S1RERTdqbm1sWlZTL1VmUE5Yc3RXaFJxWDlyckR0cTFwVEtBUkt3?=
 =?utf-8?B?em9VNGNhS2U3RTEvRkx1am1VelJJc0hMd2ZBZHNjNUU4Z1RoYnpBMmNYNXY0?=
 =?utf-8?B?WlVTeGJtT29qaHd0dVVYMEtjcnIrRENrcnRwMVVyMU5NeGYxOWhiRWdMV0Nl?=
 =?utf-8?B?MzUvWWFDTTA5TUs2UVB2eStzUVEyc2xoK0tpdmVjOW51cUZacTRJZnBIRWJo?=
 =?utf-8?B?ODdzYXd3R0hVeUhIeTJoV1FGNXZGYXVUS0pQL2JRYVM5YmVlRVdNQ3ZKS0ti?=
 =?utf-8?B?TUduUEdPbzFrSTNoTnhFU1c5c2IyZUJ2bmp5T1VHeHZ0NnM3empvbDhvN29r?=
 =?utf-8?B?cHE1WlZNdEdPWEtFL1FicVVWUHNXcDFqNjE5bEgvb2ZYbnR4SXo0ZXNNWGVl?=
 =?utf-8?B?bFdBMjViNHRlbmtYUzdIMnJvcXVDb1dLanRpaHJRaEl4NHdiUTlwazAyZmF2?=
 =?utf-8?B?ZDZ4SWt6TGVtcE9FbUpYSVdFREhGZHJwMDZ2QUhGSFZwdkI4TTRHdlFlVndY?=
 =?utf-8?B?TjcyTW02ZmlnSDhLVXJjNFJoWm01b0xDWjQ1Q05XS1BpdW1VUzR0MXJZVHNN?=
 =?utf-8?B?Rk9iNDk4c0pEM3Z3dzh1a2ZJQWRyUmJIOHl4UlFKbHM0UnFFckw0SDAvTFg5?=
 =?utf-8?Q?vseais6O9eg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bFBaRFlTT0lJSnQ5QW9PY2lUNS85Vi9wYWQ3L0ZYOWp1UHM1L1prck1Hb3Bz?=
 =?utf-8?B?cHJkSHNLQ3plRWVJYUp3QmwwYWp5WEtsY3BIU0lybXVZb0FEUFUxSFlUT2hz?=
 =?utf-8?B?eTBmeXhiSzYwQTBENDUxV1ZMcENuMlNWVmNKc1pXaUZpbHRleG90NG5Qc0kz?=
 =?utf-8?B?YTI3emZVSy9CMm1Oc2JqRnJsSDQ1UjAwT29yNjZYUFJhdnlIWFNaWkdqZHBE?=
 =?utf-8?B?SWZjKzN5MFpBd3M4TGFMSUtOWXpGZS9HOW83MThpR2c3K0hYK3h2TDVHOGVp?=
 =?utf-8?B?T245QmVqVytuNmplcjV2cmxaLzBmdEhVY0NkMGlOc0xWS3pCeHhxT2ZIamMz?=
 =?utf-8?B?WWxNTUhWajl3ejFGUm5UMm5SaHN6bXdXdU52bE13bDVxYWFObWEzdFBHMEgw?=
 =?utf-8?B?ZjV3a2J6dDgyKzV5V3FiYTJ0ak1DcFEyQ2ZTTkZ3aURnVlErSVkzeWpZYkZR?=
 =?utf-8?B?RG1rTWNvemJTWVd3eFNhdEordktPRmNxbU9GRHFWckJZQjh2d0F0dHlyMnZU?=
 =?utf-8?B?aUZxc2hDV2FzVEgyQmdPdkF6ZkNJYzVKa0JybGtINlQyVk8wL2xiMExuNGJV?=
 =?utf-8?B?c2hxYmp6SkxzaWZCWWdYWUtPUlljUUlYV1d0NnpFdzlFdUVpM3BxUzI5aEEv?=
 =?utf-8?B?bmNnRzJKb0lXaS9CN2pZMDJjd2FPUlhKT1pvSWt3SE0vZjNYQk9iWE0waXIy?=
 =?utf-8?B?bzZoaXUweEp4RzR0YXp0ODdMNGcxMTJEa2Fzc2oyd25kcVVCWTZGNHI0b3pH?=
 =?utf-8?B?SlVubVFzNmdQTHJkYTBsRXNtVEUzUFhzN1hUeU9VY0N6UXJweFdUVGt0VkRi?=
 =?utf-8?B?ejlSMnZ1WTh1RXVZdklWY0RMSGlvdDdmb0h3cTlRKzh2ZmJ5UC9pdzhmRE1x?=
 =?utf-8?B?RjVaTTZUM3FJSEIzOUI4K3Z4a0pNTEh0TUx0Z3Y2OUVMR0tGSVpYWXhUY3V5?=
 =?utf-8?B?Z1FmNDRxMDJ5cE9KSGdlbU03L2l6RU0wM3JyZ05DQTQwRDdjN0Z1K3dTWmZU?=
 =?utf-8?B?SFhoTUZZSmtEN05LdTN5eVlDV0ExRkwwOE9mYWpFMFBSc0RaK3R3NnF1MVp0?=
 =?utf-8?B?dDZUcE5XaHprMUpFZzRzMnROZ3pnenBzUmM3aFU5NTNNeTRNNktGcTIyN2hq?=
 =?utf-8?B?eUxUbCszRWZHSVNMZ0NmMWd4bzlGRmRubm0wRTFQeVdXSys1RnJwNEt2MzVq?=
 =?utf-8?B?VEx5TnFjaDZtc0R2ZzJQZFhSNmpFaGpIcjJBc1dTSXdhb3BBRjNvL2NBeVcr?=
 =?utf-8?B?S2x2N2VFRHgwckNPRnZ0S1VhVktwM0RQNm1IM1dCQ1h3MWpWTXozQzlCK3JT?=
 =?utf-8?B?ZWhJNDl2VjFmenFLems2eG54WFZRWVJ3c1lOaGhidUE0NWJYckliUkFjc2Rs?=
 =?utf-8?B?OEFCc0tlM0pHQWxYZ0tHQ0dvSzRNMm5SUmlSMlYvOVU4K0tnZTFicEt6d21U?=
 =?utf-8?B?V01Fem93aW8xem5FUVFYV1RadVVLUHE4SWJKbU1qckxhbDlJajkvblh4MFZK?=
 =?utf-8?B?TDE5UllDZWliamlEMDJMTmpjZW9MajA3MlZ3NlpBVGgwQy9CR05Xai9hYVZs?=
 =?utf-8?B?K3NJSFEwTytaVURlZVZlOEx2Zzg3NWErOU1HRjFETWM4VExwdHRTN1BkNi93?=
 =?utf-8?B?QjNnSWMxMGpvYStwaEppUDFsRWpjVkNoZ3dJaWpaNHF0akxXdHBOU0JtK3Zj?=
 =?utf-8?B?TjVjNitRaU5IS2cxZXJBa0xONTU2OUFRMGhwZjRDSXNZbU5WU2ZsNEtSN1Nq?=
 =?utf-8?B?TkxEVjJ5V051L0tuVm5QNXZwSnhaQmJVSkdBbDkvNXRlVGxxNzQvTTNibHFE?=
 =?utf-8?B?OG1Lc3N2OGt4UEQ2c04ydlR5dzU2WGxCUVNLSjg5WXpWbGZhc1RQakg5Ykhs?=
 =?utf-8?B?U3F0YXMvcHNSeURveExkYkQvaTZzS2YrcmdSYkFWZlpVVTJZMi9BMWtzUDBV?=
 =?utf-8?B?cmY2RzRUMzVpc2treEFNeFlIWTdjMEpWTXNqMmIvazdoNmpsNklTeEw3dkhi?=
 =?utf-8?B?cHhIUmpVeHlkVVdjOVdHY3J1VzFmTHp1L0FPby9FZWw2QlVleDVqK0tWdFA5?=
 =?utf-8?B?Y09OSWVqUERXMUMyaXd1OERVWVpXQnlmdk1FU1ZSV2VuVzk3WlhUdk00ZUox?=
 =?utf-8?Q?7I39nOKou1M/evAGR4GJ3Ys0W?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b457ff-f1b5-43ea-0d3e-08dd9c8ca57e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 19:36:44.2270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQckjILya+li1K3rZafDjlCCpmku1ISsa7ZoTfbM3UodadRB+hxMqCNcD+/THy953/j9QZJz0EVSK3zpYVwHWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8657
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 19:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217276

aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2Fn
ZS8yMTcyNzUNCndoaWNoIGFsc28gaW5jbHVkZXMgbGluayB0byB1cHN0cmVhbSB0aWNrZXQuDQoN
ClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBNYXkgMjYsIDIwMjUgMjA6NTcN
Cj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVu
cy5jb20+DQo+IENjOiBtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb207IEhvbmd4dSBK
aWENCj4gPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT47IGFsZXgua2FuYXZpbkBnbWFpbC5jb207
IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvNV0gbGlieG1sMjogdXBncmFkZSAyLjEzLjggLT4gMi4x
NC4zDQo+IA0KPiBPbiBNb24sIE1heSAyNiwgMjAyNSBhdCAxMDo0OOKAr0FNIE1hcmtvLCBQZXRl
ciA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gSSBoYXZlIGNo
ZWNrZWQgdGhlIHByb2JsZW0gYW5kIGNtYWtlIGZpbGUgZ2VuZXJhdGVkIGJ5IGxpYnhtbDIgcG9p
bnRzIHRvDQo+IC91c3IvaW5jbHVkZSBub3cuDQo+ID4gQnVpbGQgc3VjY2VlZHMgd2hlbiBJIHJl
dmVydCBmb2xsb3dpbmcgbGlieG1sMiBjb21taXQ6DQo+ID4gaHR0cHM6Ly9naXRsYWIuZ25vbWUu
b3JnL0dOT01FL2xpYnhtbDIvLQ0KPiAvY29tbWl0Lzc1ZGRlNTBiMjAyMTVhMmEzYTQ0NWI2MmYz
NmE2N2M4ZWQzMzdjYWINCj4gPiBUaGlzIGNsZWFybHkgYnJlYWtzIGNyb3NzLWNvbXBpbGF0aW9u
IHNjZW5hcmlvIHdoaWNoIGFsd2F5cyBoYXMgYSBwcmVmaXggd2hpY2gNCj4gaXMgdXN1YWxseSBj
YWxjdWxhdGVkIGZyb20gY21ha2UgZmlsZSBsb2NhdGlvbi4NCj4gPg0KPiA+IFNpbmNlIHRoaXMg
aXMgaW5jbHVkZWQgb25seSBpbiAyLjE0LjMsIHdlIGNvdWxkIGZvciBub3cgdGFrZSAyLjE0LjIg
d2hpY2ggSQ0KPiBzdWJtaXR0ZWQgYmVmb3JlLg0KPiA+IE9yIHRha2UgMi4xNC4zIHBsdXMgYWRk
IGEgcGF0Y2ggdG8gcmV2ZXJ0IHRoaXMgY29tbWl0Lg0KPiANCj4gYSByZXZlcnQgb2YgdGhlIHRy
b3VibGluZyBwYXRjaCBvbiB0b3Agb2YgMi4xNC4zIGlzIGZpbmUuIE9FIGlzIG5vdA0KPiBhZmZl
Y3RlZCBieSB0aGUNCj4gdGhlIGNhc2UgdGhpcyBwYXRjaCBpcyB0cnlpbmcgdG8gZml4IGFueXdh
eQ0KPiANCj4gPiBCdXQgdWx0aW1hdGVseSwgd2UgbmVlZCB0byBkaXNjdXNzIHRoaXMgd2l0aCB1
cHN0cmVhbS4NCj4gPg0KPiA+IFBldGVyDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiA+ID4g
U2VudDogTW9uZGF5LCBNYXkgMjYsIDIwMjUgMzo1NQ0KPiA+ID4gVG86IG1hdGhpZXUuZHVib2lz
LWJyaWFuZEBib290bGluLmNvbQ0KPiA+ID4gQ2M6IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBC
RlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+OyBIb25neHUNCj4gSmlhDQo+ID4gPiA8aG9u
Z3h1LmppYUB3aW5kcml2ZXIuY29tPjsgYWxleC5rYW5hdmluQGdtYWlsLmNvbTsgb3BlbmVtYmVk
ZGVkLQ0KPiA+ID4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCAxLzVdIGxpYnhtbDI6IHVwZ3JhZGUgMi4xMy44IC0+IDIuMTQu
Mw0KPiA+ID4NCj4gPiA+IGxpYnhtbDIgdXBncmFkZSB3aWxsIG5lZWQgc29tZSBwYWNrYWdlIGFk
anVzdG1lbnRzIGluIG90aGVyIHJlY2lwZXMNCj4gPiA+IGRlcGVuZGluZyBvbiBpdC4gZS5nLiBs
aWJpaW8gZnJvbSBtZXRhLW9lIHNlZQ0KPiA+ID4NCj4gPiA+IGh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS9hcGkvdjIvbG9ncy8yNDkwNDQyL3Jhd19pbmxpbmUN
Cj4gPiA+DQo+ID4gPiBPbiBUaHUsIE1heSAyMiwgMjAyNSBhdCA1OjI14oCvQU0gTWF0aGlldSBE
dWJvaXMtQnJpYW5kIHZpYQ0KPiA+ID4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gPG1h
dGhpZXUuZHVib2lzLWJyaWFuZD1ib290bGluLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gT24gVGh1IE1heSAyMiwgMjAyNSBhdCAyOjE0IFBNIENF
U1QsIFBldGVyIE1hcmtvIHdyb3RlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT0ssIEkgaGF2ZSB1
cGRhdGVkIG15IHBhdGNoIHRvIC4zIGFuZCBzZW50IHRvIG1haWxpbmcgbGlzdC4NCj4gPiA+ID4g
PiBEb24ndCBmb3JnZXQgdG8gcGljayB0aGUgbHR0bmctdG9vbHMgcGF0Y2ggYWdhaW4gd2l0aCBp
dC4uLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gUGV0ZXINCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+
ID4gPiBUaGFua3MsIEkgd2lsbCB0YWtlIGJvdGggcGF0Y2hlcyBmb3IgbXkgbmV4dCBidWlsZC4N
Cj4gPiA+ID4NCj4gPiA+ID4gLS0NCj4gPiA+ID4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290
bGluDQo+ID4gPiA+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gPiA+
ID4gaHR0cHM6Ly9ib290bGluLmNvbQ0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPiA+ID4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2Vz
IHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiA+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMyMTcwOTQp
Og0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtDQo+ID4g
PiBjb3JlL21lc3NhZ2UvMjE3MDk0DQo+ID4gPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMzIyNTczNS8xOTk3OTE0DQo+ID4gPiA+IEdyb3Vw
IE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
ID4gPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtY29yZS91bnN1Yg0KPiA+ID4gW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gPiA+ID4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiA+ID4NCg==

