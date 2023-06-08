Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73205C7EE37
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 06:37:57 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.3082.1686206268002718429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 23:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=G78CE0xb;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686206268; x=1717742268;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=RWpyImPKsI7xEDjzR4TWvvosNdqza+/iYtE624C2hBk=;
  b=G78CE0xbFhNYx4uuY0496Z79Qq8bwI1N/JzqDw+OgMaek/R9N9hvGdFs
   vEJQvTs2U5LKpfD3qibu1ik49UoqOroSCiuzbjp4u7/AwqZkUc1rOe4/J
   RP+rxARLRdU+6KK2242TmTBznW4G/TpLNvUjetVV/pNcHwt9ZCzlfVbA9
   K4vtp2RuPj9m9M090knRpT7TirULnXvqwYLm7z7KuydzY4sv3xXcCviqa
   wigIuAYyvINV90Xa78Q9fQgY33/hEtDTQkHktVKV/x1v6wYW1KiFSgahR
   p/jh1jmyAeMKD0P1mOPNjS5K4k9XQQO2UfE4wG+a8K81OwDeUJfZq2nNg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346839242"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="346839242"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 23:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="854224857"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="854224857"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2023 23:37:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 23:37:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 23:37:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 23:37:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 23:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3hNE2FTJ2xL5HDIYwV1AuCtpGBR1+MV2SqmoUZrndLrgiDmQS0zGZiIhZBMynNiDmt51IMbSsfu7EcJ0aUY2GN2lfqwx+oidN5eir+5CbNoRh5vsx4ovm1C9tIYazdPlrb0Nra8TzxKHNp6fAqJLEShsktmWWB/8ZmtBDoogNj3QQ82KLvCe2V4jKLDPlMwiWGqOCg0OcCUXr2g1PAAw/mfVODOcR6hMNNR/cLdt8eLISEZEvUVRWyRGGWjuxOYui5HuDedtzGKVPzfCezwYxIh+/mhDEh05gWbLEfiqfWqf6ZCHjxk+NLFlfcB0d+I6Azga9hEnAuSS5Y7+NO08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWtA/k91fJzsomrPY9ydOOiMDKbAgLIagI6lMTQpuS0=;
 b=Lq0IcKzko1HeQJVelBdfGCu3g71UmXU+m+/C3EavpvVH5sbsx24rohjJjWRV44zxksE8iBu7oMsd4JBdo92DOqeVoiLMNiBEOEXYUZVC0bglkB+neIdR+xIzdTPbyePUO46+QjBZjtWmB6D2QzRz1zKjpwhPE1F/hTca0ukoPG8/ID2Fdzq+yJCxkzVokI9nO9v1A9yqep2o/9CUXdrlak3rFvcjbdf1UZTZGDB7N2EtpnDQmrfBtPIPrw7RDGkaPROlN/5dye4MIIKRbvTPqa+E7OC02Hjbz8LfYVd4iyVvOKXqeLwJZGxiW6kT19e7XF5G2Xhtqc4s/knRh/IQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SN7PR11MB6558.namprd11.prod.outlook.com (2603:10b6:806:26e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Thu, 8 Jun
 2023 06:37:40 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:37:41 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3_M1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3_M1.rc1)
