Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B59ACCF9F8
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 08:15:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21657.1761812123779725781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 01:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nKRItCOU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3398b6bac8=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U51lwt1059023
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 08:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=jvj6qCm3V+DNKYP0jqU2r2c2XzSJAkdO/ZBmlKbfWTg=; b=nKRItCOUWkX+
	Dp1Kz+UlGwA+DB/FrOX28fflYm0NibGG9qEbUNyupPsPMCP4hxnpqUTrYwf6FZ8b
	ZO6cq93OCpRVTHRRDuTqYvCYkAnU5GjtXzFZgqu/CZnlgQLV03jJ5BxliS43FeHF
	6/KkQMpgbDcYh0Dl46VIa3V4irjxJ+ibRK6E7stCrXIIBnMDraljcyQYpHxnU005
	TbAGB8wgEUPZSs29JAmEuDgKOIWE1ei/JqWZ0mZzuJJ+L7nKvSZCdxYKrOVUbXQe
	ufRXQyhEQ4y46feNjEbUgPcQbgAiKkM2uISbn7d6H1Hwrhdn414YzCHwWrw2KmZ0
	aCLNL+7Ppw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3w9gg9qt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 08:15:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QILo/69zdQOcz6Iy/cGhmYfb2LfDlYwCNgeJWdMWcgiirkNzW08C3QjA09VZYPvGYUkX+cetb2fWSSCUMCj/ecAc9vghW909gw03LXwW6bQG822/EDWcu2o6S5muuGSbE+aPkYPLQuhIFjApygHjvHWzk45LmqBWG+PTICZHOEoveWVPguQl2gyD7gvR9p9bkhkK9Percnhvta92lRFD3wWjWBqPYdK9Fqw1mYUXZ4KBmiqiOkhmNHmAMwtLFjt1EmVD3LbExq0QpdxJdpt5hNRY9U378JrRoyxT+IxxfNepFrdjJ27pT8nVuzTP4ZiaIWOMmKLrhqr2H8dEX4phAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvj6qCm3V+DNKYP0jqU2r2c2XzSJAkdO/ZBmlKbfWTg=;
 b=yoAMDiZlXW8lSKG6ZU7vAutYvoSlSvP7nI6NMYbiwxuZB/NqYFW2be+PKDPxMqsn4NelFXAiAiP95W5I3vkmHOl9jcls4Uszlfe920x5FLFTxypfcmyZ7JT9sA0xDkpbMogX2D185ag0YtX1e4kujsrQ6aKNybCs4S0eOjen/A0NIMp8qsdkWe6x+O7qO16U/bozeKAHlbrqVgpvY1PFarOKgmZ9NNkfW/JahGZkbVVC5XiknHrP6ksvUJOexKxg8oNusFQZbB8dCa4ff6Ircifz4BEXtIUBtagksD4t0V/wumedU/6Irdatg5+F83kFhIVtbZD6Tpc0TP3GeQNCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 08:15:20 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 08:15:19 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] cmake: remove GHS-related files
Thread-Topic: [OE-core] [PATCH] cmake: remove GHS-related files
Thread-Index: AQHcSL6b2GOCQW1EMkap2wOF765s7bTaWKbg
Date: Thu, 30 Oct 2025 08:15:19 +0000
Message-ID: 
 <IA4PR11MB9420D948124389DAEA3DE879B8FBA@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20251029062027.836131-1-jiaying.song.cn@windriver.com>
 <DDUQGE7BT02Y.13NB3HJGHC7RQ@bootlin.com>
