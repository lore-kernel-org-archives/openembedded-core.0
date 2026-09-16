Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF2FC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 08:42:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10319.1789548163127153035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 01:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gIlF5ebs;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789548163; x=1821084163;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=pJE2YY59DZOMRcMkeZJ3YDUtXpJ8hqi45FwP62osZhM=;
  b=gIlF5ebsFI2ghRR4dviGprfuzpN6DDckEby3RgcA7Piwc/16Uf6XkeCo
   Z2QTXDoypRYsGYleumeRXnUK/DJCFTgXbuZmbNZzr2EMfRuKAPRMx21FO
   fCwTRYqkXeMyoQWaoG1PRX01+Ovc65tkSfy3P3JjaSW1immhLf0oxgHuM
   WB8rhjo8dAxrZwL+dvBwqiZMSH30s/j5unFYDER5Xt6g+9HJH9uJIhW9A
   1393Ptz6vw2Ade5aMz+FkY7v82ubD9w4uQvUNN6Y1xHYgv2qN+mSJcoeQ
   fwluQuUeeHDKq7htWzJA1VgqdcnhBpywPdUGc+nxUhjMdOZ3GdntBgsx1
   Q==;
X-CSE-ConnectionGUID: H7uPzVMTTRqaEb7rnAq1eA==
X-CSE-MsgGUID: JR0+VxVZT2CQDW9ybxx5fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89943646"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89943646"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:42:42 -0700
X-CSE-ConnectionGUID: eDyO21YAS/SUsbZSAbGS0g==
X-CSE-MsgGUID: 5NHzUjwJRmeWx12JBfKmfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273240267"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:42:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 01:42:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 01:42:42 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 01:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LskYYQlOLgeoTRR9Ogf39Xvxiiy7P7LgyMHVUZneO/ZdBfsZM0L88CfCFsq5bel0ue6K1g+gmhyzTDGcKBW8NlqziUydT45aXEhxkFHJYRbyrxsIbDCveUOGhob99CGs49hvJPNxMIwh1IT8fWDv4xod68t+N7jDu5A0o2O8oaiP9m+YQlnLwOsti3z0e3Zbv801PpimckIm0tUL1O0JaEbTXGN9uc9P4EGjowuTp6thqJm4dAAPVa3pHCvaLrS+nNT2fjebQFM6Bmo45FvMweMfaDJrmEtHpyqLMuIhPZXvXTIeK2m+vCJ9xPsMlHnRhXqaiN6nvbZUn+2rJncYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Q80mCOBshPSTJKpsjuNjvKGyAIo5c8a0pAleeFHdqE=;
 b=DGirQR0yOR1GcbJRwRxWHZ9Yr7yyixIyEk7ZqTXUZsmFAJlXumRM6xWoglTtdYA0RGRb6uwYzCpPshJZYy+Oxs8WnWOvsHBIJ38kJ1xrLgmpIYsc0S5rUevKGcXdi1haJ4M16nUwE1H38FYlG+ZBBAqBjufI9bg4T3iPyUWRHmpF8Rq5f8KdkkK2+qI7gQqQmCpDJhGbVFVokbtVKOkgxcHKHXHy3rd5djO744/9StQXIw5Jjw3NosFrBaumxXXXXH/+NyIiRWs6yKLVZ9tkYetUq4cnkb/LkwTkg5UjqGeCkEMIt59DeapJ6JHLUzJAldcBWK7l97a2qXGxiPpDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by IA4PR11MB9203.namprd11.prod.outlook.com (2603:10b6:208:55d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 08:42:33 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%2]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 08:42:33 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.1_M3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.1_M3.rc1)
Thread-Index: AQHdQF5En5O3RBTRZkyCCVJGUNFjDbbHn6awgAlN9cA=
Date: Wed, 16 Sep 2026 08:42:32 +0000
Message-ID: <SN7PR11MB7018EBE8BEC3F29D9265F3C9F4B92@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <010101a086555523-a038a5bc-9dfd-4244-be4d-20771adeff60-000000@us-west-2.amazonses.com>
 <18D3F76C5BF6435B.1538347@lists.yoctoproject.org>
