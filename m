Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AE6C54E68
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 09:44:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web10.3271.1711014288450210931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 02:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Pt/nrHm+;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711014288; x=1742550288;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=bfnoLgNSZ6Cz8Tms7R9Rq2AQCK7Ih4U2ugOMgpaO93Q=;
  b=Pt/nrHm+LsfNbsgpAfj6kYx+JoA8XQ+3Wym8J9dc8kAYun6d+D/0vI0Z
   4REbgCklDRtdhS38BpCP2VNx6zIbM2OpjegbdveuX+vDuYCc64RPVNpJK
   n/Dtl58UuifNjVrHpQGmow9tUgzcc9m1PPzLbGDA5TlXcYIntkpE/ld+X
   m7Kuawv7bPetyHIg52nCS9RF+nI8trN8P+Ku5VqBKscc2bVUBQqxjak+W
   OtbLUXOrmJlyw+qCcmXCgy4kZRja+lOWS50Oc1Po+CRfQzLgYHZNkBWMn
   gxF1IyhHOne+iGa4vBiQ31rJsXNx30FequglmClT08Lwfmgnnrx5kEN0M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5844006"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5844006"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 02:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="45555686"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Mar 2024 02:44:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 02:44:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 02:44:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 02:44:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ75NTKOI2s1lbAy1bvZbLEOL2AqpjDUGAlXEZcnbdzgbPEoh9WmvbHhDMUdAeoH/R7iMNUyIj0icdOM2zYWXZ6D3+wtyDbN2t+o7AE0ZvKD8xODsrggPQRUlD/A7xLsRyCUX3d0R4OkKLohOM7u2GRED+OFzb62QcARLbdd66X3TgFX6O9FktWneu6RyE0pKjOyxFXKTxM0Xe1QKmdAHOZyvPQZJJbjQdaBG2REFBxBPaUwSG0O1CXMStPTDnAbfsEyrKr8RZ1Lciqd2+LMZpHpgFd4rvREIlBv2nBhUoj0ze1vmEyDc4WYEuzHlHTlN4IsjLEApbBOjn1V4YwbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4VNO6ltQnDF8O9g9QUsHTVEQHsT/u8CHnTTyPlDyy4=;
 b=BdxAxatxXJ4x6wgQwIpgnUnbAREX+MJtgKtMPtPn3WSsRRTVEqkw+pa9rKkfiJA2rYm7o72kWihpbIwkLoACHaTYxLmIlCYN5GddaUdlpNBozRrjo4KfHhb6WEpTxOCHn3rd8HD2JxhAs/O2jwtyBgLeefc+yPv+5FVmYIXLX8xoPB/I7CCJCchNFS0t4+pQQ7ds9W4u5cHWyF2r1Ed2F8K0CGdxw0WK9oSTu0TI+erkpVR1FMG48BHVONFL2vAemKCMSj9B83eQ3WxIpPsqwIZO+RF+niiMPhKSnnX4FNlLwqT4+En/nsP+p+Ot2J/liZqJFMXH0JlRCerD0EA+Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH8PR11MB6804.namprd11.prod.outlook.com (2603:10b6:510:1bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Thu, 21 Mar
 2024 09:44:45 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe%6]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 09:44:44 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.17.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.17.rc1)
