Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12218CA0EC0
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 01:23:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by mx.groups.io with SMTP id smtpd.web10.38383.1754875403880428786
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 18:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=j3pcBKYt;
 spf=pass (domain: intel.com, ip: 198.175.65.12, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754875403; x=1786411403;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8GHiqkzwIuQGUgjoMgTo3VAVLy0D03tI+Dqwz1RLXFY=;
  b=j3pcBKYtlnh9C3O/BfE/XKIldhtTF5e6+0GtHUSlmYLXtxsdN8ghlcYY
   oIqGEDPcGzlIoyOdLQeQV6q7BwvPUpNPTMUPxbAcsj27VRCzEdjk9Z3LO
   zW5/EwhiVXI+NNQxQ/zjxb+7TcyeAeMN9Wl/WaW49zbe+QphzXOPfJIbt
   ld46F3RAvUAgt84SntBWeIymGjVyEp2/V1iZpV3MtXFgCcnaacff9RE1t
   XbNIZRVb+C3HaK01rmWgK80NGOAOcqvKoDsSw/SZzuesFM2uDzvl1pcYx
   yLX9YZXvhpm1PbC/Z538O1F4fe5jXHl+qn9jKeUip/YOUlfpPVY0qDsnl
   Q==;
X-CSE-ConnectionGUID: rQOCsg5IRIK6cCw8MdG36w==
X-CSE-MsgGUID: DjD4N/gmTXCNSH093TEOEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68577275"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68577275"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 18:23:23 -0700
X-CSE-ConnectionGUID: iIqnPZ1nS9CebSe5bM1QiA==
X-CSE-MsgGUID: 8JlL4tenQoiBNwwKRgjHuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166577552"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 18:23:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 10 Aug 2025 18:23:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 10 Aug 2025 18:23:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.49)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 10 Aug 2025 18:23:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fe2INODHngY6/bi9iwpGMREo+9j57vTh9i7kETWC2ifKxYBxQ8yyWx8/EOBPs6r1/sQkaG9FD9qGauYh+scgf5ZSjlNbah30K4M7UcK/88+KeNZo0IZMx+jNHCmsyvq1kPIVUqzQ5qQO2f8dgaV3sFimlxSakm4Z5NmAtxSjSlt7BVqnrxClUdy3Gjd7bO98R7TVGT9YvnFzdmRegfHkJB2SY1J6sVv3iMD+QgsK9ZqbmfI8Ll5C81vIgLIGVID2rcJSDSL8gpgxo3woraIZlVhINm8nzHs5vKPGaYKa18di7nKd/g9j4MXfmaRlQt5VqKf8iMXaHlu28RM/dapJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMZ/4upearKMwB6KpGhtb9f0X5aGFbQST9yN88f6mGA=;
 b=H5tAjUM91+KFIyMCcZiKcLbu5uzJhRggF5EKT2Lhif0AjDuTVCsDm7ozEgCl66LXmdT3mykD4/tjtojILLDS+VkfIY6Z5K1kt6MJU7QBgnZjfH/T7XjuxCyFNSbkOUkfm5QkMoWkUeIHcGh5JdZdAS4h7sEO4/zdp1wUgN1TeVJ2WnGUSiphqjrAZL5AL7WQMMKLcjzxKXgjaGbe6P84VqDmJtZ/QNEsIEScHptbzSkZHAU8hMJTdvSOZTAwz26zJNzDJdwqSr1Izln+E0zAR8S1yXS50/uwNj2ulwE4rcshuYMyM6x3EEOCHnajCchzoogR7Gl0s+QhBEwTs8L0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Mon, 11 Aug
 2025 01:23:19 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 01:23:19 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.29.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.29.rc1)
