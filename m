Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0499AC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:32:32 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.6303.1646127151135999562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=D5cDiY5n;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646127151; x=1677663151;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=c3nO/4Y3/V5pGFLHB/2baI1RJ4cjNtytxMRPmlCCM6I=;
  b=D5cDiY5n5UyCr2tr3wJswKNe1kRkg9nDjGkOI/LGxywarmHnSeG13hgB
   txiKOQXB7dl/HgidcnUiq6CZXfhxqrDiGbQKckH0S9ld+TDzuUozTqKTM
   uVGW0kh8WzobZ6+bDbJhxYQvJ0+PXE9RLipRbDLLDX4vbSFVNqerAmh3S
   nZTquGKFkhqyiYOSRTdi29G5t5e8SSm+5gSupUUpTJ/ODGMJf9aXHDwAi
   UClpMqU84q/IO3FW6Mw4hKCylSM8MQco01YAOzTW65drZ36zTP1DnX+Mn
   J2xpy54V8Fo7o8DFHOqka14mwgnjmevD6xxDG7/ipsWVdf/X7dlDp8Plo
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="253025174"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400";
   d="scan'208";a="253025174"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 01:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400";
   d="scan'208";a="685661955"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP; 01 Mar 2022 01:32:28 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 01:32:22 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 01:32:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 01:32:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 01:32:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmHc6hgIiP3Or2i6rtx1oYvfrPj8SGkTlOVFHUgG5u421Kn39YsSf+jsBctdfbeqdY1M6dr2SqI8hdV3DMCv0gGcYo7jXwI4nzj19NExPySNrtvOb5JH66c2INa/ZpwhaPfRB3keaB8L8kJC+GycL1qHqfqshILa30qZ6IkmNNegPCMtixK9tHyJEmspKHYHVJbnrTbmte1mJ8eMAHy48PSnpMcJv5ZqvrUhX4WN7yMUF3xwK5mmECIeVg3wjGn/8e0veOk+WVOHGvLteCYsS92jF7GWRbpC6CFRrG7rw1UjLaCpWGuX+rdXOckBVfmPvd1REPW1nyjx/EFt7rqF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0p13BYNbJKejhZMVkvg3CBANQZ8tdwdS8oDM3lCMv2w=;
 b=G5T8G8d4p7CPhXCiweluXPxfV3Jl2oM2vGQYY2/MPE8e1sjqZGEw7dUERc184G0L1OgU5un42uEdMVRQy+CcL1l3d/cMvhY2ZuckRpN2e2ZBd9YNaF7AxbtTo2E21kLciZuL5y8I0lCCPETibzSGYlQLGVvD5nFce/O+ow15chhrd1dFQ7gm9dgujPsem5LO1ET0L9/UYh49AqIk+po1GMbbEKy5E/J1w4Kj5kml+KhZkjDifDfwW2qb/LyoLimGkGoDX8kp/U0kKAQ2fm933mGaFvEOIb+nIIsBROff1mTNbtLhpmmDGPgxP7GNsYU79aXs6PnNoHWY3Tk1mpCzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com (2603:10b6:3:a6::21)
 by BN6PR11MB1540.namprd11.prod.outlook.com (2603:10b6:405:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Tue, 1 Mar
 2022 09:32:19 +0000
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::d8bf:725a:9d0c:2260]) by DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::d8bf:725a:9d0c:2260%9]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 09:32:19 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: Konrad Weihmann <kweihmann@outlook.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] pip_install_wheel: improve wheel handling
Thread-Topic: [OE-core] [PATCH] pip_install_wheel: improve wheel handling
Thread-Index: AQHYLUGMCoNIh9wNjE2SNTUG4v4KfKyqQodg
Date: Tue, 1 Mar 2022 09:32:19 +0000
Message-ID: 
 <DM5PR1101MB236143C46FFE2DE38DEDF521B9029@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: 
 <AS8PR09MB4645B9D742E68820D384DA6DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AS8PR09MB4645B9D742E68820D384DA6DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f93d4fbc-4dce-47c4-1796-08d9fb6661e6
