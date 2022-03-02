Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2102C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 07:24:38 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.4993.1646205877508019205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 23:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=L2ycXkBc;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646205877; x=1677741877;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LCf7njsC6WiisrLWj0E7EZZJCRTgROU8Fmcpyg10FPE=;
  b=L2ycXkBcAr3YHiIctALnSLRT6y/6267bxnyk48iXv4u6DnGzGpHfeQ0l
   7Tg85cpP03wbIcxeI2AoO+k1ozbZr6uLIaEByGOqieuoGGhj+5I+pyzz5
   GpiOdxkptrZVC5oEpPwO2BbCG0oyX+xNJsck9AATuR/qXv1Y5GWBXq53y
   fvhdP0MUzu/Yje9bDzo9/7EF+IqbbaoyK9sGyZwrqpFM0zKUSN79d2aeR
   brNRYgJfg3Ex15J43svn3lfuHdJVE/DpM18GY5eClDM7dLorJs761k8Ct
   RJS9ivtuevKm+JFyePr24GEZNZ54Uh1gg/noNivFAD2FW6l2ytz8Y3rSR
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="250906199"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400";
   d="scan'208";a="250906199"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 23:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400";
   d="scan'208";a="545408733"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga007.fm.intel.com with ESMTP; 01 Mar 2022 23:24:34 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 23:24:34 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 23:24:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 23:24:33 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 23:24:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfOYqL50b0JmjMdIZHzOTrOuY+MHNDdT2lKMAc2AauxdqoXwO3XBJu4R5OQdIzvxg1aL24il2MNC0Rn61zx8jd+ryvU1kzvW84LQNaJr0lZ/RjM+DfrWazgBeG8TrmFlNJ4ZK01uru6Umxp4sLJPH7NgLOHfXAzV3a9Xl0He1erFzYhAJhzNmSxfK24L9unLB3ZCXzSmHdak8bWkeb5RkU0bvVlhSaSGfbqfy1ZaFy1mNxniXJSVZ94fEzFjKAvkcxx/qUXkJQpHPKMfjcwAcci6z/FUBtdFXyVsA4BLrikRsDm2bBdIvZT27OOLFsfui29UobDExRcyN62kjTYEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoXsVRNR2cl4Ln+/w5Srz6ZKbkDi+AQ/csmd6vx+9ek=;
 b=aK2RWkpHi8yFYrHcYy87Cq9T8p4ifb+jkJpCWnGWF/JWZ3kyiqScBEKf+alhE6SFtRT8RhUgrokWHLS2phwCn+Fz+DKBSUd9USwcwGgSnnd36LGeba2fqjEJAafBfQz85zFIDxxjfid2QQunpP2XKNE/brM++XpePNQGXw5+U3K9SxiS9CKGxZJL0aTN1Kqso1pHgPYfojz0lTBYg3wfRItoOqc5PStq+hp1q0Q918nB+J/VwMxm29Gt5a3WvM5vCRH4YVY+2oUFIPu/DPcQprDMKHSFVbxom93MaSqwZpZQOCvHZMFQKkCuxXfNrnOIkdA8IhrscOIYHfEkEcGhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com (2603:10b6:3:a6::21)
 by DM6PR11MB3148.namprd11.prod.outlook.com (2603:10b6:5:6f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 07:24:31 +0000
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::d8bf:725a:9d0c:2260]) by DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::d8bf:725a:9d0c:2260%9]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 07:24:31 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 1/2] sstate: do not add TARGET_ARCH to pkgarch
 for cross recipes.
Thread-Topic: [OE-core] [PATCH 1/2] sstate: do not add TARGET_ARCH to pkgarch
 for cross recipes.
Thread-Index: AQHYKyHsrcNAb1F0lEO+lzuq6ppDJKyrtFHg
Date: Wed, 2 Mar 2022 07:24:31 +0000
Message-ID: 
 <DM5PR1101MB2361B9D94AC7EB2CD305BB79B9039@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: <20220226150217.2793953-1-alex@linutronix.de>
