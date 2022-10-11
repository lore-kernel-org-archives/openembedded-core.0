Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CB8C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:16:49 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.4815.1665476208191835769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=StnOBiAh;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665476208; x=1697012208;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XLVuiDHczIKizZEPR8ZMRnsh/tmdEGlhOQsH5BnX+ps=;
  b=StnOBiAh/yggcl/Dmzz3cwR6DlC+mODwgmOp3pU/0fom2ofYuSF1pnHp
   h1JXrfsQLW11kXPLY64IaHqDdSIpszHLCf+iFaHtLouV767fxwTEWuh5D
   bbaoQaUTDyNFViAYYlchyQka0GmuJUs5qNdv8gXM6uU75iQVDfasmoSlc
   qYa16pDSFX5cgdPYcbJvbPTQVMu9lb35YbW0sRfF1vaz3HXaVIOREHj9F
   0wmdP7f4DOU+pooxFDVd2fhD6l1mUbzLouneiMqleCVhYhhAjY3Qr48nA
   ipZq9OrsVUV9kE9lZCDimpyRIIZV+W8ti8vlKinLFRrvfFVnPewutxLVP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291756955"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800";
   d="scan'208";a="291756955"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 01:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="694967538"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800";
   d="scan'208";a="694967538"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2022 01:16:46 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 01:16:46 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 01:16:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 11 Oct 2022 01:16:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 11 Oct 2022 01:16:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or2OTVtKdHK7eXNJ/1+FH0dQ/T5mpkRSvkIBYpo5wCnpRwa1pRxbvyoinhvTFPsAGbM/dCbwi4V/OsQP8yeUqaffbSmC3xzMhrTkKlH50gyt5q8piew9JRcDU7vzAFGfQXb2dEaZ0nOvSoYEeIw9NjOU64YWUrHKKzzcLOV4BAryluPYlCPM8K4DM9XyIkNHRVn83hzoDlYLVQ3QyvsiwdiavfeRlqBlvnVmh3gdUCACn+fpLOE52y1o16+Ao0ARp7j72QdIXQMEESJ73E0s7yAvG2ZMXXS8TDWl59Bo+t44l5e2stJOksIidYP3feNkfoyUTDie9Vj/+zB1MTIDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmhFyqBXO532j/IrbNja1Evva63nCcoavwC1KlCHw7k=;
 b=lScLgiMDP+phxSu1nAzkYH/vzimGBn9P4DZI5+if5sdoOgUYe8bCZ+3I89NrVPoyP7DLRGqNl/jT9worYGdhZHV9MMrnPC8HQMBXkYYFfotk/X48Cdn7ODKhIxq/UujE/gGW/FHlNT8QjSRNTB8l8Xbr6BOCKMGo7rKC43UAUH7nEiT04r7d9zmsikFpjUNgRolbjIiu9ni76L3Qn1K9y+/oR52wFBoHEPbQDSJdhLmi3JGWvpKqjmcG2IB8CFYjDWbQ5Dri1mAq2mMMXUc0kGzcNaM1I1Ng1kG72HCYNXUZd2S6vJudp3n5VTKfOz0KCq9S6r3fPDxQZcsfTxy6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Tue, 11 Oct
 2022 08:16:43 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::de8d:918d:3dee:3ec4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::de8d:918d:3dee:3ec4%7]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 08:16:43 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.1.rc2)
Thread-Index: AQHY1R8I8rl0olo1tkKZJCRsLWnEYq4I6Q9A
Date: Tue, 11 Oct 2022 08:16:43 +0000
Message-ID: 
 <BY5PR11MB4152B0F9F244F3EBAABDE174A1239@BY5PR11MB4152.namprd11.prod.outlook.com>
