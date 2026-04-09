Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16F0EA3C5E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 13:06:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.131962.1775739971517528723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 06:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=npjjM2xB;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775739971; x=1807275971;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=pCP+T9noMrEFnB7/AMAxryPJBfaJs3Mx99P0YsBQAb8=;
  b=npjjM2xBQyU8aRbweQjrx/HkxtkudXozLnqKZaxdXGKax4pSm92TCGCD
   JJJmMB1yGmuD99UAjUSaeoRkLiulb7u3LZt7IZzBKGWDuY0g8TOUSL+t1
   J9rf947nSzHQJpxUyrDHqOx1ccLyFX3pZNS+r3VX3JZdAUhIK7m84RoL+
   jm3IqGU8X6FXy6pRYXiLyqP19rSV4bQVcL2kWn3fdssiT8FdVyl7jrWeQ
   i05IZ3rBKyAgZyUzVN7Ht2xCLfjI3V0VxtisesZ5QiTUkJGCdMbXt7aV9
   O/EYanruHMOJNjE6BjSvQgrtIKK2sdN4MmBJJ11lanndNPY3G4+s3FIiN
   Q==;
X-CSE-ConnectionGUID: Xpd3oHmoTJa/7sZzbAIwfQ==
X-CSE-MsgGUID: qiQ2iG07Qs2QWQjDXVag5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76461040"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76461040"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:06:11 -0700
X-CSE-ConnectionGUID: 1ihVa2RWT8KeVzeVcvrojg==
X-CSE-MsgGUID: R6Nr1LEiSzu6/qk4IuiRbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="225610908"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:06:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 06:06:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 06:06:10 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 06:06:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nY2gp5uOrjlQkq3u7ueuSmRgxlKH9KAFnwa8dvFgrXsdrBC5cVAbUzy7bg+1uZ1hJc/FOxa6w2ijDLciv51aUnjUCVvffJVu7eUqL9Db2dveRsMfwqxO55QM7+dVjddnDz2nS81ylETTVwxA/4HERy6GIYyF1dqQBIoQfiiE+XjYErXyyO94C5mFRz5A6tCSpQjEn5KLtWAhrk8ExQSDbsCk+vKGWWHhkzpJgTTpZ33dmI7spFb1vcV5It8naIdGm75xBIx7ZqVdNe7qfp00ebIiE3iVWhczOb7v9zY+n5DN7TbrBcYZLbmeCdbp/H4BvcMcEKJDWHr2WYyWTkDjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CC+g60t8p0uXp7uOR7RMxIO2eS1IY1oILU8oe3NIdzQ=;
 b=URDToZlurziakqbsifZFIk9PysNDYWgOt/4fMjyAAbx/14dBvPDSfI542VR2BelIYTSlcFojPdBXjQISU/MJR4cd2m6jZpWdPNz/sa0t9C3P97f9Srx/JsxfdI/6VY2S2HOWgVg1CAKbiMrsvWT+ooj8cVKOKnK1Ofboa90tF7Uofm44gQ6OldvhMnaZgwWm1ZBRiDtDk3mARamTxSTfGXzno9tfdNiAcgXS1zLhLl1kXBTG7sNOXWUBypsyM+PCWPdaH6jRKRlvoWFOF4whcQnc58/fTY8gvy3OdZ8lKU5S9ztY7ApfX/5C03nqk/fZMIWCTijVJkv2iBrbnzbnMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SA1PR11MB8794.namprd11.prod.outlook.com (2603:10b6:806:46a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Thu, 9 Apr
 2026 13:06:02 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9769.015; Thu, 9 Apr 2026
 13:06:02 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.17.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.17.rc1)
