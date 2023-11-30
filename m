Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EF6C46CA0
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 11:21:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web10.70040.1701343265307234119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 03:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OSblDg2/;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701343265; x=1732879265;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=J/IEA5N4MoHYTVmTg/b16KwJl5AYBkxoVuHU6iHDZ2k=;
  b=OSblDg2/G92aa2lQCWKBFDDTGD5A6UbFeCHz+GeHyXA6lfNpMASI0j1E
   Zn9c1ZMqaeKFq+MBkK9s1EZMPGlLzgDQPQFMXYhCUGRFZMQchC9dQw88A
   VybkgLoBP95+nLuMAwuSf4cq0iHMX8B73Yt/ZEGQE11fQl4DpirvC7zDS
   Mz10YdVZ7A9VP3JQ/7cJAp4RxBfQ8pspcW8ultPZry+DZ7dYBrCqZcKnl
   f5Re+fadHJG1d0ZRCfnw+wz+ZVcuRLliOaMizfOFQS4KmWTxdmfHW9kzX
   eQVgiagSbNq383sNyofAZFi6CGnaQWbv//6TlLEemvu9ufyhpgRY1ClZx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="6532457"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="6532457"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="17370075"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Nov 2023 03:20:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 03:20:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 03:20:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 03:20:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lr7BzHEQTX6C7vL0WeJqDNc3+vCt32qv9/db8EV+C0Pla9IUv+YIptHYYafJ283qWCrRo40YDqbLZpSOUaGnj34VCj0RUNa50mbgTWqq/NVh+ecDHaE39/w0taqQVIpNsjkh+IApGREzCc1e6ECnFNFP4le0UXl+d4uBYj6Mn2mCMNCzgj0b5JxSLmhXIzgxr4+hgY1DOmbS3KEJMx27b5CzL5g15KtjnD6F7kqaE9IjpMdFMQ5EbJjuomIBPGBfYYZVOu7Bs13Xt1YsQGGTQHg/a3QzFLqmHwrC/mFD8jFJCDEqd0Z3vO9MEu9ed9CI+MHNRwQKySu+59yq7JykGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8r4lB25IIyd+ZvUyVwT+wl33sKzeCrLiQzYI3WyNMTo=;
 b=OPIdqbK+wfsot8kuM6QnlHmp6rYTR/LezctxqWfiux98wcMFPY7I54mir3SQcTJHFE0Rebky+NSaqcPAJNAR46IIUszKA6DqEHMyDHlyBeCX0fIXzIAHpAJ9UnnPJubeVYQ8KmLFq9LrExTT7NDnJVjNZD6V001+bmHKKngwKx0xi0CFME3slpa5YouznIJ5q3EWJD4SpMlsRj+C8WPHKOLn05efLPJvec4arZmXhpg4QHU0+BWjs/8omTEI4SLIc4HotOj/HJ8XYypR/Utu4EGSC1OhWgo+S2qulu85GNiUUbMIxt5xA5uPRaf4jspKlm6t8Qyw5mxFDR7O4v0tEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CYYPR11MB8357.namprd11.prod.outlook.com (2603:10b6:930:c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 11:20:49 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 11:20:49 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.3.1.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.3.1.rc1)
