Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DDBC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 14:01:21 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.7792.1678284080273428391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 06:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=NtC7MFTF;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678284080; x=1709820080;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=W/5TO386LAYXQ6FSJJQPc8WxYOhnreZ836D+NTDEpUU=;
  b=NtC7MFTFul//B3CG8/KhMfJ0aXm+gg94cf7PG5sH6eQs34oBlKTw66Vu
   1cu+yEonAipC3MNf4Nx4i//QogkH+PV/clo6OcVJ15poHn0uZSXnZCELj
   qK1XgNIjpf9BjVVoh6WMzWTJqQoVwIrdcYNdKcJtaIQplVYwAYISq1/+O
   aE2MQDAUSJgckdPVPPjmKa2Tedqs/nqhFAE78woXmtCN5Nwn8g1hMXwSP
   Q+zUJ0c6jL7hcDvVI/vCT+wwszmdUGpUrNp1HmWrGBUTw1pKpdANJEg/F
   wScrd/o5fU1V1tU1+4jndAEotygp2kAqyGGP+KmrDGA/JrJz2YtowM7pZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398735415"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="398735415"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 06:01:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787128053"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="787128053"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2023 06:01:19 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 06:01:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 06:01:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 06:01:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZvyVQbwTmccMQU+GY04ANyg+QPCxCtn/bpyLp/LJeJz2flVvePZixS0TSqA3mRjsDBcRVyB0FSdBueEUJ2JtWMYEfuEzhgUTBLUf6sNTc2M5QochqtS00ZIqIYOtY4St8t+J6TXr7TVF4KNPDzPns/v17lJgiMqNJkRup1XaIXdGGdF2f0BIlH6gvb+yCNvdC7SkCHOReo9HTkh45ZvB87Gm59YB5bMVot25lyu0ou3Jt2r3VPHC2pkhpUIvwq8vjM39Y3s+jc0D+hOadl5mv+CcRiXCnHlgvyIroMjpLQ23M9vyC7QrFnUNDHCu0+aJpOdJPS9lD1E8nUi4kuy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxo6hSy4j1GxBi3KFmXZsJKX+OmwxErt8DnKuoMwqbk=;
 b=ROgPw7Wk01aeMyBIOScJYDK9qPFfEqZP/3zY5AEcO3EQ85Sm6DBJB87cqYgk+KocNOLtUJ/lPysfxu0Gssb3+0WvWdcXFAE4duSIjT7HDdWOqU5cYRu6L5gxZk2PlniXD8lZqcv0UV9pFcNVfMhkWDboEXI/mDODW/Tyv6v4X+HJVmruOk6UidMuPBw7mp5w++URtGrJkYHKuqM2R4PTqZBsRZ6dcwFw9jLXEsI+PwAPSJgoUiHDuORXTPM2SeyA/V+pnjZsgq5RJS1EV1urDlD0NbjVWCAK+RP9aTf8eu7rjSYg4Cnm+6zgqqSnMpEWSdmnjY4zZIvwWYJqWBIVEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Wed, 8 Mar
 2023 14:01:15 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931%2]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 14:01:15 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.8.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.8.rc2)
