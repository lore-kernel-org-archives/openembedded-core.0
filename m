Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2C1C76195
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 03:48:54 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.5098.1679370524073122418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 20:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=JO1n83sh;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679370524; x=1710906524;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JTEWgZ3K09k1tGxSJcqM5w4WoTueQ5qfP+xC0oUf004=;
  b=JO1n83shY9avjzuohWPGKO8ga1MoNgzrYgSPc3G5c6VR+0g0+r3Xy/lJ
   50RcrLrVdxo/7qYaJKgAC2ErbRa7b6v1gKnFKuvhURkUCIfqqODnMfSjw
   lGiKaJMzbC+H745e45GvPHR+Xaar1LBGilVhr5EkhC+rqwnmNNKHQK+k9
   KJUyWwX/km3713MxEIbEnEXU+HaZbLbbBVjWYs5I5eVM1O1p+GY+wwA4A
   7Bl9n9hnLK/e1oTgcTZj1zZ0JK00EGLDlh2wk2ecXiiKPiViLuJWuvUsB
   res+FYVTTxqA+6q/x1YJXXVhaMjQ8iMlCLFP+2RDBAqjT19AhpeOUVruE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403713870"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="403713870"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 20:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="681363904"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="681363904"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga002.jf.intel.com with ESMTP; 20 Mar 2023 20:48:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 20:48:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 20:48:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 20:48:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lm89mLXyO0qwp5GGajkXFbm6wKRCqgs2pSNM9AUZzfblRFfpw9LmTkB5D5UfakSmdEATtIh7SR0frB9lAPOsuOB1XUGJ8aGcuLdP8SI909HB9vLJAqayxyhOcuFGUq5BxC5I9kfXrxVAb7/aP/R+/w6unB9qYs6Eu93MN1PwAxS6wifDOoPv++dPauMM92I9HYiRsBGiuvrx7jwO1FJLmoHcOCPAuOvhdkCrFlAozX44KB8LV9UldACCVxQRyyoU9TLtGjUcK6aGoZLVYpT3528EyX5F7UCc+FONmUOAndIj8/0VzVb+bxonOpQGLPZqGNhxhYgSnLfpza4rRLlBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCE4RRZC1fP6EGJ4EBsmHs3+GgxdPZMFVjsWArCJklw=;
 b=ZeIECkyxwNdJ4Yn3lWFVgbLJDOJhd5T87DrD4Jg0bFMfGWhyxHEogRNCIgJp6Eqjn88DNezpojmApfBqMLoYUQUGHzLy9+ByjFhVqtrQ+hR0YLh5kz1i31P6WQWrzXEh3RR8N74aztwaCW2UewoVltZG7msqdTNE5sc05vrE5C46KyYbExKRwNZ+tUt/UvAvVYkkUXm2FcvubAVKVfwEJBGI0pRKoXXan6IeBcQegaHwSSo6ZWswE/OgoIJOjIUzkjBCsGtmIUCByoCQge3UVGbDYM5lEGWvKwRH47XdEwPnfP9E+7HrpSpYpU4NiLRNOWGreB5kYab1kvKD8uGgLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by BN9PR11MB5402.namprd11.prod.outlook.com (2603:10b6:408:11b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 03:48:33 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931%2]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 03:48:33 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.24.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.24.rc1)
