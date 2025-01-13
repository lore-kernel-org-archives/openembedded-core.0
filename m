Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D81BE7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 06:21:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11468.1736749280835558554
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 22:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3108899ac0=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5vARD032401
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 22:21:20 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1ph5rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 22:21:20 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50D6LJrQ002478;
	Sun, 12 Jan 2025 22:21:19 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1ph5rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 22:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmBTiemM2KJYC+sZOlIH3w3ySOA56YgImX7a22KK538icKfJZFNq3iLLfWmTS1Higbx2burYeY1SpiCxhGgkgoivUOQYjuujmTiPq/KVmEofS5GuJf0raJeOalVWIJAaEfwRMq8eGf/vHRIAzsbEAooGeNqO5hGyt3c1XMMs6/FNcZzlPkrD33rqrFsuim4xsX+6BQNUeuiBrpIv8R2wRy9C7x8+eLYJ7OEJ93Chg714T0nCM9bfU8gEAkjXMZ4W2rEOXzEb0EGNrqYawTZlW/ReXvdLSjZZo4nioARytxP1u8+YhEHWlEPTvJptj0s5sW41WXzaqe4bBOR+uiKlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZxck1ur4+WfYzVJkriVxB9LGdHEa5QQUVug0d1B+/A=;
 b=MMLzxy1BCCWZ8XSOXFA9lTaX4oNBF2M5tkDsa8Qmgp896GY5JW9oJsISvQHwx17kzTubyZ0ZphYgza0xOTLd94LF3nsVT0STyNroCdt0SJdSZlWSBeaqV8BEBSXZaUMCEAdQc7/TTPxUYPzn9xPhrpwxwcg511CRAY6Qjx0sTTFpY0BoxhMDI7IWqAfOx06KgdovwFjdLU2Vh0PuSA1smkiyXqKLw8Romde/GPUy+U3jiEfj5bOIxRVnQOrr3y3gb+zDFF2CpI+Ljg/VFXml9BX8AlQ2h4NZ4WT+IF8vTpWlMGLPXz/vF0pjRG6r7ivZAhvGNkmPJ+2G4BnE8dNexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by DS0PR11MB7624.namprd11.prod.outlook.com (2603:10b6:8:141::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 06:21:17 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%4]) with mapi id 15.20.8335.011; Mon, 13 Jan 2025
 06:21:17 +0000
From: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] pseudo: Fix compile error on
 centos7
Thread-Topic: [OE-core] [meta][kirkstone][PATCH] pseudo: Fix compile error on
 centos7
Thread-Index: AQHbXNl8xjzkfHVY+kyL8mUpVydP8LMJkA4AgApnOrI=
Date: Mon, 13 Jan 2025 06:21:16 +0000
Message-ID: 
 <SN6PR11MB26719EC730477BAD8219880CCD1F2@SN6PR11MB2671.namprd11.prod.outlook.com>
References: <20250102054451.500564-1-guocai.he.cn@windriver.com>
 <afaadd6dc85a15c95a6ed3b5302800abaa0dd527.camel@linuxfoundation.org>
In-Reply-To: 
 <afaadd6dc85a15c95a6ed3b5302800abaa0dd527.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2671:EE_|DS0PR11MB7624:EE_
