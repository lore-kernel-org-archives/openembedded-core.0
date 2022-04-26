Return-Path: <rahul.kumar_3@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684E6C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:10:27 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.116])
 by mx.groups.io with SMTP id smtpd.web08.5364.1650975018969966780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 05:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=MUoLq46k;
 spf=pass (domain: code1.emi.philips.com, ip: 40.107.1.116,
 mailfrom: rahulkumar@code1.emi.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hl3IaKLt3TERWKBdW+YrRNkjM5Cl5oWxny14PDKQ0i9ooA4uJG1DC3IUx1nTjizao/gi/vkcSiaGDoqdtUX3wQ0ObR060CXghF2Xz1M9ODDwRoqex7lG99pbhzV+jUY4xXiP1JYYRTqsI8QUFx7jrpY6PQLC2DLtGqnAuQxfHKCj4RC8Da7h1+7U79tUeSPnb/fNzkGBKcVVDIVpdveEgn0yeJ6SnniI8R5nOQ/JBo0BaTrydkb7bNnFxD2x656QRZdD+R8BPfoTFuKo839qLaJG+dHpAiuYNOOju3ShXLdSJZvraXnFggYgd7cRi3i2KtssCwYU5CIV8NxqhnavKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqLPBhiQU8jtMh1K08jhI5X11lwCrF6qbxDXBONQdbA=;
 b=ZiZ9cRPRhPh5JM7KUWCLLP0Ut964uc6QE/XeKGvuvvbCa52K3XpoMcZalwWOJeByBJGILnjhcl6ASYeMHjgUiB/FIdOGWS9m6KwbljFp7DgotBhMeaiuh6x4Dxznt1oQ5jzQgimPMpxua9uxfnTLPNd9/B/rE6uzCR2sNvRbOhcp8AzDLILMVf6d0vQX5BhBEIs3ZzXevOyMp10QT0BG56SSmYCPX3pbtlPhrMOS/40Gmk1EsrV0VkLc5LB+yrAIjsf26Fxgk4YtF9xncltyObMrCgfPaeGirduzxgLvCjMpn0IIuqw/YQS39GhLQzikOHunMtr29m8mu05I1dRI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.136.170.117) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=code1.emi.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=code1.emi.philips.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqLPBhiQU8jtMh1K08jhI5X11lwCrF6qbxDXBONQdbA=;
 b=MUoLq46kOJs4Oj3tBf8oXX3Lops4I26mxJuPUfw2kDZAOJHxFw+aUll6RLKsJLHL2U/T9ZNzoDJytZSQ1T9bvJVfPrDL8Ef9nM4OUEU0pQZjAsOHxiDgFMWA3LzXKFHpUFLBxPmtVZtIIWpmpMCI2Rn3hi86Rn4dIEEzr5Elz1Y=
Received: from DB6PR07CA0064.eurprd07.prod.outlook.com (2603:10a6:6:2a::26) by
 DB7P122MB0188.EURP122.PROD.OUTLOOK.COM (2603:10a6:10:96::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.21; Tue, 26 Apr 2022 12:10:15 +0000
Received: from DB5EUR01FT016.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::54) by DB6PR07CA0064.outlook.office365.com
 (2603:10a6:6:2a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Tue, 26 Apr 2022 12:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.136.170.117)
 smtp.mailfrom=code1.emi.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=code1.emi.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of code1.emi.philips.com
 designates 18.136.170.117 as permitted sender)
 receiver=protection.outlook.com; client-ip=18.136.170.117;
 helo=ext-asp1.smtp.philips.com;
Received: from ext-asp1.smtp.philips.com (18.136.170.117) by
 DB5EUR01FT016.mail.protection.outlook.com (10.152.4.255) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 12:10:15 +0000
