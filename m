Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAF6CDD56B
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 12:51:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18795.1726750284097232988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 05:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9992e69025=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JA03JD005764
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 12:51:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1wm7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 12:51:23 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48JCpMxd027819;
	Thu, 19 Sep 2024 12:51:22 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1wm7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 12:51:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmecD5DwpqYF+j2Tqc3/E6yBpFK7dpgfYjdkyylA9TLGSVF69KNPpIlmH7kG/D7mUpMxk8fmfSTut2jai7BCogT6VCBX0SY5Y+U/02VfA7OTY7GMH8Thobt3SCLZfHme6RjoXfmoXQ8kyQlkyP2ScBbtNAvc7U6KT3x9lJrJNVgDvHgO3B00OHpNMgI0oSSni385DfuVgIAvTyoeHQqTbH1Dc4YSWLgIE34IQY/D7Nr9Q++s0IUiGe6p22wE2wBCrOv8glScCfxi45nutip49jEPFL01aaraalzbnh/NoleHi2kBaJzbYfcqfWz/ounlgomv8vJcUu5zPxUvD7TNjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pffgHedidtv/L+ksoFOYvgqy/fXP5dKTFs9qw0at4PQ=;
 b=uIqlbQWjIP+HqjGRltUlrWZykGZxADty8dVa2DLq863Kq6ZoPa6Oad4oDTzeDjFENF8eRLdr9SIJwNLH7ZXtgEXjI/PCwQRHKlNHHrpL9KZFuxvJE0wbhlm0xRVUfA0VreIG67b0MiKToqUdVdrlS3pRRsIaWwOdwEWJvbrNyIwjtZlj7jEaWvqMnBiBJ3pIShIGsvIdpzDai0QldDqy5gnCYLRNnYiOTNPNHXl8w23aqY0O9hrRWMv0BSizbeiFpyczql1hCJETrPbJdZjDQsg+ZDygkBAqu0yi3WrOGmIFv31o7K0WqAm2W9H7qT/lZjXSyDvHS6FbrvkYG8T89g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 12:51:20 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 12:51:20 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH v4 2/2] nativesdk-packagegroup-sdk-host: Add
 missing perl modules to RDEPENDS
Thread-Topic: [OE-core] [PATCH v4 2/2] nativesdk-packagegroup-sdk-host: Add
 missing perl modules to RDEPENDS
Thread-Index: AQHbCnhN7I0XzpaveEC2ZQUGx36zDbJe4eQAgAAiMXg=
Date: Thu, 19 Sep 2024 12:51:20 +0000
Message-ID: 
 <PH0PR11MB56583E45E987E6C4CF7B71E8EF632@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20240919094231.3840077-1-Harish.Sadineni@windriver.com>
	 <20240919094231.3840077-2-Harish.Sadineni@windriver.com>
 <599af576201ac8ce88f752d259be0b359119d4d2.camel@linuxfoundation.org>
In-Reply-To: 
 <599af576201ac8ce88f752d259be0b359119d4d2.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5658:EE_|PH0PR11MB4792:EE_
