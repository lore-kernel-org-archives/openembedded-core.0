Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C93CC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 15:11:15 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web11.13943.1707837067806146001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 07:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=lMWscLQ/;
 spf=pass (domain: axis.com, ip: 40.107.21.50, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqeRC4FG6ZYe5T7tWvM4lKFt4/nVfAQV0upqG74hB5s2cH/SzkfTqmYsyR3Ihoy53cezvJpmQ/Ybt+RBFww1t06H5BCH0hBc3mvrlLv8/Us9047sD/AEdVRM5BZPynlNxccLd0A81KOpj1EDdtVJo9Tu30eA+Yi2afs6HOxS6JcLZLVwKOsoopZ3Zl16ZnLtZ8QhR/K1s2bTXi1Q9pZxuaNP5aQvL8tROZLTNTfppjfi6ElIdcy/bz9ttGSzXwk4bvIXBngd7v7jT/PIPH8MrRba4azZIUKsrVLYPxIeRNMJedq6Qi24QyKyk+ia8Q9DjihmMpYAb4X+2PjTROt7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEtpAk8FGruABaon/MsBERwjSusav6Yhb9JLRma3FP8=;
 b=Tx4A45tgD4E4Jb0gx3F02s9JZnFiiNCSFlNSqb4/6vRnv/7/WzYCsXKoWT6hJ5mo0U+3hnSB5z9KFHCGaWjIGRrgvslyXmxqTY7n7MrEJqhDTyqbdczJa+8487SwpPESSVo82vcDiW1GTOdslt4NamnoCIKd29ouvSwMrWHD6RXpBd4riSCKKgnhHjLBUrJcKfndiqhshOHwEKa8NYHiAaBJoxH2WT50AII5rufqdtvbERMzsiyEgBB3gIVGJLHTMhr59qYqmKhI7PAbQGKhV0fJZRy9KoTGdLYRhZh8pH3tUTiVvJZny0cfVLFDoUYAh5nsiGvEbCyW7ZvKFXdpHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEtpAk8FGruABaon/MsBERwjSusav6Yhb9JLRma3FP8=;
 b=lMWscLQ/c3cDAmxzdY4K2ItKsETCoSp3Alq4AJwDrz3lQXBfM+a7WY2KWBP/GO05vtv7R5mI5q/1yQ+iXugQs0bjDLNveycV9Mb6kmdKyN397XtdOhMD6MOtIOdR0o/KpLc32I0JDuwAxFb+5h0t9M/5eo1ni9JbU6B+vMOgxFM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GVXPR02MB8327.eurprd02.prod.outlook.com (2603:10a6:150:7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 15:11:00 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 15:11:00 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>,
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: VS Code plugin and multiple build directories
Thread-Topic: VS Code plugin and multiple build directories
Thread-Index: AdpejlwvkIVHrQ98QLWkzxa8yv//hQ==
Date: Tue, 13 Feb 2024 15:11:00 +0000
Message-ID: 
 <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GVXPR02MB8327:EE_
x-ms-office365-filtering-correlation-id: 1dda4c0b-0d90-41be-ecab-08dc2ca5fd1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MTnohN1S2pEUR6B8cuKvmBm9I23hG+HRZg+cENUb6UQQ4MfOsbiZQo0wgg4EfVir8I2z2lPh+qSYWisZHV7p+bJbtq7bYVKOUIPxWgPCMu0HsEzSKZsc1X9MKRLtLdBExX+wqWIzl3YKCloZnpwNNmWf/m6C6xPGxW+NFC3irbhf7le+X8WISNRp9y/lI5dIt3/ySMaVOaPBkz6jCSr42KWXy5LkkCdPiONrWLLMdJYhoCNoWHc1vaBgO4dMTYjNBSk86oVvUhdZK7quZ7erCGeOfjiYc/F2n3SVn9ah+5RURV90xI4p6ac9fHQGdTf7tW71ry7DbYYfRYuSHow44ulr3RxO7LTkoFj35ea0zWhrIYD5FgHbWuYvgMcMBzcEBXHrVapNZVCngH+L1GTaFePww+aIPpkMCEiwLL/rq1KjfYT836cMIzskXuX+buhpR106YtAgpmL4y9bew1o7AgXVNy1kHIX0W6CbeXc/VlpkrM1y+H6cAJ+umg25mAG8IMroHCmRa1EQv9EjxDF+Kfjf72zlG1tVMnwjL2iBiwQ+WEfMuWat8KbsGtwRZqUdTQPYz2kfHOjH722K1vjeDDwVsF6mRMpiVrwJGnTmnmmu0t1SlZqOBMULdick6+iK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(478600001)(7696005)(71200400001)(6506007)(83380400001)(9686003)(26005)(2906002)(316002)(66446008)(52536014)(64756008)(76116006)(66946007)(66556008)(66476007)(110136005)(8936002)(8676002)(44832011)(33656002)(4326008)(5660300002)(38070700009)(38100700002)(122000001)(86362001)(41300700001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Z5aI064AWB2W4Ttd0OM+FKPBSWqwigwnuWSo2+nvhmk9pVAJMFJzbdusnA+U?=
 =?us-ascii?Q?+zO3U2jpA9g8hEUB8OVg+eEhKzu9Ms+niwlAcU4WaRXOPQGMsfQ5X64nMcss?=
 =?us-ascii?Q?z70c5V7c1pPw7nMF3r2hDfBdi5BHVnwTILlcmcEhCpVIAgDXUNbQU90Vmo7/?=
 =?us-ascii?Q?Mz29IOMKVJHqLWdTJKQXZiGF7gdZSCjeITty/UTpn+5i2+BZvzn/fe799JaE?=
 =?us-ascii?Q?SDqvUi5akeZZw4Ke1aE6716qysisnOM5ZxxqTqvpAgBno7V9XOLv4TwLImLC?=
 =?us-ascii?Q?lCogVMMBKG778v8irY61L+L8uWyCF4aKDaKtWTzXKuPIUz8ZoEvW3uPWmT9I?=
 =?us-ascii?Q?KpmyIqTrc3FvrRw814yzPjiNhzvaFL8CrjP00TNvkn1dwlH0vn6U35iQHX+T?=
 =?us-ascii?Q?h1yY/a3iXIRYHgoo66MxI3YPmxNnIDQhc0OW+3I93552mtp1l1nz6yQNg8Gz?=
 =?us-ascii?Q?NQ8dUcyLw9BSenwIgFCwSaa2ZlVmB/sVf78sxrqHuMVLqu25jDuFzIoJQgHr?=
 =?us-ascii?Q?qPC09q6s5yGyVApYgQR/5fU/hFwOnI23TAQUYMU0h2uz9jiWJpe8nQzqELS7?=
 =?us-ascii?Q?Z//VAWwUPBxmgFYxgZkveSQaA0p+t+nm0AbSAijS7n7hlO32H1NXLWDkCLlt?=
 =?us-ascii?Q?Asqzi5rJQYquZYDElw0uuR2Pisi7osHs88fdAtkh5I5YDT8GwWEYoSWqQLiD?=
 =?us-ascii?Q?G3UmY1hZlcJJEqTatH8SQ2inbwdTNDbRTQ2PHvpvwP/F4/GfT2THjlKPv0qM?=
 =?us-ascii?Q?WeOfl0NgXJXrJgluhcdUWnY1ixpWdQW5o0Cymii1/T0h/tNuDs8z/9Q8Dts/?=
 =?us-ascii?Q?hrz2XVw8936KeEYmO4MNsxK0Ad9Slj8QXfS8ttOqLYrRpYsfA4jKtrYPaC4Q?=
 =?us-ascii?Q?QsQNJid+QTMdPfOMa7Qx8HCNWBOx4w1nJYaXN1FBwO+AKvL3p5GcjiQ8KC3V?=
 =?us-ascii?Q?jh56SrPJDhKMDu/NBuP4xGY/SkUQGJsLOEFDTG2g+6UNNGP44mw0leuR+/aO?=
 =?us-ascii?Q?dzen8UyD37Vbn7aE7RYqCdn0jb7RPSu9YkXh6FYB6k8PHp7Srzqq79K3SNs/?=
 =?us-ascii?Q?usI1FhuR3C26lUpjujtl63loS4jCJEZ4WdO/OwUzIok31yMDLE1PIoLOXG+H?=
 =?us-ascii?Q?jTYkw50ZcuFl85gE5tbVOiBv1RJtqX6OzsiMQgPb9kX4BAwaKPgqtaAoL0RJ?=
 =?us-ascii?Q?XGjIrV6y+x4z1z9DmCamTeycF1mAhz0rRVgG8D91XDbuyaseJLnVtcrA4i6D?=
 =?us-ascii?Q?5dCbI/+lHHSlHh9xEuQJ+qYqNDn9QZ7O9WQSI9qEs2P0Wxq3lJMXB2ER9F8V?=
 =?us-ascii?Q?mmEUx70H2PCmbSaSbKxcWXJKEeaeHNSOYR7mULIPJsv3Zobv8/W7G85Sp2h7?=
 =?us-ascii?Q?yrKp+kJHNTdEGtdmP957hji3U3h5uDULp2tpKbr9GvWGTKQgPoVB7ChJnSsj?=
 =?us-ascii?Q?EjN5cgORkZr2mIyvwdcTNYdGnTrahkavFO4hDc/F+Tm0L6nmNbiXFholOAGc?=
 =?us-ascii?Q?jyGfwF1nhWwME2uuz/2PrNVm5s+X4fUoAbRs6GElVmWxVFBoqF2b7e6aJGB0?=
 =?us-ascii?Q?wH6viJVHK3aRfQtZQdw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dda4c0b-0d90-41be-ecab-08dc2ca5fd1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 15:11:00.6962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d19wjiE3INORBOvDfEp8weDWY0xLwwvJa4A7b0sbBV9xxjLZEOla5enFZc/ZDxBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB8327
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 15:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195409

I normally do not use VS Code, but I actually had a reason to do so the=20
other day. After having installed the new bitbake plugin, I noticed two=20
things related to the settings. One is the odd defaults where I would=20
have expected something that matches the default Poky configuration=20
(which I guess is part of Adrian's changes). The other is that the=20
plugin seems to make a hard assumption that you only have a single build=20
directory within a workspace. In our case we typically setup the=20
environment with one build directory per machine and/or use case, e.g.,=20
rather than a `build` directory, I have `builds/foo`, `builds/bar` and=20
`builds/bar-selftest`. And while I of course can configure the plugin to=20
use one of the build directories, in a typical session I regularly switch=20
between the build directories depending on what I am doing at the moment=20
and it seems awkward to have to have one VS Code configuration per build=20
directory when the source files are the same in all cases. Now, I am a=20
total VS Code novice so maybe there are better ways to do it, but for=20
now I just configured the plugin to create its own build directory in=20
`.VS Code/build` and forgot about it.

I have no idea what is possible to do with a VS Code extension, but would=20
it be possible to make the plugin support multiple build directories for=20
one workspace, e.g., by allowing multiple build directories and/or=20
patterns to be specified? I.e., in our case I would like to be able to=20
configure the build directories as `${workspaceFolder}/builds/*` and=20
then choose which is currently active from with the VS Code UI.

//Peter



