Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C1ACD3439
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 18:18:36 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25550.1778091515166290495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 11:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=aNiZPoHa;
 spf=pass (domain: est.tech, ip: 40.107.162.59, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=essB/2SxyLHrvu3WU0rCfeEpKsYr8nHkurq6hfujnTbtA2L8GIrBhrxV06perUQqzD+ctlHbw9iwsZyJI/NA2TX67hcpLJfYxrSZUPPnVHXDTX8f2inwOBNkbhhtawEXsa44ijLJURGgRqqiJrve+wJ5Pq14Vz8gSg2rBbUoEGWDlmNfV2rcB/x7r5+w11DTyjA2SITe6Zwn8hreytXV6kf0wiC9vg9qIgHXAtFSAmZI9uWENOxaP3l4SQlY2qKqhvND9QxrJW+z35jUksqUdoyogJs5NeNe5MfVx+f/xDqhv/KmvfMZkVqcSb/2h+1PtwAJHoorLL3NFLJA75awFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lu0ElmGSVEnEqMQ4urlADwhXp9nWc+/yrCCuI5wCt4U=;
 b=mwyZimLerAJGJ9Z4FaXJ3VheqDqeCpBjV6TMzxmAJiEmlXsSbkcMkgF85Hhmt9ZEbBInGbaMUeE2O6llj3J5caddPATzjYW29qQffpFGTfbyD15lPTGLkyMvviAvd2xHFBee2oPltqTOsjR7w0hxjte2rAI6787i01tu5AWJvUT3OFhUv4OzoVHY3t+0i5jzDyzUAhUUu+JyaHSaMemJCZ/f1tkX05J93uXHCkXLkxj4XmnIVBHHnhnr65RXqPnWKmibaY7GBi3MisCm6BVPVpjmotUU73+9K3NQrb3ydhAeyEASqEOhBl1lvtupWoa4T1qIfJPyW4voTZJtI+Cwjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu0ElmGSVEnEqMQ4urlADwhXp9nWc+/yrCCuI5wCt4U=;
 b=aNiZPoHa79cX1Bk8eVvtPNc1dcu0R/6GEQQfLTtLEI8CQwnppUh6SujBpV4EUt0QlZpI2d7WFmPrhfECUsK88BGmZBMnh0CcbYhNfOeJdEBQPoMQ9cOZMIfcx8Iw3B5Tfq4E5UD5+m45gK5L/YsNDxwvA2aHQ+HU+/o9jqIsoqAjzr9/xdiBaTdR9bbB+Xrha2IPbDgsBTpmW0Ib5h1lNT88d37e2XOhw9IM9o8j7y8p93XawrzNsTfJdv/w3N9xynt2EgH1YmXuBnosI63v8wPf8MhA4N3T//8/KHlCDQ8I22tGyJ3FsHJyqvkBEJ+RuNClwIOSwTPjPwnVvzhHFg==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by VI0P189MB3191.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Wed, 6 May
 2026 18:18:30 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 18:18:30 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v6] go: add ptest support
Thread-Topic: [OE-core][PATCH v6] go: add ptest support
Thread-Index: AQHcy/nSpMxhNcl6jkyYmwbyP/rRUrYBW56AgAAVaVE=
Date: Wed, 6 May 2026 18:18:30 +0000
Message-ID: 
 <GV2P189MB300534D46370B786F7373CE6FE3F2@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
 <20260414103110.22263-1-pratik.farkase@est.tech>
 <95769D13-5780-4AD9-935E-036397DBED3E@arm.com>
