Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785ADC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:14:14 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.45])
 by mx.groups.io with SMTP id smtpd.web11.9475.1705072447943595064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 07:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QmKverEe;
 spf=pass (domain: axis.com, ip: 40.107.6.45, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3SSzTZcYdXbwLrmSugC8bLFonQ2fjp8Xc5Fhen/Iz96N3XXG3BGBUJi80x6Y7zUOCX49LjpjdxfSEsTdtrANcXhY3koN+mbhW5ZuijbnXIqTBmqhrMk1i46pD4IcJ4i2qkZ+NyRj0mU0azBY6O45UqTZRTZozdxUw9b6rQ7PY8r7K19WQcszviCiPw0jLDx/gIB43rD4vg+PTqTj1opb5aOsEse5S0BcY0Tj9Rgep2LOufbam1AJ40bjDYrAHxXmZt2NY2FPWpge3/tBkWjToB439EAIMFxAoT0X/wydAgRXPDA8aIpfYD9q2Z+v1lcJP1HC/uwm79899BeHVRQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaNiYnyqZb35Q/4+df3asypfDwCFPhTV3S8lGPA3Bfo=;
 b=ItajaBpL2xkVXg+SXeosuG7Y7/0N6vKR9/i8E9NVtYQLxVmZKunxxoQmzDuM1GrRM+7pyGRwvL8LPFaVdxvRA0tvR/HYfGKAg96uni7fSouBgm6ih+IRE3t333u8nXX+Jlmjxk/XMq2Q61Zd0pXZBY6hSTqWXlVhnIeXc2C/rmGG6zxKgEROo/dSK36A+wfXM7JU8HOg3xw7IyYrlmYpE7Y7bnjmf2mTJHRkmen6J14xtQXxgoll9D8/nSGYIMM21Ljs9lm5b2qcVoTwNybwCJueeLZO25UhaJLBqicSZIdneVrscdn7tQF6DKDc5WRp55X876IvFySjWRL3s3wrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaNiYnyqZb35Q/4+df3asypfDwCFPhTV3S8lGPA3Bfo=;
 b=QmKverEebd/X+SFfb7/TqIUFG2v321NW/mOkeKAJNcbV3J926gBeO8f+vTvIhCyRu+fF8o7CdayfLjTFpc2DiPYVLa0K+UrLQTWKwk9FPZRL1JyvzoutIQFU+u3qOUlhvPvw9aIcnA8bjYHtCj5oCmYO0Wz4YQ5I4toBon8B2NA=
Received: from AM0PR01CA0166.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::35) by AS8PR02MB7223.eurprd02.prod.outlook.com
 (2603:10a6:20b:3f0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 15:14:05 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:208:aa:cafe::df) by AM0PR01CA0166.outlook.office365.com
 (2603:10a6:208:aa::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Fri, 12 Jan 2024 15:14:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.13 via Frontend Transport; Fri, 12 Jan 2024 15:14:05 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:14:03 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:14:03 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 12 Jan 2024 16:14:03 +0100
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.125.119])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id AE9B311FA8
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 16:14:03 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id A16A68F4AB; Fri, 12 Jan 2024 16:14:03 +0100 (CET)
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/3] insane.bbclass: Make check_32bit_symbols check for file functions too
Date: Fri, 12 Jan 2024 16:14:02 +0100
Message-ID: <20240112151403.3810910-2-olani@axis.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240112151403.3810910-1-olani@axis.com>
References: <20240112151403.3810910-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A798:EE_|AS8PR02MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: cad354de-ad37-4f9a-85ce-08dc13811dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZE4+at5igQeSvrY9HwG6IRu4wI9PeRW6BmWFAUiXNor3pawhwiRPj0wTPIrAsTkSq2Eykxnr3LN7BTcL+4lV9YZOjWfcmqLywJJ5Nml0ZwrfGI0Kd46hSoIpyQRtlBi9j1qcN4kicliI300yi7D1Wh+jXhNbnLKYdv6ZIR35rPxBfxHyGfb46obm8+ecvHH0lhkYqeyqDWrlgxsa9m4NK88N1VfxR46+LmLD9TL+AZtMXop/tpIwdpxVbLxMuPXMsBkRxvSLJFW0btVsjM34BVz1nP8wfHWUD/o22+eEETEYv8nfAQ2IaBklyCbRppBFxL+K/XdwuWItoi6NIGbWhbypXazzRobAxe640Io3Ikz7gvBTvQDH78uswNamIQ8KTukynubg19T7LhiP9QK1IoGm7C3GzP1CIHUsISJ1KzYk8g8UtqJkcs8CeTPRrtDDrsWOEU3dN5kF/aUgp9ja6QGFr9I0m83Q7wrvwX27FjwIzpfitosL2eRnFO7DFCnhVpUZB6dGq7Neha5mvE0m1ZZGzfT3W7h4/DDjne0pW8LOFtA8K42I3TvGITEDR9etEFEzO2zmHna+kHfF+7+YvkG8krlvYjayVpBSNBK1DDdHAB4A82cSo7grKYUv67cozuQOZ/+iF9bZkevU+mx70AUzkztXlRpL4Wl9BiTMrLjsQOq1krGoFk6KZ1X5HLnap8wtCIW9x7pFYG7krjPJLV4oamHKFYgdKZtp4WSVdiWID1EB/jmW+kTujbrnT6nQtzBci8GLymePxqu3Tre0DQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(40470700004)(46966006)(36840700001)(8676002)(8936002)(2906002)(5660300002)(36756003)(82740400003)(6266002)(478600001)(81166007)(26005)(47076005)(356005)(426003)(1076003)(83380400001)(336012)(2616005)(36860700001)(42186006)(316002)(41300700001)(6916009)(70206006)(70586007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 15:14:05.0754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cad354de-ad37-4f9a-85ce-08dc13811dc9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7223
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 15:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193589

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


