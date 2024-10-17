Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF83D2F7FA
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 07:19:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.43055.1729149539876883633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 00:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=DZuo8a7V;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729149540; x=1760685540;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2G0KVf3VuXGYliex5Fzhh8mMiBj3V0MpFwvbZZKTKHk=;
  b=DZuo8a7VlZS+uJK5Gq27yF5XeIXsy8+gZ/MNRRmJ8IxDsGyWgiGoJpcz
   8r3OTXfnh3sQq7PWVQl7ZGuzT8QWQW++7+N4rx2gtscM2v/Le9WzPh4Dq
   dcxEouETcSMBXEKijpja+wsv0UIDb8VT5QVfLPaRwCLO0UlxI6pEQpkfI
   RjbTgF/4v6m5BMlhj/rXCPjLL2k+UqCK9dUuo2Kq5ZgnrD4YNifNBMe8p
   ggQI903P79p84wb2zVQXi/uzypff1SPk/VN6BRTw6TFMCGEhlL7mQF2iq
   RmwwtG7g2cYwAxsP3a4aNiR2hRAJEKAXdDdSN/SdfTeI0YaX0kNJF20rn
   Q==;
X-CSE-ConnectionGUID: AcXAgh9cRlO/x/6xR7jrEA==
X-CSE-MsgGUID: EOvhog60RWu6tw11uicWdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="16241982"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="16241982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 00:19:00 -0700
X-CSE-ConnectionGUID: GWAZO+g8TY6Dz9wdFVc8Ow==
X-CSE-MsgGUID: mw2Apn7mTQmltx+8mxptTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="83239884"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Oct 2024 00:19:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 00:18:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 00:18:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 00:18:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 00:18:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQCoKaIy2mEu73M2PH78rnBS9/CA+nwNsohzpejWtF2hIcAFHY2gKuRd4xmIFIZt7UbNJwLLw41nHiVkrcC5TUA8hY/vXawSf3/a8U0sgQTISCffwqI3mWAnWNmtbO63hj4Cc/bG4l7RV0NHsr8ZFD9nBLMfotyZ9MDLpLCtojRdnHlP/hdLTgfdjBTMsYVl3mb+/kEhBFhqkh6zk9I9iapaybikRVkPd65WU/AOSqCHYa27YQevBkLLOzJXfUOS/Zi0QVfodvwQtuh/+nJj24GnnGw0vuNUmgvVICKQsQVMvGUPny6FRSP6tELAtS4y8ozeTIUFL8FI/NfrHyxcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0J0az/unDCY7AUjauX3s0M3BpTX1hqdDRBvFej+pjNI=;
 b=iJL+LlipJ6P7owOo7ebCguA7ZrfIZ4dk3f4JEazihgeK/ZjDBFzIbx0AKVAW0WAaqHjZ8jBUf4dVzPJCOm7Td9cIZMbVUinMr2sUUo0JEkDgwis8PWY4tCfYaFcmvQRb5upqWlcVrhCA1X730ssd+CRHWau6pjalvlO5+RwEIMZjMqLBo66c+jcAuDPodSiQDSphVPJXWxBaQFDPzaPc770AenI8/rpNka0ovnIFh/5RZhfnvQO3BTlartuXge6hG4GBj0WOJ3bvHzrjtaUgwEQ+xScLlNxdxaeCAev0Q99Vi2NwYv6ezyrRzjJuZELO9yxUPNHfmoZLclDpUsNvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA1PR11MB6711.namprd11.prod.outlook.com (2603:10b6:806:25b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Thu, 17 Oct
 2024 07:18:54 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 07:18:54 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.22.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.22.rc1)
