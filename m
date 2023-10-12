Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEB0C46CA1
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 20:26:04 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.43])
 by mx.groups.io with SMTP id smtpd.web10.23203.1697142359003397605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 13:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=iDNdL/aL;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.223.43, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMtJvYJeWdblhOYMk3uM7BIYZQI4+FuKEaQLk1i3ANT/ou92xCdIdKY8Sci5Tg3xr8PWIv7oz4H5GA+TGzvLmcmAf5g4ts+ICz3fVzmhilpU2JN/Wk7YOlf2fUZSmqCLFbdSO9nHSZgED2fC1anv9E6AHAM1fXAvk9dufZWjM2toMU8xqJEKe34zSQFeG25+x0fa8LYiwY18TkRpqagGVSvdEIWZ4KqI/CFPDbLY3TU3A8dtf+wC3Kt9SlWC9wkQL/GA8MJ3xSWDuf+URmDuMmL+SBd2ZwFkgBkhMfjPpQ/y1MzWXJGQHj/LZUysUVhW1yPePVeu0ZJwBlK221S+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTu5edR2ImkIeJVTBdqcLycD6oObFti8CDmcx1oygRY=;
 b=lYW3ax+IwtZJQuOQqQ/yu+ohX1Knl6O7lVAXj0LQMH3SbZjOcddPyQSKEz38gXkwzagpoIjGbucHhMgJwauTsVvwzLcTHpvZ1cR1T6pPZl6kDAL9/ebwXXy0DFSRzbDFFxVubEFew6H/MCkMY5hIeGNvooVzbMdsDzABvuqlUKfmZEcwN/RAxL6N8vkFa6m5RRFWcxyzVqQS81UnRMitRhCAGc7QwWc5bKk9W6KogzuK/iQHjK8zqvgWYn2Lvc2RLfHhmvkuTFTcfddT+xlVR0eT/aIe9MAZjx7DyOjjZKN1fCiaC6LZLBiyx5M+DgfsPzKl2qbRxc3JIeudTCmQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTu5edR2ImkIeJVTBdqcLycD6oObFti8CDmcx1oygRY=;
 b=iDNdL/aL+p70ejlDyD3TTgTWGmX1CLKzGQQWpqSH0YH55iPNcgYOq2gUVPUst04h/49vVqJlEsg6BaUwkhnRBn4HD3dw7VFHxbbFW35aNpMlIn+DUc4RVaU9ZcmebL6CMuGAd55xWW8+veXLGROel8ba3zRLXHd1Sn2ooNolhvuBPaAkbu5HNhEhJFTHR0JR8Ja/nRta89Efvru/yE5IDDQgvHLnFK73wtqdoCTXvGyqdzMBZgwydw8OQjxvSbwDESXx14eau84zxtyEkM4Jxs7c3GRZ1JM1ADY4PP6IterHLKrGCktGTGdcyJy27lllxOb/X3rAhaiKInH0uSux5g==
Received: from MW4PR04CA0187.namprd04.prod.outlook.com (2603:10b6:303:86::12)
 by CH0PR12MB5348.namprd12.prod.outlook.com (2603:10b6:610:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 20:25:56 +0000
Received: from MW2NAM12FT050.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::93) by MW4PR04CA0187.outlook.office365.com
 (2603:10b6:303:86::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Thu, 12 Oct 2023 20:25:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 MW2NAM12FT050.mail.protection.outlook.com (10.13.180.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.15 via Frontend Transport; Thu, 12 Oct 2023 20:25:55 +0000
Received: from chris-virtual-machine.localdomain (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 14:26:52 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jon.richardson@generac.com>, <bruce.ashfield@gmail.com>, Chris Laplante
	<chris.laplante@agilent.com>
Subject: [PATCH 2/3] oeqa/selftest/devtool: strengthen test_devtool_virtual_kernel_modify test
Date: Thu, 12 Oct 2023 16:25:34 -0400
Message-ID: <20231012202535.2902235-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012202535.2902235-1-chris.laplante@agilent.com>
References: <20231012202535.2902235-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2NAM12FT050:EE_|CH0PR12MB5348:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1b0f5e-a0a2-4185-7a23-08dbcb617031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eWj6iti2pkmSTPuzg1h7lv50db+2jOwIRAXfAnCZNmVBtEYiTZZXY1tHpQvORUPixsoDaAiDT/ZyxQ7RM8zSMJAu5EdKXh8vuvs6vCQHQlgFOEXZUhoVZBuo8bGWkPGhNKcaSr26zBfPQTd4cJZXyja5F7Bmz8NxTtucWuxnVyC1iDn6SFnHbJofaSUeIUcAOoExQgziH9Sl64YhLl5F4iD8+hjZTyKgsF/OPzpZe/wvLypMR5Af1mJJB7jsuDqoRjX5NHTBt96wKuY62Wos8i11xK30dS3USzPTPhbmXI5BMFpnOw0PvLARacwgmbklNSBQDXtvwWvWHsitq0u4sTd6xpUJlEXR8wIJpyK04hQtBFjOhp9m/xtEsFniyAJv/PHUgV9iueAHMNjbSq6Nj/qo3DhBjiXKrMpMcEOAyUPQG/AtJb/jv/man2L+2ZMzflgzneCzW5wyv7lNJadG1wQx0g56PLyGD3hp4j7vIvdbYGrK6kPoNXHOmTD5OtZK6yibH1mdtX2YT9wYmLqCcO8Q1JIdkTsE0cWCEr3nLWdIMUOKL4xWHG8fxrtIfTmo7pPOa+wYlBfLdEzEjfvYjxHaVrmmAWgSqyhpzRnRByBdt9dRyZKbSLxEIHoPi6n+LQeN5GJ/paFk10BxZLJ9XSOSSA7OaQV1rAkTGOgUQ4UH0PtD9fOI+oqZsrz1Lq+gvd/dMTKSAUfEWqb7cExahWgOly2EDQSSDJ9hqKa7ax5VXmjiCTbOv1mrm2GUE6uu
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(82310400011)(40470700004)(46966006)(36840700001)(40480700001)(478600001)(6666004)(47076005)(8936002)(40460700003)(54906003)(316002)(6916009)(70206006)(356005)(82740400003)(7636003)(2906002)(41300700001)(8676002)(36756003)(5660300002)(2876002)(4326008)(86362001)(4744005)(36860700001)(26005)(2616005)(956004)(1076003)(83380400001)(107886003)(336012)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 20:25:55.6520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1b0f5e-a0a2-4185-7a23-08dbcb617031
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT050.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5348
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 20:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189022

From: Chris Laplante <chris.laplante@agilent.com>

Call _check_src_repo to confirm that the 'devtool' branch is setup as we
expect. This would have caught the basic case of the bug (i.e. where
override branches are not involved).

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index b577f6d62a..a5ef0329df 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2166,6 +2166,7 @@ class DevtoolUpgradeTests(DevtoolBase):
         bitbake('%s -c clean' % kernel_provider)
         #Step 4.1
         runCmd('devtool modify virtual/kernel -x %s' % tempdir)
+        self._check_src_repo(tempdir)
         self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted so=
urce could not be found')
         #Step 4.2
         configfile =3D os.path.join(tempdir,'.config')
--=20
2.34.1


