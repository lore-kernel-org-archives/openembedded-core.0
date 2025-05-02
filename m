Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C954C3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 22:10:27 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web10.687.1746223818677533201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 15:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=lJVuTFCe;
 spf=pass (domain: axis.com, ip: 40.107.105.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkqGXsbIXb9keZciWrQNN4IqozsUQIQRT+GqmcOtMAAvSjD/IXlYH5/eG+T3kDSnH37/9WqYEAY6QAFuFpR7iJ8f3NPy+9n4INbpCXQrHSMEbwxbI4mXm+5+s8uHYu9Jlwuxstf0q26ZyVF/N+OMOzFqhEJ+sfONQH4RD1UgD5A+vW0uRAIGfieIM939nCB6SoMBaFBGXjmWyW5BWUOiVYX5Dimz3QMdyMZWsqUDdQxjMgSg1UvNw/FeI/d7x2h3+3UfhpmKg90qiC/BwZvw+JXbCqRDV+fAnPpJeynGN8okFLiUhRK3J+RFWwMEJ8x3jHu4Kx2UqlEgoRmtt8/egg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2x4vAQvQTK6W867ZODSrNtsfZrXR8284KlMa9uqVyE=;
 b=AA9pgQo1QuXa3zhUXVhegWbzSpAGoD7WC1LoamRWyZ1A3OPxpN1TI81gsfYfi/3sI2v7zSddUw47nEr+MAu+cKsXoev8yAiH16+x5uVcHrevLcvplb1Axi1XAAh44DhsQ6sK1c+hYdMV8undkBkDZViiG5QkEHVo4fapAv+ekBF14ghNUfhOAf+Y1JCRIv/hvhvtHGzXi4ZuWB7bPATNFx8xBx6mQk6US80OLfb085Ed+EO8df+xSs2ZqQxhVuSM3hqy/PG0RO98JjCDiqjy28aMH6s6IDJ2EQpZVptRDaM3CnYRLUeZa0gI0LBnDqFshh2X0A0AgCRrA4IAibU/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2x4vAQvQTK6W867ZODSrNtsfZrXR8284KlMa9uqVyE=;
 b=lJVuTFCe4NNsnMgYHFsTwHrB+1thQ1ozCjBC/vqIbdPG1t/e4MEadmIBqh1HvrRg8x1LpTG7IZuT26ZQYNR2/2apDCjVwSJaAFH9S3O/Yv/77eNzG5vczMPQuDL1FOxMACqIUD3AwRVc1DJuUn7rAxNeH1OYSEJW9kM7mnEqxso=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by PAVPR02MB9181.eurprd02.prod.outlook.com (2603:10a6:102:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 22:10:15 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb%5]) with mapi id 15.20.8722.011; Fri, 2 May 2025
 22:10:15 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "rs@ti.com" <rs@ti.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>, "alex@linutronix.de" <alex@linutronix.de>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"kexin.hao@windriver.com" <kexin.hao@windriver.com>, "afd@ti.com"
	<afd@ti.com>, "detheridge@ti.com" <detheridge@ti.com>, "denis@denix.org"
	<denis@denix.org>, "reatmon@ti.com" <reatmon@ti.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "vijayp@ti.com" <vijayp@ti.com>
Subject: RE: [oe-core][PATCH 3/3] xserver-nodm-init: convert to
 virtual-emptty-conf
Thread-Topic: [oe-core][PATCH 3/3] xserver-nodm-init: convert to
 virtual-emptty-conf
Thread-Index: AQHbu6FTDpaurFtGOEiUbBo652tnCLO/5i+g
Date: Fri, 2 May 2025 22:10:15 +0000
Message-ID: 
 <AS8PR02MB102011E1478A4001F07D73517EF8D2@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20250502202840.3148565-2-rs@ti.com>
 <20250502202840.3148565-5-rs@ti.com>