In-Reply-To: <18D3F76C5BF6435B.1538347@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|IA4PR11MB9203:EE_
x-ms-office365-filtering-correlation-id: 20a6bb04-5547-47d0-0af4-08df13ce736c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|4022899009|1800799024|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: vlj68yOgyUMXq4NX+AF4cyctXykFakTkkcHaZPJvaNmgh0ueACMfaK695Ife80Ng1tQKvAbCQ5dlcEJmj60EtXs/S8+dJwjrykAVGAiFTPDrezZJphxdBOm2B6QijxXcAM2tqYhI7znNCGS9DBKs+5Ga6mOvXJH5P0rg+yS5OBDNrAtiXHd4zVFzKI9OUfqoGHgxF5Nezkki5J/bb/DePc+F18/LEBiGHcfpJ1fGFNdzuh5PKL0EKXqsRuK4WG5RIPS5T7nnyBHGQXT8iJ7Mwu40QBKrpcoIcflsVOOiFR1vhPLCaLCIFxwUkMqWWpwdbN834mMrQG+wktLM3gNzvViS41PTB7cvG6Z7FSaWpDrAzG1JaFYD24TL1FHAHGqlNA/V0TdDulS86t5LXrwz/+qLNonUfhZ38qJCEcwHNm/AkRbZgN6D4fwuJNxVHR45BatYJcPSPdWq0FfGvIPmiYJ8BbCC03UZ6IfPlW8dUuEf3MdFSeCRj2bD0xa8bDx+j5jCCxkJ1ioSUHSwzJDauXb0uoj2RGXRdsNqEv7ddBDGznK6owcU17B3uGf6bT8bFPfqlV2oDdt2Lb2kLt89MaT/x2O6ou3iF9PRhWYLIzDX1bOh69K7vS9gN+25fkhlenFUQD0Ox8NlHByaGN/jZR6MGhokbaySm82DbMKqCEQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(4022899009)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NyyLyw2EkKaZ1dFnuFEM7ALe86nHFnNwnIBizL+NVp1dbhrCdBXPmfbYLIbk?=
 =?us-ascii?Q?AQppf6LzgXnb5bx5AZ8c0mJBycy1ZR6FsLlsripn/6TMA7Mx2wAd4AjvVB/i?=
 =?us-ascii?Q?Qh31RwDAf+d8W5g4KWKZze7JOJqRB9qdJpfIAQWAkmfn+AWui2Z458DUQase?=
 =?us-ascii?Q?/oYBLHMrArDTbBxp5VEsJtw4qLsff9FV5XetbovsbAOFB4LcOxX14jWeKNCK?=
 =?us-ascii?Q?53/deY7dS7so3hdCNzpKhQiwOzl8+GWpl6gi/XBipZ9+RXxwizMcg/2B43L2?=
 =?us-ascii?Q?mOeM49lRts+LJGy2YAUwk6uGKJAKMefI1y7riydSMI39j5zCJSsUaEfvk1vk?=
 =?us-ascii?Q?JX8+QHDTqQIkA6hybOZt9EejkW9cClwdVpX/uiuZhdnFdO9fECI5o4kLm4wg?=
 =?us-ascii?Q?2HnOXTmWrG1uTbtU9EMgSVAXJoekwizqaTLnzFYIP30ZXns31o3A0EoXEa0A?=
 =?us-ascii?Q?7pSeqpCMoBFbkACTckNb2mdYZDsDpYru9oUSciMAnPjDjJbaiuIik7XD1Om5?=
 =?us-ascii?Q?5leVVQ0kG3AJoiY7A1g9ORg+HKI5hPqaTXrdNlztv22QKyChcHdoJiQGblBJ?=
 =?us-ascii?Q?EZI3HZRljyVdofQEpggCoxqsq54AaZfE0k7Qv7yLlSjZ1gmcaoGrazDOzaAQ?=
 =?us-ascii?Q?4YBGUv6XIv6ANTOJ36clTvMHXiG2P/OiIo28l9tePhcxCRE4a5xmwA7UNiuN?=
 =?us-ascii?Q?HFrw1qkfoGZw5klcAJkOQ2L/Pb6PW/zvsYqRI+u6AWJ/ZH7jhtGXhvtLUYxc?=
 =?us-ascii?Q?+bUXhFdF79iEF/9u8wVHK4KAmDdrZ+6ukRMrct7+Qy9ntFXNTA3qhy6hNIPx?=
 =?us-ascii?Q?AhfwQ38MCenn657m1aGwzoNORBRZmIMeMK4I0Gjz999SnzG2xg7zvif1y9D/?=
 =?us-ascii?Q?+uq6aj7fivxWKIUpmIzMHCm/A6+IzEhaSScWJJr1BWhpHPlDP/rGcRSpE/Pg?=
 =?us-ascii?Q?MqIeb60hPq5AKzePaqA5aZtPjoawCMkR5AvnrAk1QnPnan+Q2EOmMVDzi+oK?=
 =?us-ascii?Q?yOXwz3ein7xkHuHyntgF7+E47+hD3yYz/mC51cESMO97/7xh8M+SfdPe6Jwu?=
 =?us-ascii?Q?nhcRztRuWERXv1tnOaHT+F/PnWZZrwDQAy9vYZJjAHLpb2ZHMzRDuXDNtV6e?=
 =?us-ascii?Q?SxRYKDR/65G4tjDIaqMnln9kX49hMMj6ftfHh4wx+zyvZ2dGl0m125N2UU7Z?=
 =?us-ascii?Q?eCCwP6zEbid0hr17gTN9D/lKCKkbsBG1FPbs3UjQRwjcb5rcKcnA1EEc/3ab?=
 =?us-ascii?Q?cEaYUjYLQAVFzCJVUqQbGQTnE+abdAPtdqV7DaraogigwJFoHlrIz9LDrtht?=
 =?us-ascii?Q?wtHmKaDP2mix9wjGvu9qx3EHQ4TqPvmZGgiLxvXoTAlIACFDOYq2/euXqX84?=
 =?us-ascii?Q?OD+fBupS6ILW0xHSL0qfzxwb6F2f5sAWukNud+ZrB6yZZ33UlqGUv1IVxor7?=
 =?us-ascii?Q?kAWulRB09ICPYkOOd3JH4k+/NEUEWAo4AjuUTVYL/p/uH4735ZbhWW4lQt3S?=
 =?us-ascii?Q?M1qfvKMDaBb8cStfnGtkb3gVL0AWrph/l6RGwKek0QHhW2a45jZqwlODFzU6?=
 =?us-ascii?Q?/wzvQ++ROUC2Tr53wEpOwWtKSIP5aaPM0p3P252ewAMkSheCGSHiVIVPRex2?=
 =?us-ascii?Q?G4d6rYyMRywQsWJ5+ZUV47+UxNJ1ltSAVOANH7xnOQeZSYIrqvSGylK4F7CO?=
 =?us-ascii?Q?ti1aViw9wm3+woRgoEHdAbE6tMzkE72lJn2cLwwvDAOdpmfdtWSXlXkEx3an?=
 =?us-ascii?Q?Q9hlwzHpgA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uel4MvJW2jH4U8SI4tVbBttS392U5X+8i/oZo1ur5elfSNY57sPcoe+MIgLFWw/eQzEeE8jbwwApUwowET6ab3ppZbynOelgfdmB8TZt9CDcwqeMblEcZP4WRHUO5043WkOXN+a42mkHNAgvHYmgM+iz2go58zIDg5rxlbS5DGmfMlEG6mU3WjA49yjRzQMC86HPLrsmvKiInd93s/BV12Gt+49yRME/oIN2S2DurztbUQu0lL+rxyxGqUdOXtdV2TREJBN87CwHffp5PhIj8as+V0SAwSgktuyIO3W0e/CiVxtTHbu5bhOokWjpAL6xjcrrnT7fni161VUZKftrog==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a6bb04-5547-47d0-0af4-08df13ce736c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 08:42:33.0492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53fVouuMWcJ53+i63TReqyoESrJgRHKzQOvYe6B+Beqq95njaXrt9YOTmM9glv7j52CGT1QF68QojGTxB+GFBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9203
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 08:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245940