Thread-Index: AQHZV8l0yrMFzSW6mU6/tNSaYsz1P68EoC0Q
Date: Tue, 21 Mar 2023 03:48:32 +0000
Message-ID: <BY5PR11MB41524324F54E9A8FD85C31E2A1819@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010186e8eb6702-b82e038b-e892-43b2-92b5-f45b8eb9944b-000000@us-west-2.amazonses.com>
In-Reply-To: <01010186e8eb6702-b82e038b-e892-43b2-92b5-f45b8eb9944b-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|BN9PR11MB5402:EE_
x-ms-office365-filtering-correlation-id: 3156ecc1-3006-4944-84d5-08db29bf2458
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /kbQSjJbF57VHK+GiSxPmwXaz9E5oEDxk77u8q8z18JpE5lresOxDTqWrlUp/es4cEIJVppqG6K5WDk5CwatKb3Q4ryNqsfHAfRGCK9QwYAMnT6RRO5kgxFvCNQrfWBya0xO8Rq35RvQQIGhpuwhn/qSHJ8Ww8RKTaqiu5srEm8TfT8TSO8nBcFd2b9zDkVdYl0984TttFy7lOK2kXMb1HeV/lDw66uMdWYRhZJzQCDpSrifQfBa6Juz32q6CSzxzUfRrQIoPhLNEbf0RzmPLjvV4UN+YGDTEgx1trE/xPm4Pa7msyTnIwjvMsQ6992Jb+6vw1oVXBIXDigAlG4xOyFw8oKKjHQnpMyFVQtYMai3l2FpNeHOVyCAZPuHALRCB3ynWWGkt/VKA1Bdd/VBBxwJZiVR9R4ISnV/Ux4pQBS8pdZoFJejp+V5RxZ2UeYk785qlY54DcQ5/zZYDpXQnhOP/eNPhjX5duTrs8gKZIFqNodo3FfKXK6juAgFzwet3TayFdHq2yPD3kSDy6DV/j4ky5hAZ9gwQiOj6VcphB9A7SEKAa3sh4yLQC1BUJ+CIwgBQKOhfRnLS0OAdEonQ66SGH4TswM34VNHx/Hbr51kd8cNRtPOgrw3CrcA04LOAJS/PaWT9mrXZ5nxFflmHRy12tORlYdUTLLrk6cu6+mY7z1KhURZKN9SVR+yIWWI8SCXSqCCq5TRKixd/leXXxPpTEdHNk2t9eo/omw5Kto=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199018)(38100700002)(71200400001)(7696005)(316002)(110136005)(55016003)(33656002)(8936002)(8676002)(66476007)(66946007)(66556008)(76116006)(64756008)(52536014)(41300700001)(66446008)(5660300002)(478600001)(86362001)(2906002)(122000001)(15650500001)(83380400001)(82960400001)(38070700005)(26005)(53546011)(186003)(6506007)(9686003)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lkZEIrhv/etTF3wghRHibBrdSGGQnpfLPNkyj0FYiDSWamVhMIJ6Iir5p1fm?=
 =?us-ascii?Q?ajhAD4U/6IUZfS9QH50cJWi45m0yUxuopdIoq5WIUDGmrPtIe/Sdtl0R/Ws3?=
 =?us-ascii?Q?VsEYS5IJ9+BSgyhSRbxoy1nnrwczpNHXGCaEZZ8sBfyubgKyLPBALHu/U6Cu?=
 =?us-ascii?Q?QS6S7x85pWkv6UE9CoJl9V73fZaCxT/qC+zgogFnua6lJQYfTh/8fli6sIrL?=
 =?us-ascii?Q?k4C28NOXQzxrOhwKwxZpBvlF8H3EZ1XxaRU3205g+qSMUnl8cNW2pj9sV1cC?=
 =?us-ascii?Q?Sj3cyh9dNibmmu3srcMs+xm9X8FW6dchsTV89kys5/5NSXK8vgzQm51ARlqy?=
 =?us-ascii?Q?8I7W40TFdLsVZzs/nPNQsY877vNgWuXZigfX/6cRDOCeEd2/+mnq/TERkAcc?=
 =?us-ascii?Q?EFTdvQ2AWkaHGa7NkGC3P/ivcRxrca4tgMJl+EJTm8ecpSrvtt5xXsi9lE5X?=
 =?us-ascii?Q?0ClJw7oFhpQOtNnPxAiwAVAvs0S9SoEHuil6HqU8LPPQp+aTRDhP80P0VM29?=
 =?us-ascii?Q?3WyCWHRDzlMp7yJHgorf6LS/NtKZre8BR2SQu8YrTWYIikDViVTce2KuAPIl?=
 =?us-ascii?Q?/M2YYI/qL+099041TeYQGnd1oPqIFZ+zz45Sv6sKnkMXon0ejswFpLnGIGuK?=
 =?us-ascii?Q?7/LnocFJDCQ43NJsjZLcl+WVGEMFjFX/c2ZheqcBO3rX+zcmiS1DGbo6pM61?=
 =?us-ascii?Q?VPMWfeM2agJNl02CIL0l6/zLAlsLTpcNoOfKnkq46MZZRwCBO1tRLXB38AT4?=
 =?us-ascii?Q?yggq6YCc8T2egdTQbfXd/qS4wojKpxSFHHkAkIefhxapTRsNir3Zje3wRU4u?=
 =?us-ascii?Q?O96Ie5Ef7NNUrLUvpd7Eg2vRqYfr/bBjoQYH2q92g9MC9T+mTwZOSKKI7ypF?=
 =?us-ascii?Q?DbMN/U2yCont0ZGcWyfhMQDGsqFlkk5GamIGW2jY9z4SBDBWYKgKD6++16bl?=
 =?us-ascii?Q?KVRNjelGTxhCWtOEiIu4Gp5ARRS1yDOUUIRRYEVhp2276v626TStt9hcUPFw?=
 =?us-ascii?Q?Kr5ncyZf34OANapb3E0W4CFySD7h8akP8/5+SMZ5oMOlWCo90Ar36lgaMGSc?=
 =?us-ascii?Q?OMYShP09+1zJPVnm3Icu7YJ1DOrOlnGS7mSQz3+aGnTFHNKPfpdQcOrVKqaV?=
 =?us-ascii?Q?BWJ+Sm2WXrsGAyg/ib5cwWmNd1MjXxWsrjgwIu7XijwwH1uquJ0ZlmLTv6J/?=
 =?us-ascii?Q?VA1+RGS8V1tGhTepi2zJm8Jv4XDiLDmVOgr7/daQOUfM+qM+tTU4VcW4Tlt6?=
 =?us-ascii?Q?imlFxisMCZtnW6ZqhApqxn9CxX9DXNUL+1jVGbuYqy3JvswN+5yhhtLuHc3x?=
 =?us-ascii?Q?AVVW4Og6WOdu/R4Xk6tjyJhJeWixav4R7gwhiatro4hodzM1JoNhMzY5NnK6?=
 =?us-ascii?Q?ZC9xiBA5+IqVRHIVVj5gUw4h6EQAb4Wzt7jnXJaYMxSFqEPYFhOYCvwYmSMc?=
 =?us-ascii?Q?5PW28TZ/C3fVb1EJenzKvG+nqfFWR2uKi1WcPiLIyTGQm4WosijohhUDTHQ7?=
 =?us-ascii?Q?svVl4agGZ4B9mSHKwiNMfvJJ4q28TCmkVmQ7vvfpBG+yyoVRFXYpOA/jl/5S?=
 =?us-ascii?Q?01XX61I11FIZq/uu0p93PtW3Bw6Va1j0n1n2D+la?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3156ecc1-3006-4944-84d5-08db29bf2458
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 03:48:32.8174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGUXGff2rClj7U4hvqvtYSFqWjyTN4nq0E14osw3gtx20o3OnnHVg/HFNPinIqqFGNi7HG5BESw9AHIFbHZ6Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5402
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 03:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178849

Hi All,
=20
QA for yocto-3.1.24.rc1 is completed. This is the full report for this rele=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Thursday, March 16, 2023 1:36 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.1.24.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.24.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.24.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: a4cd5b0b4b355b7b75fb48c61289700e3e908b2a
> meta-agl: 532936bdd0b2639f8a8f9cb495ac2a8ea382737e
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 70b6bbe05d7a085eb2b902c3b9c456ce762f1db6
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 472ea60857a56c6b08c64af3f6ed8b23d7cb0d21
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: 87571345059f82fb7599e3aa82e6fdcfbd361098
> meta-virtualization: beea119eb529b4a11f266004aee8b548427aea39
> oecore: efb1a73a13907bed3acac8e06053aef3e2ef57f5
> poky: 11f05ffddd0a7adf05b1c016f73b10ddfa2daa10
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

