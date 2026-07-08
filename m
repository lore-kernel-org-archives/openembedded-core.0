Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49606C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 06:23:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2703.1783491811549440582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 23:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MbtbldeI;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783491811; x=1815027811;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=Kc/CIj+cn9h+ZdeV601hItqJafnJQs6kAd67kwc13tw=;
  b=MbtbldeIpQRJGPYH9yBZGBuzbRtsZcd6acgFGlwZrjxBsfEkbKdzRHa+
   ehxQSvh76Ra1iIbjpfXS2G1yDACCFw7UB3LbPQxhI/TbHa9eJP5qGk4GB
   rRz1Ml4LbobW6Gn2EL0vyslsGnYoUVTtLetMbwTb6hKhSlnopBGvMhn5Z
   plMNRt/rhHjwBSLwLtDsfwtq57jVgQQGnY1TpcG1NMV2DI6Cd0M0zYlAy
   BcYfhJ9UnbjiEOIS72lBTFCZbiLZhzuJUt0FwwHDbdQw8IX3XU6p2g/Uv
   Hd/KdFgPtuQG9DZ+hv9LjgBDgkAyEOW+JLGXHC2CjCxMc+2jzibvFupE8
   A==;
X-CSE-ConnectionGUID: jlrvdx5wTgqkko5Sp7AX9A==
X-CSE-MsgGUID: nuedj6NsR2iLVQ5Nl5H2LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95303120"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208,217";a="95303120"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 23:23:26 -0700
X-CSE-ConnectionGUID: a8l2TUvaRZy0PYTLQomv+g==
X-CSE-MsgGUID: W99THYgMQWuEzqFCdbEb/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208,217";a="251535676"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 23:23:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 23:23:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 23:23:26 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 23:23:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLM3w0H1azDT/ht0rg2dTUTpyHOydOj8+RngV8ASUGULKaz6++QCYflhe8kXjFjVYfyU2UL2ROpQn1K3MWakYVEodyhN2Ndqb4PteEvUYu/ZoUjMtipSQxTEVO9OFdMvrMJaeDrctgn6GCqxsR0BYOSyXby7oOSrDZAlB/AqOQAVt7osz2KEhsFYgh4yIz+2hVHS635hj5Xtpgs5pVA1Q0crstyq1B2Re0AUJEdyPx8iYT4d2ghif1oWhFkQNFhi2XIvBJKkDl6OjdAtN+YnAtOBGx0e0/9woA4DYarjMwHzyFpJphbm0O4rNp0ZVEIKrLCPnSKTyEOSyoUCj9MiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOu7qn9RbHmy45XoFXswJLb3NFUdsMoYghp1Gd/4kXY=;
 b=u9BpcesP6rY3ISnwBtIQyfc6oH8aoNBlh5nT04Nu08Qk5b7XzX7ufCcQOOF24v4kOqOxg7UiRwtCQYdVu4Gj0R987kVOYLmzdlS3YTZrbPue0aYy3ZvyXKE80MgNc5wgIc04rfQXhKZGGMylAMa5e3mtgDXNda5sTpmpdrJudwX5URzDsVCVbfdsQW9kCAdJ1o8Uxgg0j9QvEGBCAlCU1RMUqXPd0mptWw/b4HscbsjKgaidhYYt1CMnpS8ysqqPszkF2r6Bs3ftxIFv3GA8ogfh/32BfiPFFo7MKp1NTNJZIE3om+nUp/80p96SfLAvduRQDQDmdsidcFC9/Nv/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by LV4PR11MB9466.namprd11.prod.outlook.com (2603:10b6:408:2e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 06:23:21 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::f91f:4301:96d7:1925]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::f91f:4301:96d7:1925%3]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 06:23:21 +0000
From: "Tyagi, Yogesh" <yogesh.tyagi@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Tyagi, Yogesh"
	<yogesh.tyagi@intel.com>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] bindgen-cli: set CLANG_PATH in native wrapper
 to native clang
Thread-Topic: [OE-core] [PATCH] bindgen-cli: set CLANG_PATH in native wrapper
 to native clang
