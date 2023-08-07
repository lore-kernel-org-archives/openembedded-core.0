Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3600C41513
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 04:45:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.27402.1691383516076573367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 21:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=n7i1VtwQ;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691383516; x=1722919516;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=f8GC8izEaXNmPXlpY3zo+A1Kmr1x+gjJ0+BRQQiTs8E=;
  b=n7i1VtwQ8RV5+IbVNkV587QU9yaSZ81W8h53k+V+685gJS8N714I2EO5
   n+g68fi33H5JBVZ8NtVmqpvRorQrckihzhxlskPLEqszfxQ5RFMd0A93V
   dBZMDi/9UWZJdS9+FXyRtU/tb/pBYugLJlEHEiMYRj0c4Dwcyl5rKXKxw
   I9TEJSG0bN28NXGH8MG4yHOd68oSjeQcj7xn9f+2ijnntPCVBKycIiSEU
   gi0ucztPAAC42fu8vil/++zT1XE++jXHI/6hN2Rfm1kPT629/UKl1FNjL
   SROz6ctcKSOoZiQUxtGNoKkxG9gt5b9GbLtU156cyVV/Q8GjM4B+X8aEO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="374123476"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="374123476"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 21:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="854515751"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="854515751"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP; 06 Aug 2023 21:45:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 21:45:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 21:45:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 21:45:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 6 Aug 2023 21:45:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbtIO5AB+biH5uAakia/trbeYj5n8ChIECUx9aRlAkDEZ66v2gLxPPSF+XzINfN6GcqPEGeY4V07cd/K9EWjZTjnDZcPuGD5lQJeOqJoj4ABqshTW8WPJgPV0zRVu9sWIFCGamAzDPqGHd3R3SilA7QWr6DPgvnfQtJ9xAmYPOlWWHKXlTnSO83pfQSi3f0/ndzgRcNrm7oinf3fe4Ij366dUvOxKhqaUdI1tntL/3peXwXrue4eoqCb6EALZoPNSqZHTT7jXSUOhPGifmC1K04/bcJaodQqMHfhV5Jp3FugzFl7h1eLTBTYYAX9kp9qZL2801FAoX4DF63ODw/nZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwTVTlYDfHreBI5KdddnEIerXQmk8Vfodxp5d6mYBko=;
 b=Qxo4+afQXnEIS6God0qEG6GRPxV4yGh1mMrIoV/h/DYTRRFJDa/8MPzOaLP1lqS81oWnU6XNk2+v0PaRbnXmvAfO/oQf+3Adbk9/8NgwfXxfG+5iDbAAzwqulUnBr33wHwqNBw6uYt4tKyMuSx3lyBsqUIVY9U3OraxYzKlfxFJ0r03EL4jFcqTUchYzno0CjJERmJAzuR0TgmlI29ysGtkUdbhlLXEac8B4WH1Mot8dHUjcWLfce9PJsvqru4Y9UgV6Z4CAqzbSwt9xJaMzfzN9MS3xNfJN5BxLAfU8ggG5qSXazIko09uHP/YNJDIujN1bESGatDT5OSMI07CKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 04:45:11 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 04:45:11 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3_M2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3_M2.rc2)
Thread-Index: AQHZwCLWR2cbuHfYpU+JHkhunZuH7q/M8vVQgBFgUXA=
Date: Mon, 7 Aug 2023 04:45:11 +0000
Message-ID: <BY5PR11MB415267AD705F74F429AA2225A10CA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018994c968db-984564f2-0172-43ae-a91a-82b306fdc587-000000@us-west-2.amazonses.com>
 <17759B9F9D3F19DA.31298@lists.yoctoproject.org>
