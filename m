Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122F9F33816
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:40:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71231.1773736812398205574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 01:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OK8GYZw9;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773736813; x=1805272813;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=d6mPHivFqCC13piBHGfW/Wcp9LVQTVxEvZTn7NWb9ow=;
  b=OK8GYZw9COpO52BWbR6vtTAswpdza1UFGjQYGTj9o+btwYAL3fuCumMC
   dv+nh7mZJESA/C6E0357HEVUfl7uUvkOOrV/pRkMiBFaouoy7GuMmJ7Sf
   NbHZ48GkQ8hiWEFm04AP/O7gm3m8ovx0OQ/l4TXbylsPXDAK1eGXG/SbE
   gm23n5Ptya8iq285XlgQ68zB2iSrhv2ps8UDCCZGIu843/e/KG8Mg0B9C
   I1wuwrFCuEwlPp1GiWspsIXJ+A4rEGu3IMZGLmmrxRN6SZV34zIt9lo9v
   LWIZlBSxKP6i45L05FwI5NGxa1xd3rHals4VaNppmkLRncHptKiGhJxPI
   Q==;
X-CSE-ConnectionGUID: vLDi0yMMReS9V7KQgySVGg==
X-CSE-MsgGUID: vyeSKM61SC67OARQN8vJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78368459"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78368459"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:40:12 -0700
X-CSE-ConnectionGUID: /ksBRtV8T3qsiAKdG6nBWQ==
X-CSE-MsgGUID: E+Y2zJ1nTD+hNMl7esWS7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221227258"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:40:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 01:40:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 01:40:10 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 01:40:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiZO0oN/dnIcSZmIp10kHA2HH1aV6M2KVtIncGOFgQdyberfKRu6Mvp28Ecl74MAaZSkXE3/RXo7zTMLCB9QgHkfLbbiv7lZCya8vwr2WudDLYJRiww2EuRP2Gar5bCPtRF434ItAsxRwYzjD2vEpWAOer7d3YC/7FmZNjJsGyWOn5S64pkrsLrVRgDLd7xU8zXIKOocd8edcj0pyGnaZ6rs29q2IzyptRkIOM3QFiOyzLYx9+0y0M8zrJREMkcRY3gk24r3YfYv/hzBf6kJhA9vj7QfW191gq6mhxJ/q4jr5Cfy7YvcznFKVFDc7CA4rWCNps3L+bMm517SEEsc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2SMPJPOXb2PM9+UX9riMa3H+VYrpxwNIxp179o0+ao=;
 b=g75W3P0bumxlzks3Og/IEBnw2llPQJFc+Jalb9+Jb/lKc5PcAV0taztlH7js3t+RPFqTveHAbMGydZpdGaMnub3ocVp5j6JG3iaABcaFMEb3IrHf6PkBfeQU1R8Ev3hCiahEcC0prAdlyDU8NnZMdrivl5H9SwR0kSGAUDfZ4AY+7Qodxjyiyt38LSlvLlL6/95ZXUczsrJXc6FPHbNrlhIEJUyVH7sJ4uH9llk+sDmpVDCQArzHz4m/cox5tIWSwjROkT0sSdSfZ1gRFZMHkQDQGQD5I6uJ3IOxBliGCjAPtZ39W/TPkoF1H6qLpSW/rnC9scG7829PwtCEkwUAzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by DM3PPF4D011AE7D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Tue, 17 Mar
 2026 08:40:08 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 08:40:08 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto Project
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.34.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.34.rc2)
Thread-Index: AQHcqMRA2S33eFF4fkGyDHjum61dnbWa2cXAgBemXEA=
Date: Tue, 17 Mar 2026 08:40:08 +0000
Message-ID: <SN7PR11MB7018AEDD18C329A3D5596469F441A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019ca4cc139a-4cfb220b-7fdd-4ba0-8591-32dfcd501502-000000@us-west-2.amazonses.com>
 <1898F59571A6E498.558139@lists.yoctoproject.org>
