Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758AAC433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 01:46:04 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.6009.1664847963625373904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 18:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=CJImOZRS;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664847963; x=1696383963;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=n/bmt+8UBPhZPbSf+LjtiW0STzB1LuFkCpLyeRVH52Y=;
  b=CJImOZRS7fNulqKLHBBoJ3WbyAgI8sKMAIfVxXMwJo48t488irGmiH0E
   8fo4P9ODvp4Ho/05BJLj1H0wfBtjRYp22iM0nu/vua19nlZiKI0vd0kYr
   GruezRXfBm+iOd87OauTgrn575D4wJZbfhCtGltvaHyfjTjfNBlEcqNdT
   DPWen5wuU1UNkqi7wK5KfDFGuSBLMjjgOjn/WK/bUzp4nUx0WSFtRm6JE
   r6MMqhYkbbjq+lFB82TJnctkUGqqpgVGOII1PHmbXOdA4+3tjg3VTa8ow
   HhWQo0pJTTIy4jQ3LhTMqW92rUXA8Zxd/F74yEJnMzWzMRsST6uA7DOhA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="290025026"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200";
   d="scan'208";a="290025026"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 18:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="952597274"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200";
   d="scan'208";a="952597274"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP; 03 Oct 2022 18:46:02 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 3 Oct 2022 18:46:02 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 3 Oct 2022 18:46:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 3 Oct 2022 18:46:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 3 Oct 2022 18:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4u3tsE3OMFN+HOkXtYuvv0ImEFw1fBDD0GPM3JXocd7CFRZVi3dcBy5LRNeca4VOfgl3DrkHBRe5wG9B6RWO+n3ezPvQgSOQW2NsC1ZX5OwzRbMhVJ2+WdLMjMt1JHkrVn4p+u4Fhj2EMh4Xz3EDNoRVksP3ijPgH0xmZokjHMEBXdSpRXdNwypsoUSPWUHhdVw7TM2wFmMyM/Ea7WVB6gfvXWmtvXSn/TWO3UHsPZ5DMCy92qIb0+TGDNfiDJklNeddLSyNz6VgGip/3GUOSXu/a0Lz6X0g5KoAC06J5QzGEHeqxnxIBkroTZccS2hwyHiLkt0rJ87t7BRHGoqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9htiFrHd0xtHXrIhIAE+W1F48GnHqBu3eMdGZipXmo=;
 b=gbo+PsQ81EOq4+QStZk5GhlNzAV5e7dJFT5c3wTIMCW0hNBlTlGQPCFAJ/VC23XK6WxpKA8hsY6RTRfCFnuiZkj7xgyCmbfjKVKM/q50/t6f05y48YnRLNCMm2RXiJzVGNsZLoIaNya1ftJlM2htI5zNMHrRoWLt3Kj8NbdD8uJuao3FZydlnn1EtAlcYXve7vZsRC7ADd5SDx0VBbMPsiI4Js97EgcgR8cx+NqpoMsawrYrr+1UCx36U3BHCAerpdlANvdzrx0zMyZJcZsoOrjHaISpI7q4ZPqK2UQwee0hHvDjHZhbMLgoNeEpgtyU99vTgX03MlwbFTgHwyuvvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 01:46:00 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::de8d:918d:3dee:3ec4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::de8d:918d:3dee:3ec4%7]) with mapi id 15.20.5676.030; Tue, 4 Oct 2022
 01:45:59 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.1.rc2)
Thread-Index: AQHY1R8I8rl0olo1tkKZJCRsLWnEYq39d+Jw
Date: Tue, 4 Oct 2022 01:45:59 +0000
Message-ID: 
 <BY5PR11MB41525EB8E804FF21F2158607A15A9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: 
 <010101839097e13f-cbfc4c03-790c-4d17-8b84-dab254b2e413-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101839097e13f-cbfc4c03-790c-4d17-8b84-dab254b2e413-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|BL1PR11MB5271:EE_
