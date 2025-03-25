Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DDBC3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:18:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.61687.1742894279359042741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bZhnllSP;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742894279; x=1774430279;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=pwPnJ24hPolVVvebRnLU9/Cku0CDCAkegxDLgxTp9pE=;
  b=bZhnllSPe5ILaztwkZ/5vjZ2UvEfbcFkrv7l1W80gfuve2ulf1bZfODC
   WmbTaPt8A24MjN5/0wuP1p30/LQXj0T8XvBfymJ4qBsfcQNUTWp+gPwta
   D0CAEK+tM2M4aIDunoSVx72WcXgZKFDfQ7CcUCLZDs+vMfIkz2gg+x5eZ
   h/QhaJTV+Ie7Tcd86CaWAD/WKE0A4yBeWGqDVJXptCagA50ULdAREHYiq
   W4yMbbuYwYPMWO4U6P9ABu7yfHx8/0zgDPTt4FgZaZUNR7IbEBPNh34Cw
   LjokNCneFegXHcuU1dtk9/v4sErgCoH+3AE+Xe7tlqq3DIKEseQ7I81uX
   A==;
X-CSE-ConnectionGUID: /1xZUPEjTcOfrf710zD6NA==
X-CSE-MsgGUID: t+zonl8/QymVIw/9M4id/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="46870569"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="46870569"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 02:17:58 -0700
X-CSE-ConnectionGUID: oYquPwsDRkGAqHSiFL4hog==
X-CSE-MsgGUID: nhVhLyxMRCy1sq0QvIzkoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="124842053"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 02:17:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 02:17:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 02:17:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:17:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bILKiDHnfHZfiflWMZaSZ9UAbpofgQIjAIPE3G1pkNClNTC5mUt4XabTq0MF+s9fW0gZgVSiw5uzmDd+XOu5R+wSQwlbVr8piZUdotr1VFyysjmkavao8dau9YTWENpERDxJ5jToyZrcvG9vzowS0pcvb5W96AqaniOeaCPMRu4tddIqTh0rmlpKrXGMc95quDXotv40vMOcOsjChQhSwCVi7VvbFr1Hak/zh02/Oy7yqGmzXBv/MImBs1iBMmcLh4s4ncZgcywCWNb4DBUpX86bIPAiJ/HqxT1iTofV557qX7a2ZNqa39ml0o0mTvAVSEMPGuKmCC5+ObpPNARZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpM67Eu/VZpG6uuOciFBQStcFmWiRZ6xuc67FmUJVbc=;
 b=BrlPHEnfJbsYBZvLsCaYOIszyJs82Wl8JBCgu1pHBO09L7UM8wHexHwlNiW1IqhcQE7fsrNgXihjZbOMPyput3M4pmV3BYislgNmLT/k7VP07XAzuucx8ejdvPRr/ehPMUaLIDcOCJ/ieLeoOshlAYkNrDhw4QgehzGE/JCZuWsYHiRdQR5hn6Mws5DAxdsCAYrnca3+IvAZFp6MJ9tUL2fL1zT7ghWeWZnABpFjRIfEa5Dt4qgtNhMHmNOaiVp+2Ws9dtRlEcsia0GE3C8mhkRtqiBXjjIbMOc7Fn5Ju6eNUvzIBHonTnJjOZgXjiDI/dBXyqthBOmCQp3fejVRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM3PPF9D56E7727.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Tue, 25 Mar
 2025 09:17:56 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:17:56 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.8.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.8.rc3)