Thread-Index: AQHdCMLKChjtB3HXekWTgHiCNS3/77ZjMklS
Date: Wed, 8 Jul 2026 06:23:21 +0000
Message-ID: <IA3PR11MB8987C1C0E2E3EE2194D015088CFF2@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <18BDF101D1878987.114350@lists.openembedded.org>
In-Reply-To: <18BDF101D1878987.114350@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|LV4PR11MB9466:EE_
x-ms-office365-filtering-correlation-id: 43b7233a-354a-43be-18e5-08dedcb96876
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|56012099006|6133799003|18002099003|22082099003|8096899003|38070700021;
x-microsoft-antispam-message-info: i19X/EqF6NZiWI0NbYufVynrNxEF7CeWheUqyw2qaO6zKAlKofUT6r1f3sPH/4K+jcVjyrBYC9RmRTTJS0MpA2tI64/a0zUxVQaDSyQkmE3L36AVEsl02Y0BaNx1StscQrr6wMPc4UgCIySxCBX4pjDc20IbgiLty+5LCIdhPpNt8DkYU510maAE0/tAmGNLqA4RJlhzMXM/ktSpTIj35AvKoN4PlruFTRGHO9zLoKGM0okrkJ1DGYfCD4eRLFQTPxDGHedUIWD9O2+yHoHlo+SP4yfWRB6vjFwmZjC2QEqym59pxKsq5QDizEuNPLssN1qdTSyanR7PKFWOfyiY1T5L8OdX2nW2dZrJ2Fa5jJFKCw0yjpksS2TzxJd7xnU/s3kSJiwDAetY2rt1yUxrtyB3wonASY88jLh8MgQ9TOni7qRSAN67iWQcOVBRe/TvDirNXklWfaLIBYujwdUtMM8BcXLP+XViHH2tyo8ip58mQemVNpFBc54LPu9NOqkmz3O8qQDZEilgmOPgbndBTpZb+UwCdcskRifsjwZmZW9NNDY0K5ywcolgEq56X9q9zFQdN4YdhVrbHx5/38HNtDYsNCSrxw/P0CdeDhBsu/PpFkW7+5KET60eWyyRWprWm58QrFuyFRdKmtm7VKEIgnsgDwxQeg4MPz3jb3SFqpY+U6vnnAHo8mYKHSWdAqaibD0MK4d25zZPs5NGvN5MSGoyjDEX9tINhEOdV4Bcgbc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8987.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CmJwImstd9322K6fxhf9mtIIsVoY+24FMPPkpnoj9QIbkUSqxK7/s8FXG4?=
 =?iso-8859-1?Q?Xzrz19K+MqpjC9QHZrogtxlvC/liUSGXvjjnpi6bki33y9zQhG1FEF6xU4?=
 =?iso-8859-1?Q?Plp/5OScgE986KCJVsv/SFMHrenYeaMidf/l6WbYYF5t995rWWYkbpofr7?=
 =?iso-8859-1?Q?ykbtdGjP+KGu3wgk0hSA722uv9ZXgADkDl6F/KEoZIX4V4BeUa5O8UXbjx?=
 =?iso-8859-1?Q?duLiO+zpELJGI51r1I5ytqw4ZPwb2zmTHoP0aHrRSoQYYMi0aeo7RWD+u/?=
 =?iso-8859-1?Q?QtOGbT7Fiq0by/dVCn1kz3SZTfwTg+lTW+T2or0dWCVoNJhxN6GJBRsie6?=
 =?iso-8859-1?Q?p9P5hVCmJPebclvMpwh54ofUtvNtFvZj2zbyW1UPLqfJxAHMyiR2MHVh0F?=
 =?iso-8859-1?Q?cskP+uplnhbSG/dIDDgEwJ1MpxTa7LUD3JfUc9pitx6m2N+inT3PEpUtyv?=
 =?iso-8859-1?Q?asFZN4bdLFznnNwbp7rxR8st6xRBae/GvG+rkx3Uj7J2ciEi30oR8EMpBk?=
 =?iso-8859-1?Q?bCQeof4MiTUfiF3UN3zYM1irE7xBrQbiWK/HncCXUXHWBFZYmCDh7Phs7D?=
 =?iso-8859-1?Q?xQz2mt5BJBMp0d2vQtmJ+ayaaR38q9ejhyJPcxH+6CwLfZWbcu1iTq2gD3?=
 =?iso-8859-1?Q?N3iuglyl8Hoby5RtdDO9MGohoY77d3UEkz+TTgwEl8m2N6eFvqbWfHRvZY?=
 =?iso-8859-1?Q?WtAR9S+MfpHsh6AYmoakUolNdPnwztPd7bUz/RcXgV+NnEJbYJtl2w6HVq?=
 =?iso-8859-1?Q?cbvh628HO17sLW9O3DTyuezysWXzXo/9Of8RTi4bhzbJeYAcaClYF6mZ4x?=
 =?iso-8859-1?Q?BY6clnoT8zwcBy+3LR+ZzVCvZqpZ9hsL+f4iwQnHjzWlXBg7Q+oQFwa5JY?=
 =?iso-8859-1?Q?EV64u18WfpEwM8t98qVAU4FykDkNuapn5Ivkr8ZTfCzWj0/rakwtkCZUUy?=
 =?iso-8859-1?Q?PQ6GeIiGQdokzx8BwfYYR5kDN70/R3Cc/5b5MsR9jKOAfVztmMfi/tpTcg?=
 =?iso-8859-1?Q?3ZzduV/XrU/Fdap4Q3dQwIzRRjgikUmpHPhApb9MdyDNhd9+r4xP+0FQnG?=
 =?iso-8859-1?Q?gEZWLh1yMvy1QhYmznXdPVo30k0xzK5j0PFhj+/rV1LSE1SzlDCevRYko1?=
 =?iso-8859-1?Q?MK2p/DLnrbjB+7t3zFppBUB3pxVSpLWGcGDmV0Qsz7k0PNeFubXHjsK87W?=
 =?iso-8859-1?Q?dROvNlRLiBBDlhh8jqQkDpVxK3cCYHay1Riud8uJdvtTWvodR5ocAo4jra?=
 =?iso-8859-1?Q?8i3Ouwbe6Sn8Ci0kT2K1FTsIgJhXRItGhXQGaWSVdpoYXNiB8ziPziZEPk?=
 =?iso-8859-1?Q?JV9Zl5Kqg9fO7CggbvAZaFNtQjSbz5KutcB8ukkuvAJKfiqH6Tj39qnLLM?=
 =?iso-8859-1?Q?wod5e9ZkF1+Bz1mIHz7l6NNxmM8rGxLUXw63ZRmQBPk8ujKE8j/yZFDbW5?=
 =?iso-8859-1?Q?RjPknXOx3HOj6LHoeCWshUp0kscTlxOdtW5H1TBo4pNtY+u+GwLI4JodeU?=
 =?iso-8859-1?Q?Ljv46lZzhpZIYb/wuo3JKkQeM0ECu0+djtDfcYnNHR1jXjYynLNGhaOdZS?=
 =?iso-8859-1?Q?9u7FbQkWUObZ5MB9ECWqoP+wuCHtzZykKbl6+VjiziLZR6Al4NYPOvWMDv?=
 =?iso-8859-1?Q?vyQmHxzJomcEy/8cSN8nXOzlzL87l+MyAG5quNBM9tnv4ai0C3y3qe3yTP?=
 =?iso-8859-1?Q?9XnUebH/xwh/U5rSiXjTFl3JQtHixgmMC4VAGgiNWvungdtEMD/cyalm/L?=
 =?iso-8859-1?Q?zkXRC/6xPrKAoBuhniWqNTl2pVeO2Yi7MkLS96NnRp7hpXl7vAT0jBb7EP?=
 =?iso-8859-1?Q?tyhjkXqltQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_IA3PR11MB8987C1C0E2E3EE2194D015088CFF2IA3PR11MB8987namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CNTHXbQEty98z4dUqItbYW+TUli8B7ZhhI/20ENAxm+qfeR9VrNka8Aq/WTNo6mFcexV9mF9jcyOROvgW4hz1Bjubkyk37uo8B0W7usfaSpRDpv8UOLwr5MafbZPUGCTowH83TXutYrlCFUWM0OgLB5i+Rm7BXSE88YJacyuN8EP8e3tqBUJvB5hT1oGWNKHGnbAmxnUWHvRGS83H83dYTDY9b+JGi9sDKHzR1QfVsNUc7w4zVYdz9vE+XAYaY/aR4AJN3NzRKZItpVhk2RAtGJtBbK8fDPxM6tyrXEpcOLam3FGll/MRgVTH2o7uCOVo2AY4lrOLbPlShfsAjM3oQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b7233a-354a-43be-18e5-08dedcb96876
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 06:23:21.2547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbL3lI8Phiof6hKqwkRfEmdRzbooEKeXn4E6f+cMJFewE+Q/4JsxwZGk3kBX5qQCKaHURVaRi4ZWcv9+N3FaxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9466
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 06:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240437

