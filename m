Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D54C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 13:34:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30308.1786973654221912837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 06:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W8Q1JZeR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2689001984=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HCAGmJ2607554
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 13:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=7GTOIDAoi7kbpLvgnYdaOvI9UzoAAyhdYiR/sO1fM3k=; b=
	W8Q1JZeRl6iJTJlQO999BhsZPZ0/zDpqDcsFm+1Rgl11XBGewzOdd9Ce0susQx5P
	ivwjFAQX97hUgERJPURD41K/JfxWoCvgNiusvsOFVSyQ48WBxZHIUhe99dlC69Zc
	tYpH8Fu/XLMx+pvEEqTxg3E/KJCy4K6WID+rJH/o9FFR+pt4IcmPd/Tkxev08J9K
	om9Q1wXuLfHEwSaJjvTFbbI/GDxDk69rAAsq+86e012VcLzcRCMn7Uy+DScz1l7U
	JTxbsqahme29h/wzisV4miMZlf/3pungQdHgNbpGhhoTvl4cgX9LE+Z7BRRPrRrC
	wcTa1JOu4MDcWND0mOjMFg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023133.outbound.protection.outlook.com [40.93.196.133])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2eebamfu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 13:34:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdlxwmyWlP95wO6P1Wom+ndrKLB2c3gnxOiEnhNyGAnCO0THqn2GIbBDY1h1DeWh4ofNWILfurRtnxWudw/Y+6p/SaqZSrVJEydthWGL3UJjx6fj2CreAUsSmue/xRg1ou8VjfHdzHPE7nsTlZorUlpq4dDMy5zExheNHSr8iA7gVXbF8DqwHLU1l9zQ2/5sbEaq4bHN90AochJg1DeavnavWcIPiaz5QmCJ9uwko/CL3bgZKJpWrdYFAoaHeCchdcV3/fyfFhkf6q4hX9iL7Bru2DKr3cjROMSTFzxvo9Ys1xlPD+6wjbZZCKMwBSuBQyK40oesqvR6uIAeJxeXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GTOIDAoi7kbpLvgnYdaOvI9UzoAAyhdYiR/sO1fM3k=;
 b=ws4UrIDCda5D7YGKcdht0pYWY7K7mruniI6GNIZ9pcGQ6SU/tM6GHN36+3i3AF0jh2eFKOWT6qOE5yWJGLVNrFkpeP8Rf+CrlEZi4HF8nEFHF4EuiZW3e05grTMxvbcnnRwV2WdwfrhtO6SDucz5JZlGtDWDQynkZ+sW9a9ni5sSmBYjjbWaQTv2JdvJ29KVe95b6QgU1kKXnATPVD1GWJqZ6pvbkryqGGd17RIOYcpJewPM8leGU8EyZciLQsRxW8pd5YHckPV1YQesL0motsTznLIZLVMM17u7SI2MPHzCcAmkEQ90sLaSlgULNQy3LpET6t+gPgCPPuvHNWoeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 17 Aug
 2026 13:34:07 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Mon, 17 Aug 2026
 13:34:07 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "mattware@cisco.com"
	<mattware@cisco.com>,
        "esparlin@cisco.com" <esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [PATCH v15 01/12] package_rpm.bbclass: Drop external dependency
 generator to support rpm 6
Thread-Topic: [PATCH v15 01/12] package_rpm.bbclass: Drop external dependency
 generator to support rpm 6
Thread-Index: AQHdLdSMDZkG2YZ5mEyedjEIun7Ib7ah8LiAgABNxoA=
Date: Mon, 17 Aug 2026 13:34:07 +0000
Message-ID: <0687c7a0-8f97-4750-bbf0-e8c18772f293@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
 <20260816231104.3871015-2-sumanth.gavini@windriver.com>
 <DKR3DBY7HJGC.1DTHOPVL8ZOS8@bootlin.com>
