Return-Path: <Sam.Povilus@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7394FD377B
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 17:25:34 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50819.1772040331908420851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 09:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=aIePOOxn;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.93.201.4, mailfrom: sam.povilus@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3WaHlxYj17pshr3HHcWsk1q77OFBSwsY9me29ltg+IqgKgwCycGbzMMUSMs4vfCAsMPkXonY0KtaMKoAcjVzbptAVRY2X9/dBMtpxxsdHgTzqEjjariHTM4UULKlFa2+IN1kOZ32e9gs+0SN8Oge/ELVc+r3Ch5bA7w5h8NMjmffDDnB1jpLTkovx00soyi4VprivgwkZNIW8XHkwHldSJYHvtlpwUt7H+aEZ1tjBbnkLni3gWzJM6JquONW6CCJPmkx65wbHbgz5hCl/dCr2i7DOD3NiyuQy3tNPfH259hZwIi/DUOdjlTwoJkRQjIrs6eQ0ALGcvnTWVBHTGXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OVfNe6I/GLmFqYq8I8flXD22WQ4OlyS1IUNCcFOFIg=;
 b=jaNfvi565aBdP9YRPtu2F3mU8kqDnVn77btqK9/pymt3Wtmd32d0nT4G0Loh5MghGO9ALuMej296/ljUW1LUukX2iNlsQDXW9YowyEXsq/waTOp2yJqP5Fk62L/CMD9etgsG/hRODeW5/DUK1OecTgNglwQLYYgd756hlxuJNH9Nkg3dDTzGkvYydkKLWCyuB5SeA5oAi90LfcAz0Wz6KQ6asFgZslrDvHCB+7SwaCjzmDiDCDRbe+jqOZWj5GW40AoohgR3s0WygdC8lyBBpvMAgXFBtnqGLlYcHMblKUvLfyIWUTra1tNgZx1DqhBWhNavmO/LcYO9aq46K1ugFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OVfNe6I/GLmFqYq8I8flXD22WQ4OlyS1IUNCcFOFIg=;
 b=aIePOOxnUFCLyDwJs0hse/sgj0sGZMw14rPkURTrpitJDV9Ma+con+Y5cNyw35PsnTkjUdrIOWQTYSETieAS2CcSLQTPcVsyjNdSAesmjaGLOSQejBIzV5Q/KPJ3pAzjad19P/521B1GT4q7Hq+9lPKTW5Jdfo53ACC3wPhN1Ok=
