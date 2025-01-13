Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039F2C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 14:51:37 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.66])
 by mx.groups.io with SMTP id smtpd.web10.18520.1736779890581655838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 06:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=AnMJaQq7;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.237.66, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W22VLO+9lLJjHmzeenLzRgH/buoVvIg7PIHkDNKg3l5ROBmafentW5XmQCLSXBM/WAq1pglmiYwOCrCnGdOCkqRwYvskLrKatfoxJdMnhtJuCOQ461GHtZl+aXXc6gyc5B+3Xc5Dsu5a0z39et2MbYrn+J0iY4M6RU0PzAmOF0EBdC36mQjTmKKB+1YEvl/qW5XK4+0MTjY1jk705EhprH1miu9b3eS/kJE2fjAdJKI3ADHKuRfzV6I4aXF8ZHu2D0hd/v542V3zUXM6mgrhzFyya/Uw3EP0AVCPVATsukBW0//fTXvbM6fabaPPiJU8W8hEolMgceGUsraPflDUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIwgSPXkG+gMHv/c35BwZTUvjWi592NcNnPwlp3DB7w=;
 b=ostm6xBPWOAx+81HYH54PdT5xpg7vgyKobCflDM38n7zFE1vjIo0o5kbBk8W4qG3BpOs+XKIvxh/lBiAChxfXr11Ex5+A/SKVeSazxPHcg7HEiJA2sSJCW9uXpXbShuDgxVHJsCiSDgc2O1ASR2XOo5cbjUkuoHDoeg1sK4le1ldmao5degsCq/jTsjDuz+JvpalzlEtm35a1QAHJLsVgVAccUGp/B2Rjbb2vfKQ/pJc5oDMJq5mNzydQQ1EnSN0h96DdDR0fDPuNy2KmZ/gOn/mvGdSa+mdtX7NJHywEUOocAS/8y/WeMhT80pUuqtYieUhtd+Fh1vFJ3Q+5uHZ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIwgSPXkG+gMHv/c35BwZTUvjWi592NcNnPwlp3DB7w=;
 b=AnMJaQq7HLE9FqV8G0iyNyR1LiGObr+joV8xjNCvhHeCRjsP7ABGH53fiuo/WHSGLatRQmhiuIUThUJzSSgNcYFmwDa+d7EZ8CKZyNzYhQlbvhz/KB2068Axq2Y82DCZWJlKo19CLM6r8PN5SVPt1nECCOGSF9ctXn1DOufz5C48fzTm6mZsId4ocb3SMn5rJKF1M2SopPvqH+iDJ2tJWSLq1pAsJTpnIU5WMxKnQpejqnBa7vxDAFM7MGaplo87Yvw2GKiFHkDtvOXdXJLxjx85sNlpAf+Yt17e0HpYjzejYW/Y+ZCKg7rWQRbvOzXEozKeGhkH1pIZGNlQXTUJbQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 14:51:27 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 14:51:27 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 0/7] De-globalization of 'devtool'
Thread-Topic: [OE-core] [PATCH 0/7] De-globalization of 'devtool'
Thread-Index: AQHbZQH0lcHjf4D/M0eT09baGA7tVrMUk0cAgAA3zyA=
Date: Mon, 13 Jan 2025 14:51:27 +0000
Message-ID: 
 <DM8PR12MB5430187E51552AC3424F68348B1F2@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20250112145359.607585-1-chris.laplante@agilent.com>
 <CANNYZj8U7b=ivPzXDvrpqpQLLt2kVZLKYDhDA6gExo_Q5hNsXg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8U7b=ivPzXDvrpqpQLLt2kVZLKYDhDA6gExo_Q5hNsXg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=0f83540f-bbac-43be-9531-aee7bfbaad6f;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2025-01-13T14:50:56Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|LV2PR12MB5944:EE_