In-Reply-To: <DKR3DBY7HJGC.1DTHOPVL8ZOS8@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|DM6PR11MB4724:EE_
x-ms-office365-filtering-correlation-id: 882c4fda-f335-4805-d458-08defc6436b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|4143699003|6133799003|5023799004|11063799006|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 9qIkvyJwPMMgumuF0uHLZDGUhQu0VvtdSTkE7Lnw9r3vfoo5Vi6mObIA3ft1ZLSYuQoLaF+T4omTy2GzpYkD06lvY8dYT/6IXg3PRzCX/yMrFzWffDmcd3Wrzn1sCVRXgJJmuPajjJj+80ywSNJBw0ddBulIlVk4rwcLX9N2HqcZPRg7qtnEfSpMo1vYH38dHPFtLSGEbZq9oPLaJXzMNYZwkcnd/jTGrADUBOyVQBCjoygppfjVikjyTuqdRL5z+xDKrcepGL9yjOp6395Ghqv4tltERd45lONuuZyhJFavDqVfT9IFucTZQc1E1Ai26vgAtlnyblIkqivFWrPOB8mLfYVT6ncw7NSNPSu5FFzFr59+9cN+Rjb/0Rm2czD84KSLFly7vtNNfUayWRGYcISmExDNr7RILfXKF5GZcKxbZWho1UgnOS5UAg2lhHMk8x3b8xEeBGkCT/PvQ/Hf7p0TgA39QW0IdVXxoujCYm/3UtZldeH+CFwJqHwje91MntcRvyvlJqQafwRByqhsMuFgPybYmYJsILB6KSFIAPtit5uOT6ImgLgMqCAF5QTchWS3s+vq4JBoHHzfoBOSefR1+FPk81gV+VIpfnxti1ErCvHjIVnRnNaW4umn+zCHiTobjQkicPqMZOoPypd8TgipocRHso2sA2i2yNZfK3s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(4143699003)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VEFWYUxQRFlWNGNtOFhFb1NReFI2UGhlaFIwZ21lZTZyRDBGOGFNWXJFenZ2?=
 =?utf-8?B?MzRrSUxTbXB3a2YyTGkxbjRXL3o3YUFBc05KdXJLWlBvRFJ6Rk1kZ2wydHNk?=
 =?utf-8?B?eEpWZnBZNjZDZkVNTXk0QjZ6LzNQNm9VWSt2L0ZiV1VaRTdWT1U1SExVcTFj?=
 =?utf-8?B?cy9uS21Pd080UGZJRDZIYm9aMktuOE5CSzlnQWpPamhtcTFzTVdQMXk0VW5x?=
 =?utf-8?B?UHhhZVV2djBFcUdlM0hkMzd1anhCL0RPZ2tIZmxWNjRiRG9QakdKR2VTUkhR?=
 =?utf-8?B?VkUrei8yUmM1V2ZaL2pZdGtPWml1NUUrM3paa1BUV3Rjc25mYVJIOHc2MlBR?=
 =?utf-8?B?amdzYWlVaC9CcEwxeDVZTlZ1blR1WExHRnIxNGlmaFYrWmZaMFl2elRUb0Vq?=
 =?utf-8?B?NWpLaldwMU1IYmxnOXFjcTczeFl2dU9qQ0FjYU5Sd2FFRURCQnFuRENwRUtC?=
 =?utf-8?B?dkJzUHp0cXNtSVJUTHFpeTk4VEdlcDkwcS9WUDNSVTFicWhGelZQNlBBbnNr?=
 =?utf-8?B?bldlOC9rZjg4NGxUSk43ZnhXdzJLMlVZUWhGc1djKzROUEgzVTdLZG5ydkR4?=
 =?utf-8?B?bHZ5TWwzMTk1Z0xkOGE0UVdXNkpheXdNMGZPVHNYSVBPb2kvdWdORDlpMGVm?=
 =?utf-8?B?bUtWbTB0UU9iMUxLZ3BUNmVBSU1vL1FOQjNzazYvKytnUURBdlBsbXc5N3BR?=
 =?utf-8?B?RW1vNEVCek1OWjZ1THFNYyszS2NjOEdYdVI2ZW9tT2kyR1RkU1BhejdhbFNm?=
 =?utf-8?B?bk1OalJJcWZmQzZyNFRYVXBqZnV6QWhLRUp2akZ0OXJQbEFaYVlnV3JScHN3?=
 =?utf-8?B?L3hqWWdUVkxYNDZ1VEw5UGlyUFIvcWxVbFQxblFybzJJalZnVTdFZTNiV3dY?=
 =?utf-8?B?S2ZFZVA1Q1NZWFd3SnhGUUVkdjF2MC9vM1lVSjVHNGhnVi9VY05JQSt4eEhG?=
 =?utf-8?B?V3NYRWNoSE1SejVMdTBxcVF4eHdWYnd6YXBXK2wyNzNNWHA0ZU1oRndZUlVq?=
 =?utf-8?B?WkZscXZsZUc0SVNqNHBTU3lhdTZsMFdNQWI2NmRNR0g3WCtLN0VQdTlHNGU4?=
 =?utf-8?B?V3FRWkJ6Vnh1am5SL0dMVHg5RjEvVVptRzc1SkovS0ZBOXBlaFE0b1BUaVRQ?=
 =?utf-8?B?aGtYZ3Jzek1xL2dsQW5zaVRsREx1dE1xTktmOTZwcUZtc0EzV0pXblVJWnRy?=
 =?utf-8?B?T0k1cTNRN0RtR1F4b2E0MGs2REkxMkZIR203R0RYOStmVkUzVEFCdGJ2SVJN?=
 =?utf-8?B?Y25XYy9ja3ZRZHN3bHl2bzdxcVV3UGpjcUVBdXVkb3Z4SjBiZGwzN2RjT25o?=
 =?utf-8?B?dmx4K3NCSjRlY1VGYjRkb0U2YWhvZXpON1lmM0dpQ3BVRE1rZkFoRmgwSDVi?=
 =?utf-8?B?REptd0NDTzdYRHMyelppdGRVanM2dW41MUhkbTAybXpkRXpma1gwY0JrMnNl?=
 =?utf-8?B?UVB0M2xScHFWMWtoT1ZrSDFWZUkzUW16QmJnM3VuN2Z0YU9zNHVGN2pWQ09s?=
 =?utf-8?B?QnhxbkxmdHh1VTBhNHFmNjM4MjNSeTJONml5eVhjWUs0ZnFmTTMrenN6Rmhp?=
 =?utf-8?B?OE5NMGZCSlJJdnlOSVRBUVM4WEdSaGJkeU53U3NSWFJEYk5keWVlaXFrdGQ1?=
 =?utf-8?B?bWtTS2x1ejJlN2VkQ1MrZGxXMnZsRU5mQmtGbmo4Wk1LTDVyeERzZ2hJK09j?=
 =?utf-8?B?c0tjbzNRNTUwQWg5L1NKQUd2YkhBemYrVnBVa3JpUUkwZ2x5Q2k3MnNXZWU4?=
 =?utf-8?B?N25vYy9mUDBqRmJYU1phN3pHYzNFang1NFdhYitnaXZtOC9BRU1MaDNCMWxQ?=
 =?utf-8?B?bE1kd1FKcDMwMTd6NlhFSjhXK2pEMWtTVTl2ZFBlaG1LZFVtbXdJK09tY00r?=
 =?utf-8?B?NkprdU9yc3M5eDd1VG10QmQ0bGI2WE5XNVZoWEpmS3RkbVQrV25zMnlNOHow?=
 =?utf-8?B?eDNBSjl0QUJTTVlSUzFUYVFXbmJCQjZmd2xoNExETjVKRkZNZHErYWIzUlRt?=
 =?utf-8?B?WnE0Ry9rTnpSZzYyTlR6ZGFmdldSZkFQckVXRC9Hb1ZpNkJtV1RCbklPejgy?=
 =?utf-8?B?NlpmQkFDWFpoWFdpMzMwMHV0akQybm4yMFpVQkNTTzdkZmpGOGFrODdFS01I?=
 =?utf-8?B?KzFvZ0tnV2ZneS9KTHhuTWFiYW5PdlRIQ3VNL3NhZCtjb3lUbUJ0aVJOcW5G?=
 =?utf-8?B?eU9MQmhHamJvOUhwR20ycURwYnhPWjh2TWJlciszbGZlQlRybHAwZ0NuNXhm?=
 =?utf-8?B?ZnRELy9tMy9TbE1zeGNUZ0M5UDJqR290RE9yOVM3VytnZU92T3B6a2xDQVBR?=
 =?utf-8?B?K3d2Zy9PYllVazlPcjlOUFF0SjBzSCtuNWxuWElNZXJZSldiN2t2WE1wTVo4?=
 =?utf-8?Q?H+zxBX+ryIR7iWPdyp/BZUJrWSt1fQ9mCRY2d?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1CF135260E81949B922495EEC46E4AF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	TXGeC8oEVXLU8kiG2zsCjW8hvYD7nMRWRq6xaKdfdPaKRq7SLdgpHLysRCHs5lAx98qhDbZiLE5NY1BSMJs3p9xHjqjZMLeVfuEncTNRlh7O2QCbxCwtX5iDdD3vsugKIUFDCc2ebjzhHeQncYCHMubFFQ2cBtcBVBSBOnC3vIUJWaeIoMUZeQuxoysMe3ECFAwAaQQHWM+KXlflIVjSQx68B7lBkSJgrxLRzG8suV6VCDzdcUJk38ztSFqkBNYNEBr8spZd8kZyjLujjAblble07N7oLtC8TbljXDs+zNcV/RI6GaOqCXK2SCUpnYl/iivXsG5N+Qh/SCofetKMXw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882c4fda-f335-4805-d458-08defc6436b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 13:34:07.7684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brsIcb8QA0rjYnZoAbW/J4IWzdXnlem7X39vVevxyobBP5xLuzM6JMKnI83ajcGpET774P0ogbMUSjMYMlhviC03m0WaMjnYk4O27nskUeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Ma4rM8sqx05Pb3SDnMS_3huag2MN23lz
