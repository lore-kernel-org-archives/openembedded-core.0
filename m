Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3617ECE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 12:58:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.19661.1695473927158581020
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 05:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YWT2qphd;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695473927; x=1727009927;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=hft+IjBAEEURKxx1vCDwbq3UiAiS/3IMSLYqSYtIPSE=;
  b=YWT2qphdQmxTcBjzDpLtkmCXLs9/APeVR5tggyW2e/S2u1euuNSqialn
   hFAEkV0QDfVwB8bTmd5NbXzsOEzWz+aB5b0LWm+ed1sLJAB7MAeKj1s9t
   tUX/YweJUM7/PMR6V90mbzRxGwH7Wy630vJqgatq2K85rzf8AVQm9MYoH
   OxEYiGUTHVMzfC63DAmSUTzDwd9C+Je0Zf64eFLoIA8AAjLXgRrVBXmz8
   87mtloQ1tEAxJNIfIcR7jVBYx89qaWs2W5C4mHcolWl0zyfpIZP805GUU
   tk7qQKQuq9yFcNLCvbqg12zhmsOXlJZChI1aY+3PRNot/7I3Jg3DgmR3O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="445118440"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="445118440"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 05:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="871566136"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="871566136"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Sep 2023 05:58:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 23 Sep 2023 05:58:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sat, 23 Sep 2023 05:58:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sat, 23 Sep 2023 05:58:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0LOCPZvHFtj061i4Ywb0+1FLSD9fGSeLgAGAuug7LVrp3x3g0wjsieVunrRKLFedFGuoiPeOIoYw5DdUFBcwgim5/wqD2C3X6aVTKXbVpeEl64pqul4/+QFt9B4/qn7A7bjbwpoe4dfpEVO3fxApxlB1U1e8VgLHo+6oOzgod7HfjI/7+E16v7shyq+Jwa+q3JJpgKYPAQsP2L65SoSCV0uUPUIjqbFyn9OJsBOaGnsoMq1apYCnmpURSNPpuPt0xsaDtHnG8Ko5At8yDldrCD4LS0IAevcTtipu7O61dlDCp7XzbKDvEJ9oTrZVYDLgT/YooSeo0hiaWvjym5OCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Owox5dg9GkhYdYfBJvAH8WzoVUvvrj6cICrbEkuLAqk=;
 b=L1NNrDu9GrKeKSxallGQzNDSZWNl572DS9Jpz3X4vPCHXLK9RJmmQe9woPSPcIEIgXqAWjSFTKIPK4Mx+foL1Sr3WR9/vxMizX3rB2tgGE6ZBVfyWeqfs2/J2wzb8mjQauAnqT6M1OwVNq+3oz0KNnZIvM18r8xWcDckY0/tDmN3DPB72ho6JRfLfHZ6sBjHEySnbD/Sn8c5x7AxJfcV6uZ5bpMYIB2zyvJE9NwH9YbNq6gGTsN1MuiMT7/K6y/4+CxWZOpkdPUWWH4xKKaUlhFRBHeCC7ExdESqv4AUauLVe8QW0u2Toj2AZ9kz7p5ofgKFtutpnoMkyammQ184IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SN7PR11MB7565.namprd11.prod.outlook.com (2603:10b6:806:344::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Sat, 23 Sep
 2023 12:58:42 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6813.017; Sat, 23 Sep 2023
 12:58:42 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.28.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.28.rc2)
