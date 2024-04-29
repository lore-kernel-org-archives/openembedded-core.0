Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B320AC19F4F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 03:15:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web11.11819.1714360523872977797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Apr 2024 20:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=fh0Lekhm;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714360524; x=1745896524;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BrXU7eyjxA7cN+6Gmuy6DwkDTX4pgoMRUvO+WxaBve4=;
  b=fh0LekhmNgHd1IOA7nabl5mLxO05txGWM0L17pr7YsbesBBvpRCT6RBx
   3sdq9BYNAtw2ETvtq0MPgtqNKXyOXQ4ptRqvm1HzigoKhdvQEi9rVuqi3
   9kUIBO3To61MI8xomG2avxltdYNoDUiM7U+9mUhOpdvK+6NrP2GHppaj3
   LTT4pgREppgFGoV6hX/kkRX6Kr9dG3Sop0vtnH8qmV7Kglh1JULiu7nLL
   rZbjllbAuot75r6BXVneAhhp8VTpGUWi1jPdPz6+smN4RoprHQAjYtOsu
   0UhoNHEPKlfULnAY1lmfOEawAo1mEcxESG0Y034lIuK/KuwpOyOlH+P+V
   A==;
X-CSE-ConnectionGUID: LlRpO65hTgCGwl5BtVXvDA==
X-CSE-MsgGUID: m2WzwNqzRe+W86v6V2m25A==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="12946267"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="12946267"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 20:15:23 -0700
X-CSE-ConnectionGUID: tYL+9IeLTdyflWWkDWzDHQ==
X-CSE-MsgGUID: ncMrdZg2Tm2t8OYI53QzEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="57169291"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Apr 2024 20:15:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Apr 2024 20:15:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Apr 2024 20:15:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 20:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3yqtGuWsZwbpPVd27v3m5yDdodCJvHH87vQfkhuwbSkhJzAjXLeEPlK4TrnuF+hir/EHlqwoq2y+4P1DPqgWH1pNZ8bRmfMnhO1sOn9KvRIeRtaE/nz4nc8gLoCzefHaiGuVy3/oDwH7MkU2w3kC3OBBocwA0VNBoEYrG9a1LKFlrdalwCXRxnXDIB4nONvHInwEa+9NmY4EC3rJd3nzjaDHYdX5KXmPLqWHS14lzScbroujZGqPBGRwX877KnxlFMXoCfGavjVIdp6r2zYLuX3q2BTnw3JNdwyHWN6PeoaqhFLY3I/95k0I6Xpf45R3MGEwQLWj4o31J+Qnu6keA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BA2o6BqXpZYZbt8iiAjbKntSG8eH83/Ewm3NhBFGsbw=;
 b=NAxXHMBA4nB71k1TPWJzCOtA51UNWVyTHEsv9EXxRe2caFViqdtgVJ/L/N3vM1s0hhaNQICWOdF4SCrofWb911xOxyqDi90MmPkM2VsJ/TWeYbcNTDTf/TZ3HnIKHTXTlSbhdjjYpoUeP7nTIhj1t1//G5y7SBbQoD0Z1VPT/nqaKRqAzBZJiA+lRhsNK+hD7niPBiocN2OCVPGKvUEs9C24tLK11z9nVjXN6Dnb+kKSWdLxcdM+PIYJrDtARY0AACl8IqIRu4alhV9XPbjJxDyFP80aGNAg6K5JZgqown2cjX5YwtmOnqvc+KKBeUjuc6rZrNtuA65pIYPdxy1JGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 03:15:20 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61%4]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 03:15:20 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.33.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.33.rc1)
