Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5145BC001DE
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 21:06:55 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.89])
 by mx.groups.io with SMTP id smtpd.web11.46691.1691442410269781389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 14:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=3RbJivm9;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.89, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwH0TXuHmY/plslxIHyQaDuwDc9dZ/jYrdSXt7l9gk1cnXKKes2svbrvNhbP1RGBS2UdsVPjAMuRN1VEmJlcOabJm/Px4VBvCdr/a/ygJeAylDWnYC2R8inBDhrAfxwvaBU4oyBOEtKCmaht/UyIjDqBNwJJP63b+GNwL7V3sf+uJY1933lkjN0JnKfkamb1NR7jCVl/a7uRtVCdROEyNYCO11f+vLG6PXCGjmtbQVhkJohLp884wSnjDIytWY3Yra4MPC8/56H1AyVKWSnhsRBQtVAdgz9FoF3ZOShBBVaqA3L5/M2l9JDiz5jcWnfQR0Zqbl7277jH2E7hT0VOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzgL9flu+FP+R64hjwB6vcbUp7bcErChhv8oM70RRgo=;
 b=bmPksqJ0KW1qES8Pf1O5emquzAhCR7XhQpoE7p5OC6CHn41HiNOBEY8POzkX8zpz7kd/h/lEZeDiDCss6CQKPywBMQ9dTDx6jGyxC+r2WJuF9sQg95T0t0+dRpSFKB2AQD1s4sAlfCykzyHDBuMFC9KUBgdu2kACZion88ZoOrNidGH6mypaYpmJOGTLvz2yGQE546TRf/JqQFthoR8TQg6OkDIj78oJu0AYb6u8AQsU3Vr0FvzpHlCpFYLru2UH8t+sZyhjfqXKhi9FVSYo27szxKg9h/v/VIoZbndynUIPTrMW4XN9vTlvouOONchRByhRmjIWbKziPrQ9+yQL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzgL9flu+FP+R64hjwB6vcbUp7bcErChhv8oM70RRgo=;
 b=3RbJivm9K8OWQwnf7HyN9RCJWn7KkB6hKBk9VkvO4y8vXJy3lI0im5V4P0sIbXoIb5iM37sTjb5OtBsZUkDBk+6U3ku27zn0lrppoDyuYGKd8t2cRF80nVsHlkVuQ/7hoWoOzhkd55ZuepAcyEJeSQwMCHFOrJOw9qrg6SJIvA0=
Received: from SA9PR13CA0074.namprd13.prod.outlook.com (2603:10b6:806:23::19)
 by DM4PR12MB5120.namprd12.prod.outlook.com (2603:10b6:5:393::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 21:06:44 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:23:cafe::18) by SA9PR13CA0074.outlook.office365.com
 (2603:10b6:806:23::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.15 via Frontend
 Transport; Mon, 7 Aug 2023 21:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Mon, 7 Aug 2023 21:06:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 16:06:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 16:06:47 -0500
Received: from xcolc230100.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 7 Aug 2023 16:06:47 -0500
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] tcf-agent: Update to 1.8.0 release
Date: Mon, 7 Aug 2023 15:06:47 -0600
Message-ID: <20230807210647.1502601-1-mark.hatle@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DM4PR12MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: e057c4b8-dee8-457d-05f4-08db978a369f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M2HO1zh3tUuF+RaeRHGdJZ/9osYENd6xwa7zkMgWFWTDZbA480LTs2I7QDhOjchW3d78aV62oiKJ7hY7oHgZtp/67rMpbMkVN8y8aqiT6uRKLaeu0/znsFL4zlp4Lz20PHppB1KqxjjwfBXhXx8O6tai+X3zd4hv2aDTeiYolZ/D8GHAl276KAijnukgSACA/19RO7WEyxArw0fy6r/KsAmnX7G2mRZn8NKVh7vqUjQoaqQ0Ltn8Tpa3k0vXRoZdJb3I3CY8qO5YyJg5iZU4d+MJhW/XKljhczSMUjzn74vo5/p69QMGUUKwovyngfnVvBFifAJiJJU/1xGUEow5UTSmOiOFMqCLlgDhmUw6wHOutfts3XjcbpA60pT8G7Fw9rOpgU0svrSK0TLVVdtsruftUSw14AjbGNW/hcz1/Y7naFD2NGzDbNDS9XjyTQsQQHLjtyXr0C/vb42vVBlZHF2Lgy28hG2vCdwBvdRvcysisK4G5UqTdwiNqLDG3WeafWfD9tt14imYkKPaAAhQTBKN1wv/yJYqSDqtZC9vdZCO6hX08fH/zkZr44qD4YTT2sQ8fR+q04FruMUM3ePun5AzUNPUzE8oXkkQt+6UvW9XSXgbdAUmAij9NId44z49whGc/VoW+Sv0Vcc/RR4LYsbrTHzY3fJfDkaGyyM5EoRRdHWF+uWlcwKeajdQi1YHu3Z900mbKAgLUzVDmwOGMXOseTZwDBom+oKwwHRNNTrN8FefkhjGRILKlkJulwJ9r8gccuSomanJu2rN8xZvEw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(82310400008)(1800799003)(186006)(46966006)(36840700001)(40470700004)(36860700001)(36756003)(86362001)(83380400001)(81166007)(82740400003)(356005)(40460700003)(40480700001)(1076003)(336012)(26005)(316002)(41300700001)(70206006)(6916009)(478600001)(15650500001)(2906002)(5660300002)(44832011)(426003)(2616005)(47076005)(8936002)(8676002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 21:06:48.0104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e057c4b8-dee8-457d-05f4-08db978a369f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 21:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185624

New 1.8 release of tcf-agent.  Implements DWARF 5 support and various
bug fixes.

Changelog since last SRCREV:
   Releng: Upversion TCF to 1.8
   Fixed possible SEGFAULT after error message queue overflow
   Fixed misspelling in a comment
   TCF Agent: update breakpoint error message
   Fixed regression: possible segfault in run_safe_events()
   Bug 581978 - TCF agent wrong handle the call frame debug info generated =
by LLVM 16 for RISC-V
   DWARF: a bit faster implementation of dio_ReadAddressX()
   Bug 581971 - Failed to handle loclist for DWARF 5
   Fixed handling of situation when a context resumed or exited during brea=
kpoint evaluation
   Bug 581799 - when loads .debug_info section from dwarf 5 file, the conte=
nt of some part are zero
   Updated examples/daytime/readme.txt

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipe=
s-devtools/tcf-agent/tcf-agent_git.bb
index 9e77f12b53..7d151d4642 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -6,8 +6,8 @@ BUGTRACKER =3D "https://bugs.eclipse.org/bugs/"
 LICENSE =3D "EPL-1.0 | EDL-1.0"
 LIC_FILES_CHKSUM =3D "file://edl-v10.html;md5=3D522a390a83dc186513f0500543=
ad3679"
=20
-SRCREV =3D "4a2c4baaccbc8c29ce0297705de9a4e096d57ce5"
-PV =3D "1.7.0+git${SRCPV}"
+SRCREV =3D "1f11747e83ebf4f53e8d17f430136f92ec378709"
+PV =3D "1.8.0+git${SRCPV}"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI =3D "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protoco=
l=3Dhttps;branch=3Dmaster \
--=20
2.34.1


