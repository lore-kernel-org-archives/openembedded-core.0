Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A726CCF9E0
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 06:56:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web11.14418.1761202580659108896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 23:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=F3vgcd/6;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761202580; x=1792738580;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6bid4C59wy+JI+QJJKdB9ss0zVUt4TVfr58BXkMACBo=;
  b=F3vgcd/6p/6SO36hkEdE5HnpUFbqvnr7bAIDDPiGxIzU10hs1ZN7WSIi
   ib3KzuOER+08hWB5KPUHo8F2pjiVPcZzkQI4tulxNtMRVWOIYjmuevv7V
   6yCqK3GVHn1FQMgnm9St8LN/ecne4Taww0Nf3WWHRO1130Eny2cQUGCQs
   s3O49mkeCNKP6GC5MBfhMfuMGxWMl2Vxiykmu4JLXtG2YqSN+kcWG+Qi8
   WE9aZYdMD49WeU7B3zu41dVjNcOgcEr8ZDvecS/WCz/bF2dgk6H41qN9V
   nuEz6C5xhZEXZIXbpH5EokA0KJnlSquD0Zzvn3VPXhnP1YgzIBt5UlxNk
   g==;
X-CSE-ConnectionGUID: 0mBNOAR2SDmKHAQof1GIMA==
X-CSE-MsgGUID: CoNFqBz7Rk2ENVYeq6Z3cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67007332"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="67007332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:56:20 -0700
X-CSE-ConnectionGUID: iVXHhieKS4eDBhUuiXi81g==
X-CSE-MsgGUID: 4yF2TjukRdqD0zhlTJdwhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="214730592"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:56:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:56:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 23:56:19 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:56:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9X0PyvCPYD8UXL46EewAF/KpEtJbDV6hr3KsMXGtYnN9cI3ugkJnXaQv+mm3EzwhG/XdITqJd3H8qOPpbe4yQPFgdrPj5xVGwHUfFlTtoqRVSqWXuTKt2WOe+OC83UJ6xEIG3UpT4y1fMSKABLL2XrJ3W+tYiZKRobx/zsJ1IlzSnYSpkxlivM5pkpxOAzo9ki4Xl05LcsMxBxPsXXsOVOXDJDtmmv3gPhnm2lrAhALhKYFAXH5mFhPAKaqiiFr1aBLQxURgVolkbLLfg8Q9RZ20WMtDawlIQ8+6GNmxh637M8/5oHfBM+V9LtqPcKl/xn7fFyo1r95C9PwwsYXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EukZYzrCTcsAh+/LRsmnvo4sYGIgqRcgJZp2cJvVR8E=;
 b=LNWUaPocOsHBxsfeI6EI+9MkBFjXOWvsZvVQ49aOqo8r7RehywPc59vXdNpZkdhZTIudBJjUO6YG27eCp/efj5Vohi0XXy0unazOY41Wx6PF7KiwbDDHwUm2+QC4EeORBXhEIQtenWEtyX/NHkQC12Y1PSVbUYNPGF/kXejuwSNFOTtTAFalXplH26n+CZ9xw+ePza6SyyyMO548ZpiaX+a73jSNamyifjE6mKlFaMmFwcnn9Lb8Ti0aZ+dbCHxTHF00LmcurcFMbfFkFd9bFZFjjLZOGl+kh1qP/jy2Wwfdjf6gfrVSAl9A5mkkWf+RTfIxcf4p+I1BHGz8f35K4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by IA4PR11MB9232.namprd11.prod.outlook.com (2603:10b6:208:56e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 06:56:17 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:56:16 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: FW: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.13.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.13.rc2)
