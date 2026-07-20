Return-Path: <gustavo.nihei@espressif.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5308EC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:47:09 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (OS8PR02CU002.outbound.protection.outlook.com [40.107.75.129])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8154.1784551620343414437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@espressifsystems.onmicrosoft.com header.s=selector1-espressifsystems-onmicrosoft-com header.b=2si41uuZ;
 spf=pass (domain: espressif.com, ip: 40.107.75.129, mailfrom: gustavo.nihei@espressif.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZsaoHMsJ7U1jbWMnTS6EuKUNH5NthPH3f0PTVZ6bBVp1yeW/Qs3pC3p74o52ajxsOFY2VIA50v+NZLPmiwulRvJrbJTdbE4nhY5Cz5g3cH3ZruaPW9SEamxoJyoQxp22pywa0Ai+nrK+ergq5srIyv8iSvJASKNhZ4jx+slk+wLc+cWgOCF7q3C7EzWIpVeSW8voAVU7/ycYR31xShYh0dcfT7SxOpIzVDeFWWzFsjvoWNQPFA27Dp5H7jNlk7h4jkrNWsxRHz/RFMSvT3mWccEeXj3O0L5YUa+XSGzvjRAJOpPK9HDWCKH7+i2fu0au6EnWFOk/u45AtFM5gC5hfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBjuCdBXZcQsonjT51RlzC7mpW8f5YqndQBySypj9F0=;
 b=OGvH5OoIhDQb1N1Y5nrvOBsFxiKXENUN4T+TyUuZs2/1D/H7TemYT5m/SSoLsN5sreTSRnHaDU/cSBeR0PISgEtahGi7jCGQ2RYBa3w6GuHpOG5+ojA4gpZPHiSsOv+HZmx6TSsMhH4laz9qSKdGkAkeRUjLp2RSVDerUdFAY6gTedpRCwxiNjRlYW/RwiKS+AImN+BwsvHWNZfPFJKijD6rzbIMj7IkV9KrqQNFi/tqAhf7VgqQwg4wb/jnt4QorodEdCD8KSas8pblFwMZgyEBMLBsfKp9Ln05SNm3N/zgbkINYiA9I+KMa2OZkGxXrwjciIkOf96rEzscoKGzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=espressif.com; dmarc=pass action=none
 header.from=espressif.com; dkim=pass header.d=espressif.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=espressifsystems.onmicrosoft.com;
 s=selector1-espressifsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBjuCdBXZcQsonjT51RlzC7mpW8f5YqndQBySypj9F0=;
 b=2si41uuZBbKHcb1IonQpnDnirKpFu9BtAU3e4E49ZRR1w1OD+OPlxBlnBd9VwHGvIKhIptP7k34HokW8tP2qLsBXq2V5RfFZXEaBvJ7luFCIE181VqyCw+GMbrxpUuk5QiAUC27m/gyhl+YQNPkYLhJVhgsgAZ+dpmR/BZgpHwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=espressif.com;
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by SI4PR04MB9518.apcprd04.prod.outlook.com (2603:1096:4:2b2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 20 Jul
 2026 12:46:55 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%5]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 12:46:55 +0000
From: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
To: openembedded-core@lists.openembedded.org
CC: Yoann Congal <yoann.congal@smile.fr>,
	Paul Barker <paul@pbarker.dev>,
	Gustavo Henrique Nihei <gustavo.nihei@espressif.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH v2] u-boot: re-enable RISC-V compressed (c) ISA extension
