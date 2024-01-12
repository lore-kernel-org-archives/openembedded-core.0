Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE5FC4725D
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:03:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.49])
 by mx.groups.io with SMTP id smtpd.web10.9132.1705071789223898707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 07:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=jEbTuZmJ;
 spf=pass (domain: axis.com, ip: 40.107.21.49, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFx3n0MEecxyH1zXAneokp0D6EMGpFDjUSb6OctjwKYl+sfMIow9RGxCjtGxC0A6z3CsEHR8nZh4wjDIHrKxeEQnYDVf4xnIXmvadvVR16CRobled48xGri8dRwMOmmZScmTLKnoHlCnFbgxNffL6lpVrNoQ55etf9saFyDbc1Jk+/E27nJkWOdOJrenZlE+7b1dy/jXQX6bdJeeGr4OU0BivEoaSJrUb8nzlTCI1F0qF24SMkY45hQioEBrkys4xzleUa9hNIwZ6TlKMi+5ELkSSWsvj+QkTe3+rC5wYZF2H+CFixO4cxRhEwvmEB768ofNUPdDr9aluJlnzuXx0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaNiYnyqZb35Q/4+df3asypfDwCFPhTV3S8lGPA3Bfo=;
 b=FlmlRLKRR0PuRo6gtLYxPKtm2sHriLhD+c+YJR4VZK0DNdpqNsBf3sZviMrlr4NFFScOBcMM2HGEmnQS0tKWAYqZ9DvrqE6XNVVr5YOvPK1X5W3ewDM66Pfh+8U8DAAsng2elt2dkPuy0V0vEj9HOTR/ibndD4ycYJugdFusfrvDco92wg3TDvXfM5Qio1Pq8GpQmSeB98F4WEAbwCLobt18kz7hFLPcxku7dUEB4ZMcZ1LwK7VJ7nQvW01hxcBgcgsFYxX8fLeD7x5ky/n5MLdn4acmnrorKOx4GCuDqGm+5YPmoG7R7/b7zseEOXajS8FUUBZUqbQb81O3lgenTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaNiYnyqZb35Q/4+df3asypfDwCFPhTV3S8lGPA3Bfo=;
 b=jEbTuZmJNCrnNVg5T+jgWMF35tNXi71OiC+xOo2L8BSa72//033PLudybar7LGWig//xHWQJ/HV5sPlac3+/1y38wbJDduVJtQWmjY0ihB4OgWMz1bJTWCKntPOpJM4dYxNxzo8dKt/c4Cm6+ctaZS+RUL2nvTiZ3oPisEtNedo=
Received: from AS9PR06CA0498.eurprd06.prod.outlook.com (2603:10a6:20b:49b::24)
 by DB8PR02MB5804.eurprd02.prod.outlook.com (2603:10a6:10:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 15:03:04 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::a8) by AS9PR06CA0498.outlook.office365.com
 (2603:10a6:20b:49b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 15:03:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 15:03:04 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:03:03 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:03:03 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 12 Jan 2024 16:03:03 +0100
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.125.119])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 74B0411FAB
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 16:03:03 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 674C98F4AB; Fri, 12 Jan 2024 16:03:03 +0100 (CET)
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] insane.bbclass: Make check_32bit_symbols check for file functions too
Date: Fri, 12 Jan 2024 16:03:02 +0100
Message-ID: <20240112150303.3807006-2-olani@axis.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240112150303.3807006-1-olani@axis.com>
References: <20240112150303.3807006-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|DB8PR02MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1fdb44-d557-46dc-2eee-08dc137f9439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DHNAWgjfL9MBPKAt/EVS65PV+rfcw1iS4O04hDEQ5+3o5HWVty44DfA+jdHJVZpOPQNa8mx0IZa6ho06iRqeTZcI3QtCrdGZYr5bOzf39bkEb6mXV5eepSRE5Hukv6ffY8lRv3JO/4hDrn3RXFGipydPYAHCLyO19fciUac/VB42rzNCBx19Mo6YF2Uzi05wHVehJ3Uw+ibTKWfAI8Z70OAWbiZSIOSEyAQgMpoctq+wG7ei4RSRtAfh73UXkQU1cMWzGwA9jflFcPZanWINPa5vsToudU45Vz4gGJ6raDEuadra97QlY9oIj3B8yodh8QB3r7YWE2ICbqjv+eGBsB+n7Si/Q0W2+nzke1y7HWqkgmusxTpKbaQqmmBmUIFUOvsEZAn/LM3t9/HP+5P7LbIlCVcL0kN9MytF8jymJxQUy9U2GCoooCedhJIm8rQW9BSnP7yENgONstrF3w1Uixw6/wniU/RNKAHV7km2pnaC1a+Azc5tbSkWxDdZS9/+TmwWUxSCCEiQ7mOp+1b296B6AIPirNZwTivKOPV48LiuX80aYF9KZ7lsme8JVxeOcLRhfC8JDB0MEEGpFfHjNSoRQADirT8GX/xngtAuXGYynfAh+k4tswqVDMJpUgQKD20kTSz/h5g5S/uahABBybuyK6nTlst0Nsd0uAFSXb9gaTz2pGMfyhbhdVfOQg1U4i9/f9C8syL9coJ2NwbXC+KMuwd1W3PMNMXpGAl3ZUuwt3lo6WEVrY9IWDXBLC4GnHpU9JO4gCnTMDahAt9A7g==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(186009)(1800799012)(82310400011)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(83380400001)(70206006)(6916009)(316002)(42186006)(47076005)(70586007)(6266002)(26005)(5660300002)(1076003)(81166007)(426003)(336012)(2616005)(40480700001)(8676002)(8936002)(40460700003)(82740400003)(356005)(36756003)(36860700001)(41300700001)(478600001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 15:03:04.7848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1fdb44-d557-46dc-2eee-08dc137f9439
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5804
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 15:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193587

Since _TIME_BITS=3D64 forces the use of _FILE_OFFSET_BITS=3D64, also check
for functions redirected only based on _FILE_OFFSET_BITS and
__USE_FILE_OFFSET64.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes-global/insane.bbclass | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 69741a6a79..1ff6a319c4 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -598,6 +598,37 @@ def check_32bit_symbols(path, packagename, d, elf, mes=
sages):
         "fts_set",
         # /usr/include/netdb.h
         "gai_suspend",
+
+        # Since _TIME_BITS=3D64 forces the use of _FILE_OFFSET_BITS=3D64,
+        # also check for functions redirected only based on _FILE_OFFSET_B=
ITS
+        # and __USE_FILE_OFFSET64
+        # /usr/include/bits/fcntl-linux.h
+        "fallocate",
+        # /usr/include/bits/resource.h
+        "prlimit",
+        # /usr/include/sys/statfs.h
+        "statfs", "fstatfs", "statvfs", "fstatvfs",
+        # /usr/include/sys/sendfile.h
+        "sendfile",
+        # /usr/include/sys/resource.h
+        "getrlimit", "setrlimit",
+        # /usr/include/sys/uio.h
+        "preadv", "pwritev", "preadv2", "pwritev2",
+        # /usr/include/sys/mman.h
+        "mmap",
+        # /usr/include/stdlib.h
+        "mkstemp", "mkstemps", "mkostemp", "mkostemps",
+        # /usr/include/stdio.h
+        "fopen", "tmpfile", "freopen", "fseeko", "ftello", "fgetpos",
+        "fsetpos",
+        # /usr/include/dirent.h
+        "readdir",
+        "readdir_r", "scandir", "scandirat", "alphasort", "getdirentries",
+        "versionsort",
+        # /usr/include/unistd.h
+        "lseek", "pread", "pwrite", "truncate", "ftruncate", "lockf",
+        # /usr/include/fcntl.h
+        "open", "openat", "creat", "posix_fadvise", "posix_fallocate",
     }
=20
     ptrn =3D re.compile(
--=20
2.39.2


