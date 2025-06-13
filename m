Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F205C61CE8
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 01:57:56 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.60])
 by mx.groups.io with SMTP id smtpd.web11.205.1749779874328032981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 18:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=BH3LsR5o;
 spf=pass (domain: oss.nxp.com, ip: 52.101.66.60, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=misv64wT6m092v9GZ1ypburqHXBRpyo0enn24chKxtd4uRN3bVLx/WouJRHi7OSnRgEUsYXtH02+2CH8T9vzZdeN5d2KBdeh7CbIguKxKsLw0HVytn4tkz14Jj/HAAVuJNtIZPpL/uXCjOB3JbQSS9Yl5JgbGoEr/1lCL3PfQp4+DeMYQwoF0JscM8Pf7tlmULvkDaIsqfxNW+hOEB9QttdtvpK2o5HT6s4VVD8p0EQqGChdKheuNjowxXcAwUyihrS04wcvFzAE4eKXFgsWiwv66XvPjVMsjihRMRwu1ss1n7QxbkBLmKrA8st3/ZbPlbedue4whFtMIPt6ZGW1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeMfI+ZqXfYjCHs5yhQqtGHEuOx6ePjRuU59vKpCqCs=;
 b=na2FnnABDcVA3NmhmXCEet4W7gqe2S1vdHFmoUE5nmk3Q5lDGRF/fglE3Sha/qxcQwxVXHRTxb7H6RFMNGAekZF5Cg7wemQpl5HH6Qzpd6D6EyhqHrcmpMF0weDmebLokcDUuREwAjq0KDbLsGXrDFSmWHFB7UAlFqDONGX/kumH8p3VjT4BuklTf0GbfXTps/jd4ReI4r3xOcC+zjPqX7zSTvNtAm4lLSuGhC+SWH6MirzGMlPUXJPG5dKOLSxIMCPyI0eOSq0LcmtCSNaYKtNUTYdzgmrOpLnfJe8h9ON7X/btIRd/S/maI1lcEg8m4Uhrcd6v+1Iz1CAliLrGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeMfI+ZqXfYjCHs5yhQqtGHEuOx6ePjRuU59vKpCqCs=;
 b=BH3LsR5of2ZqcVG+/dcmSOf3jJGEPxcj9FxQiJR2WTEh2mA2PUmIa6vyn2G5gmhl9fnCenTvw0dEaUuVaJcEjBOCAQyCi8o3esD92+YEzQAt2MYO8C0c1QysNBnHDEoZIXVv17yAnf+xDUp0Vkk0rfGI2RGzvE3H8TLWKk438pyFmHzSFgPL9XV5esxbLWlf1Q5Zjzfm9sEzKAlvInCcmQGjYeuRG0yE9TLLTIH77oN6Zni6yGcKLwWRnU4IiupdSX40tml3YbinT/wwsJCDOKwnjhWe9VvrKWpe2Bdir7lMkWFWnNwEOKjppu3pOe1df3bwmngf+dd9Ai6L7CyKrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB7103.eurprd04.prod.outlook.com (2603:10a6:800:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 01:57:48 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 01:57:48 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH] weston-init: Add chvt to weston.service
Date: Thu, 12 Jun 2025 18:57:12 -0700
Message-ID: <20250613015712.984729-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:303:83::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI1PR04MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: a00364fb-435b-47e4-7b41-08ddaa1db299
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n3Z5hQ07lqPzUatkbrUwNdS/E1O/mZfR6wB3nj+Pb7dojlruzDR8Pc+wxvOH?=
 =?us-ascii?Q?MhF2apGQorQSbktBoF1fuF7jEJ/yxkkpsPi8GvwVc/8dr1Oh6nUvqCDhmoGZ?=
 =?us-ascii?Q?kAHfbbLiuhAyp/222TBH3Qc0A//IVp/Pa5Yb9hIA8/5s7HKjV/GY/Qc1onlf?=
 =?us-ascii?Q?ZadFUulmm5NwmIs3aKRVHp/rYizmuwZWPtFAlP9K1hZdzGt/DqvuIL/LI5Ux?=
 =?us-ascii?Q?m2nhVEd9P1rofsPx+QNFa8GUuno8kl3fRq3S+BiLobZdoCjY65M642RmlcG/?=
 =?us-ascii?Q?AZivJ2SCPj2Y39PH95CXIZTYiMYpPFcGdpnMvZDSP9xNE//sNebQ6gjpAIi8?=
 =?us-ascii?Q?lRUhPzxIGrgpmjiJnOWxBprNjkU4ZZ4jIjyiNme4TybJVGCcBitXJcjSLbLL?=
 =?us-ascii?Q?RVV8lncvBVRXGjhDig6mz3/Yk5kHxKYwBiIY1ODR7Vnx6axBXhShD80plRNU?=
 =?us-ascii?Q?KhJeqAJAYawF90AEID8b6Ey9m9FWm5zm2IqDWkP0sO+drHiOL0xmNc9IgqdK?=
 =?us-ascii?Q?8VlwNrk9+QI/dLKbkI0UFibwqRSar0pv8Hwczxf8T23Z+6X1UArsIKsr/wV2?=
 =?us-ascii?Q?Gvkbx8ooAVo1krsPcNaJqpEDqRT8EDGJJXeJywDjNu5/NH3Kbu9f4zuHIAQM?=
 =?us-ascii?Q?e3WOamDjv6qe2WIIvPRR4J4JbZ1Nb+02LfiVbqEkBSr4Zm9zQaAi+hgpQTJV?=
 =?us-ascii?Q?7BxeYFeeM5uOsEQd0cbJGiXElwf72jGT2WW7eNc8dyJZfX1zIfRG69Se9g+l?=
 =?us-ascii?Q?m6RtoN1Z97oBd+KvxDsk0a0nQh66wHojY6bshPZXbqE3jYD3693d+OFSqauB?=
 =?us-ascii?Q?0RlJEjHeix+0/NHOM6Ef9CUIiEZGAsl6TfAyNxCMZy55WHASwexDzqw3gJx7?=
 =?us-ascii?Q?UV+025RueVD2WCl8+TZD88vT/INYad826ncd76QPoknEv/Z6Cn0ImVnV58fG?=
 =?us-ascii?Q?ReIA006Q5VhkdrMMaAd3OBqbWHA68/qdzf3AbXrdtjA/WpxmfFFef9RTt1Gh?=
 =?us-ascii?Q?CmHeZPNGYkg+gZThOV07NM1bs+hVvm+5uBBMXMbveaPqQOWt06/I1jduTBk1?=
 =?us-ascii?Q?JUdmwWKhNirz4coaoO98rBfhCcM2fxEy4kQebF+RZzKIE6w+0kua1K7nlh4j?=
 =?us-ascii?Q?DztPEyrTI/f8pa1ODddNHsTcVBM/bi3ioIYEohsU30+TiVXccWDJOw8RtTUy?=
 =?us-ascii?Q?c7fPykIamMR/kqDjpMU3VJ85UzvlXMIKzMIk7TbyTcE0T2trVSKd9fr6iOyw?=
 =?us-ascii?Q?Vb3Eh8j24tfXRz8GWR6jpquUDJqTP9/rOCKeBDx4kwPxqbMQYv1PsdngYGUU?=
 =?us-ascii?Q?8MWdAo4Ly8OyQjTjEuz7GV3VNMNlOYOc3juCu5zN+wDVb0eEDdeyv04B+Zny?=
 =?us-ascii?Q?Lg1QV70M0ye9id0C+DzH0q0dSwpeuuhLmOFAv767HpG0yYATMm1zEAPATLcD?=
 =?us-ascii?Q?4QEnnvX2T7I=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ac8VpCdu8uZfz15sNnXOha6NMkemb0JiazNuR4k/LPPyrafkawNuRgCeaDBD?=
 =?us-ascii?Q?PmzZAV9aX6DhCZW6QqI7rYK/N0I2wQnFTeaYddGgHEGc7CPPKk16wFIMn1wB?=
 =?us-ascii?Q?1Bb9R6r8H53FqPiBafrM+/8jiIEmlUOACuYCF5EkRPawm3V885s4y2bfAMDm?=
 =?us-ascii?Q?7Zu5WXk3McizXvULLoxOCW/DO0N5FCsW28TvFQbrSf8TdeZSoSQAe9VQCRvg?=
 =?us-ascii?Q?rnOckvrRv7gaa2DOntffFpZ1mkANwNXsYuwuY9U8gH0G2a7AJirLDWlmsx5l?=
 =?us-ascii?Q?vqgC1F+OPUwLh0uCFkM1KMwayNxnNk6Y0yYaI64hU47CmjfT8yNKYpSew1ep?=
 =?us-ascii?Q?thNLEqbPhnFo4Sg4KES6wNat6DxGL/aIZUtE7pFU57dyP+qUczdxPhSvbv6r?=
 =?us-ascii?Q?pE5VXwbm+1p5yx/jl0KR/hJpejUgXhDYo4sUjDFPcD1T8KygpWv+9OJSfafi?=
 =?us-ascii?Q?wPIpsxjLVgpcGAP/HRifPsrO1Z2KgRHl0ogH6GTb64vJfm1pTGPLAcr7xpSa?=
 =?us-ascii?Q?O/1Rzl0dHEeRaz/yYqSMCaE8I9DNa5OSPP+lBVC6eiUfNLMi56qYblOgKCSf?=
 =?us-ascii?Q?cwB2S1zF883/PMSGKrzOtKbpuw3a6TK3oSZs3jtff0K3f1ko7C+ZZKQujI8Q?=
 =?us-ascii?Q?Qwad/4k/+IOUo9lQA+1JlQeT1RJvAPDPpQYHF8LERsgPaacr1sRgolJnIPfE?=
 =?us-ascii?Q?bbuTers5E//ANKwIEFhyHiNWvB6vpUa0v3toh6uddZdSO2jLoT7Nb2SI+UQM?=
 =?us-ascii?Q?srlbQ5I8xaWESgLzC+As52YBUsWaBOZXqrmjBwdp2RbkKtGBpyQh51/2dmke?=
 =?us-ascii?Q?1vqsbaBJa6aOSAPLqIL9HohKLlAG1Wh72XuAUiMZ7b/qyLwXU5qNf2Pe0SHS?=
 =?us-ascii?Q?kdsSJFp6qAzbzdF9We6ICH6pBD7PNsB4JbAQ9yQo1ODKW1DZXELTXUQ3xppW?=
 =?us-ascii?Q?oTA4417WjZKTT05yUt2sPZ+S3DpPmTMNUnRAQg6Bqbl9EAaOEEnRmD5MLbG4?=
 =?us-ascii?Q?f1iIBhFT2mqrpPoDfVwUIjpQWyvZyLZ547VJt5gfVGRaXKF5GRfT4tFBqvZ7?=
 =?us-ascii?Q?7WB30QJK+a8N3iR91u1ivo9R3hD2xGuw6Num2kJ2XrSO2byo9zByUxKiuHh/?=
 =?us-ascii?Q?OgeOdD/rIZ3gcw4Ggi7Dm4MI4bQDrvMjD5fRgCviJurz0rhnNsD7k9JhKd5Z?=
 =?us-ascii?Q?P4G+ShTyfvwJFNR1vrIJE0VG5TiCUiaHoT4goSMbc9z9LoMWQTtMucXN593S?=
 =?us-ascii?Q?jikCuRJylT+G0LT9Qx6Yj1M5oE1SKiFh311KSs7yfyF+Z+FmBaqKVZX/WwJM?=
 =?us-ascii?Q?O5mNuaJ77Hw2jw8THbiJB53ub5W629AVaQL4I2bpjPM1AZBsRgzCz4Me3ClT?=
 =?us-ascii?Q?eOFwBT4V0smiTesikJA82uge9xdvRdQKi5f5wUbx1acGlDUPEh1+JVD/TYrq?=
 =?us-ascii?Q?OdNXOyWFf8rUDKESUnozQfc/MUQGD4kUUAHzocI64iRZdqt6iQl4kcdAM8y/?=
 =?us-ascii?Q?xlQEi61bkgKvGiuLAKV/sigI3AEFqZXvaoJP13DO8waikMVRLUyrBtWbRDQP?=
 =?us-ascii?Q?8yOQEDDjstG1EoTFaUMaKE4I/XGGWg7Qw3UhuTwB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a00364fb-435b-47e4-7b41-08ddaa1db299
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 01:57:48.6569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dq9kXYpqAX9EeZxcvlyZxP5yS5O80ysKkkfgH405uKpnJAUcROHk+18DNpBrphlJ0EiJ5gV2F5UFIPRMrk6Yxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 01:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218545

In testing a specific scenario with multiple displays, one of the
displays did fail to start into weston the majority of the time.
The problem was traced to a change in seatd from 0.8.0 to 0.9.1,
and a writeup of the problem was found here:

https://lists.sr.ht/~kennylevinsen/seatd-devel/%3CZy_-FRQnBTeNPXVj@mail-itl=
%3E

Here is a copy of the explanation:
```
The main change is that libseat no longer activates the session when
using the logind backend, so if an inactive VT/TTY is targeted, a chvt
before or after starting the session is required in the start scripts to
make the session visible.

This activation is removed to allow starting sessions in the background,
something Weston used to allow before adopting libseat.

An example of a fix is available here:
https://gitlab.gnome.org/World/Phosh/phosh/-/merge_requests/1566
```

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/weston-init/weston.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/met=
a/recipes-graphics/wayland/weston-init/weston.service
index 80745998ed..db2c74649f 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -34,6 +34,7 @@ ConditionPathExists=3D/dev/tty0
 # Requires systemd-notify.so Weston plugin.
 Type=3Dnotify
 EnvironmentFile=3D/etc/default/weston
+ExecStartPre=3D+chvt 7
 ExecStart=3D/usr/bin/weston --modules=3Dsystemd-notify.so
=20
 # Optional watchdog setup
--=20
2.34.1


