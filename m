Return-Path: <enoch.ng@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B73AC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 22:38:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10306.1784587101492583821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 15:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ROgSg8G7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1661e90cff=enoch.ng@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KLoIiW964592
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 22:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=p1xMVv/Sxi7mpu0thJmkGa
	Qj34NX3nyVbLw1kWf0mmk=; b=ROgSg8G70NopBAY05/PT2fNDLWiY5rZu3prgNI
	BTDxLqooyHseIH1gihu0+k6EEM7op2lhMgDT1e849M4hmdCy8R8IcAQ3aHoFKERN
	Be8R8hYaF7/6qEKBVg4ctRVk+d2EZaStS8NN9MtRsA4Q0jiIi/jwPVpxJxxEp7S8
	7G0oT5ZDli1gNSISHNolyogDpystcL1GClUgYgNjtDb1OLvYuo/smMvLj2aAJxHh
	3yoP77O7tKbH/QaaHQD2ly3w3KEys08ghH9YvxVzBcxtoqB/SG1qMy9Yd65/li5q
	4nMdLkEa0XQyizHVY5oMY2nAVxJREJ75d3q0CJ6NqoZIOijQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg0f5bsvu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 22:38:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1vI5y2IxnR3evFfa45kgj6DrHtVZZB+ABtNc9oEGzeyY9HyuIQHmpRGkt7fZDQvlQn+wBMqCC0CcXA2g3kemV5jlG+crHP2rmogKgyBfh0r45HtgZN2D7wSWPMMjQIPc5JL5/vshyh7+VC8jPdHQF+QaK0IynuZG+GtZ1Qu+GGS99t8+rShSOKDUwz+hS0OTeqBOTr1axcNIEQHSYvUsGgS5bO8+MhSyNkEvQiAPj7ILIJO2ehCONeGd6QPJSk8hvZ7+v2J/Or5H7XliwU14d/MfYwEB65mN1Lk8cmQk/GIZRjSixpskAKYFtEWoXPV7UvBzpsAaBSaq504oGM52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1xMVv/Sxi7mpu0thJmkGaQj34NX3nyVbLw1kWf0mmk=;
 b=poKvomCL7/8m59DmLOZLxQNmy9/wCIZvPDqLmi92N9yU6bUs6ent0909nj4k7ZG/IC/0D8pzldC5ETyjIvNvjj+kSZ3Moh8Gq/qIKBxHa2T7ZSlBDZvJXbzTFa8/ApUBGGcXmTfOC/pD+dDJngXW02DZXoU8SxbH+3aYx4cxj0Rs1ai2Bz2zlC3i6RetWWwE+cMELC9n9YmMULG+krHWgj77XCxLTyilTrPMEIlsutuA6jmAlEo5hRRrdOlG6fCZwLZLn3kBW4i5T1CaMdk6D821849NRQ1yEA4PtmybO+/WFPw/0EjishF1Af752Nsu2Uu87vJHt1sElLvBtvJMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 by CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 22:38:15 +0000
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e]) by DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e%3]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 22:38:15 +0000
From: "Ng, Enoch" <Enoch.Ng@windriver.com>
To: Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] libxpm: upgrade 3.5.17 -> 3.5.19
Thread-Topic: [OE-core][scarthgap][PATCH] libxpm: upgrade 3.5.17 -> 3.5.19
Thread-Index: AQHdFS7rfLD+CK+tK0aJhD2xgYsQx7Z2E6iAgADw8O4=
Date: Mon, 20 Jul 2026 22:38:15 +0000
Message-ID: 
 <DS4PPF10012BF968B6918999B627C4DADF593C32@DS4PPF10012BF96.namprd11.prod.outlook.com>
References: <20260716142529.2686271-1-enoch.ng@windriver.com>
 <DK38U8J7M0EP.H6R91H3OQ454@smile.fr>
