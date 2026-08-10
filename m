Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E4BC5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 08:20:09 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25286.1786350004523201085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 01:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=P2yThOQm;
 spf=pass (domain: est.tech, ip: 52.101.66.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPAQFYxgnwuB3pidIkhSdVmWy6G12/6WjRTMGDkN0is0Mi61mPFRep1Hu1WETDaGEZubg9Q8NDmedGqL4qWAHmOQ5qvobJ7vD95xoh8zZZvWREOZ49qRRy+iXMlMQjSBa5QnpQ0Med2LOzghiB/sfV9Xb9xSLMJGhQYgs8rlTB/gOLAVz4VkO5y31213j7S+zuR0uO6FVJjVZc6I6srpywUhxUKmCAbKKg/CArLU1cOucXQskQ5ggh8dC9AfnZSfd1NcE73I3UpvJZfAdSOrxeBzbm56qj3UIOrEd3IM74q1m6wI6umciGgqEVZkJtQqtplZYMwv3OlvhDC84of+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GL2JYsTF2UKqMlnI/ZutZrs0tM0Z9qzcZMoTWbSVF4=;
 b=nuyY8RnKoihPIjKQc/EQT6ku8NwEjPPinkC2vmNeLNoVQ6t5A5NyLBd9aH622UL7W1hQRKpplbkoBNm+kTcQWNmEvDr2/230Mil9Nyegq8KBWIbXi8c18xZuINI2G2GulDMuWm1Sg2HNWbmuAeK/th+7bJYfDHeMv5nrNr6TMZsaCcw909TrwZvPjDmLa3KEqti7sey92wX33andLS03j4eQIIAYV1zhnRGGqAo1VxInrpp1EAMCvI9rhEBzjc3m1XR6CMOjLHBLw5Vnp7KjDVdafrO26+8plEWXkIlSXnDGjA/QCA0Kof9p3NLX5JNsQeCBgxCVbjvMphuF8ZOw1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GL2JYsTF2UKqMlnI/ZutZrs0tM0Z9qzcZMoTWbSVF4=;
 b=P2yThOQmW3rs78vAcS6Od9WHyuqTUCGUbFASc9+je9frVA9A4RdyNtXX3znLtMfBp+bbUOu2iCu4BL8hfB89yj9x2AIa64cicqO0oYSpMKFANS4bED2ZJTctyj4xIAbg/YU6Rc2h4t7+p1fhFIWblxJVJBvZQilGLYZmZro3z6qaXV7YKNVngtLC5olf6ybwtOM01XjDAvfxaV15PXH2A649ifqn5ub62XuobzQg1O7VTTg6BjsWfmVYgGyDdlZlZPfDEFE58Vn3JK54uBhFRHmVNFcc+omUUSgad7BT6+h1gLLMLZ6L2EK4UzDxM68469r/1sjonaal3ix1/nj0AA==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV2P189MB2983.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Mon, 10 Aug
 2026 08:19:58 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Mon, 10 Aug 2026
 08:19:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shadow: upgrade 4.20.0 -> 4.20.2
Thread-Topic: [PATCH] shadow: upgrade 4.20.0 -> 4.20.2
Thread-Index: AQHdKJ8NRyKJXT5x30SCrzKlUt/PSraW8LaU
Date: Mon, 10 Aug 2026 08:19:57 +0000
Message-ID: 
 <DU7PPF66507B2D7BB0CF17626372B5823BEF3DE2@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260810080517.8329-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260810080517.8329-1-jaipaul.cheernam@est.tech>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|GV2P189MB2983:EE_
x-ms-office365-filtering-correlation-id: a1d859c9-7517-41dc-44ac-08def6b82a4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|11063799006|56012099006|8096899003|13003099007|38070700021|6133799003|10067099003;
x-microsoft-antispam-message-info: 
 wWrcmco9d5vFfcoq+bOYz8ocNApxu2rn93dsqoSKp+AXkYXfbuyD29E/cspAHJyVsvkwV0pjOkcjprj1QHx1jZmlcCg4loCo6AUPpw23LkdYaZmOSF0EtLFty2FIekZhclpdv5dqoAtVKZ5TGmZDILItOMwCDu+5V2dQOwNO59/oLLuXJ6SxGohMElEFzKjrhs/wdE/rrGz+B4J1m3rrlqg1VxgjEvhDpc9CITlt95FB2cMx4vGHL6DzAgPY5VRXzezkpgQN+KKbRPNl8dykOVie1u4MkMXmE+XejbZns++nw/qAvEaRAd3u2b/KYwM6hpJ0mxWyKsKt/gQXGMdrkeoFU1B52/++OBs28OVwgHdmGJOKd41uAZFueZ/oTg+mpm2TKqfCWoEgw7ZwdxRuaESNEnIoiZd8dFXIVGS+tYmaOuJhZUV7xYoxd1jceRiHRHqeZ4DCyrgnQOuSirCn24wz+hBzR+P9MItKl+GL/Ksa0FRIeBJz+CZmys5IT+dAlWf2CYo8bPFrC11afhSSMxBW0N1xDLOZPFGxhr84EJotmoOcAhujeaFFX7kg4ZLLD3l3fXDwb41FZV+CWYZ5rDSI/XoHUk0VyNmF8CHPJnPvFOTcLx+QHfDtaZDs8XDInAdcpc9KeITFxqbCiS5QiiC2e/Ny0Par+ephbyMZUCc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(8096899003)(13003099007)(38070700021)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dyqRotjPx2arG31PvVhqllcwJVTdK7O8TGNI8RVabVwJyzHVi+CZ2cBXxyGR?=
 =?us-ascii?Q?9iaDL6B47gv3MFMLCiFx9eusUEwv4V6nXuEwwUBsFY2IgPZ4pGocryxGfzwM?=
 =?us-ascii?Q?GwcTYEx526LItYGU/bbTVjAbs0PoXl67OY3XQUWbIp+teHp8c/CrSff0VNCq?=
 =?us-ascii?Q?JOJNyaP1srevdZr93vbxdpzhjWd9o+nVtHElsAE7wLilhIpXMIZYxtAOK2gR?=
 =?us-ascii?Q?ZVHtHe/39M+mE3kcTgfhyNym4nJef1igJIu0JcJ+LBqMTV9R4tM7hPQe+vLr?=
 =?us-ascii?Q?SsrSl26SZ0aGhI64yfHPMu8a1ViZJt/e5UcN+LFfj5oh3VjoohjlfHgcAo0w?=
 =?us-ascii?Q?kS2bniLvwlTfTOnCSSYsiaz+RmuMqfvC2kYbqCbdyvUu3wwu4WvGoWePSvnr?=
 =?us-ascii?Q?A5AQoBkM01L9lUWRZeqcqtiOOeKvKs9IWCbVFeRqIe3tvQ+smO3P3eqUfOow?=
 =?us-ascii?Q?Tpev3xkVrRQtSWqo5EI+Gnk8/BHW1MKdLr+HbQu4tDhPed163TG/jtpHevja?=
 =?us-ascii?Q?Yp5wbNGvamyTRnYXICzdNQ0o2DvSypRWnng3VEDl6cjptUkgapUUawpZx75k?=
 =?us-ascii?Q?CEIguJBE2NNgXmQkXtgQeriZ7Td4bwbykPOLUIqo4U6+fhN86uEZKJN4jm5X?=
 =?us-ascii?Q?mJLN7s3bVLDO9KivOx1N7uIK551PFcWrtJPXGJmJXW/sFRtRpj38LUGhcdF/?=
 =?us-ascii?Q?bUGT8GNbZD5Az7hhMBDDgLx+PUEcOZIswOAHQzKRQ/AQLX8yKtrrn2CfHtYB?=
 =?us-ascii?Q?oLRVUl73Iv87QG09lrg3OMARCGpFFpANUX9B/5Q8yE6JeSnP25X8rUAgDsxv?=
 =?us-ascii?Q?kXJG48WX9CVNYGHACQFZ7UQGkagJ08QJwO+L4zpWqd+2DFoWwasqsurBnfEB?=
 =?us-ascii?Q?EpGKZdlbYcd8fiTuQb2YSwgwVXo9p1uof8MNaqR7ksYDYc+jky/CzwSuFAwl?=
 =?us-ascii?Q?ERQefN2R8drnr1lx5NNFQnBkT9UXfxk7WzTlrsqCv4ZCCbok/5GzTHUvWFhp?=
 =?us-ascii?Q?xhKiy55WrO+ZGrTXxGoFnJfovtFh+4yeK7wXgVuoyP3bh0QWJ/M6TmbIS3xU?=
 =?us-ascii?Q?OYjUIjDWD5FYBmsMcV2ONZL19xt3dpv+zcavNZClQheh1pvkcKMkKME1z3EX?=
 =?us-ascii?Q?MCnrtJPkBRzEuMX/YmuRpLXbzE6tyTB4Ov1zNH4h4eTpf9nCvmZ+dWRT5YFl?=
 =?us-ascii?Q?Z9SjVpkJSNpCU7MRyKGcXv0c4jXJTTeR3Km0AGfAGUB8hS16rMFOCefzDBDR?=
 =?us-ascii?Q?QiT64wcy+kqnqHNhb55xy+RcRKIyXOCqbAvSP5dN5Sjk32O4YXhr+ALl/fKj?=
 =?us-ascii?Q?1mZ6vb0FmdHP9tg8n0prlPP75MRFB2dGTBWA2h1AL0QEbJ9UUdzH4BUDLK7t?=
 =?us-ascii?Q?IQ8qbNzIqJENmZSATeYUEqd4rtSzYsLiGnPRrUFMHhlep77+ksf22dNUFme1?=
 =?us-ascii?Q?qexXqC5pxiT0XF/wyeqdod/uxUdhFLETi8BmEsO8X3BGzpubgEg3Hur76+CE?=
 =?us-ascii?Q?Qzc5KO4cSyrh7nHG3FTpjyNbu63e/eXBmZuySCrmkg1ApfNzbytJLTkcJ7lX?=
 =?us-ascii?Q?9zh/Wkox0+f5X65qVen/QtquNlwjds2cCu294HhMOmsf1yxRODdSieekvT/S?=
 =?us-ascii?Q?w/aZG7+FP/rfQ/yFLk/fmE/3rPvQg8gzmkXDqVCRdgtgLnat86mJL88qoe0h?=
 =?us-ascii?Q?YdSls1BJMweKZrk/cmj2WM7PZ4O+xV+IWcLEXobMHO5z9K5bIjVrjQn0cYCJ?=
 =?us-ascii?Q?w1/ARxdPTNKOMaBJ50D6oQW2HnLzhqM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D7BB0CF17626372B5823BEF3DE2DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d859c9-7517-41dc-44ac-08def6b82a4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 08:19:57.6841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1MJrRj7eSmW+aPWwuaRNXk35s54tQDH6I7XzJ08ozY4L0bjumjns6iR0BYogvFB969TN/V0p3mRfDkzeoNYuvumdB0t+fw2kvarP9KSTOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 08:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243117

--_000_DU7PPF66507B2D7BB0CF17626372B5823BEF3DE2DU7PPF66507B2D7_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please ignore, I will send v2.

Regards,
Jaipaul Cheernam

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Date: Monday, 10 August 2026 at 10:05
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Upgrade Helper <auh@yoctoproject.org>; Jaipaul Cheernam <jaipaul.cheern=
am@est.tech>
Subject: [PATCH] shadow: upgrade 4.20.0 -> 4.20.2

From: Upgrade Helper <auh@yoctoproject.org>

ChangeLog:
https://github.com/shadow-maint/shadow/releases/tag/4.20.2

Compare log: https://github.com/shadow-maint/shadow/compare/4.20.0...4.20.2

git log --oneline 4.20.0...4.20.2
f8331a33 configure.ac: Ready for 4.20.2
6dbdb68e configure.ac: remove --with-attr option
0182cfc9 subid: Add `<stdint.h>` for `uintmax_t`

Drop:
0001-subid-Add-stdint.h-for-uintmax_t.patch
(fixed upstream)

attr and libbsd are no longer dependencies, remove the related
PACKAGECONFIG entries and lib-shadow-deps bundling.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...001-subid-Add-stdint.h-for-uintmax_t.patch | 43 -------------------
 .../shadow/files/notallylog.patch             | 18 +++++---
 .../{shadow_4.20.0.bb =3D> shadow_4.20.2.bb}    | 11 ++---
 3 files changed, 16 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-subid-Add-stdin=
t.h-for-uintmax_t.patch
 rename meta/recipes-extended/shadow/{shadow_4.20.0.bb =3D> shadow_4.20.2.b=
b} (92%)

diff --git a/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for=
-uintmax_t.patch b/meta/recipes-extended/shadow/files/0001-subid-Add-stdint=
.h-for-uintmax_t.patch
deleted file mode 100644
index 5679be0e61..0000000000
--- a/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for-uintma=
x_t.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ba4419c57b222b0d34a2b933e7ee92914a51b596 Mon Sep 17 00:00:00 2001
-From: ojab <ojab@ojab.ru>
-Date: Wed, 29 Jul 2026 15:07:43 +0000
-Subject: [PATCH] subid: Add `<stdint.h>` for `uintmax_t`
-
-```
-find_new_sub_uids.c:80:27: error: 'uintmax_t' undeclared (first use in thi=
s function)
-find_new_sub_gids.c:80:27: error: 'uintmax_t' undeclared (first use in thi=
s function)
-```
-
-Fixes: 4d800cf2eb9e (2026-04-09; "subid: Add deterministic subid ranges")
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/b=
a4419c57b222b0d34a2b933e7ee92914a51b596]
-Signed-off-by: ojab <ojab@ojab.ru>
----
- lib/find_new_sub_gids.c | 1 +
- lib/find_new_sub_uids.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/lib/find_new_sub_gids.c b/lib/find_new_sub_gids.c
-index 3971ce922e..de514d6b09 100644
---- a/lib/find_new_sub_gids.c
-+++ b/lib/find_new_sub_gids.c
-@@ -8,6 +8,7 @@
-
- #ifdef ENABLE_SUBIDS
-
-+#include <stdint.h>
- #include <stdio.h>
- #include <errno.h>
-
-diff --git a/lib/find_new_sub_uids.c b/lib/find_new_sub_uids.c
-index 65f6815467..f0b4328387 100644
---- a/lib/find_new_sub_uids.c
-+++ b/lib/find_new_sub_uids.c
-@@ -8,6 +8,7 @@
-
- #ifdef ENABLE_SUBIDS
-
-+#include <stdint.h>
- #include <stdio.h>
- #include <errno.h>
-
diff --git a/meta/recipes-extended/shadow/files/notallylog.patch b/meta/rec=
ipes-extended/shadow/files/notallylog.patch
index 94773ace2b..6d6957bbf8 100644
--- a/meta/recipes-extended/shadow/files/notallylog.patch
+++ b/meta/recipes-extended/shadow/files/notallylog.patch
@@ -1,13 +1,21 @@
+From 20dc49519cc177d4c829f4dd5cc277ada24376d7 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 21 Apr 2026 11:30:52 +0100
+Subject: [PATCH] shadow: Disable tallylog execution
+
 We don't want to call /sbin/pam_tally2 in the native tools case so
 disable this function.

 Upstream-Status: Inappropriate [OE cross configuration specific]
