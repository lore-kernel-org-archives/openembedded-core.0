Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86F0C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 06:48:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.29558.1658990926215350145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 23:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Xmk9ax6T;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658990926; x=1690526926;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Xf7Co/nCxqZGT2/G5aPdfpjPZxcu83vquIA6DP0JULU=;
  b=Xmk9ax6TzwiSJCF2KaDxHm2tWAayV+Y8uxTRDhwb/AXklsuePJjYs39K
   ghecVNezsf9Ec1IjUKdxh1S5N1uioFqnJYN8z47fFlFQHMmyaizcb/9FX
   6YKGV/5O936JpZJ38UnlTUaJ509eOjN/X/iRO4MRDPehtAhl6Y/7BqiTT
   fwTSDrdty/kspLYbEosAUm06C1upJiq7WODSL+yNcPE2q1qqJQHSLGfkZ
   2jGf6U0U22URX+Z447w1AByb2vg9MecmvN8HhrIFHaeGQEL1uCMIwccAa
   ZCSChkJmO6A0wMofZocVqi84PbY9mO2WVmEgP3kW7m4qNk9qyCsBV2Otg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="268200980"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200";
   d="scan'208";a="268200980"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 23:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200";
   d="scan'208";a="576325493"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2022 23:48:45 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 23:48:45 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 23:48:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 23:48:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 27 Jul 2022 23:48:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0ICYxqe7g4N5lp3KcojumGbS9fHMI5DzwBCfqlE8mLU/WS+hrTzeFVBgYtZEss7QnmEJHOOtHBq6uHCpOvEX5gA1oXvlQbe3jrdzA3WGHVasPQBANT4XKc6Wu6XTg1Z+hy9E0fnykiI4IWfBiEp6r6KO8syZvNoYnT1zAyGKQrEHWtYiELAvAKs85ewgb+mqrTcS2KOY4Zccc7PD/MOCUccTNcVHVX5Dj+jxBiiFiNUxhSpTPoXpCcaGhPrcGT/NjrE1pVR4T9UuyEnFCX17fGs9M6EOVk/ERQyDkggxZoc733Veaa0nkqdKgVjKeqZp0ckRLhKBL9MGBQzU2CpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UDZ5U4NrpWVD20ovjbHzdr1KS8ANkrvrp4Des52M6E=;
 b=nzlTf7F72dzN4uc7WtL9IA8WwSgvwFtretkJac3MZc21GtT+VPoiqJLF/MqeARdoL9pvCJXzOkNP8jk/dAsQ8YLkmtpwbjhdfjmIYHaLjeoy9s5sN1tYI8zlvOjfXvvYQ3eIXxGMM5w6e2f0QKK0sSBmvNh4prvpSIKdma3qrjWz66UelPU5ADk0h7EaTHxcJ9HVzaBcigCFguzTePwbaLTjI/Nyf6myOhinHd0AYQ8oWCFCUn3S2am88JbBesePT0B8dOLOde0fgXxy77DKArYu8ZruD8NRPSymI7DLY/cnQjGg/nz1Yo0aZzZ0aeOUg48HZhlEnWuCX7AVO6XDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 by CO1PR11MB5105.namprd11.prod.outlook.com (2603:10b6:303:9f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 06:48:41 +0000
Received: from CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::7c4c:c89c:eb63:4495]) by CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::7c4c:c89c:eb63:4495%5]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 06:48:41 +0000
From: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
To: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add PACKAGECONFIG for
 onevpl
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add PACKAGECONFIG
 for onevpl
Thread-Index: AQHYojpuq/q7KznWp0iM1Jf6P6HMpq2TV1MA
Date: Thu, 28 Jul 2022 06:48:41 +0000
Message-ID: 
 <CO1PR11MB50265B0B71DA4F44D252BCE1C4969@CO1PR11MB5026.namprd11.prod.outlook.com>
