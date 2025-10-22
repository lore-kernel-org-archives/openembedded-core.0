Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C6BCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 06:16:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web10.2486.1761113759420826717
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 23:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YjrXTRRV;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761113759; x=1792649759;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=Qe77Ssj49ZBFiYLz7FYs65KwaLA5rnNzK1jEpfEB5CM=;
  b=YjrXTRRVD6GppeZYil7TIXTL0F4Remv1qvWT7v45+c4aPvU/tisr7IOt
   Oa1yIlYeIT6lI3UF1e8bXnubAL/2o7QeuzzoVi/4jdK3s+aiepPEIERDa
   LPuDD9UJ4SCcLAKLoRLvKxMNhcoSwywTBJW1n1sSJCoz9Gj2+ZDMm50Iu
   Ge4OKfki/FQGp6bXPkPErrWWet0mQ3s7jCSc4q3X+KYjtGJI6ZyH1VDkm
   nu77UlaCU85kbodW0teo3fngUK/aFW1KrA1CO5G/+rFhV/9OxVEui79Qz
   zmuz/dYcm3BAspv1sKupsArtPwYVvcdolKSK7fv90KiXh557eaaqNWoxz
   w==;
X-CSE-ConnectionGUID: j+hrImfMQeSXi0iJK2G8dw==
X-CSE-MsgGUID: 6xzWOHQjTAGQ/iYEMzTIbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66892500"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="txt'?scan'208";a="66892500"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 23:15:59 -0700
X-CSE-ConnectionGUID: CuWEbJgVSgW9iJNWeW349A==
X-CSE-MsgGUID: HtyrVbWtTw2/bYfW88151A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="txt'?scan'208";a="207461528"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 23:15:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 23:15:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 23:15:57 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 23:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbY397j8ivVu8+lP9RdVPqOrni81bhfJ6JzQ+Ma9U53hOpsb9P9WnsQrZmOlgTuEPPITVd7SM2l8Yhaqy37zaovxkn2sY2u2hL7zA29OLjtqi2oOkv37zMduRr3Uo3dNt/pmE4/RKNSP6uvqRr+22Dp4+3RLV2FmpWePzrmTyt1l9269PdjGSZOe7qWjs7t2scrUpk3vKAYhpX8Ww5Kg852c5pvwwI0rfMhukLLW5SacC1Wz9FI6R/vzAnJw44DezHrYgE3kwU3aUKGnA7vyBbCxr4Mvpr5sFBOX/BzRXA3fSxcYRpDIqmpcLFhpy+ta+441dgHNaobV9R8e00AKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s1/DUVTuU+FvgZkC8xRZV5FcykkjZXkdoLH3e7Vt+U=;
 b=LScTS+xkU6z6OVOwWSyx3+d9ykc+sh6UgFmTjTPB7RGtc3fuZQ7bIHZ6S5yKf7blalTgW9hsXZjchHCQIRNcVS4mRbPibPHUB/HTUwXLpDzsM4ZbViy7oOnjPSFR8fSd7jwXQ0ovFwblpOMHIBxmG0LvzoAXwtkm7RhDHrhskmNt8b18UPslcJLz47NwfS9cLet0huBFghIwj3a3ltKISj8ARGOAmImcOn0OWvqEE1sDStG4U5rPozw+RJigH9ZXXH68ig4qXslBAqJUQ1Rqbt6wuoZuv6Honw3b0V5wFzq/w/dv6brtP3Qc7pNJ63x+0hLERYqBkx4y6k09h3G/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by PH7PR11MB7498.namprd11.prod.outlook.com (2603:10b6:510:276::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 06:15:48 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 06:15:48 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto Project
	<yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: FW: [yocto] QA notification for completed autobuilder build
 (yocto-5.3_M3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.3_M3.rc1)
Thread-Index: AQHcP1kB6khA7ddet0i2MyHdlP3sYbTNs6SA
Date: Wed, 22 Oct 2025 06:15:48 +0000
Message-ID: <SN7PR11MB7018540BF5D7F648D73CB04DF4F3A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <01010199f1ec695e-da41e756-c561-4a89-814f-693aef0cfc37-000000@us-west-2.amazonses.com>
In-Reply-To: <01010199f1ec695e-da41e756-c561-4a89-814f-693aef0cfc37-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|PH7PR11MB7498:EE_
x-ms-office365-filtering-correlation-id: 52dcc3af-10b4-4f4b-1702-08de113271c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|4013099003|4053099003|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?cAhsa4c4mqPlGN6DrZeNlGjB4D7im9VPhKsT8pkHNvF8zvLKhgySmCSz+2on?=
 =?us-ascii?Q?JCdSNLRIZ+wFEL9zavSbvsdIw4L3VzS2roUgUokrOASPOmL7cTK2eT8j8RQ9?=
 =?us-ascii?Q?jXABsV3OIYicghdo/3kYYPmU48qtD6qNOSC+xKs/gwYvNUwhJJXz0ejRAR0U?=
 =?us-ascii?Q?TqiT9eeAvvyCLQmxFv8wTxM93HNzagdU3agvqcSPQr4nt8jzD7V8/hbRYYjE?=
 =?us-ascii?Q?bMSURiJmGXQC0ALh9KiSbcIQTXC6FKoMxPuAmfTpGyyBbeM2Zr4Wbc9Cs7rO?=
 =?us-ascii?Q?mmDm5ThY1CgzB1Jg1uzX3hVmnWzcJ+Bp/rmA9H2RQ5j7LWuUqgt04J/svgKd?=
 =?us-ascii?Q?9Z++EnT2zN3CKx5SGOKLpKg3DwHrY+URr2HEL7CstNjnvDMAUhu/E9fJW4/u?=
 =?us-ascii?Q?KIEsNru9qjhPjW6KRLSLWBoZYJUKSwiF14HQr10EWzmjFHnQ8ketrSlOUVBA?=
 =?us-ascii?Q?bV6KVkvUEmyFBLX/P+WLaNbJs8O92C98ebA1agXrXBMm2p6Ggiijgo3mT8RK?=
 =?us-ascii?Q?rJoHlu/1yZqaGVR4+p52ed3tLbxrXftBvloYPTJz7uX3t8aE36rJ7w5DjgYN?=
 =?us-ascii?Q?e1/HFBvoxswIxIMH6lLf6UEFQnpQmaFcHeqap1zjYSFPSLC/iqF7X7O09kHR?=
 =?us-ascii?Q?v/aH1FJq/iFrWo5J1Brv3cNt76NepAISB3CuF9yy9fBjhjLhGlQr9L67ggyW?=
 =?us-ascii?Q?SapiGpvE1JGmhttEPjedNLhenVBQtaK5YVtPIreMWTX87URfAVj71fRqd8mM?=
 =?us-ascii?Q?GGJhGJ6JuKoQpuowoD6NvkYueCLylNUUVzLiVpAdeL/5rB2CqGrTdSSWkhRl?=
 =?us-ascii?Q?H3OaiRKJ2NmHHZI4ufzO48n/YbBR41khzTws3B520HkOLVj05uyoQkt4SeHF?=
 =?us-ascii?Q?2DF+neO00U5JSiPBs/NSqC2nYR/03db1asbCssfAgn2VGZGFuBnmGlNMPLLh?=
 =?us-ascii?Q?eA3RGPm4m0TVX/sJvaTWsodAeQyiY6cKYtBxdjCrIk5rJ7p6E2gzIhhJFEtV?=
 =?us-ascii?Q?/f/TfT7IpmZMMfAfwqGDMTg11xwE02xilG/U/BpyJfvOhkyk05QW9JmEbfuB?=
 =?us-ascii?Q?e/JlF09X6WW9MSiNkNpoUWUr6nGoK0crJUhasU7eXnoyCY9TlgJdgt1SdE9p?=
 =?us-ascii?Q?TziazkQ6YIlcoRnfaxjdJ2QpwRuvZVsb6yApfq57BGSlggGOfLqrOAJcWZ0b?=
 =?us-ascii?Q?+7PALvYOcRydQJeJorTnPj6R64n16h35eSH3m9cMSyQTxiOIqjuU5K3T+PAG?=
 =?us-ascii?Q?/V796mn6N6CQJIgi0MNmZ2HYyYXRlC2IOlouHkbimBVQv6WUd2O14AJp7uHS?=
 =?us-ascii?Q?93kEbpOpLm8TpN534r5sC7vPBAM7GhbT5VKUHZOt3AlxzuZDvPYr4K9PqCP4?=
 =?us-ascii?Q?Q3Ai34WOg8NRN4lkitq/ca7+hCS3f+cSV3jlbww5sMllVZSdhEEm2AXu9oT2?=
 =?us-ascii?Q?agQVRqqx1mhZYRSyZ7vCkgDT68hWgLHRtVyjfThR5yH8f7zIUDchHQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(4013099003)(4053099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nPYv79XyPj15VRjRw1Fu0zH3HCsZhfLFvTVH9BmRdOwshAKxsbXKuO6auede?=
 =?us-ascii?Q?fLf4IUqIj+tn+FUHDhPmahLkNKYHygn7cvGL8iFAk+5Nxh2RliSwqDx0Q3D+?=
 =?us-ascii?Q?R/Lm5RMngw0+/XNQCfm74tsB6eNgyDvfEhxf881JcmecAHVLS+BcjK581ycN?=
 =?us-ascii?Q?i4hTcQhy8S9lYvtFLyMjoqG9ZscmIE4GyYE0N+ZyZCSGjsDrsd4lCY3IyetF?=
 =?us-ascii?Q?JkY2bT7GJVYOh41X3WgXEnBTBkxaUZawfTOsYUmJhEfALzIi1ZfcOeBDyhOX?=
 =?us-ascii?Q?hIRvuHZ/OteA5lANvYS2ak+x050qRRdZPHulSUpOhxtrBlVzuFWhfXmUPxjw?=
 =?us-ascii?Q?XgOo9sxH1XGPz7kvzfmmGZOeS4t6kQBHNyFEX2dwObhI+075Q9Ve+1NCwu2p?=
 =?us-ascii?Q?9z8eAmfq2M7QeQq8jgZvpg+VL3jxj3CWgxeVszxUcKfJO3grTYJYsf6BFr1F?=
 =?us-ascii?Q?ubxuJk43cNVPfTQD7hV6cuvtcjZmwD41LrkPIUfQq2w9tZhy1pyA9aEq4gpH?=
 =?us-ascii?Q?hoEQ1EiGlD8RhRlGkM17plUSB1yVBzSCeNIbjB7aWr+dY/xNV0FwIUF4pZeq?=
 =?us-ascii?Q?/gBZgzgdAdZbfPvSX9FC3rPCglGxx0dWBpIRz79fI7+IwseP8IEgJkTnuxV8?=
 =?us-ascii?Q?/2ZMr7YX7rcS/ttH177ME5IatAvVDCDbe60Di+Zqcr2gSzJ8iWY7R2uvxgeu?=
 =?us-ascii?Q?8ckBPUZhSJMDxiWcV3Bbo1GS6IfRLK3Wy4p87gVb8XnIPQ0m1pA6XZIDexP0?=
 =?us-ascii?Q?otTahhHHfJ4qCJgor9X/b/rcMn/6dlmbvNc3R/TzrVYkxKjqm/wJKbd0YZip?=
 =?us-ascii?Q?M3ReoA0HHciOA/tNssec+JIF9jpdH3TO5b/Q884aEp1M9OQT7iG6CU01RYxV?=
 =?us-ascii?Q?vYtS12xuWFwDG10tnUlH0nYrPgDlt1S7PdKaqYHPYV8VQPeiaw7VjMBrzACl?=
 =?us-ascii?Q?g5gzUzQnuU1Wl+lQBHRG0zord4LuwgG3chnN5tgkXgTPMYmHG5vybG3YeUdv?=
 =?us-ascii?Q?lGnnigm2y9agMQqaHqv0vFUFr5x6FuS6uW0v+ys/QbQCI7M7plLm1QnWKkD2?=
 =?us-ascii?Q?aFT4PLXxjomxfwPbUv8Xwz8mzRkOSLrPZ3/g+sGY9viaGP/w/LaQgVkIamcy?=
 =?us-ascii?Q?Ps77Tp5s/H/BYiNf9iLgGthPWuf/jkNyskql6OoyToWyn/34UwVuY5culc9N?=
 =?us-ascii?Q?bj3SzapmFDNaQ6VLjyLkbK3FqsuOOzG4SQPVFay+xYSUgLF5Vuz8VhiEWVXL?=
 =?us-ascii?Q?iiOGJ/wks5vwPTXUlutJrt5bwQ72uRLQAXjoyMwPxzeb3c0La+/ulIoYaolR?=
 =?us-ascii?Q?mWOoImCBNMhI1SPj9LUgqv11r8L/MgaKYy4jpsrFdrn8JdxNiSBAU7EYB7Gc?=
 =?us-ascii?Q?iDq1RYgC4JC/hhUHBPIrRHTwuZnmrfxyqzMLqJEBCScNrS/p3m/WgarfTkmu?=
 =?us-ascii?Q?UNMtsiGlnQ/TaDpuuDzGJnFSR/jnGE2rdN1jmOujx6e1HIxFVBUpKZa4/T1m?=
 =?us-ascii?Q?9950BkeScK68ZPetlKwOcaAqX3Cyd9AvvEkX7gbDVcKFwY1lD4MLV2hLGgG7?=
 =?us-ascii?Q?dFOgWlvdzs6T2NvKB2otsCI9YNDFooneWSLKPam5?=
Content-Type: multipart/mixed;
	boundary="_002_SN7PR11MB7018540BF5D7F648D73CB04DF4F3ASN7PR11MB7018namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dcc3af-10b4-4f4b-1702-08de113271c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 06:15:48.7550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgwFlH8nwlnWdG+aGQXcIYPv+vh3KKDxnvcYBErfc2eh68ndxkf2yqY1uPOrrqPPhVoW3jpHHjAVtFxxzkx/tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7498
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 06:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225177

--_002_SN7PR11MB7018540BF5D7F648D73CB04DF4F3ASN7PR11MB7018namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,


Intel and WR YP QA is planning for QA execution for YP build yocto-5.3_M3.r=
c1. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:
OE-Core
BSP-hw


Runtime auto test for following platforms:


1. MinnowBoard Turbot - 32bit
2. Alder Lake-S
3. Meteor Lake-P
4. Arrow lake
5. Bartlett lake-S
6. Amston lake
7. Twin lake
8. Beaglebone
9. BeaglePlay


ETA for completion: 29/10/2025.


Best regards,
Debal Ghosh

-----Original Message-----
From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Behalf=
 Of Pokybuild User via lists.yoctoproject.org
Sent: 17 October 2025 16:57
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [yocto] QA notification for completed autobuilder build (yocto-5.3=
_M3.rc1)


    A build flagged for QA (yocto-5.3_M3.rc1) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.3_M3.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/2605

    Build hash information:=20

    bitbake: 8b582ef8dd0cef0192d4c0104bcd9b5d642d132c
meta-agl: f30cc1bec758954f7cc44f15b1df3c7a49ff2e1c
meta-arm: 40a5aac50c2540d32f79c30accd4bd5e891a87a4
meta-aws: 20cdd76c203b9b5b3331a145e9afcc9171a40b7d
meta-clang: 9c772c10f9001db62e4391b6617d03086a24beb1
meta-intel: c347d0be75958ca095d4ad320c6f2faf88b364a6
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
meta-openembedded: b28f8caccfefa7c03ec193a67fa8b11deeafa558
meta-virtualization: 437efd9259c1786c130c724290cb1e46d50edcb2
meta-yocto: fe65e142d0d9ba0e51ff9175ffa82e902f982a20
oecore: 5298d01663f897e38380116edf23973d2a156cbc
yocto-docs: 8b85245490ae0b19a9c3880ec31e55b42e19d094


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20

--_002_SN7PR11MB7018540BF5D7F648D73CB04DF4F3ASN7PR11MB7018namp_
Content-Type: text/plain; name="ATT00001.txt"
Content-Description: ATT00001.txt
Content-Disposition: attachment; filename="ATT00001.txt"; size=391;
	creation-date="Fri, 17 Oct 2025 11:27:22 GMT";
	modification-date="Wed, 22 Oct 2025 06:15:48 GMT"
Content-ID: <4D32B80754C025408DFA1997856CA67D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

DQotPS09LT0tPS09LT0tPS09LT0tPS09LQ0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdl
cyBzZW50IHRvIHRoaXMgZ3JvdXAuDQpWaWV3L1JlcGx5IE9ubGluZSAoIzY1OTQ5KTogaHR0cHM6
Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cveW9jdG8vbWVzc2FnZS82NTk0OQ0KTXV0ZSBUaGlz
IFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTE1ODA1NDg2Lzk5NzYx
MjcNCkdyb3VwIE93bmVyOiB5b2N0bytvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpVbnN1
YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cveW9jdG8vdW5zdWIgW2Rl
YmFsLmdob3NoQGludGVsLmNvbV0NCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg==

--_002_SN7PR11MB7018540BF5D7F648D73CB04DF4F3ASN7PR11MB7018namp_--

