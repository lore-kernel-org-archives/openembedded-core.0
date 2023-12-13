Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A911DC4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 01:14:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by mx.groups.io with SMTP id smtpd.web11.13280.1702430081476092670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 17:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=WedoGloK;
 spf=pass (domain: intel.com, ip: 192.198.163.10, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702430081; x=1733966081;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jkUbYUIwCz3qmxVUbnV8zF9ss0R2B33yF+etdfZ4ieI=;
  b=WedoGloK8cmltS5aw3oGIzqaR2GOuatj1+qSO8u7DrrY6qYk0YVqcfgA
   280tmG91Nk3fqLVFT+N8a6gY3h8NlP72pXS3C4od4zR84DLtieEGMpcIC
   oIOJjgSl6u2Ddiu+n+ILLjqkkDOHdgeE6jbspHOCS+Y7+vlGfPCBKvVUh
   rA/ACu7V3ZWv1zT6yjoe4b9WNWvUK6s/+ri0yPa499w9D35btHgWKseyD
   8PQEEowIRLJCkl2wbV1SjkcgMjh7ltXwEtXwW96y/ii4IBW8w53THItfV
   S9tZDBCnnCojp55fTY654+WQN0dyTrOSR4o0V0z6eJUmoQGaSyOs5atj9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2068544"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="2068544"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 17:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917480800"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="917480800"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 17:14:40 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 17:14:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 17:14:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 17:14:39 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 17:14:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyX3+t7zHn/Rd0ELj6YwUXYxp0RlO3xkNnY0iZ4hu5wX0eNK9rP4ysvaftE8hIZWWh0nQa+TAt7DOg3AClssyHH+eiynCRw5AIQtqoxJUegxLasQyg0ZyyA2gFb9jOJUqlkqJrNvt5fm2KlAGIoir74udwijq3Yi4LWRbCLbclQkcY3SB5PedAPg0VpF8GDSz0Qx77B/bGaLTpVt2ftYPn/gcyNk3D/VWJPFV1Qp3v3GeT8ioMgimBkqLXy/sOvb+fEYhJTkT1v+5gqHceL3LeF+Mhm4uF+qluPw5eQthmZhdes0bTBKJ4CsLhN6W1ge42cP30olg8ApPurwYNcNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHU4LOz4+VhGN/lXS6ixGNg8jGCpoupRYpUEcEhPhuM=;
 b=YMB/JmqQM+oGhirYQ3CylDUUAni7vG9e6pNjvnDl4FPkPBLX0zVYMG6STEooxArHGRwvn6W8/ofn9/J6u896dwxwymTEDGBf81Eyg9udKjQBs/OPJSYGX4eI9nYwt197kSeWivM6HLmpVs7lzNV0epygj90wMZZ4dcSgUNdtFHosbVhlymrlM6hb2/NhqZVMuhx3Lkz32/XaUFq1GTAiUB3yA73mL4xp8TIPXepID/EN9ZPisb+L45x1GWcPiJ6+/Nh7awYamkA/Z4DpaMgZ1nHL8hkwPCXT5MeVQp14LlL6wN0RVIhqs8zLgnsPrYB7zRmn0R+FHdzsI7MA+s2pFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM8PR11MB5591.namprd11.prod.outlook.com (2603:10b6:8:38::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 01:14:36 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 01:14:36 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.30.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.30.rc2)
Thread-Index: AQHaLMHNkGq0UOk9vUyie/ARxhi8QbCmaWTQ
Date: Wed, 13 Dec 2023 01:14:36 +0000
Message-ID: <BY5PR11MB4152C7BA9ABACFB20EE4C72DA18DA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018c5ca512a7-ba5e6eeb-5046-4d6c-a260-eb3ca42437b1-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c5ca512a7-ba5e6eeb-5046-4d6c-a260-eb3ca42437b1-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM8PR11MB5591:EE_
x-ms-office365-filtering-correlation-id: 823d2ff4-aca7-41b1-dde5-08dbfb78df81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TM6f5Cf/HaMeEHqplOUyTs4bfWrVJ3ZXnb+HdK8Xlpc0zgSzjgiUvFjl55fiCXXyevVuku8M0lDAwofru/minWDgcUaW/5sIyPO+0dOBKXy4SA4dZnv1IkembrNKbJD8kY/4PgOuZR8c2Hc5WFbfmoJhI0D0yE1Hu6e3vGUWouZ9L/PrDXqBybIVKfOZwE+5AMLdyUulZEMf9MEb6z23L/BPSCrazfWg81BnU5hP9esNRfmCcQ9Tt7dv64nRybb9o6IxPXLJnwo4Wfi+swqo9mSAQFHbHd44eGVZXba6AmT594WlrGQsXPuMsoGAHYJDFQuAPJpQRpFJMcCdhZWsuI6kwtnjXhtA+URqv/BO7juVopWEg0H7XLiVF9wmYHOu5w05iAS9vqqMtYrqQicJh0xCFXZViwTfhzzwl74GaAUFTMA1t/1Hn724g6Il9HzJqHj1twHIYhAjHW14D5g3LCJm/UBsSOMbGdUMDUVpMnHipkVbTkRvFQWeXGupkDygLR68lVo5gMt2GE8JSpBLxKlEaq/8PtvZtd5azTIdCSn/NLF3BICqOfMxLvtUMU18PASiz0H6jdsErBS1ge0BqV+9kkq2SRsEPOynf5p5n6yny2Jm++b/WEB4ecOlhf5n+3SUHUTgaVxfGOWxGxyutQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(366004)(136003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(53546011)(478600001)(9686003)(7696005)(26005)(71200400001)(6506007)(966005)(122000001)(76116006)(15650500001)(83380400001)(2906002)(5660300002)(8676002)(66446008)(64756008)(66556008)(66476007)(66946007)(41300700001)(110136005)(316002)(8936002)(52536014)(38100700002)(82960400001)(38070700009)(86362001)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XqW9RmEHFaYEl0jZnnCXwVwatiYbLxtJMaGgz/J2O8vblBDa/lp82xI4W99Q?=
 =?us-ascii?Q?hLn1a+oJqEe+1ipAopYPOqUPdlJHpXk9vwabERzjAa7OZUMxPr1TgIehhZ/k?=
 =?us-ascii?Q?RMBgh50PVid3Z9wmJzIfGe0MwzdwEC1A8Pn87Yei+RfSojcRiP3tzQmmJGit?=
 =?us-ascii?Q?xJ80KhgBDVcfy1/0Y/hwQLwpCuk1L9/3e7AL2CRDyAck5yj92GY6tYmQ1nEG?=
 =?us-ascii?Q?m2YVNRl1MqDObs6syynvnX6kqNvhYnwOFWri74mcA+M02r2fiHNngcLd8Z4t?=
 =?us-ascii?Q?DKPH3ajbJb3eZ/wfzqVqGgUSQoEls3xladgmGyrcsO5krVn1WG8afmXaMJix?=
 =?us-ascii?Q?7T5pHQEzwOTE44yNOAEtM85TrVGttCDXjClOlS6EvT78THjnmIURbi3wXzBl?=
 =?us-ascii?Q?22dDPkIpDZ+B2tSj5iscnTj/9wahqyJw8kHQoe72IxL1DdXinS1nr8uB/2hi?=
 =?us-ascii?Q?mDL53oLMOKVSoUTRdI7aiLK9pscRPLTXttxFk2883QDduvErW4juCTiHEY76?=
 =?us-ascii?Q?g0MviLufoBxDHqww8tKEVI8hzdAYv0d2NYzqGPscmlJAffiDrH9ARskAGNt/?=
 =?us-ascii?Q?zryQ335hU82CgoU2XN7qwWF6blJOAkS8KhmGsNspNvYJRT6H9JkGYLIXlT60?=
 =?us-ascii?Q?pz3b+wyIdaDczXZHtgUVof/zUK6zaCn6W+2sTMQkLwkf1JMyiMSPUxZIUWh9?=
 =?us-ascii?Q?9dwk9M7nHVg+rKRl6J/Svl4TxxMslfrSHgvFJQCWZpR1MZCdAV3ER2Hz0f1P?=
 =?us-ascii?Q?ljTODLoB1t5Xn6IkHinSMBUS25uJCLE1MyCdmmc/VywKUUONaQcFhOyULjBI?=
 =?us-ascii?Q?YhbDQOnn2a7rqBucBeqmNSFCXg8iaOjXI96EEOHfS7H0RiQOjB8LNmpby1gZ?=
 =?us-ascii?Q?THyUJusJeA3+Xm5f8XEL7tw9uEpkS1a5y+fzUYGLFr8pfECmwdRijqhCTgum?=
 =?us-ascii?Q?deiE486Fwjk2+f3M1yxx6b9giUSfS6sJZMI5KIB+o11ADQsgSWOGX4JNIItv?=
 =?us-ascii?Q?jRoXkWy0nfH+tutOjrC8CS3YEcLjYaf524NLtJ9M8fMYvPxrSbY0GrJnk9n+?=
 =?us-ascii?Q?q6MiLCTgTVL/27vuRmxMtQdMXa+5vlQRjE871FEAkSh1kj3lNR8BUxwLmGap?=
 =?us-ascii?Q?0Yq6MdOj33FgnZGE/tAA8mUeAvrYAcBvAKMF9uZk8F+arux7M5tZle4KoTnB?=
 =?us-ascii?Q?E0UNDQ/2UK2MeNOmnpKjyxlu+4Sonu1ddcwww3+bkuPL7M5CklSkTnHIw/XE?=
 =?us-ascii?Q?wrpiGyUJjxWsJNpFkjNuLkjpqi3OVmmDTnv2TGGmCbsNGCa+HbZLIzwoUAiW?=
 =?us-ascii?Q?hglrrH5ZW2R6RrRLtlH3MtAIgnReIWcnNbZ+Goaks2nLDBcBTgPE9CCYouoo?=
 =?us-ascii?Q?cqu6QsNzIRbuxQCWJSMAaMI1Xy9FAsZarBbnTAIcgkgPyi5yXsQhSVj417dy?=
 =?us-ascii?Q?IOA1LylR1mjxv8z86SWUeOngvih2hW4Xo7nqDtzeKqWYUnhOyMWMNxvit1XO?=
 =?us-ascii?Q?kmfOvwYm7bglA24snxW4kFj+OOuQtEzC2E/070JnTCe0CCzz/o+U5AoLMMUc?=
 =?us-ascii?Q?a6MBXOz3SdQFM55uVpynZp4JRfRJl7cNYQSO1BZq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823d2ff4-aca7-41b1-dde5-08dbfb78df81
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 01:14:36.7445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtQdt6IH5znjhJ/H54q6ZNYYAZ5Wer8ZlC3ELPvT1BoydIeI4356wMfUuSgklomVvSCXva/MoZtoUuDoABDQBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5591
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 01:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192255

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.30.r=
c2. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
 =09
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
	3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
	4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	6. Edgerouter
	7. Beaglebone

=20
ETA for completion next Monday, December 18.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Tuesday, December 12, 2023 2:10 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.1.30.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.1.30.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.30.rc2
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6320
>=20
> Build hash information:
>=20
> bitbake: c0d60794a32e3f8bbfbbd6800d87ef2782aacf2c
> meta-agl: 512d244d48ba0d33f609f425a6e8a907b178cdac
> meta-arm: b75b8ce1ac10dc3521c0f710a4cf79bc7e985cfd
> meta-aws: e317ca5861b23dad5d0b2468fbe3b4b1ef367194
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: 9135c7ea7350d5d241f4afc3b28087122ebe2d19
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: 55157aa2f8b157b1cc63e1134d9eba6db0cf16da
> poky: dbe19706ec01c1eaa1d377a792e7d825054050b0
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

