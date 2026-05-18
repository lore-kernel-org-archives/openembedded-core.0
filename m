Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF40CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 12:34:30 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7303.1779107667779083232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 05:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=yVr+2soR;
 spf=pass (domain: est.tech, ip: 52.101.70.15, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxFow+R5UQ/+8DxClSP+oipusaKTUDFnxEHJEyT0iZSVbXfn/9QbBfm9vBUomOrfEfgpyeBCkti4szUm9IE8uMEGhMiHy/3381g/jlEgFhmfvdVBZUO+dG0PQ/x3By6Ivq9CzDohoFDB6hGu5GRz5gXlFSa4ViAU+fQ0V0Ksf51SS9FVPAuSuhJcPj0Fryo7ch9cF4FysU7DZI1zR6+/wgUzr/yHKnIpIUdFhVZSFqS8SNPpf5+kAs/+xy7lg+THLF0IifcLKs/3yKbTG0pLxIUufFsj0A7VtzsHb/ZvkuEpROArSZ0MrNvLy9aablM2YLVMFKQzTKej9m9LAIw1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zJTZYohwKqxFGrmTSMMC95kIh9xM9Y1ipBGErYJiaM=;
 b=qBqNiThDeWmuMNupp2z7FZ29ibfNpuhTLHUnxA/LG97l6+oMDG1cGW/bmdL9x7MmAdeoHhZtEc58Q+90QDqEOXjhgqyz21BV45+KfWhPi0hGk7KO+O/BZDWkTaisAhRngm6AK7QzYNuRFihBfKa2xSslg0A7kLkL9uWWVOXLoZOQa0dWrgqGtIQO8OntV42JAADDB8ppS9L52eF32llbTXfrKFCStLQyyrj2yYtHoyABWrQXCIyaj1qrqcCqStD6v7e/l7ygFv0AHzDg3EKKINZm0LMto2pg/uR7JIarNGwPbCI577LqJPDO/Mqb1VWw9B+/uIATYTgYF92V6c/ZLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zJTZYohwKqxFGrmTSMMC95kIh9xM9Y1ipBGErYJiaM=;
 b=yVr+2soRl91yIH2cgYONakiKJ+6c526Hf4qMQce7bJGBg9P8BXrDha+cK0GpDTLXT6PDB+loOYlkwfNT9at/+rsdCjvOnYdifRAydBO60f8abduVMwWQu6KHlCdWY55TtPETW/Uyv6NDMda0gLMol7p7jwN4r+ooEULc8Ooqpy7lngc3AuykL4FWe6BUR+Z7paAxoI7+GEys1yA+aiFIIn1Q6X6nfJPJc919r1pU9s36eTo04XKT/8VO+DdN4cj+jutcLFTx30wKKuh5SOzZXu+QAVZGij4AKzLRKUCAuPU4B7bYghrtunsV9qYi7njc2k3UnnjbECvHd0RUV7GWtA==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AS1P189MB1912.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 12:34:23 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 12:34:23 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libxslt: add ptest support
Thread-Topic: [OE-core][PATCH v1] libxslt: add ptest support
Thread-Index: AQHc3TmohR+C1s9W9EacoxBIguT8irYTxdmAgAADAguAAABvAIAAATRU
Date: Mon, 18 May 2026 12:34:23 +0000
Message-ID: 
 <GV2P189MB3005032F03DC1B185C63E7DDFE032@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260506092057.27057-1-pratik.farkase@est.tech>
 <901B1CC5-1D3C-49F3-9BD3-BA18871B4D02@arm.com>
 <GV2P189MB3005CF211986FF7B7DFCF15FFE032@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <73EC01E4-0507-4D3B-8517-6B2938F58C71@arm.com>
In-Reply-To: <73EC01E4-0507-4D3B-8517-6B2938F58C71@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|AS1P189MB1912:EE_
x-ms-office365-filtering-correlation-id: c743d8ed-8a52-474d-c309-08deb4d9caa3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|3023799003|11063799003|4143699003|38070700021;
x-microsoft-antispam-message-info: 
 gy7kqgRj+el+aaNW3WAX9yHVUGnbuTorwXUvwLj9fKjyU8/ZlBVnaEIbJNHFtFs97uRsG0XySvZJDLoh592w6S/A+JIwBbQ7booKLGqKqjsLt6TsVcTi1D73KvbiYAATx3C7B9ZozODZP/ac16y/XbKP50Tv0yMZPl31Ef0yLVSwoUnuVSYORXFTzOVV6WA4qsd2puhG9KB8cxGBCCoL6OZhy43EQQZ4Zlz93c+eK4JduUqgA1GeW0lVM2gcHv/tu+wUQXGtsP9HmEMdLYhZ0CmdKOgBTEX89xydJOuCt+crgfpEGN+eOYM4R832Dup/+5BONl90tlLIEaRSWMk76UQDkSfE6gF45kk5DRS2K0oLB5lTDwtJUEf5xIFlOL0Sy/Hev7uHM3Bf7VK3NkGLt1+EHnmRBvuYxEsQHW1mHuu3yUQWi/zHQv1yvs+WbcOnqO4pvV0xd8fc+p9IlfTgnzHAhpI+K5BsuPdbDmIqLFYToFmgO9ZDaLfcFXUaBypKw5PV+ZsgEf0x3sF80CIBhvYNrZMO3tfM+Od48Q3VpC8xHWviOiQOLcpT+ZitlLZdmc5eFTAhCqd2SuRORn8H0UDNDZQBx8+rlLmY8xh+fcomM4OAS/eJelemNx5vsl2wPJXFliONol1N1jIC3+cwTKRsTGw7sqEQeu1kWv2Rjh/zpsYBM4CRtiGszsrjaXJ4VsremifCh09C6ZU57cUJiu74aYdhXhdnFGqtuuL3bDt73gih3z4rG5zvdVqKFbPU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(3023799003)(11063799003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?t4GdvC+nR6dwEtBFIBjdc/AwgfDDOZR+gzOeWHsgw+y0lUd7yLws+c68?=
 =?Windows-1252?Q?GX9K1iu84yH7jfxMO+xu/iWJc8vI7T2140DAUEaUlOY6zdAG4yN1CIO6?=
 =?Windows-1252?Q?470uZMLAOBpwoLbFu5yg8V0DoHBwtH2JGQofbvCRikc7IaBbBikeREWH?=
 =?Windows-1252?Q?e+8Ed0fWJA9L5+IiU/k54/3qYbT1NLzOb+Il0o7mY2UeUfEgRHuw9oKq?=
 =?Windows-1252?Q?hGPyW1q0l5vhQN2OtNARl/H1qnTxwu8oCcQukwQyaE9UukupxxQuwR07?=
 =?Windows-1252?Q?UB541tStf9DBkd1W3kFJZ8qpTj8kNfq4FT6C9njuRYT/THPl+x+ArALn?=
 =?Windows-1252?Q?pKCV2SUz2ESGgJN8bms8bee6WS79mMpyikFIf8tcqyfbjBrvtRtWhtpi?=
 =?Windows-1252?Q?E6ev8h6f2oEPGqi+Pgejdv9UWp0lWENsb3m8gi4lIMlitt9EgK0IIlRI?=
 =?Windows-1252?Q?GAdqNDmN3kFT6TsiV81QbXV8EfOGF+FECOsLs+Gx3Ckj50e3dCN+t1pQ?=
 =?Windows-1252?Q?07k0hugAoPYZFJX96tCmDn0G89VCFLP8qNKz7ZOkgBWThuiuezMOhsw6?=
 =?Windows-1252?Q?wxe3isFkExUX6CV/sUSxcmVaBMShe3uf3wAr3W1Z4hb7bjtLJOwbQavp?=
 =?Windows-1252?Q?6Ziva0uqeu1n5NjpewgaCwDXxLgM4QnCMO42AXUtNGCA03M/IcXqRAqN?=
 =?Windows-1252?Q?09c1320KYSSftPZJPE1kK0UjyTyGT4KgHpBfsG4EAaEc9l4PcmOBak/B?=
 =?Windows-1252?Q?wQMjItXZe3zfe4m03v+HJkUIsSlhvoVSMa7jSt7MAzpO6K+i/ZW90Hbl?=
 =?Windows-1252?Q?GZPEmKjQ/HHizSdz2dVDe3Url2HgbFpBQWAUzWYeOkPhI1b+jV7ZJHtA?=
 =?Windows-1252?Q?Yj5HfRQ5LfrFjyvbJuT2QSZ8L95H4/uqvRyc09/FkV0lyeDf7JTo/JNR?=
 =?Windows-1252?Q?BzqIGImcS5rljXq4ChHp/mC4VVuEUxG8GMq1AtWRQvF2RuOknCnHsT4x?=
 =?Windows-1252?Q?moBOwyjTECHzTFHVq6+TROsOUxEQQvo59iYne4+JQ/9/Aq5h5GpCC5i6?=
 =?Windows-1252?Q?attYB4j9v5XEEtfGREYV96rJ/9+n+lC98pU4m2WfFYaSkpKphNch3/75?=
 =?Windows-1252?Q?N8OWFjxT1+spgyeCfcOe/FWK9upfBQIaGS4wOOiD2PDncG8QlnxSTRru?=
 =?Windows-1252?Q?BytRv3l4b4BwycWf6nBZhz/GqZGWUMd4bJAsvOGAhVRa77077zbtXHeF?=
 =?Windows-1252?Q?9TPW2dHwnhNegZB23SCwkSCZkqAaCPxnW5uQUyEhWpuTgsNlm3U53142?=
 =?Windows-1252?Q?PGjpVdYTHglnZOjVeO9nAWD66iFtSvfsu07z8a7HZ0j8vDaEEkc4QVCc?=
 =?Windows-1252?Q?dW2iT/reBt0rKKHY5gONkHyu/+l3ExMeQNiU4HDa5fSHZsKJCp/ceLmU?=
 =?Windows-1252?Q?C1bXLllKzBzWhHbMvwkXNW6FbsZEHgSPt9+MW0TIQ8uq0xeS0vr7EzPd?=
 =?Windows-1252?Q?zTXiXq3fWD1pajYhNyw1GSset6MPo4QC2UzFvTVgVQVBwzYsrsM3HBdd?=
 =?Windows-1252?Q?kKgMsT4bcx4+pU7ytyHzL+oFB9GhTCelhMwMEsK0h0Qnsc5MZdKy6j3V?=
 =?Windows-1252?Q?AWYwnFzcIb4r2/h74uK+dCfgpP4JS9/E8nytbPJIWloP08jVaCQ4xEhl?=
 =?Windows-1252?Q?QAyhgJm0RnefvGF0u5JGwZvcBcrLRUUygI2JpaQDwFC/mUfl9/Bj22Cl?=
 =?Windows-1252?Q?O/k2ahgadYlvFrGz7zKv9vhLLNLZZyyeBwnoYCPcxk2E5W3zo0geqaJn?=
 =?Windows-1252?Q?sSNk9Ol2Mc0fmWnOZeDKSKWD/M75zSgz7Rwrapts/lKmI2JHZyAQqsRk?=
 =?Windows-1252?Q?isvyErqfLH5GCw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c743d8ed-8a52-474d-c309-08deb4d9caa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 12:34:23.3246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJEXOAqZDoSzAuo8fWG6ls70jMnAN4JJiwJcsXfL8WhVVKGSED+iGkWoyqvBXFSFKoifmF1UWFYOUToaPwlf8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 12:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237240

I was initially capturing the output thinking I'd need to parse it for per-=
test PASS/FAIL lines, but runtest already reports everything itself so it w=
asn't needed. It was just an oversight/inconsistency no any particular reas=
on.

Best Regards,
Pratik

________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Monday, May 18, 2026 2:28 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] libxslt: add ptest support

On 18 May 2026, at 13:27, Pratik Farkase <pratik.farkase@est.tech> wrote:
> You're right, that's unnecessary. Simplified in v2.

I=92m curious why you thought to do that in this test case and not the othe=
rs?

