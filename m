Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3513EF8A165
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 11:49:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12022.1776340184919141756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 04:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=fw9uZ93I;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776340185; x=1807876185;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tSADUorelmzld8cRktWqubbRJX78S420m6k81ZARBag=;
  b=fw9uZ93IlLhU6nk1c7X4saAuhdtyCJXDAdEgMiNAd899bYj4ZohYoz7c
   sx4L1pi30a+ay3VYWeQI1gwpHZwNY3DWp1Hki/LPfSW134FxNu/j4FEzY
   +tRH48PVy2wAFVI7Orhkwf9D4Pi5BA4wAvmpR34H4ZMnUhe2N0BL+h2vh
   1SwPXejat9XmCG/TQ/E/XtlWZW5m6Jibs4cuDZx1URA58r9hxaulreu18
   iiPa9wjAYGki/8sUO4wvpU6+y4jTZuwj4wzv3JfQ57ziymNfMMsWWjTxW
   sPQQJtBN3mYHcdZ1aZ/m/6GPw8D8AJ501CmJZZFPMcqw0FenKbAz//FLk
   w==;
X-CSE-ConnectionGUID: QlLmnzUXSVGF/pWfpgepCw==
X-CSE-MsgGUID: P8C8BlUkQseqX7Y1Yz/AxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77211066"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77211066"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 04:49:44 -0700
X-CSE-ConnectionGUID: sNGvOu2SRjWCoARpLYDR3Q==
X-CSE-MsgGUID: XY7KkZfoS8WrjhliJM82wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="254172452"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 04:49:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 04:49:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 04:49:43 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 04:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9NGVKRlYp/ApZvibl9ZYtGfDtP3ZnY8hd4KqOz9f1qNLukCTvv2ZFgUXLWDpRaZ5ETDs7b2udH1ou5Jgsw+2Pxq5PTbjAHt7q5EA8MPLO9GkzAX1gWhALKJW0xmnBCW3+WOE3qAfWfJSv5CMyCFxrouDWrK+Mhr+GqYX/6vk1v/3YJUAX93aT6Xcxc4NGlzWpqTMiew60Pi/jeo26wRRUp66cGFSg/NcYPVIjf1drjmIgM+x3FszEuv8cumkIBFCVBG9Vi8HkbmoMnjGKZUTnAcRGUS/ExjqcGlZ1Dj8NIcQV6lx63tCGatCt1NbVAJtTWFLu/5LxkW40sjUufThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF3lAYeezE2wfTv9/jgKl/cLuOA3c0VroDQwfvDxr+k=;
 b=PZkxoU6W8raYluS6lxQaUOh6gZB2bilYALINEIknghBKOFEwc0S9/TWXpGMMNWt/0tIroRPzuOcRemoToOFrDRNxriTssoEJ8ZXOrwDYUicNya7fjFzolM0odIzOOhfGphOVRRn99L8uliUAo2/LAP5mSRUT8cSNi1FI2KBhDlNXfQFCrL2tb/Zf3W5BSMhUMLSmOWV78qlC3mstuuUef4elQbeLfzmLTLZgGkQU4vIu5dMYk8Nh2BM2qP+lDp0FUYpAM28XMfVcYxv3c/hjTgd6migHG/NLeKixqGzM5eRvWxhnVhFAUyQ6+PQMdXl2rcYDp17yIUH6s6xFg83BmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 11:49:35 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 11:49:35 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0_M3.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0_M3.rc3)
Thread-Index: AQHcycZQiUdakyK6cEi12ISRY8r58rXcX5rggAU6m7A=
Date: Thu, 16 Apr 2026 11:49:34 +0000
Message-ID: <SN7PR11MB70188B202C1CBBCC14581865F4232@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019d7d1e66ed-2b939a78-45d0-4b89-9c9f-9b37efa1d8d6-000000@us-west-2.amazonses.com>
 <18A5D0A59C78B3C5.777565@lists.yoctoproject.org>
