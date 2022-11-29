Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33E2C4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 05:03:34 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.141747.1669698204883587669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 21:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=K1a7g0oL;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669698204; x=1701234204;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7w2GAMbE8X5V5qv+IIhKDCX2RA+mWIfRr9uO0Ehri20=;
  b=K1a7g0oLEaXqgHsLtuknLX7hWdI2o0j8rUKrhDnoHn3voC59hvryC2/A
   Xaa3b7xx3cMaOoCEODTVS7KCO2WAN7rcyspV0Bq5aVhqNjEDqetIsmt+x
   cp6IJ6GccsDHpPZJLhXarerfXsI6sTBxg19k116qWHo8tyE+UBKJMWZ24
   2Ea+Qp8Iafgg/CYt3k1p4e0ofDY8m1CSdoGpcTWCClIYuYzNECVjERRMI
   GAIe9MDNFz8BQCrMBW5593VML+Mpn9oys/osHMedSRCTCZ4n4ZrL+RL1H
   yNNcl5q0HEdzvdR5M1lXyXLJ0t3+o73SisslFUaSq3qssvsoDCIBNb/WZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="341940988"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; 
   d="scan'208";a="341940988"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 21:03:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="712237007"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; 
   d="scan'208";a="712237007"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2022 21:03:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 21:03:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 21:03:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 28 Nov 2022 21:03:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 28 Nov 2022 21:03:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neLodqt7GJY+irYRexwViQMeG3ocnFl70fHnQ8y6zqKoK5oQjr44yqE3ftWvjL8qfO2B3ilvPFMID86YaYqr7QyfzZqO9U9zbmLgLanoUIjDRACG9jr/s0TrUqH95M/X/IsGa1Irqq2fDL+6lbu5mtBF0asaaUGB2ehXpOklxjrr6x8XJh5uEg5omC1lXhVKV9roNKMk7jlQBl4wbkQBLBArDv5IeKgBLJTd49esay00AdTx6mqabiUgk0OPdjOMmF0JxPyWTa2WGS8QluvM4E9tmvztO2QItwG4zRb0wIXfTuOuvT3CfPOzfI/FLILPdeFrKmRsMokEhI6VQLorDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/gB4vIt9WmA9rg04esWAQel1YtKZNtEvZoK/BK8u8M=;
 b=Xnwr4FuB9g7oYJg5g3TYXFO0PjTN9L1p01CtslIjY2sqoCT49OxnhZFFDbi+Eu78RkPsHIGS0sAGTNrT5EE+ursxHX1Ajcu3vVRzjpsfMgG9k8lyyeHyAD+gx5fXjstlgxLaox59BWKdJ9rjDrx1KJAUqKDdjfSTkUKS6/IsmFWWp980/w/S5yZRep87GUkgktsj4PEL1OQpxGNb0QeCC8/F2xQGZVgVFptXajBgIDF7bz1hfTPZSiM8u5AVEKf8k8wzl+EUo28cTZk0ODsv+1fVA4dtn/k19BPtas1Alray84uqioeCOJwxDRlD967z+rDCoQtEAh+51hyztmbjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 05:03:16 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::87c2:e4b3:7962:f4f4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::87c2:e4b3:7962:f4f4%7]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 05:03:16 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.21.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.21.rc1)