In-Reply-To: <20220226150217.2793953-1-alex@linutronix.de>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4eaadbb8-6a55-4e7a-fb0a-08d9fc1db1a3
x-ms-traffictypediagnostic: DM6PR11MB3148:EE_
x-microsoft-antispam-prvs: 
 <DM6PR11MB31485780D3848ED04813A610B9039@DM6PR11MB3148.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RmYOQbDbaj2BC5196QbZdmysQVyKO5NpyV582V1hTSRUjQJjA4sGv9YP6zBKWsQCQvQMabX18VABN+rP/5/Uy4ISa41+NqyKTt2gC8eWkeLtPFInkJnTROipLkGdYxpx/X7d74jdoLeiPRtsp9w165K4Wvb9oUGAnLiO3I09+Gg98kYyFIsUci4bsLa6ksJWYzXov4w/HSmiHQkCk0nA8ASkYh9ojQ6b13mmhbmnplLwbuDIk3KUeXFDRnbYhH0IzZIi+kBG1tuBbKo1mmQvug6hqu+kBywIvuKiwMNTPEzSoltZ76tsfF9LsOPP18hVHbcZ9SxGZ2avk1U49TIpUzdHsZVNzx3k3UIUXmgWJAFSSqVC8cnwL5cikdhGgrciTuoQFtbZBfbvpGFTDosotzuhCGcYKUdnq0NA3/zexc7jqPxiFBPEM8h6boyMQhh5VMp5hQzXZT+kMHBVq70nnJt/aXlsgkwuA3tWU1jqEpbJxRgub6eH7VdOhXD7p4E/SjxfhGkd/yzGswrIqebDNHuOYFeXe2ybV/AlRZDEdFnB6b9NdNGbGXteTF7HJh8apm5hHcw+RSS0eAkdAGoGghcqs+OApGyn8ihVMQZHVyQNaOwuVpXOOitig76TWDWrtNbTM8pIzxjXaLqKiTZiEn5NMirjNdzyu76Bf+sm8e57VKPgi+NglCM/RjsbEjZ03WuTukXlbkIwS0lLJ5f4JP93Gu1fWKLmf3UhlgocJoDPrNoFYov+yLwgSlMQUpxnYKo6N9x/T3AdjoQcmH+aepN1W3pBTmxsWOYqV50QgrM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(83380400001)(33656002)(38100700002)(8936002)(52536014)(82960400001)(5660300002)(64756008)(122000001)(38070700005)(186003)(4326008)(66446008)(316002)(8676002)(66476007)(66556008)(76116006)(66946007)(86362001)(71200400001)(55016003)(9686003)(6506007)(7696005)(966005)(508600001)(53546011)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6UC78jV4CpbBiBY9shM4UgUdhXbu7Lm/53vpc5jPIYm+xOzw24jvLIbRsFG1?=
 =?us-ascii?Q?QfhpuFmMhwlpe12h1SNrx4VmeRvRHpFI9KCtjWmh3FFHgBcb7V17+7Tl96mm?=
 =?us-ascii?Q?okA5JmLVly3DjBLPQmHJhKgGNv8yR1vs3OLxIhkl66sBe4PTygcdkynrTBq5?=
 =?us-ascii?Q?oGkVBQfIUnl8TcrlznT08jDi5SBUvxBS/U2iAZBKC1FEvO/p7yGctTteKcGY?=
 =?us-ascii?Q?By+2W2noiY6dPfAQidrBG5DTYKB4WWIHE1hiKu6AMe6d0fq1k0frRR4Aw8fG?=
 =?us-ascii?Q?KuzqlYIxDtcdtEjkNuQQ6IzkToD0IUSj5Y2gBv50H2hAFBZ1k4lgL51geXY3?=
 =?us-ascii?Q?NvSqSeb6rHmGAR7YZS0kb1aDZPwgsVfMiCHHKZzEWOXPfouWw2GQAqYlVzwk?=
 =?us-ascii?Q?W8/tTqb5XXW8BQwX/mcrcIHJYbFjufVUoTAY1huZ6orhBmCu175UgzHIgGFq?=
 =?us-ascii?Q?eBxbQ8L/YKOergAvwsKl6AQ40r/Cwox47R6gicbaP9hXfC4ntvUsQ3g7XQlQ?=
 =?us-ascii?Q?K7dEB6zmJVe56BFiabSrJkM3uC1loRGoCilPIWbmxUqpFxEzaL+LeTrDJBTb?=
 =?us-ascii?Q?biIgNLcyt50MWRpXtnBcD788OZeS+WQ0+xYB00FFJFKjY0fcs6T8r6AgcYiH?=
 =?us-ascii?Q?jFrEExOzdfT+fUMZeDac6GAWjFvRm8S11yOy3aQO/Vx7QeInK8tMXhoCkT0F?=
 =?us-ascii?Q?v8oC6KpuyfoeuDEV+3yko9TUC2cq//wFzUeYbCsPJAbAOMgI9o15T9q7cdrj?=
 =?us-ascii?Q?JYdfX9cs47e5d0t+oOdwRzWyevPgzzsAPwse2cP5c8TXlmVBMWuyp2S8x0yF?=
 =?us-ascii?Q?cK/DBtrgTU8JH0OkN8GsbXUKspN0o252BoH8aO6W3fGc1V1tYiO9sLydB73M?=
 =?us-ascii?Q?mIW44zY0mBIHp1HYzMm9lddNmO8kv4PfnTPBje6aFD7cEmrRyYeB4hjazUlX?=
 =?us-ascii?Q?mIPfY8J2ORPrlWXKyADqxON8cf9gSrpP0lsAveOPUa+r1RmnFJkOLgOp/7/G?=
 =?us-ascii?Q?5YCUBMCu4pHwlwtbXDhnsJ+OlviJcI8HljXlx0dkTdyPX5X+nGXzhpNNOayb?=
 =?us-ascii?Q?JFwCHB4iip18qQLX5UoAVUaDJu7PnFN/TrOGqo0GL3iMhUJN21zk22MyL6qC?=
 =?us-ascii?Q?ceGmtqnniXkTlGH4c+uQ3CUYd4qacdqeqXVJCrmvHHDq5ypdm4eEMDEdfaHq?=
 =?us-ascii?Q?0j92+7llvf3HQClsXoYDV/oq98qrjL8gbmSd1BNlIOG+PVin+6vDmS3lcMPX?=
 =?us-ascii?Q?RBvFOUlzchHnXzcPRaAJGar20Vqjfphju7q+8+kTNEDStrkqklwt4auw+I6g?=
 =?us-ascii?Q?dfN+NpT+RgP4OMPLUCYAliBeuvc0wvmYBUpNRK0Xc24eo2OwfKPTl4iqcz2/?=
 =?us-ascii?Q?mDcmNMWjf+qeVLsGPgTPRM906G6UMbd08r+7ecbLDqPhqgDgBEC5x93Lkgrs?=
 =?us-ascii?Q?QMJwo4UlGbX0qJ26q8zwuST4YREgnlCWnzlh635tF53s2sVJIE2/V9mfEM+m?=
 =?us-ascii?Q?LL4xD0vhLjViJtLQahlm8+uPTKV/9BXHhBkugDlMH6/RgnBejWAq891II3Op?=
 =?us-ascii?Q?VZ/xNSXQxEZmWld6mIJY1VPSPLoAcVghbCOjLMp59TSgF2lTgPPyfpLd+dwy?=
 =?us-ascii?Q?wODjpbJ2ixOCRB+3S00bjJKkcvmVIjBk0eoqe5AqqxFr6ey3O/+NgGXcZn3q?=
 =?us-ascii?Q?X4Q0gIZLfjVfhBS04oQhUg7Qjt8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4eaadbb8-6a55-4e7a-fb0a-08d9fc1db1a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 07:24:31.3263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 a51a54DOCxOkVK0bTBS+qhJ0d4sXaSF49A2fuju5I9XgEZgxbbg9dgJ9bUxMHvTuYOX5yO9yOOYbsOzJCzzb5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3148
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 07:24:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162594