Thread-Index: AQHbHN5zwJtg+LDbV0uOj4geWC58DrKKj3RQ
Date: Thu, 17 Oct 2024 07:18:54 +0000
Message-ID: <DM4PR11MB7760CFDA2CD4BDA4B776DD89A1472@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdZTSL40AGzE-aNwEMSTQVOxaq4qyXZH5karUnmucaxFBw@mail.gmail.com>
In-Reply-To: <CAOSpxdZTSL40AGzE-aNwEMSTQVOxaq4qyXZH5karUnmucaxFBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA1PR11MB6711:EE_
x-ms-office365-filtering-correlation-id: 6b012d5a-5e6b-4030-1768-08dcee7bf58c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?tR/HlOc3C+AqDEy8DSfXUr6tghnCyM8gtgZ5m/azaaDDMB+VtvfFAisdcGE5?=
 =?us-ascii?Q?P6FOkXO+ggQWswkRMz+v8eyXRiQqaB2c8HtzaM144aRTU0MlNfgbo8hL9Fa7?=
 =?us-ascii?Q?iFuBtV/mDe6eikthR8+9KXS2F2O6QY355tvUxkuRF3ZQ/4Q06XXg400p0uGN?=
 =?us-ascii?Q?7vsBPDkmMw+aAsOTUO4ZxKnlWHi9PMwc0ZtyAc89aqQh68DpLWppiO+68WLa?=
 =?us-ascii?Q?a2N2iEIAdXLXg10/Y98xmKwAYYTgCOW4sJ1Qr4FYwGzFps+pen69lD4JgVuL?=
 =?us-ascii?Q?TTDwrG2s8tbtO2rbPAH58KyvGLN+XCt6OW8R/w+hgDbQtkZlpcSv/ZWOvcB7?=
 =?us-ascii?Q?9sVr8JKz+1xaAhYUgCsn5eK5RxbVBulzNg3azrVy9M5i36K4AlFCttrOn9Ow?=
 =?us-ascii?Q?2vv/22hqVtKjCM7YIVcen4VsVdrkHmENrWllsLZk8FnbOIO7NISS44dZFh44?=
 =?us-ascii?Q?p49+JGtLdOsVv5u68wYlhLSWihVBLCCA7Cdgadf8dUGpKQQk88g6mv58CUFV?=
 =?us-ascii?Q?dwIuHUeIF2JqLvPdGvvKoKS6Fgqnm2xwvbSxrPPpMuKBih9eEx/5uZzJpboc?=
 =?us-ascii?Q?pbZN/y5zxzFbTyXSae9lJ7dsmluzDoDoAwWf2uheM9tU/tLsPpGbAr5SIcfc?=
 =?us-ascii?Q?Ss+5quIAVslRwnAAM6EKciqc4LX6DBqQAmlOarK2yqrQNWv/GQRpa8I7F4/O?=
 =?us-ascii?Q?DDecVWorcmm3LjhxXDCbyH3dhEls64SSk/tAMMtGIGWYHjBbkvNSYw6Evywf?=
 =?us-ascii?Q?2OQEsHrMRaondaVIhjjNr5qmwQ/jmsn9DGVuy81vxJADx0r/OvoTeWgSsdVf?=
 =?us-ascii?Q?wYbyRDm2sTxbXEfN1u+TtgtJadX2e2os2XvpHg8Ai6IOVle79hlchv60uzZh?=
 =?us-ascii?Q?+OAd0/eel+5ROGeipURLSRCsul2aBebmJfHOVjk8CRagyu+iPhkL3d49zii1?=
 =?us-ascii?Q?sfbe/W7s5+37b1W/FSvEnhPwSLal7jdOoj8kUVBLQfP43iSOdA7fRfuO+4bu?=
 =?us-ascii?Q?9CZ5XprTqc1ENtAmBpvv373OlOhIrML6dXEKhJXrRowj9sfNucRWKj1nYV6j?=
 =?us-ascii?Q?lFJGtUi7Oi8f42H7Io/ur+m/WowXe01n6EDX8Y8Pb9WLZbN/+v9Iaufa3EHa?=
 =?us-ascii?Q?/bWGtP+CtH47S2ODNROvT18CirpiCkPcShT1kpTqlDitm8OslpROyA176sxP?=
 =?us-ascii?Q?WJwIGUa+xKrB//HPTDiOVL+/pS14Xvp4EzoEDMqmW3bwpVjIj5jWNlnn5QhN?=
 =?us-ascii?Q?eDORCesfyMpUpUY4wOjwDCASyegN9vvvfEJ9bugeP+l/9JGyy1X+9GvASTP/?=
 =?us-ascii?Q?i8WOUjxDKma5k1D2aVcJA92M?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D4RPwS8ie3AWhXCpbxyx+3NzXJRP3wSfUz1n5fnmJB1hmeKwYaFw+Zja6Cav?=
 =?us-ascii?Q?Ee0DOq4HEqi7LXBVkmsxagsventHbDJG7HmkYMGFBkhktk43llVC/gGtxguf?=
 =?us-ascii?Q?ROrykoU1O8pwqKlrrX3ZSmzi2XY3LIdnpcRM4/B/eTNomp8fihWSP5n/OVPk?=
 =?us-ascii?Q?ykEevLC36RYah3WlKM9ZVwugfrO1hnMNK+L8oymGo1B7EQPMThQ2Qma8wHyQ?=
 =?us-ascii?Q?wtfGfLKoIgu5H8D/CeenPAML3WNSvUYWpbEQMzTuA9+EA/rUM95K4zFkpX71?=
 =?us-ascii?Q?k/SU7Zkw6rAAdqFiDxrPH3F3Z5z3fDJRp2Ul1D5o0YXv9++zVXK8ts8wJYKk?=
 =?us-ascii?Q?bRtQtXxQnxXuhrKHNtg+quUbAiQTLHmZ5vBYXMYHh4zn15k+wdzMN0aulQcO?=
 =?us-ascii?Q?G3r76pYwbNc6LCYIgIOowIKvT3cfqPoyculrkuDXb+YL8yUI8p6DqD/G37nE?=
 =?us-ascii?Q?ffjQY7PVamR6/CxtNYWcX9DegWsx5Z2f4cfbkd/HMAwK8Xg27y3Cu9jo8Qkm?=
 =?us-ascii?Q?YuIr6PmoTvt8a+k+ZStU3nUZ2Nhbk/DL8friGJ7JT7Xh7S83yPVAhmzIdKr+?=
 =?us-ascii?Q?+R4pDewO33U43VYFqtRbz3Rum9SEnhtfTpgbsYMO5ce7rF1Eg0D9wqU6VHee?=
 =?us-ascii?Q?uP45sr4sdt+RSfO06BbvXtlhDSGb5Cw9IWXFV57HQ4fhec2kDfRpiVDuhX5s?=
 =?us-ascii?Q?HEXbeySaLF6qYlGiBxZvdpLW0QhAJ4Nj07PNKf5i5lSml1DUxrN4y0fx0XaQ?=
 =?us-ascii?Q?N02zuJspvQ51GOiQzHZoehm7OFZSPjj05fMFA0NHANxDSUtcFydk9oFddSUr?=
 =?us-ascii?Q?t0asZjmurNj1/mjeDrxDBsjVfDnylUPxYs5HozEtLsEFw70EUlbHkqUQ3/ug?=
 =?us-ascii?Q?fPHsYzln0RLNnLf+5YkwjMX3WQPC7EclXNqvATGnKiaKGF+yM8KhMkj98dQd?=
 =?us-ascii?Q?4fQTQxPxuN8OtamVEyVwD8CXPqsh5vd5uaFLoju05mzugABDx2Muc+2AXPOz?=
 =?us-ascii?Q?fJuzuGbUvOurcifZ0CMwJhsKEIiEDMjqhiHU7DwyDF2zpgps/d0zuNcZVLK0?=
 =?us-ascii?Q?Hxr2bTPP7X7tTPJMAdrFiDz8tGUJvveZPYCsxYm+mK66wyM5+/OwZxubRYqg?=
 =?us-ascii?Q?ewWtiN2kmp3t1Cy6KBzY6n9h3XTOybA0Ji2sCScrrs2ch19wTWMgZt6LCS3m?=
 =?us-ascii?Q?1NhR9ZNtQeZ3BNsLAGnrOn9bPXLDe2eQ6QeKLdn1NLMBYrloL89f7AQqo+pO?=
 =?us-ascii?Q?+MZ0xYhQbJ6sqk3euJCadiTktTsl9DIVMpl/us4skUKW6ZaJdK3oCBFwmIwq?=
 =?us-ascii?Q?7nGvz1YRZZwqjUsfQeWRKcTV83C6ccQ7ofOxAXdsbvzw6XnQE5LTpWrEKmna?=
 =?us-ascii?Q?+LNaH6z8ybzSTasZlaPYzmbUqdrChMfzpv7ySx1cAc02lUMBpTpidR3ajVlN?=
 =?us-ascii?Q?ATaZNakt3boTmaLux8GuXWB0MeZIIOq7XZpbgiPUBDN4tH74Rlr846dhQOdZ?=
 =?us-ascii?Q?yovTzokTPMJ5rHdf08si1bVSQAdmzyPXDh1ac9LaJt1aXmX2OBC9Er74zmqg?=
 =?us-ascii?Q?ZDX13r6LHsWRLwomSMvST+sXVooSMktVjS0KjwUv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b012d5a-5e6b-4030-1768-08dcee7bf58c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 07:18:54.7640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DcTWyAexx9YfBfydeAng/88hjV2YHlsO6sfF97EU/N0v7ZD4xKOY6Od8E9tmGIazArCviUpmXdevgbO4PrX6xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6711
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 07:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205984

