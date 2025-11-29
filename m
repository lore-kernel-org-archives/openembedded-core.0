Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D68CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 15:43:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16373.1764431001703987493
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 07:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WxKwsnI0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATFXZIx1123464
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 07:43:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=hfeKFgETmkwmIrFsm36Ps/Lj/Bin63wJw6aKy4x6Ybc=; b=
	WxKwsnI0w5M8R9Q33z/6mS+sxBrjXzY2ZGljN5I5NDVQUkYbKU7DblhQuBQVSkYt
	wWV7hC8h4DRlxuLeeBeQSDJGh/KC5rbyl1c5WgHZbj/DmR3SCwNieBN+nIwyjefD
	EJNyWLbZ6wn1catLuXxTj/fgUyfq2SD6ZcItVkIJUp4A+wAD4NACD3a4TY+oygto
	U9sns7fww2tffR+X6B9XjjYqDX/C4wozGWYwYI3gROz961iM9+lmDuSyAL1+Odhj
	2vqWNqAtn3W5eki7VpMiJePjgbZCSIERgpiwR5Njxaa+pnvtOmKr8jBR6h9yYFD3
	MIcakjiQjnw200LIu/uMdg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mr2q0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 29 Nov 2025 07:43:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxG94SJo6gfxiTpacu21h3a5LzYONBOAjyE1GQK6o3I+xQq0NaWmEp8Ncp+gN4HqL14AV3GCTT0Wmq3nz+Ulv7bOR45FY5E6S4/5ENwoNfO5aD2eEm0tFA3X3q/NH1TzQSprvvvk9WEvrW+igZaS0O6nhxI9A/V2IdIvDbSykgPX3BsXbMEZE1nNa6FZ8XBF+1btGsQcze5EDPc/3PJZhgthyWsl729gD0xedXM43gzR/BtjwcCKswIaS9imRV+q5z+2umapqhm9o/CWGCOPahaX0MFjkCTWC++hnEc3d+UWah4Q0lTXBaiT5i9v3Qsx+mTU0rshhGP0Xr/K5UXdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfeKFgETmkwmIrFsm36Ps/Lj/Bin63wJw6aKy4x6Ybc=;
 b=X2QmtNUy6v3i/+bxu/CY2MEnVv9tV8yt4K0XmNIEBPhfTvAyN/p/t77iW56D83Hha+r1aUSJuRTzkvF6TpCwk4PoD8s5gJpUXsWn/mp27bd0wxheXixpvgZY5v8qcVsHFelnVMvbVkmlXV9eHOA6p8RcsCFzPrriTp6VXQGzTSm7KonaS7fps5a4op94o0EN9TTBXyc/Z7yldbXqFFS2EWsrXn3HFQShxL0tOfCtXdOn7lb+ID7INuqXf2Bp8WvhnOGMus7f8Z3BIHkY72DfgBmGUemZEVWMOO//eYOco0dW1isgnX69JQ1LgvGuHzyAInxN7URSreQsMfYONRn0oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7839.namprd11.prod.outlook.com (2603:10b6:208:408::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 15:43:17 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 15:43:17 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "alex@linutronix.de"
	<alex@linutronix.de>
Subject: RE: [OE-core][PATCH V2 2/2] rootfs-postcommands.bbclass: remove the
 '\n' in 'no password' banner
Thread-Topic: [OE-core][PATCH V2 2/2] rootfs-postcommands.bbclass: remove the
 '\n' in 'no password' banner
Thread-Index: AQHcYOPysEXtuIk/2Eard+6GvobY6rUJo9gAgAALtGCAABv0wA==
Date: Sat, 29 Nov 2025 15:43:17 +0000
Message-ID: 
 <CO6PR11MB56024FAE14C1A1D20970E29DEDDDA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251129035436.249679-1-Qi.Chen@windriver.com>
 <20251129035436.249679-2-Qi.Chen@windriver.com>
 <CANNYZj83Sda+1Ycoiwdzxdw1y17zK=AiuxQ5a89H9RUqK+OMew@mail.gmail.com>
 <187C80565E96F071.270132@lists.openembedded.org>
