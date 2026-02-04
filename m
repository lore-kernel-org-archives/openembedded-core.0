Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A90E83F0E
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:43:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20605.1770212580659200593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 05:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=WIBZ5ag9;
 spf=pass (domain: ericsson.com, ip: 52.101.66.23, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9aSqu3kpbN74Dqm1xRorYxj9c2yIR8VWYCh1iyR80MndiBqEN9Ki1ewjQ6AeC3ZPDlZLmJ0POsMmdXX3s5V1d+MkKzsmmK+Wuv2XxgK2B/R5mmziQjG4RWdJhEnt0/ehJnBa4hxTwMSEllD//Ea+mLeZK397ssP6K5GojM6/NifeEpnyF3SthiPEnfvSFaVkaEpeUXuKt4QTdC8RAfdzdYDU7fPEXM5ESVjPl7qIAgjeRs1ZCcE1vjlyDYW4UFEqPvNroVQrwytVPgUj0pmKVY1ICUP/6eanMRNmQG/aLVjPkPi01NncTDIJkHdiG4fOjoOTMS0kDuOv9zmMmTkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFIzuFJXX99sFpFtkCWTU/FjZMsYfp2whGkHLAZ6yi4=;
 b=kocIvlrjKwvdc4rfeLRrywYQ6TiP2UlsOyWVsLYvzDPBxMx+VC70A7JYyGLcdUmYMxyBLRkfPAcKLwv5+wK8BpjJ3lM2d4HA79sz2aeypwmF4uakB1zRz8d3h4z0VrkKVf3m6ju/0EnI+4HUqUmGJ+xKo5yKkQELvrdBf4ReuWDxuVUCSTlzBI1Q5xViQYkEDmEdCa8/3lBBnprinG61WdrQJcZKMeEyqhI2o838Ajhhv4ur91thYfYVEGZb1j6mgRbadX375ho4ooHvYPP7lulCAo0HKBD6OmMxulK7sEt4QcyQb86T8UDyeJaeWNvjtxn8znqNthw+cbXEcSpdQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFIzuFJXX99sFpFtkCWTU/FjZMsYfp2whGkHLAZ6yi4=;
 b=WIBZ5ag9CEIRgkzIrV+BaNRfYxga9rP2JUF+lyoSVzqI2dpqtaC/XmNE2kAwdAOO4Q0Ll8XNjnlkF/+SxIt1z8g3BC7nXCIuqtXp3oKh++VuY/4JUtXqJve+dgmzLaFI9wyXMCHoB+jIUYFxCTVr6ZaWQUgosKIXJ0OocYZPB5ct992/PgNxg1a9TjqVb+ixVrvwmayyrM8CHwtjygwUcrp8g8W3BsbGJTIMwiKxsK3f0vraTNTUJ0drEf7o1N7YdNDT7W1+BDb1SIcZnLEFfIYxrIAFRslTxWcaBXwwhhxo5rPv3chOqaBk+i8k/Ej6n7zM7SjqQf5l5RIKzZFSYg==
Received: from AM8P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::12)
 by VI2PR07MB10154.eurprd07.prod.outlook.com (2603:10a6:800:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 13:42:54 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:218:cafe::2b) by AM8P189CA0007.outlook.office365.com
 (2603:10a6:20b:218::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 13:42:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 13:42:53 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Feb 2026 14:42:53 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 0D8C39569E;
	Wed,  4 Feb 2026 14:42:53 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id EF6757000699; Wed,  4 Feb 2026 14:42:52 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 3/4] improve_kernel_cve_report: update data if CVE exists