Need to update selftest too?=20

sstatetests.SStateTests.test_sstate_allarch_samesigs=20

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3234/step=
s/14/logs/stdio


> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: Saturday, 26 February, 2022 11:02 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH 1/2] sstate: do not add TARGET_ARCH to pkgarch =
for
> cross recipes.
>=20
> This is redundant (target arch is already in PN), and breaks compiling a =
cross-
> canadian toolchain, as that needs populating the sysroot with two differe=
nt
> native-hosted toolchains built from cross recipes. Inserting TARGET_ARCH
> allows only one or the other.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/sstate.bbclass | 3 +--
>  meta/lib/oe/sstatesig.py    | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass in=
dex
> 787172b408..dc9a2c085b 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -83,7 +83,6 @@ SSTATE_ARCHS =3D " \
>      ${BUILD_ARCH} \
>      ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
>      ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
> -    ${BUILD_ARCH}_${TARGET_ARCH} \
>      ${SDK_ARCH}_${SDK_OS} \
>      ${SDK_ARCH}_${PACKAGE_ARCH} \
>      allarch \
> @@ -138,7 +137,7 @@ python () {
>      elif bb.data.inherits_class('crosssdk', d):
>          d.setVar('SSTATE_PKGARCH',
> d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
>      elif bb.data.inherits_class('cross', d):
> -        d.setVar('SSTATE_PKGARCH',
> d.expand("${BUILD_ARCH}_${TARGET_ARCH}"))
> +        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}"))
>      elif bb.data.inherits_class('nativesdk', d):
>          d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${SDK_OS}"))
>      elif bb.data.inherits_class('cross-canadian', d):
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py index
> abcd96231e..2cf858e201 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -443,7 +443,7 @@ def find_sstate_manifest(taskdata, taskdata2, tasknam=
e,
> d, multilibcache):
>      elif "-cross-canadian" in taskdata:
>          pkgarchs =3D ["${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}"]
>      elif "-cross-" in taskdata:
> -        pkgarchs =3D ["${BUILD_ARCH}_${TARGET_ARCH}"]
> +        pkgarchs =3D ["${BUILD_ARCH}"]
>      elif "-crosssdk" in taskdata:
>          pkgarchs =3D ["${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"]
>      else:
> --
> 2.20.1


