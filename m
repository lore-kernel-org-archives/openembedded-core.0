Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA280EC01C9
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:45:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14187.1774262740188152263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 03:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=kBkYfkHS;
 spf=pass (domain: intel.com, ip: 198.175.65.12, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774262740; x=1805798740;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SUp8JnXftwiUt0+ZP68pH8dLwTl0WTsCWYbss0VV18I=;
  b=kBkYfkHSrTBYsiB09nFgcYvnot4byQlpVX+4JX0JN0kh/ArbqbsTmq+k
   rje0vAA4MqGWa2KDgqQsYiEwXD3/ZU9XYyPj3RH3/fNTfZMC1E05fhhLY
   7F0IrWREIC8mqahHC9GinBJQUYy2XVjG+mi1BrA5VxUwG/gOPzGQ+SLds
   XV+98lm8b8Sqp+UXkgbLciUAqwKyJniYw1RmrkvMpcx2gUKFJGpWAo4vy
   MUx/B6/7fTM8ZIAxKfnmjAeFOR8vq/M/Vg0kFy2W4ufB17zaHFge43k68
   Zqa1p6FSxFq+RS4DLNsZVUazS0GvY+C+3kW61qu3yu/U0xeGhZ7bvz+UC
   Q==;
X-CSE-ConnectionGUID: exsBMIwQSRWOKMKRUTgd1Q==
X-CSE-MsgGUID: KdRg7ZJkTjG5rMartTInvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86730941"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="86730941"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:45:39 -0700
X-CSE-ConnectionGUID: lekEj84KQ5qMdDUCIHidMQ==
X-CSE-MsgGUID: 6rjK1QaTQbG0BisNQf4S2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228064124"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:45:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 03:45:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 03:45:38 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 03:45:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CE1YtdETQufH6FYhg7WEtGSCgQacluavWPP+Xl4icCRpxdAcwc/Qrp/rzDHl5bnf2OG7PZ1aPrirbKq1JU/73vXThFMSPRoWj/W7/eXPT/9zzTC3Dkm6Rq6cfBxa7ru4tt9w92+c9PU+oKZncZj/r/lyYZWzlv66T6LrrQHjq/O++6JPBhBdFJhwyi03n0Dz9sFJ8Xi94T1slKn89ihd9UHKyK3sN942E1tfe4CZEcoajUU25l1OP0fg9h4B1rggDrcXq+OtbW19E3Sb+71VS0CNwHlQDbLGPatOSxIgsQx6DcVtjo6c7aH1M/gllMwm50PQqKXjzB4Vaw612ROFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/bulTWwwtc5+9T+l9nuRW5yWXt7VqlzBSL7YS5RfUQ=;
 b=g/HmOnpOMOAaVvXf0+OyUfcnUSXPWbrFp3ZTu6IFQcqdxhK/gvOfy12g3Fzd+/f+FC/+zaHUWqKXBtefOVpXsHek/zvj1nbhZd0k4x+FwM6Q0m/dBFp4d2ToG9bByj/LxTswS2yxc5yPMQuRq6Nngvf7exAwIWub/onLt2gkyDSP+2XO6DjlTjrsYzB0y/tWI8INJggNmOKrxcC9pzQl5WABh9cRQiiAshP1hUosJqRyilhyKxkXEApY+/DOSYghUqSkinLSL1A7nIBX5K8j6NnW3X4FRuHuvT+8pluUeoG/uPSAEAlnnx8OYCJ1AOpzX97TxByzohq1negPQ3seqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by IA4PR11MB9297.namprd11.prod.outlook.com (2603:10b6:208:56f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 23 Mar
 2026 10:45:35 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9723.018; Mon, 23 Mar 2026
 10:45:35 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3.3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3.3.rc2)
Thread-Index: AQHctWdKUpItgltfjk2YxaJiPMK5EbWyaTiggAmPoCA=
Date: Mon, 23 Mar 2026 10:45:35 +0000
Message-ID: <SN7PR11MB7018E3F70C18E1997C1330EFF44BA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019cf79d32a8-dcb852f5-e466-4b80-9e02-65463eec7210-000000@us-west-2.amazonses.com>
 <189D94ABD7273B12.2629287@lists.yoctoproject.org>
In-Reply-To: <189D94ABD7273B12.2629287@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|IA4PR11MB9297:EE_
x-ms-office365-filtering-correlation-id: 3f8abed0-996f-45ce-0881-08de88c950b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|7053199007|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: BiwZY23UeAN4ljgJ/pcvvAKlVzYiroPnD0bweu2lqdCG8gABPHMmTUJE0zo+fvwEUTJm9mvio3A/k1puvwoqp6Pv7Zs30Mg0z0YGFiJeXAbRKCapy2ki2k9eoOLXnAh40ZJpqIXjwj+tL/SI8NbX2AetzhCr64C+YIbj1jfnk8naMw++njKajrvo/Hje7OANfGqcymgwMpo7m73yblGez/GVLm7kLEkSQtS1d8Nfj6StUrd3T9c4yQavba01rH9JEvaQayXifXa5OVUvBZqU+N/X7Z3F6wi7Yzlen2rJUnKNvUW+2fZc/m/qjJeXLlTxJXxVvcCyaeRWERkcfdgGBg2y+NjLY2on+bc2DMWfphWHpSPwYOB2zVRQG7bM/HW5hw8FSnDKy5GTpGbgqW4bcXq1KJp9eIifC6/sMIK8WoPqoDWUerRnMQm74Hs5B2q4+28uh0FnsvoOensT7iiA2+36uA2B+VEO4K5xAmB3JjsSeP/qhLIa3e0RB81S0zVDeIgNNtidFNtb5S/oKDxSYhp8de27tdEFFdjdSpUy4Agc9XPL8IMkAQWirbcDjuk64gkl+SxkIK+CgxSJy4KgdnSn0lfR1gPFFlzJ3xyUsFsqhs49fK5XpjKi2tda1T+8+G4R5xiYPpsB22sPrPfQ1O4jE9Z4auxr8I4gyNasooXslMtXu5X/LAf992tzswu+aL2rN8f4r8nRdVnQHkARgHodPj8KWZx/y0TohUn08xcnJ4eFpJzMHBOH9IhfU1ne
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(7053199007)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Jdp8biDetwGU7dGmGOVKuVYYdozdrmhp+PAe2eKnPP0S544+TyjdsGMv6Rse?=
 =?us-ascii?Q?d3HQJvQMtZlMVuEGjoER5f+Qfa0PjEofT0ZYU+JHMFoPRVwAARtHjFQcv/uG?=
 =?us-ascii?Q?+QKmZjPY5s0/Y6KuvQanTdUY7r0r8wYA4+II+utSEtMPfV/N5p4yZm7Pwnd0?=
 =?us-ascii?Q?bHLO4rmvp/iubwiQ0ZV65y8GR3LBKMgv/cxiFmzEbvmyd4Qlu8RAfkThGBjt?=
 =?us-ascii?Q?EkZSO/Sz7VE0pCZhMW/gsoT73YZNYLbRx/tPKbEV+rrrxMG2eh8qxT2ejwpx?=
 =?us-ascii?Q?o0+48B2EoV1n04G+JpGXB/wuzP0qgQuM381YjQzngo+ErsMiwE0cVqfG2XJe?=
 =?us-ascii?Q?g2yc1KtLNpz9w1LAy0OWLXMjXR0H5pVbqELmRwGgNJvAX3H+mlaLhetQnyMf?=
 =?us-ascii?Q?R5qrJN/0jdBUEFH55mMBg8bxH32xkjIupc9GaJXDeKBMxHterpDaodDKOPGu?=
 =?us-ascii?Q?24+P1vTWPNeGfAx45iMKXjYdAc0iREWhNeaPg5T7NZIMDAaPjBRSmqm9CO/W?=
 =?us-ascii?Q?gbqqGTPYGVvcqSfS9exXYFMYgc8j9Nh0poh1MC4BMW2RqCjuTPUTesbzTtRK?=
 =?us-ascii?Q?U0PL3dfhPwmcgK8LVBbkjjSZprQclqW+4+XMSJp9+hN/lDG4QrTnS3LCPHCy?=
 =?us-ascii?Q?hQvddIVUKG6ULsMO+I4JoRmHcyak1oL0nIT6MA+Mq1FnkNQxSauPETi7NqHU?=
 =?us-ascii?Q?ppeDs03tQKlUHeJXDejUAMK5hUkhONvXwDZbtWv5eTIOseDAPhop0BFTU0rG?=
 =?us-ascii?Q?LCHOfXQgNoTH4xseQdZ6gg58QWYgAmo6VXI4M2kThA/joimr0jxHsRyuRyd7?=
 =?us-ascii?Q?w16TkTTytgbrmy1zpa4MOOeqyXtF0aVD3MVSPvmrj9bIZ/u/MpfyorXQAQlA?=
 =?us-ascii?Q?x1JxCXFxo9/0O9vadcFVmdjB9zpP4YH+k9P7xR2sS+kh24LyHIWeFcv5gVNT?=
 =?us-ascii?Q?YwYQza9z1nbMyXl0I2+yuAR8xRg1kA1DZEYEYHGaLQiy3+KzE7mPHYoWEIcV?=
 =?us-ascii?Q?yHWH2H+IDhcRgcQhNK/u0Fl9uMPo5aRqErASQbdjhxjD0q0s5viM60aNskY5?=
 =?us-ascii?Q?KzBtqtMKfp9jo6x877Se1PElo8XbLuLeGi6Mp560DENIanFF28mIsXNwYpPs?=
 =?us-ascii?Q?yc4eA0njVCwzG8Eqt3X8hZYJDKwPCCzrrq/KQAvLHDRn66mct2ePeb03ty0C?=
 =?us-ascii?Q?G1mkkWflbxJUDQMYwzhcxuDd5O0oOBdw0Aa0xMDjgC8/ZnVVvwVUY4nyG8Zz?=
 =?us-ascii?Q?W9d95lRYKGY35vyx1l/p8RyFVX0v8Z4HGqMyvYMBpr1H51J5eWIBrfO5v4o6?=
 =?us-ascii?Q?fHgHHPS/6uSpf6fuNK8U8XioaYcF+i3evrw2Tru0E/QLAzPaT4J5bSwsKSAL?=
 =?us-ascii?Q?F5UXnjsoF1Bu1OFiX51VFcdXzHkS9OfVY7gPqJFMDAocPR92MpeeI+ZiWPV/?=
 =?us-ascii?Q?zBbD2iGf1tzpvHplVA7iMQUSJKA0rXCxE1Hgur/7XzUIkMugFWGoE2HHJkqA?=
 =?us-ascii?Q?qBvKP/sg6SYxZ9S17PH3vPuSgy1wPemh9XLvfKu/SSXY7AcP4fezR+cf991B?=
 =?us-ascii?Q?7Sddgcc/eEeIkw+XebNXtT6jBbmFIJZjgti/G/orNH0R8CfL9OheB8oHPxBu?=
 =?us-ascii?Q?Pnlymzw/aUonlkfW2gHTtQW2qcjdpMHGKKW0uu96iQ2E3rkuYb6nnx5VDzxC?=
 =?us-ascii?Q?JMzBGHrDpKAKpVR5Hbu7pr4UG2BD2BFWf63qpi6OZLhpCNJN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qE85Rlu55GG67/WIEC7KXnSBIkt0wmYZ2UCqltJnLceQn4hUufH0SeGZikoGjj2911RYJOSRLjpG5BcjVsCc3xsIsZGlvNKbNfsVDnQ4GAHqlNeKyQE81U9+528vE6gTEedAcKa007aZSVOQVzpSWEr4aoKTItBp3P+nDpvAMVNRFmiNZVelLWz17VHoU/hOq+XFNCV0T9iH1wrmSAREs/dCE4hjhCkb5Ab1CXHsopIgWlZY8qlXNN6/w5GByX5XpwioRkmSO2yTQo8YG2oiVDywf2PtrBLP+KGSfCPboSETJp71voKCXFVMA9ar106h3h84cFrtyjwq5zvRJrWQ9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8abed0-996f-45ce-0881-08de88c950b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 10:45:35.6694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5D0T3uVnZOnymqTv2kDmfgZpg7ohpMpeCNTcMc/MkUFChPwFuIYRigMM5KR8DSrsSE6CqDdtdYANJh8v/j9HVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9297
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 10:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233712

Hi All,


QA for yocto-5.3.3.rc2 is completed.=20

This is the full report for this release:=20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults


=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Ghosh, Debal via lists.yoctoproject.org
Sent: 17 March 2026 14:18
To: qa-build-notification@lists.yoctoproject.org; Yocto-mailing-list <yocto=
@lists.yoctoproject.org>; openembedded-core <openembedded-core@lists.openem=
bedded.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-5.3.3.rc2)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.3.3.rc=
2. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Alder Lake-S
Meteor Lake-P
Arrow lake
Bartlett lake-S
Amston lake
Twin lake
Beaglebone
BeaglePlay

