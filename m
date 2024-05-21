Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB725C25B7A
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 10:23:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16359.1716287009860549275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 03:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5871ff367a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L6iP1N014034
	for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 03:23:29 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y8hx2gau8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 03:23:29 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44LANSpW017116;
	Tue, 21 May 2024 03:23:28 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y8hx2gau6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 03:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2sxzq5MnxyaXT2BUEEwiSw1/D0i+V2St+wRxAZJM4K4xFpYA0cMDgTOsKdQKoJWHuY6czgtUwKTTcf+bHJZ+xq9b1P0lujUn/lbILZSmGj+N7dKGe6VUi1KPzciYTVwnkKu/87huLl/Hv7Qy7nlHmYJZ7Cbka9s0YBSi+jAuFjuYvYEQDQNJlioxBOtdIm1X9p8KmLDEsSy+DDQwsgq6iQFO2tWAYdWJDH5OHkLz1dU2Y0PpQVr9t+CDcMX9IUEpQiRGU+P6bVdVJXkF+AqSw0/jryxPbLeIg4AlZAGTAcxwkuY3j++nYV7juDeYUVRbc8absUkDX9z+j+g9Ji5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaRF1JZSe6ED9lqU0du1uN2OonGyTywNL5RB+bMqGxs=;
 b=nWxiMV8fuVixAGe7Yqse4mQW5t+8CiV5nM3qBWIeVCyRehLTwBdo61F0Iwcv2VRHPpo8VvOdrpdHISiW9XaH8919jEbuozkSn5vemuT6bJwktRzwgmg+YV++RAYb7P+72556L8nJzS2NH3OhKeMt9zBVHreKhkvxUDAaFtMpLRMdoEjiQwe6Q7+JVwGzI3u2kPVlEeP28opMiMH4XsCjal0ygfJZUBOVUnF+4rRhDDBS7AYVZ24QLuWdabeTqhwEg4YN65fUnBQ+0ABNcsE/MNO/6A/9gd9E4UPEmrvLDB5tFdG47XY8Xcwd9CMGGYnVDBLNa2XJpIDRcczUeydcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Tue, 21 May
 2024 10:23:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 10:23:26 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/6] util-linux/util-linux-libuuid: upgrade from
 2.39.3 to 2.40.1
Thread-Topic: [OE-core][PATCH 2/6] util-linux/util-linux-libuuid: upgrade from
 2.39.3 to 2.40.1
Thread-Index: AQHaqo0/cwcL6gkO3US5m1aQc95dPLGhbn6AgAAOCtA=
Date: Tue, 21 May 2024 10:23:26 +0000
Message-ID: 
 <CO6PR11MB5602AB6DB75ECEDAA4BF73C0EDEA2@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240520081040.2380736-1-Qi.Chen@windriver.com>
 <20240520081040.2380736-2-Qi.Chen@windriver.com>
 <20240521093229dcd3708b@mail.local>
