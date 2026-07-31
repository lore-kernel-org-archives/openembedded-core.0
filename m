Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3684C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 13:27:39 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6446.1785504452338414547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 06:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=i5XzEwba;
 spf=pass (domain: ericsson.com, ip: 52.101.83.4, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLU0wFvFuBtQ/CP/270D7h3AMOV/uUonpn3YqYxPEigZ3cPu9tI7k3kNkx3sg4YpoYzUniSyJxq4W6+0SA0Hqc7M86FWJbzBBIBG3Ph5zZn4qm8AH7YctiapCs5GoqQzPiBfpcJZ66eGtPr7x+Gfq5jUF9uxMe+QpGElbAMK6HQCcqw0YUFdnpobXqR34EqMLZ3F7tiW/uOKWg6wuNl3CqB/AUnNySWy2a/EstDr9rK0MKSW5qDeKMK2wwjyOpavjKwUJuixfcJB5n6MYuM9VrNvNXvgnscr1DEYHF9raWptTGEbn4fHRtxh+HgXmhjhAMrJAkvoEwhzq1IeYXz8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKRT6l28wwpzQm18XulNX12V5gbpjDxIsorLlJGcRYg=;
 b=FNFdUOSgKGkRvnyx8lzpIdI29o2aEMfHmrgRpS4Fs5EeNP3PCpEgC974EXryLiHo7ZbLXw3HBXzpdO85CEZ1aBrG/jXLCswgUiY1aLG7NRTZTLTlLcONt5VL5IkFsuIxLLPNGLCjGWl56jlcc8kqyiD3Iu8XAa1B8PXLunwzuDtllEsibvYURGbf4FztRdxXtBEWM9b6BC/XIdZMyceFBGsIJSgkefz8U6Ql2mlXs3o2VXbH2B8YrfWLiw8qgCy8zSyE1hz5XswUiqaPSVxT2Snb1qMPnz1Rm4Hp9s3NKo409TEoMIeiz+wdBPq4v8GuJQ2YMIH8WtolKj7ANuni2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKRT6l28wwpzQm18XulNX12V5gbpjDxIsorLlJGcRYg=;
 b=i5XzEwbaIO/agOc6GwylC2J8IJNE4UI2XrI9VTqz5yzaztdGaM1atPt6pJdtzvPXQ9zNwZoJQJhSXdpJhCnYfUw4gAXc3V0IA8bCClBq6edUYUXUkCANGxdGazjObp8iuVe4aKd9LMcAfeI8hpPDMucRAPFrdS1QTVt8N5yPL1RhyioRWKue9SsUPfshsSw5qkYH4nmrOe9gCfDtpvhC196S6j1JWksHp2EoQpFOtbtjubQZjuHQel82yyk87lx11fA7VAYWQGPuTwyjQdbpLXzv5+GqXLcK/dwhKYhuPy1m+86KW73DAiH6mj8fXfkqGzeLx5pWZE13z6qOxO/KoQ==
Received: from AS4P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::19)
 by DU0PR07MB8884.eurprd07.prod.outlook.com (2603:10a6:10:323::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 13:27:26 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::f) by AS4P192CA0025.outlook.office365.com
 (2603:10a6:20b:5e1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 13:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 13:27:26 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 31 Jul 2026 15:27:25 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 3396595800;
	Fri, 31 Jul 2026 15:27:25 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id EB802700DBB0; Fri, 31 Jul 2026 15:27:24 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <yoann.congal@smile.fr>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH] patchtest: detect leftover AUH changelog-truncation notice
