Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C70C6FA82
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 02:34:59 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.2070.1663727697995552730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=I5XrdT/q;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663727698; x=1695263698;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=kTsSyWl7QYsgCeDVfdtIOtLX6HUk6Td0tomAgstnIzw=;
  b=I5XrdT/qAW5xyeWgGSWFE7nJTgmTbqQC0l763YK2ipLeiMl3Uxcn0vxb
   TGuqYVcOOrxI777MbBkg1f5BIpeMkRN67WnqAuawwhNTksmXUMjPbNIXn
   YDEPFfYKR6RFWmaijHeIThqWTKeP9+Uy+s2GZGrZGe2eJeJDGIvgSc1Kd
   aOQucAAui6UhYMM70iCKGKvkBkSAHisofDUnw3bxBEAyeDmNyvMl8iWqJ
   OUKXZD5wtmMh8xD1YMLNgEPKG/PMbPVAWllbrohhF66NxTN7tLy43KxgS
   8yF7EJrF4plwONM90JuiMEAMQMka9e/eVLKLjYGCNkKoeiupfFwMk3TYp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="299864901"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200";
   d="scan'208";a="299864901"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 19:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200";
   d="scan'208";a="570343194"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP; 20 Sep 2022 19:34:57 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 19:34:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 19:34:56 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 19:34:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWAAwjrpbj8etALXEhfeQmODS37NlT5dLUKMyxYkiOapUNVIMr5rJa8XuzTS1+L5FgvbhYIlS3kqLViNyhF+8DoEFxOXWzomrBZXyuFIQPJ/qjKRGxqf6gC4l3lXEXHKb+i6BXMZx7/mu93DTiV8U4FLLoAVXvcqTzjDB4oh+uwGAgWCA2EH29zeKBYIIMkAW3K3iCWJZ5GLgffb3mj/yxIaP8vCN+suig5ScLIPvLsO+Anvm+9htPf/rLCw9z622nSY3a6e5D4At46Df4mAiUANMgCHczjeYvhZebOTiAmDcf4BZS2Ib4wbtlZBohHcnCokmC4IoQuXfGN5gPN9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzgKE9xcjkPqli30R3zfc6fO4s8JIPBGXU8CKPQcQno=;
 b=JInaBVwhAuJGJvOJQF0vU/dRHHIiKdUq1ReaaBExejxS/4MuLs3A+61OgxC95YbK9LeoVZxkKT2AOtBc9J+bxhQySKqaLTXHt3WdeN4YFfFI5b3w/pPCF8dBauK1FVUEZtnpagU7encSiyUM12Sfeou3tSx6Ebul1Sey6equ4x7BwmL+CLUGIxWu9B3e3gOIIFsCa4sdflL8EtTPYoorjj1MOHelNaAvVzxayv/HejaGh9XRrj8YrbcwtC8ZSzLfThE1AGIJkvhBscnfOwxs7rn2WBQ8ZN4JabWDhh8AecBOyqK/13nbVRSODxhnGRhNjGKVdnLue+FuwKXHhIx7Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Wed, 21 Sep
 2022 02:34:54 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::de8d:918d:3dee:3ec4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::de8d:918d:3dee:3ec4%7]) with mapi id 15.20.5654.014; Wed, 21 Sep 2022
 02:34:54 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.4.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.4.rc1)
Thread-Index: AQHYzUYCV7f4Hw8SQkW6GWjWmLng/63pKJjggAAA8sA=
Date: Wed, 21 Sep 2022 02:34:54 +0000
Message-ID: 
 <BY5PR11MB4152E68AEBF48D2E8C4F0BE1A14F9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: 
 <010101835d2969ae-38f29d77-d301-465f-a510-8ba455d8ff88-000000@us-west-2.amazonses.com>
 <BY5PR11MB4152EC6FA782765868DDD21FA14F9@BY5PR11MB4152.namprd11.prod.outlook.com>
In-Reply-To: 
 <BY5PR11MB4152EC6FA782765868DDD21FA14F9@BY5PR11MB4152.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ1PR11MB6179:EE_
