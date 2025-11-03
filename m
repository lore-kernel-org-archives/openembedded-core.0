Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7BCCCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 06:36:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14952.1762151791876840115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 22:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YQpLa5y4;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762151792; x=1793687792;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Z/KuUBiTlhC030sstRgW9cAVo3Q5YIuKch0AHUkvV+k=;
  b=YQpLa5y4Qo8RKwr8XkeOmyBr9vi940gftue8L+7UbKnKdnC9U3wabF1y
   TzYWnh2ZNoZVUO/SpvHKwvPWA+RHU1Fd3GW44NSdvPhcrNffRx13zyNsK
   Dt2EyGcGYXHYZNmxpeOc9unetj1RC5CptqqYJDetupcAVn7t83F/oz4Vt
   8YompWwKtYcaLvtmH8FH6iCwJMshOJ8XxvseaTnzojVOMQ4ubK48wNaPu
   Rb/dDqig/C4MQ9T1hj7jFBnINoHFu95bKlOswZbjVSuXRDr64UXfzhEUn
   B6QY8TlMyLcRpvenfoBPXlIMFxW+6u7ig4Tl3VaeaGZEZqi6Oj3YLgI3G
   g==;
X-CSE-ConnectionGUID: 93V9PBaeRaCBf8BLWbGSvw==
X-CSE-MsgGUID: iFPfJcWpRd6gm7BOEFzDNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="63238194"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="63238194"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 22:36:31 -0800
X-CSE-ConnectionGUID: AIIgZut9QnKDzcAeTAIeew==
X-CSE-MsgGUID: uPj6qXd1QQasEc8vT3VRQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="191125103"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 22:36:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 22:36:30 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 22:36:30 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 22:36:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAqozqhycgo7DX0hK47h/ZjaEaBgCbASlAfVi+ABe4EyEtg9EosxYLXIpSPW8WdvzC5O0U3nld2FQVFMHSfJDd5jwxqX7t6he1QcXCPRnWeOcB05Nh7m1KdOE4FOMU77iAnXtLYwy5beK61is2Qqu6R53qvy4U+zZFOIH8eXcjnz/jOlqvyQaZH3m7TE3M8KPglo5dUWRu2v66OchgqmFBpo3mxJtQjk4vpC/R53T7t25L1wdlAzX8VyCXK5v0lD6oJ93mbLkbuC8FKx+OyMCKv6dbu7qQ6dwmzQBai/WeqYcaDs+P6rAxVgpry6X0GjzgIyFHG6/9jHj6smXUv17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpWjGH0+C08YFF7dNfQRDrok+sPK1VcGZNknh0JJgjE=;
 b=V23aB+C9nUBAwJ/3MMhNK3I3GISdhcasngcWkC7sHRFOZcxZqsHtLTYziCbiyZtC8kewhBKAWqVGgCQPZ0zD8NK/0rizz4T0AuBxrATPMOKf3yNX+HOgdbkIpIrpIvGbkR74FRmH4fbWHXt7iCisnCuCPstHQCwkxA1C8Zu2dRlXP0kZI/fyfviUrlpbIsFG3AyEGGzfGPDkbVmRFvYcB16eFMM0DqzQn520gjRRA7v9oOPLhxMhCaDcfE1FWe7hhzF37QiD5X8JDJR/baOd8r31J3YPhbgSqOAj/RQlElxXoFiGbGc++jQdt3FdXI5kfcLgBG5Xcq1qqD6/livcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Mon, 3 Nov
 2025 06:36:28 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 06:36:28 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.31.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.31.rc1)
