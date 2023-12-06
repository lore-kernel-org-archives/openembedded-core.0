Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414B3C10F07
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:22:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web10.42348.1701890556914418268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=qE8EoAsg;
 spf=pass (domain: axis.com, ip: 40.107.20.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHDwhLVpMgKtt7I3aa76wGYgKRtqbUKV/ZjjEuCL8nrjXg0kirZgh+Ckr8D+lK1VJlzy2QLb72kZQcEb+e41neUYnVgY8jGtJGzWh7X5tlwXYVGkOQxc2DvRPk1h9gwkKCopl296XCA+mB5B3R+O0OXBnrpBLMEDEVtR5wJGrUD+ot1fRd1kyHlqYroKepJRNQ7kUUOwKWq5G7SotIb+gwq+3ziu7rEGPduKceB1MumtwxtfJOY/Lj7MIVLqfE0rkDo7wHnT3syfqTIeXyBizGULUN2et0vdKe4hIGKOXai64gDbkRet9zf8zlTHCyAJPBADlh45sj1p8leKUC0i0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITdXrzmINnU0eW1TlV36Xf2yJczCZHY8vJBBHyqPFWQ=;
 b=B54Od17hykxBwdUGTq9ApMomqDtX60WAuI9LxESIHTXhbL4lwiUIiTkwOSXgBNtwVm5YdrFN9R6CLZ+waY6T8DXjeLwLI14QcvHJocTsUXzr6X9dx3LvxtUJDoW4oEb0QpL08KFFfa3zcBNLjnLhUkjEFDNQrnpl7xIiVDNZW38E/bNcBfJ6PJIkog2kK/VEbPsVVo/KhB3w/Imc6Ha4ZhxY3Jpmuq9hQ3TzybDJUIqmfTM8LbIGwCVxJ6zRYAiNU/aFwx+IEzyIX00h5vrDrQ+n9eJzYKhBLyczWpEjQpIIm6+E9VLe1AgP6qtd1KXxQEK2aicemuwUnDmt7sCgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITdXrzmINnU0eW1TlV36Xf2yJczCZHY8vJBBHyqPFWQ=;
 b=qE8EoAsgJActRkFi9RBcmnuJ8WYO2dVrzV7gCd+C8tMFMppJJGhygxaHH/vTomu/zfVfHCTccpAiPL5KlJvogY2tItcOaHJb/VdTanVpTeCoQeEJ5ot/N6+p6dN426XxjphjR+lQ9zi1pcUxWGgoyOviO4U8aF7v4fADlmovN8o=
Received: from DB7PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:10:52::15)
 by PAVPR02MB8989.eurprd02.prod.outlook.com (2603:10a6:102:322::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 19:22:33 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::f2) by DB7PR02CA0002.outlook.office365.com
 (2603:10a6:10:52::15) with Microsoft SMTP Server (version=TLS1_2,
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
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 84AACF5C4
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 20:22:32 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6JMWTa2838177
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 20:22:32 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6JMW602838176
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 20:22:32 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/9] oeqa/selftest/devtool: Avoid global Git hooks when amending a patch
Date: Wed, 6 Dec 2023 20:22:00 +0100
Message-ID: <20231206192207.2838077-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206192207.2838077-1-pkj@axis.com>
References: <20231206192207.2838077-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|PAVPR02MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: baeaf873-acd1-42b3-46f7-08dbf690b2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A8N1vMe3Zb4RVzQGFNvbozEKll6ADmNsY0dKQOgUe/QU2tNgZp2NBaz7dPC+8Vd1/bzbiMZ4lqLfCjUL1vEJh/LKrQUmsi1n1BjcYRW0NkCVkv9zEt3xJOgvEj3DlCUW8AhPMoPoUwnbdrQ+T+nT42XvO1BhQiBoUDH8u3WYe69q3BwKbqEhhdAJhNb2fmnr5dpZDx8pexVAxUAvGUUU6ppZZ5kqGMKQlqID2J6UoSwoZKmyrwpy6h8+u+YNpjP1ZYFW1lVa0LhbNeUzEq5xRtj0XBr40g4x2I8v2ntN+9jsARQtC6Av8Q7FUZFus9RbkBNMvQfZ8qOzcGQx8zkz+vZPr4Q6sF/btii2gYNhBhMWAW11zpUMUK6crQUm4tq9IgGE5DvG8wU0eQdY9cb56A0y54/w2lDKzqDUGEWqiqr64P94c4bk0yYFUTwBgIdkRpu6HlNmjCrH09fLV1J8DmN7zUGHOgESR59h0ytGzLBGixcMPaZpyPu/di9lH1JbZCPyzyfyRj5OPirS6QDJMtpo9qeo3RfQUkKjDpVlyt4Jct//ttUtkVjHAuoFBb6pow53YMuHDzbXWwW440W2czCctHHl7a1n4EjTFF4RnjwAFRSfwdXaV0mw2EX0ouuw3cTGawJobhaJaywBd2C4OMHS+KbbR2e+wfl0jCVcnJL2UTeOWZ87u6pWXTshRXIyDhFKHpg/Fv3kJUzafCqD3bzu12vdbYe4t0RDKw87p+vkXUdMRG261Ygn7yCAB6fhCLlgJzhl46ed+LF4e1cukg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(36840700001)(46966006)(40470700004)(40460700003)(426003)(83380400001)(478600001)(2616005)(26005)(1076003)(336012)(6666004)(316002)(42186006)(6916009)(41300700001)(8936002)(36756003)(70586007)(70206006)(8676002)(36860700001)(40480700001)(2906002)(5660300002)(356005)(82740400003)(81166007)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 19:22:33.7035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baeaf873-acd1-42b3-46f7-08dbf690b2bf
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB8989
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 19:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191907

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

