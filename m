Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F9FCFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:15:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13231.1764062109966964995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=M+uZog32;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764062110; x=1795598110;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EyLxughab+5Y4Nqrxy7a62pQGZryZIddt4BUp2H414o=;
  b=M+uZog32qUMeapHUCTp+w2IezAtF7akehziP+LUeOQ3CNoA1pjzewOAo
   yglNIv/1uus985/Bopn/47NaBCdws7eIzgmXqRwswMtRLI3ArQaBT67jV
   etzlLCIFCnzNzCZmA2sHhvOSz8OVRJJGq2PjwPzLoydhcpj3wDdjuiktq
   mplXJ7usfa560ItFoXLStIcs6LzDxCcGG0vksgihdNbhdK2bpKeL8+8FS
   czawr2AboKAQkVNr7PQOtCmvgWkOW5bcGtwV2eNw82cCXdkdABzRp2pXj
   yRTqAFU1FaY2tLIOg6rLe4RrmVRzn2l+Ed3uzx+qJZFzJW8jHTovCw32D
   A==;
X-CSE-ConnectionGUID: t5eqSisaSJq+LiX4rdiyLg==
X-CSE-MsgGUID: 6HdiLWxGT7mxWPRHkclsoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="88724794"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="88724794"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:15:06 -0800
X-CSE-ConnectionGUID: NxrLiCIfR9q53OsT/sNXhg==
X-CSE-MsgGUID: PxzjvlgyTJG59VPhyZ67Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="193018065"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:15:06 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 01:15:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 01:15:05 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.57)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 01:15:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ytcwa+XXCvQuFsQU7xgSFBIP3QwKgrPpVBwsYBiDO9u+eAmjX357XCxyM2oyq4al+iEp1gQixpcG+pgPV2BL3xkajfXaGn+wXr8AArPQmBdMV5hORTHnG56zLERG5S0u5dCjHtjsCYDqp6XPI1TM55BuXShF9Qnek+jpMtA41AYlF2rltSgiWy/brK+/E0EXhXlzzW0ZpaYbvIoK6+UatWIvsOB0O+rSkgD9QOUWH1t2tofOl+dJkr0MXExC7ueXebeHlnvQ09/zeFhRCHfnOtvs9c7xytpv+OsXQCJJEsqeImU3pLiybGpqKBlHC5pvAS+r/Zis9Ys0X3T76QTRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2950DFd2jUZQT0ESW/W7MqRWGw98DVHbWHsuzFHHJVk=;
 b=uFzYtYxVyrHz1uJ78hF3tzKCbZKp1HpcnAehtZ2NYurqrcuLg5HawGPncc+uqm8jLIFuEMPK8wVRPL1fMdXypYzN8icayUeohRgRM6sKPbuXRgxFNrAwK9qozvKUQwNnLHguuShz1S5KmoKv4zh9vh3NAd+j0G7YzmXwKOOcTdcZMESrfbbo69eSSrgaz2nHv+1V1IjsYOL+Sadc0dYgPnm9LyzNi+YREF1Vtzy+CGdblpbDSZWCmVHJoEgrbBTauMOXFLrfk+wBRGgpMw59UQlLgW4NGvVr8l7UBahJWocUsXzI3HW8+RiJp65V5xm+SduDVRfMGueGzYzSHcs+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by PH3PPF058255456.namprd11.prod.outlook.com (2603:10b6:518:1::d06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 09:14:58 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 09:14:58 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: FW: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.14.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.14.rc3)
