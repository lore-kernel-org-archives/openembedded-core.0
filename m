Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB89C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 09:32:16 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.26077.1658741526882534591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 02:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=DAJ5TYJW;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658741526; x=1690277526;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=T2ewIQUgmhuZGBgjbuQJssg5ajP5F5Ka2Mokabo4p5Q=;
  b=DAJ5TYJW7OGLXOmSlxaLjRrfDxPjyGNkwK8GmFvsCAjgDngsUYX3a/Uh
   Ju3sOkXACPfAFtr3qaul5y4fy4cHpDWV7HWlqkIhLJ7cDlbSWiefbWzIh
   qiYFxu7VpNVFlLCO/OSB6bRQOajpXvIWCaMiimpRPNcdJxRzIHyxAhRiw
   1hDRu3gLBFg7QKWKY+7iMLuOIIjzXAfxnnf9HC57byjoGY4sJkYKLB/2h
   8kKIlHR4a5joNRHD+7uhdjeW/TdAHpeBqVxNzta9sa9x/ifDczIZahEpa
   CKvXTrzp3uSfrEwdmX/E91QGEIyriRrw9dX2Tk36DUIi61wtRRYSD/mo9
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="285205061"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200";
   d="scan'208";a="285205061"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 02:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200";
   d="scan'208";a="574981308"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga006.jf.intel.com with ESMTP; 25 Jul 2022 02:32:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 02:32:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 25 Jul 2022 02:32:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 25 Jul 2022 02:32:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhmfhfJ5yVRn88T/qxHVG1H+0REu77fT067JZcRKwEUkl12uRRdjcEI5axsz+PIIHlz36wwgzbEeqwVo2wu25EpkhQFehRF0OaWEqC0vI9EOPDerhzwxGJqqg+XR+LyM3cUNSl34XHZItBeMQbW7PUR8H2Z9XbnHP8ARy4Yp07VFfE3wfYvZQsHMtKqBTl5RkDKFQAL7v7TwqlqdinlGWad05gNG4HGBNraQoY3DEwKGVxo6jDuXeXFqDCBCetOKK9K6i0aYUar6hHDpxUERl2FTdRSzK+wk5rGW5x8Bv35tG/SE7QsbcwNAKp+xIV5Rw2hrt+TR/1h9e2qyNsSZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hiu2PVsHfWn8DtlmdAd4XlhaJAgjU3stYoF8XzWFF5M=;
 b=kB1eokoNhiiyU28WjUtaxM2F84MiIdG4HhtoNIQN9jkgorfzuJd2nxrWL7IPJrMVBgTet/L5qKjk977ObZVMluBfBeO9mT5dAo3RGPsFNSGDPTmD9VXRCA9oWlMzmpQanuQK4zNEdTeZUYKt/T9YDb6gLhIoQ1mdRchj21NOI4bMV+sI3Jv3Wi0MXHOZ+DC2kAaTY6tnnnjV9X9hDSRRXm9yusNYUoM2Fmj84J3BQsLFjlr1hCFRcVAOKdW9qziWCdz2O7zfY6oy1bZ0lSjpsMK/+wctQQTgibVHyHRcw+U468YhhzqOeMO2QExhaxEUSdNBKO2ee4EELDAMe++AFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Mon, 25 Jul
 2022 09:32:03 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed%5]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 09:32:03 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.1_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.1_M2.rc1)