In-Reply-To: <DDUQGE7BT02Y.13NB3HJGHC7RQ@bootlin.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=c899761a-3be6-4247-b76d-791b21af6c6e;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-10-30T08:13:27Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|PH7PR11MB8527:EE_
x-ms-office365-filtering-correlation-id: fae66010-5d2e-462c-9052-08de178c7752
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?krpkXX13WtIHfS/XgDaS+ytqiScIgkFOd4XtUB9725dxq+2BWQqvvol4fK7x?=
 =?us-ascii?Q?0xasYsP56CdQdqtdiUJkgsRQWuL3UfvLCDniH1oGuPrE4UVka9MeZCOUIAJF?=
 =?us-ascii?Q?vnjWmjMVul+CzPLF+hZ8IZgYBnLCuRzLNDOWLtD//Ridq2fCXeThwLXmFwpv?=
 =?us-ascii?Q?zz0vVxrkZGLQisZWWwhNKM14N4zsMfSK7UI7L6D5cwJFSNtEzbKclU+yI6uO?=
 =?us-ascii?Q?hMEmjSVB79KxtVkKBVHVkx5mvqHazpTu63wkAEbUPRRj9ZpiZwbeu4yNlGWL?=
 =?us-ascii?Q?+sASiCdLtoetuf3G/95MVpBDxUSuVyqqALZj86xzPP0cKgynHGVxWzIqH7P/?=
 =?us-ascii?Q?fDJnXKjGBCKjPr9WxZbbn+gyhyc6gGwIgWvj99EHjS8ctIGqczlh14FLGZVM?=
 =?us-ascii?Q?emz4PoEiKD4h4+MnLBBkLCcJVHN8r94iJ58ZOI7iof4utXMHQkEh+1Vqiqt6?=
 =?us-ascii?Q?o4Iqu4JbsSVyz6RLIPGDQXe9ClYWME4Z0XXKR4/A7AefpWbWefYpt2k2y8aG?=
 =?us-ascii?Q?SnL/94ZLg4udkAXE7Ugwnb4qoT0ssOXQiGQ1sW1+SxcTStoyzaf/TE2ZDLk3?=
 =?us-ascii?Q?Swllw6zajaHy6UTm7ysCqDRjzDE6M0d9cDgP3ReDRYumIf42REgRTEXDFlFQ?=
 =?us-ascii?Q?m4XINhjE9jAmY3UX5CWEdrqb8CspQgTdqKploe6p7DdhUxuQBwrz/rAqXCiV?=
 =?us-ascii?Q?ffpEIM5SMhHp5CnqWSIArowc6z9zRi/wbtXzvjfWzpmQ3TYZ49DDlZ29cTeO?=
 =?us-ascii?Q?u8/R/23pxHAKEwlqqleD2wzF34EOCCJVTc+pJzeFwV7IDjdgIeTKIB+zHHTG?=
 =?us-ascii?Q?AS7SzWlbp+aQlIoS4z7Sq8WJgy3JdsR8dEOLcWLngUwX3ibu15YlOSjjXIXo?=
 =?us-ascii?Q?repaQRT+evPcs4PgupM7nnyb3PwE5EFSrRn5c7RCcBLUgwAKdve4t9ZH1zf8?=
 =?us-ascii?Q?veSeUBgJo0R/qKflJ6uKd8+RjhdXySU8ZxheH9uDXItS1qtCvjF2fr5nspZa?=
 =?us-ascii?Q?hkiP2hfh+EYkQ1Ca7O5ELCzBnsOSFdarPHFJpTlFeTeBMPx+gzfzD48jvg2a?=
 =?us-ascii?Q?CfrJFp6YqkrE1RMX/ZRe8LqXWD0G97/UpsuV1P1D7sqK+Jrin5oWE99cHreE?=
 =?us-ascii?Q?zUKx4HzKimSm3p9FX29VBUEAoaZfEkjL2spII3i+6YxpZ4su7gQbJOLNkPC8?=
 =?us-ascii?Q?Mw1gXbo996J+nYfm5Z4sZyfHq5Cn666KgtRru+7JWntbrutHZxB45oLbQI9C?=
 =?us-ascii?Q?QQRl2hQfglzPAAN4NJAtTQob5UOKzk7Xv43LUGSM5eJH4Vk5Uw9t3K2f6US/?=
 =?us-ascii?Q?VDEbcFLlgb+4uo6wmKs4u0Afm1A9FHPC8LC7BZ8+x5ohi2RlzHyC47pHrTgv?=
 =?us-ascii?Q?ZeNswDVIsjhBe6Qva4qzQeZ4iXDu7FmXcEBsTWNyHDl7NwsISf3TLgJX8sOQ?=
 =?us-ascii?Q?UhQX01CzQt5Fgpb/SEBl5HA1rBo9KNcF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?q+vowDXV0TDTF03T4B8ClGAiyb8lJVPF/qSk1oakyEGTIwOxEnTeicMUaRn5?=
 =?us-ascii?Q?XxRttPJEOLO3peXDg5QgikQl5XAiRxM50sLbd0WeuLnV3syvRb0ErSV9NO1o?=
 =?us-ascii?Q?BQH7lx1a1qD6MI3Nnj+1bMc/Jo41ogeuXDZo/+aigjSbMnySSmKHy6aMoBcC?=
 =?us-ascii?Q?ozDqysDqEEh0boZ/2lRIZ2zZsib6pc77qZ72TuwnqluGst9bZI365MUZYQpi?=
 =?us-ascii?Q?OrX4Lwo9q+6C8AlZsaWWdmIpIkDup3LudNa0knYNeNIs+zUH/42xBHzt126u?=
 =?us-ascii?Q?S3DERo+LWC4abpU7ub/1Z8KKj76Lo6j3yxPri8l/PnUBcqJKRo8ur+bA2TkG?=
 =?us-ascii?Q?ONp572NibVuTET8BbSD2VAVVVieobXZNwwF79xSeOCO3DANqHGQ1IIIOmWBJ?=
 =?us-ascii?Q?46Vuu5MHmqsRA5oIuKdFvJy5sO4Gy5BRd8EkOfdqox6JYtb6FVWcVkWaenYm?=
 =?us-ascii?Q?5ro/yIpEZZvf6vJeIctUGnTezt2UQwLvJCkrIeVKc8qLWV5b6FkcuLBOJD6a?=
 =?us-ascii?Q?8avNNuHleB9EdRrSMQR2QRS1dKwFV/Kt7u/xkdWnDAc/NDte2hKO/axitVbm?=
 =?us-ascii?Q?VDhiYTfkQ22f/NTY2IEqXqEN6gXbQkAO19f+BXVIvhem2clz8hCPwqLFVVbD?=
 =?us-ascii?Q?DSgL0aqyWQAbjII7rt3E5VbtrZK2CMWB6Y21wY8DmwhCMzV4JsC2r6W5e78R?=
 =?us-ascii?Q?6PdCaRPGPZs+XSoyEBw7hz5PF89TOiuGQzwMPpP54V2OTmIQCaVx9yHGbwio?=
 =?us-ascii?Q?XqmIuV8NUPm2gC1+fvBY84NhKvYdTUKu/0b/SDP3HqLqftqcLZWNd9e3PJt6?=
 =?us-ascii?Q?D2mp0AcevDzkG9xAJP3cvq/eTBvFCzoG9bfFpibDIiZmbzODz+AxE3XtK4S2?=
 =?us-ascii?Q?B2ZcDnNH3awqpwwjlArwJbl8/y/r5zYKNSKGzNPrqNH3J9jE9HWBmAOhlZI0?=
 =?us-ascii?Q?5jl1jGbRJ1F4LXabOoOl+GZWhWbuh2cUokFhpF23LGD/WZvJQxb3bWaTyJpl?=
 =?us-ascii?Q?7dqRtCDvfomS/TSSxsqEcjINTQ3O3opsk0iwc7J34c2W7XwOPY4svKKxdlNC?=
 =?us-ascii?Q?K53hbDZ0yqADIf3i89xxNZJ4qU+6znUtGH9zRE6OE/4eD5peLxLNJ925rlFy?=
 =?us-ascii?Q?hjuDBRxsM6cCm+APvnwU8b7v93x1vrVXUUCNHC9R/KK3TO0YgElrXiLUxs6n?=
 =?us-ascii?Q?1Kx9SA4wx43Pu7OmL9kJdA5UGjuxNtayx4HegWkft14yTf+WgONSVGprL4GV?=
 =?us-ascii?Q?OILbifWysm2z8ipvaa3FwwCjXRbalKgR3381Xb62mFcm8Q2DZRP0lRIwDtqy?=
 =?us-ascii?Q?Gr+DtX1Onn355xamUF7bRmIS8f7x15gTAWsP/ZSAm8bSsKseLXkbA/ke4Xhp?=
 =?us-ascii?Q?83r1aUlmEiaYsZDmY/y7GpxZ0wjVCpmPgPEqsT22eIFOAgew0UMNVlhG8aOF?=
 =?us-ascii?Q?geTnU6DQYYzU5J5XvUd3FbhjwK4tBfVn2DElvmeXUdZ1Orep9zcy9ybJ1IQc?=
 =?us-ascii?Q?1Wn2t28YqnyGL/BIK3g1liVt3+8rAy6KxiKBD2ikiQwglkh7oqsuNxFfWpO1?=
 =?us-ascii?Q?it36V4W8cCKYbM5PcJ49FBBTvgsN5TgzIuODHv2a5sf6XG0N8bml1rzKteFY?=
 =?us-ascii?Q?SA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae66010-5d2e-462c-9052-08de178c7752
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 08:15:19.7609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +d0OZlqj/3RUXMcMAI/mo5I46S/Ti41HU+0SVn/2f5wsON22HEm3sRCC05Av40pwxHwgKVAlCud7W9qDao7h4MhYQqWzzbz/krLRs/ooRDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8527
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2NiBTYWx0ZWRfX0dESxMXaLAV3
 L5jcLwYDzhSRHza3oLPFBWHSCfYcHY8Wx63xaq8Oz3G5i8numHBBm7cps9zv8V4QTiMS385l4UD
 /jyY1qw4rKGyZGTjoDSkrOFGVMWbNZiMfvH4LH2PneVrvWIs/QPhE6Nn/QGEEqvfFRALYkqfxuT
 lHdIt5DxZfGapjj2tYluqi7s0dd5SO5f+ZXj1bdIFW/mtI0XhXGm30RolJAsw6uW3mRJIDYsfAK
 OaRgy+tKrSSeMvW/ci3OLElwbPp4+ns4FkJ7FE+HBYHHGsWdsFGfytQe52ITjI0h2GSszhldtJY
 HOAM3q6YnutpsY0mFATk4c0hpVDR3gs83wI4IAW7Voy0RRVTa1y5IOSeMfapmS+gBgyv2mp4wRI
 nshWv93rfPYyDU49JqF4JcjX36C7zA==