x-ms-office365-filtering-correlation-id: 0897adaa-6030-40ef-e6bd-08dcd8a9c26b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?8suTaH+z4Gl9zNi+O69ZiE0cctyuf2MsyYBNS2zXgSm6EpPmw3XpIfNwVE9n?=
 =?us-ascii?Q?0aCAYOyDPLAQEKVyAU/Lo6g5g/eYwtTgtN3IWA+2xEJ+whHMnOgBlShFxaly?=
 =?us-ascii?Q?Qd+SV6SiQ+Z8vGPM6/6OJvoS4XKQ3P49eppvpOaBy/lCeNyK3wTymH5Hd/aX?=
 =?us-ascii?Q?5CdfWXV7Uy6yxnUyiaahU8c5mnqMB4L84m13zv9isJ1xHijeh2jHgZO/tOxB?=
 =?us-ascii?Q?ksxzKMrXaR+GTNuS1DjFXth43RrjMH43xTy4pEVlesgaDfFK30mOlnEL/Ego?=
 =?us-ascii?Q?o0cb+wjgIR9/DsfqFKI6EuPGy4lxn4qnbQjbDE6/llZ35rAAj6ujKnkKS2nN?=
 =?us-ascii?Q?cPYkf8wRx5EXJKPzBEG44UUZ0k9Xpdq19ujGHM/H5USi+curJlpP0GJ7VYae?=
 =?us-ascii?Q?RVtIsDuwOoLlSEHMYscvKzOU0kZydpZZKnxkiZUboCELYzhAcA48HjUbXRCR?=
 =?us-ascii?Q?L6BvMHa2+RFTJLGTQoY0o0ehuM/8HBTv2+8jW9e/OElVWqsdm4RS2TlFcWmd?=
 =?us-ascii?Q?/rubuMkIfxNNbwOMOS+VB/ZotaHCEcYJpzlf85/vPLsR3cmfmLYIHXKtTTsk?=
 =?us-ascii?Q?d+G+nvZWy6ASSBqYBFH/SzPiDpS5Sah2lQZ9klhyFKCNZ/M1WGqXgIgt3eHv?=
 =?us-ascii?Q?jjAC8h55oxkOQpMFYlV5ZOPvWe2+T2fC4+2E2t9ofvN7NuJPik7s4qNspLyi?=
 =?us-ascii?Q?2ix193detjfos0Q3W1LV6nDCg7Gpx3KbvmTrQ7D97CmNaNDRBF/rONxneyhv?=
 =?us-ascii?Q?cMTMVs/4Bw3TOVPq8WcQTPuH9vtoBXN9qwjD6LA+OVp8Em7v5Hjsd4D5AklU?=
 =?us-ascii?Q?ItbQHQora0vBRusNWOPNB9f8zSYfWuud7J4lpUdIxu1aYLD1x/J47cFHEU1I?=
 =?us-ascii?Q?vzMk529nO/3ELsNBdNFg9pXXuMExOwV4PUPgaS2FRM36bRw6YaAaAT/WyWUL?=
 =?us-ascii?Q?V9QmNhWLxR/8IqpCIIbEy+1Bxl7GwJZbmM+pHzpnCGXn6N1PnxDfsmck13R2?=
 =?us-ascii?Q?rvJRmEh+RB9gM6fxgx0UxLzwctzuSZOxAJ69u02rqzf9lXfh4k+9CuXCYsTM?=
 =?us-ascii?Q?J9Nl5O8/WDYbVXihxQ7WpJLHJ6VlB6ciyz09KgcxpDWehI4soOQK+iB8no6m?=
 =?us-ascii?Q?8V446RMK/o7SSrwp7hmrJ2CqcITVwltIJDQ1rmY/TY7+wCC4wDjsUcnBNG3f?=
 =?us-ascii?Q?XcuykwxAEl7dCo8pDpSnRVogkNwZtVymNKE8Lg7s5aojZ8HPKD7iBAUa5dgO?=
 =?us-ascii?Q?xeTn7rWfINyBtT6tE7E2afsuGDEpg4KmZaOOQ+1bUFFh6T/WDkCPIZhwl7fH?=
 =?us-ascii?Q?+DRttVWktF0NgpaqyZVydVdnYdRiE3dn3ovah+r+0r3gtE2e5+lGXuztcgwT?=
 =?us-ascii?Q?joIxyFQ1h3p9fAjp44AJStw700SHHLYr844HnulqcHZQbl19+A=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3cy1KV+hwFDCOfd8I+5uJR6Xwq0RZGlZQX+UzOLuhcDL9Nlu67ZvDruJrwdj?=
 =?us-ascii?Q?kbpNVomdspOGTRHvaQSe3CCGO5U0j1anpOz2tz8IVwRrpvAOuTYShQBFIHem?=
 =?us-ascii?Q?lX5+9wyIS6vI5mRuxThCpZ6xktf4F4P91nffdYpMut8/IiMnnn7m2JzJDkU6?=
 =?us-ascii?Q?xvqqHGGsxNHC7EifqAYYYGHZcPu3GIZvuVJNBJbyaXkL2MkWR02x9M3Y7d0U?=
 =?us-ascii?Q?e/kLAJvlYtuJ750jboBWUBRxhsqkWnzZivD388RvNohsbWSsfcqCkqn//v1h?=
 =?us-ascii?Q?MI84hFWl2fq/eqWAAvsRsH2WkxjXqochEuKSl5RPn/ruJVPBRNYTj3vR8pYz?=
 =?us-ascii?Q?/GBJ8CS5/ikKkm5Y0BFfAFiFv3RsQu/5vK43RINZo1Fxe882dvSv7ZtTz+Km?=
 =?us-ascii?Q?iZ01w6ebT7YPSaopyW5lFJsb2okA3jPN/WSaMgC10evfCwi4Odujx1CkXe4o?=
 =?us-ascii?Q?V/k9A17I15h/+sl2W1uxn0f7ZL7Urwnf+KrTA2J+WXOUKiH3pA7nGRtJYHSq?=
 =?us-ascii?Q?KbtIv5QZcDXqY7/yzXMMIE/AArd2vYMUOz9mhZaMoUulGzDyB3ye8g4bR35+?=
 =?us-ascii?Q?FNF57ZMy3UEVgl2OLz7Z/20rvVBjSJaTbynZ8H0VbKgylXzHTx+E3xhJfs7Q?=
 =?us-ascii?Q?TCLN45wJqX4mFb0CMjzfD+eGkeaLqPMhu2HB0ecHbD/46oVXcC5qjTAyWUup?=
 =?us-ascii?Q?Tp5ZEtNVFPAoErpGf0Cv2/3ios2URJRvB4FOKwtxteLlbBMmb0z5zzaaCVvy?=
 =?us-ascii?Q?5XdE1p+IqS3hsoONXoeKw+CzusDVXqg5osKQLLOOsOPdThlZuIebnJInZhp5?=
 =?us-ascii?Q?EtZk1AqNxwbV8zV8fZuSXWx6/GD8FOcQNBU7EPNPbXjXNpyagfVafDWGfECr?=
 =?us-ascii?Q?aO1Rt1rfaYJHxt67bUCYxFJp3ORubgHHGfq0G7tmvDB2tW7sUO5zCGeTl8S0?=
 =?us-ascii?Q?n5f3lj0Ly0pFphH+qSRSi9bQ3AMLypGTuvG2mOgwAzIKaMF5aBkMeDZwfq5a?=
 =?us-ascii?Q?qkbbMAaZJRRy74lZ7PeiSeuiL/6HBU3dsCFm1Sf9OYq++E0W04ECOhlv0mUA?=
 =?us-ascii?Q?t8oaYmrUWARMkeUBEy4YJ+OJ0Jb7PSlzQ53m5cNLuJjhMze8dV3KF6AXWdl7?=
 =?us-ascii?Q?rPTC+P2dxodmLOn4+HWumvxvlM3UicdKmbSzvNbNMVra7ZWWTaYLMGHZ6gxC?=
 =?us-ascii?Q?JPlM8wYT0JqMd8g61mufg+R5oZmTCXEfj8pDPL9PFHWDJZonP2UKOuHI6RTu?=
 =?us-ascii?Q?WoBlDB5RbGEt8o28z/S/l+1qnYP8+/OmZyEpD6e6wt9BFUdYZEFdPtIV3XIc?=
 =?us-ascii?Q?3PuVmyZ2Iu7c6/rcxz8Wl87gOBSl7jly7R4E5rb6er8D0Y/ket0bjpD02mNC?=
 =?us-ascii?Q?OUsceP2zLyQ5uWzEq09FPdby+Bxn8FXxtj8Gv7FVGLMpUc0vQVqhpJpfO6Tc?=
 =?us-ascii?Q?0Ib7dOOdsEOIoRTXf6BCWQlKJuEyunpli09f0gula+Z89hsLTiw730igg4KY?=
 =?us-ascii?Q?R/bSX1XqP3zI7qF2ZYuijyVEvXTtlldaJi6e6gLM/TnxpKZVDJ8JI7UEQi6K?=
 =?us-ascii?Q?7vYwbaGcnEfsvmG00KZY6jWHONaKsxcTlfTk11A1mC0TW0ctPPm6ycu5sSuy?=
 =?us-ascii?Q?Mg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB56583E45E987E6C4CF7B71E8EF632PH0PR11MB5658namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0897adaa-6030-40ef-e6bd-08dcd8a9c26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 12:51:20.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fzudMeFFqdPExwaPkKYz994vZNjbanXv+es2lSbAH7kv/aWi8G9IkaTuW8GFtvzel8SwMIXycLNj46ednw3JJQXiGW8x95G66IT9tlItvg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
