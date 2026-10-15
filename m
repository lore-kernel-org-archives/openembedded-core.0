Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E886CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 10:16:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36544.1792059398182354836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 03:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=enCEESWN;
 spf=pass (domain: intel.com, ip: 192.198.163.15, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792059398; x=1823595398;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+KGURyzxlypjmyPn2ZdldsJQDeAqJH0pNFYeY70gG/Y=;
  b=enCEESWN+YU3xZXsl7r4uh99VGcQ9AHXNTowrrU2go+q6XvFHoSnSeHK
   52LLLXsxfOj9/nUXiPmYeqlWWCPR5S1qoCCSb5UeSQ8pTs+DWzRnnVCYq
   MdIlRAJNyBFNmuLCtNrrdg2IwxHKdORC/c7zSlQBaq81nvhVYApfblT5n
   ti2xz75WnYgZ1pWadTmTZO8iN7AOE+YVuEgJccjBFFrDPpxUVqJ3umSnA
   05ZmFV2cJ4s+vq9qOPaMBP0b9ZasqM+IsIahq4OEI+kjge09fEbIABl+h
   mTlgWudsn5blvKzuA86ODW+cuiC9UqmQzcaYdEevkqbl/XUpWiGIztxWe
   Q==;
X-CSE-ConnectionGUID: QF0RyhNuTQOGOvtsJe4szQ==
X-CSE-MsgGUID: GT/DScB9RSuB+ci8ZT6z4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="833100"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="833100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 03:16:37 -0700
X-CSE-ConnectionGUID: lTrWab66Rk2Y0eI19priCA==
X-CSE-MsgGUID: QAOHp8RZROuqi3azygOoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1982632"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 03:16:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 03:16:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 03:16:37 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 03:16:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfYuB3kkS4RW8LOkC2dNtwrs3wOG8FYHk1YPQORXWOi9V6KhGFfdpI4+YeStDgBRlQa539LShrKENXeA0QXOx2lpItAuDiTsWW11wsM78m8r7jdNrdV1zWjqhzFOK/6ga+/IpekWyHrAEKmXTjTjvIoni97DyZkMC5YuHf4SU7y7OCKHwa+TOEWlY3UqfONiTvaNFIAkDZ46itpyaHQiu+1VFKaDgdpGdJEgcCJH+6DpoX/6XsvYCIREGntq7g0zSIZ7K9P3OHKdqkN7A03qeytc+sF+tACtUX+1/wlzCSfn2rMA5r3S++RQ5CxEkwUmTP/fteqVfNZfZ75WACoicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KGURyzxlypjmyPn2ZdldsJQDeAqJH0pNFYeY70gG/Y=;
 b=frm4KI1nyuT+cmd52uHQqBOHcCR5cSyQ3Ur33mBhliqx7tLLoPRJZDrDT5pYa6fSqn1s9ERr9t5ESdO/mQ3RE/B0R3IkkaiVDeSpXknRjVuvYtbpnxr4gB9iPQGtt+OBqyJ6gmQVWH1TNmJU/WfhdwSWrkKQLVaWVBiq5AaRONQcDK1GdBnHPwXFsxm63zEd/cpNv9QABuTNgoJMLINYp8CRo7J27I0EiEZTpJN9uwsKzLB1SOk1DZvMzFyD1XltTBmX4IOYUDaE2Rg+B+Tljt+pBAfKECXGotZmT9RDMKPkiITErhw2Z1fx2ptBMDSGNZV9YFBuO4k221OULJ+J/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 10:16:33 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%2]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 10:16:33 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.21.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.21.rc1)
Thread-Index: AQHdVpRRtAXkfVckp061Q8xRmZ2sxbbyk1OAgAva9oA=
Date: Thu, 15 Oct 2026 10:16:33 +0000
Message-ID: <SN7PR11MB70180EE6A4E501CA8DDB45D8F49C2@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <010101a117e56e0a-bd01c028-29f8-4540-9e61-6d0598e33869-000000@us-west-2.amazonses.com>
 <DLYWXGKU0A6C.3P68DSH9ZX1MV@smile.fr>