In-Reply-To: <187C80565E96F071.270132@lists.openembedded.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=03e28db1-27cc-469e-97ce-0025734088f3;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-29T14:01:31Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA0PR11MB7839:EE_
x-ms-office365-filtering-correlation-id: fb9a0196-a9a2-439c-5e3a-08de2f5e0443
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?9fNKASGTpJ2pjZKUEEziNxYloKQnBusd2V+xRlTTBRdZHx3jtWKWAVp5sDom?=
 =?us-ascii?Q?qtJqr4Va0TxGZL5dCYa8NJ3D7Mgj+1PYQJqYuIXn4raVgekqt/XYez596Yc/?=
 =?us-ascii?Q?RRlvL0Sm6/Xpllow3FEyt1hgl6h8rR/n2oD0+5HRZ33J+2AJ4zBGH8bTKgiz?=
 =?us-ascii?Q?oH2hGLb/JwPsBjl5X6RrAldrAj9zRRInIlRWk1hXECds3gB1S6TMX8jh8Fua?=
 =?us-ascii?Q?vZMHnl9A2t4WofwuvV7Ph6trOe0fc8r+TUyv9XuJxZ4fFvYec1OJPtqSFWyC?=
 =?us-ascii?Q?G42XG80lnSMM5yi6WsZJhucl15G3SxK6ObefXygNdnF82u8KcNmQv0wi/56/?=
 =?us-ascii?Q?0LjUTTR3mUx04COdLk9KZBdL8mzNP5z/dHIKeMEzmJSThR4vuEf5Lh4JYa6D?=
 =?us-ascii?Q?Ja83bJeeINGTj6P37yRnAsHGw6AAevqeeAlMkCUNtP1ttUvxHY+3+2GHF4hq?=
 =?us-ascii?Q?kA1IXYk3NY7NRN8RsNgYhfOvebTnfwqRHL6FMbQF9rNMF/9ItBdk53DMREkw?=
 =?us-ascii?Q?HRSbfjvSuuGjBId+oQkAaGqEvC2XhNKsBNin4Z/y6SELYm/DeDY1vW3Nv5Et?=
 =?us-ascii?Q?RmCxhe08iWBwnhAJ/rATcYc8mYzLIJY8sniRqkSkQRAWyx3Na9qRt7c/sU80?=
 =?us-ascii?Q?VSy5s4hz2MtmiM6UB8WETpV917FWiHV1mzrt38ZmgM1xhX3VHgH7ljIb//tD?=
 =?us-ascii?Q?gYcw9GwB6/3f8DPkPW0L4CoCIK4t4xAHPbzdJl/vWBwSY27QpHbpppwnZWFF?=
 =?us-ascii?Q?LObUEKeQd4RuaVq9hyvYlP8XOML0sn8GY19eb6R08wi4fyGK4aja01K96l23?=
 =?us-ascii?Q?kTSXyBQLCpQB2gLffdnb2eeE4rk5XcSdIPi2X8AhcSaQbWvKbYb+eNknRiJU?=
 =?us-ascii?Q?EXbzCJBBHKmHR27lu2RAbw/CDwjU92GGm0U5zLrJWkQFYhI4kOM91uYUhxMS?=
 =?us-ascii?Q?QcNpFzLdoQnzybjUuJMZ57MqAvmp2XkKRvs6BJz7c1Ab4C+sjv1I8nSYlFxr?=
 =?us-ascii?Q?Oe802Xes5lxgW6OlIcpz2gYX87++4VGNhapmf24T3tvG+OOyndRwGI9Rh88h?=
 =?us-ascii?Q?ssLbIiB+VtB4v+BtmUk/R05XkCZrCSeCfu+j08ZhpT3WVOL8agG6bAvtf9ey?=
 =?us-ascii?Q?wnWbt8I/sFleBX8JCUD9tTR41zBV7aR6t80LWqkdmnGDHizjSoeQZiY/RC0S?=
 =?us-ascii?Q?R7qjDev5ubQADYTy1WUAGDYmkYZutntU0iXryUdC4KYMkTi2nBxwvCWJhbQn?=
 =?us-ascii?Q?ic5xdtU2JKlFf2qTNkT5gyjSUbc83iiznP49TfkzeMoHiMbZJnebq88/2rMr?=
 =?us-ascii?Q?QhwbVBbPv8Mxlm/aA53kgfam/7VNTEhdR04xJ5RV2TdU5zmH6wkTeI4SNUm8?=
 =?us-ascii?Q?RgokT0zRQ/WgncHYUyHPWsCfnGdk32oxMgQb+YrdXYpKn5Qrg9ZnDfIzIKaG?=
 =?us-ascii?Q?wmM30oPiSjavVHDssWuADU8WUk5woUF4KgYELdnOjAqmeY9YEspRVMEgNLuS?=
 =?us-ascii?Q?yg3J5P3vd3p133WB+VOkI0VjlC2gbUEJoEqF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FBJ41cO3nOyX1aMaghwaf0C7zXYE8b1fupdPAoujk8EHj99a0nBnYszwNmvX?=
 =?us-ascii?Q?aDiBSoFlCBoq6JLUf6BDflpcxx6ynnNnVpUdpDBPyxM7zcy0AnJ6xAhKs8kl?=
 =?us-ascii?Q?tzn3Yx6SvodcTG2/AMyv0gvl84V6mx7357lej4lo5MMLHRLPrt10DyxviRhP?=
 =?us-ascii?Q?J8Gt5/xuuUeWDVRV+8De2nrSDKMkCjItU3JGdb2KjgVKPINOW7vOCOsS608Z?=
 =?us-ascii?Q?PjkEX2k5SOeCZi/YyCi6BR4Gi6ykzXKo+iftgqYShBTuENbBt2+28v5cDaK8?=
 =?us-ascii?Q?RAZR0H96XFNxagAy3i+r2WGWfa00ZEuFszoh9cBn5yBrjX9v3P+Z+sJZAGiG?=
 =?us-ascii?Q?g0b46O2P18DJrd1m5pQbK+6lOEC0fp5QF5G1/pvLEKVvuNwjlzjsGpSGWYhW?=
 =?us-ascii?Q?cbeVYk4jjO1yBb1w6NmDJW6P8iDMaDe+JIRePr/ukrOvIm3vAs624VsT03hK?=
 =?us-ascii?Q?6x8hyRHRgKkyc1TjCAnth1nwwbP8U+ktHNEPd8x9SvDj+GCTe4W9vJHTnMH/?=
 =?us-ascii?Q?pFi5XKm8p/cLm9dutKSYice6LIOMPFZ1f5WKialy8Mn4dypzh6ZJgS3xqmTy?=
 =?us-ascii?Q?KGfpAH4oh03VZvQLKYt/ZQAjSNqK3g/Bip7gXX/eSRMywabwrpw3qKvFVhFh?=
 =?us-ascii?Q?kfRLdq4cYADptonuF7KAnO7xwZG52w4n9ZNp1JFLFk6T0EyMAq6QFLUA1foQ?=
 =?us-ascii?Q?y4NmbbBMbW/SVv/nZA7mBVQoVsl5AP7sbH81bKo08LmTIp6s2dwNVX0v83N3?=
 =?us-ascii?Q?4C1DpxJ1jz1v9gLMUhReTt/NnLGxzvRjxQBnwOcJheyaZgEQPnBAoBodOHgv?=
 =?us-ascii?Q?86lGRaqJs8jhsq8jjhiEDflCOa+2Kwo2o8DhJZNBHFPB/dgx3R3ZdJlCPeLp?=
 =?us-ascii?Q?S+YTUDYsvXfBmedZjQ5HoqYaBz3K09mLQWp+zW9DBUPqeJ9nZXKeB2fd5+91?=
 =?us-ascii?Q?xsX2CmEgwds9pAb9/OGp5RLMA5st/pcfdcoPNJyC4LzT+sBsYZjW2bJqoOoC?=
 =?us-ascii?Q?sc5LvkVKb9pOuxb7U9PMjEOvelmR6SpMcMyt/xFNtWclrduJbJwxjs7Lz5Uy?=
 =?us-ascii?Q?ZMQorQSGSkDPmjXlORKGNDEl7tPs17UvEWbSuyZ86LeBUWgoj86esDr1BJS8?=
 =?us-ascii?Q?lG9uy1AAaATIsFgeSQU51x9EUThs56nFWkskUIhS8LbcZhfowma4+mnJTBeY?=
 =?us-ascii?Q?Y53z9tfyqsbeXAFqv9w5SmSeZWbFicbuI9iqF37GhUDXdUW5LaflABcNwNR/?=
 =?us-ascii?Q?JErn7ONVyBSBGjI5JhwmY8GqUL9/Sn/XOPxC3WxaTzX8O1VCGk5Xr7tewpS2?=
 =?us-ascii?Q?1QcEpqtft6vluz3hDsFw4vHVBXTRreaBUpfajbP/x5T30UugufenZTs67z9/?=
 =?us-ascii?Q?9J7/45LSlVx+2D8OohqYIMPw64ZKV9QO7g+tNkA9xqrH1JEmZPATXoX83XeJ?=
 =?us-ascii?Q?JQxcqyUGMnuLPjvvVwa/lbgpdfmwizZlYGklIeWBZy6YlVDF2LVgqV9uESLU?=
 =?us-ascii?Q?l6VBA/80SNbSXKtiwEsADwrhhD/cjplMGkrQM9IvUv7/aYOTkxvkP8/dyjwW?=
 =?us-ascii?Q?YiyewtEC13QpjU9I8W6lt7ywrxSYZxYTxbu55O0Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9a0196-a9a2-439c-5e3a-08de2f5e0443
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2025 15:43:17.7919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fa+zY4Ai9kXdfniJ5f3pE56I7LYkCCTVrrFFGUdREYPL9mbLexNf83txYoeWqs4sMa35PwGjykDsEowK/2FMQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7839
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: M39Qis5qaZcACoc_NTWBgXQa1CnJ5oIe
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=692b1499 cx=c_pps
 a=8SVoR3TXwnQnu/Z+5+8XkA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=62ckJbJJgvJbw-UpsJAA:9 a=CjuIK1q_8ugA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VJje8ksDSWtvw4qlLCj7FubksI6rI6pA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEyNyBTYWx0ZWRfXx9+ROJz0HbWB
 BPeIJ1L/IdyilOE+iYP2Od6cJAdKHu8pEfVkCQsN3im3LhLKqGWe+SuND6CQF1CEtpEtbPYT1YL
 VCqxrnpLvCASP+5hhi3R18ua9G4MCaj6+plqnNXgaGVN7OVnX4V+EwtH+SBytdOfGQ9OOf5ecU6
 KevLc9sdR/fXNslsbcBQg90kcgkltRAxaV7eWPYBn36fFYpDnMXg3DKFhIRE6mG4ULsvkEywwq1
 u2fJ0dE84cCpZcud/RnxtJx0P2naSzYFhaWx2aOvcfdBH3dJZ8cU8Q/3oFMUjvK4oc8j71rPywq
 +hd8Sc2csL0Bm02eNkC/sgFMi4Lu0ztjguu6Kz8egbnAyo9dNjPWxDQRdfUEnn+ctOcUV/An8NH
 pkGeuZZQw9pdNcE5FA/Zftzu6taP4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 15:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226943

