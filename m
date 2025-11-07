Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79FDCCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 08:29:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6972.1762504191228892319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 00:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=fT86358J;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762504191; x=1794040191;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=D1uhGeNwAdLHqWwUSSNEwz9ORSUXOwDtdeQAc33cszE=;
  b=fT86358JU1JqjiL1wXjgJXtWwxAjI2BCPzlhewO+ADBTuvAJEVsQJzB8
   aP3t1XR6FftZWD5uoU1cdv5tVuLoJQKeioTXXfA39mala38AJzQT9ws/k
   pmc1rC+Y04YgzggZeIsq17aNWUiqJgmaJY2oho6gPodnckWEkAtf3ufXk
   yoaYLXUfl1J/9/B7OG30zkQUbSuwhbD6AEvCBZn+jk/CdAh2ZlPhBU8Vf
   RQRZmZE2XY0vF4zRPGbWUJrvEVU0FqpdyZUEqBgSKz9CMBjgEZJlVVuV9
   75LXUdBoxKaaYAZaHDWwsqA4uKlyBZjmryznfODvmGuulRgATdZkODg9D
   A==;
X-CSE-ConnectionGUID: wgoY5WhMSDW5bMf9BP+Olg==
X-CSE-MsgGUID: dIbWyqSiTHywm/9z8Kmhpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="87283096"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="87283096"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 00:29:51 -0800
X-CSE-ConnectionGUID: jhHDqNFuTUSMeVSvscAWdQ==
X-CSE-MsgGUID: YqwNJNS6TbaiUQgAAMexrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="188148297"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 00:29:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 00:29:50 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 00:29:50 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 00:29:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1cQBo1zViGmniP0jehlmGL9YKbI/wvo229guMx/2LerCuRGxI0nExxSBWWCo3XsN0C0j9Yl5JFXDJl8ENFkKFIjjccayC/gErRXdJothdmWlktXZUAFixL88HEXFOqPe1ukr1OhQn5IAanz403nUiCecx95AJC1LdbfUn5begaQwRdP1O/vH5rUDhd8HP0KIFp9x+vwPqoneRrXj8eICbnV8p0+Xorm0xh+1wGSM9GbIqtk61NRxpGtXX88INwUtgbeil1ycx7fb3KwOE9MHG8V8fkymOE5OuefSKXZO8PRowqSthGlFAIcStHUxQB00RGUaFmHyi0Wfn7r5d+aJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYN239K3gTlsOe5RoqiV0N8ZzVztS3OBnCE8+weeoHE=;
 b=rJPBt1rfL14LLjlUZgraXL6vNh8cO2BSDQUWQf+XvPG9zpP4aXEqUWNVQ+LdhRzv6VqAJAXpri9hJ7MH0eNSZ27kuGYanWLDGxviP8O/0ruH3Eu7iPBXLeIHRjdEGVvfud372oGTsaxkr+M9kOScNS+dHpFvK2A6Z1PMnlC0tpja1k0GSuW4BkHXYcgdlYYsDdOhJT9avtJL85/JdYlNDu8c1LVzM8nelrabpnAux0EfIz5R3OlGl2XmSpd4A/M/qOlv5GpS+fL0DVjtYOfx6esm64CA+8dINI3TT5d2NAjTXZP2d6t0/DQvb0DpHwB9ERhiLn+YHyCtLrU5rZxkCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 08:29:42 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 08:29:41 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.31.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.31.rc1)