X-Authority-Analysis: v=2.4 cv=MYM+uI/f c=1 sm=1 tr=0 ts=66ec1e4b cx=c_pps a=7V8mf9/socFTThwl5N0qNQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=yj-aMKAYKbz0kkd27lYA:9 a=CjuIK1q_8ugA:10 a=aMANcCTePVq2-KmA:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: xARnWcIPWgCFAjlmPBemiMiFKhRQ5IUa
X-Proofpoint-ORIG-GUID: q_FALxDlHJUGUfqw6k0VZJ9lM4w-EDgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_09,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409190084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 12:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204683

--_000_PH0PR11MB56583E45E987E6C4CF7B71E8EF632PH0PR11MB5658namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>This doesn't address my feedback/concerns in the original patch.
>SHouldn't these dependencies be added to the nativesdk-binutils-gprofng
>RDEPENDS?

As you suggested, we made changes accordingly and sent v5 .

Thanks
Harish
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Thursday, September 19, 2024 3:35 PM
To: Sadineni, Harish <Harish.Sadineni@windriver.com>; openembedded-core@lis=
ts.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Gowda, Naveen <Naveen.Gowda@windriver.com>; Kokkonda, Sundeep <Sundeep.=
Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH v4 2/2] nativesdk-packagegroup-sdk-host: Add =
missing perl modules to RDEPENDS

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, 2024-09-19 at 02:42 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> In SDK, missing perl modules causes 'x86_64-pokysdk-linux-gp-display-html=
 --help' to abort with below errors..
