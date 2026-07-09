Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22549C4450D
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:21:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3046.1783578115393982775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MM7xR0tG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=16502c5656=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6694Y1nw1575003
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 22:51:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=1ijA5W2ds9h/PXJh8wZyLm
	wkZ+WVZsBuEBN61ahUJOw=; b=MM7xR0tGpMoMF0z1LjBz4wzhqgTXXt3sO60ci0
	fastWR/NEOaaqf1qc8W8qqWWW1TxifohsySHCKPWVbpCLKjG3k2pSImg/jCs+JOw
	VH25DF9BWYHCg1r0cRGOKvayoSHi7iPbQAB6kk6P0mMAfxwgAaeS6eZEzhE/VWrf
	pPf6W6aoXQKlnwMs0Z0y92zDC00n/PPgS00xT0kRY5UiqorKuLfKZhBKmviNoQVc
	G7ajkdU2d9QF3n+rsDuZJb9gKkQaw0hUx18w7eLAj0/st+RxTz1TJ/wLRYLQ+5vz
	t3lDWLnk3w7MKuTwnZSCToWXkT+nlJhbTsXbbhr6OLkWqeEA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013019.outbound.protection.outlook.com [40.93.201.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1gy89t7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 22:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rniGQCrpJRjmtbTV+FeTeaWKFdVeDAlwGIA6oQIWPFzlw1uZxb6Jx8hw3UgVfppDphfnOiptXbd7igD+r+MSSPOzhSBuIdOO+14wqRTTkBokmZY8J3greS1ErlJIxil+v6yx4LH5QTrYr5lBii9z7wlV6ip3LpSOBDkHmZlz5kir+ufsOkXNpWvfMxnBrTrekcoQ9Vim9eGamlSTgsAGxN5VsusM3z1D/0QUdKkJhp7klnVdkZCpIcjj2jOp93mpMxfy54xrPyKyJpSAiKo7sHy0US7puULP4lVWxKFIix9r0cvtwVo4AJxgs/DcZlFeAbR8Kh1R3L22Lr4Gx+7KjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ijA5W2ds9h/PXJh8wZyLmwkZ+WVZsBuEBN61ahUJOw=;
 b=uwffnuEmitBks35B5I9EJijH3awhKgaUhFJYSton9md2ywykJl/xElsk957JSkpUqaFPBnq8XUGq3P4qHVe5mFFIkfEDgAU8zxW6IUJrbwEGnKqkSwbGlsCL3eeOpUrAZfQsNWnIkbzaY1791XYq2j/FPYhXQ5QBxFbxgNWX+35c5Vj20+HQAeSbSaFQThMpQhShuuINAhuzWTtw8eJYWHo9myBdxw4bMXsHpKYpfEREBVUscwW372GObZ+9Xs3BrUF1jerjQWKnKD/p4jtpN6ESwAn++rEEnQupALw0AUfh1sxfa2DXjvyaaLmQ9gGQW/mkis6T/uJ1dCdcx0ItVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 by SA1PR11MB6806.namprd11.prod.outlook.com (2603:10b6:806:24d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 05:51:14 +0000
Received: from CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec]) by CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec%5]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 05:51:14 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "tgamblin@baylibre.com" <tgamblin@baylibre.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "Komati, Shiva" <Shiva.Komati@windriver.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 -> 10.1.2
Thread-Topic: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 ->
 10.1.2
Thread-Index: AQHdDrtqh1m4Mbp0E0KuL5mQygG9GLZjYZOAgAAIdH6AABFORw==
Date: Thu, 9 Jul 2026 05:51:14 +0000
Message-ID: 
 <CH3PR11MB8774C007D411DA9C4E26E9858FFF2@CH3PR11MB8774.namprd11.prod.outlook.com>
References: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com>
 <20260708092252.1211669-3-HimaniRamesh.Barde@windriver.com>
 <DJT3J5GX38YG.338OF4LLBVU92@bootlin.com>
 <CH3PR11MB8774FCDCE3E2497D8793893B8FFF2@CH3PR11MB8774.namprd11.prod.outlook.com>
