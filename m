Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B405C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 08:17:34 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web11.1016.1643012252998455338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 00:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=A1DkwpaW;
 spf=pass (domain: siemens.com, ip: 40.107.7.74,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7PZkvFL0FZdWLjr5DGkrnCwRbto3N0ZLE97voUqrhVBcXBXLYha3h3ICSKKhF6Sc418X6ZJYduPDla2S8ZFT02ZGUn/Go7sxFbpBlLUNSvENXmWaYtd0B0a7JO1AuUd9eYnQuaddzROEBIkTUoy5yS/+d9+Np3yjqQG+9f22/D4PrEg8HV0+9w5+gfD5oelJPYUWJMWxushTuv3Uu1giIOH3e9hba4sH7UftMx3XUptnS5SZauIxhaFXXfRhIVAybsDeBIQipgUWZncQ8a20oJf0A07IXT0mogv0GyvYl8jdog8u4YvIZeIAbgwpjr9G932Hh0g4BVl3a1NuPdsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrlJwr0AWzQSTp5egKxCdVYtfJUhJv6tbXXmCpzREj8=;
 b=n3d+Fc3LcQThEGTpNKWT6GUcMC1dM9IrZi/AhIjJwSPvghUjgcwGLCb1ASPXNDRLpkak8vPD4SzOv0/ov88tlP4Nbc1V+NhKnslAKhmq/5eXfbwR9DD3Sjxl7UnQWPoNy/wUrzSEd/CcvvwdAz2E0dFU/PUZJcVRKtGp0yial0p5Wor440Jl08EGP0Q4gvmf5Wghm8RTu7TAjCq3sSzSyofS1ugYFjurQkNTlvOplENixbq2Vf8nUxGAE2AQ484HRM2GSrCUQHxfiVOmPwNxFFQ/DO/jZ/u3ufr5ehlKm7FlhxSiBDDFk0l5L50JqeGdyTWKWBY3gTVoTg0mJ5MXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrlJwr0AWzQSTp5egKxCdVYtfJUhJv6tbXXmCpzREj8=;
 b=A1DkwpaWCsH4mlHH23y0Q0pI4hVIXNJc6qt09SX2EsTiOGiKRnnF3uGR+skakgrCN8haRbMPzkoRksGnLb6SA33lWj93FaDHoJFfenzBuDKmolERmH6CxYDy5YvzIiIK7upyHyypZtrdHWvXyQ5amiWC7z8DQF6hcQwFRSVfOut1FneL74hY0K5qlXV8VHJRJ4v985Wy7rAgfgg2pIUSHbclzl+XmqgPmOtok3H4zLDZDzLfr2oqgdOVHI2Dj9i8MA2dbL6g2IbFo441TDb9Rtb3S/BX8kh4jcJlCO/Nk4H15gSBkAaC4mnkjf5GVdyIQyBOOwN9NpDaoY4+QxlhPQ==
Received: from DB9PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:10:1d9::6)
 by AM7PR10MB3159.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 08:17:30 +0000
Received: from DB5EUR01FT054.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::35) by DB9PR02CA0001.outlook.office365.com
 (2603:10a6:10:1d9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17 via Frontend
 Transport; Mon, 24 Jan 2022 08:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 DB5EUR01FT054.mail.protection.outlook.com (10.152.5.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 08:17:29 +0000
Received: from DEMCHDC89YA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 24 Jan 2022 09:17:28 +0100
Received: from md3hr6tc.ad001.com (167.87.0.192) by
 DEMCHDC89YA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 24 Jan 2022 09:17:27 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] busybox: refresh defconfig
Date: Mon, 24 Jan 2022 09:17:12 +0100
Message-ID: <20220124081712.303592-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.0.192]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC89YA.ad011.siemens.net (139.25.226.104)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26672.006
X-TM-AS-Result: No-10--12.295300-8.000000
X-TMASE-MatchedRID: cFv5M0vAhes4qtoWYvR/HsvFqi5bA4IwNpVxLDUyqbYD2WXLXdz+AdoK
	fgOoKJc2EtCbBUchW2t3y7kSqxRZ38spjO0Eu0H1NDvBpTZyM4HKHLBzDotzpeNI3Mct2lzal9d
	CEvBzOP9QnnYsWF8zq2SGAX1shjsasUAaGm+KM59cjCFpN+0K2+0CmUdmZL7Gx5sgyUhLCNuSWR
	Hh+i64gX/oHRvX+qYBcyMNy4iDClXtY7iYMzdzB5tZWJXSJ40RU82qMWBUBVDBe89zsi5D0GDm3
	C/FJwHx8RsuC1Kvz98y5PBtqoQlk9ARIXbHOKudZu9naehun3j5NyYCsjiQWu7KTDtx8CggjkDr
	BOJwwnQoXGX2RAqibeMqy4MfQ6clOok4E3sM9ujRl2x5voGCF8YJy+ad65B1LXh7qHsqP9HGYno
	F/CTeZYpLyz8UyqY4Gg+MZizHm81QkZ5L78DxRJXBiw7NP4CJ4pvYKoNgTXWeAiCmPx4NwBnUJ0
	Ek6yhjxEHRux+uk8h+ICquNi0WJPv6ggnCISqN9sFSr86bTq4dIEG+tBkUzzx/IgZ6wE4aftwZ3
	X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.295300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26672.006
