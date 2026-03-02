Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C903D58E64
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 06:45:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154880.1772433912942153524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 22:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YWbdlBgQ;
 spf=pass (domain: intel.com, ip: 198.175.65.12, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772433913; x=1803969913;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=WUq40JjR7BDoV/cFx64mLs9ajT2cqLwWGJdUuuntUfE=;
  b=YWbdlBgQefx9DoHhoUkNXXRgNMQyqPFNINnkY5aiiTLFe/Yi9Gtqnhea
   0LuhYvBV5rxm4hB/K566wfvvNp9k0SS6e4BplFkRfujlMCfNNhn6BHZfB
   Ty76U+iCtEvBxXEXM0mQv9prqJlkpwhDjWf8DD3daPriu6JyQMTWUUuo5
   Mu3ZuYO2fTOQeFTwtSpwXWyI8wJFC6sHsmrrEJtP4ZRt7q2xcvpo1Xi7j
   c+WxxMskild3auPNF7iMLiLrraEm57roK16XSQMk7cHAnc0cDYsdKd9or
   uczink+I5iojTZp/wyoIf3Lh7J1FMukAsoh5wXo4+RL7+3d6GX0lJGeoC
   A==;
X-CSE-ConnectionGUID: 2PEiHY83Q5WI5I7yKKFkGg==
X-CSE-MsgGUID: R3bcx7LfRuyFP3Feu7iTEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84898891"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="84898891"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 22:45:12 -0800
X-CSE-ConnectionGUID: K2weQU8XRzG2uLLbEavesQ==
X-CSE-MsgGUID: M41Go/t6TtuFla0srFmecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="217457504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 22:45:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 22:45:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 1 Mar 2026 22:45:12 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 22:45:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSviQVMJQE4xgHIg1nMBiAZOqMlD9XQke6hM2ebfCJ9+HQNnNp/84yA0fex3kpMOzK6HLNKqcj+gEOpXGRwvLJIFWZTBRmS7kh/d4rdiVPsnckGvNA89VKqiLwc89eP2dL64HFx32uSsV0ZIwrOYLBEqTVEpXWdCDFqPVrnYjStJqhdhfsWYl74t+xAwAc6Hv1f2Vm6P6MyjnzDHJ3Qd7220wRwBfO37Ynz2B3EmH7l0e8LekZaIFb9SqeeawXlp3VZuYScvg0SFMLVIefKQKIWGHYR5G/7jTNE9+EvdpLlmz3MLZHwOvWjaNbCiy7kS4EmEkZHfJVsm/gKtuyUoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq5+t6ZwfqDZ70QElJTisiC2bisxhgpNtPPBtAd4bto=;
 b=occZ9rwW5sVAxHKUs2nQjHN5e0LcT0jcPMuqTes/A4gUhRiH+Y5wNO+BC2ymuvXJ1iow66dXRDyu0Dask8L44bMfu9j/BulTFXYcFvi1nKZNkZfhpgyv4XjKOpYLnuq9lZBbf6FeHHNMr0VL1uOZtsDP0LGYGvqkVP+M2+SM6TlEdblvNeTtAO09wws1MuKDiXSv9q2Uxhl8hNDGejK/WVPmfpdsTkYPw3zWt5YIC9jJqhbJGC/LQpTbZ47HQq4lRD1W2ulKCkCMThTpLcSMSOJateMBtPM9nMRsw2rSfnq7x0yELM46EAmk/9jgVPEIpMBOGWIusrAL5A2pwUTC8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Mon, 2 Mar
 2026 06:45:09 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 06:45:09 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.16.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.16.rc2)
Thread-Index: AQHcn2P/fOsZuyzCX0W5udpuUN6sqLWGqPdQgBQ30pA=
Date: Mon, 2 Mar 2026 06:45:09 +0000
Message-ID: <SN7PR11MB701846F177CAFD0D00A4C1F3F47EA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019c6759c149-effcd63a-6c4d-496b-9059-b54370d7c341-000000@us-west-2.amazonses.com>
 <18950084A1040903.219417@lists.yoctoproject.org>