Thread-Index: AQHY/1mdiwLyhwAdAUeTSiXe5Hlo3q5VYFig
Date: Tue, 29 Nov 2022 05:03:16 +0000
Message-ID: <BY5PR11MB41523126F64E2878D549993EA1129@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010184a5581bd5-3aac18e9-d345-4281-b60e-3721c03106f5-000000@us-west-2.amazonses.com>
In-Reply-To: <01010184a5581bd5-3aac18e9-d345-4281-b60e-3721c03106f5-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CO1PR11MB5058:EE_
x-ms-office365-filtering-correlation-id: 62f9cd2b-4c3c-4d60-185e-08dad1c7065c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kNnD/cnBy3kkyMjVYrYvrZXp0pUyrPWTC9dlyZn+UMJGTErGvcZ3iFY34+0yLEQUcxNZihLNll3tTUcYKmN7v3T0ZB6+tbPYZldl5LaXOjsBBa5O3MrBjOQ0k04cpgYG5vdxeIGR98FnAJP8Bj68sHzdL/IZDhxKOUINVIsBNLb5uPVeasXM9CUOUNLYZLYr7NGsKTjM3EABfQ/NSHiVpctX524rZBqWOeFi3rfPLDYFsj0I8IV7OeGjbFjD3OqMDTRsplowvvy65N/AHfmD3H2vQ8dr+M/9EPNpOECTw4K81CJhx+x060jTDUMDjXeUG7TY+FoFPc0/DjHbna9pVxoaBw8lT+mucI/INx/1Mb8KidW15+zjNIP6MJm7rzOCNOx46umDbnPWih3UjpPM1IdT8DycjEnbLxFQfucfMJglV44i9mpDpqSvNwnkOuqrpvJjW6HoCOy3E3BQGglb9TmJl1cVRRaeGbXaF6Z9REskx0YUs0VE/fyu4MRJmQrodPL0k0sWACtSlS/zYOoQCViNceIJdru9nqAiuwyEN+g/68+fostxJUeJ1DPLmYrvBmkgicWv72DAEAKXFangWxXMgwKGqXfHNDrNvFVMeFDt1um/zcSalZDGjME2uwcpBu4D7VstHlLF5Al9u3n4GDd8rDv+fFNDFEI0XOqfw+QjxkcIZJUWewNaAZlnh3Y0d+lLi6mggZwF63WzFClTzEYYi8pGzRcNgZazlhR9UyDmAIhRTmQgEWY5RS4OHgyu/vazrWNtw9Z+tC6clf+BGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(66899015)(33656002)(86362001)(478600001)(71200400001)(966005)(7696005)(55016003)(38070700005)(2906002)(82960400001)(15650500001)(122000001)(186003)(83380400001)(9686003)(38100700002)(66946007)(66446008)(6506007)(53546011)(41300700001)(316002)(76116006)(66556008)(64756008)(26005)(110136005)(8676002)(8936002)(52536014)(5660300002)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ff2cRVrkAFCYQBqyDPp2tMVGEQZPus9NyNJ7A2L0etKbpdHGIUcKmlRfFf1A?=
 =?us-ascii?Q?JyhBnCezlYKwrVOkr3a5MlzcCfFGYwjIARR3GQYl/y2Qfg019nhszGF+AYni?=
 =?us-ascii?Q?6XjKbieUpA8IWVYLtWtCxceE37zhKiFeQ0iCD7w68W7tkySVE18uY09l7M4R?=
 =?us-ascii?Q?9QLvHhn42Dq8bwkD0EBOY/OGkR6grFrdpbaiqS/prQ/2Yq7e4CgudG2GvkJ7?=
 =?us-ascii?Q?2xEoiW8MiiyRBE46zUdU/YkPQoMHhbNFlFEb+K9wewLd/XqW0h7yd3Q5/Tf5?=
 =?us-ascii?Q?qxcgVDjGg7iyD5I85MscHVqiNYI63SyELcM6OatQP+PC9n9WSDYSylfykyLL?=
 =?us-ascii?Q?AgALcUoj63DEqySEvESiCboVrS2CQmGjRMRI/RI2HGe7GSmz2NeyFRKqmhNR?=
 =?us-ascii?Q?NoAo/Xdva8NRpHnDYnwpIYW/vJI5JJcemcmeGfjzj0bo+c8go7SOxaq18F9Z?=
 =?us-ascii?Q?3JpilGLHIOksP6jJYzEV+6lSkXVu+FDgMTTAsGBFB2lgUNty0fguF5INTfVu?=
 =?us-ascii?Q?FJCVRJhMY+XXDIalrQqXpIS5A6+oK/rtzUzLvqJ0oscxxK9C+c110GCLuO0N?=
 =?us-ascii?Q?OhIS4ZTKz6GCJCdzhKj81QSnYgEqtHgWrEO4Mez1P6OxMJz7w9+Ht+yfDkoT?=
 =?us-ascii?Q?2QgC516fj/Bd2e4wq3FFgPWFQjUFj+FRgunCYwkvRwmUdovKW1mCuitT9eVL?=
 =?us-ascii?Q?gbstj7nIF6VlAd7pIswXfIY50KzyvQgN5OchV9u7P0HH7jGB4g8/4pSdObYj?=
 =?us-ascii?Q?CWUtZh7jCagDu3GVPEkIK0Df5D8JpKANVAC05xx5mgn0IGs9T+P8ClN7m2q3?=
 =?us-ascii?Q?nZ3yRe+w28iWMwEluzAE0iIJkJPCXwbpeKCiHy+5ELFoKE2dleLgaaVgWzs0?=
 =?us-ascii?Q?wH/SD2J1SJ/ww6kRLGFSw0+gGejgzRdsWeqrAbulVEIpxdYAsKVag1XWd4VI?=
 =?us-ascii?Q?FwjD6BSoZZ4RzyGn+FPwrLZIJLjhvXfJwbJhKhmkAQEnDZdIiv65FRSW5iSi?=
 =?us-ascii?Q?0ZyJsONFRwzrdWegzRKxbWO5+6Eczkiw39sB+e2893cvOPlnNIJH562WUprI?=
 =?us-ascii?Q?gu2noX1cNhd6/Kx6REfEs2er+2dP6DS1Y2ap52JumMEj50M6pI5VODUANLdn?=
 =?us-ascii?Q?vBl9wfzs8Dw3I3vUo0j1CrvEx8C5I87v4GxOljcMMF6Q92X9x8w4hfLL6119?=
 =?us-ascii?Q?K1Hw9VNThDM5/RLxAPG4uzWhN63Qc32GY4nJft7H87vyIIrN041xymdt3cw7?=
 =?us-ascii?Q?xBX7T1g4NKB7O7uo089JMBCji+3FOPScflgSnGVf0Lu6QmP/HiyrzRWvJKBx?=
 =?us-ascii?Q?9seNCALTgjpWosfVAda7JqPs1dBLYPmr4QF0Xtwgi+u8/h8biEV6dXVAuu/r?=
 =?us-ascii?Q?pPIG8m6Q0gBhsOwEPxrVx4pFa3VGAAp3K/YXGB3G1NUjXWOoLUkqGQJwDTB/?=
 =?us-ascii?Q?xJb/+26c6kXZd2PbNdRxLe1HXNJrC0A4ipPBey3qINC1/d9lXc5v785YLbew?=
 =?us-ascii?Q?Kr7SdCyIt/BtKwbvHQSR5frnZ7G33besiD9tI8rMc73ogKe8G/zKpR9IAUJZ?=
 =?us-ascii?Q?CBZDUjdEgJYzUKsMYNmXfrhzmnjlBtLjfEUvgE+C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f9cd2b-4c3c-4d60-185e-08dad1c7065c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 05:03:16.1429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZxT215NIkpnWxDF2S+8xB89/wdhc2W+bWBngvfosBMaOA6PSrSwRG9HmiwWA3t6TPruyAUk3NdjbYRhQz8/pOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 05:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173959


Hi All,
=20
QA for yocto-3.1.21.rc1 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
=20
No new issue found.=20
=20
Thanks,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, 24 November, 2022 12:35 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.21.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.21.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.21.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: e3db9c2e9eded3c5cb6040714a6054b44f6b3880
> meta-agl: ac1c1371c3ccf48d458d2d2afb591cdc220c56b6
> meta-arm: 08c44df351ae1913f41de8388981b03e21235f09
> meta-aws: 49e7a5ffb8799b9eee638a6a5425a13b00c33215
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 6c202291925bb179d2d08b5bde80192f9b032b88
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: 7203130ed8b58c0df75cb72222ac2bcf546bce44
> meta-virtualization: beea119eb529b4a11f266004aee8b548427aea39
> oecore: 1ee082e979baaba871bbe1d91181bb04951faf3b
> poky: aa0073041806c9f417a33b0b7f747d2a86289eda
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
> View/Reply Online (#199): https://lists.yoctoproject.org/g/qa-build-
> notification/message/199
> Mute This Topic: https://lists.yoctoproject.org/mt/95221328/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