Thread-Index: AQHaHzqopYqdlTHc2E2hkD2qSWaFR7CSrI/w
Date: Thu, 30 Nov 2023 11:20:49 +0000
Message-ID: <BY5PR11MB4152B1FDC74D2FC151D0CB7EA182A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018c03fc64d2-a204587c-6202-4a4c-b479-8413df9dd87f-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c03fc64d2-a204587c-6202-4a4c-b479-8413df9dd87f-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CYYPR11MB8357:EE_
x-ms-office365-filtering-correlation-id: 2bb04e85-0fb7-4c10-1b73-08dbf19667cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KxqfS0ucyfm3aodmQVvdHhwy1iQ5GoyJ8ayn/4T2CrypeR4wwi3FgpEvdivEm6Vn1bkx61k1iUUYYNkUOH5sfXWz1QA+hTdEdSiNWpJJFtvkbiTzkDj3yyFY/jDUT3dLUBHmsLyvXC5XgzNB+dNV+w9gTB1M79bfB/GBWerPojpz41X7K0E5I3RDKbV3G3M3SitcG6GZTHv3A514X1yoR+4NDng0Jl4RfU1lwJL9fC/VqBK/VGPFLpRcmU9ww7IKEQRnR/fGIBdlIxeZ2zG3m74RJEiCBRi+6msXCO8Os7IYiC+JJscVCHHQ4/yIctz3aFDwAgODLHBO+4yl68CEfwbhs4zwv3aHoqf4aMfvn1bAGFu8yLcM/nbYtLiDTqrHdU9DC7RZ0Bd0cCi1xZA0I6IgrdKjGU8D6suXZoUoxHiLW4FcxPJgvEenSkLd7X2AXUt89FHUE+lILDuUK+l553YAZ62GPCzOuufidBlexWwhpB3rIhv93/VAHGMDPaZQ9hwCk/d2ArEqmo6gOgzQ+CEVZERNFcnkxeHeZqypBSZLeONIiGdfZcf3Cq7jMo92tbIAfWdrbhdLfJlkrINGtrGlo/oXIkTQO0VuYu9fWfOLuq1Eaw8TkF4mewxr22HEHTvfFd+4Pximmh5Ks4vU/7D7+GPVzsfRWDCWyFgDt6MZwdPfm0+RzvTpt6+4ESlwhPyWkKwhtuKRwH13ca5eEU18S2uEWU3cCiKBACyzQW0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(82960400001)(38070700009)(41300700001)(76116006)(9686003)(316002)(66946007)(66446008)(66476007)(66556008)(64756008)(110136005)(33656002)(478600001)(7696005)(71200400001)(966005)(53546011)(6506007)(5660300002)(83380400001)(2906002)(15650500001)(8676002)(8936002)(52536014)(26005)(86362001)(122000001)(55016003)(202311291699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rqfJ2zSi7aHojDDkaSKyTRmw1CIHDBqPwdVjkPo6eiBjggrPIPviJcbjxdMy?=
 =?us-ascii?Q?KP6M/ct7rXeW75ZoC6QJiehiNzd4b5fMVtSmpsIoFbetd63Td69W+Oo8wdL4?=
 =?us-ascii?Q?/cM4ofGSQW5tyRFK3gew8A7W8iS+5efzSRdhhm2udcJWsLyj1nJzVJDDxQ8n?=
 =?us-ascii?Q?yAY2ssxrsi6vIL9+KdYHU3GP62i+WZezYmeuCyZm7jtDrfCOnUyEhSFmvG5C?=
 =?us-ascii?Q?nP778y5CaDISlPgOo2bsx4GBFKbLI8hIcBqzDtzAer2uHGpyBgY4pKvEKpHt?=
 =?us-ascii?Q?esMD3/Mme4ug6+svqmN0g4odBv2tVRHV+R1DT22/+PMHmjKleUYTKXU2r9uB?=
 =?us-ascii?Q?w935eqVEfsXXmx7DnEqslvsutLi/mCttvEMCoIsYxp6StITQUd1Ab3X8Il7P?=
 =?us-ascii?Q?6EsuqTIgdUXYD1XTQg1wUvOA9TO8Xp+wVW5iSbFrkm2bJrGr3i3E3FCGjixr?=
 =?us-ascii?Q?MVqlUKiVlnlGaj09XaCv/gDQ1O7wfei1h/uHcFsc8pHZfj3/7zsQr3MLYPyb?=
 =?us-ascii?Q?FM76di27zKxQCvuoPowH7ULF+4US21RluuXitPGINJpbo1BJpo/ho9etjw1f?=
 =?us-ascii?Q?kgpmeX0M7RbXUxDXX7C9P3fB78IVklGNi4DWuC9cNBK4dgTiESdi+mAyQlvZ?=
 =?us-ascii?Q?GuSf/BtOay3TDsvHeKzJVY/bYCsFYI6yf3ae+4whB0BwpYa74PpxQmsXiFPJ?=
 =?us-ascii?Q?ffa5hIqTNHBYQdhwboc0f8k3/ckvUb7tJqPN0EzAAglVr3GGF5VuamV/JGsg?=
 =?us-ascii?Q?qpSBYo2Rnbx5gpy00ZW3b0YFjUVHhvdp8o7Bq6kyHM+iCOtPpMNfaemSmy7a?=
 =?us-ascii?Q?QlIs4HbeQD0w+3k6B7U1zlUDlBh0dMkJf3dTetmX0YbXpqJT49r2dr6RJOIt?=
 =?us-ascii?Q?lNMc81b5kB36HUP44jRF0JSRTmXLBvdlFK0VjXGc+hVUa1+itcfAHeerV2Nt?=
 =?us-ascii?Q?w0Kme5FpZWV2YAvG0ElEO5d17BpkW5392nYfDv13wraTW97tsjDsj79bKzZN?=
 =?us-ascii?Q?3oyHHLa5oBUZe+/nC/pPjhOe8Dwu2lNyG2fRRYpy127gA93DsG/fzdUkg2j+?=
 =?us-ascii?Q?BdnHcuq214kM4UJvp8EpE1hDSCYZFJY4i/5SB2kaC92OHsc+DW/rGz0qkn13?=
 =?us-ascii?Q?lqkGO+iwD3iDinT/HZSQ9TspV0bphptsV6hTO4R0rj2MCkDd2NHnWmLcDnAT?=
 =?us-ascii?Q?F1FO3amBF0gFdVxYrfBbB9i2PD/9JPbf5W9zkdT56zneEnC6MmApZTmbYHUc?=
 =?us-ascii?Q?P6JOXiIpzx1N0AkSDF8q5YzbXQFpUfVM4XmM1tWVTt/EKbfa74oVFET9X5pJ?=
 =?us-ascii?Q?njwyWPPihR7twh7WW8Z08INc/uivb77eE4RjXapXvLpGOezFYoOAUM28zaX9?=
 =?us-ascii?Q?yElvBvuUzMv5/gd1srB3AA1v2vfsF1U85vaZ1xH5Blr7lOsPTrBdg3kzczJk?=
 =?us-ascii?Q?pD29lqpOYgX4urjXH7wYeuxdQGz0E20GgkJUES/70VZD5orpFSExDN8o/WVP?=
 =?us-ascii?Q?4dv4uVa5xYsHb3TTuUHnuQEvvtdru13Ez1VYnV6ckiiTYxMwBVPB3lWsgf3t?=
 =?us-ascii?Q?Vwx+dp4LT3ac52D+RIEp+aoyQugM0wnSVMUd24+s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb04e85-0fb7-4c10-1b73-08dbf19667cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 11:20:49.1434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pxS3Ti9Uu1vHyTrkqGcIqCvRsFPQ1pvkB8d66nPDeaa8Z8zduzG2GvFzkQtv8LIeee9TwjTogByGQsTGErGdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8357
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 11:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191497

Hi All,
=20
QA for yocto-4.3.1.rc1 is completed. This is the full report for this relea=
se: =20
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Saturday, November 25, 2023 8:59 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.3.1.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3.1.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3.1.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6242
>=20
>     Build hash information:
>=20
>     bitbake: 936fcec41efacc4ce988c81882a9ae6403702bea
> meta-agl: 22ea97e52898c7ee3e32e0c683166c9071e37adf
> meta-arm: db658a77af7e15cdb8e4d9231bef8c48c5d327fb
> meta-aws: ac6f26f5707c51091ead00b26bffd3fa899dab71
> meta-intel: 52ce86a7f5f1ed751d80bc5e1d6b76db1c5b84c8
> meta-mingw: 49617a253e09baabbf0355bc736122e9549c8ab2
> meta-openembedded: 991e6852a53e0fcd40af8f0386d7f46bb318015e
> meta-virtualization: a215d8320edee0a317a6511e7e2efa5bba867486
> oecore: cce77e8e79c860f4ef0ac4a86b9375bf87507360
> poky: bf9f2f6f60387b3a7cd570919cef6c4570edcb82
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

