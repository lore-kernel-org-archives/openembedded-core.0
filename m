Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE0FC46CA3
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:22:40 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.80])
 by mx.groups.io with SMTP id smtpd.web10.42347.1701890556685127257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QemwfCnB;
 spf=pass (domain: axis.com, ip: 40.107.105.80, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+1ee4sWUxe3Njk8uQFXdXQV4C95eZ7Ld7Wnh2imLY7IJz4i/SEtFXxWxQgHI9z7grbeRqMH0odHds2Ox7BXU2N88PTqV4oyb2DIfvYA6SgTy1kctwUk4H+l/DWYWA0MeRF4BveYXL5ffod1Rp8RuTEnfczswyi9rVDIzq6G4T5xXOMTbTr7wUxadwx9RkeSJ6jPbZgosdK7rzTyoZc8Y1THeBlIEKUcFym6B3BmS41nWLWtRRLbVsq+QeoxYBjQJld5mv/ffpj1QxZmQUB2hEKFwM8UvUGfrJ6nb8HGzzNWzyRcR3E0XF3DIJD7p+7rjR25b1cdyrsUkadrPeJHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKU+TA0vtuleRncv3nkdi+MNGeUQE8Cv1y/L86RoGUo=;
 b=Sv7SZ0CaxBR46geaLCZWKNUXqQw+TRjbShb5dQxpvEpIlD8Xs9pXUxMTp0HCGHl6kF9R4fC0VsmmKn13Q9UT5T8bkQ+nrQfDhbTfPG+5pUKMa87vYdsmDd8IJmo9MrUl/68QERvIeH5u8+hHfe5u4zEnubcRp0uwMwXEgvNmjrd/vqQT/9Lg06g/JKbcn1wMtDVjPSim/YZjhoSJ5DNJ1SHP8Qh1SygbDMpxyR6IAan29qqno9qI6rgstAFVDDOyj/dEjgrUXIkA/2U/5YCtutyZnCPOQKkNXectDBSBXq0DUD3x6G9zA32O3nkqZWUOUKLbp5Cp2eiXAO4ImKOe8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKU+TA0vtuleRncv3nkdi+MNGeUQE8Cv1y/L86RoGUo=;
 b=QemwfCnBnnkPvoD94hHUGfuqbDrmQGLeOu59gFnf/6vvITP9o5Tz0jbAutRM4X06Z9PVEJmz2lezZBdE1oCTphS1POusvF0Zl0fFJ1kbY0pB9aGp9E6PECbK0CJQ8HfAYMJ0AkRZpO5Axwpr4NtauRD0O+yID11YwNewpg4SlNw=
Received: from DB7PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:52::22)
 by AM7PR02MB6147.eurprd02.prod.outlook.com (2603:10a6:20b:1a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 19:22:33 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::9e) by DB7PR02CA0009.outlook.office365.com
 (2603:10a6:10:52::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 19:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 19:22:33 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 20:22:32 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:22:32 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 62A96F676
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 20:22:32 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6JMWfp2838173
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 20:22:32 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6JMWDl2838172
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 20:22:32 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/9] oeqa/selftest/devtool: Correct git clone of local repository
Date: Wed, 6 Dec 2023 20:21:59 +0100
Message-ID: <20231206192207.2838077-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206192207.2838077-1-pkj@axis.com>
References: <20231206192207.2838077-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|AM7PR02MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 2455651e-9bae-4eb7-0ead-08dbf690b286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kbHCGgmT+QvG50o9DOgq3OCYO027R1uJB2nqPgSFfwz9JUJgR7xIzktJ8S35CyesR3TWRNDqlC6KXhxH70/DvM/RaatyTTTTssoBOvN9RwEUAsz26rif5WcWyrJnOW/sv35Y9zb+r7x/tUPpS0z5UBl8w2KD7EA0YlhlKyB2l3DICL4IVVsIjIBFzfC7E2Gk5GnTwth6Phx8VY/+vWq8JvLp8Ia9gsIjybbSe5TNH9qfBK72clAKRF/AGUbyRzd8qRQZQTTUZY03fHa2xLC7RgFo/yvlsEIf9kjQJxQFckA+NqjJZVr9RQC+O3iSk/7qiZ08DPCJRkeeEcRlsRRmQnIkXg4Ihho7LUf6BCBMZ4m+pQ2mo18TRAl0AymNpK2gpMdlzr38l1WkJnPKGbPhlP4Y9x2AJQHMXGWgKHf1hVPk33fnQ38EXSZz5kFKTXgdbSVAKTm9Gays7IVNOf3X0BQo0MOXnJMOIyidDc8mj+Rr+PQxzvqX7x3gNTYwkkFB2nB480UzSZoGkUHerSDaPUWEJxVe2rJf2beGmjK4woEL7ssjkab81cnlVAzYMJPpnn13FQ/QxaZVxcG1nF5jMvYUU6eH6OmbTIFBV32BuymSgKc+5HT2J7cwNOTNkOM8mwH8LlNv/JMuSOog+p8pRw9ahAG0VZ1tXtsUoJ/jJxtgEjWFnCaicN+zn9BAPAamg4qkCmSJ4Qb1k6x7maTqTg+XYgc2nROQhsCA/pjrmmPHSEmW5Bl4olDahdFgV+t5OjGDmjn4buKooxp4KMARqw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39850400004)(376002)(230922051799003)(82310400011)(64100799003)(451199024)(1800799012)(186009)(46966006)(40470700004)(36840700001)(36860700001)(356005)(478600001)(81166007)(40480700001)(6666004)(47076005)(82740400003)(426003)(336012)(26005)(2616005)(36756003)(1076003)(83380400001)(8936002)(8676002)(2906002)(5660300002)(41300700001)(6916009)(70586007)(70206006)(42186006)(316002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 19:22:33.3285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2455651e-9bae-4eb7-0ead-08dbf690b286
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 19:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191908

If the build environment is setup using `repo`, then poky/.git/object
is a symbolic link rather than a directory. To clone such repositories,
the source path must be prefixed with "file://". This avoids the
following error:

  fatal: failed to start iterator over '.../poky/.git/objects': Not a direc=
tory

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 2a11886e4b..55bfc24b7c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -54,7 +54,7 @@ def setUpModule():
             result =3D runCmd('git rev-parse --show-toplevel', cwd=3Dcanon=
ical_layerpath)
             oldreporoot =3D result.output.rstrip()
             newmetapath =3D os.path.join(corecopydir, os.path.relpath(oldm=
etapath, oldreporoot))
-            runCmd('git clone %s %s' % (oldreporoot, corecopydir), cwd=3Dt=
emplayerdir)
+            runCmd('git clone file://%s %s' % (oldreporoot, corecopydir), =
cwd=3Dtemplayerdir)
             # Now we need to copy any modified files
             # You might ask "why not just copy the entire tree instead of
             # cloning and doing this?" - well, the problem with that is

