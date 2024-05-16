Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92DAC25B7A
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 10:08:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.web10.9749.1715854079232522379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 03:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ltJAVZuz;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715854079; x=1747390079;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TpADesC6WdjQ4SbN20TSBpdbJ+27qBpzzNtToGW8xOY=;
  b=ltJAVZuzMp8a4lfju79IeOdJodsHyThUipkqjpvk0vwWHLPe60DcBvMh
   2vBEH1SfzgDZXZzRSA90lqq6qPtzU2YgCuaqB5XmQwU1dr7LJ+08Np3Im
   SAVItfKceL7sLrGVL7t6taexvZTkL35MUNNWVvaoD1vRnc88YEhZ2Wtah
   ySiEi5Eb5DSetk6Lp9b9IwI8dEh7QrWfVRYkVxEJLDhxK0APgQ1o3L+D9
   Mzmf/yxwN9vGxfx1agVH1NqkGV9/k7Fps8OmX7h8xG22JgS/CDvKehF8Q
   Yqic78WqpTLccEnfaSSNCS+bwnUryJ+C0vmLh7AWtiRMtM1vpk8d3TMKL
   w==;
X-CSE-ConnectionGUID: Fb6xrj8fRsyV7cnSEEFi8A==
X-CSE-MsgGUID: d/vmJgsPRnKziNeEVlsMCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22627622"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="22627622"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:07:59 -0700
X-CSE-ConnectionGUID: a8xpneGuQAe8TXGF5W4TAA==
X-CSE-MsgGUID: 2Wdx0FYbTjSbfqmzUSIU+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31418628"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 May 2024 03:07:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 03:07:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 16 May 2024 03:07:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 03:07:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 03:07:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuMVtocNrfh9kIGUm2K14R0sB7/ncreONE8E/PsE1TVqv1puoH7Xqt1JZSd2x8hanIp34t40oK3eBb88cdQZCl17KzlhXf0frtgy0J6n/uKzlC7d4eKyCwt+ySPhvba+mvOnCrNuQ7vQbQQO2pXCBVucZrlofYCjgly8LYNg4cqbTK5yB4RR9vDiz7O7es9PjDWQtaLmaKefjrdLoLwEB0GvgRLfbKxwb8vfPn409P5IqYyaJJ9RtXwtT+JaGB87ewr1RRZJWoIL8OICwnU6H7fK7Wc0JncegYQVRoS7S/7S+hcv87Pwqy0x4vV0lSnNxRfvwKCidSzJ2GvDiHhJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+gPdkpnYWWLxcykKX2TEDkbFBf7I9f29u3WXd4KzoA=;
 b=iO+aWuwldtbxPWWU363NSa3hVpv2wzfm1CAZY8fE1H+2up4BdN09rzrYNi1DgD4DA3Ry7xapsTHsjlbURN/pSikIq8hTUb6FNz/nhimlOrSK743PJLPSw64pg8PeOIC4hMHIX378LPOVAb3RSwMQAC093rkozNU70wb6IL77feTJlTxfADerWbjbGTVNjBcQz6aywyTOqqlXPoE7mT+CuJ9XljKFSA5LNOgCe6FBClmycCCaIad5OnjAGmyFTYNeaSfR3qIU2q/vEasQIQc/n0yfdYtvKhkEK950PPLmDdyhG4Xk5G2y6DqsccDRHTxvrRG3NA11FlSQDedLgD9FKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CY8PR11MB7732.namprd11.prod.outlook.com (2603:10b6:930:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 10:07:56 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.7544.052; Thu, 16 May 2024
 10:07:56 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.1.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.1.rc2)