In-Reply-To: <DK38U8J7M0EP.H6R91H3OQ454@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-07-20T22:38:55.640Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF10012BF96:EE_|CH3PR11MB8383:EE_
x-ms-office365-filtering-correlation-id: c7226ecc-667d-4301-3c45-08dee6af96aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|38070700021|18002099003|22082099003|3023799007|8096899003|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: 
 Bn+WgQ4AbTfei8h9p9UUxkr89LvkC/pLDik+pCyA/TvNLn2dHYE6JmTyWbAGSfwa5MEc/emoxGlcsCqZS/mWMQZHMznHVC88ZnW/Z7TRRX7whjQACb2P7wBshJ6IlnP0/7oPF9aldXSo1nrnxiIsbWScZXeuYPe71b3nlmDVjOKwlvfXJ5aJ1y1fNtqQ8/JQKZahjyD0jCDcPrlQRAWFanLA/wazMGXxAR/vmzPW1K+M1MAViV1AriktwPWbaV6IrG7iN33y0R3JHhGwd6f+WrECAHxxVbZ9rfJZcD7C8/KGGw6KjAAALE2O6HDDWKDx6TmqqS+fUUeNBWbZIoJ8hHNMz/S26Uy2qY6p5c3f3ojjNOefY0nrhDzGdBpSwxYSW4NdtH99jW6i02r8i8PZhtwO7KCk5W80zF+wRWioQBz+iHAQmTxMEynTlBgsn7oAaqRrUZZd4O24vaRsN2aNbHGjZ0lkboMf7Wvh3nUawzD8t1e649ZrDkKCfjVRr698Oj4rXlDBd0k2WHV939mx9axVEnDeQOcXBgiKPxIAh7V61w3ojVwDQRYOJQy9L4rHKO+N+hgZdiuvTZgbv4qcIXqvkFWEbjvgbAT4/OVKL5MpAsRkWT9LZDpK9mbJiI0CJqfKrt3Zxesqn/SP8Uvt7Gpl8Aw8bVzQ5kJbKdrgSFWpdufLWmkUUeLVM9rKU3ilK0aaYxwSRtAwxGJ9UMEgxw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF10012BF96.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(3023799007)(8096899003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?TDagEhNSsDcoauoFBsQHc6pm9WKy0Z+G0n2EQTYKhCL/RgNZevi9h/pyUK?=
 =?iso-8859-1?Q?Hin3ieDI73OQSpQUysejtvXIgjUMICCYO6iGb30wHwxUiwE1uurKqlJ7o3?=
 =?iso-8859-1?Q?QaT0n5AyoOx/sMFyl48WQpOCxbMKNVuWW1Q8VuBDbM/HforKpbbXOJM9Pg?=
 =?iso-8859-1?Q?fAqS170fZch7AFHAZMeU6b6c4xYHObyCbrlVDl3jG7z2VkgsT6l44BXSLp?=
 =?iso-8859-1?Q?2AZWPuM79TIti36hpWQ31nErPHObyPFw3wYW/k8UtLotwwBBNOJqvF+s0l?=
 =?iso-8859-1?Q?NPGzV9Fn5jF+9MvJuAjveK9l/5nTGfW3qHQswFVRe78aewtNN5yu9kjnMy?=
 =?iso-8859-1?Q?OFK3jaFHFwUGCd/X0sQ8KClOQPpm3bychCJls0RyjwGQCWYQa7x8c9UaXI?=
 =?iso-8859-1?Q?X5B9A7zo3V7yGO4UuF0l51ba/tp7zqfWY1JliUXpAyQyexVddjunPdbUVo?=
 =?iso-8859-1?Q?DkYp3kXKROWqINqaEXojzpiXPIlw4hh0lduHkWxz5fOlxgiRGAP4QlmTZ5?=
 =?iso-8859-1?Q?P5C0br3AUa1eYEBkqnhflW5nwtsyvWp3biI7u1IGu/zixKUXWqTzRU+voy?=
 =?iso-8859-1?Q?UbsagSk+HnURU1jVUBPUSQBOdLhCkP1HF+NLZ8NpcEYG99fpw+0GwT+xco?=
 =?iso-8859-1?Q?ZkjbtSDEgrwLRFwqfk9tj0/qikuTjxSn8UuSeUZanJmv4nh1UqHQXefEmn?=
 =?iso-8859-1?Q?9Bt7YcMcgBaqXtvgTVEx4M26KZdeShwwWoECGzJKizbSzbpKuZ1hvaGrdV?=
 =?iso-8859-1?Q?CFWS0t4T120iD8LVcH+I7aeA/8wiDwj6+zvZsfJns+HCDGHARQ+QrznBTa?=
 =?iso-8859-1?Q?HqaOw78vchvWk2SeTVWVJogbQhi8cq27siR39k17k9bC4v0oG6uPQ9fLsc?=
 =?iso-8859-1?Q?/5bvcmy7Ni2L5Zguz5Aq3BHOIvY8Pze8ojcG5t1RmTR26OokEkq2dPWnAg?=
 =?iso-8859-1?Q?b18GaC5mS+9pw02GXqn6mHOcb/7eh96IqbnJt/gAPCVnk6VxM9lI2ImLU8?=
 =?iso-8859-1?Q?tapOBrfgiak/D4BbyCGBErzxqz6k0SBM+HAHMvScsUlU5xE26PruVhClSt?=
 =?iso-8859-1?Q?FkZe5rQm9lmcrdfp3OW4l3Xn4brwoOB7zQobtqdQ3ybeMaYum0Or/O4srn?=
 =?iso-8859-1?Q?rE408YFcP4V4Yq2PioLa2ML5pLFkvqsI9N9uSIJHj8axi6c5cXS1cId2bO?=
 =?iso-8859-1?Q?SXtr465XhHVJhlpaiX8sanPTFntcZzRpl94orBnLUh2AbWYy5Dm+VhzACV?=
 =?iso-8859-1?Q?9fvFvLSFxmgU9oaqE3sxczQhf535QsJ+7r1NdN1EM9OYwApMqx7D8uxnNy?=
 =?iso-8859-1?Q?82ZwQ4XryTLv/PE2ffZzNX+qzpS/lFbn/eIycOp2Vd9ImH/aHUpC4Ne9UN?=
 =?iso-8859-1?Q?OqwN9A91/PxI2x++dQ5MRYXdjfhz9PK1VnnKPcJcJCeDZoVthrqx+zRZEC?=
 =?iso-8859-1?Q?8NGftWG3u4jTeBSHGE+bnx83uvofl5CnjpYVRbyPCbh2RpdM1sPp56veGM?=
 =?iso-8859-1?Q?M6d88+Bmscz3YuzK4CvQMVL5Ap3WBc8ZM411Ftg8T4UxJ8A/tsB9O04f5z?=
 =?iso-8859-1?Q?4UqQeQ03UJdnRuBAZ4coIy3msLk58D+kmC0PNFZBaNmJum6XW7i/vsVsxD?=
 =?iso-8859-1?Q?JOXLcOH2A3ASXhjXG5tO4KexcX/6sO9+W9NJOqFHAanFq4iiasSe897TOJ?=
 =?iso-8859-1?Q?Qpv7F9NnHWzWDLMibdDhWx0RVV8LfAC4iLFE3UMDcxcdvJb0vKNdPU32ud?=
 =?iso-8859-1?Q?NnC+jaazTu2H2AQAC3nTxeViwQjd477XoN/PJ3uy1fbr19wP18Z1r2QHez?=
 =?iso-8859-1?Q?RuCTUCacMA/lX5M+8c5CsUwhHAVxIbieH/ES2p/4sglBcQisu6XjVGF+V4?=
 =?iso-8859-1?Q?VJ?=
x-ms-exchange-antispam-messagedata-1: Hfj9A1iVQIPAEQ==
Content-Type: multipart/alternative;
	boundary="_000_DS4PPF10012BF968B6918999B627C4DADF593C32DS4PPF10012BF96_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	fFjBoR8J8nLMPOWGWKLhyMGuWWF7MjW6/G76kQzx6bLozj2EV+jqTQnn/Zc7fg58Mnts8FS9XIrPTFNTT0+LGI9LOmAhg7DRgvYUgvWgxInTNh5S3GHYSffPKxxUErrIIbFQMz54FJ05ezzNfWH0vO3A5Rd8DqKFE87kli23aqd2Dziri899ZHOo09onxXoV6BPF4yEWm/mJGWazZ/e5jIEEMnKJ6+z6sTK5THy3u4/kvQn0mQEAcE87em/pAY31sKfbEsaYzb87Guu3t9w198clG0awCv+Tk+yhIRAoGMoEBssNQHEvHKlvdhZ5CfQwzpQNkUDyGzVhU99z7c0sUg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF10012BF96.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7226ecc-667d-4301-3c45-08dee6af96aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 22:38:15.4490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q9zCzb5syxi0l+34U1CDZNw9MhMs+6kxTSLZxF3ABkMb+w/s2iLO5eC2Ltglji9IxIFMki2v8gwj4oFGubKQBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8383
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDI0NSBTYWx0ZWRfX7qoQ2fvdoGDQ
 wgifeLi2NWopwW9c/Pgg2PkhkjrBzm8QiCe8bZCsWgzAVp9v8pqMeWVsRNqRGncPv0GyersnaZ8
 NyRZM1m5tbbBAYsuJCPVSvF00z7K22E3+RopBY7YaaGwog7JA//eWWUEzaUQH0ymjLr6twAjAzL
 NN/PWhtWq5iEJ5wFBFKdRZF2anxg1tg+i/2GJokbPPliGa4LW3KcS30jQ55OpkbobEv94oVYsvk
 tCGXWvDjwx9hll9MLLRGZ9D4aGIaUtLCuNJTRb0ld3WFCn/r5os11t+5qEfsD5ywlL03ukkVr1+
 0B17UH85zOpun2ONcHjW3odJyQNUwUtnXHgp/CoR/xGCKJhzbt+3rAK8I+N1gJL1WwM6o2Vbz5I
 Q6Nbq1Xx5ZUdM7dud/o36db5w2fJNYLcNsSbAn8CdoHcoFMfG5n7Rf/kyI48Z4XgIXo3saFnV72
 hoZjAvxrnEauOlsFLwA==
X-Proofpoint-GUID: 4vry8E528c79dopItAQE0OPGfDaX6k56
X-Proofpoint-ORIG-GUID: Adqn7pBHAz58KS2ILcmVUjj3uKbicdTL
X-Authority-Analysis: v=2.4 cv=IM0yzAvG c=1 sm=1 tr=0 ts=6a5ea35c cx=c_pps
 a=XSpaKd7YU/jha2kVJ1iHgQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8 a=P-IC7800AAAA:8
 a=7CQSdrXTAAAA:8 a=ag1SF4gXAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=wPNLvfGTeEIA:10
 a=158y64f66g4fPH7h:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDI0NSBTYWx0ZWRfX4O3CJdMpAdu6
 2MMzK2XQBphy9YsuBQl7hZ5ActKaV7BJYReGEEokk/O8EgGpkTX1z/IFZ+fwU4thwdCHT9BKDtz
 M/xhJWWNfB3ZOSRY2kUQbKgGzjgGY1K3fAuhRIOIlZdgDc2sgioS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200245
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 22:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241492

--_000_DS4PPF10012BF968B6918999B627C4DADF593C32DS4PPF10012BF96_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann, thank you for your feedback.

> I disagree: 3.5.18 is a maintenance/cleanup release with major code
> removal (even if obsolete) and I think this is not compatible with our
> stable policy.
>
> To fix CVE-2026-4367, you should backport the fix to scarthgap instead.

Understood. I will submit a new patch to backport the fix from upstream lib=
xpm to scarthgap.

Thanks,
Enoch Ng
Wind River Linux
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, July 20, 2026 3:08 AM
To: Ng, Enoch <Enoch.Ng@windriver.com>; openembedded-core@lists.openembedde=
d.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] libxpm: upgrade 3.5.17 -> 3.5.19

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hello,

