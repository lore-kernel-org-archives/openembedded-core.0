Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A82C7EE23
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 03:39:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.50657.1683776369108887396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 20:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=dnNXkBXo;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683776369; x=1715312369;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=MdoW/Z7UY7F6MB4KuBQe7oAfQSHLhaV6lP1qIUeHesk=;
  b=dnNXkBXooX1G2AmXMsG72fR/CnVWJmE2ddsIoMm+2MkSZMhWEq0/xfmT
   4yStq7yc01CEh1EZ6t5W+OyrDTQ3QILuMGsgu5GMgWyDDxUAAoTw8yQoB
   1ck5cc1tZ5UWT0tUonwr3Ook1uZuF46Eu3deiOCbCEPGOt5tOv5vwiyp1
   aTpJAxa8f4+PhFvznvNKGLLxXCogx1Y1CxuUvLln+XQ/eBbDj9OJ9TD3J
   O/e8ag8g7eFltk8leEbqnsj619fOjsP/aAqx5MJpEapYsfHTQpeqtTHcJ
   UEayFNniIjKPc206z28mP0bUY9WF3pj03/d2RZ2fGMtWv5fakijvxFvEO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353469515"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="353469515"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 20:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="769156611"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="769156611"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 10 May 2023 20:39:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 20:39:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 20:39:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 20:39:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 20:39:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fL6iBRz2E3TvSTpkCxA53MC5LxLT49YnzMCr1LEZYC9cqFFCvJwnjF3TdkBeETfb7jCXZuPP17X+aSMn40QquCx+Dxqw1O5UdKNB4AbgW0CBbPt7XVeWIonV1hWBIlw2qrrZUpXjqOSdpg89jwe7es3bkHBcWl/GsPBnnbEM3QN5VVEgJpZsNDM48gsrSxoc9fleZjdlqPRgCnfLkkOF0c3iPipIawRaCvBE+W+ejjTTKJanlB2gT7Xh+2Cv0W16lsSTfIMc7EyWE4oAWy05TQbj/kvOoOcN43ETQ/vfFw70xGdzBvYA8ZOdPz8geBJTqkJQkco5CwxCupR7VikFNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY0U3Wy351l9M9ajVLGcfgo7zQr7mxzEz+H3ZyBXUXo=;
 b=itfdYoAm4R3vkjOMzK6S2n6zw4LZIQihO4NjWufxQuxI3NKTGPesMhM7YgnslTCaob0/7I9Ga7ZJ/SuLxkMBAGB2pjy7arg4T8M10ZqxAbAwdJ9E2BEKL1gESVCYzGEGD1W/VYFWQRakN3Rot/XNVYh4W45on2viZHUPPfSEQgaaQ+xOBWCnRWs7CiT8qnOosf6HqzaHliXXiIb00p1ZXwh0kqTaImd2xauTIqUG+mIIWVgogPO4Z0FGL8HPZ9HvhEOGWWCoN9nh9jGV2VDbKGYUTXA/VbfNSradB7gHrxu/kdWoCoWvTxQ941OWuCws38+XXO53jUmxG4ULZ0F8pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ0PR11MB5895.namprd11.prod.outlook.com (2603:10b6:a03:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Thu, 11 May
 2023 03:38:59 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::cd9a:3c52:72e3:bcd4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::cd9a:3c52:72e3:bcd4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 03:38:59 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.25.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.25.rc1)
