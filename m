Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71557105D993
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 01:51:49 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.97054.1775613100200221226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 18:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=svYdJhbP;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.35, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqE5e2cJ00DH5bBm5r9U2VTQxls0BezvxZ8q6IlC/SaE7kh/1Xokhq+jhAf0lCWVKZ0iw3PdjclUlgM3AVKlLcuSM8E14t12htbsPw+lEaEn3L+JwVF4Jnm+mdYdd4hydBLYvEMszImFa2TBGtrFFrQ7s3ZF7C1bRKYxoCIso0EOm/9q+9Sn2LhyfKwxZvsEdYstqxuMjKX/qtEhs7RNU/EsUF/VGH4ggVYxdQqVMiu+cwHDE2Y2+k/BwZJrfdpvIEffy7Fc5AkmWycwa1ZG5NRGmFYfmdcPAjq+ZU4CPVU7E0GV55eXB3ZFhBYPS3enouFbzzgCM26T8mQSnpdQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8T1WJ3aIGylFwu1oJbBttdGNePq0D7ZHyTfpkX7kVo=;
 b=kJZTe/KvAB68kHjUzJET8Niv3ojrjiZB1m6Jq286yRK4/ur6/ASJCLbH1df0KKY/Zim1CBDDhOV5QVcc/8QXLJNzetbfSHDL5YQkDv9BaOrCGOrfmDFFLN3wRLKBBnTtett639gOUg0xyXMJZgr5Vpn14/bh5IJqHr/71+UJmwatfJojTrdXlmYC+26j0/G3Kh2NcwxDGx95J6R2xjsdeYy/wcl5yTpH805F+mJ7fo0tznLba7dqJErWUmmR38LC3eBZsjjIvbRWR1rkMVAWdoKi6K3WJVRK895CjuWG9kPGlzgg8cKZ06AejUop3M3IHaHnaO5fDKN7usCuXKY91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8T1WJ3aIGylFwu1oJbBttdGNePq0D7ZHyTfpkX7kVo=;
 b=svYdJhbPaC1DmsjVSM2VaC3VYWJeNI2HJOSV5zC/d33CFOzmmz0gy2jFwt58P3MZnaQLgdhIYNz4z8ZQs2Jz3YqYJAh/LtRf8N+r6ve6GAqEXoQG+cLm4/cNdHPeOP/LEB08M6945OFTlITuoj/2QSqgsDNndh09kHJ8Ym6oZVjdcAmLd5+laVRTjfMiAolL1HT6R4n9E8XFJVscM6pjZBY5+KsROzNEEIFbksYqJCpWKWuPZ8joxudzjhd5rMM59t0JR75DWzl0BGjsyy5y+FfgRmbakBkg5KaT3XkVpXxzosgV+s19yGGkHob0aTs6DhbJ08nxn5uBkxIctbG+pA==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by OSZPR01MB9501.jpnprd01.prod.outlook.com (2603:1096:604:1d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 01:51:37 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 01:51:37 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] libsolv: upgrade 0.7.35-> 0.7.36
Thread-Topic: [OE-core][PATCH v2] libsolv: upgrade 0.7.35-> 0.7.36
Thread-Index: AQHcumWhBSkcae1ZU0STxt8ca65Vu7XUftf5gAAAhXM=
Date: Wed, 8 Apr 2026 01:51:37 +0000
Message-ID: 
 <OS7PR01MB14444EA4EA0C70D21790B63A49B5BA@OS7PR01MB14444.jpnprd01.prod.outlook.com>
References: <189F54A9025F8C39.1958411@lists.openembedded.org>
 <18A43E8CAE7E2D5C.777565@lists.openembedded.org>
