Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F80CA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 12:18:29 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18651.1791202699376357011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 05:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmw.de header.s=selector1 header.b=IOeqGe+Q;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 52.101.70.13, mailfrom: moritz.haase@bmw.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3TIhAo0z78t9ZuX0ahBfmIgApS5RkmxgAF/IkVqlq4kaWCa2wHPIUaX3gs5DYa83/7OfFyBvzrW3AZ/dg3dzoCr29GFR951KxGXQEjzPQYHWjf/4bFKtbRHcnz4QxE1n7De8LVkYsg+T5vwWS8pc8K7Oc54GckT8xDyDHV22kyuXvzm4ceoNJn79aKgqYNGcxtziPQlm52GH46oDMcMbA7x/cvCLcbBmOuETuRlu3BFWyFzSqLRuh+qG1Mco8lY+X9a/rH1fqQHMkzSKHSyUpbLBKTjpEhSEM6Nv8xATZacxDcWEr/yHzeWxoOzLU8p7SsZovjCcKPz3aH8GjBGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02YCaJeQKSWoqGr0C9qGFXopkeMvuVwO2Tr5MGdwwvI=;
 b=N9x5AVxzIYMp5/bJvJBvKhYeMg5/S6GWuImLXYs7nzA7QEDngbD9EduRdmfzjTlCyWGsPOMrsvMVkyA6KZHdQs6WBNSqEXiXQIZY3fI0RPX7i7CMe/ZKZQkKZHDj3nx/xqunfaJKg3pX7FBCaZGygh1C6hWpabTUnSjw36I/fkkaKG/gd5TWcoeEoNT67tYfP9WMoLXMjyQ0+ihNqWv0T96mr54rkDXwCMwti53Eivak1pr0DAcGFUqtKYpeOaQFEwGyZReA/JgToTbmP2Xchmj5T/37gRkpqY345z1mkiw8bR57PjLIt21cOVppTsEv6PtHAndSIzp6InAcRE4kPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.109.190.43) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bmw.de; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=bmw.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02YCaJeQKSWoqGr0C9qGFXopkeMvuVwO2Tr5MGdwwvI=;
 b=IOeqGe+QgDQ4GvCHQvYx60h25Lg9sLn2OhQOxKwjJUG/rgxBk4eATga/4eDG2nfictoy07Q63ExfwAC6P9zKXrCf8SeikwEF3c2DXfLEHIHForYuXc0a/g5Qt2eh9si1j6SYHb5jGFJ1nPfH+jQHCf5i1tufwKuDdTKOpmypvVQ0Eo2sgg1hKtuwZYr92g0LvE3nNeKzBw+n+xH90R58otU1V76k8l3vYhrYV5p+LI2kOiTdbFVYDdYT6GgKE0ug98ZJflA4sFOjlHHmwIYBio2YbYR/UDBgQ1D/hx1Wf1nj7vIN77jwQSTEGVDLLNYW1A2NmZwDX2U4yhMX/oW/JA==