Thread-Index: AQHcSoc+NxWXxGWeFEapUX7gQt1hU7Tm655w
Date: Fri, 7 Nov 2025 08:29:41 +0000
Message-ID: <SN7PR11MB70184D67B024D56CA091392DF4C3A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019a3b325e7c-4b25475b-ccce-4d55-8949-2fb05e38aa95-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019a3b325e7c-4b25475b-ccce-4d55-8949-2fb05e38aa95-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SA1PR11MB7700:EE_
x-ms-office365-filtering-correlation-id: 726097f5-251a-4502-a54e-08de1dd7cc7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700021|13003099007|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?DoHLy0GyBtE0jXOgNADnwBho/R4VwTNpLJFQoiVOo7UyHv6uBJy2HHeE2Vic?=
 =?us-ascii?Q?XpQrRNmT0VpbTT4AqfVIdTAFP5nOfFiWR9oxdcy/jP7LrR6gonqKcYNkTfeL?=
 =?us-ascii?Q?WAOK95fstWtPqoV/nedaPOhzeENexv9pmv5ToqBhKQ9/r/xMTXfPYcanNur/?=
 =?us-ascii?Q?Fij4M43EMpXnPN4k3WYDlu4CAPFrdBGgAVOPjierGl1IIsO7J74rooI6b0Rd?=
 =?us-ascii?Q?Z64fLdgjxcnK+ijoL3J6rAO73zIM2bJu+HLgMOXFhVWbVX5LJpcHNECEEsVN?=
 =?us-ascii?Q?13ZoPMpsHmRabrUdwNPhvSwrDCr8OXKS4tlH4WTUIkvejZH8LN5bIOlpj1YA?=
 =?us-ascii?Q?8S98fH026wMH89UYg/bM8ee51I7qfzpsEMdDXQOJc1uib3RtE3mxu2Ma5XFr?=
 =?us-ascii?Q?Pc4v3O6PSYr3oATMsYYbIGf9TH8i5VhJROIflogFGJ5crHG2EIIenl20nLTm?=
 =?us-ascii?Q?3Qj4Cz1WA7lwqhvcljxTuMG3VRNj1sQLTM94LbWJlRa0GpnkSHtPRodqAf75?=
 =?us-ascii?Q?6wO7qgXgXZ/bR845DfNLHZbqMneafyy1BttSY+Vv1Y7DuX8MmorqgnEBpW83?=
 =?us-ascii?Q?ZtDD+DHiAYuxCji1XRRMOcJfTHFatu5vEqmJnyDP6fYg8VrRUYI31c3ADtH9?=
 =?us-ascii?Q?GdUX/EXPbfbJq9ED+hmfhEkobgoyaHWd0tN8qoul13Yjceji6wGjwMX4zMHC?=
 =?us-ascii?Q?7iXrOkWDfIzpipuVdhnlU5u1FYWxzG1Ui35K706/hX1zDapNSNj1eEj8kBIh?=
 =?us-ascii?Q?M+4UMMd70o88JniyHr9Tmq4rLPahtVBtwr7ttrMs+XwWXoMx+4bK80QdsMr+?=
 =?us-ascii?Q?rKYkhmtGYshMTjhG7lR1kfM9/EP1eJlfSDYW5ugW7FurUIS6v2PEHj8U/HlF?=
 =?us-ascii?Q?ijpkSTGKDCydvoJoFKVUBLwHtADP7mtGWtCaGXIUp0hbcpLQsOY/+yzGBcBj?=
 =?us-ascii?Q?xifF7anc+tW2urZuVgnhmHT1IG8vBVkCFNFyRV0skP0x9z9f68eHX17e3yMW?=
 =?us-ascii?Q?3VFMWwg/eYjQxMJ6/0b8JYf92//9aUAXBnVFcuBWQHhAu+tOtO+oJSDv0HEo?=
 =?us-ascii?Q?Yj4JqYyJc/f6AJf0TspIrvigz1ixWs64ciJWOcgUKNC8gx6WsourOGcdxHpQ?=
 =?us-ascii?Q?Q/9PY75HcMjFnzAYSghEMVnElEztt2IlV/yrwL4UOgAoInu7BSnOQl+2vXpb?=
 =?us-ascii?Q?21HiumwgSNN42c/zrC/Q+NY2ehpDKDhccIJAEWU7phDVI7l8DmU2tI0MPR2u?=
 =?us-ascii?Q?w78m+WdxNPncHpXV2UNyGhh+xvMHvGs5DrZb/ShDITdT4XP3MtkH81o1NfwD?=
 =?us-ascii?Q?x0Co761UCE3iKCfo11n9nUQUUFLjZ4fc26sp+6Kjq8WFaFQ1ltKd+a4cclHw?=
 =?us-ascii?Q?cB12z/KqCFhFB54xUv6QQ7ucibeMzkJuqsNpHPucwD/k5GXAK19f94M5Osab?=
 =?us-ascii?Q?xrW7DfnxsS4xxbLN+Ojo0KMzvPXSlfmVlX8NaZ/3KC2oxAX1x0Yq5g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700021)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IsBmdL62dKYXVgIdffBed2qoJNCm5EmbhdwwoYxAVIC2EMUVxldvEIh8MQYW?=
 =?us-ascii?Q?6WUejNOf++CFxVTijFi4OeDSimjBDqQxbY4Lc+jUmkIVGR1TXiYz0oNIRkt9?=
 =?us-ascii?Q?PbyZxfDih7OfgJaVEO8U3N2n/YzMqFLM/SeCC07bl4fI+AqgdDomslZFNF/i?=
 =?us-ascii?Q?uylT4Hx8R4uvz91ork2exM4nBWHsdN+/CihbgOlciOOZ1qN8NjJLcebdSC14?=
 =?us-ascii?Q?R52M+MGAxCeoVpbGgvw3PqKY9pvuSmH3Y57dJqY7Q1eEMKvNpWCeT7IBUmfi?=
 =?us-ascii?Q?icWZunuu0x4LZvKO0TshdxwRck4Dq5ZIw9lZoC/Xc7lzS0iGM5lQ7Gsdtxqq?=
 =?us-ascii?Q?4jYjShJ8ZB4ArdpTVE+bMh3uPUmrF3tJp+m7IgDmhB2JShR971+AscP750SD?=
 =?us-ascii?Q?xYEM3ZMNurKNT+Yt9uAQB5h+fqmojW22ixIhh/6uj5cYLtuC6zUT625Y6fWW?=
 =?us-ascii?Q?jTDYJE6/SRwGutnzSjXyjWC+PYGOQEKNHx41omIGE8Lh9lDIusvi8H5/kFSz?=
 =?us-ascii?Q?onBabwBOPYhrCowXuOlRvlDLjPoHOAapGJNV/ahxE4mOnvw1tPc42FjRIzPg?=
 =?us-ascii?Q?/oaBwnZcOwq9oCz7jCgqKZzZqUARxKptqW71VWiHiF1yDMutJUKUrG0brQMj?=
 =?us-ascii?Q?0+NbPpgTtpFRkfLCbzT15fofT1uhTykxGtCjlIHCMJ5XOwTPoVb98k3H+Xxe?=
 =?us-ascii?Q?Bu+EeBYVqE3DYf8Yse2nkqKh9mNxEL+11avjbXUh1aRIQ9pgyd4t1IUrcQ28?=
 =?us-ascii?Q?1qikL8YsOH4l7sjod9OjaNf3MGTfYZX1JyGIqOCbx51JhBGX6w6V09WB4NOn?=
 =?us-ascii?Q?wXmiK+AYQ+MxiWzHc+Abi7cPbIkUvLlMYMY5JKAWCSG1Tmcp4eMYRBTPNRzQ?=
 =?us-ascii?Q?Mn6zCCMRjwWMaoDQ6mRwxNM/dfWLheH67lj61DFFeqZC9WcdDlte+CXq1DDS?=
 =?us-ascii?Q?c83MI1VVETv5PdZONxwM74VRONgZUDITJnxzPD9Sz6qIruxXuAZBnKIByhBk?=
 =?us-ascii?Q?r5Byv2pDxscZ+xu4C9+pBjDU+8BJbL1gv8MZnAspbG/pXhHcdidqpLR7NVyB?=
 =?us-ascii?Q?iMNLS67Ipd+a0ahNs+1oWpgcP1RzxkbLT2yhFZjz1CbWHSSrbKFOB6lYX1+5?=
 =?us-ascii?Q?99rkGWb9kBJKCou19lKt3qhMZIeENAlrdGyk1tx2maPEPSgcClB80Jt0yaEe?=
 =?us-ascii?Q?oeMDXXIBLZSZfaHpvMbWvBD1vGbyjd8JDosAEEIaBlBG9+CemZOdK4lElMPG?=
 =?us-ascii?Q?Zq2JGbLoD00iNjjnslnJYYm9wW4vu6GONMAvwBybt+fkNoIUlLxqMBNr1eSO?=
 =?us-ascii?Q?1NLyd43Ap33AXMd2YxsHLx9ahJGneT57nKGMc1E+oGo4zOhZgM045eaZXwd1?=
 =?us-ascii?Q?B844H1mukv5EHuKcu7CYfxQ43xqIvEnnodT7G+NOt9UqZ1nbshnrFjye9fhG?=
 =?us-ascii?Q?lgLB8LIY4pj4/a0/YiByCnkYTtoojAOySA+6dxVQWHUgmxOur0kvJBqJW9W8?=
 =?us-ascii?Q?XN5iVpfNp20eBsYl+ZaCcVf4hgxnz3Xa82eFSTyqyRsFdr3jDAhTo2c0N5w2?=
 =?us-ascii?Q?VULNKrZt9kYPPb6g/kF0Clxkec48Q/Lng8d0lFXT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726097f5-251a-4502-a54e-08de1dd7cc7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 08:29:41.9022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFv9qk3yL6FeAQrVU0c11AxsPxtQbccIhmUb3VgjrnW8xfrCeQhe0OM0eRELtv809EmqWI28qhtuRioM+kAbPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 08:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226022

Hi All,


QA for yocto-4.0.31.rc1 is completed. This is the full report for this rele=
ase:=20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults



=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
This is the full report for yocto-4.0.31.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

No new issues found.



Thanks,
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



