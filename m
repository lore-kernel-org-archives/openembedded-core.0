Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085BCC87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 08:52:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.web11.83265.1754038357097584024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 01:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=UYsLjXj0;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754038357; x=1785574357;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TAY1lDfZ9CrHqVs3K1ylJytZvRPw7vNPThlIMfBIaVU=;
  b=UYsLjXj0bbUGE/1IOrm7DuuMWezghoEOD3WJiV5f38bdPmQU5FUIH8Lu
   bFmllpT6UsO6j5PMAXEgGzZdBvC3DEkdJsfawwjvEclKh6FKRohOi9IvY
   g7NUJ3GQ76dE9KpY4gzcw2Tm0JfxPfvGEWCE6FPM/jqEob3+l2b2GrNaE
   0Qh8J72ThW5JD/PR16zR8ZPq3REFQA+Kn1gYJlu9eimylVdpgueGWCPqH
   OdHxmMbywsqeNLhJXSkox3Om8LT1eR7/D7/fceicTlALw0JwS98dhapXn
   ZfEVr8xREpUHikUk1Wnx6y6x7zfVuVFRy5+aeC9ytq99eRQrPs+uXs+vy
   g==;
X-CSE-ConnectionGUID: xw0aTckITuC7uW3bFhlYQg==
X-CSE-MsgGUID: RvrwW6hdTa6lpxyIQh9NXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56082111"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56082111"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 01:52:35 -0700
X-CSE-ConnectionGUID: Thfy3l+ORo2RPFvGMmrbZw==
X-CSE-MsgGUID: 61dJmhP+QTKAj7Wm16hJFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="200661713"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 01:52:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 01:52:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 01:52:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 01:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ov/rpFngh6d1iKwklvLAurPAUTg1739jFraqcy+aVFjPmFfSkOSWdV4g6c7hAIPCvKek+pbjHuZZ+E1Hr/5VON8BdhjIR0j4QImTqKV5CPpmeHjyokvq4vaWfMY5iW1hokQLMQflTA3ehzxhz19n3jclHt4Ls7NVNxAicbi7fjiR/Pz4qAJL7yDgmolQssMfmpk3b0K0xcrvJMz/5/fyViqNssoq4FDPdJfxYnx3Q6RL2L6r6oRJw7Yxk6BS/76NYDmS7UdMvlVAkX2rvwdrhysVzlVXRScKjQTV+bHbZLg8sOw7e240FfsypAZzlGkDq8MyMGJfU74RaZ5Rs4j8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVk2lLLzcT+j3j+ztlZ4ieoSBN0RQOxoJ746xYig7SA=;
 b=hS/gH1+OCrhJGNRcAyRFxCfpFJ6zULnBaZD+i6G8zqVN5pUYYNMLLiMvGJSp+sfyBBrLoa1a0PROEiMo5+2nl8UOYr3tbzRbFobUsoDDZG0ThS4tUnCLeTJ7gSOL/XVp7NpjYb6IElc3h+YWsmBqFwADgo1bFG1GEX12H8k1Q6zeQn4B4xxmcocH69dy3lF+s2Iu7bn6U5ZnEYRXbtPVHH4+4jxKOk9o5vtw//5/in9n8ybjvMSezgkkgYY673ZBB1iWO/z7XvrBlxzbIAQydeOBvsC7SGFPZYYBOIm77Z7vzauWKYtSYLueRF5xSlXPSKb/wBi62JH3ANi/orFUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 08:52:19 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8922.037; Fri, 1 Aug 2025
 08:52:19 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3_M2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3_M2.rc2)