In-Reply-To: 
 <CH3PR11MB8774FCDCE3E2497D8793893B8FFF2@CH3PR11MB8774.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-07-09T05:51:13.702Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8774:EE_|SA1PR11MB6806:EE_
x-ms-office365-filtering-correlation-id: e1831701-6f7b-4419-1a2d-08dedd7e1678
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|366016|6049299003|23010399003|376014|1800799024|38070700021|13003099007|4053099003|4013099003|6133799003|11063799006|4143699003|56012099006|5023799004|22082099003|18002099003|8096899003;
x-microsoft-antispam-message-info: 
 wd7dhVj+YCbnZJbQFaf2q6cIMV3uhF5QVStVcmeIXCtaLOWZsO3yje+df3shyQw2f321dpa0NLoc3hxJy79Su7J73s5XhOUSyiXKY7Wr3DgzxyEcKsXExdr4zUJQAD/bRVAfox+2+Rf9EXJIvg6KgVZxB4rNBe46oyWBQhjcg3UbNUeSuUznf/2QlB3kekycN0INY31TfRXTEGBb7dD7HNK02PgKWQ6Bkl9DNjuoJ+Z+y3B5nR8hffq23+s8Eu38VnroLU3KOenFuRS6la3GthVqHyO5Kk0D8PVCX30Mql1egSgX17JoWgi50ZgbOAq2gX3Wt2k544AVsTHq6jz0ANuMLSreRwIma18FrlFu+tyE117QjDvGzzYY8O5KyOYNQLEXptB/jNUZji46q25HvoKrl/gbpGhqOMBPzbCuxnkyTxY/HMiIHSGRlZYc6t5MvFNfNfhBKSZlZJzup+vUTZ9mnSDvdJG5dcs3jShY+oxdk34AVmAyZd79xGS5KiMRxjouWhMza8858dit33G22DzJYcSmgTEBNJbLGATh41zkq+eM9BVVar0TVc+qH0NhrqGOafbBqg26KAJlv35XlgPDQf7mheHBQEpjiU7ACRE+ABVSV2dqFg375eveu6vYPlN5jeASz8zrPdiR31iDdQ4Y2wwV5SlQbOjhdXF9hHg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8774.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(6049299003)(23010399003)(376014)(1800799024)(38070700021)(13003099007)(4053099003)(4013099003)(6133799003)(11063799006)(4143699003)(56012099006)(5023799004)(22082099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ageflBo5fGYxtlVxzx5YbrzOro2lKV/mRaLxiB+KefhmW58Yn+KDagMNZ0?=
 =?iso-8859-1?Q?7lm9KSf6Jk9zDk2Yo50sO5NWIpXfCwuhWhGI5Wdx9KVbL4CJ58OuMllTpX?=
 =?iso-8859-1?Q?Zim4h5uwo+Kvcz2skXnkuqmnDQx8NaMhb32O26zZIkwdRuYvUbxfCT7s0g?=
 =?iso-8859-1?Q?sltEokRFVrkmMI1u0XO+wr8t0wAtQ5HcusVSKg0GQWljOCMBi/1078wU98?=
 =?iso-8859-1?Q?IH8X6n+n7e3BKxaLGE422lSn0uBTJHNq90hvgDhVqmrdrMYx6hJwROqD8e?=
 =?iso-8859-1?Q?JYNHzm+IEhqFCtylyGDRvAAkDy8Hv5Wozz/7n7SZ9E8hdj8P3t4MFzU/oE?=
 =?iso-8859-1?Q?P/VfZNppe82tOQ2XqhePYgafchdST9NuqwS1wf727XftP2LECs83A+9y2D?=
 =?iso-8859-1?Q?ZEzbnmLMY0de9Cxn+G9jbfyV9Yedr6WP/EjGxsl7Iogxa+D9EUxDh1XIEA?=
 =?iso-8859-1?Q?cmKoqihMK50Zfb0kctGfjGb6Mqe+/Rwsi+z4hAtN5m+RZ1klFFC+pLnjx6?=
 =?iso-8859-1?Q?xwNc7nhqGytcL/A6g7YE4qrNXYm5Uw+V8/iuUpi+suTwQVu1gFJhTTiG3Q?=
 =?iso-8859-1?Q?yX+VjhkzQMjHsKWpwJlDp9z+gH3a36w+hmpV+JW2C3M9GSZZ77ZpkGXtcC?=
 =?iso-8859-1?Q?Dx/GyBKaeNZ/lHlSAzApEf87CyiSZYHnvlTArb+DBg85unbcPf7vBoSZGU?=
 =?iso-8859-1?Q?73+DOdSygyLIKmn3/gMvYt3iYmvPK7MgXN1lhfJnHKf2IeMIBuK0PVz3VJ?=
 =?iso-8859-1?Q?d8Df6XzCUKm0agwOJcucMLcQKMXvQSKZlfWbqisB5YkAkvEAjyMHuwvxDY?=
 =?iso-8859-1?Q?qWrngAkQ473UOWCvBh08pJWYEJBmUWGqBTidHmrfVz1r8f1aY5SMsFtVP0?=
 =?iso-8859-1?Q?OclJvmqG0DMiZx45XiDLCuDOGSDpNwiTjlkUkLgeG7Oypna0KgruCQsHax?=
 =?iso-8859-1?Q?LUrmnnrAdhhC+gxiUN3c/4aU4wzh/PE4PTL/Ed3D2Nul6EbKLNpahJuas8?=
 =?iso-8859-1?Q?b//TuO06gFgF6LDG/csHSDuk/XgV9m5XusLOYIBq+sxulU/4WN4JAFtGi5?=
 =?iso-8859-1?Q?tQtVX7xnVnvpKvSFQkO9uxfvCViRui1if+9qj8g4/3lo1xFqPMvTXFpGH+?=
 =?iso-8859-1?Q?VCHpClv6wl5LFcLcNbIY7XTtWQkDktMoASsV32leQRdjfUi6AlOuqeE3A4?=
 =?iso-8859-1?Q?a48+GbWQZtqb95xuH7a73elxf5hzpqyH47kt4+LqtuVCmJA6VcNJj1k9G/?=
 =?iso-8859-1?Q?uqPV7OyzNxZbyvULMqcfpS+z1WXya+HPlJ6ZYbb8g5sNdNGS537YTBM2Ar?=
 =?iso-8859-1?Q?NGNODERaQJb3Iv7L3jg0C2oydPIFT0CUI5BRp87L1Io14UJAdG3TcZsDmz?=
 =?iso-8859-1?Q?7HkVix5kStuzZUICHbbwqtqI11AftfTzNJTMsKkTR8sGViDFG26iQBEho5?=
 =?iso-8859-1?Q?y8D2z2mn9YKJPzKzfLxWu3hwG5lAe89eKcO2mkthlkYG/qk50oxflhM8j8?=
 =?iso-8859-1?Q?7vpMHzbTA1vkEPBfehndMj94cawvlKulLEXiMHI8cTP50Ufx3qAHDS1Tuj?=
 =?iso-8859-1?Q?0ekgWzir0OIkFIVU2xGG2TavssbSlK2YQ0QuFi7s5x1Lfj5dQl0dU6NwUi?=
 =?iso-8859-1?Q?DVyBufhTy9O2EUbggbOz2jRpUsFKHp1XHZ/38tjKAjDt82hkKDudhLGd6Z?=
 =?iso-8859-1?Q?ha9o/TxUEcvlMuzlWQHkNGxENXpcvNf/1qiHU+vLcY0gMxuDjD876WYvXH?=
 =?iso-8859-1?Q?pmNgCjzAcVSmqLHxXhnBmM4vpT9cds7IaP/+W0Wdk/P4XZItEVcBp6hnpF?=
 =?iso-8859-1?Q?zHQoIea+VsFS3W/DJelpbnu0e37clATJni2LELg3qUPjIMn7hdo6MLsUo+?=
 =?iso-8859-1?Q?ZV?=
x-ms-exchange-antispam-messagedata-1: aartuDAdUPLSooMGJAygDXfNEQAnYPBwDqE=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	P73QYBlYtIKfckV/BKbmJmIbl5nL46BmmnxF9GK0m47PkFssugqe2pGz34A1pDKGVTFUlhlFoyCur1pF6Uisrilmc8IZoeOtQJFBHlBYK4+76enNDKmOHCZzkaaYZr1LgZ/egQaWmYfB1CEytlZbmbTSZQkkN1r9Ud/up1bVH9NYi8U5ULm/Pn8ccOcrRyw8aDq+Jndga21oRfGe6w+ntXk6x+rH601y+yTmVA1r6v5fZBN86jfeOpljJjmHgxu+QfNlHtpDE5TxPhW1TaHLgK9HKoZyPz/iau5wWQdO8Cmz9utqn02/FVMEFCTVQLhavtE8D5viNupU8tu4F78UbQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1831701-6f7b-4419-1a2d-08dedd7e1678
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 05:51:14.5367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vv+XCh1UjXWX8fuW8UgG4hS+bVgl+izY13bJNZJXPH3g9YY8P6zIM9IwcYmtmDV2sbdelMkE5tk6lPsqSlyzau0A1+mDR6sY+cIKCZSHh4u5cz1eeqBWs9bStmSF1Ivy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6806
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Lt2FyVsBrn0cmBq0LzV3_ZDbwoYvvLAc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1MiBTYWx0ZWRfX6lAdRWf4nIRD
 fpIgoAIlcdY/2YL1onnNVnYZsax2Hlgcc48yh1ih+0tz4zvc9AUYHPuSgGpvJUe0t3DR1SBaIwg
 hVkmEoA6Rus3hUYtj9Vg0q2N5AYHDqSyGVRaxnvX6ljt9F+i5kjq
X-Proofpoint-GUID: Ax323LvqC8tOQumLfKMUVCziqlZrtRpe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1MiBTYWx0ZWRfXzHwI+rNbCETr
 obnmrt3IGFjJrk9TtzWFKLmTY1QHryVsbGpEwbSy8Kn1m6gE+2ohp1ASD5CLvD5x5OQT9e6xxHD
 KFouCZK0V45afhYwVvQRGG1+LoZQuWNx5fcFOmWMV9UQW5VvC0RCbRdlpymuPpqBfU7zKah3kN9
 YkAPziyKksPoC4slMvmLdvFhijhVtLTwGSfB2Mh9q61aaMDmHGWVhY/kymMpPyExw2EmJuR8ONt
 m4U0+hyoPk56fRgL3kLPoy9ESPhDdqBrUBA5jvd51AjJurBnNznipKnSOXZ/2tfjVM5itWNDGkq
 HudsCTWLQI/RKRRApj9s95mEpW24mdg1iUZ/FeDD77T9Hsbx6EJGcUlgVXkGOEXSJH4wqaBrwpO
 B1XQ9o9eU9Ybgif6iE+BjMB39S980mmXrGCAPwLOTzVxADsFUvJax3OKiOxZHWOJv6rOl8ibjPK
 IQyHnp3730WKRV2gcHA==
X-Authority-Analysis: v=2.4 cv=P7IKQCAu c=1 sm=1 tr=0 ts=6a4f36d6 cx=c_pps
 a=DoKDTACKjh9G6IJ+hAMtGg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=IpJZQVW2AAAA:8 a=UBFVfQAFWYhimOpKR3UA:9 a=wPNLvfGTeEIA:10
 a=XwdRNx1Jg5vhRtRX:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=dWB_wDoaOQRvAvalUzMA:9 a=B2y7HmGcmWMA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090052
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_CH3PR11MB8774C007D411DA9C4E26E9858FFF2CH3PR11MB8774namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240877

--_004_CH3PR11MB8774C007D411DA9C4E26E9858FFF2CH3PR11MB8774namp_
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB8774C007D411DA9C4E26E9858FFF2CH3PR11MB8774namp_"

--_000_CH3PR11MB8774C007D411DA9C4E26E9858FFF2CH3PR11MB8774namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alex,


The error occurs when building python3-setuptools-scm >=3D 10.1.2.

This was reported by the AUH on June 23 (subject: "[OE-core] [AUH] python3-=
setuptools-scm: upgrading to 10.1.2 FAILED"):

File ".../setuptools_scm-10.1.2/src/setuptools_scm/_get_version.py", line 5=
5, in get_version
    from vcs_versioning._environment import VcsEnvironment
ModuleNotFoundError: No module named 'vcs_versioning._environment'

ERROR Backend subprocess exited when trying to invoke get_requires_for_buil=
d_wheel

setuptools-scm's build backend calls get_version() during get_requires_for_=
build_wheel, which tries to import vcs_versioning._environment (a vcs-versi=
oning 2.x API). The sysroot has vcs-versioning 1.1.1, which lacks that modu=
le.

SETUPTOOLS_SCM_PRETEND_VERSION is setuptools-scm's own documented mechanism=
 for this situation. But if you prefer a different approach (e.g., upgradin=
g vcs-versioning to 2.x), happy to defer.


Thanks,
Himani
________________________________
From: Barde, Himani Ramesh <HimaniRamesh.Barde@windriver.com>
Sent: Wednesday, July 8, 2026 3:54 PM
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; openembedded=
-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: tgamblin@baylibre.com <tgamblin@baylibre.com>; MacLeod, Randy <Randy.Ma=
cLeod@windriver.com>; Komati, Shiva <Shiva.Komati@windriver.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 -=
> 10.1.2

Hi Mathieu,

Thanks for the pointer. I'll drop patch 2/2 since Alex's upgrade to 10.2.0 =
supersedes it.

However, patch 1/2 (exporting SETUPTOOLS_SCM_PRETEND_VERSION) is still requ=
ired - setuptools-scm 10.2.0 will fail at do_compile the same way 10.1.2 di=
d, since it still probes SCM metadata via vcs-versioning when built from Py=
PI tarballs without a .git directory. Alex's upgrade will need this fix as =
a prerequisite.

Thanks,
Himani
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, July 8, 2026 3:22 PM
To: Barde, Himani Ramesh <HimaniRamesh.Barde@windriver.com>; openembedded-c=
ore@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: tgamblin@baylibre.com <tgamblin@baylibre.com>; MacLeod, Randy <Randy.Ma=
cLeod@windriver.com>; Komati, Shiva <Shiva.Komati@windriver.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 -=
> 10.1.2

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed Jul 8, 2026 at 11:22 AM CEST, Himani Ramesh Barde via lists.openembe=
dded.org wrote:
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---
>  ...etuptools-scm_10.0.5.bb =3D> python3-setuptools-scm_10.1.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-setuptools-scm_10.0.5.bb =
=3D> python3-setuptools-scm_10.1.2.bb} (89%)
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.b=
b b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
> similarity index 89%
> rename from meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
> rename to meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
> index 58eb963910..824758e3ee 100644
> --- a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
> @@ -6,7 +6,7 @@ argument or in a SCM managed file."
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "[file://LICENSE;md5=3D838c366f69b72c5df05c96dff79b=
35f2]file://LICENSE;md5=3D838c366f69b72c5df05c96dff79b35f2"
>
> -SRC_URI[sha256sum] =3D "bbba8fe754516cdefd017f4456721775e6ef9662bd7887fb=
52ae26813d4838c3"
> +SRC_URI[sha256sum] =3D "24079818acc46e99aae0d65b8d511fafe965970d9cbd060c=
7b9f7275ded520fb"
>
>  PYPI_PACKAGE =3D "setuptools_scm"
>