x-ms-traffictypediagnostic: BN6PR11MB1540:EE_
x-microsoft-antispam-prvs: 
 <BN6PR11MB1540F31350E209B26D7D6F0EB9029@BN6PR11MB1540.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 07qDD9ZjZhvhI39Cq8bwPkOxh0ZsQxeFN4xkbGkLoOtDNyTnkYf4RMMORpwzKGd4tqRkpZbk7/X5L+aUF/QamnfNw/TB1Ou27j8AAuw+zsWA0qMrqq1qFhmyT3MP5KxI8Az/YtEoZ6++21QFfLJA+34aenb1cOIr+DvWcVZbH0Mzbw/+alB39pm1YodzQWktLV0IuYkCi6htW71ZF5siKBIYQvlswe50nF6e28fWBAlURBu99tgueLN9ARZWHdCg6Na5b/qVM2vcB3i6Q/vMhJENQee8W4FHJA2kbcf28eDbnTC94y1QvlbKLYt8mOVzBgNiDULBiokFRWSy0E92OMxX1FtxpGp7on/lv0Be2L+xRPnTenIGnwlMilySln7BNN2S4KpBCcB1s8s1PiTDw40e1oEb5UmoiFU8wHfvSamwP+wECFCoSw5PAHRM1v9UW773d8smIYON/RqLxzGdekl5JxGVz4OchQoHRncktT1Fo8CS8KC22aaVtPA8lMriXrNeiltew9svmNWGlfzOI2ekpooz6kW68R1aR7EOVdp3J6Jrm4sGAOLJOsg8OxMMt1R9sFELQhHNWaL39yw85BO9ssDDysiv58IFJE2RscjJcfpzyUBcnhhz3XHfDCEhCsjtKuBvprkU2iEXvaazo6NTDo8okm2tO/W9aoOVybj7p7+bnxZ2QAVzD502aUuXwZYkhMTdhjgaesloZXvdXkGjT2RoEiq8NduUxHT9+Hwvl+aAYcoa1m1moIipWOEtVVTmyluPNv75EblcZpgpYduuWqAMJpPcGM+tIfOeoHW7rkFOZJFUHi+HOuEXR0hEWmOARmXXBoD/LEHp6xot8w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(122000001)(82960400001)(38100700002)(5660300002)(9686003)(7696005)(2906002)(6506007)(53546011)(186003)(83380400001)(33656002)(55016003)(71200400001)(316002)(8936002)(110136005)(8676002)(52536014)(966005)(64756008)(66556008)(66446008)(66476007)(508600001)(66946007)(76116006)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?n3ekDwnGCJXCITmaOZjvCAS4fB5Qzm8AOq+RwGvJG+r8cPWFS5hp+pHFKD5l?=
 =?us-ascii?Q?quHYhrzKmeXZdZWXQKUle5p9EfsEP6GIzCI3pM4QwRc/0xWGz4Z7P5qsEM/+?=
 =?us-ascii?Q?Ew6rLwJa8TRx6XkJaOSOgWGKJSAtOZNH8ek/lG96aVER9tGfUdIWw63TQ+ux?=
 =?us-ascii?Q?I3wi13zjclP9gP95b5AeDQrS9cNvzzcbgP8haVXdtVTU6TNpFyjs7YiownDQ?=
 =?us-ascii?Q?BPwSjLh+Q9cAvs8nIY+Y06ZLkkP7M9HiRot31fKO8nWQg7SbvW5QPGutU+hC?=
 =?us-ascii?Q?e7vvXpEH4tfiPi5ZmLW4xkh41gnQqHQepbbCekH64aSSWPme4b4gBwPNeUBT?=
 =?us-ascii?Q?r8CW9Icxa0n26eJRL/A7WSjXunW3ryMqr1YkX885B6lT+DflzMUi1/v2YcSK?=
 =?us-ascii?Q?ReASzAUcO464TmPtbus82os/iYYeYMFPgUXATXhuTSYpi8m9PIBAvhFsAFMC?=
 =?us-ascii?Q?zXak1ydDVsTLEoIt3oPej/3NYwYhMT6eQUtT0uSuL8C1oUL5Q3QIKU4VATSz?=
 =?us-ascii?Q?pQD945H70zzcjOhHvpUHA4gAlN9KVo8WyDIKwk1sl3U4+MnZjp+ffWugjolo?=
 =?us-ascii?Q?zrHlv6QFRVtcadLLytSWK/Aj36lLg1OBRk+mI9iLrhj4x/jTWYJfp3EeEGhZ?=
 =?us-ascii?Q?pZWAJ9R2HlXJLsSIow+7AyTTTJZp0wGD3MCFzghZ1EPzWdMkenB9DdC4QNmc?=
 =?us-ascii?Q?rnkgY1SfPn/vGhpTSp58eFcB/NvH2mTUdqyjJCxwtdDBqiKTtgvXXIeNfy5S?=
 =?us-ascii?Q?R5ed3AY/eBN9kap8kZd6Uka75AJPs9mYG9aEcfs5h1nfNLYgt4Tto0hVnCRY?=
 =?us-ascii?Q?tQOprAnCqqs5gRTAj/BcJSPfNZdJ/LAesSyXAP6JrKTSoGhJcv1FOmwtEDga?=
 =?us-ascii?Q?WZ/2qnj517i4vZGiab3l6CGV+hrsiU0hlQ7m2xrOvZ9EMUIsL/6FhfTvgUVy?=
 =?us-ascii?Q?tqT9Tj0gHV9SLqsVy9BoOvxTzNIQcRY0kH832p4dldLUme19L8BouBliqebB?=
 =?us-ascii?Q?Ov+Hvsh0xBkuI866m5iKGu7E0qIP2+287wjDYW3QY3bBo/rn4kidpGTmK+s7?=
 =?us-ascii?Q?yCWN/YGRa/OCullU7olwgxV3q7m6w6EVWqaT1s8NhoXcp+ZZrx7F31OichR8?=
 =?us-ascii?Q?5SBpf/6AQDcDTTbWCplVEeFGAQ56w48+z/JAwQ3SnwZP/uRPj9MLt++SBJIu?=
 =?us-ascii?Q?c1gTp88HUgS0wCgI7NeR/czRlFdt3Yf7AB10JLqV1vIq+dxgkE5HTV3Y+SwX?=
 =?us-ascii?Q?XsqQWKESnRxoaAj7bYV9iybyOEuGS3jhX8UDu2r30nO4IUr0VkeqnrcKYq1v?=
 =?us-ascii?Q?mzmQe+zdWcX+o/X+xR5qOF0DGLoJkbug1jY0uxjTLKru/RNfDU/U+T7rw8lQ?=
 =?us-ascii?Q?PQs2U4p9J+pmgsmVvAV8NYy/keUTxOUJFZbA1H9VGKUFUT7cb4IGOAilUmzD?=
 =?us-ascii?Q?xDvffTxDiMF2r82m3hf8KwpAbjTxh8LtAyMeCQIA6Qqm0trOiSNZeTKyk9Nq?=
 =?us-ascii?Q?WRyHJbkoTqZAhqZ1HWsbLNHV5Yr9mWx8WIT8HNWGd7L7B3ZjwslYOI+XC8wx?=
 =?us-ascii?Q?FdwOgLuvKEO/OtwUlg1H3yK5bfOJslF+x9Y8CFkxd0x38oUqpvhoBQ7sOF26?=
 =?us-ascii?Q?dR1mXGPRRR1S6BvQNOo1eqE1h3AvBKMB1H63Br/lsWYOAV9vGK88ZfttCuZ3?=
 =?us-ascii?Q?W9nwIw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f93d4fbc-4dce-47c4-1796-08d9fb6661e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 09:32:19.4997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 lCuSGavQxX25mTtZKKHSiAtNn6N9+ext1x8H88zZ008Mart02BdfHtOvf32c9cnZz0CJTof+/pGgr4tp3Gly+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1540
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 09:32:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162537