Received: from DS7PR05CA0025.namprd05.prod.outlook.com (2603:10b6:5:3b9::30)
 by CY5PR12MB6453.namprd12.prod.outlook.com (2603:10b6:930:37::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 17:09:29 +0000
Received: from DM2PEPF00003FC4.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::ac) by DS7PR05CA0025.outlook.office365.com
 (2603:10b6:5:3b9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Wed,
 25 Feb 2026 17:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC4.mail.protection.outlook.com (10.167.23.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 17:09:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 11:09:26 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 11:09:25 -0600
Received: from xcosswbuild01.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Feb 2026 11:09:25 -0600
From: Sam Povilus <sam.povilus@amd.com>
To: <sam.povilus@amd.com>, <git@amd.com>,
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] sanity: reject TMPDIR containing redundant slashes
Date: Wed, 25 Feb 2026 17:13:24 +0000
Message-ID: <20260225171324.15154-1-sam.povilus@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC4:EE_|CY5PR12MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2660e9-48e5-45ee-25ce-08de7490a2d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	LmjtXlhsw1F4uLRLN7dSFWEZFHh5uVLlbztM2dGAnrt6XqnOKwLJLWNHQ9atUsDHFfSq5AXUTepec2Iy+UC2WEvk0vlfoojCMlozMebcvRyQitQ8v4075VEGf9EDCwa03ec20+BozqS3Tlv0e32/QkB4VEPKmgVW0yR3j27nHoaAgQ6gxhsBqDsycAO1TkrSY/dKJNB1pY5qD3ti8kkZgOY/zHSsVwIqiqz3i5JFDaQpx7rnH/RliLZNb//NCl3zLKUcjiPchLadpiOLiocGVi16/1Kd/T8D5W7F1wr6kGlzKAdg1My5VGxYtBD9uPZ7PiXFzkvXyGgRQtr51daN6FxsO/XTMtJa6Ny4WTtEv6SdzujIGDJyOQW91uvYJwAN9FOAz6TLrKpvNsy8xvHqqGg8bc3UK5mPEfLzz2KUeENqFrV7siNiuTDNgSnd5477Svdb2VhFSQVwlXhX9XCGd7PKwpt3Tj+hnQaIn29erC5ZYFlcpbIi4HF2J+llwyzzz7L2ACyAKS4BT5xwlNS1aZcpPpUFEzOgB9El1lOQ/z4E3Bgk+Yz35HAh2u4kGugsbD+iWg7Xg8klx3/VTOTBvTl3r8i0usBManC4etUlZTckw8NT/VMWR9W5Cbfb8DAY38G0BxrcvyRoImuJZG3IqL1J1sqtb7hq+20ZEPDWblVgfEDBpDWvVK9Q+YQy9L0myfi1DqZjDfjG9KxjjEFr7qBbkznDOLI1SDGTDb1aOMca/R/RAdB9rBHztac0HLq/HZFmK0L9FvBBZvId/hxL4/AQDIanlkhHvAcjeUAnY9qcJKmNsJBDO3pq+ylWWhpD
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Fex3lcSHHy2VxFgwDx7w+1rIDNMAKZ1pf62M26CcqXQVW1rsN04b3/bld+xrx+yCYDmCcBTBF/EjKVEmlYaA/aLDAWPV9herwWkbiIxMTNCgpAUpV68Dw7sjiIylSTxypuGoE+OrNg5mDkzQVfAg5RGtL0nVV1xf1jzGjt8KL2iAgwoJpc3qyQn7FtzxKSMhAA0APaLa6AIC6I8rcLoMqZo8bSblSpikVOMv+FTX4HDOWpKnR1JpzyuvbfCjsZmOC9rrR9Jpmr4LgVmx8I81VF5L6jZ/zXSz5/HbeFkvsDO8KngTVdq/sDAq0335LpHecDHfdIGBxyvk8l2MFiADaorA4bH+/65QSuDfZhe5cgedmdIIRztON1fUVTtXqWVSdzc2aouzS/+9zaDVhedCCOUqtALiH6hCfdNYcs7KbGkfU1hr6hmB2Pp7HCCKRhGx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 17:09:28.8682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2660e9-48e5-45ee-25ce-08de7490a2d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6453
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 17:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231971

A trailing slash or consecutive slashes anywhere in TMPDIR cause
BitBake variable expansion to embed those redundant slashes into
derived variables such as STAGING_DIR and WORKDIR.  The sstate
machinery in sstate_add() normalises its directory arguments via
os.path.normpath(), so manifest entries always contain clean paths.
Functions in staging.bbclass that read the same variables directly
via d.getVar() without normalising then fail to match manifest
entries, silently staging files to wrong locations and causing
do_populate_sysroot to abort.

Although POSIX permits paths with redundant slashes, they break the
string-matching assumptions embedded in the staging machinery, so
treat any TMPDIR that differs from its normalised form as an error.

Signed-off-by: Sam Povilus <sam.povilus@amd.com>
---
 meta/classes-global/sanity.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanit=
y.bbclass
index 5165bb34..7e81d659 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -953,6 +953,15 @@ def check_sanity_everybuild(status, d):
         if val.find('%') !=3D -1:
             status.addresult("Error, you have an invalid character (%) in =
your %s directory path which causes problems with python string formatting.=
 Please move the installation to a directory which doesn't include any % ch=
aracters." % checkdir)
=20
+    # Redundant slashes (trailing slash or consecutive slashes) in TMPDIR
+    # break the sstate staging machinery which relies on exact string matc=
hing
+    # of manifest paths.  Reject any TMPDIR that differs from its normalis=
ed form.
+    tmpdir =3D d.getVar('TMPDIR')
+    if tmpdir and tmpdir !=3D os.path.normpath(tmpdir):
+        status.addresult("Error, TMPDIR (%s) contains redundant slashes. "
+            "Please set TMPDIR to a clean path with no trailing slash or "
+            "consecutive slashes (e.g. %s).\n" % (tmpdir, os.path.normpath=
(tmpdir)))
+
     # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
     import re
     mirror_vars =3D ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
--=20
2.34.1