Hi Himani,

We already have an upgrade to version 10.2.0 on the list:

https://lore.kernel.org/openembedded-core/20260706171701.70536-31-alex.kana=
vin@gmail.com/T/#u

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_CH3PR11MB8774C007D411DA9C4E26E9858FFF2CH3PR11MB8774namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Alex,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The error occurs when building python3-setuptools-scm &gt;=3D 10.1.2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This was reported by the AUH on June 23 (subject: &quot;[OE-core] [AUH] pyt=
hon3-setuptools-scm: upgrading to 10.1.2 FAILED&quot;):</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(200, 38, 19);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(200, 38, 19);">
<b>File &quot;.../setuptools_scm-10.1.2/src/setuptools_scm/_get_version.py&=
quot;, line 55, in get_version</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(200, 38, 19);">
<b>&nbsp; &nbsp; from vcs_versioning._environment import VcsEnvironment</b>=
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(200, 38, 19);">
<b>ModuleNotFoundError: No module named 'vcs_versioning._environment'</b></=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(200, 38, 19);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(200, 38, 19);">
<b>ERROR Backend subprocess exited when trying to invoke get_requires_for_b=
uild_wheel</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(200, 38, 19);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
setuptools-scm's build backend calls get_version() during get_requires_for_=
build_wheel, which tries to import vcs_versioning._environment (a vcs-versi=
oning 2.x API). The sysroot has vcs-versioning 1.1.1, which lacks that modu=
le.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
SETUPTOOLS_SCM_PRETEND_VERSION is setuptools-scm's own documented mechanism=
 for this situation. But if you prefer a different approach (e.g., upgradin=
g vcs-versioning to 2.x), happy to defer.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Himani</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Barde, Himani Ramesh &lt;HimaniRamesh.Barde@windriver.com=
&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, July 8, 2026 3:54 PM<br>
<b>To:</b>&nbsp;Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com=
&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.=
openembedded.org&gt;<br>
<b>Cc:</b>&nbsp;tgamblin@baylibre.com &lt;tgamblin@baylibre.com&gt;; MacLeo=
d, Randy &lt;Randy.MacLeod@windriver.com&gt;; Komati, Shiva &lt;Shiva.Komat=
i@windriver.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgr=
ade 10.0.5 -&gt; 10.1.2</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Hi Mathieu,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Thanks for the pointer. I'll drop patch 2/2 since Alex's upgrade to 10.2.0 =
supersedes it.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
However, patch 1/2 (exporting SETUPTOOLS_SCM_PRETEND_VERSION) is still requ=
ired - setuptools-scm 10.2.0 will fail at do_compile the same way 10.1.2 di=
d, since it still probes SCM metadata via vcs-versioning when built from Py=
PI tarballs without a .git directory.
 Alex's upgrade will need this fix as a prerequisite.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Thanks,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Himani</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.c=
