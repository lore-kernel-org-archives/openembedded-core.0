Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159C7C71157
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 06:06:06 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web10.2124.1750745156672391132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 23:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Ucdd1GS8;
 dkim=pass header.i=@bmw.de header.s=selector2 header.b=EUPMOS86;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=263640ee2=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1750745156; x=1782281156;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tBwjXM15WKmIg6+8eUlj07X7Omj3ehHxEU/XwkS6LoQ=;
  b=Ucdd1GS8kTWxFj09fInLUEUFnaa5jphDAl2oyFOsn1cOn8LFAyGZvyRV
   sLgvDwvaOBt0+f/duNm5fE6+a4k2HVqHHdkNrldNX69t18Guh1rlS5B3R
   YLOhSFZM2IVJTEA6gLrOGbfNz33ajfZufJFICN48yJRSthGA3Qn1LIX8e
   g=;
X-CSE-ConnectionGUID: p5x+vElIRhKkvHpsUJYrKQ==
X-CSE-MsgGUID: gjHAc1MiRYmXTRVq3tJ2NA==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 24 Jun 2025 08:05:55 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw2.muc with ESMTP/TLS;
 24 Jun 2025 08:05:56 +0200
Received: from smucmp10g.bmwgroup.net (HELO SMUCMP10G.europe.bmw.corp) ([10.30.13.89])
 by esabb2.muc with ESMTP/TLS; 24 Jun 2025 08:05:55 +0200