Thread-Index: AQHcWHXWpbgJI7M/vEuUcWSr0ls5hrUDIe3A
Date: Tue, 25 Nov 2025 09:14:58 +0000
Message-ID: <SN7PR11MB7018154DFC6DBAF0E30CAE3CF4D1A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019a968062c8-61ef3fcd-751e-403d-a784-298837785707-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019a968062c8-61ef3fcd-751e-403d-a784-298837785707-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|PH3PPF058255456:EE_
x-ms-office365-filtering-correlation-id: 8ec1cd0e-86ef-495a-6fe0-08de2c031afd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?PtjLlf7pp31+ed91OlKAxZMbvh/jNt6+ytv3J8E4bKagfn9j+wQ7DYJo35cW?=
 =?us-ascii?Q?OJxJr+y/OIda5FNgMWjYJsHnx9S3zfuAkCBjzNouBSRXwqx1Oaephut/hXkJ?=
 =?us-ascii?Q?MByWusUeIwVruMD8S5J8Z0MvWIpihiOGjt+81i6kIl4ZMa6OAf2Mvq9m4+sr?=
 =?us-ascii?Q?15d1ZH2hXgKagIBOmYmJzHhFEDnVCNAzvYLlQoOEj29qoUWfyibfyWKAtT1j?=
 =?us-ascii?Q?gP0Z7hfDBl7j87LcC9GFwlThMaRk9g6LtI42PgoqibO1t6052dXaEsPaonI+?=
 =?us-ascii?Q?pw/QhUNBhFsYCI6ZhIEd8hRCsMn49GwkQUtW7Q+aKdY9lthMZlI6Eu5OEAD3?=
 =?us-ascii?Q?9HEyuFxTiV4lcIcUABNfPhWtWeiRaVemfPm2tzXT5lwBaIefzDArF6ttu7At?=
 =?us-ascii?Q?KP5Il56r+VuhbCU+vyG3VpAWmg08zvhzAxdoabzvsw41Js9ejUdXjX0iK7fo?=
 =?us-ascii?Q?g4aWydGKDrOX9aZy/YBcK1twSm+iwt/R0x9YWZlEx4MoYUKMEmupJNSiyKEF?=
 =?us-ascii?Q?binNZsbeEZfmOKl349W5S6663dqw/eDuAu8pzMFKCihvdc8ajaq7iFaYO7IQ?=
 =?us-ascii?Q?POnWMB3o7V5KuyVNMNSgG3bea5/9hrW4PrSUfEQFYWhBB+tFv8LssYTGfIeo?=
 =?us-ascii?Q?LapjtJ6HP6F+KsGjJQNIAb1NuCeMCTqHyMIjR76n6cC2A7OcpqkTbn7vZ158?=
 =?us-ascii?Q?LQ8OwiBKpcpJsu53Fy6VgEfyzN5zPC4W4ESP0kYz91eAzQX6Hp0aYc+VhKss?=
 =?us-ascii?Q?KMRGvdbcIlPBHTAxxdkbJZ6M185LWyTxNniAqzeG8/DcohEoRQCDZlcEGdj5?=
 =?us-ascii?Q?wPN7IHPqOXXxIltstv13NDVS3wIyZSn/1PvainTNXtdumZXGFInzu/5jzwpA?=
 =?us-ascii?Q?tZbfHzEBt/yqxT09Vi90ps0Hlrfd04aLGmKfvCZTLd2hBdcaXulrrj1JmMW3?=
 =?us-ascii?Q?gTiCl8CA7lx9H/Bo/XI5xPxYm5U5+KyhwgWBiM+gRrEDM7H11Pf+sZwMy+H2?=
 =?us-ascii?Q?Xbnf+M25EMZ2ZHlV1pNE1/0F8vK8VIb8MA9VnOrmucmEbnjX+2rvpwZMhub7?=
 =?us-ascii?Q?y91Ucmi54J2Ro+WU8KkkOZdihz/0j1iqgYmTOytHS6IWY0qjPlxBOQZ/Msat?=
 =?us-ascii?Q?DELlZlIHbo71UbCmsRyFAuvaOtLrZ3UKDWO++rA8LCjH9gHhAwQ5qsaRkVg9?=
 =?us-ascii?Q?tCr2v+cpR6lBS2pEof+b6K8mtyW2mvYJ00a/VaP5gWdGxnUW8pP1ZXz7p82x?=
 =?us-ascii?Q?AUg2Yc3m40usZK1AVRIaAhCjOeR64r2deOYQbng9hwwa7wIwrA+kAA8Puocf?=
 =?us-ascii?Q?W4nusUPHwmFhLEXaF0g6POmza7D6h8YLVg2UsdEyRTixM0KxBcb94hcRKIKy?=
 =?us-ascii?Q?oCbk70vb78OsJ0Dskj7oNf1J81DthiS/2y5Ne9c2l8OzGIre3Kl/8qS1j10+?=
 =?us-ascii?Q?vFUUtsg4pIiCGbU8673y6KrLKzDxP9E3Y2rQCTapi1NGt/AKE3Rm1A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4K0HSxju5sis3ygEVSXPC7u5dC83OJE5isPckWPivRtB38huVBrCqOJPBjtR?=
 =?us-ascii?Q?RuQ71dXeCOTU3D3ufS6AjDo5l2JoZbp+gbduyyKJ8bHNM8O7ijhPY+8sOBQC?=
 =?us-ascii?Q?D+NjSsjmo8kPyF/5T97FCMKYnEhsVc6v+5CPUR0bRCRFxBK5c3xKKLNdYZz/?=
 =?us-ascii?Q?jMAv6IslsPWmLUXB+Ah1we09gZqtX/oucrZQt3haXOlkm2bRgyydvhy/uknE?=
 =?us-ascii?Q?MuKkgHLjPM4xMNz5TRuB2TpHxo8JBqqmImw4ZX8ybehdieqQplssKX9jrG4A?=
 =?us-ascii?Q?UtLjh2yB1NCi8tfkfbBqRNXsxbSFI5yyoepI61i/1UqDnFIXRUV9qq+kVJ8c?=
 =?us-ascii?Q?OjpmX07FtRgmshx+sNsxikcAFirCjsv9BCt8+k36OZr5hJ2LY/vwduKdneeS?=
 =?us-ascii?Q?4yik86QFeS1QfA3BmMkK1lFqeBHyKgadjn03gFHo/rUfFOCQMvO4restzDhE?=
 =?us-ascii?Q?HrWlMNkVb8Qtk6Io9lsuWdsxt7YOoQGhe6jIoPzVJLW6ULYXvqydGVkSazTR?=
 =?us-ascii?Q?Hq5+b8XGvWZLnN7z0JZqnkpFUJ00kOjL2UE02BM+EiqEe4TSWQb6qDMpxj3B?=
 =?us-ascii?Q?/BaDrV5AstI1KaFlAZR4XHWe7S//DgDLiMG676QNLwtEYZT57tlq9IQ8Mcdk?=
 =?us-ascii?Q?EU3dfcZIXeW91ASgWxLNUyIswdjvT3rRPgwWspVtVNw5zJD1MqgaA1joMLit?=
 =?us-ascii?Q?I1uUGtbg7LaSKiD9vKaVV00EBwPDYBkMuokULSwsLSPQHZz1l5g/s6JlqIN7?=
 =?us-ascii?Q?exG63ngCHUwu8W39ZCPFU+Z9IArpM6dl7zIm/6k98aDCxarV+OHvKfWd9AyX?=
 =?us-ascii?Q?DtDqP9Sq6n8OuB+q9Vs5iI3jdc5AEfgnvDiknDfNqPSGlzmeQN93LTxawPnR?=
 =?us-ascii?Q?8t8Owl7n7JSsqkAo/Hmp1vurQyux/IGv/IVRqfzBg3HABPowfxny0bxBxcv+?=
 =?us-ascii?Q?EPeCGlkm3FlccuMJokmKJH2A2PNFPvP2Nt13989FRIuMea2ya4LGTY7ioZYB?=
 =?us-ascii?Q?ZK3fZIWpNnJ+weadhBl1GlNudVX4zd7jnNkfqomFOWWOsHO/4siMMub90U6s?=
 =?us-ascii?Q?L4b6bwJWLXK45JdgyGHZh42jMWFsnHDfVrmce5N6f97UtRwUOhjPConq8Xis?=
 =?us-ascii?Q?1LkxIriOYN/1HBuadg1HWJJrParjRtAbGbHNEH5D10jT0HlCV2Mjofkdaf+T?=
 =?us-ascii?Q?WsflLw2+Lt35x+lOvg6izB7KI0mhg4B4XW6uiAS/v5OoEmjBUgwJATLQjiTJ?=
 =?us-ascii?Q?gdz1o87AJ3fXRSHx+S5CluTur8WTYYfSax1Suega1X0vYzWpGUFler00+I1U?=
 =?us-ascii?Q?SoobzbB6xMhMSKsOo5rnCawNIojGu2vhjhRCAXhOsl5RYO7XR4+qjyWDazJc?=
 =?us-ascii?Q?wFujMen3rWjfe4uGnVAnpMeVT8LS6gatXB4qj6mshZSfAkU680RzNL4vd9ua?=
 =?us-ascii?Q?axELdq6ma9dVXeyUADFzNVdZAZCFWnzwFPKxyJ1QWizHK3LoWcwOpP5h92e3?=
 =?us-ascii?Q?ZShkiOtNOAt5qEWb5qTAM9MIArOjJoU5z93GqakhMhUoNw6CaYwqG0oW5LoZ?=
 =?us-ascii?Q?ngnmeLlGPjsCuXrTv+4gq9RZMqF/Z8BHmiic9/Qo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec1cd0e-86ef-495a-6fe0-08de2c031afd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 09:14:58.2419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhQHziO7gVVgIgu9AWgXmiUYKBdnsYvrcQSFHPSVa6w6FQN8guc0CGLvNAptJx1c53F5VwKdV5Hio6k41hO/yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF058255456
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 09:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226760

