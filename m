Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7417CCF9C72
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 02:55:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by mx.groups.io with SMTP id smtpd.web10.5208.1727146514200810337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 19:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=anu7cZY8;
 spf=pass (domain: intel.com, ip: 192.198.163.14, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727146514; x=1758682514;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=n6GAB0u+PmEEIzbtRGRBB5UcIL81o5bBGd+CKM+thfU=;
  b=anu7cZY8DZ+zl/1ZgCujjOCWM+OTRydSGo7sUIAyhKOQ+dj1MTdlw5/E
   113xzMHp9BENa1Roc3rPk5o7oOUPRX4P4dQP0E/9wu0soXd1jF/6EdaZt
   I/tPNvm0rrT3o59/JORVM7f2KmweH/feb8/Atf+WD9nUGObBu3cBv25Ck
   R34pE9h0noyyqRHtOd0b5NAtXimC6/HKNucRefeiSIN4yiWqkbvqtleN/
   7utWypvCyUitvSZmsCpr/FFLt5xhxyXd8S3g7EPgSpNbIPJyLrmrAXg7k
   Wlg2d01kJh0bQeNrrJ6SYf78cokE1Z1Ok8hJgr1vLZh89lVhbAwk2nkcr
   w==;
X-CSE-ConnectionGUID: KY67uht6TkmdLxfRcg/85A==
X-CSE-MsgGUID: 8gbt6sc3Rd6fRUc658DCKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26312902"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="26312902"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 19:55:13 -0700
X-CSE-ConnectionGUID: sTwS4CbETHa0QbWpYdEy3g==
X-CSE-MsgGUID: hqGU5iWcSgWTnxMPUVlv6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="108706085"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Sep 2024 19:55:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 19:55:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 19:55:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 19:55:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 19:55:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOT88zgt2p7jPBbsTPIMGg/Wbeeg+sIMHhVWO4VfFNzVa+wNVOWTZxmMTYIvDw+P3hqj0lTJm1LkTkjnyfw9RcpxB89BkI3fWwr8fEZihjX7O7V+Ic58okvxLjpURCuNMkyMCSViX5WUFwO+m52nwgrjJjmvJ7bcp6o31LlPmzP/wsguTSWczzAmD/+p31lL2QD2nCk7Ln5mjQxAoHpBFUNgaG0TMX1F4FHis4IwnjIIBMjVjuvvslxn8qGdVq5xrJXB/pAGa5MH5ku5lDVhZXyB/Gq6GKtwVY+BYVjmBbZFOFlXrid2gq2aYm7XLyKpDOnr7I95ODk3s6frW4Eiig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYBFTFGdSOXAwJjjk+3SejebyrrYsMEcHix4DEHSL2w=;
 b=zN45Enr6dKz6MijFu/8aJfDSDEQwcIaGx1K9yFePMpLT/eyLQ+4SqQGvpLiWIUB7SCLa4gQoJgYZqOX34OSrS81VanfMJfhPvSiXPpLoRmwrbK3WNSLObqDe0fxyUeYv9YLApU+8oZ7X3Fpsmq+vo8onQnzVWjBAdg8KSntFqO9lTIoTdhICfQ44Za+7cWmIgyqsPoCEYm/MO0qIsak9+UzwpAYLhX1apyBbPwEuzMVjqhZ4+KuPE1Q4qpuwMX0BBhX8raN47YHIzAKnc3LQeNtTCbdGrLL4nhuBhQia98f4yJiwZ4IA0Vi/czVqUtZhxY8kLB+i+uSbVXQBGdLRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CH3PR11MB8155.namprd11.prod.outlook.com (2603:10b6:610:164::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 02:55:09 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 02:55:09 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1.rc1)
Thread-Index: AQHbCYq0L9/cueBBWkSj6zXGG0eru7JmRvsQ
Date: Tue, 24 Sep 2024 02:55:09 +0000
Message-ID: <DM4PR11MB77600F00575B0E88E22704A7A1682@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019203947c20-b2528d50-bc02-4975-b808-0f39e1b8d01e-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019203947c20-b2528d50-bc02-4975-b808-0f39e1b8d01e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CH3PR11MB8155:EE_
x-ms-office365-filtering-correlation-id: 4ead42bc-ec97-4d21-92f7-08dcdc444db1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?XqKceSuofC3r0zYM0Q0nQ/euc/ij7gq5rPXENux+lYmQrugWXHlxXuEGQsjq?=
 =?us-ascii?Q?wGLwF4vmKfg8vIWYCNyiHz3QYGVl1tBtdGpiF79R0gmJhzfwjMkfy1z1UNiK?=
 =?us-ascii?Q?TMAcfkgY/Wm06d2UOPwLsMYmBGX0KKyKd31//U9ZO5x6ANodgWxjfQr7ri4X?=
 =?us-ascii?Q?Pf/7ewYUDevoFdJD21pNNcqYF8Ic3v7icd9BAN96nG5dmlqugTbOeI0VM5yD?=
 =?us-ascii?Q?N6dCYwMww4nR84zLVquQCUoYnkP94OFqPzZoRoLpgGnUcUo0NP9zYepsbfrU?=
 =?us-ascii?Q?+IVe2wFCKOCMazt/HqacDRn0GkXx4jbaO4tZxQETaLu9EMOGu/u3LZikX+Vz?=
 =?us-ascii?Q?weCk0O4EW4jbwANPb0WCfGN1yK1BFIbLFmhi1Csducp8ZNaQNrdznHeLolR1?=
 =?us-ascii?Q?xkM544O5XHukxz3hOq0S2rBkAUr9ciQ9leofjzJ9tzuFyugkYXa7esh2qd4Y?=
 =?us-ascii?Q?Tf1qATlSBiZmSEXHiAdM41kVcqgZJi40dROpF2kFjHZ3MQ7oUVolAX3Nzqla?=
 =?us-ascii?Q?F7jyKLpdgJ/PyS5nWaGEVHhbME+p3YzmUpt7qfuYWtBpOQm28qQ4Fwyp4gxX?=
 =?us-ascii?Q?mBUqlxxNFz+/InzrMBSwmnoibqqS0SixxBg9Z/2AuNJ2KXubhGmCR8z5GkKI?=
 =?us-ascii?Q?w2OF7zmQqqiP/KnWrRR2rz0okRBloQOrM+yQSJQYB9LiP0efA57KfnO8EEDo?=
 =?us-ascii?Q?JVGG1lrvJB6JqCIE221Fn74x9QSJdcnRKu+S30PI6UOTgu8JqhSsFsL9PhHj?=
 =?us-ascii?Q?YL3Tgt7pmWsSxhEa3i2fiMFlqNJsLOYA4ticVOR5FlSCkCAcL64Fu6kzhS1c?=
 =?us-ascii?Q?iaQ3Mp9cK3x7ahxsNc8Ke8iE29Lz0f58n38L+eIqFhR1x/0jXWojPIL/bCyR?=
 =?us-ascii?Q?79k94RUlYLjVKOuMeqH9KitJlqw7METONJ3qNNxtNGnDgXwOZyt1vD5fl1jh?=
 =?us-ascii?Q?VvvTzi7jJUb/2bwHvXH3Ix3C42ssu6nTlRNpNOJDv3sPAV/1MA+lW+C7rKC+?=
 =?us-ascii?Q?0VTLECfx7sxapOHtpj+QcosFX4pYiMICQ18zqdhMOoEDuSVKHI8ij0tpqvCT?=
 =?us-ascii?Q?i4a2CUMd+cvucphcFcGToFib8u8iVFKLerP2Fvgxp7PQEyBKWNRCnboadL9e?=
 =?us-ascii?Q?xdpQDZVd8FUwGkQcOOdB2eltmRgC5E4hH/Qz2O6kZiD4aRZcnfKScsjn84+t?=
 =?us-ascii?Q?Tj2SuxTMeFD0Kya0/6jNBBUNCUM2ck901DYc6rjXU8usK/MTjf6rIRoAcJs+?=
 =?us-ascii?Q?uTrmHmpGiqex9CIgT4PLS3ezyFc4fGK8I/nOI4iyqFVwJO+dd/H2laEmrIgM?=
 =?us-ascii?Q?FeM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6IorIsuM7S838wSzUp1NmLTMGGaCGw+0OR31ay4IdoRcGJ/qKdY/mjp6Y0hX?=
 =?us-ascii?Q?SWMmiV6bSvblL4Y1FReuM3Em3Pwe6x4oYO6DxBRnrTQD93KHv+GQFZPakCVV?=
 =?us-ascii?Q?su4JL2XEpS1hYM/KyIWsSoc237WsWcrmeDXTOyiYOQIlj74m1Yx4TdXqNhGT?=
 =?us-ascii?Q?avcBBs/JakA6inUhMphRDXZ/kcItJ0jeNHo6l3XsmRHyLvIMf8LIIrtQNFs/?=
 =?us-ascii?Q?urac/Ack9IhpiArXMAiEfwmTS8c2LZlEXyAUwrnYHHhMLTuT/vaiEOSjlrNC?=
 =?us-ascii?Q?aevcxERKTGqae+F3JJbBN670g7AHvHp2HsDVTH58QEKDnNA5+epo0PIKA17E?=
 =?us-ascii?Q?IbApwTvhAYZ4iMEeE/JogtxG1YpboHxnuVVi/9lJLN9uU4EV9MvSB0UnqtGH?=
 =?us-ascii?Q?A3Xrn/7uMbARsYFTs/CrdBkd7ckz3X/AZFRsY8cYJHFSHRg/HOXjjUjEsIKM?=
 =?us-ascii?Q?7p2i5YPs8faemBQqiXN1qWzP/EUGVSxhjosum27WWMzP80CbtnQVOpkibI8B?=
 =?us-ascii?Q?stsrnVQ+BcNJps/LUAySCbYl/p8hrexOK6rx4bFUVRk4B1pyJrXNdJT//lXp?=
 =?us-ascii?Q?1bbWG3BagPst6kdjLtXGgAIEk90hi/MnrBaxtS2NHis87bBCysNo61jQfHij?=
 =?us-ascii?Q?d8RZJC6R4PkajqmZ5/baj/+9Rg3UmT7unOI0mxeFQbN69gwBx6rSaC1FyhEJ?=
 =?us-ascii?Q?9rkYRQ+PDg3nbqHtZg0SkoZ3MHAkoslAF9XZNjXOy1xKU6+SHoVXSTI2CJrB?=
 =?us-ascii?Q?wQxVnhoa/NgQHJTs9Bz+8o5FpZSMb9wUbVMS2DI4AMytWWiae12S/hynCuLb?=
 =?us-ascii?Q?9psm4ElSzl38mXh9tZ0aydinNHd4s36VlsElkkbL6dlpSgNseZUsIxOhCxLR?=
 =?us-ascii?Q?rsu1wR2efiNtVV1aCFgbyVsbtB599hc0PBav/X54meRzB/j+cgpCF2ydiYjQ?=
 =?us-ascii?Q?KIwhRG7IeEfAcsL5ayFg1iL3pqCQEU4Hx39P0Hpa715EvKgcaOvFzcnE7t81?=
 =?us-ascii?Q?fFItmUBrWDyI291tHNFLLdb47RK4tQA+gG77TWoH8vZ52Xh+OBPooz5wJqZ0?=
 =?us-ascii?Q?b1hW4vomGMfnk9t4rofzS+TIH2E3RnM0HE4IBswXM6IuhCSI/ruyb/Wj2Amy?=
 =?us-ascii?Q?VsZOdH98X/ei0YfqosATprs9dhPWURHSyPDPvwCDtbXSkqSxqM4As/sg8goe?=
 =?us-ascii?Q?rpARqVthFUbpLjgG0NQfo7orNtMLNMLeOWjStN6W5sUpHVVLK9biDzWSccAV?=
 =?us-ascii?Q?5OVG0j7ndKDb8GXZcoWiiyCFyI2tiKIGBw/NslTvD7vut5oRAwK3h+2YVQZh?=
 =?us-ascii?Q?fKso2BM8iXYrR8S3Oc0O59LaN8chna0AGnOnyRIfELFZrCxEUpjJQd5UoA3b?=
 =?us-ascii?Q?qNNBg45tkTEtcP971s6tFxMHauDTuSaPsuO9srgH/2lc1mL7cyRaBLxsiFRk?=
 =?us-ascii?Q?qXm30u7U1LWWOKxcLyhYxk61zW1hZQHp4im7Law7YklGgAUKbqG/ghgOcBuW?=
 =?us-ascii?Q?C/KzrFM+oQazXcFPvcNT/BH0nyZgPNv5dJhwkk4iQGb13I/uLBUhlEsnqcIc?=
 =?us-ascii?Q?FnuJV/iZMHcJJZshV0ZARkjA3I3Q0JzwOIrEdEmJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ead42bc-ec97-4d21-92f7-08dcdc444db1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2024 02:55:09.8849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfWr9yuTjqzAHt/kQH2Ln2M8LjJaHmmVzxOIIjNeBU3xSPjbfG6sjWoccLmXTm/hPZxy8iRr8/2hiZpbVBq1Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8155
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 02:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204830

Hi All,
=20
QA for yocto-5.1.rc1 is completed. This is the full report for this release=
: =20
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
> Sent: Wednesday, September 18, 2024 1:22 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.1.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.1.rc1) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.1.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7338
>=20
>     Build hash information:
>=20
>     bitbake: d3c84198771b7f79aa84dc73061d8ca071fe18f3
> meta-agl: 5f5296f39181ab01c6bd616d6459edaa0d3283f3
> meta-arm: 60361945cf7943175274bc4f4cdf842c922dffce
> meta-aws: d85b2bf3078444654873abae6e93324cfdc4c669
> meta-clang: 814d20901a71fd4d98a5a67789d69ef7e9a2169c
> meta-intel: 4b40ffcc8daba6bbe50c9405330b6280d1e4a64f
> meta-mingw: 4ac6cbfdce1f85294bd54bcd8b074f7ef32c378f
> meta-openembedded: 3fb5f62b02f812da85e818e80a1dd3c229df41c1
> meta-virtualization: 8138d9cc7e0c31171230110db0cfa881c46a821b
> oecore: 161c5b311f1aeb8f254dca96331b31d5b67fc92d
> poky: 8f01ae5c7cba251ed25c80f0141a950ebc8a5f73
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
> View/Reply Online (#465): https://lists.yoctoproject.org/g/qa-build-
> notification/message/465
> Mute This Topic: https://lists.yoctoproject.org/mt/108515640/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