Thread-Index: AQHZf/3JTzNNG5jzGEGWCsWeu7/lNK9Uc8DQ
Date: Thu, 11 May 2023 03:38:58 +0000
Message-ID: <BY5PR11MB41521E38F41C12F81E3F65D9A1749@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010187f0684a61-a44a1bd4-eb39-4d58-87dc-002340211ee7-000000@us-west-2.amazonses.com>
In-Reply-To: <01010187f0684a61-a44a1bd4-eb39-4d58-87dc-002340211ee7-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ0PR11MB5895:EE_
x-ms-office365-filtering-correlation-id: f8004a6d-8481-444f-7329-08db51d14111
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zzVpgEWi2l0AcdMy3STAjv5bhXm5naFqvcjgG4Ed5K7vMKENFsdHCwUv0X2Y1r76s6kCFBNrtsJ4HwjQRDIb3XHtrDXqybyswVrMv+9OGHJz7SWXoVyG9uY0HL0EA0uvJd0k7NZWPznc630aOpPc7x6UVEQphtz7fhDqcHBrLHOtxLRpcaBH5saWTOJ7t0kTqMd53PdFYQ7Bkfren8Kvaxpz9Sms0PT8VTRJ93yTDoLt4niPaUQoe4hB6RX1yOdAL2matnTVg+MyG36wVa27CvHNN7ByskwxiJ9OBq/Ex4mnHfvjfj2jQbPCCKG8LSybMUsCUJqkd9lTp2yq/pf0W/L8kA5svuEEwxxpVXodWX3jDikdlzvjhPkoiuy1spNeX57a6kEa2aM5Hk3acOWUOEDioCeXmOU87tVmd4yv+2i4AZSn8amLpwf0Y263Z88bvNTFfs6RXTszA7Ooj5s3obHI+jTV/c0PCn920AmZ9APVlH83kWBhX5Mazp9KhgP6SoivzRvmrpD4rZl5vjBxOgc6WLPELtT4e9uypgD1tudSH+TEQ8ucfcxtJUQXCFdlhpfboekTqG420WO3+p/KJjt66nYaZVRux4I/CjdhWa+eUelH1bEeSMPX8CsYqwI9YJHWiY8j1C6H28c250SShQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199021)(8676002)(2906002)(478600001)(8936002)(316002)(66556008)(64756008)(5660300002)(66446008)(66476007)(41300700001)(15650500001)(110136005)(71200400001)(76116006)(52536014)(66946007)(7696005)(966005)(26005)(53546011)(9686003)(6506007)(186003)(82960400001)(83380400001)(38070700005)(55016003)(38100700002)(86362001)(122000001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hPfQXjwG8QzeSQqBlbhH8ITsXUR9Z7kVTN2ASA3Hpp/Gx3osbErP4UjpOEX5?=
 =?us-ascii?Q?JuPEnmW2IG8bXeBKdAPCvqPyQoBiZcjfA338UV7vsRl/6BArgSpg5kmV5pc3?=
 =?us-ascii?Q?TVhzBId8kQaEHhWeN6e+zE5A3uxFPmP0/OggFLBRK8zh39LMH9PRpnGo4jxD?=
 =?us-ascii?Q?w9/56ozWntIu8HtfCuq9lGMEka2BNi3sL3TK6hot1fKtxxMbeAqFekcGJQRH?=
 =?us-ascii?Q?BlklgiKFDS2nP+K47f+JODYW69VBZBWyjmxkRkU51BijwgCuHxVY8D2x9rc6?=
 =?us-ascii?Q?5tEb2OTD/IXyFPk5O+/8jwrIQdabqmnh+TJH1VnwIuvdgHwYT/mOPh/hL++e?=
 =?us-ascii?Q?2MVcGrP83UuiF0NItvt+2WiTN629xNwMF0vNaFHQNfTOEfmycLMEGxSjYkqn?=
 =?us-ascii?Q?frnnSHfkZXrKOUTL+Glev96xeMoE0pQOmwmst/eMBX5XtUSXpqIOVYou7f9Y?=
 =?us-ascii?Q?bRg1tuQJ352SpPzh81bd9sp1u1xJfaWJWgLHacSCRnVI1Q5dVClu+pwJP7fU?=
 =?us-ascii?Q?sg1aWC4R78NhYvhKz2/IDejKlLF2HLvNNkC2wmLjF+v+M5GAXiVSAqJrlxfG?=
 =?us-ascii?Q?wr6kiqRmxk3DqTOKR1p3jUVtAR0Z9u8ME5jnbyIkfXpjxpjQ/Y83L2YF7gea?=
 =?us-ascii?Q?SvQfx9N9cfX/hjAE9du4WAcW33ae30+4b+/Lp50B3mfC0/kowijHjoqR3AW6?=
 =?us-ascii?Q?zXTAm5QHUCJLskRtrazKqgAUVVPDb494wa4QF9qfsTrMzO2ViofeRw2vnD+K?=
 =?us-ascii?Q?TTL+5IpMYxkqCPsB9cB4LJm/vcilqKWN1PlYUL/XwSjYx9krEZ9T/rUOqlnL?=
 =?us-ascii?Q?3MRpUgqt3e8Jgya1b8lNHum/WOolXZcSRITdIRvBhAI1Ef1zWH7puEbABDy7?=
 =?us-ascii?Q?8ecdKqw70Yv3gi5ldLBJnKUfCbZPsZxCEAbWDFuMF2iF/8Pa9kvVl09V6vyF?=
 =?us-ascii?Q?1l4bw/YaXUrdnbeiWxZoHiuRdpZrVwY/00ubgMuLA0eCDs7KntvBRm95qf9/?=
 =?us-ascii?Q?7Ga+ZMuJr0ZbOmjpLUU9vT/+GHzFF51KZTLZ74p1Rq4UaICplxbaXyj2/xp/?=
 =?us-ascii?Q?GmimoLUDaBiOJCHshGc7iMaqWG53MbpASlpvCK2zAT/0b+uswKIm4H9Xw8Y3?=
 =?us-ascii?Q?Dsp0RDapORQIT4faGtKMjpwQ8ODiOu6+2SeX8wCJ/zL/pZw1zfzXliZK5FiJ?=
 =?us-ascii?Q?bEWefNJUrEN1hpIHqwl8OOAX+LzRYBtDeLnR5DvmwfKhRR0ebUJko5uuR2Gz?=
 =?us-ascii?Q?ujLHUTo0L4X0PoVGFgaCmI3lgxJ8CaS1HHvi5Oho6plBHR7BjYMAwShuDRLS?=
 =?us-ascii?Q?SRSfeGxwe4d6jrs4bGyK0CL6mrI2Cj/S8bpNLB5K4K6OmfjLfgfu49kzSLo+?=
 =?us-ascii?Q?nHoFcNGIuEr5eKoi+GTkJ4Jw9h5wKPOEhFrwE/tDo1C8TLOGDMS4D2jWIYTV?=
 =?us-ascii?Q?S+Qes4WBlvqCNa8McNiDAdTRy2je6TPSA0pcnI45btr+HRlAhf5YCc2uOAGJ?=
 =?us-ascii?Q?2FsUG3hxo+SzHwljDqdYz5xZxNP8HZG4/xg1L2VOb8awqCmR5cyUE9XafFuQ?=
 =?us-ascii?Q?eQgUHTA3uFG/RvAxH9wjCJ3d41HmmR+o694JrBY+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8004a6d-8481-444f-7329-08db51d14111
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 03:38:58.4257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 88FraK6XXtPkbewl739sB8VPffKtCu3QGfCnCaoHUTjQ6Csy3ammdmRezL4tuNFGKCxJUwL8Ii3/ZuhusoaLNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5895
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 03:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181126

Hi All,
=20
QA for yocto-3.1.25.rc1 is completed. This is the full report for this rele=
ase: =20
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