Thread-Index: AQHcSoc+NxWXxGWeFEapUX7gQt1hU7TggjJQ
Date: Mon, 3 Nov 2025 06:36:27 +0000
Message-ID: <SN7PR11MB701891AB458D91B3BF36B55FF4C7A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019a3b325e7c-4b25475b-ccce-4d55-8949-2fb05e38aa95-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019a3b325e7c-4b25475b-ccce-4d55-8949-2fb05e38aa95-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|BL3PR11MB6508:EE_
x-ms-office365-filtering-correlation-id: 3a21cde4-8dee-44c6-bcb3-08de1aa35158
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?hzcmKFnD4sYO9tog9ovyUBcUBwtwe/ORNFlW3dG7sufeHc3P3cIyUZ4Zt/ZP?=
 =?us-ascii?Q?K4/GCpce1bCeG0pzN3pDHUP+b8wgrP8k7gkIPOtbato+Jr28/qpsOAOJib8s?=
 =?us-ascii?Q?muqk3IX3rO0rN7ydPE3MRQgbxOlg52V6IQeRi3siW3DuCobYVjCBtICIzGuh?=
 =?us-ascii?Q?zOnsWsTssmxX/2GaZEXZ+2hL3b4NgjAWJpy+mBwGcD94AyTrcGrPVm1ZeXk/?=
 =?us-ascii?Q?OPsbS+/FzSbWBlcsmrjpSwpPNjjARBb5acb2FGRoigAhUvV2Q9E2FoHyc8ef?=
 =?us-ascii?Q?4eRWTQpqpm1Xi5y+1SYoLYl4mRzGdm0kfd6EEBp12/3rBAoov6sMbkXed3o2?=
 =?us-ascii?Q?WU/tWwRKfHKylFulCD9ms1vmKcVBBiImjv869bFBuu2O07mZOOr2EDzhbJJl?=
 =?us-ascii?Q?t8RMiTdxjlE0dsbzM4HRwq3RZ4E2BvqVoGyTdGEFTr7vVzi28vX7Kx1EulQu?=
 =?us-ascii?Q?SodJnKIgXG/6o2ImErQBGQ6uOx55zJGndna4Nymx3UEJ1Nz0TtJbDUeRN/G0?=
 =?us-ascii?Q?hdIcFbUYs5tyWFcsn3HvxE4XqNF+8Q2MvKD3dIqPbs3eLpxSYxsedUuOZPAU?=
 =?us-ascii?Q?NOi4YWpeGmtImJdKQYyq0TD/WjtVEDKYes1tRI+TNW10Y3i0QNdIuuBBGazS?=
 =?us-ascii?Q?roBUjdHfXAlovNUgf5zBhD2PJuNdv9WYyuXWMfIvAntZJAvvIhsmNkq2Whfi?=
 =?us-ascii?Q?lMUcbW4YhG7zEm9l9zq3+L/fXGGYrK6NHsNjHWfy/F54Jlc3tu24P8S7dbdK?=
 =?us-ascii?Q?9EJ5BxmWaI2+fc4P3Z7uogMQKuMuFZOO3slgI4oWpTGoSKt9hxPwKAQK9cZt?=
 =?us-ascii?Q?8OwVTohRORyImV5ejJ5v9IWvvv9m0iCK26U05jP6c/28FdRunvY3YZDWNRKQ?=
 =?us-ascii?Q?6KJNcO+NTxrqv2TV/garDk03zuHicxuIhkB+nzHpB+LZGUjeYNKhMxNyafAo?=
 =?us-ascii?Q?QOLddQAMId0c6/TN28LXtEwupEMDG1AZC/arKANMbyPsW9C7MF7W+JUxHs7T?=
 =?us-ascii?Q?JIbP+B8zJ6jSYP6a3GJrQv6laX8947NYHLdOXx1VNjo0tEA3hBoX7drafjSQ?=
 =?us-ascii?Q?TKLiZ7VZ7UeUWPIt58ddy4yzoZwWlmAaG3GItk15xjtuES+BcbHDilAXqfCw?=
 =?us-ascii?Q?r6Y98+BadVfoL2B4se93tnM3OvvNFddPEyo2Igtc68Xr8aZCjzIQiiTNkVHN?=
 =?us-ascii?Q?XfXJF1jiIEdRXAVg1/FwZxBxlbF1aDE4fr3GxH2W7oSTdaFJFZjsjH90KYS9?=
 =?us-ascii?Q?GE3ADuF/TREYiWHtOHD8NJSsd6nwXoEfCsYtzPP5u1l7gzz6pYaYlMSoSYy6?=
 =?us-ascii?Q?O3Y6gjGbcriRZfZ9HKQDDROp0C9gALlAA6lzQVgaPi7hQA6+g+Q4n6pNU7GX?=
 =?us-ascii?Q?VRpJjm2ilVKEdeBuwN+0o/kLNrWOl/PG1HEYnB111P0U7QpARSflECtL0+P5?=
 =?us-ascii?Q?mCLaH/f9N69wug15TQ1G7cqJtBLNFHZFdnUx36M2XEtT3yOh0LOAyw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eG89MoBGwTmSSkSIpt7gNB5F+3qUo3Y5r9fzdfn3Zph/apDI+z9+SkQEyPUp?=
 =?us-ascii?Q?YbXHVyUkUkS3CiJnG1q5KNoPJtBa06dwIsTWbI8XmN6VRjXYiDpM9cjHuZ4S?=
 =?us-ascii?Q?6k/u96g0uHXLsShNGF+hotCcufYy2hx79xwjRvu/u8nTqA4JpNblm3EnlQHm?=
 =?us-ascii?Q?A/TYhfWkKEQFCM7OlebZm5cq4Kx5o2RUTCkJ/KKSpSc62BuJnlcTQasMSuRv?=
 =?us-ascii?Q?1rpRb+zmOKxkvdBgQrmENBjSTh1S4tUNKTX9Pv2nYGZFll0Utl3U3PZOa4xW?=
 =?us-ascii?Q?sn59K7KAW32smgLL3JeopoFChRvsUN4wtli+W9NmVd/ZbSFFYvWs0nxkQnvw?=
 =?us-ascii?Q?AsqLWmR8dnJMM8ADj2aJnvkxeITXhe9ZGQW35wlNAog9hN1KLFI6lT2vdJoV?=
 =?us-ascii?Q?uIZZHdkeVQ6F5ih9jZfANN2AwJnqdONhUbme3F31rgkIa29rlKVKZ2ZM8oGi?=
 =?us-ascii?Q?SiuUbU3opcUZrRKP0MqZo0xlzBmtx2VYVVLsXdWRnm7SEIBp/IPtjqp9tTJF?=
 =?us-ascii?Q?IKCljLnu+pJBVCSfqfWL6T/iZ/QGS9n+9aZgOxKDxTYuFpnjD1qn2WqEFhF3?=
 =?us-ascii?Q?iw+3pASTP3Xo63GZawWI+iqnKQi7hAPaMAwv3YztyDueM87+K1ixmISxpZFg?=
 =?us-ascii?Q?Jkwha/epxRq4vH4vd9wqXs4A6bKRS1WeYFQXJxSM1XfQmYN7vczCMPTydOJm?=
 =?us-ascii?Q?WpfgiiPpsX7jnuo3w8s9aebVNF+JHLahlq7k8FVREgvz+e9LNvOvJB9I9SOX?=
 =?us-ascii?Q?RCpvUg/b/pUC32MJI3QeH3EF9t+NDwe012GITJZ2dP83mrpXETk/9WLf6650?=
 =?us-ascii?Q?yHC6OVlYPxeJB0llbOgcoF4lr2uMMFc1O3iCz494q1eAuEHWLbVtKO+3VZ5v?=
 =?us-ascii?Q?mFCPlaj4dnwdGXHOpZ6VLgDq86WKfH4olz3awTtVEJxib/x2XmU1EYKKP1mL?=
 =?us-ascii?Q?2TiywiUMTjSQh/CA0wos9AdCqTD/9GkOJscDSn3XUnj1OsY6UzudCbHx+w3g?=
 =?us-ascii?Q?1+jPANVhWOIY9VDUaQS9qsN/DzN6ikaAtA0otpPvdoUOXJK0FbQ/YsKvaO8G?=
 =?us-ascii?Q?xi5ym/2KOEjweWZMSmBbdPgUolbY83nFvU1RPM/KgeINKNkNpNfBGxxiMS1v?=
 =?us-ascii?Q?feZywC0YOqssAQuv3uRU7TmRkp7T+RtHUwHqpELBJ71MKmNeiIxKseGuFQUf?=
 =?us-ascii?Q?r7VldMaZh+3p+F7p3HHgPYxUxKgzTA43Wi8Bc+eNLLg48AJ8Ke8sR2Deuspv?=
 =?us-ascii?Q?j+aaOv4yoqRWhqlKHWCLbPaqdYesnOcvEvL5chspB2DIxZm7xWPSeIEp0+0T?=
 =?us-ascii?Q?H7rHXSy6ZV/sP3E/9hljAcpvK4+Rrxd7pbvOKkLsRlDQKamymfI8kaz9eUOV?=
 =?us-ascii?Q?M43Iih2GiOtiPVrP1rKYXvaPl9w/dbyUycXl56GGVFa0v+AfNY2bP5pVyS71?=
 =?us-ascii?Q?3K/KWrUCWc/GriHBjGns4eGAKy68PDp7fOG0qFtHaOPZ3P9k26w0mlRqswxa?=
 =?us-ascii?Q?kqITcz9WoI2p93wItVx3C9Q/3bMVTu/mJ+DDFudMtRltZr2rDQRQLQQ7Dnjh?=
 =?us-ascii?Q?1uKTEPNS7VLJO8F/xkI+vONrfMHWIzjs4IwzOX2Z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a21cde4-8dee-44c6-bcb3-08de1aa35158
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 06:36:27.9591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X8wm7b8OYWCc4nMr/RgEueBBsKerReyIap0CeTQ7/FjBUBNGyJ9tDPu8f8fu9/ncrJiSJk0qzzPP5TunIGpgAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 06:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225589