Received: from PA7P264CA0217.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:374::18)
 by AS8PR09MB4664.eurprd09.prod.outlook.com (2603:10a6:20b:295::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 12:18:11 +0000
Received: from MI3PEPF00008499.eurprd03.prod.outlook.com
 (2603:10a6:102:374:cafe::55) by PA7P264CA0217.outlook.office365.com
 (2603:10a6:102:374::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 12:18:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.109.190.43) smtp.mailfrom=bmw.de; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bmw.de;
Received-SPF: Pass (protection.outlook.com: domain of bmw.de designates
 192.109.190.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.109.190.43; helo=smtpedge.bmwgroup.net; pr=E
Received: from smtpedge.bmwgroup.net (192.109.190.43) by
 MI3PEPF00008499.mail.protection.outlook.com (10.167.240.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 12:18:11 +0000
Received: from smucmp21a.europe.bmw.corp (10.100.172.92) by
 smtpedge.bmwgroup.net (192.109.190.43) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 14:18:05 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp21a.europe.bmw.corp (10.100.172.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 14:18:05 +0200
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.4.3 -> 4.4.4
Date: Mon, 5 Oct 2026 14:17:38 +0200
Message-ID: <20261005121738.27089-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.85.215]
X-ClientProxiedBy: smucmp19a.europe.bmw.corp (10.30.13.167) To
 smucmp21a.europe.bmw.corp (10.100.172.92)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008499:EE_|AS8PR09MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: 645563a1-400e-43b7-9a5c-08df22dab934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|19092799006|36860700016|23010399003|376014|13003099007|11063799006|10067099003|56012099006|6133799003|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WEeSo8YLQtXgCbVMd8/5PtuSpTcq7gXbuNlUpZ81FmAbVYObFVHpkNqND99skPyzAWWgoTQIevy2C1TSV9WDzYJwerYp+O9BN5NgYeeub4zZGT+n7aux/snIf1Rtp046B8FI8RWhI+KyPM9OcieJuJuF41xdwYq80zzpZS3yhN8xU6tZroqQ7AgY9xoionf06b7jcLBq1MbiGjJIlbaQGT+Dvmc3S0P885fhwn9MRBaJz1Dm37naN9zr4hOVkjIKq49A/VbmI5becU5U6jGhrFcl1z8Fu14QOGOgyIaDw7zusqtCdmWJHGIIdKkbivA78HNBRvzvy8Kp0FQeEuUxSJe2RkTT9r7iClEl8RAfk+yKBhmPc3p0SKn3zI4XIwtjH7QXwo8Kdt9wDZqz14G/oOWz0PioRVtu8yKqFb+YBtLGGEDF5GFSvJPqt0qrlb753+dyOmQIe5+I+mTdHtHbrIZRn9DJyrfcqDhpVSonI5A5eRMLkMnUKBaSASHcpUpbFExzYX8dAt9wq22fLbKsoVUHErUC0C6+L5M4k1LlnLYFEoJ+ty00ZQVwYEELBoVSEI53WsD0L68jsmuqakuCUxr29bCOt0iLUMlDm/mRIKKJrnlWKWOaCDVQznxo4EtZvIjMQJx7keDdHLxeMdhuSA==
X-Forefront-Antispam-Report: 
	CIP:192.109.190.43;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpedge.bmwgroup.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(19092799006)(36860700016)(23010399003)(376014)(13003099007)(11063799006)(10067099003)(56012099006)(6133799003)(12006099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	N+2X8jjNAcSVdgEaFNkCvHh/IDpKewqfhHyoMJYP8ukXUc53HcgE6aHFeo5uK4bLI56Cg7KU8ALu9L3VuCdKz/H56isDaoFapVkC2/S8FsCqZs7Erqixo0bU34yUTi2nf650SmINhw9HehZ1ksPgE8D5USxQTBLj96bLFNikfebP8U85ClPg6vEQorvONYu5FY7nI6/fkvLmX9R6Mq5OCELdGc+STErcNOKZDaLf/VkaRwRGwrL90o4P6r33NXWgguMu8JPjmzRQ4C2uk3p+LljI4ilYcw9LB+nOtaikaLSVPTnXMlOOcpR2NqzfolvRi0kub4ibCPtRopYTjUPsGcPiQ2kD9NqdliFOQfmNT68SQgqzjMO2SAYTJHTgq+djAges1ryBaQgakBRjr/5FO+iUBE6G7vHQwGbCMsz2pp18RlNiUl/Ind8LKOIeWtj9
X-OriginatorOrg: bmw.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:18:11.4553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 645563a1-400e-43b7-9a5c-08df22dab934
X-MS-Exchange-CrossTenant-Id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ce849bab-cc1c-465b-b62e-18f07c9ac198;Ip=[192.109.190.43];Helo=[smtpedge.bmwgroup.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008499.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB4664
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 12:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247240

According to the release notes at [0]:

    This version made no changes to documented features or interfaces. Some
    implementation updates were made to support ecosystem changes and/or fi=
x
    regressions.

[0]: https://cmake.org/cmake/help/v4.4/release/4.4.html#id4

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../cmake/{cmake-native_4.4.3.bb =3D> cmake-native_4.4.4.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.3.bb =3D> cmake_4.4.4.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.3.bb =3D> cmake-nativ=
e_4.4.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.3.bb =3D> cmake_4.4.4.bb} (1=
00%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.3.bb b/meta/recip=
es-devtools/cmake/cmake-native_4.4.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/=
cmake/cmake.inc
index b6b10371ceab6c7a85e4eb7abe9c97b2ee44b52c..4c73d99fcf0e07cceefeb27c879=
d26ef0f172151 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split=
('.')[0:2])}"
 SRC_URI =3D "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.t=
ar.gz \
            "
=20
-SRC_URI[sha256sum] =3D "c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e1=
6e1d413aa892f0"
+SRC_URI[sha256sum] =3D "bd24c30d80a7744ae84b845ff080cc8453b06c622ef0106656=
4108e9cefc44cf"
=20
 UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.3.bb b/meta/recipes-devt=
ools/cmake/cmake_4.4.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.3.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.4.bb