--_000_IA3PR11MB8987C1C0E2E3EE2194D015088CFF2IA3PR11MB8987namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I wanted to follow up on this patch. Could you please let me know whether i=
t looks suitable for merging, or if there are any changes you'd like me to =
make before it can be accepted?

Thanks,
Yogesh
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yogesh Tyagi via lists.openembedded.org <yogesh=
.tyagi=3Dintel.com@lists.openembedded.org>
Sent: Wednesday, July 1, 2026 12:30 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: raj.khem@gmail.com <raj.khem@gmail.com>
Subject: [OE-core] [PATCH] bindgen-cli: set CLANG_PATH in native wrapper to=
 native clang

From: Yogesh Tyagi <yogesh.tyagi@intel.com>

bindgen uses the clang-sys crate to locate a 'clang' executable for
querying default include paths. clang-sys's search order is CLANG_PATH,
then libclang's directory, then 'llvm-config --bindir', then PATH.

When clang is used as the toolchain, the crossscripts llvm-config wrapper
honours YOCTO_ALTERNATE_EXE_PATH and reports the target sysroot bindir.
clang-sys's 'llvm-config --bindir' step then resolves to a target clang
that cannot execute on the build host, so native bindgen fails with:

  could not run executable .../recipe-sysroot/usr/bin/clang-NN:
  No such file or directory (os error 2)

