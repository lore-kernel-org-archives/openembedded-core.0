Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E931C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 03:40:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.14710.1706067619659306474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 19:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=afSTcdhK;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706067619; x=1737603619;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OPSuLSKaPPEYKFIVsIqvl385+06e2P8XEMdPIhw1qnA=;
  b=afSTcdhK4yb0ZbBTfbHUqs4gQ1fPR/MINXaXljgQokCH8EQ/Vpaws5kB
   ITuzXK56UI/Qc0VTAUd2RkrRT8/hwa3kx/x8SXJRPjJK2j1gI6dRb07YF
   E6q+I+rvKUye3uvU8tisZS/ROHYL75U7reLjfmxY0DS8Y37HFbuIQRp2W
   yL+0YrpMEdb9wdVxe9ihLkTnUmEQOuSuXrvqhiWhvjxnjOFUKrntrB78w
   ValZv3j9d3D0C4FCEN0oLtf8+0Uy7CMns3Ymz1XmUOk/QZrBhb381ZHdI
   pr9S5fp9AXYe9mVDK+LyBKx7jUquxxlaEDBebj6Gd4sM/rrxo2ywFAPFN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="398884946"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="398884946"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 19:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959369608"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="959369608"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2024 19:40:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 19:40:15 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 19:40:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 19:40:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 19:40:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQ8B3Mn7JMe+2WXdrsTMaY4/IUR/x6VzuDAZlLjI+48o0x6NLOpkIbsWGRRSC0BYN4ipREQKgJjwL8zhtGKioLBIxkA9rSJF7o/85W5Yc4/pVLR2Elh8V9kPNmk55uqpUVzyihPHKlODRcWVtI28HsHllKe/IhL42Bj+Jy3gjtinr8o6a1K+vXGWr3hvOTovv37BLVH7BWtfUqm8GgwM6IOvpMDnqs/UiTaUVJKUryqx2CsQsZGsQ+PubjXhvl2EOM/o6M2Rl9C2+evmssJCVJKI4qyBvoFimB7y4z72+WYQpFr04hKIAGNTikLLuzbvV/7uviVAFSm79V1Yu8Nhew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmXvO5BLmOrimipsT1UxKgtcDPfNkyPtUpjBe1Iuoas=;
 b=Xjxhu63jTk2/oIMFZ18oaMarijv8JFD1swPbLvHEtWTPejeHlV0yl1oDEPqntpmiU+HhPgabFmolXywdb+7tgtUEUUvo/h4odeBLv6BbCjdDwK/FNcH1fqipBX4hI5NS++kdr553/tuqwCWupfBNNWjki1bqU7SrHi8zVu2YiU5rGkCKM2hszbDFq1lRbkxCiy7U8yo6vc8DWC3tjNek+j7AnA6jMM4AzFGJfTZn2KxqRmDWzLhVYGC/k376xVIQDNmJaBPdEIIh2joWbxDFDbN+i/dZJvQfe4/YoiwG31E5MJGCimbEHFRhEoHb4vwTlSutXGoe+d8TL3V/IUb4Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ2PR11MB8514.namprd11.prod.outlook.com (2603:10b6:a03:56b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 03:40:13 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 03:40:13 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0_M2.rc1)
