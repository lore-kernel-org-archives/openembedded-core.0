Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7035BC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 03:31:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.30305.1676604694018139524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 19:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=B+qP/5MP;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676604694; x=1708140694;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=nnBD21/7+x5Js8Zaa7XBS1omHA7xFjCe7aWoq1jclLM=;
  b=B+qP/5MPLTG6b47HnssZtXry1YUuniFdn1zPBDZpdlplLAl64o52ibmx
   7LtSm6QECS8dmHuojM4xlSb4+8tQWP+l4hkWLEWCChOEK7v30XNjqNr0a
   sWPVyIw/HWZWJUu7p0dI5p75w6QoBzQxZNxhfDTFBO2gISBpNpoha01o0
   eA6F5NB+OmCsbzSAz0H6N3mUtpU6tio8Fi6VhbJX1ezH+I+eLICyaOoG4
   iksktYwEVIetP64E59cYxkot6eUak9Je+zAU27F3B6SLHFtXU7CWzuWux
   ko2V4ulEc1NlMIQwSMd4BFEtCdFFEDZhQ2uUWh1W9NctxiOT3ggJzoywn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="359346774"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="359346774"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 19:31:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813227850"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="813227850"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2023 19:31:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 19:31:33 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 19:31:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 19:31:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBsqEawWoD9LRN5Oe6DZoJxXJqhEXm5RzhX58p+blne9IiRZsA+gbmKJeoOjov5LA1ec9A4U54yE9aodsRgrrvqAhOInvtbIkH41XmbMv9hK7Z9Vobc7QkBe1arU5KgqbZmCKu1X1ON/S5oMUsOWmDKgYFvf6ruKouH3jVUSIj4jZSV3B1FNBXxJVkp4UMH+I7n4UIlZEMLVYjRBKyppfeauy3qQjrNcvSba7TGrZtlTgSkW3adoaRvEebnpVIAFWv71Hm7XGM0ARfKpe8EnO5lpF1tL7wKrH3VbmDhm7qHlPbzT270fzupQfRD4NQjdIZsgB/44yLrM5zQjTR0YGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGf6CZ0mTY8OYno+Y/PVRj3kwZsiFELD4rbernrcGWU=;
 b=DrQqZjsmXS46xJZz3jujx2HBeiSQiN3JvHYXj2KfMaUrK12LBZ3fDTn+a9UoAT6dCr4MQBcOp1A/SRknYl/oYOTAO44OSYtwNmUxykA7mrzL4biGi9R54hF8YnwqT16y8XgHMntapM1oHZtEJkcOhxrD1YvnPGKSlhde9nvDv5co0zgaLOIA603F/5EmqEFPRxjspHR0WCmPDUjeKGJxbiUWBHGQlJbamIRnmjq+qCjUiHEy+jfIdGibUkdxUz7BCvzcE8iwyUyfF+NoLM4Y4ex4aDRmV0tbQdxS+ia7EN4x/rPKVCHpuyak/F9D8ax6v9I8OYDYA+xmVT1yq+4k1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by IA0PR11MB7750.namprd11.prod.outlook.com (2603:10b6:208:442::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 03:31:30 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::23bf:83bb:809c:b11d]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::23bf:83bb:809c:b11d%3]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 03:31:30 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.23.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.23.rc1)