x-ms-office365-filtering-correlation-id: 40a42d9f-d438-434a-5e3f-08dd339a7ce4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?UAn+gFuxbr20PrdNHoH7vDObqP3JCseqncMP52eHlpPZ2tCrVo6LNpZyIXLj?=
 =?us-ascii?Q?Fw1V+R3a0ru/MYK8hkqaqkXJug11Cupzd+CnRXEkJaaHKI0zoO8MveHL48Pr?=
 =?us-ascii?Q?3qu+k4kwbcTO7dMdK/DL9vi0fXnxh5QMWUwVV1gwxBe4FBIx68Vqe4KcSsL3?=
 =?us-ascii?Q?1zSFt0VuYTLcQnK1H/slN3VMXwckbQ0PJNG3fVnkGZKNZlJQe4zm2HB6Jbjm?=
 =?us-ascii?Q?6CZ9EgYaRk47qFna/3yrx460hXnHP4hh6hsPjIpTrM6xDoMUm3RPAD8UWBf3?=
 =?us-ascii?Q?dJLBpF227BkFE2SyRc5cAqfHvICv5KVCjrMs5VuYlZLrVxjdPdlmrxwq39kU?=
 =?us-ascii?Q?3BZbASA5fQQNW04xLaRWoDF6zxapBIAAb/tysxPYy7LdFjWbe96JpCsVgukr?=
 =?us-ascii?Q?VMztwnoo8VGkDi4teT7MwmBwhl8VrkkW9GCeR5etKkPKxplT32dUkm1J53Ht?=
 =?us-ascii?Q?Ii9PqFn1hBjsfrT8tOCbmi5/0L+sVa14nAiXhamsZB0PacWwmhrJ83cfPXcR?=
 =?us-ascii?Q?Zx1Yih6M8As7Vjr6LYNlsPFhqcRMjqwPFMg4vZZrRYTEihTnwzSVwEEYRvM8?=
 =?us-ascii?Q?fUPtBi69vAT1NR0Iy601qOzZ1qBydznPBXy4bTADdyTh8AXI4fjyX4R9Pyh0?=
 =?us-ascii?Q?o6NQ8s6W7zx6WjhG9PnTIGs8nO3eWO5fsdoPN5rIFKTqZP9WrKcxQd2M3SX4?=
 =?us-ascii?Q?oHeTrJAVa2xVfydpVxACHfzJRKT7Tl/cTn7JUS1tDfdyaQtIFJm7FehEBlWv?=
 =?us-ascii?Q?WKWD2nU7O69bGtQ6WuXwDXblZp+zfitWYrbMCMKFMiA4v1kZNFAYtxh3PKId?=
 =?us-ascii?Q?7zP1f/6vZWi3HWME0qBvYAm1QESe5j8bYWqmIYGPqavd4ewuO/ainL8OsmRJ?=
 =?us-ascii?Q?yXPOyMURn/8e6TcXzMSXRdEvqxFM4Vd8mPEzKDRZK8Q8KuYw55t8Aq52MRE9?=
 =?us-ascii?Q?3G85QjVZ5EGhxGXagXQv3YqszQLkaNlfuB/DbAE/cIzZmoBiYE4FBLxntgKC?=
 =?us-ascii?Q?frHMCV51eov+uk2yqdp8gKT0JbM4duBvRO9qwLHYWnDVEREgh9+w96vB4E3i?=
 =?us-ascii?Q?Yk+WVau2IkjUyAscprYo36cPP8w1RKzAiY/vcLALaNPCokEGytZXtVDGKLE3?=
 =?us-ascii?Q?BjTU/V5lVh2aVKOdOuRBHvvwBzmsyWz9IWRGPVItZVs8hmjmGWB6rwnEbj9R?=
 =?us-ascii?Q?gxcLxbW4KmjPyt8VE4JQcLZ6neuCMm60sSJ9503bOao6ixn4b2Av9U0mYT4v?=
 =?us-ascii?Q?U+HGfKR3xlgJJ8aOTZrKWKfLj2fgLy5kPNazbmZusU3Baj6/2he0N6hKnIkO?=
 =?us-ascii?Q?ZlObVhOBUowG2qRJ9TwG50OmDgWap9Lj7j6zSrwkZaWevijmgN6KEBmdPAzU?=
 =?us-ascii?Q?40KsNF6S3JlBKMrYWSwX8ocwYDIdDDvMtsG/vNQTLyw3QH3Dsg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NdOsNQ32sfN8Kf/Zdrppal986+eftPfFFLpWIvbYw7YIwRXgdELbqKyx9lW3?=
 =?us-ascii?Q?GntpJy+GiTRcnU8RJW8fSzqPJ4ymj5KoYEoJ9M9gcMrwX4i0YETIGuwZzw6S?=
 =?us-ascii?Q?SwWCFD6KXtfwYrO64VP+ZiXIxjfZtukLicsuJEvpoHfELkmsvbLp4NbLQSVE?=
 =?us-ascii?Q?0O3EYtCPWU7Pk2CpgaYYcMkrEuUBze8IZawyB9bEP8enJqNqLysUSQFlLRms?=
 =?us-ascii?Q?qnHQfyt6W4IDJkZy8B2KrKpqU/eekONPPP2ryJIzKkieCcuGN4q4KaBOB07O?=
 =?us-ascii?Q?omQ9Uj2WY2NBXj90PGa7dmEwgezfX7eUb2upksWN+C8ledPzVF2GUZW/JV/x?=
 =?us-ascii?Q?rDQNCeBzc/XBA2Y6AOcUvIARLv6dpT2nDIJ/L5a9t24LWSW0ikO6+m+xh5ah?=
 =?us-ascii?Q?6Ait6wNCEB4pwVvuz+iP5IAGnhS1Pe0mMS+pOQGVBw+2VGd3nstezIlSRouq?=
 =?us-ascii?Q?6aUBDl9jtAMkN5oYWboLUbanSXbPmGj1/jY9fWmESlh9pu6lHp91b1OJagna?=
 =?us-ascii?Q?iT+MvV9lQ0mobsovnpTYGnR7pgGJlhuLPhFtyeheu4pCUqg/o0uCDyWwvkhQ?=
 =?us-ascii?Q?kqkgriHUTZubEGujg3JgxSErBYuhP8GFVMtlgwciKaSPqKAmZH9GlvLCszb3?=
 =?us-ascii?Q?zUeeVwAYBTv9XD5lQ3GWzd9DquT3wwpA7TbK+qBtcp6I1sqHrsobGBnqNjKh?=
 =?us-ascii?Q?i5Af/x6Ox1vdIapzuV2ARq5Up9bDCtJ3fc23MVLxvzII1BSBjSSkHncz1vCy?=
 =?us-ascii?Q?5w69NrA2XIMYjVdtUGZhKZ/ePqK0MjMQnp+JXXlDVUwI7q9tSNAv3Lv5PmDw?=
 =?us-ascii?Q?PeGRKOA2IFdgZHBN0uVBGh1NPdtOwQtf5AfuPcm2qqzmcGgWU0NSl8l3grLq?=
 =?us-ascii?Q?D6BNGO18T+Vu4OnhjtYIz97D+2jerB7emZFsJnld9hnvRjjxcFm4eLfkxq7E?=
 =?us-ascii?Q?o9+y03iZFf1pcevvd8+WBOPVmn79GLaopw5DTRDLqQ2SiWWQz0RLmx+weglr?=
 =?us-ascii?Q?/7E6KEmUbOhBFk2+OHqtwTxsO3CIP1ZV0r/ZGKeY3GhdrSSP8EJbqveIAg3s?=
 =?us-ascii?Q?EF6GhsS3tkGjjhUebHADn1wf2LSXSHeMgqAIrY92aJ2gsfpMAMTGJSurzpuf?=
 =?us-ascii?Q?bctyqBi6hiUuq9A0zuij20zIsImghHPj7DJ93I0wO0mRsO1jFWBjrxOD3Vaa?=
 =?us-ascii?Q?gVGdt/7T+ZrcmW/AF467eDrbHUEQtqsSf9WBhbN4i65sM9eSAqqX+BUK0i9i?=
 =?us-ascii?Q?qP5apdgV/ylvlco4bII7U5uBGzpgENmn0jlU7NCFosPuTfPEjOy6YINIeDzW?=
 =?us-ascii?Q?CtHIDO4mQx4j3PMMRECzwhp9zQ405/ObNJTYP+ABn3INL5NWQ4Q6chcTY4Sj?=
 =?us-ascii?Q?MrAwRTxjnRAbdJrqaqH93PzwK8mWCFP60eV9AOBmoHIVFhncXCCdD3xaf6r9?=
 =?us-ascii?Q?4Ay77IXXA5SOdjYIMMOz8WY8WTsw0crggC/+JVOZf03TMP32j7CkvDtYClif?=
 =?us-ascii?Q?NSLzNW6Dw0KRYSOxqCFjhCdDAy0CUfkOLXwm0YrPpTwdjctMmUExlF0DDi6C?=
 =?us-ascii?Q?5tF7Zz0Kgc4b45qij9v2Aaa4+es8gu9ONueosGbJ?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB26719EC730477BAD8219880CCD1F2SN6PR11MB2671namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a42d9f-d438-434a-5e3f-08dd339a7ce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 06:21:16.9480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01NDm5AHYxY/11BPUV3ZbRPFknH5R43XrUoalvf1rIH6tBrbq0BAk0bPj+G+kjUVWWoxeWANKJPyWWFBwfPBJFtXHF2U+ZON8gtkA+dG6l0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7624
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=6784b0e0 cx=c_pps a=G0EMd8eUBd5ElxF49Cdl+w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=CjuIK1q_8ugA:10 a=GgEQdCMhBuT_Empq:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: QVg6GLcBYcXktRjmdzjNedcw_K4HUh9c
X-Proofpoint-ORIG-GUID: j0u31Ewv3QZA7vLUdrH_zDl48nJTnaeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_02,2025-01-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501130052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 06:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209701

