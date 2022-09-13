Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2783EC6FA86
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 07:19:48 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.2054.1663053586072905585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 00:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=JOWIYtf4;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663053586; x=1694589586;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OORn9Nfny+QBTrFrWAjARUYNH/d0XbJY4/nu44wSIok=;
  b=JOWIYtf4Pq+31D8Ki81hIPSgKXMmChPw7lgEOUFT2lYIBcesq7xPWx5W
   9Bpt8E6C17DMfRjF1Lk8G93+QG0VCIeG44dJ5IFBplJbC7xtrZObRghyt
   mqZ3pTmlDSTMUBlY9vA2d4wD3n/eBIOe1m1h+tHIlkfqmzmvCJmC1VRRV
   1g4yMZriHs/wV29Ryp8WM2dXm+5Y7Pfbg5LY0vhdwP3Y9KRJUOw8NyCPW
   txxDoVUPx5GURAPsGcgFJBIgl9JvYD0mXMLK6nBn/2Cp67YQ4PuvmtwNj
   fFrn10VAA/CJfH5kWn/+rTR6Ja4hIVxJpkq6x7okXMRU0Dgv3s39b0J6K
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="295650118"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200";
   d="scan'208";a="295650118"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 00:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200";
   d="scan'208";a="758690639"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2022 00:19:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 00:19:44 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 00:19:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 13 Sep 2022 00:19:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 13 Sep 2022 00:19:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6GP4iiYiesY3xmVGoq+vz+1IsNbfJcSTqcVqW6vdIgSjbPbBaachpoU4LCmK8fnNvYmslR9lj4TaVj8VBceoy5y8Ga9Z3FqyfnADeRGnlkqMm/ViJbyKPPDz91ioAfbS2BE9KgbqtI8CYOtw89A6MxoSGLI9Xo14zCIp14tM+pBXTzF7xHT0uTDT7vpKos3fS6yVRtpBzlG9nDz/x+6TVcW9T1ZZlb8naQD43/nb62ujWVtvfUC9+SEJSNKK8z6Xnl693ZJjrJ9qWil9uPruvTAfLYAouSbE66wszTuI3Msftl/xtX455YK7s4VE54g16CQjbpccNnppyHh6snMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHQM3PXNoW2u0dVotwDN1oQ8NCMpFICwXmXe0jfP4C0=;
 b=hwnsHTXJLxDBmiHlH//W+qIrrWa6YqaF8rv9y6p5+7EpWuHbvgKt6kc2aye9towTqESGLcZ5LVwBNyTWmE+s4J7laxWdgOVR9+5UQxCokCIpaljHVFP9kYq/ryFGzQ87rnIDZZ25hPmgmHClHAY298ldP25tBKwTlOHp6nJRyja5LAlUZqryb3Fham+rEfkfYPYxMaSoEUm4GiNQJ+T+uYdIBoj1GuIr49EUj7LGfFlEKFNpLocnwVxp3MGMLOVgbNdIq9kO4+MhAq1G/rVXexc8cnj9qHnJtpxXxc3G4dE+x3NJGBnvLqLjEzOjcX6ug7/1jeIekADp89O2nBYoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.23; Tue, 13 Sep
 2022 07:19:42 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::7100:bee9:ce02:ded4]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::7100:bee9:ce02:ded4%9]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 07:19:42 +0000
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
Thread-Index: AQHYxqe1BHJNlcdCVEC8ZXUR/gYp363c9KqA
Date: Tue, 13 Sep 2022 07:19:42 +0000
Message-ID: 
 <DM5PR1101MB23482E34D756E9674DE41C5ABB479@DM5PR1101MB2348.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: DM5PR1101MB2348:EE_|IA1PR11MB6292:EE_
