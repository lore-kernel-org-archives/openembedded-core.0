Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44105CDE00E
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 07:38:39 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30535.1782459510193936901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 00:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=SCRJriFl;
 spf=pass (domain: ericsson.com, ip: 40.107.130.24, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRGCQy2/YfnIU4qqyYnJIIs9mb1/yo1e6g/u/mAmO2iOyEBg1k/JkdB1X1Ep8h3jQ4xvEsqhsgUHVUh2qcaSuX3itgetagqPn170eGlBDC7gO4xXxxSUyGOVYDFZ94YzcaHB384OIYDJtUH3onNxlier9wrq2wpkScOolRztkUcbit8WRHNo1Dcr1HDT64Q5xtsKllnVGu2R5YeZVNtMKtLpGAdEbuKuXcGZUZUBtp8tFg4CHKaI5soGcToFW02A3XmKJsIcgNUhOSGZxM+StIeadFkRTtss8+OlHl0Q7TCMd7E30CrfUpGLR5uoXdksj5jucZpw/ZeFwwX7RGwp/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdM3n1/K8I8qoDt4PrFuWEjfbR1KN3NuBO3FB+aYVO8=;
 b=ebSCrEWrYvwg54vbhW65mvOscPFVsu7/KhTN5EZuvfMe7xmZ3Kqvj8PS2vTIpaOttRQxZwDRKf8A35/ZNCWHz0B7JCpbsaslrr3yRtUcldnvi/HjxeZpjOGRvCf7/C5aMcOMG/x3E4WCnvtG/g7X4VFKXn5PmpQ+1N3d6Hi3kZpE2LF+SbIOFt3e0sIIZpy+QBaC3wEriImm+gkZl36ndN2VxqbqXQdtdfZJgmGBq9lqqyDH0eDvW8Ltp5eIQI7yL5715W+TskYSKDJF/DOQEgy7r5kWklrszV6uT4CWusqknuaBetMs+mjZsVq15OshEHb6DzgKJGVlD5TPfsTeKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdM3n1/K8I8qoDt4PrFuWEjfbR1KN3NuBO3FB+aYVO8=;
 b=SCRJriFlLeATP0poUS1jUHeTRCxQczD57AFm6hhah8YRHM0rzYcThUbA85/f55xS1BTbrlh9Pn06X7sC4ATJp1BKfSgHdJ7LlW+N0CYPAYS2qUFZUoX4rTJ8qacIutxkY3E0twRbfe+39EVJNALpNHLVzclTf98xYYoD9t7lsSeqgPGNk3pcFNRh+8nPYGcy/Ia9YY0ChaYaJ63drUETGJD79gpGWofEBqkggSMzlSKucs3HnWOHEOxeupSVvr5GXqQ0CbT22LyrBGdbnc5SVHYVZCZ0ckYaGPSQlYcXW1KG7F54EDuoZuwpP8JzTk1BQAq8CaZl1PrD3DuQ2nkQMg==
Received: from CWLP265CA0529.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::20)
 by PA4PR07MB7566.eurprd07.prod.outlook.com (2603:10a6:102:c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 07:38:24 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:400:18d:cafe::33) by CWLP265CA0529.outlook.office365.com
 (2603:10a6:400:18d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 07:38:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 07:38:23 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 09:38:23 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id A7EC16BCE0;
	Fri, 26 Jun 2026 09:38:19 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 67F59700DF49; Fri, 26 Jun 2026 09:38:19 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<joerg.sommer@navimatix.de>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 1/3] dlopen-deps.inc: treat soname list as ordered alternatives