Thread-Index: AQHZ6TT3eSm2ffyNYEajux+dgqks2bAoaH8g
Date: Sat, 23 Sep 2023 12:58:41 +0000
Message-ID: <BY5PR11MB41520480F0B12B3409047F36A1FEA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018aa1f2c11f-86d5f669-c1d2-4ef2-bd68-f03f877b24b6-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018aa1f2c11f-86d5f669-c1d2-4ef2-bd68-f03f877b24b6-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SN7PR11MB7565:EE_
x-ms-office365-filtering-correlation-id: b0172186-6428-40df-37cd-08dbbc34d029
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y8uk5QeOM8reoPwjrycJ5P3L3b2+aY5kmr3DeB3phvSI2KlEm3E2iQGopICkQeGg13ESSc+MEE7zBEts4gjcEDgAKpe3gG19p6jnfyz+lbOfumT6dSVNwD4tUxmVP7eQWFWw3scChrN13lA6kXB8YR8DQAEv3H5Ep3NMTxG2aYtS2asey2rmGHrOML8WEafipUbW5WgkwheUSkRfkVkzrFex2xSRamdaobIQ+roYxPeDhwnSlbATBrnUQKN9VINnS3C7frmzlBy6rRE2Fe5/jEg0c0BmXJQSVthPsLSAiJRsiJOv9HOtPd6iR6WZvW1mXhhKRCquJj3+FTjmNDQqVMQn+Cr3Yh8qh6UBOLrn2/HGG2nmYaJdtLSe3zQ1hdwArTu6Vwj1c1jUY0Avmt3sTgvxibhAYFAFznvSbyFJeoo9bZtS7cuniP3r6AoGCH/yA3gZblJGaZ3Z+nBmvk6l9FfxT6NkOKjsO/9Uerh8i4LwcQYttt684eJEnXLGDIxOgXmXf1xjgU7KFOsGQpgPuM8QpCGNapgLYWORL0LfORaCg5LXGX2hvw/bNOUh/+G/1fSLQVNwJwUVXw42SJbdrmKcdvPBmqvGzO5Ft0ON6Tz3TNdOo02na0Nu7L4j4uchp12zqmziWETRhG3TZpj6vA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(186009)(451199024)(1800799009)(52536014)(9686003)(316002)(38070700005)(71200400001)(55016003)(6506007)(7696005)(53546011)(33656002)(966005)(2906002)(478600001)(41300700001)(83380400001)(66476007)(5660300002)(8676002)(76116006)(64756008)(66446008)(66556008)(8936002)(66946007)(110136005)(86362001)(26005)(38100700002)(15650500001)(82960400001)(122000001)(66899024);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m1LZdXruAzIGD4lN3eCOO0mAeuvn7VFoS5ZV8Tlu0PvtUgAzbuIKEZEqqu3i?=
 =?us-ascii?Q?MYjfKP+Bycfl85Q4EmUjCkkOH1uWzsJzMLUpN5uXP4eK0KAKlwDE11WjVPhX?=
 =?us-ascii?Q?oYf0uwxf70dMBmAVjnXhfNp0VQ5TbOOQPlkePN+TwaBYZPl9vicfC54QjfyF?=
 =?us-ascii?Q?mdi5gDDVE0HEz3UcG7uBAK60m1fIAhu5tEFDgUsyW7gCcrbguWKK4Qqu7R4J?=
 =?us-ascii?Q?bXRMCwXzgaI+MOOHqk5tmGSZIqX2q61EeFOhuViK8dIXe0XBRKgIG7qijoWI?=
 =?us-ascii?Q?ZBDftgPKQADIMSwy1yu0DN+qYpIre8jJ3/KKFGCLn25GnwXXEUdE9O0ahZ7Z?=
 =?us-ascii?Q?wcHylQFWx5gkMSLUUs7r2zMepFJNvF8f+14itGaBTcpQgRSQJbfCrlW5f+Zo?=
 =?us-ascii?Q?okPTCJoU8Ie2Qi/fh1vHpsMoRWWMepFup1Ee4hfz3lqZCPsVMWShoOGr9l/O?=
 =?us-ascii?Q?LnUvOgAxHiA6nhNo4llXAwvZwM9FTJGOgAYkh1438OlWFdhpR48rBFQUoHOj?=
 =?us-ascii?Q?osrCZTc1+7mHJK2DQg/UrxqbrRHdBn4joIAv8mmlFosNeUJo2dT7R7sIUJHq?=
 =?us-ascii?Q?YMDe5OpXkXiTHGzXuWVswavEIGjSPjntqu1x0lgbEFb6uCPZ60BgsGpLE8Td?=
 =?us-ascii?Q?GM7yi8o38TfMOtFPeqaB1tWZ3koiiCf9Myf1wPipQwEOFmaaqQIYy6eng+Y8?=
 =?us-ascii?Q?8p4pZRbYoTHqwBG8+1Dx/m88bha94lOt/LS581TjdDzQ6Y6A0IsgxSfZaBoO?=
 =?us-ascii?Q?CpNf4XFgHh8CVZuWQJo7kY03zselH2VW4iCDbloIINUO71qIucVqrIIzf6TG?=
 =?us-ascii?Q?YMmavijfNsQi894yBjYU5yhfI3/lNXeAI2CY3nhZ8bZm+o3b5o9jcXBtEe8z?=
 =?us-ascii?Q?YkfKInPIXdjD8O3HkxsLXtVeROvfZHdYS0rOHJpmjYmiwgMSDGZugQWRPV1V?=
 =?us-ascii?Q?+VhdN0JTO9I1jj97CVRvtkIOAlztlSARV9R1jLyy8mkPpejtJPmI9hO4uy7D?=
 =?us-ascii?Q?VYMJ3qyIu9e2Y0+RxQedD/rzdCZNn4fH8tOsHfLIPbWblf7/dA5wlEYkH6Px?=
 =?us-ascii?Q?66YHRqSXlzHdLC95B0goieUv03lR/mwiwir23zwidcpHIB6TQsb2kRD9B3Nd?=
 =?us-ascii?Q?hH+SlRHYm8rm+wyYtz3Wdr3+YD+OfKq4anosjeeOvS9/CsvYDdi9Mt04ocyE?=
 =?us-ascii?Q?JZt7WBFQPhG7+FRxngNOnI8dd/cLFeRGOIq+OF3WmkuCD24/awfleMTMvPbV?=
 =?us-ascii?Q?XvxNADghlui0o3cFTVecpKCIT4XTMHJ9prfmxAOu+vkbjF+ih63ptg+j3MSU?=
 =?us-ascii?Q?J01LqSh4pA2wTEhm7iNgzSs++ak8MZMUZbLqrtVnafNCq+Adzb0+2VHK7o/2?=
 =?us-ascii?Q?2bIbbLA+L1rG3maLRvn4QYNieKQ9Nok83wmscrfmnauhWjifQbQOCqxajfK3?=
 =?us-ascii?Q?G+Zuuw4gljS8gy30GNRylVo8rkWRpbGb2C0O4cFEGXGalXvm66TIFhKBhLqr?=
 =?us-ascii?Q?FdHV66mx2Uhv1wXJVPxEbdH7KPqsyBRNZW6xH1HzBLsRf7EYu0AHLItZ2rYV?=
 =?us-ascii?Q?SMUrn8q+tcHcYHhN6NhhHAXltEsbIGifiG9G8I+F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0172186-6428-40df-37cd-08dbbc34d029
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2023 12:58:41.9379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9NER9okPaW1rnWxiagoT5cjN2E1yZ4bi8RVr3ceaceAptppviz/yMlLzZo2+ux5GkaVD04RCgj6+rhdKgdKf9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7565
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 12:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188144

Hi All,
=20
QA for yocto-3.1.28.rc2 is completed. This is the full report for this rele=
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
> Sent: Sunday, September 17, 2023 3:03 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.28.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.1.28.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.28.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: b60c7085ec370473bea9b3b4b65826a17638837f
> meta-agl: e0f6590189cb0a510bff0d4233667c552d964591
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 77e5438c27292ad5f8c7d3b100cb09b8dbf1c7f4
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: e42d1e758f9f08b98c0e8c6f0532316951bb276f
> meta-virtualization: 0dbb8593fa38ac2a04fcac04ff3e35611e849824
> oecore: 8b91c463fb3546836789e1890b3c68acf69c162a
> poky: 926eb08fe325e2ea13098f99d920840b9354ceb9
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
> View/Reply Online (#308): https://lists.yoctoproject.org/g/qa-build-
> notification/message/308
> Mute This Topic: https://lists.yoctoproject.org/mt/101411111/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