In-Reply-To: <17759B9F9D3F19DA.31298@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CO1PR11MB5028:EE_
x-ms-office365-filtering-correlation-id: 78fd5e2d-e202-4228-657e-08db97011554
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1xrfjbpycgnxJaCuMgvasgJHyXnrQJD/7tnVASBSSBp7Hmoo0/zDq6wBkbQiOrAUKzCVBzkUpTQXr7cglrf0mOt4SYOj/NZuht6VJWx38KDCRnhqCEd39dKjWwczyIp5WlpSP4gAXxttX4Mwr9gglbjw+SwBGZ08m+1OaFCEg+C/aCPIh+SsYnsK76VVXIJSKQHi7FPoVM/L63LUZ2KzlVmagaqXQjxB7oHVpAn40DS7Q7GhJ0R+Nf119J1bnW44eJEHUklxMVX1z4EM9+GwPBPgiqUV3OrYNjN3mLKHnCD9bR8Q2oHya2CK/I9+oCb9LoUqNKEfx5A5HuqIVoKnu8yWaZxT5gDe54cVw1k9U2/1yXc6pl6H9l3yjC3K6HKD/PEXBRQm38bfg799FfUwM5PyeGH+7WWa/Vu29U28j7wEnTCS3dpcRVEOgrL4rjHoGbqfWZHBKbGNk3Qbb1m2UAN76WYw46h2hy1OA2UWPfv7p8wyuK7eaE4szFhhOv/Yk1JlIIbVgHWl956ObHRZi4lk0CL23VxoIrjiEt/Fkn7aFsttD3VO6TbuYOUYf18vwZMWSxq4w4w9QhLFr6dJ1AMPD5SMcmCZbx6JZ20QwjmkuVkG712qcgquhunSVrYVn4mhUJdwUaUdiIMDbssf3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(136003)(346002)(396003)(186006)(1800799003)(451199021)(82960400001)(122000001)(478600001)(83380400001)(66899021)(966005)(9686003)(53546011)(26005)(6506007)(55016003)(33656002)(41300700001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(8676002)(8936002)(15650500001)(2906002)(7696005)(71200400001)(110136005)(38100700002)(52536014)(86362001)(38070700005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6lMhg95hog0G0gtvXADdgBF1iz5NRy/RGUhpDQvbR6b4XpnM6SPaGag0NDVD?=
 =?us-ascii?Q?exx0SfxuVElOpceOI/VSXlarkVtrqS5et+Rqe05eQAA6mK/7kra4knmXBAQ0?=
 =?us-ascii?Q?ycLnMeleMjVDLP9QpPfCV7d9ucXgWXNC6whrtn/ZnS8a7zHJiK1IKPfsv1pM?=
 =?us-ascii?Q?YgZyUny7CxiPA86vWTEL7fl612ADF8HbBSuFywY2rb33MHuTZpgXeX4Vdhx+?=
 =?us-ascii?Q?uYKqzhaq6hpcdCdFFbOCc4/o+uMZ/tZ+NVdwErnhBEFZjZM8L72/OlLBd1Ds?=
 =?us-ascii?Q?dB7r8oWJGJG7Ex5S9bvVq3HSl2nOrTNPPXJDIgWsmX7bz68BU/SO2B/up7h9?=
 =?us-ascii?Q?UUKTRj5J6XeHRtRS9YjvN7iHJPeffl2iJ4mlp8WIqVK2aT5cRrk4HCSGAHQz?=
 =?us-ascii?Q?6NzfLRlRuBxuHW4WF/3CIH7XjYspkOU7kj/tAT/W9esK5ge30cilY2/S0BYP?=
 =?us-ascii?Q?fsBvl/AxalxtYftinRq0YSkOnrOU+T80pvybNNufKSBqI/Z/vCotHM83L5M5?=
 =?us-ascii?Q?kATqzmhDx8UoAyIFkrPgBtQRZwF0BK6453XbfDfn0KFIziz1dWe6OWNyxKUw?=
 =?us-ascii?Q?nfZf1Q7N0tJ6OvtyCFnV5Arjhi16AN1KaMAdyNPfdB0gW2pokAT6EuWWh/Th?=
 =?us-ascii?Q?cLR49QsZvrdu1iOsXeZ0Mpc4qVnTRhncpcynCUoCo5Gy5UbR8BDp6kxBL33P?=
 =?us-ascii?Q?LE/7WC6509IpvoEt/1M8gm+SEUbbgTUXBNRzrJ9GQg6lORKS2Krf1tvhELwM?=
 =?us-ascii?Q?+i7Ahm6emuHblii6wwoiVYmi02HwzblP5dPtavT6SxSaxUgAMI2TWn0GxBCr?=
 =?us-ascii?Q?gwe1hwphMNLwh0p7gdzQITDIdKCNnVMcjAmESr3Zae9taKuvPQ5Ch2sc8Xco?=
 =?us-ascii?Q?x8d9ZtzIrDVK9TlHTe+bhPe2auyzqo4zbUYW08DZjsvDq4r0sssc8f5NY2o2?=
 =?us-ascii?Q?1MCNj0H0qrAW7ZEZca6iqE72KbkEqqwCc7aqXRiAfnWsPQTTfHAYI7C3XAwL?=
 =?us-ascii?Q?AbKLGzsR02hxQYDX9riGX9086KgBkz18Z9d+u6iLWDiF9+Wt7p7m7yZyzJCN?=
 =?us-ascii?Q?T2PWe4mcEy9Xady6iMcYWPGgGnk+cCxr+nEjDxjhPF2JzKNka6960K8PZH0w?=
 =?us-ascii?Q?V49di1SXrG/tSCMe4X2NwyAqIBcb42CVOvny4SHohDKmUuXknUmuSQwd2cGX?=
 =?us-ascii?Q?JYwmpYFAaXgUq/8rZ8GbCQlsjfQNMMJm3+uWvuMVUiWJ2w6EISdPHKM3D/yC?=
 =?us-ascii?Q?NrYByVbWN8+3hds7ojlCiNWEslG11NwGUw7UYFYkhHHhAFF3oKGPPQxw0ffv?=
 =?us-ascii?Q?dbXZBSyMSJpR5Pm49GY5RDaZ8za4dntbWGrQsguNZ7wjF7/X7tbjD87oG8un?=
 =?us-ascii?Q?hDjnozOWb2YoZUevcTxfc4VvSPoYl/XKhUpF5J8jjez6VsXYAFOHG2oWpOi/?=
 =?us-ascii?Q?az6S5pGByYJxjB8tx8lPngOrQS4f3P5suoWoldHCLi9njjZrS6Ni2Hcpig8q?=
 =?us-ascii?Q?UqBurOrFpTeKRFKExh9O5HfjwmAAqtoC+/497k6eGgxnzKvn6MImT6W6hsEL?=
 =?us-ascii?Q?UGl+9INQPYGiN0EXd6iLcDZcm9msIS53okAWo7cm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fd5e2d-e202-4228-657e-08db97011554
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 04:45:11.1309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ftH7c3DpcFv4cn3lOlYbM+UD73S5tuF0qLMBL90J/ywgLJEYsihOlklHr/nDF/SxCrR11bPYPwyQoIOypN/2yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 04:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185580

Hi All,
=20
QA for yocto-4.3_M2.rc2 is completed. This is the full report for this rele=
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
> notification@lists.yoctoproject.org> On Behalf Of Jing Hui Tham
> Sent: Thursday, July 27, 2023 11:26 AM
> To: qa-build-notification@lists.yoctoproject.org;
> yocto@lists.yoctoproject.org; openembedded-
> core@lists.openembedded.org; Pokybuild User
> <pokybuild@yoctoproject.org>
> Subject: Re: [qa-build-notification] QA notification for completed autobu=
ilder
> build (yocto-4.3_M2.rc2)
>=20
> Hi all,
>=20
> Intel and WR YP QA is planning for QA execution for YP build yocto-
> 4.3_M2.rc2. We are planning to execute following tests for this cycle:
>=20
> OEQA-manual tests for following module:
> 1. OE-Core
> 2. BSP-hw
>=20
> Runtime auto test for following platforms:
> 	1. MinnowBoard Turbot - 32bit
> 	2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
> 	3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
> 	4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
> 	5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
> 	6. Beaglebone
>=20
>=20
> ETA for completion Monday, 7 Aug 2023.
>=20
> Best regards,
> Jing Hui
>=20
>=20
> > -----Original Message-----
> > From: qa-build-notification@lists.yoctoproject.org <qa-build-
> > notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> > Sent: Thursday, July 27, 2023 8:40 AM
> > To: yocto@lists.yoctoproject.org
> > Cc: qa-build-notification@lists.yoctoproject.org
> > Subject: [qa-build-notification] QA notification for completed
> > autobuilder build (yocto-4.3_M2.rc2)
> >
> >
> >     A build flagged for QA (yocto-4.3_M2.rc2) was completed on the
> > autobuilder and is available at:
> >
> >
> >         https://autobuilder.yocto.io/pub/releases/yocto-4.3_M2.rc2
> >
> >
> >     Build hash information:
> >
> >     bitbake: 64bc00a46d1aacc23fe7e8d9a46a126f3a4bc318
> > meta-agl: 25410a640b879405d4f93585f3d74c328f487cad
> > meta-arm: cfcc8a4d13c26793ecab2d8da9274eb98b8cb4ce
> > meta-aws: 86966086b2dfabd7113253bc5647f87fd6d42423
> > meta-intel: f2bcad2943b11b8c9d9ecdd25551a841ba98eda0
> > meta-mingw: 92258028e1b5664a9f832541d5c4f6de0bd05e07
> > meta-openembedded: 74e70284acb2eb2f2a47a1ab1aa5ee0928d46344
> > meta-virtualization: c5079557091b215663458807a8f617752614a6bd
> > oecore: 6ac110c8954e5fdb71d5495e3eebc1ca3958dc19
> > poky: 3eff0eb5ea77de20d85a2ffc64652579cbd7755c
> >
> >
> >
> > This is an automated message from the Yocto Project Autobuilder
> > Git: git://git.yoctoproject.org/yocto-autobuilder2
> > Email: richard.purdie@linuxfoundation.org
> >
> >
> >
> >
> >
> >
> >
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#286): https://lists.yoctoproject.org/g/qa-build-
> notification/message/286
> Mute This Topic: https://lists.yoctoproject.org/mt/100382706/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