In-Reply-To: <DLYWXGKU0A6C.3P68DSH9ZX1MV@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|MW5PR11MB5932:EE_
x-ms-office365-filtering-correlation-id: 72da23ca-2a9e-451e-bbe1-08df2aa5632d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|4022899009|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: r4yDgjAACmaq0OVhBAawInyz5Zq/IEHS8qXHIHx/sdQ/YvX4yFoAv26QZpBpi1og6sw/wAQUslOioP4q036r+q3OEraRukGKkNb71SUzVQJcFHIoX10KHniVGtPLD19daUpYMzqW0AjndXd0L6m2adBt56Bxmkg8R12dipptSywHou0TrP2j0rmVetnjkpAGRGHIB0XOoWtX1B2e8wwlqrYBrfdDBUyoUMcR1oQCzByElLBYbSODXSZYg8EScnWF+6ciU8muOj2nwPNpAR2kluz4UUFGgZbwWg4a91v4cLcPWXsl8ruSz9zNopxaUN9LuKazv2Gg7P0XTqie5HW2B9Wd4wUqbI4WofY0SqbrKumeCQfvbb2N7DFkgk82YGishA1CPkkKVG0vDQB4f75O/3UJF4JIMXsEfEExZq8glvBoyCXlClcDlqCtfc4RqWw8LzHQAGSdL6KRm8JjhdpBIgHBLmDc8YasseTrq4njdO46uTZoNJW56fZ9A7vcF8eVoBF2gnU6MpYICs1kYQXwa70OyMxPUefYR9c9zSgLVm4XS4xfCsnlLh44IL3hT1X4zTKqBP6F5ou1xNpvaqkUsCaaaeVX4b8fsaqCs8GoGAjpAgfczUYZn+IV7fz6bj2Nw7+g1CIaiRq5TbMwtvOCyK8b1nUc1fenYpYZIqRx0BE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(4022899009)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mjl0bDZMVFhNdVBmc0NIUFVYa0pTRzg0QUVua2plUk1Ca2RXQUZ1QldmbTV5?=
 =?utf-8?B?WExoWFFPY1Q5YTQ3M2llUmRZY3hMR3IxZnJpaWg0Z0FFbllmQkFGYjJWaTFH?=
 =?utf-8?B?VDlZcXArR01KSHVlbHJ5ZFN4QWdaWUN0MlZtemxHQzFEdTRlNDJZWUdtUXJD?=
 =?utf-8?B?UTFhdUoxUHpvT3BvQzlnQS9qL1lBcVRmdDlPRHBkd1h4amNWM0FRYUVEZVBG?=
 =?utf-8?B?V1NkV29FRHVPM0Z3Vkx1MlB2eGFBZ3lSOU0vK25ST25WdmFSM1FUQ0c2VG1q?=
 =?utf-8?B?a1pFMWROK2hXZHZpMGpzeXBmdGM3Um95T2ljMGhHdWZ6d2VDbk1LZWoyYzJU?=
 =?utf-8?B?NHRkSjU4cW5Jb2VqQ3hZaVNzTm5DR2dvczg3NFlMTEx6dGp4OHVnQjFkQ1I3?=
 =?utf-8?B?a3RVNG4yY3JnTEc1TUxPTWhIcm82Ujc0bkxWc2taS2lXYzZJZlV3M3BjUVY4?=
 =?utf-8?B?V3FnZzJuc1JQazUzbFlWSFU4YjhQdGJLMWdaTDVtKytHamErdmxZMWlidkJr?=
 =?utf-8?B?K0dEVkZrSXg4MEt0eGZrNmwxVjBYcWx4WVl1TGpwRnRmMkR3cW12bmthZndw?=
 =?utf-8?B?QkVmcm5UdWo3M2FSbTJNVlhUQUVLZmlOWndMU1JhMnFDaHRxSm1SSXRNVU9R?=
 =?utf-8?B?eG0vS3pyTHU1K1ZmUW1SRjZFM1krSmdPVVY5UndBS1hBbHBYc3BtWlptZy9S?=
 =?utf-8?B?cFZxSE8rWW9EMitUTS9jWXF1OEhNcHpkVVJZSkJjd0dlR2lUbjZVRE1PdUJW?=
 =?utf-8?B?Y1l4N0xTZDRpQmgyRVZvZ2NyaFZYbmdyOEhCamlKV3ZFamRLbjM5WGlMKzlj?=
 =?utf-8?B?THNMNGc0RGlwOUx3SUIrRW5BS2JkaldGMDczZFR3cXBDSEpYbGJwTHo0WUpI?=
 =?utf-8?B?eENhZDIySDFSUFZxeU9UbTFabzMzTjBadVBLWWoya2pKcWR1c1UxRmNqZ3kw?=
 =?utf-8?B?eG0wUU1OSzA0LzVtbk9ST0Rsc0dmNmpTbGgreVhxL1laTFp0akdVNFZYV01P?=
 =?utf-8?B?NmJxMlllTGpXdjZPVndtdXRQTEw0bGhKRGkyV2dSTnN5YVZhelR6U3pKQjdt?=
 =?utf-8?B?SjdpbUxtcWRmZnpNQitpSC9MRThGL0I2amlreVJaUnczY08xN21DSEx0d0J5?=
 =?utf-8?B?UGMxaWlQZHdrV2N5RmlqM0REdytSUjROL09TUC9qVFU3VHAxUEhlcklGWCsz?=
 =?utf-8?B?N0Rpd0t4OThaaXVMTWVseWNsVWM1NTlaVHF5NVlxdXZhclNXRExJa3hnSlBo?=
 =?utf-8?B?M0MrVU1Nb3prR3NteGhKbC9KRE02NWF2RWRnR3JadlRDUjQweXgrYVhJb1ZI?=
 =?utf-8?B?MkdmNmFZelN3eDFxT2JBampSTWFGZHdEWHhlQk5laXh3TW8va01MZHVCOXFO?=
 =?utf-8?B?VytJV1hpMFRYUjNWR3dvdVZ5KzRlYzdGOThKRTVjSXE5czJqSDRoeUtjNkRi?=
 =?utf-8?B?a3ZCT1d1RWREK0xlTmZSck4vd21ZaHVYQjdvaFR3VjVqQVRXK3h1SGVrZVB0?=
 =?utf-8?B?cEpjS002ZjhxSEFQR0puVXJscXlrTk5memJKRWQ4RHNMNzlCSkdvVmp6TmNI?=
 =?utf-8?B?elA0UU9aYzM5NExxN3FDL1V0SThGU0lqMUk4VmY0MHcrMFVNTlBjU3N2b3Rs?=
 =?utf-8?B?VUxtMUpyS0RhR2V5dW5BZEFVd1BlS1dxRDhzZGVpQ0JPcHY4UVlWSGdYc010?=
 =?utf-8?B?SGRiamlGOEZuNE9UWkVGZWwvVTd0U1Azb1RibHQyWVA4ZENJbytkRi80MGgy?=
 =?utf-8?B?S3J1cW55NmhnVkozcnlob2h0YmdUV3JvYlQ3UjdDUXRVVlhRMkU3UFdlWUdm?=
 =?utf-8?B?bjhQd0dzZ1AvdWcxT1EzWXBMNlJYM2R4ZjBHanR3UzJoSnAvbEJ5dWhEc1Bv?=
 =?utf-8?B?SUdGRmtLdDVUV0c1ajF5a2JIdytGK21ucUZyazZzSWtsU2RvaGxXZEkxUk1s?=
 =?utf-8?B?MFhxbEVRd3JGMVNpN0lqYUY2YytET1BCNDcvL0VQYVI0bUdVdFhvRVZQMGkw?=
 =?utf-8?B?RHllOTM2YU45WkVXUTM5T0lqOEtVTWJaSVl1L1VTQnBGWWQzWlZ2aFBHMVBG?=
 =?utf-8?B?WEhaQ0QvcVA5bXAxT3M4RHozNXRxMEZhV1hUYVFZa1VmdEhhcXdyOEFBOW1r?=
 =?utf-8?B?MUhoRWNEU1Jwd3Q0NnZ3MCtMU3FFeEVkbWpMcjNKaE13NzUwMU15bzVMd0Fx?=
 =?utf-8?B?SmZMaGdrN2FRb3ZRUDNKM3d1NXhkakgycDE0V2pQYmtkaDR4alVGU3FLRC8v?=
 =?utf-8?B?eGJUU0pNSmx0YW41TVNoOXByVWI2bEFHUnNCTkI5emZ2S1ZHb2Z1cTJaUmRL?=
 =?utf-8?Q?8rpG/uV5ggIdUPikmk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: g8D3nA1KAbzgbfzGgSZxOgFNFNNn4jRfDKNT0vGHJzonp1ORxr6LPjNwLslYkM+7+4qPsw0jLUE3pqp7J/ju3+Kl96neexejA9ntKfsKKEzblwyfMVl1RhC4PjWSE0jH+XRiS+KEWSgjRQFkoHnoNDV90ln5kj2OuKwF9y0rIjEuuhJNnV7n9alYbXN0adkPdjZMymkpCESQCgQTRm0LDpaZcMmQ8TgdLMnBLgFBu4B7PIhwTb7uRu5M5L5z97TUZhCg/Nbv4mQ+G1EHZGf0krytd5hwGOdP5C37adfbNI3y4BmYBZzf0hGyF10bfQZGxdcQfVnCuqxicI+Kmr7XCw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72da23ca-2a9e-451e-bbe1-08df2aa5632d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 10:16:33.1681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g9dEw2CBAeHGHgTDAF8zWpoyGeF2QGKFhwaTqzKyqsUUIRJ0t/N9xG+OiiMEnIfkENb9hDgAa8x5ZGkmi1SvHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 10:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247872