Date: Fri, 26 Jun 2026 09:38:07 +0200
Message-ID: <20260626073812.769193-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626073812.769193-1-daniel.turull@ericsson.com>
References: <20260626073812.769193-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|PA4PR07MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 848ac914-bdda-4a04-a08c-08ded355e750
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	n22ZX4Kitu8JV++r1qF6Qcs0J6lwk1LiFV3Tu7n7XpGgfEQWwXL/glf4nCC8WqQ9WkFlU/QF4lzK7j8QfGY0MuNLs0lHE0mVYYMh1/1EIBbubfDMjEP55X+9/WW7JHZF40Bvh939QuL+6a6pNNDBM++ZxQccxdJpB9c6LYyHWmFmy7CXMfK5txepb81I1XdcvkbJx/395gi+rv61OnlP7sJHUIOrUUkWMfeHb5nUOFelUHGt0qS6W0zDV+HErh3Dk0OZjfVbzTu4oj2OG0/iG8sB+HhwIOOHk18Qs06oKqAsz3/u4iVyuPzE2+SLsfSq4w7VRJjPJl3mefa8vCuKEJraH85b+pVOOnaVT4ntl6FfXRouB6Baus9z7G7atZkLbOuc4FB01nF60KIgNSaYNTZTHXjg6hNz7lGB9fuGo8VzXw3vZtqYB/d+J2+zxSDIXE0ooE5Mru/ykugm7D3S/nTCe09+uL4ZmCgmw7CaixakXLBQ72VP/A6VIgn7lU77ULmDf7nha72nAGiov7epgx9L1JP1IofXgljcsqueynZXs5DfMFznNsdfrYWbSO/vnyIBNLCp8CniKtP4jvJTs5MZ6skEQ1Nn+WnKHBEMy2OSe1i+YRfrCCQiZtnsFJZpqeU+nO4KRN6qO91JN3TBJvYQoT8PJAshNgVWiVlUKwld/n9uGr6odtI49PFZ4M45RGzCKMcdbSX21JOm4z10xg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WAQE6cmkP2/6FQqcsJ939cLxPWJ67XOD14KjnjRlmswp9z+I1uepBmxzYYa+Z1k3HZIRylscQHaAtn9ZeKxSFlpHQdb7VXqhC56WxiDRpE6MmBFD7Whv617jYT4SIIVNqlf65WkvZCwDqoA4e5H1QD3qyjVLKO3qjVuegUMD0j5jv/5j7/vz4YhIZ4PWZ8rqA9VaV/MuRIKxytZS5isTxlD+H4unsgNp22YVqRBiVuHnJi+J2K0h5S1dGJcbmv+TwRVHl8GsYGE4MDDSSM0BgDRIAByJPbGtCtqJ3YvBqWCqQiDKglUlp55scxK+MM5bABONOwb4hJXg2NmsAaEAG2IMYiZqiqbs4mb9AMfHa6buee0gAyWsc6XuTyPKjb34hY6xhiaFlKdDjPL97JU0QALYB0a3LrpVb2NfG0WzD1P063zT7TQ6tVNhimJyf8+b
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 07:38:23.9061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 848ac914-bdda-4a04-a08c-08ded355e750
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7566
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 07:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239608

From: Daniel Turull <daniel.turull@ericsson.com>

The .note.dlopen format defines the soname array as a list of
alternatives (e.g. ["libcrypt.so.2", "libcrypt.so.1"]). The previous
code warned for every soname that was not found, even when an earlier
entry in the list already satisfied the dependency.

Select the first available provider and only warn when no alternative
can be resolved.

AI-Generated: Claude-opus-4.6
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-core/systemd/dlopen-deps.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-core/=
systemd/dlopen-deps.inc
index e0b333398c..82a2ccd389 100644
--- a/meta/recipes-core/systemd/dlopen-deps.inc
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -66,15 +66,18 @@ python package_generate_dlopen_deps() {
                     elf =3D oe.qa.ELFFile(f)
                     elf.open()
                     for dep in parse(extract_segment(f, ".note.dlopen"), e=
lf.isLittleEndian()):
+                        # soname list contains alternatives; find the firs=
t available provider
+                        found =3D False
                         for soname in dep["soname"]:
                             if soname in shlibs:
-                                # TODO assumes the first match is good
                                 package, version =3D list(shlibs[soname].v=
alues())[0]
                                 dependency =3D dep_map[dep["priority"]]
                                 bb.note(f"{pkg}: adding {dependency} on {p=
ackage} via .note.dlopen")
                                 d.appendVar(f"{dependency}:{pkg}", f" {pac=
kage} (>=3D {version})")
-                            else:
-                                bb.warn(f"cannot find {soname}")
+                                found =3D True
+                                break
+                        if not found:
+                            bb.warn(f"cannot find any provider for dlopen =
dependency: {dep['soname']}")
                 except oe.qa.NotELFFileError as e:
                     bb.note(f"Cannot extract ELF notes: {e}")
                     pass

