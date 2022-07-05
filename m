Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C9FC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 04:33:45 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.80981.1656995619773712225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 21:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=hXDDCFW3;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656995619; x=1688531619;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=937X/Oi36RvkWbzIdEl6lWwWQ18tXZKpwjLT5x7yTaQ=;
  b=hXDDCFW3tMJGijbFjwzIBKAoJ6DD6oSXSshru550aTPEZ1kRsB9U5snC
   LsnILWY+oXqv65quW1D+sgpfVLew61JdOaK3e4qFHgj7FFtk+jCWRs0kg
   YtuR3APDwXu/iFawSqT1sXJkCvxPoWysG68fq6xHMh2it6ryc7/IaZyZU
   FsCOf2m0B8gJAJX2wUWs39xj6ytZ0EvYuwXpJGWjdVpjRJPhVnhDaNXzN
   q5n+s0ctXayndnMzrBixBFyY9qKp8x0bGg2qIldDDalRFYRagbY2sVHIs
   DRJCbBXBnrA2Tqe2kb3aiApk23FBkMOZNz10siGPvnpS2r2mT/QUQs5/A
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="369571372"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400";
   d="scan'208";a="369571372"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 21:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400";
   d="scan'208";a="567445710"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP; 04 Jul 2022 21:33:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Jul 2022 21:33:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 4 Jul 2022 21:33:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 4 Jul 2022 21:33:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnnO5Sm8E/OAlDunwRL+kHll6ledLZkXog+v2HM0xw6dGK70BIUt22GO60eUe8lTlvRfh3n1ZFjG7KD/Phow88FvPbJ8W4Zb9lXQitO7yKNK+PotLRa3ZGC7O3EOofCgUKwkH7PaTiRauAMLJlpncRWdcvt51VqjxvkcoXjudaKINFk3WUZBs5c2N71b3DQ9JiACimoldzUBiDgv8ewQNlhR0Jxx8k9lgTleXRn6lljgRVPJkpWSvnAaWzEiDdCMDdMguYaTWF1YK0nv8tF8Mves5wZO6fhNWADnX97zdFjnJC4DSH2GQJA04mvJK/slBzBLQbanHIWMzh4DGJoh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wzDEabDQf+SMlX57mXWgx0nitI4qm30vrw2knAy3Ps=;
 b=A1pg3n6jna38CseGlaTsB+W2Nr4FpznqO5vTBvbCXUiXcUiG04lzjWn91WVecuLJlAFmSkJNWcFrHF4MKyVWoyyvZzZekyq64cr6DHDE9D6H6ODzJm654hegRfXPkhEipfGH3cKIGOG8dDMldPGXg6FnY4gHvDLcKewceySej2Gadjt385SJP2ofBjE9Lew39qcvStDSWzq2GCMa/MEGLhT2HjbU8yYjXsHxoaoiT6QLeWd5tKft5/uuinrw/8GPCcB/3WOybwgckTUNzTKsLog9ma9fyLp9GLygjDCXM//uCTeWrNIoiTQI71jhQDKAtUmf8z4KN91/cnS1Rg8THA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by BN7PR11MB2785.namprd11.prod.outlook.com (2603:10b6:406:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 04:33:37 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed%5]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 04:33:36 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.2.rc1)
Thread-Index: AQHYi64QWbA0Q4Xgk0+ukfJFDj2FoK1vOS4A
Date: Tue, 5 Jul 2022 04:33:36 +0000
Message-ID: 
 <DM5PR1101MB2348C8E6F154B3F5B4D5042BBB819@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <01010181af49cc59-7fa1b027-722d-4360-9ca4-4894f160087e-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010181af49cc59-7fa1b027-722d-4360-9ca4-4894f160087e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83101fd9-07af-4a30-8ff6-08da5e3f8719
