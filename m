Return-Path: <maxin.john@gehealthcare.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570FDCA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 07:59:46 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4490.1791359981762232701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 00:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gehealthcare.com header.s=selector1 header.b=feHTsotH;
 spf=pass (domain: gehealthcare.com, ip: 52.101.201.49, mailfrom: maxin.john@gehealthcare.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVUjGq7emfOC6+n5bu9gg2lLdctSLszzSlI8DYvoFtvYdLM2nKVgkq10hCDDJ1JAOoqRpXEG+CTX0OLJh6WFa5fcRKUl49dr7gfN6Ldexw8YOE6qR6i5UxNncmG0ZWP8lRgmzQlu3FTMV5nx+e0cbso6yttO8afcvQw6lTDuUtWdeVNFGd3W143GfXew3ryXriFMZb+NwemZQhl6gTldFoR/uzsFhk+Jc/Ln9YvXhzsLdOrpBZRaS2Xrn35yBst8KAJSu647Q0aFbhvsliv7JlIiAhee9Y11bQcFY1DnmGJrSmleHNLn7GPG5oq86KNEcATGst7ZYjoU6dtSuq+ydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZo97bck5VmeOL0saiAO5n0mpyW2KF2n/hX3nZWR3KQ=;
 b=c2KDDTS64t/mEfqW/nAQTKEEFBXg/GLhIOgVfYzE9G9WE9m64piFpU4cQpSz6M+3xbJBTCwUOskOGllXOUtiuPLFEcduTQjX4xTnrC7wSSyOHZXo/h1xkTV/W0fHFqXfOMIFZgYsXNmY1un8cwIs81XT/ui+5nZKK0SPdC8/4DMVT5EHHNdMtxyiEVkuUH7lvNy4d8XSPPJYOXCES2lJPibKP4m86qgHfSHXOaJMTNQwvyUAUi2T+EzkXtjrcG4dUdNhYfEHakPA1Q3YW+prAkShm7jTWda9BcEvhyZ6K90DRFlc1nQbyzZ+Ra+GbKiU4zLlrU6XsXNNyUNgnM8bfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZo97bck5VmeOL0saiAO5n0mpyW2KF2n/hX3nZWR3KQ=;
 b=feHTsotHeV2txW0GUMhyeBzamQxHMPDkTJv+RhYqaQW7WangTc/5UhygUAtR/D8lptrvbUBt0pGlNQezMGLUJRBJkrB5eSGrYKJc/HDFS39SNgQi2h8quXYaF6u3Xq2NLALuFXbUsQ6w43cgJxziq6ctpoIcEu69sJodiMrrm3CB9gaooRV5x8TBWlNjqUf60+HH+WAsuYcVKDj16VUVoIPioT3yllIfgen3+P/eE7VGBHJ6G3Bt5p8TQ/oB65vY160CAGjttsyvJ0R6jVnDkE/MslmSM5WbpgAmeHu5IGWCx5IZ9e2yvekBpuLizwj7YIsUUpa83q+l0brpzHmuGg==
Received: from PH8PR07CA0038.namprd07.prod.outlook.com (2603:10b6:510:2cf::18)
 by SJ2PR22MB5264.namprd22.prod.outlook.com (2603:10b6:a03:586::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 07:59:38 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::62) by PH8PR07CA0038.outlook.office365.com
 (2603:10b6:510:2cf::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 07:59:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 07:59:37 +0000
Received: from b782ceaeccd1.fihel.lab.ge-healthcare.net (zoo12.fihel.lab.ge-healthcare.net [10.168.174.110])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 1CD951A2D0
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 10:59:36 +0300 (EEST)
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildhistory-diff: fix handling of a missing previous build revision
Date: Wed,  7 Oct 2026 10:59:35 +0300
Message-ID: <20261007075935.12-1-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|SJ2PR22MB5264:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de204caf-8e74-4200-e38b-08df2448ef35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	yBA4a1/5Xt/5IUxKsfmxYbctkwVJz3IH54LYQuxtMe5ZPoEM5dC647hDyr8gHZhViRSUEyfpev679tKIFGZxXYBgItKNydMx98VQmcpo92ItEoHOM/7EctIjHK1ukEF0T5zLpaX4mb0AA3vL+hs2Zam2ljlLjD+mlYCnb48VGOVSTzwO0Ke50ywENci61jpnfAJ5aY2TkVvQlIiSU1IdlOcjKtsMH2kuQ45lGVOzgUUxXdVVhixh8+etVW70aeR4DxQItHCtPcx8joc2AHE7NaaXZ2mXdxfS7czkKQ7z7PnAQ0/lf0E/eA1z3T02kUPq6XhgZXkRW4tIGE5u9yocNP11ilOS4GI5Of+yAulJAwrH326bcYokzN4VPYYEblcnrjsVh7yLuod/JADoSHMX5dK2C+X++86m+Fm1/tmUukkfK8baczFlVRbcDVvqKdMrr4fXOxM3vmQWStxOTdvU+oW7Ykfq7NQKHzFViAhMMvt3lHdGDWhY5BIjIdM/hzuDIuMyKHoWCWIF7OuzEQhQr2nKqXE68uxo/wtuHXBXh9woEIsCB5NIKgEidQ2BIXEM9oj84vcv++LUdwuhr7u9mi2EpIP619vAOhbELvshuVxxFgAwVSap3WHwUMrJGwTX+Ds8+ly290axbZM5LFx6apkPw4gSi5aVQaOqc8MN3sn0uvJYc5fWy5mlBxo0YqDYglVbgkfBBy3uV0YJu6CPQA==
X-Forefront-Antispam-Report: 
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vfPD6qWqKyLzV2kpDMdMYc0HEKTVFmz6s/y1VGu8Vq9E6Iik0dESGOcUaUVWVZrdWu9dBHFzLOoizoaOkithYdpPF7Mra3C3NDmYBdutahmn/CYxwD91TgyD9St5NXmYcQkSaLGyU3yNeeBD2IQAa8HSZvhyWXGC4OKY1bO+rhnOxj16hjTzbiuknEaBKFXj/2kNRQrBVMt/W+Z6zYxjphDXaSHyMGmdYkCQkonyrQ8IzPCQGRu6MUIZgHDmkQbVGebYBk5XjE/5k8nsl00IvUNIMqTB4iDQdGBoYXJLLBNLBdvRAnbJAcJ29thMqj5iN3BmQUR6BE1xqwR0Pp/o4c+VRQlX4x9boRJuSQBKfczgxac4a2WjemwVHkw9ixMQTQtbBB3afSNPb/PzjzKIKfgoMSqTCTRgdCfr8F0L7KXy1PJIuAIff+kkLEEz3p88
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 07:59:37.7099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de204caf-8e74-4200-e38b-08df2448ef35
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB5264
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 07:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247377

When buildhistory has no previous build revision, GitPython raises BadName,
causing buildhistory-diff to print a traceback as shown below:

Traceback (most recent call last):
    ...
    ...	raise BadName(name)
gitdb.exc.BadName: Ref 'build-minus-1' did not resolve to an object

Catch both revision lookup exceptions and compare the parsed revisions with
the parser default to show the intended message.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 scripts/buildhistory-diff | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index a6e785aa23..aefe8b9fae 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -115,8 +115,8 @@ def main():
         changes =3D process_changes(args.buildhistory_dir, fromrev, torev,
                                   args.report_all, args.report_ver, args.s=
igs,
                                   args.sigsdiff, args.exclude_path)
-    except gitdb.exc.BadObject as e:
-        if not args.revisions:
+    except (gitdb.exc.BadObject, gitdb.exc.BadName) as e:
+        if args.revisions =3D=3D parser.get_default('revisions'):
             sys.stderr.write("Unable to find previous build revision in bu=
ildhistory repository\n\n")
             parser.print_help()
         else:
--=20
2.39.2


