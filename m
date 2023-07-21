Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A83C0015E
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 01:32:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.1495.1689903133446212433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 18:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=YS3/NRXJ;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689903133; x=1721439133;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Fusl6IVIvhuM1fBsVPlID/MXsY3mDgjlixX3Gndp0Dc=;
  b=YS3/NRXJ4seMSIKknCY9pSqlk/bsjcXh9lnK4dgu8BqjjnFq2amlDZib
   sIdwNPj5/QAHZtNDRyz0DsBEwLzx+7XzKbXaVxyonN9P4qfA8CTuaCZsY
   npPNBLORAgEYeL8U+Xw4Ti4LxlAzTPRjKWpdPhzDbC2SipvhRuGcWWlh2
   4oypp6/wkblMLlhwvf5go94x+QwPe3NslxvbDihfu6NUxVaxrO2l+1pV2
   aKV+beuxuQnSxV0Pb7YV/hTeZroJMD6pSj1FEGrXxY+hd7+Pn5+o2ZK9A
   NFT0153SPkpUXspZQtzA0xs6Fo88BQvjuBDINb3WzpB8l9hulLhxesdZx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="347212770"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="347212770"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 18:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="724666641"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="724666641"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP; 20 Jul 2023 18:32:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 18:32:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 18:32:11 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 18:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fASi/0OBpSICJnzMOKoY+VTzkZ5UmLBBiodYz97kF+Q/SsdnZj91LJ7a6iyp5o1oYxcFnrkt9NcF/ZbZUJv/IoezX2gKG5lVxCa3nE7J1tO3yIS/CGy9p+s31R70PoaVSO/HfChRqpGmVUX26o+RZLA0uWW/7Zacta7hEk+JPGGyVLZRT2Ayer7xCW5tEzjNISYYBCY8lrDLl39rw7oN1LCvuLC+dLi/hjTIcSxbHXI3SHiNEZu2HTA9GAA97caPgR/QM0eJkVYsauTFS2eMi/k0uUWrxb0H/vJhQn8+RyLy3HFtd2iNoWNXH4i5b7uj2iHu4eqdKNgsg8Z9ZDCOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOpZ1ndp4RH4sJw/lo+ZF1T7siW8pWZcJG1E+6P4JUY=;
 b=EX5bfNZk2h0B2D2PDNwLecjU+Sb4n3jh8B41lXSVtHm/vjQEMVMM8JU0+jQIxKfoWT+mIuTGcdzopoPaYYUdtf63qF0JOvNy2OsdsIs67SZ6d/Hhd80Qha6DxK79IHqpu+9hiK2j7F0/ZKMNcQ33LCJkxQBHmX4ULS5mWM/32yZi32NjsmtuZ0GaQ4h+pqLRERz1xqCRbak5elQFDf6S1/VjHJLrxnQ+elH52v3EOXfrGmI/xbBw8gkvrbaA5H4DuZTkaabowKaeDYAWznfnikCYAZ+OuPQfSFlzgBAFd1craXvxFpEtacF/kcby/ZgUaNTXDlFJDQirawLkOjOPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Fri, 21 Jul
 2023 01:32:09 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ff43:1c5b:4873:5b2]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ff43:1c5b:4873:5b2%7]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 01:32:09 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3_M2.rc1)
