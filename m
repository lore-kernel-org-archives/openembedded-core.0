Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D550EC41513
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 02:43:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by mx.groups.io with SMTP id smtpd.web10.51296.1715568235343898991
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 May 2024 19:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=nkTzpMmY;
 spf=pass (domain: intel.com, ip: 192.198.163.10, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715568235; x=1747104235;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=pQiVhKccRsOshu3JO6uPoxXakH7rRTyOnj9XHoxp9CE=;
  b=nkTzpMmYfYIpIVu7MCb9qAg1ahn3x/tAhF0VmBeCao5C54n+y7KLFxQy
   hapu7BXUsIr/mtBRSHA9a9ckH2g+J3zSLOUDNn49lW6MFAG60+LWeMxJD
   v1Z+GkiAJTEoOLwV1GrMulYsH758Jk/t2PiMibDOLfEWpF0R0+0T8BNxi
   nuGT+ZO6N6xDw03BSD9P2PszkUcHoeXYfhrtE7wuCJ3mjVdmuA59c2n7I
   6GZw3ipLFah7cipXXhWbJwuhIkBNmRR+9qSl6Al4QoA4nk0fFLjPm+g5L
   4pYgvXk3hDnUPPmBvhiP5YxIeFPKBx+VYI2936Xoykl9lnyqb03Q7EvRX
   g==;
X-CSE-ConnectionGUID: qfgSA0vYRDGEer8D3CGhQw==
X-CSE-MsgGUID: 18UiQMNxQtWIk/vEOk7usw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22884983"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="22884983"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 19:41:44 -0700
X-CSE-ConnectionGUID: GJbporSuRnabYimu++ixlw==
X-CSE-MsgGUID: dWbidSxkTfCpt1X0m7GeVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34706144"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 May 2024 19:41:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 12 May 2024 19:41:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 12 May 2024 19:41:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 12 May 2024 19:41:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 12 May 2024 19:41:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1USux9srxiHoeAV5aXmr0EVloJ4cn7aghZRYpAslVmmsFV2IIwauUIdyfuvln8yiq1JOOOMAhVrTZ6k++FHmMqo2gn+38xdCdc0aeBNhfJG2u8SrtVMLS9APvZRvxaLnEcsrezPyly0hWz19K4QAgMA+2ElhUclKwJbdLpCm9b0GrvwUEupXoJ/7XkuCaSFkCUhxSlHA3U13705ScZswXFU9H1dU7vTIx0rlzOHx1NDLFEweWFEGA/3H9OpYYeFVexBFZO6wc9Qwyq1ZdLTBGbPPTTK4u/vbOFul79zGRmpV/fnFguxYTOPpNbtHgesDZjws8rNiEcvqsk6PfAzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRoonon2fzTWF9NIm/dvnimj+By1xXpx+MHzclh+rlI=;
 b=i/cTvM9VdzvjmhH0CbDznh/Y9wryZk9R7G3GQHyKHuiLhFnDJgh1JCLRjW2DVB0MOKjrQZ9IAOKiuG+kfujH5IAW3qlYXZPNTki/8NAQnQUKgaJv5rJmI9I0iKCV0leTQAWHQJ4e0iK7v6dUyc6jfVnOZOQOpxu7IX8r2+a5MPXAhWNSCDBAE8CLwfBlfc5B7Iui9d+dHQxG0z70it2lZKpd2eweb7b/f7DhPaPI3SSaSLtTuVy2hORY8PdBm50bvUASUP1jZaTSNg40s/sFWhykcX0y2adfRV674SX04ref/dEv6Ima9AmC0iIZSjxenasdBMVVueaPzlo6vGdD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7748.namprd11.prod.outlook.com (2603:10b6:930:87::20)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 02:41:40 +0000
Received: from CY8PR11MB7748.namprd11.prod.outlook.com
 ([fe80::ee67:1f31:ea5b:495b]) by CY8PR11MB7748.namprd11.prod.outlook.com
 ([fe80::ee67:1f31:ea5b:495b%6]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 02:41:39 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.1.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.1.rc2)
Thread-Index: AQHaop1Pix/295Wjtk6ipYHm2vHlBrGUcSdA
Date: Mon, 13 May 2024 02:41:39 +0000
Message-ID: <CY8PR11MB774868F177D421306C4BE60BA1E22@CY8PR11MB7748.namprd11.prod.outlook.com>
References: <0101018f6108f259-da34e71e-edda-4ce5-ae8f-f9a0bfda30fc-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018f6108f259-da34e71e-edda-4ce5-ae8f-f9a0bfda30fc-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7748:EE_|PH8PR11MB6732:EE_
x-ms-office365-filtering-correlation-id: a3551e71-52da-4b31-d8c4-08dc72f63779
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?QoKNbL6RjPUFm07Bq4f/6ySIeOthE8z8xcnCbsEwYhzSrClbNohuCnIvrL+V?=
 =?us-ascii?Q?QNimklgUhscDe6p8dqBgxO3wpKfIjAofi+ZXCiXNc0GLSt3O/FW5p2pfezbi?=
 =?us-ascii?Q?M741suFx+zcoSHN4Tg6pPApKXjQ/VnpS1rbsteLfS+DRbrFPl4JxTIMm551w?=
 =?us-ascii?Q?j99p5lqa243bq1aqhb0Kza/qhMkDP7n/RiUXIn1zOFLCOcXmxHEn/0b/HpJE?=
 =?us-ascii?Q?QaQmhm8mZKmGJaX3E+D+/qZ3fWz5GfcL3bqn+vGr3udCUfCmU2oD3FCmKK2a?=
 =?us-ascii?Q?h5M+/pbgU2JM4Z4pYh13rcvlm2esTzReVPFwCzW2KrOYxhvqSh8vTJXo0I5W?=
 =?us-ascii?Q?eV7MYm2kAOeETYKFOwpnckvQf/E3SiUIbSGs0V7zp4jnVX3IvFEh4NNxIUBo?=
 =?us-ascii?Q?0ZpjMqJqSHcrItkKxUzBMKdEZvsVassOxfLWeNLqgBGbDE+5BDkxVNA36Rvf?=
 =?us-ascii?Q?nL6JebkBks2oLFyJdwLLQyCIKsrDNy1D939K8roNp29dQjsdktTx+7/LYkGF?=
 =?us-ascii?Q?HarSfbc84U/MVQarc6dL4qnbPmRWglIu6b3FkMl505rQ8qymMloefVoj1WHT?=
 =?us-ascii?Q?+1utc8Cx8NYhzung98l6OQsgGusUitKlsS1GEgFkrh0fgq89wtx5mdH+SiP8?=
 =?us-ascii?Q?ka+MHcPWpv3grYGdxLbCl/epUomh5ZHEoctr0q3zTCQXxLBFVjupY3ut52AU?=
 =?us-ascii?Q?C3QGbXcs5FRgPGRvtNDzMr4GC5i+zd48rx78KRgpul3N3LbsPNlpg/XCFzDW?=
 =?us-ascii?Q?ZpYK3SmWc3pWR7x+tINZkBMPQ1+1TrL1LVu1NCYZMbBfggEtPs9huaAYsuZc?=
 =?us-ascii?Q?V3/EKfLBL6b5A1noqzC5sqobsn4ujlG244Sa6MNFC5C0THbUDFfTIiB5PqRw?=
 =?us-ascii?Q?Qz2KwCVgZjG0DCQ9Ut7BbGwQuB69TWaWR4xl8PtY1iCdf3VKjgiU1/rIUSxy?=
 =?us-ascii?Q?p7FocFxO1vy8Gv+Ocnpi8JdLvbEOPtX4jfZovayloNksZ1pHJdBZVanBguZT?=
 =?us-ascii?Q?sirBdC8TKzjlFK7WuII/R9++MHW2vYPIHJeEgXRjKjPwX2OZQKVsKHVtKABz?=
 =?us-ascii?Q?+JQ3AgZxIoQztUJKfJ+e2x/kCChYl5VH+5AlEpKLy7PiaM6h2WSFtHHuh/P4?=
 =?us-ascii?Q?yt7MU6on8gEsRPXbq6x07XAX/51kquSb73o3PmMNaQSzd2lSo3prR3IpHd11?=
 =?us-ascii?Q?DGMBGPx45+nc5fJ/1YHdhwwZ7YL4QUaZmy0Dt6x+QswGTpqGkucM9CifuYFb?=
 =?us-ascii?Q?qN00O18mJt2L6yCS+KhesTXlPavh/eX4/ffqbWweMxdyi0BNhVSrsgcNkmHe?=
 =?us-ascii?Q?K50=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7748.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v5HsgrHuqNr77nl7uIGsI9E7JIIGsXiOi5e6yva/NXSaFeRgK68spSQP9883?=
 =?us-ascii?Q?avEuaZJUIy7CWxMIxm7BFgdb7K8IrrVFFWuq3y9LVs/ObpRCRbVEU68VZcAJ?=
 =?us-ascii?Q?Za4IQ+rGkX8absF4Sq0oWyudrCYtvUNxX/vJE6YsFU9EU/oKsLRoduWpCrDq?=
 =?us-ascii?Q?rCd71ZEykSWjZKej10O4Ws5YftlB3ThN4a1C61kNnDUNV3m3Aclewh4gdGHp?=
 =?us-ascii?Q?AfXzIVaAfP8qIo0UHfO4Yc+X6fZCFUXziV87GJT8ZNQUUXtnv2St9HZyB+1p?=
 =?us-ascii?Q?MhLtqH5z4p/zBdSETyr+jTrbNoug6fFYlxksR0Dti+Xso9Kdu+P68AS04z69?=
 =?us-ascii?Q?7TyvAWQABW6rlBonabKF/VygDZq0Xk+aZFZ2sSwGG0lQkjx4KibnOFtlDAyR?=
 =?us-ascii?Q?ELz9UOsZymZUln80G0T86m7mWqRr/U1GvRfxtcykwP3pe30TDPZBarDgE5VU?=
 =?us-ascii?Q?sIWj40Eds/r2RzbG2YetusJeCGjYV4Pl+1HRsP53LVvc4RPqQbxSJLFhb5S8?=
 =?us-ascii?Q?UGn/n9QKdWXwdexZQ4D2YRmXle23Pj8Tjx/hWDnSJdn0JAM6G3ZskiyLOrjD?=
 =?us-ascii?Q?Q7MvQ0t0LuNwT4+c0IqCcH0iQspKsrNWL3ZIwyLivK5lzIt3hn2RGmdoNoaK?=
 =?us-ascii?Q?AKpmelz9aFqZ4/KEdMH43o/UXWt6caYKj+SicuG/hwj5K8GM96NmLBOYrwhP?=
 =?us-ascii?Q?FDLhOXW1RmjgzW1a8kmNKMcQSDUlxapOEeE3nYqmwNr1TkpOytyguo8Qpfx4?=
 =?us-ascii?Q?OmDMNDcZ+9vTxwCh6cnEAHlr7/fr7MmiIL7XHb8h/+WkeJGlSH8dNcHz3UKW?=
 =?us-ascii?Q?yoB+0KaUbnRGWQBDzWJMjfag58W25B0bv7VkU+TJnZrKRevbnxZqYvSVlehj?=
 =?us-ascii?Q?0qfW1Bd1DRbJGBQQH1QYc3wgysfxSi1G17znUSYjpiAXeZWsPeWb4VYINaRD?=
 =?us-ascii?Q?gMMNvFOfT8nm86ab5QDdiwcd1ti9V/VA/Jkz7mM+0UgX1djLqqaGQLCtbbH2?=
 =?us-ascii?Q?QtnNHTXai0N6rILQzszsNkxzfFO+7s/9tdPyUnEx5V9Kyjhjx2/49HKjC57G?=
 =?us-ascii?Q?WylLytOGbMvYF9/1F/naFoRCDMnHAeZCCnGM+1tFp58x6365JRbSeZQtNfYI?=
 =?us-ascii?Q?mAoCCbMQx6wunHR6wiJG+8ZZVchUyWfHymaa2jYZjwGcAuv57lorM4izH/sf?=
 =?us-ascii?Q?Wcu3BTtkbPhONwM7nYtSdPYOSejsrHzh5f1tYGlNRbrhEBD0SMVvwS2v9AYo?=
 =?us-ascii?Q?AXU3set4NSqHolI+ftiH7QZ+NEsGn4e1+98Th1HYKRsFZpkyYipQRjCMLNs6?=
 =?us-ascii?Q?jWry2hG/AL1iVZIBC9h6PGdFRB8KAPtGUDTOiErSXKZefQM8R4rqJdTdtRJ/?=
 =?us-ascii?Q?kZMk4us4Xb7WuqA8QstrXm2i2MPOIlDMuudzKV8xvgvs/kYw80+yCVTFh0G7?=
 =?us-ascii?Q?cu2slnA+YPCSUZ+0f+HLtd2x+wyOFqCMbUVk3REJvEpz8P+QdpxpMu4L/Elg?=
 =?us-ascii?Q?qLdypelsg9UC8eJxPaOqveChGGxAvKJRX2tHkH2UOpD08zWA9VMCXQ3wjjPT?=
 =?us-ascii?Q?ooutgM59VsRLj327p1fbV0BJiBwDHP1cPuRICrdC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3551e71-52da-4b31-d8c4-08dc72f63779
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 02:41:39.7536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WIJMxsd+L8XqiYID61Z414u8IoBGMG7VoLJH4PFZhMwOrVbSpbRk6KLqFHAI9ugwSSIiGfjlgg4rF2MUdK5yVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 02:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199223

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.1.rc=
2. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	3. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	4. Meteor Lake-P (14th Generation Intel(r) Core(tm) Processors)
	5. Beaglebone
=20
=20
ETA for completion Thursday, 16 May 2024.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Friday, May 10, 2024 1:45 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.0.1.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.0.1.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.1.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6892
>=20
>     Build hash information:
>=20
>     bitbake: 8f90d10f9efc9a32e13f6bd031992aece79fe7cc
> meta-agl: 73b088ccfa385f91b8aa56c1d2fbf78d97447dfa
> meta-arm: 6d6fa14744b4e453eedb2c37891259b55557dcbf
> meta-aws: 3265343c2f2b22bd0a2a9a688fd20e6540d0d746
> meta-clang: e7dceb1c92caf7f21ef1d7b49c85328c30cffd90
> meta-intel: 52f5037453e797eca8784a410f7a2a55f40aef57
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: 5778e32eae201072c5dc37c9db67dc1848ffb9de
> meta-virtualization: e9bb0a338fdf637f7929e19b21857d4c1d532ce6
> oecore: 294a7dbe44f6b7c8d3a1de8c2cc182af37c4f916
> poky: 4b07a5316ed4b858863dfdb7cab63859d46d1810
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