Hi all,


Intel and WR YP QA is planning for QA execution for YP build yocto- 4.0.31.=
rc1. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:
OE-Core
BSP-hw


Runtime auto test for following platforms:

1. MinnowBoard Turbot - 32bit
2. Kaby Lake
3. Tiger Lake
4. Alder Lake-S
5. Raptor Lake-P
6. Edgerouter
7. Beaglebone


ETA for completion: 11/11/2025.



Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 31 October 2025 22:26
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-4.0.31.rc1)


A build flagged for QA (yocto-4.0.31.rc1) was completed on the autobuilder =
and is available at:


    https://valkyrie.yocto.io/pub/releases/yocto-4.0.31.rc1


Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/2666

Build hash information:=20

bitbake: 8e2d1f8de055549b2101614d85454fcd1d0f94b2
meta-agl: bfd5d0fc6a155ffa4a84d6015f04ece38d709c37
meta-arm: 10c27f061b22af78e17a23cf540b69501afc7160
meta-aws: bbdc6d98250ff6f2338a55f5457329d57b851732
meta-clang: 26de1c560ef3caf3cf641cd54ed0b7cbdc219ed9
meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
meta-intel: 82eb2406e04a89d6ed0650a99ba13224e43e4f0d
meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
meta-openembedded: 96fbc156364fd78530d2bfbe1b8a77789f52997d
meta-virtualization: 16155ae737d96f0f53721ad7270c3fe19729d496
meta-yocto: 3b2df00345b46479237fe0218675a818249f891c
oecore: 99204008786f659ab03538cd2ae2fd23ed4164c5
poky: 04b39e5b7eb19498215d85c88a5fffb460fea1eb
yocto-docs: 073f3bca4c374b03398317e7f445d2440a287741



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


=20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#614): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/614
Mute This Topic: https://lists.yoctoproject.org/mt/116051746/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



