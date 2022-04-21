Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4596DC43217
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.19332.1650532626267296784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HuGnoGmr;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650532626; x=1682068626;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lp1qdaiD0pa/jPgdhzt2jPRlwADdnsr7APv5jDTaNpI=;
  b=HuGnoGmrExcGfb1kCVIsnzx/p6Dsa92HEZv1NLoz6UBeYKUbHlMpDhNN
   LKB3i5xfDZDNz48rd6f2udnKl05SXntMOXf1gfLc71jzt8wKv7mHDwgCh
   8xcfu3eQ2Dlt3B51X6u0NKSqye/svoyGtn2LVDMLxQju/0nCcJWu9SeEP
   VwmcyjOM2QMGT7t0eKrfzoq94iusF6YdsIGUSl1nIxcO8dSF9pzn/tiBv
   0eN89oXp8cbgTjGCilxOqZenGn+on3FTQ54a0H0HX+pQ1QQGJgvFUMiRQ
   d6kbTJkJwOvviwflgBpeQmmDCbdi/BCtO171iMNCvRsHCXMp9QcYxM6ue
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324733623"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400";
   d="scan'208";a="324733623"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 02:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400";
   d="scan'208";a="865685532"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2022 02:17:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 02:17:03 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 02:17:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 02:17:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 02:17:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcJC7eeJ+jsAXbbyB5s+ykEx02havtkjwqEMts3a9pVGKex1gZ3G9yxCumv02S9tecEB4nqHWv/ydLj116Xm9HrIJtROjnWZtfJjRIOwwAZipjjcuK/O5nxVlGa90moAytbkSDGAc9sUmGOI8BdwUdVmzWWYGkXKSDA9c1SBpBx7cPfPt9Ts2LYU805DWtZ1G43w/e38OAsvk4Rw6IhSRkVjV1BE4COhbIl6nhuRtuA5PY2C6ag87VaqcXiSfLRd2ZRg3h5dKUZHl6LQ/+5sUnXrADmHyZ3FZSwfAmtRfbNy/seRuGrxWE7ug13Kehxs5RLjf+/xL3ye0Mj4WsVQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFIaTClE3YAEymvqyhQ1AXGwDjwMIjFPc6ok+A+98s4=;
 b=jCnNTh6a1ygdaqdFIAUqY3qZD7Lu05xSt+qK6ev2t0q6jU9Q6t3K894ZXcNRnKfbkBl0kJQvAJLPR5ms1QqGlju+mnG94lFJLAzwL/JomY25R4sduoL5Jiom7ksaOdefy0ZFtnpq7gS4vQCsxSct9+l73nz4VS97el+CjF3NdColWfOHifkGkUxjXCQfKfZIDlXyAuDCrTOWr3lbtl9WnkloD5ZGA63mghbBgvf56dqbiKHs2FN0Kx1ZgSirYdZ/t3GALCLeeMAg0QSkDBQfPxHG5bg4/5VpVFgpFZHScEmPdjVLr0Nq1iyaHEVOSN8k/Kjvny7//XMmVsKWGVYYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by BY5PR11MB4054.namprd11.prod.outlook.com (2603:10b6:a03:189::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 09:17:00 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc%5]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 09:17:00 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.rc3)
Thread-Index: AQHYUclFgW6X5ySo/EioJIz5O95076z6HT4A
Date: Thu, 21 Apr 2022 09:17:00 +0000
Message-ID: 
 <DM5PR1101MB234856022DCEDFFF1C9DD213BBF49@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101018033e03d81-4a7aff5a-1959-46d0-ae3a-e832d5bcf151-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018033e03d81-4a7aff5a-1959-46d0-ae3a-e832d5bcf151-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e93a5e0-a5d6-4d9f-05c1-08da2377b115