In-Reply-To: <18A43E8CAE7E2D5C.777565@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-04-08T01:51:36.455Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|OSZPR01MB9501:EE_
x-ms-office365-filtering-correlation-id: c55c8834-2b03-41f7-93d7-08de95115f1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|1580799027|13003099007|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 VnFmRyzmvSkOp1879Wg/gMTR9jyZpDitf6rmVDiWUz3SmgmEW5GF+DuKm3A43WdOyj2Rxd69fgO9Zk9vnd0q0m7k993bxQmqYzwtKVGrrjtIw/dRiYIDdOtrTwToTyx3mQ9l0w91qGxF9xM5tmD3D/Rx9DykQ0EoY3NLHmb0ZhFpuM7piABiViTxVaO8LpeU5JotirmChQKtNUDHsRRLeHQAEvyqF9l5KSDZVF99NLOBuPsvaCXxBoKoCuf33GpZO8qiYPrJZGlfJAENBGc46px/KSjmBUk53alI2s07ynahopuewoF6/uIuWyD07cWCD6fWuwkOiEdVxQLFwVbA2NvrZg4RxozG1QeXm+I0+gByhUWwWZqJQR0HTCQdit+OWTaEeK8nfs9UgwmBuY9vHyh/3/hz+LrRY1YzQvTW5zyFP7yB00EawV69hglvWCqipdN8YK3jk2sy7QjFrwJSR/IkHjsZmfBY9Pq2ySz42lfdGQBZBGiADphRhZAMYGoWWsDhzVjSsKSs4N22f2x80NLLluQv5bQIeN5qBApy/KW79Viii5+fG9CtgqeYOaCmzgmA3v5LqsWrQa0VXXOxtlW9nNJ7HXEymN3txK89ApDTGcj7odkW4BpgfSG02JScLbXlxYobhDXFGyaUf9LIDp0B9SyfRgrXyRUD2h6NClivjMtjfEgcySnfltBrzlPCFWBlVXEDOTkI4YuLOsCj92mSpg6qoCP8TJdQxWbG2xFB6ZbMHEQhXcomg/X7xeDufYFK5aQdlvhUdz+Y9plQbw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(1580799027)(13003099007)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?bWdhWmc5ckNBQmlGMWxWNzJucnJWendhWjZmNnJBVWYyVFcxOWd4VTNTbE51?=
 =?gb2312?B?Q3JFRWlXckhDUGJ1ZVdVSmdGNzh0U3luc1ZKZXVKSkoyei9ZU0k4MDgxUUFH?=
 =?gb2312?B?R0FLRGplVFhnRU5URXRoMkdKTUhYR1YzVmNJcUN1ek1TSUlQZGEwZ3FnNWNl?=
 =?gb2312?B?L2RTZHhWUmg5TS9CanFCWEJsQXU4cTdCMEc4QmFOcDNFdlZwVjVnOWxMMmNX?=
 =?gb2312?B?S3c4K3hwZGRzVm1TVjBLTzRRRVlSQTVvNThpNjhMU09pT2d4d3J3eFhYaXd1?=
 =?gb2312?B?R2NuczZtQnNheUUxWWlxenB0WXQ3YUJzVXdFTS9lbitQREtDZGF6d09EaDNV?=
 =?gb2312?B?QTVVMkduSHlLU1haUU96bWZwUnpIMVExTEpMbmtYbVE2cDBpY0s5S3dFbUxz?=
 =?gb2312?B?ME82RndWNnZzY3JoTHlkbjRWcHEwT3FZeDN5d09RVmcvaURBaDQ4RFltSjE0?=
 =?gb2312?B?T2JyQ1lveTE2cVNvWHFidWlvci9iSmpwUWJHcVZZOHpoY2tuUC9JTHJEY1Rq?=
 =?gb2312?B?U2RsTmZpMXA0akczZ1U3SUVLa252Y1F2MmNkMnAzNTlTaUlOODhoK2NGNVlk?=
 =?gb2312?B?NkloaHAvRGpFOW52TlQvMndlWktkUU0yUGRLcHRMOVJLY1RBb2sxK0E2UFJ4?=
 =?gb2312?B?UEp5aXJBVUdtb055NDVuVUUvdkxPWWRFNU04NWsvamsrR2tTSG1ZM2wrY0dM?=
 =?gb2312?B?WG5uWlM5d2FmU0NwSk93OERuTEw2ZndCUzhxR0ViSWV3aCs5VWZjeDVVUDBS?=
 =?gb2312?B?bFF1dW8wNjA5eDhsalIyZ1BUa25KblhpcUNZWUVYb2Z0R044WUNJZkkrNWtS?=
 =?gb2312?B?dlVEdjlqeFJTOWwyY0ZTMlNPRGpSdmFGdlByaGVBQWFrMFplSElwbWdFa216?=
 =?gb2312?B?aGoyTGVLV000MnZsSmY4VHozV0t0VUV3ZW1DMjU0ajVHZU1kcjVXMGdCVTV0?=
 =?gb2312?B?UEhwWDVGK0hvaGROcmNOMGN3WXJaWjR1NllmWGZDT1VvU3JHV1IyTW0xU0VO?=
 =?gb2312?B?L0Y5RmQycDlYa0srV1c3dlhmejRwZ1pqNTcwT0hOOVhCWWNxRTQvZnk4bVRp?=
 =?gb2312?B?eHlsdUpvbmJIaTlkZXNpa3JvbGE1MEVaWHlBaTJteWQzcFZYamhGUDdxVFdx?=
 =?gb2312?B?a1VqVUJEMkF5TFpzZm1EM0NkajBtc3NJUHJHWkpHYWRmVEhpNFhLSDhTT21q?=
 =?gb2312?B?ZDMwbHc2ZHFNMTExdXJZSzZWQkVtSUduTGFpZCtEdExySU5YUkJNK2V5clBX?=
 =?gb2312?B?S3pnelRIZERGbEphRGh0dVorSWZvV1BmbkRIVHhycSsvbFBqeHVMNTJVRUpq?=
 =?gb2312?B?b2dUU1htTUpZdmxpWThCd3NtWE44ZGlLUmRQMnRDUnVFRllkVUZQTFFqbk9s?=
 =?gb2312?B?endkbzRFU1BxZU9wNGlLbEVjRDhMVFdMZUxSYlRTRmVJVklwLy9BNkRUSVIr?=
 =?gb2312?B?b0pxSTNPZlJ5MG1LQUU2Y2JLemh1Ym5VKzBCbitDV2RhaWxXU1JMZUxUYnNo?=
 =?gb2312?B?eGlpWk1DbkhEbWhyVnEveDVPWDZVaDJNcjIwWEl3ZHErQU1hYUFlYkQxK2R6?=
 =?gb2312?B?K1FXeDY3QWRvd1JZL09sNTFESlRzSVhKWm9oRExzTjVYYXVhdldEWVFVMXl4?=
 =?gb2312?B?SVplYXFBcXZKMDRXM2VOV25RQkZNNEs4bmZZY1VSZWx6c1pjcHZ0SWozTldO?=
 =?gb2312?B?dFN5WXRHQTlsSEVBTjNsRkZrSmtXLzZQeEZyczJtTVQwZFhEV3ZROVR0cXVT?=
 =?gb2312?B?R1ppQ05QWWNCd1VVUkRhNHlxcVpHc3NheVd5bWtQSnBGR0ROM2NPT0M5dzFp?=
 =?gb2312?B?dGxWQmtOMTJXV2ErMW1YaU1Cd2RxcjVTOTk4My9vaVdETlZVSmxDWUxYcTEx?=
 =?gb2312?B?TXBlVFNQc1hYQUFEYlROWHNTc1BWenNSWHkvUy9ZVjc1a2ExQnB3T0R3TXh1?=
 =?gb2312?B?Y1NGeURDb3NWSEpPZmlUaG9GZnNYTUpsNHhXNHY0QUJ5Nk9EbGdPV3BMMTdy?=
 =?gb2312?B?ZDFEajhIZGQ5UjljL2NuNHd0Q3BxdlRvNGwzL0tmeVNSQ2J1YWprNUZJQlZJ?=
 =?gb2312?B?UXp3ckN0S0l0WGMxZ0lqblNDL3hYUzN2RDBkdlV5eHFXR3BCZSsybTZVQyt0?=
 =?gb2312?B?QnJYNDFiejU3WFpFaTltR3FGYzQ4Z2NYNWRUVFpHdTd3enpFd3BaNndSdDNG?=
 =?gb2312?B?MU03djhCTVNLcWNBTVg5R05BUlJYd3ppNWZmMzJIY3B4RzQvSlFWWkxUNlhL?=
 =?gb2312?B?U1N4V2twdDIxRUcwTU80cUlWckllVDhTQkc0WFNzMkd1eEo2RUc5aTZWUWty?=
 =?gb2312?B?d1VnYUhFU2NKYnA4RFhabmhucm5GWE1MUld3Ynp2MVUxNDlKWEFOZz09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB14444EA4EA0C70D21790B63A49B5BAOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	ZqhuEDMgAc+jkYPlamnIYFN6Asyav9D8d06V/G4HXRkhPrWkAppcWtDueaFMXa0zWalJhlbEA9TLnC3lBduDPAw4f7q6cBhotXx8lDAlqJIr4q26jGSZd/6escZ6CEMk5vLFOEH0Qd2XlyONB668iRomBGb/9UTs7CfYh2AbkJTzxn+HvPBqDmI+eL3XSVinB+VvJGBlmQIwL5XKyE43CAYjtkyZdOcgO26bJzbpwejQ8DLh1VCrMjeZ75pilB4U/09V5rcLSR3UpR3jKnfd8AopJ2ehzHFYVUEiDeJ4fx3MoIPcP0wBEYK2A1M8HT5xMFEyynn+y/V6zcq/tNJfOg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55c8834-2b03-41f7-93d7-08de95115f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 01:51:37.5400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7qxd+x5cACCZCMZVUQRs8oqHSKJzLGLqaKduTKNfwHpMN9AVKA9bpmvUveVLYIYxc7F7yXloxOr4bAK2QO346g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 01:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234790

