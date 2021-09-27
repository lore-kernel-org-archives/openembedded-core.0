Return-Path: <massimo.toscanelli@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAED5C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 09:35:52 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.113])
 by mx.groups.io with SMTP id smtpd.web10.28866.1632735350812449570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 02:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1
 header.b=d0ZoJP2w;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.113,
 mailfrom: massimo.toscanelli@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAdz/q5zzJPdo1BL3JBacD+wnznh+iU0hFAoftGWBajUfSp0EGdJ4tf6Q1HSFRnVou5IMKdN5i+QDubkamkEZP5HBIr91nn4W4CQeEMxHHeYMbDq34SXHRH7M/v/FOz8x8x7foyLcvvgivkUggfWNVU0IxMBh5PMcFomTegx7s4Tu43cuzlh4aaC/5jQiFwe+Xv5sIcj6yHScsQIXefImh9pG8GgHrNI2to/rC3m/6zowaTYf2QHtR3E83Vk3iXO/XdjyABVdTB/g+deM0h9Mras8aQ9jGtx5FNth7KYDae/MhrllvUshkloPsN9kXT70Nllmj+50B0uaQ9+Gg4cJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Fco9Isutaz47qR3kK05lujtnKSVpMwgKV/U2sDazPF8=;
 b=D8+kWbWZpawo8ss90woDaWYolTP2J3SZws2MAWIoBDE8O7IHsfhwa3AN7tzocqr1UHFGSYuN5NU7zyETSd9Si2fUmMk0e9Ko9pvoQ0G0gwEdjCYCVY5HwALo+ZcHO8vPSe3I2tieXPyuydD5VVBzFXkfEC64ADHn+L52RlxN8O45O0Dsa0kOQ1PcbrfjngV30ynWhDI6BPqTyKj3/t0ubWjwGSJbulB+FjSELVra/65TzuSXtzt3PyFyLA+oqdjiqryfpNm2sEo/CuhVbjQAr2KOh5TjFQbsF45DCVKRdCNdJdvH13UER+CqPIbl45/x0bysnM0xQ6Cq8y4/KmUOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fco9Isutaz47qR3kK05lujtnKSVpMwgKV/U2sDazPF8=;
 b=d0ZoJP2wR8Pv+XR1d+79vpNSjw2IAi6eML2bkJsmxaN1OfJn/hZkSNsV7B49aDJibD2YWQrKW4/3uFPWmbTx58ZKxlXIJQtRfi1wf2qojj6MxPttSTRXL99Nd4d5uBMjAh/91BDKPP1fs4J0fMpHPXywQ21F/Qnzol7ZxEYqnOM=
Received: from OL1P279CA0019.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:13::6) by
 PAXPR06MB7406.eurprd06.prod.outlook.com (2603:10a6:102:12f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 09:35:48 +0000
Received: from HE1EUR02FT040.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:e10:13:cafe::b1) by OL1P279CA0019.outlook.office365.com
 (2603:10a6:e10:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 09:35:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; lists.openembedded.org; dkim=none
 (message not signed) header.d=none;lists.openembedded.org; dmarc=pass
 action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com;
Received: from hexagon.com (193.8.40.94) by
 HE1EUR02FT040.mail.protection.outlook.com (10.152.11.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 09:35:47 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.56]) by hexagon.com with
 Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 27 Sep 2021 11:35:47 +0200
From: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] common-licenses: add "Unlicense" license file
Date: Mon, 27 Sep 2021 09:35:37 +0000
Message-Id: <20210927093537.4731-1-massimo.toscanelli@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 27 Sep 2021 09:35:47.0393 (UTC)
 FILETIME=[0D2E1310:01D7B383]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1efac18d-4dd9-4559-7f0b-08d9819a2fee
X-MS-TrafficTypeDiagnostic: PAXPR06MB7406:
X-Microsoft-Antispam-PRVS: 
	<PAXPR06MB7406605D568483C5560D20CBA0A79@PAXPR06MB7406.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JAgYNXF0hRIedidrsgTAJht6YMz88pSb/Op/I90tyHRFBm44BP/v1qiBAqDGi4IWto7vpjntYotVyWld6gVZptdYDsaJ1rOxg1KjQfp2p6e2T3LReFf0jCxB+psCTlhifK65098DtwLjaTTa3z7qpgC8SCs29CFfLc0h0nvYgCB9AfhECBnxkvcv/jX7ytJ3XWeU3CtQTVt12oCTosiOWVXvYr6g+gHuZJ6/o7IfjrgfkQts2alpcUttAg04nZlvE91oRLqiW2xe0MENzI4lFy9+CpsnjBI7CxZ6u1iQjeaxEwQhxZeS0F+4xRg6jI3kYOXAdO+kUM8KxB8PI4hdvs3Sr12mVLoB5+FSyM/RWWO1q2gjwi3m1JJmtE+KPyduy2SCpENT8fwT6K8RgfFPQDOmO396ep6icWvlGMYYqMxJFlg/63O63CfWL+rpfJBlMR/Uspoxyz5+GOezPC1lYHmnLygDfBYCXBXpFP7qe++m6FoatmTFLui2DJ6ASUPxyHE0sH6+MGuCzkyLfkrUS6mioJA1hbmRXTRD28uQr6e7yd584iCiNDjwOPVUNckHRPhTvUi0Lwpo6kqWudKqy1JFQ2prqiiupimcLTeI/EhZpyx1lEZvVh3fa0lrIGckZ6aJxr4p2bXMGoFs5+XqossXi5ytImDwTLNcNETMqyxYrTtzUxTfCxCEaskIIZts3pxcpV3QH3Vzjfm6fuabyJkteoyxFMExipV96siiJaK8an6q8j5CFJXvtam4gcPEccAmuN43rLWv7s8FNGqNhQEQ49eh4hpsAfpiMgSzgV4=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(36756003)(356005)(508600001)(186003)(86362001)(336012)(26005)(70206006)(70586007)(2616005)(6916009)(5660300002)(316002)(6666004)(36860700001)(82310400003)(47076005)(8676002)(83380400001)(8936002)(1076003)(2906002);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 09:35:47.7962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1efac18d-4dd9-4559-7f0b-08d9819a2fee
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT040.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7406
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 09:35:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156378

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7698f3145a9c48778d7bb79f54df169cf375349c)
Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
---
 meta/files/common-licenses/Unlicense | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/files/common-licenses/Unlicense

diff --git a/meta/files/common-licenses/Unlicense b/meta/files/common-licenses/Unlicense
new file mode 100644
index 0000000000..68a49daad8
--- /dev/null
+++ b/meta/files/common-licenses/Unlicense
@@ -0,0 +1,24 @@
+This is free and unencumbered software released into the public domain.
+
+Anyone is free to copy, modify, publish, use, compile, sell, or
+distribute this software, either in source code form or as a compiled
+binary, for any purpose, commercial or non-commercial, and by any
+means.
+
+In jurisdictions that recognize copyright laws, the author or authors
+of this software dedicate any and all copyright interest in the
+software to the public domain. We make this dedication for the benefit
+of the public at large and to the detriment of our heirs and
+successors. We intend this dedication to be an overt act of
+relinquishment in perpetuity of all present and future rights to this
+software under copyright law.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+OTHER DEALINGS IN THE SOFTWARE.
+
+For more information, please refer to <http://unlicense.org/>
-- 
2.17.1