Thread-Index: AQHaop1Pix/295Wjtk6ipYHm2vHlBrGZrClQ
Date: Thu, 16 May 2024 10:07:56 +0000
Message-ID: <DM4PR11MB776099D14CDE99A5A47A0665A1ED2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018f6108f259-da34e71e-edda-4ce5-ae8f-f9a0bfda30fc-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018f6108f259-da34e71e-edda-4ce5-ae8f-f9a0bfda30fc-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CY8PR11MB7732:EE_
x-ms-office365-filtering-correlation-id: 19566f1b-50a5-4ff0-3fc0-08dc75900ebd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?F6KiTbD+Ytn6fQNRPD1zLbFaUhF3/mU7znZ0E+Ks/LsxM1WB2sqocrLO9opn?=
 =?us-ascii?Q?rRdyKx5bMXM0ELXhLgx47L0pMnPGnTflbniO9Uja6a/kY/BjXjr0cY24d/bw?=
 =?us-ascii?Q?tha7Z/xMzv1XNcAVB1MxiGtJGzmmCCDKbSkxP5D0YcBCMCYte/FmzXAl160N?=
 =?us-ascii?Q?5U7kUE67cEBNLmecgNryG3cScvqjBkuQ5Cd0jEd7ylKII2YsMHjWzaGpStHe?=
 =?us-ascii?Q?JcjZ/bAV2v2PwfpuTqvl64H088KVjaZNXzoimr4IacNuN23pyT7chpIf7mCM?=
 =?us-ascii?Q?fCIpbtYiXR/osbyrnzsw+BkTd1a67p3EYBmtWSEnaugy4v3UfBMsvRktPUHN?=
 =?us-ascii?Q?dgrlqY6NY8zIgLHXRCMlIINIC+9EoCESEEn9lqtdf58bS4+n0/OCEzQ8Vx4c?=
 =?us-ascii?Q?kA0l2AY0Xffrasg3OrBX0RCIqpydPGmVMsE/JjEtTXcVtzItm5ka6MCi8okg?=
 =?us-ascii?Q?BdB+UjDipXxdtNlFJwb6MFItuwT+HXDNVJcrb9ZVjocmEu70a2TJ9cXIoZIF?=
 =?us-ascii?Q?2wAKQRmm832cIXOydW5toIs9qjYS1F3k2Kp672J+y0l/ozkcWmHjMU/rK6sK?=
 =?us-ascii?Q?fZnJlckO4d27awwv8ZSWsAxA71j2bzjhE2Fd66P38RuAtxaIcHi9x/PF6Dpb?=
 =?us-ascii?Q?PBpBgwZad82g2YBCahoAqOpz0UYbt/6X3R+An0nHCpS+NRP2Hsczas46pNgQ?=
 =?us-ascii?Q?Y5p8YpRJmBNzfAjA4MYGX1fCzGL1FaZFoh0g4F4SeZzG5IaXTHtlzEQewYwD?=
 =?us-ascii?Q?u66oxLCf+CU1vZ30iaFtmOSSI+uDdVReu9CIgkRYdmjFN8+5tTxDkFpOA/xR?=
 =?us-ascii?Q?PZNXO2U504MWPX9f9r4X3HXd73eVFBAU+hxMfc2qAifYJyV8H6E4a2/p8SqW?=
 =?us-ascii?Q?Ua507K2WACSgUhAHve8ZJo3ws0ApIOWuVWWVqjwgTkKViIQ+WEd9llx+z7Ou?=
 =?us-ascii?Q?NtXcYoJaXI8KwUb7ONXqmea44u8+Pj7uP38hKbGbok5g6AOgwc72T8mL+C2+?=
 =?us-ascii?Q?raxMTBGWMVx98ZXq3aCit8ks3f98IC2t64LDYePIFOK/0kFJt4wi0jey4EmK?=
 =?us-ascii?Q?YSOIhSAtc/DUASNHgkbGXA6nfAV+0Ve+DfVjpOcAkyRiGnKSJ38NB5E07p0+?=
 =?us-ascii?Q?D2lmeUVl5Sf5uauTU958Fs7iQKVsiu5s/X0CBeNQv9sY6G2JCdvk2qlYi21R?=
 =?us-ascii?Q?ox2w3CNvvDNpeiCygF6cXIubNnLMnyEkj1jUoaWCgvzyYN5HHh3QblZZtA1P?=
 =?us-ascii?Q?RQ0qST/EW0x2St23a7EU6YmDPoJdOYsdjyw9NO2hDBi5iS32mLuO0JqBoPJW?=
 =?us-ascii?Q?n6M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?psikzf1nW+I9j2iOsZh96o44K+3Kyo3yNx2WB3pAMs99JCDNVagZ3QjUQTlq?=
 =?us-ascii?Q?4B1t+y1hF+nLpS4ioglypV6aD+7MuON5KJjEiWEC9NFSAiOsJJ2WJHEuIS74?=
 =?us-ascii?Q?6Ze6RyRY01wbcWqExJApMELfSa8oVhI9SgYhut+TaxMySqFPQ6WYgwTrKGRc?=
 =?us-ascii?Q?bhcWoTzPrUMAVMJ/lY8yJv0TRqG2tQUy7+JJe+P11YMDGdNQEDaUCzD/wJe/?=
 =?us-ascii?Q?N1LF7j+0zp3XiO5yiOtLomQec+c+X2xpUGZ9Dars1q8BPuJ9t6U4tkTxatzf?=
 =?us-ascii?Q?Y8r8HBKaW/ulUY/CMKb4j/XzBOdgSQYdh5drwdfr7Km2Xd5gMYfyD7TcwfHo?=
 =?us-ascii?Q?BGI5P5i+5uvoi37Jj4DUdpLLbhzeRFIi0tqMPYlCRfz8TsGQ+diaFziSiJpu?=
 =?us-ascii?Q?MoT1raiMnIYvvGlC0uJVcTNioGL2Dm4QeK3S8REjxcvaZdCmv106YU8jUpe9?=
 =?us-ascii?Q?/7TGvBikBcJA+nJJJ7huRDqY+Pg5Mqe3uWN3rs9ytgLCpvXWUqbSrrf4fqmy?=
 =?us-ascii?Q?fl5UIcc4wrrqRCYBOvrPOIhHSRjI+PJD26nqsbdfhz8H+332ucEL64RCYAfk?=
 =?us-ascii?Q?2byyBz+S7iHp19D+/xT5+VSUkyROjiX2I4AwYywKtiBtLkjftR5Nm67jnpKD?=
 =?us-ascii?Q?AYbIDxMKzZFWCoRjcPEw2h0vhMh+vEYpIk2I0g9PiFGcCddaCLaWXWaabsKH?=
 =?us-ascii?Q?3A7uvCCSuKj8TxvapCkFqldrik8YjFm9FjkNny3qop+I1CskvBxO19nYfpmf?=
 =?us-ascii?Q?lSjrmpyd/6eTthCH3mfpVjnwYinxCwcteQFI9LXOo0Zb2GgxEZ8o25teo/f1?=
 =?us-ascii?Q?FaL676q/m26pPv48B5BwKXQ+WwvrhEl8pK3bXwmNS5IdxkVIyS0OObAyjj0D?=
 =?us-ascii?Q?x7tgmhubR6YSSw/ciKdtRNKdKBiDMqgVOP2AyDl0rPW34scY8N7D8GTr4/UI?=
 =?us-ascii?Q?TWdSArQSK+1qESTAYZxby4/RE3h/WBFcyFhiXgcyvvSqCH91F7i5r1KQ8kA9?=
 =?us-ascii?Q?fFJQHui4phDk/RpUIU6lLoVfjSM0K0mJibs0MBlzxK6PUX1byuwkpDsaKN1M?=
 =?us-ascii?Q?blAdxI479+8Nhzx1eGI6rBJforGvjPJkEXe0mrjsJSPCVFsjA652pUs+HlYE?=
 =?us-ascii?Q?bJpEv9nA0xt26qMk8wedIw+uyf7Jmx0Ndl2yBZ4KvmagTatVsRzSvh/vCkXL?=
 =?us-ascii?Q?LriPmfG7rIMtU6gm5DXP96+L50Ibp6odbo0DuTff8UxddARjSITSUEMaXcmW?=
 =?us-ascii?Q?7vLLQv0WLG/TCKbl+U7AnLWCJSvVkoXC+pUYITaHZX6sLyPUFKjTPeQ2kkMT?=
 =?us-ascii?Q?+FoltxqxoyARUFWCHxEG8RpUmjtjsLKcY0AM0bLWBXrLYRWxj30/XSBq/n/H?=
 =?us-ascii?Q?oBS7pp9kO9lvevRbBTDmJSMFslahxACq6fVPirPT/oEwz0hQqhDMPoqGevg5?=
 =?us-ascii?Q?56QmK8Lsn/2C5sMmOZCvCuYg7thlxNjw7D7Kg2/68Zq8ycyu5P1uvB/oKZsa?=
 =?us-ascii?Q?S5A5F98tWkTm4TGI8jQ1zgyiEZydWL72DHgCV4r25Q757r5eqkiJb2DxasfW?=
 =?us-ascii?Q?5c6vB67vw8U10NGgn3gNv1gMJtCp/R9vKRaoTJ7l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19566f1b-50a5-4ff0-3fc0-08dc75900ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 10:07:56.2264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S0rYvXuIu6998DWC8jmVLoA+tbCRl9H7EbJy8dzd9aT3oIIUkci5qCHvaLuYYLxSqTRBH/tQBpqg3pyZnIgLMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7732
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 10:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199448

Hi All,
=20
QA for yocto-5.0.1.rc2 is completed. This is the full report for this relea=
se: =20
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Friday, May 10, 2024 1:45 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.0.1.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.0.1.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.1.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6892
>=20
>     Build hash information:
>=20
>     bitbake: 8f90d10f9efc9a32e13f6bd031992aece79fe7cc
> meta-agl: 73b088ccfa385f91b8aa56c1d2fbf78d97447dfa
> meta-arm: 6d6fa14744b4e453eedb2c37891259b55557dcbf
> meta-aws: 3265343c2f2b22bd0a2a9a688fd20e6540d0d746
> meta-clang: e7dceb1c92caf7f21ef1d7b49c85328c30cffd90
> meta-intel: 52f5037453e797eca8784a410f7a2a55f40aef57
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: 5778e32eae201072c5dc37c9db67dc1848ffb9de
> meta-virtualization: e9bb0a338fdf637f7929e19b21857d4c1d532ce6
> oecore: 294a7dbe44f6b7c8d3a1de8c2cc182af37c4f916
> poky: 4b07a5316ed4b858863dfdb7cab63859d46d1810
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