Thread-Index: AQHbkjc9giq2X6Pwl0u5vuIjFz5FEbODqLog
Date: Tue, 25 Mar 2025 09:17:55 +0000
Message-ID: <DM4PR11MB776086AB5F09EA2C267E1A36A1A72@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010195834954e6-2d7ab9c5-20aa-4966-9ca9-3546f4436395-000000@us-west-2.amazonses.com>
In-Reply-To: <01010195834954e6-2d7ab9c5-20aa-4966-9ca9-3546f4436395-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM3PPF9D56E7727:EE_
x-ms-office365-filtering-correlation-id: 1c24a570-ed54-4cf6-1e02-08dd6b7dedbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|38070700018|13003099007|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?b53IpkbimH04NYAyXmC+OIM34/Tu8lUpi7emEUeIjKllOhMnZYp0U3YZ0/VS?=
 =?us-ascii?Q?pbnh20Kfs5VOJ7nSjI65Bm3GAyB7H5Wz8AP2ee+axJwt//7F253dfKL7roIO?=
 =?us-ascii?Q?VllBi80hKWfFJ2ROXFUpkuQ5WaFQphosDUQontbLRWw4M5Bq2o7WOT64AMka?=
 =?us-ascii?Q?RfDlY05j1B72d9SXn+SzmeIomV9lSq/dkEnjo7YBC5WvlzG35q5YgPpBiDb2?=
 =?us-ascii?Q?aYOHm/8d471ZhVB95MVHbvqeOFa+eoDUx9njYTvoyTOHCzZ7XIPLy4m9yGBo?=
 =?us-ascii?Q?C9hGC2IbzkgsZGjJrmCTo9gDE/pkTZt66luUgxH8aYeJf/aajD7EHAYwNLIH?=
 =?us-ascii?Q?ZWd1d6iRAF7bvLtl8Hgh7+gg6DLA17/0tjPfMqiotS7kk9cpRGPoJ2jy9eOI?=
 =?us-ascii?Q?EKBMYeNXu73x5bs3J5Sy1XhJebSmksG0P+mq2rTOoVZQKav5p8BQeISVLY+w?=
 =?us-ascii?Q?enVlrsUFq0AQau/U6NMH0hANMyxwqzSfWgiAVXd7CwwHTrGk3PchYSWK0Ke0?=
 =?us-ascii?Q?2pFCWq3q7F2uyts9+aQeRJC+C6G6IR576kQq5jRLqwyp0dfiX3XARbGpQBCw?=
 =?us-ascii?Q?Wu+oJ3fiPbkzgxy0CXwus5t3AawKysnFyqDLGz3AGJQOpT7GUU6y2QTr/Q6g?=
 =?us-ascii?Q?1opePftod/NuaWPYghdImaE1OQG16kMEDPM2rinjLFGSXUNzilhPjbyiZPGJ?=
 =?us-ascii?Q?90K8V2+aXBA/TloGxsbym1k94QueZLalohqgabSbk4staBtEXtdTCwOXnV8g?=
 =?us-ascii?Q?kAXdkkDLkkF2aGkJcfp/uwn7NKQS2FyIDHGekKsAL/HfZkDAB7omrWdTvskS?=
 =?us-ascii?Q?6fwO+WqE2cPL3BuKVX4JIDN62fiQofl83/qyxjwbRsxZyt6DI/JFx2IOda8w?=
 =?us-ascii?Q?eR4n7t64uqlajMUYcVZuRpM+oD+Z3BIVTgl7Bb33yWSKeVkbwRe1No6R6AQj?=
 =?us-ascii?Q?VLTkvvTZs1xehLjssaOM+a5EZkyVhLoEqFDcqRtfdDuTFdiHBLaw2S06YWOF?=
 =?us-ascii?Q?RWGoqXkOlWnxvVjL2Q+IYi4Ch9Xq20gG1Qx6VaOFWKo2uuzBhcaVinKBVof4?=
 =?us-ascii?Q?/WphWRVd1lFO/cDQ6CDPYBBbsQTQUFY23e3ZKGuf0ALzbeqBWbxXlGFr/1sY?=
 =?us-ascii?Q?dVU+y5s6IFHDkojV/PX3etOx7RF49P/CCRa2WzkZgmOgP/Q89k1vtWeV8cJK?=
 =?us-ascii?Q?YRkUMCVTXreUE5CtSr87SZACqhaD/EGC3ZoorOKqxPzaH1Nb+8ITUJYwae/G?=
 =?us-ascii?Q?xTvaaTS6NrXmwbiGKckvNdRLuH64jsikp71iQxXvjy9pssKMe6JP63XMUZEa?=
 =?us-ascii?Q?Wkx7mzmgnxMOZd1UEzYW6m6NYphhrkGedoa5TNzDF9YjLFHWYcDcyJrvoCxM?=
 =?us-ascii?Q?cEZzfudBo5EVK7nxvssmOefnhNDZ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(38070700018)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M7h6728Yt+XwbaThrCwBhndQfACivO/ITzXZuGdoPL0OCHywNDJaJn8gZFMU?=
 =?us-ascii?Q?KtM6kvWRh64URx1f3MUW4lFygwkI4AKgIGRGyZSaAnf0k5CFFXyICDMNp24c?=
 =?us-ascii?Q?ZHcqbc0cwC1Q7ljdGH+90vUOxJM6AZa8dSRuzb/k01z6fuq/B8s1T5d7xbBm?=
 =?us-ascii?Q?1Lcc+X9DvlVxckM5Xki5/Gs29vnTcNn5JMy4rY3sFTY3z37VJTeGVnJmXNJ1?=
 =?us-ascii?Q?gbxWTIIJAluwDSUUIczHb83WcYjSAak0CCTKltqqCcfguYM7Gx5nPJ7S1CUQ?=
 =?us-ascii?Q?GBg6AZz9ZO/7enLV5NRRnCM9R/q7lS9riJd1z2FRg3fAhmwDtlpR3d4ARExs?=
 =?us-ascii?Q?lXXQ5ixUAcc8vdTb5PEDJoZYI6XdRsPvePAp62r7AzDnsIV6qwrnTWbht9Hn?=
 =?us-ascii?Q?JKqq+97KLouGqDLblzojADh915dSQtdll3Ph1N/JBIJ9aICpwWjO7lP/1f3P?=
 =?us-ascii?Q?7l96f0UkAa5eh4b2AqudzDy4EFqEj6XWWfl5BqJSF7ZitalXnJkxJkqxs2ex?=
 =?us-ascii?Q?gC/AIcqkDMBoderL7lFN4kGF+Ut3Fmfzh0RN2KGQjY3j9YbsLBUrijZnihOI?=
 =?us-ascii?Q?e3GXUr6jWfhQvCR/mNK9LSRTTQcHJAk0t8JS8K9/BHAscZGHmawrbW8yxMaE?=
 =?us-ascii?Q?tKhkHUD4WQJwuW+Ygc8GBsffmOqK3Q++rkojd8XW8PvptE8sAGX7v4+FqZTQ?=
 =?us-ascii?Q?BIKDSNdWpqChKwTUDzOJPz4ZnYP2/avYgHaQ8n36h+4crq60fGyeBw5Fqwwl?=
 =?us-ascii?Q?ru+rmpNpy3Q6HQpirdESDWbSi6Jw53TZM7mREM2dQ/FeRthLacLnkx+Z5D75?=
 =?us-ascii?Q?28F8KzPBzS0Nx0eDjKRb74iKSE6rGEXP82TeORsyWC9SLtx9Ro75Wc0UFxWW?=
 =?us-ascii?Q?P7NpaHEvgotBCem8ZW9k3IDi2a3cq67KvBj7SiOfh0T8il/bmzOUv7Jq0LBs?=
 =?us-ascii?Q?b5m0ia5rj9cMYUReo80L4AxCpGTGwV34Os9ZmYLxzWxR1lEfuZqDXqmAsUHr?=
 =?us-ascii?Q?jB02qoigyeo+Dnz/tZCqV2A0AEAEQJooIAL0izHWVtuxn4T7cBg+s8t3gp/1?=
 =?us-ascii?Q?4u/cVxI3SszovG3mYC2s0spuY7opQzzRpTUDmQvaHHht9Mr0OJwXrO/Y9LBZ?=
 =?us-ascii?Q?ydoLC5HYcaZp3IFUcrGHlLDVRoSIu6IKSwr+9kSvhe4VjacnjzjpIyGNSyqb?=
 =?us-ascii?Q?KSfFXgSOmz82V/aChapU3PxqJskHQ09TtCFA5QSHc5/1TTwstCkFzRBCet7Q?=
 =?us-ascii?Q?bujD8o9dIDwRvDQw1f7br7EEeE3bVwiQGFYY0oU76hprCtgiVM9I/Fc6fjvU?=
 =?us-ascii?Q?giWKkdBZLkSCtHjBOcIP9/oVA2vxwTpUq4gGrZ1d56CAcuQivKIeZKj4nDmF?=
 =?us-ascii?Q?ldXR1HP96OLtSna5JSU3anA3O8267A87yUdu+HgxfD1CKQnzWVrgq3Y1b9bB?=
 =?us-ascii?Q?YWQ8RooiYxiHejlUTEsjTqijLuoGOUqeUYCTp86QqFWPEeBOhHBI1T0ySlGj?=
 =?us-ascii?Q?UWPsIVhveOcPrpejyKFLqQJtGpvD6dCHrcH68G2d3qkDf0RukigW8TdLNkeB?=
 =?us-ascii?Q?a0wzRi7+CmC1VlWgyI4vAiC7Dv8ltE4pedCJp8Pj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c24a570-ed54-4cf6-1e02-08dd6b7dedbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 09:17:55.9918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQjorB1Sj1anaMCJpx3IiABeVcs3CNKtywfNvG2kcXEcA4EJa8OiTiHTI9Kpp0KIriwaigfMQ2nN8YznvWRruw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9D56E7727
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 09:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213598

