Return-Path: <Shilong.Jiao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6072ECD98C5
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 02:06:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36725.1781143581833063704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 19:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DiHt9AkE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0622bf43b4=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0wC491997295
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 02:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=ZoZh8SOQy11kax7DIAlXr+
	k+0v+4EDXyVYh4HqOhXmo=; b=DiHt9AkEaScemuAiVQC6iz5YmGyqMDm6KIdL3a
	3OnnOYWrZa9jXI8eDZtMZK9fubdO2BeU//Vduef3342+EZHAtWFz8ZyeO2m/J09F
	Wx9wJAN91ruayh1ZXI9XSBMnDlt0wRNkFc/zDWwqGr6kmaORjpPIDUfXx4J0x3SV
	sttdmvdb82T4VJQYd052ve4O7STYymqunXKGXlM/Jax9aGt+1K6bMRd3SMO+rdgY
	3egeSj1L4VDT8ljoqrxgWH76N7Twz/2oMcTMXQASXG2u1LF8Khsznba1H1Ba/q7O
	/T9/yhk0+gT/LphtZG3MLwtnp9LoSJd9V6ICpqKVv5KOolKQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7egdhn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 02:06:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCUTLtZh95gzemSZasuOxGCRneetS8b/4KJlGmpaGmQiyxiKfwMLnEFmKOeRIi1mW8Jnm1pFZWyK/6Q0FdaLBM3f9TYhirsVoBbUu5HUdQwro9iopxuCwIJpCrMpU4v//ttlTE6XsBTKCkDv/U3tMdu05YRl/FlGTmOfCAxquRWsEpc0esWkgzf4Kut7hpKSh52DxuuQsshckz67Rxt/cTzn9cgsoF/aq7eZcQIopfxMsdmsBrAEJp7ycZHYOxjhSl/CfAMqq9PdmWtnGPCeiY1lMNhhrUeFhZSAN15weEFqpkEHeJYRU3IJSgfFSrzn7ly8HnZfNw1h+rqmSyVCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoZh8SOQy11kax7DIAlXr+k+0v+4EDXyVYh4HqOhXmo=;
 b=pMgZDSd3+D+jKzrOteRDwTgzEpkO76utFEhKk9WaHfD5kpdu8FOfB6raUeJm7SyhxVUJWQxEftCEAW5qMbNeNK1nKdSYkuCIwSa0HRbORIhVFbCztgmpBsNjr94rhSfytg/+10Qiyy3h2iZLgRcOFy7rcQ97tXBWtmALKTMBdDU0IJTl55PFrBdaTF7Y4IL4+XJVW/fzWobE5tI2Ecbtt8Qyt2IEPjW1uWGq718Rb+/Lu17BplgDOWkR0M5spdHWoPVNOGBhAfaRdP8bWJ+wB/OFn6GZzIX4L5jcD5tCmuv4JrE5o6q9SWKrrMR31YIXZBguksQbWulY5lw2WhigEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 02:06:17 +0000
