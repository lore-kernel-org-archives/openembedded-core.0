Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E39C624D7
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 11:25:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5352.1788434713747514536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 04:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=JpgZmWnr;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788434714; x=1819970714;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9Uyf5DepXg2l+3YTq90lJCyCpw0+EOEQgGPMbIQPYbk=;
  b=JpgZmWnrHfXXf/h+gT3DPzCPaxFt+8bX2a3hqIGpSXcs16b8faRaY8aT
   ZVpJXqecI57O5//ucnALNEDycP2IAolndstkY2HrUSz68FguVcORntm1m
   W2VljMca6VqpWshkc8UcsUnfcBFnqhv5QJgACmAQSpq+6LzYKY4T3OKXb
   YN7YdSgYXtBMjKEOBRNe0U3ErtadizUvsv9oXfzm5vGjqsgCdXRV77KFn
   au1y5EtMHvlVMkrjcXbThThA3eH+CI6BnEbX/EWEuNXcP86V0qKzjqFaa
   10j0BGJaVKiLi1l5QNkZrQ8CFVmK47MSyXszIoUiip9eEMiKgr692bJFo
   w==;
X-CSE-ConnectionGUID: Vm266i+kTXWrigvi0gHCZg==
X-CSE-MsgGUID: ADgNaLPxQ26ok98rKUsl/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100073135"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="100073135"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:25:13 -0700
X-CSE-ConnectionGUID: I6gAJ9vhQjaIjFEJlKDUGw==
X-CSE-MsgGUID: gwI4dUBvT1SRiho/d2TT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="274970117"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:25:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 04:25:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 04:25:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 04:25:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rT1PfVixCrSxaLTFNlEa+yWhzkVEOFXqrKFeSW7vXc2VFMJP4h3LDT6LLa1uOXCptXS4f1n1x7LdAYPLA05YvSVsk4blRD9JTSoDEuNOiZzXzdCZxxuelMzUunz02V/+sFt5U/tobgG3soPNkEULeOvdpCmJ+40zdkRSVyKOWbwmlxCNpu0+39hOna0pLSvK1d00snAXnEsIe1K/uPLQdH6Xj+gZGqmlCbC6nk4GJtFiwIro5uBtNfPDsN9Dxr6tgQqaB759WEKKUSilnfVa/SmiP0EtBH5oy2HDC7/exohvJZsqPnnLqjanlvlIM5uzP2GIbn9HHPcxuEFCpatctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdXRIp+z+k0hwIYhv3whHZgjsO/DuPp1sLXqF197F1g=;
 b=sTipdy7kch0dF+5kgxtzTn2a75sf1LrEULreDC7lCz7zM8m1gOgFwVTrK/DaIkHvrDpcjurFwhrDjZAbaeOweE5vkEnnYFKzeKIbJyGGIK9NOlfPM5GHhqxe562OC6jixLXACOH3qRcp0ysyZwvV8E69LxpOvdUvZCc4xCdpdzUUNf9osijpkLS5FveHOicLTDA6iO1l1OmXm0AOPdoLNKxTmiEjRRMph8dz4riCV1oO29t4csVyfRx3B7zL8GAlwaPehWob1W1bIwnn0k3cXgUSzv+wrXc5LOXoGu6GrxORp8fx3/n9TiF7PiZDN7Gd6VEYQVgjzielt23wbbHD/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by DM4PR11MB6191.namprd11.prod.outlook.com (2603:10b6:8:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 11:25:09 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%2]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 11:25:09 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] [yocto] QA notification for completed
 autobuilder build (yocto-5.0.20.rc3)
Thread-Topic: [qa-build-notification] [yocto] QA notification for completed
 autobuilder build (yocto-5.0.20.rc3)
Thread-Index: AQHdNK7OThEQfuESKEmWIYdhN1iYcLazb8WQgAlTHCA=
Date: Thu, 3 Sep 2026 11:25:08 +0000
Message-ID: <SN7PR11MB70180F5C1FE0942A0FE02796F4B62@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <010101a039c0788a-1266317b-65ae-4f5a-be4e-1c4cb507bc5f-000000@us-west-2.amazonses.com>
 <18CFFB3EAE1FA0CB.3609140@lists.yoctoproject.org>