SGkgYWxsLA0KDQpJbnRlbCBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhlY3V0aW9uIGZvciBZ
UCBidWlsZCB5b2N0by01LjAuMjEucmMxLiBXZSBhcmUgcGxhbm5pbmcgdG8gZXhlY3V0ZSB0aGUg
Zm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVhbCB0ZXN0cyBmb3Ig
Zm9sbG93aW5nIG1vZHVsZToNCg0KT0UtQ29yZQ0KQlNQLWh3DQoNClJ1bnRpbWUgYXV0byB0ZXN0
IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KDQoxLiBBbXN0b24gTGFrZQ0KMi4gQmFydGxldHQg
TGFrZQ0KMy4gTWV0ZW9yIExha2UNCjQuIEFsZGVyIExha2UtUw0KNS4gUmFwdG9yIExha2UtUA0K
DQoNCkVUQSBmb3IgY29tcGxldGlvbjogMTkvMTAvMjAyNi4NCg0KQmVzdCByZWdhcmRzLA0KRGVi
YWwgR2hvc2gNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHFhLWJ1aWxkLW5v
dGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC1ub3RpZmljYXRpb25A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFlvYW5uIENvbmdhbCB2aWEgbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZw0KU2VudDogMDggT2N0b2JlciAyMDI2IDAyOjQwDQpUbzogcWEt
YnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IHlvY3RvQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBu
b3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZCAoeW9jdG8tNS4wLjIx
LnJjMSkNCg0KT24gV2VkIE9jdCA3LCAyMDI2IGF0IDk6NDQgUE0gQ0VTVCwgUG9reWJ1aWxkIFVz
ZXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+DQo+ICAgICBBIGJ1aWxkIGZs
YWdnZWQgZm9yIFFBICh5b2N0by01LjAuMjEucmMxKSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRv
YnVpbGRlciBhbmQgaXMgYXZhaWxhYmxlIGF0Og0KPg0KPg0KPiAgICAgICAgIGh0dHBzOi8vdmFs
a3lyaWUueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTUuMC4yMS5yYzENCj4NCj4NCj4gICAg
IEJ1aWxkIFVSTDogaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmll
LyMvYnVpbGRlcnMvMjkvYnVpbGRzLzQ4OTUNCj4NCj4gICAgIEJ1aWxkIGhhc2ggaW5mb3JtYXRp
b246IA0KPg0KPiAgICAgYml0YmFrZTogZDNiMzI1ODdjMjMxNGZlYmY5Njg5N2Y5N2UwMTcyNzkw
YjRmYzFjZg0KPiBtZXRhLWFnbDogNTlkYWQ5YWY2OTIyODNjNjRmZjE4ZjkyNTEyYzM1MDI2MDlk
MGRkZQ0KPiBtZXRhLWFybTogMGE0YjkxMWQ5ZmQ2M2FiMjljNDUzMmE5MDdmYWUzMjgyZGJkY2Zl
NA0KPiBtZXRhLWF3czogNzVkYjRiNDg5YzIxZmU0OGRkNmYwZmYzZDBmN2Y1MmFkNjcwMzNmYg0K
PiBtZXRhLWNsYW5nOiBjYzI5YmViMjEwYWI5NGVhY2M1M2JiZDY3ZTI4N2U0ZTMzZWRlMzQyDQo+
IG1ldGEtaW50ZWw6IDVkMTUzZTM1YjRlNzUyNTA1ZWZlYWUzNjhmMTg4ZmFjNWUzMWNmMzMNCj4g
bWV0YS1taW5ndzogYTIwNjVmMzIxYTNkYmNhMWU2OWYwNzA1MDI5MTdjNzY2NTNkOTEwNQ0KPiBt
ZXRhLW9wZW5lbWJlZGRlZDogMGYwMGY4YjlhMjE5NTA2NDBkYThjNTcwNzM0M2U1NTQwMTMzZjg2
ZQ0KPiBtZXRhLXFjb206IGVjODBhMzZiY2UxMWQ4MTgyYjRiYjJhNmZhMDM1OWFkZmVjY2RlMGEN
Cj4gbWV0YS12aXJ0dWFsaXphdGlvbjogYzE0MWIzY2Q2MGFkM2ExYmJhYjIyYjQ4ODQ3NDJkNGMw
ODJiZWRhNg0KPiBtZXRhLXlvY3RvOiA4MTgzYjU1NzgzZDQ1ZGQ0NTY5MTk4M2JjMGI0MDc3NTJh
MzQ0OWY0DQo+IG1peGluLXdyeW5vc2UtbGludXgtZmlybXdhcmU6IDcxZGZiODFiZDk4ZjU5Y2Ey
MTI3ZDM5YjEwMGVjYmI4Y2UxZTBiYTMNCj4gb2Vjb3JlOiBiNGYwNjMwM2U1NWM3MjcwYTg0ODJh
NjEwOTI3YTFjNDFkNWRiZjljDQo+IHBva3k6IDRmYjcwMTZhMDc1MDc2ODMzNTllYmQ2MjBmMTk1
MWZkNWVhNDRiZmENCj4geW9jdG8tZG9jczogOWQyY2I3OTBhYmY1YWQzN2IyYjFmMzU4MjNkMjM4
YzU3ZjRlMjFhNQ0KDQpUaGlzIHdhcyBhbiAiYWxsIGdyZWVuIiBidWlsZCwgc28gT0sgdG8gcHJv
Y2VlZCB3aXRoIFFBLg0KKExvZ2ljYWxseSwgcXVldWVkIGFmdGVyIHRoZSA2LjAuNCBRQSkNCi0t
IA0KWW9hbm4gQ29uZ2FsDQpTbWlsZSBFQ1MNCg0KDQoNCi09LT0tPS09LT0tPS09LT0tPS09LT0t
DQpMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NClZp
ZXcvUmVwbHkgT25saW5lICgjNzU4KTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cv
cWEtYnVpbGQtbm90aWZpY2F0aW9uL21lc3NhZ2UvNzU4DQpNdXRlIFRoaXMgVG9waWM6IGh0dHBz
Oi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC8xMjE2MzQzMTIvOTk3NjEyNw0KR3JvdXAgT3du
ZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpV
bnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtbm90
aWZpY2F0aW9uL2xlYXZlLzE0NDI2OTk5Lzk5NzYxMjcvNDQwMzM0NTUveHl6enkgW2RlYmFsLmdo
b3NoQGludGVsLmNvbV0NCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg0K

