Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27267CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 16:19:46 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.9])
 by mx.groups.io with SMTP id smtpd.web11.205.1755620379826318418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 09:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=piRZSpEF;
 spf=pass (domain: siemens.com, ip: 52.101.72.9, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AufMgmrVP4RCH0tUTUjoZxv8CdAiVwVCUPrVdmpNyppdyZy1wDY1HmQWYYHRDD18M/KG59OpVggwOsHWOtRfIG/q+tYSpaEhhqmRQBLcxoeYr5K/SV9WqlNftjNSxGWgiwNCpDjzrvHW+RRzdjrRJoX33bd1BNH+yChaEBW2gjlF+S1XxAVVro+eNwonDCC1ZbISytUL+Eet2zHY6zT1jmcCDPzoV9lSTo7GzGdLEzHhC43ReTfzDOx+GMuNF+sIdtnSanhlWqYl6EQHXkmA08HRnd6YqFwSGS2WdSfPxSANHkye+JHug/lgHs0q0WqMeJhZwwsPji6zbQ/UkDLYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvnUOVb0JWwrBxFXWTJlil1Dma59hA21jAkhxGMyTdE=;
 b=e1/u55ASbcIhEC8sVpVwxXGjhK3uMCAhwf7bhY5Fn1ZiQ4INJl0/xzV/xEzUzyq5ogMghjYkY3NDS2g0bQs2wVQjh7Nhkm8vkITasX7CeuvAON07j4rfIcPsENupxRL1zht3AmZliU9SyqK/2Y6tSsQoaHAHl51tuQdQVVczQ1289czG2ha33nbCMuZ655rHsJSFDH0OWWnvuORFggPOkgM07qBxSqf2tJobfS7BwLZfru71ZhIFfAJ4zY6lJPG4aWXXgMAu3oxu5o1XGl22iiyPoD+pb+B/Sr12meHNE3VCgW1RdXnM/ffdk14EkLA6aGaBwtmVCFte0UrzR4DxYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvnUOVb0JWwrBxFXWTJlil1Dma59hA21jAkhxGMyTdE=;
 b=piRZSpEFfd1d+SIK3xk1gN3uvFOUbPZfJcS+JMcEwDG+hTcA0llFeWq/wfHjfs2WUS3ydpuoOWjIT1KCG/nJMJY9+fVkRF5SIXvRszts8veMuPawEdqXmOwAVpeWtJMRiL5W8lef/agAWbqulSFTioj2Dj8J7pkK6tgrS1T4joL+DilRuzef/Gvd961NLEjmMMNTt2bc8qOn4jNoGBbnJMMp1zGD5DS9i1Mg2UE5s6fmJIQV32I2DWC7YenXLJbT7ty+bdk3FrMxRDhsAKKCeIF30sL9PNMZar6dxwcYnv01STgrZgKoKV3xBnaw8QSsRikDFaW3xwVfKHLRU3rQvQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB7913.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:35b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 16:19:33 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 16:19:33 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] dpkg: set status for CVE-2025-6297
Thread-Topic: [OE-core][PATCH] dpkg: set status for CVE-2025-6297
Thread-Index: AQHcDgbkAyhHoquJ1ESCvQwitbdc67Rp9gIAgAA2npA=
Date: Tue, 19 Aug 2025 16:19:32 +0000
Message-ID: 
 <AS1PR10MB5697BF898E03CB4B9A1AE739FD30A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250815170517.12674-1-peter.marko@siemens.com>
 <ECC125A2-DA09-44DD-8DB9-CB61F89A822B@arm.com>
