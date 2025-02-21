Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FA8C021AA
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 09:45:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by mx.groups.io with SMTP id smtpd.web11.19740.1740131096369640478
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 01:44:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=LZR7AseX;
 spf=pass (domain: intel.com, ip: 192.198.163.12, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740131096; x=1771667096;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=WC+hG+NWD6TuSVAWx07wl1HCdey7tfNy6Lj6JNRgO4E=;
  b=LZR7AseXpdaWy9znL3IoDeIW/rpVajd+AWf6lp7vmjB/zDTJ+3q7WLe0
   NgZ1iQyJnlXwZwHjsYblusybdjsoejXqpTi+ZZif9WSFeH1/N7Pt+2ahU
   m8mj9dyJ2bwB0CJ2+Ng4rRsRNuFiHItbluFyyYfCD5V9U0gHRXUq4YaxK
   qVk8A8aZ/cjX1NE86SC8lINX4tlTuZXMFtm/iB4IZutihrXmlyY2eekBf
   E82oPA1UMaDzKlm9Tzyp+0Rxm8aUHJRSPx/Jd+RbiQYh9ZTAMldCk0zJb
   PGvzRHj4IVk3ojtSoi8CWk+xgJwc0T+OO8E971rIfwmvZC1l7yNK6ptzw
   g==;
X-CSE-ConnectionGUID: 6whTqwJzRbOAiStxBleIoQ==
X-CSE-MsgGUID: eGVicI8TSCKjLqoHQph4bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44860209"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="44860209"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 01:44:56 -0800
X-CSE-ConnectionGUID: 7wAasupRRBm6k8K6unDn7w==
X-CSE-MsgGUID: /4aqpSoqQ5+XX6ecUAlLRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="152518428"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 01:44:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 01:44:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 01:44:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 01:44:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTKv+ckaZfbDbos0OxjnmpwS4EcoEmEwYo37avAf0Muym7f7OmLUWeIwtlLV980E2R66O3g26kt+1pOiASqSkvhXuRvOLPYmVKvjJtrwFiBzNaC1YDCVZ7rxz3BZyR39mfMbCxkpxk0pDIqGgsaeQ++vo97WFl6WjR8NzPDGw06rIoaV8dfTyF4sflbxpHzFP9frSL2zg+VY0AKAG5zLpIf5VXqUf/2JBGEfynHNZLSXC5/cLxYLJrLLYwdCcPPifywGiOLy2r4G6TBcQwDowU6PJxisuo+MO4OFvR2W02pOpQg9HXtY0/VBqR2rTVaMnhdv0v2bNEb2C2MEBP8z9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtdQNWfVx7HMnKObd8/xuPq58FwTy7KPAO+zmzaWSAc=;
 b=aUqH6LgulWowPjMuAu4SZ2S2Ov6PHlNZbG6gHpTWhI4xVgr54vuMmXU6bxxfRyDtslRfYSxgk6tYBVoDFXfvlpHPDmWn/fC3Xz+ziYJZjk9KHm2slx7AAgchPKFjLo0jPum87gEIcdMMziVPjONB6UzOwczNuGk8p2I0Q802EBGALAMvpymZmROFN4zyuu9Esy0R6rWAjeOd0CX4SP+bLfpUcHaZuKK86YevpSUS4xnuP/0n274ZC4bHs6OU0tcDa9CVYSc13hgWw1zn+HA5WBoqP1KMoFmqyyNRa9RSHkNynz2rYbbznam1vYaZEqu5I5gpCIbhv4UNwoxJGV1jmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Fri, 21 Feb
 2025 09:44:25 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 09:44:25 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.25.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.25.rc2)
