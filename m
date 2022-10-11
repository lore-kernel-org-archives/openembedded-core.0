Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D0BC4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 03:03:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.3202.1665457385087375040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 20:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=kvvLcsE9;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665457385; x=1696993385;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/WxRHpzDUZX/nSW0ermUipRrMZPuGwC+n9/5ZIc9SoA=;
  b=kvvLcsE9m8BIZP1R+vZ2RBQrvuDEsvzNtkK++M9tG8bWvYAEdBJGZeJW
   Zr7LxTu/uD5FxMDbowKLzTDxB4vMB2MsHeGewXA0HRoOcGsfi0dp0f8r0
   kSVREagcQvk30HvquIfM7Qg+2ff5TEpgpkOYyv5qo8I00vk8o7EHeqvAC
   AgMfZsin/TLLMSftyXx5QI+cl1H1xzMHxyMFNAVKPt6RfsAFmvMRDSbLx
   Mv29coYJb1wiibe1r8CA3WihM4l+PDMASggk2co6eYAGbFQCTEVB0cb5j
   K48llxFJEz4wTgk98OTX+d0YSNz+VhdIsrdPJEOhqgWY6t+ubq2KDoBwA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="303132163"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800";
   d="scan'208";a="303132163"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 20:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="628522853"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800";
   d="scan'208";a="628522853"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP; 10 Oct 2022 20:03:04 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 20:03:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 10 Oct 2022 20:03:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 10 Oct 2022 20:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKuwW6DkpxQPCYkhNzDE32xuz3SfsFs2N5mU4OWbRVIbA9hLuYjAo6ckb3zXLvpHIJcCWmxxKajYV8OyLcR+L92Z2BVH+INces8uhPLxUl/W0N0aOvbzNsMMQDbUo0dH8m45B7FbVyS2n5M5tEiYaMM18i9dU7X4k4jaNAngAvkPl4ETRiO8I9wH1nNyziE9YLeIfzIHu9JODGj04Pmcq3N8AEtyi5I0Jxp97DGHWgMfjkcOLpj6MEPBZXxZ9QlW0y/uV+yBjFXBoLVmw4bDC5+dLoUOBKm5gJETo0DQg+FrEx7Ldm6R4h1JDqyHLYnODXzPsyOYL481DKTENvqDwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHPvdivvM8NmXjaM8Qzb6P+R8N2ac3Gpj2VqSXQoprE=;
 b=HbWZpz/JTm8n1MiVIWksmrXgpsUWtG4YPTlOjpvweV36vl8I5ALdED3foC3yQxLf0nGN/ucnHJsno1CDFD4sc5mPF7zKyzPQQyL0Yo7aSDH3gWlc6apV6/oiQ6ZdRS+XymhKC+0TqckjHOtEKz07++XyiT09jSpgw5pT969g2aFZoT31eESlYXst5EoNOIFSVAshpdH5ZLgJT1VFsRGX3+uNlQaRdSxf0upfP5XhmXMQgYzqol3EYSnoQJ4rcmogK90qpPoCs/FB3YwKejnW/wrq02L9bMPaCePtGJX4mWxC+x8/12Y8OMZDHvD9Z9JO6KQi64BQV9GymCJo27N45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 11 Oct
 2022 03:02:57 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::de8d:918d:3dee:3ec4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::de8d:918d:3dee:3ec4%7]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 03:02:57 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "<yocto@lists.yoctoproject.org>"
	<yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.20.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.20.rc2)
Thread-Index: AQHY3NE0d/+HYd/ZOUqwSLVgiNx4+64IgH2g
Date: Tue, 11 Oct 2022 03:02:57 +0000
Message-ID: 
 <BY5PR11MB4152C6DFBAC6C326E59F092BA1239@BY5PR11MB4152.namprd11.prod.outlook.com>
References: 
 <01010183c307a590-5d10c6fa-0719-47ea-9159-9026993db177-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010183c307a590-5d10c6fa-0719-47ea-9159-9026993db177-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM4PR11MB6239:EE_
