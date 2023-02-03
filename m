Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A281C636D7
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 06:17:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.5028.1675405019326032062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 22:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=e0GUWLcJ;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675405019; x=1706941019;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=hootVrRVNO8Ynz1fW5/6W9W8W3Cup0omNW9v5wktayA=;
  b=e0GUWLcJqm73S+KWTSazBFEoUxUB4tdfRT2+6Tn7YVxVyVBf4u8F3Y6j
   e+2Wx5gY8Y+vSUFWQ2ZQgtKTdIvFEe/I0DQ9wAlXdnteR0qJYMkDXUtUy
   YmaKbOIlSEbz0rhIoR4pIwQ0FAMOR+LwNMmpugw3+HXTXqJE9Bp0TYrf4
   UoXVpbLaegqr5azPUQwWrBtAxkQQjxlANTdGFb8TTTCidEG2F2X5HBFo3
   rU1AVZt9plT4ODuX7QLSArjTJC+lEp2pBfo0M1neBSUxKWiU4UmIJasAu
   KpCOGCUuZh/yrrE8S/55LYhazFDWaiMpFf1kSHm62+nt1/63zIEK+jxco
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="326364306"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="326364306"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 22:16:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="615594679"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="615594679"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP; 02 Feb 2023 22:16:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 22:16:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 22:16:57 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 22:16:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6e/hTPdokSt4PRmNSuJ+cz4/u572qn1xXZlhO7hzCU+5EuhkbF0Hg5gfED5m7NLu/LULDLGcRMvUbhn+lkPLixRkYntPTLQbROdjl6aVRS+xqO20G2b9avxXmKU8J9K1UdHQL+wMKVLZDwwdQy0VkdQav7VO7xu9hfvWmbKe5TvqPcA8kiR003RF1nGHXwUAysJvhATzrSFtUpVUuIu/E5TPgR1toQIuvmoRrr8nMsFdzCHLmD0wAl7UCW2llTRIwoVQ3o7rmw+RxKZbDuu194m8QqzZYZzBLrCCKQQtKhr0gu6aUOmRH/1lmauLigkKAw7Q9CrINKCvVbdI6Sm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DY2Lx8Jo0knyfV8TPHcFHL7jJ8lzmQ/QffZym4qn0g0=;
 b=C+6ihWltJ6Up3S8OzR8ZESs2yBfUfs5PVpYUS5g23VKjjZdSWCLceKEKqUuApqs7NyuD9ocnO3zaMhz8y6LhIe2a0ktVfquzOcacYjfLg4fTjlKsh+o6D2mHB+N/terjwGG4MxI/ZwjN5teYhtlJsAqCHRDRlJtkzY5E9codKISnDfW5445BxGm+tSH7tufw0lYsq1J19ehEV26cZChDzYOB24oSyPLTYHtRgXfwp5gCv75HTGv/Lr1anwKvVas3UqJrxIr6V8oqb2UMk5FwoaF72k3WPr8gpMtIVhZcIqpHc1dqQzhnsHFb+OKtxL6HnBmscLEgCZ0CrRv1WQ0KNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 06:16:50 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%5]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 06:16:49 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.7.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.7.rc1)
