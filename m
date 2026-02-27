Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8276FD5323
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:42:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92012.1772185369687631724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KRgjGW0o;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772185370; x=1803721370;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tDIKmbWUCR69KRcsPoxO4KJFjZvxv4Btf1AFJjGdfMY=;
  b=KRgjGW0o1LfHvhtqEoBJh2YikgtPQXa+cbqt7uI2gX3IPhEYc/yqXand
   VuM39sq+SnKBFimNlWbLkIEdAhA0CHUGinhvt/l0xmfAV12y+YM7hDWG1
   XHAumDobBuYsejwkAuVJo2rnFdaT7V28mi/Zkrs8Ek1vVHpiPug95HMxj
   XDaK6ZWlDic9NrCSjfo2Shq75RLrdACgcZq/PZCmOLqLTaRsv96BwQTUA
   GySnt5CRYwZHIkdYBz0T/aQ+tO+0PM0k8dH/qd7ywji4/cWHNVg5mtG9u
   sgSiXXAg4p/SyhIPd3creVivgyOVIPUMy2lFIRiTF8u5qsSpmqFz5iMqf
   w==;
X-CSE-ConnectionGUID: rJ4hUGgcSfO34nRwwujYrw==
X-CSE-MsgGUID: D7wXNUgsTjG46k9nyJrdbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73171025"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73171025"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:42:49 -0800
X-CSE-ConnectionGUID: KRqrNmZEQaWaSop3R9mmRg==
X-CSE-MsgGUID: siwsHW+3T02MKL0+wjXY7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="254629567"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:42:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 01:42:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 01:42:48 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 01:42:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zf8NHt5pI+4ZSE07R2trQXp8UCaROwEA/6/Y7mSzu8k7vUrEJBX20K3xPOJ0kUGYD3zxML/RMCtMtNBeLHJnC70a7HssP9b7ZIrZy5r/6lzTepNydhbOq5//yVjXSJ+o/oUVTiBFHSszhnKLAdL1kuXGfdD5Icy0BKrObmFqRR7cnbL1HvlKGpYugO6mASc9m61UBUuJ0nkuXmOlABrJciYXlUJ8eOLkC4DGECNbaTOc7OvywWSUw+7hSxoyrTuPoXTXEwKVYRrKApN5wH+SxdVp9ZuPkKM0IAayTfj1aq5on9pAcZ6nvULKOvaOyJjksM2Ms7rdLTh+UbXgEA9EnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEKAwW30MajUMafGr3+6xK1pm7rwFIhW/BO4+Y8WoLc=;
 b=nGFOmBAXh721pW0vq+/umWDBAcZsdIiNc06kvFIZPVtU6D8Fm1cnZ9ps7tT1jJIN+tyf4L5Rdmt3yGRPrihcafRGbfaTshKyke3+ycsBu8NB/xP968GQQ2XPTCISifboKjxZHnlwDRp91uKplzHm4PcSdsPjIc74qDxq8Qc3ByC8hH+ndgpvruuR7FrVIm14pZ9SjqqCJwXvifLN+sFs+KSZCLXLvlEsPXIQbQO9F8/64ZszR/jzZ+5740CTGQUSc8TWgda7CLsRfv8XTLnPClZRbpVwzKi7+LJ0yM8WL3Q3ICi4vKSrEC4SWPEV3F5fkxcT4Xt5RptfiIwKFjzHwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 09:42:46 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 09:42:46 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto Project
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3.2.rc1)
Thread-Index: AQHcpNBOGA+GzuaVMk6epBwrcW3E47WWUCGg
Date: Fri, 27 Feb 2026 09:42:46 +0000
Message-ID: <SN7PR11MB7018255576EB80B436B74705F473A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019c8ae412ff-845f6e40-3349-408d-bf21-31af2cb42d7b-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019c8ae412ff-845f6e40-3349-408d-bf21-31af2cb42d7b-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SN7PR11MB7640:EE_
x-ms-office365-filtering-correlation-id: b3a60756-ec8e-458d-ef43-08de75e49014
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700021|7142099003|7053199007;
x-microsoft-antispam-message-info: olNSB1vEUdjXZ1w4le6DxKc79Q6e4DLb5BJohAVv2OfHnGaTVibwH+FmjaaZK4bzuthSr+RKrLP4ZaJKEMrmlTRkj2jDkcMLHXYwxPWDZco1cmNyGCHwu6Gio9lpTxljRGaBZwgji6R3J42hxj7wWIu54vjlb1vzkYgp23EAdq2qdddiouxxxY9AE/vv85xpUZBrxL/9dU7+F+wFxoBQ8w+2OWyqoB1c8LMe7r+3lGYot00Dxag9qHAYi0FunRu1+rkDl2YwmtZXbIygQ2+cm0QGgj+bMoFdl6IkcyQB+r7xxh6wGE3wC2sM1cznEKGUyyof/TTR7I/qolKIS3/aRqaPoM2QC3f6lTstKi1JYuQgXLXZV9LQw36IN9OYMrtZX3Q9FsXSstRc6naZOIX74xLK0yoiNE0DWm3IYSHAzPK82O/XSB5/xDRGHS4sH3kcHDjCTBGeRzKPpZbEeDOXnImBEKZrUvxBJQJrRCPRmkWp8ZHy3Xs/Yo81E8j8E3J2AbFlMDCIAXDeiCYNSHSOXUPVyooLNPhDplztpA12r6TNPvw4OReVzMA+wR9NG23efAz4KX7XDb9r/H9ln83DYdm2J15KQKZU2b11rarrUal3mdHPKN/DwPW1TTdGHzYMF0dqs4ZuKfkgfLi950oXtdNRPBdt/1tvC5eLX0vRIV4EqGSy1pWn3VlOPdakUV3XYYfPHszJ97mL3akRRGCVe4TvQfg+k8Qk6ELmLrcpsrTN6+7/ZRjw47j/CbHyz5ef
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700021)(7142099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T3UYdL4Cqy75jLf9xa4zl0jKR8WTFZSFol92y/MDDBp700dX8P1W91DmUcsL?=
 =?us-ascii?Q?dm1bsKJTgjocQFW1o88YKPdRFNMykOzUBkmHthUejWLhZ9XCpewmsPUo48vd?=
 =?us-ascii?Q?TiLTqdRe6t50lESsSDx6V9fbWJoXQHZac6wQ8zi06a16VI2gpx09lZu5jbFc?=
 =?us-ascii?Q?P6ijJYXApIMU4MjQ5TvQjeQl+fpdzI+kpsAId1k475MOu6xiUQx1vWPfBAqv?=
 =?us-ascii?Q?phbQnAciQLMDHYQNOcYVzkVwNRH94fHk9h5aeYEAj/QRWQ7nzmel0a28kXBA?=
 =?us-ascii?Q?yOqvYu9xSMHcZL+2nH78bZijj7/Bak2yzDfZiKpoECTmvYV+USgZzsj9gt3D?=
 =?us-ascii?Q?emaVeNPooFCH7BDo2HTc/p26x/vNJfrAHOXy/ohJV8SO7KTJNgniB7oervVc?=
 =?us-ascii?Q?+AYndyO1QSseTMCnXo2gA34+lfKMBVEuGRgY9MaGU+AtkHPti73PZTdTHPhl?=
 =?us-ascii?Q?pWlH8hRKVNyXXyGyCCfrqGmaNK86L0mxtzSAWJSRFCyHKUgxrdFtzlVUVnEp?=
 =?us-ascii?Q?4D24wI80BBJ60Wz+J4/+EUxaciN0H2L4ywVkPVPwFwNDwM8oo7kgt73LUjc2?=
 =?us-ascii?Q?SF4Q/gDLfZFnQ4HW5CbSPRdnsXdjEPbEipZEzshRf5WMeJhiz6IFX6jnNJ0I?=
 =?us-ascii?Q?pf7/qFFJtHFJXjgcbu9bb78SK1j/LKWCpu9jNNGRTKtLFBtAnmWCfL/vYJqp?=
 =?us-ascii?Q?H+01L5BZy1JaIQTUdGx8yCprlZs4fV4RKYMURWpBVx9hzYhgziy4IQPMc1bs?=
 =?us-ascii?Q?jITDukGn+jILIL8dl3u5jx+ZKX85gwAVT9zPvsNUP0qsgHT6deWSCnTCUIRX?=
 =?us-ascii?Q?DURR9ylNZG7GlFHGU6Yc5eevDSZIRGh4vG5ycRJvv+uxy4p5vbDgH4aQtEMe?=
 =?us-ascii?Q?SQOxfg6pBjn6uZ/wXZ6ef+cnwhz2w8lUJOVIT68U4Ayepp+5+hAJiTC8jETH?=
 =?us-ascii?Q?pOzJdJAXhPWBySINzzRSZRQ//9bF8QNsOy8DmbkFdPGG01IA27VLw8KYmp5w?=
 =?us-ascii?Q?nY1DXx1wyK3L8kIng1QB34QMG7PX8YaVYd8QvOkOrS0iGlVCYoK/8Oih393y?=
 =?us-ascii?Q?1RSusQmEs1JZGlgb/b+hm6c4PVOVQsJDNQF49y3r6k350PrSs7bMPcowuSHA?=
 =?us-ascii?Q?g5sUtCTHIseLoe3cDWG1BPlFHNsbIMDY6FvQGPoKlxSJX0TUYak9ZjyRNYrL?=
 =?us-ascii?Q?3bl1NYa1JvDnETmtVDfHChypJNZQ7uLE5K2GhD0e00+ezjohjSO+Q0QHZib1?=
 =?us-ascii?Q?SOU0DCskca8k0ZLtdw24c33gLA7/SybxJzuiDrKkCOFZ4bJSMoAwwrQXM0Dl?=
 =?us-ascii?Q?g50WUe76agYGXc4kpvmPKW8pu7DwnvSvKWPfb7icUrenML2cBCV3QbgrNypD?=
 =?us-ascii?Q?ZVdkXk7PVOg+QYDR6P8WfN1kPRWlORalA49IWd4a5kZUho0WCnW+HlQ12TMZ?=
 =?us-ascii?Q?INUCMFjz9VT4LXm4k6iYPrxtc5bzIKPFXIRkbLjCNhWP3+SBLRlwKwcbDCao?=
 =?us-ascii?Q?cKqZXE9490Mhsr96FeH2qqYNNNqf9ZGJbPCmT+NU2xzGU3XHcTHty/zyKieD?=
 =?us-ascii?Q?W8VyYSPbMAb25xHIlTst+ehleabJWrfw18po+OVNYsIJXr6VC9uXnZKfgJjB?=
 =?us-ascii?Q?mvUaM+irsqrWcE2LYTQ1XYU8I554ROIxmsM41TCBgSQiQC32p6w+emSi68L8?=
 =?us-ascii?Q?Ol0JjKfD7biEw49EZm03F2P4Kl6tLp9DGMDl9fOrni4DuzVY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a60756-ec8e-458d-ef43-08de75e49014
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 09:42:46.3454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CyYypWwcMTVJYjgArlMElFXAMrgmyMZG18B/Lcl8Z4iwQpW6+B9YK2yaHTQYFrJlupbRkF1rAi5KKDoM0DD9jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 09:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232093

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.3.2.rc=
1. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Alder Lake-S
Meteor Lake-P
Arrow lake
Bartlett lake-S
Amston lake
Twin lake
Beaglebone
BeaglePlay


ETA for completion: 10/03/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 23 February 2026 19:55
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.3.2.rc1)


    A build flagged for QA (yocto-5.3.2.rc1) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.3.2.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3262

    Build hash information:=20

    bitbake: 7af7e04f3adc8ba144d9e2e6b37ed4ddb3b59df0
meta-agl: c1761e898d7fca3d8438e9b010eaf234f94fa407
meta-arm: 73460c53949658ab6c8b46269c3a69caccd3f745
meta-aws: 49ee51b051ffa9a0eb3325cb8fea351eaf8cb9d6
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
meta-intel: 8ca2f37f456db6693e696174ada1f4317e3ebee2
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
meta-openembedded: d28d0a23615f4d91d125fdcd247a71245087dab3
meta-qcom: 49bc2113adb0b86d463c311d32d4fb1007fe4845
meta-virtualization: 8f03a0cc8950ef5d5e4f11d9ae494946d1991e45
meta-yocto: 691ff0fbeab54eceb26d90140d7a8f672532235b
oecore: 21314665e198c1abe458d0bad5c4d14d4c3ad856
yocto-docs: 9c363d270ab45f3443391fb7275817db69d8a5d4


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#659): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/659
Mute This Topic: https://lists.yoctoproject.org/mt/117957391/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