In-Reply-To: <18950084A1040903.219417@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|BL1PR11MB5956:EE_
x-ms-office365-filtering-correlation-id: ad2bc952-9af2-4248-13a7-08de78273f5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|7053199007|7142099003|38070700021;
x-microsoft-antispam-message-info: kli3X6q8TXuIOydinm0g5bVzvKYZQ379yU6SGYitDEQG+nJpCR8ha2POWRxO3lDKClpCGTMxyzNiqfOnkgoksxuWG1ut2O3WkDbXpRZdaSwCHnt3gD24+aNGFXwnvXU4oqg+3okcX04YiJvlFwx48rYdrBGZPkteNgtb+VVyCFTPLNF4e9BTD15rj7AVyhukB3W0pRNkT/XpLNlY7aHOQ/LQOT8AlAQg/ivpwBGxkSZjUdmTvzo+Tns9H/xwyrSOgZCf0JTAyB9B6XlX85dN6poYMiOCOWFB8HzstRq0YFiywSB4mArDyRoSb4cnYCM1MDB9qdqyZa4QTW53Vj8vS8O9E8sRCMPaAFnBTSgGwgFTtKWuZZx9K499CPORDotNshHEVZ+373cpKQS7T8n4Q5RXLQFq39KBaGnhlz5Q4USHf9Rp9A6WeiUUMDA/XkY1tEAxSZLYAceB0U0csmB/YzuYsVudfwX7L2M+EphwAmgmR4kygk+/UISRA5ZDBxqhrbUnesK3NDrE671txTDziwNfutwF5EjTuAxiMKI6f1bZPIMK6eO6H99xlAnyn1In9Fi/9wLsoy0Z0UnKJue6/dwDRNApo/Lprm8BCJb2eBStrrtfsdX9RCLRUMK/nAvzi90dJo/mLIg1L5JNJP5Qe4tP0rapWCLP6Czwkwbmor/u3RRCS1kXHqKDZJH+GtuCVhvWS0ew56b3o08lm83jYuZ84WJAsD/3HMZhuNIsZYN1NHPr3LUL654B9wR9GE4Z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(7053199007)(7142099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kXYu4Tev/tBM3UIGuo84Qc8LOnW85HIQtszZHqdloVrA1mmyb071tbyjhKN9?=
 =?us-ascii?Q?zLrm9xwu2X+luceH10gtYNr67Lt0+0UKCMtv4fCWZA6v8DwOllYdK4xgtvXB?=
 =?us-ascii?Q?Ch3ctBLwXUGLaFToBAea7T6JSXxo7FBl1/QUy0knMZtmJ4hRR9xaAPBJhYpD?=
 =?us-ascii?Q?YV3UsbeJx04trK+eh0RbfMUjooyLwOsOrh4v3HWx68HMNkUxcNSsy8c+8TB8?=
 =?us-ascii?Q?KZR8ACFOYcXqW7XM5cB9PpTxPTPYlbf1Ble/k89sI+ofgI/cIgQB9sHhxjoj?=
 =?us-ascii?Q?49aRZv8noZbZnNVfstbseU02v+zF+Y/6gwVaV8XwKn1WFLtsUwaLGtOsPpop?=
 =?us-ascii?Q?bNqgiNnano5K6nHJ4QlFBKXJ6alYjm5bsD8JNPHS3HWMcvF1a5Jfrej9vlac?=
 =?us-ascii?Q?9hCODZ6PamTh6xncpEsWlJKKEuJHwSFF7lwz1gP6WlzcA+U2VcnpAXi6xFFc?=
 =?us-ascii?Q?qgXB+QS3mZyrbxrV7CmzBEF3schap0cduoiibY7cnVi0j27f0nPbwrMa5ZD7?=
 =?us-ascii?Q?q29Mx2QoWmzs9kCAXPazrry3ngvP+Yl7jKBVa1pE/VnIEk3EMoYZj0DzBEiy?=
 =?us-ascii?Q?sy53Lt1KQ9mFqSWu8haNs3LiWpPY/Vn7SzO+Apdny+guqYVvAMN7Qn94YK2J?=
 =?us-ascii?Q?3hSAyDSAehK4QIgJUbajnZ3Ifk2ZLd5eOf3spjBo7ZnR0qjhs9qaOgOGmO7x?=
 =?us-ascii?Q?vikRh6AOL1OnBQkhCArLxbWsQ3vp7yvAVQzflx4gSTS3cXRgrUBKJnF65haa?=
 =?us-ascii?Q?fNxCloGuqt/IfCRLfHqnvbXVUaJs2lddeGRaDBnqT6vC36E5braV6ZdqfDw0?=
 =?us-ascii?Q?vtEGZ+fx5tKs/aHya3q8pcFNWeoEsFR0s6Zz6Ql4sSFah/GEK71s2Z7x//Vn?=
 =?us-ascii?Q?hQ6hR5nrCgZ8YcOtCBejAnThoQALOpCn8WDg/0DSL+801CdQUAuoUf6CRh4U?=
 =?us-ascii?Q?oDTuAbOSVDoJ0GzSHdT7pD7wR1ifM/6Avv8XN/lQxULWJ3wEvZPwQtqeK9/u?=
 =?us-ascii?Q?MiDQRtBf3JJo0CnFiK66ytNt4iB+kaiPW/E7qCbVbAMUza6ixLffB4SaVtTf?=
 =?us-ascii?Q?nf0xZkF7lFN9lxeGPpDC458ZW27Eip4GvUVsDNi2VRWK9IKxUamuAoHqjMS5?=
 =?us-ascii?Q?qMenkU4xhZTMA+3VnSOAx/DGZCgmLFyOuwO0/nhQ7dS4AQ5ixquLHnk/GBmP?=
 =?us-ascii?Q?DboydD7jsuHRrwhpfgnaInwOlMrgQdB5VHnweFtFM2bTHejk/YIfqdGT9HQv?=
 =?us-ascii?Q?ylys3BnQcmCFvg9ocMcrMILEnWpNRakriGQsOKgRoDaR1Fuqm+FGMeXwp3AR?=
 =?us-ascii?Q?xmpGZviQhO9Watv3tFREjU6lVpqasvjw6fKBE9eK63c4smcKyGGUAsbvGZGP?=
 =?us-ascii?Q?xdj/1NJ/HOcHjLSClCyvs5eiiYCSfLu7vFJ9g2OTi28sOS83WNdpIkZVNL2g?=
 =?us-ascii?Q?dKMEtJbMItS4VOgIkvzHnNeTLInS/1HXLl9LD1sEz7Vg/srQUTYuCdx6ItcU?=
 =?us-ascii?Q?O3q2LDbVs4eGE/G54wEBkFV1cD1/tGPNl577WMQzcFWvse/BUCfk9BQOoXGE?=
 =?us-ascii?Q?/xqesvmq5J43dJz3olPb+CFUbyeibZBvBo/pzrSoypESy+usdfb0sZqOzue2?=
 =?us-ascii?Q?3W468IdLVJQOLxT/adaHelgJb+N0wsz6ikxljNWqbN/nnS/kmdqwHmH/lARt?=
 =?us-ascii?Q?GpZ1djJXBrNJndoQUZZ/rgW5A4e8lVT0leU3txyWP+eaemmjBPM2NpAKcYd0?=
 =?us-ascii?Q?0aYpp2r7TQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2bc952-9af2-4248-13a7-08de78273f5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 06:45:09.4866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FuE5eEREAuzCVxWKxuqfexX0+ILLlzfzRePJnkM+9eJf0dlZq3ga4r09Jodbvyve7JA9TL5YmOxPIrpswYtn+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232172

Hi All,


QA for yocto-5.0.16.rc2 is completed. This is the full report for this rele=
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
ists.yoctoproject.org> On Behalf Of Ghosh, Debal via lists.yoctoproject.org
Sent: 17 February 2026 15:33
To: qa-build-notification@lists.yoctoproject.org; Yocto-mailing-list <yocto=
@lists.yoctoproject.org>; openembedded-core <openembedded-core@lists.openem=
bedded.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-5.0.16.rc2)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.16.r=
c2. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:
OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Meteor Lake-P
Alder Lake-S
Raptor Lake-P
Beaglebone