Thread-Index: AQHZuviTSN81SNj3uUqS1VHMKqq2Pa/Db6mw
Date: Fri, 21 Jul 2023 01:32:09 +0000
Message-ID: <BY5PR11MB415220DAAAD669C15348CBEEA13FA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018972ef9bb6-13d574f0-6c64-42aa-9666-4166acbb6a36-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018972ef9bb6-13d574f0-6c64-42aa-9666-4166acbb6a36-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA2PR11MB5004:EE_
x-ms-office365-filtering-correlation-id: 8eefd263-6b44-4f15-0904-08db898a4cd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IccUJpwHumOzLhej/B/Mj0KTKalLir7V9h3SK1CKYhkk4JaIHqATlCAhEzH+1bXcj/VYNzQtbNBixE39oZhO2wtfTogbH5Qp/SmmcG8kBHKa5ZSjHGlnF3mpKpT4nR7MFseWpBOWwIGele7OSPF3oZMbRyw2bhsGsjW++x0zqXGBi9tOBR4o5NPWx1zJm/J1/Owe17B+qTzzOwA28Qi5D5p+4pAz/61U/71KZ+hogMEwN/c7EXFuCJLjBtM7st4OntW8ZVQfDx0uCiq5VPiQlqX1qAQZcX5tHXiln/L8323McvuE2C6UXyvozXLVX2d0Nw6qT0dfJn0YFHyjskimI4yy72koZ7e8yM8QUVEpFeHvqgRf+RzeHKEXYoW3X5H+lxCTDJApqJgmufSBqq8NZmnAFud7rJYk3AgdZUeQRhIufhY/IZ5MvV4EzR7jEj/ZSdUKFRbw4lDfYUgOFzKEBlRlVHUtR3fcQuCyx6pvX8JLRgQYKb282rYti9xOq2mTvbOSQBL7rqH79d2Xa2mJGmuGWjTrGGwISrLFSK7Byx4PQa0SYLRAl5n+zDovx3isKq80SeY1VDk69QMdMsBHMjxFAS1XLUEvx1tqn9qZD0E+nj29IusX051/j929ZaPe98hXz5Uk2+wtW1H1RHi+jw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199021)(66899021)(2906002)(15650500001)(52536014)(8676002)(8936002)(66556008)(64756008)(66476007)(316002)(66946007)(41300700001)(66446008)(5660300002)(26005)(7696005)(186003)(966005)(76116006)(71200400001)(478600001)(110136005)(6506007)(83380400001)(86362001)(33656002)(38070700005)(82960400001)(122000001)(9686003)(53546011)(38100700002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tlY/3QAo8p20Sv8i2vwJD1dRkSlyNBLK8DId7+hiYPXk5XUQdsfh9rT9/hbH?=
 =?us-ascii?Q?zT6eazXl/JPzuTTey/bgu9y8LQN9gIQe8krOW/5oUmU6fevbviXJpw5kJzva?=
 =?us-ascii?Q?iayfJPBLpxTab+gDCpzewxQLxRA3OCT8PYZDjnc5K5oZggt1Rqm4JEDJBsAT?=
 =?us-ascii?Q?FcT3YKWfXiUhdo83Tr1OlB6Ax/ektZ+Z26//ePo4Kp83iBIj6kYm4SKEXBje?=
 =?us-ascii?Q?niA8WqczJ38ZPQp7+GYwsDNEntcT6OEG+VLFva2vZJ1zB6xH9i/POScTTvd/?=
 =?us-ascii?Q?YwmTyffncLsGzLAzptoRGJY/uAGkBnAR76E+LXh1qcs5Pl6E6zk8aY3TYOOt?=
 =?us-ascii?Q?BqMWp12P85bfLOBwPsB+22lc1YPfwqYb4KmwR70LgPiOylNDXdctLh2dvE0A?=
 =?us-ascii?Q?Ypu1djpNrhd55/92JtxdZavDT0BTD7hKuDQUuDUEDwpAdZYcJBK+KvT0A3Dq?=
 =?us-ascii?Q?ORWaRgGz0M0j+ge+HuJjmWBqH9NgzL1JvOAA+CKHgJQuYUcPX4Se4MXdN5L0?=
 =?us-ascii?Q?0yH5vPaWlwrQXFj68WlyxIsPaGH9xS57bUa3B2kv0XzeCGuYKQNT3Fsy+L/i?=
 =?us-ascii?Q?tLpV7cx5u7ECshKnEN9ZikBUpgh85t8b4z3HNlcpRn4lPl39XMV6Jo2VmDts?=
 =?us-ascii?Q?RaU9V8I91s1VYZ+rrX23carkmVxfTYnAcvAAzlUAAG7xXWsgnwXZ0ir//POh?=
 =?us-ascii?Q?Z//MOUm9iWZUkQhht2CVnjRScPf4G0OorZ9eao9DRAElWKcLDVuKwegUiArm?=
 =?us-ascii?Q?Ky6CjuirI/Hl+ZuCojlxvmdmCsfOUGpIafEJmNzGxg4AhI3D5vaAjatojVmW?=
 =?us-ascii?Q?d2b4IW5HYEHo7yMiYdjlXZ6dfMms7f9L9UsQwa4Phyau1mK38+0fGpLMdZzU?=
 =?us-ascii?Q?9nPSZHSkfu7lXdNB1ehku6XhLWFFv5y5HEwZFZ+gytMZmwWDoF5Tj4KNYF79?=
 =?us-ascii?Q?fg3CpegcY9wUB8k2UlebEtNfG3DDpNbIGIvBNZ6Mp0OBf999Boh1xmR44eqt?=
 =?us-ascii?Q?pA2Yjjy4haGvzfGIxxZJO1uj/dM4EMfn1Y9keHINI+AafvidYkai7a0YPHWt?=
 =?us-ascii?Q?BQ2mrPeFfrOUWBvok2/inee4/rZE4X8iTsYAzVfNC3ybG5nJ5qlfix1Ekc5w?=
 =?us-ascii?Q?qxdjnmsxooKX/tAJVbQkknqycOambuaGB2rS7MdkHU9dmOManIWnVF0D5kOU?=
 =?us-ascii?Q?QH6dnN62irzy35QeKW5Nw0v/i8qrPL7aVWUatiQsWN9L7c1prL0ixhjcuWIo?=
 =?us-ascii?Q?oMg8Tpe8P50OR17cZeCmKAvlA71NI7oCLbLaniD4aVMpDnDTnGsbSsFDoPTt?=
 =?us-ascii?Q?mtVfE9Gsoy+3gcThh6Vq+rSMxfkm5A3QzedXly44v6CrRsXONGNpZMmaYy+Z?=
 =?us-ascii?Q?Cgu219e6/XoFVreixZMwRhgrIQEEOHjCh9/hLvhZkAKUdoOzKIsHTOaDmiy+?=
 =?us-ascii?Q?cVPHSd+c6oo0RiDtqCO+X1ZAJaaas6kUZV3FjUPR2Fdab+9vpzBCRxakfZR8?=
 =?us-ascii?Q?RfK93x7UYu02ZYMMb6ZJt0vXDU8tMz/v8Ntite/e2loGl9ceJUjJ2ZjQGNBw?=
 =?us-ascii?Q?yfphGt6VP898jSblV1qK8C3kcJ9fkwwk8o/abZEi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eefd263-6b44-4f15-0904-08db898a4cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 01:32:09.0427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g8ln6T1aeRtXxnMvHMyF9Zsz0CnzwBFnijHNvn8xqe4AUvAPZgt37NfU8gkUxNeU9J6HucxPBcxQQzoYPgsgEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 01:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184663

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.3_M2.r=
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
	6. Beaglebone

=20
ETA for completion next Wednesday, July 26.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, July 20, 2023 6:54 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3_M2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3_M2.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3_M2.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 64bc00a46d1aacc23fe7e8d9a46a126f3a4bc318
> meta-agl: f1bb0ee68b18a39917e06bfbb08d677bbf8bdf25
> meta-arm: e67d9c4dbc892ef688ff960d68e02627fc99bb53
> meta-aws: 2b834db25df1dd90e2b05f89cf1ddf3790bfc220
> meta-intel: f96c815a14dab58abce5d4ce69e8fa76c9f6de3a
> meta-mingw: 4608d0bb7e47c52b8f6e9be259bfb1716fda9fd6
> meta-openembedded: d57c4655623a7271dc93cfb741ffdbf1b511a5c2
> meta-virtualization: 680f56d9e432c0cb7de41fe50610f218bf53ba1f
> oecore: 8bb047ad3bd93fcf655eeec53e6d1de1e7747140
> poky: f73ae292bc0b92df3cb76c6e8b220f18630f6bc7
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
> View/Reply Online (#279): https://lists.yoctoproject.org/g/qa-build-
> notification/message/279
> Mute This Topic: https://lists.yoctoproject.org/mt/100253237/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