In-Reply-To: <18A5D0A59C78B3C5.777565@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SA1PR11MB7086:EE_
x-ms-office365-filtering-correlation-id: 101a4a52-d13b-4095-07ef-08de9bae3b0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: Bau6R9xqYgJrp9Pm7y0sfstF3NiTybg6IOrkbblSP6iFG1sQsMkqjIsROTcpoqX6EMg6eAorZ3yzh18TKZyQycWfml9PKESoYfuVYHOFh/uV6v07XbDBZvXE1hn5AMein5WbfprpDgqitIpcK9Dvuok/Mf6+2i8awNuENY9GCUCCvk/xUMrJp8X02msXM3c3gfUeeOO6CFb7k+7GdSNguD0DzNluykKVx9G6I8fYQL2z1sYeYiAO2jBxdYfG3/Xcggp/Q8bkZK5uqvYa1JnH44SEzYZLjaVSC3o/D8fwBVEX1+Ns7fDQMrvranjEQ/l0bbpwDFCvXxK6vRFE5IbwcKdWvEDaJrnsUgWIU5zxp1btQWKH4dtVz4Zkue7R1nrqLSMcBuKttl37VZRdYWMJ2r5ExOByiUl2lLspkdiIJwYHM4UtAPUStnDEaZvbZv+/5//FzR+wRuk7HjhHsF8Jx2X7yWoL1/6JsT9ammhSbCVuqa7yl+WmDzx39yOtlanJsVtn5leiOjdKbPRsUBFZOreizL6h/MyQQZaZJoIc1Kfr07Vug/F+wk1ZCQTh0ZI0YSd72SHxV0k8llKjVPGczvScx+jC2uuZYT0JXpwqN7th9AVDOtztu9y1l6HpVMBbNuFeRRJ5n1zYQzBXlIcZWMt5+G1e7sHt4Ms22CIwqyD1JR355AVo3eF6Hh4s4CVK4fc9MUzzLOZzefc+kWpy6ruuUii6Rsn0Ixm7K/lImkl9sReo2cFIB/ppavhKrYYN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UMmXPLZQLdTOpN60eNnoRYSBpsTJ2yZ3nV9JO3oBXcQrNEx+2qma5MpEo9Qy?=
 =?us-ascii?Q?w68Na5Oh4WA87b9RVnJ1WIVp+1Wk6/J5UyDf7l2InIcynk5pVNC9eEAzlY0Q?=
 =?us-ascii?Q?+iAALdHSJSQwi+4583d7oFup0THEi+Cy1CnkpTvzH+aW6/audPTawOasRF3i?=
 =?us-ascii?Q?lfQVXyIl93e/Zp3rZDwQ3PBM9nIPincTQ2R6G8tzt17qFDa7wWIq9F7jcNxe?=
 =?us-ascii?Q?hkG/7spC+hjgpf6fe++OG7wqjORQE/cMw6nsmDn7BvfdMZ1OHmmbhoOqfa0f?=
 =?us-ascii?Q?lSLjUMeK9f5F0Rt+GTak9/yj9JTUhiAuxns1/XbUe5exduZW2oeE/LL9hUx/?=
 =?us-ascii?Q?V8JJ0/B4uBmCesl1kYei6g4GD9hxHyGXtdSN+J2hsdS6b38547doY29YAjJc?=
 =?us-ascii?Q?5Z+QV7nn3yn9XfHOrK+ez3mAWV5sZhxzJ7PRpHUtF3iOmx1/jMyD+FHYyAmB?=
 =?us-ascii?Q?HYdH5XT6Gk2oCaBvLkK5vE5o83akrhuVeZtNafaKGmWLjaL3AhdEkNcwf0sN?=
 =?us-ascii?Q?C4JOVd+9Pf/V2AfCrYrYhCnFjS2HJDTFdfKqmFnHnjpxoiaRiZu/vLwTEkz0?=
 =?us-ascii?Q?6/HkwR5/S85JogXPbFYydfU2YVDrN1lHKaH7CrihEm2WPzGjGJZHg1kX7Wqh?=
 =?us-ascii?Q?y96oYSJTrQ1VOvjc7d5PhMOtOM6TCm5vitD0MPp2HbLYU+S4RQpQwq9aGXMU?=
 =?us-ascii?Q?wF3JNb3W1T3+gHcDAippPbvdleUmMdP37Y8zw0IhFN2vIuEE8sx0wEoUG26L?=
 =?us-ascii?Q?3jDVZopiSt/7IVwAQMgtPNa2k6wLZzzDjF30rP2ZLQ/PI/BU+7KlwTXtx2J8?=
 =?us-ascii?Q?yYmZEqIWVkigUESbIj7pSY7JQg0PZRd2NjAYHb6BRfNeAvlTpyIrxKshP17i?=
 =?us-ascii?Q?dYDtB3JEnVUADBZcikfzvJBAfyIe1dmmZTFKKqX6oKYzRt0KciJA6S1GzFrS?=
 =?us-ascii?Q?559y4p25EZ7IAfdDrgz8qcZb3+rz846Dm2SILVZIn5FXF++rNbjZpEBolcM6?=
 =?us-ascii?Q?Uw3dT6YfYCq1yB9uzn0sFa67qBXE4Kwrs+jdch7fq7ErBkjsdCvj8AHb7E73?=
 =?us-ascii?Q?odKOs+ZUTPgukNjXAHsvmmW1XaJo93B7wS7Gs5vubyx3sp+vEyqNtAxqXeV4?=
 =?us-ascii?Q?Ex3B+UqRmX+QfGqvJpNzUWxNBkMgLcnwS9VnpOv/93juWULQ+8QWiYKj1hSn?=
 =?us-ascii?Q?/5TRAOY0EFg32C65xpPy46ZhtO4DLqL6+2w4C0qWk8zcX/z5jJSIEMIqjyZ4?=
 =?us-ascii?Q?2exO9HSxlqyIXIPqyhprX4elXxv1kbPagWPeEVrT+HHvTzeW20GovgkJNiqw?=
 =?us-ascii?Q?0cL8Ss/qME1oGo2jTiD4Ou1v8Dh7l6xf4JK2e/P4dBg01F0Q/KbGkN3guPj0?=
 =?us-ascii?Q?vsRFXANn9hBQM4MhP+13WKUC/fi5sILQsy5atk5R9T5wKZ2Tx3etkHPlOZ7n?=
 =?us-ascii?Q?T59OsakhATOgyymz0idj4v3/D04xyk317/K6pu2eF14N6yby9a+hq0SW1NUl?=
 =?us-ascii?Q?COwhHfDau9UcORRzsW2M+JV3aV5dYyJGqInTtjM8ThdNP3//4OBoZk2zNwH6?=
 =?us-ascii?Q?a9vfUgQDCkMUMJXgE78ZQqX8EwunYjYi/I3dYdS6i5c/dQJ29YyLnQHoBVbB?=
 =?us-ascii?Q?XBYs9GZGLNZ8XZ5Z0wtMc/UBQN2vKE8Uj17/d0/74CMSZ5azjjDA3C9uNvu1?=
 =?us-ascii?Q?ShwpPM7bBxT0BeRe6kH4WSx54e9S9r4JMM6s9MvckRwESFvAX6ALHD6FJM4I?=
 =?us-ascii?Q?4myfQ0cOTw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vuLrRi1eDMEFz4Qb4n6D5lqk/erhGS+x8FYj1sPAAwsOT6g5IS3sy2JP5Oz5rzVKmJnZlvj63jAapZDhL1teG2c0gSqjqnp+PZtU51DNpFxpcrTVvqC7iXfede1P/QumvTR/abqzGaScVSZ/jF08c61YKN9QcuNFX40y35W5vQyZdLSjvIUdIQa5y11kKbPp7aYp7p53SaINHwQ3iaONg5pSi9JdleJINsNRL0jm24lxMgflhA/8KPCQRlFskqjIHJdXkkqlQ/xC4NZ1Buv1pCjyr4dlI68Prmp46C7Z3U3VtL/zWZmy3BbAKU2nGMGzz9o4Z5aP02WwaagOmIzSng==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 101a4a52-d13b-4095-07ef-08de9bae3b0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 11:49:35.0177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HrNG45xWqNG57ZeC0CVMgRpO7ySJ1Jn4NRmduaCXI6jQYNbF+NsWn/sLjNeHMosGSS0WQ8i2NQGyAYmpas5mzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 11:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235399