Thread-Index: AQHZmbrSAC7VGMDzeUqI5grm6/56A6+AczIA
Date: Thu, 8 Jun 2023 06:37:41 +0000
Message-ID: <BY5PR11MB4152AE4B7E32D9F1627B6828A150A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018899164df1-9305f1d8-3a77-42f7-a537-7b3189848fc7-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018899164df1-9305f1d8-3a77-42f7-a537-7b3189848fc7-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SN7PR11MB6558:EE_
x-ms-office365-filtering-correlation-id: 3740d490-f4fa-4a9c-ade8-08db67eadbcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IOmmk+/0hHNEV1c29FCHYCt6450AgAFGKYfJOITG0JBwlhivBQ4sFSAkAXWqoKjub+Ff6d0HUhPCqJSj4jtaLCA3GWTtcmFdJ/Q+/eFasfpRx/jvnkt91EJ6PUKhVb9mdw158Ow/8aPUDR6Rt5+duMdptY05BCKxOAAEKrxJQzUn3zcQIPQBXXD6mt39/wJR9bdnL5b3bTa+E5HSSIGfLBDa+I9+O0EBX07syPuwycjwJ9fYLS1BU7ik/Vr7jcwGV036DnfqTH0Vj54fZSr7qdS8GoGhG54z4dl8KY1eCFItnoxFiCLsM2CO6t7MKk5UZeVsocKE82LAY8+80MgSONyXItA9j+vtuXE9tT+lSpN2itCu7AKdRaS1xTqa7WJWsqZWwhLh4lF7MGEP17TDoNZL274RGxXDE06xBNZKZ9WMHdYqRLbAyd/4/GTvdUGPW4BHjqE1q4E2HohlFcJZ83fkw3QwckL/+uts7X9RdTYi9HafJ7MThfSZbXDFfze6w7FaUpKuoD2JlMESbTjRshRi2P4n/6kCR/EVdlBGmr1UiZYSZ3jqVtJ1ssq8wTmZWG9C1jyPmmRfkfbtiRu1lS1pgeKC0N4DEUBqSrioDo4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(66899021)(66556008)(66446008)(66476007)(66946007)(64756008)(316002)(76116006)(71200400001)(966005)(110136005)(478600001)(38070700005)(86362001)(33656002)(83380400001)(53546011)(6506007)(26005)(9686003)(186003)(41300700001)(8936002)(8676002)(52536014)(5660300002)(15650500001)(2906002)(7696005)(55016003)(82960400001)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?umSWUagUGOZOd2fkVII5hA9P969/KjgNLTX34I74qRDXd6+bGPl8ZojpHhu+?=
 =?us-ascii?Q?AcPRRvFQ8EnuMobskkXFXvDs9MIRZnH2/M0Qw4KdoOpfj/QOybgK3QgvdYwQ?=
 =?us-ascii?Q?lLt4RCgzV17xpZ4Tc+wnhZKC8XoC62tnRPDrKTna0ZP57B9MBN7KVn6IlP3m?=
 =?us-ascii?Q?xnrYMvHs8phRjpWW0napyXpz3kqBbmqubI6luGPa6GGp5ZLhQq6FtMO8+aYC?=
 =?us-ascii?Q?UOBK+3qwbEUxIaWPi3r4V4I3OE3eJwwD5U0OrZ4mICCGwQvV9EAzyaW0XJ+r?=
 =?us-ascii?Q?pFe/AncZe1/y288UlVLsJuulEAXdOcz0rVZZBDcRizg/tGJzCKIfx1uUpFyZ?=
 =?us-ascii?Q?t9TQ6CP1/qkRQh6UCAk4b7wlvrMVCoMfGBbi61VSIRm+PVgh4iVX7xdJA7RE?=
 =?us-ascii?Q?vLAmOfWk/Nu77KX9Fq3BB6jtn0whsmnHjoNja6DsnIRLIhd0oJzfoVN9oDCz?=
 =?us-ascii?Q?Tgz+fSbvBOWU4e9kUBUgJsB98tIM4/G+yeRHTwUJ9pAa1eNkwZYRhWCYQd2f?=
 =?us-ascii?Q?VzgQ+Mgtl0N+sS5tgW+XJQ9aPeAClJiIhkK6JM7oPvA6/k8TRaqLJVWjlLTJ?=
 =?us-ascii?Q?57fw96jhv8ebBBpdjj27iYqCjK7+LiHkD1sMBUE3uu8W1NfKkr2JkImzvj/f?=
 =?us-ascii?Q?W0oeh04vIzayg5yr1SYdfOrRy7FApl8T+3S4OvnOagwbpkRu89AOsGv+Xdjy?=
 =?us-ascii?Q?9BEd5u1BY51QGpGFJSVMHOvQ66vJnF/PAS14TUa852jFHEff9WFojJwrjB01?=
 =?us-ascii?Q?4jAy2aVDVhq9jMTMwc8d8c25xS5lXhAaaJMOB+Ru6gDryaRyBkbd56/8F9Py?=
 =?us-ascii?Q?uV3+3M35y/jK82y4WqmwMVpvQhQBLHfRIjT6yZ2wuO72BFJRiWBwtYWnFBy7?=
 =?us-ascii?Q?zaPRPZqCnzFOQvdLrOsVUE8drMm0w/Telj5rRKV03HWm9BKBK7cjQ6wiRmGa?=
 =?us-ascii?Q?9YHvfbFXTIXvp80azvUTen1JA6upqb0IsQlZ+UQAahn3X8awMHy2lgN3RdQV?=
 =?us-ascii?Q?qOxjRIUqNKStU8n6lOIjGpLjiZWxrbmsDVQ/CJ3uei6rOZLnoa0xJc//P3kO?=
 =?us-ascii?Q?eWaLDVUP5xy0v5MKnpFLXCMRNs586VeYXvnYcLUmbLXs9cd+aiNp5QtGu2Gs?=
 =?us-ascii?Q?Eeam7hl2knbLqSgOyUx84hOwM4PzQ7Q5V8IzrnWlApH3PQYl/ZNf0NqgEcUa?=
 =?us-ascii?Q?2M+NltvvXPI6IGf6HxyueSLS1e1v3OmDci/IPNZ5y+VKPE2KHHDjra6QF5fF?=
 =?us-ascii?Q?N4kcfLR7srNbbB7L2cvgKW4Ou6wU2Mif04x93JY2vG6KpogGudAOuFDj2muc?=
 =?us-ascii?Q?RFwvsyq7YHenIpLQEGEZSZvLNrRqF71jOviLo0qsvVTX5PrRM8Sq3QX43j7g?=
 =?us-ascii?Q?MtjgAWI8NVvtuGfhqs5Jcxf6VjKV50bcW7xhApNclf9PL1t1Jbk9d168hM/r?=
 =?us-ascii?Q?RWdUGX/cv7LSR6IHgI1ac6DirRCy/2f4SHEDVXI/KpW/L0SQ6K2Zszr6ftmq?=
 =?us-ascii?Q?gCl6pkkFKrE2hlU/s25054u3Y9qW5Yi+ljWQHkoTvFHaF5C3xe3okMT7tBa0?=
 =?us-ascii?Q?H3RPWsKBlWR/x4JQCg1z7F3nv67O+5VGUx0tyY0E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3740d490-f4fa-4a9c-ade8-08db67eadbcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 06:37:41.0623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Flk/N63z1DfnVxjYRgbJJ/8A/aeA0R5kMqQb5+cwee0UF8y04zsu8hkaIBTemmz8VOTvu/cS8ldYX6D8UkmQHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 06:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182497

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.3_M1.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
	3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
	4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	6. Edgerouter
	7. Beaglebone

=20
ETA for completion next Tuesday, 13th June 2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, June 8, 2023 11:39 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3_M1.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3_M1.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3_M1.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 6abdc81dec06a362bfbcc06d69b90b96bd9bef01
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: c1a7dd5eda419109b179af6cbf93cb0dac2f7ae3
> meta-aws: 03dbd44a850b13c581f4335254f915ce50bc13c3
> meta-intel: eb696e99ff8c5be4f9b181da9f134499d96760e4
> meta-mingw: 6badedaa3e4df5b00b5aa992c5c174e315b09972
> meta-openembedded: 1955d0f140a9610346021d42fa45cb186eb6f042
> meta-virtualization: d9dc99282fa4a7dfce861f64e792b1a8307a4a8c
> oecore: f7ed7ae854e49276750d1895593e0a2033714235
> poky: cc97d775cb402df0d4122bf54eab1a5198c98471
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#263): https://lists.yoctoproject.org/g/qa-build-
> notification/message/263
> Mute This Topic: https://lists.yoctoproject.org/mt/99399916/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


