Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF72D29DD0
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 05:54:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52875.1768283651518084825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 21:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lilh8ZxN;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768283651; x=1799819651;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9YWDX5QBoYN9VYuqQ/gq8oXboZjfrJl9mrNez1qCnP0=;
  b=lilh8ZxNM21ZrQ5NgQ1LsCOQhEshK1qcJbvYF/S1ofQmKenHVEc0aT6+
   34GAoGihausO+5XkSEBqzrJRaYBvaV1GepXaDaXH7C4XuXVKULUhaLbdd
   33JIcqAiVzUeBDGbuUdOYqf52PdVXXZv+bEY14uK6B0wS+uuIVlRA/2P8
   QP7i8rJn7ymX5S/T543WzRFrGLBRBYhr4pO2hr6+WUU+p/u+tPKeJzSpd
   D2qXLQeNyU+Qgc0FgEPaqQ55h3SMkzwEILn/pHUVK/39Dchkp9Zba0eoY
   3I1A3dRja0mUmGTyhYfeOmwTsmmS80mpKMQuDHFZoYrnakg/9ZvpqB+Df
   Q==;
X-CSE-ConnectionGUID: NPEu7e5BQJqZoOeIsTBxmw==
X-CSE-MsgGUID: budoIzVQQFOdDZiZFuNryw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72145507"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72145507"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 21:54:11 -0800
X-CSE-ConnectionGUID: XdrHlOJ7Tf6bfX/avvJT2w==
X-CSE-MsgGUID: 2voaUcrNRn+rdgViehntRQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 21:54:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 21:54:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 21:54:10 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 21:54:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efkZEhqJUXnunizmADVnDXh635pZVUlE9eZ5B7uriULTCne1BGrTJYcvHY/lsdS7Z4qJAc3JS3eR3D6lofNepqGkIpYIJJnFoQv61pnkWI5/2c4n4cjPQWm6F5I6VbIwdBWTVTmS8J3b0F0Nd4rqErvC8KIlH2YYfVfgP4XOMNRrpszg4NfAp8N2aW0CNBCgli6TePTZSIG73/9eA2QMiS1dBjJ6qcgzeBuuP3TP57Oklyo1WLAhYjQOL8rO3WusqQQ/H9F+SZMKA3Ag48b3SdvWwwis4VkEbpQx9depyWOHWmADwiisWCAiZSUAR/SdhWgiYk0c89B2p0zw7U/Cww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weNnOOSSmE5OQ8M469rUI0F5Kd/l95nuzsafu0uA6H0=;
 b=QKlGz2VkcMC6L+PEz1QpHvKkgnPYBW9BDqH/gAbKgpf6kCwH/apJWgKzAaiU5FgHUxwZUPoNXwePMaZBkz+TmMGdmEj1DkMH2oRj4LgtIxHI9Dlsf/MeYZ2PBeLnPzqnFGM7HIhW7hOo7/1BzziEemJysQchNPNE5RW6CFZQdGpAtq0tR2v5bfixaQD7UlKAifDGgjNbkPRqVxFqlnd59Qp5DvusK1CvJ38SkyQ5SILjaGYfCkGlr9Kgk9NuQgkWOrGViER786mxSbVd8XCmYjyecPpmYQiuTCnXiLjwYwxnQhRi5RaugQBqxchkQufaMtV0bkdY+Ps1VoI188l2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 05:54:07 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 05:54:05 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.15.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.15.rc3)