ETA for completion: 25/02/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 16 February 2026 22:18
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.16.rc2)


    A build flagged for QA (yocto-5.0.16.rc2) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.16.rc2


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3228

    Build hash information:=20

    bitbake: 10118785e4a670bce4980e1044c0888a8b6e84af
meta-agl: 8611917335f6d1f5b29ea495c8f4c2c914183e8a
meta-arm: a81c19915b5b9e71ed394032e9a50fd06919e1cd
meta-aws: 1a9605b6c4787bf20fc90c8801c36822760b4bc9
meta-clang: 613362523f3bf85ff4862e2f1f00113b8d2028be
meta-intel: 5d153e35b4e752505efeae368f188fac5e31cf33
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: 7a5075cef77b5f7af454e9868e1d0019f2fd1394
meta-qcom: ec80a36bce11d8182b4bb2a6fa0359adfeccde0a
meta-virtualization: 8b1543e121deda2445f80f74d85c10316d5b31f4
meta-yocto: 9bb6e6e8b016a0c9dfe290369a6ed91ef4020535
oecore: a1f4ae4e569bc0e36c27c1e4651e502e54d63b28
poky: 1d54d1c4736a114e1cecbe85a0306e3814d5ce70
yocto-docs: 369f3307368eaea605983e80047377fd19ebd6bf


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#656): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/656
Mute This Topic: https://lists.yoctoproject.org/mt/117841921/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



