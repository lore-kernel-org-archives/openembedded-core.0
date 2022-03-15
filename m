Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E182CC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 23:24:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.18754.1647386697924665571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 16:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dmvNkik6;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647386697; x=1678922697;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qeVl9oA2u0G1+Z4jGx0q1hpC7RmvZ9OZw9T/m7g5WNE=;
  b=dmvNkik6MQVcFNhl9o+Zrvd0jf4yB6umGpNxChqfqgaRnKIOPe2YZ/uq
   t8WkBl9NGuI2X5CV1KOlofihIjAtYmJxJxyJU3iCGYrD6fu71+UHMO7mZ
   ONFBYXx9TGGouHHwafowzoBFZgZwNqlsb/kw7lEqCUNgAOa5xEtmm+jMb
   0NPXLwafhN+H+Op901yQrP8a8XKcz2CXBc48L+hXip2LQd0Q97Zds69GO
   x0FTYMnqr1pfkaGnF6gjjbLKGIybUMVP5VqVw8HsL3EGkV1aH5OrqrVTg
   /NO4s31w4G0taji7Rojk9GPwjXfvU4k+w7nYpbpRKsp/Zk6AtlZv1oXZ4
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256635615"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400";
   d="scan'208";a="256635615"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 16:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400";
   d="scan'208";a="512800457"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga002.jf.intel.com with ESMTP; 15 Mar 2022 16:24:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 16:24:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 15 Mar 2022 16:24:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 15 Mar 2022 16:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKWiJ6ka8OvyprypwtrToYeAKwbaJlj17cR/Uc0vTfSLvwLWG3LeEt2Vqr9rVJT8xX7mcRity07NmSHMmiZVAr2sipr1ddy/wRRd3S5vZZ5ZWrlNT7a/+xyPlnfdNwBcCYhUfapMYXp1EJPGk+F9sFWDfASHrh8FC7I8zTnM01cQq0d2Gyej5gw7XTdP1WAZNNRjSd5G/+FHGg32isZFF+5jJ0NFiN/VnXOyFV7JpAi7cVK2Tl5z24NR3qgyqyqk3yef/6+JI3I2W1JNtlafLhPMcs5nXgRyiftlL4Jta7UEGn3ke2YScITTvs4L5dzRMf4tnfg41qp6v/TE1gEeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cvfuZY0/rsQGWISrG21yK1nzIyHnD0CByPHpoy5TOQ=;
 b=XmoWp398sXDSmF6pmqzECulLw2SwP5affY2IkezHx+zJX+VL4gqUZfNbPbH96Nghw08xOfMfEcOc9JWT6iBNvTRd/QU2WlOmLPdA0FWwdtzwhL+sfX3obcAzbdUy6vliMAsXb4/iXPmzuQaEIZt0ymCH9efmew96Zsv36l7pd07wdSdmVdeun0On3D/lPksBNk/e5CrNoRVY6l4NR1QEcEGJxluhJBiS7oMTGd4DG4qU8vyq020R3nuyNbmghwzoKRClRTKSEUUEbPsm7G8LcAWxsqzT3pbyfSPIBpqh4P6IIgkJJRh+Hn74k2pwXQSQt/v+a+OwFIx+/5k46DiOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BN6PR11MB4017.namprd11.prod.outlook.com (2603:10b6:405:79::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Tue, 15 Mar
 2022 23:24:54 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::bb:6323:5ce4:2148]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::bb:6323:5ce4:2148%8]) with mapi id 15.20.5081.014; Tue, 15 Mar 2022
 23:24:54 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com"
	<umesh.kalappa0@gmail.com>
Subject: RE: [OE-core] [honister][PATCH] gcc: sanitizer: Fix tsan against
 glibc 2.34
Thread-Topic: [OE-core] [honister][PATCH] gcc: sanitizer: Fix tsan against
 glibc 2.34
Thread-Index: AQHYOIUbniAjE1A+F0GL7E7UeJgTwazBFiOg
Date: Tue, 15 Mar 2022 23:24:54 +0000
Message-ID: 
 <SJ0PR11MB4896C14AB672EED387038DA3F8109@SJ0PR11MB4896.namprd11.prod.outlook.com>