In-Reply-To: <1898F59571A6E498.558139@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|DM3PPF4D011AE7D:EE_
x-ms-office365-filtering-correlation-id: 695e785a-7c12-46c5-9990-08de8400cbd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|7053199007|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: VXkEVgTSPmPVVMzOuf1fhO6oMKt5ojgYNDGRqNArpiixcq9FmZJMkIeadiMXAt7s0LZISwJ25EaF26XzxkzO4X+YeqOQi7wVrSwYqBoVDahmkBTDPtMQ8MU+g2QuWGMXl0GR+uu8VL2LOsetPSvTYlIFDSqQS5uVHJsrJRK6CaVOHDdrkXPk09KAF853zTryPnJL5C9WwAqC6K3pNRxAcxh1YJBHkbvGQZK2mKDjoI9ZDUDVKpcAkspbGloixllTCpojeYXjRcf6R+8ux65V1aXGaut05Ne7sDNaXrQzRi2zs/99kCSW48nzMWEStnPsUj/Y0d5zM8UlFq+6ANwUkIpBErAeSIYYcoReRvD3i6T60aVpW4+CKLf0ihGghJCu873YpS1ckI1oR4fKhqV4lSDDzzCK5c8/nRM2OBXuH8hHLtMcmWu+kEPq0YkI/xE+WvtJJAyNLu89N2ZcyJJQNJAz2n6JMMb4UmkBAgacnEl6ya9Yi4rwFNESrzfHpBY3YDLN0axgrkyWTlX8M72T/3ioQIto4hrw/ZBI/2ZrO5kD0a2txax2IurRurDn9DYhBl8ejxlLwiV9xyYASC0KbVJfL2GrbgCp9IypjxnjGWr0SXVvw8GpeXmWW6R5tGVgSqlK4RTazCib2dD2oiOjAJQKuXxHve6q5AdHJIocscO36hzlEboDBs0Lh4FE5jKtmdwf6eSsqCWSUVGZ2IdZGmP3ezCP7k3G4iuBoedDIBo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(7053199007)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iCcVh+D9m43LE0G60D11N0OObtQ4pK4/qEPzta0Kb91JGbeT94O1ukZrIv+x?=
 =?us-ascii?Q?a97UHY7EMVHJ5Fmg4I58rleb8A+oVh2Rv3pSPUhz/jMsoByQLkAgkOn3afK4?=
 =?us-ascii?Q?0/XzYvjAn9h7rPOqiiHv9l/DACrBRMtBa8Gii1jPqbvuA/MfYsOw5j9VDo0S?=
 =?us-ascii?Q?n4OPkuFFDulngQER1RilU0504LP5DZruBIjeKEyTX7hCblThufvPv+HzeRSH?=
 =?us-ascii?Q?MG55ezdUpNKPVhNXJj6jF1D5W1pz6j+7re89WZr4OyptfMYei877CzlpT1xv?=
 =?us-ascii?Q?+VEt4//fcgvoHJ68FSUKMcXXP05wCrOpefPJJoLNlrw3FuRX3uKF8dluiA5L?=
 =?us-ascii?Q?HOIqG+Lc9Q4X4lVcVTwng6zoxNBo0pgQaoMYUQVfRDqo8ke3zuNaQO+R1B+p?=
 =?us-ascii?Q?zFxoGTtIrS403B5dfXIqnSh5IJwPo2lJZb8yaWdjGof+Atx9A7/KfAefVFD8?=
 =?us-ascii?Q?mfCTd7f9S0lYgRog7U43fo2xddr8Rac14RbsCn+X/CIlSX3ulDCN49UolVYh?=
 =?us-ascii?Q?ggryC2T5lnPXc7e99SLMdtv4iOUoH3FFRvIj2izNKldA8aR6TvJ/GPk0hMB2?=
 =?us-ascii?Q?c6lyzUlDLfT24EFRgC2/OkhYd8apeosUnJ8VEWAUh92VWAT0n5RmpC3urPGQ?=
 =?us-ascii?Q?fVHtWSJfEUZjH7XVto2dbNMkyH7cKk/mwt6kF7tKXXWTAhhaabdrHPOJjQQp?=
 =?us-ascii?Q?iakkMzHw9HSJtR9Te7/qKMV15L6QN8P5HjEv4moaN/4nXtHYBKhhM9fNqnmA?=
 =?us-ascii?Q?Ojq3upSWVDY7Q6mn0z6hklfXjKeBQa3FkgtzIsV4RmRXnnJT2J3+1+dJcQM6?=
 =?us-ascii?Q?CQSvH6uhoMNLmyEPBzQlcawz6Bor8cGXawTh6O1W+gkSZb9y8Y/fz1jhUqI5?=
 =?us-ascii?Q?j+FTidlzdC3IIb69j/+usmwi9GlX23wdmLwVAh0nrPgCLwhI53L3HWIC7u4o?=
 =?us-ascii?Q?vdv3MTpgN335YQ602ZKx4LI5Zwlupl0m6NtP2QYhe6ITwd7Sf3vsYwqPXsZ5?=
 =?us-ascii?Q?9HOVIxkSeNHoUrHpnWKD3Q0B2gU1qv8gH3k0bzDi3e5WKKheKDHxa3XsbARL?=
 =?us-ascii?Q?6SibuwLxCNaX6ipVeP7u7w0uXMornFGE3S2Rulxp6tYy969ayPGXWsbK1LY8?=
 =?us-ascii?Q?P7i0BNZV+KvceGDKaTS4K0HtmF/br4lhRbNpJxgn0qGS5LRBibV6V+30APda?=
 =?us-ascii?Q?jIjx5vZnKlw7F6xdKvdtUq957Sn+vBeE7RLuyVF761d1ltl49YpdpZQ6u5kT?=
 =?us-ascii?Q?SIjLviTMhrXG2rEWSZ+39ahk11nf7jMC62qY8mfAtkxX5ZraN0R2+nWes9XR?=
 =?us-ascii?Q?tzbgGyowOfUWpmcGDp5YiYWSlSIh4MpOk7KPR87cp66mJY8fL6nnuuFj4YFm?=
 =?us-ascii?Q?a6nvFq5jnRVx4Kyx+POmadLZRnRZ/UqpJO/+gcnGJFZwQrXhD/LNsG3nrrGj?=
 =?us-ascii?Q?W+wsDbhkJBUbB0OCXgrklvJLaIbYBCQo2xhd/Y0xn5R+9f048JA7fcTW5KMf?=
 =?us-ascii?Q?9fX4twlbQAernccQa+MECnx1HMzp4PUcwk/AGvPo5Es/+iD1AE6BAxZUoeTZ?=
 =?us-ascii?Q?yi5avJF4f9kzlxzHxSf2iWnGwWKOBtaS+Typ8r9POWIN9AFGhCm+kY1Xr8EK?=
 =?us-ascii?Q?ostWgA3Po/9UA2fkON+aqqqfPvHS2JOsoF4ve4E12IUq8aa5fEfpOO7kxmG1?=
 =?us-ascii?Q?fBlpty9U2XGlA0Nrnl3u34HxYwC6lAtOC9+733/gnYUO061lMMvcx0e+Tya6?=
 =?us-ascii?Q?1Cqu+kZVRQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mN2HvXAvqRTqB9WBhYIzveI1x3xHHX8tDhzbxhn8TNG3CvtwhPcaFnWqzYgFt4CG+yNI8Fpgx9Y4Hcc+WNZlOO3NchOUlv6twoiY6Nq6S56/TPKZOF/uyVoq/Rqjc1lx8pywzQgve5VxyXcnVBB0RumWwG+MGAXvq7kHETnj5qG6QsKzPueKkAVGiQMaRIn5HnkG55jI9esq5vNoPI7JXF6M4A7pNdsV7t3x25D3/YDYvL3Xv/32QIZZXGLhjgirk/lhE6tGydBdVIFMkg+LKN72iu+Od26qbSA/vClr4DcI2nzowapPE05SShTiSK41TgAzSMI6jUJT0cX9jBhaBg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695e785a-7c12-46c5-9990-08de8400cbd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 08:40:08.7244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5PINJSVtyGR3XkiFGo2aCAIt7rCdkQj3uT9cQAGt8pEw2/hhLbZlr8EmJ9zyVk2FIsOZWh7E6j+xs3aYFzirQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4D011AE7D
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 08:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233305