Hi All,
=20
QA for yocto-4.0.22.rc1 is completed. This is the full report for this rele=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Steve Sakoman
> Sent: Sunday, October 13, 2024 3:39 AM
> To: Yocto (yocto@lists.yoctoproject.org) <yocto@lists.yoctoproject.org>
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.22.rc1)
>=20
> A build flagged for QA (yocto-4.0.22.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.22.rc1
>=20
>=20
> Build URL: https://valkyrie.yoctoproject.org/#/builders/29/builds/258
>=20
> Build hash information:
>=20
> bitbake: eb5c1ce6b1b8f33535ff7b9263ec7648044163ea
> meta-agl: 3ef9b693b0048d98d742d347049df2c9e2746ed8
> meta-arm: bf98ef902e6e7042e46a69fb2df6c68d00de2764
> meta-aws: 69ce4703994cdd95d14bc89fe1e3475c4f2be090
> meta-clang: 8bc893d735e5f779a2dcdc3992621d5ab371800d
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 1abc8ef0fc11041e2ff18989dce5b99214ee89ed
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: dd3d2293ffdf2559f8a433f241765a8ab50cd085
> meta-virtualization: 02a6c00d9370992a54296633de26a13a9a08ca2a
> oecore: f09fca692f96c9c428e89c5ef53fbcb92ac0c9bf
> poky: 7e87dc422d972e0dc98372318fcdc63a76347d16
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org

