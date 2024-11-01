Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB436E674AD
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 07:37:23 +0000 (UTC)
Received: from HK3PR03CU002.outbound.protection.outlook.com (HK3PR03CU002.outbound.protection.outlook.com [52.101.129.131])
 by mx.groups.io with SMTP id smtpd.web10.32304.1730446636490136857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 00:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=DPF8HN01;
 spf=pass (domain: aspeedtech.com, ip: 52.101.129.131, mailfrom: vince_chang@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgxRTE05+azgKsi6+j7i8vx8NlztQIVLRLcP1+9CV7Jph3K5Nu5ypSgrJP7NBtnixFaXF/D4jUuxmd4C3w5Z6KaGyXKnX74eSmS3I8sEgUNhAMAppOYfgOrZi0NcGJKcGAbuxv4GHZ9qC6HgC3GEwqGgwx++ySOoxWQzeWrdXW9/PXMDtgyPLkd5xA22GF0Sv2azK3Xo7DSQab7s+ou5oO7P2XwOv9PhvJZF7vl4wtNvzipu0i9XixxP952cDrc+VhpKOE6gFQPrth2Vl8mdfOdaADiB0V3H0O0zuUXZLp8NPtszlMKjGiOwWOjbFKiZDgMurAthUuTiRjZdu/rzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag85U0FuMY0M0+CUqi704Flac2IH9RdtMQbz6Fu+fzc=;
 b=D3bntbA/TRD9x2OpP9rLl4hYQuboLjv8JCH2eFYeU4MTa13EtWq3ckI+zEtHyGKgMjCJmFDmVhOBupLdYRB8cMIX7Vf28LmlACeY/WccMU3oFnMTlH4u6XhwFtOpi1cXoNoEYAj8mOrPU5LC4E7dL/oHKAQFcuXJ94RCx4Hbghv/vYwoXKxPe3lXZzBEif24CmAV5hD35FYBYkMoDZfmgW8b/KkgdkmPrw5DKwvmMS8D8VrFwBakYHnOHMTjSROBNCQPivjb41bV0vJdX0o9XZvXoPUNKSTXcVziHeBzlu+picqIcUFuZaBGzSHDYlIiqFlQ5PUK3UdxMN7e6fT0Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag85U0FuMY0M0+CUqi704Flac2IH9RdtMQbz6Fu+fzc=;
 b=DPF8HN01Sz7PDa2c7u+Z2ZQ2w+vg1ruVUab8FwBs+osS2+AP3Qia9MaVbyo9zGJJ8bPDlqUWjtYU5MePCOxXUC5HTC21DE+OBl2KqLNaEXT2KjTAmKDA/GVR0ZDpX59keQ9K+6PQE48THUAxv3AXBKqxvkV8HqjTCIPcr6ZpcDqYAYrvMguGelRHgS6pv5oCHQFNvPml73m9AnhyHaAAZtiwLuXpNc8GiBxHW1JLCI0DbMmLXuRil14pE8UnnoM+uRFrWVCH/n+v5dtB0seZGozpoVgnA4mkxkIABKHWNQnAATLIbBOP/3/UB5nyrA0mA/wQzfamdlKgOLd+FbM+cA==
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com (2603:1096:400:271::10)
 by TYZPR06MB6728.apcprd06.prod.outlook.com (2603:1096:400:44c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.10; Fri, 1 Nov
 2024 07:37:06 +0000
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b]) by TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b%4]) with mapi id 15.20.8114.011; Fri, 1 Nov 2024
 07:37:05 +0000
From: Vince Chang <vince_chang@aspeedtech.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Jamin Lin
	<jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>, Khem Raj
	<raj.khem@gmail.com>
Subject: RE: [OE-core] [PATCH v2 0/2] wic support different sector size
Thread-Topic: [OE-core] [PATCH v2 0/2] wic support different sector size
Thread-Index: 
 AQHbKsvcoIRhmSl0kE+pCMCxVX5HWLKgHE0sgAAMCgCAAG2SAIABBg1ggAAWNFCAACYwAIAALzAg
