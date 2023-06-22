Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD64EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 09:20:55 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.7301.1687425645348481004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 02:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=izilHuut;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687425645; x=1718961645;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HZ50qsFWpXx8uQtBSFQdwHI2+OqC9TIpUCiZvkBPy0s=;
  b=izilHuutg+BjVBp3dqiyRiIfut0yIPJ9OrbkJ8JZdobu4sfxSKA82tWG
   K8yTYqKMXhMVYcc68uIDapejsLj75IeAh6Mwsb3CCdtEQE8zKtKkGu6x8
   lTPphBb1/tNbPeecZNfLxhnurgTvVmrljWvRIcZMLnkQU7l8YUkaD4ebx
   x2nJQYXBzft/4D7CG3e9r15ogkEr/bt7BD7vMN3JF2POjgJXFQnQpBIas
   qrWug1JSnO5J7iKfbp1WywNfDBSHlSx7PwqZ7N8nfE+RlIDIwzOpneVv/
   K/MZv3yuRAhUcIMBfZ/eOk9pl4iJYVZPI6LI5oKhrWUc3cf7ULtGy/pwa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="424100989"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="424100989"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 02:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="718007731"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="718007731"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jun 2023 02:19:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 02:19:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 02:19:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 02:19:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2xC8DocobApgtvmX+GslI9wSRSezYEkP6qTmaPDwmRzq5Lq6I6r58fGiKtXFtyZggvLfT0sWa904yn68ZL0pWwHeRhb200jAiD3GBiq3JkBxVMFdfW8PgHNjRPV3v5UNn5CmxN6HKMXp5vAyFDPMSIVOXiHvTrBS1TxzGHr5pvLut4MwZQj6SF/30D3DYZHEy416SN2onwA+PQu/nlh9XncfuuqHen53+x5YYz9jz0252k9TLxMnNCDtWjAHz3NflknKIy37Z6oYQmoDqZISRGRlhE7bfHqvHo3y9ViakLQ1i67eZWZyjdRM6sHYTVvJ6HTbzgWaHLdk9x45k95pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MslIls9ugjv4wp4y7l7UTvjk0V5hZnXgI2edzaZfuJE=;
 b=hrdyl7nR64Y7RdIldZ892diUaLMeak0t9QBYKI0xN/BwAZ2UpY25ENFwrhsjhNB3odf1CEqvvLnBY77qFDnG1sTRJvsdjrS3Ob+jFX65QH27qZEpedxNB/Sch42ouNxXoiONPXNNEtPaP/Hi28rOocy/vxNVDrC3i0/6IgzaDDf+SLvmce56IRZ1J2djRkMgu+j6Usmb++GI/1bHXv4xEAw6/6W4VVLAg43XTGxbYmuvrgIyQkDJNohwJZaAepeasMg+KQ6OUl+Vt+hNp5gqFVrM4CJyTsmaHrR5DKuVl+pXrx7wU7QBP9jpi14MmvEZ6kCdebTiezPgcjSTDRTsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA1PR11MB7039.namprd11.prod.outlook.com (2603:10b6:806:2b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 09:19:21 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 09:19:20 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.26.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.26.rc2)