This is hit, for example, when building mesa with the rusticl/opencl
PACKAGECONFIG, whose do_compile runs the native bindgen against
rusticl_mesa_bindings.h.

Set CLANG_PATH to the native clang in the bindgen wrapper so clang-sys
uses the runnable host binary first, short-circuiting the llvm-config
lookup. The native wrapper already exports LIBCLANG_PATH the same way.

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 .../bindgen-cli/bindgen-cli_0.72.1.bb               | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta=
/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index 72dadfe52f..1e2b901aab 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -11,8 +11,19 @@ SRCREV =3D "d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f5"

 require ${BPN}-crates.inc

+# bindgen uses the clang-sys crate to locate a 'clang' executable for quer=
ying
+# default include paths. clang-sys's search order is: CLANG_PATH, libclang=
's dir,
+# 'llvm-config --bindir', then PATH. When clang is the toolchain, the cros=
sscripts
+# llvm-config wrapper honours YOCTO_ALTERNATE_EXE_PATH and reports the tar=
get
+# sysroot bindir, so clang-sys's 'llvm-config --bindir' step resolves to a=
 target
+# clang that cannot run on the build host (native bindgen then fails with
+# "could not run executable .../clang-NN: No such file or directory", e.g.=
 when
+# building mesa with the rusticl/opencl PACKAGECONFIG). Set CLANG_PATH to =
the
+# native clang so the runnable host binary is used first.
 do_install:append:class-native() {
-       create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH=3D"${STAGING_LI=
BDIR_NATIVE}"
+       create_wrapper ${D}/${bindir}/bindgen \
+               LIBCLANG_PATH=3D"${STAGING_LIBDIR_NATIVE}" \
+               CLANG_PATH=3D"${STAGING_BINDIR_NATIVE}/clang"
 }

 BBCLASSEXTEND =3D "native nativesdk"
--
2.43.0