x-ms-office365-filtering-correlation-id: 8a7366b1-439b-4949-a3b6-08dd33e1c26c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dEZnV0JwU3d0dHgrUjVGYTRDMFRtSXdZaDlsTFA4NDVYbW9rK3RLQlQzUVpt?=
 =?utf-8?B?QkJtSG1OVGpRc3RvRHJxREg5ZUUzTkhGdjBoVGpYdkJsMHA3VGJYc1k0MkpW?=
 =?utf-8?B?ZXkxZmZ5Rk5JQ2k4V3B1VEF1cjNXZWdKdklia2twdjA3V3VtaVMyZ3h1L0Vr?=
 =?utf-8?B?S1gzSElMcUcvZjRLZWtCL3ErNFlHNkE2aXVkUG9xakNQNzJpR2tKNGNITHNo?=
 =?utf-8?B?dGUrb3lGNDFxTjBCamN3cjU2a0RMVTAxYkVYb2RBSVdHQmIvcHRzRDdSRTJz?=
 =?utf-8?B?UmJmRW9vSU9JSjl3enBvSGppeEZlN0pWNlYrMitQTktzcUZRSDcycjd3aEhj?=
 =?utf-8?B?UnE5eEUrclNTZ3RveG42Q01XcktkVlpXZUI2Z1RwTlAvWUNlR1VXR2hzUWtk?=
 =?utf-8?B?LzN6ZjJUWXZGSURDTkVoRzd4VllwSDZCT2NMMnR1emtSNkV4bDhvTGdTVTFD?=
 =?utf-8?B?NW13bHRmMFFOd0VOaWFSV3llRnZLUmNrSzBrWnpQQkd1VUs5NnUrRUNlQXNQ?=
 =?utf-8?B?blpVQlBVdDV1UkgrY3ZCRFlzR1ZTVUN4UXUyRmlnMjh4MnMvUjVpUXcvQUd5?=
 =?utf-8?B?Mi8wZCtuOWtGaGg2NTBKbWxtVzBlRHNjaGZDSnhNVmNDd2g4T2N4T05VUTMy?=
 =?utf-8?B?S0R5OUtCTmljNGMxY2JrMkxCZ1pzY2tmTFlxOVErMkpTaEZwZWUyaWQvZTNo?=
 =?utf-8?B?N2dJL2t3dnphN0ZXa3dHYXVtbFl3MzdFSlRlS2tjTlkyT1BhTm9uN2N3ckhq?=
 =?utf-8?B?MVZud0c1dnNseHVCaHgreEZMOTQrZG1EN2V5MGw1Qmo5S2FCdUd3c2k2bTBM?=
 =?utf-8?B?bEp4VEVxdnl6ZENqVTZGUTRFLzlwSC94U0QrK01GS0dEQmRJclg0U1lGaHA2?=
 =?utf-8?B?czFCcllpSVl4UnhwTlBjaXdkWSt1aVp3cTRtR3RTWkh5cFdWdFErWlZVVVJp?=
 =?utf-8?B?c0dWQmtEU045OUpCMllrNzRFQVhkVGhhVWF6Y04yallpZXQvSDNtV2NhUmVz?=
 =?utf-8?B?eEtnVWF2cTRobkZRN2NTSG9XdXI2VlVYYitQZTRVamdwZFF1anpGRlRySURo?=
 =?utf-8?B?cjlpbWtUVlNZMFFDNnE0aUt6RkN5MEtHS0ROcmxVc2tlTWxldGYySWxhckxj?=
 =?utf-8?B?L2h0dXZndzhnL1FqcFZVK01WQUQxbFd5aGxKMWdpUFUvbVY5SVBvZlVSK3N6?=
 =?utf-8?B?c0dwYndSMklJSmFTaHBtNWZFdFFxVFpocE1ZWUJLekI2YmZhbHRjelhqMFdL?=
 =?utf-8?B?bU5kZ3owRnhhZHljdE1RdUhVYm1WSG9aOWFLQ1Bwa1Z3UWMweHdMTkhTdGxJ?=
 =?utf-8?B?UzNSQkdGK2FpKzZsbW1rTndzakdtYjF6V3VQMWJxaCtYdGl6MUVlTVdZU2xQ?=
 =?utf-8?B?d1hSTFRocXUvVHBMWTZOY2tmRFdUOXJSQkU4a3FKczI2ejRhSU53VzNkei9X?=
 =?utf-8?B?YnhQV3ZGWkR2cFlFMkJCWWdVaEs3SjJCbm5HUlpjV2ZDMXFWcmd0OUR6RDFO?=
 =?utf-8?B?YkdPOFhLWG90QWRLbklteTRNOVY1ZWdVQlNIS0J5c05XQWs4TTdOeEJZcURU?=
 =?utf-8?B?TlVFTnFVT3hCN3R4UGx3WWFlN3RNdjRnQ2syQnJQZXo0OG1taGlKTnZXYW91?=
 =?utf-8?B?ejRMZnpoT2tLTUVlYjI3R1RXLytwUEtVN0txaXRPMWZSNjNuVThhbytiNmZj?=
 =?utf-8?B?cldyMElHTmJ1cUtpalpaNnoxd2xGNHJZaGdhN1Bzd1l4akFlNDVrVkRaRTZL?=
 =?utf-8?B?UEN1YWFuTk13clBBNXdLakRFaG04Ym5kNlNwcHhxV0lRMFQwSk9FZVBJTmo2?=
 =?utf-8?B?NElMd1R0ZHI0OU5KRklOZ0I3cER6Q25hV0RTT0pPalFjczBkR2p2RmZVaFht?=
 =?utf-8?B?cCtXSnM0RHQvVXFkNzlMZm9LUlV3clorOWdISVQ0Vks0c0xENlV5T2xSRUxV?=
 =?utf-8?Q?hLicr2Pas2V3W67VLfqeJfOaB3ngFrCi?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MkV5Q2VGMXdJQW9SMk0vVmxJWnRpVE5McVlkQ2doR3c5TElXd0EvdUZxVkVG?=
 =?utf-8?B?aXlxU2s5dENmUGFyWXVGbWhzYTl4c3ppZ09LWkVWa3UzQ2Z2Ty9ua1N2aDBz?=
 =?utf-8?B?ZldtUkxwNjZKTUN1RVFqOGdOOXBTR09icnJQZVJXT1llbmhxZmVhU045eUI5?=
 =?utf-8?B?dVZBZmxDK3hDYjFtWCtvV1l5RWw1MTEvZkp0QXhFeDN5UHhVb2MxR0VUTENH?=
 =?utf-8?B?dUhnZi9KaGgwb3hNSjA1NHBjL21XcDFUaWhRY091VzRKMlU1dm82c0xLbWM5?=
 =?utf-8?B?dEh5a1h1MDAwei9YK0lJMS9nc1dSaHFnZnlvQ0JLSVRqcWZKYjhhQ01tQlVw?=
 =?utf-8?B?NUR4bVdjU1hhZGVuaWJocjV4Qi91RldvUnROTnR5eG9tY0xvejJPZWRiYVlR?=
 =?utf-8?B?TWt2Uk9ub3ZlTHBlcnhKd081WHR4c041K3d5b2NlajJoYXlUQ2lhemM4SEtm?=
 =?utf-8?B?YUNmdVhzeVRadGtSTXlGWEFIazhEU0tBemFJbEdYbElFcjRXUGNRZzFzTDVj?=
 =?utf-8?B?aTV6REwvb2pRbUJsT0FsTkl2U2ZJeGw1Y1hOWVZiZWlqM1VQV3lVTEhLbTJX?=
 =?utf-8?B?aVY4SFhoU1h5cCt0OW14c3RicVhKTkhDcnpNR0NDN2ptU3ZmZ3NaaEtmQ2tn?=
 =?utf-8?B?Q1FPcW1SV2Qvc3FqeHpvb1BqNmpHYjZTMGd5RGhaamZUbGNOSWgvL3dnUjk3?=
 =?utf-8?B?TzN3MjMzUEZVZTFSSDd2TWlId3ZnVjgxd01VUy9KbldTTmNZMk4veThEQWc5?=
 =?utf-8?B?b1phNng1bStHYWplTW9qTXYxTmlFaVhZcnc2QUxwN3BiSzlGL2hVcm9PQytG?=
 =?utf-8?B?WjZCcXBaUFBkZUZPU2pTMmxGd09VM1VPcVk3UUxWTnByL2tIcjVZdkVSRGVn?=
 =?utf-8?B?RnRxUGpoNHQ3amFhOHZ6Z1pVRUd3Z0VkWC9CSlZxMFBsTGRZUndGUm4zem56?=
 =?utf-8?B?ZlhPYW9FRWRmMjcwOVlITjJkdnR5czJjWi8zdUhiUks2dHptNWE1aDBQUVg1?=
 =?utf-8?B?VCtoVUIvQ0gzdk85RVN0RVZYOVN3U09UUUtIYW9pSHl1OHVkTmdTc3o2Zk9R?=
 =?utf-8?B?UnhZVXJDTGk4cHdma0E5WkFpY1FGVXFCYi9jd0RORG9MNTlyZFNBSkhacDRy?=
 =?utf-8?B?clFGQ1h5MUs0L2dqSmtuWGZLTjZzRm9sMnA5TW1RT1d5R0FaMjYxV0xGczFD?=
 =?utf-8?B?T3BpTEpUT2xaQXBXUFJmc3pPSUNUT0xINE9iZjN4c0QrS3h1V1VqNzd2RGNZ?=
 =?utf-8?B?Qm1DS0F1MU01U0FXRWRqL0V0QVNJNnNvMm1ObGVGaVdjT2hZdTZCbWhOc0ZM?=
 =?utf-8?B?bU9uaXc4cXVGdmVlbDQ0QmpVYXUxTm1pYkhFMzRxTXN1TWRaUDR2L0JDSGVL?=
 =?utf-8?B?V0RmODZ5dG43R2tyRjNvYzlSQTYwWVdkUVhZSFkwczBCUlRzRjQxN3BiZklk?=
 =?utf-8?B?YXJGckk5dEo0VmtkUGpCNzM5QW93bVNJKzlDc2RRUVMrbUNEbjMrYStNSGxK?=
 =?utf-8?B?SmdsRUlGcGhwU2lONmJxRUUzZEYvV3EyM0VGd1dSV2RMUlYxWVpnQjczT3Vl?=
 =?utf-8?B?V2xja2NKVFp0WkZROVlQNnJ1SXpuUnFWTTMrbG5pM2prSEx4SlpoWUdLMnNF?=
 =?utf-8?B?UDU0L1JHMnN0b1lvamNzQkpwSnI3VkVjbjc2Z1JObzQrdTh3dnhjK2RETzF1?=
 =?utf-8?B?djRxNTByMlVuSHhGK2Nlelgrd3hrTXZOYm5sNy8zUFgvazJ2YVhFdk1KR1I2?=
 =?utf-8?B?M0FqYytyYXdxMk5DQVpSREl2NmIzZlZicUI3WWdWYlpRQ1pIaWJwVTJDQ290?=
 =?utf-8?B?Wk04SG5GYzl5S0VCbXNZZCsvT1hoY0FqRXBZRHZXMW1uYUREN2lKWjBETzVk?=
 =?utf-8?B?L2tNSDdtOCtRTlA4eG9ieVh0SVgybVZVMDRiVHdxT1NidW16K2hBSjFaZjhp?=
 =?utf-8?B?em5DZktHQWNHM05KTkhhb296dGZDb2swRjR1MU9naXBwVFd6RFk5SkltTUd3?=
 =?utf-8?B?eW5FTVlWZFJmaHZlMXBYYUNkdUtXUUVybkM1RDRYSS81dEVxekRtWlovYWZv?=
 =?utf-8?B?NHh6dUZUZENjRmZjczJPc2FVT042NlJGTkEvUFN4cWxzbFFNUlBqNzVyd05K?=
 =?utf-8?Q?2gg6CMj55ioG9FPWB711Ec5Az?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7366b1-439b-4949-a3b6-08dd33e1c26c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 14:51:27.8690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25iH3xa2MwqoC4eYfUYQiENsY1RTrKnoZzinmVIvVNyoeR7dAwfWrCcs/DntUO6tzt4GqDe2ya3UWYwXhYVo721WUTRNNS8TnjgzugRiRJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209733

PiANCj4gT24gU3VuLCAxMiBKYW4gMjAyNSBhdCAxNTo1NSwgQ2hyaXMgTGFwbGFudGUgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGNocmlzLmxhcGxhbnRlPWFnaWxlbnQuY29tQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2hzZXQgcmVtb3ZlcyBnbG9i
YWwgdmFyaWFibGVzIGZyb20gdGhlICdkZXZ0b29sJyBzY3JpcHQuIEl0DQo+ID4gYWxzbyBjaGFu
Z2VzIGBDb250ZXh0YCB0byBiZSBhIGRhdGFjbGFzcy4NCj4gDQo+IFRoYW5rcywgdGhlc2UgY2hh
bmdlcyBsb29rIHJlYWxseSBuaWNlLg0KDQoNCk15IHBsZWFzdXJlIDopDQoNClRoYW5rcywNCkNo
cmlzDQo=