X-Authority-Analysis: v=2.4 cv=DLy/JSNb c=1 sm=1 tr=0 ts=6a830dd4 cx=c_pps
 a=pt7H9/Fs7R05i13VUf3btA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8
 a=6M8ORUvCktzx3YFGv3UA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfX/49JmgDQETsG
 LEH0vhhrm3gusR3KiS2v9eRN7ObpAdVUoCvVh+JDEtCekvexp1qOt9EAL+Efld1tihkx96PuTnJ
 mBXUkL5Gyyjzde44jSZ2+vdlfWSbQ7RUbA33Z8ryiXAvCgwqwGNA+JIdGjDuRy0bOPIObTzecfE
 UMw2xGgRUVeZygCHTYn1t0G3Yo3gpaDO8ZvMA9Z1EQGLgJKFOmFlM3BvW2GWhQ7MHN8xUTKJt6w
 x/ZxSCNinzwuWd5IBQroXp5PmAjrmj2UPFyqD+OE6p8HiIAOFUMskwPs3dhCImshjHlfsd/aVWf
 jXqc/YmREjGPOuJ4tTFjJc6yV3mJqsq7ziwl9x/ST4dGLns2sMDjbliGeHUjnoWAq0Kj6VOuhFM
 JbSGi7RW3xRJrWQ6z6C6CARhH/P3Y4aG0gnCOyPQAx3ElnP4tHJIYTX53UOLZ8JskGD6lf6HlIO
 WKlWquZENhH5oVr8XoQ==
