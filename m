Return-Path: <kazuyoshi_akiyama@jp.honda>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9275CC88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 04:25:05 +0000 (UTC)
Received: from mx0b-006e0602.pphosted.com (mx0b-006e0602.pphosted.com [148.163.140.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32289.1789619099030855984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 21:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jp.honda header.s=PoD-DKIM-Selector header.b=ScjZUT5E;
 dkim=pass header.i=@jp.honda header.s=selector1 header.b=YGgHJ/ev;
 spf=pass (domain: jp.honda, ip: 148.163.140.78, mailfrom: kazuyoshi_akiyama@jp.honda)
Received: from pps.filterd (m0469182.ppops.net [127.0.0.1])
	by mx0b-006e0602.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GM2cfB866493;
	Thu, 17 Sep 2026 04:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PoD-DKIM-Selector; bh=jPAvKeriIYgzln
	F9TIHG74nQOA9bf/3ZeUURwlDyzHY=; b=ScjZUT5EtBx9FNdrW658u+5qV0BCKW
	Wkt2AdHMnFtLPxL90jsQ3aXHOkA+T3+z6d9FRKvJYiUVicJgIadx+TeHd4trRars
	qZnuT87EZshEw7+51emM6qU0EFjpaC+ruxKg7gYhpBJvkma8vYQqc442eiHGB7Tp
	pRh1lklgzrNn/elCVZsHi3mwsFD+dUJ0OovIcjsziQwxWv3fg2ffd1KkNzZGSy0C
	qI2UcuUJsGePph1w9U0+Y/xfC6slVG+jjhUoOvg0VkuJppYLUVXpXEC2PEOKjFC2
	9LWhH31v40/3NQwM/0CEKOuT62dNlofyQoNxBf1X8S9ZxCnu/e84MOuQ==
Received: from os0p286cu011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	by mx0b-006e0602.pphosted.com (PPS) with ESMTPS id 4gqrrt2024-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 04:24:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGAI6lsdPVj0k0S6IpYxq9U25WQBbiyBtXfZfnRANMdo7xIhQLBQ/Ce0xnhI2LSDmv0urpH4fsmothKIY7gh3ku/Abh+ADvTFcP2TGIniyko5amzLwFsd/9GhHliae515JmRxfMIPsMT3WZiNWbGP0+aRMZZ0lCeCB38/CRL7w6Hxlra79S2w5gJTbjwfBaRP8wjLoK+pUyyE56fTz9BC5IRKyLFGWNIG4cr11sC3qOetOp9Ekbdw/xjnhYvgQb/Z33CYZZTRQTl78vRX3RC/6cJUi0+QwS/jnkDS57SDA0jU1TXpUqt2XNIbDmZS8SwlixrAuH9pJ2lBA9PJNF+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPAvKeriIYgzlnF9TIHG74nQOA9bf/3ZeUURwlDyzHY=;
 b=E2AlG+2cTh0eKUF9q4KlOSkhIrqp2MeGKkB1Ue/aFoJ7RvUqqMvUfhecDPOti6J7THWmXHEwzW78oRaPgwu/9QPJ6uDUFiYNI4TMCS2w2UWHNhBDMlLoUpFxU9lA5xA+cqRYexhvUFAqH1uJbjuXmwFOF9bT5sKQcJgehewiRk3dtCySTTVnSgtYFzL1JC7iY6eHaSXyQesoOQHPy4yorO727WVDrZE49XH3LICQMsHkL25DWSl2WNXp/cF2Qc7ZAtYStwy7uaxzfMFYQy7p6UcTiifgPOFu26o6YI89YNK55UEtR1gJvP57p1FkCLLt51Nbl2hJ/MeDT8oBIjVvBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 103.113.246.104) smtp.rcpttodomain=bootlin.com smtp.mailfrom=jp.honda;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=jp.honda;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPAvKeriIYgzlnF9TIHG74nQOA9bf/3ZeUURwlDyzHY=;
 b=YGgHJ/evY/vVbLbfqlC/lBWVcPupW1GwUJJcNBKk0eOpwYMgo9uLgBNaPdnZnR6slhVYeKdiJHATJJCHcIYhw7bbbFqJg9kwwUfGTlo7HFDrUR81NCKgnXfZtWaBA+iDb1jbIdBMLXzm5qVurnuj3XGvAAOLVijpN+egfecf//KEpWFPJ4sA+s0kyHRwixgybmCA+XZ0/ag0JA1fnZgK2R4A4iOW1HTnj8SifHIuBtyXKdI7yJCpNKHYVVSce15tk19PU9KFJWGhqJIENwo8sfJLmESejXFIuYB597W8PkAoz/nXDI+l5n8s9Yi4wjE+XQ/dUwMh9f/ni2zWKnDH8g==
Received: from OS0P286CA0072.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:9f::23)
 by OS9P301MB1203.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:2e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 04:24:45 +0000