Thread-Index: AQHcPM58JOP4r6PwKUCH6YMZakUUa7TPV1Tw
Date: Thu, 23 Oct 2025 06:56:16 +0000
Message-ID: <SN7PR11MB7018B73E79B75F13244B5E0CF4F0A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <01010199e1452afe-32ecec07-e05c-46e5-adfb-fd30263242f7-000000@us-west-2.amazonses.com>
In-Reply-To: <01010199e1452afe-32ecec07-e05c-46e5-adfb-fd30263242f7-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|IA4PR11MB9232:EE_
x-ms-office365-filtering-correlation-id: 2ea8ccc3-7dc4-40b1-fc8e-08de12014346
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|7053199007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?XsvhXWfHwuGAH81UoXhaE/Gy5iElYKWthm+96Z7gqidDaT6Pj/593GWLHb+V?=
 =?us-ascii?Q?hPDAiPzSjwokr1MSR7uuehg4orylfLwijL7P/rXKWkegWFvK8jcXO911p/8a?=
 =?us-ascii?Q?aQ0RUFJD94xg82V9WkZ3wbmsaxK0TNRaVSh8qnppQKRJB+uqiLPiH8ThWaG/?=
 =?us-ascii?Q?wU4Yf8i1ObQWTFubfnYuA6eNipcTcrsBfVDRuJ8Oaw5STtuJPK3+V50EpSrG?=
 =?us-ascii?Q?9j1/3wF2cXp+tkUwE/HNXjCW0UovMKvYYNXKboYpzwWfWrG1OIBbLdk9Ywfs?=
 =?us-ascii?Q?yyr79ZLfay+d3QcMdWQTixzLkcVOhwN2fykzFIAh3o0OPy8086E1gU1ld1rr?=
 =?us-ascii?Q?7HaaDKIv/2f+qdU8fP2oNcHg975ECpww+3zvg4fTa7pzqEtbF/N9omkdqn+N?=
 =?us-ascii?Q?vVt8daPpSCAZ7FEXX8UvWFPT6MczF+yJMwNklFY7GggT40V+p7yCLObhxjW/?=
 =?us-ascii?Q?3lX3MKnMbk1EkazpEXppQIOuIFmEgNFLwIYbCat3q+b4XT4dD9dfUBcmXCxH?=
 =?us-ascii?Q?ZFcgmBj/BlgzlPkFjQl7kVbh34DLrzS/KOeMpwvdryuBBrxGsIWcTRHs7aok?=
 =?us-ascii?Q?onk4IEMvVcDG4+7sByDpdZ8GtW4v7utmDzXAgz2PkuCz9lge8Ntn7bHWl0+w?=
 =?us-ascii?Q?49jDo2uW8YaNdb835L6R6+k1nehh2eVE+/gI0k2QFUMIzk4xvlv/BCXfxkaJ?=
 =?us-ascii?Q?J3mnanmACXuF+gyM839GwqcsRq3cV3XjWerQ7mvuMksVy3SOk7bEYIxHjTrB?=
 =?us-ascii?Q?dy4Obws36oVW7V+1utWaXrGj/Ywdq6pGHQOK8aLkL9R0PMQ8A8VaYfe8kBEX?=
 =?us-ascii?Q?PSjVsOowGJaj2DPTPuk9K9G6qNaC1LFsBDf0bExmGBh0Ou66NAi0l8CkyuIj?=
 =?us-ascii?Q?rfQRq3SJNrFvsurlin9TTB0EBOzWVCxJjMwirW17f5Fe1rp+A9HNADYtWQF4?=
 =?us-ascii?Q?V+ZQoJxbIiplWX3t3lYGPVqSSjdbvQtKdHiEbJjZnS+WZVBEhaiIFcGCqjSJ?=
 =?us-ascii?Q?FntJnt1vFrz5vA9yyeEXzypA7V7b5kMBi1DnnGeG8VeN1Hf70UqUKqxoReiu?=
 =?us-ascii?Q?4JdmzsmA+lKN4BZOHCiYrlVov8HFEosNpMEjaDCU2STZRTm4RdAZBT08zEot?=
 =?us-ascii?Q?puvFp0k2mr5RG9a+VpT62MSYnndBLpu1WLPgILulPXpnSpcPK1AJyqMXDuPV?=
 =?us-ascii?Q?M9ZepHNk9Qv1sEpjb4GRYTB+yJZaQuSaVFcajj3Dn0ysl9Sq5f95QrvyuDup?=
 =?us-ascii?Q?Remct3RW74ZwJTNF+pAbKPJALdDoPdzG/h1xFgZneEKIsI8jTGvCahRb6QHH?=
 =?us-ascii?Q?qNdA3BFRekBrIPw6m97rsOXg5H8ZAeJfu9RAB/Rp/aNe0egMixa6qAmZQxSU?=
 =?us-ascii?Q?nyt//cQe2fYlyd4yoObvS9K8qiip/SoYpjT56dDypx3L+be4giSnlqAOLdnQ?=
 =?us-ascii?Q?vVGKpAMPbwD+iiKxFA3oqAT2tBg5U0KrxjzTqzTCEVGkoAj0BgVNjA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Rk5fF6dXkRweadar7woLpKKRyeloKMuYiJP6dyXvgp/pTollO+Hc+ZeNL7NW?=
 =?us-ascii?Q?ymrsNKlMaXDu7Z8gTmmvLHKlzYDMajPYOqmrPSdmzqyE9P7CXiaEPX7PlMRU?=
 =?us-ascii?Q?uO75whH5NG9fbNKBUO9pe7DSGrXgBotGydRTcRJtmKVlE4u7v8Grqc7tFqkK?=
 =?us-ascii?Q?+2RLPReG+J/2zzjT2EX4+t0scGiOeR6aGvlBiPziKOLg1wzB7Gk8LNowk+5S?=
 =?us-ascii?Q?pobVWvAIPeIx03S9PC10SWd2MfrBf8UEomUyc3gzJTdW47QDNkXeAepHcvsK?=
 =?us-ascii?Q?tPeFV4x1uF3KDgW3TgPmXiEhQzMyEPfFyUOksJV8KNBtYV96F9YYtcx1w4xT?=
 =?us-ascii?Q?cG+TXtpRy1zX2ajzd0aUlZNocpwgEGLKL9ex5vs1Czaj60O76J3wcH3Nh/nX?=
 =?us-ascii?Q?m8omluPw29MkItUHlVZIBYBqcDH9iqHHodZvtGPUWJvGpXO94pmGq5C9l4VK?=
 =?us-ascii?Q?uatM0sbewyADcgbpR07vrHJ4XDpRyoRV8NDPsC/T6zbBmgIDfxB+VJ40/Tdb?=
 =?us-ascii?Q?xUAia33Q9OIwbMmFJZesACWKcouXVksbWOWFCkj2rFdPHMMsj7OaiGki4s+l?=
 =?us-ascii?Q?BRjmrWjw8KR8tP5/O9ZSOoO/DjP9rmQbBupRssfojO20jJ1S9f023xjiMqha?=
 =?us-ascii?Q?FAVVJMyDo0E3aT/YXL0cnw/XZDW9ghRubbpQacjw8JDwWzFHaie/Zu6FqgXx?=
 =?us-ascii?Q?VpP1dEquSmUVc/mmNsxIeAOic2u0469PQmIdGg3t1X5AOtDc6Dr1yGqPk3Gc?=
 =?us-ascii?Q?eqf/73HkUbS0Rz7YVGPv52QiFfYxGw3hQ2VqSiWQIsehlvnqJ9x5SqfVOypg?=
 =?us-ascii?Q?UHkNXVs1D5Mt4dF5Eel1ALogmPVIVu5kWcAE4IStHbvpfKNUPf/PUHsnVFvZ?=
 =?us-ascii?Q?2z1vsivoRjPneq/Qd2whN4svpjKPIJjoO4yr5+VE/uRSXu08cAvpmP3zyndc?=
 =?us-ascii?Q?K5piinWczOcTaU5Px93cKJuhXLWlfahC20VZ4ygifJyYWaoarLLwt7mmLw8s?=
 =?us-ascii?Q?6JfprJ/ZJMTT3pbc1X1qC0KW20khdMlcwJrH8sK2462x+WxSY5trWF6rwV7e?=
 =?us-ascii?Q?9o1qrbXzvOVtpwnIrC/quy2CFU6gwDYrO34cfsfo9eQZI0yG0W7bh/crXHEO?=
 =?us-ascii?Q?kftMphflex0zQgu4H5Uf7eODgKIaz6PfLIIhmM4pOiQYq4U+w+JnC4+gSNQo?=
 =?us-ascii?Q?3GQcRSden3TVUNUksuWeBXYaD0j3Mz7gp7Za1nwmi7zoLvE+D3RWt9pj6Q5Y?=
 =?us-ascii?Q?GhqKPT8EGY74O8SRO26kmP0x9XBXiegHdD0lvuf1BJGOJNaUgpEzxJPQ/UDk?=
 =?us-ascii?Q?e1mdx7Yq+f4LQTJSSYefaS5mbTlHri8mkcMG2otKH+ruupJkLTPZYhJODFV8?=
 =?us-ascii?Q?CgQ2W5VHCa68f7iuj6NjE/PHrM58cba8TWr11jFSH5yG3DK33swRmvp6HANV?=
 =?us-ascii?Q?RyegP5EN/VTXQ8SuNcTsi3BgELjY7CAfjj8mmGBIZbfG/owaW6HFj9P22yRm?=
 =?us-ascii?Q?4G7H6pQB9RT83Lr3c2S7WtY3KeVAf1bpYv3HT+UG56Apz3rsgMqJ02S6auLi?=
 =?us-ascii?Q?RfZA+kvpJTR21AjE61F+gnm3uErDsQ+KM9VHsb2y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea8ccc3-7dc4-40b1-fc8e-08de12014346
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 06:56:16.5666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 686lsQ98r8M4tGhnaziMthE4hnRE3MxwKiqBZo30AQ4UlGzQSyW9zKTOs1vWhzKkt2pjvVvvYS1HaJ2tjFlN+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9232
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 06:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225217

