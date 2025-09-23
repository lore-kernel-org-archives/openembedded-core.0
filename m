Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4A5CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 12:30:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.web10.15685.1758630628166801606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 05:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=TIggWdb8;
 spf=pass (domain: siemens.com, ip: 52.101.84.61, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XR6dr84tA1C4/aEIx02ax65RCv3B3tebeLyXb+VBd6i4nbm1rjk94t+tkAy+FQRHK05CaDmGVb35FOxZ8XS831FOZUMkt5jLjqc8uHNK1dBIBJoHbqM8+9SwXVTKqUVNbGsdvtwmYvWQqQDW2JxHpPGaD/ljVsNJ3TDQPqIl8C1QKXtc8TqRD3DrnDx3uX7JohlMiBo/a2M6aVbHqxmvSlniwwZ+3F2LhCh/SEhpXLlb/ZsY1cOHVGJYWkw1K7j1XFFUUY/de2seystnZcso7kTKbds2hAFODy20/oEQsSHG8D9bRVYVqxTrYAgO6+yKVq1xnMyjbv0h/1vo8k7+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1IDLx4Xa9IHG2UVpAJFxus19XTjuz4GMrbUQwWnKYg=;
 b=iFTX098nmrT1TMmpsNxsr+v8DMpa0voz2w98i2za+ZZhw0RLMIsJjIEZbKM3FR/o/il1p4ha1Vu32488m+/GvlpV2/s8rRIWhE0qUN2f4NDivbEoHiRCzVEHPhhe7iTeQlkIm2lc1dnBhabtdUumhiNt5Wr4wahKjWjcw363enGubKinevRJGI6YfTaOKE6Gxc8f/8HbcjETzwl8BsV1dX0b2QrF6s5COGBwZnA/5PdtVTYRM/HW9bD0h3EX6SnildTBHyk3CnJf88JaT5rrJ4hRptTui2iDqY90F717aquCVjgFmfx/VDjNxU7WMlEi4dU8wpO4Zovjs/AqkyhB2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1IDLx4Xa9IHG2UVpAJFxus19XTjuz4GMrbUQwWnKYg=;
 b=TIggWdb8KIdTo9dlxNCKhkB5Hh221cWjkJ1cC0MDOsBjFGJcBFnZN4zpb8979HaG+JMRbfQqitk0Q++IPTXiUKYNESW5J+Imnr8zhqXkANsjuAQv7R2v6pd4PZ3AeUoqvbpSjA40RakJ+WBFBNzngIXbyoNJJqSH/jBXTEmXx9y1DmWc7Q3FRtDSgFZt/3yNQ3uHbojR+Hku4woSZgVee3C3g4CfOwLanwlEpBcUtZsVuqO9mCUAcCm8uTk75shItz+cqhKrF8FupKPS7kWxnwq63JQu3JQYukykg50eI1LegWREcQfI69oktygE5qNcDtC2mOQyl3heR8+JkpKsgA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA3PR10MB9329.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 12:30:24 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9137.012; Tue, 23 Sep 2025
 12:30:24 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Niko Mauno
	<niko.mauno@vaisala.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] cve-update: log timestamps and add force update
 for future time
Thread-Topic: [OE-core][PATCH] cve-update: log timestamps and add force update
 for future time
Thread-Index: AQHcFrumwGixcN0FPEGgqgjaa0aiarSZB1kAgAABWqCAAJ2DgIAHNyBg
Date: Tue, 23 Sep 2025 12:30:24 +0000
Message-ID: 
 <AS1PR10MB5697B95623B2339AA021CA90FD1DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250826185922.20154-1-peter.marko@siemens.com>
	 <a9a5777d-d622-4e89-9888-3989f884e816@vaisala.com>
	 <PA4PR10MB5707144A5B4B39EEDF739AEFFD16A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
 <50952460f2bf31d8f1632d20f696a4e06985386b.camel@linuxfoundation.org>
In-Reply-To: 
 <50952460f2bf31d8f1632d20f696a4e06985386b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c1e7d821-6034-41c5-b98d-be3ee51198f5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-23T12:27:18Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA3PR10MB9329:EE_
