Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07794C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 12:12:29 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.62])
 by mx.groups.io with SMTP id smtpd.web10.60895.1702642342708407045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 04:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=k9FWXg7I;
 spf=pass (domain: axis.com, ip: 40.107.249.62, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/vtiZuZ3lv1Wb4OMkjViQaPYsXjcr1N695VIEIQQlY=;
 b=k9FWXg7Igbtv7neWeIERqi2PjScQsYup8EMFly9NHisKudZQLF/Fl20ZHcBbvDkVmV4eRGdA22i6/XVMMbK+qVBuz6ATS0YfIyQa4lf/11H7fP903UogAhd/w06gFdHM5m7TIj4/04rT+uWTynx3hrQq4AzV54QPQfHxD5JeMCs=
Received: from DU2PR04CA0360.eurprd04.prod.outlook.com (2603:10a6:10:2b4::28)
 by DBBPR02MB10578.eurprd02.prod.outlook.com (2603:10a6:10:532::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 12:12:19 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::1e) by DU2PR04CA0360.outlook.office365.com
 (2603:10a6:10:2b4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31 via Frontend
 Transport; Fri, 15 Dec 2023 12:12:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Fri, 15 Dec 2023 12:12:19 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 15 Dec
 2023 13:12:18 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 15 Dec
 2023 13:12:18 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 15 Dec 2023 13:12:18 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 5EE8110028
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 13:12:18 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3BFCCI3o4189287
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 13:12:18 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3BFCCHJj4189286
	for openembedded-core@lists.openembedded.org; Fri, 15 Dec 2023 13:12:17 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] devtool: modify: Handle recipes with a menuconfig task correctly
Date: Fri, 15 Dec 2023 13:12:06 +0100
Message-ID: <20231215121206.4189250-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|DBBPR02MB10578:EE_
X-MS-Office365-Filtering-Correlation-Id: e91ba8da-49ad-4a59-37e2-08dbfd6715ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	shia27T8e22nuuNurEaqZQ1/o4w7PYlAq1jcEQUjMaWfi4dTlTbPbwUowJ/ckrzusPElpDGiFWWkLxUqri6QDP1ZS3aKpFhTjl44UckdGs3e0PXu+Hgd5HPxHuT9RS5IDBR1w64G0hO7NwA8HB/L4PJk2rU2eNZDnEduSJU+lwvAsjCZVwDiHk0hvXBlhOenf15X+VElRqeOupWUsxCRPtstmtEia+X/t5aenrOaHTk6oVosm+c701dFb8eE6CUvOOvJZYiC52TJd+RLH9dJcZnSR+N6zgdskDZikAfAtUoMhTz5OX3efqCVSWWh3Hdhz5OVRlwhhAGZAaZlUD71KiwYf494ANNKNgWoe0ZOVNpRyrb1JwaZNDxm6o5Cebqh3CRjM31ek0bfHMclMqYE41z1j6WVlWLfFO6baQkz5rJKavjERgYtoR2FaPUsjTDMJtFinO1HiXWDFudLEqIYEd+3VE9gT3WVc+q/BichYR9fZO3sDrO/UEFG7lKEGX950WXegwpduFEENUZ7lltRiEcOzUdaiCH3Jq5pfOU1P4aKCU+5ThWf4tC94p+Jp8t3plmhm1GTh9VeEiRVO0O7XiYTigjvNtnCh3H0CKrcc3z4mn6trib9cLW2BSrRjpH9retwPHjfXMgV4h/t/MronTnwRo9KIur3iZnFAxNmZoW52rKGsm4AudsdU5Rhpnjub8j/Fdr5IrVKO0KKjmYGN+BluOG8qXmliVBtlIpbpRkjdqcXu0LPZ2sHjMB3JlLHnMuwaB9efMcAFUsEXvN4qBeUzMSMA+z3/7ffWVMsS5mZZpkgArs3XG0078QomyoA
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(26005)(426003)(336012)(2616005)(1076003)(356005)(82740400003)(36756003)(81166007)(47076005)(83380400001)(5660300002)(36860700001)(6666004)(70586007)(6916009)(316002)(70206006)(8676002)(8936002)(42186006)(2906002)(41300700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 12:12:19.0416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e91ba8da-49ad-4a59-37e2-08dbfd6715ba
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 12:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192427

This avoids the following error when running `devtool modify` on a
recipe that has a menuconfig task, but does not have
KCONFIG_CONFIG_ENABLE_MENUCONFIG set.

  .../temp/run.do_configure.4163366: line 152:
  ${@ oe.types.boolean('${KCONFIG_CONFIG_ENABLE_MENUCONFIG}') }: bad substi=
tution
  WARNING: .../temp/run.do_configure.4163366:152 exit 1 from
  '[ ${@ oe.types.boolean('${KCONFIG_CONFIG_ENABLE_MENUCONFIG}') } =3D True=
 ]'

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index c5b6458d06..559fd45676 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -986,7 +986,7 @@ def modify(args, config, basepath, workspace):
                         '}\n')
             if rd.getVarFlag('do_menuconfig','task'):
                 f.write('\ndo_configure:append() {\n'
-                '    if [ ${@ oe.types.boolean(\'${KCONFIG_CONFIG_ENABLE_M=
ENUCONFIG}\') } =3D True ]; then\n'
+                '    if [ ${@oe.types.boolean(d.getVar("KCONFIG_CONFIG_ENA=
BLE_MENUCONFIG"))} =3D True ]; then\n'
                 '        cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config=
.baseline\n'
                 '        ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.c=
onfig.new\n'
                 '    fi\n'

