Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53039CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 12:55:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44700.1781182528748567320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 05:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MOARvJXD;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781182529; x=1812718529;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=byDrVUXrOQQ2i/vA713VxcL0BaEhpkqvgJd6dpnjdYs=;
  b=MOARvJXD4/A9kKxeH2kgxBPMz17cgKpNZtBAqgcneNWfZg44Ww+n8N0v
   wsso/E2uAiF2OHAWR5Qs9AH1HW+YiGagp9ZS0Y7ET/jqjfSKV+vPNcBCb
   KedtIXqlXrLEgNJ29/1MNkTfAsVtnUZBBs6RZeKEowFKD3K0HvVPdq7/K
   NVavfuFOTl3iAPGBv+exJ8whjjyxxgHadsj5XLORH5YhBC4IuSM/gu0FW
   cbhPTWKm/Mf2CuOTMkVW0/fwaM7nXbq5vGSnZDdQKmyAs+yItUaxDdA59
   Lu6pFD0L8RHxqg0M6bDcYHnD4sB3DuvIbmLyniiusXToJatvrL1zjnkBS
   A==;
X-CSE-ConnectionGUID: f4+2g9UTQvSmMs+ZqMm2lA==
X-CSE-MsgGUID: q9wJFVVQTcSiz60IMJtfPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99417593"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="99417593"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:55:29 -0700
X-CSE-ConnectionGUID: WMX4c3G5RsOtCHVZag+YIQ==
X-CSE-MsgGUID: kIvasTHVQz+2ux8xt24xzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="248352739"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:55:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 05:55:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 05:55:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 05:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o32CQYjmoFoUc6mLMIqH4etR7tmh3ah47nStmdWHLxQYBpbMyHmVcqy3YoLm+iDDCZMGyX8XDHAaqD1EY1sbai7CSHrnsx/4cDl0zLnABVaS/nReBDeTKLKvcbnwt6jkV/rt0k0DLgRut0/GVTgpcL7WMxwbC3kO1lbI8fz5Jsz/PMbh0/QHnoJiiBCzwFkIPdNu8A8PNewyomYN9EO5b92GzR7sEyXq/bK3k8/bSoKwPtsxxIhFxDODeo4vY6Ilw9C4fOXJM7nLABgmXlI9/QQ+6YHI2mMoPSjnLfJ3cNVORvAGLWzy6KLF0Bztpr5DyEIhOzCcFs+VSXraNwFv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UDscsCQ3+raHQpMbAXu5M8HBQiWabGCRCMtOU942/o=;
 b=LOoxK59mG0MBV3Lx07Kw8laBsdoB9V0wKPz7hu6n77czw3DUVU+RRdK8oZ2YvkFWkDg/INnGLX2O0BiRoKRL/ASrgW5Hr2PbovW8Y1wAYRgPCg1P1tyBwEGaIoiXM1OZJ12F2dDMB4FO363dJwjsx8j11xRhNtS229xwsr4saxzZKcEUASgtN3SN0n51H/ep5XVn5UgaFI3LtSHwydHVdFhnNycsIDdJuyfHXW+zmU3tU4Es+XLkO6OmMCoKNk64Q/H9F6KRZpN/RU4NWbkb2Exzz7NrjxpWHNDUhwWtik8VTghMis8trbnAEFpyf3DdWEpSdydOuCpU/BDYNuloEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 by SN7PR11MB6656.namprd11.prod.outlook.com (2603:10b6:806:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Thu, 11 Jun
 2026 12:55:19 +0000
Received: from MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38]) by MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 12:55:19 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0.1.rc4)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0.1.rc4)
Thread-Index: AQHc6X6Nr83hBuQqZk6BnfFzgxEngLYgKbxwgBlEzqA=
Date: Thu, 11 Jun 2026 12:55:19 +0000
Message-ID: <MW4PR11MB7029368618119F000293302BF41B2@MW4PR11MB7029.namprd11.prod.outlook.com>
References: <0101019e4cff17e6-5c625f77-2121-4c24-ac64-423227cf3775-000000@us-west-2.amazonses.com>
 <18B31986764BA4E1.3236635@lists.yoctoproject.org>
