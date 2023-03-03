Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95541C678D4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 06:51:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.17710.1677826287436615254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 22:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=YDt8/R9W;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677826287; x=1709362287;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5ZJnq9Djstq2SDs60zSs53KuWmWVWTsengwYM8cXJbs=;
  b=YDt8/R9WVMyi9eMUS2mHQQXESvkail31s8e/h43IRVg3wwew12ACVoRR
   VAarYpynDX3JNqS+XfXfrltOtE+nEPSF7LNy/yEKlDDshv39XShihzosO
   3RzYU95cUSdgh6FKOyE1vG3Tlznvn2oANiGZWPjD4Mi+GKPFcum4ZS3Zp
   NBpfvyaRWDJoI50W3MhnrCTm03ILNr+I4P+00yGx7dtLYGQdOzfSm9gEk
   cuNs0gES7b6DRottE3YW/ZqJMsht6qhfCJSQVGUc1nvmxZZZvvAqX0HYj
   qc4S5UHb0TSP5mU522f1SpJoDXsizILVU6O5DHvVu6slsq45a2Rzna+Tg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="332451623"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="332451623"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 22:51:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739392614"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="739392614"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2023 22:51:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:51:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:51:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 22:51:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 22:51:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDVrUWDFVo9GkFq++clC7PSU3fnYaKcU84LZzz1VANAa5j4ATEIuzGrcJMlj9ilVqmWswXM8DYpDcfivXJbfB6vrxVrzTX/+c5qMLghgfc+dBrnRVKxMySWrEJ3HL2EoPuwiPhaVCTAvrXFooFiVPkk5q65O9tb7Fzrs1/GZuHgtxRE/3bns3RgX84uKOR4AgtKMivnQ4ajGZMMxaat6DCWsbm1DEXSm/JgCRLaxy83UKx8/qdLvzXK7Kd0lAvLrKvLQX2WAVPfBZ0+G79QNNEkGCNS0Ct8d14wgMzveOS0bRdXTMBLpXdNGcAY9l+53unicAEV2mg3wF2uRKxNOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyUae4QY9E2NcatdQc7bgH+FacxFkGWLV2ZWzHmTbI8=;
 b=azNoYxapGuTHxrgCoSdpu/e2ySLfFgaQSslPIntYp1YCFaTcop0rFuDSLYZtsHXybiQD3jRhlZ4hexelk+qraRzn6KfSJkEVsknSmOYye81OEYxE1OwCcD+H5KmfLUrXcuOCmg2frtxg3CZ0y1yeZcsfqmElTE/ZbndpYnuDkv/9dX9CiBDuscPQGkiJGvANfzC92dq41HLDXr3417nNm3Pd3akzEUOcxyURcgXM/IwT4g5E4TqxFIIXO2rfVlRBPb+c0NsHY5LOdGm5R9wX5rhMtVQLhwxMd7WnBt9KhxtjtGjzqBWF39tz+/KGNMQZZyeMTPQPFR0ZZ5pVci5LNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CY8PR11MB7729.namprd11.prod.outlook.com (2603:10b6:930:70::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 06:51:23 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931%2]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 06:51:23 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.2_M3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.2_M3.rc1)
