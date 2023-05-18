Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4623DC7EE23
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 10:13:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.13526.1684404827556921002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 03:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=BrIhkKjM;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684404827; x=1715940827;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XlC7Ti5h9FImbmt+hOH2VVSSznKa1sYb1y9BS8bWQKg=;
  b=BrIhkKjMUe4Wlv0qeKlTUGQdPvWnZxQT+7uCEj7FjX2rIfPjj5NpDg4c
   dpGdT+/kTeHinYK3a9cchxCOlZ7NeO9J9PIOPID55hpmy5AmYTzmWeimj
   cMNzqhJKV3/IxIDaTwkWR9a9YWyy/P0pGg7KVzvOZrRszrlQaUn0qk+b7
   bivi0U4bxHqCUYXoh3S7P2SaMYgoRLoJBHzZJqUmkiMNrHLwrKXGnk3uf
   uSn2HoWQqbHvo7X/UcHjzcbkNSlvN1nu7XbVivBg7ajRxFCt0kusSHd17
   cSG9+pRjudsN273Ng98ALrjc3SgHsb3vAPe9ok3KbrjaAnyzcgxzVNVAl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="380233286"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; 
   d="scan'208";a="380233286"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 03:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="876385246"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; 
   d="scan'208";a="876385246"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga005.jf.intel.com with ESMTP; 18 May 2023 03:13:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 03:13:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 03:13:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 03:13:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 03:13:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7Bgv/cRHmuqxwZJqifyI3BoTef9c5qEQaPsHPaLyFhMZTOmbCtDLHRN6hpOA/QuWOjnHqWqhwo6i78khC0zBEJzy1fDreRlbGvAnmfMDm3hYouvYSbhpCGD3MqkeTaS5llWTudEdMkAyYvtLRLkqvx4ECHjPAn/ce9G6m9cSyFqyDjJEtd3R2dS5q2TqhQ7ia5KdUKQCiCigoTnlrooecqpJfJbZmuoM0Cu4AStZ+HoeMjV1GMNUjZM/jMdU3RhIizm9KZlVbNPyGKV8JSmAonwjVfcpCGRURlsf8nrK/Rv4V1tBdP8OpMs2zxEaDhpcrz8k3ZAmq8Djg8nz+R5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OY3oBna+weHCf4WtC+Hx4B0Mm4qdUK8Q71gxDL0rW9g=;
 b=PjTwEjKvudnzE5oA/8g+/uuMrE+bnuUrYwjcWAzlEPIY8UuXlhO6kEwI2dbB2CogwfFPnvoShzctwtPxogzzQDmHMTt8WB/8Fb6Ofitt5jDnwgtC1aEORrrsmSMdME0vRtu3gitGUAdvApjHkjoh31AQ738WjNa9NQQzPUYyZeyFEUB+0QtZm/25APo7lKAASM4C85DEQYuFI9mSFrdG55KduysxjKBUjcRLEomTOmxRuHBk4sSdI5FbrvCIAtx4hx9fl+mkny41yHp0gKEgah/XrdBFUDx/QGxvtQINPkyXvCqAVEJDMB0o1uUY5MnwQGMEXrrDmY5KBGM+LtOkrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 18 May
 2023 10:13:44 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ab5f:f78b:f603:652d]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ab5f:f78b:f603:652d%4]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 10:13:44 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.10.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.10.rc1)