Hi Alex,

I think I know what's going on here.
Your sh symlinks to dash, right?

It seems that bash and dash have different behavior on echo + '\n'.

I'll send out V3 so that both dash and bash work as expected.

Regards,
Qi

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Chen Qi via lists.openembedded.org
Sent: Saturday, November 29, 2025 10:24 PM
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org; alex@linutronix.de
Subject: Re: [OE-core][PATCH V2 2/2] rootfs-postcommands.bbclass: remove th=
e '\n' in 'no password' banner

Hi Alex,

Without this patch:

In build directory:
$ cat tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/rootfs/etc=
/issue
Poky (Yocto Project Reference Distro) 5.2.99+snapshot-0cd922ad0f9cf59226660=
c30b1db07e23c09460c \n \l

Type 'root' to login with superuser privileges (no password will be asked).=
\n

On target:
Poky (Yocto Project Reference Distro) 5.2.99+snapshot-0cd922ad0f9cf59226660=
c30b1db07e23c09460c qemux86-64 ttyS0

Type 'root' to login with superuser privileges (no password will be asked).=
qemux86-64

Regards,
Qi


-----Original Message-----
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Saturday, November 29, 2025 9:20 PM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org; alex@linutronix.de
Subject: Re: [OE-core][PATCH V2 2/2] rootfs-postcommands.bbclass: remove th=
e '\n' in 'no password' banner

On Sat, 29 Nov 2025 at 04:54, Chen Qi via lists.openembedded.org <Qi.Chen=
=3Dwindriver.com@lists.openembedded.org> wrote:
> The '\n' means hostname instead of new line in /etc/issues.
> -               echo "Type 'root' to login with superuser privileges (no =
password will be asked).\n" >> ${IMAGE_ROOTFS}/etc/issue
> +               echo "Type 'root' to login with superuser privileges=20
> + (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue

\n does not actually make it into /etc/issue and does get converted to a ne=
wline (as intended) somewhere on the way:

alex@Zen2:/srv/storage/alex/yocto/build-64$ cat tmp/work/qemux86_64-poky-li=
nux/core-image-minimal/1.0/rootfs/etc/issue
Poky (Yocto Project Reference Distro)
5.2.99+snapshot-449cd68248749daedc9990c4094ef5577907ea3d \n \l

Type 'root' to login with superuser privileges (no password will be asked).

alex@Zen2:/srv/storage/alex/yocto/build-64$

Is that not the case in your build?

Alex