In-Reply-To: <20240521093229dcd3708b@mail.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SA1PR11MB8573:EE_
x-ms-office365-filtering-correlation-id: 1eb1e8c3-b9bd-4921-40b2-08dc79800d39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Ri/2jkr613V277PggGTTvC3jybRj4K0wTp+iDAcAZZXbuZtH3gw8sIHOs4v5?=
 =?us-ascii?Q?zA87/ft12tF1jQDV62bZJX9DFslL1cDQQHQktHmNKff/DH9M9f75riJZBEIK?=
 =?us-ascii?Q?wc5anHFMGqwwyPPlUgd4fsClyDZzOxic5TYNqVcAyDjamhqdrGI5vqYJVD77?=
 =?us-ascii?Q?1RDn+YB6wxekak2XV1Nl+d6nqMWNkj8rENmmP3Nm5UB1/jEEzjDTC5heGPzM?=
 =?us-ascii?Q?SJy1DUccTX9wulozoFQTyJqftAVwGVtxShawIhJhWNoXpd5o1A1nAvOzG4kw?=
 =?us-ascii?Q?LpCaXxUsZpHlKQwt22tfZjMy70DnW+7r+C1xx+3iC3oJm6DH60Ylv0TbMcxe?=
 =?us-ascii?Q?mS/2wKN7hiYN35gZKTXDY4LAwvHEuxxD0JNpyJllojrvZenvONe2nWV8vSOo?=
 =?us-ascii?Q?7eHZBoBCJq4iHqzLiUiTRQDd0t7s8m7UCwIXDO+EJY5R0gDsAuwA6zSEyMha?=
 =?us-ascii?Q?Ue5Y44VTASEGulAqb0PAWE+VNN1Qt9HSmf+bC4o/AqNB0Y4/FjNhaTTAbBRB?=
 =?us-ascii?Q?BUWsaYIWmyOd5aHUxBeiNIMJeKwMCVM+InbCA6TUNqEvUXSMF+bUgN1hw4UG?=
 =?us-ascii?Q?CIINUv9s5MBjdgqYfexi1yi6Jxs9nfdgYI2VuOkvEmKUQMv03868/2ZaeYp/?=
 =?us-ascii?Q?TmuFfSbAuo95uj0gKhoT3X3k0EEOHyBqKHJ3REh2JPmnhNDuhL6JqWHWmVVC?=
 =?us-ascii?Q?koeSmIOS0wAL9+DDuFUQjQjdLliQ/AryHl1ybzDbeOYeyLVZGrMc83C1a24i?=
 =?us-ascii?Q?hdVqJH3gUmO7cc6qpHcfj+2IveHRyrgqAg11tQpZnChe9KWOPgVN7cbQz/RC?=
 =?us-ascii?Q?OOj0/KhcjaOtuwsrKabOPBy85tCIfVYAp+VjyKgWSdrb/0VUAZSellM/Cyk8?=
 =?us-ascii?Q?v6CiwA++8pB6dQeXitwPvldkE9ijIXoYQckUpgBNSTL8SMbVIgrdzyDfRMsI?=
 =?us-ascii?Q?K62XlwVv3FakwJcOdYW+SybwAO+AibEpmWuM05fAsajtSqGoUuvwE6iglJTt?=
 =?us-ascii?Q?Ea2TlKBS28kCqdv7vsRYUsDFhuma5/sZln+ZD/WEJ+L0R9bvVa1++trI9mwC?=
 =?us-ascii?Q?r6Hp0TfSdpP+AXqcx4aWtl+Anir+6SJSOBmYa5BS9FpN/qPHA1HcCPVRrRvN?=
 =?us-ascii?Q?iLJ6AQWO9byo1zpezf2yfSv3mgq4c7g/U1cYYKQI01OkZ+IfPp8Rf8ZdPyha?=
 =?us-ascii?Q?lxKUDD3Mnmz7deT90pufe74ISzNDQ9GUHkB7Rh3qs5wQK8o9+B2hHbsSTpMl?=
 =?us-ascii?Q?66rxsmWex4qNLS+acJYoAA38i7Km6OAxji5AmRfn3T7Q19oDWSP8qpKVxtcU?=
 =?us-ascii?Q?lN0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XcQi0TrHjKla9tvAbvYlHYCxYaK98ez6nGHKJX09EQMHReQW10nTwoHQTyv8?=
 =?us-ascii?Q?mRv1eQrvTCngQzJc7UQ4LjVCL+ff6mep5TSwCWaJdLKrMEQK6illAofw9FPa?=
 =?us-ascii?Q?BjsgSB0uSk6NDiRY17P2uyyY0Fd7ijRs5+4ss1hYN+34mVMW748bm1iujRmv?=
 =?us-ascii?Q?z69FF5K1MIhEVM4qsQC2O8TuLB5hS6k8nbFbOpEln8OSSqKcPTLZmcE7TnAP?=
 =?us-ascii?Q?isgMTZadMBSJbzfQ+URcT0dtVDj38KCAaKCxlKIk0LBMfv3o4XJUZJyJy7Nx?=
 =?us-ascii?Q?sV8+Y7vs4aMp/zWUq9yVkUeHRtAkylvVv6xHBSNjxIsaumyKNxkDpuByqMS+?=
 =?us-ascii?Q?GVEM4KxI2Y2AjsVmmtKg8/8CV1fNqy32AJr7YfBaPrj2QR5OpUAHtf/R+wSV?=
 =?us-ascii?Q?Jnymm5M3iA70bxRlhpr8UqRBKhIeHMQN4BkUmtWZS6RrMBk3Lb6lFflpUM7q?=
 =?us-ascii?Q?Gasnc1G8XLOe8mpdi200qq4QA+beCPnVziBNlsS2VbMseGNYOAPt9JqF9LH4?=
 =?us-ascii?Q?CH+xjLZ8vSyDSGxdSKCPGUjCqp1IvLOTYLtrgdYR5WEMw38MgdMOz8b32ZoE?=
 =?us-ascii?Q?g4qKeBIjfaBPulxxSq5sjg/wmf6JilrsVCuU02juY/wbl/aSrcuo0pJLJ11u?=
 =?us-ascii?Q?h7UsOeqx4Do6HloBGHMm0KhgBr8eH/mGem/qtd1fH5luGE1KsDavVYj6Jjzk?=
 =?us-ascii?Q?8bFOHWwuvTX7WP/GoHrCQKSVt3rh8YhjQiL/FlMSqYfJ6HK7MC2asETmFxn1?=
 =?us-ascii?Q?EKnAyM46j6/39oTGcS3bGC9an41Cq7Jfe0KIbKiLCkRCCMwwH5cFNNL4eJin?=
 =?us-ascii?Q?Ch+1S2o3hsAn3WHnOHphzHNcIKMWY7HVpO0PspU7wMldfUCkAVSCLGh5XhNw?=
 =?us-ascii?Q?+7Gc1uXBNeqX7W3lYREONr04RdSgRy1Syp8aAGKPUnMWPJjQF41Qa6WzjEjQ?=
 =?us-ascii?Q?8uHaRdwrqYCfm6q2z5CXFl2pLicNcVexA/qM7oZXD21BmRYbIBhLWhvJK9p0?=
 =?us-ascii?Q?D7vHk5eo6LYKGX0yoTd2OBo9U/BEXNUCGrkt6eo/PlYOCIocbpNBI1eDSN5+?=
 =?us-ascii?Q?0tef6pqloimJViROePSD9PGbffM8fn1kSfnA98d7fsxdf28gnm197H+Cem7S?=
 =?us-ascii?Q?U8PiintdxnbCOr8AQ0RSJdLH2a3A5ax4tub0k22IIgMmDqOArnVa5NKBKei+?=
 =?us-ascii?Q?DuDZtv1VzKw4cuZkAle9tiR+MfOvlJ0OFdmhLQTseVH/5XTxJlp6wUfjyK1Q?=
 =?us-ascii?Q?YL4k9DCQeUunxlsaeGRWebmpI9hXkEcnfNIKivAhHdmrCcWr03FlJbVPkDsy?=
 =?us-ascii?Q?vS+hRg9W0U8LmTy+1CJL1aqZgh12VGjbLLgVyJ/WDjUIPoj8l6TPMpY5YdF3?=
 =?us-ascii?Q?lbx1OtWsrGQpDSlaWk+NVguvAQtai8QXwJjZw0QP+118SxKmsaJbm4D2h5gy?=
 =?us-ascii?Q?c18Cwzl9SKjWBxTfGyIu6PYUc+pI4ycb0RiZggHhQZeCLlmfQbf5sXVmlLhV?=
 =?us-ascii?Q?maM6ozGZVF0Nc9puaxMUSjR2YXBpI2a3YRSY2DwW9zQxbFuO6+Wn00nKOqbf?=
 =?us-ascii?Q?+No9CYv2oT0GR9StrsfW9OJqtUSsrAs/9vEZ/j7x?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb1e8c3-b9bd-4921-40b2-08dc79800d39
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 10:23:26.4287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrXFzwo77WPgfyIw7v4J8rjUlMwACXYRb3GhggamCvwQW1GBdSfPrH+tN2JxJFelCHsz9Xm5hwT7AGbODoOZXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
X-Proofpoint-ORIG-GUID: S0wpbH3Kpkm9onY3-XNL6z9qU-CxdUMn
X-Proofpoint-GUID: o9KKpBX5eZ0wQlQQxo4gVf9jwmZKXbgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_06,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199611

