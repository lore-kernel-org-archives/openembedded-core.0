Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69B1C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 01:59:51 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.3368.1651024789366930847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 18:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=kdYB22KM;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651024789; x=1682560789;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/v6PJDS4ORfG2Stb55BraAcPwKg/ML7Ucnd1RW5BhTw=;
  b=kdYB22KMqhscljXsT/VrvKB+IjILd8zKfWzinvv5Zpk8EwWULNz+aWvk
   obMJbtcvNiGmU6oUfR+cJx7oSHmAlq3l/nW0e5ZVGY79Vs1VhMKrRCYM0
   Lg2PYkSuAfmxorUcavLyS6QXjtNoQdsNDElMThClp3FmLpvSdZ+DA8yYX
   +oGnhstlPSvW6NVrvUM69S9ZbcdhN/7emF3wRVpAYdO9tdhfhosdYdvcG
   UOmF/vrgXjFVP4TIzYbv33OglP+niSkEHh3N1moeJ3pM3T5yxzi4MbbuN
   MV+2dYhK99XMtitty+3cScmcm8VDujtWpLItM+mZxb4vNu4neWOBpVlsQ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="328724240"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400";
   d="scan'208";a="328724240"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 18:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400";
   d="scan'208";a="730550938"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by orsmga005.jf.intel.com with ESMTP; 26 Apr 2022 18:59:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 18:59:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 18:59:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 18:59:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 18:59:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdyZwftkVg5BIR5RiGoNSY6psK+cO+hY0Y6uZR6KeHigAfTZn+CcqZ9kU5UoD1Sb2zpBwoMcYoee9RaX8Nfo6MX0v4HEeX5MI/tc4JNx0SwkkkIummFJFEfYdwzEo1wB+PdaPeZYszw8xStzlLdaz2UZ+R2FSDNQLsgvbrTDjVVwt2ocyk4hfFqAqBFqoklCgTIPQW+nfPrHj+507hv8CmgmksoQdd35PgAVGD0uDk5KB9VbdSHRh8ZH24ABNzkvBXeFw2u+jVSGMaiiVZJLq9KNcZoO1a1vFzXpdYzIwjnwyniMwyZHTu69kMQgCNgmUneranLmf9ZCrX45d2TpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+9ef0cj14ff/ZTE/ToYTraWP+TW6wbpZuk4RzwYT0g=;
 b=m3a90aThNpq6UOmx4wDieNveAX8xqd5xEaIMtYJVeObiuiapM0fNAWXfZCI4OUIB+8VCq9QKEAoxQ/2y0Wxm9fuM/R86w5zK0SfH2TY3XGkEVd5atOssNo9fBfVAAXuzeDAkzJf3oXwsUr6MZskb+uztafGYznoWgNkUliFabzfQ6H6Zp2ZFrSRy1+1AfF6Guw6xjtQvCV3S5vRdez+Afai8ruaCJixGkY51IsLHBDB9TiAux9zgnfQpuhvXOnze3G3zf0QzXJXTU+ybVnRtJwSov388cYOQP3pgfbjSXOvM6QEohZeGZkWBSXFyi3M+goryL5n06fk0mrc4GczLXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by BN6PR1101MB2066.namprd11.prod.outlook.com (2603:10b6:405:52::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 01:59:45 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc%5]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 01:59:45 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.16.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.16.rc1)
Thread-Index: AQHYWVxaj3E3gP/+AkWVx8rHFaIFJq0DAfTw
Date: Wed, 27 Apr 2022 01:59:45 +0000
Message-ID: 
 <DM5PR1101MB2348D01678ED14114DD4D379BBFA9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101018065844051-3f135aa2-6cb1-485c-aa27-2c921567884b-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018065844051-3f135aa2-6cb1-485c-aa27-2c921567884b-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6065f8c6-d676-4cc1-c619-08da27f19a1f
