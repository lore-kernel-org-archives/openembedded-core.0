Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BF9C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 02:50:55 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.3148.1665715846620296173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 19:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=b/4ej3r8;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665715846; x=1697251846;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=T50yRBzpKEnr9cawEyYiiPS42cBRKQSHIcr5P4mmeyM=;
  b=b/4ej3r85dMt/S2FSR1S63smVAP9rvxcyiZECztU+eWKUnZO/JMgFdCA
   kO976dhb8z+TRQBHU9IcXfRyB7aHmNUqU82auaGv77jI7iCJvRwfVC4t3
   ohPi0Kiuf1qS3H2/X57Al4dQWkiH34ryuSgHs5DWa/KkRQP5HbC9DllDY
   APs7aOBVAOsBlBY8DHp/9rsiH5NTBVbPyNYAknKycQ9v7P5Hw6aMXUJ8x
   QNnmV646TT63Eyh0UPKbA6ZOqaTRLJjcHP9XbJ67gowHXHjPpi8oFLaH7
   5VKWyLdRlojA2GuxNH8Nk7KsOpdjm26yPYlZFLWOe2PcCz1WCJsa/Kwj9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="367281104"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="367281104"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 19:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="752761620"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="752761620"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 13 Oct 2022 19:50:41 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 19:50:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 19:50:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 13 Oct 2022 19:50:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 13 Oct 2022 19:50:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEwUG+g5W+z2yti8iGuA++P6AgZuS3xeiUk4L0xrhuAnHg9Uk0R87ZFfy6vjMEpf58Hx+8J9m1pcCLwR8OOEf6Uz8cMUV0CbuH5lfyNwmXhAxkAypc/8FY7N2550QN+N0VecB4+BKSNhsvt8ukqWHq5hBqInJz/NOV+QvLtrGtBs2hXJBLe0lb0L6wjiJ4sfddzKqHcfJ+JdbTY5rzw3xR08XvRgPx+TKmKA0HMwReN0zGUeQ4X1Q0IWACNgGKMWO0zgYTM9OCsUgfkZ7/5AF9S5seMRuZaZhCZKV8/RZeZyLTDt3CGs9gTW+yhUABg692DR5axnkkiiJpOQ9TTxNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7IFjtF2RXrxmP2E2gbeqcuIC73kwOSDPLhxydjQUrU=;
 b=QsH+ZDAR8ax21k90/FPTYZYjzJ7uJh4Re2Cesr8+oXSdox7EV8wCIEYDy65PkGhFpV1ei7zQKHY2TW6xN+FxUBQeyelGtUWBpq9htTBtIBg8b0aMuMepyAOgJd7hHelusBlyvYkDMYkKf19zjQzT9/hoqgyfw292b3WQdXBA87D26aZ3DUbM0fOTpId8JQ6Srs9OF5tuvoeeR2NDSDv4MyUdi7aY6Ga5F+EufALDAcRYOb5b5naLB+u7Bp9JxK0a0/bj0BW2bw/fDVvezs7r3h9dzICwZwDAVtdztSKAyPLRGDYm1qsaNOhiH5Ba4HHVWeXO6u+b9h8RYvDN6qphGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM4PR11MB5325.namprd11.prod.outlook.com (2603:10b6:5:390::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 02:50:37 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::de8d:918d:3dee:3ec4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::de8d:918d:3dee:3ec4%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 02:50:38 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.20.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.20.rc2)
