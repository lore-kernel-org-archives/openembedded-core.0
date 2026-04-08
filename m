Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E9F105D99C
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:21:20 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98300.1775618448982529844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kVkTXH9a;
 spf=pass (domain: axis.com, ip: 40.107.130.37, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqGv8mHsW/vjUJZ7rjHgwQca12mYMayf4tRxP+j+fXt+F0FF7cW5d0WdGy1hzDodl6AdIDhAu/LG41DMbATMf2oOOWdzk9E+rOt5ocxTrUVi9SIzcN/oeR5hTOQLxa00+E2GzlR8+9EhgquvqqjGukEVu6hxc8hy8InXKNJNS6poU4DOkTeZ/lL63QXj7yiyNlhH2x3ojW4PIx9Gsr6hgeBc595Z7SXn1IFZ7mc2mhx046tpLRHpXpMDSLtZBynwVkgfeMj1EnkgJ5FmxVhjwsGcUPhYz0M6nO/aNdfWETEppY00EqgNB5Q9W56HVP/Tc1KVFe+qB12QGN0gz67CMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg4ooNr00LS3+AsetR+3isKZQ1G2aCMz955L/Gp/Im4=;
 b=O+KPZgj6T8aZX4XdSOMZ3mAuaZ8thUuIbFIptuxb3dTwmV8df0BWb9UpllPYQIv1ZJQCpsQJfi+tecgejUfZjUijuzbptToErU1fM58uPy6z5zY0ujfA9fRLZo3YYsWRLPc7KKzkPDQdJHowX5YTVyMscE909mekXVOLY+podd8il4ySOwce/xR99ccjvr8lfW0cR/AEVXgS5cTMEX8WUNfWW5AwfyqG7PXWFAnzOLBe01awS55pItRfZwb2GWJ7NlIbJ/QBhkzaMi2rKhpO039C6wwxpLTBGeEGU0PV1EeoFGZ6o/5fl9PF23/5R6oMXYqTXru0U5oV8THVjwjRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yg4ooNr00LS3+AsetR+3isKZQ1G2aCMz955L/Gp/Im4=;
 b=kVkTXH9aIOAqyKYTmVgllJqTr4chqpm0BWIy+svGJenD6Ndd89jr+YzrWuiNgTP63G280CZyst1thSoSJHrFueGPkzFH7f6x7L/rengGngKOCXCZYaH5Usfxr0xqd02k1LOGf19KJmxCmxCOxX3a8ZFJWJxostzA41U90tOSXmE=
Received: from DU2PR04CA0076.eurprd04.prod.outlook.com (2603:10a6:10:232::21)
 by AS8PR02MB7045.eurprd02.prod.outlook.com (2603:10a6:20b:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 03:20:44 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::7c) by DU2PR04CA0076.outlook.office365.com
 (2603:10a6:10:232::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 03:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 03:20:43 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 05:20:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 72E7A1B33
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 664B41205FC; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 05/10] gstreamer1.0-plugins-base: upgrade 1.26.9 -> 1.28.0
Date: Wed, 8 Apr 2026 05:20:18 +0200
Message-ID: <20260408032023.1810147-5-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408032023.1810147-1-pkj@axis.com>
References: <20260408032023.1810147-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|AS8PR02MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e034d8-590d-4566-f336-08de951dd1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	MJJYPx8KvLthLqhN96fgC8vGStW7KQJjnh+zLUzaD7CQGZwUGH8flqkilda5fd+pZeMYdNKO+QIand8xScBXJOm0YVvd1N0XPLVZV3VmTY8tlaY7CPrDUWO9Sa9uGQk9OMoDMc2CDVKo0eM2GeJTTLDe/PBT/xqrASw2+wkqoBZba96CUxWU7zRkFf1XzBXgjxzquK2nr44nHLg9EjSwL1ttcRT5MmGZfK1ZMBvfO+a63a1U5lThYxG0gk2OZ+un3dxn9KqIZy9n4lYfHceVrhdCDBwzopWr2RrvBu58NUjPWjDoFiA+KFPxQ3GQvC7efetdK7aZE0r9OY8j+A0p/XaXePRl4OLRWnx1K2o/30QSFgvQ4pmh6mkhtTZX7sOUmd5PdZfQxzR7aTLy4cHYk70uyJPta6jK9l3Yi5VYVaxMOqXQMt+2DUWAtG1k+UPNqGprudqhVUUsBQZbrAuc2CAuLv6pKNjpw1pyrZW5tAE5Wq1l0JHpm2Nn5Tm2kHhBu0FsieHR2cDVr5GtFqPiMPhKOdcCYwzPRaCBXLvuFpwgbcwwtzcoxaMcFrQp4vkrEU1BNlTJWFD0vCd7FBfKkkZ71jlLAhT/w/b9bnzu88O9o+yjDlhjgYDR7+zP9Ee+f11Z24KwQODt7XsfMEbAcVU94+NS8p3u4zv5MIj9Dg3Ssi6xHUZ1i+s6P/gIJDhS6I+QB9NW8E9tVFJ4VZAS9gzxuRsL+fAcyrk2Hn7z0Fw=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	564Ve/Fu5Xz2KCvLy9XM13dH/1kWiwGWl++T9k2Ha3lUpa/UerU6VAKtp4S67Q3K9oI72dz+AktM/KmDEws5H4xshit40G5gxGEj+xMRif4rKh1sUugAD9G7lTEH0cKTcesbdn9sFR3koXDgt6Q4AY73flpFycLN3Q8o+9KwFO2HEGp8qq9kJU4i15t7NM9m1CStUnpf31R4adhXbt+b0mQpyzCoDKo/jPca/pfglLX0pR0KtInDxyhsIjwTlcM7bxXysr3qLT4pH2mo1KyVnPpbonhJEE1MZQzivVtkrtDHofU1nR+oa0RopDqojUGXdlzdxoWTjMYQh32Vh4HpvbuA5FP09/mwHYALmt466MN0g9ccWJgac3K993LMVS53Crvlj+H2gj66qCymOTDxrP3SkhhvOHas6thmeT6ovXgWGdoqiF6uTA8l4iuywwbv
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:20:43.7450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e034d8-590d-4566-f336-08de951dd1b2
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234797

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 ...ugins-base_1.26.9.bb =3D> gstreamer1.0-plugins-base_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.9=
.bb =3D> gstreamer1.0-plugins-base_1.28.0.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.=
26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.=
0.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2=
6.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.=
0.bb
index 74b6f2308d..f0a3db578a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-pl=
ugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] =3D "11db4ec9ae5be2194ff8ccf2b5fecdc069252fe4416921b083=
a921ef71dd000a"
+SRC_URI[sha256sum] =3D "eace79d63bd2edeb2048777ea9f432d8b6e7336e656cbc20da=
450f6235758b31"
=20
 S =3D "${UNPACKDIR}/gst-plugins-base-${PV}"
=20