x-ms-traffictypediagnostic: BY5PR11MB4054:EE_
x-microsoft-antispam-prvs: 
 <BY5PR11MB4054EDE914726543279D2A0CBBF49@BY5PR11MB4054.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 H08BDQUzg280P0gAGIotsjFRaMm/X/gpRyQ8kMlVlWQteK4PVAbpiF9QSP64iBH9Gn+lBX6JovBjdhC5gCO3wt+RAdShwy3eyj/UsTQSPmdfG/xuCOWWZpY2PydWtA2O9uKFeCn0NY3esqnDScMoYQhp+E756JMgi4NXpiaRvLLgwmHUBDAeVBQJNTgSSkPpGjDK9rlW1r3RCmZ8v0f8qKGQtDYUeUfNxiGIwTbmullLfEIIKamoebhRv4Cb9QrQw28ullPwm+/oV8f49wFJsxy50QPMgZAjOluMVbqICqyjP26ty/GlMWXVJHsEuDCUzHKPCF4fE644qB75OM9J9ovOmQpmlwDmQ0JerPZDQfcN7uNbFnI3N9q8p2OnrGlqnIPhA6JJjObD2rywbtBReHvdnKgAYnVXUj/7OQA/EzlRdsVEtOm/7O7ePZM2Ifg7jIO4Dct0uC0CXv4CuB062s2CRu7rsAq70fTiKrU/dAGbYzZo5EqmgAzWw6SwsRhJIhFl4Y/zt3Wyg6EQlEFBLFAP1ef+i5f9rEwJR+wdVLcfr3y19zlYxqCwNO+ufVv/DLD2G4cAyd//19igXxt3r5h9fmmx/dpZW77aVWJkIo4sKYYu+YcVMtZ2M83LbhI15SF526nQ7eaRoepVqYMuU0fI5zis8P8mWjPrzSC6X50FQlZphaiyoTx+SiJgbQGWQiB1ID82BH9IrwtuZUlEiFaZxeNIOy1DmW7BnoIcMNASkV/qPSLv+h/AyXtGcWk/fd+LXZu4ilfS7a9Y5RSj/N5a6/eSMjcJ63tCizfSyOWwQuPZHDbRj+iHpsywPOEZV5pfoLglhJ3KZEi0HSsf4w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(33656002)(110136005)(15650500001)(66556008)(71200400001)(966005)(38100700002)(8936002)(7696005)(53546011)(55016003)(2906002)(6506007)(38070700005)(508600001)(9686003)(5660300002)(66446008)(64756008)(52536014)(76116006)(66476007)(122000001)(83380400001)(8676002)(82960400001)(186003)(316002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XtNdYoCMH32qgbTNpq/XUar/2YBmNmmmJ7AjiGry8895OJFDOkUThzjEJxrv?=
 =?us-ascii?Q?Oq8RcOLvR9AJfMoY2q0R5vv8RDV6L3OpI4Jq0KqRSVc53xQ1lMYZYDtJ67df?=
 =?us-ascii?Q?5BOO0MDgInBdaSGekLncxsAW1upsTxuYJZgAT38hFsSGIeADUx4FjUrFYR9c?=
 =?us-ascii?Q?Ja0+RKUTO+ui4e88RoFnYWuYPHdg37KOESIQqwkXUsmasM3KOVomuK4sEb/s?=
 =?us-ascii?Q?MzlfY3MtFd+xQgLgaiT3olAyEgmvJmi47XYHpK6XTWiEok2ErLifwIZY5D/4?=
 =?us-ascii?Q?GVZxmcYUN7EGFUL5IwhT5UA43xIJnevyEZVavO57l9MT3KuPdeP9I7Pg+yLm?=
 =?us-ascii?Q?Ie9lKbBar1LqvSadr8mzk1oiVWjXPghHom/fKdfPQA0UhIT2gvmuS7oe3BYu?=
 =?us-ascii?Q?WRFwI1+jHqhCnS7OvJ2/RahDEEr2cSRjPbs5/P0J2vopOoOKNhwACXA4lhHJ?=
 =?us-ascii?Q?yJuj73Nsv2czzZvMn74zlMZaNwomSYqbhX/RjCZbfDSplmgCDYCW9Zy9c7Bz?=
 =?us-ascii?Q?xgtw6+jWxHbuXv7jnb9IHrO2TtIZdX9kmlVgmC6bSc3aJCuL2hbWPfCnHHfy?=
 =?us-ascii?Q?/rSMPWoZU04dv524UI5xy5jkSXcNNDYg9AS8dalKU5PFmiHlZyLnR8nErQPm?=
 =?us-ascii?Q?6u1fJqhKaj35pRKj2ndgIM4oJWISpv454v0WiIW9JLNyH8CchPiD1B0vrQMx?=
 =?us-ascii?Q?l7zLQQbU3RzNKDINVljwjQk78eNbqbl0+CRP3wa+SrfwtUzGZwICdJ/8ESlE?=
 =?us-ascii?Q?SjEPAqOKTiFBZYeD3wTrVBhbKPYV+FwZf8J8WggzpvrvCaWe8a7tK5YdogLY?=
 =?us-ascii?Q?PIy/Z1zWvTexCqUnJUBi+Yd+aBy1+J0PuIZB9SWBeT2QGe/llFeEEGu4gaBp?=
 =?us-ascii?Q?XVWFLyUARrnSbKUq5ild9n4+BwJCbKgnPgoFUXG4LIS/YutQ/qDoTNTeUiNU?=
 =?us-ascii?Q?IwxGURM8s0czZbvhFoBv/b33NlK/osgSA6Zl0rKs6jo4y2EUype/Wo1vRVtd?=
 =?us-ascii?Q?fyLb2huWes+MpYQxlMJkPX6gPgSkoQHxUbFUso3h/9i/PuLVUp9pUmPcRSDm?=
 =?us-ascii?Q?PgWTMihUTvK0nd3Qqx7cIH5cAAbt1IIubD4eopxxb2NmZzOKCETXkWJLb7tB?=
 =?us-ascii?Q?zc2cwZgTdhVtufNwhuJjSP6UPd6pv1dsQ/XofbhdX7+OZTW42X4T6TDLdLdI?=
 =?us-ascii?Q?6XuZ5+rFVOIfLrMGB8jhgqLvqijRZYvVPcpkP+evtc5VLNMbZKIpE8Qok0B4?=
 =?us-ascii?Q?nNB254gmfnDdPndNsaZ4dJNnpp9bSwJkD55GQfXe7pQPMDQm0YSlrMNrlA+2?=
 =?us-ascii?Q?Cpmy6zl5seBPqFZpql4Is6zchj5rxdxV6pxZHEbP0xCtfO2EyLgbGPLvjt/4?=
 =?us-ascii?Q?7CYGQEPPgImqJnCUf8FZs6rDpq/fV5n2MwrU7tOGm+6WxwnGvlU7Rkb6iMzf?=
 =?us-ascii?Q?nu8WZ4SiR+WR45lVg7zcQZEyWO9AAFYw0bJFXfrAieze+ThehIC8Gt+MsiEK?=
 =?us-ascii?Q?aloYaK6i3R3M9EihZ7qI7i0Ro/O0c9wP/WBocHL4hJHzJzN3Piiqhb6anzg0?=
 =?us-ascii?Q?n8TiXjS6SuatnxEa5c7+NOubLjQaVQs6ItsRrbfXCSo2J4JRwccKpqwX03+D?=
 =?us-ascii?Q?W8njvdwB16XG2aShVPpWDPb8Kt1rgF5oVS79DPFbYmAirxUYQZKHK0ImZbDK?=
 =?us-ascii?Q?tknrd/maRV+r9tVRuOPTt6yzXpeIXxGykfVAJLBC6bi0HaPpB47JnB9ighfh?=
 =?us-ascii?Q?rN/pDoRpTIlk7jenngRW2eMIzdjSnWkgkB4yIUmFDm5Vhp7ZgorqgoAxSpmN?=