Thread-Index: AQHY3NE0d/+HYd/ZOUqwSLVgiNx4+64NNVnw
Date: Fri, 14 Oct 2022 02:50:38 +0000
Message-ID: <BY5PR11MB415276B624DF3951995186E5A1249@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010183c307a590-5d10c6fa-0719-47ea-9159-9026993db177-000000@us-west-2.amazonses.com>
In-Reply-To: <01010183c307a590-5d10c6fa-0719-47ea-9159-9026993db177-000000@us-west-2.amazonses.com>
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
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM4PR11MB5325:EE_
x-ms-office365-filtering-correlation-id: 45f9ff7a-7d03-4e22-5253-08daad8ee037
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n62fOW+zT5+GlAA0VxgCua2nn1dLkSWnVnGo6eAntPcje5gEyEt0P64qxBrjA+bqE5d0MLaFsg6mJxFUjQJOgebjfgdSAs+SyvrEdfPviJ5n4XKp9aysoH8qKA85XrO0xPNr8hl5uKD3c2bQ8NNZ6s04TgUWiwjOcb1L0e7nwTrnQwWzcbfVaWNI2jxSFFdwYiFA4FEhbPlrpxpu7fK+CNQKem7Mt/fvcCPqfjmwRo3YL1oSU5PMHFmzBqSAEX2RPCnXk/igAicNpVDSVdUj0Vlv05Kh44iXrzX6kr5LakSq5IBvttCNpRiA6LVBMxLAIfOc6I0REMt5AaWY+Rt4YdBMKxvvdpC0hyoaBA2EefXSVSfrYBWpi2Q0snwBnghaliwiDUEgsK3pdKzJeK9lgDZzvsIr7T3mXuYl+B/4sK+HhdIzfFbYGYtEC4Mjrj792d9bLEt5EbChB6DKXx8ppIvrXhOU0F9OCtp1EcCkz+2QurJ14PPe9Sg9PkWFSf7Q90vD7qtnuhOHIOoSU3o8BiumO14XQgmOb9AeZSnVhbFE8FDdpuIcHU0sqrOGvLDUOitQy/5lMPa9PRmefdRTnES0K3v/8mYwm9yovm+wN2mA2Zx+PJx9JRQHQ7tSJyELFSGVP0ucpyWCpheK7pEjL3pQf7mZin2kCa/c7Amc+jMBChvby58G6EBPyR6/h3qr4732TNlCMYkV/3jJqL7s1GUoSH+0yiN3/AHYN8Sg10iBSCXJUFBwJR3ZmU5TfylC5kJVAZY+GTbTMVmh3dLK/RdsaGLUWN+3yZhzJVRZEIZiUg56RDBdQjyiOt+cLCFFhQa3X8AwU3rqP2FPFugVdtY6D1HAK7VgUa0Cg0hb5xI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199015)(66899015)(33656002)(86362001)(2906002)(38100700002)(82960400001)(5660300002)(122000001)(186003)(38070700005)(83380400001)(26005)(478600001)(53546011)(66946007)(966005)(66446008)(76116006)(55016003)(6506007)(71200400001)(9686003)(66476007)(316002)(66556008)(52536014)(110136005)(41300700001)(15650500001)(8936002)(8676002)(64756008)(7696005)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oDE4z1Xg0zh5hqD95XDAafhnREw2NciMlBWXzKvLrlZZkYg9AMB8Q3lckiZ+?=
 =?us-ascii?Q?2VdI1ccfAWX1Qqi7c0epqARjIvJYmWWhDiVayq8NXv+vW6BiMgNpJT/v5ykd?=
 =?us-ascii?Q?35e76VPHUsVdtUAQp9YLhkCcdXqnVkWbefm6NPlkNh3rqvw52SkoFoTU7O6T?=
 =?us-ascii?Q?iD7ll9Ewa54E2/VTd2KkfO7qY+ZZ/Z7Q+5+Cny0zhLEn2NADgnWzXIsyV2wL?=
 =?us-ascii?Q?PRNL7bmG0aqQQx90N61im1mPVtoLU79NAdj0CXLDDm1sos0GtZ1Qic8L/Mz6?=
 =?us-ascii?Q?Z3mpl8f445WKo44DzIpuWTvStYVDVajRcUpIQ24/aizIjAjIJKjlsbTS+pFz?=
 =?us-ascii?Q?NpnAyKdVGuaXdNUqXt0RPTRIHSXK2EJuPBwTBwfm31mFqGF5IhJpRwD17CiN?=
 =?us-ascii?Q?OcoecmF6Pr02LUzO7FPcnm9HZl/RmG1y6o+Y9F9Lr/LVDg19NNkB0Tg7FGIP?=
 =?us-ascii?Q?X4z3tZS3R8Ig6+UiRivA8z3jNJvtVOJ/dB4EzoiNQJ1hZpxlus9d43YyRBQ4?=
 =?us-ascii?Q?wdg32ICv5BGTgmjWUFK0EWkw+2uM5M3J8dPncnfirFnqTAT+7YW5TtOBaJyA?=
 =?us-ascii?Q?v+PrrHr4C8Q9Xto1Utb9q1SxXiQ9ysTzgyXd6GTNiPC8iAQn+WXgG1pWhOAZ?=
 =?us-ascii?Q?PzCwBsmiK2syp4Eg5URDCdna0f61BywAE9aVc3+TqCDgJqe52UetN3CA1Xmu?=
 =?us-ascii?Q?8uAust2j6gfp2mghEm5deUPiyPo1YixX8/6byz0hTdMJYjqzJXUUgGy6mDrh?=
 =?us-ascii?Q?D74zfQptjCjS5sbC3TV7LgPre8lMnQI2zE/wUid3QuFrQzi1D55P+yHyLyfJ?=
 =?us-ascii?Q?I0KrVhkGUFfYxRo81FVY2mk5GWd6c8WktByFdymC1dN1sYu46i5sJE5lo0Nh?=
 =?us-ascii?Q?YUQASCFDNTa0PAYyJ6u+gObEIpa+k/+pcR8rNkGirE58qSyXFoPoYsbKH8+o?=
 =?us-ascii?Q?mndgRM8rsFQpDX3ZrFWYjdXLbt7v5hLRxDLEekZ1YbXDUuSlix40HNhT8u3v?=
 =?us-ascii?Q?NQf4fB7+zIAJmvrYOBj1IolxS6w3KJp5F7D9ynlnFMyqY1vpG2HFXt7JgOJT?=
 =?us-ascii?Q?BfC/pl4LONWZeh/AiG+fa3/FBGD8+oXAWPO9EwXwt5DuRk3LB6kAErVe+MLc?=
 =?us-ascii?Q?zAqykhTvP/OLYP77Iythab34IQLno45+0kAdWMINzVbsiOwNuS5wSO2vVcy0?=
 =?us-ascii?Q?VTfEB9m6l1aGDy63EB/kKlLnYkeCku9BXnmBqa1cyJJsSEn3P1WnB1frb8wj?=
 =?us-ascii?Q?zvYzvKePloaOYvbO6PUEGttAYEuF7gt3tHjGEh7Z606MW7AbsO12zVVfBMhh?=
 =?us-ascii?Q?+eMS/c+FKxMpzyJC7E8hdZBoxrgLLewPO8gpVnHUAsVxXUrAAsFLEcs4ZpO7?=
 =?us-ascii?Q?/Ol+VkvAqF5ins5X240QpwhMOgaMQMztvJMrNT2zGKfpQeGVfmroD2iGfU9b?=
 =?us-ascii?Q?Gr7RkNrQdzGhd6W5HlLflBA42dOOAC6eA7m2wlAcCC9hhM7rF4BAIRwIJOgp?=
 =?us-ascii?Q?l4BCPPjc1pu1tJSGvzRb/fEPgJL4F6wb0GSVGgHB0+FNwDM7KvYyizGVgFQG?=
 =?us-ascii?Q?YXOOZENlvNf5Fmhx4WvMo+gMvf+nXWvPtxFu5jfd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f9ff7a-7d03-4e22-5253-08daad8ee037
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 02:50:38.4717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lPIhRLrZUdi2yDXGnJdjjV++1L1ERqFGdAgno67dtgtDD3mhR0BHcdpXa1jo4l2LrjZa1Iw3GTpqljrLIrfKSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5325
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 02:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171723

Hi All,

QA for yocto- 3.1.20.rc2 is completed. This is the full report for this rel=
ease: =20
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