--_000_OS7PR01MB14444EA4EA0C70D21790B63A49B5BAOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SSdtIHNvcnJ5IHRoYXQgSSBkaWRuJ3QgYXR0ZW50aW9uIHRoaXMgcGF0Y2ggaGFzIGJlZW4gbWVy
Z2VkLCBzbyBpZ25vcmUgdGhpcyAicGluZyIuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0Kt6K8/sjLOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiC0+rHtIFlpZGluZyBMaXUg
KEZ1aml0c3UpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxsaXV5ZC5mbnN0PWZ1aml0c3Uu
Y29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQq3osvNyrG85DogMjAyNsTqNNTCOMjVIDA5OjQ4
DQrK1bz+yMs6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBMaXUsIFlpZGluZy/B9SDS0rah
IDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0K1vfM4jogUmU6IFtPRS1jb3JlXVtQQVRDSCB2Ml0g
bGlic29sdjogdXBncmFkZSAwLjcuMzUtPiAwLjcuMzYNCg0KcGluZw0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCreivP7Iyzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gtPqx
7SBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bGl1eWQu
Zm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0Kt6LLzcqxvOQ6IDIwMjbE
6jPUwjIzyNUgMDk6MzcNCsrVvP7Iyzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCtb3zOI6
IFtPRS1jb3JlXVtQQVRDSCB2Ml0gbGlic29sdjogdXBncmFkZSAwLjcuMzUtPiAwLjcuMzYNCg0K
MS5DaGFuZ2Vsb2cNCiAgVmVyc2lvbiAwLjcuMzYNCiAgLSBzZWxlY3RlZCBidWcgZml4ZXM6DQog
ICAgKiByZXNwZWN0IHRoZSAiZGVmYXVsdCIgYXR0cmlidXRlIGluIGVudmlyb25tZW50IG9wdGlv
bmxpc3QgaW4NCiAgICAgIHRoZSBjb21wcyBwYXJzZXINCiAgICAqIHN1cHBvcnQgc3VzZSBuYW1l
c3BhY2UgZGVwcyBpbiBib29sZWFuIGRlcGVuZGVuY2llcw0KICAtIG5ldyBmZWF0dXJlczoNCiAg
ICAqIHN1cHBvcnQgZm9yIHRoZSBFbGJydXMyMDAwIChlMmspIGFyY2hpdGVjdHVyZQ0KICAgICog
c3VwcG9ydCBsYW5ndWFnZSgpIHN1c2UgbmFtZXNwYWNlIHJld3JpdGluZw0KDQoyLlJlbW92ZSAw
MDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gNCiAgYXMg
dGhlIGlzc3VlIHdhcyBmaXhlZCB1cHN0cmVhbSB3aXRoIHRoaXMgY29tbWl0Og0KICBodHRwczov
L2dpdGh1Yi5jb20vb3BlblNVU0UvbGlic29sdi9jb21taXQvMmQwNzE4YTRmMjAwMWM4NTdkOWFm
MjQzOThjNjhkNjc2YTk4YTNjYQ0KDQpTaWduZWQtb2ZmLWJ5OiBMaXUgWWlkaW5nIDxsaXV5ZC5m
bnN0QGZ1aml0c3UuY29tPg0KLS0tDQogLi4ucy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1x
c29ydF9yLnBhdGNoIHwgMzEgLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIC4uLi97bGlic29sdl8wLjcu
MzUuYmIgPT4gbGlic29sdl8wLjcuMzYuYmJ9ICB8ICAzICstDQogMiBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMzMgZGVsZXRpb25zKC0pDQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHYvMDAwMS11dGlscy1Db25zaWRlLW11c2wt
d2hlbi13cmFwcGluZy1xc29ydF9yLnBhdGNoDQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9saWJzb2x2L3tsaWJzb2x2XzAuNy4zNS5iYiA9PiBsaWJzb2x2XzAuNy4zNi5iYn0gKDkyJSkN
Cg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHYvMDAw
MS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13
aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gNCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KaW5k
ZXggZDZlOTgzZGVjOC4uMDAwMDAwMDAwMA0KLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
YnNvbHYvbGlic29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0
X3IucGF0Y2gNCisrKyAvZGV2L251bGwNCkBAIC0xLDMxICswLDAgQEANCi1Gcm9tIGRhOTliZjA5
ZTgzNDY5NjEyZTJjODIxNjk2MDI1YTRlNTkxYmI5NWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
DQotRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCi1EYXRlOiBUaHUsIDI4IE9j
dCAyMDIxIDIyOjI4OjQ1IC0wNzAwDQotU3ViamVjdDogW1BBVENIXSB1dGlsczogQ29uc2lkZSBt
dXNsIHdoZW4gd3JhcHBpbmcgcXNvcnRfcg0KLQ0KLW11c2wgbm93IGhhcyBpbXBsZW1lbnRlZCBx
c29ydF9yLCB0aGUgc2lnbmF0dXJlIGhvd2V2ZXIgbWF0Y2hlcyBnbGliYw0KLWFuZCBub3QgQlNE
LCBjdXJyZW50IGNoZWNrIG1ha2VzIGl0IHN1Y2ggdGhhdCBpdCBmYWxscyBpbnRvIEJTRCBjYXNl
DQotd2hlbiBidWlsZGluZyBmb3IgbXVzbCwgd2hpY2ggY2xlYXJseSBpcyB3cm9uZywgdGhlcmVm
b3JlIGluc3RlYWQgb2YNCi1qdXN0IGNoZWNraW5nIGZvciBnbGliYyBjaGVjayBmb3IgbGludXgg
dG8gZGVjaWRlIHdoaWNoIHFzb3J0X3INCi1zaWduYXR1cmUgdG8gdXNlLiBUaGlzIGNvdmVycyBi
b3RoIGdsaWJjIGFuZCBtdXNsDQotDQotVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQotDQotU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCi0tLS0NCi0gc3JjL3V0
aWwuYyB8IDIgKy0NCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQotDQotZGlmZiAtLWdpdCBhL3NyYy91dGlsLmMgYi9zcmMvdXRpbC5jDQotaW5kZXggNzI0
MjZlMDkuLjhmMjliYzVhIDEwMDY0NA0KLS0tLSBhL3NyYy91dGlsLmMNCi0rKysgYi9zcmMvdXRp
bC5jDQotQEAgLTE1OSw3ICsxNTksNyBAQCBzb2x2X3NldGNsb2V4ZWMoaW50IGZkLCBpbnQgc3Rh
dGUpDQotDQotICAgIHNlZSBhbHNvOiBodHRwOi8vc291cmNlcy5yZWRoYXQuY29tL21sL2xpYmMt
YWxwaGEvMjAwOC0xMi9tc2cwMDAwMy5odG1sDQotICAqLw0KLS0jaWYgKGRlZmluZWQoX19HTElC
Q19fKSB8fCBkZWZpbmVkKF9fTkVXTElCX18pKSAmJiAoZGVmaW5lZChIQVZFX1FTT1JUX1IpIHx8
IGRlZmluZWQoSEFWRV9fX1FTT1JUX1IpKQ0KLSsjaWYgKGRlZmluZWQoX19saW51eF9fKSB8fCBk
ZWZpbmVkKF9fTkVXTElCX18pKSAmJiAoZGVmaW5lZChIQVZFX1FTT1JUX1IpIHx8IGRlZmluZWQo
SEFWRV9fX1FTT1JUX1IpKQ0KLQ0KLSB2b2lkDQotIHNvbHZfc29ydCh2b2lkICpiYXNlLCBzaXpl
X3Qgbm1lbWIsIHNpemVfdCBzaXplLCBpbnQgKCpjb21wYXIpKGNvbnN0IHZvaWQgKiwgY29uc3Qg
dm9pZCAqLCB2b2lkICopLCB2b2lkICpjb21wYXJkKQ0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjM1LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMzYuYmINCnNpbWlsYXJpdHkgaW5kZXggOTIlDQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zNS5iYg0K
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjM2LmJi
DQppbmRleCBlZjM0OGRlOTA0Li5mMjIyMzA1OTliIDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMzUuYmINCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjM2LmJiDQpAQCAtOSwxMSArOSwxMCBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLkJTRDttZDU9NjIyNzJiZDExYzk3Mzk2ZDRh
YWYxYzQxYmMxMWY3ZDgiDQogREVQRU5EUyA9ICJleHBhdCB6bGliIHpzdGQiDQoNCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vb3BlblNVU0UvbGlic29sdi5naXQ7YnJhbmNoPW1hc3Rlcjtw
cm90b2NvbD1odHRwczt0YWc9JHtQVn0gXA0KLSAgICAgICAgICAgZmlsZTovLzAwMDEtdXRpbHMt
Q29uc2lkZS1tdXNsLXdoZW4td3JhcHBpbmctcXNvcnRfci5wYXRjaCBcDQogICAgICAgICAgICBm
aWxlOi8vcnVuLXB0ZXN0IFwNCiAiDQoNCi1TUkNSRVYgPSAiZmI0YjQzNDBkNDYxMDhjYjM2NTEx
M2U0MzI2NDJkNjAyNDg4NmM3YSINCitTUkNSRVYgPSAiMWUzNzc2OTliZTEwOGVjODJiYjc5OGVj
OWMyMjNkNDVkODRhNzMzYyINCg0KIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxw
dmVyPlxkKyhcLlxkKykrKSINCg0KLS0NCjIuNDMuMA0KDQo=