Received: from OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f:cafe::22) by OS0P286CA0072.outlook.office365.com
 (2603:1096:604:9f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 04:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 103.113.246.104)
 smtp.mailfrom=jp.honda; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=jp.honda;
Received-SPF: Pass (protection.outlook.com: domain of jp.honda designates
 103.113.246.104 as permitted sender) receiver=protection.outlook.com;
 client-ip=103.113.246.104; helo=JPPFSMTPS02.hm.jp.honda.com; pr=C
Received: from JPPFSMTPS02.hm.jp.honda.com (103.113.246.104) by
 OS1PEPF0000D20E.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 17 Sep 2026 04:24:40 +0000
Received: from JPPFSMTPS12.hm.jp.honda.com (unknown [10.127.161.38])
	by JPPFSMTPS02.hm.jp.honda.com (Postfix) with ESMTPS id 78A08D000652;
	Thu, 17 Sep 2026 13:24:40 +0900 (JST)
Received: from srdserv1.hm.jp.honda.com (srdserv1.hm.jp.honda.com [10.121.66.58])
	by JPPFSMTPS12.hm.jp.honda.com (Postfix) with ESMTPS id 738F2A3A0CD;
	Thu, 17 Sep 2026 13:24:40 +0900 (JST)
Received: from RL25041301.jpn.mds.honda.com ([10.109.174.205])
	by srdserv1.hm.jp.honda.com (8.14.4/8.14.4) with ESMTP id 68H4Oeh3028153;
	Thu, 17 Sep 2026 13:24:40 +0900
From: kazuyoshi_akiyama@jp.honda
Subject: [PATCH wrynose 0/4] spdx: fix the compiled-sources filter
Date: Thu, 17 Sep 2026 13:24:38 +0900
Message-Id: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIZrq2oC/y2MSQqAMBDAviJzttC661fEQ9VRB6GVqbhQ/LtFP
 AaSeHDIhA6ayAPjQY6sCaDiCIZFmxkFjYEhkUkha1WKXg/rZnkXJ9/GOhTVpKtUyTyTZQYh2xg
 nur5lC78E3fO8SxTXXWsAAAA=
X-Change-ID: 20260917-backport-wrynose-8fa831054074
To: openembedded-core@lists.openembedded.org
Cc: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>,
        Benjamin Robin <benjamin.robin@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.16.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20E:EE_|OS9P301MB1203:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f53afa6-e60d-44ce-2657-08df14739798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|56012099006|11063799006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	XBpO3qMjLd0qMx+LpLtqnDka88aLCrc0zr43bQm5iXogexzoZThtitT/+MbjqMt+H+7TZpoYwVvNNGvwSLcA5tb9NysPamughE+kjq1FQSZOJoPA3sXEDDmpH/7BRy0QfbvcqzN1gQAW1jHVDoKLp+rnaLygAcZbmCUJORFliOuPCFocVQTzQdg5LiFgUzzEezQ6RcDY8p1BG5Zkc3WZN4VtrSuzPzwoE3nFJWXgsnZQRi8uWUcrjKiwiNSH9/F5uEOKev8bAduXpPIEXV9bfuwDw3lemGa4eKyf1eDDNK7dWSQJpuTlP1KsPhGyVVuRkaQf6IzT8e2bJ1EO2w7B5Kdil5O90lM3kEk+W1yQxw2ko84GKO0BtUFmthwooO7u3liVkOaJlUgBxnKuXpjsfWnfxvyUlSFa7cPpKVPIFImtkSQBBnf0kycAjVxL+YU7WOP7uLSgJb339QWI2lljOo02XxQvFfuXtglSapj75PyxkA9PXpPu8Oii4epq9p5cpb1Uh0/YNs7GAH1Oqkm8t/ddGUWA6oDIxtHKgtlxWn8Qmcs95ii99Ogk+Jki1+0fjQiUPEvviPOTNeBTuT7kKNmWhgAzd69ecbWPBcQTFxBVGYQ45hBAfPX9CxYH6Nc/8tHyKlJVVyw7sTLRrccWIVmVaS2gtE5VJf6xl7ty5yViLgBTm70OhjtMztciIi17
