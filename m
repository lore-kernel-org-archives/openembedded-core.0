Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E40C48BC4
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 02:05:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web11.32882.1708308343634252799
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 18:05:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ZXiwHMHS;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708308344; x=1739844344;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=k1cHuaCiaRqQZMOOz85FTK+drPggMFXcBAoY9o/JwUc=;
  b=ZXiwHMHS995hULzNWtUPC0MzX+xF2jbzF+kcp1gcP39bY7XuYXrkw2Sp
   vnDhfMmG/CAADx+DHh354I4ZcCbkddW/qZwfRgm9HMotvFCIQhMX2WmLe
   k8mH4jHTGLWcrAGPO0hOTbhQS6t0MIOC2692q/TuC+tAO9bNy+dnoteJa
   5WYFils0lCohX+M06TIwWZSFrOHK+73LLvHOqkOdbUZnl2wbYcxzpHYtt
   KAdpD7Bgc0M1rUR2TCV6vzRL0+ntzksReiSx5KwgNpuIowd85mru3H+rx
   P94Iq6yIRBH8XJrLo6m7sY1fCMrcd5i3KQSzkVf1dGBlXdFqTkmASQvas
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="6197297"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="6197297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 18:05:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9020275"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Feb 2024 18:05:43 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 18 Feb 2024 18:05:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 18 Feb 2024 18:05:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 18 Feb 2024 18:05:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fk8VuFbsmXT9xzQlXZKgJI4nehv4FndlIWN5I76yoAINUzosbWHN5TaLbopAY2D4e4yoxhIMXs7KFiZXlEuer0rSVUJLRB8vo20p1y9v6BCCv+XDWyorEf1dQQHjjHMce9qiqVPJLscKCYewLut5eH194/asCVsP1vp03U9kYAH0MMSQNdUCSHKiQUALSNftT13kmY8GJNFnbQUOcdkzzMjkdBCkmyZWwrFFYoMDBvFS/RQUSfG36PxGwj1SGoENfAq+oeq6lCES9eD7FJ+K/27x2f5j38u651wQpCq4ziWx7KApYeUyJP+i9kcpKYrDN0Gohx2kvJQyzP+SIvViOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4UZ5RdZ7rLO+et3I1qQ9LHDdkqUg6uDRJojLs9MnMQ=;
 b=XKvUXjUzgSvn1jfEUCg3N8I9QTTMLSesJ8pF7RBQ8qjY+lBjU0Q39CAcCKwWPosEATNwjJHNsIezy+lmDQIrumef/Y4NIFSJefm8huRAL1WKXPUQlkNhmkkrb/2qTz3W/fJ1JSKJ7WRlRjMu3wBY3iADhshLYCfaEUSVf1WgbjP3n+3yi1mpYEcgjk+YkOz57h4RcgMK+czkOrPj97z9HmZcc7vq9h3MSc4/A6BbtInT9anbePB8+3ltq0kKjqn1WG+ELvXfJ4EvThNKsLyMsGSOLGg9z8QmVofOxv+YJPJp0UqKQnmfbZT/wRmNAYR68u0ZGSXFLm/zr+30HdMGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Mon, 19 Feb
 2024 02:05:40 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::1025:6d41:d45c:948c]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::1025:6d41:d45c:948c%7]) with mapi id 15.20.7292.027; Mon, 19 Feb 2024
 02:05:39 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3.3.rc1)