>   - Can't locate bignum.pm in @INC (you may need to install the feature m=
odule).
>   - Can't locate Math/BigInt.pm in @INC (you may need to install the Math=
::BigInt module)
>
> By adding the following perl modules to RDEPENDS fixes the above errors:
>   nativesdk-perl-module-bignum
>   nativesdk-perl-module-bigint
>   nativesdk-perl-module-math-bigint
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  .../packagegroups/nativesdk-packagegroup-sdk-host.bb           | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-h=
ost.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index c1d3c25060..70a7d3e494 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -30,6 +30,9 @@ RDEPENDS:${PN} =3D "\
>      nativesdk-bison \
>      nativesdk-flex \
>      nativesdk-perl-module-integer \
> +    nativesdk-perl-module-bignum  \
> +    nativesdk-perl-module-bigint \
> +    nativesdk-perl-module-math-bigint \
>      "
>
>  RDEPENDS:${PN}:darwin =3D "\

This doesn't address my feedback/concerns in the original patch.
SHouldn't these dependencies be added to the nativesdk-binutils-gprofng
RDEPENDS?

Cheers,

Richard

--_000_PH0PR11MB56583E45E987E6C4CF7B71E8EF632PH0PR11MB5658namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt;This doesn't address my feedback/concerns in the original patch.<br>
&gt;SHouldn't these dependencies be added to the nativesdk-binutils-gprofng=
<br>
&gt;RDEPENDS?<br>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
As you suggested, we made changes accordingly and sent v5 .&nbsp; &nbsp;<br=
>
<br>
Thanks&nbsp;<br>
Harish</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Thursday, September 19, 2024 3:35 PM<br>
<b>To:</b> Sadineni, Harish &lt;Harish.Sadineni@windriver.com&gt;; openembe=
dded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.o=
rg&gt;<br>
<b>Cc:</b> Gowda, Naveen &lt;Naveen.Gowda@windriver.com&gt;; Kokkonda, Sund=
eep &lt;Sundeep.Kokkonda@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v4 2/2] nativesdk-packagegroup-sdk-hos=
t: Add missing perl modules to RDEPENDS</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 2024-09-19 at 02:42 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:<br>
&gt; From: Harish Sadineni &lt;Harish.Sadineni@windriver.com&gt;<br>
&gt;<br>
&gt; In SDK, missing perl modules causes 'x86_64-pokysdk-linux-gp-display-h=
tml --help' to abort with below errors..<br>
&gt;&nbsp;&nbsp; - Can't locate bignum.pm in @INC (you may need to install =
the feature module).<br>
&gt;&nbsp;&nbsp; - Can't locate Math/BigInt.pm in @INC (you may need to ins=
tall the Math::BigInt module)<br>
&gt;<br>
&gt; By adding the following perl modules to RDEPENDS fixes the above error=
s:<br>
&gt;&nbsp;&nbsp; nativesdk-perl-module-bignum<br>
&gt;&nbsp;&nbsp; nativesdk-perl-module-bigint<br>
&gt;&nbsp;&nbsp; nativesdk-perl-module-math-bigint<br>
&gt;<br>
&gt; Signed-off-by: Harish Sadineni &lt;Harish.Sadineni@windriver.com&gt;<b=
r>
&gt; ---<br>
&gt;&nbsp; .../packagegroups/nativesdk-packagegroup-sdk-host.bb&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3 +++<br>
&gt;&nbsp; 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sd=
k-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host=
.bb<br>
&gt; index c1d3c25060..70a7d3e494 100644<br>
&gt; --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
bb<br>
&gt; +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
bb<br>
&gt; @@ -30,6 +30,9 @@ RDEPENDS:${PN} =3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nativesdk-bison \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nativesdk-flex \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nativesdk-perl-module-integer \<br>
&gt; +&nbsp;&nbsp;&nbsp; nativesdk-perl-module-bignum&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp; nativesdk-perl-module-bigint \<br>
&gt; +&nbsp;&nbsp;&nbsp; nativesdk-perl-module-math-bigint \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt;<br>
&gt;&nbsp; RDEPENDS:${PN}:darwin =3D &quot;\<br>
<br>
This doesn't address my feedback/concerns in the original patch.<br>
SHouldn't these dependencies be added to the nativesdk-binutils-gprofng<br>
RDEPENDS?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB56583E45E987E6C4CF7B71E8EF632PH0PR11MB5658namp_--