Hi All,
=20
QA for yocto-5.0.8.rc3 is completed. This is the full report for this relea=
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
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Tuesday, March 11, 2025 11:40 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.8.rc3)
>=20
>=20
>     A build flagged for QA (yocto-5.0.8.rc3) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.8.rc3
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1161
>=20
>     Build hash information:
>=20
>     bitbake: 7375d32e8c1af20c51abec4eb3b072b4ca58b239
> meta-agl: 005d2b0a27ebdd21fb2aaa589c8672650474b055
> meta-arm: 3cadb81ffaa9f03b92e302843cb22a9cd41df34b
> meta-aws: f824b120fb367fa53cb39a68dd4fcaf474ce913c
> meta-clang: 8c77b427408db01b8de4c04bd3d247c13c154f92
> meta-intel: 1a7ccdcaedc965f019a9263364437356b8a2ba29
> meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> meta-openembedded: 6c9f1f8d4538119803bf793747b65e4d23c33544
> meta-virtualization: 94ee980814d7c5824449b2745a934664adbf3007
> oecore: cd2b6080a4c0f2ed2c9939ec0b87763aef595048
> poky: dc4827b3660bc1a03a2bc3b0672615b50e9137ff
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
> View/Reply Online (#525): https://lists.yoctoproject.org/g/qa-build-
> notification/message/525
> Mute This Topic: https://lists.yoctoproject.org/mt/111633976/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