Hi=20

look like this is causing some build error:=20
https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4816/step=
s/12/logs/stdio


> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Konrad Weihmann
> Sent: Tuesday, 1 March, 2022 3:54 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Konrad Weihmann <kweihmann@outlook.com>
> Subject: [OE-core] [PATCH] pip_install_wheel: improve wheel handling
>=20
> - replace python3 prefix when guessing the wheel name
>   as there are still plenty of recipes out there that do use
>   python3 prefixes
> - remove all previously generated wheels matching the glob
>   to avoid installing any outdated blob
> - don't use PV in glob, as PV doesn't necessarily align with the
>   version used inside of the setuptools configuration.
>   this will avoid having the user set PYPA_WHEEL in a lot
>   of recipes
> - respect SETUPTOOLS_SETUP_PATH in PIP_INSTALL_DIST_PATH
>   and use B as a fallback only (in case this class is inherited
>   without setuptools3 class being there as well).
>   recipes like python3-smbus run in a subfolder of the
>   workspace and were failing in before this adjustment
>=20
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/classes/pip_install_wheel.bbclass | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/pip_install_wheel.bbclass
> b/meta/classes/pip_install_wheel.bbclass
> index 5b7e5cd706..e1fc25cbeb 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -1,12 +1,13 @@
>  DEPENDS:append =3D " python3-pip-native"
>=20
>  def guess_pip_install_package_name(d):
> +    import re
>      '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
> -    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-', '_=
')
> +    return (d.getVar('PYPI_PACKAGE') or re.sub(r"^python-3", "",
> d.getVar('BPN')).replace('-', '_'))
>=20
>  PIP_INSTALL_PACKAGE ?=3D "${@guess_pip_install_package_name(d)}"
> -PIP_INSTALL_DIST_PATH ?=3D "${B}/dist"
> -PYPA_WHEEL ??=3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-
> ${PV}-*.whl"
> +PIP_INSTALL_DIST_PATH ?=3D "${@d.getVar('SETUPTOOLS_SETUP_PATH') or
> d.getVar('B')}/dist"
> +PYPA_WHEEL ??=3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-
> *.whl"
>=20
>  PIP_INSTALL_ARGS ?=3D "\
>      -vvvv \
> @@ -28,6 +29,8 @@ PIP_INSTALL_PYTHON =3D "python3"
>  PIP_INSTALL_PYTHON:class-native =3D "nativepython3"
>=20
>  pip_install_wheel_do_install () {
> +    # cleanup previously generated files
> +    rm -f ${PYPA_WHEEL}
>      nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
>      bbfatal_log "Failed to pip install wheel. Check the logs."
>=20
> --
> 2.25.1