References: 
 <010101839097e13f-cbfc4c03-790c-4d17-8b84-dab254b2e413-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101839097e13f-cbfc4c03-790c-4d17-8b84-dab254b2e413-000000@us-west-2.amazonses.com>
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
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|MN2PR11MB4661:EE_
x-ms-office365-filtering-correlation-id: 34b15ba2-0ba8-4f10-4639-08daab60ee8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4vMxymPKJ2gyFDucQhdBtRl6qRiBbfjZDf55URFihpIVtkum6CA8+67NiKVlQMzvMLgastuWygTjMlWwzH1Objx0/Swq9jm3h3yK5aIz0sc7JwcujZ8GIcgFAlaSdpXQHBB/r1mAO6yztfl05bdI/4s0Ea40tW9Ri1ziv6AxmdXtlSl5f2rVRHVqcEelCjzGLU3D4XZqN4ncJVSvMY4EH/ukl9QOEjVeSQSafHlgjqNV4ntNfSD3qMZLPXaDy2cbJy7Lbgu1vTgYDQbHXAuIgSMR/MhyjvA3sqXJmWQOheAJVs15YZfATCec1e2qC4JiE6rJmK2mXapmQhVL7xtyJA0AVoSwDXo4XCNzqZxAI/Y08wLIe7XF1611VRIhIUoN9NpPIKkF+tEPL++8wc8AthmdIdv7s5S8yckgvZpM4xqonXXIswAQI7V46vQPvXW+9FJBmvaAcYIxkxiTNDAwA4Ltmgk5m9FyH9C1hWjCf4PYksYMlT4TohNj/w7wU3W2Vt1SErBe03Etm3AxS7MWfz5oTHsQoUfejDGHFZtUzxmAYAxj3MpbATwwh89Z1jEGT8QvEXy5YBo3Zqri+cJUn4Efa+4mgxUPeifNU6uHgF9/Q/LTKja3TByXIGKClMBjHAyGzGOg88VCPpPs81HXLNrS8F+ziRNuse2BQ4e1EHpdKNHdn/zH1OvrYm2EMH3nbidMeohLnFPeekLKW2A8cEAWN2gWuFhqmk5ykYnKdKKGIfAs8SPR9T2XRLpghcpg6+YmBBeS4aPlPRqNG1l1scQZh6AOVckhOk5RZgvluTf6Bol3UtKzmrQAmFxIkgKv9l+/pGq1u5nD2V5OG6wBCni+vBPC/AXAdDEOZt30bks=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(186003)(86362001)(55016003)(83380400001)(15650500001)(82960400001)(38100700002)(122000001)(5660300002)(38070700005)(2906002)(8936002)(41300700001)(52536014)(478600001)(966005)(26005)(9686003)(6506007)(53546011)(7696005)(8676002)(66446008)(64756008)(66556008)(66476007)(76116006)(71200400001)(316002)(110136005)(66946007)(66899015)(33656002)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?UAG9ZuPS6MUQSnoVmRNmEminPf70ZpS4yj8QO1N1HFzqo6P3LSmy5y9hEHmg?=
 =?us-ascii?Q?8krrXNxZOPBi+doe/NMXj9zMFUf72WDrpaHxdErLiUKz9ipA8wxT64Wfpy92?=
 =?us-ascii?Q?qpzmC0uXipzAHlXC11TLy2NY+jx0KAVBMHeQuQ6HSST49bVRkw1ukDPLPmFt?=
 =?us-ascii?Q?FzAcyNSsyRXAUzhJuPD+bGlT9QlIzUfkHRli4qazvtVkAzctd56t904VwYXG?=
 =?us-ascii?Q?KeWCWW+t1wSQ4/wwRIE84AVU/HroDuwtNeNtUwNKDqLNtzqn+5kulV9mPJYm?=
 =?us-ascii?Q?FqYN0ETuh6hBRerbcbdGNmnOGgjGvZyIh3PQ0oqGcT09RC97ax1gkdmisu3S?=
 =?us-ascii?Q?7ppClp/PEHlR6ZlmY8aRgb1s/oxtVwZjUmNui0kvNbcH7w4zHJnTDTmCe4vG?=
 =?us-ascii?Q?69dROkvD4cu31ONSdcB6ai/kD5opuIbyhXbjvSvf4RFOFfsXKxubyuSLFW6x?=
 =?us-ascii?Q?kPuhC1vvSvkxDfcO+unvdt/zwcJi34xnDy7LG6uDXFT96RCwCuEY6IPzv8GD?=
 =?us-ascii?Q?k4IBlKuwLdDZ9FOUVu8Fmr3S1mQFeIeM7Oft0dYNws3oiYH/aPLGEGHMB2Np?=
 =?us-ascii?Q?AeP2QLQWFSNTe5+vyk1PVx/Y6FQWYKX0ZAcbfB+UVCcu+yErDAkVrbJq1C0N?=
 =?us-ascii?Q?dzEFjF06vxY7r+6UCMtA/7VVoGPU9N0fnaWrXzH2uD9xtC+mgw9rR1sNpw46?=
 =?us-ascii?Q?wb1J/67cDjCrzGn0lexK3NADypmIZYLL6SDcirqlzjTurFiGQZPw4u17ls2K?=
 =?us-ascii?Q?7Lbp/Q0Et3fMA5Klf5B9vUpfazZKaUG9/Xt7NvVj26ULiMwWgYuNaH/f9vOD?=
 =?us-ascii?Q?RLWukEqx7rlaMQDnGgoihu+Oed7X1MKrWZKoCRuRSr0NWnvOiso4ZJ40JohZ?=
 =?us-ascii?Q?8lQtDa/2KWa7VlEbpgcFan94AxT+fad4ysYWFDaczbFIWnZmEaELuOsEWPjf?=
 =?us-ascii?Q?47wfdtUf4a8D+edT6ZGz5CQlf9k1NPlyuKNMyj1EfFTgfXpQiuN5hjqEpbib?=
 =?us-ascii?Q?xAyBKRp5zQZiKqagVoSsWHT/nIZzJyKOalSDulpvX/WLzA37U2xLP3KZfC9q?=
 =?us-ascii?Q?qC+AFCZ2mvGnrDI1uYhgyKNin7X4Uv7G8R/ks1aNvmNbdJ8YJj6UAuMBQZmb?=
 =?us-ascii?Q?9TdlHgLBMJXOKVxehyHQkhkbVd4aVoNf4DLy6kxk2oTpnIvfx2qYmxwpf/ON?=
 =?us-ascii?Q?Le3tb3KO890vcFUWsjnJIi3GWx8WR0VbpIe9rtJ2uLF31N7fJru4LekExIYu?=
 =?us-ascii?Q?akSNdlBTsLmeGUBoS2jEpUT85PyROr8Dz6cgPLBEWPqja/p7SgeIz5ofOuNG?=
 =?us-ascii?Q?3Ynpy1Elu3csmH9P6jZg78LZLU3KX6k2kyKKCXCKxQd/2LvNIJVvp4ui0HRF?=
 =?us-ascii?Q?v5A/gz3/0ZrJnM1hniCuaFdIFCemBsg43FLkJ9r8yclG0N98H5dUy/SucU99?=
 =?us-ascii?Q?AU2EqdIoZtydhkuXBdM16noYqBDbdebzAb1XquIA2667nHREyird53cQjMtF?=
 =?us-ascii?Q?z3pL3bL7QI1/vP9LSRV88oAp/NAA6As9vgah4383ORTWDnGaLr2OYVxdtlyz?=
 =?us-ascii?Q?Xx149CJJa/CZCfmn/k7rRWZ+n1e3CnYCT14LAogw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34b15ba2-0ba8-4f10-4639-08daab60ee8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 08:16:43.3167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 8dAzuvMIE8wP82B7STibtjRhJ+Fp2DCT0hc0kR/2qdjN4ILna8HEMrREz3c1J00G0pzOrmfCPDvSgRIo2as84w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:16:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171605

Hi All,

QA for yocto-4.1.rc2 is completed. This is the full report for this release=
: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.=20

Thanks,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, 1 October, 2022 6:50 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.1.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.1.rc2) was completed on the autobuilder a=
nd
> is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 074da4c469d1f4177a1c5be72b9f3ccdfd379d67
> meta-agl: e7e9216ccead73fdf6054301e68396ab04710c6f
> meta-arm: aa89fe3f08cb8406f9f1082c683bd71cd04628fb
> meta-aws: 729928fb7ce4a74546b68dd31390a3f6057ab92c
> meta-intel: 940218bd438776026398617033e09f288dae0137
> meta-mingw: b0067202db8573df3d23d199f82987cebe1bee2c
> meta-openembedded: 0782ea454af5b88cd686ac572c397d92e5912de4
> meta-virtualization: 3fe3e0971d7d14cbd06f54cad942fa2ed86c5048
> oecore: 744a2277844ec9a384a9ca7dae2a634d5a0d3590
> poky: 5200799866b92259e855051112520006e1aaaac0
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
> View/Reply Online (#183): https://lists.yoctoproject.org/g/qa-build-
> notification/message/183
> Mute This Topic: https://lists.yoctoproject.org/mt/94028231/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


