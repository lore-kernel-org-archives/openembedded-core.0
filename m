Return-Path: <Shilong.Jiao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CED4CD98D2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:44:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40952.1781167440866360070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BsVgwL07;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0622bf43b4=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B4NEXo2915072
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 01:44:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=xic2GTLcjjyB1SUMmu4YPe
	i7VZ6RGdr2KYVT2Mw8Onc=; b=BsVgwL0731TNFLKQAZZHuOiJhRLlH0gzES6cM6
	cMi9JbBX8WPDaUE573iKL1xyDmCeUxugAqJtuh/pH3XRTfLqv5EVF7i+rk7p1x/G
	l0jUWcqTnYHWpvcUXYSmqREdP7vyzG3l7zcpP9HaO1c9pJ43keU3Urcu/2idTusS
	JzFlxWig5aCfi7L/wO8Fy9U2ebck8OQKxRbxMKbQTO7vaLnvxi3O10WupMRE45Kb
	MxtMRDqQI6MS3Gq5YT5bVTemLRBuFNwnPLRPcMY3Umjr38xL4Gdxoh1Rnl0W+J3X
	y+7vUxntrA3x1UFbtRR3vP23PfuyVW1unyIAr4vmxSUhvE8Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7s8rar-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 01:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekY8arzXXA3/O9U8N8ocY9GppgORugxUWpa1KVT4yTpVqXM3lLU03/zAwrzEI5Pm7bQP3dNvkc/BDSaT+yYwtfaNsU9NaBNMnBSEf0CpVciPlkTETLcWfkUkqTdESuzRRzbbXbXei7yCrDVKbNZPPUOJtfExVLKBg+nl9P9gX7Kv+G6vk+iwKULwuiahgTiUguufAbQCaZdYe7Skl0MxgOZnG6YJ5ebPBUzSlkViTctTEVxHRbW6uHUGGj3ZKM+y5dAgYOPrD01kybU3ulAH97gOOZAeSfw8dLenLDka3Wjpx+2QBVrRCxMVLJc0u0h6UV83TCV4+F5Hwzz/WtGG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xic2GTLcjjyB1SUMmu4YPei7VZ6RGdr2KYVT2Mw8Onc=;
 b=DOxraQPqE0kjoaIWWvp0uEiSan9yzHq1i2SEufkeeKey8Qfcnzt9Z48HJ1TtIgEllGTX94jAZ4s+kfjBOvqtdmeBIReW1tNGkyRuR7QxhWBuhcNHWi3UASH5P55iVQwFpxgFg/TRv0BRVFkpbEnHHHgNyBrN2kfylchoa+ta0i2BzrG+qceUlh4DIY7z+vASFv9fCFJU6qMsAXmZ4baWYwnQ4XpwFEijyGD74KyB5lPAfD7apmNQqVGbqmgLzndYs0derMXyC2wnCkZZKzk//liDRPl7J2ynQ39Dck58mkEjkYigwELlpC+PSZTN7GLEruqg5JwPuZKd9sgENlD7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24)
 by CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 08:43:53 +0000