Thread-Index: AQHZSgQZSxXhWlgkfkmu8uUs4GDl3a7opLFw
Date: Fri, 3 Mar 2023 06:51:22 +0000
Message-ID: <BY5PR11MB4152DC06CECD0D3DEEEAB8ADA1B39@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101868eacc66b-daeb66ac-dd84-4824-a627-e50e12406540-000000@us-west-2.amazonses.com>
In-Reply-To: <010101868eacc66b-daeb66ac-dd84-4824-a627-e50e12406540-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CY8PR11MB7729:EE_
x-ms-office365-filtering-correlation-id: bbeaef2c-58d4-4ced-ae37-08db1bb3b3a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2cdbefCV8xaQzF5zx3uzAJvLzJZKoSjckVVegEAfOxvyOZL94/6fgzYmmrObJ9Zdz7FKuEakD4kFUmga3Bzl2HfqXUZDHlNpDrUAjPV/Ze0BcBcICr/knIyuV5d32khsIRA4lWseSXHaEYE3WfFNV/egWQjq3bB7dEVc8cb9KnMq8vpfHKOOtW1iEOxqEgIsd2ytDHkoMgTSU3S42qQLq8gQOem4g71ZrE0upxRnpXtEAOZeMkbJJqyKEPgC/+N9F/uOGsBjdJsB9YvIjo2Cmagd5QUJmOV/CUItblAqx4hOOec2SZXkRwnQEq3DymywUjBzz+OneJA5o96jcg/3ybIMVWaTN3t0/eKSH1GHbL2y+1pkzFizZFq17QnZzZr9mcFceUSdMpZ9/ZlvlZWMeYwZ5im7dJ4SAzNbgItYLdhem82ax4DcuKAIh/NtNrXxFbuFOJuv9/PQHWtU/fsfsXD5iciz6AbhJQJiwA2jTLmFdYAiHwKCJN3NdrqCtOKvftyJ+7IdJ35iMxa/8d+SNL90cqOcX0QNlKUWpHhm0mn0pjm42a5v69mAfuPncVStQyBwLadgFu+eenc/bh9IDg3E3C8gTk1uxTFUoDixcDZtEiZdTUxiS6YJD8xAVj5BAJYVeDGSxmr3Lp80s+6YFODIYumQLiKFX9C6nU5mDSFpV6zoFdDR56QOg8d/YmHBYkRNo6d59niEr96Ce2iWUGOuQ+hnXrnAfn9Fvy8KfGY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(38100700002)(41300700001)(8676002)(316002)(76116006)(8936002)(66476007)(66946007)(122000001)(110136005)(82960400001)(52536014)(66446008)(64756008)(66556008)(478600001)(38070700005)(5660300002)(83380400001)(33656002)(53546011)(71200400001)(2906002)(26005)(9686003)(186003)(6506007)(7696005)(966005)(15650500001)(55016003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CckwauTzEeAyrEpcwjfp8TgxW5DU8gEi9OQi04mQp9pidGOxcR7E6is1REFI?=
 =?us-ascii?Q?2X1TR6hzka7Yn8bOD5DiX37V5cmDgvbgwtFNRsJ0H3cjrqKJRLmufAOfxNTJ?=
 =?us-ascii?Q?Zszo9tksJ5csgdrvjYZtnZW1laXKACQRIqinsyv3rwwUWu+IpIzkkpR7x012?=
 =?us-ascii?Q?yTrB82SLUYrBjUAoSMkgZ+nZhQD46i8Bi6tQuWsdbKmGoFgZWIVp8YZFJ/QO?=
 =?us-ascii?Q?GleeqL7FpLdvk4U59ttxn9fYavkuavCLnDnuehSQQ5e8FxwonUegZqgQ7FiO?=
 =?us-ascii?Q?uI51lhuZACsSuoajwlL0kvJ2D62lwSMbkwGSMvfw99ZYwY5LuVy5SD96xadv?=
 =?us-ascii?Q?gVeKF6MmgSd9gG1ZI6hbbbQVbDGeYo8EcdfIzGbJbi8c5z6bF4b0LeCeG4pv?=
 =?us-ascii?Q?XiRm31yWUKX3rEMs7DX+Xx/BVSdmYRaYVo+K5X7vvsIaBNkxmyj8Oed73Kgi?=
 =?us-ascii?Q?PmQXW770RUvSH4zzIaPt9W5QrusvfGZgmxQWyLlXbs0GSwR+ssv/9ZE0EuKC?=
 =?us-ascii?Q?4JGym5g8D/myw1/Gy8t9toG9176Du0fPeRq/zsj/A32oiUapuQoRxhpR9eb5?=
 =?us-ascii?Q?7L9ILYydpoqm/64qBc5IeK4FBf8++ZLdm9PZmCRV5P+B9BQJ82Nb1ZsN4JQl?=
 =?us-ascii?Q?hly1Pq03ADb0mVOFX2Zm2OC6WWWNjiXLanTRnh3KykbNDKBLX/jSUE6yHjhv?=
 =?us-ascii?Q?YeryLTBgMvzsbkHCNyBfnQ46TBjwaYhtWtoOwKQ3NCKEsVNzNjxClpBRgwqC?=
 =?us-ascii?Q?uSdvBntEKQyHXeGoaWxBFsW/+F5oaEiwicSnWhJQQUKyky5Mdu/oPsZFy2D/?=
 =?us-ascii?Q?X+yvxMv/VO185UOZxpOwFnz3x1X4+WMguBv8rtlzpYnKRoszwkZQ9kDu0Grq?=
 =?us-ascii?Q?/nSZBMIV8Z73ozcbuQ0eWu6ARmCQEGtrPnwVPgTfAauKKGTviq8WUPMdROvZ?=
 =?us-ascii?Q?csnEV/gokkkKvXjLI7pS0kkNuVeXDgAiO/EauBC3eo7Qa2R3gwUFneLksW/4?=
 =?us-ascii?Q?JH2pXa7GFAFLXKYsK4k3N9tMY4rgMocbT68WQwg5MigH5l1K7NV5tNG6wg+/?=
 =?us-ascii?Q?cJwMZr0rbK6fA4MgPh7BaQ/xOxWhebbc4aUgUvxjz5eH0dm1AjzgHNHS/OpU?=
 =?us-ascii?Q?G0d+mTSKpAz6k/+QejxC/eeMoq4NoBRVE1DGR/FeGQluz6cYsGFzc5F4FBJB?=
 =?us-ascii?Q?rwfEIuJ23pAE+I7FsgdCGFi3VTYBW4DjeVYG+aTM7avWNepDwRIUU4gxsmbj?=
 =?us-ascii?Q?CyqFdTQdnUEMv/LFs4IEEIf9qJkHMS2Kz4CuY4CoPTJS532Dw217cvaLwY2T?=
 =?us-ascii?Q?Xtnfopg5slfCCjsm0x9J5y9IFvZhsr/yjPKmxP+JMP9dj+0sqX64Ly3Mnq3z?=
 =?us-ascii?Q?3b7w8P6gQL3XH7yy0vYb2UPesBhBbzJCrpq8tY7RqIHj2a8163Edgz73CX2U?=
 =?us-ascii?Q?kddUo3fgxSy92funiTT0VaWHqQOblW43CT2emYkS1+IHgf69G+EqPnOJ04R5?=
 =?us-ascii?Q?hxY1BAONiU8Crdtrjyfu7FZ797wEo4FNu7ECyEhjKe0tqVqwgywRXiL/lyyt?=
 =?us-ascii?Q?IUusorAlSH1S5k/fxDolVCIRxVqcU2CY/LnW4C1r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbeaef2c-58d4-4ced-ae37-08db1bb3b3a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 06:51:22.9754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9bMy2nOAHptWo7SuSIjcl87aRTWYKrGEOyJK2RXW2Mv8b4jMHAbBwbsCFWCZgN3FLFCOV9ZmLd3L8adItQTH5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7729
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 06:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177975

Hi All,
=20
QA for yocto-4.2_M3.rc1 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
=20
No new issue found.

Thanks,
Jing Hui



> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Monday, 27 February, 2023 1:02 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.2_M3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.2_M3.rc1) was completed on the autobu=
ilder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 6bc65e6402a74c9a65e29333a7e0f1f85dcbcf58
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: d5c024f1f5326fb19de33928acea34df4b58e9ba
> meta-aws: c0d336fa28dfb75b71e403802f532723a619d9cb
> meta-intel: d5ddfa0354fc6025bd2d42f56b70943429c06dd3
> meta-mingw: 250617ffa524c082b848487359b9d045703d59c2
> meta-openembedded: 3f2aee1b080e2f9ab2d0a7326581dad2f07ca6ef
> meta-virtualization: 369749ad2947921d7452a31e7a4ce6eb0f8e8ccb
> oecore: f6ac666c99da115ab4a214d24282978a06c36efa
> poky: c45d58f003e8d8b323169ca9d479dc49c43a9974
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