Thread-Index: AQHcfDym6UzIxIrTnkuTjmpwKQSByrVPqNlg
Date: Tue, 13 Jan 2026 05:54:05 +0000
Message-ID: <SN7PR11MB7018135269C367DC5502982EF48EA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019b80f7b70d-d05b6299-1830-45e3-8485-4a9d8975e890-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019b80f7b70d-d05b6299-1830-45e3-8485-4a9d8975e890-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SA1PR11MB8317:EE_
x-ms-office365-filtering-correlation-id: 7e04b12a-c440-4df2-8a19-08de52682922
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|38070700021|7142099003|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?R3nF0ImyFtbCgifXlsnpUtXHY9bMb26fGnD4PIqdxyerPCFywy6oUXTRgICA?=
 =?us-ascii?Q?chRA54Nq6SgBjMtCEjFPjckznZWcIT6IURtf43OY9EHljUuxrWIY5nEUkIqN?=
 =?us-ascii?Q?d+OvXXO1wC9xoViXbq/mnV5Fkrwu5+4h555YuXnBr9Ia5dxc3Cf18nO0kPnS?=
 =?us-ascii?Q?kBzvlfS1g2UryepZsGLSofjrAor66WgAPfxvC8kKMVMW9rwspLtbShz/B4HW?=
 =?us-ascii?Q?470rlxAuJ3xTsqwVCru6G/5RO4w0iBwdPADZTJV6pfjAcsmdr2sPa5uYQBTz?=
 =?us-ascii?Q?WV/LTuwNCNQz24tBlUUpB+rJf61GOB3IKPMKtGH6NH4ojF+1n8osZFaEl8l5?=
 =?us-ascii?Q?vqM0xrJp4TvCjjne2BALtPEQJtYJy3APVHaHti3QZxMegAR/ZppikPwb1/XZ?=
 =?us-ascii?Q?QvuPhI6kweM2OmYsJy2wUyfvHhchb6Hy3P9+G8s2JxmbRubopFHOkASDxydp?=
 =?us-ascii?Q?2xeVg0LQlJrSKi3ZoW7LEWPOGg4m7Qb1QyAalHdj3F0EaXbSuu8hkb9uOj/4?=
 =?us-ascii?Q?IRlkK9zc2gyoZwLVkCXN4jid3ROISVEJqCVvg/QakQFMdLMsfoRyHB80wOqL?=
 =?us-ascii?Q?+zSW0H6y2TSKe0NCM+RTWpahioDG5GBBVG+EgreoaC6xwx8JZoyMXy5LQuFk?=
 =?us-ascii?Q?dAVia+uweSu2gRqP2+cXLXV+zCSdNn3fXgYmKzqsKZT5Aal9uI/VFG7MnzRH?=
 =?us-ascii?Q?cHbP5E7vQgGwuBFUTklhKsXVBFPzwpBS41gFBdP0YSFLusFPJOEkwXetM/L9?=
 =?us-ascii?Q?7Pj4rz6ZWNn2y4Hqa2MF0k2mc5qEev5cp8VbGZsgnkUXGxtuvyiWi+rNB/GE?=
 =?us-ascii?Q?1kqHnOVvxYZI9VoF9TWbld+3LO+uJA529GM/qEUl2r8BEp9vqTr5ORnEdeb9?=
 =?us-ascii?Q?s6+PF0vndr3EzDfb4yc5QcI0jKBsG+CyCtw2leUYXu7o9IBtOVeY+e9eEc70?=
 =?us-ascii?Q?aVsKqJzN612smqdRlncg8v4b6sZeLtbbRLMaSQkfe8ii0qCbieuJYoQ0Y81d?=
 =?us-ascii?Q?Ew1kfz1pXbL81et27nvOyK8Kg+WQLdrsQttxfu1/rtZ06fTvChKI9LHEuRak?=
 =?us-ascii?Q?RpgbqDwNZ4tUoo0QdJ3j7Ao/tggYzWWleGvhJmJ/NphfCksHoAz823t0k6Jf?=
 =?us-ascii?Q?XIaWH9lz7QxHgA9QH14hjjkoDiN812AOZynrrNSR1V0gxO6MLCFTXMrpCRVC?=
 =?us-ascii?Q?+GcnHi8qRC1c7vB5/nq4lCVs+ndzhOoNkFKSspzllhFXHskuaPrsOPeaTvbv?=
 =?us-ascii?Q?EETlWbwrRsE/VLebqfy61dgF62JbxiPVkpbkDXARmKpnp1hYErv6BfeCOMUp?=
 =?us-ascii?Q?4J/to/dlRFCNSAdWgQ4oRtK7Xp0kMkwUaGkFMzSCH/0iJcg/N9OiGUKKHVDS?=
 =?us-ascii?Q?mjO0zFpxHlfbyMwcwQ2sbWX2K7CEY1iXgSV3g6wNb6Oc0gDr2JqmY7amfRRg?=
 =?us-ascii?Q?FW6B5V/WYpgnBBNcKSwNzwD1+ivbACySTPopsrjkl/7hQIraSnKAYg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(38070700021)(7142099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9mw69G1QCv62LoFN3RNjmXrJLwX3FKNLX1vlFsWSTeanIJ9N6417AArmrYFb?=
 =?us-ascii?Q?jtBp6A+tUT7bbPliKxvD4acn+uY5pk11Aq9Wmy9TbXObjQWHZxnt4Bp5L6Kt?=
 =?us-ascii?Q?67/ILwHO2LP7dA3ugOjrgs0NAAC73MatQMVsIVEfuuGmYrWC1LSuEVnbFWag?=
 =?us-ascii?Q?ufupJ1dNXg7+pncsOOC24AE4bFGThKPiuTq2rqLr9j4zI6VxBso2nwGj3I+X?=
 =?us-ascii?Q?zo/Zu01cWN9SGNw2DiJF6X9hWHOcys+hCnlqcSEYJvuNLSBgZ9BCXFMQtDGJ?=
 =?us-ascii?Q?e3C5uZ/9Cpkf/KfOlcpfoboTKrUw6qFRtThywdFhY4Zw9lCb3mcch2Btjaom?=
 =?us-ascii?Q?RU1mCIZsIyigOlW5iuV2n0o8hvcp6qV4oQkgpgweaZ6dLg8hhV+bkXAHFd1+?=
 =?us-ascii?Q?Y9YVy43OR6MAZskwFPq6+r7zsi+8PtP4g02bU7YOoHThdaVP4xi7vyVK76Jf?=
 =?us-ascii?Q?WhIVw+BiGGvAUJ5U14iSYpldl9Tb3m7vBVT/F7KVLs32hxzdLhGMFi8E8R6j?=
 =?us-ascii?Q?kVM1BtiWDttIL+NOoZyiJtIZG24FmfFSwsUJt9XHHTbD84HBAIKF+gnkeJpj?=
 =?us-ascii?Q?V04l/3ggl8GVmrjUwA11IMtdD8aD3C9D2Bxaw93xNMiQoHGtnDVXKHsc0yh+?=
 =?us-ascii?Q?Dib8kNR5jvxRH6ZSbuV94yogF950aAt6fzQInY477Bz+yd5l69xGt2db9Tr1?=
 =?us-ascii?Q?llrRqLB1dhG8yZ2AYSYGv60mil1nXd6VJAGzrFomKj52Kx8FOIpL3GOhLQ6u?=
 =?us-ascii?Q?50XMcf7zcTAjzOFzpIzcN2ri0qA/u367nrciAxIr3YYCxYwDo+Tw8zvDpaEF?=
 =?us-ascii?Q?lSS+betKdnwsEZLT6HYxEPxGxAOP5uUR6JZTJ6P8jDsOQIQtsX0UHItlSiIx?=
 =?us-ascii?Q?TO7Zh6QRnAZ2nIruwhidEVVJrewhQt6ALvSpRLN5D5MOpwUnli1V5pL39NmX?=
 =?us-ascii?Q?iQWA4PSS5JQ2J+VW/HvOatn1zNSRSRlZJz/41okCtou+zEaBPLCwTeVmA+0g?=
 =?us-ascii?Q?sSnPQDnc9lmyvmQvKigMvNWUnplnyBUaWYt2DgWegaHVPfoyR0qpRU5uxakh?=
 =?us-ascii?Q?8uBgn6nDUho8aApXKjhVZJ/IvWHq0jQ03x9bzDPH5Wxo21X2p+WIPAbsz0JW?=
 =?us-ascii?Q?w4XoWahlpHqO5nSmMk7vysduvhHyrF6fTUmM9qs0v9yzb3MTcRupDxpGEK/y?=
 =?us-ascii?Q?3YLwZtJpkc+Zbr4+hVMx7pu7bvILLofO9d5t5TzkL0b1eq7WxBvVYv2tDjeE?=
 =?us-ascii?Q?9nzNkko6tKzCuz6YhnO/zg6GtPDLa8gALEV4C6rZA3nNxgCDzMxb5yrrIa2x?=
 =?us-ascii?Q?f/b7WMNLFBiUAM1w0ZVPxkbONi8UYyc1awHO7EjYd8EdVOKH5ly2U0exsOST?=
 =?us-ascii?Q?4PYnnyGRNqkECxMq73AI1A7xn3zUMkpbY5WoyDIgwRevcVzhiKKefWvY582L?=
 =?us-ascii?Q?nr/UuAcLzXXHaVmsqAuxnVa4ONzb+l9KFeRoDTCTyYWK7FfQRGd+8cJC9bNA?=
 =?us-ascii?Q?J7e9yK4u9LSebHJEPpUERqyLlwVw2jJCJsxfsLDsV8nFcmx0fZODbDgnpuzH?=
 =?us-ascii?Q?Fpy7otlleTFeggxRzfObDy8kemhv7LuYzyjvJ484yAFqGHqvaPOHMfIyXkCA?=
 =?us-ascii?Q?n12pAL+e2EEGIuTiTCpYNGufF1DRE9AAcxEHxR4rR6cnnTul5EvdZxJSY1KP?=
 =?us-ascii?Q?m5FOE0xALy/6d1AD+IRkSg0Pz33Ca6AQfti0HWvHiwjWJpW5Y64bGSED7zgQ?=
 =?us-ascii?Q?orwuU+6riQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e04b12a-c440-4df2-8a19-08de52682922
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 05:54:05.2864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M8CcVO6lwui0+vedW/lg6/MVb0jE5eGDpIBtanxD8a/9T2lKkkiBYGxfJi9Cu3aQMpn+U2Q9EtYyzMvi6JSNgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 05:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229224

Hi All,


QA for yocto-5.0.15.rc3 is completed. This is the full report for this rele=
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
Sent: 03 January 2026 04:38
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.15.rc3)


    A build flagged for QA (yocto-5.0.15.rc3) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.15.rc3


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/2972

    Build hash information:=20

    bitbake: 8dcf084522b9c66a6639b5f117f554fde9b6b45a
meta-agl: f6e9692bd2974dc390400e8ded06a381b057fa4a
meta-arm: a81c19915b5b9e71ed394032e9a50fd06919e1cd
meta-aws: f23599da431e566ecae7535b3c8240f3419af8ed
meta-clang: 5c602337ea1a80fb7217eeda04e396cf90587dca
meta-intel: 6fc37057c7f0293a2345e303588901889df8b937
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: 2b26d30fc7f478f5735d514f0c1bc28f6a4148b6
meta-virtualization: 17ac21e7d7f6f40a87618b22278b63bcfa14dbf2
meta-yocto: e1363aa3333cda3a4ae4706ce6577b987ba3a815
oecore: 6988157ad983978ffd6b12bcefedd4deaffdbbd1
poky: 72983ac391008ebceb45edc7a8f0f6d5f4fe715c
yocto-docs: d84d916d4fc505e8386693306b6a90b0064c0518


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#636): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/636
Mute This Topic: https://lists.yoctoproject.org/mt/117049492/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