om&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, July 8, 2026 3:22 PM<br>
<b>To:</b>&nbsp;Barde, Himani Ramesh &lt;HimaniRamesh.Barde@windriver.com&g=
t;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.op=
enembedded.org&gt;<br>
<b>Cc:</b>&nbsp;tgamblin@baylibre.com &lt;tgamblin@baylibre.com&gt;; MacLeo=
d, Randy &lt;Randy.MacLeod@windriver.com&gt;; Komati, Shiva &lt;Shiva.Komat=
i@windriver.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgr=
ade 10.0.5 -&gt; 10.1.2</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">CAUTION: This email comes f=
rom a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Wed Jul 8, 2026 at 11:22 AM CEST, Himani Ramesh Barde via lists.openembe=
dded.org wrote:<br>
&gt; Signed-off-by: Himani Ramesh Barde &lt;HimaniRamesh.Barde@windriver.co=
m&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...etuptools-scm_10.0.5.bb =3D&gt; python3-setuptools-scm_10.1.2=
.bb} | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&nbsp; rename meta/recipes-devtools/python/{python3-setuptools-scm_10.0=
.5.bb =3D&gt; python3-setuptools-scm_10.1.2.bb} (89%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.=
5.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb<br>
&gt; similarity index 89%<br>
&gt; rename from meta/recipes-devtools/python/python3-setuptools-scm_10.0.5=
.bb<br>
&gt; rename to meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.b=
b<br>
&gt; index 58eb963910..824758e3ee 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb<br=
>
&gt; +++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb<br=
>
&gt; @@ -6,7 +6,7 @@ argument or in a SCM managed file.&quot;<br>
&gt;&nbsp; LICENSE =3D &quot;MIT&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;[file://LICENSE;md5=3D838c366f69b72c5=
df05c96dff79b35f2]file://LICENSE;md5=3D838c366f69b72c5df05c96dff79b35f2&quo=
t;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;bbba8fe754516cdefd017f4456721775e6ef9662=
bd7887fb52ae26813d4838c3&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;24079818acc46e99aae0d65b8d511fafe965970d=
9cbd060c7b9f7275ded520fb&quot;<br>
&gt;<br>
&gt;&nbsp; PYPI_PACKAGE =3D &quot;setuptools_scm&quot;<br>
&gt;<br>
<br>
Hi Himani,<br>
<br>
We already have an upgrade to version 10.2.0 on the list:<br>
<br>
<a href=3D"https://lore.kernel.org/openembedded-core/20260706171701.70536-3=
1-alex.kanavin@gmail.com/T/#u" id=3D"OWAe8501cec-869a-9ac4-d876-6c0fa51da39=
e" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://lore.kernel.or=
g/openembedded-core/20260706171701.70536-31-alex.kanavin@gmail.com/T/#u</a>=
<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" id=3D"OWA80cf433e-9838-649f-5a47-a534a8bf5e=
e3" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://bootlin.com</=
a><br>
<br>
</div>
</body>
</html>

--_000_CH3PR11MB8774C007D411DA9C4E26E9858FFF2CH3PR11MB8774namp_--

--_004_CH3PR11MB8774C007D411DA9C4E26E9858FFF2CH3PR11MB8774namp_
Content-Type: text/x-patch;
	name="0001-python3-setuptools-scm-upgrade-10.0.5-10.1.2.patch"
Content-Description: 0001-python3-setuptools-scm-upgrade-10.0.5-10.1.2.patch
Content-Disposition: attachment;
	filename="0001-python3-setuptools-scm-upgrade-10.0.5-10.1.2.patch";
	size=1308; creation-date="Thu, 09 Jul 2026 05:47:36 GMT";
	modification-date="Thu, 09 Jul 2026 05:48:11 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjNWIwNzA5YmIxMWQ3Njg2MzI3Mzg0MWI3NWIwOWM3NzFlNDMyNTliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjMgSnVuIDIwMjYgMDU6MDk6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDEwLjAuNSAtPiAxMC4xLjIKCi0tLQogLi4u
ZXR1cHRvb2xzLXNjbV8xMC4wLjUuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4xLjIu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV8xMC4wLjUuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4xLjIuYmJ9ICg4OSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMtc2NtXzEwLjAuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zZXR1cHRvb2xzLXNjbV8xMC4xLjIuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzEw
LjAuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHMtc2NtXzEwLjEuMi5iYgppbmRleCAzZTg2YzRmZDJjLi5kNzYyZGM3ZWQxIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1z
Y21fMTAuMC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
ZXR1cHRvb2xzLXNjbV8xMC4xLjIuYmIKQEAgLTYsNyArNiw3IEBAIGFyZ3VtZW50IG9yIGluIGEg
U0NNIG1hbmFnZWQgZmlsZS4iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTgzOGMzNjZmNjliNzJjNWRmMDVjOTZkZmY3OWIzNWYyIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYmJiYThmZTc1NDUxNmNkZWZkMDE3ZjQ0NTY3MjE3NzVlNmVm
OTY2MmJkNzg4N2ZiNTJhZTI2ODEzZDQ4MzhjMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNDA3
OTgxOGFjYzQ2ZTk5YWFlMGQ2NWI4ZDUxMWZhZmU5NjU5NzBkOWNiZDA2MGM3YjlmNzI3NWRlZDUy
MGZiIgogCiBQWVBJX1BBQ0tBR0UgPSAic2V0dXB0b29sc19zY20iCiAKLS0gCjIuNDcuMQoK

--_004_CH3PR11MB8774C007D411DA9C4E26E9858FFF2CH3PR11MB8774namp_--