In-Reply-To: <18B31986764BA4E1.3236635@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7029:EE_|SN7PR11MB6656:EE_
x-ms-office365-filtering-correlation-id: f354f9f8-57f2-4545-79da-08dec7b8b165
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|4022899009|23010399003|1800799024|376014|18002099003|11063799006|4143699003|56012099006|6133799003|38070700021|22082099003;
x-microsoft-antispam-message-info: EvjqONASHXF/Mo8wcwc4uASv35lyOiWN1w9xeS/HBvrTPYkTE7LrAIaWY+yoCKi6Zku7t4QLuhtlQEVUvXPMzq5MvDu04ahnOYexl5kEWhyJ+yVD+EOjLxg+GkEajRkn1Ns5IReU/dutmzL9MgdCsaznRazAWNIO0/erVOJPMMks6wjBFAXksVlWjqMsc/CGr20X6fgnB4/N8pjxnY1odUnU9jtrcTtiFO8044PRDc6e/RGqMjrKt9oIW9BlmJWsWCRlPbE5iaRxF2BxMPI27ZN0eu+eLlGZUqqwbFVjTrNAmyPxl3MTETLCxQLHoejvFaVvhdLgM3tkvBOdjEmvbehWggvCFBZOa6qiGWowN9ctq/V8wpMRj3VRBnR0f5ifRkbTvp1xt5wYooSNR+oIyy7I2KbBEnBiSwtA+MU8WTLk6QT63SSlv5oag7YkKEZIYs5BCRzEn+vIkY/GpYqUgWUdDWIKnY+i/1hRDO4AjIDvEOURoKxuXat2gmruwXpvCcYoQNQHlnwHfPB0mA1saQnr7t9LLXYgahJ37GzoZAvdH2V3hCU+RB9Oeflf4kpjHFtQXgTjapVc1pUPoTmbkQTkfuQBo+6eiJWZ+XXx3zr+Qu/IY0DijlRYDsMmdvJ5l3R8hWB+ff8f0RGTfbhouiumEUXOBLOfuKYC1n7FbmJMjqriLPSHXrnTimtD8g9U2w/ex0BoyqhFfrNF+8+7jA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(23010399003)(1800799024)(376014)(18002099003)(11063799006)(4143699003)(56012099006)(6133799003)(38070700021)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ooOuxl1NHYWfuCpkdU/zrnvHqF10IPYV3sx3pO+IWJDFLxQUElA50y7HY5Kz?=
 =?us-ascii?Q?uza+oIDH6k2/+fyOFa+hUTo9l/3til/WQKriKzxzUXqDQXzHQsVT0YKNYxs5?=
 =?us-ascii?Q?kpG7sst2XKJu5bFHvvGzuFBI5Y1lsDBWcXgCt3jq3pPfBoC59w81WplBULbg?=
 =?us-ascii?Q?t7z5wSZywbtChQgleRYYkYEQvuUp/sD+z0aRcnHeioHeGc10jjjOPcxVp/wa?=
 =?us-ascii?Q?C/kljyaj3DGV9Za8PQJIiVw5P12/lYJzmJ4kvhXD2fSfbR+ui0H7eV7ge7c9?=
 =?us-ascii?Q?Lr7WlUddOfR1Bb+sF+sIAgMDc0EG9t0aYFVOT1iyWCU5ok/5eFaGHmukVPSj?=
 =?us-ascii?Q?pXljUrt3WmDllZTv3wdRSv6R9aoygFU3D5OcOBvC38Vnq0UJDMv/cDvKtl90?=
 =?us-ascii?Q?vE13z3b19FFBhcAIZXrLokFBkldul4EVrj4Ix4erBDQxNcf1HOBUwNRjTTs2?=
 =?us-ascii?Q?WN2lkFzmryW89ylP7DEa1D4YMtrHrYUqqGMoeJEx3bf0gdz3gFFzpFmfxb9r?=
 =?us-ascii?Q?RtLgG4wk8mkMyh0tljZAxmiPb00K2TNCaqHP492I9skBDIB7PMOI2xXgI2Hh?=
 =?us-ascii?Q?J8PSxHusUtcbtZSxIzaa0wWyC5iw3jnRh26iwa8YbczosJTiBk/u+YMCS4wZ?=
 =?us-ascii?Q?12HeQpVjY3DDkNDdO1txwWedWXWjEsQ9lUpW/xKFPSk/v1pDEZJSOZutujqs?=
 =?us-ascii?Q?ETUr05OYVh1Cb6klsRr+77pzhp6ilMY1dKgyyLHtrLSb4pE+VtGIelf55pxM?=
 =?us-ascii?Q?5Lvor/lp6MVk1RzJt45TBlAD7VpnNCL69hvO3mYBluQknSZt9HRW6IEdpJfm?=
 =?us-ascii?Q?iN1PWRsmF2RUuSJuADiVQzwIkscFNGB41X6BiMynEtDhTXZ8xiY17jG/zKRk?=
 =?us-ascii?Q?KIVK6mkWRgjWOm2cg1ZrZ8dNx8VvMSqYPDiTC9J+iPsVSACBILBNuROOoJkd?=
 =?us-ascii?Q?RQgjL3UhWw71lY2lZo6fImL20H4zWnpS9Nxwr3AkODqSzLr7U2a2uMLHVWF9?=
 =?us-ascii?Q?XPerBxGgpeoKmJ7iCVzoJ9Idj9s5q++QNqRhOJrfrdseiXaRmX1mdowXk0mo?=
 =?us-ascii?Q?GTNWfu54vMc1IbMLYCfcQVk48tvGHfiyMCw5ISIy3R4znbOCfi9nElWLXgOe?=
 =?us-ascii?Q?aH9j2EapsHkAGeIe1q//XNNuS6wHmCz1if7uNFFCLvc4muOVVVeahuZOVDIY?=
 =?us-ascii?Q?nzuBE0BuJRzmkzAPr+5lIP4y1MEZBPkPc9eCiR5lINAOEM1TwYPQYX6J3Ez3?=
 =?us-ascii?Q?cYtrHqFetxWoIWOeiuazMGAKJKVh+QYmzXEmziHgimluRBlEo944oiyRD7h3?=
 =?us-ascii?Q?KOHfSixPGJstDoiWbJwVi51mnR22DdbvcNXxy7oOYQy6hDhWB2nocosNhi7M?=
 =?us-ascii?Q?q/M70G/mfqhYaOvEL7MaQ81mjtFz+dYyqRZJMH2KAWhuNZ3Sxni8DwcIWIYH?=
 =?us-ascii?Q?2juGm8PJ3P3YOKNYbgpdkvQY21BjkpGvy7PVesO/PiCgHMYSB1u3/9mCip6f?=
 =?us-ascii?Q?wq5eCsJ4KEN1zEYxJsAYuEiSvhzvaO816m9e4NCX/NfR7EaWw5l3IYOyYlJY?=
 =?us-ascii?Q?5VOsXRmhAJtKz5cRKOUUO8QxXabyd51WlfoGQhkoXrmNeJa5HmSgqgV0UIJM?=
 =?us-ascii?Q?9LHPDRf8vgiD7VXIieyr+YtRKaown77muMlJindEudDf8dem/Sqt3KPn1imO?=
 =?us-ascii?Q?/UTSMU4HtQfCkCkzp6QLlCbC08G2eGHfYAO/VGn8HRuXXgGNsqkPtcLVMO5r?=
 =?us-ascii?Q?TRpPsj0r5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mduoaC3MKG00BR1FddQvPH61l93WQHYtvDZajyjGOv4IQFEqh5HhwXZWZ3oeJWj2FXeaeMeKvNsVCGIB0cRCyqkrMXa0Auljlr8K539QST/iJ+NGZfD+HkOK8aBgSaO+9Pig8hlK59EJKz7cCs0y/8iQJELP+ZsaDHg4qK5Gk2kT327rtXtWk69mews2V4muL6TGcmPiOETsFt6CBnhhfChQ7Wh+hycwW6N1bme1xoZSPaDaCjrgWqbe1DNfh7KXmAsSke6awpzkYTY/rShhl5m7iSxeeGUdl0OmoWbEOsj9yvCQKDhWtyQEzWgySxEBON6dBsE4BuaAwFW/OkpNHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f354f9f8-57f2-4545-79da-08dec7b8b165
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 12:55:19.7047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zPXHqIlre9pgpVuI7rJLPzOFfz5415E5GPfOk5dggxEwj3lWpVMU5xLAwYAPoFudtT1D50PkjOC49V/85J4lIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6656
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 12:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238439

