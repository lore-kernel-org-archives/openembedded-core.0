Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B4ACCF9FF
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 09:18:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.web11.11036.1761902326819712686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 02:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=AdRqx19q;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761902327; x=1793438327;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jDEzcK7D+YH6YiaK6Lf+vfrrXuYciF62kBOU02z8b70=;
  b=AdRqx19qDhfP7x9rd9xz5nZnZ7bmaSGOG4FOYiJY+AwRny3dlISewXY0
   Hw5IcdKvGyg9G40mZWtxYmtDQuvNLb+/Zc8QgjSJUdSNWgB4nZfjvhNcE
   V5qRiqhT3j2LbZTLYWhZI6tYEzgObErTW5PAQXPNLixldD5x8B/5shpvB
   RlMTho5mHt7q+ld5CouWQQZF3IsYdAAmsbeMzBG8Bw246Ni+wZjQJqXUa
   KISP0TDZABADyW+eWzqWYTiHFRuMkAfHV+n+SHe0wsezcBYKW3hlhMeB6
   CWMOF/pd1PWuoNtHGAoqNhGgms8k/LvKhvOPEKsL4zn8JWcPRM6HGWRW2
   Q==;
X-CSE-ConnectionGUID: bK24S6czQb6tzeLFnk+IYw==
X-CSE-MsgGUID: 752j5pleTJqqpjZGrIVuNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74737443"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="74737443"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:18:46 -0700
X-CSE-ConnectionGUID: x2JLY/4OQXC3/ffT1aYjIg==
X-CSE-MsgGUID: n+y6sFAgSvCjbXAx8ihGig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186126546"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:18:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 02:18:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 02:18:45 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 02:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxmNVGtElLisVyv+HVx/oNRyR1o4FQ1MZNVuugMZAv1iIduc7vLwwzBVHFz6aKrsdh1WBABq+AjHfJaWn3Qt7BmDrPuL2HKUxvWkR+DywJmybJMAhuBKbPR3imVHSZei5GAPheYYj7q6+2PNtsJWmtPQCsdWuYSyGnGdwqaRLJXF6vl+q6+ZfvDOAY3OsSzhggMErL00WSVGYe8ia9Bl7KSHlCcob+/lKFHQoaq+PrQkhlYenQdyMKTDZGuoMFn6KoEgQ4nNF3NMyC1TMfpRwyd/p0ingknYp91cCeMDWwZYpBCnoyFseXtFWPWcr/xN8pVRdVJHlpdZn7QNcQT5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMld7FRPzBCWHN9D7HDVVMNyugAxLFOtVYbwLy9OkZc=;
 b=U/iIIOxf7QHufs+ZIcMOLYwaWQIFjV9huTYKMz48ScDy5XMeB+zdS0cFnKQWH9spZEp5kp4+FfFFjWXcV8eC4usBEi99ZLVWhqP15tHUdZ3OtQDhWbHW8RZvBeWVZXGkMUZSCtqpRG225B6to7kEjxfHLMn6BaaxSuMyjKsKBnQChSyobvqQmg+BUt64BjtLRQZGFPFWltMP7z65CLwGvLJegb8vQEc9ptgs8BJEDN6NUuWOfjiljEgYE5A61Dr+wH1LwLzS0S7toANuWKLoQ3arA9J33YWRZCaWvHMZKQcf75DikXJ9JViV0nDBw1qJZlR53t1aR+AxY+EpbH127g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:18:44 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:18:43 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.3_M3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.3_M3.rc1)
