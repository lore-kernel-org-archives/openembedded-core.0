Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A38CC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 09:57:29 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.124392.1683021448052616065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 02:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=G5axHN22;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683021448; x=1714557448;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=v8RdGsim8ubQuhbPEVJFBcFO0JDYP9tM1jay5VrFmNM=;
  b=G5axHN228PMIZ7y6hfyFgmQsfcCWbF2Qubttd0zh4cby9wKz/OdkbMjF
   5NTF8vd4etyrDO9wds0zA/ehWQ93p4MPup3YuP4o5rceIHxPqidUzkLpF
   L++MFMZDecEHuUo30zwQRMWulnU2Z7PJz85TOf4RwTVKvu2bwfzcw7ZVZ
   qWasKQ1PLF8TuYaHGOTe3C8WHH1TVbMREavE5MuX9GFaPlwL1Y5OGczLP
   eLkwhFL7NKQ76xXxPJUO5OrYYy/5nDJhAaIv+CNWTekN3G5Wi2aqgIa0e
   J7ZBgc414egTYP627evPNr74bnOJugX8nM/ssirl0Z8lSQf8QzW1GG57S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="345834888"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="345834888"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 02:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="698903125"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="698903125"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 02 May 2023 02:57:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 02:57:27 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 02:57:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 02:57:26 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 02:57:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIMZf9sEE+nuyKBeqsacZXaay3Autz+EQxv+8DU88nwFHPFiutQ1W5WO9nWD4Wna62+8c5QZHxYrSLR1z2znJk95tHK7R+Rm0asTfyUa7LMfwIwtvFP1rPhMl8q6Sbc9WrXZNBCHyS49ZMnviCYXaxwE679fFqcEupn6KvC5IM8+LLGjICspLrv+wizFyhUZBNIwcBk3XKchpDpUq2z86FDHE8QgwCFwsAUqu/g5arxFkebMTic/CWNe/mwLme/SzDNrvlCclrFBjvRI7YO0mitRVCJ9DQbi74ap2ovENBULu+PLuAsitCdYGPWc98rO/CWYGfaeCt80iDjqF7L04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T0tG9NkC3VYNDN+kJnjOAQVXY5gfzSiZl7HLr0+YBA=;
 b=mg1gWy/qN3ZIgicAXqCj4Fj2PAMsIgSMkx/MLUA3plc/QGR4Ms7apo8dTLVWpGN1w0j/ZwrL8tWClaW5Lmt6hFaRlpqvreKRT/2ZHIoppubWqqnl+nng583XQycbei603H+1QeJ8I2hHoxRMAYdS7D0yYtwJ66v8c8YrkZMXiOcpw2GL2PQyKmZU82PqLv0DpFIoWLtifYWx8HQlQSeB0DtHxg4V/FUTPwEqxUJQ+8oYdle9vlA9x5HjJSWK/Wo1Cns9ZZycJ4U13BTPNGQYrsWyhzfvCCpiVKv/xcF0TDW2LKT5N5n9krUFTyOxaer00LSNrZH9lEqLmhJLd1Yz4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by BN9PR11MB5547.namprd11.prod.outlook.com (2603:10b6:408:104::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 09:57:24 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::cd9a:3c52:72e3:bcd4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::cd9a:3c52:72e3:bcd4%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 09:57:24 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.1.4.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.1.4.rc1)
