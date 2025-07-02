Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D15C83F04
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 13:15:05 +0000 (UTC)
Received: from esa8.hc324-48.eu.iphmx.com (esa8.hc324-48.eu.iphmx.com [207.54.65.242])
 by mx.groups.io with SMTP id smtpd.web10.23361.1751462096654381373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 06:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=O3UiVvS5;
 dkim=pass header.i=@bmw.de header.s=selector2 header.b=NGTKbuAT;
 spf=pass (domain: bmw.de, ip: 207.54.65.242, mailfrom: prvs=27128fcf3=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751462096; x=1782998096;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=D057lLog/xzaOPN+XKxX63oO5/EVUTT4OcLab6WkqG8=;
  b=O3UiVvS5BxeH9CBLpK1L7lLeD3o0QYxt0v7Z2a3qrXm/quag8GG5+zlB
   CWfeO292APJcvsuBWADu7YKaOfcXDGAgsUZFc1cMPhaOF/xy5UYu77MLu
   Jm5UWrWyGVhgwCyWSlQ03ng0zsK9HiDsBxeCKq/p1hfojmlJ8YR5tbWT9
   c=;
X-CSE-ConnectionGUID: uHvfq7WfR32dgD9kJCSYXw==
X-CSE-MsgGUID: UWe8PdGpRiSkuQFh8X6hxw==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa8.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 Jul 2025 15:14:54 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw6.muc with ESMTP/TLS;
 02 Jul 2025 15:14:54 +0200
Received: from smucmp17h.bmwgroup.net (HELO smucmp17h.europe.bmw.corp)
 ([10.30.13.158]) by esabb1.muc with ESMTP/TLS; 02 Jul 2025 15:14:53 +0200
Received: from smucmp11b.europe.bmw.corp (2a03:1e80:a15:58f::2235) by
 smucmp17h.europe.bmw.corp (2a03:1e80:a15:58f::1:54) with Microsoft SMTP
 Server (version=TLS; Wed, 2 Jul 2025 15:14:52 +0200
Received: from SMUCDZMP07.europe.bmw.corp (192.109.190.47) by
 smucmp11b.europe.bmw.corp (10.30.13.92) with Microsoft SMTP Server
 (version=TLS; Wed, 2 Jul 2025 15:14:52 +0200
Received: from AM0PR83CU005.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.47) with Microsoft SMTP Server
 (version=TLS; Wed, 2 Jul 2025 15:14:52 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 PA2PR09MB7673.eurprd09.prod.outlook.com (2603:10a6:102:41f::7) with
 Microsoft SMTP Server (version=TLS; Wed, 2 Jul 2025 13:14:50 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Wed, 2 Jul 2025
 13:14:50 +0000
X-CSE-ConnectionGUID: jJZcykN2Ry6yfVtDH+dfng==
X-CSE-MsgGUID: hgtxZCIyQjSEIMZXta3dDw==
X-CSE-ConnectionGUID: clAbyxzGRM+nYxFtRHscIA==
X-CSE-MsgGUID: 8+T80GFaRKi7GdXvfO25ZQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvqQWDo9rzk5KPqDCR11D8JcAHLpVj1F1M4NGntyGG19vA45gjc4Fm9ZMIUIvD47sY/tn4MdI9hbYcnv28f5pm84ytgjRyeKIbmdaUhf1+tzbGUPqPc4O329nslYhKJyaFlunQCbhWGN7Pj2wU/1cEJir80q2OJaMM38WizLs5gAlkB3FvP6a1QOwe+6L3Yy2kJwP976wqrS1ow2AuxIa70PBbIvB0Zgxn41s2NiasFNGl0SQCFjxF4T2i0hebUsiYAV8LUhuB/cGJRCxqZTZ9c7Z8WS6n8NDtMgnMbLTqtXAPxwlfG/0eENfSbIBOzYFFiRSV3imDLt3/gnijEGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D057lLog/xzaOPN+XKxX63oO5/EVUTT4OcLab6WkqG8=;
 b=dOyz8IXQWUncfmkQwO/yYkg1RSxSgTsWCyQv5NeE3s1oSOV3f9o8FXA40W3tOIgcNvTTKe6Q8t60KZ9T7B/X6ETgH66Ffd2MfBCwq7T4F9EGCcnu5wgXe3pt8Rvgat7UnIaVyoNaA5Q8XHmwf0G+1Mi5S/NVbaV3J+MDl34/wJRgLl0sk61GCdsVqqwCdctB5FOjXLwCWmos3LvwLLBhvGdW8exs9PPGWiOj4yqbzxQLlnzpJq2h/U/J1n2sKPT1n2C9I+Lvdisw6KrChj5vcAN1qX1XJUsv65+vUPXojbC0huiZkiWKxQK20PwlC/on6qjl72+4U4JyJDo+FBdxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D057lLog/xzaOPN+XKxX63oO5/EVUTT4OcLab6WkqG8=;
 b=NGTKbuATU7P7ltXQskxFHyVJZy0fyc988UOkGx7ey5390I0FYBVnBStA3iNNyzCd2/PhcLWNOw7mNS16OtzyoKsgMwU2TfYuhWW+jeNtRdGKT6T2qB2aOJwW+odYUdHrnR2eLZ4pna8Epsp1Ks2iWF8YLP3rC9Wso6dhRxsvW89yr7yfzZ7dbIqm+U1821QsX8zfHHE+VMdSy5stLSczGc2Gjeu3kQxUg1Rr4H6ljrYfzA5ROjz4cp8iml0ZHs0gt/HVmyj64eMD4Qyt3NwV63PPpbHzlSi8masjZdeeKASy2WLESvCxHCuku8facFoxbgRrBZQmhjwkv6HC/lHTyA==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: AW: Patchtest results for [PATCH v4 7/7] cmake: upgrade 3.31.6 ->
 4.0.3
Thread-Topic: Patchtest results for [PATCH v4 7/7] cmake: upgrade 3.31.6 ->
 4.0.3
Thread-Index: AQHb600h4T0s7p2s90afbNBWqs0lQLQeyMwAgAAGoHM=
Date: Wed, 2 Jul 2025 13:14:50 +0000
Message-ID: <DB3PR09MB62027C26865E45248312D5F6EA40A@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <20250702123005.1233743-8-Moritz.Haase@bmw.de>
 <01010197cb2f1014-3cf5ca59-07b7-412e-a26b-0b5c5ae9fb39-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197cb2f1014-3cf5ca59-07b7-412e-a26b-0b5c5ae9fb39-000000@us-west-2.amazonses.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Enabled=True;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_SiteId=ce849bab-cc1c-465b-b62e-18f07c9ac198;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_SetDate=2025-07-02T13:14:50.1040000Z;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Name=Vertraulich;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_ContentBits=3;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|PA2PR09MB7673:EE_
x-ms-office365-filtering-correlation-id: 5596a848-4eda-4983-9ebd-08ddb96a6d42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|7053199007|8096899003|13003099007|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?2AuJtKp1x2m+Sd1HZz4KE4qM4loZVHwI9VL29zMw5nq/h3QS2/WA1bUZXw?=
 =?iso-8859-1?Q?HUscaXOS00kJHhhN1vqG9EfoZtMgOcCb4wp6uHTrHTeqqO9prEh9GxFueS?=
 =?iso-8859-1?Q?JYdh3Dp+Y0v7yP/bEQeSHbd58at0MPZatFmpy6ZmOiEd+jNGEmz8OTCSxT?=
 =?iso-8859-1?Q?fnvHwW5FHjfkyA38ceQTce5SucYb90baVuY9P+0eeO7vf56diKgJDJEWzZ?=
 =?iso-8859-1?Q?XUPz0lnzlZc0wmAPsmeqBmDC+Zz2/DS/HiBmkpsajF7skgy8guUHQuPfLM?=
 =?iso-8859-1?Q?1g7o7UhlXwMGIZx2sSD/dEDiEYdH4rIeEE+be7fXt0b7jQ39/dtAuMZnOP?=
 =?iso-8859-1?Q?dj2DrfhGRDHBQAgAuN877GxBoLYzW3wZUxQjLIRaRRh4whWH+dXDL0ZedN?=
 =?iso-8859-1?Q?jP/fWLRMUozJlLlRmoIj/jCf873vMvWv+CD6tuuahmi5pQsRncBhxE37QU?=
 =?iso-8859-1?Q?GvBZxN05STm20a125s0kUR3i9qwYRReZIRmwD6QaMSNEPRI8NN18PykNZM?=
 =?iso-8859-1?Q?pkO4jVqyTb1Xnt2Gk4gzgG3KUNSF2AjgPbveZ62ekCPBcewKKWxRxRzT60?=
 =?iso-8859-1?Q?RIG6p84nBxzRIyIRkeQ7y7VnSsk+7cHkPAOV09/O5yz/vyjJCnLM4GhN2o?=
 =?iso-8859-1?Q?sjpzcRPDb2F/ri5tQ/pnGHyZb2pGPx4TLgZT8gbo89Us9lowMEpPhsF3q3?=
 =?iso-8859-1?Q?6fth3H6vOX1oOPy/0r4MLjkfMLganCduG/1PyRS4rjq6NEUFcAyRdRN3E3?=
 =?iso-8859-1?Q?g4g6zkLijikhBYMqrImScbvigB2HniaR7Hv3oJ265AaAPgadfDBscnfGpJ?=
 =?iso-8859-1?Q?KZum9nIfoOYIabgtjI4Gfx/hzBaDXu6nIf60DKlYM2byy5QEle4vKWimDD?=
 =?iso-8859-1?Q?wSzefxWHt0wL3eGTTwfXCaNoKKGY0VcMfCbTUcVxSfBxGrUumfLWB+8KHV?=
 =?iso-8859-1?Q?TKVrgDmzCpnUqYGDUSqdyjJgYY9m0cb5HPK6ptNe2GuzBP7I3wrjxtired?=
 =?iso-8859-1?Q?wB7JvWcIniyDza4QkM1NoHBxeOvymTW/KoFSx8BkIpY5lS79zoqC7nygja?=
 =?iso-8859-1?Q?ch/3y0FQc86VhztvYJy9y3PjYnfcMrymBi0DhA8DrUTgoxddHz2tbJ0rvG?=
 =?iso-8859-1?Q?I4iOTil6sUT3x+NtQU1A5fq31PqajQbKXvajiuXBYpcdPZOI4ECAPgLqD+?=
 =?iso-8859-1?Q?xd/+9HfUGbr0khjZ2FinyFh7W+OuQYGwbF3SuGvLZBeFHeuJV2Q9IJREOK?=
 =?iso-8859-1?Q?zdR8GR1Q0tWM4ZPHfxAve0URn/8xdhtdgepx6mDY/CgDuIiMuBFgl5svoA?=
 =?iso-8859-1?Q?ebevCGudSO431LnTW4l5Yo0uO580GqAOg+5q5ewRE0V+S6pEfuVrNJIkLT?=
 =?iso-8859-1?Q?5otMeZgI3zL70Tjl+VgyNFtduve+oCSejuuq2lHVe4cTg2r35C3ToVJPkr?=
 =?iso-8859-1?Q?0SBqURJKdCV6zYciG6InLoLhbdyhi94jBGiGySKo3ktMdoYzUaKygViEIk?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(7053199007)(8096899003)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SHuK/ebAxvjj49tx+Rw/SYft4/cuYpNduDpKgIzVhl/xE3rG0XXXg19iEv?=
 =?iso-8859-1?Q?0DxZexQJ+l36yZ9iN11wXqRvTwO+YN0hMX2AmE9t4rpZOnzAB819hM/qrI?=
 =?iso-8859-1?Q?6FKvGXmrl9ELP0Dj0CqRC9iXJ5HYFmTXvH5cD+kI1R0Yi0nwfrPxtqTgMt?=
 =?iso-8859-1?Q?4gyBUTqiZ+YbMYhbC0tyQAa1zDabBDHP/o7Q7SIEZhVL3N5/4bzF+IfGiw?=
 =?iso-8859-1?Q?h7udQpU70+5QNYG+FyEMmGlDkSZQdS9cM+Cyb84f8xczcjPiGOx9bsHQyC?=
 =?iso-8859-1?Q?Av9N6w8h0fZXqr1anBqvTCAhtH0IYxV1BaSCasZLv0C23nVXbUL/73lGo3?=
 =?iso-8859-1?Q?JvutNP1tGsD56yYT/Y1f2afwyZD0attIMawRpzqRzsfxLBe/f8sq4zDM22?=
 =?iso-8859-1?Q?4OD9cQimCLDmMiaokQwtyJHpX3VSw6JKRzDJpRVSGsYoD2WvCFN4SnhrSW?=
 =?iso-8859-1?Q?2rvZuoSqYRpkSQeXU5IAFB0P7S4MC2//kirS7/P+tKm0mywQFUOXY8RnAi?=
 =?iso-8859-1?Q?5uAUQcp5yR7Ifl6zHyuvVpcGgkIKMzu8IohkqBrPOJgQ9huD89Jl01nDXs?=
 =?iso-8859-1?Q?RqvdJZZIcwYCATvM20JL20sAGMJs6u8oQ+kOyb8qx2mGwfoXMdW3KOjoYv?=
 =?iso-8859-1?Q?ifYNpsvJLk5ox5Ic2rbzLyv6ce9XQgx57F47PfaSV1/izthNNvtCYiDlFb?=
 =?iso-8859-1?Q?4rLK1qPVjSWhzm6HLxo6vO3ZF7TFstEWJgqFbAf6556LGpL1FrEkliLz4p?=
 =?iso-8859-1?Q?xWQcRvvkpswKCkleGDcQuZjwrF+O+iIebU/DPeFhlsLZDyJMnQSQfKhVlT?=
 =?iso-8859-1?Q?vgikpF6J/g/S6m02qa/lIzsatPYRhiYBR8dQc2qaohdfAW1QZ9gMUiLAFn?=
 =?iso-8859-1?Q?8bn0ZRlQ5U42YqW8QcyeAPJst8nEw8wtznfmXUXz6Z1a8UNgjYHcA+9Y8E?=
 =?iso-8859-1?Q?fTupj/8BdFKIoJ4MVrJQpYYceMwcJLPcUdeYPk6c9krYPJj0jzGykxWGVL?=
 =?iso-8859-1?Q?7baUm/fjDbdUQ/UueT/5LngS+PjUn0SrPqG8lJDYjup/4I8I52bE0KV5Jw?=
 =?iso-8859-1?Q?+Tza0aRw4xvt2xPxLB9kOG0M+26DIwoyBnDZbdDEFIs5yeIxHuEX5HGtVa?=
 =?iso-8859-1?Q?q2z9RdIej4dA2dOYWYkM0mAg8pufv6th82vca2mZRwTlNRJAX0h6U0R87R?=
 =?iso-8859-1?Q?1s1KbMr5CbKzNn+mnL/GqDwAj587eKKEbeoYtmldFLg7yTHZwLVPBjH+E8?=
 =?iso-8859-1?Q?lHVKOixxmDtbBQrabBQZzaPUUFXKv0EI6WzCqrgXlWlVRSDBCtf59mhenM?=
 =?iso-8859-1?Q?t2xbF8Fnv3i7cuIPGPFkzLJRsdpV0/CIFuJjbs8vfGbNvCB4jWy2taVTvN?=
 =?iso-8859-1?Q?57xdR+H5TqfyxaqvZX5kvbNrXXHoE4asgoqlc7/Pxe/jB2/kh/uGKKl00N?=
 =?iso-8859-1?Q?enylCxMmQAkPPSZegDAf6nGIPzcjKBWlgloUzIjRVVRosAOcDUf4lS/6hd?=
 =?iso-8859-1?Q?rlEBwH5oF/1Gh6xwnKnQddyqMPYqRPqSy8uiWoS7aMRUilWZD5b3fGg5s5?=
 =?iso-8859-1?Q?VYV98WDJA4zIJW64FhZi9y1B+xsz6R1cmii2zJ+OXiPfpTN5kaNXBk0K+N?=
 =?iso-8859-1?Q?pRKoq5+gRie3tnb6y+Ix0GOiLnaP9mqL+6?=
Content-Type: multipart/alternative;
	boundary="_000_DB3PR09MB62027C26865E45248312D5F6EA40ADB3PR09MB6202eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5596a848-4eda-4983-9ebd-08ddb96a6d42
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 13:14:50.6855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xXyDzG/4K8zgN+cq8SPzPR6U89SlERfCrHWYrdR9Fv0S7dAJTRwkt4Ng6TPm0KEeDovvcN4FMkltOV3/QRZ/9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR09MB7673
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219831

--_000_DB3PR09MB62027C26865E45248312D5F6EA40ADB3PR09MB6202eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

this looks like a false-positive to me. I've double checked that no outdate=
d patch files are left. Might be related to the fact that I've renamed some=
 of the patches. I'll file a bug report shortly.

Moritz


CONFIDENTIAL

________________________________
Von: patchtest@automation.yoctoproject.org <patchtest@automation.yoctoproje=
ct.org>
Gesendet: Mittwoch, 2. Juli 2025 14:49
An: Haase Moritz, JD-62 <Moritz.Haase@bmw.de>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Betreff: Patchtest results for [PATCH v4 7/7] cmake: upgrade 3.31.6 -> 4.0.=
3

Sent from outside the BMW organization  - be CAUTIOUS, particularly with li=
nks and attachments.
Absender au=DFerhalb der BMW Organisation - Bitte VORSICHT beim =D6ffnen vo=
n Links und Anh=E4ngen.
---------------------------------------------------------------------------=
--------------------

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v4-7-7-cmake-upgrade-3.31.6---4.=
0.3.patch

FAIL: test src uri left files: Patches not removed from tree. Remove them a=
nd amend the submitted mbox (test_metadata.TestMetadata.test_src_uri_left_f=
iles)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_ur=
i_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_igno=
re)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_pr=
esence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_=
presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message=
_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetad=
ata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length=
)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list=
)

SKIP: pretest pylint: No python related patches, skipping test (test_python=
_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPa=
tch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patc=
h.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_pa=
tch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_=
bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test=
_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_py=
lint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.=
TestMbox.test_series_merge_on_head)
SKIP: test summary presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_summary_presence)