x-ms-traffictypediagnostic: BN7PR11MB2785:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 P04X3SDiuVU8qCLEn/CIZqQBShAOy6qdKGwy77+cNp7aWwt7w/QrUr31X9quBf7TgDiC6vmFZY9MDnzfM63BI/4VSFgfo2adubN52Q/A5ObugUDF15YDeiVRS0hAayqHgFMi/HJCqagg1Otm9D/EQg/kXFDVOEZgMVdxNE0w23Ngt9f0y3by8LlH8Ltinxd4ONt0fbnus+Xm7wL3HXCYpjPR+aR36rJ9G1nkbg+LoKhdkceU4w+GmwC70MuXOBZedz8R5mlg67m4IXOo1xitpqbKbwRRenS8gkeywkzIeZ2l44qZNNqUz7FAW7emoY7nXb/NTYSPxlrfww6vL/C6rcuaSRuRU2jmoUqtsOsCgb+Xnh0foubNmAF63VTOlaL1Yiem6DUkTtjWSO3aIfs5I0AkkQb6kxe1IeOW5Gmw0CV36KOo3t73KGQexpIJz7KuIsR4FTlNml6YXl+afgoQ9mFFer3Pupn07XF1Q8Rq0o7+49TC+EuEuxSE6QjP76x0IPU8WLkzcQ8pfYsQdjKIvnMCvE20LBObo1RJweiz2G9k/zXjBF3R8TyQoJklDEvIBwnE1PSISRW98V64PM99l1SFe8kH7bB52yAZdDGWebMIPRBWL0sNb0/m8FfzAYfL3JdUH1mQhvBPQcVlNeDVoH/bM9EMjSKzcZ5sPG87os/8AbgLAaFkswx7P6MnqQ3DDzsNEmabYhpJoaUabvKk0JCJ+WVRPlDtEv8FF/gBDz/s7uH3QgrgOVV5uAFPzklX64dVQLcyyWmui7uLFjROFJiv20AMapkflSNJpcSeZTp4lkm2ZYi7KEiKNuvIOsKXIQeAdqffG9MquvWgfXkhvkHsJ7auzLliyaumKZYaAyuEen3OidmjCcOzGfFEnsxP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(39860400002)(346002)(136003)(396003)(966005)(38070700005)(66556008)(66946007)(66446008)(41300700001)(110136005)(52536014)(71200400001)(478600001)(82960400001)(86362001)(76116006)(8676002)(122000001)(316002)(66476007)(64756008)(186003)(5660300002)(53546011)(15650500001)(6506007)(83380400001)(26005)(38100700002)(9686003)(8936002)(55016003)(33656002)(55236004)(7696005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GW/hJ3077YHRyxIYM6GvroFadTD1uocY31WLUO8mnv0T12VZ2Ycx1Idj4GIG?=
 =?us-ascii?Q?riTJ1NiJo9l0yl9wk3LMDUj6cfovsTxkwZ03zFbcdArKChFtmOIIOEnFOwBg?=
 =?us-ascii?Q?fjkOiLgSED/5Z9TmBLZD6prscpL0Nby7ivNYJhZ8NxkM3XHgnlLnJsa0XnoT?=
 =?us-ascii?Q?BEYWzVlTLpn5m/Cd9imY2ZMfZwGKG/jIvPEpb6uSQbKGegGmoKF0ZaR2d0gd?=
 =?us-ascii?Q?bGz42dJz41/+o1Q/RNtOFcR3gBCiFva1GUhvgMZNq2W2zYhimhg8l0sF8cet?=
 =?us-ascii?Q?QX/HHokSmXCTNuhr46SDlwT6TiNFUtLU558vZtNYo/jaxB2LO5qQ1wB7vP1H?=
 =?us-ascii?Q?3+CXfD6P/NitWEGTOAC/AosllwqBjytgHX63W6Qa6jt31gs1byFKtjSaX0BM?=
 =?us-ascii?Q?DMPjEzRwnd7j2Al364kwd6EuUfZusWT7b/YxqcJFFmcbyxVSEv0aFVZNNXbo?=
 =?us-ascii?Q?quqmDRAycImaoAYd3TA6OsQvWWapef8r7kpKMsXHSbRBm+i+U6D4tZuLq8Hj?=
 =?us-ascii?Q?Zq3QfOStcIUlXB6Cv30uB5vJifGNRK/eBF6KrkzU8DK6HoRCO1idwM2V7vxV?=
 =?us-ascii?Q?WApOrqWaT5fUNT6Pps6oQxiXERxSdMqDJR/Fry3f7jzW6/BXnAO4SiRR5PKY?=
 =?us-ascii?Q?UtPwJx7H/C0x1qrbwE02R/70lUisTJv3/koYcywpN0Sxl91gVampYqL8GVKv?=
 =?us-ascii?Q?7NyMzLLQLFfxQUI72L2BdH8mVtfGCE1/G2gAOh/sQW0F7WmrJ0lIsQjmOX5L?=
 =?us-ascii?Q?yj+Nyc/mN0O4bF+nNHYgUcyuTUyDXv8yLS2IpH25UqlhLQq4Il1IRFuPCue4?=
 =?us-ascii?Q?PC+Ppr3bMg5evLrrC53FF4oV8Pi2MfFvpUA2ZMHnN93nCJFx3Ry1IWn+6e9x?=
 =?us-ascii?Q?SGR/a2XvUNi5dVaHDhZnrcbDD7mLlnP2ALN9rsC9wZzCGsGytxwpkkWqmyMw?=
 =?us-ascii?Q?PGHHXLBfTooJIMiTu2xuC+shW0MJuQoQSKnXu7OiVYZcVZbKc9KliF+aBCHc?=
 =?us-ascii?Q?XhCsElxb/OtEcrIQcjpWFgu/eTQYYz1K9XTBaJDH4HcI6mFvmvcOFmdFnf0B?=
 =?us-ascii?Q?8IPCsri2qIxQkqJ77Uu8YBndJ8OYXhfwcJmHo5IBFbFcvTusL1RcoxGSkalF?=
 =?us-ascii?Q?CkaQxjkO5zoSbFBp3dTTb5bU+X0MkyLRz5Z1oYVnkBaX0s8KDEMYwuBAsfJQ?=
 =?us-ascii?Q?N7eqCFhOUQJHLZBgTjfCX9MomrB7rU9xlTYTvFMsf2eit9A2Dqc5MJj0mZAb?=
 =?us-ascii?Q?tPhWnNyHkV3nV1epezIF+EGbcI5NxjCZmbsSk5s/BNZV9I4MAW9XQFHf89qu?=
 =?us-ascii?Q?Tiwqs9Kw+FVchXjdZWaZWpE4I7u+GZp1H9Pn6N1Veng5913FAtDHow4npJ78?=
 =?us-ascii?Q?7Ljjc9QKryX0rTidZtmFEYpWWy0FyASLUCjMGGXjKfVUTpqk2u5ZBAhdoY6u?=
 =?us-ascii?Q?0Xs10FwVTogcMyVojxXbWAh543a/CZ2f3T4V7Iq0eNHSq7TWxgL1LwU4/Pqn?=
 =?us-ascii?Q?YAZ6fwfk9GEKVRHFKAgcFkX7dldfwf4gqpLM8tVV6fWqIwpj60J+/l/gKXRQ?=
 =?us-ascii?Q?5xPQty23CgPn0cOBJYYkgw9WW3UGp56OUYyKjqYC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83101fd9-07af-4a30-8ff6-08da5e3f8719
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 04:33:36.8271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 bBb2ufjc2QicBSdYZKycAwIx0DVBqqkwzxu5Or1By+5t9LbMv5gRFRKBtj44IqMTZyDtEZIMWNppmY3kUEbJcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2785
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 04:33:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167636

Hi All,

QA for yocto-4.0.2.rc1 is completed. This is the full report for this relea=
se: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.=20

Thanks,
Jay

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 29 June, 2022 7:48 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.2.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.2.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: b8fd6f5d9959d27176ea016c249cf6d35ac8ba03
> meta-agl: c4cc627f4d65da8c3b0860c791d9b9687ba8f5d6
> meta-arm: af928569b421431347c84f5941cee7aaa9f0ac74
> meta-aws: 8b8eec4bde3b1ff00783503bd77b3a5fb7d904ec
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: ef3aa3064b9bbfa19f600eafb1e7d3473f62af74
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: fcc7d7eae82be4c180f2e8fa3db90a8ab3be07b7
> meta-virtualization: 320f44c6e9af463a85b58e0d87ca70273c6b87f6
> oecore: eea52e0c3d24c79464f4afdbc3c397e1cb982231
> poky: a5ea426b1da472fc8549459fff3c1b8c6e02f4b5
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
> View/Reply Online (#159): https://lists.yoctoproject.org/g/qa-build-
> notification/message/159
> Mute This Topic: https://lists.yoctoproject.org/mt/92063018/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


