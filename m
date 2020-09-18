Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.116])
 by mx.groups.io with SMTP id smtpd.web11.9294.1600422624197255608
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 02:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@sigmatek.at header.s=selector2 header.b=phOb45RG;
 spf=pass (domain: sigmatek.at, ip: 40.107.1.116, mailfrom: christian.perkonig@sigmatek.at)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYul69zp5jp7BRenjfA1ZEIKn7qh9J0MsOe4t6ioGqwcULGwpuQ1DfthXySwxINYwI9DN8djCFmpGMv5mLsPlyBqrDyQ4uJJ8ZU5JjspIKt/MmZoi0ZUojr4WMYoJBWNF9ujbAxXq/nGEvyPRPkD4Ac7AhEXQ9Cqxxc3axPhoQ7yo2yFtRWriCiJODQQKrFl9PxuSSlUL6bA1bwqu7/ZKGf0H2oCZ2HBV/yb8WsUZwZQl+n1yGhDJPVzVeEj8JhAHX99PE5o/+LO7gyPSFut+RX8gzTDYvZ3v/DLGECgX0+ILLA3wgGXzjvF5BFYiUi6Hg2vJFSCTFioR4zoLImk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XprAq5zXPODuk0AtMaY9LxY1ErCD/A+A4/yF3NIpwzU=;
 b=mtG0eT8A+lpKfhRFBAurvmUTxj1OpDaE4v3zd083po9VBf98wXbxngLuRdkgxSWXb+yc6y6Cz8eMFrJ2uD8mPbZl9FVw3ao1olre0lU83tNxuwIM5NFjOGAMCBgHHTyn+BbEMPdxGwextQxRe5R4pelMQlhJiXdywu1N7/Mr7KgRAII/+zEAKfdSNmS+KhqpEcQ2QHXgS2cedUOqUxaDK9NQ/CnrRAvS60lhyGI0TJviuHxpytdeteHfwXEz3K56eSspHkqweGH5nQm26qTHIinUcrWUc4/um6/Ai70AuIr8M2FzTcC1ddqVH53sEMkmzldEAuEQnJ6X876c1rMlNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sigmatek.at; dmarc=pass action=none header.from=sigmatek.at;
 dkim=pass header.d=sigmatek.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigmatek.at;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XprAq5zXPODuk0AtMaY9LxY1ErCD/A+A4/yF3NIpwzU=;
 b=phOb45RGQZ6dAGIkZjMe4m0YwshXYZVrIogm5LVbRpr5L13Mg6C9hwAOrelWmHYVnWkQacPKQDTlvqyqabG8hMP1O/bozslHYGO2FUAMWyuMjWBrEiPI4HWCCLsxdEtsxWGy+qhJoeuL5c3pOmWgROlGAnm+WZ7XFLbNLHsowvI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=sigmatek.at;