Thread-Index: AQHaS0C5enK7wmapPkSS+bx7AH1ofLDoV1BA
Date: Wed, 24 Jan 2024 03:40:13 +0000
Message-ID: <BY5PR11MB4152E72B41DD115D6C2E1AE4A17B2@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018d248092a6-f128af5b-9439-4c8b-ba88-4a9311ae7b42-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018d248092a6-f128af5b-9439-4c8b-ba88-4a9311ae7b42-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ2PR11MB8514:EE_
x-ms-office365-filtering-correlation-id: 8d424b1f-9e59-438f-3c78-08dc1c8e2c65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2mC70F5o99lFExekpZWcdw77ROEZjZDzTlZWIIL2Zlb4cqNJF3k897catmXyQUxeEPmlK1cKO/NID8EHqT1uI4uPZGLLUCmonKkIKcR/92dpAXoPglTs/cuk3kZEcBLKp445cJmkwe8m6HBWHsRQ/2fMMPuwr7a45NlxEUAgHRdV3E5kWpZG3pe8QZBI1OGh2aSQNGaxR0bON7RMlryDYjMnEgxA/yiLMreiZJOJgnU6i1GCjDk436l6kwe8EHs6mFFmzQCfw1PxksPsFjjpZXA61miDng7O9Uhhml9rhJyB1GaiwBovgp717fqhPRaqcepuzDipxPctnx098mWpy7mxjPnFkfzDbOulrsPkBwcl/f2Nq59jCQVLzMm88QzptHff/Nig05Bwk1mJcQ+Blp0cSYOmevpkkS5WEIkPJ0c31s06W0LMFKpShOXt2sLZCGv5QBn9yG6771C0L6GJUu+uoEKH4gXPDdsAhb0wO/MyjOUnDOfxe0Mi1iwDgz92Re4pEYpdLtNBO6aLY1SeRaoQg8tGR/tjZDoxIbi/c9cvvyEAdg/RdMycykhSURPjVteq3WeHZyUI2OOl2Ix5OWafIfxBv62Wty72HDVv+BwcbJv+e63vW/rq7Hv5iiytq0bUkcUl8dTIIydXGBPLyA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(71200400001)(966005)(478600001)(38100700002)(55016003)(82960400001)(122000001)(76116006)(26005)(83380400001)(53546011)(33656002)(9686003)(66899024)(7696005)(6506007)(15650500001)(316002)(5660300002)(64756008)(2906002)(52536014)(8936002)(86362001)(66446008)(66476007)(66946007)(8676002)(38070700009)(66556008)(110136005)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NQK6V4UJErOKdHBJdUxLdw7WJ94yEvEqjSFoLJm/FkmUdexXrFS2JGXQ9xS9?=
 =?us-ascii?Q?dFlQces5bupCYVF446qxaP1HdHpq9giB0TSjXy5gyovZdYWFQ3NOAZZ/ueNy?=
 =?us-ascii?Q?jzSGqp4hCbUyn/YSKiu7t4tL76wR/M3up2+1pADosEq+q3ij2feQt/1rxRWj?=
 =?us-ascii?Q?fz1iDkaCq1ajxR0X7c7j1PdHKFFd7+WED4li5gxIzel8E/e7uHw53EfUMxnD?=
 =?us-ascii?Q?vkhrgELvhCxQ4+yjY7dyFtUuS1DZ7xVY/xEu4nyupuO0DfhsRPD9MNjmLlM4?=
 =?us-ascii?Q?KpU5e01NUo6/DqdcaEFIpvtWH8V2owNUBfdHFG2ydGYU13ofIOiCr7NOi7bJ?=
 =?us-ascii?Q?QJFoUOyDTBelx31AMfMOjDVClFijBbtlyd4Vi1ZQg+D4K94z0HCF7DP5O2Ul?=
 =?us-ascii?Q?EpyAyG7ivaWIf0pSlwPfMO7r3Dbuj41Z8ZhSbu37mpyRPJzsDTzdquGo+Uny?=
 =?us-ascii?Q?/7bifAPWujgtu4t7j+/CO6F5BP/WqsZpt40uqWz18sjhyNNDb4r8FLzz/y3u?=
 =?us-ascii?Q?clvymg0zlkGZLWvKUx5jU9Gy7bcoPQwsNUxJ7z45vnAuYwWpV8M5TWdBdY9r?=
 =?us-ascii?Q?6fFrLNGkin/0N8B1HlCbYswvT23yQm+bqxGa4WqgBMPmguCVqQJv1EAcTu1Z?=
 =?us-ascii?Q?xgMoVbeXHCoTC8M8qsAZCqTsy/uFNkbqXpbVuUdINMcJQj5HFaH3oPy7WWD7?=
 =?us-ascii?Q?4M0T553tpzN5FyMgtK5tG8pjNbdnVxtIhRBmNvZzKiOk97+Nt4uBMvKsECEo?=
 =?us-ascii?Q?gICI6402POsxztj3yim00rXxFmdGEkbdbcRDEp8/aj8r7hWvX71e4ZQWwIsZ?=
 =?us-ascii?Q?3kTllPSRpVsDKimvK4r5BgRQEPX6VJwc7ngCbLUEj3bkhJtKFc/mbByzvOZu?=
 =?us-ascii?Q?/iVnOuJ+Q5Q4RyXRxGsw3LnItDUYFcjZGM/XCFUtkjrIS1LW5U0ov00bhNxI?=
 =?us-ascii?Q?GG84l7dJrsCAT2b4zxuMM/T3dXBUP+OxJjgOEh1IxN0szYDs0qqCv6Qaqdpl?=
 =?us-ascii?Q?xdqYDupjBrYRNsXzExfJab1XL4LSwbuVohuK1d+NFModuHpVpdveucfD7rtq?=
 =?us-ascii?Q?srJ0SrnbykBgsOqTXoDqQVNBQcGAs8RIrKxhEapnIYc7kDdC1AS0xjPG5ugO?=
 =?us-ascii?Q?Mq51e4vLqd6g67gyRa2GfN1ucCYavP6n1gL7Xa7eEGE9taOYwddWQWQTWLow?=
 =?us-ascii?Q?c4mEr5U3AKUsSrcseQvbe1ZOUNdNJLhJFYR/6wTl/V+BNKpSqogs3MoLRaGa?=
 =?us-ascii?Q?Y/Yc3sWhxpnX43AlMcY5sl2/SDVPM6Dq/zoMJGkXPHOJNVOmnu6tN/A/Gjb4?=
 =?us-ascii?Q?h6YiSj1E75c8+GshnAshdN8pWwMzyimAW1jwfh8BcXU7CDcB4MMpWYORzVb3?=
 =?us-ascii?Q?Fw812ODoDAXOhncX7UzZVO4wARuAyj5rZw/QgyLKtj3lDcS0s7htk2U2dScG?=
 =?us-ascii?Q?+24ga9s/oxgJJ3BbUPZP1pHOVeko4aFp3GLL2VjdJ0uz5i1fhnviyWbl0YJ1?=
 =?us-ascii?Q?KAJXu5ROdw/8SsoMEi7BXdfzOuRGsCI+Vq1KREe5iUy2Y7/f8arWuTCW1ifH?=
 =?us-ascii?Q?BWUECYnryZRbAiugHzrxZNhVeRccUSRapWVWhKwZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d424b1f-9e59-438f-3c78-08dc1c8e2c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 03:40:13.5208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9sfl+ncX+3phVL0afsr/8RC+SPHe87EewSByjBXVkp5lIRF0bSg93iqyrN+zENU69/1S1Q2Ud3RWv1rEq5+obw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8514
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 03:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194258