Hi All,

QA for yocto-5.0.13.rc2 is completed. This is the full report for this rele=
ase:=20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults


=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.



Thanks,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 14 October 2025 11:21
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.13.rc2)


    A build flagged for QA (yocto-5.0.13.rc2) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.13.rc2


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/2579

    Build hash information:=20

    bitbake: 1c9ec1ffde75809de34c10d3ec2b40d84d258cb4
meta-agl: 07a44280ecb27c3cc794a79cd46c53caf7da925d
meta-arm: 0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46
meta-aws: 446379f6892ce2145e68d9b95dbc7a208e9558d2
meta-clang: 731488911f55ebfe746068512b426351192f82f2
meta-intel: 6fc37057c7f0293a2345e303588901889df8b937
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: e621da947048842109db1b4fd3917a02e0501aa2
meta-virtualization: af1db2042caf8021d767dce1b26c08b59b96f3d1
meta-yocto: 3ff7ca786732390cd56ae92ff4a43aba46a1bf2e
oecore: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b
poky: f16cffd030d21d12dd57bb95cfc310bda41f8a1f
yocto-docs: 6f086fd3d9dbbb0c80f6c3e89b8df4fed422e79a


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#606): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/606
Mute This Topic: https://lists.yoctoproject.org/mt/115748439/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



