Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4586FD74974
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 09:52:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13697.1766137924105857850
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 01:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=SH0obhdn;
 spf=pass (domain: intel.com, ip: 192.198.163.10, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766137924; x=1797673924;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=R3LK9AHCNXbHU6ZvDjTtqLS1uRouHiPgDF8C1hv4oCI=;
  b=SH0obhdnCSxLiJWblg5pj29qUfZR8BxNhPzsLGTDtdopb/eGlfvOliAy
   Ttmk0r+brsufdoHh+lQN9mfmEAnemMqPjwCSq/syGdC2Nq1G9oIZpFBbi
   51LMnGkv9XcM3b7Mz4r3vLtRMpT8axTLsfXATe40tBSAg4Hdkf2bSofIC
   lufsR9QvIDZkdguRznzEDk89o6cFDcw7o42V/qQzkLhwGOoeAl8pQAMc7
   NlOhjznRVpiluxKMILHmpCi7AXgbHiLN4fd7U7ZCKXOUZJKDApdsHIAOq
   OOgANllH+Sqjo9C6mhbsyq5cv3kA0InAXG0sw4azRgSv66QKgvAjrYWhg
   A==;
X-CSE-ConnectionGUID: 5hCee5iFTtuxIncBmFEe3A==
X-CSE-MsgGUID: /EhRQVwkR16AaazeWdvzMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79466574"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="79466574"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:52:04 -0800
X-CSE-ConnectionGUID: CdjEETNVS+S1uWJwUFuZag==
X-CSE-MsgGUID: XsOvcgCxTwueL9t3HFgN3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="198075769"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:52:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 01:52:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 01:52:03 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 01:52:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIQWcpcPJ2LBvgZW9Ja54sjE5BKlsIJxMMvjmdrf0CO0w6JoFSC7jJ4WNlKI5ocUAiodStRsHuBubIF3xWK1demIjMnqeBTpPx/TpNeH3x0Mgj43j/4/gLm7af/zRF1DcptSGPLVNZM8W8C7musoBbCMW56GgaRR2D3yutSQFRlqaxVY/Z4JBDjA22HMu9uB8amXIDyeI9W1/xHUHez07zxvEwwkmMmnIpNRbKtdAPFmqi9NeJGkuBZUeqL6LP+wtUb7usWuLvTBKPfYFfMHm2bD7d6COeZrb0+h5zks2WMNmxxS+dZGCf9A4C/tKBXHvZWvpFDMY36udOmVx+HUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oz0UBUxv1WIXPWm1+bNUamN/n36Ht8l3YgBntl0WuG4=;
 b=dAgw0tdj72ICWUroAIESMVmkyhX5qwO+JLwgmJDCLVZNcAktftwJfw2zOjClFTg5NqxmGQ5dU1Y4keM1kVuHgyS8M2KPO1X+Kioc3zAfG7mEkXE1nJmyWnpWRrV6hLt2wNuVTld+u9anRzrGtBdKa/XytVsCR730WbWZclBbus9uQKRQbkp5WUQu2yvfQgT6zFGW0/KWf8haNA+dM+BiLxx7Q5ozJf6TrYLo774n9rgc768/bIMHxb+w74e7uLadRjcLDsRD+CY5IX3SRLqQgceitwV0tDGtXVOrnHcsTAsvtV4kEuxLsmAGLHygvPR2Bo798v1JOD/oLnYya00vGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SA1PR11MB5802.namprd11.prod.outlook.com (2603:10b6:806:235::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 09:52:00 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 09:52:00 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: FW: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.32.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.32.rc1)
Thread-Index: AQHca6RFVzvPzlhffEaTUfPIfqbt87Uouoqw
Date: Fri, 19 Dec 2025 09:52:00 +0000
Message-ID: <SN7PR11MB70183FEFC7F5F03A6B3CBE82F4A9A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019b14356c46-c067d30b-d4f1-4c27-9264-0144cc80b869-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019b14356c46-c067d30b-d4f1-4c27-9264-0144cc80b869-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SA1PR11MB5802:EE_
x-ms-office365-filtering-correlation-id: b56fdc16-b7bf-458a-53e8-08de3ee44165
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700021|13003099007|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?9iixzw1wOW9AhJU7jPFmCnL2AXI0J+VbuIy2C1LoBp0krnt5lM4YgvOfWQN2?=
 =?us-ascii?Q?R17ga61E49UpXfz2JuPQDuwvq+1CeUBjwi0ejlyShBWDrFy1OyRf7+gwGNmX?=
 =?us-ascii?Q?GM2IgAC/JYzWSclyb/XDExD5MODNslsZ6U9IVKjxCkdky23SR0xcnqLYycuu?=
 =?us-ascii?Q?RquZkSTBHtCtKpBOg+9eWIpMwP3xNBg9VInUiSIYywR8qFL+oHAqNXF4cmOc?=
 =?us-ascii?Q?UhCsY/mnyn5lRU4K3Isy57RdTF3uOEXwnG0iOR9+62meS81iPUA4nRqAMqRT?=
 =?us-ascii?Q?Dxtjct0Gj0cNusxBhCqPGRcEXUULI4K7ExPBD3eU0rFdSFPX44UjbKr9V3jc?=
 =?us-ascii?Q?9rAnQE++AjTq7I8A9eiMexvTytwEh6TQoHp1CXD0bxm5J6O8LQC4gIkrq8kf?=
 =?us-ascii?Q?IxYWO9aLTmRrfSUTSLTcuB+cVokPD1qshst2rR1cxaNbNWn28qPuy8TggxZs?=
 =?us-ascii?Q?t4n2j3U3OPvrD6GRxZ5yGJhz6VP7ttjliuP9WWwtyXG06C3r8DyBKtAadSbl?=
 =?us-ascii?Q?4e2Xg8OmJib/BjC+pABNTypUSfZBV2m2QL+ORXgmui9OtR0KeWtH98k1uiZg?=
 =?us-ascii?Q?UxAHzJrHPCf+A2SjOs03vKqNv415oKaPAPW9g2A0UC0YbySanFvcgQeNsMvw?=
 =?us-ascii?Q?TpglzIN4gE0PuZZ+d9FyK6ug2nB+tbuZus4ssK31G+ngL620JWUDDqozt3fY?=
 =?us-ascii?Q?OBWwPjaXrBOt7dRww3qohgmN7Kz2rof+96FApBliBaJCahG5Zzw1TeO9iFU3?=
 =?us-ascii?Q?0dyM84WELTTnIPICtqTe3ZMKiPvy7Gyamq4A39Qj+/LGLL+c2b3WoKijK/8Y?=
 =?us-ascii?Q?hmZ58vJf5QtIhyRSqwSGsSRCFU949wCyhKOujYtEXTE6K/hPAduyLGPpLKi8?=
 =?us-ascii?Q?vvtMkw7xZS4NEuqJJINIXXf6Gfl1z8Wz9+75vLr40oIa0xENyaPgh6C/p3DW?=
 =?us-ascii?Q?xvV398OPVLNObm1HnqmQxD6Brl5HE9DQ2F8p3GZDXJg6ODvaUGlQCbH26MOV?=
 =?us-ascii?Q?r0mL7WzszxUH1r8bWwEskqunUp7G7ZlWrFJIziq1beAu8nsGqBZs931aiuzr?=
 =?us-ascii?Q?GHSkUt5dQkEopinNJa8xtefXkC3RN75pjZzaWBZ+q2NAs+JjK7ReyRwllal6?=
 =?us-ascii?Q?R74+l4NNfCQHXXnBbN1oP3S3wHvRaFMY2AcPW49ZaUFsY7dNgbucqKB5LzCw?=
 =?us-ascii?Q?v5+aKgbC9JHlVBhhGI0N1TpH0eCuknOupVfFCWtmf/l+cqyPSh1ZbKfqY0wu?=
 =?us-ascii?Q?2ujqxRbLiUGnXPyTU9HweNHdTdvtE7N/xF/2mYRQiyYuxZKOIgf3yicv+463?=
 =?us-ascii?Q?KcwJ5uXpIf/GFbg3MsZ0iD53F9u/K+PBG69p7kyYR3nIY9DWyo7JDF1iXGhH?=
 =?us-ascii?Q?e6mM/30nEsLp0mwmHBGKpoDebovC9ruwmhvG73D336kuPTvVpq+uQZK6cs5V?=
 =?us-ascii?Q?KvsXoN3AdNGZr73c42PF2m/9yD6l2/WP/IvA9b4Q2Ut5+VJjZ+TixA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700021)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?96D0BfxnBDErx4AvogK0HQTEBN4icPzdM4q8rY3yrJM35DzTPDCPi/uYBfii?=
 =?us-ascii?Q?835NgDNSy14pNAa1xX6vstjYofYnlLl4lHL9TBID3H4HosKpozSZCYt1tqfc?=
 =?us-ascii?Q?p+2Lw6Kg5BybkDv2bQYA3rns/mjqyRcnrUXgM2/UB3rY1lIhKL2gqx820W9G?=
 =?us-ascii?Q?fg/rb0cChzCW5uSiEMfUMsfeGPqleLB+dsezQ5c9I7Otdb3bAmlzuv+s8kVC?=
 =?us-ascii?Q?9Y/lxf9AtKlLBYqiAi6oKGqw+c+iDv2va0pnQfmvvCCJiV/llrmo1Oqcz7sA?=
 =?us-ascii?Q?G/Za9h85/aU7i24hqiRac5CBQTdNX75fNZo3db1W9G11RLYE+a3Q0Wf/zQUX?=
 =?us-ascii?Q?1aqft7zVqmXWNETn4rpholABIZTps0TD5iTw4EkmucJjU4ivLZdNlCGMi/oY?=
 =?us-ascii?Q?tIZ7E2ZAQZ8RigE5d9InoNjCZdAtPHybKReMl4AtMGh883IMsrJH7I6pdIyX?=
 =?us-ascii?Q?kuMVS6w8o4kxqk4upe+PQhy27UrVk4eDtudiWubjA3jaiCLs5HoK385MeJhI?=
 =?us-ascii?Q?eNLYOcX6VEcTcBqpx6GCLhVXx/kKWrnMWIbH0Ayt5fXOveApAs+3EqAyW5S6?=
 =?us-ascii?Q?NpsMGaOpSU4QnnFAPcnP9pl+LGkpl2/A1T0a5N8Utrd2jNswFlWxwnDf7gkl?=
 =?us-ascii?Q?y0tAgPb+c/aQdI4k8r071T9udvhvBY2ZXSZWlNTxWb/tcxETRFW/3xa1w3fp?=
 =?us-ascii?Q?TMqTIAyuCSUhm24bL1P42WITInxHey36u7YibIn8P8bA7JKD2XetFzmuFXap?=
 =?us-ascii?Q?HgXnVP0Mhi98aaakL+2CCAUfGQD6Nf3E+/oiHFDxS++7kHkn14+u3WZ4uuU2?=
 =?us-ascii?Q?5P8SJk5oaInvjVP8JIr39EFbVu47BiRDzTRSYchfWFVyMFkQ6nH1hr8HzNe+?=
 =?us-ascii?Q?vztWciyngeGdOVNTPTTQ6J7q+BP+ZgoP4l+46/8WYSpH+zqzPluGs2TD99tl?=
 =?us-ascii?Q?0/pKcVcx75rh6TvOFZppmlil0SuJSZjv5TW0bweCDNmsgJy7xeRMMV/NJqst?=
 =?us-ascii?Q?/UA2X3e8NjN5PLYPX/8xIjthWRKp+FGUN7QjivXvdsfLZPyPyzGEWocHuYHk?=
 =?us-ascii?Q?tLA83ciGAIMV+x2IDQhoOVUAylOWXYuGC1WULZN9yd3TJ/xFqehSrGfp8a2n?=
 =?us-ascii?Q?IW9k4uyW8I03iVqKEyqU0Iz93rVoIJ1hYf92CmWQ6eWylWn30xx4QCBx+Rr8?=
 =?us-ascii?Q?1orgEWBEZW+X6cgKkScfQ5ORCiEOLvYQiY+VY1BetCt173Z8UWJspc+duBqC?=
 =?us-ascii?Q?RWrn7fT5D3Ka9aYYgun9f2vKNwl7JY+tVflwOgR3TciAmX78cBUB8+Kv2PgW?=
 =?us-ascii?Q?PdJ6hNT0fnm5lhgU0u29SdR0SFtLpbSj8TE6eGJS8YZgA99vtEL5fBVH66fj?=
 =?us-ascii?Q?zEUQF/jJTs5Xku5AGsk2ANA0nRiToR71yG4E3yEi2U8Tc3zKMjc5eBXolGYV?=
 =?us-ascii?Q?goAskuLDwrPTsf8u1B5sgexVKfUhmBWWcKrNTPiIvjOD+O6EEHUPK0wl/hgG?=
 =?us-ascii?Q?JkArc1CM7EP8CQQq9sra1WoWhS7JcQW7GIOcpS0AWmS9BKIJ9ar8JXzealKO?=
 =?us-ascii?Q?ydDb0A6XoDnixAH7eeQ68KncMJTAJ+C37tbnW96Y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56fdc16-b7bf-458a-53e8-08de3ee44165
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 09:52:00.3506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9MqqnkmCbXR4+8PiK8oUxjd+APRnNdZ8xUZo5jQ8O+hz/TbrcAJRX0nLepA6+qFEEp9vmfI9/3hAE8b/rLGYUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5802
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228205