x-ms-office365-filtering-correlation-id: 4db70a58-9087-4df1-ba67-08daa5aa3044
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CFvqPbDFWvVauJG4DXJvbEEaNJKBRFZlkEmQ2IfYIfk7CHYAQvLFu+kTxQXxTdFD9MK64Kz72CAX99dBVCNtiUKBZEMk1I4dxi6O3mztr5A2uasv/4Kc3oEQOZxWAzmnErFi9BzIl0wAlIQdUmJN0MmYHu/PPjk15DHLj4/OLaoNfiVnvDZuxD1qNlaNNBOj9XZZWkj+VX7nGZeuINflgfSiIvochMv5X8hUhLp9z5WgN+Ry1qpLDNpO6BZqzvLFIFAWaatyIXLGpyJhJkQZpDn6jIK6axMmZmBL9YDbzru7MS/QJDBbCW3NfZUjIhaFDZsANWNyDeOdCRlLUrk2esKFK7cksrNrlKTidiAndkKSf0R+mpCvqMoI5cFf6Jj5voPsmebmrLo3WhrC/aefiVemKrcHjQC+JgVJiJkGvelTFjpU/CMDGvQnUT2lDNbAePNtwEqKqMtUcIhCw4sd5folQhzdTNBXG1retPEFj09IWm4sLJHZfGvFb0MGOyRvVKwAAkUaRrNZOkvYb49HqZWjcy6/8wvsDkvIjr5MVxRJU4VTPzDrdwMQJwYZ8mUV+kOFvIpqgbIXkBr65mQ1//TnkWytsr2yhxk134EuxcJaC+Y3sP7zzZr75Bq6zIUpieVehg1dw0KxAOvYfFuHHrWXla2ju44JulLAKcKwzc87c/S6JTG4RnaV8i78eFQHsf1ok3dNkJ2pvXpoqTm1tYlMeLxR1gNGpXOTeJEX7Z/JCl7hXc/M4++bHU+SenZmYWZ/kuKWYpGOSwY22FrS3vTs1ajzEjxymFYBNq9tvsEF5sM+bMETgibqoDga/AiuRRQD4GLDML4vjlvDFsem8w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199015)(38100700002)(66899015)(82960400001)(122000001)(9686003)(86362001)(26005)(5660300002)(8676002)(53546011)(6506007)(8936002)(38070700005)(41300700001)(52536014)(55016003)(2906002)(15650500001)(33656002)(478600001)(966005)(7696005)(316002)(71200400001)(83380400001)(186003)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AJ4ixDJ4q9XVKOWdqRVoBjU32E7gMLxhS1t2JcBpnb4MG5wFp5o4N8uDO/Ul?=
 =?us-ascii?Q?2lz0pJOp+rx7Ys+3vL41eokKjcsFsvvpTlVhyFN/u0o+DBnKcN1vAkwjhfwo?=
 =?us-ascii?Q?ohy6Zef0m1sWaQuxaCnBD4/CtFMDsPhOT0j59m7NQGm7ZB6jHDvgrHnRqqSZ?=
 =?us-ascii?Q?zJrJreH+wjjH2A6/rZDjOw9L/Zk8GnYFKljX2vik6h7p00R41hAvKgD30t7w?=
 =?us-ascii?Q?kI8okXr/J2n0bNELVZXJRIMHhzkbzWFOpPX7ovVog8tzPSQgHZOhQLrouU59?=
 =?us-ascii?Q?59i2DaS9tgstHQlRD0bPrjoAMtBfK8zB58wu6FvRK9r0BlbJEdcqpOaPTY41?=
 =?us-ascii?Q?GYW9weBZUXzDWxIgE1gQ/mdZaM0amARTqz7AjWXkucR2gep7xjx1DEx0e2+U?=
 =?us-ascii?Q?+Uxp1Dw7lhdJFyDGAlyS63KKNlGEPmnNRzXKSnGd57mdILtiIuXXZW/L2ib0?=
 =?us-ascii?Q?yMosfBpi6k5TPb9GeD9lAr896EiCqlvpuge1NtwtfoFFUZa807IKHacgjoQO?=
 =?us-ascii?Q?NcFeJzHsafG2nDB+x0oLU+jAm3AR48YaFWn/8y/mr4AVHhPZKlxPZ228ZYei?=
 =?us-ascii?Q?iWNe3bbTZzCl6IS1e+DqshASI+MPFIVU1YQuQKkwqJH7Te9hFHvtIOlzDr3V?=
 =?us-ascii?Q?1VkCg1Jtn3BpfwM6PUakIfC67litEbPettjX2J4ZD0yeNonQlfmdDWu3hPz/?=
 =?us-ascii?Q?xtVkfJwVGQc6vp0e/iZO+zvigA58V/VjWZsm4ctKOYnyoDK8RPcg8TzKqTtY?=
 =?us-ascii?Q?grtdXq0T9zsphmdeTABEymMB9e9A9Dd40eKLgS5z7eKnfKnZgXrbCVqcPxB7?=
 =?us-ascii?Q?chI4g0xFECHXN9TZZDbNm6GOoTGFqNkk5mWsznxpT2fOELdQAI7+VOBgHE1A?=
 =?us-ascii?Q?IDc6onMYuXyGANTmqdSHclmT3JNpfsLR1x3t3rNcxsRTiaoAlaK/0Cri0vCI?=
 =?us-ascii?Q?VtmKFeMT6uV2RH1Ssb66hQSOOEBNszkc9zhlw4iToRbrxAXXrjXyclK4vAf3?=
 =?us-ascii?Q?ph7vz/QgO2//HQ5X/JdBxjcLq2cEmnA7tCaeyfdbC4/PgI7dC19EzSp+8hF1?=
 =?us-ascii?Q?S+y0y9ORaqdieyq8O4xxPwZhdTZgS3WNyOEnwnVN5vuuuz/rvkIEPFDOmjgD?=
 =?us-ascii?Q?G1DoD7R2+8dm9msti2srfbftgi3f14/AcpbRd5C7qCrbOno8YeWVQH8VcgeF?=
 =?us-ascii?Q?qbNunmIHlXZastdlmRCrEcqKcKXSXC7Lp69JI1I4lmfoD/PxsEQiplCu09M9?=
 =?us-ascii?Q?sP7yEMjhdntrQ0UwjQ9WRfDOYQ/eqzGqpLtVsOlxA/PzxzG1wJbopWZvwSxB?=
 =?us-ascii?Q?WtxVkRDx2YOyO11Tp6w06cEp/Mtk7yMIIVTDWFa8Z5l0wjlm0GyNurWRV4j2?=
 =?us-ascii?Q?DGqalfZ5UV87U1QG0Xo4UvqQwGOtqRRj8cJI47qCl3653dAg1p4Bk80kiJHo?=
 =?us-ascii?Q?JVwYSl2vFH6q0ThB9jk07pMG1Wi69HkKI/wi0vKnzEOWB7/r95dy5GDb1ZpH?=
 =?us-ascii?Q?4i3XBmdu7gp/rYhOWAOjJIYbLuZeTi3fMg7JZw9Ah+bgoFg2wbjdLw3BFm7Y?=
 =?us-ascii?Q?P3FEiPSn6x2BQNAx0ketzHLoWLEiPoFOpClELSsa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4db70a58-9087-4df1-ba67-08daa5aa3044
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 01:45:59.8555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 vdJLCXlUYBOGX0sy8xt81DkwZXDrZQ8d/E33UfOHE9hDfDDyp6FUGo7rYGP8BjcwE03WF4pXDbH12+WOmPNWLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5271
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 01:46:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171369

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.1.rc2.=
 We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone
=20
ETA for completion next Tuesday, October 11.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, 1 October, 2022 6:50 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-4.1.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.1.rc2) was completed on the autobuilder a=
nd is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 074da4c469d1f4177a1c5be72b9f3ccdfd379d67
> meta-agl: e7e9216ccead73fdf6054301e68396ab04710c6f
> meta-arm: aa89fe3f08cb8406f9f1082c683bd71cd04628fb
> meta-aws: 729928fb7ce4a74546b68dd31390a3f6057ab92c
> meta-intel: 940218bd438776026398617033e09f288dae0137
> meta-mingw: b0067202db8573df3d23d199f82987cebe1bee2c
> meta-openembedded: 0782ea454af5b88cd686ac572c397d92e5912de4
> meta-virtualization: 3fe3e0971d7d14cbd06f54cad942fa2ed86c5048
> oecore: 744a2277844ec9a384a9ca7dae2a634d5a0d3590
> poky: 5200799866b92259e855051112520006e1aaaac0
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
> View/Reply Online (#183): https://lists.yoctoproject.org/g/qa-build-
> notification/message/183
> Mute This Topic: https://lists.yoctoproject.org/mt/94028231/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


