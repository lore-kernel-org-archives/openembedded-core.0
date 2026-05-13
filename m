Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA944CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 16:03:34 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.726.1778688210204953015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 09:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=H07Gf0Qn;
 spf=pass (domain: de.bosch.com, ip: 52.101.70.38, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btfngWDkN9mSBysVAeh1rNvkkFHeiN2dQLhMgvnfXp/bbggLkjwVPKeEq5g2ui/lWRGP+xx9z7tcB+ZFXrqKjYKZECx9s/gDXX9p6Droign/ZAgjdq7QlevmBMRdLASSbMR9B6pOO+r3y3Vpu+1sjp5zHrWz84YB5CqBN0i/fJf65XTTGEzPQjtpeDTWum5Ooqx179/5J7rV4P5f9wmTC6u4UArf1vAl0PHHhZSyH3WAFmj5h3JcUw1aCUnVl3d9/zmUgsm5KTDtfn0NGq1/PQOBeeJW1W7z+isRLEhOKl41AcoreNOhmvWMRaCDQx2OTA7U97Ky51QPYppWBz9ixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXHdV+nMicpr+qybpf8zk94u4V1l4OVvvqMY+48JHhc=;
 b=gNpkuQm2cyS74v73knQ9GzlmwwMOZOxUBzQEbd5M6HUO1FN28ElOteJZEJk3ngFsIYbS1e3xVACzpDbTvDMHLB3WqnMM5Rj8KEhf9fECgM6+kTpCuI/bMMbmKr1cnnxAEAcrCAIFxqPB+NCYLHf7E5MVnz5GVCXpP5QseDUVPPfSVGG+aDYGl0KX0+04xh+etSWRNwZ+60edqSCxAV++97QHz7BobartAhXS3UUFwTxoHhkO6mPdGBjqatJahE+SL+X/bBZbC8ppadBgDa4IKYI5vhP2RPmgS5Lp8Gfv11mgj6IaP2s6j35fg0hheLS1nTYOFZYZvyJgDTGUnA+XRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXHdV+nMicpr+qybpf8zk94u4V1l4OVvvqMY+48JHhc=;
 b=H07Gf0QnPBOLOz391M9YSDCEgwekRB48dkFGc8Q+iz73aKl61mF7wm+ziCHHeKzJFa6xK/F4Lis788EKiUILqPIKIqzorAlsmnhUEa9gAUMYxqP4V8nXvzfTRhleRLh1QgTE5uMo4NCMKoTVREtmO5VN573oBwmN5O6/Hw+ema237nl0PHLlq40CEVAh3oNyVA5plSfnoYM/ZVZIK/1dsgY6m8XHDlgxCHu3Ky0ev53F1pH24DGDRDWMiO7H+je8Heg6qNDUoRb33x399arjK3gUuscL7bUlwMx/UFG1KvN+Kqj/CXrS8QpJz0KTiqiRNdDOlf5ism5znjB97Z+WjA==
Received: from CWLP265CA0454.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::8)
 by PA1PR10MB9687.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:56c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 16:03:25 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:400:1b7:cafe::f0) by CWLP265CA0454.outlook.office365.com
 (2603:10a6:400:1b7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 16:03:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 16:03:24 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:03:08 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.67.169) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 18:03:07 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <robert.joslyn@redrectangle.org>, <paul@pbarker.dev>,
	<peter.marko@siemens.com>, <pkj@axis.com>, <Moritz.Haase@bmw.de>,
	<changqing.li@windriver.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH] curl: Remove absolute paths when mbedtls is enabled