Thread-Index: AQHYm6UN4GgPfMhK5UO2M/zdEEJnyK2O2wAQ
Date: Mon, 25 Jul 2022 09:32:02 +0000
Message-ID: 
 <DM5PR1101MB2348800F1CD86C38EAEF804BBB959@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101018217ea3768-11ff38ae-a6a9-44fa-a01f-495f642b5a1c-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018217ea3768-11ff38ae-a6a9-44fa-a01f-495f642b5a1c-000000@us-west-2.amazonses.com>
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
x-ms-office365-filtering-correlation-id: f6722dd9-8a92-468e-fcf3-08da6e20883e
x-ms-traffictypediagnostic: CO1PR11MB4819:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 L9SkqlcgW57UBztTQiO6aZyKyeaYWqiP3yf05lukD/dH+SemiQf/sHCIuNcHxXkn9zr9sMDuNX76r9+0xZMnmZYSE6tNXnuDwW9Y3zHhtoeiG/SBhLiUzFr0dlwW17TOIpaOo7V1iVulcSyvd0e2kEBCkmLmEgOrL3H+eEYkoo5m/+SLLRX9XKMxLRidedRQYMIxlpceG+yAwClymirBwKOsE7hOO2KeSEKwwiio6b0wrtrRRMnb/vGMAY1nCZOywu1vOxRg+I3UjOBnM9mljLUYRWmvZnWCt/YqTkWZWCDPWu+3Wrhc7vCtspaqXO91BiQU46xZzIvJaS4yYywx9aS/cCf5+ZtKj2H67eiOrGAh+qh0JedO4dafKBa+rO0bkX07uG1PjKxG2N9Id6Nsuyr/lz+sxY5tEHsMMOeqjO4N7SECELC/ISk6QcMiQFmwATR89twkhGVeMcHs+2xsx5tcoYHhmoCXM3gF/2wXE46Ta1q9XiV/z0edJ/xrJs9BVSSdCa+D6ypGHCkudUl6k0ZHutHZbcuu6XDNZf48lYtaNT8sRB1INJLaG5E5yeUYa2rdcHbuPyzDBXhItvKoU8Q7Hwgn2IW1r/a1DsRmROpG8OCbgmZEIGSwB4AuvKYAk9X/MXENOjCD2wCJZvs3Tg3uP1tJUJBlWIOizaiTPQyBzo4MMYWqbrUEd7fk/6npKu3lOt2UnNbQAST63OcXgcfD000aQu9UfxTye5PqGeVTgVzqC+/RDdeD8JdOJKDr2IO9iAfccLk6062HyROCVsTRlG8NO1LhJSN/BOfq6qhC4ZW0Idj7DQ4GVxCdRMvFtEadP8lx1hSTGa+F9xe1HiUC9Q0etG8DgCoWpd8WdiNSes2/rG2lysQovUI3M4jZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(376002)(136003)(396003)(346002)(76116006)(15650500001)(82960400001)(8936002)(38070700005)(52536014)(122000001)(5660300002)(64756008)(66446008)(66476007)(66946007)(38100700002)(66556008)(33656002)(83380400001)(316002)(41300700001)(966005)(8676002)(55016003)(2906002)(7696005)(110136005)(6506007)(53546011)(71200400001)(55236004)(26005)(478600001)(186003)(86362001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OwSP8K75zGS99O66lKAJTIUOOb6cApgGIdPzg8al4NomuOsWIhze0K5Gr5SR?=
 =?us-ascii?Q?bQFrLB0gTX+coQboSEfmh70Qi6vlakAfQKbOTcTmQ6PA3GNsZbM2JzxZP1ZT?=
 =?us-ascii?Q?7pJ8pTBmVRsKjeNs2To6d/EVh2Bt+UCbTgRcTDXh42Tb2L9xxuMhh0lZCMGB?=
 =?us-ascii?Q?cKh26+VxM8a5WA4BQ97Ytw9V5dYCdJ2uVN/60dBOO1dTXf8xkDEN0qXNP0bO?=
 =?us-ascii?Q?wB0rvrfXQvp3QOmroiXp3rRETWKH8VIYvG635ccnkB4h1THBHEatBnlpdmCD?=
 =?us-ascii?Q?NdStHtzy9qwbQtNYu6U6XrX7/8gdGbdytQbg6Snn3BxP+lyRWq8owZFNalac?=
 =?us-ascii?Q?tWdXgHSZidjA3hl3pkOFU1ipxQVItTXTBTJ1YuOx3GTl4l9K9c7PqeWFr+Al?=
 =?us-ascii?Q?EdmLUWDNYIQ9gL8cNKsT8pPlrwmGf2XEicYxiAXoEC3QrOlIBK4NlvlKPc8v?=
 =?us-ascii?Q?sIACVGuY5F6gJJasW6LKJ4ylpmpYVDj+RQO0NbnwKOPb9F2NhV5khhYi1cz7?=
 =?us-ascii?Q?PzbLT3BlBdZ/YFhXTHL99yip9tok4+/1G2Diq3xRuUUZdX+57KGWYYESRByT?=
 =?us-ascii?Q?H01e9ViZISMoDte2E3KY6yn39fHiGwGhOg7nVGVNaUsSn+3Ks5o+2x5gSwoJ?=
 =?us-ascii?Q?4WHbfr0guQHxGkIUzmMF9pUAFbH/LYz/Mf9ZAkfuWVzuxl5Dd8e+ckj5/PDU?=
 =?us-ascii?Q?a+c3XQWv6Wc4yiqd7Z+Ih9LS5EoOxTvrFPCbzahLYudAFUp6lagMnL6sozso?=
 =?us-ascii?Q?e78GWQ6q/+sLMu3i3W0/dubDCNYGNTfstiMKkJZCOrwMWutKtvVEHDMEQu5s?=
 =?us-ascii?Q?fyEhTwzxzQBgcj0qemVDMaWFN8ynrXS03515epQXxklZXZ48A8cPIYC1Byzt?=
 =?us-ascii?Q?u4OeXwaVONG4KWyYeWFY/9IViDvh9SeFwVx0pP4w9Wb0nSjBLIzTbr7z8RJm?=
 =?us-ascii?Q?WWysCM4GSE1viGaWq6ylKvdzJKAaqYft2DIVn5vXz9BCvNRY7NRiRnw6J29q?=
 =?us-ascii?Q?drhSE5PXd22Hqu+zaoivh9bpDlt2cj89QM/Kmm8ytJZLco8CRMLTVYq3ngQG?=
 =?us-ascii?Q?OkRAdaXo3SoQuPmi0IKdXc9zr8pjoiVyVUaaNBYr+g/bzieVDPjZJGfQE/qa?=
 =?us-ascii?Q?sDRxa/VPX5c4Phfvc2dsEHiM2kwHUoxnc7qOxuJIKZfvvuxFAsOeF7KwFlML?=
 =?us-ascii?Q?tluA11QCqWNKQPTOqORjQdrkQ6ZUoTwhr5++ogRlg45eXoBpjWVZ4PQbm6Hq?=
 =?us-ascii?Q?m28p2TvHZJqPNvhXaNLHl7zzxECIY+mDUDaTey6zJd8Em9PZA0M09R8hoTXN?=
 =?us-ascii?Q?8iu0CaQ1d22ZiUiNjLqX4kkSmOpG0VwVFzMvZEy1N+dqbaIMjdgvvoCRxpmR?=
 =?us-ascii?Q?mQyB+reMWhRyKEoP34nge+k7AAOtbQXFce7g96KxX/Qy2P4eenL5s1GQ/paM?=
 =?us-ascii?Q?G6cGaQGC5dSoiHiJIF3FhxoPLM4F0Y92Ou7lEz7WL1tE+nmjrZCT7v9HWv/p?=
 =?us-ascii?Q?e4xClYuxMxt0qtvradb4YO0teL4XZm+R4NOH8VFT4zSLlBxEQrDJJr3hKu8n?=
 =?us-ascii?Q?agJpN8z0JXOVq89nlzYd2yNDbW4crkiGFItJsPfO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f6722dd9-8a92-468e-fcf3-08da6e20883e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 09:32:02.9715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 lbaIlUqYJxFckZuFLEwmoht2G+zRtXMR2/+eM62vNZSUHxwMCIKkelrVZfnmz48Ahx76nfLDyXX+pFGqmrau6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 09:32:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168475

Hello everyone,

This is the full report for yocto-4.1_M2.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

new issue found=20

Bug 14865 - systemd-fstab-generator[11101]: Failed to create unit file /run=
/systemd/generator/-.mount, as it already exists.

=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14865

Regards,
Jay

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 20 July, 2022 3:23 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.1_M2.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.1_M2.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1_M2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: b171aa45fb8518dcfbba315b303a4fe9bf2180c6
> meta-agl: b5044156fc318a4881e766513871611a560170be
> meta-arm: 6481a473d84f84530e0c48d56acdc185919869b6
> meta-aws: 2f5075673489ee2d3fc318f6626d45145f65d5ea
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: de5851890f9a268621515193d2ad84f8359fbe24
> meta-mingw: 205e9d942bc8ea1643a8d27b79e773625d173c00
> meta-openembedded: 0c2e416567351d55ae45e67513be6f20aa754d4b
> meta-virtualization: 7ec4b4746d9d76062a868ea77818a150ddd53c54
> oecore: b4f1b78aef77198f26a8ef9e105fa690cc12e836
> poky: 899979696f68ff4414cebf7782b37d7bae27144b
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
> View/Reply Online (#164): https://lists.yoctoproject.org/g/qa-build-
> notification/message/164
> Mute This Topic: https://lists.yoctoproject.org/mt/92490173/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


