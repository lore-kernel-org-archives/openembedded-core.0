Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E180EFD5F63
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:47:40 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98131.1775618451676790121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kjhQ5NTK;
 spf=pass (domain: axis.com, ip: 52.101.69.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H37htx3U7BQYxJRCefK/Zxa+hH7bf2qXtt2RBQAAxSJNF2hJF0iK1hqABNAseyOTUnoxOeJcKr75Sg+x0QQCpgn/8d470CQ4d4QTLia3gTr2303LmMdxwvcA3Mixeua+h5NTHQwVL/w1bK2OlhSEleYRGKZWphXIGQHnQT5a3clHlIhaFY9aXDHm8fv9C9JbkSqIZdyjv2//iyuPMCVsWS6rgWl500VmFlNrpLgIK7pvJi1L+Tiy0AGqNGl+/ulnEIuR1MpBCYmDpdqtYggj62oAVPC/dfrJ1i5S08N9krUctE7NiSkg6zN8eL23Em/2tSdAFFWG8d5IBnNgYlxhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgK+EF78vBBSNwNl5euAVSt9Iic+fluzrDzSDdNkLhU=;
 b=H7Gtubc6ud2YbhlhTwp3hXknkOTzzWMoYLQi7HiiTC0c/WLpmAPiOocWv6vuXijJ+NkDSQeBZJMOUf5Ye7/R/EMtONRNTghPnHtAMiJZVJjKYAo3v2UmhYGEuacsOHTw1IvSwg1nfoVgovoRKlxhR/a+Q6JjGyfrpgCqpqPvqpb4b2As2j9jNp4KCqAH9VCHrFU9bhWNMV3Oadvg2B8/njqWgwD5QfbOrwBk6AcAIPWBWml/xG0A6AVgELw4VgrIWejGJfr0J+0tf12Y/P9K1uaKAqSIu+faMdCw1b7nrmLQvLTclAzdXtWs9SY9C6+Xj+d11QxqeR7j3vPORb4iGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgK+EF78vBBSNwNl5euAVSt9Iic+fluzrDzSDdNkLhU=;
 b=kjhQ5NTKIK2rt/WhPCMNWMtqrgX2YdZdSdjZwkgIhZ9tOajQhMWdPWN2cJM6opCfsaFWWoriUpJN32isAW50vwr5ndhsZl6IbkqkYJLTSlJNGbMqGzwWjUaEM3+6UMs+TrQyvvQxRn2eGjDLsg/4AZLBCCwPKhHzn/yT0GNj8so=
Received: from DU2PR04CA0078.eurprd04.prod.outlook.com (2603:10a6:10:232::23)
 by GV1PR02MB8787.eurprd02.prod.outlook.com (2603:10a6:150:a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 03:20:44 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::c8) by DU2PR04CA0078.outlook.office365.com
 (2603:10a6:10:232::23) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 03:20:44 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 05:20:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6F09B1B0B
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 6275C1205FC; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 04/10] gstreamer1.0-plugins-bad: upgrade 1.26.9 -> 1.28.0
Date: Wed, 8 Apr 2026 05:20:17 +0200
Message-ID: <20260408032023.1810147-4-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408032023.1810147-1-pkj@axis.com>
References: <20260408032023.1810147-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|GV1PR02MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: eade8fd9-1e0c-4bab-4692-08de951dd258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	aBAQ+KIb/KKBxoydX9TprB8jHWQSZTcwkxCz3Zt2gtxkc37Qi+3c09KDmsUCe5akWmfqTI6PABvI4A0l6syh/RovkgabO8nZHJbeW0wWkCcHSrgdLsPLosY1Ym+XY0JTyEkxsCjPJ/LVXPuWMHlLrr3DBeSfJnotykLL/Pc1wqKL2xMiMDqk7A0NIVmHJM5j0TFLmPtt0VnNuqmHkJTLn72JAXDJhd4g3NXVcBHWcPltoHoNdzOg2Jo9Q2USVD10/aGnAFW5y/f77Fa0xABItNuZSYoG0MlchiuaAD7ZkYtkana2DZwI9MkFu8pRAk0/amQ0Yz44JBtk7fJglOGtScgdyveKGtmWF4hTDzv8hWOqLKQcOthZZ02LkN2X0+KKfUswxc4RqAX4UH28OfZ6P0x1yX6r4F/ILNNOUWPZJKNIt7XxmWNeUzokTme5A+Se/UtsYGvV1u83lXM8YG9sJFEdkmMoWMiD5P20pqGwr5LjDOKa7w5TWItrulZmhTVCFOzgRRT6jP7uIupL6xhY/hmM4IQ5pcE8HtffXDYaUUqR9cyg3SvgEyka7WZ2GZn6fhRbIBXwssJUlsuI56fqojM5+TU8ag+CWLso/1L0R12MiSb7FpvXGQM83vgVk+qzdq/sQfQCqQQ8G1fVWms8OSuqgiCPLdw+fb8txryPjidPkfn3U/n7YFgkGqyfEEY+sxLqfuNluTiZrydYqhzxxnY4FKJAFr3Aqy1dtQDvkfM=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OSXgB8Z5V0iUYL91I7qSLgK+cauOI9JBs8JEsXdtk6PIadYQ7i8o/x79Gi+hzUz8u05vWu0z6VR4PA0qhZ9mMIgnuq6QAPeOmhLeeNtlb5rqZenlbfp/7MK/rMcyicm6qDYF1ih+eQ2dAmLxa21MrFD/mym53MuN3V3zEnJ8wa/lPSNH0P/B9zw20v2uIXXSFME2tYqYcOoaXMlJkumWzf28G9l0L57hEms3C7Uz3BBw8nMPNaBiCQb7s3xBCYz92HwBI2BfVxrG8gCzOMFNK2BRsduOGS4oIr43dq1fZhORZg/kyIHhRd573dT+dkq0xrP+/HV3AMddydu6bkfKtzI0n6J0zIdztLM1xyiIj4Vi6pXe01fDX6OPqIV/FwhBynlP3dk+/vPhLu3zQmDDSHC+D3U0yH2fDbW8vHeMXjyme9LxmWmDie4JkmI5sH45
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:20:44.8298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eade8fd9-1e0c-4bab-4692-08de951dd258
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8787
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234803

