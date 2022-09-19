Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4F1ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 05:55:36 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.16881.1663566928242164172
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 22:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GKdn0vqF;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663566928; x=1695102928;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LDhC3b1UXw6YFSkQL70VBL+ILcmZq7aO4qnvUpr5cak=;
  b=GKdn0vqFFDVOmX1MnupZgFAYakSRvdKLG8qn+zx59V1osw2hSAyNeFd4
   p0dvLHM1D5AAtwAELxVAHWS3uL914uDdHBHpnkDusEruD9kO1OOs2EroU
   OrqoKufuklvxurYBvdDZyMe+ualzEd936tQnn0o7s17QrBDTxFpl6R9v9
   tlqEqp+9HjUOC8k+3Eo3JZvsdVeyMPROr9WuIYa7KWIw1xqs9JDzFEnst
   zlSHZe6lGrajeRGN8YcIhb1eKe2Ud2n9jsZ6Rss5rE1KXeqEW9RAiX0TW
   gQt1fZAbVSXK3pVvyOtxt9RYx0MgPsjPUot1sT3AyySgB5+rhXQn95cbN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="299303287"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200";
   d="scan'208";a="299303287"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2022 22:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200";
   d="scan'208";a="595946285"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP; 18 Sep 2022 22:55:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 18 Sep 2022 22:54:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 18 Sep 2022 22:54:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 18 Sep 2022 22:54:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 18 Sep 2022 22:54:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NC/tlFikkalIDLi6GQaGGPr5PRpC4FL0LHyyym0OZdpv0Dk+7DZOIf8CFLt3PQC28Nr9PojcmzhWID0EVTEkEVD8X1DfxLqhKi7ryMk1/tDGSFUF8WLRW8DaLiiMgNkJRBN+Bh3WvsBj8/QfH1LGZMEGBT4bM7pV/tjDDM3Qv+s/78Bao9zaDPNEhp1TLDWfM6fzo26JN4p9HPBrBr9CQ4pubeipCVE/NQXXwOzTRnWOvJ5tVDE0phojyJZxvLjbQ3vNNCKhyd5SwEL5kPk8b0QRWPBs/cosOGmUuFi2sjBcjw0UOFSe8fe2+WrUTZAbam1HWvCH/PqLlXkoQTZASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTEkjRjolgoSCI0jU0N4VxhIRVZ0rafp4l1GN3sW7xQ=;
 b=Vp6o2e5EYjWCiHabJyFTgAN0Y8BdR1790TUuMZqD9mukpreUUBo9WKsSRkHP8G2zZPtls+eajzQ45EsXzHtsDFawcZGrRPKr0nBIiZxksksvZoY/Ah2mHCY1zs4DOoPt3lF0tzsrE+JVzHi2V8N4K48hKHjC+UHCt7FJ6kj9N7IEZ6L5Fl8ereNxA65tNVml1L1pGoshRzFEUL8OOoHaXFkWQUW9CqGO5YKKuX886/O/nYs1NM6aqHbNVLXRI68dwfBN7unBYS6dTUi26TbRc1Q/rMoOdVKQbWLZT9WKYUjcgc2x3QAOFbGoEwwbhE680n6rQC+S6FXr4lujFm+Z2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR1101MB2342.namprd11.prod.outlook.com (2603:10b6:903:b7::9)
 by SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Mon, 19 Sep
 2022 05:54:58 +0000
Received: from CY4PR1101MB2342.namprd11.prod.outlook.com
 ([fe80::d9dc:96ef:6494:bb57]) by CY4PR1101MB2342.namprd11.prod.outlook.com
 ([fe80::d9dc:96ef:6494:bb57%11]) with mapi id 15.20.5632.019; Mon, 19 Sep
 2022 05:54:58 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.1_M3.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.1_M3.rc2)
Thread-Index: AQHYxqe1BHJNlcdCVEC8ZXUR/gYp363mSryQ
Date: Mon, 19 Sep 2022 05:54:57 +0000
Message-ID: 
 <CY4PR1101MB234248D29967EDBC76086507BB4D9@CY4PR1101MB2342.namprd11.prod.outlook.com>
References: 
 <0101018331c968c5-da625ee2-c701-4044-8b18-3653beef77de-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018331c968c5-da625ee2-c701-4044-8b18-3653beef77de-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR1101MB2342:EE_|SA2PR11MB5147:EE_