X-Proofpoint-ORIG-GUID: GwRqqOGaixlhJoa8n7Vsw5kJv6o94uiZ
X-Proofpoint-GUID: Fa0u1aO9vFA-eExK92nJJ9-5pgDLronS
X-Authority-Analysis: v=2.4 cv=YqcChoYX c=1 sm=1 tr=0 ts=69031e9a cx=c_pps
 a=9cGrGZFDAlRO1ZcMJRSO2Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=CjuIK1q_8ugA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 08:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225478

Hi Mathieu and Alex,

Thank you for your feedback. This issue was indeed caused by my patch - I a=
pologize for not covering this case in my testing.

The error comes from the following code in `CMakeCompilerIdDetection.cmake`=
:

foreach(Id ${ordered_compilers})
  if (NOT _compiler_id_pp_test_${Id})
    message(FATAL_ERROR "No preprocessor test for \"${Id}\"")
  endif()
endforeach()

The variable `ordered_compilers` hard-codes all supported compilers (such a=
s GHS), but I deleted the detection file for GHS in my patch, which trigger=
ed this error.

CMake's built-in compiler detection uses files like `GHS-DetermineCompiler.=
cmake`, which I mistakenly removed. If components are to be packaged separa=
tely, I will need to consider avoiding such cross-file dependencies .

For now, I plan not to make further changes - please disregard my patch. I'=
m sorry for the inconvenience and thank you again for your review.

-----Original Message-----
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>=20
Sent: Wednesday, October 29, 2025 6:27 PM
To: Song, Jiaying (CN) <Jiaying.Song.CN@windriver.com>; openembedded-core@l=
ists.openembedded.org
Subject: Re: [OE-core] [PATCH] cmake: remove GHS-related files

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed Oct 29, 2025 at 7:20 AM CET, Jiaying (CN) via lists.openembedded.org=
 Song wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Remove files starting with "GHS*". These files are related to the=20
> Glasgow Haskell Compiler (GHS), which is not supported, so keeping=20
> them is unnecessary.
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---

Hi Jiaying,

Thanks for your patch.

I suspect this is the cause of the following error on the autobuilder:

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image=
-sato/1.0/testimage-sdk/environment-setup-core2-32-poky-linux > /dev/null; =
cd /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-sato/1.0/testimage-sdk/assimptnwvo_x7/build && cmake -DASSIM=
P_WARNINGS_AS_ERRORS=3DOFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON -DASSIMP_BUIL=
D_ZLIB=3DON /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux8=
6-poky-linux/core-image-sato/1.0/testimage-sdk/assimptnwvo_x7/assimp-5.4.1;=
' returned non-zero exit status 1.
...
Standard Output: CMake Error at /srv/pokybuild/yocto-worker/qemux86/build/b=
uild/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots=
/x86_64-pokysdk-linux/usr/share/cmake-4.1/Modules/CMakeCompilerIdDetection.=
cmake:125 (message):
  No preprocessor test for "GHS"
...
CMake Error: CMAKE_CXX_COMPILER not set, after EnableLanguage
-- Configuring incomplete, errors occurred!

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2661
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/2652
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2633

Can you have a look at this issue?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