--_000_SN6PR11MB26719EC730477BAD8219880CCD1F2SN6PR11MB2671namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard:
Thanks for your feedback and sorry for the late response on this.

In fact, It is possible to define both _BSD_SOURCE and _DEFAULT_SOURCE simu=
ltaneously.

To define _BSD_SOURCE is mainly to avoid issues on older systems that do no=
t recognize _DEFAULT_SOURCE.

On other newer distros, the effect is the same as defining _DEFAULT_SOURCE =
alone.

we verified on centos7 - ubuntu2004_64 - ubuntu2004_64_dash - opensuse153-6=
4 - ubuntu2204_64 by automation.

And I have verified on ubuntu2204_64 - ubuntu2404_64 - fedora41-64 by manua=
l, that works well.


Cheers,

Guocai

________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Monday, January 6, 2025 6:22 PM
To: He, Guocai (CN) <Guocai.He.CN@windriver.com>; openembedded-core@lists.o=
penembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] pseudo: Fix compile error o=
n centos7

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, 2025-01-02 at 13:44 +0800, guocai he via lists.openembedded.org wro=
te:
> From: Guocai He <guocai.he.cn@windriver.com>
>
> When host is centos7, fix the following build errors:
>
> In file included from pseudolog.c:21:
> /usr/include/sys/stat.h:366:31: error: array type has incomlete element t=
ype
>
> In file included from pseudolog.c:21:
> /usr/include/sys/stat.h:366:31: error: array type has incomplete element =
type "struct timespec"
>   366 |         const struct timespec __times[2],
>       |                               ^~~~~~~
> pseudolog.c: In function "parse_file_type":
> pseudolog.c:214:10: error: "S_IFSOCK" undeclared (first use in this funct=
ion)
>   214 |   return S_IFSOCK;
>       |          ^~~~~~~~
> pseudolog.c: In function "format_one":
> pseudolog.c:754:43: error: "ALLPERM"  undeclared (first use in this funct=
ion)
>   754 |   printf(fmtbuf, (unsigned int) e->mode & ALLPERMS);
>       |                                           ^~~~~~~~
>
> upstream commit:
> https://git.yoctoproject.org/pseudo/commit/?id=3D15b4f4ca25593f684e6517d0=
b809605b443d1953
> When the host is older system,such as centos7, this upstream commit will =
introduce
> the build errors. To add "#define _BSD_SOURCE" is mainly to avoid issues =
on older
> systems that do not recognize _DEFAULT_SOURCE.
>
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>  meta/recipes-devtools/pseudo/files/glibc238.patch | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/rec=
ipes-devtools/pseudo/files/glibc238.patch
> index dfb5c283f6..9a7cd3744d 100644
> --- a/meta/recipes-devtools/pseudo/files/glibc238.patch
> +++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
> @@ -28,6 +28,20 @@ Index: git/pseudo_wrappers.c
>   #include <assert.h>
>   #include <stdlib.h>
>   #include <limits.h>
> +Index: git/pseudolog.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/pseudolog.c
> ++++ git/pseudolog.c
> +@@ -10,6 +10,9 @@
> +  * we then don't get S_IFSOCK... _GNU_SOURCE turns on everything. */
> + #define _DEFAULT_SOURCE
> + #define _XOPEN_SOURCE
> ++/* This is mainly to avoid issues on older systems that do not
> ++ * recognize _DEFAULT_SOURCE. */
> ++#define _BSD_SOURCE
> +
> + #include <ctype.h>
> + #include <limits.h>
>  Index: git/pseudo_util.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- git.orig/pseudo_util.c