Thread-Index: AQHakSKpYlQ713ghek2rGztplLux0rF+pDjg
Date: Mon, 29 Apr 2024 03:15:20 +0000
Message-ID: <DM4PR11MB77606A4D222800A064A16FC9A11B2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018eee7c0c50-f4c06ca0-8b15-4f96-a5da-269fbdf07dff-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018eee7c0c50-f4c06ca0-8b15-4f96-a5da-269fbdf07dff-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|MW4PR11MB5936:EE_
x-ms-office365-filtering-correlation-id: 3f1f0e27-bdad-471b-c4c8-08dc67fa99f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?XLdbd21hJLgb6IxwCzzoyuTD+Zda7pfUPqTIVYplJM1RQNOJO9fJoLAXjKzi?=
 =?us-ascii?Q?llh0ijfYk/ddj/svB5ktxNw6A6ekbf6PiE3UlsmLF7Q3b4qMDMEqcEYb5r7F?=
 =?us-ascii?Q?y4GvkBs1k85QEvvRQFw7/T1DnCPRR2ILPCn+Qs7xkKrMPckChEyesBcp1e+a?=
 =?us-ascii?Q?fYK65pyDJ/sEEWpK9LUXz4+8ciEh+fNfCr7Q777NQ/xPEuHQRSTDAomIp4tz?=
 =?us-ascii?Q?nu/2FT30LKTkOudQmxeWYY/CuQCiGof5HlsEtDcmQpLsG/6CZGwGmAM4eA/P?=
 =?us-ascii?Q?QN2CrZZ+2Jhc1kKAvcQhds00EKlP9/zeQrrTWYaa9GVYNy+pfLEEm7A/I43J?=
 =?us-ascii?Q?p1GqChLU3IyQcNhK9bBeL9J1HQA+0s6ns2EF5R6MdDbhu4tOv7jhksRHHikD?=
 =?us-ascii?Q?+SjCRWFGoT6+8xtDgineCF7FSfDxwahcppAY8vvNTizQC0a8LsEugI8EQSlL?=
 =?us-ascii?Q?mY4Wj5+m0FqGLgIpMQRCJSZgsfazbN0Pymghz9f3taO9Kg0p34WXyDhOXy56?=
 =?us-ascii?Q?zr4yuDTjgjs9W9NbIVt0FpSOuimaA2JeHr87xh+Rdc+feGwwCe6x2LLg+Mms?=
 =?us-ascii?Q?Z8r12pw12poTlj/l7E8C3di0Ig93ztZ71WLinJxJoqIIFpmpDUWtXbbX8EM6?=
 =?us-ascii?Q?k1kqb4QHR1SyYDr2KxYNwMWKk0s4hEEpr3mWUBiQg00Hniqwt1LD0PTQDzDE?=
 =?us-ascii?Q?5AL2DP3ceUvg0J9eXkWhRIZw9hQdxpVFe4bo/ozcTw3XN12aOcPnJ24Rf4g8?=
 =?us-ascii?Q?lv+Uv8IGEbq5pA8Y5lLRUkMXWYNqkrS6yXu+rbtwWQMm/DJnj5L9E0229+7/?=
 =?us-ascii?Q?qdXNyGoehvZ9aqAiFqHfFcmU1EnmbQnQDEhI+Ouw/fvDgsyCXJpdjM9EOSnU?=
 =?us-ascii?Q?bIY5P61LXGrYICe0sP0HEgxhqUJQZQOBb5Fxtg5qfkuSk8tmfQtAm2ECWfKg?=
 =?us-ascii?Q?9anKT6kLnwg2T/B10QGGaSZfE2TXMaZF5MNX0EmZHx6iqkUgGBmrF+TxLpr1?=
 =?us-ascii?Q?t7I1xTpWeo6gdw2hdozpitdq+2wHZsBdk9o2Pfn/D8tssETvDEPd6VGhPqYC?=
 =?us-ascii?Q?BasfsB0KcKaJf5YtjL0H9KJoA/sigQlUl/bD5nqZn8Vwn18qLPuD/4RHjYfG?=
 =?us-ascii?Q?xOiSxCjtaDkc8aauOQw6ekv9sQTV+ngw2NKlR8IsTxwUiROto0A5LEgFBFmQ?=
 =?us-ascii?Q?cFZCZeUJv+js3DpddEmhBNPoIhmF8zFG+gC1VW3kxpyB/tk1TBDCutR6yaDO?=
 =?us-ascii?Q?S1Igo1QIINnaWq2+lW4X+6vCIJ3yMROPXt4CQdjnWOQIGq1zku2RixxO1wHl?=
 =?us-ascii?Q?/YA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Op6k45PzpJ28BeAdXpB30EJG12oSAcenSNP5/cSwWV/PtiGmlBBCHp8Rhytr?=
 =?us-ascii?Q?AY5PyjmZWFaRhfo8lSTjqebk1b7uYKWKYj0oT7kSYKOGVw/6YXKgiZG3maSD?=
 =?us-ascii?Q?v/AVK/wSiaNs0AmHYsV9RVKy1FhgkHlR5N1gf9DtdVZwnvDdkz6xaAkx7N5Y?=
 =?us-ascii?Q?leDtwhW2LsHUAX2EjtIIOKMKNXTtcWr/eS5hF0z8ml9r9/Wp4xhEcMmDgZiQ?=
 =?us-ascii?Q?z/R4FEJiGJufSwqeaTVWaZBie4gWvZ4ii/UHcmL541wfQkBsbAmXBM3iL0OV?=
 =?us-ascii?Q?DX7z/9RY0tu/NqrnQXTWL03ntcGGkq6qRWAwvt3AQdjetunoFEz7SSqztXuI?=
 =?us-ascii?Q?3Vu10lASYei07fB3s0Vi3jLaE5nLZTz8DM4ODIsCaops+/liZoYdSG69UYB7?=
 =?us-ascii?Q?clQIHRQc3VjoQ2+qUEEsiIprEsWBcIYxdpP/iFyO+anMW6fOkWst/wY/hOgU?=
 =?us-ascii?Q?8Xufinw3wHsNUg/q2POapkkL9fYo7VWglyHFhPTyWL89VEwLeW0XYECymag1?=
 =?us-ascii?Q?hv0tBD1HzcEDpLU2yQ+tgNSl1+PVR7bllwdp1z6oHbyc1j+cD70Zfxx0SyGK?=
 =?us-ascii?Q?vaSBXQzZ6mn5XQKB8cV0yEA+4Habwm98hbj/PLH9c5uX4/ssl80QkhdsF9y4?=
 =?us-ascii?Q?9bljwNXA479sulo8F8iNvWTPfSGiHsEzevAmJEUGQej3NIUkgF7D5OQMfet1?=
 =?us-ascii?Q?pj5tta4oI1gQkgBTFvnc5+WFzme70gToTyF5L45PT7de8SaunYpjeSNe03ZL?=
 =?us-ascii?Q?7nWvJjG/NsGFttMxu4E5PrBIL38Z+MT1sZ1a4PTHaQynuPDVq6F32VRoaLoW?=
 =?us-ascii?Q?ErcRfxh92fE7zo+hHdTjlT/pQaGUdqH4wYao0NAZamhOt7F9K421VYSKpIHf?=
 =?us-ascii?Q?h0O8TzHG8wZx4rYNim4ACeLW7YMbtW28OX5wcOZEtgG82XeXW657blTHOJwG?=
 =?us-ascii?Q?/DfF94VZWAoMsaRy/pgQKkd7QbIzl1VmFXfM1/r8UaReJp56z2OC64pQ0jBP?=
 =?us-ascii?Q?8oN7n3g9WR1EXiXSYZDTnXa2D4vTDl2xpQFoyHDIdl0lNmIKvNacX1V+YlOE?=
 =?us-ascii?Q?GaFMStuMQtk1GeMKtrI62hHiIb563iCBs2eHsE/a6ap7rnvZaMPOsVpTvBrH?=
 =?us-ascii?Q?Lkp0naxJcpwSDgsuYWq8i7R051hV90uyX3+HyAqSxby1KHaFpIgQekZC6PRN?=
 =?us-ascii?Q?m8emEKxFUThZOFIXj/3EGPgrXxHZ1L+0Dq37kBhu8O1zlkBzCvJnm4uTkCdg?=
 =?us-ascii?Q?dIoMRdQA9oBY/7CtJmItqQZESHTbd8zDosE/nxy4ZJQPHW9AO3PRWYuPYXM/?=
 =?us-ascii?Q?rBk8xGhq3ssw53FmQC5kdM6OpzCFbwkvwqESeYbzsn8nhiSsbZf/UPtEHCl5?=
 =?us-ascii?Q?SobfyO/sG4TouBSTehtiKbENzgtWr98BYItDuGd+duwM3dl4qT/0hBJcaHsy?=
 =?us-ascii?Q?1IHW5dviPm3DfN17IjFwqiHByw24cA6GZoOGVG07CCHW4RzVKMYJl8wpZgFJ?=
 =?us-ascii?Q?mTHumCqdCGcEkYRfybQGzquRmPm5Q+OCxNg4gY50TXmDqG5vFFbYFF+ImH55?=
 =?us-ascii?Q?twZJl/I1Ez7ptY0U/H7Kd87TWDCb3U7A67fX42w+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1f0e27-bdad-471b-c4c8-08dc67fa99f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 03:15:20.2129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uC4GkG9MBqOvR6e0z3si6pS0WPxZP5wpdieikMlJQ1LWDTlLYzXQzXVgWB+sfhP6pHwsKTQ6Si10TNGKQ31Ykg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5936
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 03:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198731

Hi All,
=20
QA for yocto-3.1.33.rc1 is completed. This is the full report for this rele=
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
> Sent: Thursday, April 18, 2024 7:55 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.33.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.33.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.33.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6816
>=20
> Build hash information:
>=20
> bitbake: 7ce4107bf824b3e115b40558336de25f99af31f8
> meta-agl: 6febe63dbdc2655efeac2596f7a2d9cdbaa5bc6f
> meta-arm: b75b8ce1ac10dc3521c0f710a4cf79bc7e985cfd
> meta-aws: a83f0fe4cf41261cfbd22ad5c34c36d7a5106903
> meta-clang: 989ff6a4e7db59f01d511727135610006124ead2
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: bab936cb4ae5671ceaccf50305a6c0515e6f0222
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: c74ebbddfd9dbe02d3f7422016324451eb218e1e
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: c4fb7d1f0f157ffafd9f907f49ea74b93b2c1d40
> poky: 63d05fc061006bf1a88630d6d91cdc76ea33fbf2
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
> View/Reply Online (#412): https://lists.yoctoproject.org/g/qa-build-
> notification/message/412
> Mute This Topic: https://lists.yoctoproject.org/mt/105589020/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


