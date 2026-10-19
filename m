Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6A0CCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:52:04 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33668.1792414320337141282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=IXV7YLox;
 spf=pass (domain: axis.com, ip: 52.101.72.2, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZt2KZhP0jXYrp7qdEcK6XT41ldyJLDJf8dqbx47+9RTLkatc3yqMoq/pT+dTkHkJq2do1J7Q58W5q0beWl6bNLvWhRkUghPoV5ApXnsrS7KG3GR+77iISLIKHJxg7/CpYVSVyxrZK7u5QMaRRlT0s7Rc0SHEVYgogY8epLe9vStvS3Zay+ScRuiKAFKpmcGedg0mXjQUK6VJK/BQM0SsWQhMLmypCcMLK/i0ZXizCmSDKTvEb3rQa+ogJV9wo2URkYPttG8XZO2En+04/05IDxJJhqPxMIaUjkdgyqLQCQ3DoiulCe5pqF8vVcT8Wr+V/gOjJ8JkN58t3pQxk0iEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iv1pwr4dzKsl+EGEaU+ah/6ahweOYR3UvE/+rHusxc0=;
 b=xDKDaupuUrIV9fNimsBw8fLF8kxsGPFG8seAWQs64hpr1705Weg3t7CwMcfvljqYOYkEmm1OdZ1sUz2x/C81+3d5CzODCEqjrTsAEn444/WXJWxlbLqbxT445miAwfFKjJ8B1zon+8G2yB7U5KkX+/BL7V1CyffZ7R+Rex1iqYV++C32PxNwzgqaOke6xI+9TrssFsTHsjq80yLj4qkWkYb/t2UCTHs6Gs7VmnAVu4+TR5RExb0cRU1V5faVjUyEhXPrOihtCiX95A0aWcSRpvgi+ERlt3se1rthVqxsoCojgyFPPC4GLJFTl1gr4hd0L0PxZGw7Q52xIWI9yKEoNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv1pwr4dzKsl+EGEaU+ah/6ahweOYR3UvE/+rHusxc0=;
 b=IXV7YLoxmT9C9gwnNRKX/ykPRfLgTfvzocBvQHBV9I0CDRjJfooUlyFKlhKDT7XrwY3sIxbxNC5A9hj4zxVYGdmAYAgkPgNFvuwnoRpQuJp5vWXuE6tgfRJKv3iAPI0rV64RKbxe8LJ2gHyAMPsaMpPGg1FluRbIraLu7h4TLqY=
Received: from PAZP264CA0257.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:239::21)
 by GVUPR02MB11758.eurprd02.prod.outlook.com (2603:10a6:150:332::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:51:54 +0000
Received: from MI3PEPF0000855D.eurprd05.prod.outlook.com
 (2603:10a6:102:239:cafe::6a) by PAZP264CA0257.outlook.office365.com
 (2603:10a6:102:239::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 12:51:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF0000855D.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 12:51:53 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 19 Oct
 2026 14:51:53 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 19 Oct 2026 14:51:53 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 32A6A31B4
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:51:53 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2BDBF12BE2E; Mon, 19 Oct 2026 14:51:53 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][blacksail][PATCH] stress-ng: Inherit pkgconfig
Date: Mon, 19 Oct 2026 14:51:42 +0200
Message-ID: <20261019125142.3407486-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855D:EE_|GVUPR02MB11758:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ec0a2e-ade7-4bfe-2676-08df2ddfc04e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	BDuAA4OC4UO6IzvBhD2Oqd1eDSao+v+uL4P7BLYqbmk4kEbr722Oba0x+VAocHr+Vp9Bf7AM1xyLk1/OvxsTZd6KaMS1gBvh4W5TLpiXt+cTuAamAyxAx8ZckunaL1wvyPpDKDu38TR+u6uXt5iaIUbG9AqHnaGgCD3Gkc8Nvemonj8mkbXB0q8SuwUpET8LE6iluEu5qrLQRPl1PMXKMrCHxzLeC2SBX2rYcbyQT+I4BQdeeJydIiUaLnyyWx/SdctJlyuUJ0bDBd4hW7E3bTjhTzwanWZEJDoqHF2U2l9OaoLZPPrjPPqSxaVigBTAqaQ8Am2Rlom+6gaqg70Ldszp/rZqtlRe+K2rcDSJEtQ9RB92OnZ39bbg5wKRUejHoymJnElkAusNhN48dxUmcP4YFKv5rW2ORhfQEs2bYIeqe2fztmD/jcmfrvAYKi4p+4wH3KxqfsvvTV793Kb6uyYwGDd6A3ITLWn0igECyZ6FBiR+bjhDoXWFB1ZQLFAMTnxKKkk3GuryT+RvcwTIXjzzO1ImAMUKp1ARBsVNxHHVZcMOkKhuudCNkl48I48ROBiYq/c1G7x0cDA3PIRMmMzPxUHF/aOrChtIT543N9JwaiN70L4t2iwhiXTFy4oTsyCUyFViF29gImt0eKhq96EplgPKHRteBIutw6S8qjapcVacHQ6JOhLJYnbYjdg+edEwP+POoZ44DSwzCKU0rQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	164c2+3xh2G+TiiFvNTePImMvLzcpOrjGFHVEPxoltLgWT1XGXGDLNz8T6rNDo/lzKvtqNkWw8c1Dk5njD06ri61QxSoBGqfhGetrA9II3K+KN0EWoM18lQlKgdGDDg0C2Ot9XXPgXURX2zCs+/cNVEgrqSs8gVsQ6wCKN08TAD5QKQEKR5g83cYPXSIBKQecvbR8T0XKiE0vN/8WBK8WVusUx7wOqOVn2VddkcB37/CtDmqm2LnCuoZdrK8KcC/019seiJXbJa/6/6DYxQBZHkHgioe5zBFepBiIOwC2c5FaRv72S9bxgPW5Om756/gPhtuphos1uIWZhZsVz2MVvuCqWRHGbZCAfVdbBef3z+VSfkS3f4lmdPMzX1ZLntEzz8+BL3aggU3P+YO/DfJxltq3lrEMTlYd8viZLUQ17nq/rI2FBZkGQp/v0D4L9j6
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:51:53.6563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ec0a2e-ade7-4bfe-2676-08df2ddfc04e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF0000855D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR02MB11758
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 12:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248165

The use of pkg-config was introduced in version 0.21.04.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb b/meta/re=
cipes-extended/stress-ng/stress-ng_0.22.01.bb
index 548edf292b..adf9331cd7 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
@@ -15,7 +15,7 @@ RPROVIDES:${PN} =3D "stress"
 RREPLACES:${PN} =3D "stress"
 RCONFLICTS:${PN} =3D "stress"
=20
-inherit bash-completion
+inherit bash-completion pkgconfig
=20
 EXTRA_OEMAKE =3D "VERBOSE=3D1"
=20