Thread-Index: AQHZetCt6qvEXUQ20UeZrgfNADvrb69GwtMg
Date: Tue, 2 May 2023 09:57:23 +0000
Message-ID: <BY5PR11MB4152253D00887AC9F246FC8CA16F9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010187ce7c37c5-f4e60d10-4dab-47e5-be4e-3e4e6d4cf058-000000@us-west-2.amazonses.com>
In-Reply-To: <01010187ce7c37c5-f4e60d10-4dab-47e5-be4e-3e4e6d4cf058-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|BN9PR11MB5547:EE_
x-ms-office365-filtering-correlation-id: 0c7d8916-b06f-4235-a63e-08db4af3a0db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c/5EGoTMtRviqbDWZtWChJZ2JVon64oJv9gAV8n7lpbLVU2hR5+MydXwAABsLQ2ai7W1VScA2qkaFxd+n/HjkoudIJi7640Kr+NRIYFowVJhbz0Z6V4SVBf30xBA4A7y+FK09o8EZG26+1mHeHEiRpUijQQxz5O5ZeudS30bjbKzu7FT1nfWKshGVXVGvh4bLCqEabSEdckCLCuG+futKg0DIoFzrY5f9mN7xMo0ilkCcKMUKHN56IEp1T1pqKxefZyPVLNt5K3rms/bDPKB841F2HFAE7msJHsXWQ8/lE7DgRYQn0G+P9D3QwLBr5IaHBKHQAK3zlQXhJelDPn+W3NjCtm9jbhw9YFFXdge1eyOFQm8PBsa9FUIGGBf7OEG54onNYJsuv9SVLtKTsYbaR1bpHhCO9B35ZeTTfm/MYSd/IgHGkQ9CB75aXdyWo3QR7LaoO1c2wwhbiZJLtNnXqNkAfDX3mMDzzcSzOn8539Orlw6CCc6VRzR55Vx2RxzwDP4mt+8KkG0NklOinHPLA6EmYO3Nlu0FeAp3uUF85kmKrYfd7nZZFD8K0HJGMaMwVFkXnMwiF+JIsa3hNpLpLwgc3csT/q0J6GfhUzanAc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199021)(7696005)(186003)(83380400001)(15650500001)(53546011)(9686003)(6506007)(26005)(966005)(110136005)(33656002)(478600001)(66476007)(66446008)(64756008)(76116006)(66556008)(66946007)(82960400001)(316002)(41300700001)(122000001)(71200400001)(38100700002)(8936002)(8676002)(52536014)(5660300002)(2906002)(86362001)(38070700005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wKGFqeBCtsymI06KBsyFLVHlZQ3vPEanqt8cYoOE7D46ILxaMpZbwGBtlfG1?=
 =?us-ascii?Q?SQS8PPZD37+cu/nKeK8BzLN8Cbve+9JwoH8NvsOuygS90Yq7360stjxguopB?=
 =?us-ascii?Q?l2vXqcEY6mGdfXZv6A24fCU7hcY/o4TRWRm1hxMwFyB5UMaB7OGO5AOqXAXN?=
 =?us-ascii?Q?POzLldxNHIpFnxPY+yY4ASOc4aHfUAOgXEruFxkqIjlyymEQHwpII7RZQRh6?=
 =?us-ascii?Q?3PEXmp+kd2TBAqD6QP0uK/Av6b2coobPly8uyoyl91ixMjskewIPwj9n/gdM?=
 =?us-ascii?Q?k/8VYNAGVz52i0XtQwuJfHQFw3U9pVO7XGgEV1khOsNxsehKGD8TscxTO5Wn?=
 =?us-ascii?Q?CUMeoA/7JHNdCCAatbq3LS7JT3hZYUla0YRAwwAHMaL3uj/PjoGlzYJr5wnQ?=
 =?us-ascii?Q?w9ECMRYZ2nIOMYGt1lokee0rD3lPItiWpfoS7xiR206kC5ah7CVWn1Axrl6/?=
 =?us-ascii?Q?zWxftbe6PM0MuzfuHPEjq1R701QKWYySZ3k6nHMRgzGPNk9s46AQnkiDkcOv?=
 =?us-ascii?Q?H82h4xGeHYKzpILiSUvU2YIA8uaDMDqbkp9T9eShrYKV2dr3IUbPNQAvXRRO?=
 =?us-ascii?Q?/ixcW3NGsyT94azMKW0YyAr8UrYzecklx+7o2l0xHhMY8JIkOtzwb/sTTUZQ?=
 =?us-ascii?Q?7zpI7xcNVze3fn2nGkaophlhsiXLArLtS+eXaqLF61d4CmByBTgJN/VGuXEt?=
 =?us-ascii?Q?LYMTafJxFDGGaYXpYQshXB+J2cf5u6Kidoh5drO7lzm/paFepMZYbcraF0vf?=
 =?us-ascii?Q?DafyIC/hEEQkNwkdNbVBBPI+pNA44CyZ1vI3UJl9nnAiL5dY9v+u4r11ZxhI?=
 =?us-ascii?Q?MIK26Q4lYQtkvYePpASojy8Mbn9Scy8ysYOPgCdp2OHSAbgVdFEzQkwpDJoX?=
 =?us-ascii?Q?uUFyEIW6Fcww26RVrtqw+ZovJXGvfyYVwapa2AjId5/PPXUnv0/+5xSek9C8?=
 =?us-ascii?Q?qPhYmpIC8Yrr7nypEUM/xpfg4whEsdnMMfjUmxHBenOrAdJxAcq1oMSmR78M?=
 =?us-ascii?Q?iFzgcOj3PgKEVU06fCSyaicufi2j16YPwHqsvZGzwn06ZgFxpzrSp+7aV18s?=
 =?us-ascii?Q?4FanxKiiVsH67lpm042cpLIdci5dAXDeXg8ib+DTgXg4i28UPr3RR4OQEfvh?=
 =?us-ascii?Q?NY99alfsU586u1VoLaJ8fyitQ1W2xpRghVAQnOij6QVR3amr1SP9bpxXhY8N?=
 =?us-ascii?Q?MmOre53qWZYKtK8Xbg3bZQklgfJ0CuLlrgNG8nTz/J5P1wPf7bmkEbzKrRQD?=
 =?us-ascii?Q?hetcPwMnPzUw/4CrfW5cHXJELps8c18D0QUNsgmO/WE/FWYC7Fp5KA8801OC?=
 =?us-ascii?Q?qcuextEY31o+jjhzOrAsRHXV/Z9Dy0RHmZwBW5jmJeVc9/QYQTBlmr3XcjLT?=
 =?us-ascii?Q?hMz7dhBquPlRAAc2a4l7xmix4/WHFFKrTVMivbR5uzH1pmI1s0yvxWfupPjg?=
 =?us-ascii?Q?NpVgbMcpviXlCWOeQrEUkI0OfmCcLCWeO4d4VfNcW6pJqaA9VckZ1C9BmnzJ?=
 =?us-ascii?Q?sYbPiWUZhjySiyGcbOmFcJ/b6Fc43odBOQW/PVR92oVEFsNpb2AS3ycqO98D?=
 =?us-ascii?Q?JSXuxoNWy6K3HGDH6bVGxAGk1VcZNFp9niD90acY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7d8916-b06f-4235-a63e-08db4af3a0db
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 09:57:23.8924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LZo9IbKeq0ggVbKAQJST0LOTh6Vj3CEJ4oKYBU1nOxCxn7SvdxYEu5L5RgjJwJ06ilEli3KHMVJjDJ8eun6rXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5547
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 09:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180721

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.1.4.rc=
1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. ADL
4. TGL NUC 11
5. Edgerouter
6. Beaglebone
=20
ETA for completion next Monday, 8 May 2023.
=20
Best regards,
Jing Hui



> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Sunday, April 30, 2023 3:28 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.1.4.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.1.4.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1.4.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 5b105e76dd7de3b9a25b17b397f2c12c80048894
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: eb41589aa198c5b1967c7bbbbfe0305aad3989fc
> meta-aws: 096818eabfe600aa332518e99cb097450ed42614
> meta-intel: 13a03c109aecfe275e7539b74c1ab94db9688d9b
> meta-mingw: b0067202db8573df3d23d199f82987cebe1bee2c
> meta-openembedded: 3d1ec70ed319c1b7f561fcda7b8cd0c2e0b2c262
> meta-virtualization: d1cbc4c9fc44f0c5994a1276e38cdbb7bdb5bbd3
> oecore: 78211cda40eb018a3aa535c75b61e87337236628
> poky: 3e95f268ce04b49ba6731fd4bbc53b1693c21963
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

