Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F3CE6815C
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:56:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8905.1771322162455834325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 01:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Nu0/SNZz;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771322163; x=1802858163;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=yEc/eiyUbrpzWu8brbKr8aaIJpzH9kp9pumHZ5LC+cs=;
  b=Nu0/SNZzW3mFX8KUD5R14fGJDVYYynRGQ7UWiO99ES9DBSYjMPNQbzhe
   6BkIPyUUQtUieA9UJT5RbaiWQQhCOnpq9PNSwCip/egQhJgO0P5kSX3ZN
   6y7cfVO4U5KRy3cDDt/FhU/eMoE4r3y4wqNBdWoX8ZTGQl7wS0JzOhTKT
   a/Z0TcADCM/WxZ21weIA1mqJV6H5ZeXAAfz/AE2l8EbZ3Y2exqM3as6Ly
   4bBrq0reUmwXIqaayhwodo8hZLBhpYlEDM/aezYqQew7Crh7LBwHCwaA8
   YIFd5Ts6sWRrJvFXL2UmfA0U+wN89ety6WqQcp2opp+UZxCxuaTrvyGfa
   w==;
X-CSE-ConnectionGUID: iIUkk5ygTjeY87mZFhwhTQ==
X-CSE-MsgGUID: dzzqOF5URNGRU8j8zNjkZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72431302"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72431302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 01:56:02 -0800
X-CSE-ConnectionGUID: QBrOP08MQ6ySknYP0EcDzg==
X-CSE-MsgGUID: Sr5Alt0wQFmqe0vgROHrLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="217975587"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 01:56:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 01:56:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 01:56:01 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 01:56:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBD9oNt+w/MmULSzjAitWDa6g4cG3levj73GnKXBe6aq/rLTCRo1oAXnDsDmOrGBknafQ7qzwBLszO7TvJUg7lqxLKoP6YD+2eU9H93Acz1tKHyKs0tM511aZdC2RsvX703gKl6bsniqJ9dT0yzaXud/enTW66haWCPY3a3DJZZqhd7MwEDQ5BKHuswJ8hXMY+3XRyrYKk8Inypxb2LE1ynivPMRpzDG2BcYBwOjikaghb0XJv73/Lc4ekBIQqJDkqAb0Vqs0P4Udr8nHNrD2+IXbnqMps9BlAtQSfCWrmjEXYgr7rIteihnwS1xM4JmowtThP5CueCi5HMXPd3CYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88QN9pMIiKvTkq2pnIWYXAW0fs344JnKDTK39L2dGXU=;
 b=Nfi6bm5Pg+nwwljjjYr5Vu/dUbX64XWpkztJQW46Ior1PdBKGmFzXVc5GVmW3C4GgLUmFICfn4WT1JNsw6HkOlKFOeJpvEVCFWD/lIy4fYCTF2lK3z7DYXcEDHCuUz/iNPao5mgCFUI/T3mNLLjidTFEVwz068pkcRXBm0dNpkkzjbbgHppDoK6V8DZZRAyybXcYXmmD1SzIjnwhQ4XrYO0cZCUQp7T6zdiJ1RLrRTBUuL+2bRoYR4OeDm8xNOfkcDQK1mg57qh+ltdSZbQaz3eYqbWxa6Y7ETAh1Bh/Q6g/gQxQFa2Y1xd8HmTPaG8A0/3A7Woyu6weOHwbKfTG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 09:55:54 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 09:55:54 +0000
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
Thread-Index: AQHcjzABR93D3Nn3YE25bGpkQZZ1W7WGx43w
Date: Tue, 17 Feb 2026 09:55:54 +0000
Message-ID: <SN7PR11MB7018D633616F484A95AFCDE8F46DA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019bfd297f46-e2a1665f-20ce-4d02-971b-927affd30204-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019bfd297f46-e2a1665f-20ce-4d02-971b-927affd30204-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|PH7PR11MB8033:EE_
x-ms-office365-filtering-correlation-id: 60544298-9b2b-4358-dc7a-08de6e0abd96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|38070700021|7053199007|7142099003;
x-microsoft-antispam-message-info: =?us-ascii?Q?HvkvbX1bEhM5fmToR7mQDfUK+r9uheahpxEOqmqqTsrfh+slLoaHH7iwtuWw?=
 =?us-ascii?Q?ok5TDoIprQ9xbS6aTFPd34XHF+v2fbO0V0th4AzcdDgZnU0W1cippDrGn/7z?=
 =?us-ascii?Q?XjLu9hLzMqLPVOAq0kQio/CuXdXTVMel097Ea70wzbSzZvrpvxOkBPwy9XkJ?=
 =?us-ascii?Q?4r22vs6VKoi29o1cdcdpFK17GX9K2mJbCOqKktcz6G0hpNWg7JyqYfBjbiGL?=
 =?us-ascii?Q?uXyalljYgq5la2V+4SBumGp4CUAuouZ4c7uqf8nscRTpZbnDC8U0twd1kWv8?=
 =?us-ascii?Q?uOKxhEBcnjxxAPCYj8yxV2i8QO949PukbqtxuR+uAdyn0fSydXNveGg7gaE3?=
 =?us-ascii?Q?yS6ftk96zkyT1rr5kyDi9bhsXkuTiRXdN3pbD5HHRP4/RlC4UDN+d4g6Nn2k?=
 =?us-ascii?Q?4WaNocYTpi+s1nhMbGcQxCPS4i0biWtwYcSgaoNVQwcpqlRIFxUKDMkcWnfO?=
 =?us-ascii?Q?KuShAZpcdzb6pjLbRce6DI9RwjLxyEoB7JDSv1LhvUvD/PczQZTQeHhnA5af?=
 =?us-ascii?Q?GefxVDxZk+mcRhRXdGChLk8thZQDmeY+F5xKFFdVhnbjcAu/EvaKgKS2L0dz?=
 =?us-ascii?Q?B5cjJGFOXw0LgxFSw2asiFCrAaXx1U44jQbttLK+xD45tCj7x/5bGoU2+G+n?=
 =?us-ascii?Q?221bAi7yWsdX9VJ5448ZVfA0Tego/mshHhq+g4Qprta+c4LHdPauBk5kNMeF?=
 =?us-ascii?Q?m6yCKA12xAR3xRRT95rlpQrq8M/CVKXvMGFNpEJOnQ3q2WdKaA1pspgbSACH?=
 =?us-ascii?Q?nGcYNSnrt/gjGvZATc3X4B7/Zimf494q757dP1k9ciGQ6dL6Rm8K+LiFyrwn?=
 =?us-ascii?Q?cOFFMrnlBEJIVoonmp2TsqUrOKDkJLYMudNobfO/0Rg7jvmButyskcIOwogm?=
 =?us-ascii?Q?Ooc/hFMHVFPAuD7aha3ytNzbN4z0H1mAVX61Vzbxjl/aY1ykUXxzWkqmftii?=
 =?us-ascii?Q?ITbFwNFbwxo0pmdT6+DzwiFqEi5H3sxA1XFX+TTeVESXOeIg6YRpKUM/m6/4?=
 =?us-ascii?Q?C7x+n51P7DzehNaWuLTnTrstRgTZRqpW/Y9SoyTf2Lyk1K+GNoPU40tBAI+M?=
 =?us-ascii?Q?yOlSznDZbLyVx97fFT9q9YU2H0XT8lgdAWCT2Ua0Nk3+fQC5c0kScCnATH/v?=
 =?us-ascii?Q?1iNT/55D2uylcortL7F3n0ngikADVaq3GU3NHN9f2b/w0M0T0gum+CMidUxT?=
 =?us-ascii?Q?JgJo89o/MOMI0NMFf054fP36R7TdNHSJdjbDbe8lbeXp+fo0sujPYWOHeM0x?=
 =?us-ascii?Q?hcNF9zZoKjsnC8iv4bsHge880weLIsby9rbrKUXMPqEveA6Tyr/vBNafvt4S?=
 =?us-ascii?Q?h0/BSx0x63J83KU94wOrw1ptA5Kn4GM/N5xORp9Afeckgkgd0oksPCOeecxB?=
 =?us-ascii?Q?km6/6fZjDKSzzRtx9gcyV4H3QWkThB4N/HRv1OPbmVxWyTc47JFjnUoPJXPA?=
 =?us-ascii?Q?XZIy+Beu3suZCb5cg+IWUkTJdt99iAMw9eurRQhl69SeETbb85cy/nZJiEvL?=
 =?us-ascii?Q?heuEfrjQsuUVQEo8wyJ0j/i6NZaeZlZCdOhnHg6XARlO7/b2jM98wqvLob7b?=
 =?us-ascii?Q?jtXXyfaOyb2dbcavhgh/wUnHQDWrOlypO9MJJDST?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(38070700021)(7053199007)(7142099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Ra3yUrT2nT9BgR7UuFsrqRKGds3V23TSgGlEgH0iNBKamsoNo/3FGwPWUul?=
 =?us-ascii?Q?BLMcsS4Gsmlouts/G+Ao99M1m7laMPUAxI7UIIVsEj7R06bX/jfLS6GTzSRn?=
 =?us-ascii?Q?pLmHyHq6ORNy/Mwg6/JqVnN1nGPy7M5vG5vx2njXr5b/sc3cktbv6ErqbROf?=
 =?us-ascii?Q?AuRtWj1eKTEobiJ+5VDrb+vyOkaOY66ZP+c9MTbvR/dHELOxhIZp261R78eL?=
 =?us-ascii?Q?5otWOJk3gy3IKY54rVUO0ch2iYHhwlfgwtx4uQrymwe2kAD4kKXBWQMtI6/2?=
 =?us-ascii?Q?TB04XgYMBumhGVSwyN7WxcSdS/XW42i5yp8tI08r03FHdYKJQYO7ukeK1KJ6?=
 =?us-ascii?Q?OJEJQLbwiPleinSjJZwpIziTB0dmm7VUFN7VgFixEiJuufOcMx7HsTw536RH?=
 =?us-ascii?Q?k4RtB6l0K5/Ro0CdfJisoFBuHk/jnSidmOrZmsUHP54ll+v6K5Fgg1/rd57u?=
 =?us-ascii?Q?lkSZJp1Gtk1ZFZM14xbf2yKCWIorF3C9bVlZmaZ3O1GfrNBGhq1keYL53ePS?=
 =?us-ascii?Q?FeuVci1lYBlgvbD2DQk0c8c86JGeKH5Iy6rMTpDdi01QS/6jAgFdh6lVdPfC?=
 =?us-ascii?Q?1R68INJjZ/3nsD1TWFGpZ5mSjR2XN1xEU/0MV39WlHc4ghcMysrIhjPwNwco?=
 =?us-ascii?Q?84RuuetIJnG/jyBj9GTrK3+SbX6b0nC12iL58otgvNgayeyzb+iIRUa9+gNJ?=
 =?us-ascii?Q?N2fW0925eoQfL+mEZSxteiAa4tKL3o8mPUDhG5K8/6lcjJGmRbbwkAiJ+dLG?=
 =?us-ascii?Q?PkS2CDBx6F/WG5rqzQCLIQCzP84ei7qVW++0fB7+PY0bV75DphNipRswhRrZ?=
 =?us-ascii?Q?XeOlyZE3b9/BGVshEp52Wn2nKUeoDiEHxpL8F2sCXQ5aPwdYFp6Jt5qgyCf3?=
 =?us-ascii?Q?jOLs++MccyxskC2gGdLIaMxDkDIcKLLA+N0Y+5P5+ikIZ/MVfvzWVyJMtjIA?=
 =?us-ascii?Q?8I4HLXJSsYkJtYHJwRsPH8FbqVvD9uaO2ttGwteCx9MoPndpn6zH0yfqQ6wy?=
 =?us-ascii?Q?WEcmmQbJBqPem6OH4YWv4VT3sS/nyiqZ9lR+yn6zGui/eFbaCk/QtEo5WwZe?=
 =?us-ascii?Q?VQk2QA1hgF99rzDhgim8xIV2ikvyp+1IxH6Zy+2i9f4/znKgJhBfzc2TybJl?=
 =?us-ascii?Q?lmvX/UZiIw8JL5E30XErbgOHEEV5hp7/p8xUx3dMXQnLi0FnwTEkoFxPm/z/?=
 =?us-ascii?Q?FOK8ed0p7PrN0FWmYzn//xJDCdT0UKLWsq1rclEU+A8Xaqq6KEo31EDepECq?=
 =?us-ascii?Q?9XumNfyub6vepjaAi78MZ3d2KEJiAU6z5IMEGc+FDGTUI9T02DvBTSvNHtfF?=
 =?us-ascii?Q?eMhxEpFiTpWuF/MXK2a/tz3m6959RvLtCo3R4GItpnfJEVyFU4Vz0ym4TOec?=
 =?us-ascii?Q?alABKZqOxFinrl3uzf74Umk4CoY6NJTv6UdDbmpFdWVe6+sB1ISWtT8KuGvY?=
 =?us-ascii?Q?xiV9x1ZKUajmzJhBSg+pV4jjrFygM7HqKGIJOzNIZ5z+t9Xd+2J5yUKhOSVN?=
 =?us-ascii?Q?8H07LXDHi/8dw1X2WtgQ4s2RQ34XDLPbsEhvtV0oKIsxMe1QCWCV/4AHmHCA?=
 =?us-ascii?Q?Z7gSUTUzei2+Rola7VNkD0cLJgBut7kaj4l6UVz41Ha2wYZ4Z/FrbO08rRHZ?=
 =?us-ascii?Q?jg32x8Ap3v5h6K++8jj+VGAFdpPpE2955cDGDVXtHjz6s7qmjHqG7Ncm2CDJ?=
 =?us-ascii?Q?XlleEFA8vuRysoKG5EL0FW/H0T6ibAV4YVbJrWBwSgL+yIbgCXm+K1XHnVXV?=
 =?us-ascii?Q?ZE7yptcrUw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60544298-9b2b-4358-dc7a-08de6e0abd96
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 09:55:54.2213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YmRFRP+3khSuupjjzF3d6xZ9vj0M/yoVkDyMZeo/CFqnDaaW1tgZS4HDK1H8phGqxP2BfXkyAKTX95VoMspHCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 09:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231234

Hi All,
due to lack of availability we could not run the auto&altcfg QA executions =
on a TigerLake system for this cycle.

QA for yocto-4.0.33.rc3 is completed. This is the full report for this rele=
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