Thread-Index: AQHZoiurTiOS+eDQakqw6f9odErqAK+WkKvA
Date: Thu, 22 Jun 2023 09:19:19 +0000
Message-ID: <BY5PR11MB415225E817F9DCFA9CDC4A87A122A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010188d0678397-042d99a0-69a2-4f4d-9116-724649c71dfc-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188d0678397-042d99a0-69a2-4f4d-9116-724649c71dfc-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA1PR11MB7039:EE_
x-ms-office365-filtering-correlation-id: beb49c0e-4235-4c68-1e7c-08db7301c28c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hwu/0JDxCfNUPNfQ0sR69OGfMp7bTvdkHtfKEzNIicMxOKEQdb7+AF9lKq/7V1F1UFiEPiPZ8BYJFlADoQo/tx8vWLjw77Wr077aeQ/4UigwsC4HFX+D4zjO9g1q004d2uAx3nAMOmEHtTcyP+pRjNfJdozzXoQt+vWKIRqPRsLu3XVvef+bJEDJWs6k9PHIeivkVebqxtPpRYINDvhm7r0IQ9sNZWkBhXRD4QMZ2oS/0YdM4klCLwX1Kz/cz01aUeh323KXNhipsKBAP7jiRKI01KGBCveB32QJeeqW/pDHpPm/IRiWnSnaTiGcsyxEKrMNqNPgRUjQ7ZEjhS4nDTy0+SqO42c06/bMUILzt18JXYYE5SL6E2yqWCHevjNcRA9c7Rqc3ag3e9FnE9U/tJOboQ0gDR0HaokyUe3NGE9EOA6+IoRF6GVKT6/L2jwZJgoAN6xRGCM6zqu/3do2vvv5cSQEEPj0M4cDFXF+Yuv1LD7uD5TICC4Rs+K2M6v4UqzOmSZx6ww9DHp7DZxxvTC9LYV269CAwwaMENzSBkjBkv/euhlzg4DR8PbgfzHEbXjc8TWKMPmzAnnXOqXWYk2eAp/gM+5HzRZw9Iy+J7SEkAhPCublzbxkfvAzTbtlO5l6WAaJ9n4hKAOGZaAFJA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(8936002)(41300700001)(2906002)(55016003)(71200400001)(15650500001)(316002)(5660300002)(8676002)(52536014)(66899021)(66946007)(66476007)(66556008)(76116006)(33656002)(478600001)(110136005)(7696005)(38100700002)(53546011)(86362001)(66446008)(64756008)(186003)(9686003)(122000001)(83380400001)(6506007)(82960400001)(38070700005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UqrFZ3XnSBtIgtu+9rIAGhrYSFHV62+xNGB4tRTVoW7hIyzDH5ZfGyy0b+e+?=
 =?us-ascii?Q?EyIWHSTlmlmdz5DnUcu8xQt598Fqe24A8wAxqWSQloMMP/TI7Iao1XbQrlCn?=
 =?us-ascii?Q?P0IN8hfujJKbOvKEBUaoHMj/YW4/fl+15Nyg4WwVjmRY294kv9JfGCy/SvvE?=
 =?us-ascii?Q?qFjXUhf5SV+ykVBP9g3wn1jdi2USXVE0ulmULAnOY3sgMBJ0kbtaiMuZVtkP?=
 =?us-ascii?Q?HAY6gLR5S1LqebN111fhzIoVXmQ4aEQmxQkODRK/ByDjYXVgP1MupvoUv73E?=
 =?us-ascii?Q?s6KDxn/Wd+mtZXr2qjx1GW5VhmWgF7O4+jlalZKfem4LsPv9K6PAny0HEsAb?=
 =?us-ascii?Q?GMg/s71K9KTzjejTEJNChJdvMVPQOvilXN+OnDySv71tdBwHOwo0VBN5K5hf?=
 =?us-ascii?Q?8nOJMbCL7phNqX8A/PEbP4fks4NIe8wau0hIwNgPX1vQcBS+GSoaAcvFNmc4?=
 =?us-ascii?Q?HBQBtha336eCuWN8V5G68LM3xg1zBjXJ+CqzAi80QpL9I6b7EG/esi6LE1Sd?=
 =?us-ascii?Q?oZI+CGrEkeAH0rLuStvLNGEJ6ZeX6YGphbI0EbibQTS1ZuRG42NeZm07JAg3?=
 =?us-ascii?Q?B+Yzlt6iVI1vy+8rsk0gjJS/cmSBglTfIohEmowFG+W+mG65Xxd0wOME9Y3l?=
 =?us-ascii?Q?kE4hrChhFQVaTIUXEEYjMBSkPtwBIllXB/uo2zdR4iZQ64uvXLirHg7Tz1x5?=
 =?us-ascii?Q?IsVkT2pw8sJq8gpsdFcLY8XT3rIgM5KJrPww/nsQ+GfrsOUX/J4GX6EQRoP7?=
 =?us-ascii?Q?5PU2Y18dOVAq3yr0iYWSzmEGRMRL7RXcjGaomF6k4LlaT+1MkHL9XXnll268?=
 =?us-ascii?Q?FrOFIM7/LxmcxzOlpc6RqbwU2GRZeRZvqNbYmepo7DbuW7UjATk1EO4DMxUE?=
 =?us-ascii?Q?HEp8iKsobysf+eZmCJx+mmFIglF/hDI498Eo2IVRSgLSxtGo/F9vbZj0SCzm?=
 =?us-ascii?Q?n6yBJ0YmGxrDklUtiFD9Bp7QQ9bXa3APqH81hupJ1V13iX6h4f5ofKnlVCXK?=
 =?us-ascii?Q?XQskHYd/uqXAq8tvfDc2rpBW6/MYPvR6AS+xe+0AnprnJa3Y9s2hl4hPFADz?=
 =?us-ascii?Q?zIL2PnsgDhtPJhUaGQXZ0fdgO/o7yX0z56wqZLsb3f6/Rtt1kvJ3v2b8XDgh?=
 =?us-ascii?Q?pEn+NKxB/U9xonmwk++/4qzlmnCh3JEqfTWpCk4jk2SHwtbnLEumMRZfcpyc?=
 =?us-ascii?Q?BThzKJY+Je0//hv2Rfb7m1wpavbo3sLIkW1kXxzN3C+YO4z+vCLq9u00SkWB?=
 =?us-ascii?Q?QMaV/MVOvu4ma4hS8DTWXpC6F5kFAncOimGNxQYip+mhZ90CnVVQrQ2X6g/k?=
 =?us-ascii?Q?Ed2zdZKshzL3rMv/iqvxsRiySMCYhALAzbZrrOtY3uZcJLEUEDHeY2vGi83F?=
 =?us-ascii?Q?RFnv62bcMDfWvLEWW8y6TbKNe2Hc40kJ8zD8e8+nbvsbU8RFabxbR1zn1ZEO?=
 =?us-ascii?Q?yGiwJk761DWZfuhNOphN0dVFJl34Y4fmPoiVOv9DzqZL+RSuAfqLDM8zrQhi?=
 =?us-ascii?Q?bPozOENWcHsTCqvRybjh3dgSqm+r5+nm3ftSkNMjHj5MTwfqB8yPWzxDuF72?=
 =?us-ascii?Q?7Jau8kWdC4keCXrQUw8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb49c0e-4235-4c68-1e7c-08db7301c28c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 09:19:19.9123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JrUZQo0/iiohoq6uBNtZVPjSw5jA0tEVEqs4l0qBh4+mTTeaTcqDd6NU8UhSza602TEnfXnao4P7UMLxyYm13Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7039
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 09:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183231

Hi All,
=20
QA for yocto-3.1.26.rc2 is completed. This is the full report for this rele=
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
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, June 19, 2023 5:27 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.26.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.1.26.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.26.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: e16a9ca7e9286790ac37a067fdc8fde3a35a1c44
> meta-agl: 009153010c138d1a5edd2e30bd3d76c95de636d9
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 6fea710d1b3c8a5ad93e7811e75d8f4cf5962bb2
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 488af577a3f21f038c551612bb0af077fa2b743d
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: 116bfe8d5e5851e7fc5424f40da8691a19c5b5ee
> meta-virtualization: 521459bf588435e847d981657485bae8d6f003b5
> oecore: 77f6fbfa18b4ad77c3756cfdc45d441a20210781
> poky: bab87089ad998afc980adb45c11ae356bc35a460
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
> View/Reply Online (#268): https://lists.yoctoproject.org/g/qa-build-
> notification/message/268
> Mute This Topic: https://lists.yoctoproject.org/mt/99611548/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