Hi All,

QA for yocto-6.0_M3.rc3 is completed.=20

This is the full report for this release:=20
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
Sent: 13 April 2026 10:07
To: qa-build-notification@lists.yoctoproject.org; yocto@lists.yoctoproject.=
org; openembedded-core <openembedded-core@lists.openembedded.org>; Pokybuil=
d User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-6.0_M3.rc3)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-6.0_M3.r=
c3. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:

OE-Core
BSP-hw



Runtime auto test for following platforms:

Alder Lake-S
Arrow lake
Bartlett lake-S
Amston lake
Raptor Lake
Twin lake
Panther Lake
Beaglebone
BeaglePlay




ETA for completion: 17/04/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 11 April 2026 20:47
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0_M3.rc3)


    A build flagged for QA (yocto-6.0_M3.rc3) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0_M3.rc3


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3643

    Build hash information:=20

    bitbake: 5d722b5d65e4eef7befe6376983385421e993f86
meta-agl: f5590359796fc6453a17849904a281095257ee38
meta-arm: d987a5945802dcbbc06be91a0d34f00431ea840e
meta-aws: 172c1f12366c50f58c317a4ed58d6de79e7afa1c
meta-clang: 78c5e12f08198f4f257a9348516d2103cd617c1d
meta-intel: bf06e8360baf2c84257e82f4153e13e62708568a
meta-mingw: a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315
meta-openembedded: d793c367e067c49956d38caf6eb84cb112c9c9b7
meta-qcom: 5d1eabf99f52bc5ed4c629ba4a28f567ee69e564
meta-virtualization: b59fb87c0e991aa95f62627c3b2a606956ef6377
meta-yocto: 49cbb01d52521bfe557395c9ebfae6b1c162581e
oecore: f235ffc43c7783a84e1ac0dce8489fcba8354e12
yocto-docs: 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#689): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/689
Mute This Topic: https://lists.yoctoproject.org/mt/118776275/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