Hi All,
=20
QA for yocto-5.0_M2.rc1 is completed. This is the full report for this rele=
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
> Sent: Saturday, January 20, 2024 9:34 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0_M2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0_M2.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0_M2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6470
>=20
>     Build hash information:
>=20
>     bitbake: 5c2e840eafeba1f0f754c226b87bfb674f7bea29
> meta-agl: 6c2b8fbd7ed3e85f03b44e774de5b41099694d29
> meta-arm: c538ae49eea67a7ebcc9d77137a459a4b68edcf8
> meta-aws: 3c5f873a3d32a1017f2381509601f3e104518957
> meta-intel: 2d8d97f295df21e1654e77b7c396ca6522392f39
> meta-mingw: 9595f44230fd6e5ca88df874706d69c0160188b8
> meta-openembedded: 4dbbef7a39ad18206ca6cebf7a1e08aebe5b5a65
> meta-virtualization: fb67ee2b7ae76e315711bc6d1ff587f7f0f729c2
> oecore: 38dbede9a49195d6faeda61e30f098996e6713f5
> poky: 7af374c90c349af2c7ae9cf7d4fa14eeeb23b108
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
> View/Reply Online (#375): https://lists.yoctoproject.org/g/qa-build-
> notification/message/375
> Mute This Topic: https://lists.yoctoproject.org/mt/103843687/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