Received: from smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) by
 SMUCMP10G.europe.bmw.corp (2a03:1e80:a15:58f::202f) with Microsoft SMTP
 Server (version=TLS; Tue, 24 Jun 2025 08:05:54 +0200
Received: from smucdzmp09.europe.bmw.corp (192.109.190.43) by
 smucmp12a.europe.bmw.corp (10.30.13.95) with Microsoft SMTP Server
 (version=TLS; Tue, 24 Jun 2025 08:05:54 +0200
Received: from AM0PR83CU005.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.43) with Microsoft SMTP Server
 (version=TLS; Tue, 24 Jun 2025 08:05:54 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 VI1PR09MB4382.eurprd09.prod.outlook.com (2603:10a6:800:144::24) with
 Microsoft SMTP Server (version=TLS; Tue, 24 Jun 2025 06:05:53 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:05:53 +0000
X-CSE-ConnectionGUID: j4Gxs4izRJioj11MTsrTQA==
X-CSE-MsgGUID: 69hjNG6FSd+VkZufqv2CSA==
X-CSE-ConnectionGUID: OhIZS5loRbebniADprFBAQ==
X-CSE-MsgGUID: jqXS30qPSCOFIxeNbBxSoA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chEtqGGfzCB+hK9Bz5FW6Dc8r2uVehgp2fjExRD5LGBwRpwT4goJ7AxJgW5xX1dG2+HjUoqtqwkyptJ/Ov2CnoHE+ktMWnoiWf230x/HX19kpk1h/uULI9u3CeCBSqDIx7hx0Ke4p8dSGKUOOE1/amkeO6H2NmYtVmd8Bc7Y+3xnawFUJZncEB8fhGsPkpHxWunA55mkzVLoQy/9OayaJQMGHEY3U4I+datdMpFmH99wv+ryLo4yHT1Fz6KVz/NMW2m0WK6QZaWSSwwVJTPdbV6+VrOtV1QwyNxKxo95FHU77apbgjJ83fYgSpnz52Zl5lbR8T5Cj9m63RgPrxnjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBwjXM15WKmIg6+8eUlj07X7Omj3ehHxEU/XwkS6LoQ=;
 b=e8Z5mco4IHatRqYzendE3yG7ySx4lkbkCE6qVhvxEhYwqmVnVhkgsuUQ5X57Ou6WG5zlr6B6wcX+ZSlkBTTW5ke924xVVdbDWJwA+lKZ/ADMHZtJ8pGPb+FE7hjgixwrR/nCfKR0MVGNlgv9sUkW4N5Et7aGC2jtz6NW/tIU1DnxU09jhppDNOHmiKL9MSqgWCN8GVVvf7mQ1HdHjYEuz/CRQTCUMlQg6PcALk8+ECQh6xDR+rT0qwgJCLIA5mIHyb0O4AB5KhVxKUgxOStVIZcCvvcPUFoDiPQXcelyrX2PXqRoBEY79BXesFqPXipRyIy896+YRAaMyEVqLxhY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBwjXM15WKmIg6+8eUlj07X7Omj3ehHxEU/XwkS6LoQ=;
 b=EUPMOS86b3YaBYgMKCpDl9sdBZKOhl0+uiWKW9+63IHXa92Phq0I9N/JWHRDotchsIw30nfm9AhEUMXPiw4PQPAKMiIAR0k9nn1mz45Ceusc+b48K8O6dpS4X/QCz0nzt/OO1CZWc/W8+1f2cI2qAXfNTAYyp/Hzc/E2F+PAdaFNuYvLd2sej2Q//DmO5SdJ7D3qpVutQMaTbRjnNl6dm9D+7qcUa2pK1IyryJ2WZJcdv5NxcgKlhbU5QqTqBBWVZgmezBtpKzEuGwRCKtRa6fLdF/JkQM2DPaGRUxlxbVfOeDMkO8g2vXE2lm6xARaoMowvY1nLCI1xmTMS8VKWwQ==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] json-c: Don't build unneeded apps to unblock
 builds with CMake 4+
Thread-Topic: [OE-core] [PATCH] json-c: Don't build unneeded apps to unblock
 builds with CMake 4+
Thread-Index: AQHb5B7uJFB96RKCOEyE2sipVmxEArQQ0MUAgAECAzg=
Date: Tue, 24 Jun 2025 06:05:52 +0000
Message-ID: <DB3PR09MB6202D7E8209CB072EB74C70DEA78A@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <20250623091203.2859711-1-Moritz.Haase@bmw.de>
 <3a86eb2b-a2ab-40ab-b00f-66d29823ed65@cherry.de>
In-Reply-To: <3a86eb2b-a2ab-40ab-b00f-66d29823ed65@cherry.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Enabled=True;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_SiteId=ce849bab-cc1c-465b-b62e-18f07c9ac198;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_SetDate=2025-06-24T06:05:52.1970000Z;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Name=Vertraulich;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_ContentBits=3;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|VI1PR09MB4382:EE_
x-ms-office365-filtering-correlation-id: 0e54a810-904c-4f14-b9bc-08ddb2e52d22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Iuv0ATarXufOulooEtPsWhEt48Oj3Vh/vvKJpNF5FnjPmKk/Q7JLQlwjyV?=
 =?iso-8859-1?Q?5jXb9KiIusoOP5bWb6f0BWVh6q2eMW3M0NE48UzArQ2QF0o2SAxpBv8ooE?=
 =?iso-8859-1?Q?DmIrzea0y04EB6FTs8rahhx5snBUOqqcBuQohYm4+PS6F4FXIpcNaDeuRC?=
 =?iso-8859-1?Q?zyJWEXtMLR0ECoMtYl4MqfPtX8tjwBAqBbmcRFZrbB9vmMdRNOvd2uVzZP?=
 =?iso-8859-1?Q?eSg/xPwwCNX5OQ+7bO/cac00qNO0XJtid4dw8TbSmOfE8xGmQEVHEN7V2L?=
 =?iso-8859-1?Q?VpL76wKgYvtPNge0e+r+KMFPPl62E3Ox4TIaVWAM2dKHoka+wWD4igg1OC?=
 =?iso-8859-1?Q?XpSPPGhHKxbuBC+6Ze+kVPGuviudbrAA9SpCR6YKXOoRw2HAInAgAZyp+n?=
 =?iso-8859-1?Q?RtqE5T6qP7iza8S9OJjD3GLM6sIMGMMLKgGIgCzfatgMARZz9UtZlYblrm?=
 =?iso-8859-1?Q?Xvb9Y4TxMmRVvTQFtErGPHD1Tm3HtzFXfGIMv8gPz8l5QhUSqk0Z3UWc8l?=
 =?iso-8859-1?Q?1kiCe7tZRHXdU9Y6+9vx6jQpBK995nGNljzm/kvknu81KBZSqADK/yHIdu?=
 =?iso-8859-1?Q?thFK1LsI4731Po0FynRJ0Z1wcqyd2Ej1Uz1sDE2X/5gyrUk1NBwGCyCgt7?=
 =?iso-8859-1?Q?gyyzpEB+6G65GA0Tmbc084+3OU839XfqfebUgRPqol4bLIPTk+uXxA4YZx?=
 =?iso-8859-1?Q?jkx8n9CTcOd+VVztnQ6LIEXMh2XmuwCUPk2g1G7WLul2xnpBuA0H31XTN3?=
 =?iso-8859-1?Q?14ilJ6v0ufYC1G9oWS2E1Ahgql4QDVUGzmWlDIpAZQQ9fi5oxhfrs6o8eY?=
 =?iso-8859-1?Q?PjslHsnFI2JTkr98FhPRMxYZl8+5Fic/wVd6nC+8wpuZYyvEHCxe0vF5NW?=
 =?iso-8859-1?Q?DkLYEhXbC+xm80gtqxhik9IRvhgMBuzFuMiaDIhEkcdRNoAI7dUsYH+F9o?=
 =?iso-8859-1?Q?B6Rm+NEEgeSXTYFLjzbYnTgJO5xEpuvPXwWqVK3QmTN6MsHJ1Cqq9CYo0E?=
 =?iso-8859-1?Q?fik6FXsjEzCQiobYH+cehnT2NYj9yZArEidzyS2HsMoPgLrIJ7Q3Vuukrx?=
 =?iso-8859-1?Q?GoG+Y18/P7AbmyHozZ+pQhgtatWV3ULudgh5Fe/sIvgm9r4knd5yy5zK64?=
 =?iso-8859-1?Q?kacgmPRvfUg5no/2Ol2hfC1uw+1ko0JP+3kAfVUN2lRfPsEzPbka2eNQVg?=
 =?iso-8859-1?Q?Jo7JU+Ym/oXf7GhdgekTmmCyUeBIlOOAwrU0tA+lLOSc/Wd/Wt/GoVeQHE?=
 =?iso-8859-1?Q?XIlWdBVZIyKVbjv8eke51viK73IEnf9NUOXWIPlpot7pbde2z5tdy2D28H?=
 =?iso-8859-1?Q?WNE9+oRaWoO/PzqTuz5CL0E0aZlkzW1ErAWGo9Ms3GbFJ4D3Y7KcfvmPAL?=
 =?iso-8859-1?Q?7L/8Jv4Fo85ady4NH+vbh40IVIF5QI/SVtXPWKojZZ0p11761548C0Bl0Q?=
 =?iso-8859-1?Q?pt6Jp84Nub7Skx6m08ngK9lUlzDNFKVBGnidKwWNfSkq9sxzc2G0pHn081?=
 =?iso-8859-1?Q?X9J1UU3vLJBPls0ULuMBx23aoV5pPJrxB9IDAIOA2uq+5B1G03TmdmmNQ3?=
 =?iso-8859-1?Q?tQeI6VA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MlQFCPf6WeTB4QFzg35g9BopuajbAmJHCUY88YXWbsU0x4K0Eop5MJlqXA?=
 =?iso-8859-1?Q?gJxfGc/dIJ7ogArP1lAgf5dNXNZATDKxh99CeizhFeQvROezEqEGTU3ocn?=
 =?iso-8859-1?Q?MrzYvoeLwxd7RTIn8RH61OfW8f2LllHcof5URK1UIcQ0MYDc9hKzFj24dT?=
 =?iso-8859-1?Q?vlCc6+WC+UQCnqWd22C2Ol9CrfBgaZHpWymX8dNVG3Hvuwkbw7t7lKRYuH?=
 =?iso-8859-1?Q?RCHvPo2kx+Zu3NRlsBiSDKAqN9mXBLUuuJ3mnEFfu1b77ooLdzaeWkRnk5?=
 =?iso-8859-1?Q?39LYt3UBJPxfjwN80uySuy7wCcbIcjsqfT3I65NnhYQml8cpJ1fKWmChAM?=
 =?iso-8859-1?Q?FIbeqYR2O641lVefhnCSy+9RJPcxYX7E/HMrva0RdU5LkGJCuHmQexaSTH?=
 =?iso-8859-1?Q?K/3uBOWgO4g77TG/5khnjlPSiWfFa+ZGvc2Vxo0BudtsoWio4CUlFXtn8C?=
 =?iso-8859-1?Q?nSnAQzy4eFrDqCUlEnkD9eLDyIUZGlMqJW+zhp1u5SFBSthRZAIipaiYzD?=
 =?iso-8859-1?Q?ENuO2MGviniRO78HyVpUF0JYKnRShp6XcP60zZIwr0uJ63hvOdrjNWxPlm?=
 =?iso-8859-1?Q?vzIdtHS1vnYhQe0hIwPvup2YOeOkEz7EKw5x0WNQNVAe7n/5XsyQAUY7Q6?=
 =?iso-8859-1?Q?Apv3cKWXclmDVB+sni7uisHPiGdrQtvaOxaclMX0Km3b8Yfr+XwjtlSeNt?=
 =?iso-8859-1?Q?o77zHkxOphsFGnYXm/7mHuXXSp6lR6PJ1JFU/e/VpTKih3vMsmVBywNZ6+?=
 =?iso-8859-1?Q?GNO16g94TIRcSGS9b4OMfIwHQnaM4gE6ch56Bl+asANpKbYllJjV/TFREt?=
 =?iso-8859-1?Q?60SDrcPhSzSiqRcE5ZmFIMcuSWSe7I73lAvJXdOoPIKKHYXeFaANDyltT0?=
 =?iso-8859-1?Q?xybqzZqNwD28epPjQ6NgZ5eWz2Rl6OXxeJdVB4KTpiH0WT9JMSQfORWFFI?=
 =?iso-8859-1?Q?2mWk8XXthhPJVx6FbE2Bu7Ynkir8wl3bWaECj1cWndMCyWMsVROzQOd7cV?=
 =?iso-8859-1?Q?WlZbn0BO3Qxi9bm3U+AWP6W4i6Gkmv59Aml8yySm+Pemzvkvcgf7eAknOz?=
 =?iso-8859-1?Q?D+LGtSUdnpOySMWvewYbGHU9RB4ljH8SdRVd8Qk5/vhU/51AIKxPegoEtj?=
 =?iso-8859-1?Q?8SJSw7ccn0BjCTEWgn98xVALBcGgLGMw0KrT5H/auF0UqJaGELvzwNewfv?=
 =?iso-8859-1?Q?5ieoC9c+rxbmAEnG9Kb07Tu1JC5bzjRvoPjefoS6W0ErAjuFuosNnC5pwY?=
 =?iso-8859-1?Q?NNY4kLw6Tn5EEKFb1nvpCuHjVYAOQhENyxnE6eKyibvq2H+otevfkvJWZm?=
 =?iso-8859-1?Q?NBBojSq5uHVn556kdGT5SUxIkCFu6+AR0VT5/r9HfNRSIRYkc3el9SLOCd?=
 =?iso-8859-1?Q?/49Psu+y71g3uSqO3eLynbMGru52jGIiAcxWa/be58P6Q8iSLx3dKm00RA?=
 =?iso-8859-1?Q?rn4cIL7+0N+JNqh9p86WmAoGWMDbBlJI6xeVOLNNEDt+yquyjHlbRQGTm7?=
 =?iso-8859-1?Q?DK5MCnplwe2WrnBK2ZD702myWNEic/V9PEgVBl7MYmUeYTeK7hUtCdqB5U?=
 =?iso-8859-1?Q?rjL+W2EXA82U9p7mEXL5FMeDCcrweFoJ9qUbg+PqVUo8lpReigNdSOSAGH?=
 =?iso-8859-1?Q?tsgabOsCy/8+w=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e54a810-904c-4f14-b9bc-08ddb2e52d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 06:05:52.8704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jtsce0x2BP/nZ14uwvU5vGuZnKcnzOF+s0aHmkuINS8DcKK4xLdqXilH8v6aUrpssr8wBxDrkXNHQZeha4K98w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB4382
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 06:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219227

Hi Quentin,

> Maybe we can get rid of that now that icecc isn't part of OE-Core
> anymore, c.f. ba4fd5229893 ("classes/recipes-devtools: Drop icecc from
> OE-Core")?

> If that's the case, then a separate commit would be most welcome so we
> don't do two things at the same time.

sure, I can give that a go once this patch has landed in master. Locally it=
 builds without the flag, so let's hope it "just works" :)

Moritz

CONFIDENTIAL

