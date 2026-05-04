Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DB0CD342C
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 10:06:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11464.1777889210923944335
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 03:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=HHhI/2jK;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777889211; x=1809425211;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=MioXT7m1EJTW/8o75F77gv9DujaO8Yr5ShJ9SUfP0mo=;
  b=HHhI/2jK7OARoYmpYuBBXLbbIKJ62Ap91Cs1PWQ1fnlu5LJlTKLzg4N9
   zlQHdGM9XzZKHm3Ze5z1go752+P3pC4gqmCKIbkjLoVv/8tMeHark8JrD
   mutLrFHbK13EPIV8e3W6fKrMbphWwxzvqhZxXh8XtYJKAopg5Hkr9Xdx1
   a3MNmqBFFTtbMNqrKVRgytD+nVw1UHxU4YtQrmUokylWTTFepVC+oZUEq
   jXc6YdIC16d6xw4n3WcVKk2hKnn6KfuwdABY5vCFQ1BLLs7HBcM/smdLV
   g05T6SYHp3FeKYM+zv3PDkf0e7IuIKX9fZjKLA4es1HN9Tvzecldm65El
   Q==;
X-CSE-ConnectionGUID: plWkZeawTwOzu749XE3DOg==
X-CSE-MsgGUID: fl8WoVMZSBumi+90bJZbuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78641954"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78641954"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 03:06:51 -0700
X-CSE-ConnectionGUID: mAoiqst1RfqwTABIL5t5mA==
X-CSE-MsgGUID: 1xONRWCdTBSgayE+/m+SEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="259122112"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 03:06:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 03:06:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 03:06:49 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 03:06:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G81ZJYpAJf1j+jBhGD1iXmEVnFLsncydUwWjISFkXLbxe5jH+B7TQfeTZcX8vnedN/fJ1OWcRwV4myrSS5B2dt6nW4GiSKLlZneFTkQJ0uu7o1lWB/KDsEFVFmKT8nskKgvUz+uuFsdgegTgxpSB6AETpFiulxULmR98Vs8WqPqpW8gKxjSf3oCpClU1nhcoaXv1hIKpUa3A4+prHooNI2NrUChO+NVbRiMGdJlNAPDKq/ueqM91orw3XAWbtTSJJb+8M8FVhI/EXq9ZtwObA2Hval+Sagw20doI7xrn0fasfd/laB4bYOlRt1Yrk6I99/d2uVDs6sSyjLb+NADjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJ9Sv8u41X1L5YfpiFNYpJjaIdo+pU871cDvl4AygoI=;
 b=TnaMIsijghrNwGfEpKb4lmwr/2z9axj09cORV7aK6VeSnZVDgNzmt98eW0P9MPpmnqkRovXkKbfVI6C0b0gplS0vuNwkefY/5V0PHboZ2rNdjvXLnvaU67ERKuI4yGY5m4taWgY7gj8e4R7dh1UVfCUnD1DJJ3S1uMNOZ8uDEjYYYr9z3OC6wucC6J9XqfT715lWKWZf7BZIZ/ZlL8wMK0EUrG0jSh1QOVVDR3zBSiYgUE/IBdymT/8+v+eXweXcBX1mpBz/HzE+RnFjUnzM/w3F0Imy272JmclTw3wLRmGdhA2lXabsJ8blrSsbrQLo2Yd/SPozgnhjRU3gjdvbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by LVUPR11MB9811.namprd11.prod.outlook.com (2603:10b6:408:39c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 10:06:47 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 10:06:47 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto Project
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0.rc1)
Thread-Index: AQHc08RnuT4XEGSIuU+Sb9Q1alIfHLX3MFmAgAaDOiA=
Date: Mon, 4 May 2026 10:06:47 +0000
Message-ID: <SN7PR11MB7018E65734E1B2F08E1ACBAEF4312@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019dbe9ab5c7-d6cb6dd9-d52a-4c28-8ce2-236bee8e31ae-000000@us-west-2.amazonses.com>
 <18AB0F792EC896D9.1969750@lists.yoctoproject.org>
