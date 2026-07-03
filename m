Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DA5C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:47:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94776.1783090025995803630
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 07:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=nKYOaiZm;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783090026; x=1814626026;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Hd7Bs06mVqC8Jovc7boeCIJOOMsFCKMT9VuC1LgG3mg=;
  b=nKYOaiZmpTVvaPV8asTwbM48Aleey5vBRCA4HMwsz4ijFnGUgatWSA/I
   /83bKPEDy3ZGsuT1x2YjRbQ1W/WVrlGA6cb4v2pywwUtS68gNyQZLYJVA
   M6/TB2SwfjPFXL8yAU0lDxSe4d6UngS4zs8alCe5PXErMsGZ+slQgyp0R
   6s+Nwmd8uP6zCZ8WfiH4jAie51NKI1yQoow2eU6UKTzSZeRYdB0WEihdw
   r8oFmGcISZ9eO2lXIE9nQ7ObG3xnqIvyFs7pyqqo+AyufgwBjgd8U1DMj
   uqKaRoXeu0xhXCLT1f3jEAUAfybtC62zgV1D7DY2u4lVYZnqTOQybSs4L
   Q==;
X-CSE-ConnectionGUID: 8rCvTne0Qr2lR1fJO0Ldgg==
X-CSE-MsgGUID: xM2sH2nGRZ+kzrkcYbf9FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83714038"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83714038"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 07:47:05 -0700
X-CSE-ConnectionGUID: WdWw5v4KSyWGAImZ4edgVA==
X-CSE-MsgGUID: 2JoJTSqqQ3erloots/5vzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="291276133"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 07:47:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:47:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:47:04 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zbj48j8fakxXPH/7E3S3pN1rGZHQmxYucDvJm+urxE6ptw0q41Dh8ieYuDkE2N5fql7Q23qS57sZljIoycT7bdreLt9eczvVIVwv2O3de9BR9cVT0ejuh8CtQ/GfWwG7Z/LcijqjOwhEzjUAdSoOt5BSq/tbd7KgMPAdWOf52clnIKqyb5uz5LSXcjReFX2kjm1GtTqvwf0omUHDFSZBkDn+RmNk/DTlK48qvJOFyocJqz3GoBVrUdJLukQJVT0nVYWcKTNb2OYQhaBln6//9zQ6w0GFVGw+34DUwS25UJVAf8YmZClhKZl7hml0C2kUqRQ3M70DhbNLz6G0m8uIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYSl6stOWctQKpKbUGw3nIWRY6t/0yoK8Q4WnFfHxBA=;
 b=ySK2O7AX/iGg1aDEh7e/CYOFyfcaR9nmc9Ztte67+ASmLvf11LbGzGVRv1Mqdn8ieibUrZfgIMD0Jewv4HjcK1zKkT2V5bUjXMki6uB9b0YxXZKy5UGsPyY+4+8cwV7yi8AM5x25xPLWbjY0rQSMXA3HnjkQ6EgtKI13RMkeJuc8IHNUVDY8W7EupcOEasfM5jklmpCycGjINLsZNQJNR6mFlKsX2e5CjbvYN02kCeQORsVqZ6G05dfMRdXY3SrF/i7ddeKEbucCIF2srkT1kFRm/TOEN+x95DWl319D+oynrwbMjsCvI+D1udLrmHrjnOgFlbS+PmDF+HiE1SBetg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 by DM3PPFE441933A2.namprd11.prod.outlook.com (2603:10b6:f:fc00::f56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:47:02 +0000
Received: from MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38]) by MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38%5]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 14:47:01 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0.2.rc1)
Thread-Index: AQHdA/tAexVBEP4UsUONorivJ3Sc27ZVOOUggAaz+oA=
Date: Fri, 3 Jul 2026 14:47:01 +0000
Message-ID: <MW4PR11MB7029AA6875F8FA78877A3BA3F4F42@MW4PR11MB7029.namprd11.prod.outlook.com>
References: <0101019efa95152e-9cba1b64-0ddf-41fb-90cf-0a6759e35a91-000000@us-west-2.amazonses.com>
 <18BD7FC742B4D1B6.1079487@lists.yoctoproject.org>