References: <1705E3C5B18AD43E.21236@lists.openembedded.org>
In-Reply-To: <1705E3C5B18AD43E.21236@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf151e76-8c4d-418e-2b91-08da7065356d
x-ms-traffictypediagnostic: CO1PR11MB5105:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +ZTzkqLUuJ8qyYR9FzmeQSBBbOL4eL85wby1l7l7kob0gBSxfRcz4rjQcqnS2zneBWr7g84IPWcqPdz3dhJETgFlB8L3rUML90QvV+bBSY6F9VcPHb/Go+V8a7dRslZJf8GpgjBqdGAArxS5gN+VHzUd0NS+KoYqjK43CsYZ8ZkMMbr6p3AVijDzQBvQuMKpLHBavPDtK7GLJqBpAlY4BO7Om6i/cI/kilLc/coh71fRnm3TZ0rONvo4R1lQXxKD+C9DcH6S6HgAjff3mXsABHWjtfH4WEQcfmDcZPp8FfCuqs9++4o0gweK9AmtjW2O4iO7vRaHCOMApkpQiYvKURVdaFsU8xkBTQJ7uYCJobYytdkNS4THxxyNRwKciDFl94WXZLaQPYPnUnWZANSH6EgxUGDVk8n354tsbZK+kHfpWpA2Z0IPaTjlrXRO9GWqx4iDuFCA7uO6eb/YtiHJS/OnL5qO8OAF21yQQ28I2CW7L2q+DUCpdvZ3e1Jr/3+H5tMXfPEtTxrOCO27vFFs83CgKqlC0NYOvX8EKQ8JupSrk66pDZtVOHm3kc5Yk5KBx6s4sLbqU6vEcdonWInNrEowcvWxGR/P4ZYz8vzRRF0BYDxHfvnKUUL8hIGi4UgV/1AckhZOj5GSUtWqHTNPu/JjGi0bU/ymK/motw93jqrGQDpkfycDge0wROhiOTxtd0IoZMXBQ+pKMlWuvP9m5sExdWI9ZHNcoys2diGi4uSAJ7ctLlq+dhK55cvF9bYwVltTLCAZ3bTm9RZaQbo6HQ+/ftjp/cJyHOfOTQDXpLRuoEWOcVjIXYxKha6ZIHvO/ULWFgvbS9/RLK3AKmOOgg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5026.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(346002)(136003)(366004)(316002)(110136005)(122000001)(66476007)(38100700002)(64756008)(71200400001)(66556008)(33656002)(66446008)(55016003)(478600001)(53546011)(38070700005)(76116006)(86362001)(26005)(8676002)(7696005)(6506007)(82960400001)(966005)(8936002)(5660300002)(52536014)(2906002)(83380400001)(186003)(66946007)(41300700001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?S6rMW7lwbA9PVvxgM+G98Umi9u3J2k4Nz9uA5R6BTJV2hG0q96c4nmx2BAvd?=
 =?us-ascii?Q?wvq+uQSopr3QsRBg/2pI9lbVWbg80lAYmi6x5foz2MdoBPdNZ8UMsFPJwpWa?=
 =?us-ascii?Q?5Gbj9ou4oRZz7E4bs6o1ZzUOnAUi6Wuiww6Qo1DfyDF9ki3mMTnuyLXjvHka?=
 =?us-ascii?Q?d7aOnHOuYKnCzXAhlUdUsKX/VhsJHSYBjdl4gScnaIB2EzHQW2mrY5KXgVni?=
 =?us-ascii?Q?e2PZxBsChLKTzfcSJcIdrfVqJH1hDgOiBXLf6SQ+KBXBbvL8hk3evgdQICwC?=
 =?us-ascii?Q?Y6we+oSOhNXllD3z9Qp9Pr1cerYNnTw8br24Yrq9m83KQO9rVus2mZdfpTB0?=
 =?us-ascii?Q?m0gC3JCmDMoS8b9GDp3ZlZM9iLEYKmYhyIygYiq/bw4YHbBpE/g9yW0DTwX5?=
 =?us-ascii?Q?hbllSVJBFNtYW5BUu+C1wE2cvLIg8cd5Guw42zQWK3QzhvFZTgM7FJQwwg1P?=
 =?us-ascii?Q?v+RSdKv8V2xlNWnTm7o3igK73hbOpev2EfsTyN8bDFUcpXxxGVU479dn0LaY?=
 =?us-ascii?Q?ZugKWXG/PT0wIHOSy37hKgxlJs5k97WUtH9k/IPrKQZugBByRJKm8azhC5QA?=
 =?us-ascii?Q?nCrFIVRK9O34TxyRZUIwVqeAXBgcTz9k6/voUiif0lAHvQ+avtetyptOJPK6?=
 =?us-ascii?Q?kxUn52FsNNZqlEKmHbxqdYPnkdXB1HQpHndSajOEFXz5kjMc12y6LUHNg0C2?=
 =?us-ascii?Q?87pVM7zdqLBaa5qgtvMgSs9oH2b480PRKzbSkgzdpBXGVAOZA8cVtcK/J/Eu?=
 =?us-ascii?Q?01mlyrxnwdLYM+VWCv4aqRZ5tvu5Gb9PMAt5HQwB1VEAz9qtzAa9Gv4XbYu4?=
 =?us-ascii?Q?Nki82O26Isa0KB5oRWpt9ooZuARkS762Lmk03lVV9Iw1VBDoA16ise/Bhpyg?=
 =?us-ascii?Q?gEllvcYyKD3f/ppgx1cVgVByoA6B9WQ8ZVtryvWdu465qWF4jE3xEgcyiBZE?=
 =?us-ascii?Q?wyiGHk2s+4aTM3wColhetvWPC4QaooZDFwSLWwCWRxNyM/HYe5uyBt3Crq+Y?=
 =?us-ascii?Q?H7DGiG/0SOFuu7Kq2RZzhlqSgMZ3qfie2bDRFp5B49Ie5T4dWwFh6UoAWJ8Z?=
 =?us-ascii?Q?AHG7/wG8CFtkgGhGnE7HLebQlPU8On07H9JSS3II/q7IWvf+X40K3tgw0+ro?=
 =?us-ascii?Q?8rkyRDJ+bEYz0bQNnr1ElxSQc+7IrtGnrk+vGwlkwcgfcnpaySMIq2UbxdiT?=
 =?us-ascii?Q?YTBGdoL8ThvKtjGvadLup/nudxfU7E5AUNYty91z7snlNxSLI5z2rIBw4Us5?=
 =?us-ascii?Q?ucJsIBBpn2DsjSGAGi4SY+QBjRXLgnBg8I+U21Ewt5iY8bb78T5NCyn8O40r?=
 =?us-ascii?Q?1637qCpwXW36OqhoXQT+qraTSIgc+sC8rqrdPl/KIzbydIE+haViLpe2O4Rb?=
 =?us-ascii?Q?yAxH/1nD7nFJvEVbgRlgtMWyvwZTfC3EWXZ/XLwDrUtKyqTeRcf+vASliHu4?=
 =?us-ascii?Q?NPW3pydCytePmWW7bjyG5OWqjKJ70l35BW9pCsP8f7cAIOXZ1xg81fq8lan1?=
 =?us-ascii?Q?V2z3hCtvOQgf9evMFnjhct+XWTaQwtTRrmKz1a96lLzBVhMh9yg6kbJ2iQrd?=
 =?us-ascii?Q?8cfWvWCQaONBLM+b/Y0JxZAXP9ZUIT29VXNiZoqGnNeJkLVZjxPpMuu8KLMP?=
 =?us-ascii?Q?/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5026.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf151e76-8c4d-418e-2b91-08da7065356d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 06:48:41.5920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 KpEpsN4WUV3Ow9sSJDoo9ATGl66DFmEAWijfNhyhp2ZaAglJEtnAu5cvJSJC3EytRQj8U2rP+STi2UPgiNMb7qaclzkdpwtVA/SmJL46hUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5105
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 06:48:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168595

Please ignore this patch. It needs some re-work !

Regards,
Naveen

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Naveen Saini
> Sent: Thursday, July 28, 2022 12:47 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add PACKAGECONFIG
> for onevpl
>=20
> Allow user to build this plugin against MFX version 2.2+ (oneVPL)
>=20
> https://github.com/GStreamer/gst-plugins-
> bad/commit/beda9a73339bef878e95798f629a868c647627ce
>=20
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb                 | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.20.3.bb
> index 2dd42395f7..6048e17214 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.20.3.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.20.3.bb
> @@ -97,6 +97,7 @@ PACKAGECONFIG[webrtcdsp]       =3D "-
> Dwebrtcdsp=3Denabled,-Dwebrtcdsp=3Ddisabled,webrt
>  PACKAGECONFIG[zbar]            =3D "-Dzbar=3Denabled,-Dzbar=3Ddisabled,z=
bar"
>  PACKAGECONFIG[x11]             =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,lib=
xcb
> libxkbcommon"
>  PACKAGECONFIG[x265]            =3D "-Dx265=3Denabled,-Dx265=3Ddisabled,x=
265"
> +PACKAGECONFIG[onevpl]          =3D "-Dmsdk=3Denabled -Dmfx_api=3DoneVPL,=
-
> Dmsdk=3Ddisabled,onevpl onevpl-intel-gpu"
>=20
>  GSTREAMER_GPL =3D "${@bb.utils.filter('PACKAGECONFIG', 'faad resindvd
> x265', d)}"
>=20
> --
> 2.25.1