Hi All,

QA for yocto-4.0.34.rc2 is completed. This is the full report for this rele=
ase:=20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

Due to 2 hardware-platforms, namely MinnowBoard Turbot - 32bit and Tiger La=
ke being in transit from Penang, MY Campus to India, BG: we replaced those =
2 QA execution-runs with QA-runs on AmstonLake and ArrowLake platforms inst=
ead only for this cycle.

Updated list of target-platforms that ran auto-executions:

1. ArrowLake
2. Kaby Lake
3. AmstonLake
4. Alder Lake-S
5. Raptor Lake-P
6. Edgerouter
7. Beaglebone

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Debal Ghosh


-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Ghosh, Debal via lists.yoctoproject.org
Sent: 02 March 2026 12:58
To: qa-build-notification@lists.yoctoproject.org; Yocto Project <yocto@list=
s.yoctoproject.org>; openembedded-core <openembedded-core@lists.openembedde=
d.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-4.0.34.rc2)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.34.r=
c2. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

1. MinnowBoard Turbot - 32bit
2. Kaby Lake
3. Tiger Lake
4. Alder Lake-S
5. Raptor Lake-P
6. Edgerouter
7. Beaglebone


ETA for completion: 16/03/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 28 February 2026 20:39
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-4.0.34.rc2)


A build flagged for QA (yocto-4.0.34.rc2) was completed on the autobuilder =
and is available at:


    https://valkyrie.yocto.io/pub/releases/yocto-4.0.34.rc2


Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3309

Build hash information:=20

bitbake: 8e2d1f8de055549b2101614d85454fcd1d0f94b2
meta-agl: 12daee6a859f48d3d65545d4fe79849fc312fa21
meta-arm: c3e9fb12aa31d25e33d8392c4a233ed1275a3278
meta-aws: 8f7bf66699789eee7afa907b9513b0709ef79a01
meta-clang: eafdaa3cda9000c6d9bd1819ffe1219c7b66e4b8
meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
meta-intel: 82eb2406e04a89d6ed0650a99ba13224e43e4f0d
meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
meta-openembedded: 8a598a2bc9199a4fbb9008a32ab143fb509a0933
meta-qcom: 8d273808334daef5922000c8e0548b7ff2b3d72c
meta-virtualization: c474ae21b11a816be607eb7b44d2cf77d1125bce
meta-yocto: 1d3874a383023a5e2433e0fcfd87ac5d1e6d341d
oecore: 7b6c9faa301a6d058ca34e230586f6a81ffa3ffb
poky: 8334e82e1d85e50557bd3da64054fc9e3eafc495
yocto-docs: 7c348dd67cfd169b1a56bf969606b03dccb76c56



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


=20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#665): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/665
Mute This Topic: https://lists.yoctoproject.org/mt/118061580/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