x-ms-office365-filtering-correlation-id: fa286622-c756-449d-001a-08ddfa9cf88d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TUJMQnNnRXN6WkZxaFh5WFpNQ0V6SHI1QUdpcXZVQTBJbzZTU0RBaFU5MlZ3?=
 =?utf-8?B?QUwvc1lxcVdSYTJIMmpLem8zRVBFNEQ0WlJuY1dsVVByL1FObDJrTmRRNFFu?=
 =?utf-8?B?OTJtY09yeW54Rjc1eG93ak4rbTJDTkVyNjRTY1lLNk5SVG1LU1RZdWhaM2ph?=
 =?utf-8?B?S3FHcmFkOWs5N0crdUt1TEJNSjloSUh4d0JQaUl4VGEzQ25FN29Ramd3OXJK?=
 =?utf-8?B?bzVKcTBHdkNmV3M1MDVTM0diNUtUZzlZdXUxUEU3UjBwQTRoSG5SY2l3SFVq?=
 =?utf-8?B?TjdXRGQydTZnOFpNZTE0V29yeWNJOGZyT1VFcUNZZ3VIeDJtWGk5WGlvYXlW?=
 =?utf-8?B?L3Y5aDRUMEsxTWduWlhSbkJEeHdkRWt1VURVNS9aWEZ0bTF0am81RFd4aTJE?=
 =?utf-8?B?RmtvYlpnd0V3OTk4TTAyQUc1MS9helBVS05abEozaTRQWXltMmdtNWRhbGNR?=
 =?utf-8?B?YXFZZlZUaGZQTzhTbmVNRVpCeWsvS096MG9VeVhpTmo4Y1RrdnR0SW9wMVJF?=
 =?utf-8?B?NHFJdGdMRHJkV0pLbkZ3ck5QczRYVWJ6YlNMbEcvK3dwd01SQVZxRGt0RVRw?=
 =?utf-8?B?R0tLazJTVjl2RUFsTHd3bjVSMjZvRWxta05PYWVFZFIxNjFOL3Rwaks3d1U1?=
 =?utf-8?B?T2hyamJ2bHJQejVHQS9BUEp2UE1LaHAxZ1B3enZvSWx4UlN5WHAzWXJTbndr?=
 =?utf-8?B?cFlEUzJHTG1pby9KVGVBTm13S0d6ODg3eTl3Sy9CM3pSZ0NYWTZIdmZndk4v?=
 =?utf-8?B?UDJaeHBaMTlwRzRVN0lheEhEdE1Hd1NGU1ZwcmpwZDQ4VCtVaitmQUUrYm83?=
 =?utf-8?B?ZTBjcDF4aFBHd3hjNjZkaCtaazJpdExBem45MnlpYXVEVGd5T1FKenE1SHQ5?=
 =?utf-8?B?Vm9FWWVTRUZ4Q0RMdFlmditpd3VtSXc5cUw4Tk4vbEdHVFZhMUZqSnBnd2tn?=
 =?utf-8?B?NU1sVFI3Z28xV3RJUjZqM01aQXl2MnR6NjQydVFoZnhoS2dkVDBVQlEzalgr?=
 =?utf-8?B?NWlhYVFZMmliNlhnWFhZbWE4NjA0dHlSeG9JYWtIdUlJNEJ5T2dBakhwM3Ru?=
 =?utf-8?B?NXZubUNRTkthYkVtcjUxb1J6c29HTUJuS2dDVXozQ1lyODJJU2FqR1FDZmM0?=
 =?utf-8?B?eVRISG05V0xYNy9JSVNwekdET083RGEvUUVESkkzc3kxVzlXTm9LMTM5T0hF?=
 =?utf-8?B?QVcwdFIwbHdjRnZveUtkdXY2WnVaUW5HYXlObjM0Zm15RGpoOUhOR1c4WlJJ?=
 =?utf-8?B?cDcwaGZUK0Y5b0xyS1hWd1lNdUdjQkNudDJhVkJhV3JVRDdnSnl6OE9VQjMx?=
 =?utf-8?B?WEw4WFhWaHJNNzFSSElRUEhrZkh1dHk4R3BRNDN4bnN1NDhOUllodUNJQnJI?=
 =?utf-8?B?QTdXRlptRzJpcUh6WFg4bDhRSEFnUS9sWjlGaUNZL2VBaUVjZTlXWkVQM2lh?=
 =?utf-8?B?QzRSeW8zaTY4WEJ4dnFqeWJXRTFqU01GVVdKcnhPTEJlSjNRbThHU0hSVGdk?=
 =?utf-8?B?cXQycVFVbU9MUHN5UXkzZFlqMDZhYVY3aVQ2ZytnYVZ4eVBJOUJHNGtNVWc3?=
 =?utf-8?B?YWlueWM5Q0pUcVkzMm95VGtydnFSUnM1QWNuQ2IzN3U5VmJPZ29iKzZYWEZ1?=
 =?utf-8?B?ZXNVK0dKbFROV2c5T1VrMDR4WVhIZ2dVb3RIY0JUdVRTL25qSzBvbDNWcXBl?=
 =?utf-8?B?VE1hVVY2c3lmR2s1UVVqUTg5c2FqMDlQUHdJM2NTUWNBenNnNFR2Rkc2Q1Q1?=
 =?utf-8?B?aWNXamgxUGVxWWIwS2ZCekprcXVpSW5sM25lcVRJWlJmQkdDK1FCRDZjTDN1?=
 =?utf-8?B?b3BBRWdmY2dsRmVma2tSM25kZENlOGVTRU9jdlVETTV3blhtMlYwM05yTVZO?=
 =?utf-8?B?T0FmSmw2NnFnOE1YUlBEVElON2g4dGExd3pSajlaSTFDMEswMGVCaHIwMGJ4?=
 =?utf-8?Q?KVhtBdrhXac=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UW93TFlZRjU2cndQU0JFWFdJMDRsdzhwbTdFcDJQTURocmhwYkp6SFJWUCtk?=
 =?utf-8?B?dEY5MjkvT0JORm5uNGNwQmxBZjNzUFNaTkZNSkJmM2JTMGN1ZTNXK3dkMFlF?=
 =?utf-8?B?d1h0YlZ3VjQwNHZFRTJJejVMSEZ5dTFGaHUwYndSNGd4UXpGSkZ3cmhDMG80?=
 =?utf-8?B?VWdkQXhMMHlUV3FSaWhiQkg0VXp1bzVHY2J4OSsvSVp4UVdnbi9laHJhdG9D?=
 =?utf-8?B?aEJlUnZIM1FmdTVWenFpK01wTFk2OUlUQUFHMGRKOTJEU2lkd2xNcGxNb1ZC?=
 =?utf-8?B?a1RpcG9wLzJId0MrVUgrdml6RjJ2b2p0SXozYmdodThhM1oxR1MyNlU3dU9W?=
 =?utf-8?B?MGgvSW5QaUI5QlVuYUxBcWlmZDB2VE43dUQwOUViR0xHRFhKc3YzVlFEUHJm?=
 =?utf-8?B?SGlYdndsT2M5ZnFDREE3RWE5eFVOUi8rK0E0MlZRMXhQc1F0MXdRVVZiZHE4?=
 =?utf-8?B?SmlENzlVcm9uMzBvdUpUc0lWM21ycTJOaDlpbnZra3cyQm8yUC9JM0lRRGRI?=
 =?utf-8?B?bVBwUXRHTzc1UWtsZi84Q2VkeXgzZnQyQkM5L0ZjMnB0RlhFb3ljTzN6ekNm?=
 =?utf-8?B?aXZTVGJ4cmVYRVpwMDhpZ21MY2pGZHRweGRQVytJeDY1N09JdnBnR3o3Qlph?=
 =?utf-8?B?TFYvQkYzMkRISlFUZnh5SFpNcUpMdURjQkFGYkRkOEpaQWQxY3ViQWxRWkl5?=
 =?utf-8?B?cXEwRGVhYWhrSUtDdHZRcXhTOFdTUjkvdW5sSHRMT3ZVb0FrU0lUeDk3UXY4?=
 =?utf-8?B?YlpoTU1DdHhzUTJKOVF3MTUrUG9JTkl5TDNYWnNMZmNtTFRGZlN5NmdOZWJz?=
 =?utf-8?B?alkrUVlsck16NDZXdlNpendMcmZPcWoveHg2TGdzNEIreXVSTkNTT3d6Q0VJ?=
 =?utf-8?B?OGRaUDR3VVRYWEtLNnM3bkg5dFJmNzFXcStPUG4rZ1UyaGREZHdKQjZkNnR4?=
 =?utf-8?B?TURtbXVwdTVtWWdDVmVjbXQxSzBIcURPR3NDd0dyU2tmNzFWUm9qZGN1SENC?=
 =?utf-8?B?VGkxOXMrUERuUDZqZkM2WGFhMlNkWnVVamE2Mnd4anJKTlN4Mmd0NXB1U0Ft?=
 =?utf-8?B?SXZ1czk4OG83RjhSanZqUmlqUWJjUmZSRVpaaFVWZmd1dTgvWGhNTlV3MCtw?=
 =?utf-8?B?SjJ4MDdtMVlNclk3WGNwL3hSa0dWLzZycmNwcFI2c1NuaW9iUGZBR1NySmta?=
 =?utf-8?B?SlZ0amVSQ09RdHFEQWkzZkNMWDJtTkhPZHJlakRlL1RGYTFyM3c3QnF0TWt5?=
 =?utf-8?B?RkxvWWFCeWlsT1lVOEtMcWNMbnVRbGJCbkZmbkZIWkdHN2JneURnbGpPRzIx?=
 =?utf-8?B?am8yTVdjTGZxTHRMZ05hL2NTdUVxeURhRkJzUlBQalFqMjBxMm5mL0F4Mmlo?=
 =?utf-8?B?bU55Tk9JMXd4Y2RKbFFVZ3MxQ21NMzRYWlMrc2NVeWNJVlJWc0FKUUU2RzB3?=
 =?utf-8?B?dDBkVytNSm9Sek1YdmRNMUhiYllLNUVTak5GUDIyT2lkVWZMakFKVVo0N2Ur?=
 =?utf-8?B?WHBvZlRMYi9hcHgzKzZuWWpKdWhxOFZ4RFdFRlQvRnJXVnllcHQreWJvV1Bo?=
 =?utf-8?B?S1ZKUFJ1Yll0UkFuK3JKcFRsa25XaXlERkIzTURMb29pZUhyVCtwNUIzY3JQ?=
 =?utf-8?B?TUlTQlRxdTB4YytuWmM2ME83ODIzVGNMSjZBQjRhd09oS1pudXRLckJobGd1?=
 =?utf-8?B?MTF0UEFZR0pUcDNQay9BS1VQTFA5ZnlDcThhakE3MzFqZkFaSGtKekRGVEgr?=
 =?utf-8?B?YTkrbW5hcUZXVXBGZk9nS01EOUV0bnFtdSttbmppaHVpdDkzNlptSkRlNDFz?=
 =?utf-8?B?RCsxZnhZTWZWNHhRa0hGaFdtMXZuanQvL09UamMvNkdlMGgxdGZubUNVeWh6?=
 =?utf-8?B?L3RhdlEwUmlSYUQrellkOCtKSkVXaTRSOGxnUU1naFFKdGs2TjhsTWhwbkxt?=
 =?utf-8?B?YzYvU3ZkQUl3SkJVWktjZEFvYStBK0cvVnRFU3NHcXZUb0I5bDJKYWR0NmU0?=
 =?utf-8?B?KytSMWpqeTJ3bVREVjdDRDZyYWJoYUNGVHZvOWZoc0dvRFhXWXJkNmw1aEdB?=
 =?utf-8?B?VDdrYVJOREJjSURXU204OUxoMXZXeVowdnhiN1BDallmUTBYb0lUbmlDUlZn?=
 =?utf-8?Q?Ze7GA2ORLl5iNTPt3l5XGFFXF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fa286622-c756-449d-001a-08ddfa9cf88d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 12:30:24.7961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmQMVIn8mbfTSs/pGV58bFSCz1v6LyjPUeP5jWCJ4c3FCTFLq9iOu5745Yx67Q/+aPnaykM1ak4QiPIH7BaFzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223873

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgU2Vw
dGVtYmVyIDE5LCAyMDI1IDA6MTYNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMx
KSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+OyBOaWtvIE1hdW5vDQo+IDxuaWtvLm1hdW5vQHZh
aXNhbGEuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSBjdmUtdXBkYXRlOiBsb2cgdGltZXN0YW1wcyBh
bmQgYWRkIGZvcmNlIHVwZGF0ZQ0KPiBmb3IgZnV0dXJlIHRpbWUNCj4gDQo+IE9uIFRodSwgMjAy
NS0wOS0xOCBhdCAxMjo1NSArMDAwMCwgTWFya28sIFBldGVyIHdyb3RlOg0KPiA+DQo+ID4NCj4g
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBOaWtvIE1hdW5vIDxu
aWtvLm1hdW5vQHZhaXNhbGEuY29tPg0KPiA+ID4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAx
OCwgMjAyNSAxNDo0OA0KPiA+ID4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8
UGV0ZXIuTWFya29Ac2llbWVucy5jb20+Ow0KPiA+ID4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gY3Zl
LXVwZGF0ZTogbG9nIHRpbWVzdGFtcHMgYW5kIGFkZCBmb3JjZQ0KPiB1cGRhdGUNCj4gPiA+IGZv
ciBmdXR1cmUgdGltZQ0KPiA+ID4NCj4gPiA+IE9uIDI2LjguMjAyNSAyMS41OSwgUGV0ZXIgTWFy
a28gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gPiA+IEZyb206IFBldGVy
IE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gQ1ZFIHVw
ZGF0ZSBpcyBjdXJyZW50bHkgbm90IHdvcmtpbmcgcHJvcGVybHkgb24gYXV0b2J1aWxkZXIuDQo+
ID4gPiA+IFRoaXMgaW1wcm92ZXMgbG9nZ2luZyBmb3IgcHJvYmxlbSBhbmFseXNpcy4NCj4gPiA+
ID4NCj4gPiA+ID4gRnV0dXJlIHRpbWUgaXMgc29tZXRoaW5nIHdoaWNoIGNvdWxkIGJlIHJlYXNv
biBmb3IgY3VycmVudCBhdXRvYnVpbGRlcg0KPiA+ID4gPiBwcm9ibGVtcyBzaW5jZSB0aGUgREIg
d2FzIG5vdCB1cGRhdGVkIGZvciBtb3JlIHRoYW4gMyBtb250aHMgYnkgbm93Lg0KPiA+ID4gPg0K
PiA+ID4NCj4gPiA+IENWRSBjaGVjayBtZWNoYW5pc20sIHdoaWNoIHJlbGllcyBvbiBhIENWRSBk
YXRhYmFzZSB0aGF0IGNhbiBzaWxlbnRseSBmYWlsIHRvDQo+ID4gPiB1cGRhdGUgZm9yIHNldmVy
YWwgbW9udGhzLCBzZWVtcyB0cm91YmxpbmcgdG8gc2F5IHRoZSBsZWFzdC4NCj4gPiA+DQo+ID4g
PiBMb29raW5nIGF0IHRoZSBkb19mZXRjaCgpIG1ldGhvZCBpbiBib3RoIHJlY2lwZXMgdGhleSBz
ZWVtIHRvIHVzZSB0aGUNCj4gPiA+IG9zLnBhdGguZ2V0bXRpbWUoKSBtZXRob2QgdG8gcmVzb2x2
ZSB0aGUgbGFzdCBtb2RpZmllZCB0aW1lIG9mIHRoZSBkYXRhYmFzZS4NCj4gVGhlDQo+ID4gPiB2
YWx1ZSBpcyBob3dldmVyIGJhc2VkIG9uIGRhdGFiYXNlIGZpbGUgbW9kaWZpY2F0aW9uIHRpbWUu
IFRoaXMgc2VlbXMNCj4gaW5oZXJlbnRseQ0KPiA+ID4gZnJhZ2lsZSwgYW5kIEkgd291bGQgYmUg
Y3VyaW91cyBpZiB0aGVyZSB3b3VsZCBiZSBhIGxlc3MgcHJvYmxlbS1wcm9uZQ0KPiBhcHByb2Fj
aA0KPiA+ID4gdGhhdCBjb3VsZCBiZSB1c2VkIHRvIHJlc29sdmUgdGhlIGxhc3QgbW9kaWZpZWQg
ZGF0ZSwgc3VjaCBhcyByZXNvcnRpbmcgdG8gdGhlDQo+IG1vc3QNCj4gPiA+IHJlY2VudCBDVkUg
bGFzdCBtb2RpZmllZCBkYXRlLiBTZWVtcyBpdCBjYW4gYmUgZXh0cmFjdGVkIGZyb20gdGhlIGRh
dGFiYXNlDQo+IGZpbGUNCj4gPiA+IGJ5IGlzc3Vpbmc6DQo+ID4gPg0KPiA+ID4gwqDCoCBzZWxl
Y3QgTU9ESUZJRUQgZnJvbSBOVkQgb3JkZXIgYnkgTU9ESUZJRUQgZGVzYyBsaW1pdCAxOw0KPiA+
ID4NCj4gPiA+IEknbSBub3Qgc3VyZSBpZiBhbGwgdGhpbmdzIGNvbnNpZGVyZWQgaXQgaXMgY29t
cGxldGVseSBhcHByb3ByaWF0ZSB0byB1dGlsaXplIHRoZQ0KPiBOVkQNCj4gPiA+IE1PRElGSUVE
IHZhbHVlIGluIHRoaXMgZmFzaGlvbiwgYnV0IGl0IHdvdWxkIGZlZWwgYXQgbGVhc3QgbGVzcyBo
YXphcmRvdXMgdGhhbg0KPiA+ID4gcmVmZXJlbmNpbmcgdGhlIG1vZGlmaWNhdGlvbiB0aW1lIG9m
IHRoZSBkYXRhYmFzZSBmaWxlIGl0c2VsZi4NCj4gPiA+DQo+ID4NCj4gPiBJIHdhcyBjb25zaWRl
cmluZyBtdWx0aXBsZSBvcHRpb25zLCBhbHNvIHVzaW5nIGEgdGV4dCBmaWxlIHdpdGggdGltZXN0
YW1wIGluc3RlYWQNCj4gb2YgdGhlIGdldG10aW1lLg0KPiA+IFlvdXIgcHJvcG9zYWwgbG9va3Mg
bmljZXIuDQo+ID4gQnV0IEkgZGVjaWRlZCB0byBmaXJzdCBsb29rIGF0IHRoZSBBQiBsb2dzIGJl
Zm9yZSBpbXBsZW1lbnRpbmcgc29tZXRoaW5nLg0KPiA+DQo+ID4gVW5mb3J0dW5hdGVseSwgbXkg
cGF0Y2ggdG8gZXhwb3NlIHRoZSBsb2dzIHdhcyBub3QgbWVyZ2VkIHlldCA6LSgNCj4gPiBodHRw
czovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy95b2N0by1wYXRjaGVzL21lc3NhZ2UvMjA4Mw0K
PiANCj4gQmFzaWNhbGx5IEknbSB3b3JyaWVkIHRoYXQgdGhpcyBpcyBzb21ldGhpbmcgdG8gZGVi
dWcgYSBvbmUgb2ZmIGlzc3VlDQo+IGJ1dCB3ZSdsbCBiZSBsZWZ0IHdpdGggZmlsZXMgYnVpbGRp
bmcgdXAgb24gdGhlIHNoYXJlZCBzdG9yYWdlLiBXZSd2ZQ0KPiBtdWx0aXBsZSBvdGhlciBkZWJ1
Z2dpbmcgZXhwZXJpbWVudHMgbGlrZSB0aGlzIGZyb20gcHJldmlvdXMgc3VjaA0KPiBzaXR1YXRp
b25zLiBQZW9wbGUgYWRkIHRoZW0gYnV0IG5ldmVyIHJlbW92ZSB0aGluZ3MuDQoNCkkgYmVsaWV2
ZSB0aGF0IEkgaGF2ZSB3cml0dGVuIHRoZSBwYXRjaGVzIGluIGEgd2F5IHRoYXQgdGhleSBhcmUg
bm90IHRlbXBvcmFyeS4NClRoZW4gZm9jdXMgb24gaW1wcm92aW5nIGxvZ2dpbmcgd2hpY2ggd2ls
bCBiZSBob3BlZnVsbHkga2VwdCBhbHNvIGFmdGVyIHRoZSBwb3RlbnRpYWwgcmV3b3JrIG9mIHRp
bWVzdGFtcCBoYW5kbGluZy4NClBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzIGNhbiBiZSBtZXJn
ZWQgb3IgaW4gd2hpY2ggb3RoZXIgZGlyZWN0aW9uIGRvIHlvdSB0aGluayB0aGF0IHdlIGNvdWxk
IGdvIGluIGludmVzdGlnYXRpbmcgdGhlIGNsZWFybHkgbm9uLXdvcmtpbmcgeW9jdG8gQ1ZFIHN0
YXRpc3RpY3MuDQoNClBldGVyDQoNCj4gDQo+IEkgZG9uJ3Qga25vdyBob3cgdG8gaGFuZGxlIGl0
IGJ1dCBJJ20gd29ycmllZCBhYm91dCB0aGluZ3MgbGlrZSB0aGlzDQo+IGJlaW5nIGxlZnQgaW5k
ZWZpbml0ZWx5IGFuZCBub3Qgc2NhbGluZy4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQN
Cg0K

