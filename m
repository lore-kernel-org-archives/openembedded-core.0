Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33B1C64E7B
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.35374.1650247768860295417
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 19:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=KyeVblCk;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650247768; x=1681783768;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=q7REGWb+XKDRZvfSd8Q+ljvXOHfSCbKSWpxibbnBGUY=;
  b=KyeVblCk+qe1sNPZAEQ8NaTps/QFgWtu0xbzsR08X1gio9JLWmKlUqvc
   Ci4h/kJSWna26uhazTr0Hlu0fN+DOjooGPbzIDBvhjYdVrY+AEBEZJjvz
   d59MVp5Bj4KEGFldIZOWH7NgyY36xYlCVHVPNmkiDEypLU9WySrrU9HtC
   F7/OFeGHl9PiPFR/mkIJ9alID6rBhKK4VXBSUmWH+Lt9aVjmz1S0srRBH
   sp4PRkqZnIPAY50MTzFgD3FXwykQx1UxoZKmL8gI6uYENih8XlHvD6Jw9
   6+7QFbt9he+GhcmXmaRSZw3lF9YvspWaUj1tknqrGlJysf85Tqm0/81xg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="243366698"
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400";
   d="scan'208";a="243366698"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 19:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400";
   d="scan'208";a="575371065"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP; 17 Apr 2022 19:09:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Apr 2022 19:09:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 17 Apr 2022 19:09:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 17 Apr 2022 19:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fyh3PRyY+Egm5TG+Anjpcq6RjeKaLlmW882acxv1YeBN/ci53H6CWeAmGq59SZCn679pK7ILsDY6TrpIQ86XfR6P1IThfrsyC1Ttf4wJHXIKEc6H+dmrfCo8GxrkXU/zzUZ405cCcyRJyJHDFJq+Hz4PYQ9fBRDXYXTg5lRgTo1l4eIe/uG13f2VHRKoJ982Om39mgTwl7lj1Bcr5D5uaZt8FDu4g9/026R697FLmagj7EAQQJxpc+5pHO5VCoj7bUQbZupG1efWWIrqS2YQNBHTU1t3HOgFAlo2s+WUL6cUjvUxxS1bQzWHEmhg9wu88XiYftzsaXOHp7IyGyW5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SBQubj/v2s8E5vxNkUdI7sN4KojbitsaE7Mkn36nXo=;
 b=e9gA56V5cSSC6ipPKbkMNQ/pydkOiHS8TX6BmHtQYFG3gQ2XRphxI1JA+uu8ndH9jereU596grtMbuG5ebihanRAXNTtn2NMrKaznQmVNyjYcBjpbcHvFN7buCmGD+DqC/f3NZgvjeh4lK0FtF3PkEVkH19d2avfAMOiq8uqOBh+mZa0CrSYQ1HHpyzto6QAtAWvMOIobAaRk13Modi0zemBpc8n3ey7cjBVVAIniLx7aF3bTjNoFUBeglnweKLHYH0KM00hiekkduuVY1ZejvwA6rErT0/r0/C3h7kXPegquG1Pi61OxNhjTMXmaZAADFXBw2n4hkHQMqrE0VzfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 02:09:20 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc%5]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 02:09:20 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.rc3)
Thread-Index: AQHYUclFgW6X5ySo/EioJIz5O95076z07sNQ
Date: Mon, 18 Apr 2022 02:09:20 +0000
Message-ID: 
 <DM5PR1101MB2348C93062E268F76A0359DEBBF39@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101018033e03d81-4a7aff5a-1959-46d0-ae3a-e832d5bcf151-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018033e03d81-4a7aff5a-1959-46d0-ae3a-e832d5bcf151-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 023492f3-d383-4681-eac8-08da20e0732b