Thread-Index: AQHZMqRhkr5w/Y9sC0yvL6TSIsPCWq68yHHA
Date: Fri, 3 Feb 2023 06:16:49 +0000
Message-ID: <BY5PR11MB4152D448571F77611FEE9845A1D79@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010185f57dccf8-29734aad-b7ca-410f-9a47-21affbf045d6-000000@us-west-2.amazonses.com>
In-Reply-To: <01010185f57dccf8-29734aad-b7ca-410f-9a47-21affbf045d6-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CO1PR11MB4930:EE_
x-ms-office365-filtering-correlation-id: 40586729-872e-4926-55ab-08db05ae3c4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L4urbkqVZTfau5VUvLk6KxjkJmr0VClaxw+ZHAVKh2Sv3LRZ7SDLFvF89uBBBKqjFQLehsoIsKVV+UliGnD7vjv2zRitD1xycvkq4XB6mR8RpXGpqLxGegqkK9D2rpaCbJYAmxDwMWGgFQzbyCC0yomSY1+ZxSH3+VtfkpqhUYGaRnZT5dhYuwe6ZZAvmHJfDztBjxnEVgKG/1smudFbQ6NDxpjgzOGp7blxlP5WL1uLHyOgY6wb/aUzrUEdtgXYKSGtDIPIot7QShcYHZ23Mh+S3Qg0ML/XFMp0WFNIRaiHOetNlJiREdIPsoF0TXgZ8QDcFReWMxmRTwx3CXvrPqCM7tFUii5GuJnJygIOJhmgcR0YSJPhju7bl4tJK9t137Bx+gCFWdqdbrQ9K3Q1ec18NDTEAKiCG+IiSdkb+ZLM400kSGnkSDMuEP0+vrPQK7wispCh7WZ+o02r/J+3puu26nQHb42gzdS/jTAOQjr5ZOlca21+AHqdQ3PNWpiij0zmmnnJCToIFIrQS6Sg8MmE864dHM1lRK2wi95hZ9fXfLljThY9Ift8/+i92EB464lR196U73MO5WEpKOpxY2l1wMC596QuofCYzcGpbWgPJjZyt62LQbhokYs/Y/uiSfgMub8H5Vt2cExpfrv18BnBeUVvh+NaLGW6nD9+Vwl5RsrkfzlzfRpNeC0FCagvoBFia/tIctIhfVNTtrV5mtxdKYGc0WLWEwh+L8Cf8oMJ5s6UtkCx3T+FxFXaNvzFeX31SJF3189JbfqLA33QDw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199018)(55016003)(38070700005)(122000001)(38100700002)(66946007)(82960400001)(7696005)(2906002)(8676002)(41300700001)(15650500001)(76116006)(110136005)(316002)(8936002)(5660300002)(52536014)(71200400001)(86362001)(26005)(53546011)(64756008)(478600001)(186003)(66476007)(66556008)(6506007)(9686003)(33656002)(66446008)(83380400001)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X7fhwM2Ft3GRV7LpuAer7yBpZjGxZB3MVAXsbQUruzXloQvgcqHLGwX3QGme?=
 =?us-ascii?Q?TG5850QcNe4zIv+C5nq+L5a8WTAeAmnWMyPUipkDtBHj670z5Kt1CUqjev+P?=
 =?us-ascii?Q?b0p29aJZ/9PGv8U6QeK+8xfgsNVQ7ErAVtrSB2ji0KYh2tttnkrMn0Z+vYMg?=
 =?us-ascii?Q?FhtzKmj2en+5VO4exus7EoFgayXoagZ66nB3E1iFr/VUBo4QYMcNCswRPqJE?=
 =?us-ascii?Q?+DesrY0kC5GhX7NK/rwR0uuciO3KTSJzqMGYas7bbVbc1AfiXuEWldRwROsg?=
 =?us-ascii?Q?j2GKw4/qAXLDtwYmTbXkvIajLngSxvmVXgHO7GsSRDqXWEclwLjLChv/zxpb?=
 =?us-ascii?Q?sV96YZ5lmT0WwSjF5YGE3tHD9bIdsw2+IyYuKFALoEy6HvmLdCqbZf/Cf40v?=
 =?us-ascii?Q?icjqGOF7E098wi9R24DGJXy3zZXtS7cXH2ZVtoQ+u4GDeY53raMY5CVXtUHv?=
 =?us-ascii?Q?PcqK2vnXaH8Sra7an6wKFTgN++cGzUZff+sJ5t3DFGhPiBmh4UBL1Hrw5Az4?=
 =?us-ascii?Q?uGOKEKLQgpqxfZP9B/8CwSJEywTRrnR6Cfp03AtPwqgCyAl2/4w/d1lEspFg?=
 =?us-ascii?Q?ng/jVLp/gCxYeA/G2t6OuvxLN9W2erPQto3BB9amYi3PW1vM16K3MLi/lWpO?=
 =?us-ascii?Q?j6+pCVo3KuVRqi4cxmR+UWpOtUtu07WNaCKcJVu6dGLgyD2jH6uw5YgXdJ5B?=
 =?us-ascii?Q?dU5Kel2MuyQRSTzueg+ebMDVSXmA+EvZIgkoOwfDGmRXQVRok4S+4yyC/TnB?=
 =?us-ascii?Q?Tl+YkjPiWQqDStdBo8m/FEWGwbOkJqXCL7gVUz1xhbolabn9G/m/ekLa/6PR?=
 =?us-ascii?Q?JDeM4s641uZiyGLKmBLl4jn1A0K5LK8N6V7PcrSU+KCy1GHi4C8MCUBDFhDz?=
 =?us-ascii?Q?rsZTTNiMvpZrRmmB4JU6SnJPArqflNQVGQhN+bKBBgCF0uq+C2yXcZpvQkWC?=
 =?us-ascii?Q?E1hzoVk7x4O8PFAxPaVbv75Hm2+sLdyVuk4MLwAuzdUyAQYl+dbCTDPsESYW?=
 =?us-ascii?Q?QUXVTPWp2zbjcSVRoO/eWJsgceD2py2NMCQ0W5qVla9OwTZ4kLkCIXtZbTux?=
 =?us-ascii?Q?Dtt16B9ozwTPl43DC6bNOgEtAEzI2YR4V4UaTG7bbWXWXR2BrBncdtwSqXJD?=
 =?us-ascii?Q?9qceSTV8P6OXJlKlAv3IpHEd3hj9uw1mGM2CLXYn+1PBD6XgH+1+xQkZrSLA?=
 =?us-ascii?Q?kj+o1M04RinJ0Tx3/JWWHZhW8zlhJUYFF0bUBEzOu24ZufFnG5jv2HUBBQIt?=
 =?us-ascii?Q?Pz8PyE3W+S6OfEEgvEXIaEoMQKVXEPoDVrOIVUMzsR6v5iboRxhNMYO4Kk5K?=
 =?us-ascii?Q?+Q2pbrI9heahr4TeZpoiEHIQPwOTtCQ4QFdy5bqG+cnEgZn2UIa9MLP5xZHx?=
 =?us-ascii?Q?DRKZFSpAAEvNeiFkb1ZT1/UhSMqOkrvffjM+NWWYQzgySlskT2Xm4K9V+IsT?=
 =?us-ascii?Q?fcA/yeJj8uQBLXFz37DgRmevS2IBX9dRGLPrqa+9JxMgqC33ECEucIWNqPua?=
 =?us-ascii?Q?TSsAL0xY3HRniawA+ljFOceErge5yQfhfl3AMCv5Uc7YtTjWmpRr6TWcB3qy?=
 =?us-ascii?Q?NL7unwaIrZLlZG2RnjZUhm0K1MJcscAv5q1jn8q3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40586729-872e-4926-55ab-08db05ae3c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 06:16:49.6737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ABVDXmiEuGe+KF9R3Q/kVjpmfJLesusaO5HH2XZ3WifNIb0aumCyONd8X+OLF5BngxnvektE2wl4jEA/qQHHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 06:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176706

Hi All,
=20
QA for yocto-4.0.7.rc1 is completed. This is the full report for this relea=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Saturday, 28 January, 2023 7:09 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.7.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.7.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.7.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 7e268c107bb0240d583d2c34e24a71e373382509
> meta-agl: b9d4796f44a56c6a9c8233d82e46c251a82f6020
> meta-arm: ce41be0a7fe7c6f5fd2155866980388d3c83389f
> meta-aws: 9d9400b03c22839398756f505491718392907266
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f529e0594a784546926e89ce8e78385e00d0b0a9
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 1f31570d0795da90083d1dbf28127c90908e30ee
> meta-virtualization: 9a94fa2ad76990b0eca40837a98aaf4cd83a7248
> oecore: a8c82902384f7430519a31732a4bb631f21693ac
> poky: 65dafea22018052fe7b2e17e6e4d7eb754224d38
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