References: <20220315155507.1410297-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20220315155507.1410297-1-sundeep.kokkonda@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb1a891f-6e8c-4939-8d5f-08da06db0306
x-ms-traffictypediagnostic: BN6PR11MB4017:EE_
x-microsoft-antispam-prvs: 
 <BN6PR11MB4017C078C5F378D7743615B8F8109@BN6PR11MB4017.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T/UPzgKNlqDWDQMqx+1QmRF1NnFees+QHAS3lIS/1lJsP7WusLDisQ/uGXFtpqvX32Tfnf+m0Cf/FRqpV2gZszVYtqyTmlWEIkOqijFd9+IqATL7GJWt+lPYbUXz3ZFBusVlF99wpP805w0oSE4qxZWeXfaZulWW1yAccOtuY2yBdEO/X4k2hVtOiTSw2lcHtd9WDRjKsmyOsTBAyfkq3MxpNN6Gkb9fp0yXqZ4OMn3h8ywYh9p0aA7gGQs4fmEpmAlx/YUArMZuAetuyx29uQCLJyb/0wTYYg30H391pC7k6q/6Un0UtozRJoAYl5KjQgZ/aacWhbilRBrnjHiT9D5Ue0JNNVX5F7xHx9UzZRops4gH0m0vZkTwhz96TyPGbLboQF+ryKIXwklxheIbtOUwYa44AdLMJOlIVvtvJFyebG50ggAQIIr6ePIxKYuE5aa4YGHq3UcXMQVXIaQT1SuYrd/MpsiZAl1Zqx0NhOM1P8XiyqSiShCGx9hOBDgwOWEbN6lP97CFeuSLn8TCBe9KRlkHuA16jitplEJnzuU1NNWXhu2gEjKbrmL4UEpNf60R/s5xpxSAa3vvZ99lU9KCcwtzd683CBfkObKeo06Y9bvVr8HFk2bTc+IS7UzZ0wlLl+r3Lte0HHRYSZqet96sdlQxNWhd/Pbt3h/mx6Y6rND20CVE0YexjzkQNmI+zojFj+TfhctlO5Aj52oiPlSN/fGWppnq1sc6ErqWPGJi3E13HtwvPJnOMIrIbeTK4CtJxghlS4MBCW06GTHd/xkuSFcQYpmAs2tC2DyOaR4MQ/Ly+kDiZztZwvpjgCjvRIdoK897MOp6gCAcVRxgeA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(122000001)(38100700002)(82960400001)(9686003)(186003)(26005)(38070700005)(83380400001)(33656002)(110136005)(54906003)(8936002)(316002)(86362001)(52536014)(5660300002)(8676002)(4326008)(71200400001)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(55016003)(508600001)(7696005)(6506007)(2906002)(53546011)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LbevEW2Bqg2pluG2CCqlVb02uWGasCoquc6Um0q9PlwyFjr22/cyADCAvoOU?=
 =?us-ascii?Q?YqhmMqNmn0zUd8hJxnFSsSGUiUQ2Cl1LY7+c+x9zLKR0iD/oDsCnW8o3FYoe?=
 =?us-ascii?Q?SNcqJjf+NaTypIOm9fUWi85YsPs7ggtj6W9vjJhIuQBQhdyVGaiY+QZGhmRk?=
 =?us-ascii?Q?6mGh6w+I9dDzDWyhVrV1c0dgZz6CACAjTySistSAV0ugdP6RxaoEPxeXdnaa?=
 =?us-ascii?Q?p9ga/pes2eL6dyEhZzBwW9X+uz5sbotU+kW5GCEUjijRW6+iXE6Dp06INf29?=
 =?us-ascii?Q?nSLjLsnFfUy8KQfMq6SnmcTSLA7O+GwKXq80FsnSRQDY+CMu4/t1DGSPI58s?=
 =?us-ascii?Q?xd0ElkR/KWofMKT6LNtXLWoL+gtFN8HiMrtaG6UPcHN/e+Lt9axOjqAyVvAk?=
 =?us-ascii?Q?NBLuvXjBPZ+k3tGdNnebhsrwUCmBTCRjz8zw/v5QdoBHuap1jnTkuZkL3llZ?=
 =?us-ascii?Q?6Al4wy5KpazdHPttM4IaP5HOIasqIewpItKIx1Y/wnv2VFZkL0p3JnnN7Nrn?=
 =?us-ascii?Q?7HcSr1VZetK+Bt9OPl15S2m0iVREJL9ni0CvelHt1SU5miSuLUx861vV76xC?=
 =?us-ascii?Q?PDC7DUo/4HNw/GJjfpxo1tJdkWSVvIlUn3aXd+yHpUND7MuukCT/FvrCKIQc?=
 =?us-ascii?Q?Efc9ZbQh8Fc6p74njihKY84Kxz4JKZ4Nh9MaVbOgsZmSpP8qmYU2qbO6OLb/?=
 =?us-ascii?Q?1FxUn86kh03b1j2DmpCVeyl427tkznmvQcfFv52hoP7rXKRx2XyWrdbkGdWi?=
 =?us-ascii?Q?L6HNuk1kocBoorP3laLV1JSbmptpyZXTGSxYOSr635XubRFQ+MuDJ4CazH7z?=
 =?us-ascii?Q?ymZJlTczGa0fkwgigzMiEtvCliTkkUngpWhfeEgeTglBWr6jz/c+ywUxQLqF?=
 =?us-ascii?Q?dMOK3CsEKeJHkwxxvfWlOLizZmQPEpnyjXOal3TW1pM3OLXzSkqBt5Hnnxum?=
 =?us-ascii?Q?Zwxn17QdkQBPS8yvUtpxZpo15CQ/S9YQBFbVoERVY471GRgtGxKXsxiC+cO7?=
 =?us-ascii?Q?kTl8Cn/ra6AorkkbNNjTQyUXFYJVKRwj3vriuaJJJB9MN46z3NfyQpP/5gj9?=
 =?us-ascii?Q?8zGxeUT/oDP1mysGOKb27Y7nWHe6lVNnQF/SZuEKwH+P9QI5KXAXrvmVVd9N?=
 =?us-ascii?Q?E+rJLcyQPBz1EMb/hEHKrAr2BUi8ffopN9DliXnZk/18KB1rtvj7iseeXABP?=
 =?us-ascii?Q?zaGYTVbrZB+OcSbmXAiS/1QREFBfWQeHySYhK7CaNhAKl3F7+v1UHPznKFq1?=
 =?us-ascii?Q?hLwRl3KYzCIFRka4zIDuc1e2wFVmcseH9HOqwi7ROw8iLtOCcCdPXz3s1rrr?=
 =?us-ascii?Q?M30y8IEr/3oHmtQHbW8u0hqfk99Z1fio38zQBdnFj9PMwz8hG7UYW1U8tOt6?=
 =?us-ascii?Q?yquapMvS/DM4TZ8ODkbeY5/gy3GViPm0mf2xzyMq3SIDQsjtgTXTQNT+OdZw?=
 =?us-ascii?Q?wC52VsVNyRG2g6JpZZ2tD5BXnaPjJwV7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb1a891f-6e8c-4939-8d5f-08da06db0306
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2022 23:24:54.3930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 GKtBVeTTF85GGJ1N4FsnYZOuxDIFTY/DJyvsIebJog4Y0ReT1Bqe+buD09+I/ZElyfqnWc6bdzKI5FVb6LJ8qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4017
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 23:24:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163318



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Sundeep KOKKONDA
> Sent: Tuesday, March 15, 2022 11:55 PM
> To: openembedded-core@lists.openembedded.org
> Cc: rwmacleod@gmail.com; umesh.kalappa0@gmail.com; Sundeep KOKKONDA
> <sundeep.kokkonda@gmail.com>
> Subject: [OE-core] [honister][PATCH] gcc: sanitizer: Fix tsan against gli=
bc 2.34
>=20
> sanitizer: cherry pick 414482751452e54710f16bae58458c66298aaf69
>=20
> The patch is needed in order to support recent glibc (2.34).
>=20
> libsanitizer/ChangeLog:
> 	PR sanitizer/101749
>         * sanitizer_common/sanitizer_posix_libcdep.cpp: Prevent
> 	generation of dependency on _cxa_guard for static
> 	initialization.
>=20
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc         |  1 +
>  .../gcc/0042-Fix-thread-stack-size-init.patch  | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-s=
ize-
> init.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-
> 11.2.inc
> index 40d2b59354..47575dba40 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -77,6 +77,7 @@ SRC_URI =3D "\
>             file://0003-CVE-2021-42574.patch \
>             file://0004-CVE-2021-42574.patch \
>             file://0001-CVE-2021-46195.patch \
> +	   file://0042-Fix-thread-stack-size-init.patch \
>  "
>  SRC_URI[sha256sum] =3D
> "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-ini=
t.patch
> b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
> new file mode 100644
> index 0000000000..02ba2401bb
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patc
> +++ h
> @@ -0,0 +1,18 @@
> +Upstream-Status: Backport
> +[https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D90e46074e6b3561ae7d=
8ebd2
> +05127f286cc0c6b6]

I think this link should be:

https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D91f8a7a34cf29ae7c465603=
a801326767f1cc7e9

This patch itself is missing your Signed-off-by. Please send a v2.

Thanks,

Anuj

> +---
> +--- a/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-=
15
> 07:59:54.515325204 -0700
> ++++ b/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-=
15
> 08:01:45.919405931 -0700
> +@@ -166,9 +166,10 @@
> + #if !SANITIZER_GO
> + // TODO(glider): different tools may require different altstack size.
> + static uptr GetAltStackSize() {
> +-  // SIGSTKSZ is not enough.
> +-  static const uptr kAltStackSize =3D SIGSTKSZ * 4;
> +-  return kAltStackSize;
> ++  // Note: since GLIBC_2.31, SIGSTKSZ may be a function call, so this
> ++ may be  // more costly that you think. However GetAltStackSize is
> ++ only call 2-3 times  // per thread so don't cache the evaluation.
> ++  return SIGSTKSZ * 4;
> + }
> +
> + void SetAlternateSignalStack() {
> --
> 2.25.1