Thread-Index: AQHZP643Byx4/GIMOkaK+rZQTYnpwq7SgPqA
Date: Fri, 17 Feb 2023 03:31:30 +0000
Message-ID: <BY5PR11MB4152A5C0B3DE20454527638FA1A19@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101864af0bcbf-5f7d4559-c8d1-491b-84b2-2bf6028c59b6-000000@us-west-2.amazonses.com>
In-Reply-To: <010101864af0bcbf-5f7d4559-c8d1-491b-84b2-2bf6028c59b6-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|IA0PR11MB7750:EE_
x-ms-office365-filtering-correlation-id: fbc5aa1c-f695-46f0-0503-08db109775ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1YMq2xDvcrxCJiZQgyY2OlL+sFlhsCv4iFwIbgUiIgxdzGH/X1kBO9isCgg11REAuEdYo0mrsjCqdETYy7xAM7rydGV64QEtNIL4xPH98VGMXKteTrNWzFtW7Xgz6ruVSrKczJL0GOkFxwRoGKpw+pPVlioH5rbL5K+vqPzTvw1qD+f7Ji5vFDABdfk6a6vNtj/MCDs5EXtULKrCO1/I8EHkr9UK8aopGOMNyqGRzmhNyrh1OBHBUgkdGd/2NPavbPAzzvEvJE0YYOXqQj/5srRpKyLfpg2veFEJKYxiXFA/3ZD1i1up4Gu78g7/hXJSOETYopIGIY2udqEHzFudms3by49PZB/6dKNDkw8hDdX9HXsTczdcNFZkZJfIyU8WheA6SuvgDs6AjrVYWzkNWXsMoPx6Wac1bTRh4WwDBwYe6dBVvZolCoxK7iYWZAk5DAi/9kFug/LMjono4QiNWodR+uPYvC9xAcMvZ4zTbY7Ns1nwVeZYwn7gmEKH+Mq/d1Od4pvvSAvLmYIRnMWi2ZWOm1+jdGR60eCU3b1IpA80OMUfi29rzNYudkB6El22APYnZntucQcVsJxeRAGo+yTe+fleBFHs1naOIdr7400WWa2ml1g+nR8QyrxUl013Rq+SJMFH+e9kU/K1esbjmboiKmJ3GLNi7x6eVwCIfhpf8NBZAUxgrhZ8qDomRcPiEvY+5nsc8J/m7rq7+UzhfvE3Y3oS9Wgb4uQdlgb9xDw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199018)(83380400001)(7696005)(966005)(122000001)(86362001)(33656002)(9686003)(6506007)(186003)(53546011)(26005)(71200400001)(478600001)(55016003)(66899018)(38100700002)(110136005)(8936002)(316002)(52536014)(2906002)(82960400001)(41300700001)(8676002)(15650500001)(38070700005)(5660300002)(66476007)(66946007)(66446008)(66556008)(76116006)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L3mOQH6yBRueNAkKQvuNqNqNQYF0H6BtOI6m2LM41le0gvbVTjQVJ4cG1Fqu?=
 =?us-ascii?Q?U/yD+Jl/4bjuXFCIJeDJltz38BINjRllhV6GvdCC1jQWUImEtKUnkOxPmdou?=
 =?us-ascii?Q?DVBNenr22pH9P144UOfAqzouxVCSSsaP+hvV15MtlesTAbRr4W8m+SjnkhNG?=
 =?us-ascii?Q?IuTgbBvwdMPMPIs39rFn7wX+wwrDNZ3r22FI1Vw3Q43XkjugFASihxmUhYDz?=
 =?us-ascii?Q?EXxsBvJhA6e1ULj/QmIl+7JC+syEVnlEeL5z9PwZlzQgZLoviGPKdfTNNW/g?=
 =?us-ascii?Q?ITaNZkBujgAY9VBWepRSTcuVuInHrcVqP//ifZFAT4yA9Hl76Js4iR9HfFpq?=
 =?us-ascii?Q?n/0wWwrK4t1AB1oiCgQSBhy9odZZH0SfK/dQuHIaZXnWbQSVP+POWHu/I0//?=
 =?us-ascii?Q?99GkJcWkc9HIrNM2GLqyrZdHk6ywRJ/L0WjwQgXOZgtom7JLA1sFylEHpLTO?=
 =?us-ascii?Q?3JV+xE7O7E1FKPSV/iMV9t2mFPMlB//Dx5ayNPF+P7N3+mPwx1cS5RdUH7io?=
 =?us-ascii?Q?Mf7jHG54xO/01asvHp3Bod+RWIWW5Swcm2K6Am6pNobLWl9Pq87+jieDCNB+?=
 =?us-ascii?Q?UN8NOWtQCSHtFI5aJH8+VDp4VuUXQlT+rGEo6lQEOuI8wpbk61kayZggj1ra?=
 =?us-ascii?Q?28q5q+eHJLZoPy8VlYmizbTqhJShMxzjDr+vrlE0vpdmb5gqX+QNOEHB1zeS?=
 =?us-ascii?Q?Wf5VRSJQ8PEK8C3TopRRHnvLjrZrmgFMSnfSZHbjQiWg096WKGXw6yAmIaSz?=
 =?us-ascii?Q?Fix9xbOW/3itLLxsYLPz/fPKpZI7MzCt6HIwmQvW7oK26JXfzdt+pJREcnKr?=
 =?us-ascii?Q?zhmisaoehTa+jV2WlzMOoFbBhFVkib54oTVaZd7DWWhgc9QObigHLpI2wxrz?=
 =?us-ascii?Q?7iREyNkalpBZZLN0UyKsn/MzUm3rd3Bol5xbeTovJtQSLKVFwu2Mf2tlASzF?=
 =?us-ascii?Q?gc+xJYazBHp7Q1prMa2bq0/9AkmnUNyO0YfLeC/6zqoxcl3VqZwRxCSplGmJ?=
 =?us-ascii?Q?TpnqExfhYNqf7qi5LTKkDfZ5mhvtbXxkxd4xU65i8egCGKheQ9QjmnC7QAFn?=
 =?us-ascii?Q?G3lpNkNhIi1DgNmMWiKDmbKIBOXlHFma3xsm4MPe11tA2xwobp364tJ3NA16?=
 =?us-ascii?Q?xpB3ZMkH9Ous03CFjhc898yrcpRfoGHqkdx3W+l10K73UF612DykdPaUJgWy?=
 =?us-ascii?Q?2pgcuA9qPia+lxiS9qecSv9wlG+vwmcwI1SFITPYJnPO8edzfg4Va8du7rIi?=
 =?us-ascii?Q?9QbZzT9rOAaoEYb1ZCfCZSZUkOkj6pmh7x+DIZWXPGVbWom0rqsJvdySai4Q?=
 =?us-ascii?Q?Qd5hq8I1vFX/mgzw5ir6+s/8pshFQMhMAPaInDBN5ZLydFBvcOsKeZyc5n2C?=
 =?us-ascii?Q?dIugiiDkKBa4FXyAeZmLvy46/Ko6uNJEdRcYSiCkUDSq8ndmQ+mG1kFeBWcc?=
 =?us-ascii?Q?QuSUZd+K+KFRTMlEmUQHePUTZIojnh2cGsODFXUsEnleBaokgQJypLLZWDVq?=
 =?us-ascii?Q?C0QxDRieEAfPJN3wYy4QHHWuY4KJi1K1VNawYkpF9p6oX+QYCp5vCEfgqytl?=
 =?us-ascii?Q?0er5BJ5z8xh2qfmYqC5BDjP1coTUiakAmw5i2ZvV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc5aa1c-f695-46f0-0503-08db109775ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 03:31:30.2902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ofYoBeNn3JQ+4C0HuBBvPFuf6FD78EU3WIdi9NzxxflV4kOpQheqmGOKnVTmyYIwHZ4jkAsHufhZ+4SyZDXQBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7750
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 03:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177304

Hi All,
=20
QA for yocto- 3.1.23.rc1 is completed. This is the full report for this rel=
ease: =20
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
> Sent: Monday, 13 February, 2023 9:22 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-3.1.23.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.23.rc1) was completed on the autobuilde=
r and
> is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.23.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: c16d364dbf68d2a500fecaf8d6e6d62b11475d9f
> meta-agl: ae982d798a979ee5690bee00ca90a2855bab4802
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 99e30a393f980694bf46284521b137eddd6a753a
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 6c202291925bb179d2d08b5bde80192f9b032b88
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: e707e9b7cf5c62bff4fee029965a87b22dd4ccba
> meta-virtualization: beea119eb529b4a11f266004aee8b548427aea39
> oecore: daaee6fcb0d201f041678af433d8e1cd6f924d09
> poky: aec83663aadc871354b441eef0a3a41eb3780b13
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
> View/Reply Online (#221): https://lists.yoctoproject.org/g/qa-build-
> notification/message/221
> Mute This Topic: https://lists.yoctoproject.org/mt/96935139/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