Date: Wed, 13 May 2026 18:02:18 +0200
Message-ID: <20260513160218.11997-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.67.169]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|PA1PR10MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: 45cc6d57-7e9b-4229-6ff9-08deb10929e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	lrtNSrDOl1pxPxwEjEIjk+j5moE5ov5R5fZnprWyEk61ic5kjt82kv0eSgXIYLOsxMb4kCJVrLKeVMR93s+0e+03iHlFvuoVnbfuWCygMA1RyNGrJePFPMX08MQYYaj/bDPH2UZ6m4ZL5znPWB4Bgd0+TDgS/2ij5uMyO0XKBxC523MM5BEHt9FsEh7QssIJSw7cBBGde3f3ey5IeESVpGo4nVXo8gDSKsNLUtp1P4QtIYIy9/vhNSoNHKYoat/hr2SAtRNHtt0YQDQQvDMJi9gOZ4xW33pEPRux7HuPzhLcRqeXtT1rZqxZxM+tyEcUT5CeAYXqQTIGz3t+d9EMLNGFwtH131RfFMqV2wzggoYtajtGwSlYBLgAfDbczekeUdDQuJyguFXPxyN0gZgTADUXOmojNTE8OjjUSPn18nYMJZadXKvGeX7IhSP6hK/Ok+KNgAMYGe16YEFkSLn2DnZtNXBt0MkEnE9EeIA0CO2EJ2ZKCHnksa+9hz2CxMqJ4VILjwXA4/nLMoy+KbOhkR7OaPptD113wiD8cCwVQmxAYpsciu6/3lotHLe4s87i0tAfHZnMhXr7P407vJbCZu1+dGfV0C1wVvzASPSCAiYAXBb2naeJSF6sHHBIYgJWjtmH639iEl2QWm6jSQx8vZXybqB3++9+6IZckaOucr7TRu5DCHsakVMcIUWYaQoapEyxYk/3jK+aUWAZBQIK/3NbPZP4r9rRv0akEhbGT5w=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oadVLKoW4A/iFVCq9aEGnkZPFeSd3BjBTtP0QuQkHSbG4Wp69Oekg8/6PQZYOMSPzpAT8bS24T8PYW5AURZqe/yLr28vgAOG1Jz4ifksbwZlrUwf0OHrlpu8vzCLxx2JHcC78KW5OvHPaLhpywtHsYb5qb0gwh65wgVXsEE9Ro8NKYsGL2u5qp1dSFWgttXE2rf4PbRAnB2v/N9vhRqEk/F62R6MpQapDzFgRsPp5gNeFrc7z65Q8T/A512rVVZ5wdn5RD5aHNcg7RavZQ1mqHj1wCKgd7Xy16KihEr1Luw2W1Q6C+wp5fhXESDZ4fmdlGBo4P2oqel+P1ceSLyXZKLEhfvKGXNtIdih5NhtcWkKKfIKROL+T5q5yfaXXGZ8jghM29SB52pjPz7OwIHbIHzkToKHtGjIC9IXvvsXoNiUd7MeYcygUbCDet5B4Ez2
X-Exchange-RoutingPolicyChecked: 
	shg/DhTl2SAcyuKKioCQAS9+ABSOdELx+U23S56318CCvl7Q1ZMxyf1U9XzeqLRAch+Za0Q76rrGMPugLS8ZgVOAuU59sOiWDeppF4mX4W6tZ9FDBHTONe0N8Gde1a5gt1//O3HbrQAMEOspdHCHqG7HbBGfIcxErVZ0tRG+JdEMVyANgfRHtDwX2uKImu+EX3iMTeRgztAtJmN7V5v0F4NA5+H/lE6KAPCWEuKwyq1TUV/Y/G622SPsoylDv7GrcMcVK2Rh/8dQOCs4jKIKcffl71j6Jcp/SE07Y8XmSgkScpvis2kt34vD1XqmMp9+OvFch2t4+vbI7H47/EKxxg==
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 16:03:24.7940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cc6d57-7e9b-4229-6ff9-08deb10929e3
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9687
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 16:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236991

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

When enabling mbedtls PACKAGECONFIG option, the curl-config and
libcurl.pc are generated with paths to STAGE_DIR_TARGET, causing the
QA check buildpaths to fail. This is due to the fact that the mbedtls
option uses the path to STAGING_DIR_TARGET to find the mbedtls library.

When installed, the curl-config and libcurl.pc will still need the
the flag '--with-mbedtls', but not with the path. Same is true for the
library path flag. Thus drop the absolute paths from both files when
mbedtls is enabled, and add the flag '--with-mbedtls' to the curl-config
and libcurl.pc.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-suppor=
t/curl/curl_8.19.0.bb
index b9251336b8..cc37cc934b 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -93,13 +93,15 @@ EXTRA_OECONF =3D " \
 "
=20
 fix_absolute_paths () {
-	# cleanup buildpaths from curl-config
+	# cleanup buildpaths from curl-config and libcurl.pc
 	sed -i \
 	    -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
 	    -e 's,--with-libtool-sysroot=3D${STAGING_DIR_TARGET},,g' \
+	    -e 's,--with-mbedtls=3D${STAGING_DIR_TARGET},--with-mbedtls,g' \
+	    -e 's,-L${STAGING_DIR_TARGET},,g' \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e 's|${@" ".join(d.getVar("DEBUG_PREFIX_MAP").split())}||g' \
-	    ${D}${bindir}/curl-config
+	    ${D}${bindir}/curl-config ${D}${libdir}/pkgconfig/libcurl.pc
 }
=20
 do_install:append:class-target() {
--=20
2.34.1