X-TM-SNTS-SMTP: 
 71AC94B5A80AA03B79D40B4D377B50941330A86EBBFEAE6B76DDFF9961B0E3C12000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7877ff3a-d67a-414e-ea68-08d9df11f6cd
X-MS-TrafficTypeDiagnostic: AM7PR10MB3159:EE_
X-Microsoft-Antispam-PRVS: 
	<AM7PR10MB315946207DC1ACDE05353C9F925E9@AM7PR10MB3159.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7kDCGZXPyuK7tLzTfsJblXFCE50Ihakv092NjMRmhgDyvNjh9I6Neb/rH/pr1QGT1PzHFHlTUoHuRqtX5Z0pArpX/UOHkPGlvvxsw0hO1kws7IZzbf/PCk452Id2zjPMoyOj+oh+0t98Ont0R/mdl0XwGJvLVrXGu8mbN//sNhM42UNfF1WDFoxgQtyH1Ee6fz/lGIXMJ+L6OiD5RlqcYwDMuzuWRxJKk5OHnSah2p/MJZsQy8HozcO4mn6P3A9lZNiaQfFH+BxOkW6uWnuhIVOvLAratuE4+WazT4QMVMzK9sYOmqWVha6CDnvpv4hC6iRVb3U/8yK92ZvwV3eAWcE2nh+tk9+z+K67bebFLk0Q+G0L+knYEUwSV40P4G9X+KAzV5gNGDZwiLT6riCrcRBoDbX5ObQylgVfz+In0RSD0RPDSkMfB98TuNouljHVmunpGvcu1XGEf5+AXb+5yg9K3xJVMpY4i1DHatonJSs/KTp8iZQNhWt11A7UtTih6GOx+LE1ozkCL7VH/DhFS+SlcGMHjB78JJTSCMN+81wfuE9KmEe/gnwd866iNb893BXsn6aCV7/8GpzNZ84tdIy7+/sWJf4MXnm6KxzLzJ/XcN/bJFCIkUKkV8Wfd0HFit+bxO9aWxJWC4Djv6d+hv2ds3IEJ74LMLMA1a0e61g7xUAdCFxMld8CYhd2YZHZJ6IgOH47BM/BNLuDN7Y4M+QJsJySgfQyNEA1c1Gsjxl95AnoyF8aVhfZLXQlUmnInMwbR/LIca9LIbr5Q1vCdkVtsTKQIi0QcEohmVMj+rE=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(81166007)(82960400001)(1076003)(956004)(6666004)(44832011)(36860700001)(26005)(2616005)(8936002)(4326008)(316002)(8676002)(40460700003)(47076005)(36756003)(107886003)(70586007)(83380400001)(336012)(82310400004)(6916009)(2906002)(5660300002)(508600001)(16526019)(86362001)(70206006)(186003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 08:17:29.6982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7877ff3a-d67a-414e-ea68-08d9df11f6cd
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT054.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 08:17:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160871

- extend find command
- disable rootfs skip
- busybox-inittab_1.34.1 -> busybox-inittab_1.35.0

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...ab_1.34.1.bb =3D> busybox-inittab_1.35.0.bb} |  0
 meta/recipes-core/busybox/busybox/defconfig   | 70 +++++++++++--------
 2 files changed, 39 insertions(+), 31 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.34.1.bb =3D> busybox-i=