Thread-Index: AQHcwr+Z1uFm7+dMSES/hscBpyn5r7XRpJXQgAUWXSCAAAKT4A==
Date: Thu, 9 Apr 2026 13:06:02 +0000
Message-ID: <SN7PR11MB70187F557EEC9E6EE849B5F6F4582@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019d4f125330-7e1f1d56-809f-4925-a977-4c36436ac0d5-000000@us-west-2.amazonses.com>
 <18A3B363E9A5FE35.777565@lists.yoctoproject.org>
 <SN7PR11MB7018623F2F8B6E8FF3D356B2F4582@SN7PR11MB7018.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB7018623F2F8B6E8FF3D356B2F4582@SN7PR11MB7018.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SA1PR11MB8794:EE_
x-ms-office365-filtering-correlation-id: a6af14f1-b164-4617-a7d0-08de9638c043
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 3SShpffwCkJTTjA/DSOpmJ1Zvn2wepQWpWBf194uen2vkKdDsdmowxq/VSXGGo/aDfsRw6U7TjyALSetkiBN3Krs66raGJz6cROr4byXAT5wsvb+PiP/P5Tfl4LlQLSjHcfoRwZfzhq17itSEFmGoZdC2qzQlEsCXv3PGyGC288vZqcQJl0QyYXYUhRpu0YgSX0WJIwGGVD7e//6XsHzG/t8iiib4NWn05RFd44RUXurr4gh+H/iqQETu36XrNw0oOUe8IgEKsLmE/GQ08iNLTnZ5LEl81qRLCtzMmbWjb5wwABuc9/S+TCSbmixfxWgittd7d0UtKZTUxmlnuaHZ30U2oCb6GuBCf/QO45/6n1tMgtdnULIBqwRWwC6oRFglkSuhWKYKxr8nXthtDXmgcEOBiADeJZdZ4e9Kg6AlIpkrq7XTEP++GBHV/MZzwaaHGkbZ/WVR7aZT/9bSuaC7IG+3a7+Np/XXaEN1nYNsRdCSXItfCL7kFbzkIbYw3ZIS2BKNLoBguUbjVazYUvHR9dz7YBH/v5Wg4uXE0Jwi0bu/Xv9rOLz7FjufrcTSXCLpHWDsia5lB1+GeJCkWvtulAuM8COgT5MLMmlgPtQ8Xbbugv9k9REJ2wlZ5isK5dl0SXxSYNth3tuOPTeNcZQpKFkU2HDMq+uOon/Xt3vVV4oEq48QuVmdW0JvLI43E8WfhupBaZyKY2iEzavG0vHzYmWyNVN/MEb06jvCDuskbnpZDbQW0v5WGlX2PvJEBZS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pcgp/H+WZ3Ss39lYUHfjxACC1MWqLhmCvkqo5M+8Nq+OIDpIycFNhUAqvKnR?=
 =?us-ascii?Q?Bn6rg4WwuGQsuExDjjV4jqkbTDGNa6hxenZ2paYUsgT5RvzJS+A0bGdZTCud?=
 =?us-ascii?Q?292+7ycVZl1qbbeQL0jyXnTpr8mnJ5AwuRgjj82LSQZMc3MLAa0AiXNjb/w+?=
 =?us-ascii?Q?BhKxOvkO2jkZYlu3jwAMOvEoiKLemkq+Ey4kLNNyh9xYvkPSiElm9F75vAmi?=
 =?us-ascii?Q?vvGtxEEctK4yLXhPV6TJnBZIWAfTglgYWLcpm6ln5G3D3sF7GEXlCzNTvR17?=
 =?us-ascii?Q?lmLC0092igXODMFfdWgS7VAzRMnR/emsUK8Ob2ltcARM+gMgW/wWS2ESZSeU?=
 =?us-ascii?Q?QdyJTnYdZEh4ucJ3QayqM6ijAlgbUfDwt6pYq2swkoT11jnlwW2YpZQRoZhE?=
 =?us-ascii?Q?bQaJv8sutPXm4dEBDkCiMY24t5g3dXft6mtxMY7K+glX2wd43C0ygvzT9DAC?=
 =?us-ascii?Q?mLIISHcRWqlcWxg5jljfoheIZBSG7+jeAYMvHZYVgu6/tWeHNju3A3XZm/IP?=
 =?us-ascii?Q?HBO/aazwX11rg4xDokTbYKWGPKKGKK6RxU3Yx/RgMRdXtnO6HV27p1IPOKGS?=
 =?us-ascii?Q?Ecd8m4u/pjcec1AWATPdgNSzrF4FPtzP76mnjpm5ZYVv0vPKaxD6ADv9B3kW?=
 =?us-ascii?Q?tDMYYyq3CYcyIa7ZPKX8nnDT5FNWhosbDotPC0BdOInJcGOMmr7ZbPMyLkxW?=
 =?us-ascii?Q?VSQ/JS9AIn3NPDg1diTOm/uHyUgqmm+iXHJWQL/7YZZSzTRhzpdoskEq3b2X?=
 =?us-ascii?Q?qIcY/zrGL+FoNSIIDwPXCIh3tT8RxgJJs/hY97EvCmV6CZk8XqnMIW9cibbJ?=
 =?us-ascii?Q?4deutXJjyjgH2ef5XZ5qPBkLujh6agInpHpSkmMxkLOUwChO2BfumqNRrzcb?=
 =?us-ascii?Q?nRIjZHwH72Da/qpKiMnqmbY7p1C7YylqFoUPtVbjK8djaOKHGXKN48ZI6XqV?=
 =?us-ascii?Q?t7BjtywPSPdRYTHDX0jLBtSP15IQq5JBnH5MNMBuSgYh0q2CMvy7WGW7XqkR?=
 =?us-ascii?Q?KFADrZwRoPOxrOQHFOzFaJQmpVNFiP/W2LaE/mOlE61I1p7zKDCm6Ua88AjS?=
 =?us-ascii?Q?yClcwKicMYprBzmVLJkzPrp+Z+EIPbpaZ7jzsJzA7Tzqo1fGP/8yUqGUkv/e?=
 =?us-ascii?Q?jCG2h+OPVGoEG6aQv7il/7MDMNGClGP8KzZWvpMGcjoEyAxHlnELWu2f1HHJ?=
 =?us-ascii?Q?io45q91dlJmqKqKDj9IoKnVY56BtjNWUsksb3XMrSY+THOI+ZhEc2d4z/VHI?=
 =?us-ascii?Q?HsGpr8zNv4u6n7PZjMkEK358nZFcG5SkvLLNmPWKZlM1LQJcEKbH/DJ8hvto?=
 =?us-ascii?Q?5WVHnfUfe3scStgIL+9qxN6PFMGXeBOWBpvAI1hmsK8mUSR/y3gcAzADLPQU?=
 =?us-ascii?Q?HRVcp3Rdx2gMDQOe41Zh70F21DStK9kx0rrR5dQMqK5FhpmZGUgmaIccxBkn?=
 =?us-ascii?Q?By7f2vg2jTe7d0qmN2GmRRBjAN+veti5OY84ADCKj0E5Pp4uuf/IMBfeF0oY?=
 =?us-ascii?Q?JrVRriZwyfhvQcFuIJkmyUPIhMptKeUhJ0Xf9s6je7gHqerVSoc4kaXkTcOn?=
 =?us-ascii?Q?zfPjESJNeCa1Rzy3BrnmkKHGWUuvbjAGSbso34UsRm72GpLVjBugilFIA+IG?=
 =?us-ascii?Q?o3GzTqUTDgQAHTxNS0jiRZQwXWxWT4FoHL9VU4bH5NiiOlU47u9BCo+xScBh?=
 =?us-ascii?Q?QaMxIRPBVpYkKIzux1JCUv4p+rahGUEzMOHBUxtvcxokjez8y/pvDRsWMqqT?=
 =?us-ascii?Q?L1vEFYCDxg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KAW1qz2P244d7cxWSv0TGqrYOg2lsif7lqb/erFj+Z/UOFdJPetuhzF7COXV944QVWjlRSgwI5xWqjC2OLZzhG0aMiThPVuBeJGeeKkj2PlQh+NpnZbPsuRvzM/yEvQc01OUKWFkO46hj5DIQ3nsrlvZ/H+NMw34mtrLo1toei6gZxdO+PnfgUJVhLP/mr2Rs/lnC0IGRjBakWz3poPQtm5wapjXB7w2K+H6vJZ6vIWrxNl+ISNyFqPWzvX50zd5zHjAozfrFTc8Xbyu8gEnBqJwsKAgaRKSCoEXBRRqL3W0j+bcOpMSsSCtr9JzPEl/Rj9qr/i2Rf9jpGcLdIKQgg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6af14f1-b164-4617-a7d0-08de9638c043
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 13:06:02.1075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M9B8jv7ZSsb3bAhjDQgT+9sHv3qaoAJXqo+eOp0/7Ya3lb50ygFPFok498oydw3lSkIYZ988blWwVJkG43kEJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8794
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 13:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234915

