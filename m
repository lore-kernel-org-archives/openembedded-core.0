Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFA1C7EE24
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 02:57:26 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.98968.1683514638218139002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 May 2023 19:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=YIIsBlsf;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683514638; x=1715050638;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9+SZ5qPiH9fcRoweM68dBoBza0TBuWcf8txxB+EmA0Y=;
  b=YIIsBlsf+x7LFRYEgsjglc1ppdP4X11/f0rH3WLm7I71OFBqk+D0ybSQ
   HZYbn7BtJxNP1PnQTVT9jkenV1ACq/gMiMvSgmWxFoyY/KZRhGBX7+iRm
   VqeYUQbBYecJ4wTkdVojlPNv+FJ7bC8Lk6jpz/59MkLU3Be90oFrQpQ03
   naclSMY6pDZQeOUgMHS730wiIKntvRgHNj5bNUaGEbUXnMFvEYHnbZnuA
   9Pm0uXuLNrAOG2JkeDfe9c77XZdOxcjUU2lmI8WsZfHw0lkdVvQP0fP1H
   F8LnN8MOLgJyZPiHGVYGVtFk/Ng2h3CpIaZRS43ZbiTWgQ5YHNYW0S/iZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="352598486"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="352598486"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 19:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="842547219"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="842547219"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP; 07 May 2023 19:57:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 19:57:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 7 May 2023 19:57:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 7 May 2023 19:57:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KT2ZMo+TeQHEuOdzYR2kkWVTLitnclznRd0FIRPwdhupqDR5G/eYazIZ1SXGG8rjaRcKY4JCc05fRXK9W+S6obW3o3uFdE1jfrD8/zKDM0tWZrvr69WntSdEC1czv7s8F5iq4ZHMhl2tsXEATpF0YdcO3QEguqGNRRpCtvx/glDVjQZJnRoqnz433J6oqpHUcaFrpNrL9UZCVk0dklVlYDcJdbnFGSNJoo1T3fn3jHSIL3bUJCzvakYHOKm2tl9QJzhKENmltDZ1YoV6FBLhMjv8Nf2ElGQm0qagHDwmilt8/tHfBtIHhbb2npjPBpwX4b3WcEhSkQnKtsSscXNM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+JLDy1dfPdOaWhBeXQSPdl2ek+PnBlfaVnCdTXNTWQ=;
 b=T/mAlwqGTEWjMeJ2ifpEfkmFQ0W9kWdeYHnxXH+j4ah4M0me49I67+ZOZZ/R1mJRCbXcqeXGBUy2eVnrw1xmiIvLgnjv15UwInIBF5RbgLm14OGSioMM+lKwwi+pECacU+7nZkfk7T2xAACoqZXy48qcxhClrgfCynlc4dYIrE1a1cMyZ+uA20uB6WBmqR16/041rPSav+xhtkVvNi8s6KaNjVzv7Oy+LjRjD7UPZ+vs8uP+E1Wk83JhQ5G+9oGKolx0Sp7nMqOP3H6T4/89hIqN9PyTkOAN3fYWB7dzlRYhYnFvzAnX09BoXtUX88BTc58ypodRZmXf4OU2knOi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by PH0PR11MB4968.namprd11.prod.outlook.com (2603:10b6:510:39::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 02:57:14 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::cd9a:3c52:72e3:bcd4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::cd9a:3c52:72e3:bcd4%3]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 02:57:14 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.25.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.25.rc1)