--_000_OS7PR01MB14444EA4EA0C70D21790B63A49B5BAOS7PR01MB14444jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I'm sorry that I didn't attention this patch has been merged, so ignore thi=
s &quot;ping&quot;.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt; =B4=FA=B1=ED Yiding Liu (Fujitsu) via lists.openembedded.org &lt;li=
uyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA4=D4=C28=C8=D5 09:48<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-core@lists.openembedded.org &lt;ope=
nembedded-core@lists.openembedded.org&gt;; Liu, Yiding/=C1=F5 =D2=D2=B6=A1 =
&lt;liuyd.fnst@fujitsu.com&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH v2] libsolv: upgrade 0.7.35-&gt; 0=
.7.36</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
ping</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> opene=
mbedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedde=
d.org&gt; =B4=FA=B1=ED Yiding Liu (Fujitsu) via lists.openembedded.org &lt;=
liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA3=D4=C223=C8=D5 09:37<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-core@lists.openembedded.org &lt;ope=
nembedded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> [OE-core][PATCH v2] libsolv: upgrade 0.7.35-&gt; 0.7.3=
6</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">1.Changelog<br>
&nbsp; Version 0.7.36<br>
&nbsp; - selected bug fixes:<br>
&nbsp;&nbsp;&nbsp; * respect the &quot;default&quot; attribute in environme=
nt optionlist in<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the comps parser<br>
&nbsp;&nbsp;&nbsp; * support suse namespace deps in boolean dependencies<br=
>
&nbsp; - new features:<br>
&nbsp;&nbsp;&nbsp; * support for the Elbrus2000 (e2k) architecture<br>
&nbsp;&nbsp;&nbsp; * support language() suse namespace rewriting<br>
<br>
2.Remove 0001-utils-Conside-musl-when-wrapping-qsort_r.patch<br>
&nbsp; as the issue was fixed upstream with this commit:<br>
&nbsp; <a href=3D"https://github.com/openSUSE/libsolv/commit/2d0718a4f2001c=
857d9af24398c68d676a98a3ca">
https://github.com/openSUSE/libsolv/commit/2d0718a4f2001c857d9af24398c68d67=
6a98a3ca</a><br>
<br>
Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
---<br>
&nbsp;...s-Conside-musl-when-wrapping-qsort_r.patch | 31 ------------------=
-<br>
&nbsp;.../{libsolv_0.7.35.bb =3D&gt; libsolv_0.7.36.bb}&nbsp; |&nbsp; 3 +-<=
br>
&nbsp;2 files changed, 1 insertion(+), 33 deletions(-)<br>
&nbsp;delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-utils-C=
onside-musl-when-wrapping-qsort_r.patch<br>
&nbsp;rename meta/recipes-extended/libsolv/{libsolv_0.7.35.bb =3D&gt; libso=
lv_0.7.36.bb} (92%)<br>
<br>
diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-=
when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-ut=
ils-Conside-musl-when-wrapping-qsort_r.patch<br>
deleted file mode 100644<br>
index d6e983dec8..0000000000<br>
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wr=
apping-qsort_r.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
-Date: Thu, 28 Oct 2021 22:28:45 -0700<br>
-Subject: [PATCH] utils: Conside musl when wrapping qsort_r<br>
-<br>
-musl now has implemented qsort_r, the signature however matches glibc<br>
-and not BSD, current check makes it such that it falls into BSD case<br>
-when building for musl, which clearly is wrong, therefore instead of<br>
-just checking for glibc check for linux to decide which qsort_r<br>
-signature to use. This covers both glibc and musl<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
----<br>
- src/util.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/util.c b/src/util.c<br>
-index 72426e09..8f29bc5a 100644<br>
---- a/src/util.c<br>
-+++ b/src/util.c<br>
-@@ -159,7 +159,7 @@ solv_setcloexec(int fd, int state)<br>
- <br>
-&nbsp;&nbsp;&nbsp; see also: <a href=3D"http://sources.redhat.com/ml/libc-=
alpha/2008-12/msg00003.html">
http://sources.redhat.com/ml/libc-alpha/2008-12/msg00003.html</a><br>
-&nbsp; */<br>
--#if (defined(__GLIBC__) || defined(__NEWLIB__)) &amp;&amp; (defined(HAVE_=
QSORT_R) || defined(HAVE___QSORT_R))<br>
-+#if (defined(__linux__) || defined(__NEWLIB__)) &amp;&amp; (defined(HAVE_=
QSORT_R) || defined(HAVE___QSORT_R))<br>
- <br>
- void<br>
- solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void=
 *, const void *, void *), void *compard)<br>
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes=
-extended/libsolv/libsolv_0.7.36.bb<br>
similarity index 92%<br>
rename from meta/recipes-extended/libsolv/libsolv_0.7.35.bb<br>
rename to meta/recipes-extended/libsolv/libsolv_0.7.36.bb<br>
index ef348de904..f22230599b 100644<br>
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb<br>
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb<br>
@@ -9,11 +9,10 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE.BSD;=
md5=3D62272bd11c97396d4aaf1c41bc11f7d8">file://LICENSE.BSD;md5=3D62272bd11c=
97396d4aaf1c41bc11f7d8</a>&quot;<br>
&nbsp;DEPENDS =3D &quot;expat zlib zstd&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;git://github.com/openSUSE/libsolv.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3D${PV} \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-utils-Conside-musl-when-wrapping-qsort_r.patch">
file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-SRCREV =3D &quot;fb4b4340d46108cb365113e432642d6024886c7a&quot;<br>
+SRCREV =3D &quot;1e377699be108ec82bb798ec9c223d45d84a733c&quot;<br>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot=
;<br>
&nbsp;<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_OS7PR01MB14444EA4EA0C70D21790B63A49B5BAOS7PR01MB14444jp_--

