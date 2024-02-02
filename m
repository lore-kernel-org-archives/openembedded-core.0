Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C29C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 13:51:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by mx.groups.io with SMTP id smtpd.web10.23007.1706881870905392954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 05:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=hZYci1Wg;
 spf=pass (domain: intel.com, ip: 192.198.163.18, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706881871; x=1738417871;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=QKzqscOgbavM7zPhcRwFPeiOex9NDx6Mb2MIl/YQST4=;
  b=hZYci1Wgo8YEKZoGZl+EGkTUsGt0t+e9niUMALJapeckNlXrbzmSI68U
   pjQkEgtmqFVc2pUjqgJ/ZkmA09bCm/0o8dVMvNr0KWy7KVdW0DYcqJnlA
   Yv2xiV3K68SJXiFU2NSK67Omv6j2Gd8JQnSacnqSJcQmIE+3Quw2Iog5s
   66eLP0Q3jIeodZ+PWKCxAmHqoISUeG+03rKTrI6jzyUSD6zINs6YotM+j
   w3IpUTJudBJ7z31diECHKWY7jLQzsIVbMXg/CjAGXgM9bzOdxdKT+IQkH
   b93fQxhE73Kyp42EPDbGLQZEKV6pMwxtd/Jj4BMKNwBR1ui9U89kTEiPE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="63126"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="63126"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 05:51:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="358578"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Feb 2024 05:51:10 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 05:51:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 05:51:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 05:51:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3xIjZxlFWgBGiH5uFOn5wqYmsOpnwrPEVD+p9G3Ou4bSvwmF6jo+mrtVk5JE+3EvEBEZcNt/WoFp2xfPk3J1WNGGzMVNQjtTucmPKCtinzZYh4lY7FfrzvzeqYE8/deF43gzOmQX1lMFKHkYLdJOVwBZP8oilNi/OLT1xA66WX4854aOanVLFFioogTRqARKhtxQnkdXPThmp4lapFR4gCa9ASK17a253KF/LSjWgL77Xf9p0EK6/oHh4zxN8om4NIYT99IehaaUaEiOEd9RGl44coffkmJ121c3FApfib3FoY3/jycGK4S+VFkJ6xt6BRfNktMytdNSLJh9o0l3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsD2r+wc6WOwVQa7bfrIOGBnzvRFzqrcuaULJgVtyJQ=;
 b=nbX+5oYp2fKr4hN234fhHReGPQKmxtyMybAiwFW+koHcLTaEiaesYYRCL34DZc7BOcQ2qRAihDf1MTado1pEnbQmyHFEeTBERN3e/Q3kZwiDdqkbRFQOvJZ3j0rEI+DY2hLvkSjhjducEbIGcx5FlAkPv2Z5bDtqhJsIHohESXqRT2V0l0kelYMTPIm8M0XkA2JcKOVWylxCSeXKa2w4L2NQBQMvKV+6nm4ePMoM3V/ojM61VmSiqNZWLFi00l6tlfcNzX7UZgTSrN9OnrdPo+A9qIEttrKi8CX5VlA1thwpzb6hhAGFN7BoAfMZtlFXH5xjdsupe/D7CJEvkxm3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Fri, 2 Feb
 2024 13:51:07 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::1025:6d41:d45c:948c]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::1025:6d41:d45c:948c%7]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 13:51:07 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.16.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.16.rc1)