X-Forefront-Antispam-Report: 
	CIP:103.113.246.104;CTRY:JP;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JPPFSMTPS02.hm.jp.honda.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Hnr02Engx00rkvHGh5lkB/aULbZ3+yUxjS9pFbdWQQK1qxJTt6l31JKeUKMxvdEh+jgWZ8Cq6Spq1KnynEYJ8mnlu6c9zM5p3s3pSKOrlqUfsH0bcFnKxF/tabEMUH1IrRgdRogV8QPjxUruOQ1kIJh+06KAZWC4Iz7ljbccd3gWJJd3e0A45Bqn7YxcK/eFKYxhUOdi+ZDgFNmwFZ3UcgPeqhgVeavoGl9EVI8b6rDqHVU/wZSM6u6lyseHqQ/VioENn4ZvsBvyTLXXzXVvYzOWOYX+xkingh5oY7ofI7DYsvZODjjnN9Z6wbH7k571Eq9BCyZhhWOKgtDq7bVlQqCr7BC8MJp3mLeA5/afLV0MjjPx/mWvlrElQpppqegVPquifVCfNTxZP0rlmPU9sH76UHjyY3Xxid5cNnXgulZ5GjPGUCdFbxTEb2jR6H69
X-Exchange-RoutingPolicyChecked: 
	X20ji2MuLG1aEbaC7yY+pGen8kuGfCbmFK5rUNgnfCsSowAS/3OGUJ/MMAPYEkIkTNqpUEpjEKQO9CiOecJDZa8Fb22C4f13Y0HNvTN82RQKH18ZNdrUToZs/Oxid8F0YV70sRVLEKXdx6EE306KwOmia0A2Mp396phL811ROy3roMZ2BUEnl7p0SFNcr0ACN9CBrb1M6H+gZGrEvJ17DJQ4kKqpiBL0HTRWL0patCWf8Yd5UKT1NpKV+y7dqYxbhpsavXeEHzXIhSMmIzBP14PrCGklaF0Yiw5UgdvTT7Pg21QGPelIvpPd/PC2IePoVialw3zda9s6w7dc9Njchw==
X-OriginatorOrg: jp.honda
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 04:24:40.6386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f53afa6-e60d-44ce-2657-08df14739798
X-MS-Exchange-CrossTenant-Id: cc138ffb-9c4d-433b-b211-d4549ae62e8b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=cc138ffb-9c4d-433b-b211-d4549ae62e8b;Ip=[103.113.246.104];Helo=[JPPFSMTPS02.hm.jp.honda.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P301MB1203
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 04:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246007

SPDX_INCLUDE_COMPILED_SOURCES is meant to filter all source files down to
only the ones that were compiled before adding them to the SBOM,
but on wrynose it doesn't work.
add_package_files() is what picks which files go into the SBOM.
It walks ${SPDXWORK} itself to get file paths,
then keeps only the ones that match the list of compiled sources
returned by get_compiled_sources().
get_compiled_sources() just returns what save_debugsources_info() stored,
and that data uses paths rooted at ${TARGET_DBGSRC_DIR}
(= /usr/src/debug/${PN}/${PV}), not the ${SPDXWORK}-rooted paths
add_package_files() compares against.
So the list get_compiled_sources() returns never matches
what add_package_files() is comparing,
and almost every file ends up marked as not compiled.
This happens for every recipe except the kernel,
which has its own special-cased path.

This isn't just a matter of the SBOM missing the right files.
sbom-cve-check uses the same match result to decide whether
a vulnerable file was actually built, for its vulnerability triage.
If the match count is always zero, that triage doesn't work either.
On yocto-6.0.2 we confirmed the misjudgment affects cpio and perl.

master already has this fixed,
and this backport brings that fix to wrynose.
b567c2f0d9 is the commit that fixes it.
Everything else in the series is a prerequisite for that patch.
Backporting b567c2f0d9 along with its prerequisites
brings wrynose's behavior in line with master.
With this, compiled sources get counted correctly,
and sbom-cve-check's triage works correctly too.

On wrynose (genericx86-64, core-image-full-cmdline),
the match rate goes from effectively zero to 93.9%.

One thing changes.
What the SBOM records as a source file name changes too.
aa44a0f0eb re-unpacks under UNPACKDIR instead of WORKDIR,
so a recorded source file name changes
(e.g. sources/acl-2.3.2/... becomes acl-2.3.2/...).
This is a change to SBOM metadata only.
The actual build output is unaffected.
Anyone diffing SBOMs across LTS point releases will see it.

Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
---
Benjamin Robin (4):
      spdx_common: simplify get_patched_src() implementation
      spdx_common: modify UNPACKDIR instead of WORKDIR in get_patched_src()
      spdx_common: In get_patched_src() ensure kernel dir name to be ${BP}
      package: no longer modify paths in save_debugsources_info()

 meta/lib/oe/package.py      |  54 +++++++++----------
 meta/lib/oe/spdx30_tasks.py |   1 -
 meta/lib/oe/spdx_common.py  | 125 +++++++++++++++++++++++++++-----------------
 3 files changed, 101 insertions(+), 79 deletions(-)
---
base-commit: 9da814ca3685ada3fce46b8987f04ed3d57247b7
change-id: 20260917-backport-wrynose-8fa831054074

Best regards,
--  
Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>


