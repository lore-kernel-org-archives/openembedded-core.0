Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4E7C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 04:20:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.45017.1703132428320561335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 20:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=IA0I0fQs;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703132428; x=1734668428;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BDQE850OWhtJDcsRgqnxccq5b4RCdUoIIg1YqSctHYY=;
  b=IA0I0fQsiEAti8JPtKBUo5NOhL/Bg+e+isUfIM7Fu/zJOE7wIjfBfQic
   wn/feHhTnW1Hhxli7Z9YFkicvRdkMhPx1Hb1BHFaCdlEZBWtmK00OQLxG
   KpeYpQqPx4K9DpIMxhBJMbCghO3CuVSAQ6A0JNBe99NB1aNrJ8NbONqFH
   4bJJALde13lLvlhRSjPxGqNZ7pRkpv/8cfdlc6r4GNA2+TH9ZZJmFDnuK
   3Nm7AupMwkSoF53GmDPCV35jAFXPFu5/gFZ3A50MXKLacVajyqGFhy3Wf
   j5smkIkzV8ByeDkPs0QFSBdgm07cfJterk9tTgqkrL2n3uaW8H5ZVl+eU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="393086107"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="393086107"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 20:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="842504483"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="842504483"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2023 20:20:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 20:20:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 20:20:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 20:20:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 20:20:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvGa1tEjq8kSk6piYU84x51nrbuFg9d/B3RRfx+1Sv7xUv4779K8yzOAXXEKEkp9drIsZQ370HNNzSH89HP4lyNw2oIUS1LOrTwb2pebOFYNiX7T1JdXiEsTIuRxBv4USNycrii8CcJO2wFuoJwIQPcFQX3byeENkRd7ee99YYoms7T+oevUrc92/0vugKl1D28/hjHP/YQUsZf3S+siMQMFxVmsfBk1xIMwdxVcKJB5gZhVvRQDhRtREmbH/dhH3sFFVv2zSXCVbT/unAZRcGLO38soDAqLKriQW8OpujkHAF48J4/fTrFWn/aQvEqcRXzbZZy2QAqqd4BrSV9zaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7x+6dHGyxVZwt69DXx9BzMg+02rxLsGIvPK1IPFuC0=;
 b=oSiSKIvIMGV3rX+DYWOtpUibWq5Q9bK6x+N6782mawsWRODG2NMS0FbXQBBWSM/7qmCPd7GZOJxP0DpX7adyIuSTsLH/7YwRv094sLwYsidYngHuuFV6yqWFrvRX98iAQ98xQLEdaRD/Jjy6CDWso+frJik9R8GNOfmOaP7Ga59weGqZcA8aed3Ku1To709ud8mvlcRiK3tZrNbh/ANdCQdlSmPp/bbcMqvv8fu+93Pi/peAZR6kve/2kXuWK5FMCFp01NWacBkxf86pyEf1VUfepLDa0L5re3jG6rFYNE8HNnoo6hxmKl9wiW5547z7HlupiI/FFlttvy0tKdZN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Thu, 21 Dec
 2023 04:20:18 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 04:20:18 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0_M1.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0_M1.rc3)