Hi All,


QA for yocto-4.0.32.rc1 is completed. This is the full report for this rele=
ase:=20

https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D

This is the full report for yocto-4.0.32.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

No high milestone defects.
No new issue found.

Thanks,
Debal Ghosh


-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 13 December 2025 01:47
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-4.0.32.rc1)


A build flagged for QA (yocto-4.0.32.rc1) was completed on the autobuilder =
and is available at:


    https://valkyrie.yocto.io/pub/releases/yocto-4.0.32.rc1


Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/2852

Build hash information:=20

bitbake: 8e2d1f8de055549b2101614d85454fcd1d0f94b2
meta-agl: 3dc8b04c14305720cf7e92bbb9e541e03403764c
meta-arm: c3e9fb12aa31d25e33d8392c4a233ed1275a3278
meta-aws: e27c0573a292038f33f8d1fca05f02257ab1011d
meta-clang: 26de1c560ef3caf3cf641cd54ed0b7cbdc219ed9
meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
meta-intel: 82eb2406e04a89d6ed0650a99ba13224e43e4f0d
meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
meta-openembedded: 97d4be2839754dadfc326c21948472c2fc2985ce
meta-virtualization: c474ae21b11a816be607eb7b44d2cf77d1125bce
meta-yocto: 77b40877c179ea3ce5c37c7ba1831e9c0e289266
oecore: 2ed3f8b938579dbbb804e04c45a968cc57761db7
poky: 2c05660b21c7cc1082aeac8b75d8a2d82e249f63
yocto-docs: 4b9df539fa06fb19ed8b51ef2d46e5c56779de81



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


=20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#632): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/632
Mute This Topic: https://lists.yoctoproject.org/mt/116752728/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



