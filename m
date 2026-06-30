Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69D7C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 11:50:58 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19141.1782820248848758537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 04:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=DlcX1Njy;
 spf=pass (domain: ericsson.com, ip: 52.101.83.46, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U99ai3hZbqPSoaUd2rkTQMN4JkH2H/PoKwxJ66tfFagC7AyTa3BGilVhqBhA7LJ7nFyjXi5LKUijZrfiCtdhgg1aSXLmZy9eTUpG7ETrehIBwxG0HeyAMRAnjKoiM8bbcmmYOrL4ET+a3KqZ76KRqW66I12Tu4gI2TLwThAOgVyuq6fdBw/yBeE0vlYB/Gw6wqUbk7Mp6swMkAR8jXWmV/hz4f21f2i1Mn4CPTg/QWNxyj8VjjIR8cExcUQ8Y/LKDjAScEPtjlGXNSAFuiRdDzXhkbzpSfnLy1oCSAXvBVI1BkfniKgwrfL2K9Iz/QPm4naQ13gagRrJFZxkCiGQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdM3n1/K8I8qoDt4PrFuWEjfbR1KN3NuBO3FB+aYVO8=;
 b=isfzbz9f01CUiPG4n1Xa4RnLpKX24+MU/nyk47XAeouF58RDOzTJVrIMCq6QLiFUzr3BNx0/QBfl9iiJ3B4CI8MEFdYts21Sme5/2JOWuFpIlcR/OAy/k5zr+Sq5R4r62jwG1id1g4xhyowufWHto/i7tz+9o9ssg8Mz4OrDakjGHI1auQUvWFQf0PyAQw4OzAsJaxSCG+X7Ezba1ukpdOBXKSXUtfzO3FlR+77eblPntWtAp2Q6rdLezQTHYdLLCM6Abt2EjLkrf4THgu6YOYsMNdlB4aQoYmb/mqMp0qrY4eZkAxTO1YSYN8xNOn6nozYmrqDn6zlRTn2PzqbY9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdM3n1/K8I8qoDt4PrFuWEjfbR1KN3NuBO3FB+aYVO8=;
 b=DlcX1NjyhLWqhqZjQfaXLFxFA2csb3s4g20YdR2bbvy2+horFSvtwXW1rhPL3K9YDBbGd0Y9xfof/qu93Cb4WXutiuy8PuV5TUAdpRMQbfpuTdNbjADf859MUu0/HnsXYybFQE3hnoqXIalWmejWik76uS+Yttn3H7TGe6/a7IMLKw2s4oHnTa63kBjyv83gsnQi6uQPfGqJyXSC0wS20pTzwD8KjXHXHHL35OPYukgWXbPp4f1w+sYw7VTThMOb6qMVAJel7maHrR0RD5XjAUNXdy5Ed7S4Mc4eHWeCy8NNIycqRBJphwdhyh7FgjODpM6cd6cLrVyrK2cJO3tOMA==
Received: from DUZPR01CA0238.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::9) by PAVPR07MB9262.eurprd07.prod.outlook.com
 (2603:10a6:102:314::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 11:50:42 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::3e) by DUZPR01CA0238.outlook.office365.com
 (2603:10a6:10:4b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 11:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 11:50:42 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 30 Jun 2026 13:50:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 764D64020B40;
	Tue, 30 Jun 2026 13:50:38 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4541A700DF49; Tue, 30 Jun 2026 13:50:38 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <qi.chen@windriver.com>, <alex.kanavin@gmail.com>,
	<richard.purdie@linuxfoundation.org>, <Ross.Burton@arm.com>,
	<mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v3 1/3] dlopen-deps.inc: treat soname list as ordered alternatives
Date: Tue, 30 Jun 2026 13:50:22 +0200
Message-ID: <20260630115028.4001775-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630115028.4001775-1-daniel.turull@ericsson.com>
References: <20260630115028.4001775-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|PAVPR07MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: c8af7a65-4167-460d-a550-08ded69dd008
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YfKfHW9tFV/ZBWBXMxSqaPfAxTXfeR8h5xnjJpOoqZNBtQH19DV42JE83B7NTjLGniAAEUbApZ/sAmkG13JP1cYdPkLfax4NMbfOZ4lJnv0zeYTxMl2IlSeoj3mn+554q2bMnpvtsAFrF5JsunAa0FEtL/3wrjfvyNceue0cOR53tgK9+R2Me3zKYW4k8QiZRJDDttO07mBIAomfEb7CCPN1tLcPOIBqZDB0sQIkvJHlUrOt/RO34yeC5l99/mzDGNdMRnMRfVRZUH7V4XRHB5znJ1r6Onoyn0MeSxA5BOCCrWRCKuxFhwjKeXtShu1CoZrY+DYV3Azm5FrEuZY2MCON9DdVpDU2t6d8VAULXqSLP0CQmv85QkmS5KTaDIOaTbdVZIKkqSjNETCC9ynSO0WdRBiMQmzFS/dEiSJ6rBhzo6IhEayBR7NZkaIR86PqeKmoCGrvBzConLJDzcisPqbzgUiZLk0J8UfEwSLMq7xUX7ZN0IxQmdYY+wiJsO2rLbUBy66S0pUfW3b9lbH3YJvvlqARiLhdoCzrZWVEleNOz7LbgZr+KnGtDhIkftZydcjADdUr1UHpGqiu6jn5wGoQy22roGcAt4FRCjqUZCmmbFHFFg1DpHIGE/oCdxw0fRAFEck2gXkC8e6cJ8qV/DinMzPZcB+z8/muBu7pRIC72BQ4Wzhj8cdcaLtM2xdOaopgDfNjBFPpA9wGF0eQIQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dRkb9u6PSvRugQwp0bXofUDgxUyF5Dq8bgai7+Heu9v1NBietFN3EkVACbzpTW6NC3J4mIEWID1wKk5WT4LDGFd4RhQIuJ16/PZ/vM4rjSYMkln3y2xQLO5ShzWKN/2txt1dzvqbecxNWLurJbzFyCfx8rL5qW0CACFfC/82L4hP+cg7ORPV1tchkdXAFRagKchHL1AWSVpYtBT+29igmDnXHV6gWtWNRygDkzwmUjMG/Y7lKJCx1Z51+pyYkIsadf+4zbQtM5UIZe3mAmdB27B+7GmiWdIzwqyEkV1YisjvZxLD7xEjhORFsvMb88BblRE8zjfnGv7IYEGjwdxVE/c4SF0Iv4uf70nu/bOGDQ+6f1WU5nBYkNHGgnCKh8TMaj8vxiWsFnK7aRgQWTa6svEiF2PkOORhxGixhkG5AQsl/lcwZfA9dyiDkC/LJoPX
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:50:42.0812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8af7a65-4167-460d-a550-08ded69dd008
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR07MB9262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 11:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239882

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