+---
+ src/useradd.c | 3 +++
+ 1 file changed, 3 insertions(+)

-Index: shadow-4.19.4/src/useradd.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- shadow-4.19.4.orig/src/useradd.c
-+++ shadow-4.19.4/src/useradd.c
-@@ -2046,6 +2046,9 @@ static void tallylog_reset (const char *
+diff --git a/src/useradd.c b/src/useradd.c
+index 5404b46..78bb70a 100644
+--- a/src/useradd.c
++++ b/src/useradd.c
+@@ -2015,6 +2015,9 @@ static void tallylog_reset (const char *user_name)
         int failed;
         int status;

diff --git a/meta/recipes-extended/shadow/shadow_4.20.0.bb b/meta/recipes-e=
xtended/shadow/shadow_4.20.2.bb
similarity index 92%
rename from meta/recipes-extended/shadow/shadow_4.20.0.bb
rename to meta/recipes-extended/shadow/shadow_4.20.2.bb
index bb247cee9d..2c1092765f 100644
--- a/meta/recipes-extended/shadow/shadow_4.20.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.2.bb
@@ -14,7 +14,7 @@ GITHUB_BASE_URI =3D "https://github.com/shadow-maint/shad=
ow/releases"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', =
'', d)} \
            file://useradd \
-           file://0001-subid-Add-stdint.h-for-uintmax_t.patch \
+           file://login_defs_pam.sed \
            "

 SRC_URI:append:class-target =3D " \
@@ -24,7 +24,7 @@ SRC_URI:append:class-target =3D " \
 SRC_URI:append:class-native =3D " \
            file://notallylog.patch \
            "