In-Reply-To: <18AB0F792EC896D9.1969750@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|LVUPR11MB9811:EE_
x-ms-office365-filtering-correlation-id: 53c1ff46-9868-4f62-c5bb-08dea9c4da55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Z8vJOE7nYo7V7vIN6ASZOiyd8BjGXpOUcL9sOGl9HEyTQYITBtdrb1HsGUfNimA+8e9jwQLhbBphQJ/atoT4HIjwx3LorEIVlSuY16PHgnAOo2V9XcYN+Vh0Q1utWy2EQa+ceZWmhEdsLpuClEVpxl20h14wLOjyEBwHs4F4xdLGWguihMBZCBP3FNSsLukg40AmhGXPp546k1sEF1BKcuTyMPSwybl4OMCzYofF6ZIJY+WlQcWUrK9Ff5P/Imn2zoS5MuqMdbo+VcAElOwBiviwuVVjGcybwO6PmG8xIrFgLqQ6nvuWTlYAv8tLgDEAUTnlmCRNgT99loAr2mXEvQrHHbMI2tyOV80mGirLQPeDozWF7yvDLxtWm4se7tyXcqM0SS/9aIuqiNAp5HQM0af0LUqpiT/FRletcILiFlf9og6/7jQG+gJpFpCj7BwD4DUnkKxQJApTNptEwVQji55ftt2Wd0GViogiza/CnkGpWWvr/eXygoJrOyNsyFI7YGew1m07htfWb8nbEhtUWeelazWd6AUiB5d0G7QVZvr6TTPZrApklWHZd/coErrkh0cDkPVCiUwptM6kb4ZmVe0yap5sdC3X8VAF3gJkDROtq8vp4x6RfqCQ5UUQa9qWyHrPbv6N68KxE99ROSG2Rrnc4dRxFKfGBql8RhBziB7K7ZtdLbWmz+EGbA694uylby+aTMlFmgAziSLQGsrKdw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S3rSul47UUxqpXa0SKCW7FMgqb/Ql7tQiZV4smeU6sTM6RvSObL1w5cz/upV?=
 =?us-ascii?Q?qGrzSigo4VGzA2mE1d6Iex91UDIGqaghd7DRM2zrkEKCrYw7Q/geq9ishtbk?=
 =?us-ascii?Q?yio8+SCPAseClyicAT9cRRI8KjB1JuRqzhAlyA/BqwAIZlsD8/kHEkC+0P9m?=
 =?us-ascii?Q?fG02fkEtJ1qs+PJG3IhMqDqGdwnctm9Kdtk9Uz+PnGGwEBGu4cZvcpBJYli7?=
 =?us-ascii?Q?9vvUJIk/SD5hOxQLt+PmZ6IIDWzYEjRhp3wDaomeTBAchGT8DVNdx8lyygYl?=
 =?us-ascii?Q?szKUWPkmCEmQKIR9kM4JVv/t5OGtxZxlRXuWhQFiDZi6HGYxHOhI2Gj6c1Sm?=
 =?us-ascii?Q?JVO+N4LGdFjZZgHhNFLgS9q9roOtpdFar6/LTrCPsfI1WNN6IN0rLIr4Kc00?=
 =?us-ascii?Q?CMmqOkMLEHkFYtm/r5cvVjnFs8yKdAGaxUMWF2gl6bHOq4fnSTTeRIZW4rxd?=
 =?us-ascii?Q?PlV4CT8i9ti1Z09Rovz3P+DZT9X+7O5x2+rXVgHJ90uWeszIlA2yRvUYGVss?=
 =?us-ascii?Q?MFfdeDByfFrQ+fh5V47APMAql0PaYW35rlysbHMfxWEu3VpT5xHJrwH8bbBi?=
 =?us-ascii?Q?Nt7v5Xw5cAtFsOXE8BXNvH0d/nOvWR1t8JYADlHa0dXXdvr51+1yDz1fuAZt?=
 =?us-ascii?Q?lrnZq4SDBc6PuyPegrveBOXbhm9pXWNi+9HKKNujuRLvRBepZrpo+iT2Es2K?=
 =?us-ascii?Q?2+Ucz92k1cJGkOK3er5t0Ps8mGD+6yRNPSdzLEa4HL73LGzCelNFvFdOA6w3?=
 =?us-ascii?Q?CgQk5+WfnGmISfbbGe61eB4vEYb+gHYZaZswcxU7Fih5PCj49IhvbGIoChNL?=
 =?us-ascii?Q?afcfl+zgniIg24pDq1i/PGuLBIF8N0X3irZR3X0t7gMzMMhCFf4zqv/Dsf1w?=
 =?us-ascii?Q?9p8qrfa6boYtTLVNmx6mVvB8Bk3z58zdHZjKLCdJNrfuKHtCCs+tzuzAta2L?=
 =?us-ascii?Q?w4uA7BHJWpuY7Mtka5LlpiWOAJNVXrECqpBfaasV5nzX3hVhBXr93to5kbWi?=
 =?us-ascii?Q?hg2JgDiJLuxgOhxNvwz2JAb6irIbWGIcgsYCjoVXTWbDF18D1R2T6sbAbcUj?=
 =?us-ascii?Q?m5P+pVGbPR3nJPUKx7gsWtRY4qbR+/T6zcwkTDNmgOwVgwoni2623zGa6ONN?=
 =?us-ascii?Q?4KJfJZ7rqVA6ZenXfIOiiGhL4KqwieVlwiMiWo9BGlNXI6HQayHeOma0JBIL?=
 =?us-ascii?Q?bNNFIEGOISejj9wuMdHAqrbXso1bN+Wd1uFQhTtIsvHYIIQW0F7yix+ATowY?=
 =?us-ascii?Q?Mz3INaySR8Amcb+ciAnqXkQ3BKycGz10pw/X09TSmC1HF2jD/oiV8c1OajYU?=
 =?us-ascii?Q?+5SkOiEco2mVI8snrENu4HrTZ6S3c/KCA2h6VwLHqg207shQZvhzVHv6AWIj?=
 =?us-ascii?Q?gyskxtAHZOoWUFtYlCyzECmmGlpVrpxhgv1IfTJkw95J8Tyrao0M+TZvnaz4?=
 =?us-ascii?Q?NUN1KBRGI6AYL6yJNETWS2hiDd23AZWyhe9m+xHLWfZAuyCuPjlcjC14BoSd?=
 =?us-ascii?Q?KtzlcpwSHZ6nQxouZVnsi23/eQ1RbFNi4prUjq8PJGsX5WxHZoNVbT2k0nuc?=
 =?us-ascii?Q?UaRkOJiiMkuEIy1IkbQ8XPje0LZv73ZP29uoS0QHMBpJEgrIyU1aFAQnysJx?=
 =?us-ascii?Q?A3xVgZp5PwsHruqPygmcaT/3ydJFX+P6MBBHkatLX1UWqeoRBm/vbW/9vZyA?=
 =?us-ascii?Q?lTS8Jo2+e0keNy07O6OIFVZ1TDdhnbxFf/EHhrNbfgNIZvp0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Uu1bayjo71fWoxdwQ5YQyxxQbG++bK7XL5Q5KWvN0Ww7tXs/cDwyANu7spI6gvZYB/vVYzFYow9NRnESO0yTo5g9NIPRgaCjtQ4fS7fTf6g9k8pn/JsHnVyfm+hQmMAUufiTC/Y64wBrunCGpX9Cc2ttnpBB4TFUHmZs2oL0Bh0+kkDkykCQ7dOLo6ZDneT+RUrtga0OofTJAYpgSDEUmdfPZGbRY8BoiHmwN4utzKWKrdCebal4KUCr8IDWBUNJh1XEF7hJ5GvtgHdOM0TauMkVlkiqR9kotlC4KFh3Y0JDfh564i8bgk6Si97wDszH8Jx2t82SVixveoNgV+Kstw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c1ff46-9868-4f62-c5bb-08dea9c4da55
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 10:06:47.4295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u9Nohx6F4mOYNlGp4Zn7HprGg3MBUbrf3oTugymeKip9YhGoYN9+XejPw9T2y29WqrhiMJl+6COfVVvGkCuKHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9811
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 10:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236446