---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
bugzilla.yoctoproject.org%2F&data=3D05%7C02%7CMoritz.Haase%40bmw.de%7C023c2=
90690944628ffa908ddb966e317%7Cce849babcc1c465bb62e18f07c9ac198%7C0%7C0%7C63=
8870573745898785%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLj=
AuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sda=
ta=3Dqz2N8QyWfIS0a8X5ak1KE8kalURSJyk8WsYInZwL5HE%3D&reserved=3D0<https://bu=
gzilla.yoctoproject.org/> (use the 'Patchtest' category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fwiki.yoctoproject.org%2Fwiki%2FPatchtest&data=3D05%7C02%7CMoritz.Ha=
ase%40bmw.de%7C023c290690944628ffa908ddb966e317%7Cce849babcc1c465bb62e18f07=
c9ac198%7C0%7C0%7C638870573745938924%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcG=
kiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D=
%3D%7C0%7C%7C%7C&sdata=3DfNaM4baQ7kecaKkde%2B6E%2FNJ8hj1hLGRrOYzLxijxfyU%3D=
&reserved=3D0<https://wiki.yoctoproject.org/wiki/Patchtest>. Thank
you!

--_000_DB3PR09MB62027C26865E45248312D5F6EA40ADB3PR09MB6202eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
this looks like a false-positive to me. I've double checked that no outdate=
d patch files are left. Might be related to the fact that I've renamed some=
 of the patches. I'll file a bug report shortly.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Moritz</div>
<div id=3D"appendonsend"></div>
<br>
<p style=3D"font-family:BMW Group Condensed;font-size:12pt;color:#C00000;ma=
rgin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align=
=3D"Center">
CONFIDENTIAL<br>
</p>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> patchtest@automation.y=
octoproject.org &lt;patchtest@automation.yoctoproject.org&gt;<br>
<b>Gesendet:</b> Mittwoch, 2. Juli 2025 14:49<br>
<b>An:</b> Haase Moritz, JD-62 &lt;Moritz.Haase@bmw.de&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Betreff:</b> Patchtest results for [PATCH v4 7/7] cmake: upgrade 3.31.6 =
-&gt; 4.0.3</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Sent from outside the BMW organization&nbsp; - be =
CAUTIOUS, particularly with links and attachments.<br>
Absender au=DFerhalb der BMW Organisation - Bitte VORSICHT beim =D6ffnen vo=
n Links und Anh=E4ngen.<br>
---------------------------------------------------------------------------=
--------------------<br>
<br>
Thank you for your submission. Patchtest identified one<br>
or more issues with the patch. Please see the log below for<br>
more information:<br>
<br>
---<br>
Testing patch /home/patchtest/share/mboxes/v4-7-7-cmake-upgrade-3.31.6---4.=
0.3.patch<br>
<br>
FAIL: test src uri left files: Patches not removed from tree. Remove them a=
nd amend the submitted mbox (test_metadata.TestMetadata.test_src_uri_left_f=
iles)<br>
<br>
PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_ur=
i_left_files)<br>
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_igno=
re)<br>
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_pr=
esence)<br>
PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_=
presence)<br>
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message=
_user_tags)<br>
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetad=
ata.test_lic_files_chksum_modified_not_mentioned)<br>
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length=
)<br>
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)<br>
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)<br>
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)<br>
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list=
)<br>
<br>
SKIP: pretest pylint: No python related patches, skipping test (test_python=
_pylint.PyLint.pretest_pylint)<br>
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPa=
tch.test_cve_tag_format)<br>
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patc=
h.TestPatch.test_signed_off_by_presence)<br>
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_pa=
tch.TestPatch.test_upstream_status_presence_format)<br>
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_=
bugzilla_entry_format)<br>
SKIP: test lic files chksum presence: No added recipes, skipping test (test=
_metadata.TestMetadata.test_lic_files_chksum_presence)<br>
SKIP: test license presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_license_presence)<br>
SKIP: test pylint: No python related patches, skipping test (test_python_py=
lint.PyLint.test_pylint)<br>
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.=
TestMbox.test_series_merge_on_head)<br>
SKIP: test summary presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_summary_presence)<br>
<br>
---<br>
<br>
Please address the issues identified and<br>
submit a new revision of the patch, or alternatively, reply to this<br>
email with an explanation of why the patch should be accepted. If you<br>
believe these results are due to an error in patchtest, please submit a<br>
bug at <a href=3D"https://bugzilla.yoctoproject.org/">https://eur01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzilla.yoctoproject.org%2F=
&amp;data=3D05%7C02%7CMoritz.Haase%40bmw.de%7C023c290690944628ffa908ddb966e=
317%7Cce849babcc1c465bb62e18f07c9ac198%7C0%7C0%7C638870573745898785%7CUnkno=
wn%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMi=
IsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dqz2N8QyWfIS0a8X=
5ak1KE8kalURSJyk8WsYInZwL5HE%3D&amp;reserved=3D0</a>
 (use the 'Patchtest' category<br>
under 'Yocto Project Subprojects'). For more information on specific<br>
failures, see: <a href=3D"https://wiki.yoctoproject.org/wiki/Patchtest">htt=
ps://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwiki.yocto=
project.org%2Fwiki%2FPatchtest&amp;data=3D05%7C02%7CMoritz.Haase%40bmw.de%7=
C023c290690944628ffa908ddb966e317%7Cce849babcc1c465bb62e18f07c9ac198%7C0%7C=
0%7C638870573745938924%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYi=
OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%=
7C&amp;sdata=3DfNaM4baQ7kecaKkde%2B6E%2FNJ8hj1hLGRrOYzLxijxfyU%3D&amp;reser=
ved=3D0</a>.
 Thank<br>
you!<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB3PR09MB62027C26865E45248312D5F6EA40ADB3PR09MB6202eurp_--