Thread-Index: AQHZTJcbLZJmolpwok6aDizVCu+s0a7w8zYA
Date: Wed, 8 Mar 2023 14:01:15 +0000
Message-ID: <BY5PR11MB41521BFD74B0C883344E6F32A1B49@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101869f8b3dcd-f5d922ca-3c22-465c-9885-e608464a37a9-000000@us-west-2.amazonses.com>
In-Reply-To: <010101869f8b3dcd-f5d922ca-3c22-465c-9885-e608464a37a9-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CY8PR11MB7012:EE_
x-ms-office365-filtering-correlation-id: 04f358e3-9785-4a00-e1e7-08db1fdd953e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HL7UU8ZY2x5QBdBUr3tCXuS2sjDy9TMol918igDVtgHhl7KQuqyCXkcC2Z4zHN5QUImAeUCUCDiqbXrmEVy8p6WqiaCt/TT6vajlwGr53BEMkR4lAxI4K9dr323A1fGKdvDz7XTu8iI7OlNoqNFsJdiMd+snvnMtxSE9u74/QqKz9ZyNKOtBjAiuCP+S8R6wVvMFZs5GZ/qBFX4Vh040mkNfBlWnn+InJ+sTuUz9tcUJS5EIfOp+Mf+FEJCYsWrDZFSJacjlhZJKYpMZ0HkvE//Nn0rWZINg2JeshfJDRXlxb2mvujx0ReokpQj4bobVcw2+KIF+NffoogL10N+mWe4N7aT/JbCTLAEFUhuUZDwQotImdcyhSgY3FG/u5zFD2zovtTSen9qg/+2N6BcBgRS4p7VQv+FyUhjWK9OpSgVf+CibOfxgH/o88rqm+EeUAHsJxYsgc0FjjPsBkXrhS+EvbCTDsuC+Jc3eSpmYXJzRNANR+jw/XG3XuMSoz+CoqzVTVShvZf4Uc85IgL6FqCJXbuJubW1MoYvWstKMNe7E7hG2KjaGaycgCzNoC9UaxYxjq3HQHsancOMZjy1lGIx3o96Fx/2NZtdg+qQHxR0dKNjqT1SNmU0meQfk8sMr8GUXBeYmf5Io4rgQWNNtWAPnh5+jxdycJCw6LEF87aZTF3UaXDDQdnweKUF66oP3UbkMo0oKl0fc6CHQUXJvQkQoDkn4wzbVRrbQiERwmTg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199018)(122000001)(82960400001)(110136005)(38070700005)(186003)(5660300002)(478600001)(9686003)(33656002)(2906002)(7696005)(966005)(55016003)(6506007)(71200400001)(26005)(53546011)(15650500001)(86362001)(8936002)(38100700002)(52536014)(66946007)(66556008)(66476007)(76116006)(8676002)(66446008)(64756008)(83380400001)(41300700001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BIi+BvnlzCbKoZL7o+XE9VtZ5hVC1cv0doTHOaGex40zexe+XMw6HHg5K0VU?=
 =?us-ascii?Q?bsZr8Y/AjhxfvOEN13gL798hre3aW3tcovGZpSCIRiff9iAQa0yjLfCxJpGn?=
 =?us-ascii?Q?Zff8DTgkR2w0sVKcIFKebhNHNrDT40vXPfVumUGdNt66hDSXlYpoxxUitI2P?=
 =?us-ascii?Q?tPy91PqxzJFZ6s+hkNQgjZk5pqzNAxXFibMpjzHHQQxsByR4r2fb5C1M4LfP?=
 =?us-ascii?Q?SlCZpM0lw5Ir3spTJn8YLjin6uKjqCga0/rwF67uZaX3iUdTVz3mNsOi/Rhg?=
 =?us-ascii?Q?Bhkrpd8CZKqpPfZGlpV3uZ/KSS0UIj1jOKhIJGuT6v739J/AbNY9nmxzGPJz?=
 =?us-ascii?Q?9VVFbdHrpI5HElwqqcYNmuMb251LI5RVALict9l7U/rWycG8ci5hwzCQCL6w?=
 =?us-ascii?Q?GexkWLhyXmcpKKZMCeUJLI3j5PACQ9hMNg99CZiUwoWU796xZgEccv5aTwxN?=
 =?us-ascii?Q?4DWbMELNa5LGhHVqZqOn5aNuJ82im5oI8JqxwP/TeJTa2ofnfYR24/eWUWsN?=
 =?us-ascii?Q?0q0k1lvDo90kPPLjRbZXzUFj7vLbj3pQ1bx5/M+z2ejQMI5GtK9wyyjvcDwQ?=
 =?us-ascii?Q?Mxvj/QoqO632bLIERh1YCUEoaMWCJLj9LoXDr6MXuWWLQoQed05Kb1M35zdY?=
 =?us-ascii?Q?x3bwDfxO0onNCFAUqpiHL1V0a2XmmYBgcd91RiH6pEvWLQPK4Zo8hCpoanmp?=
 =?us-ascii?Q?USigbU/BSgtezc/JVQ94PcDrBNzWJ5VNNe4ljTDqPbCbkzriuULvFQbkYtFX?=
 =?us-ascii?Q?wpK5OdOcXtQQVfEwhFRYlfYTTNmka0DRs6U+Kp9JCqXEP2p0wfnA0pY2YfmC?=
 =?us-ascii?Q?oKIglhPrptjuqlLcp6k7Ev/ok8mGBxui8IWCJRji/4nw+DgtL59/bknZ1Zck?=
 =?us-ascii?Q?4BICq9Vp14WYltbILJRXjUzV4vBW1hvXVAFKavYU7Xmmo1+HGaJgk0zmWvcP?=
 =?us-ascii?Q?W3YBFwWuAt2qe/51fZ/6fVtoGBDgc29bcUQZ+vqm1y0ZcktmFVMndGRtK6Sr?=
 =?us-ascii?Q?WepFgWkGZUyKDUzGI/EZLY4RYdn6bZrzxd8TbpCqeMkexzXEZVTh4J8KJHEY?=
 =?us-ascii?Q?ZnEpL3JTBm/Ddo5M93QZnKqLrCGMtrje3/39LCq2tEqNq3UIVy/Tqfm6AFh4?=
 =?us-ascii?Q?9xqLYM3XWkbVpc38BgqJ5/th+LC3ns4D/NrpcbtOSLL4Mg3IFJQHA/J4lS7G?=
 =?us-ascii?Q?XmXfQMrHPuZOXmnkjWArG5ZFpnU5FF7TIax0hmhTTvP98bLvFt3wrMserRQL?=
 =?us-ascii?Q?Gmy7codKBt3I10qsw3D8xuI95U4O07GZyP5YL6YTO+PPwDr0s9vcDw9nWxKZ?=
 =?us-ascii?Q?IEB+LDpWqqOqkwAL8eGu/pDWjG73WeM27sJlYhjFocM9SDaBIlvkERse0ibB?=
 =?us-ascii?Q?yZqC7taqYWnp0/zRpHc0meWN5fu4xQ2MkrcNivtjgNWMiWOgYl+GI1F7wXoi?=
 =?us-ascii?Q?1iPrb5FcLn07HYf2EXWbOfw0YxZf9NkyHRDONnBoPZ1KirjSa4woSENB67Y1?=
 =?us-ascii?Q?gFxA1JaS1POJZBcGTApPKiPxYNsdrQIOSIbX8wmeg93DaQZMKyWlGJWCL6Oa?=
 =?us-ascii?Q?P+M0fzraOLA8Ta0EMOCJ9Quukxz0LlRzkaiYCXCJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f358e3-9785-4a00-e1e7-08db1fdd953e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 14:01:15.4904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mljj9TCWY3T13jJdbobaPDh3XK2OfjBIN/aKHsNIKgkPp7nxi8BFCoxPMQvtB2kCvxyQSDq5S3iYCFGs8MPEIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 14:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178174

Hi All,
=20
QA for yocto-4.0.8.rc2 is completed. This is the full report for this relea=
se: =20
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Thursday, 2 March, 2023 7:39 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-4=
.0.8.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.0.8.rc2) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.8.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 9bbdedc0ba7ca819b898e2a29a151d6a2014ca11
> meta-agl: ac4fed9040280e687e45b38b4e59940fcf2121b3
> meta-arm: a0216a41bde3f191037332a9238648bedfbc61bd
> meta-aws: ac332252f6b50071a2de47ddc2c92ea65f669d16
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 64e8ccb47e11fc021a2a679f2e05d849b7518461
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 82c75b466e55d7dca7a2364986ecb704cf63d141
> meta-virtualization: a7413c5d7568ce91b809ed11f84305b1afb468bb
> oecore: b20e2134daec33fbb8ce358d984751d887752bd5
> poky: a361fb3df9c87cf12963a9d785a9f99faa839222
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