In-Reply-To: <18CFFB3EAE1FA0CB.3609140@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|DM4PR11MB6191:EE_
x-ms-office365-filtering-correlation-id: 7b05ec36-5aa0-4e0f-0aa0-08df09ae0303
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|23010399003|376014|1800799024|366016|38070700021|6133799003|10067099003|56012099006|11063799006|22082099003|4143699003|18002099003;
x-microsoft-antispam-message-info: ZyFFMtKsQCVMHOgeAc/9FX6nteIlVdfJr3NSDLX0TbDlCaDhJEHHLkMX/vXpIP2eSRs+9KztpqrqGeZ63USaxxGe0Jj9rnG0AQJPm/LRf7qw1Zu4P68IriQRnFIevBwxHj83AQePBXA9OiCkCt/QVFGZ0SzY34iYnnahVicbKH1nfn2L0yBt1fd0w8wlSvHEfkvjXhciLpnrS1crs0PlnpAy8XoRTiyC8Wo8fG9yjOVRJBz/kvbTrxFK6JaTOj32PSNeeo3ajsBbXck0AaNPlzOBraZLera3d+qfQlIqxJLbCa3oHcOoxbjgJN7QnpahUYlrzKoAYEAyEV+OsQIOdPDxOwyRhrwSOV9hj/hUWmbszg+x0ICrqlFTy5g6eufpAnTgSlS7kAa3GEMTgrPRnDBn3uhMDk0JVM1LlvNBXrD2+POPrFDcAEMFTCs0dJWppyWKJ15xoTExOW7mezPjY0ZANtJfxRcgkc8+WHOE05OeGlnYNsPYth3zd9JXUiEtSuZfISwSOLMiFKGtjKgjaPnM4WwlHx7SottinKuT5wHxB4CDnU+nDRizKnmypM58JyPjji0fxIs4TLBKtgbXZmEOL4ZGobJD1b7+OhC6dZvumjj4dmj18HSjS+6QH/Y2+lOWDrjXQsQlcmqKxkZq9ALUnB5rMReg5nY0xPaP0f4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(23010399003)(376014)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lGZMHRasQw7tpEaz/foBW90+SRxBHnwkO0VLCA5X9AJCMDppTpO2zcHu3JSC?=
 =?us-ascii?Q?1AuhYVKNn5uNJtsj7DTV8rqru9QvNn12Sf+icuvKg+XqKF8c+tUsTurnZGqW?=
 =?us-ascii?Q?E5iLl/LChrSG0BNf4nbRNFZLoGOFz5hyCzbOWP78JZ00hKBwjoTqRqu6gJo2?=
 =?us-ascii?Q?dniHHoHP+eiTMfZbROQ+z23IOAJRISyEBjeel3Lfo6K2I08DxLkPeIAMeADc?=
 =?us-ascii?Q?RTCFyIka+8kLkEx+2I1ljESrPRQBoIAD2e3IonK2nvMwQDmOh9UPcgrE1n4B?=
 =?us-ascii?Q?oyap59SxURFzdzNAX/4WTaD6zx2yZ7ZnZZZg3DINbxiAQCCwUBOtyMjjStA2?=
 =?us-ascii?Q?pQ/YJUDYpSZ7MI7tSVBtI/1PGV8HR6RrG0BdA3/CrB3oedlWuro7VYe2MGgp?=
 =?us-ascii?Q?4v7kBGGXKy+CzbMuR8gAo0br5WrgNwTpquNFXX7kDZS8F3/SIOmu+Z8dOFaF?=
 =?us-ascii?Q?HV+PShsb0ru35EomyURqTrv8VDvu0E080g8nHBm3Ho1iJowQ8RYmInUgYC1s?=
 =?us-ascii?Q?stqnSZ9TrNUqdStm5L99yIXqTptFc5aBiq+i3XMNUZpMdfRwVrhSRJAl3KlR?=
 =?us-ascii?Q?/MdzonNO/Xp2A7RtlPucS6L4OfjsX0IpEUIXk0pbz9gksjskrOrhBlZm7Sma?=
 =?us-ascii?Q?WxWVv7YnQZ3QZGV/h27R/1/epo1YQQoSXkkMJ/QJAnoCGgbkCPVjBqKJFuUJ?=
 =?us-ascii?Q?LvHGgqSCpU35bIn/wwHGoJv7b81hv2OByrUFqVe2l1ZlSOZ+OBzvcXLz6s5v?=
 =?us-ascii?Q?FvxxFqsauSMDcY8NQcLSxsZFyy6I8J3Kf8J8QMSdvWfOw7SN6R9sUr+kynRo?=
 =?us-ascii?Q?g2Vlo7v/NOifLvs5ARQug17cVzv8anGlAAyoytKpPMWlFBwETOgU7N3KTtOS?=
 =?us-ascii?Q?e9TJpDeGE9CQUfbBorsORSv+4HmKbuzuoRfvpcP95V1MMnPR0PdmaVAqbz6a?=
 =?us-ascii?Q?c6XGXN5fAYkCjjyLf2pOvz8nIEiBhnZImmIDEcezvtHsf27EOC837Yl9oJZY?=
 =?us-ascii?Q?LfOJlyyzgWvJPiPL1cwRZL6NHlRxhTqD1OOtqz08n1ZU3Sc86+QvqpToeGir?=
 =?us-ascii?Q?TJB9iTPlnPxyXgmwYizLWFPnAuGXNF14f70JW+aGAFM/Bv7TtSybujObH2HB?=
 =?us-ascii?Q?IHZj2jpfChh87jkYNbQTzlDVp4NJXmCqN/zYg5lLHT2EhFeDMEhOxuKckYiX?=
 =?us-ascii?Q?4YKt7kF4RGJQm3ska+eNpIHNY5vKUjE7QYxzNBucYu2tcFf9sT6h4nNhre0a?=
 =?us-ascii?Q?Y+UElhybpjVmWzgWruNrOJ3MSABJk7PQzjUzz2fa0T0EFnVlMsPzl32iZ0O6?=
 =?us-ascii?Q?eZ4aA1Qx4iLl0L4kKPuGR0tnfvnQNBP81TfgrvXIJ3+PFfqkEzqn80/nqJmh?=
 =?us-ascii?Q?hSB+wWu3LnR9fr3dUd4UYw8vYWmVX+DpZJfG+VP9yvprDPCrCZeWAdZSOK4f?=
 =?us-ascii?Q?NAcu7i3JWNN8p0WfwSlG1mcDpo56EU3F4icuc6jw1fxoEwMUADXdsFey4RZT?=
 =?us-ascii?Q?UTlw4B/5nkeTnrFiHm7sxuLgv7pWkSK908yHl0R+rwb84pkqcFr2lo+PY+Hp?=
 =?us-ascii?Q?0SUIUUfwGTMN6ltqMfwr/YWObrKv/wMTASd1qW9CtwTwDE5FvDcwlm7OHTnr?=
 =?us-ascii?Q?CORtMZ7n3lcidzMDPT26CA6OHMhfEiAQjLPkP4QwpM/+vLPPEmWW96ujLW7/?=
 =?us-ascii?Q?X0f7OASYTUEg9qSYLXEOcmblah3Kp3sPp7kK6hwIN3HK1MO8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2GsGBT/9069f0e1SrIlNmt6XxS4brT4mZlR1X9gUyg/Y6HlnqGf49IF/IHnjiWDDd5KeQ4iSBTDhvPZQb+kex/Ij6XApY+T1tTwoFip17m11XiYkv/VnhhJM34O2orsMuhsk6n3nDyiJux+TDyK+Jy+kV7gR1y+03QIW25tEDAOnR7U50QcS5BWvwMb6ie6eLmc2QlaeMv049SZIpsa5qB6Ew64mkP5W712XSOSUnxExdrKMSnJSph9vPQzUXNCNwzYe2p50kMvgG4365RfMJsn18bB55zXFXoJRB3VH2bZVRgfHmH8UGECC5N3UEDEDgwD/ZEqlPPJ97ODebywEmA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b05ec36-5aa0-4e0f-0aa0-08df09ae0303
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 11:25:08.8921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7NdhT9/k0Pcllf0XltXRGe51Ealr1c2UgDsJkOaRCLwan9hQrSAx9IR4wjgVJCJvhFDBgw3qik/qCAEAblxEcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6191
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 11:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245029