Thread-Index: AQHcP1kB6khA7ddet0i2MyHdlP3sYbTcD0TA
Date: Fri, 31 Oct 2025 09:18:43 +0000
Message-ID: <SN7PR11MB7018CCD2EA05CD7F45098E89F4F8A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <01010199f1ec695e-da41e756-c561-4a89-814f-693aef0cfc37-000000@us-west-2.amazonses.com>
In-Reply-To: <01010199f1ec695e-da41e756-c561-4a89-814f-693aef0cfc37-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|DS0PR11MB7878:EE_
x-ms-office365-filtering-correlation-id: 72f1148b-c333-414a-7c4b-08de185e7d26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?TpgIUyrJZzBZ+gzxegoHBPYv/idsORyVW3LgUcQXkEucPUdcaUTJu9L/2Z/B?=
 =?us-ascii?Q?Z/l8YHRykZAgMakb0+RMJ1GGw/LpsnFiEUJp0SCcDPeReiaIGJoDI2KmpTVj?=
 =?us-ascii?Q?zMfAlfyTWJRypdvOwONq4RtdnSl30/qnH3tQHJbZUl5xEDprgNlcRwVP5MK8?=
 =?us-ascii?Q?BfXebOlFKNXOL5lrR3vRzSHyK2gKDqtAPTp3m6vMm4z3o2fXAG8hB/dhwpfv?=
 =?us-ascii?Q?oUqsl9qAWrPRzDdUvAxncVcwIBkD7/KmzH+7BR3PPL6ceeAZMvO36HmSwKWJ?=
 =?us-ascii?Q?/KioQAjdDdZBvte+LtOSz35egTdi+s1x+u4rwfSVyHktGsWJ5+ZN7QmOiPz0?=
 =?us-ascii?Q?qsmf+VNfICgwEzLC2rsfcKt17ZZ9P60+suuEF6axAqrXeJgdaSwk2UFs7XFN?=
 =?us-ascii?Q?IiA/H8zUKvzec8AloJ8oBalN9zhcPQgMfzCQkGNsSCMLQV991Xv2pGl/q9kf?=
 =?us-ascii?Q?K1lSFNzpwbmMSc3lpQrCXTZGiE6KgWbAl0ZzmPV39ZVeJDYe4SZjSHRjQzWw?=
 =?us-ascii?Q?wk84G1wb6kN5mTfWzAvOpRESac6MbktSx4TneEhDaXpNJ5EEx2bt2p8tx6bb?=
 =?us-ascii?Q?DDhH6GJzjdwKk89A+mCfRJZDiQjSTc9S1BmLEpMKEbJ20nTTpj9LSqZpzBMB?=
 =?us-ascii?Q?m1BwHNkp0U76RL3WY1/jy8k0uzL8G7Il39xa0tqi00Il6sLfDy+Kekbfw5qV?=
 =?us-ascii?Q?8R2fP1WeDtiYla1b5XPg7AJ4eptrgMXgdnvsgD6w5FA6yI1yxFdS//aGe3Jg?=
 =?us-ascii?Q?h/I2orAb0FRTH/ZpIw3ZLdlDY99ze8FoajMnJv8zpbehXDDmvt/SHFHPPBU0?=
 =?us-ascii?Q?tzMpheUiPrNr9XGRHACTYf+YqinLK4GxR1nA7XuNtLKTf6pBrBRQJ41VLm9n?=
 =?us-ascii?Q?EQXBsvjl5UaF6SowOeMh/topondvoKDpThw/habzWVOkUb+lOeNTYr/vjNsj?=
 =?us-ascii?Q?DCpbZNG3v7GGMSJhTHcCvoyuDDNZjh/jPs5HF0tt9SPqw3c/bjuvZ03cM3C5?=
 =?us-ascii?Q?tszA1h+6eEEyR8hk22ygI91Nfnb+hZHUhhmd5HpgOWgDl06HnkYIGXWRPI8Y?=
 =?us-ascii?Q?zheYQmiKwjF50Bgoexbzys1sf3T+K/W6et9pQn85ceXkvGmHP3VTOojE4fGW?=
 =?us-ascii?Q?wGoQMoCSYmTEhTn841m0vkLazx6LJc+MKstJFwTjI+6XvL/mC42KNqQOjq/6?=
 =?us-ascii?Q?g8Csjsnijm1OXBPpx+gHZHzpmDjtCIM6HbMUYTyXM8hrG8OeRka3zz/EK+QQ?=
 =?us-ascii?Q?pGeYJ2TBc1TeelwD0qGKvRYRVpOQCmodO9aamLyx1B1spYBY++ViqaSTyBm/?=
 =?us-ascii?Q?rsZwOGHYrLqwwFIepdvSt2+Cs5tSuqGhlb8KCJz68Ctz8k9q5AboVE0ao4oy?=
 =?us-ascii?Q?FZfACiqvCRBc4yhwgOKLClSfsy4rgMg9wgiyCYfYYFxCRkU2YFE8+qLHbjzz?=
 =?us-ascii?Q?PxM1cN0FkA6AVjd+sjsY2XEhKyMCyuZAinDp0ZKe9/APJm7ZlMjydA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4lve4Vfay14nnZZShXKpx8iqnx/RvNSkI6Nn1MNEsrEW4bkb9hQ3lEJ9w1v2?=
 =?us-ascii?Q?2ooecP24NqtQQRjqxgKl+yFCXM9pff3tI+Ci9O2aomQzabXe/FAj0aWm/UVV?=
 =?us-ascii?Q?sNwIekPMd2iz7sgCNCCgENQgv201nwdl8KyCOSyuU07u4c1PCroQ4TGxvic/?=
 =?us-ascii?Q?Qah1JR+oGItK2fZHEmxCY4+M9283c1PREsx02Kx8XJN4lyuoYUe3/oDnd08u?=
 =?us-ascii?Q?krWmKAygNiKECdqhvg0knfA6ofGkKkSRcWN9EWU7rL68vnxMPyLlv9ru7AMW?=
 =?us-ascii?Q?cwjGtxHCJ9OBSKytZEjWz5eYEEZEcPgetpY2TQdSaYHrsr+QJSFT4s9dQ8BH?=
 =?us-ascii?Q?rOJH1JlIDp6yWMl9ZjibDDH8XFNq6+2m0phmHtnZiVzSzXTuuTMdOvP20Icg?=
 =?us-ascii?Q?jdNlWVidszAq5cCibrksZutAaZJpWWIStYWq9QqQv0IXtyqx08+Fw68Y5CH2?=
 =?us-ascii?Q?Y4altz505K7YQvamlJZKvXukYKUdNKTrFtDCrM/StugXICZGimmZPGgmTcL+?=
 =?us-ascii?Q?T9AAKvnMW18I3D2tvvWpIGjbvzPlmisSAHAKqcrSdMC28ghvr+IbL3xFivEb?=
 =?us-ascii?Q?jdUelSUlls3Xwdua264obtEIrckbUVg4ziEvXGS/IW0mQJYxmGQkXsDa4J9B?=
 =?us-ascii?Q?Ka5TN7/s2BL63VNs3T0due6hfJr5fWNtfp5htvD/dyzrP/dIkTScZfMfAIDE?=
 =?us-ascii?Q?rEoTmYjVVEuMwlwGmwxyL5rzcQ4QqL3yBClT+9PJSk8VLdLTDuL1+Rt2ciOE?=
 =?us-ascii?Q?TWcaQ4uVHrAQB0HvBZWYXk8OYwTO+JgqOQGHh9LLYkNMFVX6DSbQ0CLSid9y?=
 =?us-ascii?Q?0ZRhZwoTxN2Kh9LhGUO9ke7JLuBrIJMzXBqbI64WDiAw+siC45ygSuwrn3GD?=
 =?us-ascii?Q?2h7IWjj+qGVBAohcTgmPB7Ydgm64TzhX0HX1m9ZLag/fYxgHzsqVx0I6xV+a?=
 =?us-ascii?Q?MxV1aJtXXVoBxWIlFt1/v7nrFQae5ePBMFmuoelDIFfum8gT99aLh+OcZ4JX?=
 =?us-ascii?Q?TA6RUsqa0SUI07n8/hXwdwMIMkAqbtueMeHSbKr9XtMK/Ew6RMP6KYSncS6u?=
 =?us-ascii?Q?V7KuCn3hg/mYMrOpklcnkXtDNHWG1zbBH8J/hcAH6P3DTwpgv2WBGdIja8Lc?=
 =?us-ascii?Q?2eNiwsQTzVp4rMUsQWgY0d/P96Ee+T7pG6pYu4LT09I/fj7wIDHokCVbkYz7?=
 =?us-ascii?Q?/7RHR7x+XVpj60+jdO7F2381eD6Py5g0btiL0VFNplyn3XtG+2hMNPsDBPZH?=
 =?us-ascii?Q?Ly7ePuLo+NqRnf29NH6776gIg5wMU8Mnv7YGA/ww2P7wVthXSMHPV7iqXRri?=
 =?us-ascii?Q?/51u2dGWBEBkSdvVfKxWb5cPWsudCyLs/BzE6kVjB4Ljc769nfc9q3JG7xu5?=
 =?us-ascii?Q?zk2+ajGPQv6JxMqW0B5QRYVAmlfYVdG7WryV7/dDvM75A7wxfSwvS0WoCva6?=
 =?us-ascii?Q?NCl/LDy3PNPRj0GKuBG2dixph78+/MMiQn+AsJ4weITEBOiMaCXfC13r601a?=
 =?us-ascii?Q?mmk/8qEG4weN1qeVYOonp+4WOgyJnSlKjOFG1qmAyNLe3XEws/FJ8IvfGipj?=
 =?us-ascii?Q?2EHjs+5gNQ2GXIcL7g8F9e6nK3jXkPeu66raDpH/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f1148b-c333-414a-7c4b-08de185e7d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 09:18:43.8379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T3yYpQtvoPoR+1d4/wW2b79kz3iKLFpI1KzQXbiYrb9I4LaF4YU/MWC9saM1uzbYLs/xsGTRJux+4Iwvmvbh5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 09:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225536

