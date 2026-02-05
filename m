Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38CBEC1E9D
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 11:15:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18334.1770290140869291737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 03:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=cba3ZXr8;
 spf=pass (domain: intel.com, ip: 192.198.163.12, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770290141; x=1801826141;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=J6aZK6fM9WjITr9aKxpbdCkZ42qaUqz/dvdm/FAUGnM=;
  b=cba3ZXr8GYZfehevubXndukccdTbbL9pbYCeYUkSDxQYCqgYoRwZ7gbd
   KjqpO1Dr63sXuw5lggJpFLl5g6n1P3CdXBrb0cZXfIWc9SQ1REfyRwEVE
   dqAmURYxxSLHeb5VMvINvDK416wYSF7MLhDr5rd+/0rHDMYVp24cQH6Tq
   xtoE+XDUXcgSGfa/Dwr4RPC97ZGfZZsEcz+jmkDYubwAs+I800xb+Y9ki
   EXefS7PvDFB5tA+HeYVR0o5qH69YQCDGwxJ/lMd+CgjLx1gMsrSLdx9eI
   X3P29eUaSwXt6ZkM1EcAtjyEbbFuYJtYGCtGdtZpxbsB1vRNqfGqJXAmu
   Q==;
X-CSE-ConnectionGUID: wZ8y5IYxSXuVwzyBULCsjQ==
X-CSE-MsgGUID: 61V3BbulQOqRUDfTpMrPoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75340379"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="75340379"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 03:15:40 -0800
X-CSE-ConnectionGUID: YElIlqKxSA+VDe2jqeYjbQ==
X-CSE-MsgGUID: +6t80grvQDeiRekVnN9x8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="210293249"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 03:15:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 03:15:39 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 03:15:39 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 03:15:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlM5xGqo4LLcj4x/d7w8ZXWmbqIqDyE3qTakSdi9KWTlp9X3k245w6/BFGC61L3WWRpg9JyS7agohoXc5vKgMntDLA2i14uZQtWzKjpY71xz4QfL7FTQ4UBVTmjEHSbubQCgHnaVIs/65PIkkye+FNKH7NU37zQS2KCfjtDiV16BeQtdPV7BNIidHK0eVBe3pTaC4qnaiJgRkfaVsPhxJKoDeiCw4qQQnAf1l8BpMythXa46H3idD3lt7a3AwOF54e//N+npIsEArno8WAt+yQqR8Z3+BvClQszysYOazY4mVTqyZNC0ezHmroZ4YSZc+pNSgqabiH1LvV1bbBx8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNpzX3R43LvlRlQp5SU8a6Bg24+AOKmtPd1LFvsjgvM=;
 b=s50Ek3PNuTFNFkWGdB7Vf4ybXrd7Y0OQ/9zcYxgVWFzo9sbPFn1WJm0MpzD/OJlc3QYruQs4Bg6vd5+O9twGgIgeWaAwi/Ye7g4KryswE44NlnW8F8LN3mfuemNputj96EzLKH1qrnKeVtdhdQr9Kiw2SCY0aViiiwobhXfFIyRKpV4/b3+lbiGtMJ34OJ1qdkWm5R3K24BKIoCnOpuYGduEyd9/Hma4SNylk2L7uTI+ydxBlIPRL1zlmgZAEzXCQcfTKC8/ZDbdWBWVgaGnPtXZwkmWrP2E0w3ZVo+SQR+myp3IL1jnh17JACGl0bSzCunjoMRMiBhs+P9g2JovHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SJ0PR11MB5120.namprd11.prod.outlook.com (2603:10b6:a03:2d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 11:15:36 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 11:15:36 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.33.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.33.rc3)
Thread-Index: AQHcjzABR93D3Nn3YE25bGpkQZZ1W7V0AJgA
Date: Thu, 5 Feb 2026 11:15:36 +0000
Message-ID: <SN7PR11MB70185769802F6C1243667004F499A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019bfd297f46-e2a1665f-20ce-4d02-971b-927affd30204-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019bfd297f46-e2a1665f-20ce-4d02-971b-927affd30204-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SJ0PR11MB5120:EE_
x-ms-office365-filtering-correlation-id: a9073dfa-751c-4cd7-f8aa-08de64a7e319
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700021|7142099003|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?taVMuRogM3vZwYP6iMVn54+qlTEFWH9JmSxfk+ytn5Y+Zd5m0BJj8UIdxx3K?=
 =?us-ascii?Q?vpG6xE4MOaNCQrp2yQW3ByIGpXavsZHl5vIK/wIFcQDWk3p3cI+m2gqli8QP?=
 =?us-ascii?Q?ao313nhQ4FRDG0S3S97KoV90RzQPfMNKq5LV8BjStHoTGhVIG9HhQc00Kw4v?=
 =?us-ascii?Q?DNn1InO8XnvCB1P3IwdtGYaBgBT/w0JeVCJ8a8E88Zo1wVMXSgnSqbgquuoR?=
 =?us-ascii?Q?T2aZ5orq8IUWvx8hMFSiWw2pZN9B97TYs7AVhZj6KoDvUCli7n6HZgKsUf9w?=
 =?us-ascii?Q?Q0B4SvrTClKvkGMxlwrmSbpnFbjMAN+ad+AW+sTbk9sViG70V6MlCXELKqPk?=
 =?us-ascii?Q?JZAjEDgms3xnfOzBa/Dl1OQPe/ue4MUG2O9KEA58JrMlNcCWEmRJZmAl7ch2?=
 =?us-ascii?Q?YA/Q+qK82XrJ0LtFIpMC0OlHOZ2UhEo31Av0qFMAjzg640HBnAXz+TW1DkFs?=
 =?us-ascii?Q?wUu6HoefkWWn2ORiGrDIiLNyqwkkv1M8d0qizAu1+Jlta6cUO+K9DrSUdMKC?=
 =?us-ascii?Q?i4FhoD2Ow685blm9I11mHRbMjzYxr4py60X/9xQMcDQ9tLE+3oqSpK02pQJO?=
 =?us-ascii?Q?PTIrPR3GyV9IDop2I4zj/GHnpt+7b5+uzs6FY01x3OzgX4wGeuGO0qOQyLXe?=
 =?us-ascii?Q?EfX7pvmluMzDqAvX2UJEWaeo2DCwz1LBZaS5OVmaXdg4CSWGxzi/Oc/qD9YW?=
 =?us-ascii?Q?TdATo4GfM7gI1VihydfL0oo3qKN0423Nvdyrdbgujj4cJokjPNu0CCn24Xn7?=
 =?us-ascii?Q?0zy4TTriBBVhNJoHYvWRsYAJniePqFbTBrkTkEacW0b8ZrajBnfW8G7COEks?=
 =?us-ascii?Q?ZpvGZhhQ+bhgoGrr0F/qdcyeyiD+hsDyKhHMoRAjK5A4PuujKBXsAnTF/eok?=
 =?us-ascii?Q?ackKDH7O4yNqDNR+vkY+XI/HIuz8wZZLdNcK7gSIUeDt32zV5a1qGsdIqXjU?=
 =?us-ascii?Q?oWg045cgyG/3ehKRt87PFIDLYHy2zE5gz19GCBl8mDeW+4xUUE9cDdUrbIms?=
 =?us-ascii?Q?K5HU0o35q0E61JPHXdUBImLuQtJ4Vfo80GO2ZrqXSXOGPJ2m08qSZwdBb9HX?=
 =?us-ascii?Q?te7RQuLJMP4n0+2rQcppUamZfv8lARw5S7cssL6gVvsadtifu+RBYQuNszmA?=
 =?us-ascii?Q?yNzcwEzwkOmmcjhJxz4fRqZILpwFGDiYtsDg5dpPkUrMmHv9kazKpypYv02Y?=
 =?us-ascii?Q?2g/eBpGb0zub7PnYB8kbIe4TT8lupafrjXlRGiUsRlc2fD78LAPBk52LTzil?=
 =?us-ascii?Q?JplI/amjIIoNHd2hBqsTJQLgU796XcDJk1edfXPBW+lCgLu564R1Z5sxlAXy?=
 =?us-ascii?Q?3BvbIVUtcvkNViNJepoiL2EHVEGzgMGOTb6HeNpCsZSzLegLdo54WryHp57P?=
 =?us-ascii?Q?mGedfC0VDuOU6bLlA44iFN5k+lTHrvWlKdOOQb772dAdIfTZTh24nxsxbLm0?=
 =?us-ascii?Q?oN53ZbxXFguXru1s1tsrPxxUFd0SibWYgFlfboJDGrivGEO8M+k91YWETG8h?=
 =?us-ascii?Q?sWlUY72mI7UJuk91EY+J4IO4qMKrfyMEZ9tiunIJ1BOXMyevg5pWroTXE1zM?=
 =?us-ascii?Q?JaHun+RALmzPeGeH4rCq+h2MqgUxc+02zNNlGUMA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700021)(7142099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D3YPHDenKAyVGRGsplbTwV/hT6YwRJtUQJ7MCDG3fAYPBvPmrKRm8p/zEmIH?=
 =?us-ascii?Q?wRG3qI2xVo6os+DLy27xTLZx/gxL/La71WfYPr9qR42BTSj998WbFJ2Xmft2?=
 =?us-ascii?Q?UcXYG0kgdUoNrrJaYMtVkjictubGw9w7UqdoxM4N3v5A1W/ohSbP+GHWAaue?=
 =?us-ascii?Q?QPNHReM/qa78PVtb4nUUDBLGsTRgT1jsqRnaP5k9mQJY7vFaKENJF87EPMMD?=
 =?us-ascii?Q?Jr/7CA1S25+Nz9MdDtdVbS2q590FyzdBFxgx6LL2YwizechXhIW3onUCQEXi?=
 =?us-ascii?Q?KPeK4ng63XoPhMlrSZP7vVbMUE/EO0vfJCzj26X/5PHVB8UcKbx9IxKp8/fj?=
 =?us-ascii?Q?vSBvVUggk2UzPg4Z2WIOt+3yBrwUjOuWviNM7P94PW7087nuex2fhWtDiAqZ?=
 =?us-ascii?Q?uU5gb1GaX5+vHnW38WPfUBjYfC8ubUKtU4iow5QpxNFwqeKQplgHPvJb54we?=
 =?us-ascii?Q?03yr26BUEbRakX2KYUtcjbnDzauPgBvpscnWAFtQR5oymXygm8MIQ/xCk6si?=
 =?us-ascii?Q?HDFnK0MQZXi4CkAB5DihYQi0fnSbSFUpgsKiwXtslaSgaABqb5KeVXW8HRcL?=
 =?us-ascii?Q?/wJ92ISaxjWoh7IY8mBDQOqj2q4jlGTsSvkside9bQ0zcxypbjVyjU9ABhS/?=
 =?us-ascii?Q?fV0UWXBEi5pKc5L/FCYdtVMVbYQ+ac0HiF665TWUP3psMvh6gK0Ig/RBArek?=
 =?us-ascii?Q?Ac4N0YMGdR09wrVMNgt5rXP/5gUqiRXoh+hvP5m+MoAjQn93EtnI0Nea75sw?=
 =?us-ascii?Q?QMAZCFuiM5ZQNC7qj4O+sOqyttB3frs6m6vzNbAwfstuwa3DMO04dw8joEKv?=
 =?us-ascii?Q?M2LxX22qGlxNAK29cb6RfBVaKtizeSZF3HqWouYXF8gQ2JNWdCjWCLVeZaUD?=
 =?us-ascii?Q?jqq7ThdsAWF3KFHWOyxOBjsNpdIpZrEWi51NTw4oLqRT6iCCT9cSFTbN1GS2?=
 =?us-ascii?Q?Mb0W9t9YFtfmEj31o9KlWEcwo4uL1N6tg8GmekPlCw6LS6VIu/FOdYQr7dcV?=
 =?us-ascii?Q?cBZ0zRYzZlph+z2MAQfgusP6YuE3+gjKFSJBaNH70BfS5T7x0EuAapUEDO62?=
 =?us-ascii?Q?JXsYIQuAUat28+uEcvemmxsPENHmilF9rNZ3lYmx1ElcTMtIgar6o71faI5d?=
 =?us-ascii?Q?VBKfB54rtskrB/2q8UTwOkl37inkeBwBqxnwBGRMD+egDfJJKgib2sej3HQf?=
 =?us-ascii?Q?fjz2r9mgQLvHma4+tFEgrRfsxnJ2MWTYR9AWelM4j3zUyCQgM3h8oNIPtTvH?=
 =?us-ascii?Q?EkrwhrXvB4mIf7zHMYSRmFKDlx1svKaYvJkQOfmjwlOIWh/sTDAqM9hXee4C?=
 =?us-ascii?Q?yOUVknbUACM0gM9UuCC21vbeQnRsSV5aBctzHPi4tBXDdY4tIzFGfstQNkmN?=
 =?us-ascii?Q?5QZTJFCpV8YavAtybqboMhESn21k86LNxN3SrXONpZ85m+0rAbFRiUGt1EBa?=
 =?us-ascii?Q?ibEoRUFBvEu+mrpv/yWF0vp259ZD8Ha1lchVw6KxHfZcK8z+lpG590/L8hB5?=
 =?us-ascii?Q?vDD0IkE6tpsa77w/Z5LEufQo6rSxIDQ2DM1wFlDw2vh2/4rLMhaBLC5Cz4K6?=
 =?us-ascii?Q?6+kIVIp6A3yZnUtj5JvV636bixv0YuKJrZX2TkbFBAWbIVrcUt50FbeqFOUo?=
 =?us-ascii?Q?NS/xRK+1mp4M0OY56Pkn3G/EpdxKXq6nSPbHALSHpe7SUmD4pW05h2FbPveL?=
 =?us-ascii?Q?48vhnHqMLeHzGVT5p7O82/SbYoXzCjZ1ckCR91X91Cq/ZmsWaKbIGEZkhQ6J?=
 =?us-ascii?Q?uLAVrYxqnQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9073dfa-751c-4cd7-f8aa-08de64a7e319
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 11:15:36.5316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHOrd69C0k/MmlQ3XyNY7cBT1WWIv8lw4Ze2d3tCAMamW2yLcWWv3Sfjlmj+X0m0JNoT2gAyaqsltYecHve8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5120
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 11:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230575

Hi all,


Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.33.r=
c3. We are planning to execute the following tests for this cycle:

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


ETA for completion: 13/02/2026.



Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 27 January 2026 07:25
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-4.0.33.rc3)