x-ms-exchange-antispam-messagedata-1: Zhn0ImMK+CWupA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e93a5e0-a5d6-4d9f-05c1-08da2377b115
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 09:17:00.5059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 0Z3NnNQpvvaOq7eu6tHuyCj6/kODq3DDClnvQm+yqxIYwgbHSkjpSc5idqPBgaynNVKW5SjaTxVLdR/ZWOKotQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4054
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164749

Hello everyone,

This is the full report for yocto-4.0.rc3: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Jay

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Sunday, 17 April, 2022 3:36 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.rc3)
>=20
>=20
> A build flagged for QA (yocto-4.0.rc3) was completed on the autobuilder a=
nd
> is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.rc3
>=20
>=20
> Build hash information:
>=20
> bitbake: c212b0f3b542efa19f15782421196b7f4b64b0b9
> meta-agl: ca53308f8803fb50709b3f17bb1f9e476366bb62
> meta-arm: 3ee7d019898854f776f95ed31f4b7ea8c8a73dfe
> meta-aws: da48f9e0fb5444ee8d3112ee00f5937a3fd9f96a
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 5e2b4c4ad933556c96722ab0c5f2f3f5eb93b692
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 8e1986e95ad30a31c8eaa3cfe2e045b335ef7555
> oecore: 92fcb6570bddd0c5717d8cfdf38ecf3e44942b0f
> poky: 00cfdde791a0176c134f31e5a09eff725e75b905
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
> View/Reply Online (#126): https://lists.yoctoproject.org/g/qa-build-
> notification/message/126
> Mute This Topic: https://lists.yoctoproject.org/mt/90511584/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