Thread-Index: AQHaW8XhdmR1+XWAm0WqpxGkHnsR17EQ9G0w
Date: Mon, 19 Feb 2024 02:05:39 +0000
Message-ID: <DM4PR11MB7760A0A6A92BAB370BAE0B31A1512@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018d90c4ca55-6841b832-b832-45c0-9d4b-dc21e42261c5-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018d90c4ca55-6841b832-b832-45c0-9d4b-dc21e42261c5-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA1PR11MB8476:EE_
x-ms-office365-filtering-correlation-id: c1599bf2-0a36-42b9-7061-08dc30ef4551
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0eLpCSVPfGf1Rt7/17TpNy3MQrWYIxBfz11A4RNLOlwsK5nwBPtEJK+sZWWgVU0XmX/PjRvB+3+OXxZ/DQ0HDV78lxlUGE45zUWETAsvO4DF0S2HQSl9K55J8eawrmwLK05nUIeBtpn/vkiUbUZXork8+QluumNCdQcAi+HTLp3AwQjAep8k9+M6Mj8M7k2Y9tcfNVHAa9o/h44OOJkvc4QAZmY1X7Wkzk0IiIrfTxBzSb4bSt2hPBObCsLRhhTa8/bEP4Bx0jUjKzXrcpj/bizn6C7NZhyHlp3ERDpWZbHNQ0+IxYFFxixSCphL8Ovay4QAcycN0FHmVK9dKV0MXOiMtOn/CjT8cI5RlwxmEDb7LcOx2N3gCjyudPgxTESiSHsPRp9rA80nZUijg+Gv1Fcn1Vj1326AQlhralzGeOFClpfKpjQ5KiDUTnN9NgLSa9wvYdbo4R7oR5bUMse3+ynaXelBNeSfjhjWP6VvJ0kxzMkDjtuy69ApPC+pY3hAwMliiDyesghuNSpLn0QNjlxub0ggM4YgOEKequlUuBDAk3yxL+E3ZRL7n983pwJwbcNqtgyzS/Yt3hA9hYuvVwL8ziO9PrK90693cySgOJ4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(33656002)(83380400001)(66899024)(86362001)(38070700009)(110136005)(41300700001)(71200400001)(316002)(53546011)(6506007)(7696005)(9686003)(15650500001)(5660300002)(2906002)(478600001)(64756008)(52536014)(66556008)(66946007)(76116006)(66476007)(66446008)(8676002)(966005)(8936002)(26005)(55016003)(122000001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nBdirlYvd6FSry8d8eGZZrcGqFb/bI4HOAfi0eb8HAArjZbril2Rgwnf4EPY?=
 =?us-ascii?Q?IInjzC/HyMxVB8bg2W9F/FJMk2sAw4FIaMd+orbOSdr11GntPufjk/+HHQlr?=
 =?us-ascii?Q?hMeNL28T//RWXYwwtmmO2Zg8BifNNR5HuYI2Mka8FYuUm3ewV8gP7MTxFKhk?=
 =?us-ascii?Q?5DwpoVL+gkbrtoDUbnAAaEdSCcvAZJq6YppjhH/tR1sG2+C1sVzNscJAKOkv?=
 =?us-ascii?Q?5AXmabZMNtFh6Jbzrf+MKuLMI2ocfAy7DZa6usMrp+KFeoDSo0hu7WfITyDC?=
 =?us-ascii?Q?O9fqL00AvaSLPfiyi+N2UCDKwgWbdQhM1LFGdWlGhLbH2XAfh68FaDWThcvU?=
 =?us-ascii?Q?J8pq/qx6bLi+NpIVoaNoXf06y/loq7PQ7rnXBmIhF9exWZrTChEylI/uEcPC?=
 =?us-ascii?Q?dVYgPsFiPtFfagKd/Ag92VXHsW2YqRrPd829ZGIL4fY1U2FP3mmsGyUMgPYx?=
 =?us-ascii?Q?sfLi38xTFFEH9QjGPY40VmDosKnqhoUSV8NPCQpXGFz0u5gk4YtTSkppqvYP?=
 =?us-ascii?Q?XRo1PxRdto3L3UYWRVDDC/jxmDVI4KusVEvAam9msvR4b62uddHfmD+e48CH?=
 =?us-ascii?Q?sAqJQjGfqvs4jsxWuB14IGlgf4ZAo9pIPSRgwmysBFj46ovf83CgLt2c4SQ2?=
 =?us-ascii?Q?065FevGXaA6VvVA7ytc882YryR0ieYZfY08QH+Du1shs+WUzi65yBoBVokKx?=
 =?us-ascii?Q?oRqAjLcF1MVnWB+WLf4p+OaGq1XHEjz8i7SPUOGxDi8G9SECJcsTpBTXYdmJ?=
 =?us-ascii?Q?u15LfhQaDvpGhue45DZq3uIe+OjfuYL1xRmfhFgv/B43Wp3ilmPn2OsN1TZY?=
 =?us-ascii?Q?f7CgI7H3F1GmSRRqKDD0ZxEoHTqdZM1e9tKLG9fNzJ93lxMDoMCK9m/EvX+e?=
 =?us-ascii?Q?ZpF+p/0oG364C7vVKl6VKBllFbgq0Me2kZAIENdhqEb1g4XKKd5+Pt/I8LJm?=
 =?us-ascii?Q?LyqhU3agFZ4QGE6Pt3rJpMsco79uxD99B6WYvp2u2lhV7QTAGeB19g9exSSO?=
 =?us-ascii?Q?YyFK7Ou3frxRne33zWAKHQfiNx2HsiYvg4c7j7/gI57qPuclJULoufRsK//h?=
 =?us-ascii?Q?0wetnSxpcstEQAVeUf0zwiJXFSeDnP44bhqH66YJv+I8SutcNAXGBUyI3L/R?=
 =?us-ascii?Q?NRv5SFnlPq4kUuWTZ29r6fIhEkP56XWkK1wZnyfPpaAcbjUMx43uPezDSs+z?=
 =?us-ascii?Q?ux2qS/kH3hsLHtUCxSMmHh7pS8xPz+wZg+X88i58vwJMfV8aQpY3FoRbzY92?=
 =?us-ascii?Q?njkpZTDikYZYph28LSDCwd6RtqJse5WqNi1rYOkOJ5ulbVH4ZrRvcXsfTyfF?=
 =?us-ascii?Q?+Oqg2q51S2q2E1D1HPdOB2LzspMPo7xEX6VZN+6n+sskuFZgkvd23Xj1zbnY?=
 =?us-ascii?Q?6E2i8v6TTGHMttx+otmv555MqvDA/n4nCzHk05WPV9ii6foDaxZha2DADtJj?=
 =?us-ascii?Q?nz/VTWYQ5DfIGf/o5G8imdkURwiInAnS3enpimX7mowpliFDriIk4d9lweaY?=
 =?us-ascii?Q?Qz6ROYcsKqVUyiv2tarBF2yBE0bF7gsJLL0Ti1GjHVOZIoGHITvPTQZkoW+o?=
 =?us-ascii?Q?nNPX8WWZbiopHOL9q7XqfoZv53fsjqsZnZYmQot+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1599bf2-0a36-42b9-7061-08dc30ef4551
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 02:05:39.7752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F6FERYUCR+Dl7p4fXdDr3iFsQ0a7QoFGBAvoS9M6CvuhowTJcV9RbWg9oA1oYDFY0C+eSo0870TEo05XLo/gdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195860

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.3.3.rc=
1. We are planning to execute following tests for this cycle:
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
ETA for completion Wednesday, 21 February 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, February 10, 2024 10:07 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3.3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3.3.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3.3.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6552
>=20
>     Build hash information:
>=20
>     bitbake: 380a9ac97de5774378ded5e37d40b79b96761a0c
> meta-agl: 54333533f293cae29cf00948862ae86c8c814197
> meta-arm: 6bfd024269c3888dffef7540b0618b04ee3308ea
> meta-aws: af73d3c35933988ce286c49696827ffe63e5785b
> meta-intel: 8d633bd01e20e31c0dae58cf3cd41eddb2f712c7
> meta-mingw: 49617a253e09baabbf0355bc736122e9549c8ab2
> meta-openembedded: da9063bdfbe130f424ba487f167da68e0ce90e7d
> meta-virtualization: ac125d881f34ff356390e19e02964f8980d4ec38
> oecore: 0584d01f623e1f9b0fef4dfa95dd66de6cbfb7b3
> poky: d3b27346c3a4a7ef7ec517e9d339d22bda74349d
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
> View/Reply Online (#384): https://lists.yoctoproject.org/g/qa-build-
> notification/message/384
> Mute This Topic: https://lists.yoctoproject.org/mt/104272169/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


