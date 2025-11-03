Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232F3CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:26:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15246.1762154815247262870
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=qXZ2J2QS;
 spf=pass (domain: navimatix.de, ip: 52.101.69.126, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4WmaMnTczKgQ+JVrMLRN1bIM1TPa8ikLTECsX1fgl5/5wA8/l5A4KfYAfxDiQv+R47AilWmHE9isyXT33nDrXRUIWJgnhgLoLkI5Q5y2oHbCPOeutJI2bpRIwllTAdfi8/YY5v0PMHxE9NA0F5v4g+WBUTPUUyAcAiqpERqy7Xn+iCEkY+EwGFQt8FTv8Z5euBqODPlPxpbORKpQJq+A5enyXvd9lx5oqDLW5gJtQ8pfoQfFvDeQ7T0eAEDAe3bsn/GnxwKV2ICXeSt1f/MLVx2BKXWF38bNBKCZE95Fc9Iize/Z9hG//G9Mr45IwAnVUWxJEZGt679DQT9l49PlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryZorOg9aEI9mXbvxw7BfBtl0VOqSYisgGJe2mA3qCU=;
 b=ytZezq8gsZsgdJlqHqedVfXlNXN72dw9vrtkI3FtXuVPDWTU7wwn8/2bkAvuUZMIIFHHC3zGOLhdjp742bGdkR/iKH3oxQuHPpK/VgI6MkTvI9uMDbeX7v2xqbvxLJKLZhUl+SLWMHeWe9vvPf6B4gCSI9gZHkQOYE1VwJEel4kOPA/9B5vtgluyk9N2oP3Ta2mx3DLUCiDaB/QlO03U94y2sPkP0Sh8OWtAhzfmr6ICOPSTfwbjYBa7QMsDfCzLZEhirIubx6JKRBTs9t46O3hnprEuegDt+oHvqB7VbhWkcr+BmXsVa54GfKGZPU+o81hOJ/bRULvKjUu5wueVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryZorOg9aEI9mXbvxw7BfBtl0VOqSYisgGJe2mA3qCU=;
 b=qXZ2J2QS6hU7RdPx5uTYCpz5ZJpYKwSbbbjEzOOlBAABkVA55Hy77rrOTWxIhAbZegMRC11AB+sU4FVh9ouaVZaj4gK6cLZ85ShcbGphSQatBe8fYKZJvXAczKg8Ul0FyU7RvWkzasl/YvAsjDtUgtdNjRbxjXIztYYKFdJ5a8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB9155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:26:50 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:26:50 +0000
Date: Mon, 3 Nov 2025 08:26:49 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
Subject: Convert packages to gnomebase and upgrade
Message-ID: <20251103072622.1296182-1-joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BE1P281CA0290.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::11) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b3d85f2-54bb-4741-d596-08de1aaa5ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3QGhh+xxa4jqtxj3/mykFHajyYaqihL6KtkqMOE7/WzTNtPII7eIY407fziy?=
 =?us-ascii?Q?fBAtIG6KcsWWH9gcrxg09Pwv7Iug2i2SUyg0beP0+UQzd8eNU29/IO8+iUoW?=
 =?us-ascii?Q?iTX9M6ZCeD83Ciwc48KjIyRi1WrZeUHbxd3ojDUKhgDDVJuIOvyhkA1yq+Ac?=
 =?us-ascii?Q?o4rQumhXTOlDpcVZYyyn2lHeBsEbjv02BGEfcyx4W+myxDAAyzDvdZSqv/3n?=
 =?us-ascii?Q?+lAhqycBuXID62u7dCVbb5IROADzhikYIBAVXFlJ5vRihNYmmSXv7s4KeRix?=
 =?us-ascii?Q?ZBukKc3Y/kQBY/jkEzLzLwrcvQsLJx4ImqfVFwAISguslBSnAlyJlVaei4mC?=
 =?us-ascii?Q?7lexFk0pqAADMjDE1xu92wXBgdCI3Cq8JGDD63NaaWpuYQ1ukDyNjL3xS1lE?=
 =?us-ascii?Q?/JtpbELbJrRNYz4wE7KT91VQK5mmQD1+LUGhtfCxtJ+s/aQIvCbxkY39Xaw4?=
 =?us-ascii?Q?lCoDgQDY8t/bhXfcBx2Wcvx/BuH4fiQ4mImRTecymmv6kHMEC/bzJ/x/zonW?=
 =?us-ascii?Q?VV7u7gxPaDBnDnk4y7VbGE5UOFCdnw28cx0w4PoFLRJ+FcENfmNledgfVdVx?=
 =?us-ascii?Q?jVmFZtwBJo+cyiTeV6OzGxkzUiJlqX0j0nHo95G1zPtxD2V32M4PTGKeSdUh?=
 =?us-ascii?Q?yHihtWYUFf7aYBrPOXsGgFB7+mlbfwcP0ou7IgI1rrbgV6vzs2MfzsnAnM1X?=
 =?us-ascii?Q?oiBHiY7euvFAzA85n1WwhwOXAdsQtbVz7aGS8JVekWX56A80U2eAGRI+/nCA?=
 =?us-ascii?Q?zaVfHnKtgu5nRBtyU9ceXtaOjrnBnF0kDICVKmJNk6OTPdNAyjysHkXpXee6?=
 =?us-ascii?Q?Wxobs+PxCh/Y96xJiHWHe1tMNQX42HghxqTJfrBDAAeLC/OLNLA6czmTAQrm?=
 =?us-ascii?Q?SiOKd//BUlxEH/Hhu7eeLZBrwNia/DTrYkGB30eQAtCq4pyBAISI9n4sV6Am?=
 =?us-ascii?Q?5qjleVohRbIeW4Kh+JsFzgO3ecAXT34Z6QcT8W3HJDqH5grwyGytxAXzMZjI?=
 =?us-ascii?Q?yxln0JbiwL1FQ0frx3ING//J66eEqHzyb7DuLwquXg4to20YZjpTkaUpjcIo?=
 =?us-ascii?Q?ggqECc/c0u5Zu7W/vhdkFT/vMbN7a1gYcZFtS9H7rErGX/sHcow8JmJnQYR8?=
 =?us-ascii?Q?cp4nq0mnBUAuDX+7sh1AoE4hTl5WbgDwEvg3bZG2ixxoR5v6XC+eFOC7tNho?=
 =?us-ascii?Q?iStqJN3g70Cx8huG/y5X/tOFC/bD7kGaqp+P2zNr5kjBoRMZt4wf/bMGc7O0?=
 =?us-ascii?Q?/xeKJG+vywH5oOQZMK+w5aMdtQOi915RqsDKCtaGtf9yGByGTMTwNa3masj8?=
 =?us-ascii?Q?LV6rt6JyX2S2cNSn33TNtw6suTSMY3AKnN54BLdvYtXkBXa9KXigYn1TWCZn?=
 =?us-ascii?Q?zXqDeRtVyn+a3oxEmHJxIVKyHWYzZwV/GFV/Lm57ML08Z4uPZd+Ovh3y1xT/?=
 =?us-ascii?Q?j3e0UiS0z7g/RUcEm0R6WyU+qLjBUTqG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B3P/NiJnWd1lqlHzI/R4Vu+TFkSXV11+5WNi2HFHYfi9gMplOX4kjc2XXdhd?=
 =?us-ascii?Q?fxM/DkYw4jmezBuLoo8FDltc9Iqs8khQjMXJOdnppfzA1lMiL64Uy8sFrcfk?=
 =?us-ascii?Q?EKMJVE0SPWH/vhWjcZEqGF9qoDdT7vVRvBzRtsWsjAF45Pa947Tz9CN7Hpjf?=
 =?us-ascii?Q?MlUUCKM03uZaInMYDfZUAfk+QplCoLSwiKUHm7/8RvuQo14PvGx+Ztle1NPZ?=
 =?us-ascii?Q?O5FUsSDCKxJzc1/OaDujsvREARZGBsubdfPhasY8FZ0DyA6Eiv/x8QhrRzTb?=
 =?us-ascii?Q?tx3nNSE1vgcJWGQZDGK1DYTSAXR+3qFTUWAkrnMK4Dn+pzdTBX5MyEVs3egG?=
 =?us-ascii?Q?ZQ/+Iw0wxBJs81VPNG5i0lnz9E2vLA9227RZZLPWkdg1ML9pWf8ejI7hzR4h?=
 =?us-ascii?Q?dTepTVQI2MUdrnm0+Dyjha1QrEI/CBIpP8Ml4oGVXzENfRp1Qwt+lWxWxbH5?=
 =?us-ascii?Q?fQftVWKJJlTy9VixZCtJfawdfY7RBlBgtPp38O71b8ZHnoFSF8R5M9kMfuDS?=
 =?us-ascii?Q?OcRyFnQVogZFz15nN7U/oYGtDkHdK20EvcCHaQ2WFAMZvE5U0Y0oI3pSzZs2?=
 =?us-ascii?Q?1GKdgCa94WAlqmLnEvORs0e6RpBc3mmIUJ4DHBxmiY7v8dPnIdgr6zUlNHQX?=
 =?us-ascii?Q?ZHZ2R+cTJMisk9+KsXHsBwH1ouXEK9OoQZ7yD3OTTO5gseKjf0N2GO6afkaD?=
 =?us-ascii?Q?8TY7yLNYzn+WzMNFlp6SZgTNrRk7PDRaM+OcKmu3HUrMQlfTxLFVxVQEiAiA?=
 =?us-ascii?Q?q1F+DGmWl9ltBnnucLFrizAYU2MgQmxVH/8D/xFDFHIyGLAMj83cteQueVIk?=
 =?us-ascii?Q?YsiSxdr+riYhzlK3wegVRjl/8wquJOTUFRIVO4mTbDD9ISUkxCVfK0YPe8tb?=
 =?us-ascii?Q?VUmm7QflCLry81go9/uj5l1315wz/aFWug2TMqB29NlfSCIZv+S9r2AYM7FZ?=
 =?us-ascii?Q?ivVXTnC3gtccy+D903Qsxb7xDFxhQdptodn36RdWBp9HfSkG7gBCwMFmoLxq?=
 =?us-ascii?Q?vsJ9rDu5UOxjpFeSvHw+1/4H5ifGB+qLDEvtwlI3g9tAq82rvc2LmODNA2pO?=
 =?us-ascii?Q?mFnczlyEKd3FwUzID4BnvFMSTQue6/N91yq4ecEKMR7FTEtbyL+AZ9JMXEns?=
 =?us-ascii?Q?cH5EJgW2gz03LKqKD7A/MjiTCdEG39Wzbreneqk2rdD1ek52quzRq9hArCRz?=
 =?us-ascii?Q?3RSrcMpUXb5cM+onYbI7AS7BB10cmOrPcfTHy8UVBrNyZXfZY6+hupnC7tTJ?=
 =?us-ascii?Q?UpYOxK1LvNie3+rU6aukLszgsXjQPAMxQwv2FnXaQhp9pok7jO4gavLcBtRK?=
 =?us-ascii?Q?KezOB8p/5jgbhp7wTgtRwNIxbw5hD8OOerkt95wdgcgX/S73S6Ki+T3d1XpM?=
 =?us-ascii?Q?CFv/6Ize7AkyE2HAKEVpcgAhfOVDZ+D90II9XOM+QW2OYZTT+iv15SzM4PDJ?=
 =?us-ascii?Q?MxgCDfa5NSzpw5lncUJSliY/0Y9rH4jFOUK6wfXmgujrJ18WjhnRme46Noxs?=
 =?us-ascii?Q?lIHKiXgZxyDefe7UghDKeFjzOPYQYcEj27XWLNvadha+DbRy3V0mstFk2Vx5?=
 =?us-ascii?Q?w4nLWjz7p17h1UgeELSVkdPu0naUHCfr2ufqbY6nNAzhSKqZ0KPHYKHAd++Y?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3d85f2-54bb-4741-d596-08de1aaa5ac1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:26:50.4612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GelIEwo7PxfjOcFOD8Uih7GvzikUd2SvzCPVD2Qgp20WIWThg5dqBKmxsxBwFIrfBofsqguwcwG0/dSULE/KIQailJ3AjQP//o5jLRdcCI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225591

This patch set converts these packages to gnomebase:

* vala
* python3-pygobject
* libsoup
* gconf
* epiphany
* gdk-pixbuf
* at-spi2-core
* glib-2.0
* gobject-introspection
* gtk+3
* gtk4

These packages have newer upstream versions:

* python3-pygobject: Upgrade 3.52.3 -> 3.54.5
* at-spi2-core: Upgrade 2.56.4 -> 2.58.1
* glib-2.0: Upgrade 2.86.0 -> 2.86.1
* gobject-introspection: Upgrade 1.84.0 -> 1.86.0
* libadwaita: Upgrade 1.7.6 -> 1.8.1

(I'm still working on epiphany and gdk-pixbuf, because they have new
dependencies, but I will send this as a new request.)

Some minor clean-ups:

* libgudev: Remove UPSTREAM_CHECK_URI; not needed
* cantarell-fonts: Remove meson, pkgconfig; already in