Hi All,

QA for yocto-6.0.1.rc4 is completed. This is the full report for this relea=
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
Sent: 26 May 2026 16:49
To: qa-build-notification@lists.yoctoproject.org; Yocto Mailing list <yocto=
@lists.yoctoproject.org>; openembedded-core <openembedded-core@lists.openem=
bedded.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-6.0.1.rc4)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-6.0.1.rc=
4. We are planning to execute the following tests for this cycle:

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


ETA for completion: 8/06/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 22 May 2026 05:34
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0.1.rc4)


    A build flagged for QA (yocto-6.0.1.rc4) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0.1.rc4


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3859

    Build hash information:=20

    bitbake: 22021758e66737bcf68dfd2b74adc6a0cb1d42d9
meta-agl: a0e79e40abd8a48e1e2256e447db56ffad21b463
meta-arm: 052c2cf333ecf16fc2ded4c5d09749ebaff8c0c5
meta-aws: 8bc16e7bb3fa0eee9a96f0d93fdac0b2fd978933
meta-clang: 78c5e12f08198f4f257a9348516d2103cd617c1d
meta-intel: 55e0ff278f7040dff5e453c509357820e8ce4c9b
meta-mingw: a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315
meta-openembedded: 9af4488d46cb4fd4c0d2d64820c86225ebd6ac71
meta-qcom: 531d7c4f5225aa88f23826c0746638efea24665c
meta-virtualization: e1bdfe90563487f0a3253cd4b0d5bb7fa5194d83
meta-yocto: 8251bdad5fda780a000fb41e6eda82eadf0fa39e
oecore: 06dd66e6220e5ce4ed4b9af4d8231ae5f0a8ce80
yocto-docs: 7ac955621b36a221126cd40f12c41fa98c213a24


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#715): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/715
Mute This Topic: https://lists.yoctoproject.org/mt/119434374/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