x-ms-office365-filtering-correlation-id: 1ad0e4be-b810-4675-ac76-08daab35196a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 S1A0IDWHsXGh5/xKESe2pCTa1lk6XIJH8nw555Zs0ubHkey09nGmFoaGzSJ2/pHZebTy4g104+NrsVEKwK7hzFKmfodPTklo6uaa+3LW1vYtW9A8re4t2/32xk5/ojgKkle1yw4Zb2MoyI92BCooaX9+YTGkzYhv8TAEEJOwzOG5Nc+fMxhRFvqKuNfSwEP4CG64FukRTy2VRGsEroPGuSooh1KCKKIt2GYwifLj1MYG7rWB/wo/eYtZmdxe3wfQg0LsPZ+8wOIPljcQFMd6zwxSCMUQsRC97ETzOsWVwGyWmmgaW9EGJMn3cgl5/v/u9SbBEFbHdVmVnob53tYLrWZnWXhti9qaKxEmZUS80DqH5E0RWcVjVpHZggFfxaX72ylOUPlAuY0OdRMPmAefRYdWBqL7IFN4MzMRfHnT6mPYrtuQxr8vGaSS6B9ocAU1WN2qLzUE87sWp8Z8e41RKyyfi0MEirpgN8/9QU7XiavEyU08MFezksUR2wltjFbnQQwEdpJLRfrdq0Dpcwo9lumI0A/5M+sc26wAHoFokAf2EKQjszaKWPENaOu3OuiCPw0euGGQ/ybS/kqkqI+UtH2IW9KbMlTeyRvhvnRQylGpqW2w/1/p7RP4NjDw/ojx/H5LLojSbrtzpjCyNucbGeouM/c04MCNmet9aX9XlJPB9do6ECoFIKZe8sD8c6SPSWXvohUZ1Wloax0flil2Cw+LWj6B1PiUQWBT3Ac/MqVMdMQyTWnv79w7bDaYIIzcfUtg27hPjZLqkSCgjiGWAx0Ae9rUDmX21NhRlVkNCHwlM02XB5Y/4jKrXnunpcIgz6NwrXN9tevvquSJtR0hacDvp4mMdv2AxT1dKEBHlic=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199015)(478600001)(83380400001)(66556008)(66476007)(55016003)(122000001)(66946007)(64756008)(8676002)(33656002)(53546011)(86362001)(110136005)(316002)(76116006)(66446008)(38100700002)(38070700005)(9686003)(186003)(82960400001)(7696005)(6506007)(966005)(26005)(71200400001)(5660300002)(15650500001)(2906002)(41300700001)(8936002)(66899015)(52536014)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bckWZxJPhrkvgtxWIBky1hNCz/t6WuDIJjnQff+CLbJzruSwoJ+O7vvY/aYD?=
 =?us-ascii?Q?ebPjDbv3Izpg31HbrKWk98qR68ea3tElFyrW0cPY8jxZE3nYhBYHj54ARml4?=
 =?us-ascii?Q?uac62xMEeHQY6UwHYTU+wR+rt2yMc1LNNs+UTjFU+9//J/tylUsGJrvxDjMc?=
 =?us-ascii?Q?fT319NNuCdGtAVaVauSwVUkeYcUJF7uLP2jgzXxzEVAzrewlt0sqMCbpPRqe?=
 =?us-ascii?Q?ZqOVE4SEXcoqFKVa/DSYRY+VTvku1rSmDzVGfgcestiKX2T+44SKcPSwrcO7?=
 =?us-ascii?Q?EOJ0vseQViHatR77DMopgkk66WoGSdGAsy4TnUuz8g01B086hsk4FSxgMGnI?=
 =?us-ascii?Q?KM0ERvKnJHao7Pfrzm76FHJxcRWmdTOeJl1Ap0vyCk+kMf35aiZ3ia/+yvZC?=
 =?us-ascii?Q?xgiw4fpkBxcS4UHuSvRBuJgWx4AfSYoaM8D2fNcJ8UV/rKu5iLTJExWMvsoz?=
 =?us-ascii?Q?cetzNa2YDrbH4fRuhovdkwUuurUhsWBRtrTm0lgulTGOpfyuvkqIQF6HaeN3?=
 =?us-ascii?Q?KKjWJPUpoTs6wugBHbYF/9M2Q2Zv5lt5Ia864d9mVtSZfjmuZ3UrgEUAzLhB?=
 =?us-ascii?Q?qEe8tB0Fxym8YSjVJQlLs7fCDjwgztq5w7OYnfAdk6/fVgNioxiBaic7pQRY?=
 =?us-ascii?Q?EbiZW2LWhnuIJL5tPj+8VHHg1ykw1L0R4VVaGK4gcnb9V28wdjmspCMFoYB3?=
 =?us-ascii?Q?BYNvVFdfqEHaA+yLKq7PChg+wlVI5qkkPq2fTaBn/wrbGSNCrS3JoCaDQ1Qw?=
 =?us-ascii?Q?ihUUNhfSf/0Pw+Lz3LugKXU79lrTSvmi12pcs6586kBAhe+J/ZP58iDfsvz5?=
 =?us-ascii?Q?127a7DXbNVXcB0XejWxg8l4DYB1yYr/CjyCUAILXNGvUmkCo88raguAdRISf?=
 =?us-ascii?Q?GMBB2eSqT22G+JAsE20GulHO7ocafFlI1Rkqe8vMrs+xIo/pMuXrTn9JA4mm?=
 =?us-ascii?Q?X0006s8TsyjR9rGRUQGd7w4s6A2NqkUmjhRFn/04jJX08ZWlBUDfuTONOJBr?=
 =?us-ascii?Q?hSbjjiqolLFCNUuheuTSzJG5jEwB1cYrRh7FP4rnb1J+cSUk/4wJz0yZU4Bl?=
 =?us-ascii?Q?oyF2EoXZNfLxyJxIM8kTcEz/z1kWNBuIH0wj3+ZOA316OZjfVnmP/b1+NGy3?=
 =?us-ascii?Q?uaL/Nvg7q4nBkNppRmrq/e0OHkp2Br1/gRdX3ENE1FOG/PDoO7+uNKanO+C2?=
 =?us-ascii?Q?JHCkg+NEUj1L6GICQLS9K9DNP3uJeo8kiLm005PNWnajQMWO3rqC1RE/BiMg?=
 =?us-ascii?Q?YsWlVIe59PlhEWI0kRLIQ33Xhgc1npaxikFhCfpOUG0cB2WEvx8pycuYxfXj?=
 =?us-ascii?Q?MYQmJfXBcSNTEkue1ECXGcESjpk5scJQ4Y5LZZUHquuW8d8eEMQlk5s0v1XH?=
 =?us-ascii?Q?jN+CjMn0R6f1T0TiKcdThx15c1VOG0DgLBcL2Ap2iWAFgTl6DxefWBnSFW7V?=
 =?us-ascii?Q?54tNVA5K4xxVTSW0Kc0SqZ10J9eZj6PbzZ02ZzS4PYIb7yln+McpSDevJv41?=
 =?us-ascii?Q?pjZ1hROuBJYy+OKiAHxiLMW4daTN99L5n66KbKNur74GjCLczw/qGdR05Jrv?=
 =?us-ascii?Q?pIJ2zYbwEugKzEv3uTElmKRTcQEXranWWDNeJxhY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ad0e4be-b810-4675-ac76-08daab35196a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 03:02:57.3915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 AVW0kFW8o3pg0wf2G51eJJnVt6kjAdEL8clPOTDPcvxub2DRdW/gSf8ZmA0+tqOr6kQxOJViP3Jliqw8Ukbqfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6239
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 03:03:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171592

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.20.r=
c2. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone
=20
ETA for completion this Friday, October 14.
=20
Best regards,
Jing Hui



> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, 11 October, 2022 1:53 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.20.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.1.20.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.20.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 048d682b031644fb9f0d41a489bacb873aa27bd7
> meta-agl: da4775d226b2a231e27e8c8995c20fdd3c73f08a
> meta-arm: 08c44df351ae1913f41de8388981b03e21235f09
> meta-aws: 052c9a5f8532ed96487df37bae2f598c129d7d01
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: ed616c50ea329ba6fe68642cfc8bf8c6b8b61beb
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: 6792ebdd966aa0fb662989529193a0940fbfee00
> meta-virtualization: beea119eb529b4a11f266004aee8b548427aea39
> oecore: dbad46a0079843b380cf3dda6008b12ab9526688
> poky: 7f9b7f912e13451a4cd03b10a8090a5def68dc39
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
> View/Reply Online (#188): https://lists.yoctoproject.org/g/qa-build-
> notification/message/188
> Mute This Topic: https://lists.yoctoproject.org/mt/94241972/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