ETA for completion: 23/03/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 16 March 2026 22:37
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.3.3.rc2)


    A build flagged for QA (yocto-5.3.3.rc2) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.3.3.rc2


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3433

    Build hash information:=20

    bitbake: 7af7e04f3adc8ba144d9e2e6b37ed4ddb3b59df0
meta-agl: c1761e898d7fca3d8438e9b010eaf234f94fa407
meta-arm: 73460c53949658ab6c8b46269c3a69caccd3f745
meta-aws: 361115903050329832a005bd2c98ed40b6e8dfd8
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
meta-intel: fc9bc44c9da5e7e7bae38313615aaff5873b843f
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
meta-openembedded: 12fc4c6584e001f89108a6691ccf2028eb05ed5a
meta-qcom: 08826f0bdc9b36db8d5bcdd980b11648b185a930
meta-virtualization: 8f03a0cc8950ef5d5e4f11d9ae494946d1991e45
meta-yocto: 9b98ec5e6cfb6c9dc74d3c2e6304eeb274f7c487
oecore: ab57471acad7ce2a037480dc7b301104620f1ebf
yocto-docs: 82bd1a71e6e6a707d0009725969976cf2256af36


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#676): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/676
Mute This Topic: https://lists.yoctoproject.org/mt/118349130/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