x-ms-office365-filtering-correlation-id: 560aef26-a2b5-4ff5-f1eb-08da9a037bda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FqNO0r0tIAeELP+XLSxJhO/PeObt1zAt3rHpVI6xPqlbp4TbnV0DDCfIvTi1sm4V1hKcYp1Ajp/1hSRSiP2OS1cuuj2CjsU57NyOL2UtGFQUbf7MuYv+nj8OuOXwTCGAIQXE/xhA0XvEbb+SNGMQ3MRvGerns+X5aAmrFKLC9w3PX0Phs53q9TD1lycAVPw+grlcyGfXNBkFtL5O3cD48Ho2uU3EWbuNdyCpVTKB2SVQHlkKGbZKI4X5Tpgr2qFTSL2cSLOoHrLQ2j6LQJw/WiqoU7IWe9zxc8BTdQ2OtWzxrsGg+LGvTG0h27fdmuZZZAcvjU9eqLzTvLRm2bwwqKW1i8GbFf2sIuwd1H2M3akA9HN7RaseBzuFpwhVMy0H1ndIpMRRxn5Ihr7FuTE+M8OwKmJR8QEyOOMY6r8QCnvyH8WJ2KfkiC2lNMDutfBFDtOuoMe9+pxfOS24zX4JsCfIMZ6zVkTGrgVIOAf9tLt8E9/djTs9B3+ejHp+8AKPS8h46SATotPOE7ASxxpNLbpmnp1EYGHobHyO4QvfJUHByyTCyWbQ877o4HMnLKG+1aZhDp2nKvuJ7xpYeHMtifeRPxfVr+up7eaAny6oNdW5XMk6CMs3VLiYRryUWYzPG7P7pDy9C7HPO5u5pSagZ95id2ZJ97sruDnxstgPu19ySCBgxe3ZaXtM6rE4uhTIYM/mZQ/n6rsVvQ3piY/YcYczyDx86TtaOSCdxJLqBbSpBxc/KfupF4On1fBDduemRoNQd6FNeUx6fdg/IS46sP3KhXyZa7hCO+tIzSsJHA58LhaJC50ZZlsQst3Cg7JN0qL8Odxy3VP30rGbxXwczA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1101MB2342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199015)(76116006)(82960400001)(122000001)(38100700002)(52536014)(15650500001)(38070700005)(86362001)(8936002)(7696005)(41300700001)(55016003)(966005)(478600001)(55236004)(6506007)(53546011)(2906002)(9686003)(316002)(110136005)(8676002)(26005)(33656002)(64756008)(66476007)(71200400001)(4326008)(66556008)(186003)(66946007)(66446008)(5660300002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FS3/dZeTVFUGq0FE8+BeVF23tEILyqfx/87Xr3rv8wQWP2QwTlX8MLGOakYW?=
 =?us-ascii?Q?96EYPsHeTNRVHM80m0w42G1kKiJxa9oAjaQezvQz2HvEB9Sp1ATlQbINjtBo?=
 =?us-ascii?Q?ubiX0xtblHmd44f2WKH0r6VUrCZyBJ6Y81KwlAf3nz9Q7c+a/Erm3PkZfsUg?=
 =?us-ascii?Q?nHiZHMsdwdy9dJmzV280sFnRwVSRPr3UoZH4rTnKvL11ekSuTAJbwnrBjb14?=
 =?us-ascii?Q?xLaZLQn7He9nScKhW/FBOj789ylle1sUMoFb6mvBaFq1+6txWCULhaOL9yri?=
 =?us-ascii?Q?5eAdOQFzejFQNJXEwcBF/AwGMTJnJDsFB3Y4vbsUR1qOABRspNfg8WSLMTHD?=
 =?us-ascii?Q?4nZ+Ni1I7OJdl4fSbZhHmGrQgFsqxkS+9QICn9EZ+Tw9x/wLYUs83r94RRKV?=
 =?us-ascii?Q?qAsI0nDVFJ3+W58FBXMyVbluCInxbXqBUW5twdsL4aVgG62QWk0JcwhiksHe?=
 =?us-ascii?Q?f5st4jvYFZgiy1Z2omURYjITJPIQdUJDycYLCzmm1IylYjbXfYY0K4WMrJHw?=
 =?us-ascii?Q?r6ctT/SWsBBG8ThHwuv99+xl4LTe8jp25chx8NFSc1Q+RNFZ8Vzap1qCh/TT?=
 =?us-ascii?Q?UBz3Kwlf04kjtpixlCMfTSUY5pX9Rz8Tbrs/dHRbAzim1h1Tzrretix0V96H?=
 =?us-ascii?Q?TNfCrtmrLyv8Rs7YLhOzr4slKg9/T7BRv5SNzcTkY5wQWDH2geCUA6vdyD06?=
 =?us-ascii?Q?5o9PhBtdrQl6si4l7tXOk3H8MFLhn2sFVdeH+MDhaZ5J6LJs+Kqo7crrZaJM?=
 =?us-ascii?Q?g2wCz058UFpU3ZgzF0Pvj0IhEOFob6tCO5TPGDIdqlhWKxlLxnzP1P6K9ynZ?=
 =?us-ascii?Q?uo9uHozD8sia0sFRqUXrGJPQb3jbiGnQwYDXoAEhfNBznhUIjztDok0cA4jN?=
 =?us-ascii?Q?uB8BReCKsJX3BBAszwztVVoQXlcRt4Mdv1tFJZF4VuRWHqMz8R0OW/Chp0vK?=
 =?us-ascii?Q?gXzJHf0wWXDLn5jY0JYfsyVJ/lQURKKLkgFBaT5oN1Y4b/orjWqB11vibe4d?=
 =?us-ascii?Q?pMOw3VtuM+1bFhpCJ6tbCE1f6s7nb9h+n/J+Bu7x8EIixp/6WBFpzflNim3i?=
 =?us-ascii?Q?W3M+wx6DERYWecj2593BsDfkWmP/UbJCc4bhNjv1imCwFOsAl3/gBUZL2SfQ?=
 =?us-ascii?Q?RJr6v/fn8JwX3tiOn3f8cRGzbsVLNiJSAf/SLEzTeckCnunjSCzk0ikqE1z9?=
 =?us-ascii?Q?KW8VMf/1LozbjmvcC1gxzq4d/zsjOLSk67xQpYmeSZz+mn/JMpoIOvdkttTv?=
 =?us-ascii?Q?B6D+bdqKiRc7FJZH7/EJ7nGcuQxUCDPX8NRydpS3ew8ibN9RJ14Tb6Gz0jku?=
 =?us-ascii?Q?2mHiqOIFuHY06DMVW4r/sjt+SjGsNWrGPbQovxJDdutubL03sy4PSuQzDnp7?=
 =?us-ascii?Q?igeYYAYyj26uR+OK20hMUqMBMS7WAqe563cDLRGsHGZ/g4Y/rvO9Ul6GT99J?=
 =?us-ascii?Q?T0sNpKluQ6ZYHUnPJ9sWHio8U4q9mShq4t2bzZw7tPdQc9GXD8DPFWWoOxAS?=
 =?us-ascii?Q?ajQGbYFgeZioSkv9M6J5VU/I+aP2HMpftg5pqQOp7XYb909vhqxazciXEfaq?=
 =?us-ascii?Q?ndXYz3I4ASqrqspPxgZxIvexb6spOwCnq68vlCPI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 CY4PR1101MB2342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 560aef26-a2b5-4ff5-f1eb-08da9a037bda
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 05:54:57.9559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 CUMfwjr6n3du79BJ3Gml7ONEyZBk4ZfRdEsGB7DYIGRm4cLKrcJRk3XxE13APDxbygDbhZzPAdGy0fC36uTYGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 05:55:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170856

Hi All,

QA for yocto-4.1_M3.rc2 is completed. You can find the full report of this =
release in the link below: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found, but the following issue from previous release still exi=
st: =20

Bug 14865 - systemd-fstab-generator[11101]: Failed to create unit file /run=
/systemd/generator/-.mount, as it already exists.

=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14865

Thanks,
Jay

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Monday, 12 September, 2022 9:00 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.1_M3.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.1_M3.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1_M3.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 6424f4b7e9c1ba8db81346e8b3a806dd035d4551
> meta-agl: e4ea839db9c26e78175d61388c5408a79f6927dc
> meta-arm: 261263a6701ab3530ff997643d08da502222ac20
> meta-aws: a16f35a73bff26d9506f519451dc75034211d61b
> meta-gplv2: 43bf0e8d5985945d19d01f94bfbbda420c4435f3
> meta-intel: 9d2820d4bf436924db845de28850a807f9fdef87
> meta-mingw: 8327efb6334b9187fbaf7c871de4446c6863b3c5
> meta-openembedded: 09e086812aab7ca6ee480fb625966e2318174345
> meta-virtualization: 538e94e674dc1be0b0fee5da54083ca040b2f7b9
> oecore: bf5968bce59d5e5c777407dba431be3aec012404
> poky: 987e1503f733068d774ccf440b6f4e23e833571e
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