Hi All,

QA for yocto-6.0.rc1 is completed.=20


This is the full report for this release:=20
https://git.yoctoproject.org/yocto-testresults-contrib/tree/?h=3Dintel-yoct=
o-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Ghosh, Debal via lists.yoctoproject.org
Sent: 30 April 2026 12:15
To: qa-build-notification@lists.yoctoproject.org; Yocto Project <yocto@list=
s.yoctoproject.org>; openembedded-core <openembedded-core@lists.openembedde=
d.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-6.0.rc1)

Hi all,


Intel and WR YP QA is planning for QA execution for YP build yocto-6.0.rc1.=
 We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

Alder Lake-S
Arrow lake
Bartlett lake-S
Amston Lake
Panther Lake
Twin lake
Beaglebone
BeaglePlay

ETA for completion: 4/05/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User
Sent: 24 April 2026 13:58
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0.rc1)


    A build flagged for QA (yocto-6.0.rc1) was completed on the autobuilder=
 and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3727

    Build hash information:=20

    bitbake: 33581c84f3a85008239acbd940501a35de48dc91
meta-agl: 335bfb321925d37675d45f0f869c446ded8972ce
meta-arm: 8eb10af8092dc3fff86891339fd024d8583f457f
meta-aws: fefdcc67dc3a86752a98d19c96d64bcb31928002
meta-clang: 78c5e12f08198f4f257a9348516d2103cd617c1d
meta-intel: 511ddb7ea90499b2088248f59bab3e9d6f3c900c
meta-mingw: a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315
meta-openembedded: 76700b6eaf327bb30e2c47b78713e2e409cfab7c
meta-qcom: a9f20e62e569c232dc1aaf8a90a6343e504003ef
meta-virtualization: 2e0704ee9282e4e86c13180334cb7ce118e55dd9
meta-yocto: 904846ae078ee20de073040ebb77c86e19250f56
oecore: 42fa856a00ac16b2a7a83d7ecfa60a5be192b16c
yocto-docs: eb74fdfd9e5e579a65e8872d1a73b51e77b14f63


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#705): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/705
Mute This Topic: https://lists.yoctoproject.org/mt/118984556/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