From: Wang Mingyu <wangmy@fujitsu.com>

* The closedcaption plugin no longer depends on cairo and pango.
* Explicitly disable new plugins that require external dependencies:
  * hip
  * mpeghdec
  * tflite
  * tflite-edgetpu
  * tflite-vsi
  * vmaf
  * wpe2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Removed dependencies from closedcaption PACKAGECONFIG,
         and disabled new plugins that require external dependencies.

 ...d_1.26.9.bb =3D> gstreamer1.0-plugins-bad_1.28.0.bb} | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.9.=
bb =3D> gstreamer1.0-plugins-bad_1.28.0.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
6.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.=
bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26=
.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0=
.bb
index 4a9cb37dd8..fcab4594ad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-pl=
ugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-bui=
l.patch \
            "
-SRC_URI[sha256sum] =3D "a96bfb68c53a7c9ab1ae279eac7c101f4204fb5c0e4729683b=
2be64261707446"
+SRC_URI[sha256sum] =3D "32d825041e5775fc9bf9e8c38e3a5c46c1441eee67f8112572=
450a9c23c835f0"
=20
 S =3D "${UNPACKDIR}/gst-plugins-bad-${PV}"
=20
@@ -38,7 +38,7 @@ PACKAGECONFIG[assrender]       =3D "-Dassrender=3Denabled=
,-Dassrender=3Ddisabled,libas
 PACKAGECONFIG[avtp]            =3D "-Davtp=3Denabled,-Davtp=3Ddisabled,lib=
avtp"
 PACKAGECONFIG[bluez]           =3D "-Dbluez=3Denabled,-Dbluez=3Ddisabled,b=
luez5"
 PACKAGECONFIG[bz2]             =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabled,bzip2=
"
-PACKAGECONFIG[closedcaption]   =3D "-Dclosedcaption=3Denabled,-Dclosedcapt=
ion=3Ddisabled,pango cairo"
+PACKAGECONFIG[closedcaption]   =3D "-Dclosedcaption=3Denabled,-Dclosedcapt=
ion=3Ddisabled,"
 PACKAGECONFIG[curl]            =3D "-Dcurl=3Denabled,-Dcurl=3Ddisabled,cur=
l"
 PACKAGECONFIG[dash]            =3D "-Ddash=3Denabled,-Ddash=3Ddisabled,lib=
xml2"
 PACKAGECONFIG[dc1394]          =3D "-Ddc1394=3Denabled,-Ddc1394=3Ddisabled=
,libdc1394"
@@ -125,6 +125,7 @@ EXTRA_OEMESON +=3D " \
     -Dgme=3Ddisabled \
     -Dgs=3Ddisabled \
     -Dgsm=3Ddisabled \
+    -Dhip=3Ddisabled \
     -Diqa=3Ddisabled \
     -Dladspa=3Ddisabled \
     -Dldac=3Ddisabled \
@@ -133,6 +134,7 @@ EXTRA_OEMESON +=3D " \
     -Dmediafoundation=3Ddisabled \
     -Dmicrodns=3Ddisabled \
     -Dmpeg2enc=3Ddisabled \
+    -Dmpeghdec=3Ddisabled \
     -Dmplex=3Ddisabled \
     -Dmusepack=3Ddisabled \
     -Dnvcodec=3Ddisabled \
@@ -146,12 +148,17 @@ EXTRA_OEMESON +=3D " \
     -Dspandsp=3Ddisabled \
     -Dsvthevcenc=3Ddisabled \
     -Dteletext=3Ddisabled \
+    -Dtflite=3Ddisabled \
+    -Dtflite-edgetpu=3Ddisabled \
+    -Dtflite-vsi=3Ddisabled \
+    -Dvmaf=3Ddisabled \
     -Dwasapi=3Ddisabled \
     -Dwasapi2=3Ddisabled \
     -Dwildmidi=3Ddisabled \
     -Dwinks=3Ddisabled \
     -Dwinscreencap=3Ddisabled \
     -Dwpe=3Ddisabled \
+    -Dwpe2=3Ddisabled \
     -Dzxing=3Ddisabled \
     -Dlcevcdecoder=3Ddisabled \
     -Dlcevcencoder=3Ddisabled \