Thread-Index: AQHb/K3mt7jVEjWv002j9oYhMiaPHLRNhyTA
Date: Fri, 1 Aug 2025 08:52:19 +0000
Message-ID: <DM4PR11MB77609CEA639CC10FD0B06288A126A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101983d016e02-c1eeaca6-a9ab-47c9-88ad-b4853991430e-000000@us-west-2.amazonses.com>
In-Reply-To: <010101983d016e02-c1eeaca6-a9ab-47c9-88ad-b4853991430e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA3PR11MB7555:EE_
x-ms-office365-filtering-correlation-id: 9cb66ec6-c180-4c54-89e6-08ddd0d8b94d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?rNDMkg7KvN3N828Jb6hsClCNEYuz0aLK6vDUOL7T74+CeJQRQQweXLudsIj0?=
 =?us-ascii?Q?lryIGFAiqhtjTM2mk1ok1gI325BjEtVqIEgaufLXvvsaryX7UGcx67XHUFM5?=
 =?us-ascii?Q?UsmEw4ZtFhmXBQYUhfVArdVykQhNjVJsz1KDi65U9I40K4DRrS/BObXwz4bE?=
 =?us-ascii?Q?eScG7kezKXqpCK/+8QeLDqQX3d0aEvXXHumg6VszIY0lABhhgD+bDGuBzu9/?=
 =?us-ascii?Q?F8i+fYwnpWS8EBw1PP9mSNyq7vg4HX3jNdmAkm5fnAHx+BkdcFryvTTrdKCS?=
 =?us-ascii?Q?etIrr4B9N8Af3HEMPhkoxAcihyO1RO1tkL1/jO787RaTx0M5WZ6V/LYBiG1/?=
 =?us-ascii?Q?aoDhO933r5XftZF99LjUqiCwfLn0DEZ0hVuuFHL8VawZ/poqzYkdzCI5u9Gn?=
 =?us-ascii?Q?xfmntA0zp6ZflN/r94ZAY1v+OWcXRqLIk0yBf6uWhmdy+8qei4sT345SZ4Ex?=
 =?us-ascii?Q?MDKa1ogz7dzn53TdEulj6YZxco+3WPIhTcD1cTG/zEsRQiWJcbIsYxjDqWRa?=
 =?us-ascii?Q?Z5XRhO3R90IrlVhkLAGLyBWmk9U4grYuNoCFs3gOGR2H8I96+FZN/losQl4K?=
 =?us-ascii?Q?BM/3sr3tNK01GcvPWA6Hy5gWciug4wnYnJvaN4phYDHQ1EGxPRqNf8W8ooEe?=
 =?us-ascii?Q?G0rCKY/5uqesRKgZCxv1xGlOk3DsNiK7PBueot6ha8QN3y/cskuXwZZfC7sU?=
 =?us-ascii?Q?TK81uuEZvlxqUFP/iWcA9w1vRJ6JkMRLtobpG1qv98XyYUr8U08tsQ2zUmWo?=
 =?us-ascii?Q?7T4ElMm22I4xZLkOKtDE/M75i8A1bxVwDAU7qjZn5Mp0n8Kxlg/U1p4yXRHk?=
 =?us-ascii?Q?BRr2YmLoHohO4osPCRxOseJla0VA0apWF1VcvcaqZS6v97KNUcprV1rrPz8n?=
 =?us-ascii?Q?NluiUTlKyw0khahskpwaeF6z/e0xucumaaMkhzyFhGVzZIeNeE1ZssPGTm7P?=
 =?us-ascii?Q?pqp37XSYWXujYsyRiRh+jIGYOARseIAyTCZH2xVFtfmKu8z7gu1fExgRfbzM?=
 =?us-ascii?Q?PGNUC3ZbCNP6MVq44kyXJAy6Y6vXmO+jzcqG/Yjz6xxxMQ7gC0UslEhu4r1/?=
 =?us-ascii?Q?GG7EXsH7ZDkTxt0HlTlbTXdlq+1G+Dxt7/QqCXpxZElaktzvAa83u1lGq15P?=
 =?us-ascii?Q?U3DWGW9qeGmsEgyqOBrNkw4CctZ5ryi/jboHPYtH1VyaoEFKcATAhzlWf3C0?=
 =?us-ascii?Q?9w9jKQqf5tmTm9cFxhm4h5iDUIZ09lYjLiG3q9twCxXbWt6e3FMJDqbziKOr?=
 =?us-ascii?Q?tnGkMWwBBVMZNkRQ21sBdQAeticSgCvKVljud/Fl6A44lz+JUs6f2UBOdQy0?=
 =?us-ascii?Q?A4lf6qrW5CzrLDU9xBKghnnmjfVMTETc43vTo46WpGWpZkLSU1BVy+iMF5/X?=
 =?us-ascii?Q?pv4isEKHY66lFsUIAINbctarvO3M+m+uK4dOINXTp1hscD1gm8VVPUU+BOBR?=
 =?us-ascii?Q?GI8lUPI74IA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700018)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nZq2iEqQM5gqIBgdjRKZq6zszJW3lCT+tvciqqJ6aE7h0+dAWs2NL9engTDq?=
 =?us-ascii?Q?l+ylBdIGh5eM8QW0HuWcbXV6thFsZpZc7JdbRRtN80DiJ8oTI8916riMR+wX?=
 =?us-ascii?Q?zh5IednqvfVU9LM4Yc3yeXk5s41xQYOBfXknekj8nwHDkmEASGvAj48ss9LO?=
 =?us-ascii?Q?CEurneQF2StZD9VH8UBxMkt3ra1dzBYRTQDmH1bv7dkwjHxJ6NgIWqbYjQfu?=
 =?us-ascii?Q?6CIXhDAVRr5SefaxzzWa+hn8LBUQ/p5mPliUBjzmf1p9rNFMkR6Ff5EwbVE9?=
 =?us-ascii?Q?Z6p5SromSth6XEkdX+GD7y7Jb3tZ0eOVegemw44lir2Yqc4K1Di9jadCibQM?=
 =?us-ascii?Q?oFnnK4imbyLsTxTODR6x3R706HhKC3QQG5AUlotiC9G5BIsz8rvFsykeSDh+?=
 =?us-ascii?Q?WzJvjekQ+R1Q383zTUmzoIze70cFIVvz2pBwGJ+cYE3Kjah8UsPyBGuZIwoK?=
 =?us-ascii?Q?Y09Mgk7gPd+4JcOqbCdFq3uHXT6zkpCU+buj4Y/zBSZi4ffjZBfoBslPTA3+?=
 =?us-ascii?Q?ipC6e6Q4o67xdeXOUS1rBx1cLyZpinllTO8zLM9xRCcySLdI7hK5LKZRt44h?=
 =?us-ascii?Q?3fkjzzswyLPbKK//+ywWMJzgxPqLESlq8UIm9fhiWU0BSZYvQ+VUOf/C4zvK?=
 =?us-ascii?Q?XbgDwMwDSHI/R3sS2pJEXNfPfyI4oJu7ZC7U4wKg/wqqH0rV2JgcSr8tYSQC?=
 =?us-ascii?Q?eDdYS+k0YrEZHgq11kazQPETI0+14GQWKZCADixgM/P01P0PyZOYtoDmsKd4?=
 =?us-ascii?Q?e+WuzXvJOaRFQ4uOMLU5VmHBs9gXj0vH1mWpbD7TphkEDg8pXLAosUjWUuj5?=
 =?us-ascii?Q?g/eny7RS+RTRt+JmuZ/w/t6hRsHrv/jxgreVBf4XoBUNBrUzcfK4gG2OcH5k?=
 =?us-ascii?Q?k25q2ocuNx1/13ySsq/cH+fwCxmsxTDBU1IVAxnShE14WRCzOnpo/DFy23WN?=
 =?us-ascii?Q?qo+osFotX0mpfOG4rZlSqQBZKXHghczUSK9EPnSh0DwWHMQLd1Nf2fy/WXp6?=
 =?us-ascii?Q?sIq2bl9aBu5sN6sXFCRzw5c36xobOj1GKIOS0v7xhAhui4RxcO0WIhVEZ/8u?=
 =?us-ascii?Q?OwA+4Hks5SLxyKUeXX1gokam5ZJfO/Slf6e+Qf1zWIEXSTwipugCs4ZIESfb?=
 =?us-ascii?Q?yaZV03t0Zo4VAgneFwFP3AdAuFYIgXBXSe+o8W2gmS/MF0EMWZA+WTp7KXcD?=
 =?us-ascii?Q?ET4W02IZwftuuakCfKCARA9Tq+sM2ioWkQ/O09jyE4HvFBABpE5m6xQ64f8h?=
 =?us-ascii?Q?Abnm+IMUit4+YEHLMyTa8YbTulpLcyzx07YCx/teYPQwTAviEvEeLtaW8iU2?=
 =?us-ascii?Q?1HTMDpu0FsXjZ7cLPnNYghbQ6l3Iv74PXRKagutJRfY5UOgr04GuzQtC9ejw?=
 =?us-ascii?Q?4tNoOJD4NPc0mOwg5B9XQ6oQiwI4NEgFyJtAsfKuCzGlPBP2RQxhUZk+DgZG?=
 =?us-ascii?Q?9JgyKlowoMAnyIIaPfbFZMvl4yqO9/RxojpXv2wRfk4xQRw898rrRorwqCIj?=
 =?us-ascii?Q?r6UPbLEp8kmRdATQO+GxYkeDjelnx3pXpCFneQiC8FbbvqXd119+hfMyOEet?=
 =?us-ascii?Q?xY957e83QcRRRHjLwvbK18FhxwN0GG3w2+dqB5Sw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb66ec6-c180-4c54-89e6-08ddd0d8b94d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 08:52:19.6638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9Rx+C4xOzc+V1oVYwamlW9Gb91W2gqCOQP3dUxn1BUd+dHwi6/ce7ZIeVL8Pebz6ZhzcAStoA74t0QaFInDtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 08:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221223