Thread-Index: AQHZf/3JTzNNG5jzGEGWCsWeu7/lNK9PsTdQ
Date: Mon, 8 May 2023 02:57:14 +0000
Message-ID: <BY5PR11MB41524F0438D4240CBF5B44F6A1719@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010187f0684a61-a44a1bd4-eb39-4d58-87dc-002340211ee7-000000@us-west-2.amazonses.com>
In-Reply-To: <01010187f0684a61-a44a1bd4-eb39-4d58-87dc-002340211ee7-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|PH0PR11MB4968:EE_
x-ms-office365-filtering-correlation-id: f5de8d3a-ddfe-4869-bf9b-08db4f6fed49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fL09TDLlDyI1Eta++lCtzrtofSA3cX9N45idrgj3ky684PJVfYoxZbYMUa4LeGCqeWN8v7IxnV3gKQuZTlWAHlXrhtIr6fE9WD07J21KDrZnWc4zX9BXBTTHbZJTQuYYkc5tQpcbP50oBeYIv69koZz+DCYkTn4oM+yKQbcyQ4qJr+rzAjYRTw0WTMfwO2EssEJhyXG2TWTHuKp+MTfxBvHbs1PeA7R+jpWmijiTbQv8hEIKNFwOVqcbe9Avnl0gKGFbBqv8pqdS4Snet8Sw/F45wRz3wmSGsgvyhv2AM/QluOJkdq3uODDccMMae97XCPFFrEO4wgLEj0eFVRH9apTWTgaqGvwAdYpN3LKbZPf/6xDoeIz01RxGEnE78mglBC1KmJX8FkX7bvc/0G/gqpScTl9A4VG4VTh9yT+JHo/DjQtlpjRnZBoTZJCsPSgYpHBHM2wPPmu8bl+LGe/8ORGE5kiDYItU8iMPh4iTKnXUbaKJDRliCLAkEgHoZlhQvJC1tYqa8ReG9xvV+PMQNOzPhWZaXLtSS1Y6QahN3wkn+2Xv/xDo0FWl7T33SBDW2/ElXH6B2wRxcDYLoFJ+UEdHqsnPZ+lZbJ52YgVvBLA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199021)(110136005)(76116006)(64756008)(5660300002)(66446008)(478600001)(8936002)(8676002)(66476007)(66946007)(2906002)(66556008)(71200400001)(316002)(41300700001)(52536014)(15650500001)(7696005)(966005)(26005)(9686003)(6506007)(53546011)(186003)(82960400001)(55016003)(83380400001)(38070700005)(33656002)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ex+ogQXqd/1fLTjWObuVvsYsAVebMP7LvBwLPYetJB7hO+bcLR/UQZEIR5L2?=
 =?us-ascii?Q?EtwXa65TM6NJmRsmlphjlY7Eu86sY6feFTh93PY7jk+yDuJja1z6z2IBmXvl?=
 =?us-ascii?Q?YwWKew9oR7AicyLYiNncc+YGdXPaEuEr7rZR6WAeEIMDdPoopTt/1aDjseD2?=
 =?us-ascii?Q?vld1x0vTZUTnLGBE9yzRVHNH5LoHJO0z+SS3Kme0oROlpnv4xuEmbnKY3nGh?=
 =?us-ascii?Q?A47Yfi/ZE+SV+Kp/d9/FKVWSfIf7wr8wNJTLj74Sm8z8DlmUqH4qhB6EXpR/?=
 =?us-ascii?Q?bTHypnbrpSRYccP93Ot4xJOMjnZA1B2tmvvr5xHRfJWENZaav8zKduWQNsrp?=
 =?us-ascii?Q?B5WSJsCIZy5Id4C5pF0PEcBJ5GyWLynAZ2+vWMVXA97XPrPSxf3xfC0WtftD?=
 =?us-ascii?Q?4TUPOn6WqzY8qzDeNY8gz6x0xCyej1FTxaZOQx+hUQyDBPrKNZyFouFrD6SH?=
 =?us-ascii?Q?siaEq6EipvLv5nOfVEVgc0Z8XikY1RV2Uw5AxIAxaDm4kubFXe/EpafxbbYs?=
 =?us-ascii?Q?dmYyEd5sPqzvatVGaamg87CeZJcw2IOvc2Rxj7Rk9Qcj5zCN1fj6qezlYAQZ?=
 =?us-ascii?Q?Qz0U9Zv4GcC+Zh01mzB2PdM10pcGsIaHTmWnwgHzpvQztm6wIhzby2k2PJKV?=
 =?us-ascii?Q?Y+EDyoQcZue5YNd0MI7By0apqnFBo20v5CkXltoNHFE/qVL3mTI0QWvGpCoI?=
 =?us-ascii?Q?5wCZdynTayrGLCLrhZy4Wb0FmMozQX5e3pVcqHBeP2IfnDYmK6+sa/NoxJUU?=
 =?us-ascii?Q?oHGiWvhu5Q725RJ+9NItKV4tIzdaSSlTFeXHc8fHAm77jr3Wpo+KnTOuN/MA?=
 =?us-ascii?Q?8C6K7l4aYRo+2+zmUdq/YCZWvThiPMDgE3t+xSpbZHuJSuONQzArpvUiRZe1?=
 =?us-ascii?Q?/zGJpY7EHYobBRWOCMMO44hzaQy8jN0isgvqEywZw0P9z5nQMkqYI5eGSYMP?=
 =?us-ascii?Q?7hheg1T75FYQ7/VrmqGmp+dnjhhLh2AjyxXNmkjaF3+YoisUkKasyPFNB1jW?=
 =?us-ascii?Q?i8KhpCQ0yQdhXKlJMjN+7bLXlPaf5EtY3xE0vxQ0KtZdW47LtIs+KWRZsdc7?=
 =?us-ascii?Q?do6MUjw6ydbbmHONZEIqI5EKdCMisclC8DbFrgIw+w11heXnTMwKzk/GEOFI?=
 =?us-ascii?Q?yq1IcYR/l62Fl/2jsMbn/2y8V6dcoCyfkmYzvxwR5EFEMX6rv7xr3uxwhvSO?=
 =?us-ascii?Q?01fstdnW/Sdhd88upeoifGSuEkqMLyhjGzKAT17bKKldDwAfUJoWr5tBfRfe?=
 =?us-ascii?Q?eBY9KqcrGOxe2UXue4e/Y6FCySksRoTwfzfkLNkeZdMh8WY9UQObEUIS/HBw?=
 =?us-ascii?Q?qwrGH03J64xKq/EWbuhZqVambA8AsHTZLXZs/07Ad3B+kaxrmKK1WRf5byDK?=
 =?us-ascii?Q?RXLM9eAK2yDyB5R3F7eNlmvMLB3ftwDgMH+O4/bTvdNE948WrqFajBcbND5u?=
 =?us-ascii?Q?G6lb2PZki7JcE3sc80O2RuU53e6+FMrIFNE0pNJU64xuANELDnWYAvBN2/4H?=
 =?us-ascii?Q?Odckc8TJGF2X+IBmOq7Tow1EGdJnMXBQ06MAV/T8orwIWGDrzPFIvQRYXgm7?=
 =?us-ascii?Q?bmsQnmILZnHqTNiasez4T1cS591LLDAu5Id7QYvs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5de8d3a-ddfe-4869-bf9b-08db4f6fed49
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 02:57:14.3942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hoaoUYOya6WM2D+zkrtReQpBrLeLqPc+ilxCVPe9097JAOsxK/9Y6TKGGWs1eTxu3tj9Gifowmg8V6EaGcvf9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4968
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 02:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181016

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.25.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. ADL
4. TGL NUC 11
5. Edgerouter
6. Beaglebone
=20
ETA for completion Thursday, 11 May 2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Saturday, May 6, 2023 5:33 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.1.25.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.25.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.25.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: e16a9ca7e9286790ac37a067fdc8fde3a35a1c44
> meta-agl: bb1af1fb2458c495e75400f9ef6e853f654418ca
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: baa97b9aa3b9de36369b0ff1bb74e1596828b967
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 488af577a3f21f038c551612bb0af077fa2b743d
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: e39b002df9675776cc99dccdcac07607ce783b15
> meta-virtualization: beea119eb529b4a11f266004aee8b548427aea39
> oecore: fd4cc8d7b5156c43d162a1a5a809fae507457ef4
> poky: a631bfc3a38f7d00b2c666661a89a758a0af9831
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

