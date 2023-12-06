Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22AEC10DCE
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:55:50 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.43])
 by mx.groups.io with SMTP id smtpd.web10.45019.1701896148265155970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=oav28foX;
 spf=pass (domain: axis.com, ip: 40.107.8.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b31uL4aHwrxHuJjNzMTUi0cBp9YX6FcAhnCZ8+F5brVkxivmxq8OzBZFMt7cly5FmAYD9sdI4YqKFLmSZZCXLH0Mn6neMlU9AxjNgzvRXy23EZDiPFM3ayiaKHv3y70DdFKBJBmg5qoB376hgI7rIMtFuKoxujJx1ImxrGGSaE60mvdy625/saxAGNaYjiLUjBeFMEe0FhQla9bPlSQtjqB/AEjFovKZAFgZnbbmgt+7w4y3Y+G9+oWn/h2SHT73MVPe2M4sd3V4uu4nh8NOFzD1t4jfGZYPbjeR99W5LqPu3GBWwXam4GAymqQg2YZUU0+kgC5hSPZLZYNxysQ7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITdXrzmINnU0eW1TlV36Xf2yJczCZHY8vJBBHyqPFWQ=;
 b=bK75FWnBlc6cLUNiatNQec95ah7xDE8PRlWmmvqTebwUbvQsZyJWeXrwkruauNfLWEEAJ55GIMy0WaKDCS39Y7vNnfBMxMTIZpXnIKmyjplLfhYeDbUy3nI1SRkj5gSwhJYpkom7DOt0dqwL3GOdw/E2nXDiXceDgQdn4n4nuMC/cdJDrKD3ld4/5B7GJYSUKXx7hIF8DCd+P03xEpuW6h7789yhh/a1+sZ5hwZcdJXCh2FnVoPxtRSvKSefEgg7jzD5stSApKrN52/4xnJhS95c44aqajb7KhFUVtgo7SiCKaMxB4tKuAMimHlQVfI+idV9Ud9B/ncwds+ZAP0ELg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITdXrzmINnU0eW1TlV36Xf2yJczCZHY8vJBBHyqPFWQ=;
 b=oav28foXycYxrzdXdUGZ9FXyiaz0ewQ82jtUc2xO3jwfn/+24i2BqJyBmXpStkVqqOQbp98rTzqZgydmHXCKKt13wGw54MQGarwg1XjPLEOzMvDauC2J2Q8sZLKWQ2hiuzWuaBAGGo5H+4mcfD5EtKoRgRsLByTv4yrSvkWYGHU=
Received: from DB8P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::25)
 by DBBPR02MB10824.eurprd02.prod.outlook.com (2603:10a6:10:52e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.26; Wed, 6 Dec
 2023 20:55:45 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::97) by DB8P191CA0015.outlook.office365.com
 (2603:10a6:10:130::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Wed, 6 Dec 2023 20:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 20:55:44 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:44 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:44 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 21:55:44 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1CC62F686
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 21:55:44 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6Ktijd4037593
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 21:55:44 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6Kti5n4037592
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 21:55:44 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/9] oeqa/selftest/devtool: Avoid global Git hooks when amending a patch
Date: Wed, 6 Dec 2023 21:55:24 +0100
Message-ID: <20231206205531.4037549-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206205531.4037549-1-pkj@axis.com>
References: <20231206205531.4037549-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|DBBPR02MB10824:EE_
X-MS-Office365-Filtering-Correlation-Id: ee579bd0-a37e-41c6-d6ef-08dbf69db750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ie6exkfVFzyNfA0tXDmr+Pnzp1VC54mhP9aVx3LcT2XTPrhT01IG0ni0IyY8dcNxQlkJxeH6iuVWydzcrC/BQbYmHNA2+pDrKZPqs9rLFo/NUbS/p50xr/L5RX4B3h4Jg2ZWyiUWePA+Pxmc2nPUKnJLCNoC4p5xkE/5jo+dg+N6I2fmCKMS/SLpmdoIFuF7zJktO5NlZF++0VfUaCqT1Hn7omA0k9c/oWNqa+mKCsmci+6dIZMKoYdUdKG6Z8Vz8evW9MY++4eNHjaRLXxTmI4/wlhons5gJKGs0qQJMngi4CUWvWxy/h1ex2L6IVxa4hvDQaDpZ3bd0W8hzLvL3ZKIzLHrqNZqwqzXs2paSx+wdlgQ1M7FN2uWmkMh01lcOF9K9CaHf/WLfZY9CbOIyxx7XNVfkdLIRp3FEBjCGFDg5he6fzninTTUMwpUBpvb8kp1ZjplBpGM5mAgXK0dKyCFWqIkp/OrFkRGmFpu/5ZpfL45uLiiAjWsC6r441hSUE+EhDsN90wwmwl18OFiRMB4hNVj+LOaFPXkLobjqGn/AIUa6YN1JURtGo7Hg5t0XTHAZ3IPI7RE5Tqn0F+jKI+Cb47tmVBhWtWcefpLek7kPHI7QdF8VbMtlaDswxp30VLSnxX8KFDKlY+AZBA+LbT14Rs2JrogenzQSqG1+Lr9Pm98DBKNscr9oCDl/gbII8vEiZtBrxo+Sc6wQa4Xb4oEBVO3eA4w9p4SNNEv0T1gsJ2/CXwtSQ5BI6+/ushyjVcx/vF70z+tM9KRfYjkIQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(356005)(81166007)(40480700001)(40460700003)(47076005)(82740400003)(8936002)(8676002)(316002)(6666004)(70586007)(6916009)(70206006)(42186006)(26005)(5660300002)(2616005)(478600001)(2906002)(1076003)(36860700001)(426003)(36756003)(336012)(41300700001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 20:55:44.8258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee579bd0-a37e-41c6-d6ef-08dbf69db750
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 20:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191924

To avoid potential problems due to global Git hooks, add --no-verify to
a `git commit --amend` command.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 55bfc24b7c..03d57cc30a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1495,7 +1495,7 @@ class DevtoolUpdateTests(DevtoolBase):
         # Modify one file
         srctree =3D os.path.join(self.workspacedir, 'sources', testrecipe)
         runCmd('echo "Another line" >> README', cwd=3Dsrctree)
-        runCmd('git commit -a --amend --no-edit', cwd=3Dsrctree)
+        runCmd('git commit -a --amend --no-edit --no-verify', cwd=3Dsrctre=
e)
         self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' =
% (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(re=
cipefile)))
         result =3D runCmd('devtool update-recipe %s' % testrecipe)
         expected_status =3D [(' M', '.*/%s/readme.patch.gz$' % testrecipe)=
]

