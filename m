Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA41C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 05:52:48 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.41])
 by mx.groups.io with SMTP id smtpd.web10.67107.1705902763503551832
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 21:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=esmxbDhZ;
 spf=pass (domain: axis.com, ip: 40.107.104.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMBGfkcXivo0pWqP8MXCh3dNZkqrW48eslJyB58X4PJJv5UrWCd0gzuwo523wISOHmvdyr38xE9Qo9T6CyijEbjC7FtCKGQIGkSD45Pw4cWkZltljrBSYMt3YwXPCuCJPx5/hNRtsrJkBgXpHVek57jsKnoEqZe3WmaWbJgFy2w/P3zmim0YKt+NxR73Y+n3hiZdF///hDLD/HwgnR53l2dfGRLncSNDkdV2XdQWymBYDvqlUHFrVvBeRD8/uRRCyw9KDdpsh32hdMEQ4QP0dE9JYBJLA/MEqC2BTMtolCMiuns3rYVseZt4/jEAjzzuz873FpRlN/m3bzIrLouJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTX72YwwAQu22erP2IkXV49/jKjkN9l4EP6Ff/UWb6s=;
 b=gNYexwyZ995VOijZ+gqvqMixBUbWfn446bNkbPTlR58kRDvxtlQUusI04PDWwY7Y60pR6+5mHH1fIlB+o+WZ3oEWOJ/RBqwcIiAXb+1itlUrSu/93uLAh9t4gl4wbX77zWQ8SqcWsefB5aHF0RG6kJ3ASPGD00eugAQLhPMO920gK6Gj+Ucj6ktQ+T44ggNjILLYuP/BJAi5pB/8117oyfa8XQRTwsNJ8UIofEwQ3sMa+Bs1YyjV1r5s8a2UZlcEri+uRuI7w0wceqDvpdybL4S5IPJ0BBglRq+kxip0AbhyoJkJ6Mr7MnhgFOWqVLFiO7cP9F1jrvgRlcYQ2CRhnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTX72YwwAQu22erP2IkXV49/jKjkN9l4EP6Ff/UWb6s=;
 b=esmxbDhZFl4sUfSoFAXLzodBQ/57ABuU1vzVukvYXPMQLpWhJTLOrcYSj7s1qMUJ+eXOH6bJndNtuAw9cHir6AtrD0hXK1x1nK1o4Df0JBR+AGUhuoSVFw+QDlo5r+VKPVP3Q0Aih6Z65SqJKMlqSr9c7GfNWDoQ1Ped2ZrZKp0=
Received: from AS9P194CA0017.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::33)
 by DBAPR02MB6375.eurprd02.prod.outlook.com (2603:10a6:10:196::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 05:52:40 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:46d:cafe::6e) by AS9P194CA0017.outlook.office365.com
 (2603:10a6:20b:46d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31 via Frontend
 Transport; Mon, 22 Jan 2024 05:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 05:52:40 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 22 Jan
 2024 06:52:39 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 22 Jan 2024 06:52:39 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id CE72912A40
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:52:39 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 40M5qdM02416225
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:52:39 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 40M5qd552416222
	for openembedded-core@lists.openembedded.org; Mon, 22 Jan 2024 06:52:39 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] insane.bbclass: Allow the warning about virtual/ to be disabled