In-Reply-To: <95769D13-5780-4AD9-935E-036397DBED3E@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|VI0P189MB3191:EE_
x-ms-office365-filtering-correlation-id: 1c97126a-f637-4c5b-e9ff-08deab9be01f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|3023799003|38070700021;
x-microsoft-antispam-message-info: 
 ToS9DSVJogARRwzRQ+FW9Jj5ze8KbM2w9L735f6snWn3GEL7mhB8JZ+t0wd/fBbqH1DCA1fGU6zsVzPDl43jXgsUzD8IKdAhJRRlQQ+9WLngwLgOf8NtoiKTDzunVsUC7dLfjJrZTeY4VUnM20iRWVO8Sj2KxCGd67xfvRX4fq8+OhCvqZdreHJygpXDoULC53r6ufpkouwDv0aq8PlTwAyPJkxFcJT1rM/QYl4A+XVxMVBkOrc2J0yhZz0IP21s7i7kJCAwuWZ5qRBjhAnTG3ToQ9UJ2p7696Sv15XIPRNEAGez02HmbSeDkV6LVwpkZWjZt6OZrNFoo8mthofulmX9BMOg+MzR4yync3qr5SraumsmLrCJB1EqpfNSqw9ohQJKjD320kA+/Ch7qwKLDeZ6Qj6/ce5enB4b4yT4hmqMBjLE/dyAgcCTew+iWqxhOOTaGKq21Cv2/pq/lWlu25I9aCFyoWKuZDWzVgOnN0DH5pjxOZ7lvICsfbst5tK0kyqiNblG6wQLnfLukQIjgtT2Y+vn9sA5rhk6FTiR9BxEOYTSUj3p67QpFdZDpca+/fx/cgSuFKspdJP3aPrpkjc4a/nrmFgpQ+pNqF3YFJ+0QqEvpswWT++D3WztSIXbnIUTIph6B8cNRvHKDjsiAQvYlqjYuR+JhdgUnYpsIYXSZAkgVoLh/V0lqE7IkVyajzSJrPxQbC2TugAAo554R0KwjIbYtm0wm4jxv6CyxdeCDvRC30rH9+ZOB9ysuTkR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(3023799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?AIi0AUGpw6hCCEw8AXjuYq7Y96XnNYK+z/DgABXdNvLm5hMAvT+d4xMu?=
 =?Windows-1252?Q?Y3iH8ZgrbLF+mF58AYSocuuVh2az3E1TNm03FcXdNC03/D0vCDw1pVww?=
 =?Windows-1252?Q?MLoaoW7sfy+qm7HR79JFuc6RYP0sGrESoqKBXCcSCIC4+nwP9IJBYim4?=
 =?Windows-1252?Q?V4iCLwHWvTWxdjt10eRDP01UTUdSSkEj8tuQ28rTn/11KAqxy59au4KS?=
 =?Windows-1252?Q?0qS2oXzS/zbuCOxXMPSVCdB6FncveZ6y41Mh5BigxJTZHvYZMTPZkTTJ?=
 =?Windows-1252?Q?gLVkOOnOjQddvYFp3Y+wp0GZ3uxxn0+DIINj3UnljFUS1RvwGoKZzSHg?=
 =?Windows-1252?Q?S9hBFlBa4KkAp3mj99cAq2VEGhSZv/j0w6fPeyol0svWTbYs+u0rKQ27?=
 =?Windows-1252?Q?uf6NTyzG1aWHoVU14AL6eu9y56XMiw7xpkFEXtdPj4kMhS9IFLcWbTlj?=
 =?Windows-1252?Q?rM2ekmPK/mzWsxl2y41wMTog6aayLJPwJulBQ1VnInuN6M2iK4rS1oMW?=
 =?Windows-1252?Q?senafkcit/23nzzdOJaVS/w/71i+CAiHRrs1e/2Qm3od3dQE19iFJwid?=
 =?Windows-1252?Q?MIVeoyuR2xxc9ZOFrgM/s3kC14dc0C1P01s+ECY54yxmyUg34b4WebqT?=
 =?Windows-1252?Q?JAgUprWQ+mnn7vhRcWtMuO67iLATpuL8jkKFDozQ0zWTtM6YSGUujBON?=
 =?Windows-1252?Q?XJE1M/+IgJuSoC/2XftCda/dtMm0P3KvAkDDHYkvTcdNiceRLeUZv619?=
 =?Windows-1252?Q?vRsQtm/i/UNBGMybCzJ+ZrXYOQ4KsSjxCEPXO/fxk6814K1SVdFoU73x?=
 =?Windows-1252?Q?7deHBslGxtu+ByFJB2HxX+fRTk46KQD9XGFPcY00MorY898PhYpzxLUv?=
 =?Windows-1252?Q?+U9PZDdKs7AgImvpnU+lj/sLgV87d1ssEG+y5hfOkswL22terSuDFelf?=
 =?Windows-1252?Q?UqaypKbYr5lk93WND8UB3V3PmFu7F7en/zM4EKR8bZxh0zawZCYvVHbg?=
 =?Windows-1252?Q?WNJczVAwFsPGhixBYlsTzUcRFl8r8weRtTViCfzIsjfsN22SRzIwN0xS?=
 =?Windows-1252?Q?fBrAxyNEy+Kfd9T/SrmMEULKyWm5CN0AEPEzlUTFU/MRycMlm6OTdF9F?=
 =?Windows-1252?Q?blsCb57Erl54ykUtrfZC2NZm88k5jJHvkY+MNQ/hrZrv3gDVYjEEfuUF?=
 =?Windows-1252?Q?lM5lE544ZonKR6MGbyHbZugRGoNTkFwHhGWuqNQ/wOOw4DGZKLhZPOFM?=
 =?Windows-1252?Q?OTCPXzcaMl/gcTtKMWZtldu+w+aVGDa0kJBG21WpRSayEUKcRlEavIu6?=
 =?Windows-1252?Q?vshDEHWiONhoILN6yv5CAY46KSehjgzPy/lYuOOCpMV9xJbMsbClPvgL?=
 =?Windows-1252?Q?reKZ28I+JHVzb3KlK6HL9So0XU73ZAobR2Jzk9WWMXvQCeKEJZ9k3mOv?=
 =?Windows-1252?Q?jjTcpE37k+h82IVtP5mQCakkLkyimw6w+m0Lv/eH94pj8WY1dz8MQ8g9?=
 =?Windows-1252?Q?A7iWF31lkwLPlKDjJm2h1GJ8YBHF1+NBhwK/vikkxBzZQRM3WeyeCoR1?=
 =?Windows-1252?Q?yIYSH1Chb+qniaKGgosrFhGYKQVkQaMgXkQbBCocgTXdhZ0JGEpgPDu0?=
 =?Windows-1252?Q?SXsaxz1UoV+p3ppqRFqg55scrbRd6UNWivdHiEkVZH12dUZk/424q9dZ?=
 =?Windows-1252?Q?LTYo77nSmViYAnwV1WOcppy3p6K3tMuqCPZsaCijG48Fiv31VB5mjNZj?=
 =?Windows-1252?Q?aJgibk2u5wMvJLLF5420aAddC3qnv57+uuMil8mnqwhRK0h0tn8A9BFY?=
 =?Windows-1252?Q?gU1Jli0uKBmiPG2aCqXpYtBD+7opFOIBKDPKBXPg4qSMOwvXPf/Nv+VO?=
 =?Windows-1252?Q?wqBNkXVcZNA2bw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c97126a-f637-4c5b-e9ff-08deab9be01f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 18:18:30.0725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +FzeMOzNOzP90EDnXhTR2FCj0gI82KGGATC7cA+S2vX/Jtq6ejySU7y7z/6/prANQlp52yMXP+WJjlOhahxQLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 18:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236548

Hi Ross,

  Thanks for the review. I've sent a follow-up patch that addresses both
  points:

  1. Added comments documenting why each of these test is skipped:
     - debug/dwarf, debug/elf, debug/pe, debug/plan9obj, internal/xcoff:
       require binary testdata files excluded to avoid QA errors
     - go/types: extremely slow, exceeds ptest timeout
     - net/http: requires network access unavailable in qemu
     - runtime: requires cgo rebuild and race detector setup
     - testing: circular dependency when testing the test framework
     - time: requires writable GOROOT for timezone data

  2. Removed bash from RDEPENDS =97 the script already uses #!/bin/sh and
     only POSIX constructs. The bash dependency was unnecessary.

  The follow-up patch also fixes several other issues found during review
  (broken sub-package skip regex, suppressed test output, missing go in
  RDEPENDS, GOROOT mutation at runtime).

Here is the link to it : https://lists.openembedded.org/g/openembedded-core=
/message/236540

Best Regards,
Pratik

________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Wednesday, May 6, 2026 7:00 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v6] go: add ptest support

Hi Pratik,

On 14 Apr 2026, at 11:31, Pratik Farkase via lists.openembedded.org <pratik=
.farkase=3Dest.tech@lists.openembedded.org> wrote:
> +SKIP_PKGS=3D"debug/dwarf debug/elf debug/pe debug/plan9obj go/types inte=
rnal/xcoff net/http runtime testing time"

Can you add a comment explaining why these are being skipped? Without this =
in the future we have no idea if they=92re tests that fail randomly, tests =
that fail under load, tests that used to fail but no longer do, or tests th=
at need more integration to work in ptest.

> +RDEPENDS:${PN}-ptest +=3D "bash tzdata git packagegroup-core-buildessent=
ial"

Do you think it would be feasible to un-bashify the code in Go so that it u=
ses POSIX sh instead of bash?

Ross