x-ms-traffictypediagnostic: SJ0PR11MB4894:EE_
x-microsoft-antispam-prvs: 
 <SJ0PR11MB4894A6C8BF98E19E70E303CCBBF39@SJ0PR11MB4894.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1He84B5CndlLcIU8Kk4+HG+XcEvSDgScCnoDDufSfneDBtHHv/C597CrXqofTfpCka2at0Z1+UUXpFgTr/dIfw3SAfDCVAN+u/A7PQzXiez/Q8oCM4TOagWf2pRo9FU6IGhkAcO19mH5BDvJKVOeRzgsouXWUd3EVPV42RKlvOpjDqzEd0jA6KACVfPazjGnpjXGKY2cM6mZWlzhNkB2FEtTOtQ0AR2ZuXebYGFXy2bOSK454/7ISVhpO3o/DSQ3dFkp9vMr1mG1hhxZ3PmtON+4Q5hRk9DM9JxZyHHRbbE0c8sZI7rPZXp5RQeMCcbme/QE0PBhtsP8TGnpDepRLyFxARVRENY/qtk48GtcIz1CWDljvJ1HBZYEp5cVt0PSwQG6aqxdqkNSV2eLr8UO53amDMoWzOqP7THQ8vatvYlGARhpetMcJcex5R9ZCXAtxl4Hy8YAWwXHC+FoAdP3tCQA7T05CdXb7zczh2AekAdbgG9VSWB6TsLEtEKwh++A6a+eI9k+C8OHZ0ZvRPDOOA88NLpxU/hARj08/FtiKK7OTrDjZjwXlWITJ5BQr6EUGR7dSo1cpgwb//UlSarLFO1jkoFv8DsbNeVO0K3AoBgdzD2jvclwgHLinKpzh5+DDRf00anyUFO8CqZL28EiL16wvwvzZ46r6ZJkCqATPv5HwgL3kHDX/E1pznf9J3F7gfyE2Ygu8AHEAFWus1RpMOoRM3unWXtKcerTatbjyDKjuLsLVJFMhxfEkIEQbvtqdfJbwLsU4ZFX9aWluMSq5uUzDOnAjt5rZoPUYDb84A8WvLgEn0aTjdwO4Il+/Reooun2piNfGp7Jb89l2hXVdw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(7696005)(15650500001)(33656002)(2906002)(71200400001)(9686003)(6506007)(55016003)(76116006)(53546011)(83380400001)(8676002)(66476007)(966005)(508600001)(66446008)(66556008)(66946007)(64756008)(316002)(110136005)(86362001)(38070700005)(5660300002)(82960400001)(122000001)(8936002)(52536014)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?afw+4ExN7NL5QgkAVxfgrRWx3IQgNIxUdliTrsCtsrAIM/UQ0FeYg8mty1iR?=
 =?us-ascii?Q?Nyne9XzzFlNBGptR72jOJdoTFehs8CFmPYk6qobayqjzyMHYjXCo8LPY+63t?=
 =?us-ascii?Q?5LIZQgSqooHN8dsIWhF28HAn2oKV15wldMiL5cptpGokZH8rGvarPNM2BQX3?=
 =?us-ascii?Q?BReXQhUFETCjVA+J5Gm4tzw++HNjDd5R+jQoFapVzxPLBDJzL99lj+CiWygq?=
 =?us-ascii?Q?JzSb0M/gX1LxPJRQ8J6YOen3GAsrAOaknh/IkVRkbFLz5u8PIft+Shf3JgYf?=
 =?us-ascii?Q?1aqXdo5PtlSpV2dfID7wDtZxJAn95XwqZRrDJ+3vYEf2r0FeRcUw86RMex76?=
 =?us-ascii?Q?OubVNZY4p1/PuifTCz3xLJXFb+5C/Lv9DL1n8vdD0hCSrX8jLLs8sHb7eO7V?=
 =?us-ascii?Q?Ubp1CTKfqq/FQo5dDULIBA2HUZlGsjhgraB2bkvgxsj/xgqKeQgt5UEIZQJP?=
 =?us-ascii?Q?q/hRTOpp5TdGngeBdTunVw8E+pkvv0I4xH/EuEZOEjDSRpdRP0zF8wXYeDMi?=
 =?us-ascii?Q?3Ek28G3D0k14JY+gw3NuAKKKUsRtq2OrKFbaCyVGEmhQjrU/0yoQsI8+1+iS?=
 =?us-ascii?Q?Zn0jVQBX/8tfqKgdU5iBZODWmt5GGkDSuQDPYNHElmqAy8WnOhUsR2tjex57?=
 =?us-ascii?Q?CV2/s6sRAwWCg++VCf4qiH+duOUF04ET1kaS4YsbezzpVyGT0oCoZOpuVnVh?=
 =?us-ascii?Q?v604xhLTha14046HFt8YD3+6pXd863GbJUJUX2j589xse3X8IRH1SlDYFAha?=
 =?us-ascii?Q?MIHkWl2lyAnUysAvMmzEMXDpTPrtP7KZW7pucsC2gPgpuDRL6Cdzyd/aRIbU?=
 =?us-ascii?Q?WbpkhDyFJt3pd2VmIq4pDTpdhnUt3jG6qvqu+tOWrWFr5AoKkx0cLA7nx++B?=
 =?us-ascii?Q?UU8vYiJ+ivdCjWq2ug3upD0OcF7FGPlZxmpCG7HNt7cyohU0LvC3y+fc3lIZ?=
 =?us-ascii?Q?H6kiEn2RL7HU2BScYD0gzEiPWAmZ0erxhM1SA+qya55IACopWTaCOkERTk4e?=
 =?us-ascii?Q?uKu5c/EJ9ebmK5SbKVWuziAcjIMuVGWQCqK4K/VNJCXEpPhlE+He3QVnPtiF?=
 =?us-ascii?Q?0XzARPgp7FT7ZRAPDEoGCE+5RNPYkeenvV+CctmiCShwvthLlq+YTyZdYWrK?=
 =?us-ascii?Q?YjA7pRDAZDKGfQrtR5ajK83UKbxr9b+3RTez7QLeukWxgqZOBR0dCpmVLFwX?=
 =?us-ascii?Q?RA0ZbR9tKqbVHR5Nj5mkKQAcq4ew6ydDoR9EB6DSbBkddgxy+XPFyBcpwDQh?=
 =?us-ascii?Q?xFaewgBbkV6eUmh1WQHcHCgN2+FY2KDs0+Nwc05FgOr6CQHIBjP6RaSRaao7?=
 =?us-ascii?Q?j4+KxWgEpdAMbOUFBE9/PQt7UCce8oFkPMUleYL7/0eoyYsEUtHtOC5YWu37?=
 =?us-ascii?Q?9XU2cHr5XCjPcmMUIucBM9lKh5eZ0dHcfpl3w8SbXX7RqE7EWTeaYjcdWemY?=
 =?us-ascii?Q?kYrzzWtazLjOLrXyfDeE+G+VCagBR/4HXgUwon/SOMAJqFXWNRTp/VzmtbIg?=
 =?us-ascii?Q?jwwA5iN/gLYCYh80NriIU9hiZDGUJyhbfGC/5hrxGcd2/U+gkX9Pt2g04jmY?=
 =?us-ascii?Q?4yDNr6UFZHIL1IIRr87wtPn8dH2Jzpzy5NWEK3OJHgZ18+B988V/Ym5mMLJ8?=
 =?us-ascii?Q?qhylA7H1VtVP4ZTmyTJvlNqElE50j8ibBRoZ/cBBpO9/B7wDDE0y5tUK0NTA?=
 =?us-ascii?Q?ctxy31nOkuIJKFL5Fej0UpXnKNAsmIJ1ID9t6D2i/XVvHf52avBoeWQpGIKB?=
 =?us-ascii?Q?73k3wiNc7fg3j4U9C/6YpkmWKa3U2uD2hCydfd2SCBMAwTwBzBgFazdbOeXN?=