Got it. I'll look into this error, and also the other one you pointed out i=
n another email.

Regards,
Qi

-----Original Message-----
From: Alexandre Belloni <alexandre.belloni@bootlin.com>=20
Sent: Tuesday, May 21, 2024 5:32 PM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 2/6] util-linux/util-linux-libuuid: upgrade fr=
om 2.39.3 to 2.40.1

This fails on the autobuilders:

ERROR: util-linux-2.40.1-r0 do_package: QA Issue: util-linux: Files/directo=
ries were installed but not shipped in any package:
  /lib/security/pam_lastlog2.so

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9011/step=
s/15/logs/stdio

On 20/05/2024 16:10:36+0800, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> License-Update:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> GPL-2.0 is changed to GPL-2.0-only in README.licensing.
>=20
> The following two patches are removed as they've been there in new releas=
e:
>=20
>   0001-login-utils-include-libgen.h-for-basename-API.patch
>   mit-license.patch
>=20
> Other existing patches are refreshed to avoid patch-fuzz error.
>=20
> A new PACKAGECONFIG, lastlog2, is added, which serves as a switch to=20
> build Y2038 safe lastlog pam module. This is a new functionality added in=
 2.40.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...2.39.3.bb =3D> util-linux-libuuid_2.40.1.bb} |  0