Date: Mon, 20 Jul 2026 09:46:20 -0300
Message-ID: <20260720124620.1194239-1-gustavo.nihei@espressif.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CP3P284CA0081.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6e::26) To PUZPR04MB5419.apcprd04.prod.outlook.com
 (2603:1096:301:bb::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR04MB5419:EE_|SI4PR04MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c52f77-fcb8-4625-bb94-08dee65cfaa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|366016|23010399003|1800799024|18002099003|3023799007|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	TvUjYxje0HvJ2AwpQQGBbuDnx7F1khkLbx/T0ilSkUBv0AXkfUUbvU5NSpgMfP4RSndGfrtCUv7+a+gKvTWCdOHBuikScxwl52Hz+tKl5WNHgqfpyKOx2vXdzJR/qxcaOizWuFWLkjF3Dm/j3volMZHbp7wIiMLFUJCWmLD5GZowUzsEzbpFS/ZZnbKd3OfnnR9MdruOBckY/GPC3+u4mveAXcabGKMAJ6QySILHHx8Fyvq1yXB3zSjDBKOEeKpVVvfPOaSyGsTIW0QGBciIjcYbsIVJtQhPvw2VMR3gyMc5AMDwL3Pc9ncaunIj81ya2KaQBsEoP1k7Yw6lW/sxGJtyW0hxIN06oFE+8D6AqDpLo59ZA6QdY8u7ooTnNXyaLG4nfhN0Y6qpHZLbLZ90c67RXui03axih1Yluk2NnmZEu3O5+HGXPZhIYJlOg2pflcE5nobBVvN6wHSIXxpYM62/aHwvTK0xJ9bXYPbDDQH9GCtRagoXG2bTvkN2J6ymNKoSojgCfGx4o6+sW3+CeXWZdRr4peCC7BapeE/dp6UT0zIlQhijGy7/f4qEEgrYWOJz/S5xVvCpqh7p800UDwcYrwvs81AdndW6oo5lCwYul9N/lQp1pWvlQ+SdAdzl0vzjuqZev4dF8dLVNMtEHRJFiXiDJ4G2reiVQCr0V4s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB5419.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(23010399003)(1800799024)(18002099003)(3023799007)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GxJLSEDZ+Wl47cZxrLTp+0NJd3IU4+MM1vp6BD1CTKAGn6JWWFMEu4GigwKf?=
 =?us-ascii?Q?znFhyYgNsfCGYejosGS1MuLl6AQByXOGtMmBk7JBjCUQHcrxlqNn0ZdiJtqn?=
 =?us-ascii?Q?gGB0pQjoIpqgmB+ryz0JT3cHfqx94u5nay6nLnqHRWQa62CM7FSPjYfTFzd9?=
 =?us-ascii?Q?TQlm31EkV9NLAno6Wu29U4QeL26m7Qvnkd1Mp1p3a/vKuHNYsnbT/gn8oRyX?=
 =?us-ascii?Q?eIF/fB4HTL/JbYCqLq8yE2OAGXgulo/ovuviRfk7Ifxxmulzw94nyo2oicjr?=
 =?us-ascii?Q?EmoK6AU+6Op44cjapZ0JvFtxYQKrKfHUYkl6VCDPIGVB/uyCYV/OP71XIAZj?=
 =?us-ascii?Q?Uix3Ob3hPFUn5kVoA4rDOpW77usJsqb3JNrNcDJt/ckGwir9EKOKYEv0jYLp?=
 =?us-ascii?Q?V4I+Qx8NSnx1qPRJwkAvx1rbSAtXzYAqlNWLhSZpYdOp8J891qZt7q8lH/M+?=
 =?us-ascii?Q?CWWJdmA0Am/8BNf6/6hvqzbWyJHB9pA3h5b+Jo1J7WW6UzpIbljRDwb9FqtJ?=
 =?us-ascii?Q?/19ZbUAk0TckCTM5lTT14pMn6887lkCvdibBGHKVn3mSBvf7kfRDYBvGsCTv?=
 =?us-ascii?Q?F7Efz3e42m4VbkQIZ80KuslK4S5Y7IjfdXLnQW326aUp2HmXOUATIqjPacO3?=
 =?us-ascii?Q?71WCjad0CvlS7HvFeqLqf9rTJsBGkEbepaFLGHAQRGE2N+SRY3M9J7J61Wu3?=
 =?us-ascii?Q?UuTZo9tlBnLF81nAn/6bM+3jShIp/Vklae9ICqFZiRUXSWXKZe2VfCeZ9XlL?=
 =?us-ascii?Q?OdSfIho0r4YoQwvhE2VDlaRfxj0Jrbr7U0wnKUbVSDBSC/sVhS9YsFiYS20P?=
 =?us-ascii?Q?rqCu/lt7Tbc3GFxBaaeD3WL3hRHyVoESSXGFfvqxYQKI8x2UzzDanzWALXLs?=
 =?us-ascii?Q?K5TXMu7+0vKBfSDgsxhXNhr3/Q4kuHInDDRvO4QtaRGsVeL0cFXlCeJ+F+HC?=
 =?us-ascii?Q?gcuUOqxPs3kgbHk6PYXEvOmSdodEfoHyqtXcF9/TkzA7/ORjlT944hPqtKHY?=
 =?us-ascii?Q?GOM2VlmzC+LIMmcG6aBo0XGujPEdAQWmkSBTYf+Qow452Cr5GAW8FXNKQQMe?=
 =?us-ascii?Q?hxkYqHiJAnuvtNHtE4kXOV6T0fH3n2p6K2s6n2sCNL9bfP/8OF1hqtyyqhmR?=
 =?us-ascii?Q?V7B2XBF5vSy18SUp6d/OnJUpezFNGgAnz91jmwk+KkCIxL4AQ55/uzqsZiMj?=
 =?us-ascii?Q?mnMyW8dx8O+yUf0CYRVkK/eon7/qF4vcPEseiwEjDciGWuroxY4dwKIqXiAq?=
 =?us-ascii?Q?zGeDUWxCZKXdbysN46M5qV4dxVmiohYdNlKyovtW1usZ7lCUo2jYo80qjroW?=
 =?us-ascii?Q?FXJ9AiAbZ1UB52pKSU/C/3wYiud3VR7YTAOOuDwX36SPrGXLQZzGiG3f7qnL?=
 =?us-ascii?Q?h2aDjnJWk9txe8JjIkjLShlk5hlG7bZiernffgHifhg2q97LOcOFOGnHBsqo?=
 =?us-ascii?Q?ecXA/DEiYw6IHb5YS+FN/vUP6ZQZ77IgDzq8V7ddoyfIgxOWHwRT2HiN8klO?=
 =?us-ascii?Q?uWSWZZ5fhT2UKd3O2JYxpTV0rD/ENyuz23LeaUu3kWkzcCzVAjqSy/o8oeQv?=
 =?us-ascii?Q?dZ/hHYiI34Zx1HHO5/kpir1tL1f6oH5jIBGPWRbIIDxQDSYDnIU9N1Bb0dkj?=
 =?us-ascii?Q?LikrvUjRGYn5RBacoOUq42rFsxxmm0xdgaeWyV0gUuyKbsdZ8fztfju1tsOn?=
 =?us-ascii?Q?oIeIQtY55QTq1LxduALkU4HZZbJEiJTWM3AQnp7vNFf+8tCai9YTcVuzzMDt?=
 =?us-ascii?Q?4ZVNA/20mmE6Td4J2OlYiuGNi1O7e/xKmwWW44Hj96YQSJuxKcVNoGuQwhkd?=
X-MS-Exchange-AntiSpam-MessageData-1: DkJ8LV2h6S2QDUtJf9WixrHll932pZyYDRI=
X-OriginatorOrg: espressif.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c52f77-fcb8-4625-bb94-08dee65cfaa1
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5419.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 12:46:55.0570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiZ6Vt4UHhXOujfyCfJFVY4Tkqjxs/57kVO8Ja5zqb5wJ+XwWJHq39DMbDQZx49Ia9Sf4rKclBoRd/U/kamqpoSXLboN65YxjfUXDPDKsBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR04MB9518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241393

SRC_URI_RISCV clears every RISC-V ISA extension via
u-boot-riscv-isa_clear.cfg, then conditionally re-adds a fragment per
TUNE_FEATURES bit: a, f, d, b/zbb, zicbom. There is no line for c, even
though u-boot-riscv-isa_c.cfg (CONFIG_RISCV_ISA_C=3Dy) already ships in
the recipe. So for any tune with c in TUNE_FEATURES (e.g. the default
rv64gc/rv32gc tunes), compressed instructions stay disabled after the
clear fragment runs, and .config ends up with:

  # CONFIG_RISCV_ISA_C is not set

Building without RVC noticeably inflates .text: on qemuriscv64
(tune-riscv64, rv64gc), the resulting u-boot binary is 1312625 bytes of
.text without the fix vs 1082853 bytes with CONFIG_RISCV_ISA_C=3Dy
correctly set, 229772 bytes (17.5%) smaller. On size-constrained
RISC-V SPL targets this .text growth can make the SPL .bss VMA overlap
the .text VMA and fail the link.

Add the missing "c" mapping line, mirroring the existing per-extension
entries (a, f, d, b/zbb, zicbom) already present in SRC_URI_RISCV.

Tested on oe-core master, MACHINE=3Dqemuriscv64, via the
oe-nodistro-master bitbake-setup config:

  bitbake -c cleansstate u-boot && bitbake u-boot
  grep CONFIG_RISCV_ISA_C .../u-boot/2026.04/build/.config
  # before: "# CONFIG_RISCV_ISA_C is not set"
  # after:  "CONFIG_RISCV_ISA_C=3Dy"

do_package_qa passes both before and after; only the ISA config and
resulting .text size change.

Fixes: de890297b392 ("u-boot: Dynamic RISC-V ISA configuration")

AI-Generated: Uses Cursor

Signed-off-by: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: Fix Fixes: tag, it pointed to the wrong commit (cd9e7304481b,
    "u-boot: Overhaul UBOOT_CONFIG flow") instead of the commit that
    actually introduced SRC_URI_RISCV (de890297b392, "u-boot: Dynamic
    RISC-V ISA configuration").

 meta/recipes-bsp/u-boot/u-boot_2026.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u=
-boot/u-boot_2026.01.bb
index ac1b0b9b2b..6d9bc126a1 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
@@ -14,6 +14,7 @@ SRC_URI_RISCV =3D "\
     ${@bb.utils.contains    ("TUNE_FEATURES", "a",      "file://u-boot-ris=
cv-isa_a.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "f",      "file://u-boot-ris=
cv-isa_f.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "d",      "file://u-boot-ris=
cv-isa_d.cfg", "", d)} \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "c",      "file://u-boot-ris=
cv-isa_c.cfg", "", d)} \
     ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",  "file://u-boot-ris=
cv-isa_zbb.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "zicbom", "file://u-boot-ris=
cv-isa_zicbom.cfg", "", d)} \
     "