Thread-Index: AQHcCIMny3ZMFwVVr02dij74I5ry2bRcq6kA
Date: Mon, 11 Aug 2025 01:23:19 +0000
Message-ID: <IA1PR11MB77539F891C486B5BA0B9B1C9A128A@IA1PR11MB7753.namprd11.prod.outlook.com>
References: <010101988a8ddda1-4bcd7346-02cb-4e85-96fe-d5f0fb67d5d0-000000@us-west-2.amazonses.com>
In-Reply-To: <010101988a8ddda1-4bcd7346-02cb-4e85-96fe-d5f0fb67d5d0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7753:EE_|PH7PR11MB6883:EE_
x-ms-office365-filtering-correlation-id: 72188838-b333-4fb9-f0ee-08ddd875a7fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?/olQlErsikMgbBkTolPEN1zCBJ+oYDRnkdg4ndDSg109VeApACSsj3fR+zlD?=
 =?us-ascii?Q?q92Zx2Wh1kq4wlEz/rdogstGM65aJS7SyZDYdXRgDpMNuB2+WwAa88dNE/vU?=
 =?us-ascii?Q?pejKzmpGvnyK+FYdNPYoZOE+Sh2lIzj5IlvpNL5ADwbKLqZaOHXD5VNRUa+b?=
 =?us-ascii?Q?Gbihrmy5ztSZWcxSSJk7KassEysw59TMO6g8ekhTxehwFoKG/bOeU8P4ni0w?=
 =?us-ascii?Q?59F9uSvT2MsJipbep+wC3xtS6lAJvxRIW48X3bJYsqxfHEePTXaX3Dr+f/QH?=
 =?us-ascii?Q?DWsca5gRBaEYA5crO/53DGxt9MLHzUD6mHrRr2qd4eXcAp8vLvilYs5kfe6t?=
 =?us-ascii?Q?UoPeiZyiV/DI7H1OEOTDrlFq9/dyDocFfucR2+qafwamyDRPMsIj46InfTBD?=
 =?us-ascii?Q?HKicRIe1jp3aVD4wvGL55gs/uZisSXvWYhQX2cDBUdC7Xa15l9DU7qpOU8Yk?=
 =?us-ascii?Q?ZGRgYbXL9dN6JI6IDULWPfaVKU8LoDbfbumyNMiRqUgETFYAbFrmsSAsZJwh?=
 =?us-ascii?Q?OoOjd8ry8B0q0b0qId53cmx1MNw89/otApGyW8wVdavlZ/bYW3RnAaIfmpJx?=
 =?us-ascii?Q?VQbnkPSCkGNh5zlFjjv3DVfok7NPiO9PhNi7mBi2NWRIPAFniEfYEMFFdsDr?=
 =?us-ascii?Q?/VzOWeikSmUb9fwON5w9UER6ajk/FisDSBNg7VjrNt6cvOh0TQn4hbhRCaJ6?=
 =?us-ascii?Q?MQZA6/sbu9A2Y7CVsnoGE/8oHWHl6oQA/UJJAQ7Bd/gna6/Tw8q0HGIonNUJ?=
 =?us-ascii?Q?jXlDnCEV1gP5kKwUlRv3UPmbZF8BpYq69opTxE+6rhNviCdGCi71g8iL9F3U?=
 =?us-ascii?Q?7+htJbJyXCyeuW5jZ8lpA7YMiuS4g6g+krvbmkeKrs64VjvYvI+tzjTZQdaz?=
 =?us-ascii?Q?ESoUluXQ/8nWgEkW5giEYZMcAnFK5GrHaNrhg10tHBUEZBO960AwlUxpWaLU?=
 =?us-ascii?Q?IYyLHbemo8bTMrpoDD7JZqXivVtJ2SAG5q6odS64rSMDWLAuE1TKkgUKA+6o?=
 =?us-ascii?Q?1YyjDxvKmko27N4YE6D5kfWmXEPlpwNQcKO2Yaoc5jQ2xaKjOx+NaOCnBtIn?=
 =?us-ascii?Q?ZpS/bXmrKlo4rLWVKdKKxkwybN7KVp47nzlvtcvuTKpQdCo3PNSWxoYqeN61?=
 =?us-ascii?Q?wurTa7pbAk/O4ohehfLDHSWRpHOiCe3n1Z0MvHExBrLNhEfxPRiTOTt9OQ3n?=
 =?us-ascii?Q?af/EXOCxTLnf2IAiEYAV4t7K6NJyBa/ohhq/6a+ox0Snxf0MfJjQO6QDc8R2?=
 =?us-ascii?Q?LIHPBQYNfgcaDbOEyQBfCdtV2ltJJc56VuVnTTVZ4PQDkc3bZyMI8COYQCQW?=
 =?us-ascii?Q?KKo8rC528jYp5ciSULozDgznvcNtnTolHlWRW9SYx0LzCLPYFEBoHUCQBGRS?=
 =?us-ascii?Q?rRP6rwdULBmRvrckJmD99crfcwTdHChR2l27bs+RzCMVbjVby7+h2pA0CEP0?=
 =?us-ascii?Q?gT10/bx4Uog=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ts13qLRP8iWyWCehLNQwwpKBcGtH7rqr6lffZgz1Nm+CLm0qNeHYsYQW6Ney?=
 =?us-ascii?Q?rRvhuj07lOc7FbikcJnkt6tpDKvQSsd5KFz+0ZPTvp77o6D7fQmtAve0QjOB?=
 =?us-ascii?Q?fnQPDCdjFKs2ZPVNCMWs82/XTX1BpQuEZiPd6Qo1NhDySlcYTWC+GROp/8aP?=
 =?us-ascii?Q?gSJKSNfv0bPnBeLIZswsO4pwwIzBimz0/CKH43TSKK5+bLQNYrhYlEsmXV1D?=
 =?us-ascii?Q?F+gVWY+RvS+929unUi7zBCiGlgCrMseLpH4ZVg/tpLd0lcvlmDB9zOejqMMg?=
 =?us-ascii?Q?b/wYXVGqz+ZXldvkDp2IMQBUsN+/9zIjSo4EsnVdU/qFv8UyUnibvQDS3qGG?=
 =?us-ascii?Q?UZWgr3v/lI4+FivxXlA+tJAKHiUpQ2Ljj6+EMceJr9YFJs0imrnP5ypo2osR?=
 =?us-ascii?Q?/zi4zQPYXaBPQNFBb/JJ/p9ZCeBV3eppmcSNJ83dP95IS8znKS5rV3BFOs0H?=
 =?us-ascii?Q?SGE+ohkGsrbfuduhGboT6Kw3Fw+vDII8YwjqtiaP1jK7aHMsRlGBSDJUvPWi?=
 =?us-ascii?Q?M17j+16OMWJ9CM4Z/Xt80iPwLPmWcRBgVlb701ZUjEfxHoYTKc6DtHe3rJNT?=
 =?us-ascii?Q?GJ1mCRrQDe5U2aQPgh3waCnSva0dlKDnWq8RiJWSei2tY+wKA8dEZmEr8YqZ?=
 =?us-ascii?Q?n/8PXDBkL+qpZmLeuwSof7d+CUJorrjFsNxwcCXVCsKfUD+cfeRrcUQrG+/B?=
 =?us-ascii?Q?XjvMzC/S9428TlYRetEUmWBBf/E6gqXKo3enaLWg53zNxj3wA0XLt9Lw9+V5?=
 =?us-ascii?Q?UU9zxt5Dicyq2MFL/X1Vua5VmTQhUj6ZD418ovHfL72YtXTbu2Ie0/STpKu+?=
 =?us-ascii?Q?lGSCZNR9PXHO47W33lRCw5DF/Qs5PfAz5oy+fr3IIV8hcGufT0q7WR+9oMgU?=
 =?us-ascii?Q?RE1ZfblOj9mXAf6qSUGIr+BAgTCiqhFhA79lNReP9WnxbWKVhIIwiYwijcX0?=
 =?us-ascii?Q?tx/QKlMQ2+XQOuK3dVlEPQ7UI2msqgbVgIwoWE1LKQ3IfJ3iTmsXmY0t6cvc?=
 =?us-ascii?Q?jkgkeRcCm3pYOCnx2it76igwyCjf0YuZ0RwPblCvIO8GPBb+wyhDIIREahnr?=
 =?us-ascii?Q?Zee6wL95epQiU25L9lKYWeshwFPV6Bi5wggg8OrVWKgv3in3Mph6DOSWNUQ/?=
 =?us-ascii?Q?I04Lhr9MPJR9C8XlDbj/vgOoSZk2CrxiRhQHRfi/hM9ZQZNCOen/00NtEpru?=
 =?us-ascii?Q?21f6rJeAREFK/+gQeJiA2qdhCV/zt+JJnt6Snk3I4PsKW6BUBeqRqNdGBNdd?=
 =?us-ascii?Q?oYmgefyYw9ridfD5y+ja4dHaSQplUEf3aLvjtwJIp0ukbnyeVSZO1Lcyx+SV?=
 =?us-ascii?Q?JomIzuQExYt1tN46pNIUcsTGN+L/KT/lM18E3v+bU6DiKlxNVH0QXRBCO9Ed?=
 =?us-ascii?Q?FcRzIpj1AWUbyOWSq0WK9Eq7h/H4Ojk7Nz9DYhtQyHtCbSXLXIy/9RSzgmj9?=
 =?us-ascii?Q?pOkcrToWOjdQW+WvQ9eF8Lt+t0cr5U4sobImls0j6/1pj+jYiJI9FtyyVWF2?=
 =?us-ascii?Q?Tmnlj0507gaSg4MGEDHbAwlLzq7YVyYAMY+GaERfQTIkMzUL5HikFCDNdYOj?=
 =?us-ascii?Q?+Zg67yAHJuMu3LsdbZdwisTmbZCT9EgJHhCtwVJL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72188838-b333-4fb9-f0ee-08ddd875a7fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 01:23:19.7325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mc+oqVAsqg0ZJSUjF3Lzp2exurdPjhmSLnNEe7BU42asrcAirROhih0G8Be55Zb5DxKHQNypJsm3b7UnTzL8tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 01:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221707

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.29.r=
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
ETA for completion: Thursday, 14 Aug 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, August 9, 2025 12:40 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.29.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.29.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.29.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2170
>=20
> Build hash information:
>=20
> bitbake: 8e2d1f8de055549b2101614d85454fcd1d0f94b2
> meta-agl: a0cdd47872a252f9a9075ed5151bbd595fd6373c
> meta-arm: 10c27f061b22af78e17a23cf540b69501afc7160
> meta-aws: 876bd12dd82a5f9dd40a73288f0c2541c15a610f
> meta-clang: 8a1d0a1993040ab9d2fb7259b71e4c9582f5cd17
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 95eb26cd3372439443acd1f4d4265989aadeca88
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: 06fc0278f10d630838d703dde707bbf0e2999873
> meta-virtualization: 3e4dba95e6b5f5f68d0b3a5899b106c89da59428
> oecore: bd620eb14660075fd0f7476bbbb65d5da6293874
> poky: 81ab000fa437ca04f584a3327b076f7a512dc6d0
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
> View/Reply Online (#582): https://lists.yoctoproject.org/g/qa-build-
> notification/message/582
> Mute This Topic: https://lists.yoctoproject.org/mt/114603423/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