In-Reply-To: <20250502202840.3148565-5-rs@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|PAVPR02MB9181:EE_
x-ms-office365-filtering-correlation-id: 18417f2b-472a-42bc-35eb-08dd89c61dd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?3gmaqT7hbD229tiJJ9raXal9V4NXeGvSRme0UCik1W9/eNcJ2PhZ/cbvHv2t?=
 =?us-ascii?Q?PvpgUDlmzZsmh7PnpIz72coBJXfzM7VdtYSn34aRdUyysBSIffruhJ3M3HXD?=
 =?us-ascii?Q?U4b5aK7+S4QVuk7HKOAvBJQce/QIAxoO+AM+Jqqkq0OJTTsO8kc5IahikV1Y?=
 =?us-ascii?Q?+ZHGHkFttB3FxWK+CB1q37ymu7oF1ZQDWGT7UlpUq5+jk88AksbNjh3fQ7Me?=
 =?us-ascii?Q?VMYWvFSiIW/qRwdJlDV73C+023/bR9OAPoUhxOQEpC4zamdhJX6ct5ZC2DYh?=
 =?us-ascii?Q?VJkw2fRuwfb1kX9AkBreW+dkGIiOzj9gXVOecReAZz0d+jgEzjOUH/6CX0dd?=
 =?us-ascii?Q?EZ6vaxGZk7g6+VMp/O/3G07gePdQaQ2GVyHg4c12sgBSv6Ur71UrRDR6TO8S?=
 =?us-ascii?Q?Qnyghq36y3rDXKlSNmlZe/ZtWzl15XxRiDmTJ/o5pzdS1ukOFLw11Njtnqyf?=
 =?us-ascii?Q?MkRw7LAfgLaSAuIu9wU2IFmDtCF1lATky/5KNL0m4EsGoftWjggX60F1u0ag?=
 =?us-ascii?Q?YmFhFH2qQQIwonn8putdjG4b5InZgxvLgYJ10pP4Bu7dG7LhsYlFcjBu0iwl?=
 =?us-ascii?Q?3vnWWYKO3/6YkZ0yMjDlyHxr0DkYEGOmZlLAJICjfoYZOr4rbHIWPqROnvqk?=
 =?us-ascii?Q?knNXkdZuh6sfJNxVM57PQapTCVau5L0kBHfBvwkcVTuxNjvfa2Iu0GDjxTVP?=
 =?us-ascii?Q?dCJehqmeBJ5GbYbs55+MfLkIx5JSrC9lZlV/UI88HfKgFfPR6WCI/DTh0rpF?=
 =?us-ascii?Q?fSMP//zamZPQ8lRfxRc51S9U3KNkWYPiLj/53W42bxt9GF8ZbMlUscPF7Zak?=
 =?us-ascii?Q?J1gjBD2ffCdVJPtZfrT5ai3EmlzuyEyEIDoE4+jdHc/5IN3Av+Ko/j1kGxmX?=
 =?us-ascii?Q?T+T4RXbQPpFHL1yhfuHvjY5mEnP3oAEfp7UBKW8YK1iuRK7tilBUlm+KT5BF?=
 =?us-ascii?Q?tTgy+2RqgnT8+ZKURQtKSmbA7gA4hKRerChm/weD2vZgrkaCtVGYhXlLBOmk?=
 =?us-ascii?Q?NFbADNa0kCcjOscfVdx6u0IOd1qt0Nd9bEVgMsYkMGD4BloOonHD+B4ZoK68?=
 =?us-ascii?Q?YAWWDS1a75gu6wgHQe6P2j05WmEIK5SZD12bh5fW3r6aS89nY839xHDkX7uX?=
 =?us-ascii?Q?Eai2UPrTcYaCEuTOwI3rWFPm6DWMZqn0QgJoOgM9LaoUjTxFh5ANNVY6LDvb?=
 =?us-ascii?Q?8FiQSJ1SSH7T9ev740icwlCCYUTs1Fr/5Dl4AiQJROSv1sndu5HCRRHziNyl?=
 =?us-ascii?Q?42NchREuAdZWLASnJrJZrXH1ZvxohbP+n4RZ3Be+IykSV398/8l3GrO2ZuiI?=
 =?us-ascii?Q?ksHxT+hA/vGeDlcK6780aM8wj4vGhpkUJ6DiSkeABPj4IDwo0IVdUZkfYBqm?=
 =?us-ascii?Q?7qj51LWI6ljoHWf8l8e7Te53YYUxhYvBxtFISPy2yNaO6jSsozK1ceRAiUwj?=
 =?us-ascii?Q?q9EWwfq9xHyG+9ZuhQQJbNeRIHJJ81/Ald11pT4AfDkTsQ1/5HLGS/Oci+aW?=
 =?us-ascii?Q?sHIllfxIjb7Xrt4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QzSvC3z9aM9vz1mn1TGjx67RsO0JJ2DQeFauXgJoflizcnELMtPJ+oI04r2o?=
 =?us-ascii?Q?DD9LN7BFVIsUPRWtmzQigfPSW7P/iBtUluGhT1A3aXa6jFjImevqwhNNu4vE?=
 =?us-ascii?Q?3qtg5qYzvUDTufQekbFBC6T+1W8OaYLl1TZwx3qbv1NWuFywkvSiur/H2X+U?=
 =?us-ascii?Q?8Hb3mV/VVh9Dbz6Gn9MNGcF7oHSN6u2vZEX8A7V316unUm53UFa1JcRa7fQE?=
 =?us-ascii?Q?nd2sMyhMjyWLeK62pprDwJJgjuvNayiCIo8LAt8IOyWL5UohR9qeqd+1nOKZ?=
 =?us-ascii?Q?RqnNNyWtfDqeUdlCwdAhHiO2tWEyNN28hHZ1ih9s+/MfX3BwBm+kzidbGSXH?=
 =?us-ascii?Q?/nI1Bk7i12rpY1RZQi/Wui5IV6cndJUxPBkMwnzimxvap0Rh2hz/wdkcE9Lt?=
 =?us-ascii?Q?R0u9jYHgluSTTIEKRDLNqMCLPTnkTgfPGFHBG7tMvRm58tVN02uWHrKIP/YS?=
 =?us-ascii?Q?rb483YaKDARcCyJXENk9aQ145xEFzJayg5ZPqAWlpeD3icZ+eYY8bDXnAWU2?=
 =?us-ascii?Q?YIP0inZPWZFYn3D1TpG47VgnRUQnBhLGHBzj3D66oSOIjAhKtTQKKUvQzq+d?=
 =?us-ascii?Q?wic52FjMIUhXSUTiv7i9z0uYkDE7UNp0NHoycShch0XXeRcN3BTZtIG3Ayuq?=
 =?us-ascii?Q?TEMS+V1gaQ05i+A36eg+GJMY0O4e3JbV48YWnuwYuvgD0qVGXYmHSj9nlphE?=
 =?us-ascii?Q?S0t6TbZ4yqAt8YBsnVdpGAham/g5h396J1UzbtpPmGP41sZ8BzTFgQTY2mqo?=
 =?us-ascii?Q?6BttS8y0vfvVxX+V3hZxF0tUVk5vKeRQ4CuNMUcya/+cltyEi/jUvv0IfuL4?=
 =?us-ascii?Q?bLoJv1hDi/91q+RHLdCW78yFBiqHscjdRI5cOvRhhU2txgdvP6oCf7nCPqvQ?=
 =?us-ascii?Q?/MaRcTVTgnuuq2oMhKz1j4EXmgEt6hkfKFsn5MZ6418GYOCZ+89yFFYA2qzw?=
 =?us-ascii?Q?6Zbf/glLIZgo162df8yhO0ENmdNmb9G6oqg6sONUzH7EXNrYZh4qhcHzMWvP?=
 =?us-ascii?Q?DAvXnp7HsUoCZyhpJg3dijQ6iS3R9GWokBBoWHcGVlWSE9gNxN1cZxzElrJQ?=
 =?us-ascii?Q?DrDjUdqs80qfKtINqqqurPmdVNKwlYUKMRnQZQjUf98AyVrwcJsp7ObcM6Ij?=
 =?us-ascii?Q?HR0JwFnvdwxB4UU+EQUTlhunTcGfDL+y/TPiks7Vcpgm75gcE6lbN7tVE/dm?=
 =?us-ascii?Q?1Iu+aKHUVOc7bfcokuDGlLGnA/QObKyOIuJBpFCHOXeTEGNPNYzcfotfTIv7?=
 =?us-ascii?Q?cSK0HWJDg0xiA7SmdQFM+ylDOjo2VJGPaDLdndgPz/OHlyD9typbsP+nAvvf?=
 =?us-ascii?Q?QPSX4PGeH7pc8jdHtFusMh2ZKs1ykqzBULh+yQVmncHaHpGvGZsYpjQ0ERta?=
 =?us-ascii?Q?LGabrmk/B5DDIchysI6OEXpuK11z+Q2lGpuOK3vWReXCPgCs7pK1TGurxz0o?=
 =?us-ascii?Q?nZpMfW1wWLbXq/FxxLar3J280WbwPyHcyhIwTZNyW+dRB5YOPK3zssupz6hY?=
 =?us-ascii?Q?ih7DPIdRJT8S7PRdG7LOPUMMS0rSduMPaHFqRdVKpESwCBrcZUXnDC0MvOKO?=
 =?us-ascii?Q?ynpS5iYYijptN5xSpcw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18417f2b-472a-42bc-35eb-08dd89c61dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2025 22:10:15.3307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prifhtxSvxIz51YhkKu9Ols8JdX9KEdOZ4AhIyORHPjngnJmb3Di6SM6jDbNcp3u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 22:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215928

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Randolph Sapp via lists.openembedded.org
> Sent: den 2 maj 2025 22:29
> To: richard.purdie@linuxfoundation.org; ross.burton@arm.com; alex@linutro=
nix.de; otavio@ossystems.com.br; kexin.hao@windriver.com; afd@ti.com; dethe=
ridge@ti.com; denis@denix.org; reatmon@ti.com
> Cc: openembedded-core@lists.openembedded.org; vijayp@ti.com
> Subject: [oe-core][PATCH 3/3] xserver-nodm-init: convert to virtual-emptt=
y-conf
>=20
> From: Randolph Sapp <rs@ti.com>
>=20
> Convert this script package into a simple config for emptty. This is
> capabile of using either the root user or the underprivileged xuser

"capabile" -> "capable"

> account based on the same ROOTLESS_X variable. The xuser will leverage
> the nopasswdlogin session provided by emptty for automatic logins.
> Runtime provide virtual-emptty-conf as we need to set parameters for the
> default session.
>=20
> This also gets rid of the xuser security/capability override since
> emptty sets up required components as root before decending into the
> specified user. This does not currently handle loading of autostart
> applications in "/etc/xdg/autostart".
>=20
> License-Update: GPLv2 scripts were replaced with MIT based config files
> Signed-off-by: Randolph Sapp <rs@ti.com>

//Peter