On Thu Jul 16, 2026 at 4:25 PM CEST, Enoch Ng via lists.openembedded.org wr=
ote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Squashed backport of two upgrades:
> 1fc25a668e libxpm: upgrade 3.5.18 -> 3.5.19
> 767f686226 libxpm: upgrade 3.5.17 -> 3.5.18

Wang did not author this squashed commit. You can reference their
commits but if you majorly modify them (like here), you should be
author.

>
> A vulnerability in the `xpmNextWord()` function could cause an
> internal pointer to read beyond the file's end due to improper
> validation of file boundaries. This issue was fixed in libXpm 3.5.19.
>
> The changes between 3.5.17 and 3.5.19 contain the fix to
> CVE-2026-4367 along with other changes that should be safe to
> backport as shown here:
>
> $ git log --oneline libXpm-3.5.17..libXpm-3.5.19
> 9a05472 (HEAD -> master, tag: libXpm-3.5.19, origin/master,
>         origin/HEAD) libXpm 3.5.19
> 5448e1b Fix CVE-2026-4367: Out-of-bounds read in xpmNextWord()
> 5b7e903 (tag: libXpm-3.5.18) libXpm 3.5.18
> a5549ac gitlab CI: drop the ci-fairy check-mr job
> 10070a4 Strip trailing whitespace from source files
> 5679dd6 tests: poll for stable compressed output
> 7ce3959 man pages: adjust line breaks in source files
> 60ee362 man pages: remove .PP after .SH or .SS lines
> 3ba5d81 man pages: ensure .BR macro has multiple arguments
> 3aa8a1e man pages: make indentation arguments to .IP be numeric
> 854c23a XpmCreateBuffer.3: editorial changes for this man page
>         [Debian bug #1102886]
> b7309b4 Fix build with current Windows headers
> 2803929 Use _stricmp() instead of strcasecmp() on Windows
> bdb6c75 Remove xpmstrdup fallback for strdup
> 73b69d7 Remove xpmstrcasecmp fallback for strcasecmp
> b30fd09 Remove ancient port to 16-bit Windows without X11 libraries
> 0224b43 Remove ancient Amiga support
> b72af4e unifdef VAX11C
> 02702c2 unifdef sequent
> b4e2177 Remove outdated ifdef checks for including stdint.h

I disagree: 3.5.18 is a maintenance/cleanup release with major code
removal (even if obsolete) and I think this is not compatible with our
stable policy.

To fix CVE-2026-4367, you should backport the fix to scarthgap instead.

>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
> ---
>  .../xorg-lib/{libxpm_3.5.17.bb =3D> libxpm_3.5.19.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.17.bb =3D> libxpm_3.5.=
19.bb} (88%)

Regards,
--
Yoann Congal
Smile ECS


--_000_DS4PPF10012BF968B6918999B627C4DADF593C32DS4PPF10012BF96_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">Hi Yoann, thank you for your feedback.</sp=
an></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;"><br>
</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">&gt; I disagree: 3.5.18 is a maintenance/c=
leanup release with major code</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">&gt; removal (even if obsolete) and I thin=
k this is not compatible with our</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">&gt; stable policy.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">&gt;</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">&gt; To fix CVE-2026-4367, you should back=
port the fix to scarthgap instead.</span></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);">
<span style=3D"font-size: 12pt;"><br>
</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">Understood. I will submit a new patch to b=
ackport the fix from upstream libxpm to scarthgap.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;"><br>
</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">Thanks,</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">Enoch Ng</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">Wind River Linux</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Monday, July 20, 2026 3:08 AM<br>
<b>To:</b> Ng, Enoch &lt;Enoch.Ng@windriver.com&gt;; openembedded-core@list=
s.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH] libxpm: upgrade 3.5.17 -&gt=
; 3.5.19</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">CAUTION: This email comes from a non Wind R=
iver email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hello,<br>
<br>
On Thu Jul 16, 2026 at 4:25 PM CEST, Enoch Ng via lists.openembedded.org wr=
ote:<br>
&gt; From: Wang Mingyu &lt;wangmy@fujitsu.com&gt;<br>
&gt;<br>
&gt; Squashed backport of two upgrades:<br>
&gt; 1fc25a668e libxpm: upgrade 3.5.18 -&gt; 3.5.19<br>
&gt; 767f686226 libxpm: upgrade 3.5.17 -&gt; 3.5.18<br>
<br>
Wang did not author this squashed commit. You can reference their<br>
commits but if you majorly modify them (like here), you should be<br>
author.<br>
<br>
&gt;<br>
&gt; A vulnerability in the `xpmNextWord()` function could cause an<br>
&gt; internal pointer to read beyond the file's end due to improper<br>
&gt; validation of file boundaries. This issue was fixed in libXpm 3.5.19.<=
br>
&gt;<br>
&gt; The changes between 3.5.17 and 3.5.19 contain the fix to<br>
&gt; CVE-2026-4367 along with other changes that should be safe to<br>
&gt; backport as shown here:<br>
&gt;<br>
&gt; $ git log --oneline libXpm-3.5.17..libXpm-3.5.19<br>
&gt; 9a05472 (HEAD -&gt; master, tag: libXpm-3.5.19, origin/master,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; origin/HEAD) libXpm 3.=
5.19<br>
&gt; 5448e1b Fix CVE-2026-4367: Out-of-bounds read in xpmNextWord()<br>
&gt; 5b7e903 (tag: libXpm-3.5.18) libXpm 3.5.18<br>
&gt; a5549ac gitlab CI: drop the ci-fairy check-mr job<br>
&gt; 10070a4 Strip trailing whitespace from source files<br>
&gt; 5679dd6 tests: poll for stable compressed output<br>
&gt; 7ce3959 man pages: adjust line breaks in source files<br>
&gt; 60ee362 man pages: remove .PP after .SH or .SS lines<br>
&gt; 3ba5d81 man pages: ensure .BR macro has multiple arguments<br>
&gt; 3aa8a1e man pages: make indentation arguments to .IP be numeric<br>
&gt; 854c23a XpmCreateBuffer.3: editorial changes for this man page<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Debian bug #1102886]<=
br>
&gt; b7309b4 Fix build with current Windows headers<br>
&gt; 2803929 Use _stricmp() instead of strcasecmp() on Windows<br>
&gt; bdb6c75 Remove xpmstrdup fallback for strdup<br>
&gt; 73b69d7 Remove xpmstrcasecmp fallback for strcasecmp<br>
&gt; b30fd09 Remove ancient port to 16-bit Windows without X11 libraries<br=
>
&gt; 0224b43 Remove ancient Amiga support<br>
&gt; b72af4e unifdef VAX11C<br>
&gt; 02702c2 unifdef sequent<br>
&gt; b4e2177 Remove outdated ifdef checks for including stdint.h<br>
<br>
I disagree: 3.5.18 is a maintenance/cleanup release with major code<br>
removal (even if obsolete) and I think this is not compatible with our<br>
stable policy.<br>
<br>
To fix CVE-2026-4367, you should backport the fix to scarthgap instead.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Wang Mingyu &lt;wangmy@fujitsu.com&gt;<br>
&gt; Signed-off-by: Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin=
.com&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;ross.burton@arm.com&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&g=
t;<br>
&gt; Signed-off-by: Enoch Ng &lt;enoch.ng@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../xorg-lib/{libxpm_3.5.17.bb =3D&gt; libxpm_3.5.19.bb}&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&nbsp; rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.17.bb =3D&gt; =
libxpm_3.5.19.bb} (88%)<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DS4PPF10012BF968B6918999B627C4DADF593C32DS4PPF10012BF96_--