In-Reply-To: <ECC125A2-DA09-44DD-8DB9-CB61F89A822B@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=309744f9-0850-46b7-8b93-df83b89f334c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-19T16:14:29Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB7913:EE_
x-ms-office365-filtering-correlation-id: 01cfb533-951a-4d13-0b0e-08dddf3c2eaf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?U29uSDJxK0NuUVdnR0x5blZ3dzU5TnN2OXNaYmJISHZUWTlYcWw4cnkvQ2R6?=
 =?utf-8?B?OEREbFRsS1RYWGU4VXJrSVMwV3pHSC90UGJLdjNWUVkxZElnMHV2b1QyNDcv?=
 =?utf-8?B?SWRQU29LdmdMamlXTG9MSFBiTXFzcElwR094SDdYQVJSeExUVTlzcWJJSEMy?=
 =?utf-8?B?ZGNzMnJRSlNoaHBzSk9hKzlrclllUzZqRjBVRzJzOFdmMFpQNUoxUEw2M2dV?=
 =?utf-8?B?S1FleEhBQlRhbUxPQVBBcmpNZ3ZGT2hOYlpzWVJYdmpzaE9VNG1RWTdJRk4v?=
 =?utf-8?B?K2RjY2cyTzczeEl2bFRJUFRlaksza0dyN0Vwa2V1ektrUFlHeTJCcC9CSDV3?=
 =?utf-8?B?RUp3cWpIcld2Z0UxSkU2VWdpTm9QR0pKaEprK083L2JDSGFvZWxpSVRwVkIz?=
 =?utf-8?B?bDB6dWtzK0lpTlMxSFpNeE55aWl1T21RWGhWaEVMOU1SYzFLUkZBK01paWsy?=
 =?utf-8?B?K2ZudGhmTk1kb1VBbGMwOHpWSVlrbjMvVTBGQ29sY2tyQmg0Q0l0YXF5S2FD?=
 =?utf-8?B?djJZR3VCbU92bUJ6TDc0aUhsN09ubUh1RlRvcVVjVlVFRU1uSE40VHBJMWs1?=
 =?utf-8?B?eUxGdXpINWN4RjhzdkhOWHNPSEwzc0F5YWppZjB0S1F3aTZGajBST0FuaXFo?=
 =?utf-8?B?bU1yVzZPUEdkQWJZb2s4bmpZaEwvSUlKQ09wdEJTRFZzTDRQTHNHbENKUWtQ?=
 =?utf-8?B?RWcvekhTUjdodkFHZGZDM3hUbEpsMWVGZ1RERkJuUWVpRjZXSFZnZVBrUFZm?=
 =?utf-8?B?WTNSKzI1NDdDUFdKeXdSWWF3ZDNIOURxc29aVjB6TXhCRHdmeTdhTVI5ekI3?=
 =?utf-8?B?ZllXNXJ4TVRuczJXeGlST3dQeEQxd1UreFBZelZVdUdDZS9ZUXhsZHlNZkpS?=
 =?utf-8?B?eVVNSjdiM09DVTlHMEZVa1BheE82UzNGYUJGNEpRQWVnTzNHd1dmdjcxZnBX?=
 =?utf-8?B?Wmp4VzI0eHd0cHBRdmY2djk1TElGQndFOVFMOWRtelhGeEVkcytwbFEzSnFR?=
 =?utf-8?B?R0J3Y242MUpRdzRuSEtKMVVZUGFJUGNGazUrT0x3UWRTKzFVQVZhaWlMOXEx?=
 =?utf-8?B?dVNSbVhFWmVZMG1waTZFK09GcXNEbFZHNmhOd2V1SWhQbDlTMTBvSFFmZ2hv?=
 =?utf-8?B?N2x5cjNLNE1NNTBYdzZ0UjZsSXVQNnc4bWlWUks2dVpJMkViTUllYU9QaEgr?=
 =?utf-8?B?S1grT1cybGdMbHEzdngvelQwU2FtWVRWRU1xWU0rMUtMZXhkUFVNZFVzRFVO?=
 =?utf-8?B?TU5PNVVJUjVWbVFhcWl6VjNhNGNWZGhDTmFpazREanVYQUk2YVovKzZTUVRM?=
 =?utf-8?B?TjRyUjZ3azZod0JlSlR5L01haE1ZdnlXbWhHTHZYbnRPK2VTRTU3SUJ0UzEy?=
 =?utf-8?B?UlJ3dmZ4QWNDbXhZOTlXZEphU3R1S2V1UlNWWWpJSTZ5WEFHaGx3VmFpMFJJ?=
 =?utf-8?B?N01VdWJqdlZSWGh2NDFjd1M2MngyZURNT2swZ1VNYTMyTjlJT2ZHSVprRXh5?=
 =?utf-8?B?SjNTV0w1TUpMOEw1Zldyd0ZqVHFRbzBtYWFkVDRIZ3NiSGZ1VWgwT0pUclhV?=
 =?utf-8?B?bWZlenl0OTlQMlA1aXZGaktFdGpKQlhoZ0pkTXZkWkVRK3loT1RiTVBtL1FG?=
 =?utf-8?B?dDBsSDNBcUZJOFRGWHB2WFkvZUhXaHltWEk2azF1UTMwZHo2Z1RnUnJVQVFM?=
 =?utf-8?B?NFpjSFltWVpYaTJ1d2luK1B3U25mRVBxTXNNUjJtb291ci9uaTNVYldlVmNK?=
 =?utf-8?B?cHhYWFNqMnNaZlBLVE56bGJOaXk4b2hUS1RGa2FZb3ZDN3BpZ1g1ZEkxazFC?=
 =?utf-8?B?K2ZJTU10WlMwVllTck9EbHdUaTRETllFeFZMcjFxSUdQbmZIMGNrK1N4dmpo?=
 =?utf-8?B?UnMwUkZTZkYyTzZyMnJEalRNVWcyUjZqWUVrSmN2QXk1L0Z0eG5URzNuTUow?=
 =?utf-8?B?OW0yeXBEZVltSDRGWjhXZ29DVUlVTVRMWkR5MG9lbW9hQWx1dTVCam4yZXZN?=
 =?utf-8?B?cGsxcU9lSHRRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MmZEUVJQQnB6UFhWNTVRdEppSmMrMU4xR1p4b2FRejdOc1FoaHNzaTNVemlx?=
 =?utf-8?B?dEVlZ0VzNlZpNFhwTWdmV09EVWpGejhzV3N2Z2kxWVg4cTNQZUlMdk1IbVIv?=
 =?utf-8?B?ZnhDVm96ZHNTSzlJZlB1N2RSRWZ6MkpURzhNRnFyT012N3Y0a2RQUXNjZHF2?=
 =?utf-8?B?REEwUHdDVDJ3ZGpYTEhNeDVnV1VoTWF0ck9RZ2YwQThvQ2FSTmFtTjZkOHFF?=
 =?utf-8?B?a3Z5WUhvZmRvdUsvNzV3VGc3cWFJWkdmc2FqaDV4eDZ0aElEc3pmazY5blpG?=
 =?utf-8?B?L1NlSjY1a2prRWxjM3BvSFZra2NnTURCOU92THRTenhpRVlnaWFseUE3U2Vv?=
 =?utf-8?B?a1hCdFVkNm5WeUlJYkQyWlZIY0k0UVByVkd0Z25vUTFQL2VJRGEyY3ZDdUNT?=
 =?utf-8?B?WmRMMnA3bExsUjVFczhDbGQrMUtkSmMrWElZUTNOeUdaU3ZEbFlXNlhLZmlm?=
 =?utf-8?B?L2VMZStobk1oUG1BS3hpbzl4RzFFTkVlYlN4S1pEN0luRW1Ibk4wY0hTb1FO?=
 =?utf-8?B?NzZiZTk1NGhPdGlOZUhscm5tZWhLWE9CZlZ0c2JJcHNuWW9OUWJEWlVZRkVo?=
 =?utf-8?B?TENsMG8rNzNVWUI3VUN3RXJSL2xqR2hLT1hOUzBmMnllYWQrMzBtdTNDMjBh?=
 =?utf-8?B?WkpveU52ZE9DRlhOTDVIa2Z6dmkyZGpud3dVOGcyWVM0a2JibXpkSTRtcXIx?=
 =?utf-8?B?K3FuNktyb0s2TE5QcnI2MWhvYlpXWVhWMUQ0bmVlOHpkUDh5NVVDNHBVNmtY?=
 =?utf-8?B?V3VCRjJUWld0TFZzSVViOUYvaklKQWFrYlFSS3pyQ2J1Q3BTSW5HUE04dGps?=
 =?utf-8?B?SlJWMHhtV25aVzB0d01sVzVEbHJ0TmZsbXZ0UnVtbFFSUFVSRmpRZXZlQ204?=
 =?utf-8?B?TWhOUEFMMWdqTGtzTzlLZXFKK3B2R3RVdEZRd0FaNlowZGxhRkIrSlEvN3B6?=
 =?utf-8?B?VTRWTCt1QVFPTGpEYkVSZHRQK21lSnFKVnB1bUVVWFU3MVRFMEIrNThuNmlD?=
 =?utf-8?B?TVVreVRpSG0rZUNyeTRSc0pjQ0lweTZySExPL3lUaXI2UmlyRjVhSDBrT2wy?=
 =?utf-8?B?WDlRSTNqeWtXQnNJUTZ0TkljeUViVjJYR1MrM0pNNk5ndmU4Mnovd1pGVkNX?=
 =?utf-8?B?VXNiclU3MGtOdzcwSVNPV0JlbXRyQUNpblltZFlxSmlFcnoyb1ZkWFc3NndB?=
 =?utf-8?B?ZEFVSWdvWTFIWXY1cHNzamlabnp2dzJ6bWhxRytIMDBrNGRHMWczeUZ4Z3Bw?=
 =?utf-8?B?cDFYcEVnUTlHWmVGZldsSnZXQVYyWXVxV2FaS3U1NTlmcFRTb1grdExycFgz?=
 =?utf-8?B?MzhjcWU3WGFtSmU5OUQxeGJHckhVWFdvVzR2YVdmMWxGMm9vem1FNkVCT0Vq?=
 =?utf-8?B?YkZYQjJLOWRTWTdycWJHOGJoaGtSTDZTNjI1ajhRTzIvN0MyRGUxNXdOQm4y?=
 =?utf-8?B?Ym1lWkxUU3NKTnJ5dFI1YXV5bmp4WGhYUXZUK3drQXZFb3h5WEx1RnV5cDR2?=
 =?utf-8?B?RnBxMnJ3Zld6VDRGVFJ6NkZBbEk5a0RnMkNzR21FZ2R1dGRZVWlkN0NBaXBS?=
 =?utf-8?B?MHBkK2xhRXVQaW14RUpGN2NSVWJZa0FCL3ZFemJzT2w1bjdhMHFFQlUrY0ty?=
 =?utf-8?B?cFMzaUY3N1lCNmtNWm1NZFo4TXU5bHJKN2U3ak1SL29KYTJQVjVqOEF1WGNH?=
 =?utf-8?B?VnJ3L1A4bDdIQWdoSE9WVHB2MERMRFJPWkFQdTQ1Q3ZsVVpOWUNuY0NJSWhH?=
 =?utf-8?B?a3FDU09aL1hxREJrSTdaZ1FuUjYrcmRKNGUvRzd2OS81aWZ5L0Rpa3ZXT1hk?=
 =?utf-8?B?ME9pR09HRTdONUhSMmZSWVVWVmNmWTJqQVpiK0cxeStKcGtvbGRFTFovaUMy?=
 =?utf-8?B?SEVER2NyN1NDcDZ4dHpOaWJsRDUrcjJSa2IwRGZWNXVjTXVVaHVCQmMzQ1dq?=
 =?utf-8?B?ZnRJMVJ4UEp0SGNsUmtlZXE0RnR2MWIwOGhTMzdYbXFLNjhqNXZIUVdRU0pm?=
 =?utf-8?B?Rmc2T0gvOUZiUVRnQjhKdUp4enc0bUxsNm1Jb29CejFUWnNPZlZWZkdYZ3A5?=
 =?utf-8?B?NFJvRG5tMTVmU282dWFvazk2S0hsMHAwdktlTHJEM1ErR1F0RlBsSFhEblN5?=
 =?utf-8?Q?GMZ6Ao82DldoQiQJ4RG3u3/MX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cfb533-951a-4d13-0b0e-08dddf3c2eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 16:19:33.0132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TN7OuPp09i/kV/ZRpC2AU22zqooRM2mh9+x4GmxfFkYzigNwyzg1L6SsSR+7Nk0A5JpWcq1ANeWjnC9ieBKYrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7913
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 16:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222119

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9zcyBCdXJ0b24gPFJv
c3MuQnVydG9uQGFybS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAxOSwgMjAyNSAxNDo1
OQ0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVt
ZW5zLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gZHBrZzogc2V0IHN0YXR1cyBmb3IgQ1ZF
LTIwMjUtNjI5Nw0KPiANCj4gT24gMTUgQXVnIDIwMjUsIGF0IDE4OjA1LCBQZXRlciBNYXJrbyB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gTlZEIHRyYWNrcyB0aGlzIENWRSBhcyAi
VXAgdG8gKGV4Y2x1ZGluZykgMjAyNS0wNi0zMCINCj4gPiAod2hpY2ggaXMgZml4IGNvbW1pdCBk
YXRlLCBub3QgZHBrZyB2ZXJzaW9uKQ0KPiANCj4gSGF2ZSB5b3UgdG9sZCB0aGUgTlZEIENQRSBt
YWludGFpbmVycyBhYm91dCB0aGlzPyBJbiBteSBleHBlcmllbmNlIHRoZXnigJl2ZQ0KPiBiZWVu
IHF1aXRlIGdvb2QgYXQgdXBkYXRpbmcgQ1BFcyBsaWtlIHRoaXMuDQo+IA0KDQpObywgSSdtIG5v
dCBjb21mb3J0YWJsZSBjb21tdW5pY2F0aW5nIHdpdGggTlZELg0KDQpQZXRlcg0KDQo+IFJvc3MN
Cg==