nittab_1.35.0.bb} (100%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.34.1.bb b/meta/rec=
ipes-core/busybox/busybox-inittab_1.35.0.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.34.1.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.35.0.bb
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-cor=
e/busybox/busybox/defconfig
index 16c61a84b2..5e1e1f5638 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.34.0
-# Wed Aug 23 09:07:25 2021
+# Busybox version: 1.35.0
+# Sun Dec 26 16:55:55 2021
 #
 CONFIG_HAVE_DOT_CONFIG=3Dy
=20
@@ -94,9 +94,12 @@ CONFIG_FEATURE_BUFFERS_USE_MALLOC=3Dy
 CONFIG_PASSWORD_MINLEN=3D6
 CONFIG_MD5_SMALL=3D1
 CONFIG_SHA3_SMALL=3D1
-CONFIG_FEATURE_FAST_TOP=3Dy
-# CONFIG_FEATURE_ETC_NETWORKS is not set
-# CONFIG_FEATURE_ETC_SERVICES is not set
+CONFIG_FEATURE_NON_POSIX_CP=3Dy
+# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
+CONFIG_FEATURE_USE_SENDFILE=3Dy
+CONFIG_FEATURE_COPYBUF_KB=3D4
+CONFIG_MONOTONIC_SYSCALL=3Dy
+CONFIG_IOCTL_HEX2STR_ERROR=3Dy
 CONFIG_FEATURE_EDITING=3Dy
 CONFIG_FEATURE_EDITING_MAX_LEN=3D1024
 # CONFIG_FEATURE_EDITING_VI is not set
@@ -120,14 +123,6 @@ CONFIG_UNICODE_WIDE_WCHARS=3Dy
 # CONFIG_UNICODE_BIDI_SUPPORT is not set
 # CONFIG_UNICODE_NEUTRAL_TABLE is not set
 # CONFIG_UNICODE_PRESERVE_BROKEN is not set
-CONFIG_FEATURE_NON_POSIX_CP=3Dy
-# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
-CONFIG_FEATURE_USE_SENDFILE=3Dy
-CONFIG_FEATURE_COPYBUF_KB=3D4
-CONFIG_FEATURE_SKIP_ROOTFS=3Dy
-CONFIG_MONOTONIC_SYSCALL=3Dy
-CONFIG_IOCTL_HEX2STR_ERROR=3Dy
-CONFIG_FEATURE_HWIB=3Dy
=20
 #
 # Applets
@@ -162,6 +157,8 @@ CONFIG_FEATURE_BZIP2_DECOMPRESS=3Dy
 CONFIG_CPIO=3Dy
 # CONFIG_FEATURE_CPIO_O is not set
 # CONFIG_FEATURE_CPIO_P is not set
+# CONFIG_FEATURE_CPIO_IGNORE_DEVNO is not set
+# CONFIG_FEATURE_CPIO_RENUMBER_INODES is not set
 # CONFIG_DPKG is not set
 # CONFIG_DPKG_DEB is not set
 CONFIG_GZIP=3Dy
@@ -197,6 +194,22 @@ CONFIG_FEATURE_UNZIP_CDF=3Dy
 #
 # Coreutils
 #
+CONFIG_FEATURE_VERBOSE=3Dy
+
+#
+# Common options for date and touch
+#
+# CONFIG_FEATURE_TIMEZONE is not set
+
+#
+# Common options for cp and mv
+#
+# CONFIG_FEATURE_PRESERVE_HARDLINKS is not set
+
+#
+# Common options for df, du, ls
+#
+CONFIG_FEATURE_HUMAN_READABLE=3Dy
 CONFIG_BASENAME=3Dy
 CONFIG_CAT=3Dy
 CONFIG_FEATURE_CATN=3Dy
@@ -225,6 +238,7 @@ CONFIG_FEATURE_DD_SIGNAL_HANDLING=3Dy
 # CONFIG_FEATURE_DD_STATUS is not set
 CONFIG_DF=3Dy
 # CONFIG_FEATURE_DF_FANCY is not set
+# CONFIG_FEATURE_SKIP_ROOTFS is not set
 CONFIG_DIRNAME=3Dy
 # CONFIG_DOS2UNIX is not set
 # CONFIG_UNIX2DOS is not set
@@ -343,21 +357,6 @@ CONFIG_USERS=3Dy
 CONFIG_WHOAMI=3Dy
 CONFIG_YES=3Dy
=20
-#
-# Common options
-#
-CONFIG_FEATURE_VERBOSE=3Dy
-
-#
-# Common options for cp and mv
-#
-# CONFIG_FEATURE_PRESERVE_HARDLINKS is not set
-
-#
-# Common options for df, du, ls
-#
-CONFIG_FEATURE_HUMAN_READABLE=3Dy
-
 #
 # Console Utilities
 #
@@ -448,7 +447,11 @@ CONFIG_FEATURE_ALLOW_EXEC=3Dy
 CONFIG_FIND=3Dy
 CONFIG_FEATURE_FIND_PRINT0=3Dy
 CONFIG_FEATURE_FIND_MTIME=3Dy
+CONFIG_FEATURE_FIND_ATIME=3Dy
+CONFIG_FEATURE_FIND_CTIME=3Dy
 CONFIG_FEATURE_FIND_MMIN=3Dy
+CONFIG_FEATURE_FIND_AMIN=3Dy
+CONFIG_FEATURE_FIND_CMIN=3Dy
 CONFIG_FEATURE_FIND_PERM=3Dy
 CONFIG_FEATURE_FIND_TYPE=3Dy
 CONFIG_FEATURE_FIND_EXECUTABLE=3Dy
@@ -456,6 +459,7 @@ CONFIG_FEATURE_FIND_XDEV=3Dy
 CONFIG_FEATURE_FIND_MAXDEPTH=3Dy
 CONFIG_FEATURE_FIND_NEWER=3Dy
 # CONFIG_FEATURE_FIND_INUM is not set
+CONFIG_FEATURE_FIND_SAMEFILE=3Dy
 CONFIG_FEATURE_FIND_EXEC=3Dy
 CONFIG_FEATURE_FIND_EXEC_PLUS=3Dy
 CONFIG_FEATURE_FIND_USER=3Dy
@@ -851,6 +855,9 @@ CONFIG_FEATURE_IPV6=3Dy
 # CONFIG_FEATURE_UNIX_LOCAL is not set
 CONFIG_FEATURE_PREFER_IPV4_ADDRESS=3Dy
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
+# CONFIG_FEATURE_ETC_NETWORKS is not set
+# CONFIG_FEATURE_ETC_SERVICES is not set
+CONFIG_FEATURE_HWIB=3Dy
 # CONFIG_FEATURE_TLS_SHA1 is not set
 # CONFIG_ARP is not set
 # CONFIG_ARPING is not set
@@ -1024,17 +1031,19 @@ CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -b"
 #
 # Mail Utilities
 #
+CONFIG_FEATURE_MIME_CHARSET=3D""
 # CONFIG_MAKEMIME is not set
 # CONFIG_POPMAILDIR is not set
 # CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
 # CONFIG_REFORMIME is not set
 # CONFIG_FEATURE_REFORMIME_COMPAT is not set
 # CONFIG_SENDMAIL is not set
-CONFIG_FEATURE_MIME_CHARSET=3D""
=20
 #
 # Process Utilities
 #
+CONFIG_FEATURE_FAST_TOP=3Dy
+# CONFIG_FEATURE_SHOW_THREADS is not set
 CONFIG_FREE=3Dy
 CONFIG_FUSER=3Dy
 # CONFIG_IOSTAT is not set
@@ -1073,7 +1082,6 @@ CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=3Dy
 CONFIG_UPTIME=3Dy
 # CONFIG_FEATURE_UPTIME_UTMP_SUPPORT is not set
 CONFIG_WATCH=3Dy
-# CONFIG_FEATURE_SHOW_THREADS is not set
=20
 #
 # Runit Utilities
@@ -1138,8 +1146,8 @@ CONFIG_ASH_CMDCMD=3Dy
 # CONFIG_SHELL_HUSH is not set
 # CONFIG_HUSH_BASH_COMPAT is not set
 # CONFIG_HUSH_BRACE_EXPANSION is not set
-# CONFIG_HUSH_LINENO_VAR is not set
 # CONFIG_HUSH_BASH_SOURCE_CURDIR is not set
+# CONFIG_HUSH_LINENO_VAR is not set
 # CONFIG_HUSH_INTERACTIVE is not set
 # CONFIG_HUSH_SAVEHISTORY is not set
 # CONFIG_HUSH_JOB is not set
--=20
2.34.1