Thread-Index: AQHaUBfkHW7ixELtiUSckp2G24Gua7D3HUlQ
Date: Fri, 2 Feb 2024 13:51:06 +0000
Message-ID: <DM4PR11MB776068B2B6A65039F971BC8EA1422@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018d44396ab5-09abdfba-e02c-4f2e-bb9b-b00d2b98119f-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018d44396ab5-09abdfba-e02c-4f2e-bb9b-b00d2b98119f-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM4PR11MB6359:EE_
x-ms-office365-filtering-correlation-id: 1f9394e5-7cdd-4f9a-9f99-08dc23f6013e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sLyEuDiEdOGC9qzu4lYnGlbjtEjw/npr89Qz1N6mGxwCLM3u1u5lC2GmNHYRfvFvfQn4TXmFgQs896v/gfLoHOuTOxj/Q7tD78ySmxl2QkvypZVFKJnjjSXuofGl/+Zs2Qe3XqenIC5KJYVNi/piqY0YN0+KUzmd3dLS77zg1ER4anJ1lNA3fSlIZtdDxn862jYhmZ3iQpiW6TKe49eUkoEAY2gRQ1tkMp9/M1mjxWoTRIISL1/ZVl8YNRVX+MXoF8+1Gboz9qcRrYfiQkULuPWr2xieHTy0wMT4/QhOKGWVlsOSNzTfn+UpuQXEkuf/SM5HdP7WqD5+zMZW4sGvhFAc1W7lsEY/c5FH/mD9ruzP6bO3LG9cN5cP3T7KpQxzhSgC51RxUGBMwz03CDwX0EEBc7nrHqYgI7i+zm7IK8LehTwK1xWsS78i3s0gK2OpbVt6cULElc/K8y4dt5V3fGMiRWuE0xUStK40J3UiTlrw7j1ka5iEDEScIXVEj9slzT2gvlbL+pBfePyv3c8vW+mNditFW0WTWNpmlbBihRfepS42sNlaYxW/OcP92jyPZZZiMatDcMcWdQKeOzfp0GDp5N7uuOc7t/X89r41+VPJVqInNK7nvSXktSRNoSGQ2rdQYfTfW/vdAi3467zQ1g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(8676002)(122000001)(15650500001)(33656002)(38100700002)(41300700001)(82960400001)(86362001)(110136005)(478600001)(7696005)(52536014)(966005)(316002)(8936002)(66556008)(5660300002)(66476007)(64756008)(26005)(83380400001)(2906002)(9686003)(53546011)(71200400001)(66946007)(66446008)(76116006)(38070700009)(66899024)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?am2yB8f54RZgA1vlLWInXkfsTvIeeRjI44ZypEBgmxKPgpJ0HRsyl7xm/yBQ?=
 =?us-ascii?Q?ktmCH1rF3XYt192dG9Wfg0cfVHV4d9gU+li2aH7BOEgbHy93+UDeTAJLwg28?=
 =?us-ascii?Q?6KHHUe4QokAaeg4gtRntuoXHVRxXDyWy0sR9Sa6z/xF9eXP8m1gFmXc8plXc?=
 =?us-ascii?Q?vcfF6bt5KWsrmpfYttCmXTWCNSI7FOzntgHwqqjPhr1l4BfhdSh8KPXLyVfc?=
 =?us-ascii?Q?umJURSjyus9PTyp/lS+Qvnq6H4LfcI3UEURc+m3mCqXMd5LMapM4WGGKxyTO?=
 =?us-ascii?Q?PgrG5BjoFdMdVEjlrPCAK2zDahvDLboruCrtifu4+6SsHW6y+rJLjuemdrqz?=
 =?us-ascii?Q?3qmDxDjq3WdQQ/+ZAvkQqr8jQTVtvZgwKDO4uG1ItoOe5Afjt5q+80YNGNcF?=
 =?us-ascii?Q?zARzNoNlL5V2WoVb4aseVLo73EkP1rZtd9aiooynZ/WB5pvJudj1Ri4r7/4x?=
 =?us-ascii?Q?nNi7cvzqI7F4UsiMS5zwj8yBlC0etXyYYkCTQTuqpnfSvgQ59rg77Yc+TEgd?=
 =?us-ascii?Q?6XmLtbbmgKYT3TZeh94dpk6ZdbpH8s0uS1IgLnjAvF9vLr7awtMeOU0ut2pd?=
 =?us-ascii?Q?2nVE7LABS7JACiBm+OX+twjj/710IL4pJdxvRSx+KMl5qFzr6kUwTHzMvOF1?=
 =?us-ascii?Q?kiRkAsCh7SqNbbwBZTGnUR9smbwBYEkWnHXDfjxAS3TVktUG57bPelRgYitp?=
 =?us-ascii?Q?JUkdXSGjWGvWPpAbdzbFgobgimHt92RfdDftXQdlHKNsQhw7RnCRx0xce9eZ?=
 =?us-ascii?Q?uOU1fabZbuN1k/7zzjxX3UqUmtCCQ1EWXNduLqorB9f0R7KPEclRX7K7HYAx?=
 =?us-ascii?Q?E+D6JUTZoBAeU6I5kFRedh926326LYC0wl5FuHQ6Q5vbskbNA/hs2NFZ1ZQK?=
 =?us-ascii?Q?f3TfRMl30DREwT7A6mxeyatYa99Hq2YOnlLxh8fPQ3ktMbZm5oSc1LwQ+zSG?=
 =?us-ascii?Q?9+aL7gN+hXCmLZeOVMEHUuthXPSHKTyS0VNVbO9eJYkzCcp6ApMAYE1/Iotj?=
 =?us-ascii?Q?NNEma352pBiAIv5lzXjERA7u8G1lrNYsW+HuhmmfFB3NToc3+MLDfApPBCQB?=
 =?us-ascii?Q?4HSB6UvWLyrL0qOe0RNvncZfYGE3pafH+RFe6xUIV3FrSAfQFY1fGk1pu+xt?=
 =?us-ascii?Q?cDf9THp6FQgb4NRfwUncBdzF6Y5K40YziHl+O9Lxp+3PA+ys12A+gyTLDIro?=
 =?us-ascii?Q?X8fgtjLm0rRVNGSvyuduXrzH1S5E+dDOpCVeB9hQwhN0A2M25cHrlVXyGS90?=
 =?us-ascii?Q?+F8UEH8movtcWupRnDKLUtP0nEBEVMdkIFKNe3tlzymdOUp7Ikn0HILbZkda?=
 =?us-ascii?Q?DODQN78TuzPzlqkP4PY9S7IdgoARuOLAw6tEkcn9EKHhMlIYLLpNR0XzK4ox?=
 =?us-ascii?Q?Aj5tISCh8qrWgwGOJ1scUdsbDXUX3+80ePs4X679iPe7pu6IkUWwGivN2f+P?=
 =?us-ascii?Q?tYr5mKJOe6VJJwfYkR3MpXr7JD8dA3WM0c7AgnVjK1BKbvfcbrqp2NR6D5xV?=
 =?us-ascii?Q?Y4EaaCYf5g8P3YAJKFQZSQWE/uoG7L0VXXfYUFx2UlSaHjaWrE0l2LnpXAu7?=
 =?us-ascii?Q?KHMYaHA/PbBjsRXjnOgX7XB1geYE/Opi6pNpPegh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9394e5-7cdd-4f9a-9f99-08dc23f6013e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 13:51:06.9213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gWZKQ+FyneH0XzmhpInH+hJpgEsjmb1V0F/pP7RXXrH3g41RcFpllt9T06deEBXYrPWt6hbs2jykaR/ZmF/B4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 13:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194798

Hi All,
=20
QA for yocto-4.0.16.rc1 is completed. This is the full report for this rele=
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
> Sent: Friday, January 26, 2024 1:24 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.16.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.16.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.16.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6498
>=20
> Build hash information:
>=20
> bitbake: ee090484cc25d760b8c20f18add17b5eff485b40
> meta-agl: 35adadd18a6a0fabbf57cfdb2f2d72c2807375e1
> meta-arm: b187fb9232ca0a6b5f8f90b4715958546fc41d73
> meta-aws: cab60ff0f84b2335e933d4eac326df9fab5b9bb6
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f932ebb2544170f43edd22739f44307809bf8cfb
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 730e44900a0a86265bad93a16b5a5ff344a07266
> meta-virtualization: 88327090d26955a678c6f8bd2585aad4d802f6c4
> oecore: a744a897f0ea7d34c31c024c13031221f9a85f24
> poky: 54af8c5e80ebf63707ef4e51cc9d374f716da603
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
> View/Reply Online (#380): https://lists.yoctoproject.org/g/qa-build-
> notification/message/380
> Mute This Topic: https://lists.yoctoproject.org/mt/103971039/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