Hi All,

QA for yocto-5.0.20.rc3 is completed. This is the full report for this rele=
ase:=20
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
Sent: 28 August 2026 18:29
To: qa-build-notification@lists.yoctoproject.org; Yocto-mailing-list <yocto=
@lists.yoctoproject.org>; openembedded-core <openembedded-core@lists.openem=
bedded.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] [yocto] QA notification for completed =
autobuilder build (yocto-5.0.20.rc3)

Hi all,

Intel YP QA is planning for QA execution for YP build yocto-5.0.20.rc3. We =
are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw

Runtime auto test for following platforms:

1. Amston Lake
2. Bartlett Lake
3. Meteor Lake
4. Alder Lake-S
5. Raptor Lake-P


ETA for completion: 1/09/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Behalf=
 Of Pokybuild User via lists.yoctoproject.org
Sent: 25 August 2026 21:59
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [yocto] QA notification for completed autobuilder build (yocto-5.0=
.20.rc3)


    A build flagged for QA (yocto-5.0.20.rc3) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.20.rc3


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/4572

    Build hash information:=20

    bitbake: cff3be6f664f8f07a40727ff63eeeb24d6f5e00b
meta-agl: 97aaedbe2774c1deda43432b4bfbe725c55f9894
meta-arm: 045eb74bd9abe7d9ccf365a2417e440ce83bcbb0
meta-aws: cad59b89c00012ab67d8b4f105714c8aaa5c16a4
meta-clang: cc29beb210ab94eacc53bbd67e287e4e33ede342
meta-intel: 5d153e35b4e752505efeae368f188fac5e31cf33
meta-mingw: a2065f321a3dbca1e69f070502917c76653d9105
meta-openembedded: bec755063a8b5da65df626f5749496aadaa4f4bb
meta-qcom: ec80a36bce11d8182b4bb2a6fa0359adfeccde0a
meta-virtualization: f980aefbc8b3eeafb8d144e7fdac3c3b701a4fea
meta-yocto: 961c2399d06fbdb04ee27d06079e186d2c4a14ad
oecore: 70dc15941dd33270a92d1001174efb3093e79bdf
poky: 64e69ed23703f6358ec431d3f5f1f8483f974cae
yocto-docs: fe46d5de41930a2762a9ad2543d50e0f4e10463b


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#745): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/745
Mute This Topic: https://lists.yoctoproject.org/mt/120971597/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