x-ms-traffictypediagnostic: BN6PR1101MB2066:EE_
x-microsoft-antispam-prvs: 
 <BN6PR1101MB206690858815E6B8AB2E7A75BBFA9@BN6PR1101MB2066.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TBon5a3FI0Hp1oLp2xpoQCKHbtOTvV9dMF52pbSbZW6Ha459yqanj0A091beav/IkOQsp7nRNbZFkwAkQ+uae6ER4ImqGiMCvnoNCE1OoUIB/RR5PQbE45eFvYvgYy+Mwh/mQssoEPD945egvwWO6DOpyZqZzGE6FuN0hbNFxs+9PzwJnbMFd9VDsnVzQf6giEoeA19vKiHpyJrr2HOh0CVl44M2rLvD8BTfgUwDSBwvC4IdBwJkx4iROsUiVebRPEWJI04GDvm/H+6YKoyN8GSBDqCXMSd7uYZttaArb7RUKjnaQxOr1UBSytFY6CcmgJlN6T7a3HplLSxyA/atblyAPp8sIhEhwBb2XRsXnT0i8YR9xmBc6gJ9eHortvJhS3v7SLSDlOW/zPUUS9xr9a2JzrhUG472eUcLdbeBn7VH0+TI9a0FJQL94q/Pkwitc3CQF3tsb51XXzob7Pc4mUG+XTgVHTQMDlPoYo8p45j8a37D71zL763hTQeCavCjVIxeiu/qOmXCaxpQwjriq5bcNp6hG9hs2ntFJi08A91x4mdH4M/pnCJhp3RlmsNiaDsRJHI9G+1YsiJulstTfz/r7pfnYYWHbsmKaphmPSIPGj3uFW8R8Gj8MraIVhRU5PHAcpH05RKDTRVAXqOXsm0nJVvW6DM+xdouhUEmMovY7eolFb1LFR+ZXrEI7nkdawdTLJv4PHFagQMOMGPFPiBsnKKrx/T2d4B0xIne82rZcBiX3B3mFXv+/bGFjQJ23Es+E2iBEzHEIaVADihMxxlILNbSvuou98NrZFy4lWI57rQCoWhHIN1OpCGuYGeqC26+dFEGUUuV2X05pc6NGQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(7696005)(122000001)(38070700005)(38100700002)(8936002)(186003)(86362001)(52536014)(5660300002)(966005)(71200400001)(83380400001)(55016003)(508600001)(33656002)(82960400001)(110136005)(6506007)(53546011)(15650500001)(8676002)(2906002)(9686003)(76116006)(66476007)(66556008)(66946007)(66446008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7pXCPItjQfTMm2Y1+kv2j90+BJ13hIYHRt7OYNOWkdx/KIjnOnhSsE0owJYH?=
 =?us-ascii?Q?VPgzzk93iHPj2bWq/BF/L02OOO34Vp8MgECt6LsNvDSGA/toh7TMKMxEQs9V?=
 =?us-ascii?Q?25+/tBsCdzqIhPgiVI6MLEfXawThH3O67DhV/fLR7g5EjGL4zVzgdtPdSLE6?=
 =?us-ascii?Q?XuKmClWeroEYSPLhzEU1I7NQlp/PcOXbrXWBnqXuoPrms7YbPtxJcKPuMX/K?=
 =?us-ascii?Q?rV4BLy0ryn/cqsXH4BpUr4niEKnqXCeYslIfpYtHwnzS1dfzHMr8Q5aiimgJ?=
 =?us-ascii?Q?vtRTyo/AwlnMs/u3vWNTEF9cv806d0l4iGwVVFxW1LB/nWcv3D7SkzCp87Gu?=
 =?us-ascii?Q?Fw/p7DBIOi3hiJj8ZWOKdqolTE34gS2uZvXwHP8HKL8Ui9S2GKM4p6LH/rgu?=
 =?us-ascii?Q?N3BYSW9Kns9ECWyKr9HdBcNnUsyXolPSTF4DuxqM3P831RqKUzxL6zmMvDem?=
 =?us-ascii?Q?n6jCbMaIYyQcQGfrH0Yu9Lxm/K3HPd0VgInZsmiMGwv3ffx/ojIsPhWyHNZc?=
 =?us-ascii?Q?UF6dzFD8pqMHrhxZp00AINNMI7Z3pwwtMYcaYlsCc4ihr7ogTd7xhPQ5aIj1?=
 =?us-ascii?Q?IGwxKHAZidNgZiOytyxaB7v/xixegbSttSstmVCJb7hK2u5ExrlmtAfdY1E8?=
 =?us-ascii?Q?SoCyALDVF7XekI+OImbYA+DepeqDKFDU2s96cmPHgoTK9fpU/7c/egi4NSLO?=
 =?us-ascii?Q?Or0KLCMxEW3UqJvSC/kEhpFi1xwEbK22853iA/eCcVsWpbTJh0U4zpTRxt0h?=
 =?us-ascii?Q?qc7pO+RqcN8CdrbqHIXG0YZgtj20aKQR3WGdhky/7wr1CggsenV/LKulUboR?=
 =?us-ascii?Q?k2ZSy9elP8NYeWG/BuCiGnZvnz1Qu/ZpRVxNSph275+h3gh6mUd0JCIJo9bR?=
 =?us-ascii?Q?RD69sDfZdQdiHzGruK6zSoHeSpmX7QhngSu64qo0o05PFcM9olIOg2IU5qsh?=
 =?us-ascii?Q?/Ed+6bYtSo8k3Axtv9cx0EoeU2Njyv1+vFCBz1HJU9h4XKAJHW1rFIpv5a/p?=
 =?us-ascii?Q?vEgZWa6jeRT/tkZG6TRYuJXsOYfXtFUIEerAEZnd61IH3W5ZVanZVoVMpyHa?=
 =?us-ascii?Q?qCnqnRXo27isWtgRX5k003nJRQRmtLpfGNJfSdoAoSYVtYQldlwZt5UgRpg/?=
 =?us-ascii?Q?Z4UBRh85Wu+0opsD+V9Ue1DbzZrLPWPQo1I6RsfDi3D9cULkOPCa+hpGDiQo?=
 =?us-ascii?Q?ep0Ww4cbDzo91Ww9vxF3JvcAIzTdIrQCavwYnk7vLdX1rLu5TudnBY/IqzoO?=
 =?us-ascii?Q?xjLaa5lIRJdHBste9eD21ukQYQq3/rtXeFn2iql4TlLOaIdTMM7USGhl2zbV?=
 =?us-ascii?Q?fjubzSWZkYcAX93ZCLdaJriBcJ3nmWwe+8YKl2Prz0fMc5mgzHhg9oxEOqak?=
 =?us-ascii?Q?wQjzsi2PaSa4wsSgToj0MELe3MR+okwuXdxT294aq4qilC1uMH3DKd392Y3f?=
 =?us-ascii?Q?rBv/bCcMUN2+YzK306itabh69FJwiezKpdXRVS94yZnie9pcS5J6tzCDQwe/?=
 =?us-ascii?Q?28JnaiNJFy8NAUCKfApSXXfQqErDAXLyhXLnV9LvGaFVesX3HJ6Bi2vtf/W4?=
 =?us-ascii?Q?YzaCLkTJSN513/3HG3wofuiSXokea5WXFebmKl5ZmJWDmRr/vscKMsf6ZcE0?=
 =?us-ascii?Q?EQk1l6HY1bnfs6+FM4E08hZWuq3bdRoFayf1+/PRPBKzqFbHlOXknXfdl2rH?=
 =?us-ascii?Q?k5+Y8EKRtwj1mYsvAhzrCeg83gQxJ2b9WRCOebpkQocg4c7r3UTVAzz5LxpX?=
 =?us-ascii?Q?PsOCMnKb3Gj4kvBTwkXWshzqgYr038hTobuDDXbn0qFhe7eg2AaHjNRN0O39?=
x-ms-exchange-antispam-messagedata-1: U3hXTt9QgUCz2Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6065f8c6-d676-4cc1-c619-08da27f19a1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 01:59:45.2252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 96QXNR8Jd4nFpX0NQ1ahHVdhZzdCvP2128DAkVWIW78OQweMTMOiaYKfB+rKRuQ9Bwqy55G6LzH6ZVprLu95bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2066
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 01:59:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164887

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.16.r=
c1. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone

ETA for completion this Friday, April 29.

Thanks,
Jay
> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, 26 April, 2022 6:57 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.16.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.16.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.16.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 0784db7dd0fef6f0621ad8d74372f44e87fef950
> meta-agl: ca53308f8803fb50709b3f17bb1f9e476366bb62
> meta-arm: 5c09684863be8e803e3e987a5ce4940721c3f39a
> meta-aws: 9979cfa676105cb68cfadfdaeabf044d7c919319
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: affda10724e5e3c7948200e888a91ffdb5d32a11
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: fdd1dfe6b4b2412cc536c26450ce126c960d8107
> oecore: 8e81d38048c953d0823abf04d5b2506cd988f0bb
> poky: f14992950eb90dc168eb82823ab69538f668f8bc
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#138): https://lists.yoctoproject.org/g/qa-build-
> notification/message/138
> Mute This Topic: https://lists.yoctoproject.org/mt/90705155/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


