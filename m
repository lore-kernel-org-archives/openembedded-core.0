Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FACAC10F14
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:22:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web11.41995.1701890558015190177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=EGYsy2GH;
 spf=pass (domain: axis.com, ip: 40.107.20.76, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dV8Ygq66x9xy5RUN28CZCZ2cUagvEW7cF4rXQ6ZP5CXUZvATMElCtGweal+ZuyD6bq81G+od39nz7eqLsyzWs6gpU8fCUCFRs7CZ1wXUpBXKpCa48tJTy0lUn6qnIvTuyiz5Vhq+9CROsExxhw1hs8m6EA31apVDbQXgZHeAnOXfoESJFAjaFjJg5f1/iMwyxlh8JIWPN5xIQhU7r2euB0xV3VzvGeHW6NMP/5l85c5Eame739qxTZhcXLRDecaaQzepE1I3SUa069XuUui9EA9u8s+ryF21bllHzmLaFDhkLR6R2bqhaVQOIbiS6QjFrr70mZe83HS6hKggLWyNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTP8TwNLzKAfEhjGXHWlvSf4qmbtRzEYAF9ugy4qC5c=;
 b=Q8J8Kf31JUlN1TJKOe2zy8ikcMUVhAuCurj0CkkDM2uTWAyvF3zsM6mO8dUEozTUDLYksxhnWcCwkSdSHQyD5PsfoeVgbQKE2P+kEpopOv0WIi8RNoqXkGVPsNg7B7sHK1L0SW7r3qzf1ILFUMs+sHsv+Def7KLkN1woO/hiLGE/BxmS7WKwiPmCvoqnYhG61rwjzZINn6U0FxknGFBsQralq/Ex8T+V2wHYRhzlHzidSNQ1SbFnvZKuRCSU5nmkl4ZMReS+Zoi6SByCpoFtrlgBENkMyWxf2WPX2EWYgN41iZ4yiN+jGo0USSD9T+q+oYlr04s/5vUgVeVaDD1eWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTP8TwNLzKAfEhjGXHWlvSf4qmbtRzEYAF9ugy4qC5c=;
 b=EGYsy2GHsy1M3ny4Nrv84DvG+xbWzPi9Cnz4jtunW77gb8sYDRzLv2WX75tU4C22WKNU3zjMjwD9xvKdUkrUCCIfbxnBewR4M5rVUjVdvfsZcDOJr6vQii68dZx5TkoGb9X00jYq2xqxViRwOdRMY9nauvrQ7cH+7SMVkVUMEZY=
Received: from DB7PR02CA0033.eurprd02.prod.outlook.com (2603:10a6:10:52::46)
 by DBBPR02MB10752.eurprd02.prod.outlook.com (2603:10a6:10:53c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 19:22:35 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::2b) by DB7PR02CA0033.outlook.office365.com
 (2603:10a6:10:52::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25 via Frontend
 Transport; Wed, 6 Dec 2023 19:22:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 19:22:35 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 20:22:33 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 20:22:32 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:22:32 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E4BA5F676
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 20:22:32 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6JMWlm2838189
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 20:22:32 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6JMWvU2838188
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 20:22:32 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/9] lib/oe/recipeutils: Avoid wrapping any SRC_URI[sha*sum] variables
Date: Wed, 6 Dec 2023 20:22:03 +0100
Message-ID: <20231206192207.2838077-6-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206192207.2838077-1-pkj@axis.com>
References: <20231206192207.2838077-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|DBBPR02MB10752:EE_
X-MS-Office365-Filtering-Correlation-Id: 2843d193-cce6-418b-c4a7-08dbf690b3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c+XdWs+L4mGJBV7Ax9wMrpuYbE6mWVxhoPrrDG8BWJIQsh8FRMX6rRwTMGB8GJslOWdK8++r5BirRGRRZql72KIxQ/jPxAHzPKHB3iIMnQvZInZnJrX+JSt902D9bn61IXLLkQyI8ckarQevxFdouS3N949cmAwk99fcqY4FHE3FduuJ80QxWkQRC61S/DBviBWHOa0K4ocneiIYFKnGpHnC4EDux4K0Un9kNfZvLMn93SRKZU3RdNYMceipIqGJaU5eCUei+RmSPvrgNPrT6KO6nP6d8F99SvxpBQ6jHozkdyUVdWGem403sI9E4TnkrWlpDvD5dY2fUgEp7BDW8zJDjdq+U1znhs8rwEpwtbTqhLg1OQqe7hKYk565gV6k3tby3Zzu0wlo27YxmiwIRPnQV+WFao9UnKA+Uvw92S5TxLJtZJTTCr9qACt6c3lmYGooqryBx1Hrk63IPELi/q5F28u7Mle2TsGiP/l8VDf9EoPhxP9T2sO5X9xDbAVNll0fDsBOGXv54+fgn0cpAPiwRYxwVzNQqoTvwk+cC3nxA6bMm9ztWrpKrkaHq9EtzmRYMTiDtOzEnsu1Gna4YT1KV/Jo5AEGhfhBEtMpAWPAVT0WYyYi+IJL1az0iCH2sTr/DeOMA48YgK2g24Pto1pNVwuYyi11dr2B0uMuwkbgepj4JgAB7ij6hZlxa1Ck9sSMpYiVQtdAlsthBnTj63YXwcKxkfXl9E+kMfp4mOKf0wEzHgMqnXCdzz6cmHcL9iFsN2+QYNxKWyKbGhLaKA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(186009)(82310400011)(1800799012)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(40460700003)(8676002)(8936002)(426003)(316002)(6916009)(336012)(83380400001)(42186006)(70586007)(70206006)(5660300002)(2906002)(47076005)(36860700001)(6666004)(478600001)(26005)(2616005)(1076003)(356005)(41300700001)(40480700001)(81166007)(82740400003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 19:22:35.3910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2843d193-cce6-418b-c4a7-08dbf690b3c0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10752
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 19:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191912

Before, a variable such as SRC_URI[sha512sum] would end up as:

SRC_URI[sha512sum] =3D "45ff3abce4dab24a8090409e6d7bb26afa7fa7812a51e067 \
28c2aa47d5b4de610d97ba4609cf13d9173087bd909fdf377235eee988a6fdcf52abb7 \
0341c40b5b"

when updated by patch_recipe_lines().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 25b159bc1b..5fb73e65d7 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -26,7 +26,7 @@ from bb.utils import vercmp_string
 # Help us to find places to insert values
 recipe_progression =3D ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER'=
, 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'D=
EPENDS', 'PR', 'PV', 'SRCREV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()',=
 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_config=
ure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroo=
t()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS',=
 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW=
_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTE=
ND']
 # Variables that sometimes are a bit long but shouldn't be wrapped
-nowrap_vars =3D ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', r'SRC_URI\[(.+\.)?md=
5sum\]', r'SRC_URI\[(.+\.)?sha256sum\]']
+nowrap_vars =3D ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', r'SRC_URI\[(.+\.)?md=
5sum\]', r'SRC_URI\[(.+\.)?sha[0-9]+sum\]']
 list_vars =3D ['SRC_URI', 'LIC_FILES_CHKSUM']
 meta_vars =3D ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTIO=
N']
=20