Date: Wed, 4 Feb 2026 14:42:34 +0100
Message-ID: <20260204134235.3274889-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260204134235.3274889-1-daniel.turull@ericsson.com>
References: <20260204134235.3274889-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DA:EE_|VI2PR07MB10154:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba55b1a-b889-4a28-fbb9-08de63f34c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uN76LwoAoybP5520JFMP0Y3xNev6SyeUXkoypKnfmSDzk+EwlK+EBeT22MsJ?=
 =?us-ascii?Q?YjpR9OrYE7kl4oV+PwUzB702QkNlUPY4bNaFMVdNp6cs7ipX7vhd0MnxAcRf?=
 =?us-ascii?Q?tyzEsdJlgURfwd/2oExvGFkiX/HuTRwnJKxFTF/j2vBY6lDAF4xle8uDeceA?=
 =?us-ascii?Q?4Cfcf4c/G7416o+uX13SXRS5IC31dAG4Wddm4kbGqB+CZq5Lwwimb95iae4O?=
 =?us-ascii?Q?gdqJDYTGZA/dimF/oezaJPK/Y7vvbkFteQnxm7qA5DyKN+G2oykVSsIC0Lvf?=
 =?us-ascii?Q?ZqhKhqVf8RPOYAeMA+BVx7TB+ceqJAQbYls0bZfglDw9ohRVHAGPlSHBlEQO?=
 =?us-ascii?Q?1JFORHe1kEBSGvgc7ekeSeE0xYxw+DqOI56J1KXZuXzzAkfBWOcZczzm4j7d?=
 =?us-ascii?Q?UroCoYlFS6ZAzgv+8Myn2p4t0haLS8jwi6ajrNDtQHEUQhJa8y5trFD7Gpf9?=
 =?us-ascii?Q?/zDodCE6NCHwKC3uFLgNwjAwarDAv1EMxXVH7IePdL+UaZ2qURWraTX2bkB9?=
 =?us-ascii?Q?BmrMKAFtOex25jUE6RPrk6swcqozcSXCS8I+j5TUvYsOzR/s6Gw0cl1uTabk?=
 =?us-ascii?Q?X8BIVnL5RvBSJLODqtwIA5Tbk8eV+fovdXLeazvBmRwXc8XqKPpxm4dqujHb?=
 =?us-ascii?Q?t1pqXI3ujgt7QapEK1ldzMUWRH20/41yvUjnPmBtqHBrPfQBzwr1NHgq8RZ4?=
 =?us-ascii?Q?38rZMN7JOLNL4KUr2B3Kj5x8NiS4HWXQ3wJGB1M5ryxh//uBj6Vrc+sBC0de?=
 =?us-ascii?Q?JaRF3QXsooKvL7dO7KThLS4sPq1RdfYTcJlLuvlQbF/Kf95EOncMc3FCoXBr?=
 =?us-ascii?Q?wq6LZA30KBeew0aq1Oe56H00fw8x1Pr9ktB9CXIXJq2l1AMHZnGYGVACjRYK?=
 =?us-ascii?Q?I2xvAMTe2/svPh+xkj8decoZaklHPFcTgMCxvxMl0YwXRt93eS+xs01+Y30t?=
 =?us-ascii?Q?aoMSJa4MKqagnIxxHAgnv/TSEgYFsSTrDaqnhV8EHxsGeG1GozqZ9wbvqSDt?=
 =?us-ascii?Q?r5yZYw3Ir1GDVNT7TbyNJLhkytLtXWwE/UM2eyHymxSqtt9sLD5jKfwBv7hV?=
 =?us-ascii?Q?F3G597pncNUxFyXZcCdpJL1r0II+QKztVtLivecwQ0Ogh7Or1ALhHW/lUYKC?=
 =?us-ascii?Q?3waw3BmZcQdmh96fJd/v7M6NSSVQW2mBxrGOEKfKKMpd3pPoNZHwP2VjuRWy?=
 =?us-ascii?Q?17EjftWq1CQNrIy5D8ZLj7lQEIMqXoCHWPMJfrU7GpXAzTzedykLeWKBRYc8?=
 =?us-ascii?Q?uLTHMNhIwfALSa0HzTSZG1vmzpmy9RdPc3PoqEHYHSD1PHqP98OTmIL0LJWx?=
 =?us-ascii?Q?8e0h6t4igACSEMFBzY2vwtdMGV/l6/VwUqszb+X4SwOl22RwVz7cHJgkrBhw?=
 =?us-ascii?Q?CM/mqbLgMBVpRm96j3yu2nYJQxWzlYx5ppHMxPfgN5H5MVZsn3k8boVRSwbs?=
 =?us-ascii?Q?ltcCgQvFg4c1zYc46wxZIp5Fl65FE3mwRQMH7GfCrotr8E5GOo7n6sgryfGb?=
 =?us-ascii?Q?CMH1B0oy0BHt3YozIUes4MxcokCmx3H0NgJYgM4UotXJdcwqHC0qqWWZenND?=
 =?us-ascii?Q?1U4Jcu9Jx0UVHiM943S9/JREJXXIPWE+i9CJMfTKjQnQ1Hcvl2cjIK9BZAgk?=
 =?us-ascii?Q?sYRhxuPscb8e/cjHNXde8qq0KZNGOUWWhVufwZDATneSM6erbh8n+7iuW6bR?=
 =?us-ascii?Q?LAUOjQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AqtAXB8wgGcQ+MEItwh9wKfI9Zu7zfQQp1j0+lvAWmEPqNewHmRe7TMRSDOAJnN2WiT7YRj4UpPoAPB5I7KmAER8hglDejWpTEljrlOWZn7qG8JRJPsbS6uxTPodAlRXn63F9eOVGqCFi8QkxLgXREcjrCUUmdd3S99Gyk95ExFonaf7kgS3X7k8uWprKLi2yeYAlb9AB50Jm9Olqo4v2zI8+mApAvRFF1lJ42/Rn7tsHTqCK5FvH2vSpcHUryk2ysCvlI6FzYIFCUB0INqcfl2uJqAGqtJnBjxU6E/9kuI/SGSNFG9KQPcr7/p+r1jYO1Q6y2/0gGBBy6dOCRkypqAAeYM6pQ5zSHZhnfxlbsZEDsnBvBC0mgRW8bkaBy/Osug63/lGetaLyZ8j8cTk4/77e8GSYTCTqhzE1zYnX0uOWgevQwSiPGTU7mZSGEED
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:42:53.7404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba55b1a-b889-4a28-fbb9-08de63f34c16
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR07MB10154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 13:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230525

From: Daniel Turull <daniel.turull@ericsson.com>

This allow to include additional information if one of the
sources is more complete. Updating description with more
up to date information and including summary.

For example:

Before while using cve_check:

       {
          "id": "CVE-2025-68167",
          "status": "Patched",
          "link": "https://nvd.nist.gov/vuln/detail/CVE-2025-68167",
          "detail": "fixed-version",
          "description": "Fixed from version 6.18"
        },

After:
        {
          "id": "CVE-2025-68167",
          "status": "Patched",
          "link": "https://nvd.nist.gov/vuln/detail/CVE-2025-68167",
          "detail": "fixed-version",
          "description": "Fixed from version 6.18",
          "summary": "In the Linux kernel, the following (...)"
        },

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
index 50d25b2239..903de0000c 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -358,6 +358,7 @@ def cve_update(cve_data, cve, entry):
         cve_data[cve] =3D copy_data(cve_data[cve], entry)
         return
     if cve_data[cve]['status'] =3D=3D entry['status']:
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
         return
     if entry['status'] =3D=3D "Unpatched" and cve_data[cve]['status'] =3D=
=3D "Patched":
         # Backported-patch (e.g. vendor kernel repo with cherry-picked CVE=
 patch)