-SRC_URI[sha256sum] =3D "5e1eee2709a540ac07e4e5bb0d30f7b97d6ee1e3714ef52704=
7fe2ffb5fdaa5c"
+SRC_URI[sha256sum] =3D "e5016b40541ee6fa02ea3d409547cef6e7eea9b31f0e3482e4=
874f87c1d0c7c5"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

 # Additional Policy files for PAM
@@ -68,12 +68,9 @@ PAM_PLUGINS =3D "libpam-runtime \
                pam-plugin-shells \
                pam-plugin-rootok"

-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'acl audit pam =
selinux', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr'=
, '', d)}"
-PACKAGECONFIG:class-native ??=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'xattr', 'attr', '', d)} libbsd"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'acl audit pam =
selinux', d)}"
 PACKAGECONFIG:class-nativesdk =3D ""
 PACKAGECONFIG[pam] =3D "--with-libpam,--without-libpam,libpam,${PAM_PLUGIN=
S}"
-PACKAGECONFIG[attr] =3D "--with-attr,--without-attr,attr"
 PACKAGECONFIG[acl] =3D "--with-acl,--without-acl,acl"
 PACKAGECONFIG[audit] =3D "--with-audit,--without-audit,audit"
 PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux li=
bsemanage"
@@ -163,8 +160,6 @@ do_install:append:class-native() {
         binaries=3D$(find ${D}${base_bindir}/ ${D}${base_sbindir}/ ${D}${b=
indir}/ ${D}${sbindir}/ -executable -type f)
         chrpath -k -r ${STAGING_DIR_NATIVE}/lib-shadow-deps $binaries
         mkdir -p ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
-        libattr=3D${@bb.utils.contains('DISTRO_FEATURES', 'xattr', "${STAG=
ING_LIBDIR_NATIVE}/libattr.so.*", '', d)}
-        install $libattr ${STAGING_LIBDIR_NATIVE}/libbsd.so.* ${STAGING_LI=
BDIR_NATIVE}/libmd.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
         install ${D}${libdir}/*.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-=
deps/
 }


--_000_DU7PPF66507B2D7BB0CF17626372B5823BEF3DE2DU7PPF66507B2D7_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi,&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Please ignore, I will send v2.&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div>Regards,</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Jaipaul Cheernam</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
<div id=3D"mail-editor-reference-message-container">
<div class=3D"ms-outlook-mobile-reference-message skipProofing">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
</div>
<div style=3D"padding: 3pt 0in 0in; border-width: 1pt medium medium; border=
-style: solid none none; border-color: rgb(181, 196, 223) currentcolor curr=
entcolor;">
<div class=3D"ms-outlook-mobile-reference-message skipProofing" style=3D"te=
xt-align: left; font-family: Aptos; font-size: 12pt; color: black;">
<b>From: </b>Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
<b>Date: </b>Monday, 10 August 2026 at 10:05<br>
<b>To: </b>openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc: </b>Upgrade Helper &lt;auh@yoctoproject.org&gt;; Jaipaul Cheernam &l=
t;jaipaul.cheernam@est.tech&gt;<br>
<b>Subject: </b>[PATCH] shadow: upgrade 4.20.0 -&gt; 4.20.2<br>
<br>
</div>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">From: Upgrade Helper &l=
t;auh@yoctoproject.org&gt;<br>
<br>
ChangeLog:<br>
<a href=3D"https://github.com/shadow-maint/shadow/releases/tag/4.20.2" data=
-outlook-id=3D"275d2de2-05c8-4130-8279-a12c388e2c52">https://github.com/sha=
dow-maint/shadow/releases/tag/4.20.2</a><br>
<br>
Compare log: <a href=3D"https://github.com/shadow-maint/shadow/compare/4.20=
.0...4.20.2" data-outlook-id=3D"b88145c7-5a3e-42fe-b503-8d661a624f4f">
https://github.com/shadow-maint/shadow/compare/4.20.0...4.20.2</a><br>
<br>
git log --oneline 4.20.0...4.20.2<br>
f8331a33 configure.ac: Ready for 4.20.2<br>
6dbdb68e configure.ac: remove --with-attr option<br>
0182cfc9 subid: Add `&lt;stdint.h&gt;` for `uintmax_t`<br>
<br>
Drop:<br>
0001-subid-Add-stdint.h-for-uintmax_t.patch<br>
(fixed upstream)<br>
<br>
attr and libbsd are no longer dependencies, remove the related<br>
PACKAGECONFIG entries and lib-shadow-deps bundling.<br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
&nbsp;...001-subid-Add-stdint.h-for-uintmax_t.patch | 43 ------------------=
-<br>
&nbsp;.../shadow/files/notallylog.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 18 +++++---<br>
&nbsp;.../{shadow_4.20.0.bb =3D&gt; shadow_4.20.2.bb}&nbsp;&nbsp;&nbsp; | 1=
1 ++---<br>
&nbsp;3 files changed, 16 insertions(+), 56 deletions(-)<br>
&nbsp;delete mode 100644 meta/recipes-extended/shadow/files/0001-subid-Add-=
stdint.h-for-uintmax_t.patch<br>
&nbsp;rename meta/recipes-extended/shadow/{shadow_4.20.0.bb =3D&gt; shadow_=
4.20.2.bb} (92%)<br>
<br>
diff --git a/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for=
-uintmax_t.patch b/meta/recipes-extended/shadow/files/0001-subid-Add-stdint=
.h-for-uintmax_t.patch<br>
deleted file mode 100644<br>
index 5679be0e61..0000000000<br>
--- a/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for-uintma=
x_t.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From ba4419c57b222b0d34a2b933e7ee92914a51b596 Mon Sep 17 00:00:00 2001<br>
-From: ojab &lt;ojab@ojab.ru&gt;<br>
-Date: Wed, 29 Jul 2026 15:07:43 +0000<br>
-Subject: [PATCH] subid: Add `&lt;stdint.h&gt;` for `uintmax_t`<br>
-<br>
-```<br>
-find_new_sub_uids.c:80:27: error: 'uintmax_t' undeclared (first use in thi=
s function)<br>
-find_new_sub_gids.c:80:27: error: 'uintmax_t' undeclared (first use in thi=
s function)<br>
-```<br>
-<br>
-Fixes: 4d800cf2eb9e (2026-04-09; &quot;subid: Add deterministic subid rang=
es&quot;)<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/shadow-maint/shad=
ow/commit/ba4419c57b222b0d34a2b933e7ee92914a51b596" data-outlook-id=3D"a688=
1c41-a783-455f-99ea-e16dd949b4b0">https://github.com/shadow-maint/shadow/co=
mmit/ba4419c57b222b0d34a2b933e7ee92914a51b596</a>]<br>
-Signed-off-by: ojab &lt;ojab@ojab.ru&gt;<br>
----<br>
- lib/find_new_sub_gids.c | 1 +<br>
- lib/find_new_sub_uids.c | 1 +<br>
- 2 files changed, 2 insertions(+)<br>
-<br>
-diff --git a/lib/find_new_sub_gids.c b/lib/find_new_sub_gids.c<br>
-index 3971ce922e..de514d6b09 100644<br>
---- a/lib/find_new_sub_gids.c<br>
-+++ b/lib/find_new_sub_gids.c<br>
-@@ -8,6 +8,7 @@<br>
-<br>
- #ifdef ENABLE_SUBIDS<br>
-<br>
-+#include &lt;stdint.h&gt;<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;errno.h&gt;<br>
-<br>
-diff --git a/lib/find_new_sub_uids.c b/lib/find_new_sub_uids.c<br>
-index 65f6815467..f0b4328387 100644<br>
---- a/lib/find_new_sub_uids.c<br>
-+++ b/lib/find_new_sub_uids.c<br>
-@@ -8,6 +8,7 @@<br>
-<br>
- #ifdef ENABLE_SUBIDS<br>
-<br>
-+#include &lt;stdint.h&gt;<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;errno.h&gt;<br>
-<br>
diff --git a/meta/recipes-extended/shadow/files/notallylog.patch b/meta/rec=
ipes-extended/shadow/files/notallylog.patch<br>
index 94773ace2b..6d6957bbf8 100644<br>
--- a/meta/recipes-extended/shadow/files/notallylog.patch<br>
+++ b/meta/recipes-extended/shadow/files/notallylog.patch<br>
@@ -1,13 +1,21 @@<br>
+From 20dc49519cc177d4c829f4dd5cc277ada24376d7 Mon Sep 17 00:00:00 2001<br>
+From: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
+Date: Tue, 21 Apr 2026 11:30:52 +0100<br>
+Subject: [PATCH] shadow: Disable tallylog execution<br>
+<br>
&nbsp;We don't want to call /sbin/pam_tally2 in the native tools case so<br=
>
&nbsp;disable this function.<br>
&nbsp;<br>
&nbsp;Upstream-Status: Inappropriate [OE cross configuration specific]<br>
+---<br>
+ src/useradd.c | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
&nbsp;<br>
-Index: shadow-4.19.4/src/useradd.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- shadow-4.19.4.orig/src/useradd.c<br>
-+++ shadow-4.19.4/src/useradd.c<br>
-@@ -2046,6 +2046,9 @@ static void tallylog_reset (const char *<br>
+diff --git a/src/useradd.c b/src/useradd.c<br>
+index 5404b46..78bb70a 100644<br>
+--- a/src/useradd.c<br>
++++ b/src/useradd.c<br>
+@@ -2015,6 +2015,9 @@ static void tallylog_reset (const char *user_name)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int failed;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int status;<br>
&nbsp;<br>
diff --git a/meta/recipes-extended/shadow/shadow_4.20.0.bb b/meta/recipes-e=
xtended/shadow/shadow_4.20.2.bb<br>
similarity index 92%<br>
rename from meta/recipes-extended/shadow/shadow_4.20.0.bb<br>
rename to meta/recipes-extended/shadow/shadow_4.20.2.bb<br>
index bb247cee9d..2c1092765f 100644<br>
--- a/meta/recipes-extended/shadow/shadow_4.20.0.bb<br>
+++ b/meta/recipes-extended/shadow/shadow_4.20.2.bb<br>
@@ -14,7 +14,7 @@ GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/s=
hadow-maint/shadow/releases" data-outlook-id=3D"81bfc5e4-3b5a-4625-a661-dc3=
71c52937f">https://github.com/shadow-maint/shadow/releases</a>&quot;<br>
&nbsp;SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@bb.ut=
ils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://useradd" data-outlook-id=3D"40bb3ba0-6650-4705-85a0-2a8136098f41=
">
file://useradd</a>&nbsp;\<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-subid-Add-stdint.h-for-uintmax_t.patch" data-outlook-id=3D"6debbb=
9a-6026-4d58-a152-e2356eb82829">
file://0001-subid-Add-stdint.h-for-uintmax_t.patch</a>&nbsp;\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://login_defs_pam.sed" data-outlook-id=3D"4e27b6a5-6a0f-44d1-99d0-82f5cf9=
080e7">
file://login_defs_pam.sed</a>&nbsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;SRC_URI:append:class-target =3D &quot; \<br>
@@ -24,7 +24,7 @@ SRC_URI:append:class-target =3D &quot; \<br>
&nbsp;SRC_URI:append:class-native =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://notallylog.patch" data-outlook-id=3D"1f903497-2c6b-4dd0-bddc-38a=
963c562aa">
file://notallylog.patch</a>&nbsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
-SRC_URI[sha256sum] =3D &quot;5e1eee2709a540ac07e4e5bb0d30f7b97d6ee1e3714ef=
527047fe2ffb5fdaa5c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e5016b40541ee6fa02ea3d409547cef6e7eea9b31f0e3=
482e4874f87c1d0c7c5&quot;<br>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/v?(?P&lt;pver&gt;\d+(\.\d=
+)+)$&quot;<br>
&nbsp;<br>
&nbsp;# Additional Policy files for PAM<br>
@@ -68,12 +68,9 @@ PAM_PLUGINS =3D &quot;libpam-runtime \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; pam-plugin-shells \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; pam-plugin-rootok&quot;<br>
&nbsp;<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter('DISTRO_FEATURES', 'acl audit=
 pam selinux', d)} \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@bb.utils.contains('DISTRO_FEATURES', =
'xattr', 'attr', '', d)}&quot;<br>
-PACKAGECONFIG:class-native ??=3D &quot;${@bb.utils.contains('DISTRO_FEATUR=
ES', 'xattr', 'attr', '', d)} libbsd&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter('DISTRO_FEATURES', 'acl audit=
 pam selinux', d)}&quot;<br>
&nbsp;PACKAGECONFIG:class-nativesdk =3D &quot;&quot;<br>
&nbsp;PACKAGECONFIG[pam] =3D &quot;--with-libpam,--without-libpam,libpam,${=
PAM_PLUGINS}&quot;<br>
-PACKAGECONFIG[attr] =3D &quot;--with-attr,--without-attr,attr&quot;<br>
&nbsp;PACKAGECONFIG[acl] =3D &quot;--with-acl,--without-acl,acl&quot;<br>
&nbsp;PACKAGECONFIG[audit] =3D &quot;--with-audit,--without-audit,audit&quo=
t;<br>
&nbsp;PACKAGECONFIG[selinux] =3D &quot;--with-selinux,--without-selinux,lib=
selinux libsemanage&quot;<br>
@@ -163,8 +160,6 @@ do_install:append:class-native() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; binaries=3D$(find ${D}${ba=
se_bindir}/ ${D}${base_sbindir}/ ${D}${bindir}/ ${D}${sbindir}/ -executable=
 -type f)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chrpath -k -r ${STAGING_DI=
R_NATIVE}/lib-shadow-deps $binaries<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p ${D}${STAGING_DIR=
_NATIVE}/lib-shadow-deps/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libattr=3D${@bb.utils.contains(=
'DISTRO_FEATURES', 'xattr', &quot;${STAGING_LIBDIR_NATIVE}/libattr.so.*&quo=
t;, '', d)}<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install $libattr ${STAGING_LIBD=
IR_NATIVE}/libbsd.so.* ${STAGING_LIBDIR_NATIVE}/libmd.so.* ${D}${STAGING_DI=
R_NATIVE}/lib-shadow-deps/<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install ${D}${libdir}/*.so=
.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/<br>
&nbsp;}<br>
&nbsp;<br>
</div>
</div>
</body>
</html>

--_000_DU7PPF66507B2D7BB0CF17626372B5823BEF3DE2DU7PPF66507B2D7_--