Hi All,


QA for yocto-5.3_M3.rc1 is completed. This is the full report for this rele=
ase:=20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults


=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
1 high milestone defect occurred again:

Bug 15704 - [5.2 M1 RC2] BeaglePlay: System hangs randomly and kernel call =
trace with 6.12:=20
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15704

No new high milestone defects found



Thanks,
Debal Ghosh

-----Original Message-----
From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Behalf=
 Of Pokybuild User via lists.yoctoproject.org
Sent: 17 October 2025 16:57
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [yocto] QA notification for completed autobuilder build (yocto-5.3=
_M3.rc1)


    A build flagged for QA (yocto-5.3_M3.rc1) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.3_M3.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/2605

    Build hash information:=20

    bitbake: 8b582ef8dd0cef0192d4c0104bcd9b5d642d132c
meta-agl: f30cc1bec758954f7cc44f15b1df3c7a49ff2e1c
meta-arm: 40a5aac50c2540d32f79c30accd4bd5e891a87a4
meta-aws: 20cdd76c203b9b5b3331a145e9afcc9171a40b7d
meta-clang: 9c772c10f9001db62e4391b6617d03086a24beb1
meta-intel: c347d0be75958ca095d4ad320c6f2faf88b364a6
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
meta-openembedded: b28f8caccfefa7c03ec193a67fa8b11deeafa558
meta-virtualization: 437efd9259c1786c130c724290cb1e46d50edcb2
meta-yocto: fe65e142d0d9ba0e51ff9175ffa82e902f982a20
oecore: 5298d01663f897e38380116edf23973d2a156cbc
yocto-docs: 8b85245490ae0b19a9c3880ec31e55b42e19d094


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20