Date: Fri, 1 Nov 2024 07:37:04 +0000
Message-ID: 
 <TY0PR06MB570773E5E2D81502B5B30AAAE2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
 <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com>
 <TY0PR06MB5707BE94581CC7F425214A2EE2552@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <CAMKF1srdKcP7HMPkQF+iCqOkCfpGv6oB0M8R7=qbO3C216xgmw@mail.gmail.com>
 <CANNYZj8v9LUJFDXqBms6Yg7F0t=xQZAcCg417x00zJxqeYqtog@mail.gmail.com>
 <TY0PR06MB570732A6C54A787FB10C50B6E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <TY0PR06MB57070328EF6E490CA8B8C0A8E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <CANNYZj99sKhO24ehF4ks8cWCJa_kg92vGVML8PqtiQFTwnNEaw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj99sKhO24ehF4ks8cWCJa_kg92vGVML8PqtiQFTwnNEaw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5707:EE_|TYZPR06MB6728:EE_
x-ms-office365-filtering-correlation-id: f020a524-5e4d-4695-f110-08dcfa47fb5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?b3lmTHNmYXozcUdmTnRhUU5VY1FiU3ZEWXFYb1JwYXZMNHBFZ25XTmU2TXha?=
 =?utf-8?B?bFRpQUtEOGcvTVF6dW5SYnRGNG1vQ2pLR3pqaXIwbXpVUEpGOVNqR0o1blVD?=
 =?utf-8?B?SmlrNVV3cFNDSXhVM2g4R2dlZ0NlSEtneHdyTzdmQjZFYTNuQ3JLVGc4S3BQ?=
 =?utf-8?B?bzlOa1BmbG1udnlpL3NxMmxGeFRFamFMTGkxdXV2ZTVlRkxlaVh4c3lVZ2d5?=
 =?utf-8?B?b3hRd3YyNFJiVVhpemY3dkRvVXV3bzdhZU1XUmdvUytkYlZyNGplUWVGcmZ0?=
 =?utf-8?B?ODdUQnRaMFR6NVJXRDZGUkN6TTlBc1dYOWZkaEd0dk5YZHc0UFl2VUlJT3RJ?=
 =?utf-8?B?SFFmQ0RPVytiMFphb3JPWXNlRHlpQVZWdkdzMUFQcW9IL01QMjdjUEFDVGFu?=
 =?utf-8?B?dC9ySkRyejRRUXRVb2tqZkFDTCtjRFZBQ3FlRkZLdUNpYVlWb3hsNXBqZ0ph?=
 =?utf-8?B?SVIzTDBZU2VFMDRTMVJXRlpEaXM0UTVPS2FtWWRqRU9DcnpDN1IrZk5DMVhq?=
 =?utf-8?B?Qis5MWpYaDBndzZRdHZsZ2gzTUFNRERtSnpRVzlyb1lnOXVWaEc0ajQvK2pR?=
 =?utf-8?B?MTdtWFh5NS8yeXdmaGx2N20yR1RIcFVTQ1RJYkN3SHA3M2RhVklaaUtjekg1?=
 =?utf-8?B?eUdBUWtaOWliVGdyZmdUUmZmYlhFR3o0RndzRkp0emtZSkIxdkJlQ2dqQ2xq?=
 =?utf-8?B?blZjZjJ6dUVYTDZJREROVmxPMVl1NmVUTWtibk5ycVNYOWlENGk0WDN5R2tV?=
 =?utf-8?B?alRsR2lVa0ZQTnhUbyt1MmNQTE1uVjJhRFh0aU9xOWZjb3pSbVNaNFpYUWRk?=
 =?utf-8?B?c28yQ2RKSUNQM1cxVzhSeW1UdHNDY0hDcjVuekNOTXAwWStyM1g5aFk3NDdE?=
 =?utf-8?B?OEVqbHh6SHB4Tit2UUVJYm1rdHMzc0NzTTFVVlN2amNrZmZ4YkhJNlIxcUVl?=
 =?utf-8?B?VEl6UnZTL1VEVWlsYWNMbFVjZUl3QUVHdDRYSnFCM0Nra0p0WXRPaEdIbDAz?=
 =?utf-8?B?MGtXN3hudWhKVWJRK3NoaWE5Rm9pcCtIZjJUanlDWEVnME1yaEFWWUFvZStO?=
 =?utf-8?B?Tk16VVo2dzdlUElZdmFXeEZiM3JBVXQvSDFUMEZvOGRWcTZjbEJxdU84QjlI?=
 =?utf-8?B?L0FKaS92ZTBFNGxoNE4vSE0rUTBrNW0xR1pGcFRPUzJwQVVIc2E3TmVteCta?=
 =?utf-8?B?aWxXRUZsNkxpTGVQcFAzbDVnVFVSQlI2amlQWjMvYjNrbFBMcW85UmwvdFJO?=
 =?utf-8?B?bCttRUF1YkpaNHhmcUdlb1VIeW9aMStNMVkwc1RiU2NMUU00K0o3OXJPclE1?=
 =?utf-8?B?ZzJtZG9VOGtHVlg5NXdSTXVqNkF5dGlwa0JRTDRsQVRGSlgySU5MbSs4WmNB?=
 =?utf-8?B?THJoaUVuaHhsTC9VQ011MXNyNW5PQVNaRXpmRDNvZWt5Wk1zcWZLUDlubUp3?=
 =?utf-8?B?aFNkaldsdHgrZFczd0t3QU1UVjc4U3dSOGRncm9iV1J4RU9BdGhhUGdkMDFV?=
 =?utf-8?B?V2dDK0dzU2VaR2pHSjd2Vk9ZOXpkdm4zVUU5TzBQQmhqQ3E1enBOWXZnLzMx?=
 =?utf-8?B?OWpFTWZQTHBiaG1YSlN4OXduazZQbGdSdys3YkRWVkhsc0Z4T1ZOUndUSCtP?=
 =?utf-8?B?OXJTNFIxeWVrZzF0UGdvWmFQY01BZnk3V2c0eWxjTFhOYXFFWXQxd2l5bnls?=
 =?utf-8?B?VStwZmkxemZOR3drUXhpNjV6YVJyU0N6ZmNkMHpyTEpNaUhOKzBtbm5mRjd2?=
 =?utf-8?B?S0RNQnhzWE1pMWprc2FheG0rekN3QUlLMGRha3ZXNFJLRnFpeVgxUHpScW13?=
 =?utf-8?B?aXYwS1RLMFJKV2VtazBIRU5aMnRodUxrRnlNRGxUY2hlVjlEb0VLaW5GYThX?=
 =?utf-8?Q?JwTim2DWuoTVm?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5707.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ak8xWEhSd091WndDNU14TmU0bnhHMzcvbi9nRXNaUmswc0RrMTdNcy9sVGdT?=
 =?utf-8?B?MmRvcDhpazdQMWp3SXpkU3pRS0x2TlBDdktaZzVnY0thbTlLcEJxMTZtVVM3?=
 =?utf-8?B?WlE2NlZBd0lpR1lza2E4ZDlVaGVub1oydW5WRmZSRmhlV2xYakNoNFlINTBv?=
 =?utf-8?B?Nm5La3RmdmRzZHljSEhGSm0wb2gybWRNMnFKQ211MnVSOW1FVTRnVUZEd3NF?=
 =?utf-8?B?dEdzdENSMUVYdi9BN3d0UGxwaFRJanIzNGI2Sk9rM2RMWWpSYm4wbkVseXZ1?=
 =?utf-8?B?YVl4eXVwMTVhWnJkTEY2bHRZZWxFQWxvRE5QT0Y3clBMQ3RsU1FRM0IxdFJS?=
 =?utf-8?B?dmZpdEVoeDdlLzJRRXIveGNFeWgvNnk2dUhhUThhRzhXSmtPNi9VUE5tMSs3?=
 =?utf-8?B?WUtHZ0plT0lNSlU2WmpWcHZmbkd0Z3RJRE42TTFvcklNZ3VYaWhHTDVYb0Rp?=
 =?utf-8?B?N2ZBMk4zcEM0dy9QaDlCK0xMWXZiYUFrcUxGWmV4UTZxRzNPNUwySkZ6YURp?=
 =?utf-8?B?MDJ3c09IUlNEQVlYN1dtdDVaMkxHM0NBeEJPc21zTEc4YzdlSUMvaWp4L3hs?=
 =?utf-8?B?NVpUeElYSkpUNlJWc284UUxUNENUWE5LK1JZZDRGMTJmZ2hndlhPcFlsRHpq?=
 =?utf-8?B?SXFDVFd3VGZDOWNJNnNjajU5N3dIYnZGOGlzRjEzc0lmL1lMaFdwMHduNFNI?=
 =?utf-8?B?UXluT1ZQMEl4OGxnZVZLVTRGSzI5emc4dzRGQ2Q1YU1QeGdNamNYZjVvZTZD?=
 =?utf-8?B?RXkvWWhYdFVJSUhRSDhMcmxUMVBJWU1Qd2xsTzMrb1FrajA5Tjd4SFJ6Uk9i?=
 =?utf-8?B?RitvSWVWNzcxZ2RnR3JITFNRT2xwNkJ6VzRRdTJvbkZDRXhDeFQvalk1RDhh?=
 =?utf-8?B?djM5UFJMWTFNNDJHRHRYK3lrbGQySzJpOEpOS0hsUitZR1o4RHFtYnlEVitL?=
 =?utf-8?B?WTdhS1ExbzFNMDB5WllZTVAwU0EvSXJmY2hMUHdhWWV6TFREaFNOU1Z6WjNj?=
 =?utf-8?B?Y1V2bkdKTzkxZjZJOG5yaklXRnR1TzNXVGhlcFFhUUlKVjA0N052d3RsbjFV?=
 =?utf-8?B?T1U3N2R6aGF6UFAxVWlHcjgvbUY5dDFYRzl0M2R3Y0xiOHlFbXpNa2VPb3M0?=
 =?utf-8?B?RXQ5WGd5TVVpOFR2eW5kWkQydVFzYlV4MHpSeVFkcUY0YWxRR3VVWGJNQ09G?=
 =?utf-8?B?dFg4TmV4QnBMNGZ5SWtwUnFNeE1TZWlaOUxqcGZGTTM5WGdpaVZZSHF3eStS?=
 =?utf-8?B?RWsySG9vNFVNVFJ3eUlMQ0dyTjJXRnRESGZsTWNQWGNxOVhieVNlMWVmQUMw?=
 =?utf-8?B?b1JyUG5ud2VvL0N1MVJvYjRmcHEwQk5XKzlnQ0lwNXhvbHhmcklVbmY2djdX?=
 =?utf-8?B?SnNmMDlTbjNvV1l3cm92OVExZGJaamkrQzBJSXV2ZTNpNUoxdXNSQ1kvOUpX?=
 =?utf-8?B?RmMzWjZYWmJGQTNBZ1Yza0FGTFptdGZQcngzZjhPbllEMytUMGJra2wxV1J4?=
 =?utf-8?B?MXhvcURFSThUMUp1b2svZ1ZGWVJWQkV1cTJ1RXc1am9LYmw5ZnNNOVFVVzVW?=
 =?utf-8?B?Y1J3d3BCWjhuZVRwQ0Q1UlpydGxPa0psM3B1MUpycXJWVDhDNm5YVFdpbHdO?=
 =?utf-8?B?TDViRTJFRTlBQnU2cWlLb2N5VXpPcC9hVm1waldnQ2w4Z1BRYmg2VjhJS3Bt?=
 =?utf-8?B?WFM4UHdHbXpMUmlGN0dMRnpDczJLam1rYzFVL25kc2ZoUDRlVUh1d0Vmb0FK?=
 =?utf-8?B?Qzkzc1h0MXN0eWNDZCtHbFhNOGtqUHBtYkEycS9QRVcyVE5GMWZYQTcwUTk4?=
 =?utf-8?B?S2o4Tlc2U2tSWWNxYVUvbTBtQjVHZXRmSko4aFBjS2JxeFYvYzNNbmhmK0Vp?=
 =?utf-8?B?MmdQbDlnUzRRWE5JWmpJclg3eFByZ3V4b29JeVUyQTBSWm1mekI2WnFONkdl?=
 =?utf-8?B?MmxPdnh6Y3JYWERid3I3S0Rid1pmeWx6RjEwMnJtYWZ2NXlwUnY1YkgvYU9G?=
 =?utf-8?B?UTZ5YWQ3L2VFak1uZEJpc2FWUW4reEZJdnI2NXdYNVVDdU5SckFyOHp6VG9h?=
 =?utf-8?B?RmNuWW9jL1kvL2U5WHJFcEVaMWJlT2hHWkFKcnhBc2dTc1RPdUVmcWxUWW43?=
 =?utf-8?B?OEIxUldQcFRhb20xck9UaXBNbnFGc1ZqVHVTRWFIVWo4ZzRkWVpKSmR2SnYw?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5707.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f020a524-5e4d-4695-f110-08dcfa47fb5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 07:37:04.6071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I2aC5j/n0AF03BArkUgwwW303V4FQCMWI5U8aztn5MjuY4g9twF4kTOWodo2Z630P/n2iqs0RmwZKoFckSfCdX3gaSY3Yn4cC5nvXUqKdE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6728
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 07:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206603