x-ms-exchange-antispam-messagedata-1: BAtgpPFGdPwhxQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 023492f3-d383-4681-eac8-08da20e0732b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 02:09:20.0711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 R8RKO91B7K5Tv1ardSJM2+p1T8IuTJupsHF4LrMBZeHgDlEXxW0tnAjKQkBzefaQs6fL5tnsXCN3HsF7ppr3rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164580

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.rc3.=
 We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone

ETA for completion this Thursday, April 21.

Thanks,
Jay

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Sunday, 17 April, 2022 3:36 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.rc3)
>=20
>=20
> A build flagged for QA (yocto-4.0.rc3) was completed on the autobuilder a=
nd
> is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.rc3
>=20
>=20
> Build hash information:
>=20
> bitbake: c212b0f3b542efa19f15782421196b7f4b64b0b9
> meta-agl: ca53308f8803fb50709b3f17bb1f9e476366bb62
> meta-arm: 3ee7d019898854f776f95ed31f4b7ea8c8a73dfe
> meta-aws: da48f9e0fb5444ee8d3112ee00f5937a3fd9f96a
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 5e2b4c4ad933556c96722ab0c5f2f3f5eb93b692
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 8e1986e95ad30a31c8eaa3cfe2e045b335ef7555
> oecore: 92fcb6570bddd0c5717d8cfdf38ecf3e44942b0f
> poky: 00cfdde791a0176c134f31e5a09eff725e75b905
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
> View/Reply Online (#126): https://lists.yoctoproject.org/g/qa-build-
> notification/message/126
> Mute This Topic: https://lists.yoctoproject.org/mt/90511584/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