Hi All,
=20
QA for yocto-5.3_M2.rc2 is completed. This is the full report for this rele=
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
> Sent: Thursday, July 24, 2025 11:16 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.3_M2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.3_M2.rc2) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.3_M2.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2081
>=20
>     Build hash information:
>=20
>     bitbake: 5ba7c2f0797a72536a81f57276d4e5c75f23011c
> meta-agl: 5df5ef43a26f441d8434ec25b2824ce1b8e9dfb9
> meta-arm: 77ba0e68e3d6ffd380346c616a60bf0c7e35a08b
> meta-aws: 7e2eabe1aa248cf3c6a69621cbba40343a2e0896
> meta-clang: b2139ae4b027cb014d0137de0b46e9197a10a4db
> meta-intel: 7fc52266ae25215e0d510a792fa3a688d173d1dc
> meta-mingw: 3b92f104e024bcb1341b563f396291b41786cc38
> meta-openembedded: 714b3adc3a92d42370a0ea57a9744ad2d031db7f
> meta-virtualization: 9b034e3defd4aa1108d7a6b4dcca600d4352b132
> oecore: fed2692c4e7b87fd2bf08a5abb4391b79bbfc982
> poky: bd4625cd4db0f02162092d85aeab3023914f768a
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
> View/Reply Online (#579): https://lists.yoctoproject.org/g/qa-build-
> notification/message/579
> Mute This Topic: https://lists.yoctoproject.org/mt/114322587/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