Typo:
This is the full report for this release:=20
https://git.yoctoproject.org/yocto-testresults-contrib/tree/?h=3Dintel-yoct=
o-testresults

-----Original Message-----
From: Ghosh, Debal=20
Sent: 09 April 2026 18:31
To: qa-build-notification@lists.yoctoproject.org; yocto@lists.yoctoproject.=
org; openembedded-core <openembedded-core@lists.openembedded.org>; Pokybuil=
d User <pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-5.0.17.rc1)

Hi All,

QA for yocto-5.0.17.rc1 is completed.=20
We're still in the process of configuring the MinnowBoard Turbot - 32bit ha=
rdware which was in transit from MY to IND.
Instead, we ran this QA-cycle on additional x86 platforms [Bartlett lake-S,=
 Arrow lake, AmstonLake]

This is the full report for this release:=20

https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults


=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Debal Ghosh


-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Ghosh, Debal via lists.yoctoproject.org
Sent: 06 April 2026 12:49
To: qa-build-notification@lists.yoctoproject.org; yocto@lists.yoctoproject.=
org; openembedded-core <openembedded-core@lists.openembedded.org>; Pokybuil=
d User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-5.0.17.rc1)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.17.r=
c1. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Meteor Lake-P
Alder Lake-S
Raptor Lake-P
Beaglebone