Thread-Index: AQHZhSfP84BGA4iNTU6y7HPYqNdsL69f2DpQ
Date: Thu, 18 May 2023 10:13:43 +0000
Message-ID: <BY5PR11MB4152A5382130ACC3290B4D65A17F9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018812405f57-8bc29844-a56c-472f-ab1b-b82329fa2ff2-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018812405f57-8bc29844-a56c-472f-ab1b-b82329fa2ff2-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|IA1PR11MB7271:EE_
x-ms-office365-filtering-correlation-id: 68b57fd7-d7b7-456c-a86d-08db57888f85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qVFwDb2u2IbA+20VBJPpqF6cMsi++m1xEjJlsihu3G8lO0zaqKd6aeFPYeSXQk2Ki+Iys3vBXHT7BOyYYy6vKb7RtU3JIs6nAyiHdm/+1m5T2zPSfmgcaedlKVeW7MkbcjY2Q+xBvjJNS6LfDkMWwwl2tGObEQ3gKgKylXZNY8qNmyHNZgJ9ZoeDKD8zWzB+6DHRCbg195vsz9h7pnURhSYijZesyeVB/mGkWeh9JmXmWEA5M0TUrs80HU/9kmJugvOSHyuwI0nd08n+f0xlKQXzuW/RhRdsh8ha/nxjrwIJ3Mu37J0ydr4+WP/CzBBFJC55/8DZgXaDJS1L4hhnQ3NNRhhRWkUh8UPWxGqcB05keDyiL3JiE3zQmsAGh+SLxlXz7oqf0OkbK7ieTWt2Rej+4XR6d/BadIWgLqxT3nvcbsYgcdCVWT1S2XTPlEsi8/zCU+EYZef+m2Ab7gmpcclB22gGLUsMWAtl23ljWdvoF08Eic4B9fuaukkO53yhBGRH0XkcEoyCUnxDj/rWSSrln+S16LDEGCTlV3zX/e2oP6i8IbN/745dJ/qGKcKLiqO/pT/5Bm3AtxlO209tu92dJMaS+xl+VkfbzKfeYv6VwcjE/qCb2xxy9lLg88xNPKbppPWs0tMiLL1Y903SnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(33656002)(83380400001)(966005)(76116006)(66556008)(110136005)(66446008)(66946007)(64756008)(478600001)(316002)(66476007)(7696005)(86362001)(5660300002)(38070700005)(55016003)(8676002)(2906002)(15650500001)(82960400001)(122000001)(52536014)(41300700001)(38100700002)(8936002)(6506007)(53546011)(186003)(9686003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xeuD39izq5FGiy9obEERzg4/84asnIdV/kR1yPGMCCiOAB0+gIMeiOSRRamO?=
 =?us-ascii?Q?jndDwVpicjPFkRUkR1GF123+nCDsyIVNd0V0/+j4qIRl98/IlXO6uXtIa+Zg?=
 =?us-ascii?Q?jDAnbmtVCJOZ1UHaH8KJsB/zDlRANr06og4YDbp8rfSUUeFV8xqAMUpNfY2U?=
 =?us-ascii?Q?r3hikCElfJ/WjPdqPUmawhWL32A+96kVlLctW3DMcdDaDyJFrAPapzMegHZF?=
 =?us-ascii?Q?YQyPjX0CtYbrFY0hHkn31veb3NXda1shbQ+6vZbGnbmUQGJ0KlQdAgMMXSn6?=
 =?us-ascii?Q?DZ9pb2HqtxPeUbjtF3iMBnJqRWK/6gWGJY1GYn7t/LTaJSJeHnGr+t2L0eEg?=
 =?us-ascii?Q?qVr95CjggZfTlb5eApTFIfuINHuYq8w1jC7e6GM3ZzH1DYXnfNblPHTEOj5P?=
 =?us-ascii?Q?yU0CJ9eDH3LbNO6b/qJTjen3t2YSMbTfcsoAatVJjIBX3Tt7A3F0cOa1mRio?=
 =?us-ascii?Q?pLenoD8eBnoJL7dRtgOX0a6HgqfZWHaHF0W80O7sIPZ0q0bPO/acTMH4Jb2j?=
 =?us-ascii?Q?lAG3SN7j/F+JJIPc5ULD87fghUEoGH+ALDaAMfAwRlrMxir1YfbY4HOf+AIW?=
 =?us-ascii?Q?q+KwVlrNPCjK/COCo5EOKYN/9YGQ3EwmcOd0p533v1CMsBm00lsbZtKqRhM2?=
 =?us-ascii?Q?R4jHnx4xbcu4Q72r+1COXi1mYqdvRkzhh2y3w+9CPz/zUJcvjU652t7Coq3M?=
 =?us-ascii?Q?WHahVe3odlZEYNvN1P6LeJ30AL3aLI9sTtrScXHUGtAH6qmxKz3oyLaKYc5e?=
 =?us-ascii?Q?ivxFA9hf74JPwP1fH9kM2s7s4kH9aG/WQPGgHxh7yJ+KwqHCUWlkPXGA3nDx?=
 =?us-ascii?Q?02rS2IdD3OmYXFkLOWi7a6VftR41fvyU3iLx2wKNUyzrxJvjPYWuEU+8zi+/?=
 =?us-ascii?Q?kF7HF/UVmn1zKO219wKvw0lBeV66MptikhjjqEhebaRjmJ2CoM8GOCKgthjj?=
 =?us-ascii?Q?D2qoBJSITE81aIhwp1pAuA9JSYBfwTOeeyZtgWZrnSUb0MiJYv49t1OIL0mF?=
 =?us-ascii?Q?ImnPkW/MIf4lIscUO/NWbtX0jhosMSS0zo0QQzDKuITsKVtLndVRVjL3Oc/X?=
 =?us-ascii?Q?7QkjW13Ev3DtDlt/YmzsNDsebyNm1hW15av5Lbz6VXAkILFwmWPwj5Xh8NSA?=
 =?us-ascii?Q?L+/9BoqBa3SnfnQA87EphVMdvAAsBsmip4Mgw00kM928Y8G91XWHosMxXb5N?=
 =?us-ascii?Q?6oEkiRXNtI+coDKk7qatlP1JZv/8R/BccGZ0XsRPcgMpO1xCmiRDuitsCQnr?=
 =?us-ascii?Q?jZuFwS2q4N+TZbFiL2NYpDy+j6CIy4aAQehhkk6x6dDQpygXK73PujNV615Q?=
 =?us-ascii?Q?ICKkMnWrQVAHlrOdJcT8oqHDbhPnGDmNFYb+f0f/jwpvrR55R9mQiOuQo61D?=
 =?us-ascii?Q?Q98Sh8jti0qabsfy2f3hGwJ55SPo5BkGOEWyNuIbGx2IEgsHya7mPwzp77DK?=
 =?us-ascii?Q?oMWj7N/yXC0nFrSigqFOUVDtIbvIQjan0ggEIU7d4paRCUwhv4hcBuKKUh/O?=
 =?us-ascii?Q?K5vgX53OHo4kTKSvQUVI3b5xhqfQwe6zNn/9hQj2d9S143ZdjLByVJR5a89X?=
 =?us-ascii?Q?GvRV4eh90fHjv9QQFvE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b57fd7-d7b7-456c-a86d-08db57888f85
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 10:13:43.7990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D6xYi5DBIK7D+a8wctNM7MZzIdMrN/FCp3k9AzttLgYW6RwqfCdighRqouJJK5c7mUXBoMGW3cUP9DSZfot6SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 10:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181515

Hi All,
=20
QA for yocto-4.0.10.rc1 is completed. This is the full report for this rele=
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
> Sent: Saturday, May 13, 2023 7:16 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.10.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.10.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.10.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 0c6f86b60cfba67c20733516957c0a654eb2b44c
> meta-agl: 07c3fbfb7716c290bdcf3931f27bea1a36fb6520
> meta-arm: 96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd
> meta-aws: 9eb2b598358cd0e1df29f6d347e3e62ff4161bb6
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f709b3f2b05e2ac73c6734dc2a213382b5eaf579
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: df452d9d98659b49888fa8a5428a0a8bd3e3aaec
> meta-virtualization: dde0ff9eaa301ec5bd3daf667c7966cf55404d26
> oecore: d2713785f9cd2d58731df877bc8b7bcc71b6c8e6
> poky: f53ab3a2ff206a130cdc843839dd0ea5ec4ad02f
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