Whilst this may fix centos 7 I suspect it may break other newer distros :(

Cheers,

Richard


--_000_SN6PR11MB26719EC730477BAD8219880CCD1F2SN6PR11MB2671namp_
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
Richard:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks for your feedback and sorry for the late response on this.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
In fact, It is possible to define both _BSD_SOURCE and _DEFAULT_SOURCE simu=
ltaneously.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
To define _BSD_SOURCE is mainly to avoid issues on older systems that do no=
t recognize _DEFAULT_SOURCE.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
On other newer distros, the effect is the same as defining _DEFAULT_SOURCE =
alone.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
we verified on centos7 - ubuntu2004_64 - ubuntu2004_64_dash - opensuse153-6=
4 - ubuntu2204_64 by automation.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
And I have verified on ubuntu2204_64 - ubuntu2404_64&nbsp;- fedora41-64 by =
manual, that works well.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Cheers,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Guocai&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Monday, January 6, 2025 6:22 PM<br>
<b>To:</b> He, Guocai (CN) &lt;Guocai.He.CN@windriver.com&gt;; openembedded=
-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&g=
t;<br>
<b>Subject:</b> Re: [OE-core] [meta][kirkstone][PATCH] pseudo: Fix compile =
error on centos7</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 2025-01-02 at 13:44 +0800, guocai he via lists.openembedded.org wro=
te:<br>
&gt; From: Guocai He &lt;guocai.he.cn@windriver.com&gt;<br>
&gt;<br>
&gt; When host is centos7, fix the following build errors:<br>
&gt;<br>
&gt; In file included from pseudolog.c:21:<br>
&gt; /usr/include/sys/stat.h:366:31: error: array type has incomlete elemen=
t type<br>
&gt;<br>
&gt; In file included from pseudolog.c:21:<br>
&gt; /usr/include/sys/stat.h:366:31: error: array type has incomplete eleme=
nt type &quot;struct timespec&quot;<br>
&gt;&nbsp;&nbsp; 366 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cons=
t struct timespec __times[2],<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~=
~~~~~<br>
&gt; pseudolog.c: In function &quot;parse_file_type&quot;:<br>
&gt; pseudolog.c:214:10: error: &quot;S_IFSOCK&quot; undeclared (first use =
in this function)<br>
&gt;&nbsp;&nbsp; 214 |&nbsp;&nbsp; return S_IFSOCK;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ^~~~~~~~<br>
&gt; pseudolog.c: In function &quot;format_one&quot;:<br>
&gt; pseudolog.c:754:43: error: &quot;ALLPERM&quot;&nbsp; undeclared (first=
 use in this function)<br>
&gt;&nbsp;&nbsp; 754 |&nbsp;&nbsp; printf(fmtbuf, (unsigned int) e-&gt;mode=
 &amp; ALLPERMS);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~=
~~~<br>
&gt;<br>
&gt; upstream commit:<br>
&gt; <a href=3D"https://git.yoctoproject.org/pseudo/commit/?id=3D15b4f4ca25=
593f684e6517d0b809605b443d1953">
https://git.yoctoproject.org/pseudo/commit/?id=3D15b4f4ca25593f684e6517d0b8=
09605b443d1953</a><br>
&gt; When the host is older system,such as centos7, this upstream commit wi=
ll introduce<br>
&gt; the build errors. To add &quot;#define _BSD_SOURCE&quot; is mainly to =
avoid issues on older<br>
&gt; systems that do not recognize _DEFAULT_SOURCE.<br>
&gt;<br>
&gt; Signed-off-by: Guocai He &lt;guocai.he.cn@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-devtools/pseudo/files/glibc238.patch | 14 +++++++++=
+++++<br>
&gt;&nbsp; 1 file changed, 14 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/=
recipes-devtools/pseudo/files/glibc238.patch<br>
&gt; index dfb5c283f6..9a7cd3744d 100644<br>
&gt; --- a/meta/recipes-devtools/pseudo/files/glibc238.patch<br>
&gt; +++ b/meta/recipes-devtools/pseudo/files/glibc238.patch<br>
&gt; @@ -28,6 +28,20 @@ Index: git/pseudo_wrappers.c<br>
&gt;&nbsp;&nbsp; #include &lt;assert.h&gt;<br>
&gt;&nbsp;&nbsp; #include &lt;stdlib.h&gt;<br>
&gt;&nbsp;&nbsp; #include &lt;limits.h&gt;<br>
&gt; +Index: git/pseudolog.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/pseudolog.c<br>
&gt; ++++ git/pseudolog.c<br>
&gt; +@@ -10,6 +10,9 @@<br>
&gt; +&nbsp; * we then don't get S_IFSOCK... _GNU_SOURCE turns on everythin=
g. */<br>
&gt; + #define _DEFAULT_SOURCE<br>
&gt; + #define _XOPEN_SOURCE<br>
&gt; ++/* This is mainly to avoid issues on older systems that do not<br>
&gt; ++ * recognize _DEFAULT_SOURCE. */<br>
&gt; ++#define _BSD_SOURCE<br>
&gt; +<br>
&gt; + #include &lt;ctype.h&gt;<br>
&gt; + #include &lt;limits.h&gt;<br>
&gt;&nbsp; Index: git/pseudo_util.c<br>
&gt;&nbsp; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&nbsp; --- git.orig/pseudo_util.c<br>
<br>
Whilst this may fix centos 7 I suspect it may break other newer distros :(<=
br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR11MB26719EC730477BAD8219880CCD1F2SN6PR11MB2671namp_--