ETA for completion: 9/04/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 02 April 2026 22:12
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.17.rc1)


    A build flagged for QA (yocto-5.0.17.rc1) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.17.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3577

    Build hash information:=20

    bitbake: d3b4c352dd33fca90cd31649eda054b884478739
meta-agl: 6937866399dfbf3f37764522545426fde3f9f97a
meta-arm: a81c19915b5b9e71ed394032e9a50fd06919e1cd
meta-aws: 78fc3cf6eb3c8f7501d1ddf05d1787c43526b11b
meta-clang: 5bce7e26a38a58bb52242494e54ab2af40009574
meta-intel: 5d153e35b4e752505efeae368f188fac5e31cf33
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: 06f846a325fde423bb0a6d49d771d8c1e144d7eb
meta-qcom: ec80a36bce11d8182b4bb2a6fa0359adfeccde0a
meta-virtualization: 3dd635f613f7299d986a8ab6bc9f584370f8ed1d
meta-yocto: c7c38663a1cafb1fa8593c0b246811e51d3bbe20
oecore: 52380df998b3a8fe6a091f8547434a3231320a8e
poky: 1e8099846661571ede077f533eb1b6c86818ddce
yocto-docs: aa7226705451e6c1ef964d49963bbed29b267c27


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#680): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/680
Mute This Topic: https://lists.yoctoproject.org/mt/118636557/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