Thread-Index: AQHbf9JcRs8s+QGXAkiwmeUdYe1ieLNRioBg
Date: Fri, 21 Feb 2025 09:44:25 +0000
Message-ID: <DM4PR11MB7760607ADE1B09F58789750FA1C72@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101950abd2b72-1e207827-710f-4a40-9c8d-baf72f7d50bc-000000@us-west-2.amazonses.com>
In-Reply-To: <010101950abd2b72-1e207827-710f-4a40-9c8d-baf72f7d50bc-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH7PR11MB7147:EE_
x-ms-office365-filtering-correlation-id: 4dc92c23-1619-4bf2-0481-08dd525c53bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?k96URANnLXURGyCoCDujqiHvn6JxmV8tGtZbhJtQ6CHZksR5DMhljuzGbpPQ?=
 =?us-ascii?Q?Y9nNr09nSq7KI/S/zztZ04MUnn4ZdiCKMKEfH2szBHygfoul5sDa7ll6+Wo/?=
 =?us-ascii?Q?mlIn1Z3YxGLkrAXoh3vx6Qwqn6X0TrjnMneMIQ/ovZhW9e3TkDyewPUzlic9?=
 =?us-ascii?Q?6pC5oTMGYDHcc5D/DZqsQqJ/vlZo3e3hm7ZH9pXLL1RsKdH3Fg8rAek1TYok?=
 =?us-ascii?Q?aa/2CheBUAO7NnF1tv33fUSsjSscYU3QqoGTpJ4BALvOh8qPrIZUPSrrEHqY?=
 =?us-ascii?Q?Uh8USY9Wu1Yj7qfTfiRlzoPcJruzHDMpu9qeEXCPjtXRMVTKB14BDYdnSY+i?=
 =?us-ascii?Q?eNv9RGPKSL7fItBEuq9CgJ1eieg2A+ogEdFRLJdCy8hmq7gWeMR/aAwlr07g?=
 =?us-ascii?Q?xPkgQtyOcJyqN1k0jHTudyNwAJ4b7B7wb/23RlEBxn965CJdCQ3BkxoVjwCy?=
 =?us-ascii?Q?gWRStMFgiNZGldRoFzVRFDKeaNszSC0SaF2G/emoNerzwRDr7MH8b2wWDtc+?=
 =?us-ascii?Q?9b5LkrTj1tFMU/x9dQDs67DbjYYa7ogprI8ZgV/RnVTfZytMOCOv4vGpJC+D?=
 =?us-ascii?Q?thnyGLCAMSfYw/iukdBoQh0LLxhe/vEYO64PiWI1KwGloO8Ltaop18J5Z0aa?=
 =?us-ascii?Q?ExiRgRT4zSlnkTLrpXIb9tBPHzO9dlWP078+gS2oi3y3llWPU+v4taCbzhB1?=
 =?us-ascii?Q?vT7o65El603viifc059DCiPX//J/4A5PMPucdZ/K9umPaUWInW2Wi2q1Mw/1?=
 =?us-ascii?Q?h4Pkneox3GWLzEPs3xIdiM2EE2JtPi4aeNizz2Q6VTzsTpTUj0z+apgPgY/l?=
 =?us-ascii?Q?eFKEEA1Y3nkcTWqQV4TPS5OtLVk19Hjx3cS9YD3mEQdZxFnkAObksz7qhfxE?=
 =?us-ascii?Q?4VAUfC/sPHFdnv5WhcApQ/steQI9RpEeRb/pGxjs78wIX55PQNZsKBFbwygb?=
 =?us-ascii?Q?jpnyiKCRvsjGJvrwF+naDcz9Tqfk53tkDlzwopRNRQqiDLPfoCIIzFi7mhnh?=
 =?us-ascii?Q?HHDfPxj4fB4KoEDyZMdnw0zuh1dp81xgt0AtyD2A2W4IoO8kmTMu2NfcPeQq?=
 =?us-ascii?Q?lzWmfhoYYJVoPl5oNkO1Revb7jpEjgvkZEc1RqGGnUNC4zU3m1XNDl1T+Unu?=
 =?us-ascii?Q?UWVzUdV5aDGLl34tR6Wr9UlLhoNdYIoQrXZZfR2AZo6fPeW4Z1lqHvgcOFYH?=
 =?us-ascii?Q?4Gx7ByOiUnp5KT9G60WPv8dOBFYoim0wVmrXmnETkGezq14uKCjJBV1HY0+O?=
 =?us-ascii?Q?wWorzP8T3yOPBOE59OXKjGDUuc4tmsoFWZ0cDcE8qt68qTyOxeYTZ22NMKpF?=
 =?us-ascii?Q?zxcLqypcyZPaa4LKpp6eLQuSU4vSbSG01n2D61W2q2r0wljUShTtVaIRE4wC?=
 =?us-ascii?Q?OcJ4pXVLGCOOGjlzyLoVy6YWx4dL?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LwQC/7nSqD56vLQQdZ7qlVwEzD2nwdy9qgoFTP0s1V36dsIa34KG+KgDAi7e?=
 =?us-ascii?Q?qaiRzMrhdpSkws8BavawwktA6M38u7eadWd7MW89HcrdeqQoBxXDyFYkgfrl?=
 =?us-ascii?Q?YMSV6pmIRvvjnKS2NrutuBOJQlnRZqdUiRisSKJhO2sVd9dA21R2kCPMdfMe?=
 =?us-ascii?Q?xlsr8N/G6Fv/Eg9YdRjLFux8Kv/ztahUlHSvn2/ud07eCN/9+PsRHefGiKJb?=
 =?us-ascii?Q?r/umDiaazq25JAjjDSuonbKrDa+U4YlFMjmUEr1NLCRBeEBc/RYuMDgt9b/r?=
 =?us-ascii?Q?1HaXpNFjcQ0nmaxDz1ibIPravQV3xEHGyeDrqgPLu46crhlR0KfqNr+Mj2pP?=
 =?us-ascii?Q?rEBhfg9/iS6YVmj7Bdt6lLkonnByj+hJfohf7YsibWHTMLV15xlp//uXvR8t?=
 =?us-ascii?Q?q2RFCs+8JX2yfaqtfj5VveW9ISSHFtN39Y2QiyW49wX1wMN6nOxfVAfIJfCt?=
 =?us-ascii?Q?yuSvCUsukUT9yGAKB83mh73JDmnSeGz9HyHXnRVSEqrq+xNM3LuhlxqikHRw?=
 =?us-ascii?Q?g2uQ7CDDJQlWU3saYJQMRjGonCIR69URK0j/Wlw97eszgG4o2+tGr+U5qNmR?=
 =?us-ascii?Q?k2TOWwyy5QwbEc5TuuJzZWE4WG5BVlkgwObf21EN4qABm73/wOVhpw1HcwzC?=
 =?us-ascii?Q?QADkw5JoKalpFblv+thOseWa3Cijhiw5ItPaE1P0g0WAwG39nZD3c0XDQ8/d?=
 =?us-ascii?Q?sCWGkWSnNO/8W0N/kJmturEuAS9oXrdrHuHUXLplPeMdLImGwcxEMzHqku7E?=
 =?us-ascii?Q?+kM96j51v/6xaRIcBv1bVJbaRc3DwY4E8Czg7ffcyhWDHbqSZZ4ZERTgrIoo?=
 =?us-ascii?Q?ny1z/7+x6S4ibRuyNOZb791yPGBDmq/MHgC8E6+E/jQNLuSzv0qjTNbnatKU?=
 =?us-ascii?Q?2AuXviQ3BDmyDaR9fDljehT+kf/Ik5L2dHd3vcBGGhBjrJhKVEO8pQQab14k?=
 =?us-ascii?Q?buKfPSzU2NI5SVtzpKCB9et9tqyp37Jwmsia6FkSVa/IPfQ61C/Sb4C0dRWz?=
 =?us-ascii?Q?446YrSUzun8FzUYDT72DaKF8u34F8OBZ7dxW3cbFUCfIuusw1AIB44jsJHqM?=
 =?us-ascii?Q?AnjuCf0t0GBT7obeLDxeNofkhqcsGaS+H5C2QYzpB2HKaqcwmUvIHJ9avdv4?=
 =?us-ascii?Q?MAcsG5QrB3pmc8lVvaMVkfmPgAYPcTlg2AGIlg6Icx/5tK14DDQjcricFalm?=
 =?us-ascii?Q?aqVH3ij7oHjty+DVoO7JvGRpK4u7nOTe8ULVKjTFFvtsNBrZnzcD7XK5P3qL?=
 =?us-ascii?Q?uugrolrpKuFIhcCbhc01mkiT+w1Y1Q3c9Q8v38DdR89oeca+bNUaxaFn8eX9?=
 =?us-ascii?Q?97hKDk4IqvUwlhwe35U+o5QsH5IBjhbz+xQajTLr8y/AefHNJSfo4tJ4D4n4?=
 =?us-ascii?Q?CdvbMsUhRIqvaRvAPdwq+qXIY4YSbg3YoqhjrF1LHj4cSB/eRc/QwOfbhNuN?=
 =?us-ascii?Q?HezXsSZj8b08GqK1FffadTxXk6hwdExsLejukZWrA5wfM22R0rojE4IH+qTx?=
 =?us-ascii?Q?5UMpV7NVB7Fs+atP8/TUQkCVkZwLb7HQ+5SyC8eU4k7y2EggbAdGEVUqRKlo?=
 =?us-ascii?Q?dOF+nOcDkq1Ro9FACP3vkHBTzhV5WWW5hY/YQn0I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc92c23-1619-4bf2-0481-08dd525c53bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 09:44:25.1588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I3XxDNq2PHm+pQyY4lPehZnLdNazgY4c7JRENnEyMLH8Jqc5da5IjJz+Aodb3L2aEKdF8r5mCVib2ipiGq7NRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 09:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211795