--_000_IA3PR11MB8987C1C0E2E3EE2194D015088CFF2IA3PR11MB8987namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hello,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I wanted to follow up on this patch. Could you please let me know whether i=
t looks suitable for merging, or if there are any changes you'd like me to =
make before it can be accepted?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Yogesh</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0);"></span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded=
-core@lists.openembedded.org&gt; on behalf of Yogesh Tyagi via lists.openem=
bedded.org &lt;yogesh.tyagi=3Dintel.com@lists.openembedded.org&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, July 1, 2026 12:30 AM<br>
<b>To:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>Cc:</b>&nbsp;raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br>
<b>Subject:</b>&nbsp;[OE-core] [PATCH] bindgen-cli: set CLANG_PATH in nativ=
e wrapper to native clang
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">From: Yogesh Tyagi &lt;yogesh.tyagi@intel.c=
om&gt;<br>
<br>
bindgen uses the clang-sys crate to locate a 'clang' executable for<br>
querying default include paths. clang-sys's search order is CLANG_PATH,<br>
then libclang's directory, then 'llvm-config --bindir', then PATH.<br>
<br>
When clang is used as the toolchain, the crossscripts llvm-config wrapper<b=
r>
honours YOCTO_ALTERNATE_EXE_PATH and reports the target sysroot bindir.<br>
clang-sys's 'llvm-config --bindir' step then resolves to a target clang<br>
that cannot execute on the build host, so native bindgen fails with:<br>
<br>
&nbsp; could not run executable .../recipe-sysroot/usr/bin/clang-NN:<br>
&nbsp; No such file or directory (os error 2)<br>
<br>
This is hit, for example, when building mesa with the rusticl/opencl<br>
PACKAGECONFIG, whose do_compile runs the native bindgen against<br>
rusticl_mesa_bindings.h.<br>
<br>
Set CLANG_PATH to the native clang in the bindgen wrapper so clang-sys<br>
uses the runnable host binary first, short-circuiting the llvm-config<br>
lookup. The native wrapper already exports LIBCLANG_PATH the same way.<br>
<br>
Signed-off-by: Yogesh Tyagi &lt;yogesh.tyagi@intel.com&gt;<br>
---<br>
&nbsp;.../bindgen-cli/bindgen-cli_0.72.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 13 ++++++++++++-<br>
&nbsp;1 file changed, 12 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta=
/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb<br>
index 72dadfe52f..1e2b901aab 100644<br>
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb<br>
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb<br>
@@ -11,8 +11,19 @@ SRCREV =3D &quot;d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f=
5&quot;<br>
&nbsp;<br>
&nbsp;require ${BPN}-crates.inc<br>
&nbsp;<br>
+# bindgen uses the clang-sys crate to locate a 'clang' executable for quer=
ying<br>
+# default include paths. clang-sys's search order is: CLANG_PATH, libclang=
's dir,<br>
+# 'llvm-config --bindir', then PATH. When clang is the toolchain, the cros=
sscripts<br>
+# llvm-config wrapper honours YOCTO_ALTERNATE_EXE_PATH and reports the tar=
get<br>
+# sysroot bindir, so clang-sys's 'llvm-config --bindir' step resolves to a=
 target<br>
+# clang that cannot run on the build host (native bindgen then fails with<=
br>
+# &quot;could not run executable .../clang-NN: No such file or directory&q=
uot;, e.g. when<br>
+# building mesa with the rusticl/opencl PACKAGECONFIG). Set CLANG_PATH to =
the<br>
+# native clang so the runnable host binary is used first.<br>
&nbsp;do_install:append:class-native() {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_wrapper ${D}/${bindir}/bindgen=
 LIBCLANG_PATH=3D&quot;${STAGING_LIBDIR_NATIVE}&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_wrapper ${D}/${bindir}/bindgen=
 \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LIBCLANG_PATH=3D&quot;${STAGING_LIBDIR_NATIVE}&quot; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; CLANG_PATH=3D&quot;${STAGING_BINDIR_NATIVE}/clang&quot;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
--<br>
2.43.0<br>
<br>
</div>
</body>
</html>

--_000_IA3PR11MB8987C1C0E2E3EE2194D015088CFF2IA3PR11MB8987namp_--