Thread-Index: AQHadaMkVPTSlLT4IU6GRGzQay9sM7FB/UzA
Date: Thu, 21 Mar 2024 09:44:44 +0000
Message-ID: <DM4PR11MB77607FD85D1E755AFE081F30A1322@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018e3a457956-327c6d93-de66-472d-859d-7bf581132908-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018e3a457956-327c6d93-de66-472d-859d-7bf581132908-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH8PR11MB6804:EE_
x-ms-office365-filtering-correlation-id: c7cc80cf-6a29-4633-bb63-08dc498b89de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5ecnI8Z4RULXOx8S++COJDXWSlF5zJiQXLjlLjSDYyvS0Cd8v3TpwCkTWLWZRAe7bdgdVcQdcF9JJxHsW4GxSa1e/uY5cWa8mrhVBOTPT4BMy0YOIIuLV6viPRqmHShEHv7qYSgtj5dhDU08mTdaRjD8SAJkPqoDOCl9h6Hvy3dqprtLfB8j8HAxyxXoIwrjsUu5K0rNmY604x4fpakr6A20lj7gIHSmV+qgUHDS5N/ncfk2KxU5mumjffBDTilTtGgrMMlwomle2vPP9sGz0CM9C3l6pmCco9IiZpleDckH+k7UBkqTwfeov6yKuVfxSdmby2H9RU7Y8nmWqi8WtUdZohdUEgTC2QUsuQYJAvVrVbZDDWMZnm1WHXgRtMWRg3Dlg8W7Zwi0mGpy0BZ1LSNi0WAnkw00YrbI80RSSauBwtoMMdfcGuqRVU+ThBGC1ot+rOL5ADIKIGJWOhnTZb7RqzYCMuRyyJ9B3Kbqt/6IXVN1vrqRrgNz602QYrYoljeZL/gLXV6VMG9Y2jYP7RvSlZPPeBpo0kInUO3yr/hddoEzg14DaaFNfIFfOndGncvYcKyfB3AnwGtzKs/BRbt/A2m78eqh4ABfyoLOzURW8zIypSKnEdtNcc7d8BkFBTMkm4NUs9GQFoOhDLIR19Vw4Jizdw61UXzUmZ+vP6dy3bBSu0IBrv4ifKBiV02u
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nRPh7mL1HaQ/S1lxjkk/Kwj+PJlGYoHTH520tVNWdhoAd8szGf/5VlVcEJ0j?=
 =?us-ascii?Q?2jQsgpwAeMTfpL+A1GqljH4CfvKqcSeanf7hPyrzVF9cX5uD6/WA5IPORVf5?=
 =?us-ascii?Q?oYndyaREolOws1dCrrZBUdrcGmlLfDmQDB26y4x8b5HfkSZAv8JK2xzm4NQp?=
 =?us-ascii?Q?Kkbtgz9x9QRs9OQm0c/Dgq0d8D0FQOnIwVeEIQZQu8oaqI321wajJqN/N0r+?=
 =?us-ascii?Q?cOOYuCupQLqYiqYpRmroxFgt4o10Cxk35owM2fHt26oVQ3ddx2OArBQe52iw?=
 =?us-ascii?Q?ZNQ+UZ2albeHsK0FgYzHj5OoQRlsHTnNT5VsyuENRDZFKl/q/ivq0P1oekUQ?=
 =?us-ascii?Q?t612LvIw0v14wA10XERE2dy953t6fRjUGrLSzODKbLYRvn9+ND7etPC7990S?=
 =?us-ascii?Q?0ckmjsSrodbMtOw4yZYUpqO54gIv6YAN3+Zn4lmz6CBw5wtDgzlmf6HAd/+d?=
 =?us-ascii?Q?AZSol577PkO+s025E/oi9hqEpPwab8SG98CcdvpmcLK+Q/Mg5lF0J8ZqZQCt?=
 =?us-ascii?Q?P0hBRhzHVOJSTs8Hpkd/Ipedqyb7Lp1K4HMr5tu9xClG9kQ2uAOKCKETyEUn?=
 =?us-ascii?Q?FzLVc62ji+7/DeaAW4x17Ds+oh8miXEUOvaaTlPdogBPU2bB5AhDOByHWAXc?=
 =?us-ascii?Q?j5fQ3V9Y9IIZhslXfNSR2Nc5Co7dl9JHNSjBvIXO4Sh3L25VZiHw2T3eMrpH?=
 =?us-ascii?Q?Qe3FGPrrCPothwyg5Y1FcwEvD7ZT1DQDA5eanqy32g952zup+S9VpBVSj7+m?=
 =?us-ascii?Q?eTN0IFQg5HWkV5XQV0uCMaaG1ttplxKzMQNVgSZaOB6tS0FIaCXb9/35y2Pl?=
 =?us-ascii?Q?mHp6vazza2MQkjMGi+wCWFQ1ijyqX2oKOWlYwOR/JOnrou1RWi9YvAX/VFr/?=
 =?us-ascii?Q?quT75C7YXxG4bDODJW2Qt/QcsOWZxWbI66DaAj4mkv9X+6VEMwusxDikhvl6?=
 =?us-ascii?Q?jggXYPqLgPoufFWfEJYCdMmbKgvwxfyDmhYyF3EG74BrWosACUxyiTu+qfHS?=
 =?us-ascii?Q?BkCgS5XG7C+pMeUM7aG/zpTkz2jKLo1tUQKf2CmOa0NA0FxpUBz+sIyycD43?=
 =?us-ascii?Q?MPpzjAUtgANer1A+v0OTgoOsoVI1uWD8Iq+nii++tw4m0qGKsj+7O1fGqUR9?=
 =?us-ascii?Q?zgqjlTR3Admu34MxSB0iEua5zRlj3WaeKLjv8P1aigsXXGxrmx6e/Qh1b2ex?=
 =?us-ascii?Q?yRbz7hiWlhjSnYOAPOE/HeAzbafT4Wx0nERw3fE8EOZotnSNdmAt0iAkhbNm?=
 =?us-ascii?Q?22SfiNFcX0xGKz1mkAObQfbIez3AVjq/tluv76xHldKr/8gYV9pzIVxYylrN?=
 =?us-ascii?Q?HVluYOOClyKtZQAPPCDNVDteFfaGUb2w/5YJwXAzwVk2SQYdkeem/EFL+RQc?=
 =?us-ascii?Q?dhefrr7j45kKU2U8wcG2moOjs5c+bzLhMlVk4GMC/pYnkrO/3J4iC6wz9AhA?=
 =?us-ascii?Q?6O6G/qediPRZ29gAixUtjhJ6toaUL7VAVK9hrvWq9AU7HWLIb8ZsdZP7weSV?=
 =?us-ascii?Q?GIiF9TKg8KoS3CRYQy3UmCUfni84qFyU9ITuhspxf6GTJIaLqPOlIhZs1ncN?=
 =?us-ascii?Q?oItr3Sumrmrmhx8k9Rfx0JmcwS5U8IayLy0qmILQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cc80cf-6a29-4633-bb63-08dc498b89de
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 09:44:44.1748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QU1q5u7qO6lunGSz7wING0anY/WKGdSg+e9ub1G9v6h8tjQHX9y4VPJUBq/VQPSxoUqb4BIJ0x4eKptA5KqT1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6804
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 09:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197411

Hi All,
=20
QA for yocto-4.0.17.rc1 is completed. This is the full report for this rele=
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
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, March 14, 2024 8:04 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.17.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.17.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.17.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6676
>=20
> Build hash information:
>=20
> bitbake: 40fd5f4eef7460ca67f32cfce8e229e67e1ff607
> meta-agl: 3fb5640211e4c3874036a6d4a61e852b348eb4ad
> meta-arm: b187fb9232ca0a6b5f8f90b4715958546fc41d73
> meta-aws: 11e0184fb8062c5384085e9c91339f76ccf191f4
> meta-clang: eebe4ff2e539f3ffb01c5060cc4ca8b226ea8b52
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f932ebb2544170f43edd22739f44307809bf8cfb
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: fda737ec0cc1d2a5217548a560074a8e4d5ec580
> meta-virtualization: 7902664f89678164b7fc90d421cee74cbec51cdf
> oecore: 2501534c9581c6c3439f525d630be11554a57d24
> poky: 6d1a878bbf24c66f7186b270f823fcdf82e35383
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
> View/Reply Online (#395): https://lists.yoctoproject.org/g/qa-build-
> notification/message/395
> Mute This Topic: https://lists.yoctoproject.org/mt/104917815/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