x-ms-office365-filtering-correlation-id: 4b775d7d-e41e-4f20-91ac-08da955853c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3JGf9WWTEZ+WZaLRFkfnhySdMexrOg1zEKjd+olEkKl4LloPgAkXX/ncjls5NoW5LGQ4zOu6xZk+70uflafWTB2wvfswRK4Uz4TnrIzX2Qbg/jVM1i/iV++eAPreSecNtKrMI1GBFuTNdJ6ZJJnz8noW8tjf03dYTOIlRiAegMMs3REeq9WpHRVPnwj1UGAbSCB+PHffAHYxTCD3C9RAaB1FHnOJiy9jbLCJK7bkDESmaVMlgNlGyuQmqqsx+eMVR9e+w+QDw7jhJftozVDLsfy/ZdsnFcp9z04v5RcstaywnsISboRZwfndjkgTzynAz6tMMWvNmAczz0l7ywD8VLTw/ckEXGUs9qAhG/1J8WIJsHBkYupbJoIob7uOvX1gWwUtUwm/UicdDj777j/No3XPIvudQp7paN24sw7Yb/exkLVtmnf3oyCqwDQFHfCFEn56uw8eh5xrEwnKBzDZThzwkW8jYlNs7GDOOhrXs/rZwxHxWHj3eqgP7wPbtI7gITix7/rc/n8g3aXQMnChlxpDV342bwXtaRmOMcVoq07cYxYG2g1YgKfoHvn6AXZndy8PaPqSYELujsZ+lp/vPtXRgT/Gh1v66o3KZZHFQTh2Pycf6YK9yWgFKdp9xXmSKd2g+vnPDZld2VBrgHRWvBEzAWYUHBxPEzVPITc5Na8t3VwKNNvnNPctHAQfdBBdh99UlX//5N4Za1zX6C84D0nzGYwI2zGUWLD/o2cYvWigOm+Y4vr1F1L9BUsmuLuuhiPWg6e+bu1pkjTEVqMDJqgGlgZv/Skbq7PriDYVH5k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199015)(5660300002)(8676002)(83380400001)(316002)(2906002)(38100700002)(8936002)(38070700005)(186003)(64756008)(86362001)(110136005)(82960400001)(71200400001)(41300700001)(66946007)(4326008)(55016003)(66556008)(52536014)(66476007)(478600001)(76116006)(7696005)(6506007)(966005)(66446008)(9686003)(33656002)(122000001)(15650500001)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qPRGzU7Jp5T/8QTAyG3vYquAaV+JwvB/6l1yBHVHAMbdcLv9XWz2mHR5Iu1K?=
 =?us-ascii?Q?BrIrCLYIJK5vMu4/c9jlOXxpA/LtZew7AnRkhQ4Kp5a5JYvuQwVGe3mux1CC?=
 =?us-ascii?Q?75r9VnB6Fv29AR0GzOe2mCl/g0urED6yu4zgt9taQiUnBYEfePTBW2I8oOH6?=
 =?us-ascii?Q?4FvvRpENaURp4mdub+PKSN1zga1FDmX13A/R0HpiCC27l9XpqZ1FpMshlHWn?=
 =?us-ascii?Q?9RJMQKeqpHarl2NIDX1ifgh4GdI0tfaqoT8bSPks7VexC2wfhwe7S/EyxYOg?=
 =?us-ascii?Q?IG27WthuxOG7O0dNlJaH39M/JzOrgNW7aIyjwVlIjKrNr6VdQnTTSGhqyM2e?=
 =?us-ascii?Q?k3/CPZwWYyRj4tj7TIjlI43+oeLw2haNG1UVfP2Qq+EpXkBBqk1WBhzdtW6o?=
 =?us-ascii?Q?TIiTS6xFia2qE4ChR56dM3XHm9h7xIYFnEydFM7Q8q675b+L/icNXC9a7fCM?=
 =?us-ascii?Q?FFXczXcJbCQuZjRl0VlWRK9EGd7JCNVp16eQGOFJ+4Oq8z7oVgQ/bQFTVk36?=
 =?us-ascii?Q?8U5LCr1W4sDgUlJ/+QbYn6YZuvXdKe56Kl8KsEGAOOZkwaBKSOKWMiFFoDpd?=
 =?us-ascii?Q?Qa2wCBerWB+sNSbgZHstejQchjqnAGBtXrLR5fhE+C/hEzJmBdi0hBXGqUWE?=
 =?us-ascii?Q?9g0cJOjEvwB9mpLrGaWV12EFm2MkhvTSd/Qxxx5Ivelf36mPFAp+tVaMyE16?=
 =?us-ascii?Q?EvwE0wlhIxlfdUBDIdNu8C41ei7eD/EBK8mhXN5M3r1ncEut4ijyEz1YA6Em?=
 =?us-ascii?Q?kGXbKKvnYNGANbllVFwKt3BE8sa0Wdo3eCvr8JF04V9iWSK4nbyPRp/rjw2n?=
 =?us-ascii?Q?e+kT9bWUzxVw9CLfFxpwIikRbSAkHhxoZJHLv7c9zUd5UiI4hX8LmtBIUMaB?=
 =?us-ascii?Q?IY596q5GqbXV7WpdP/DDHl8RqCUqO+9fP1lOaGQ8QO0hV0pXDQ7TuRC/8x+m?=
 =?us-ascii?Q?fq2jW1oJjluYxZ3dx+1Iw4Doh2aZC/GdP+KI7oOM1ALls8BXSxuGJk7EimLw?=
 =?us-ascii?Q?4DYYgeKPmLB1odS3i+4tQwiD0VJD2Nj8le0wkkmyQAAWVherWNuMUjDRPFdZ?=
 =?us-ascii?Q?f1dJN5ZdkI9jbhLyJJL0PkHiD+9x+KIsCsZb0JHwLrMaahro+vXNdYZIIEKv?=
 =?us-ascii?Q?fHQkcMU6Z8MSgfNeUCxZB5C0iRODr9sdcCTyhqQi8/CHe80pac33fc7/a1Us?=
 =?us-ascii?Q?CuaUBrB7b4t8rlr52jpGIkAocdDKpEZtN1nsIONRIHARclTpAme9QSO12fXO?=
 =?us-ascii?Q?cmDKtFIbGuSPyI1IxMPTjeXY48lwiMNpXyojiUxkYjEvtZ2JIZiA/qsVeX5R?=
 =?us-ascii?Q?feK5XHeek9XFoU9NTky97Vc4jWtiPDz1sNuxi6dyBKpb9MJRmNUIojHkcsFN?=
 =?us-ascii?Q?/EWEChSprZvdgEM4N/ssIjHyiEivNhYz0eyF70rbNVKt7EC0pIn+ths2eYMP?=
 =?us-ascii?Q?SzRWfL37RyIwByy8xqbF6Ju62vWrahpwFrc/aTTrezgq4IQUX/q7cg0xqJPS?=
 =?us-ascii?Q?Id81v+VSrCx9xoyAXDXtO47xJthPTk+lujBrAEyWF/YATUl51mFaDdm3qd5P?=
 =?us-ascii?Q?ryctd0diaxGSVKrwnLvafCGbsZgF1WXtSBSfvQgQnKslMlr+xilqg5nA0mcr?=
 =?us-ascii?Q?zUdnyeyZoeI77IXIbunJpOAYUoZoh0eTYC6UmSgKxbD3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b775d7d-e41e-4f20-91ac-08da955853c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 07:19:42.0798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 2nEpSHnjEZ4lQ9WMpQUc1O7vm28z7Lgn3a41zgWfz5+oSq2k3/kA5n46ADXXZVMDGfA/8b+Y4tHe84ZlRtw3HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 07:19:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170560

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-4.1_M3.r=
c2. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone

ETA for completion next Monday, September 19.

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