In-Reply-To: <18BD7FC742B4D1B6.1079487@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7029:EE_|DM3PPFE441933A2:EE_
x-ms-office365-filtering-correlation-id: 752fd23e-479e-4236-7df8-08ded911f127
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|4022899009|1800799024|23010399003|376014|4143699003|11063799006|56012099006|18002099003|22082099003|6133799003|38070700021;
x-microsoft-antispam-message-info: M/MS0vdyqPJQb9OFxvfWyl6RxC1fI82BOy2JCqKKvUG0me9+H1nCwgSmAEoawNkfUvsfFtYtss359CsVZYHVjBh/vHvWL/pePo/CsdoLU6Xb7YNhwODWKXh+YsZq6IdebLBHeuxIP1F8a4rIgx11L/EjnSjx1xeq7ZKDGnmdAmmh1V5obi+Pt5naix2lP5COM8EXqlMtrnsmwJRzQmazrIy7cQ8glXariKFRR5Qrm2RxLfWyDVtF4Dsz1aqskVTSqEnI8pMdzOA/+oKQgGUpTK0Mouv+55isrCUcPrLq4ua5H1LR6lzfRCWWVTQGMZWdC1/Rxgbi2LegamFkXyl1UlKNtJ8RW2GIQPWDZsgCq7ZfTFdUVyJsp+rp9bj9cQETInFS61N77c5vkRcB694xs4EMEQKfetpDLemVhobTjANw5S40RWURn4FA5yxIUbVMm5I7PEqddwwGYfsd85KPqoxtzz4+pNkW5V2SRtk7FOOWTMk065IkwR4VyVbeiorIAglO50x0GeeAzZdSKhkLo1cIUu5MK7s3FsMiNywtkFLV8vXQeH3hnA+13ht1s+sPYEuyQLI8KrNK7liAetl9mLSktEf1JqhxffDsdoF6sY38G8tRIfw/c/MJkNh+9lSoA+U3VUh6XtxBXvNXRCzCghTC66C6djvAtgfQJLIAhJ8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(23010399003)(376014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oUoFPYDl8MLlZSHa6km/Dyi7Nm4eHnc18K5QFSKjfx+gwuvB2XybTpIOnlAx?=
 =?us-ascii?Q?eL1XLDyHT3cA+2AU/lwueX8Ge5ZT7ndKcfrT/tSAs2XcKrq21CjIadFYfCTb?=
 =?us-ascii?Q?7Bq9jPhyjuyIlhM6gGKbPZIIDTNSjMnJ+6b7DkbrS1sJIcw/ETNilAUdaY0r?=
 =?us-ascii?Q?2oyB2Po24jhj3nXDFrlv7kuxErvlEy/6MAaDIL5g0OEoqwoiN19whpSRM15l?=
 =?us-ascii?Q?gisaXukq/wgM7q0UYy1bxmr3Wv7ZYQQLxBfCPqhe+ZqOzkh6ZbYmiJxXSXG7?=
 =?us-ascii?Q?OsQyPRV6KHkGSiAdmcy8QCNrXX+OXdXj7FiDb/HTeE3/O9JQWD7AiXB0yGKm?=
 =?us-ascii?Q?p1rpzlh573nFOWv9iw4kHcJtc3ycKsoIn73lmlMxzAKz1ionrO/R08wjbQ2T?=
 =?us-ascii?Q?ttFEXhv/JWpT0RHy+CyrGQj8hHrUDlWcpQNHgQJf/ll2j892yYjrwScilTYq?=
 =?us-ascii?Q?5gsyooymqfsPDSLOUqCWBb/pKJZcEemOWhJ6ZBPTNrpdfhFpfNlt1BeCkNq2?=
 =?us-ascii?Q?a65tA8vbZfwsVfl7FNwqddVcduZOKOlfn43U6a+KFiEQLmFIk2DmwWtaPoLB?=
 =?us-ascii?Q?ED41n/Ltk+u6+J7AzrKSYE2LMA0YPjXoGM2zInvvoLcYrCs2s4bVrKs7WF3K?=
 =?us-ascii?Q?WAfusjxJ9lxvu14pjCwds5Dm7k3gBqZl8eAtvo9pyBzXdA0OoMvhW0R6e/8O?=
 =?us-ascii?Q?LZp3x3t7SkP4Pge7zliXna4iCWXHygkccY7Z6DGkAdvFIU77r/K1hVQh/LO+?=
 =?us-ascii?Q?newgC4pYK7ejAnG1y2ffbitFEHL/kTvOftBhqV8WhxLdch+vTALU9s3D9Y6v?=
 =?us-ascii?Q?J4LNnImo+3fsmDat9dXaRipxeuDAvN2qCNtF4UcQV6cdIw7C3k2D+qcFI/9i?=
 =?us-ascii?Q?bJiabMDuygjnh99cwsG+aTns/0oTE1T9NczS/AIYtYyO6Vps7Mu66Pjp1Vxr?=
 =?us-ascii?Q?xTlRtYnanHg7vSGBs3gWcN4X1y+YoQPjEhCrXNBCbTVTauGSi++5nDkQhVO4?=
 =?us-ascii?Q?Bk5XX4rxzvogfem57gpjSwAoc8nHIL1k7SuuIOYpnLjt0fBsIu8mz5CR0/Fs?=
 =?us-ascii?Q?5MHivODdrAkdT5uF2sAW2Q2+k7lamlRt6oZ1RCcxAPJ4CodK05cnTZ0jCeM8?=
 =?us-ascii?Q?n56Y15N4SMkvqiVoEGwfvnCtHRz+qaCvpqE2A79lHAVSRIuHFGAEi68h0ntj?=
 =?us-ascii?Q?OGyujqbtHvJxi5RtoNMTeNnABhSQ2nnG69zYq2lpYKR7NM23Vur+IRS+lyaN?=
 =?us-ascii?Q?M94+3+i8JRV1hgpTQwx48VxYGDmlEGAElt2FQ32X6tcM0hAUsuRD0/++zans?=
 =?us-ascii?Q?nMRRKusLtNm5mRTO6YHpE0D0+BuaoTU5pvgxFMkStQefq3srmD3cwBAbuNus?=
 =?us-ascii?Q?eIeLdXDBYYa28Iha5yZO/+OTsgW0I0Q2LwAUrqxumwXV7DqFZ7wWZAn6HyYX?=
 =?us-ascii?Q?yV8ELLoMCuRZN2W8sncL73FpyNVQf49oY9dGMfKr13n1PnqxbmVk4TqQdGan?=
 =?us-ascii?Q?C1zAo7dzWxrF/ripzG5ghYXE+x0ESsH4GktufcRGnKCZ0Qt7Ue667XFyJfgQ?=
 =?us-ascii?Q?/j1BfVdE+5mecbL+RFigESt1f4zD4YAzQuPyDWCXD5Z5/oP50qW0z3p5u/56?=
 =?us-ascii?Q?csRniv8GzCE1WpzpGSkL3aDEDwo5IVNa2EQHOVJvssQpv8hxss/vv//z/Wzb?=
 =?us-ascii?Q?PdK7WhP2m2SbdhsCjSpEnNyV2vZ+HZ3nu3RBsQIJWPEsxFUP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nq/NdFdoufi8Fk5ybIjl/U4Is7IpRcuYxhFOxujiJNqcpTWHPkibn8lQ9DmTIuVXi1UOfJtOtKG6pOHd+EFw5n2G8lk8J67BF9Kz1cGl6a2+6Quf4GYmsTEw60+kQ+VvZ+HchNkPNK0QnoPYmZfvGebfJlFKt4v0EitIp2yNZRKfz15zh8CkIQwSw8McxPJeh8hfJWK2w9Wo27iAeCDq6moAXr41cVvZP5k0oUTaVw1YVGckhOyLMFmKi2jyKbryxG9DqGAMya32LOOfSOzGF1yzEFR8uy3xKM1Kya5EQvOngBnYWNUPRaJJsy8yKvT7ovxwU20p23Izi/i5st65TQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752fd23e-479e-4236-7df8-08ded911f127
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 14:47:01.6272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oo9DDtNLl31daQ+ei5T1nmlaxYVaIDEw4k1NVURfy4ddRSQxAJZEROZ2fkJnF71Di6Iak0E3uDXhOD9MhRP/iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE441933A2
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240119

Hi All,

QA for yocto-6.0.2.rc1 is completed. This is the full report for this relea=
se:=20
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
Sent: 29 June 2026 13:55
To: qa-build-notification@lists.yoctoproject.org; Yocto-mailing-list <yocto=
@lists.yoctoproject.org>; openembedded-core <openembedded-core@lists.openem=
bedded.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-6.0.2.rc1)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-6.0.2.rc=
1. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