Hi All,
=20
QA for yocto-4.0.25.rc2 is completed. This is the full report for this rele=
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
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Sunday, February 16, 2025 1:52 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.25.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.0.25.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.25.rc2
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1022
>=20
> Build hash information:
>=20
> bitbake: e71f1ce53cf3b8320caa481ae62d1ce2900c4670
> meta-agl: 9a490176e35eefbb5932f2c838eeccb5de7c8b36
> meta-arm: 936c02ec13661bd86a05f7f90e1b920d5092d670
> meta-aws: bc3d881492006e7283b089141a1991daf77c6f62
> meta-clang: fabeeadc6a1cbf1a81fbdb7dc9fa4022c7e5e851
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: dc0948200594dacece4da91f4c501e9a9fb0394f
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: de8681b4a2a101b99dd2c48d89a7de2ccd9a961f
> meta-virtualization: b5a1645250c17fb657b7f10166f1c665ce192aaf
> oecore: 5a794fd244f7fdeb426bd5e3def6b4effc0e8c62
> poky: b5aa03f336c121269551f9e7baed4c677c76bb39
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
> View/Reply Online (#510): https://lists.yoctoproject.org/g/qa-build-
> notification/message/510
> Mute This Topic: https://lists.yoctoproject.org/mt/111203052/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