Hi All,


QA for yocto-5.0.14.rc3 is completed. This is the full report for this rele=
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
Sent: 18 November 2025 15:56
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.14.rc3)


    A build flagged for QA (yocto-5.0.14.rc3) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.14.rc3


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/2738

    Build hash information:=20

    bitbake: 8dcf084522b9c66a6639b5f117f554fde9b6b45a
meta-agl: 8a94f23d8d81c02c74268ea18c35469c47a94b5a
meta-arm: a81c19915b5b9e71ed394032e9a50fd06919e1cd
meta-aws: fe840436ba483533afa9b34aa2d1a64e7e9a3a88
meta-clang: 731488911f55ebfe746068512b426351192f82f2
meta-intel: 6fc37057c7f0293a2345e303588901889df8b937
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: f1f248262d662315159ee96c604f97415d1dbe6a
meta-virtualization: af1db2042caf8021d767dce1b26c08b59b96f3d1
meta-yocto: bf6aea52c4009e08f26565c33ce432eec7cfb090
oecore: 471adaa5f77fa3b974eab60a2ded48e360042828
poky: 7e8674996b0164b07e56bc066d0fba790e627061
yocto-docs: a8687e4bb2e822670b6ad110613a12fa02943d3d


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#620): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/620
Mute This Topic: https://lists.yoctoproject.org/mt/116353983/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