Received: from AM0PR08MB3443.eurprd08.prod.outlook.com (2603:10a6:208:d4::14)
 by AM0PR08MB3859.eurprd08.prod.outlook.com (2603:10a6:208:107::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Fri, 18 Sep
 2020 09:50:21 +0000
Received: from AM0PR08MB3443.eurprd08.prod.outlook.com
 ([fe80::2427:aa74:d67d:7072]) by AM0PR08MB3443.eurprd08.prod.outlook.com
 ([fe80::2427:aa74:d67d:7072%5]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 09:50:21 +0000
From: christian.perkonig@sigmatek.at
To: openembedded-core@lists.openembedded.org
CC: Christian Perkonig <christian.perkonig@sigmatek.at>
Subject: [PATCH 1/2] meson: remove shell wrapper for meson
Date: Fri, 18 Sep 2020 11:50:03 +0200
Message-ID: <20200918095004.34894-1-christian.perkonig@sigmatek.at>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: VI1PR07CA0167.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::15) To AM0PR08MB3443.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::14)
Return-Path: christian.perkonig@sigmatek.at
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from LWIUB005.wien.sigaut.org (217.175.200.226) by VI1PR07CA0167.eurprd07.prod.outlook.com (2603:10a6:802:3e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.7 via Frontend Transport; Fri, 18 Sep 2020 09:50:21 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [217.175.200.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01cdebc7-51e1-45d6-73c4-08d85bb84220
X-MS-TrafficTypeDiagnostic: AM0PR08MB3859:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3859B5240325625292A253CC963F0@AM0PR08MB3859.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	04xHGjwxurtbNpkqpPRP6L+YYUBuWdo+81h8OH/yTZDef4eIempf9Wj4QXnYs7UG5izGE7quKRpR/PRkBr2Lhs/SAzAPpfHRfT87xQ2LRhm5i5utm7AewDZ7V5lZvImZSMpdYsuIoSGavCF71oyZ3QlOgzbXD0TOXHevTN6SgGWO3FVki0wQ0pAzlaGnVf1DzT1TCUYvKgNRvX8triAZHh7qame6PrMLwEuXlZTJW45+G5CSv+ggYTWKtI58IzV+HXIq+3PuPn4Spq661VBBqfS4zlcPejruq0x7GqIuTCfFBK+4Dk103qbjIy/r/K1d7bjC2Pj+GrxVy1JfNkwiWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3443.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(376002)(346002)(396003)(136003)(6916009)(316002)(2616005)(86362001)(44832011)(5660300002)(956004)(36756003)(66946007)(52116002)(6666004)(8676002)(1076003)(107886003)(4326008)(66556008)(66476007)(6486002)(478600001)(6506007)(8936002)(16526019)(26005)(83380400001)(186003)(2906002)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	QoMGv5mOc8bFEHcgD1D85wuttw2ruOdsZyIK2LTUb+7oPlnyzL5r5JCn8zkiCkzOfb8RmDjvbkCQjZSBFO0mUbzUC7DnMqYKDHohGX4aZC8fnN+RG6BB3LYwSRi4zdp7RgTs1N7LZzwwrKHQDhZpnUlQ63rLAm0YVJmQBpfO/YH4kGNUMCwYGDB546LHE9YYO8HLPxxYDAzwFsqHnG7Mv6WemX8DqAs1TgXAhon583BSKJAx2g5m+W7V/5Mkx3ecYy9+dqzuYPzj0OaQys3UvHbD2WAPZh9TrY+/CMhUJMojYtFqJL15kRVgbIl5ej9ZH3AH/FaLnV/sFQ5v4sJcul70RVjQiTuExJiLUCskasZHHC2EOfIf41aygcL1RUbgIi6WEgNRl39hFymahzmo4vIjqX9ZDeCLr8qwEe8jMpcQHJcFvX1TcFZxhh4DasIuSf+ZLlyocEzgnN0aGnQ+frkZIqU0KVXYDFQy/8Ziw/5YBpjZvNRNl23Oo5R2vhFX4y3c+ENJIQFtsTI0axaMP+iTWMS69Em6I3qkCsFlkyArpqyBlnlRNoqURqusi8zEMl7q8+3FMRFQfvDEv9RLDZYiKLz6dQluvqBC5Zwj7s/qd8BSZfrqnM+OiEZFribR7xQrHKrW5Mph94f5Qr8fMQ==
X-OriginatorOrg: sigmatek.at
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cdebc7-51e1-45d6-73c4-08d85bb84220
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3443.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 09:50:21.5627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bcb1d87a-d2bc-486e-a62b-9ac9c746bc1b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGMZY5S1WpYrjQJIZUE0DYCBw+q4paXtty5fQT/wzaue3aKHErxnNgFWCkuiY39zoTls951kMe4xdgo1OuGhre+Mviwv4X3ZfHkllClI2tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3859
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The nativesdk-meson creates a shell wrapper which adds cross-file option to=
 the meson command. This option causes problems because it is only uses for=
 the setup command. If you use meson for testing like 'meson test' the cros=
s-file option is discarded.

Signed-off-by: Christian Perkonig <christian.perkonig@sigmatek.at>
---
 meta/recipes-devtools/meson/meson/meson-wrapper    | 14 --------------
 .../meson/nativesdk-meson_0.55.1.bb                |  6 +-----
 2 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100755 meta/recipes-devtools/meson/meson/meson-wrapper

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes=
-devtools/meson/meson/meson-wrapper
deleted file mode 100755
index d4ffe60f9a..0000000000
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
-    echo "OECORE_NATIVE_SYSROOT not set; are you in a Yocto SDK environmen=
t?" >&2
-fi
-
-# If these are set to a cross-compile path, meson will get confused and tr=
y to
-# use them as native tools. Unset them to prevent this, as all the cross-c=
ompile
-# config is already in meson.cross.
-unset CC CXX CPP LD AR NM STRIP
-
-exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFI=
X}meson.cross" \
-     "$@"
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb b/meta/r=
ecipes-devtools/meson/nativesdk-meson_0.55.1.bb
index 67add2c25e..3c8c4fbc37 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
@@ -3,8 +3,7 @@ include meson.inc
 inherit nativesdk
 inherit siteinfo
=20
-SRC_URI +=3D "file://meson-setup.py \
-            file://meson-wrapper"
+SRC_URI +=3D "file://meson-setup.py"=20
=20
 def meson_endian(prefix, d):
     arch, os =3D d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
@@ -51,9 +50,6 @@ EOF
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
     install -m 0755 ${WORKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/post-re=
locate-setup.d/
=20
-    # We need to wrap the real meson with a thin env setup wrapper.
-    mv ${D}${bindir}/meson ${D}${bindir}/meson.real
-    install -m 0755 ${WORKDIR}/meson-wrapper ${D}${bindir}/meson
 }
=20
 RDEPENDS_${PN} +=3D "\
--=20
2.25.1