SGkgQWxleCwNCg0KT24gRnJpLCAxIE5vdiAyMDI0IGF0IDEyOjMyIFBNLCBBbGV4YW5kZXIgS2Fu
YXZpbiB3cm90ZToNCj4gQW55d2F5LCBpbXBsZW1lbnRhdGlvbiBydW5DbWQoKSBpbmRlZWQgZGVm
YXVsdHMgdG8gc3RkZXJyIGJlaW5nDQo+IHJlZGlyZWN0ZWQgYW5kIGFwcGVuZGVkIHRvIHN0ZG91
dCwgc28gdGhlIHN0YW5kYXJkIHN0cmVhbSBhbmQgdGhlDQo+IGVycm9yIHN0cmVhbSBhcmUgbWFz
aGVkIHRvZ2V0aGVyLg0KPiANCj4gVG8gYXZvaWQgdGhhdCwgeW91IHNob3VsZCBhbHNvIHNldCBz
dGRlcnI9c3VicHJvY2Vzcy5QSVBFIHdoZW4gY2FsbGluZw0KPiBydW5DbWQoKS4gQ2hlY2sgbWV0
YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9ydW5jbWQucHkgZm9yIGV4YW1wbGVzOg0KPiANCj4g
ICAgIGRlZiB0ZXN0X291dHB1dChzZWxmKToNCj4gICAgICAgICByZXN1bHQgPSBydW5DbWQoImVj
aG8gc3Rkb3V0OyBlY2hvIHN0ZGVyciA+JjIiLCBzaGVsbD1UcnVlLA0KPiBzeW5jPUZhbHNlKQ0K
PiAgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwoInN0ZG91dFxuc3RkZXJyIiwgcmVzdWx0Lm91dHB1
dCkNCj4gICAgICAgICBzZWxmLmFzc2VydEVxdWFsKCIiLCByZXN1bHQuZXJyb3IpDQo+IA0KPiAg
ICAgZGVmIHRlc3Rfb3V0cHV0X3NwbGl0KHNlbGYpOg0KPiAgICAgICAgIHJlc3VsdCA9IHJ1bkNt
ZCgiZWNobyBzdGRvdXQ7IGVjaG8gc3RkZXJyID4mMiIsIHNoZWxsPVRydWUsDQo+IHN0ZGVycj1z
dWJwcm9jZXNzLlBJUEUsIHN5bmM9RmFsc2UpDQo+ICAgICAgICAgc2VsZi5hc3NlcnRFcXVhbCgi
c3Rkb3V0IiwgcmVzdWx0Lm91dHB1dCkNCj4gICAgICAgICBzZWxmLmFzc2VydEVxdWFsKCJzdGRl
cnIiLCByZXN1bHQuZXJyb3IpDQoNCkkgZGlkbid0IHJlYWxpemUgdGhhdCBzdGRlcnI9c3VicHJv
Y2Vzcy5QSVBFIGNvdWxkIGJlIHVzZWQuIEkndmUgc3VibWl0dGVkIGEgc2VwYXJhdGUgY29tbWl0
Lg0KaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVz
c2FnZS8yMDY2MDINCg0KVGhhbmtzLA0KVmluY2UNCg==