Date: Mon, 22 Jan 2024 06:52:32 +0100
Message-ID: <20240122055232.2415989-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|DBAPR02MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4159af-d003-4632-0995-08dc1b0e5827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZcyKegyGJC6bDHxpTwx46l6xjCc4zKlXRsjTe96NM1BbtjkJ/oJ6q4zcRtSd9EgbtZcX/c1JdB5RvzDVV6RmX7K7AfGlGL9EQsiJAR4naTYnOWaAKHZMP05nPEU6z1v0jLhQle7tyH1/FBdoiwtenN6ZsiiD8ZhbLXen/iFXVV0sGFrCY+gZb5kuuLfZRTRXlXJke9IQu1Rscpnd0NdqFzJH1qEi4Co2oUV6LFbncUXLFzQ368Bv4BMOJ7363UvMJGgn9ZnaG5sz0QYXYwHsGBZQfFJuUENMy2R8Lvv7u7tKDIZ1lTiUBbYB1D+66HfZyrdbDNR+jXmz6DnJcjlgmZRwEdvI0IPEK5/s/iq5B9YFABwGZJOZf8724DalIjb/gIppBFFPxTkBIlrDkowEhV+EmvFkRzQZGaFtx8J4YColXW9rC/N04SQpFTD0YN69N5uY8OJNbezlO08ZoQUcHm6aUIxSl9gqeKg2s3uGtrPEwGWuyrUHLZQUCMFUxb3mh6ThP/mNlcm76hKeFE+y9cRYG1SmKOGh2FDUpfC1JbpHwFtGnKYW41INQgJdpOZVdkvuyIdjDXgSAYUr+uNsB3yrzQFav+ZrE11R4mIXQADZ7Mhx1+Rdc0uI82u1aNKOS/aaU5afLxc4EQwi39VFmbLe79llIwwILXR9yNPDGgXfTt4Vrg5YwBhj4/1XgdFUWcqVlUfwfAo7gnweW9d//Ch5iIvoa7NomxH74JwMNzaOMDFayVrTUUMBpw5VDTBp0u5/f4PD0v38+10bIMXQ80pr9D59DVh/DDbWutYQloE=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39850400004)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(46966006)(36840700001)(26005)(336012)(426003)(2616005)(1076003)(83380400001)(82740400003)(356005)(36860700001)(47076005)(81166007)(8936002)(8676002)(2906002)(478600001)(5660300002)(6916009)(6666004)(70206006)(70586007)(42186006)(316002)(41300700001)(36756003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 05:52:40.1900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4159af-d003-4632-0995-08dc1b0e5827
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6375
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194116

Commit f673d3d239799fb1ab50f4aa5d44187666aa0cd7 introduced a warning for
virtual/ being used in RPROVIDES and RDEPENDS. Make it possible to
disable the warning by removing "virtual-slash from WARN_QA.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/insane.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 828f618cda..4ab7e4069d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -34,7 +34,7 @@ WARN_QA ?=3D " libdir xorg-driver-abi buildpaths \
             missing-update-alternatives native-last missing-ptest \
             license-exists license-no-generic license-syntax license-forma=
t \
             license-incompatible license-file-missing obsolete-license \
-            32bit-time \
+            32bit-time virtual-slash \
             "
 ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1607,11 +1607,12 @@ python () {
     if (d.getVar(d.expand('DEPENDS:${PN}'))):
         oe.qa.handle_error("pkgvarcheck", "recipe uses DEPENDS:${PN}, shou=
ld use DEPENDS", d)
=20
-    # virtual/ is meaningless for those variables
-    for k in ['RDEPENDS', 'RPROVIDES']:
-        for var in bb.utils.explode_deps(d.getVar(k + ':' + pn) or ""):
-            if var.startswith("virtual/"):
-                bb.warn("%s is set to %s, the substring 'virtual/' holds n=
o meaning in this context. It is suggested to use the 'virtual-' instead." =
% (k, var))
+    # virtual/ is meaningless for these variables
+    if "virtual-slash" in (d.getVar("ALL_QA") or "").split():
+        for k in ['RDEPENDS', 'RPROVIDES']:
+            for var in bb.utils.explode_deps(d.getVar(k + ':' + pn) or "")=
:
+                if var.startswith("virtual/"):
+                    oe.qa.handle_error("virtual-slash", "%s is set to %s, =
but the substring 'virtual/' holds no meaning in this context. It is sugges=
ted to use 'virtual-' instead." % (k, var), d)
=20
     issues =3D []
     if (d.getVar('PACKAGES') or "").split():

