Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E94EEE49A4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 02:37:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.50264.1694399817900622190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 19:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Z1QFbDa4;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694399817; x=1725935817;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=wZgOEbNRED54hf9GB4TP7woN592U0ZbSuTdJY3yOl5A=;
  b=Z1QFbDa4SWQNewy4G8Qght93wuvXX5zTSxwjzdOcGF5+gYz4Zhrl5mCr
   /WN+KuN1Ld0mByoKORzfC2mpqxBPhUSDtYie35s4DDuER7oKgpASIF0BE
   +K9fvZ/acfaeUO9WWHKnzHpIq1lPBMtz0lm0bO/FGwGNtiIhNga8N+Slu
   lK90RT55lPL1QS1hiMObIDOQol+UD/9Za/iV/KBf1V/agjMp52piVTnx6
   X7SCPw4AbunpfJG8GItxm/IeFKdRw0IkCZwXm2r7yxkMFaQJwNORVBOHd
   hOvpI0LHAeRbhCiq+4hMIN+00s/RfWT4OQJKPLX4ehrSYvDt8ZLzPxfCD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="376893260"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="376893260"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 19:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="719845426"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="719845426"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Sep 2023 19:36:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 10 Sep 2023 19:36:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 10 Sep 2023 19:36:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 10 Sep 2023 19:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrRKHprmQGCFHI8kTFEJrGbEN4g6HCVSn4C1Eluh+4kWYfG7UA3DTJ19OofUaRa9ahZf/tvjjZzaoGh4u65fjVe7N7eSVRwVcpCQaoUoi4IYQlRRxl2fzdAorw+gpF+ETbXvUoucNulWFwzxDT/DCV7DZpHl8URKO6uqj6b1d1CjQacQmU35Jc4IxMBYO6bKrDQgG7cxc7ajFWu7kW8m0H/cr8M8zvu/AqeKDT9ImHezz3wQLN4Qi/yzldoGbijKs/GEOyDo3qZw4Sc+gsb0pVGO/C+cj7cPE3cDMfq9fHkjN6m76ZIbny0gEwxuXPoAMtswJEVl1WIeUZNRYD6Ryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp4rk5KCczj3ss6LEJWVt+0q4zCN8nWiCeRQO/2LuIQ=;
 b=M/o+xlz+L5BeVB5tUYHVU5U2TUflvuSf9PbfgJROXYOYkXTlWA3cNFABQnf9k94SqXijKBOfZQ/P3/8b7/XPLi+0mM88I5GbXSA7h7NvFm+AYS5du9d+UNG9EJzNvnWyU2Eh6dglRsoveb9KBkp9QBbSkISAEkypdHEyM5iEV+eD8/3/rft2gNRttclLAfc5xttkK9bztiWwCaUYKsmbvLWvkRHLiJ7wGoKY1qboIYyCJjs5w9wio0szNsw5M5DHm0ZWeqPq4F9hVvFJVps595v53fDM6DofZpdvxLJYj0/483KoTsYX8cebnDUlH4j2/EhSYhayHkYZUQXx1P4H/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 02:36:50 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 02:36:49 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3_M3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3_M3.rc1)