x-ms-office365-filtering-correlation-id: 4335946f-b061-44c6-4ef5-08da9b79de1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /6yXxKHkjprVoRoWQ0Y5E4Cdu5XK6/QgVQl4U8Rwzz/oG9qhek56fVLN214bmzmLEIEVwPHQkOPJv/hwMR+/1nOmEnUw+4I7QDB5unceMt++qcatUIqsEOV5nsRvYrwa+Tb/lAsMC2hqyw3J2AzwmLGNbR3HoZhtILWrIeBkHL3Fnna0BYcr7KIWRRvf7aM/7m7/3eRCn8O/DGhgziy539Y8/a1wyVftOvu1E8gWrBlkUjDU+ZJRG9lEL0XL1ORIht5D8/Ug7bAcJP/RVxh98FD6/YzGv8KvQtQJz9MOQtLIWBy32rB5ZI/rT3s+AdccuE7wqWrvPP2K+pvSnI3CyNi6hogrL4AgmLJ36kDCVTcTbFldXTZ1V020MICt1eA33GqhxNt/ZzfgDr5Q/LhqLa/vfee/wwhs2tTqmW+juh9B1aIJNzy+Lnqpx5CPhthLjm+SRO5puss7NYfDlOb0ItCvyUOlXcgoEc1RjUafMhO1mnIUrjIvsBQTu0yvetHZfAzIHy82t4D/s96qv0BpkPYFd6+3aEk1aRYM9WtVRERqT4dO8KXQ1Q+wNNCkr4TJ6QBxmLXH4x4nl+5tH3Ec6vjaA0b2R34YApWqWNaq8mNkN0WaMKoNoHT5EletVcwIF0Y+H6hOCWX0+vpj6rH7gkht0USvpg5w0mE3/WcSMceXwxCM5jEEvmGdCTBCezYXg1hqrFr5PEi9nr6zTFHkYHVjymdf1xKqoaTUJrFgkfXhe6zqN8TioWZWdvFkdYoSc6goVPmHPJE485Dd9gJZuWdzBHFI2I22/5QkWc39X0A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(41300700001)(5660300002)(15650500001)(8936002)(122000001)(52536014)(2906002)(71200400001)(38070700005)(53546011)(66476007)(66946007)(8676002)(76116006)(64756008)(66446008)(66556008)(2940100002)(38100700002)(82960400001)(316002)(6916009)(33656002)(7696005)(9686003)(26005)(55016003)(6506007)(186003)(966005)(86362001)(83380400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QRyRQKbxEtKg8w5Kny9y7muYQR9/DRe+tJ++lGhbrOOtLiW6Ey4+2gTlJ/uo?=
 =?us-ascii?Q?N+asSHKPa5vHlsNcivWysaSUlRf/ASWeZDUQQK82dfJa9gKx8q+BZMmcOl4x?=
 =?us-ascii?Q?W9NQ/HHKQCscIuOwMRWeHKcz3Odq5BWbBnMWLHJKp6695ctYhzzjf5NSLSlm?=
 =?us-ascii?Q?I99ZWTptYaC68MgMmPp4zvZDmS80rwxilLwuieaydlsP/qVvG5ImlC36cv1C?=
 =?us-ascii?Q?9DW1+FF66UumkFiOCOWIrYLiReMJOJj6rMQbfoOysMRyj8GD9BxpX4g7BEEr?=
 =?us-ascii?Q?0+f6rAKhrZ/NqsetDkPlMEaGFaGdmNHdjwuhr9+MB5S/uAUyt40Ax/s7MVZG?=
 =?us-ascii?Q?Jkl+crF1A2cA2r/ZHTKhYg02Me8hrTph9qKxmQbbQJFKEmGdlJm/+cxHbY7X?=
 =?us-ascii?Q?t4bNAX3TeUzbrbvadSzWy3BojpoK/KN46Fj5lmtT12OKqgovajerPse2xQqd?=
 =?us-ascii?Q?28hqljidFv4Ln+lN84PkQcx16frnt4Z0NDq+L5HZHdLooLJ0OBZZxtoMxKZt?=
 =?us-ascii?Q?ixq2xzs1+GovpejWcHguLJHdkSKoz31hrgV81aOB2NHZcoYN8WjSwdOoDJAD?=
 =?us-ascii?Q?GQm/0SPghMNMmhrPkwcaMvDzZ399PYXuQJAanvUYwATJry05r922McCmSz0d?=
 =?us-ascii?Q?wrN34itVKtUp1Skhdh4Jy1CfjaKvbhc0qBBCz48INXVK6rvKCe7uJY9p16ki?=
 =?us-ascii?Q?NMNvMBKE9qBVxLwv4VYJc0n47Qhfbj7QMa44QSdvvYbUPGt7CaUHAk4BlLoH?=
 =?us-ascii?Q?V9qx3FbnjPOTRm5d3zDtM/zWL4o7lPF8cAwBhSlCOjerczfy+9U32tOIbfLH?=
 =?us-ascii?Q?QXZlkPLC3BlnYyZsOwQ3QNPU/09qtrxRfrlT5vjIr4dQP1ABOsHmmyp1WItF?=
 =?us-ascii?Q?LsI/mDVhFH8Jk9LDm57ybJ9I73JbAWYeDgQHhleqLWIfXcLRphxzRozHqkwI?=
 =?us-ascii?Q?S3O8u7KL2EO6ZossH42W6/E0/JVex3wRQBdNvjuX9D1YwkXRRMehM3GCPxOl?=
 =?us-ascii?Q?1BbnwazF/dtzwo+RLjMaMHPgQhoo8mkPWVTXclt6w4VYWRShxsj1d9PX2Sro?=
 =?us-ascii?Q?Ugs8o/cgQf50YNarBbyiTJB3/rzahFcfTLaKmLpVP5mSvJuTwWUkMfGmgmCL?=
 =?us-ascii?Q?C4uSsS/scTDJcxjJL+7CDRJDqg8bG6X5ZBgZcPD4TsrYbotkmN3haxTPKKle?=
 =?us-ascii?Q?NGo0ndaXhnEfPxsfGC+EPhSF5pMLZLe30Ril6sCFHyHesGW7qqGdbI3xfYfu?=
 =?us-ascii?Q?EdEGYVwgwhVnP66H98XVIGL9+YJsLA/oBkKYnBZjdNdCTeSjcTDpWLSjIPSH?=
 =?us-ascii?Q?GR2Pd0DdmWgduJTG0O6wd1gJL6nxt0i16Uuww/xHhOQ1JpzJGML1UyiEpFPK?=
 =?us-ascii?Q?hrn/fxJj3+vWTM6bdlGVJWSrb3AKkDO+DZ+el/2ywHk0icpsTHNyvS2jLc7u?=
 =?us-ascii?Q?ieEmE9+1HqE01X2lrz0NhxDqwNOnmfmHxCIGwQG7kPNJG/zTczpNjeyMg+XX?=
 =?us-ascii?Q?SsadiwGqI9QGZGYQCmtlv9Ks9Bie3AurbDZVhqIsQ/tidQNVbxNuSRdxYnbW?=
 =?us-ascii?Q?ng61hW57MMQesIABk8IRXZKDADwg36ma75lyXvei?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4335946f-b061-44c6-4ef5-08da9b79de1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 02:34:54.5844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 vIDIZpao2IvYh5AuMRV3GuQ+cKScm7i+aHaC8NvmPvZCcMfcLlKNJUT24T4pTiMLYZOXyRtqV8pztJ5FN8GPHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 02:34:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170919

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.4.rc=
1. We are planning to execute following tests for this cycle:
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
ETA for completion next Monday, September 26.
=20
Best regards,
Jing Hui



-----Original Message-----
From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Behalf=
 Of Pokybuild User
Sent: Wednesday, 21 September, 2022 7:09 AM
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [yocto] QA notification for completed autobuilder build (yocto-4.0=
.4.rc1)


A build flagged for QA (yocto-4.0.4.rc1) was completed on the autobuilder a=
nd is available at:


    https://autobuilder.yocto.io/pub/releases/yocto-4.0.4.rc1


Build hash information:=20

bitbake: ac576d6fad6bba0cfea931883f25264ea83747ca
meta-agl: 2e8dbab520652afa5e39e74793bdc917aa9ee86b
meta-arm: 0a5eba13d81f5c5722a13b816193ebf93c0fd198
meta-aws: 3b4ce1c62e3d6fb7d4695e9b0c04bf7f922f051e
meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
meta-intel: 01ad1a73aaab49d377d14bad8a7dec48f86cba83
meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
meta-openembedded: 8f96c05f6d82fde052f2cb1652c13922814accb0
meta-virtualization: 8c5f038cb92fa4b02246d2d1479a003eecf5fe93
oecore: f7766da462905ec67bf549d46b8017be36cd5b2a
poky: d64bef1c7d713b92a51228e5ade945835e5a94a4



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


=20