Alder Lake
Panther Lake
Arrow lake
Bartlett lake-S
Amston lake
Twin lake
Beaglebone
BeaglePlay


ETA for completion: 03/07/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 24 June 2026 22:32
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0.2.rc1)


    A build flagged for QA (yocto-6.0.2.rc1) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0.2.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/4076

    Build hash information:=20

    bitbake: acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd
meta-agl: 3c55b45bf920bec93938af02f2452cd698d3bacc
meta-arm: 01c33e494636781e0787ccafa46cc0102dd68869
meta-aws: 5e7cc95f7d55a0ba0ae6a7e6e43e6323811a140a
meta-clang: 78c5e12f08198f4f257a9348516d2103cd617c1d
meta-intel: efa8a9b22ffaeecfdd113673074496d377ca290c
meta-mingw: e2aac06ec74e46d08b7e68f61043047c761ae9f9
meta-openembedded: 100027977216601000cbefc42c2ff6cf667e7b5e
meta-qcom: 61c71e0c6d6ae13c325d60fb6003e3bc5ecf85eb
meta-virtualization: 781735b97ae5013cacabbecd38e6da6b510cf3fb
meta-yocto: 24c24cef5d1523fefe43a3e3d34667b37ae551f3
oecore: 5d1aa5c806c061a2994f4decb59016610f093213
yocto-docs: 2c59a23fc39d92831cb55a0e5f713d20f94730d4


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#723): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/723
Mute This Topic: https://lists.yoctoproject.org/mt/119960549/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