Thread-Index: AQHZ4+YV7lTrNHBJdkWF30is78L4QLAU36Gw
Date: Mon, 11 Sep 2023 02:36:49 +0000
Message-ID: <BY5PR11MB41525A549F7431718B5B8A44A1F2A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018a7f28f453-79784df8-0deb-4534-b9f8-1b3c60fd1100-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018a7f28f453-79784df8-0deb-4534-b9f8-1b3c60fd1100-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CH3PR11MB8775:EE_
x-ms-office365-filtering-correlation-id: bd2f9028-e450-4a69-ee84-08dbb26ff373
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wPKFszGmJ4bsEyGCXdqBW0E3FB2gPAzGoEKwQNbZ8xB2qENuGQummab43upyZNpYumT4Qt/Up8wKVRGPNiMo5pQ872aMpZSgfTIPprUFcQYrl4yRs/Eo1ZcSKWrVPZD7UPqEHhlmIraSerAbAjd2yR7zfuY1S7zK79EtrG2gAWc4CAlsck7NF5wyZHTpHShidDKBRI1rmX7/EIA+Uimvm8HKVUgA0juulhiRwq3EcYxVBsq6aYbLb2bXCi3TNlW6GeMbxUsQc3rPfcMgsXotd0Xcw64C5jBhNciZosSGf6mfsMKC92szJbgvUQjSQA03nPiUL+HcgTVmO7Q4KMqu8aYb3hU+CBXQSKE8mOnYCdLdaiGWLNLJk69F1gJF9SspWnP8WJpWD/iZE2rEJr7VLBsmAmWcG8QKPtRaMIOJEBDV5GDNcGrzj3vKK/adHO2ZFXr9n0kOFIwq2gSJwQ87eWkm1J/qq5RNY7QP8SlqJ6vt4XE/lAdC8e2LtcEQJC+ZmlIEqGJ23rTfrzZQH0na3PNSPVolv2lLOaMUoWm7liBce6FkaUqVt5pwCE+9xap5kNflaPQkGSG0CTL27+KceIvo9Nvz1Eqyaz17XAAdTeTCPCzZhaZPx2KTVDYaXvLQsR4q9WshUwPhAzKyPmw/lQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(186009)(451199024)(1800799009)(122000001)(66899024)(71200400001)(53546011)(7696005)(6506007)(86362001)(38100700002)(38070700005)(55016003)(82960400001)(33656002)(15650500001)(26005)(83380400001)(110136005)(966005)(9686003)(478600001)(8676002)(41300700001)(52536014)(5660300002)(8936002)(76116006)(66446008)(2906002)(316002)(66946007)(64756008)(66556008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y/NMxG834hDhbqxk7xn8VNV/h8br9tbjwTOdYsW2qru14DiKmrrjuTjMIrxu?=
 =?us-ascii?Q?QU1j+hfLi3hisSt4o6noUathjjvIkBcBxPnn/EcxXowQwunWRAoWCQBMASwt?=
 =?us-ascii?Q?bEEM1l8ISK/dBiPNlsgvC4WMwlNQekZk1mNS6fSM8DpcV7G6zg7uVhlEaO+M?=
 =?us-ascii?Q?yHEaMIuBjXRPhe4JsBmjCYa3xD3N58mQ1nP26VxOSb/Vu8qw7HG4tutSJtVd?=
 =?us-ascii?Q?wA46aH93/sGtMCCNcJidWKJ/sYtQdily4vWpOjEm7UzQbiL44U4Lyj7KRkto?=
 =?us-ascii?Q?cyKvUVMp3TDimyK5fOkxs5EKqMP8eL5h0zXN1KtwnBCvhR0Pe84r4TKvhS54?=
 =?us-ascii?Q?R5aUkbK+P1CHDNaF+n+TOJmQkLqi04+A0momaM87xAiWNLgIzxggmCyZpmmM?=
 =?us-ascii?Q?mprJUhj0+JJN8N+pa4mG8eM3slDTsIqg8ildaQpvae0JjoEPTAPd0BuLfPSD?=
 =?us-ascii?Q?xPPkepVR6Lt6JQtGQuR8lCuDS+vps7Ecd37YmgmGk+S+CLO8PDczKkbZYImi?=
 =?us-ascii?Q?V+yLBoRtfYXn5FF0mexFiyxGSku1U86/95VNtYavVdEJgIHZ+zzDH0zLVIHS?=
 =?us-ascii?Q?KFki97fjtSZD7d+8G1LDVl60CV912vZlkXv9FaYNIN4Gg6RZCFlzyYIVJ217?=
 =?us-ascii?Q?UImGetTtQTW1GDcEBuHvnSL6ftSN3yiSMQRR78HBUCllKLtvPTFPAQzZhga6?=
 =?us-ascii?Q?JW5XDW2ZrjvJB+7rm+hjGpPdah1BbmYBvaiwgeY6bBFZUSsg6vA3tGHHWG5z?=
 =?us-ascii?Q?j8Y0xBxinvzYxJI2IOHs33bBEGx/k8JUm0K3rUnSKG5LNF6uOPs4F4KLGwP4?=
 =?us-ascii?Q?/Vh48aIHl+LFTj461duQMHh0ygb4zdeZ2C8FVk+hJN3FCNWoq4BufO2WEnN0?=
 =?us-ascii?Q?5asQZeWnrAzgr5geYD0MLEQoCAS1kTQVqYPlawoQwxlXXXEOvKHAmBS28Uvk?=
 =?us-ascii?Q?I9RJRcXsERVlrBT37rNj60CnebKBse26nLSVbFsrwzlaZmys5V3SX6/4xEAe?=
 =?us-ascii?Q?oUeaw6liCA30hzhEPk1v3unFVZf2+e31al+ZHCj3aOU2bdjszR8dGPRDfw7B?=
 =?us-ascii?Q?HkqRYxd+33YtlHX1PIfS6pYsCbaNwisFn6epqzxFjRZbH57JMKnmu1I78qwL?=
 =?us-ascii?Q?CHTJEncXJwwqb5eOuKcdVfPZ3lMpDIg7UaMwcCSJlAYRAMYvTgsTvU0RsZcN?=
 =?us-ascii?Q?omdbII1F4evfPKTJWkPhzMwXN0HWH4li+sckismZ7YM91o42DWP6/+DJV7DD?=
 =?us-ascii?Q?dfU2MGPTk4bj1jkjd8je9cmXLnmxg7mnu6CNIMMdggtkumXDMgPgmfQw1OQi?=
 =?us-ascii?Q?VwLUxm29sz2kQfQEKL628OAjPMI6E7pHcqatymEUgXI53LCo5MJw49Yerk4x?=
 =?us-ascii?Q?YGRCwLEEBhV9p+rNZLCaO8Uy1yG1tSes2Km+TGbJQptfHwSORKuSX2pEJHIx?=
 =?us-ascii?Q?HG6hjANBFFf7tLMGuPPRY5eUNcxZVE/Tl62pqd0SST6CcdEiqA84Yb4UVEeS?=
 =?us-ascii?Q?5PQyDojsICt6C7/VybXvpYtTT9KuIKzqcm9jsfo8kKgHtE4/02i4Gfg1zp5d?=
 =?us-ascii?Q?0dxTKCGkxAiiSQuJ+8jajTcEw84i2xoonYFySOLm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2f9028-e450-4a69-ee84-08dbb26ff373
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 02:36:49.8140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmrspmqI+XpE93XHr1luPht+CYi4f+gT7C8rtJmKrdz/xGR1XLQW2fWaPQBCJ7Zgubc1IVpZB9BplVfPpWjtKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8775
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 02:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187475

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.3_M3.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
	3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
	4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	6. Beaglebone

=20
ETA for completion Thursday, 14 September.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Sunday, September 10, 2023 8:55 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3_M3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3_M3.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3_M3.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 033896da8daaff69df3c2adb4ad5fee29121e831
> meta-agl: e654a050a3a2f2e780b35f90e6be7a453bb0c305
> meta-arm: a262d308e78b9ad5c0f92c77714c7a354c5ddcfb
> meta-aws: 3095240fb84be8fc78facdd2cdb91f77abf4e62d
> meta-intel: 0ccbd5e710b827a1cc73acf0ac75c395edc57b59
> meta-mingw: 65ef95a74f6ae815f63f636ed53e140a26a014ce
> meta-openembedded: 7554afa9b38c12a066b5970e18c1a7d60584f47e
> meta-virtualization: 113af45b75d2a19726d3e084e9ba05826128097b
> oecore: 03d37854b1dacbecd2c522821c59ef01d9bd305c
> poky: 61531cd3956c56644fc1c4cc77f130e60db1a771
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
> View/Reply Online (#304): https://lists.yoctoproject.org/g/qa-build-
> notification/message/304
> Mute This Topic: https://lists.yoctoproject.org/mt/101272020/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