Received: from CO1PR11MB4818.namprd11.prod.outlook.com
 ([fe80::3072:169:8f8c:8381]) by CO1PR11MB4818.namprd11.prod.outlook.com
 ([fe80::3072:169:8f8c:8381%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 08:43:53 +0000
From: "Jiao, Shilong" <Shilong.Jiao@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support
Thread-Topic: [OE-core] [PATCH] python3-six: Add ptest support
Thread-Index: 
 AQHc9+3IBgFEIc6TJ0KxxAVJ13Jl4bY17hCkgAARpLqAAcE3AIAA3Hh9gAA2OICAABS68oAAIrYAgAAB3FI=
Date: Thu, 11 Jun 2026 08:43:53 +0000
Message-ID: 
 <CO1PR11MB4818CE98623835D9F3D61A65801B2@CO1PR11MB4818.namprd11.prod.outlook.com>
References: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
 <DJ4E5OTQSRTG.JX0ANFWCLECZ@bootlin.com>
 <18B75E544A0EA1A3.61226@lists.openembedded.org>
 <SN7PR11MB66786F424595B04D017F6116801D2@SN7PR11MB6678.namprd11.prod.outlook.com>
 <DJ5DVPB75QO4.F4OPEQNML7BM@bootlin.com>
 <SJ0PR11MB48297A9B780C8DD714642A48801B2@SJ0PR11MB4829.namprd11.prod.outlook.com>
 <DJ5YSG3O3Q40.3I3CWDSCY07FA@bootlin.com>
 <SJ0PR11MB482976D2BFC3372B8D58C8A3801B2@SJ0PR11MB4829.namprd11.prod.outlook.com>
 <CANNYZj9dWgjGVG3-S-tnxVr82VbO8M=jNkDGV_x+RC2YvHPoLg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9dWgjGVG3-S-tnxVr82VbO8M=jNkDGV_x+RC2YvHPoLg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-06-11T08:43:52.514Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4818:EE_|CY8PR11MB7034:EE_
x-ms-office365-filtering-correlation-id: 3497877d-648a-4d82-6182-08dec7959124
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|13003099007|18002099003|22082099003|56012099006|8096899003|4143699003|11063799006;
x-microsoft-antispam-message-info: 
 UDu9AIwZy4ThpZfk9IrHHii1vO1uIXri9RgfzLSYUYDaihlP2nDFL6Vel6EBPcQgZJzx4b+SUzLgTlHEIdbaUEKHkn21ex9At99dfPTbQOguu7oebwaOjze4dzMQX4gSZUlI5s2ZCfxv3cosT4vIQBi0O+dqBwxH6qY2n+EStqV4pkUxEvff50VnzIT5hfoD0h6K1cB5zwTdz/0vk3roLXoNdzGM+vWp7QZsYBwRyjsMFIoXxoiCHVBqXctzZBwjv5leoOrtLDUjaK2AN50DrqWvGbeihqByGA7E6ePbodnk7yevKTShFh+bLo+2iO3PnTPbVipJarOZ/K1ZDCjiY8Alxr49BkE+NNH0WXMbAv+DiBgWv8+I4JvBJ9f3o/itkDlgFMa35aUW+v5pfNnZfUFXn0WOy1IdXOcTrQTci+hEkLrUrBU2ZtqqgTDXETMfTxV3Ju9b5ZqTytDdH+ZYTEbsBDY8ijePTBR9VSzvShGwqbQHIEe4EdclcdxitK0tuIwIfNcJ8tD0Ma6OLQwEVlu/zIVy8TIEKYWUci7mp7QksBQKEa/jUivlKXfzDeUBR92J5Kp5dv6YWUru6PK4Q9X72giCZBTeFqapyMs/0E2WjGe8JTj/WkYgbM/+zlP9DOxNxJKajl0AMFWw/OsNdsC2J5n2y9JMll2TC2/RNXg0sFbePqndH+M3/UKSo4o8nGwFwe9kHrN2an2SqvDJzhA7LNMfw24CKoPewvyedga83JEoMePBm4Gp7hsqh4j+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(13003099007)(18002099003)(22082099003)(56012099006)(8096899003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8Zyh+XNrY6Js/pMCdMWyY3RSW0e9g4BZWQc5jRATJIV+pPuasLGKQRBMSSht?=
 =?us-ascii?Q?IPokLT4iFxg5Hu7dK7JCvXhm4QZvhTU3MtusbqTM8n8DB/YFnfyz6UfhYklv?=
 =?us-ascii?Q?zwiBX0O+4V1/fSE4Lep9QWmGJ7wRpDvHbPbWNpcTbmzEawZB8ytPsWNJyMNi?=
 =?us-ascii?Q?tpLVh2FuZH6kEfQBvtH8KxoAI0HiOPsi1WoswuvdJOHzj+T/LPjShxNrjaOm?=
 =?us-ascii?Q?JbaZ9XN2NfFcAOlrW7ZdapeXv8wi+HfwZxGJeDyB2wY+1EVd7EW7VG3Jq+6S?=
 =?us-ascii?Q?UO5Pssz0+yg37p/YdZdOOFlF12xxCx9o97++S0nes5CDzsGQ1dY1W1vlExVj?=
 =?us-ascii?Q?g+oItPUxLsHsezO1R6v8UJ0xEX6qKIN6t8Z3VV3AvrdQev5uKweqxX+gaBaX?=
 =?us-ascii?Q?p4G8OKuHP4HQfGlDDhDfjFA2ixSz3GP4MOymLZzptP1j+U0/gTS4Of8AaPda?=
 =?us-ascii?Q?upEfmvAEHlz+Yhh+auILefObYqlZ3Iv4u2NG/jbPfKlta9rjHCzbQlnzDBRL?=
 =?us-ascii?Q?TxKkHdcbOIRQHuTlRsyLNgTMQ7/PQc4XNkMZGCFEjVPl/jfSONL+xTB5Vqne?=
 =?us-ascii?Q?QvEnDoe1uKpH8uTCdhJs1Ql9rzgUZ5uze2uiAL6X4Zx9qNVy/CMABFgCd7Xs?=
 =?us-ascii?Q?zLGp8LeLilLgiz5SjWV7K6d931M4D7Rj7SOwKUq22FWJSt3LwkMamx5U+SpM?=
 =?us-ascii?Q?RF7W5H5IVdS3nr2C65u1INo215XMeElZv1JBirRG/4ta/i4xDwY8anXjwqXy?=
 =?us-ascii?Q?I3kafxiTHSjh/3jG4dHepY/dCPXw0nJSF3WTaNW6F2aGHzVDPLHuQZV9IMS7?=
 =?us-ascii?Q?4oGZZmD6eu4pWNUsKJQlgbi9D/5J2VHn6pMmG8PbNOmsKDJm3EzpZJ9+Tezd?=
 =?us-ascii?Q?lxm7trsYmUn/G2B7/36R8GPh6I/TZj6RjddoFS5tC8D/DObA06vCnfr6hyO9?=
 =?us-ascii?Q?EL5ixDgNlrVDstD81LuMkOhvlZAg/B5tUz7TtghtSdTP8M9IQxr99LOR2CFh?=
 =?us-ascii?Q?nSi8iL1f6bQoldlbVTNYUBxcSllYWEB8mb3IfAR+JY6ziFU4VILatlxE86Dl?=
 =?us-ascii?Q?aXMq2e1nMf5Ip7lWFfTy0gOIPRKe6CKMjbJt0ImAudYVUK+jtAzzL+m3mGan?=
 =?us-ascii?Q?dyEVlVdU+COXyXMDP1+NnTEXeY7AFA2e6qCTWUQ5z7k+dZT0Re5nlHIZ46Yz?=
 =?us-ascii?Q?EfCSz54DEBDxumdLeERCxBZgQgHuRaON5ehvA0lI89HKKBGtSL8v346cxzDC?=
 =?us-ascii?Q?4JuWOPC3qzU0O7sFrZZR+POv2H7SVsHuZsyP1W6cJLCIIWIdVrq0KHB2M5qW?=
 =?us-ascii?Q?YnzlxRtOgmJcfaBTFwhVogw38QliI+Y7GalH+GKczkW2fMyhrj1KZLx/tJkF?=
 =?us-ascii?Q?k1vN6zefws7cAdKkjHroEY8+JMgNCv2U9xR334p6tu5ZHOHwl4qhWs0D9QID?=
 =?us-ascii?Q?TPMxZNcIzATllPu5gSELgqCQOGzbT7RVo2GV+C21Rm8rFyjW5/CXUC51O7ql?=
 =?us-ascii?Q?+h3Sdz4rONIxnyXSODDeGTs1D5iH9sgAjx0kQeWc9m9axIyqlWsp0aMMMj3A?=
 =?us-ascii?Q?QUPiIC+iUdtz3tU0//OLYRAR8ROs4ez8Efxi5j2VZmvkz9qO1qBdPndShFsz?=
 =?us-ascii?Q?2ka1dyf0fVVmtd5llRnJSteA4wKzSKEnv82/cv97ksMGHBRWmu8HtEu1kzZF?=
 =?us-ascii?Q?gcsRP7blpr0HSyHkPTWmOvFU8bQxjJH0QviRb1+DLt7MHWMC/qKs49+T+KB9?=
 =?us-ascii?Q?e1y61cfGOA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB4818CE98623835D9F3D61A65801B2CO1PR11MB4818namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	csYoZ0UwFsMvvr60kf4A8L9liQjt+nLBCafKgtTBE7sk/TU3CmAKxpcYGv9OSsYz/Jpu6Zbvoe8KVhh7xaMD+55SMYy7mDSt8ptD8/rfdkP/G6jnGZkvwpM+VdNKuf4NqUn34YzVeU2FGinS478u59VrWQcKVhKDG9POz34speber4gp8+MI53SyIuQAwks2YXKN1LKRSpzKjXG30GDuIygsw7Ju3lrjAufXlRh2cmvU0X9QxvUPqjzBZVDaMgiROQcOqmQVX4skinXzMaUziyTAzr6T5anzqETJJUaxoaQAl3muUJMmbAjL2myLdR6MEllNikilICr/Z6xld7cIMw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3497877d-648a-4d82-6182-08dec7959124
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 08:43:53.1693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9PN6T9lraNVL+dyfHjPmpzxqbPfs3ucjxfirMyjCNV3DrW+pWL1lHKgNOl1TN5J/sCTssXQ0CmI4Q+nZ45JH4IEZWlLfS7IgRIosnMLcApg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4NSBTYWx0ZWRfXwJiLGPjYBTcl
 5Rep85LYqSSOxTEVdtJ1aTY5iq8d6yObxaXqLi/ATweO2tokit2I5FaNsHhIV/riS+2v7Wuvxii
 2HQduO4qgqom+/j7qY4bIF0tQJF66sDdgSkmbkpblpi+/7Z+znNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4NSBTYWx0ZWRfX7e6yNMe3VtLi
 IRF6qgzjq9PU3q5j91DH/EN0sV7/pFhB3fuJ0KGYYA4vaPae3xcZ7YqH54i+ss5rTjd6u8FxseX
 Tq00hdMjlCTNb9PZDaywqWB+h/H6Svq08WDG5oTV9ULZ95Z2QPrHEevB47eoWl+7ZVmIvxW+Ivv
 +B8beOhbAcZjgNOfrSuLW4lXANBUp5vaNVru+vcafg/iJnogyRXeTY1+8406oHXYHymek0bAkd1
 gb1cm4AP4jaih+5XnQsVxB/NsGJstmRp5OQbbg89h/yP+avD2Tpqbz9kkY+7kJAS/bRRwiIWo2F
 Bvc5/+MZ8iENtZWepc7VhI428BYNTV2bTtvi6yiEUsrBY2Iu0qdKgEvVjjpgMnXb3saj7zmBT29
 RxmMml4FF1tkOGZv7hJyaFwmH360AkeK5tUIWBfB3k1HSfPwOY2/uibIuCBOd/2V53euF4enXBc
 0qt2XJzMMQcTf7rJieQ==
X-Authority-Analysis: v=2.4 cv=XujK/1F9 c=1 sm=1 tr=0 ts=6a2a7550 cx=c_pps
 a=msEVGK6UkFBbvU8JCjtEeQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=CjuIK1q_8ugA:10
 a=uz2Jhi4niLbJoDgm:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: LsigSsJDBuIvSA2-wRGDhiwsyHa_kZko
X-Proofpoint-ORIG-GUID: AO959Ay8FaJ78g80ZlAA7DMZY1QmeMMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238432

--_000_CO1PR11MB4818CE98623835D9F3D61A65801B2CO1PR11MB4818namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the feedback. I understand that Pending patches should be avoide=
d
for new features.

I'm withdrawing this v2 patch. I will submit the fix to six upstream first,
and resubmit to oe-core once it's accepted.

Thanks,
Shilong Jiao
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, June 11, 2026 16:36
To: Jiao, Shilong <Shilong.Jiao@windriver.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; openembedded=
-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, 11 Jun 2026 at 08:33, Jiao, Shilong via lists.openembedded.org
<Shilong.Jiao=3Deng.windriver.com@lists.openembedded.org> wrote:
> Thanks for the feedback. I agree that submitting to six upstream is the
> right approach. I've prepared a patch (attached) that fixes the test
> order dependency issue.
>
> However, I don't currently have a GitHub account. Would it be acceptable
> to include this patch in Yocto with "Upstream-Status: Pending" for now,
> while I work on setting up an account to submit it upstream?
>
> The patch is ready and tested - it just needs to be submitted to:
> https://github.com/benjaminp/six

As the patch is done for the purpose of adding a new ptest, and not to
fix an existing issue in oe-core, it's better to first get it
upstream, then submit to oe-core. There's no rush, and adding
'Pending' patches should be avoided.

Alex

--_000_CO1PR11MB4818CE98623835D9F3D61A65801B2CO1PR11MB4818namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for the feedback. I understand that Pending patches should be avoide=
d</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
for new features.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I'm withdrawing this v2 patch. I will submit the fix to six upstream first,=
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
and resubmit to oe-core once it's accepted.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Shilong Jiao</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Thursday, June 11, 2026 16:36<br>
<b>To:</b> Jiao, Shilong &lt;Shilong.Jiao@windriver.com&gt;<br>
<b>Cc:</b> Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt;;=
 openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.opene=
mbedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] python3-six: Add ptest support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 11 Jun 2026 at 08:33, Jiao, Shilong via lists.openembedded.org<br>
&lt;Shilong.Jiao=3Deng.windriver.com@lists.openembedded.org&gt; wrote:<br>
&gt; Thanks for the feedback. I agree that submitting to six upstream is th=
e<br>
&gt; right approach. I've prepared a patch (attached) that fixes the test<b=
r>
&gt; order dependency issue.<br>
&gt;<br>
&gt; However, I don't currently have a GitHub account. Would it be acceptab=
le<br>
&gt; to include this patch in Yocto with &quot;Upstream-Status: Pending&quo=
t; for now,<br>
&gt; while I work on setting up an account to submit it upstream?<br>
&gt;<br>
&gt; The patch is ready and tested - it just needs to be submitted to:<br>
&gt; <a href=3D"https://github.com/benjaminp/six">https://github.com/benjam=
inp/six</a><br>
<br>
As the patch is done for the purpose of adding a new ptest, and not to<br>
fix an existing issue in oe-core, it's better to first get it<br>
upstream, then submit to oe-core. There's no rush, and adding<br>
'Pending' patches should be avoided.<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB4818CE98623835D9F3D61A65801B2CO1PR11MB4818namp_--