A build flagged for QA (yocto-4.0.33.rc3) was completed on the autobuilder =
and is available at:


    https://valkyrie.yocto.io/pub/releases/yocto-4.0.33.rc3


Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3125

Build hash information:=20

bitbake: 8e2d1f8de055549b2101614d85454fcd1d0f94b2
meta-agl: 12daee6a859f48d3d65545d4fe79849fc312fa21
meta-arm: c3e9fb12aa31d25e33d8392c4a233ed1275a3278
meta-aws: 18a067493e82243b061c52a167c463df9298a392
meta-clang: eafdaa3cda9000c6d9bd1819ffe1219c7b66e4b8
meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
meta-intel: 82eb2406e04a89d6ed0650a99ba13224e43e4f0d
meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
meta-openembedded: 8f5f5cf4b335a09313c48394c62bfb614868fc1e
meta-qcom: 8d273808334daef5922000c8e0548b7ff2b3d72c
meta-virtualization: c474ae21b11a816be607eb7b44d2cf77d1125bce
meta-yocto: 677379f21941363d50f9d946963542b4ccb7e27c
oecore: 036f76ea35c49a78d612093dcd8eb1fac7ded8d7
poky: ff118ede826a9ae45eb35025a5f7f612880fba01
yocto-docs: 6799b1be5d48f4bf5dcd0b16c2dbc2e297d4ecd9



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


=20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#647): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/647
Mute This Topic: https://lists.yoctoproject.org/mt/117482006/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