Received: from SJ0PR11MB4829.namprd11.prod.outlook.com
 ([fe80::7c53:6837:115e:28e9]) by SJ0PR11MB4829.namprd11.prod.outlook.com
 ([fe80::7c53:6837:115e:28e9%6]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 02:06:16 +0000
From: "Jiao, Shilong" <Shilong.Jiao@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support
Thread-Topic: [OE-core] [PATCH] python3-six: Add ptest support
Thread-Index: AQHc9+3IBgFEIc6TJ0KxxAVJ13Jl4bY17hCkgAARpLqAAcE3AIAA3Hh9
Date: Thu, 11 Jun 2026 02:06:16 +0000
Message-ID: 
 <SJ0PR11MB48297A9B780C8DD714642A48801B2@SJ0PR11MB4829.namprd11.prod.outlook.com>
References: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
 <DJ4E5OTQSRTG.JX0ANFWCLECZ@bootlin.com>
 <18B75E544A0EA1A3.61226@lists.openembedded.org>
 <SN7PR11MB66786F424595B04D017F6116801D2@SN7PR11MB6678.namprd11.prod.outlook.com>
 <DJ5DVPB75QO4.F4OPEQNML7BM@bootlin.com>
In-Reply-To: <DJ5DVPB75QO4.F4OPEQNML7BM@bootlin.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-06-11T02:06:16.162Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB4829:EE_|CY5PR11MB6415:EE_
x-ms-office365-filtering-correlation-id: b914f062-ef13-409a-903b-08dec75e059e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|8096899003|13003099007|3023799007|22082099003|18002099003|56012099006|4143699003|11063799006|6133799003;
x-microsoft-antispam-message-info: 
 sRo2S+4DpsNVtaGL4yrnmqHrRCUTXJDimz3xYSeJdOCfhlymTobgDRXXqvOh03Wvj+5PvymxwkUNNF83HQGfBcbijU+rJsng0nGgW9ZcAppnZTfwWYBxe7gPUEemvsJ0U1t1PgS3pvKr01PUz+V8TxR55bYskNKrtvKstbz3wxFgLXBgWUSl99gipPvak3MIlvbyTALRcH6VU0cZRAdVnyGA4I7sJA4nEs756Z/DC223CHmNn9LbICMinro6HXk1IEHTFZDFsX00dfTXiN5n+awD8UQFVfuhsWGCYTJMRgKDqcFjqzk6J5crr44q8Pb9K/dBsFeKfKnsrF4lmHUB2ZNAVVp8bLrg1DipeQYaIFKbhyqW9PhrPmMVb+PGRopTRv5nR6Tm2a+7Y8e04DtWG8LmPQXWNq2GDj4ikfa103Uc11UXQ4eQoKs1epf/KS7/91YzUXZEFBgmIud6gItCZx8UAxl73d9tj6udQ0GIz55UJ8sBmxl2aJ4UR2KrUfbYtjeW/FHHlBjnFr9v/raDmuSGLGqMZbuy4G0cIffvQChXSEuqufzDkIz76AaHnF6oW81iWOpXZXmZ68U9nw6u8pStDncn3gtoXFs3hdqbZSvtIIeOXMy5lRrzXPc0IhWFwyd1TUI21VN36Fh7NVogJj0XK4QM4lSv+rSDqCXh4Rb2y2d/TIVSXEIIT/WDCBN0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4829.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(8096899003)(13003099007)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ML4uBqQaxeSsPZ6mJ0iVotFXMEunjwgasAbq7SfhjPIKvrxRF1md19uHkj?=
 =?iso-8859-1?Q?dvpNV7ZCDoOlQKusel6WBsEFQuNUbl0LOOpaihbB7pXq02uHRomVH0nc8F?=
 =?iso-8859-1?Q?MuvOlf1Lkl8mHbdGH2uHiIDKcQD81GwUB8jtcgMjRIBKbFoeTmLqBP6mFl?=
 =?iso-8859-1?Q?lm6Sw8Lbidevxfg7Cb/Npq8Uzu2A6hUJ0+hBL++UnqSnt9G8LS8UQmFrqh?=
 =?iso-8859-1?Q?pTEAUZYbfyVeUyzZ8eALcCAvTYz52HkLuRt0RkLsk3nQm2RJ1NUWbjDMwP?=
 =?iso-8859-1?Q?t+gwZ2U03S41miD3nmFlqvhzYjXZSrUud4aK2FT7o+sgU8REGQ6kF9u0NB?=
 =?iso-8859-1?Q?2sHNQKgmW9bzOsA9Fkw/bXBiwXBYgVe996CZ02rndo/w84dAvs1SrtxqnU?=
 =?iso-8859-1?Q?xEmexikhLsV9urZIKYxUJAlglaJj7IUX1f+ygugIjt/m06vJDQdZuIVV76?=
 =?iso-8859-1?Q?CRnCPEvHt8U7dRYg97gOddjUlOnHFMUZDWfedmd/71WrEURl4hjNr+qI8r?=
 =?iso-8859-1?Q?+KOr82d2R1vcz2f8HTmBa9AV7w0HkCY8VBdC8rhwADxFcRe2K/IKNU6Y2V?=
 =?iso-8859-1?Q?Cs7FVBVa3bvZ0Rjwyj0KeAIgbE5631RV1UB3XiqO2bCsdvZRomcNYAOPx2?=
 =?iso-8859-1?Q?+lsfBtb4d1QVWi69kALDnUb4ifbSYpISzpKFrMSQBmnkPxurZ+TiCo5pYP?=
 =?iso-8859-1?Q?IlolY7FkmNVdB8u6XNdp5YeKKoq3eh4V0H4vvUckqTeqtAHSteM6bZdRjU?=
 =?iso-8859-1?Q?RZqCcIO2sdIDbxHio1EGXiqgK6591BUP2DH//mAKdmyic3XwiZdeyEwoTm?=
 =?iso-8859-1?Q?26Mpn6o8+1B38RVERcCeHgjTc+CzhTFGPWbvG7Du6dIMIz67sz7i1CXEGH?=
 =?iso-8859-1?Q?IPN/CM0o/lPhji9lmu0UJp0b3LAENMX50AA5BxmiKYsq/ZCOQLeACWr8wN?=
 =?iso-8859-1?Q?LIQqspMVsaYfOMvCGJ+oacILVnkJ9K0iaZfx03hj1kKDgWj+fOWIW12zIU?=
 =?iso-8859-1?Q?YdMXjrrtddIk9saCBau0pWuBKejrI/geOULRv6yTIQ6OyRpU84JNjVJfLi?=
 =?iso-8859-1?Q?cgqKfL5VbNv6jpp+QKcRQFW04dJx11VM0QPQmr6DZ6kTivVgR2u7BHHhP7?=
 =?iso-8859-1?Q?TtOE7gP7cVffYSGw9OwM7pOKiYPbmcFkrsJeIQYEKuE/J6oBihpcuVzM4i?=
 =?iso-8859-1?Q?ARnRYQbzsvEfBUYRTD9+9MZx13LauWhowMYkyf/NyQQ2k/iEufYzF/Rfz8?=
 =?iso-8859-1?Q?GOZWZOKlRb15xv5f+mw8dInK55A+uQ4HN3HmO69MiHk6NdW7gYx6aMWMjB?=
 =?iso-8859-1?Q?McJCRBoorTB1GiYwTzBdcBWOZM66wSf7AxfrrDiM3MOdZOLiDLL6LhTKE8?=
 =?iso-8859-1?Q?/0WNuuhnyatipUZdZxDIncO5JM8yXK4yi/tGEnbuLuiCicIfyjP01nIfrO?=
 =?iso-8859-1?Q?oCsm8H+qdRi2hBfMO/SnUyC2kEuYM0kTVgDXUfmP4AoCFai6hRxmEcvazm?=
 =?iso-8859-1?Q?FmkzGdPYBt73ulQKjFIwZICJyrR09UM/dXS1aERpto+oYshcLkH5XL3M6k?=
 =?iso-8859-1?Q?/w+s3Fqe+pvKU/2sYEBaPRSPstyRdETWn1gZ15DOvV20xtWT3ryRQtxl2Y?=
 =?iso-8859-1?Q?QBo1J5Fp+mDIJ3pCjLEXkugP9cuncsVvxr3SBBbQmH5Df+c3dudbntdawX?=
 =?iso-8859-1?Q?EzH2ZmB0xuAL3Cq20MfgbT78HurADW6rFGhBHD2zGnZrK9UB0iaO2U+SHU?=
 =?iso-8859-1?Q?nVeBmEghemKwt/JlM7A4DcetGW84bG1YzWVPln/TL6X5iwZGzoHdzpdlG7?=
 =?iso-8859-1?Q?ZYGCwsVp9A=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB48297A9B780C8DD714642A48801B2SJ0PR11MB4829namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	rVMLWoomAYUuHadQFWH5WoHvnFDk0EVyuR2vtjYrdMd9qTo9AwCLjwM6t+VisqUiAc/szcqm6NkPRnUo88YWmYJQUzzFpcJWL1NXKXxRUGvItjuf561nwrTvuXq1GEHaGkkwavLGQJHp/Wxa9s//78fkpcfzppl1c7aa4qf1FuPPLWTaNjxImuaxhJ8raZiA4zYlG1cJRGN8QB3PTHAcHSKz6iANVT72NLy/wbiqtXkdjdcN4o32zI02wfW2wrrvYKoKL6h2O0qbdEcaTsE8oIR6Y3mMBq3yIkLmIzQbHUvo78rDDkf/FLqzgq2m1+CfWlZRSZ3FywT3du5a7ns6/Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4829.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b914f062-ef13-409a-903b-08dec75e059e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 02:06:16.8150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoJN9JitjQahWTRRP381KoPc1iRb2heGIynD0Umc8rFHGon+tFjqrTi0ePTUOQbXdM7FB9imbmuaKmnGXnmM2ysb6HEQEOJ01UjLAaMnpbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ZJAIF45Hb1eXwhEQeSLoGmBK5m9IQNfv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAxOCBTYWx0ZWRfXwHLIhUrSsYcR
 i4KpFRWs/qGlWPpIdkvu+i/MUxBMjp5doRnrpwpjMTPiW1AXxaZopJGQwZOI4PJh39GQguMyqvX
 Ic1e6tx2ZRRMTH84H0Ediyv5r3mMHYrunQuNsbAkGDbBB+/xq2woavnh2dtEMSNZle/TqBxd+0Y
 z9v8nv9M5X9HxEJPm/py5DygtrPwpe94J7VgsQEVDvhgHqZ7bb6WMDUTGED3Oz5mXBSCMQQQJK4
 BimBHHCzybkrTkJ6ydDthqfKf3izhjSw379wUhCdYZWMKPLvV9sxYrpyQeQ/Ncw2F6fNwQmozcj
 fMLxaUV3UulJ0/oeil42UoMyonH2LVG9aSlv4wMpyUPHEmI1O7orjZNWXPTvUl8Hvb+DO2lviN0
 IN2NNw02uwO0S5lNQ12fPeoLpPIp9+5GY1WmKZFns2vVYSCRuc3wI63l7UkxJWKk4R+ICK2Wjgs
 /Sm66iv7GvsYCFhgqOA==
X-Authority-Analysis: v=2.4 cv=cN/QdFeN c=1 sm=1 tr=0 ts=6a2a181c cx=c_pps
 a=5B7wOmkMoK/13lwMvlsh9w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=Fw0TuM9OMYkiZoe9PI4A:9
 a=wPNLvfGTeEIA:10 a=Yzrva5AKRK-SmH19:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAxOCBTYWx0ZWRfXwq8oob4yoMdH
 +KWB70tTmq67+cmHGC0OkZoz4EKY2ZNydt8xik+byfcpRvgtTtFrp1V9/oLzxNLtUBXYtS1iBvW
 ozGMn1tA73wziTutvS8y5AV8SmNYq+KfGUP+GzkqPsayJYjxdc5o
X-Proofpoint-GUID: QGnmA5fSbELGDfNSv2X4Cc0-k-GoWN-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 02:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238418

--_000_SJ0PR11MB48297A9B780C8DD714642A48801B2SJ0PR11MB4829namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thanks for testing and confirming the issue.

I've investigated the test failures. The problem is that test_lazy()
requires html.parser to not be in sys.modules, but when test_move_items()
runs first (which happens in pytest's alphabetical order), it imports
these modules, causing test_lazy() and the related test_move_items
parametrized tests to fail.

This appears to be a test order dependency issue in six's test suite
itself, not specific to Yocto.

I have two options to fix this:

1. Patch six's test_six.py to clean up module state before test_lazy runs
   (but this modifies upstream test code)

2. Skip these problematic tests in run-ptest for now
   (cleaner for Yocto, but reduces test coverage)

Which approach would you prefer? Or do you have other suggestions?


Thanks,
Shilong Jiao

________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, June 10, 2026 20:55
To: Jiao, Shilong <Shilong.Jiao@windriver.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>; Jiao, Shilong <Sh=
ilong.Jiao@windriver.com>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Tue Jun 9, 2026 at 12:09 PM CEST, Shilong via lists.openembedded.org Jia=
o wrote:
> Hi,
>
> Quick update on my investigation:
>
> I've tested these failing cases locally in my build environment, and
> interestingly all 8 tests pass:
> - test_lazy: PASS
> - test_move_items[html_entities]: PASS
> - test_move_items[html_parser]: PASS
> - test_move_items[BaseHTTPServer]: PASS
> - test_move_items[CGIHTTPServer]: PASS
> - test_move_items[SimpleHTTPServer]: PASS
> - test_move_items[xmlrpc_client]: PASS
> - test_move_items[xmlrpc_server]: PASS
>
> This suggests the failures might be specific to the autobuilder environme=
nt
> or related to test execution order. The test_lazy failure in particular
> looks like it could be caused by html.parser already being imported when
> the test runs.
>
> Could you help me access the detailed error messages from the autobuilder
> logs? This would help me understand the actual failure mode and create an
> appropriate fix.
>
> Thanks,
> Shilong Jiao
> ________________________________

Hi,

The autobuilder configuration is described in the "Write config" step of
the build.

I did reproduce this issue locally with following layers:
BBLAYERS ?=3D " \
  .../openembedded-core/meta \
  .../meta-yocto/meta-poky \
  .../meta-yocto/meta-yocto-bsp \
  .../openembedded-core/meta-selftest \
  "

And following lines in my local.conf:
SDKMACHINE =3D "x86_64"
PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
INHERIT +=3D 'image-buildinfo'
IMAGE_BUILDINFO_VARS:append =3D ' IMAGE_BASENAME IMAGE_NAME'
TEST_SUITES =3D 'ping ssh ptest'
SANITY_TESTED_DISTROS =3D ''
OEQA_TESTDISPLAY =3D ':1'
OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autobuilde=
r/autobuilder-resource-constraints'
EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow-r=
oot-login'
OE_FRAGMENTS +=3D 'machine/qemux86-64 distro/poky'

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_SJ0PR11MB48297A9B780C8DD714642A48801B2SJ0PR11MB4829namp_
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
<div style=3D"font-family: Tahoma; font-size: 13px; color: rgb(0, 0, 0);">H=
i Mathieu,</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
Thanks for testing and confirming the issue.</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
I've investigated the test failures. The problem is that test_lazy()</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
requires html.parser to not be in sys.modules, but when test_move_items()</=
div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
runs first (which happens in pytest's alphabetical order), it imports</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
these modules, causing test_lazy() and the related test_move_items</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
parametrized tests to fail.</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
This appears to be a test order dependency issue in six's test suite</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
itself, not specific to Yocto.</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
I have two options to fix this:</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
1. Patch six's test_six.py to clean up module state before test_lazy runs</=
div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
&nbsp; &nbsp;(but this modifies upstream test code)</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
2. Skip these problematic tests in run-ptest for now</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
&nbsp; &nbsp;(cleaner for Yocto, but reduces test coverage)</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
Which approach would you prefer? Or do you have other suggestions?</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
; color: rgb(0, 0, 0);">
Thanks,</div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Shilong Jiao</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.c=
om&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, June 10, 2026 20:55<br>
<b>To:</b>&nbsp;Jiao, Shilong &lt;Shilong.Jiao@windriver.com&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;; Jiao, Shilong &lt;Shilong.Jiao@windriver.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH] python3-six: Add ptest support</=
div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">CAUTION: This email comes from a non Wind R=
iver email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Tue Jun 9, 2026 at 12:09 PM CEST, Shilong via lists.openembedded.org Jia=
o wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Quick update on my investigation:<br>
&gt;<br>
&gt; I've tested these failing cases locally in my build environment, and<b=
r>
&gt; interestingly all 8 tests pass:<br>
&gt; - test_lazy: PASS<br>
&gt; - test_move_items[html_entities]: PASS<br>
&gt; - test_move_items[html_parser]: PASS<br>
&gt; - test_move_items[BaseHTTPServer]: PASS<br>
&gt; - test_move_items[CGIHTTPServer]: PASS<br>
&gt; - test_move_items[SimpleHTTPServer]: PASS<br>
&gt; - test_move_items[xmlrpc_client]: PASS<br>
&gt; - test_move_items[xmlrpc_server]: PASS<br>
&gt;<br>
&gt; This suggests the failures might be specific to the autobuilder enviro=
nment<br>
&gt; or related to test execution order. The test_lazy failure in particula=
r<br>
&gt; looks like it could be caused by html.parser already being imported wh=
en<br>
&gt; the test runs.<br>
&gt;<br>
&gt; Could you help me access the detailed error messages from the autobuil=
der<br>
&gt; logs? This would help me understand the actual failure mode and create=
 an<br>
&gt; appropriate fix.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Shilong Jiao<br>
&gt; ________________________________<br>
<br>
Hi,<br>
<br>
The autobuilder configuration is described in the &quot;Write config&quot; =
step of<br>
the build.<br>
<br>
I did reproduce this issue locally with following layers:<br>
BBLAYERS ?=3D &quot; \<br>
&nbsp; .../openembedded-core/meta \<br>
&nbsp; .../meta-yocto/meta-poky \<br>
&nbsp; .../meta-yocto/meta-yocto-bsp \<br>
&nbsp; .../openembedded-core/meta-selftest \<br>
&nbsp; &quot;<br>
<br>
And following lines in my local.conf:<br>
SDKMACHINE =3D &quot;x86_64&quot;<br>
PACKAGE_CLASSES =3D &quot;package_rpm package_deb package_ipk&quot;<br>
INHERIT +=3D 'image-buildinfo'<br>
IMAGE_BUILDINFO_VARS:append =3D ' IMAGE_BASENAME IMAGE_NAME'<br>
TEST_SUITES =3D 'ping ssh ptest'<br>
SANITY_TESTED_DISTROS =3D ''<br>
OEQA_TESTDISPLAY =3D ':1'<br>
OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autobuilde=
r/autobuilder-resource-constraints'<br>
EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow-r=
oot-login'<br>
OE_FRAGMENTS +=3D 'machine/qemux86-64 distro/poky'<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" id=3D"OWA5d4f19ab-4afb-291b-bca1-0aced3ba65=
3b" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://bootlin.com</=
a><br>
<br>
</div>
</body>
</html>

--_000_SJ0PR11MB48297A9B780C8DD714642A48801B2SJ0PR11MB4829namp_--

