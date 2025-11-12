Return-Path: <vudupa@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35BDCCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 08:23:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8518.1762935775132910122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 00:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Lu3NQ+5l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vudupa@qti.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC02Ciu2541300;
	Wed, 12 Nov 2025 08:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AWF9jyFXRSYVuEQS4H80Rd6a
	qmMa94vjKx1RusdWuUg=; b=Lu3NQ+5lAcdtyOVTbmZg6lkFJMYF188GmhIualSg
	AOUDH01LcOmeJrRrSqNLzxhxb2LzcYTO1aXcBkaVQTycrroXMuOPeb+EqTQCGIRr
	/jpZcQikI2bH5fTD/pb3Bnc7uYuOHiShPsHIrwvyERkk67sxYiGOosU3QkI6J8zQ
	Vdgmqlg4tkOC4oNdH3MrFCRu50+Hr2CXpghk9qfDm99v/Dh5an5pAX1jW+KXbB2F
	EOmT+FClBr9pj3qXZoi8KrA/yPuU6KOic2bFIaq79wqWeWxQ05JN9nblH9pbiRC7
	0wkGSGzEXTo06mtCryYI86eu42X3EuCDfHpWJg/9N6b9tw==
Received: from dm2pr04cu003.outbound.protection.outlook.com (mail-dm2pr04cu00305.outbound.protection.outlook.com [40.93.13.61])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac5fgjyxa-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 08:22:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCA733nxecKr4LxJzorq5TAqhvAzWLTBCSTF1T8nif42Rh7wJS0UCvhragzxQqmucLXSa1G7LgjGOXCrTNNS08/ZoUp36aftecPZLshXeT84gPGcVV1lPYaOCY14EXsZF1XHc7qWloYdDC6rPhApXf0zGZ8D5EQwx7nWViCsD9SxfjPPl80xn6Q9XKh6vu9JtVWVLtydqxTfaLOqDwa/rA1Hgk7mGYC85kiCUv+b+yxc+mnZEe5G5IAIr+XAlkbXJa0SMvr2Id3t1Yuh0s/dyBp7bLOY0MkUsHzDWuvsQHhTD/xLox0ykX8LoeyQlY/ELthNOSd57SHt4mEMez3gvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWF9jyFXRSYVuEQS4H80Rd6aqmMa94vjKx1RusdWuUg=;
 b=YEHB4LuzvUcuQLmLsRcY/Pv/c8TRg9JvVH192xD5BRh3OZF1O13S33jMa5pulAP6otS8nZykIM5U7R7/sSssDzIkc44hXZQp+Vhrg92rqzrmZ640zE5QTWcbycFuN09GepZ6pAg6r4o9nhcfBOM1eLQlOvgTvp/hs+nZlWwv4kNfAUe/J0dLS2B4gci5MlDmLqILhQmhYEVL5nRXRKwQk351JnNrvDTQlZV+PADxusIJWal7VNuuNkCFYyOoZjHB6fg3mRPPDKhL4vwFm8yWT8vaxLBCQ+kbNoNJQ03e23lyDvjWAC3bHrcAnHD54O7nytgFXPrLpSQEM8Ws0NeIvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from PH0PR02MB8796.namprd02.prod.outlook.com (2603:10b6:510:f3::9)
 by CH0PR02MB8118.namprd02.prod.outlook.com (2603:10b6:610:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 08:22:49 +0000
Received: from PH0PR02MB8796.namprd02.prod.outlook.com
 ([fe80::732c:e5b4:428a:8931]) by PH0PR02MB8796.namprd02.prod.outlook.com
 ([fe80::732c:e5b4:428a:8931%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 08:22:48 +0000
From: Vishwas Udupa <vudupa@qti.qualcomm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "anuj.mittal@oss.qualcomm.com"
	<anuj.mittal@oss.qualcomm.com>
Subject: Re: [OE-core] [PATCH] findutils: /var is populated by base-files, so
 no need to repack empty dir
Thread-Topic: [OE-core] [PATCH] findutils: /var is populated by base-files, so
 no need to repack empty dir
Thread-Index: AQHcUstI2Mf9Bylbz0mVHWG2OKUCEbTtSWMAgAFWCoc=
Date: Wed, 12 Nov 2025 08:22:48 +0000
Message-ID: 
 <PH0PR02MB8796E101519849F416D02891F1CCA@PH0PR02MB8796.namprd02.prod.outlook.com>
References: <20251111052244.3228403-1-vudupa@qti.qualcomm.com>
 <CANNYZj_9kLM2ZAYAqY5RJupTfsZty8LbD0ys6mShWeAOMKkEoQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_9kLM2ZAYAqY5RJupTfsZty8LbD0ys6mShWeAOMKkEoQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR02MB8796:EE_|CH0PR02MB8118:EE_
x-ms-office365-filtering-correlation-id: 5aff8208-dc13-4d44-db55-08de21c4aa14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|7053199007|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?ZEsWp+nK4Wticd0JXI6cUmB35CLZlZAktljsjX+LYZKK+nX5jj7RaFRASp?=
 =?iso-8859-1?Q?B5gikFCEkQ6gZzxu+x0xDq0ll7Zh6ufmEy+ESXw1omSegFwEy0yAaWnAl6?=
 =?iso-8859-1?Q?9NvCGjxzenSNkvyKrimdA0m/U0ry5CReiYSJy5SEIwPz50BeDu2sSp+K1c?=
 =?iso-8859-1?Q?m7FpEbVCGCkPbC335zwlhaQn9o17jraF/kcUxVrByMMzZZAFzhLfDgnryn?=
 =?iso-8859-1?Q?yelrMjbJqHK/drou0Jz6kRis6mNaMxopekmKOIeOY2c2K8jza8rEDi5pjw?=
 =?iso-8859-1?Q?Y8OTEYFYPZJdamQFr2klEkVX9RdB3mRjtOz1uQkJ7qQQ25EZSJqL6Mhlnf?=
 =?iso-8859-1?Q?yuLZaS24kezQEnJNkZmT2nmALZgdluBf3dQhJ5SnpQt2zN8TcspfaHD3uG?=
 =?iso-8859-1?Q?PiI/+Opgjuc0g83iOv/GO3TijEr7IaAVGl/7Ol5UYtwT4l8LB3nrWV9wDG?=
 =?iso-8859-1?Q?C7ZZsNeC1/C5GorDgKMgis7Ew9wlN1sY/o5AfV0S/jlDbumnhjnt/guPuh?=
 =?iso-8859-1?Q?76KJcWEc6/DuyfFelWTAE9wGOPQdrA69y3OJ1u/Nb9MtbfplOMlCITJweB?=
 =?iso-8859-1?Q?tYjZWRv/UrH26+xQbMpMt6Lh5WqeC1GTfKYgPx+HW5BEccPgknmOuvzba1?=
 =?iso-8859-1?Q?S+CxDx4S97CbKqaSuURF+XM8Fwa6Rdjh2rI6iU4H2CCl2s2OyhyksVb4wg?=
 =?iso-8859-1?Q?7y0wf9m2asvo6gwqmLahw6vvqtXcE8Ug+zzhe5tfH82iD0mGcrdRj4M3gG?=
 =?iso-8859-1?Q?5SoHJBPJNcvhmM2vimsITcP6r1MemKdDYMXS9SvRct09NCWCo20q65ARep?=
 =?iso-8859-1?Q?cjaNt86SZBGEsHanTG8FnCIpmhOKNmAdJqMj63UKIviIWKuoAFiSTVBCNZ?=
 =?iso-8859-1?Q?KEHyM6iAco1P/0z575AIgAG4NG7L9KNWeZ1qgF7KjdBUtV3qIpWNfH61Li?=
 =?iso-8859-1?Q?/xX/sKQ4q0D1vmAwWaPoc6DMrEcDLV5wyB3JHVxesqqd51xUZhZKGDQ/EO?=
 =?iso-8859-1?Q?8WjLnyNfpogf/Qc2yLuD2HTlbCxxvK/sqgDbi+fZkfFtafkrx2f6kN7mHA?=
 =?iso-8859-1?Q?diAuNqgM2fi/rV2IOIVIe0ZUSBi5urqaTFVYdeRjfEMCO9LheLdFcHDPwA?=
 =?iso-8859-1?Q?F9bix9XmwoypM67IFGbtXnc4MZ1A6PP2MvJGWEc10SBTVrZz4FO02I2Z4f?=
 =?iso-8859-1?Q?kyAiVZlAHybeDYRAyWUzzGt9ea4OZsVkvTaCGWvYOVSERcSA3LTiYuo9Hn?=
 =?iso-8859-1?Q?BY/RzZyVjg3KiMkZw/Or7AUP4WKKGqc85sggCJGNHU5QfCAAUH5MJS6hVO?=
 =?iso-8859-1?Q?mIXesRg0+ZhGWkgX8JU7wVLFGZ+/dQ66mPZXRl+hO6LAj3aos2sHSJN9Ns?=
 =?iso-8859-1?Q?5TSlOSzzRwmqce2TLQzTWOQ6xgt5XPcBs/rRVYX5N5XwCR2CuBYcJB+A8k?=
 =?iso-8859-1?Q?VONs86ge8J0jSjdpp6wxKE5b1/HFRFN4LLuM1zTyt8+IGftukwa9U0KFs+?=
 =?iso-8859-1?Q?MXBZCtoJdoR/7NwYJUtxIBi7qTI7RUyC4qfj/6RZVqa8Wl5tQkWcX99qzj?=
 =?iso-8859-1?Q?CHV8NRAvByVw8U4rly6TQc6/pBdB?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB8796.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(7053199007)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?+ad1A2jB/T8+ehtaITedwcLgH/iHg5D1YRJuOx5W6fZ0noMhCMy4A/T+jn?=
 =?iso-8859-1?Q?frWbEPM4wQQ98zjA8M9/+Ov/veWg8XuuFR46PEykiCDlq4g3I9HsKi6ap1?=
 =?iso-8859-1?Q?irxbkdS1MppNKs1PwbiP2wOef613S3/8PPYpShIjEN9lKfTl87D0yCKVYV?=
 =?iso-8859-1?Q?On2jDmvs9xtbe5vrNRTq51biBwpRbCQHtQVP+QVZORHMYK/ewOkluu39Qx?=
 =?iso-8859-1?Q?z2w5FMFF1U/gQDqXvxAIcPcLxBiSb5Yj5vLufEnBT3N1O9zmo40kpdz9+c?=
 =?iso-8859-1?Q?7dG1ckpT4U8w674KqAnNputZoFv4Bhc+fQhy8sFAy36tpqET+AaCDZAPvY?=
 =?iso-8859-1?Q?GDEbX3Rt+4kegAhyC5ZVDs8vaGawXKCRwMsfbWPiqUjwQWRjaW2pD5wzzh?=
 =?iso-8859-1?Q?4DamxTE8NxXDhwnv7z0NpH6C6i+McGAI2tnASsskFCUJY866vr+i9Ci5qY?=
 =?iso-8859-1?Q?9OvoIgnV+Cpqmi5VomEgm+XinOtHmFIakNhv15FbdOC3OnF9dT8Z7uPJ9L?=
 =?iso-8859-1?Q?aHL9WNE49bN10Q8mnWNosKFp6bkT1rq737fXEYqrokaje2yC8JybJyj8P7?=
 =?iso-8859-1?Q?UaDBZUQwtuMZxO4+rBy/1m37l68iJkBFbzEemSRwSM6v8mM79mP4VHWmMg?=
 =?iso-8859-1?Q?LZyFBGW0GpIBKitZ7CSzeuNT2m3HL/f4bLgcqSzWO1Xx2Yty8727D/2FUd?=
 =?iso-8859-1?Q?tCi52kFF/RPrfQ2QGB1QCK5ijWcrvqzocEtJLV6KebxrexbvuisE68Afi5?=
 =?iso-8859-1?Q?4Gg+htKU60eSf1kyk6Z/oZqSLkVKVW7foMSKqGQV8aW0Su75NVzrzuEFqT?=
 =?iso-8859-1?Q?P6aqhcBtOxUVUkG7pSn1octsMxXeFbHH5BtcZovmAtFDGA8Hhe0k8eyA+0?=
 =?iso-8859-1?Q?AXZmlJM2u56sFVm2bJrxUNmcmp1GGViC0DMrCbtawCn/NUIm0z5GOFCKu9?=
 =?iso-8859-1?Q?bgs8Y27u1Yg0J2dGDwlw/2CBFDHuJUpQyGYvXYZKFMRKfLeOw+YuvIWia4?=
 =?iso-8859-1?Q?rrX/QvwXbMEb7Ufe2abmK7Pqn0uPqjuGbasqmgtshjy2bZWrCWUCVzuOEJ?=
 =?iso-8859-1?Q?4g0V9x9sXnTMZA8dXCDeMmd+EjY9XFSRCjnyiAcBDeKRg4QieE4GjgfCS0?=
 =?iso-8859-1?Q?7BogEK/bdJOABY+oX++GJbB7emBLkgHt7tQRnjfbhIEiuxXqcWSzRfiLkY?=
 =?iso-8859-1?Q?mXtiMxDKoYGnFQlke3V8vO+SoQD4FBJOYCYpRlH1Xtb3ugR0SHH/ecoVDO?=
 =?iso-8859-1?Q?u3+g8I6VTK6l0zHkhn6U21olJBLx1uA19XA9BUKY2aoeRGqQgFJF8MAmcf?=
 =?iso-8859-1?Q?vixUwQ+dvkwqT+PDN8OfmjPAJ88gCXCN2B4tPmyTWlDcqkG9vQOFCyU7ju?=
 =?iso-8859-1?Q?jUONA3cm0fUN+0MmgTFIa86CTDb0g9b771Jhv3UVpNd2g26wI/x8nkCweU?=
 =?iso-8859-1?Q?e/+DQjtSMxJ/Aqve8BK61AzDmJrQGq2nV4qS5tJAPSWWe9XSiG9qD6f1om?=
 =?iso-8859-1?Q?84eRCXmk9UGMqhOmVviyW61G/kNLPXS0dctZ3rCeFTZPy2auOcLGmN1tGx?=
 =?iso-8859-1?Q?cnoi2YLNYDNTAw38TbdwTn9NpryFO8zvw891BaJkCQRyvz4wWrQFOauDMB?=
 =?iso-8859-1?Q?E68Q0CVUnaQuMKr3Oav7kw2q5qgOpUMk/B?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR02MB8796E101519849F416D02891F1CCAPH0PR02MB8796namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	0GxdIYjCjls89rUfzOIv/hSFwToc1IpLSnmKCIuMerawHvABlM3op4UXnJJgIO/+h6aILpWJm3KrrqVK11mOvHkGA/CULLGBRj8d+RHEPlFkLB2l0OtDngo+ZGtxM/7Qk+uwtHrU8UoW0+Lu4iGOSQZxnsS38Avi2DrLwdl/WK5MqY9Qy5/XBX6qlzrI0JXbFZ4w3G4FLdxml0Ctv7k+77b/AmIaMcSRnbQkic7K3h0LHRveWIzfMUX6FEp4btM+pdkBN/IBxbZEjAyi5oY7psNwFxjex9SG78mJVpwUE4k45LfnoQ7cUvoDNzi1vNZ4x0JfRJr+xbquMnsg1CTobPD6uaFKgs9vIH6r8WLcJHDP85PiYykCCpXC5PrmzfQtFiLG3jDrLv9CfcLl8syBccyS+rOaT+KoA5s4d7RgDAgPLOTfhx6LjAaRP/gMCUYz7vfI2Cm6x5HsKd2lpEEKYReudJ62SK20YFxAXnrKlFkBaYGm1yV1Guzjg4TXTrqoqMcN+9wBkL+2f88CFMcpaU/DxjJ6Hj20P54ZL/pvm2xgRTBqcMqcrzQIjlIcyUYmHV+3E0rraM403Lmz+Y7nB0K5caCl/3INms9f6ewhIuok2+moG53Cu+sE/WhtIYuN
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB8796.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aff8208-dc13-4d44-db55-08de21c4aa14
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 08:22:48.3539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E5QiZvMd6WmaQlYQQgQN1+few8e+hq47P8p4e0GmXwu+hT4fsD0dHXc4kbRYOa9e1YTMdaN5UJZMYmS5FOTUXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8118
X-Proofpoint-ORIG-GUID: d0WBoXczYon19NFsIW4K7YXSxY4WfrEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA2NiBTYWx0ZWRfX7SGI8bVHK+Oj
 BW3X8ht2ff4OKXQWwb4NBr4EVlY7KVUUyndoujAOAoR6BjMPFQeLkJ5erL7Lt8zxoJiPq4mI8vf
 uoQu8TiXbS9vbAtCjbjgBTNqWtqjIBX7ICAEwa3M5MVF6023RZJjwp4ZYK7Cw4a5hq5pZl2Ekde
 jQj/Bm2sbm6Gk1sQKtNecqNKNZHJ/3Ztzi8hIwOYF/4hbcVItm0CrxeQ9HLti5wG7IU943GKQl+
 jI/8GZQMdADNeKSd5VQU3d5myoEhJ9Hd20QvIc0gAtpB2tipZkziMPji0/YZ/bVr3DbNoIHp2Oc
 mH19Vbq4hOfBjBEC8nBWkXeht938hEnLGoFciTjb6lcQv+CpGicCFHZOcSA1G8M0UFnB7MFat0s
 paux2GgMpZpyRD/z2X1XPcOKm7RHQw==
X-Authority-Analysis: v=2.4 cv=B5u0EetM c=1 sm=1 tr=0 ts=691443dd cx=c_pps
 a=uAsC0n6o+FZr0mf75tp5mA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Xx-KFT2Zn4EmFGvc6p4A:9 a=wPNLvfGTeEIA:10 a=oNUAL75cEowdMXBD:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: d0WBoXczYon19NFsIW4K7YXSxY4WfrEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 08:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226197

--_000_PH0PR02MB8796E101519849F416D02891F1CCAPH0PR02MB8796namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

There is no error seen, but this helps to align towards stateless system ex=
pectations or when updates are done via meta-updater.

Vishwas
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, November 11, 2025 4:09 PM
To: Vishwas Udupa <vudupa@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; anuj.mittal@oss.qualcomm.com <anuj.mittal@oss.qualcomm.com>
Subject: Re: [OE-core] [PATCH] findutils: /var is populated by base-files, =
so no need to repack empty dir

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

Is there some harm or an error that happens when it is packaged? This
needs an explanation of what the issue is and why is it not observed
in Yocto CI. How can it be seen?

Alex

On Tue, 11 Nov 2025 at 07:06, Vishwas Udupa via lists.openembedded.org
<vudupa=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>
> findutils installs an empty /var/lib which is already created
> by base-files. It doesn't need to be packaged by findutils.
>
> Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
> ---
>  meta/recipes-extended/findutils/findutils_4.10.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/meta/r=
ecipes-extended/findutils/findutils_4.10.0.bb
> index 29ad6c7350..8d5c721522 100644
> --- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
> @@ -15,6 +15,10 @@ EXTRA_OECONF +=3D "ac_cv_path_SORT=3D${bindir}/sort"
>  # need od from coreutils for -t option
>  RDEPENDS:${PN}-ptest +=3D "bash sed grep coreutils"
>
> +do_install:append() {
> +       rm -rf ${D}${localstatedir}
> +}
> +
>  do_install_ptest:class-target() {
>         mkdir -p ${D}${PTEST_PATH}/tests/
>         cp ${S}/init.cfg ${D}${PTEST_PATH}
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226147): https://lists.openembedded.org/g/openembedde=
d-core/message/226147
> Mute This Topic: https://lists.openembedded.org/mt/116234660/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_PH0PR02MB8796E101519849F416D02891F1CCAPH0PR02MB8796namp_
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
<div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
There is no error seen, but this helps to align towards stateless system ex=
pectations or when updates are done via meta-updater.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Vishwas</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, November 11, 2025 4:09 PM<br>
<b>To:</b>&nbsp;Vishwas Udupa &lt;vudupa@qti.qualcomm.com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;; anuj.mittal@oss.qualcomm.com &lt;anuj.mitta=
l@oss.qualcomm.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH] findutils: /var is populated by =
base-files, so no need to repack empty dir
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">WARNING: This emai=
l originated from outside of Qualcomm. Please be wary of any links or attac=
hments, and do not enable macros.<br>
<br>
Is there some harm or an error that happens when it is packaged? This<br>
needs an explanation of what the issue is and why is it not observed<br>
in Yocto CI. How can it be seen?<br>
<br>
Alex<br>
<br>
On Tue, 11 Nov 2025 at 07:06, Vishwas Udupa via lists.openembedded.org<br>
&lt;vudupa=3Dqti.qualcomm.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; findutils installs an empty /var/lib which is already created<br>
&gt; by base-files. It doesn't need to be packaged by findutils.<br>
&gt;<br>
&gt; Signed-off-by: Vishwas Udupa &lt;vudupa@qti.qualcomm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-extended/findutils/findutils_4.10.0.bb | 4 ++++<br>
&gt;&nbsp; 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/met=
a/recipes-extended/findutils/findutils_4.10.0.bb<br>
&gt; index 29ad6c7350..8d5c721522 100644<br>
&gt; --- a/meta/recipes-extended/findutils/findutils_4.10.0.bb<br>
&gt; +++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb<br>
&gt; @@ -15,6 +15,10 @@ EXTRA_OECONF +=3D &quot;ac_cv_path_SORT=3D${bindir}=
/sort&quot;<br>
&gt;&nbsp; # need od from coreutils for -t option<br>
&gt;&nbsp; RDEPENDS:${PN}-ptest +=3D &quot;bash sed grep coreutils&quot;<br=
>
&gt;<br>
&gt; +do_install:append() {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -rf ${D}${localstatedir}<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; do_install_ptest:class-target() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p ${D}${PTEST_P=
ATH}/tests/<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/init.cfg ${D}$=
{PTEST_PATH}<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#226147): <a data-auth=3D"NotApplicable" class=3D"O=
WAAutoLink" id=3D"OWAda68d1a4-60b8-f886-2005-8bedc01b10c8" href=3D"https://=
lists.openembedded.org/g/openembedded-core/message/226147">
https://lists.openembedded.org/g/openembedded-core/message/226147</a><br>
&gt; Mute This Topic: <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" =
id=3D"OWA3d66a5b2-547a-65e1-4dab-93da6028fc0d" href=3D"https://lists.openem=
bedded.org/mt/116234660/1686489">
https://lists.openembedded.org/mt/116234660/1686489</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=
=3D"OWA80a03b69-3cdb-2fb3-d0ee-e2975f5aaa84" href=3D"https://lists.openembe=
dded.org/g/openembedded-core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a>&nbsp;[alex.kan=
avin@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</body>
</html>

--_000_PH0PR02MB8796E101519849F416D02891F1CCAPH0PR02MB8796namp_--