>  meta/recipes-core/util-linux/util-linux.inc   |  8 +--
>  ...ls-include-libgen.h-for-basename-API.patch | 60 -------------------
>  .../util-linux/avoid_parallel_tests.patch     |  5 +-
>  .../util-linux/configure-sbindir.patch        |  7 +--
>  .../display_testname_for_subtest.patch        |  7 +--
>  .../util-linux/util-linux/mit-license.patch   | 45 --------------
>  .../util-linux/util-linux/ptest.patch         | 11 ++--
>  ...l-linux_2.39.3.bb =3D> util-linux_2.40.1.bb} |  3 +-
>  9 files changed, 18 insertions(+), 128 deletions(-)  rename=20
> meta/recipes-core/util-linux/{util-linux-libuuid_2.39.3.bb =3D>=20
> util-linux-libuuid_2.40.1.bb} (100%)  delete mode 100644=20
> meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libge
> n.h-for-basename-API.patch  delete mode 100644=20
> meta/recipes-core/util-linux/util-linux/mit-license.patch
>  rename meta/recipes-core/util-linux/{util-linux_2.39.3.bb =3D>=20
> util-linux_2.40.1.bb} (99%)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb=20
> b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
> similarity index 100%
> rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
> rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
> diff --git a/meta/recipes-core/util-linux/util-linux.inc=20
> b/meta/recipes-core/util-linux/util-linux.inc
> index d506783f9a..0f5f838e84 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -6,7 +6,7 @@ disk partitioning, kernel message management,=20
> filesystem creation, and system lo
> =20
>  SECTION =3D "base"
> =20
> -LICENSE =3D "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & B=
SD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
> +LICENSE =3D "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2=
.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
>  LICENSE:${PN}-fcntl-lock =3D "MIT"
>  LICENSE:${PN}-fdisk =3D "GPL-1.0-or-later"
>  LICENSE:${PN}-libblkid =3D "LGPL-2.1-or-later"
> @@ -14,7 +14,7 @@ LICENSE:${PN}-libfdisk =3D "LGPL-2.1-or-later"
>  LICENSE:${PN}-libmount =3D "LGPL-2.1-or-later"
>  LICENSE:${PN}-libsmartcols =3D "LGPL-2.1-or-later"
> =20
> -LIC_FILES_CHKSUM =3D=20
> "file://README.licensing;md5=3Dcc80239f106687ab39ef0271ff5cf4ba \
> +LIC_FILES_CHKSUM =3D=20
> +"file://README.licensing;md5=3Dddd58b6c94da86ff4f03e91208eb9cfc \
>                      file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 \
>                      file://Documentation/licenses/COPYING.GPL-2.0-or-lat=
er;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>                     =20
> file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=3D4fbd65380c
> dd255951079008b364516c \ @@ -30,7 +30,6 @@ LIC_FILES_CHKSUM =3D=20
> "file://README.licensing;md5=3Dcc80239f106687ab39ef0271ff5cf4ba
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/util-linux:"
>  MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION=
}/util-linux-${PV}.tar.xz \
> -           file://mit-license.patch \
>             file://configure-sbindir.patch \
>             file://runuser.pamd \
>             file://runuser-l.pamd \
> @@ -38,8 +37,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
>             file://run-ptest \
>             file://display_testname_for_subtest.patch \
>             file://avoid_parallel_tests.patch \
> -           file://0001-login-utils-include-libgen.h-for-basename-API.pat=
ch \
>             file://fcntl-lock.c \
>             "
> =20
> -SRC_URI[sha256sum] =3D "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b9681=
0bd572e167dfed0f"
> +SRC_URI[sha256sum] =3D "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef14747=
52fad92461def24f"
> diff --git=20
> a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-lib
> gen.h-for-basename-API.patch=20
> b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-lib
> gen.h-for-basename-API.patch
> deleted file mode 100644
> index 6258710e1e..0000000000
> ---=20
> a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-lib
> gen.h-for-basename-API.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From d44e3ad1f6f8b5c1b3098bb7d537943a4c21d22f Mon Sep 17 00:00:00=20
> 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 3 Dec 2023 19:59:46 -0800
> -Subject: [PATCH] login-utils: include libgen.h for basename API
> -
> -musl has removed the non-prototype declaration of basename from=20
> string.h [1] which now results in build errors with clang-17+ compiler
> -
> -include libgen.h for using the posix declaration of the funciton.
> -
> -Fixes
> -
> -../util-linux-2.39.2/login-utils/su-common.c:847:20: error: call to unde=
clared function 'basename'; ISO C99 and later do not support implicit funct=
ion declarations [-Wimplicit-function-declaration]
> -  847 |                 shell_basename =3D basename(shell);
> -      |                                  ^
> -
> -[1]=20
> https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd22487b
> b64470881e86a92e7
> -
> -Upstream-Status: Submitted=20
> [https://github.com/util-linux/util-linux/pull/2615]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - login-utils/su-common.c | 10 +++++++---
> - 1 file changed, 7 insertions(+), 3 deletions(-)
> -
> -diff --git a/login-utils/su-common.c b/login-utils/su-common.c -index=20
> b674920..3297c78 100644
> ---- a/login-utils/su-common.c
> -+++ b/login-utils/su-common.c
> -@@ -26,6 +26,7 @@
> - #include <sys/types.h>
> - #include <pwd.h>
> - #include <grp.h>
> -+#include <libgen.h>
> - #include <security/pam_appl.h>
> - #ifdef HAVE_SECURITY_PAM_MISC_H
> - # include <security/pam_misc.h>
> -@@ -840,17 +841,20 @@ static void run_shell(
> - 				su->simulate_login ? " login" : "",
> - 				su->fast_startup ? " fast-start" : ""));
> -
> -+  char* tmp =3D xstrdup(shell);
> - 	if (su->simulate_login) {
> - 		char *arg0;
> - 		char *shell_basename;
> -=20
> --		shell_basename =3D basename(shell);
> -+		shell_basename =3D basename(tmp);
> - 		arg0 =3D xmalloc(strlen(shell_basename) + 2);
> - 		arg0[0] =3D '-';
> - 		strcpy(arg0 + 1, shell_basename);
> - 		args[0] =3D arg0;
> --	} else
> --		args[0] =3D basename(shell);
> -+	} else {
> -+    args[0] =3D basename(tmp);
> -+  }
> -+  free(tmp);
> -=20
> - 	if (su->fast_startup)
> - 		args[argno++] =3D "-f";
> diff --git=20
> a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch=20
> b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
> index 85ad7a5575..8ea00dbb95 100644
> ---=20
> a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
> +++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.pat
> +++ ch
> @@ -1,4 +1,4 @@
> -From 0b05e4695a0616badef71dfa459a00ef6ff1b521 Mon Sep 17 00:00:00=20
> 2001
> +From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00=20
> +2001
>  From: Tudor Florea <tudor.florea@enea.com>
>  Date: Mon, 14 Jun 2021 14:00:31 +0200
>  Subject: [PATCH] util-linux: Add ptest @@ -9,13 +9,12 @@ Revert=20
> run.sh script accordingly to serialize running tests
> =20
>  Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
>  Upstream-Status: Inappropriate
> -
>  ---
>   configure.ac | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/configure.ac b/configure.ac -index 890212f..870e817=20
> 100644
> +index 651ef2b..2a8012e 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4]) diff --git=20
> a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch=20
> b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> index 75adeca188..74abdc2038 100644
> --- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> +++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> @@ -1,4 +1,4 @@
> -From c79222a9a5e3425c55e150edc0b7ac59c573aa2f Mon Sep 17 00:00:00=20
> 2001
> +From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00=20
> +2001
>  From: Phil Blundell <pb@pbcl.net>
>  Date: Mon, 24 Sep 2012 07:24:51 +0100
>  Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected @@=20
> -9,16 +9,15 @@ fix the test, the [ ] syntax was getting eaten by=20
> autoconf
>  Signed-off-by: Phil Blundell <pb@pbcl.net>
>  Signed-off-by: Saul Wold <sgw@linux.intel.com
>  Upstream-Status: Inappropriate [configuration]
> -
>  ---
>   configure.ac | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> =20
>  diff --git a/configure.ac b/configure.ac -index 36c24b4..890212f=20
> 100644
> +index 23594ff..651ef2b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -102,7 +102,10 @@ AC_SUBST([runstatedir])
> +@@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
>   usrbin_execdir=3D'${exec_prefix}/bin'
>   AC_SUBST([usrbin_execdir])
>  =20
> diff --git=20
> a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest
> .patch=20
> b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest
> .patch
> index 815ae9c915..871b0b2d30 100644
> ---=20
> a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest
> .patch
> +++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_sub
> +++ test.patch
> @@ -1,20 +1,19 @@
> -From fc5de1de898fd1a372a2fd2fa493dc57323a029d Mon Sep 17 00:00:00=20
> 2001
> +From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00=20
> +2001
>  From: Tudor Florea <tudor.florea@enea.com>
>  Date: Thu, 3 Dec 2015 04:08:00 +0100
>  Subject: [PATCH] Display testname for subtest
> =20
>  Signed-off-by: Tudor Florea <tudor.florea@enea.com>
>  Upstream-Status: Pending
> -
>  ---
>   tests/functions.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/tests/functions.sh b/tests/functions.sh -index=20
> 5a562a3..098145e 100644
> +index 5fe5ba0..a6c703e 100644
>  --- a/tests/functions.sh
>  +++ b/tests/functions.sh
> -@@ -437,7 +437,7 @@ function ts_init_subtest {
> +@@ -450,7 +450,7 @@ function ts_init_subtest {
>  =20
>   	if [ "$TS_PARSABLE" !=3D "yes" ]; then
>   		[ $TS_NSUBTESTS -eq 1 ] && echo
> diff --git a/meta/recipes-core/util-linux/util-linux/mit-license.patch=20
> b/meta/recipes-core/util-linux/util-linux/mit-license.patch
> deleted file mode 100644
> index afbec98f18..0000000000
> --- a/meta/recipes-core/util-linux/util-linux/mit-license.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 5b8fab1584017d9d9be008c23b90128bba41a7b5 Mon Sep 17 00:00:00=20
> 2001
> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Date: Thu, 28 Mar 2024 12:16:57 +0000
> -Subject: [PATCH] README.licensing/flock: Add MIT license mention
> -
> -Looking at the license text, flock.c is under the MIT license (see=20
> -https://spdx.org/licenses/MIT).
> -
> -Add an SPDX license identifier header and add to the list of licenses=20
> the -source so everything is correctly listed/identified.
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -Upstream-Status: Submitted=20
> [https://github.com/util-linux/util-linux/pull/2870]
> -
> ----
> - README.licensing  | 2 ++
> - sys-utils/flock.c | 4 +++-
> - 2 files changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/README.licensing b/README.licensing -index=20
> 4454f8392a..535ad34813 100644
> ---- a/README.licensing
> -+++ b/README.licensing
> -@@ -12,6 +12,8 @@ There is code under:
> -=20
> -    * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any =
later version
> -
> -+   * MIT                - MIT License
> -+
> -    * BSD-2-Clause       - Simplified BSD License
> -=20
> -    * BSD-3-Clause       - BSD 3-Clause "New" or "Revised" License
> -diff --git a/sys-utils/flock.c b/sys-utils/flock.c -index=20
> fed29d7270..7d878ff810 100644
> ---- a/sys-utils/flock.c
> -+++ b/sys-utils/flock.c
> -@@ -1,4 +1,6 @@
> --/*   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
> -+/*   SPDX-License-Identifier: MIT
> -+ *
> -+ *   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
> -  *
> -  *   Permission is hereby granted, free of charge, to any person
> -  *   obtaining a copy of this software and associated documentation
> diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch=20
> b/meta/recipes-core/util-linux/util-linux/ptest.patch
> index 6221de7182..7345926b88 100644
> --- a/meta/recipes-core/util-linux/util-linux/ptest.patch
> +++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
> @@ -1,24 +1,23 @@
> -From d0a69ce80c579cbb7627a2f20e8b92e006a8d8ad Mon Sep 17 00:00:00=20
> 2001
> +From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00=20
> +2001
>  From: Tudor Florea <tudor.florea@enea.com>
>  Date: Thu, 3 Dec 2015 04:08:00 +0100
>  Subject: [PATCH] Define TESTS variable
> =20
>  Signed-off-by: Tudor Florea <tudor.florea@enea.com>
>  Upstream-Status: Pending
> -
>  ---
>   Makefile.am | 1 +
>   1 file changed, 1 insertion(+)
> =20
>  diff --git a/Makefile.am b/Makefile.am -index effbb02..7d2bd1e 100644
> +index 50ab8d0..7e2340d 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -57,6 +57,7 @@ systemdsystemunit_DATA =3D
> +@@ -64,6 +64,7 @@ tmpfiles_DATA =3D
>   dist_bashcompletion_DATA =3D
>   check_PROGRAMS =3D
>   dist_check_SCRIPTS =3D
>  +TESTS =3D $(check_PROGRAMS)
>  =20
> - PATHFILES =3D
> - ADOCFILES_COMMON =3D
> + BUILT_SOURCES =3D
> +=20
> diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb=20
> b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> similarity index 99%
> rename from meta/recipes-core/util-linux/util-linux_2.39.3.bb
> rename to meta/recipes-core/util-linux/util-linux_2.40.1.bb
> index 2cd7750afc..eceb0495a7 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> @@ -90,7 +90,7 @@ EXTRA_OECONF:append =3D " --disable-hwclock-gplv3"
>  # build host versions during development  #  PACKAGECONFIG ?=3D "pcre2"
> -PACKAGECONFIG:class-target ?=3D "${@bb.utils.contains('DISTRO_FEATURES',=
 'pam', 'chfn-chsh pam', '', d)}"
> +PACKAGECONFIG:class-target ?=3D "${@bb.utils.contains('DISTRO_FEATURES',=
 'pam', 'chfn-chsh pam lastlog2', '', d)}"
>  # inherit manpages requires this to be present, however util-linux=20
> does not have  # configuration options, and installs manpages always =20
> PACKAGECONFIG[manpages] =3D ""
> @@ -106,6 +106,7 @@ PACKAGECONFIG[pcre2] =3D ",,libpcre2"
>  PACKAGECONFIG[cryptsetup] =3D "--with-cryptsetup,--without-cryptsetup,cr=
yptsetup"
>  PACKAGECONFIG[chfn-chsh] =3D "--enable-chfn-chsh,--disable-chfn-chsh,"
>  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
> +PACKAGECONFIG[lastlog2] =3D "--enable-liblastlog2,--disable-liblastlog2,=
sqlite3"
> =20
>  EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFLAGS=
}'"
> =20
> --
> 2.34.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199557): https://lists.openembedded.org/g/openembedde=
d-core/message/199557
> Mute This Topic: https://lists.openembedded.org/mt/106199572/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