Date: Fri, 31 Jul 2026 15:27:14 +0200
Message-ID: <20260731132714.1672980-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000094:EE_|DU0PR07MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 1159f290-0361-4736-5f3d-08deef077657
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	eAk5RifMzS2R5juTNyVPFZ7h713K/wlF27U7yzjfKNUlnspC78FeiHzA9xRahslaSGfdjLo4l7QkNaq1Sucbrjil6YCfP0aCVaaKeR5ptPJJDjMQod+0b3RF7nYmoUc3MX/SssJsY+B+gjLM56J0+wdaZnry+DE8+/gwJDg82qxVdDAZNt0JF4KtjMsgzpfU9WxKZYHVHHHjEH673ahSsQmC0YbhjesFPKkOf5oXx6RFkE8CC9WQGn4cD55ainDWQSA1OGcaQDBMdHog/KjKZrwwcdg9TRlWQ20CyhNLczFuVMk4ceD/dKUIDm0xrs6iMENHzjZixvIeqO1ear/+D09tDQymK2Xd0OiYpe2nL/CeXKpIR9xLoOaj49lKuGoGLPyg6hiDSbd+0HdGoA+wSyU6UqVnxKjnM8ewwOLf4WPCailcxRhNx7Acmotns1X6iUeKwjRm5qoiO+45+qyTe4UgD6/Fwzc4pSMR73E8kWpISuSj6d56hvtYs3sMxpJLw3HmJejG19p5qJ9P1hp3f48wX51/aALCMucqlI3YMZ9DGwyiDOUXLCxCsT4Ia3t8Y0RMOE8jIlpo0Mq0xouL3cghV2LLklNsJpduHcj+HFIejvVubrYQLdpMVsEx7p/2cICBxGOlACmke2dHCORNdKIVgomqbNFKwYUx9Tj0lTQQNr7Dxvp94fIIFnJLQ5AOUOvRWO/6pzQ1mb/UVJPybw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	K5iBN06HXL+kZVy/p7CNoWd3UD4nDkEy7Q4lgamYTKMGuALZcWHQsi0m10ShxrhAiN3UPh3HfV+onbTULk0r7GjUhl94rbvlO0ke5RUUBzGK+DQodwFSnvXHcAiHtULihlzcOqAIWuqHka6nHJtKfVZeQEpUieJwWSzbQnXRP7yo5eF/v1NgjAsz0Ryz49uPQONeL+yC9/YmodCXytuF61DwTj6VVnDEssa8zRdpv03AyZ5eGGKmenFpJt7TL8XIZE5xMDCcfxOEBE7WHdCxI7zJWAArTgh5f64/JtfnpYL1zlVvAeggXNSoUiYQWCSf0QnnRp0YhMZdPPwfz2F1OevxwKG80Psl6X6+wvDNdEVDShIwGXvJeWhRg/77CFXXTiEBJrWkykqaE4hVVbBqh5WllyaUIQDeWKOLik7vXa/f8ZpqHmDO8GJboLqpw7eQ
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 13:27:26.1825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1159f290-0361-4736-5f3d-08deef077657
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8884
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 13:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242444

From: Daniel Turull <daniel.turull@ericsson.com>

Add a check for the changelog-truncation notice that auto-upgrade-helper
appends to the commit message when the devtool changelog exceeds
changelog_max_len. This text is meant to be replaced by the submitter
with their own summary of the changes before sending the patch, so flag
it if left in place.

AI-Generated: Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/lib/patchtest/patchtest_patterns.py      |  1 +
 ....test_auh_changelog_truncation_notice.fail | 25 +++++++++++++++++++
 ....test_auh_changelog_truncation_notice.pass |  1 +
 meta/lib/patchtest/tests/test_mbox.py         |  9 +++++++
 4 files changed, 36 insertions(+)
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_auh_cha=
ngelog_truncation_notice.fail
 create mode 120000 meta/lib/patchtest/selftest/files/TestMbox.test_auh_cha=
ngelog_truncation_notice.pass

diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtest/=
patchtest_patterns.py
index 1a8db92aa5..11e5996df0 100644
--- a/meta/lib/patchtest/patchtest_patterns.py
+++ b/meta/lib/patchtest/patchtest_patterns.py
@@ -48,6 +48,7 @@ patchmetadata_regex =3D re.compile(
=20
 # mbox
 auh_email =3D 'auh@yoctoproject.org'
+auh_changelog_truncated =3D 'the full changelog can be found in an attachm=
ent to the AUH email'
=20
 invalid_submitters =3D [pyparsing.Regex("^Upgrade Helper.+"),
             pyparsing.Regex(auh_email),
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_auh_changelog_=
truncation_notice.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_au=
h_changelog_truncation_notice.fail
new file mode 100644
index 0000000000..7fe3c77df3
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_auh_changelog_truncat=
ion_notice.fail
@@ -0,0 +1,25 @@
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: upgrade 1.0 -> 1.1
+
+[Changelog truncated as it exceeds 3000 characters;
+the full changelog can be found in an attachment to the AUH email]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.=
bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..b6be3f2e1e0 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -1,4 +1,4 @@
+-SUMMARY =3D "This is an example summary"
++SUMMARY =3D "This is an example summary, slightly updated"
+ DESCRIPTION =3D "Simple helloworld application -- selftest variant"
+ SECTION =3D "examples"
+ LICENSE =3D "MIT"
+--=20
+2.45.1
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_auh_changelog_=
truncation_notice.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_au=
h_changelog_truncation_notice.pass
new file mode 120000
index 0000000000..afeb3e7cdd
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_auh_changelog_truncat=
ion_notice.pass
@@ -0,0 +1 @@
+TestMbox.test_commit_message_presence.pass
\ No newline at end of file
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tes=
ts/test_mbox.py
index feb87fa2ae..3db21d2104 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -177,3 +177,12 @@ class TestMbox(base.Base):
                     % patchtest_patterns.auh_email,
                     commit=3Dcommit,
                 )
+
+    def test_auh_changelog_truncation_notice(self):
+        for commit in self.commits:
+            if patchtest_patterns.auh_changelog_truncated in commit.commit=
_message:
+                self.fail(
+                    "Commit message contains the AUH changelog-truncation =
notice left over from "
+                    "the auto upgrade. Remove it and summarize the relevan=
t changes yourself",
+                    commit=3Dcommit,
+                )