Thread-Index: AQHaMcCUJBUvZS8nWkmohJxdwZ0XpLCzJWzA
Date: Thu, 21 Dec 2023 04:20:18 +0000
Message-ID: <BY5PR11MB4152D60D9898C753BAC9A424A195A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018c7d619dc0-ba8b9b23-ffab-4656-ae64-fadc60b755dd-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c7d619dc0-ba8b9b23-ffab-4656-ae64-fadc60b755dd-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SN7PR11MB8284:EE_
x-ms-office365-filtering-correlation-id: ef282436-aa1a-4a8a-e5db-08dc01dc23cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jD7FDdTEFKd0ADq+rQ7OOW0amU3EoAN+mS0GzkEe7UNjjHUEOZbdk8BMBFoVns5XYREsz9SwlKuNnBTeNpB2UgbfebYfUsuFAarfNh06EOMG3faUq8aFLwG0xufdj2XEHQRg9FskRCDq6iD7fcjQG5DxcpzOZ74XLvorFJCB7xnKkJYVQ8Mo2YzPtbWuK3ystckzgqZSkqDvb2EGQzZ8dv0pyVfIafQhr81joRZYgzZzj5ue6mAGxoc4bY3rBafGq07PZyO+H3nQoJbTXvQmG6w+eBqa3R1Q6zw5f6votJMOe6/wrsQfZeD8v66kp4KZxJgq9A7wrgiXAz/ueX7RMU6K0byUxJernovp1OD1nqpVt9H2ZaRn9yTa2fnrYUtZzDrP4HDIyIa8iPsDPo4PuT4SrbbH4qy0uCKVL+6E/4WEMEcHPk/iKV8zIhoftsfRJAq6caGJF+LMWyDnmu4ZSTJbaphbAFFMPHQpXQPfHKiGd92VEK91KlzqtckJlf1JLweoWlAQ84nqjwUdEmqzKP9dQEVhoHR7bDidR2c94tsqnNBJRrLltqQG3j8f8EJoJnG+fZ8R3l3r6ZiNjIydR8gzZwPIhRZ08Ylt9sNpwnE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(66556008)(55016003)(8676002)(8936002)(26005)(478600001)(2906002)(316002)(966005)(52536014)(110136005)(66446008)(66476007)(66946007)(64756008)(71200400001)(76116006)(6506007)(7696005)(66899024)(5660300002)(53546011)(9686003)(86362001)(122000001)(83380400001)(38100700002)(33656002)(15650500001)(38070700009)(82960400001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rWO4gzunOsFsNNas/GMzO/V4LbFKpbeNPixWPu3X98zwCJvGdTr6Ar0gDWN4?=
 =?us-ascii?Q?1D8MHOBo6gaVdBElS7nihAMDE9mSwFZcMTEHyZomBdAu723YBfl2IOEG5IBf?=
 =?us-ascii?Q?A8fhBpUKrrNXucoxfVMIX5PdCYlwwvMIhFPnEzRGTHGDVBYbK2wjM87d4uXj?=
 =?us-ascii?Q?K9Ptpj8n8z44OF+dXnTUO8wz4P6NjTP+ELU8XUrEjBHJ3xxlUUwHoNIkCfHx?=
 =?us-ascii?Q?foPoIGU8Fi5/wcWBvJruRpElQ/1dWoUs38NHAzgH7VWonTamj1RFZEo3V/Yl?=
 =?us-ascii?Q?qbnKbZPs2v0pmHo2bc1vSWvAUQu9EgHD+rbIXtjMpqFY5qJN/scYbaXLTMLM?=
 =?us-ascii?Q?UIjY8TqerP28e62+3ThZBGQSsuu5HqPQJr4gs0UC30peRj97/me6tqTw5mma?=
 =?us-ascii?Q?aEXsZW29uFPoi7Q52iluG3H7Z084nJnG6jS6ax5Ol/ppYJB6HycrAQfaaA1U?=
 =?us-ascii?Q?RnNx57bgpdE0HEeT0m/+L9iz82PWXyjfTOWOglObhYRglUljvIiSU6pwWwJD?=
 =?us-ascii?Q?mc1+tMuKACeTr/jVckinr/vj5O9eNDvnr0Zhlg6IIEZpUr3XYliUUP2Gfn/7?=
 =?us-ascii?Q?qfgXeg7tDlaYRqQpu55bfZsZuY3wZBtNjpCC0XfGiDWY6VGa00yADnI3sOo+?=
 =?us-ascii?Q?1cNY4Fv/bvmu5UkPv3tV6DLP3mqINDhKhz7zHXdaerEYFS+xOq4EC1WnhOVD?=
 =?us-ascii?Q?2uru0ukeE5V6VRgFhRlLqznX3aEWrq2wiMYxyKL/l7+ges751xJ4Lbx+jaJv?=
 =?us-ascii?Q?r6HZ6od+9nuRlNZt3IGk66MRcf/3OqIHw6bJIki8kr9YHiIo5L5kv8x26qTW?=
 =?us-ascii?Q?GsPWszXbEFAJRl+huoCekT+CtG6CKSlWdd65L34ZuhKHdaN9IebR0/OOluRS?=
 =?us-ascii?Q?xMXEBrau1Ec0H36EAO4tPSIsQfpOqoI3aGmHtTWQZdFzCIWpx1Gd5/60Pavh?=
 =?us-ascii?Q?TXLCXp120sfAmxDVtUYl7csPQGIktrGmEpOd5x1Gp0+xImWBHwSx1AJst7kP?=
 =?us-ascii?Q?xn6W8QB+nV5X6oKcrHHUWojaV70MyCA22mlWYwbr6faH+zhFG0XSmqsAbgN8?=
 =?us-ascii?Q?DP7CWHQJW4pFtEIlRJYZeDMtlRMsbBMNlFaWNZf9JPI8/QUVmuUJohuKm1/F?=
 =?us-ascii?Q?4mwoS5LLVLhHee0s76pTFFjlKb5nZO+/MC249AbVoZG1tlbaWFTBbWwqLBS2?=
 =?us-ascii?Q?qvDnhzZiCsPsiazzE8mGwaKlJ3BQBIrYU0WXi75PL6ORvVrMoHaGJYXYV++A?=
 =?us-ascii?Q?CYH0q436RY18ED1T1uKhEOY1lRzpSygT1GGKVU9zqOIhJAw1jF1G1lqB90PQ?=
 =?us-ascii?Q?KZTA4akGQvUCdz6Th9w9fIa8MbCvAJ7Xfxp+Mgwzjnz4LZPuRHindBo4t2Aq?=
 =?us-ascii?Q?UllFlw6F6dORviCt3ZKPevd8dnqZk9w2IiQ/2TcFaiEKijITbMH4egVSPSjH?=
 =?us-ascii?Q?UTCvDlriHA8kme7Ee1bKtIJQyBZTH5Xr3lAFrEBBkllWDrKLbtyMQDRO1F5+?=
 =?us-ascii?Q?ZXHcv/ruCvyqcPY/p4CkAI4kW/XWkVe/qVqrR9ve8Jhy3pGC6fyiNMEbIAOy?=
 =?us-ascii?Q?Hb7cYWi2/nu3u0/66/HRp1kjwfiowYEHxxh/IABc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef282436-aa1a-4a8a-e5db-08dc01dc23cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 04:20:18.4685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8NkLLH46pVq/Dn3ER009aLd1h6zp/RLCQQuiv5i3W1ZaxmYDnIxVNFUjezE3GFV5oZaUN7eESYKn+Toh0osdZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8284
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 04:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192824

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0_M1.r=
c3. We are planning to execute following tests for this cycle:
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
ETA for completion next Wednesday, 27 December.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, December 18, 2023 10:43 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0_M1.rc3)
>=20
>=20
>     A build flagged for QA (yocto-5.0_M1.rc3) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0_M1.rc3
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6345
>=20
>     Build hash information:
>=20
>     bitbake: 8295ac1b6672c25bee595cff6e000b2af817f904
> meta-agl: 266ac5373b4458d7fcb78b1e8948eb2b33f18b5d
> meta-arm: e6e7ac4d99f103d26a0ffefd6d0a5d2deef5b17c
> meta-aws: 7915e6bafd876ab3d654a26629dbf501479caae0
> meta-intel: 5cfefd9a8ff1f5a3534c1ba9d7d7f6971ed5d56f
> meta-mingw: e01d47d183945caeaf3c5c086539af0a925ddc32
> meta-openembedded: 0a0ea87b8dda01a2887a525cef78eb6c3f4c2c32
> meta-virtualization: caa14c63f158fdd13382ccf1ff4e20a8ba6ad667
> oecore: 6b729088dce302eb3a967cb6839f00488025be0e
> poky: 33112178d164ddd9ef0b1115c254ad4341ec3ad1
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
> View/Reply Online (#365): https://lists.yoctoproject.org/g/qa-build-
> notification/message/365
> Mute This Topic: https://lists.yoctoproject.org/mt/103243393/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