Hi All,

QA for yocto-6.1_M3.rc1 is completed. This is the full report for this rele=
ase:=20
https://git.yoctoproject.org/yocto-testresults-contrib/tree/?h=3Dintel-yoct=
o-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Ghosh, Debal via lists.yoctoproject.org
Sent: 10 September 2026 18:35
To: qa-build-notification@lists.yoctoproject.org; Yocto-mailing-list <yocto=
@lists.yoctoproject.org>; openembedded-core <openembedded-core@lists.openem=
bedded.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-6.1_M3.rc1)

Hi all,

Intel YP QA is planning for QA execution for YP build yocto-6.1_M3.rc1. We =
are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw

Runtime auto test for following platforms:

1. Alder Lake-S
2. Meteor Lake-P
3. Arrow lake
4. Bartlett lake-S
5. Amston lake
6. Twin lake

ETA for completion: 14/09/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 09 September 2026 18:52
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.1_M3.rc1)


    A build flagged for QA (yocto-6.1_M3.rc1) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.1_M3.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/4701

    Build hash information:=20

    bitbake: 046a90b0e9b7b914b7a95aec579cdc3fc9c7617a
meta-agl: 3c55b45bf920bec93938af02f2452cd698d3bacc
meta-arm: b0ff16aba48a197070daff28ef7ad67067fd3d88
meta-aws: 3ab2281500fbf683cfbf4fd43e449e0ef14c1164
meta-clang: 5e16f9749e210fe9d17f1302b089ee98f8b71a47
meta-intel: 8877caca6b1fe6efe33c756698ce6ecdcaea2238
meta-mingw: bab5f06f3f4ea50185a8ddbf5d61b46dad9aafed
meta-openembedded: cbec9a20d78add94235042c601e991574151e36e
meta-qcom: 2832e2bbabf9a71755e031d396f17652e95bbde1
meta-virtualization: fd4fa494c9878346e913ca9a7788bac0063a3ba6
meta-yocto: 7e41504cd63b099b214f10d92cfdaf358ab98c5f
oecore: 544846662cdac370497d7c13a125d8730c7ebd47
yocto-docs: e35e86e9aea4e4ae12e8e0ba8a6391f2b2555b63


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#749): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/749
Mute This Topic: https://lists.yoctoproject.org/mt/121162005/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