X-Proofpoint-ORIG-GUID: JdjZcfL-Bl9Qbbqhp4gYuOAzCh71Egzm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfXypP+LNwc/JqU
 dYQigRvF4h1QzRidDibOTMuiqnrLTOL6xYdZqvRa/s57KBr5vQFq6fd8fUWcqb6JyFLzvym90/f
 FV3Yyqrm7N1NxsxFi/R5iQy+Sy7DT8bRwogBy+/TR/N1QC6iI8o3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 13:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243623

T24gOC8xNy8yMDI2IDM6NTUgQU0sIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB3cm90ZToNCj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3Vu
dCENCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBy
ZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4g
T24gTW9uIEF1ZyAxNywgMjAyNiBhdCAxOjEwIEFNIENFU1QsIFN1bWFudGggR2F2aW5pIHdyb3Rl
Og0KPj4gVGhlIHJwbSA2IGRvZXNuJ3Qgc3VwcG9ydCBleHRlcm5hbCBkZXBlbmRlbmN5IGdlbmVy
YXRvci4gT2UtY29yZSB1c2VkIGl0IGZvcg0KPj4gcGVyIGZpbGUgZGVwZW5kZW5jeSB3aGljaCB3
YXMgc2F2ZWQgaW50byBwbi5yZXF1aXJlcyBhbmQgcG4ucHJvdmlkZXMsYnV0IHRoYXQNCj4+IGhh
c24ndCBiZWVuIHVzZWQgYW55IG1vcmUgc2luY2UgMjAxMiAocmV2Og0KPj4gYmU0MGY2ZDBiYjgw
Mjc0MzY2YWYwMDQ2MTExMmFmNjU2ODdhNGRlOCksIGFuZCB0aGVyZSB3ZXJlIG5vIGNvbXBsYWlu
cyBvcg0KPj4gdXBkYXRlcyBpbiB0aGUgcGFzdCAxMyB5ZWFycywgc28ganVzdCBkcm9wIGl0IHRv
IHN1cHBvcnQgcnBtIDYuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IFlhbmcgPGxpZXpo
aS55YW5nQHdpbmRyaXZlci5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTdW1hbnRoIEdhdmluaSA8
c3VtYW50aC5nYXZpbmlAd2luZHJpdmVyLmNvbT4NCj4+IC0tLQ0KPiANCj4gSGkgU3VtYW50aCwN
Cj4gDQo+IFNvcnJ5LCBidXQgd2UgY2FuIHN0aWxsIHNlZSB0aGUgc2FtZSBwa2djb25maWcgaXNz
dWVzIG9uIHRoZQ0KPiBhdXRvYnVpbGRlci4NCj4gDQo+IFRoZSAibm90aGluZyBwcm92aWRlcyBw
a2djb25maWcoKSIgb25lczoNCj4gDQo+IEVycm9yOg0KPiAgIFByb2JsZW0gMTogY29uZmxpY3Rp
bmcgcmVxdWVzdHMNCj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIHBrZ2NvbmZpZyhnc3RyZWFtZXIt
MS4wKSA+PSAxLjI4LjAgbmVlZGVkIGJ5IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UtZGV2LTEu
MjguNS1yMC54ODZfNjRfdjMgZnJvbSBvZS1yZXBvDQo+ICAgIC0gbm90aGluZyBwcm92aWRlcyBw
a2djb25maWcoZ3N0cmVhbWVyLWJhc2UtMS4wKSA+PSAxLjI4LjAgbmVlZGVkIGJ5IGdzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2UtZGV2LTEuMjguNS1yMC54ODZfNjRfdjMgZnJvbSBvZS1yZXBvDQo+
ICAgUHJvYmxlbSAyOiBjb25mbGljdGluZyByZXF1ZXN0cw0KPiAgICAtIG5vdGhpbmcgcHJvdmlk
ZXMgcGtnY29uZmlnKGxpYnhtbC0yLjApID49IDIuOS4wIG5lZWRlZCBieSBsaWJyc3ZnLTItZGV2
LTIuNjIuMy1yMC54ODZfNjRfdjMgZnJvbSBvZS1yZXBvDQo+ICAgUHJvYmxlbSAzOiBjb25mbGlj
dGluZyByZXF1ZXN0cw0KPiAgICAtIG5vdGhpbmcgcHJvdmlkZXMgcGtnY29uZmlnKHhrYmZpbGUp
IG5lZWRlZCBieSB4a2Jjb21wLWRldi0xLjUuMC1yMC54ODZfNjRfdjMgZnJvbSBvZS1yZXBvDQo+
ICAgUHJvYmxlbSA0OiBwYWNrYWdlIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC1kZXYtMS4yOC41
LXIwLng4Nl82NF92MyBmcm9tIG9lLXJlcG8gcmVxdWlyZXMgZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFzZS1kZXYsIGJ1dCBub25lIG9mIHRoZSBwcm92aWRlcnMgY2FuIGJlIGluc3RhbGxlZA0KPiAg
ICAtIGNvbmZsaWN0aW5nIHJlcXVlc3RzDQo+ICAgIC0gbm90aGluZyBwcm92aWRlcyBwa2djb25m
aWcoZ3N0cmVhbWVyLTEuMCkgPj0gMS4yOC4wIG5lZWRlZCBieSBnc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYXNlLWRldi0xLjI4LjUtcjAueDg2XzY0X3YzIGZyb20gb2UtcmVwbw0KPiAgICAtIG5vdGhp
bmcgcHJvdmlkZXMgcGtnY29uZmlnKGdzdHJlYW1lci1iYXNlLTEuMCkgPj0gMS4yOC4wIG5lZWRl
ZCBieSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLWRldi0xLjI4LjUtcjAueDg2XzY0X3YzIGZy
b20gb2UtcmVwbw0KPiAodHJ5IHRvIGFkZCAnLS1za2lwLWJyb2tlbicgdG8gc2tpcCB1bmluc3Rh
bGxhYmxlIHBhY2thZ2VzKQ0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qu
b3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNjgvYnVpbGRzLzQ1MTANCj4gaHR0cHM6Ly9hdXRvYnVp
bGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNjcvYnVpbGRzLzQ0MjAN
Cj4gDQo+IEFuZCB0aGUgIm5vdGhpbmcgcHJvdmlkZXMgL3Vzci9iaW4vcGtnLWNvbmZpZyIgb25l
czoNCj4gDQo+IEVycm9yOg0KPiAgIFByb2JsZW0gMTogY29uZmxpY3RpbmcgcmVxdWVzdHMNCj4g
ICAgLSBub3RoaW5nIHByb3ZpZGVzIC91c3IvYmluL3BrZy1jb25maWcgbmVlZGVkIGJ5IG9wZW5z
c2wtZGV2LTMuNS43LXIwLmNvcnRleGE1NyBmcm9tIG9lLXJlcG8NCj4gICBQcm9ibGVtIDI6IHBh
Y2thZ2Uga21vZC1kZXYtMzQuMi1yMC5jb3J0ZXhhNTcgZnJvbSBvZS1yZXBvIHJlcXVpcmVzIG9w
ZW5zc2wtZGV2LCBidXQgbm9uZSBvZiB0aGUgcHJvdmlkZXJzIGNhbiBiZSBpbnN0YWxsZWQNCj4g
ICAgLSBjb25mbGljdGluZyByZXF1ZXN0cw0KPiAgICAtIG5vdGhpbmcgcHJvdmlkZXMgL3Vzci9i
aW4vcGtnLWNvbmZpZyBuZWVkZWQgYnkgb3BlbnNzbC1kZXYtMy41LjctcjAuY29ydGV4YTU3IGZy
b20gb2UtcmVwbw0KPiAodHJ5IHRvIGFkZCAnLS1za2lwLWJyb2tlbicgdG8gc2tpcCB1bmluc3Rh
bGxhYmxlIHBhY2thZ2VzKQ0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qu
b3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMzYvYnVpbGRzLzQzOTQNCj4gaHR0cHM6Ly9hdXRvYnVp
bGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNjEvYnVpbGRzLzQyOTIN
Cj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0KPiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJp
YW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4g
aHR0cHM6Ly9ib290bGluLmNvbQ0KPiANCkhpIE1hdGhpZXUsDQoNClRoYW5rcyBmb3IgdGVzdGlu
ZyB2MTUuDQoNClRoZSBwa2djb25maWcoKSBlcnJvcnMgYXJlIGxpa2VseSBmcm9tIG9sZCBzc3Rh
dGUgcGFja2FnZXMgYnVpbHQgYmVmb3JlDQp2MTUuIE91ciBjaGFuZ2UgdG8gcGFja2FnZV9ycG0u
YmJjbGFzcyBpbnZhbGlkYXRlcyBkb19wYWNrYWdlX3dyaXRlX3JwbQ0Kc3N0YXRlIGZvciBhbGwg
cGFja2FnZXMgKHRoZSBjbGFzcyBjb2RlIGlzIHBhcnQgb2YgdGhlIHRhc2sgaGFzaCksIHNvIGEN
CmNsZWFuIGJ1aWxkIHNob3VsZCByZWdlbmVyYXRlIGFsbCBSUE1zIHdpdGggY29uc2lzdGVudCBt
ZXRhZGF0YSBhbmQgDQpjbGVhciB0aGUgZXJyb3JzLg0KDQpDb3VsZCB5b3UgdHJpZ2dlciBhIGNs
ZWFuIGJ1aWxkIG9uIHRoZSBhdXRvYnVpbGRlciB3aXRob3V0IHJldXNpbmcNCmV4aXN0aW5nIHNz
dGF0ZT8gQWxzbywgaWYgeW91IGNhbiByZXByb2R1Y2UgbG9jYWxseSB3aXRoIGEgY2xlYW4gYnVp
bGQsDQp0aGF0IHdvdWxkIGhlbHAgY29uZmlybSB3aGV0aGVyIHRoZSBpc3N1ZSBpcyB0aGUgc3N0
YXRlIHRyYW5zaXRpb24gb3INCnNvbWV0aGluZyBlbHNlIGluIG91ciBmaXguDQoNCi0tIA0KIyBT
dW1hbnRoIEdhdmluaQ0KIyBXaW5kIFJpdmVyIExpbnV4DQo=