Received: from smtprelay-asp1.philips.com ([161.92.84.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-asp1.smtp.philips.com with ESMTP
	id jJf6n9ItQG2CYjJnDn9Q3B; Tue, 26 Apr 2022 11:55:43 +0000
Received: from ingbtcpic6lx242.in-101.lan.philips.com ([161.85.103.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by smtprelay-asp1.philips.com with ESMTPA
	id jK1En9NB2OM31jK1Gn7fOv; Tue, 26 Apr 2022 12:10:15 +0000
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
From: Rahul Kumar <rahulkumar@code1.emi.philips.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] neard: Switch SRC_URI to git repo
Date: Tue, 26 Apr 2022 23:09:36 +0530
Message-ID: <20220426173936.112651-1-rahulkumar@code1.emi.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: rahul.kumar_3@philips.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1139d136-41b9-4342-312e-08da277db929
X-MS-TrafficTypeDiagnostic: DB7P122MB0188:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7P122MB0188D76D8494BAC795D907C69DFB9@DB7P122MB0188.EURP122.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8+SuKtPdGAlebp1c+mEXIfhCuJgAtS2YhR/cwH9QOGmiJtYRbYPJYfTu/SubRNOFoqSZNBpXOYbAF82PgTxVILWOujMahjLxYMeutb4+Az+O4HLlZ9PVHySSyOzcuBwYFmHC1Mug7pUNp+m6GM7Ebtc15j35BYctYu6hZ8zyN4SWyUCLKXHcJj0ej/1YzxmdB1AyWO9CACnfeFIFJDYlRAGM91YTZEMZr9lduITwrdBAx+zq6w9NUMb8YdgCa+h+UHz4S7+dxnCaT4h2n7FZyfDGsUHa1dY9NPZMSuZ0xQVLWL9SiMWlIhA638EZyMlrm3mkrifRuO6IZ3HKSVo+zidfMA/XBu/aD2i5bJYn7uMS1p1eTgVJBUB3PfIXSTSUXgPGEL8qjXFkS2Wz32jl3CX6WH/kEJ2QAMnLdPtptWYMLsmDFCA4GesMOayBxv1Mr/2GK5fTuSgt2sqDtIZtV1Gg/KwQKeMEFSMjpJuA3E/1AZ6kFhmeVZV4RoCAbEneGkUaYcaDNd4hnNuHvyyduLjEt770LrYtRCzxiHZpgSnF9z8O0UsOjXP6lja+jkmo0G7ha7Mo5bEf0NgCAXVuUI51M1LaTcO1Qulm76Q9ZJtgVRjpX7I4sdVLqgFwQcBMqfQ+ZkuERJ+Q5QIwXgkr5JDTYh5ZH+o+/nHtShQ69hE8Cs2UKrj8LldYlGsDiv/btyT716zFn/AVcMiCz6PHScsFpyruP4NN0DXqYCN4c6LoSTdhv1slhsoiHRT9nz/tzGwur35bf6fDxTivWWwsiw==
X-Forefront-Antispam-Report: 
	CIP:18.136.170.117;CTRY:SG;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-asp1.smtp.philips.com;PTR:ec2-18-136-170-117.ap-southeast-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2906002)(8676002)(81166007)(2616005)(1076003)(956004)(70586007)(6666004)(70206006)(40460700003)(356005)(6916009)(82960400001)(86362001)(36860700001)(186003)(82310400005)(83380400001)(966005)(8936002)(336012)(47076005)(5660300002)(316002)(508600001)(26005);DIR:OUT;SFP:1102;
X-OriginatorOrg: code1.emi.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 12:10:15.2439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1139d136-41b9-4342-312e-08da277db929
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[18.136.170.117];Helo=[ext-asp1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT016.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P122MB0188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 12:10:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164869

From: Rahul Kumar <rahul.kumar_3@philips.com>

The tarball (neard-0.16.tar.xz) fetched by the recipe is incomplete.
Few plugins (e.g. tizen) and tests scripts (e.g. Test-channel, test-see,
neard-ui.py, ndef-agent etc) are missing.

Since neard did not release latest tarballs, so as per community
recommendation switching the recipe SRC_URI to git repo.

Community Discussion:
https://lists.openembedded.org/g/openembedded-core/topic/90058043#163681

Signed-off-by: Rahul Kumar <rahul.kumar_3@philips.com>
---
 meta/recipes-connectivity/neard/neard_0.16.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-c=
onnectivity/neard/neard_0.16.bb
index 57f2a3e2e1..bc9ce07d79 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -2,21 +2,22 @@ SUMMARY =3D "Linux NFC daemon"
 DESCRIPTION =3D "A daemon for the Linux Near Field Communication stack"
 HOMEPAGE =3D "http://01.org/linux-nfc"
 LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7=
e \
+                    file://src/near.h;beginline=3D1;endline=3D20;md5=3D358=
e4deefef251a4761e1ffacc965d13 \
+                   "
=20
 DEPENDS =3D "dbus glib-2.0 libnl"
=20
-SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
+SRC_URI =3D "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=
=3Dgit;branch=3Dmaster \
            file://neard.in \
            file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
            file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
-SRC_URI[md5sum] =3D "5c691fb7872856dc0d909c298bc8cb41"
-SRC_URI[sha256sum] =3D "eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6c=
eac9b6e6e65b36"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7=
e \
- file://src/near.h;beginline=3D1;endline=3D20;md5=3D358e4deefef251a4761e1f=
facc965d13 \
- "
+SRCREV =3D "949795024f7625420e93e288c56e194cb9a3e74a"
+
+S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig systemd update-rc.d
=20
--=20
2.25.1


