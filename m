Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BC1C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 09:35:11 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.61])
 by mx.groups.io with SMTP id smtpd.web10.5060.1643362509935799933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 01:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=MRQ2Q8iG;
 spf=pass (domain: siemens.com, ip: 40.107.5.61,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsAknpdvUWyOGJnjdxfs0nZRS0L4lTT91eIyi6y2WrurEQ5Rio9xjFE/shzJh6PwL40fDJn7iPBoZx9p+JZrXZf18l5NDwpJDkZrpy10OmUhtvRbtlfi8ljQp8/hZfKGPzZGfQLmOJTjNt1sxVOc54bmRjRRPR0DnGl46UlXMb3seG0UmbAktshnGHhNnqq8RApMuCv2PqkFqMyjkWo98cjLULI8eSvWfpoelSWnOMzceZchmWb9bTAx973c/yBdXuQsMsatnqIfAqDOT8llv7h5gC61f5D8qAgH7OKAYuGljtsSdmAowcsP+UNw3twHOFV7DEkUl/ireXtSpMzCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXfAuihc1VyYb2gWVWBB6ybCl2muUQ0DpGfwWURfqoo=;
 b=lvFJae1dvRv/bmI910QsVaHlz9q5KVbA5/GbR352QWY3loOVwc6My/AWu4ltLdLHFPLwBf+XcIkkO5NpxMJkf3gN3C/TJ1RNTn0Tzly6IQwRj43jiXO4FVyupR/WmE8T+eZAL+7o/zbwR+D88oUC+pC1b3eIUX2IIjrPR2YWvNFHEjGhMC/y6UcbhpxOW7huX1rRv+tGVpEBftxa3wO4bM3mpHNoDCu0ZPSs/5OHyTAIGTIrWTbeSvxH8O6PnDospb5xaKBD1iO5n6nS/63Tw+aBlQDf5BQq2UJLgpQp7sQp0MfLZ3QBLyvYScqwIOEx5M7oUIxeBMXmpVMEX6bGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXfAuihc1VyYb2gWVWBB6ybCl2muUQ0DpGfwWURfqoo=;
 b=MRQ2Q8iGBx9qiKa+toCePNnktz6W2gesKF2ElcQHOkrSovqWQcmwq7BRqT7rzV994rs8c9CJsHExsbXgW0IPlJA/To4xNaA5W77Dl6cA3KFIY5Moq8jpAETJXQ/Qos3JpXjfu+JSGQnG4QgfB91LqpFTkngSusqaF+kivHru4R4CtZEQsXpsC0JOv7a7CdUGvSA6Bz3BYNnMYPDleHJ0fiXJJhOadzilL0PtA2QVgVIVWR0ZjBxMdPdSExQ6ZujZ6whQm5C/mfjZJvpmB0YM3B3iBm0uPfw+gdUtVXPbS5ehR86XLJN+0er2sZudWFjtEEGJMXo/airu2GxR+qYzsg==
Received: from DU2PR04CA0155.eurprd04.prod.outlook.com (2603:10a6:10:2b0::10)
 by DB8PR10MB3100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 09:35:06 +0000
Received: from DB5EUR01FT013.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::57) by DU2PR04CA0155.outlook.office365.com
 (2603:10a6:10:2b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18 via Frontend
 Transport; Fri, 28 Jan 2022 09:35:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT013.mail.protection.outlook.com (10.152.4.239) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 09:35:06 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 28 Jan 2022 10:35:05 +0100
Received: from md3hr6tc.lan (139.22.136.135) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 28 Jan
 2022 10:35:05 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: <saul.wold@windriver.com>, Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] oeqa: qemu: create missing directory for _write_dump
Date: Fri, 28 Jan 2022 10:34:46 +0100
Message-ID: <20220128093446.38125-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.136.135]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.006
X-TM-AS-Result: No-10--10.324200-8.000000
X-TMASE-MatchedRID: L90KqhDWgfMK0PL3QF02Qzatbw9vnWWudNVBVgPOQtt5zXLXCu83xdoK
	fgOoKJc28mORSXJFxXak86uMB98iNkH4oKIlMiiFPFl+WXvcG/ErC7z72NG0KHsa3LLvjm1nfS0
	Ip2eEHnwj/1Rbkzl1E2nuoSGaY+DLjoczmuoPCq1BvwFuC3xI8pF3FRpaPWvxOrMRNrhiN0sZUH
	DstyoYuEcSxLoJGO9e
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.324200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.006
X-TM-SNTS-SMTP: 
 10CBE20D4E66ECBE72640D6696B0F62545A84D2DB2B28C49BF47587CE8E3E8D42000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bd4e3d2-6ab6-4019-c50e-08d9e24177fb
X-MS-TrafficTypeDiagnostic: DB8PR10MB3100:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR10MB310020AFF2A8963B51DE468292229@DB8PR10MB3100.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h1W7rRVW+aZKmhMuTEWJoixQSNfaS618P7Z1rEWMSAuk8VfDROuL3rxoJ5oWcfWUbdX8dbXLolpeK0lyTkLCz1xy1rwlabSd5foUqOhds4sVpWFfLnIzKv+thkS/P4k4YVwg9rZuQprnppYFpsfNnCDKrFOwSDd6P0/RJFH+rFXKdJQoeElg3wMwYgUB2En+LrqyRBjKQhxt+bP+OQBOSy2V0+DH13vaYBU22dRuTLvqDNQuQzHgw7lfZfh7Ab7TNUx1hQUGKCriTAd5FIC9uoPgNAADj0irMAtYzWPeGSSD80ji0LHmVyJW3vkn9TeLZ4qlzM+0LT/ahs7kPyGZpmGFGDeYhGk7IydTimCTRC5k1LpPlgRvFYeFGx9mpKSV6yl1xJce3F8WcnTm4s2r2+xFFIBbaBy894mSYJUruk4IFoIPtgD5+MJDqWLW64D7XkflPrqH9bhQm5rg/Rct7Mrb+T/lLTLIVFuZ7CnB719A+2n4F6A8N5yvi04v81Ij/uAf0Sug/ymrZvfS+PlymKLWfLY8thTI+tTNFeSh3IXsi06lZ0Rd0DXl9RMLAFx5BBoLsUX/hRCRLhYVhYlk3wu/59K5Zt9xjRjOT/V/dqVAakNjtJ8nIFf9NU4VbDST2vSL1JOI/UTGoyOjGzgxM5oY1C8dMrl0jbw4MLJpeB6JABmyjgYRPQUigcfAsIA4OUvkfj/ZAksDZqv1ZxiVgWP3iBiOLJrrACMw7f+q4NMJM3XE2FvtkGnPIgxBJqL5
X-Forefront-Antispam-Report: 
	CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(54906003)(1076003)(40460700003)(186003)(6916009)(2616005)(36756003)(86362001)(44832011)(47076005)(6666004)(956004)(26005)(508600001)(36860700001)(316002)(16526019)(81166007)(336012)(82310400004)(82960400001)(83380400001)(8936002)(70206006)(70586007)(8676002)(356005)(4326008)(5660300002)(2906002)(107886003)(403724002)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 09:35:06.2594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7bd4e3d2-6ab6-4019-c50e-08d9e24177fb
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT013.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 09:35:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161074

| Failed to dump QMP CMD: query-status with
| Exception: [Errno 2] No such file or directory: '.../tmp/log/runtime-host=
dump/qmp_00_query-status'
| Failed to dump QMP CMD: query-block with
| Exception: [Errno 2] No such file or directory: '.../tmp/log/runtime-host=
dump/qmp_00_query-block'
| Failed to dump QMP CMD: dump-guest-memory with
| Exception: [Errno 2] No such file or directory: '.../tmp/log/runtime-host=
dump/qmp_00_dump-guest-memory'

The qmp dump commands could fail, because of missing root directory.
So create it before any log writing.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/lib/oeqa/utils/dump.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index dc8757807e..95a79a571c 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -66,6 +66,7 @@ class BaseDumper(object):
=20
     def _write_dump(self, command, output):
         fullname =3D self._construct_filename(command)
+        os.makedirs(os.path.dirname(fullname), exist_ok=3DTrue)
         if isinstance(self, MonitorDumper):
             with open(fullname, 'w') as json_file:
                 json.dump(output, json_file, indent=3D4)
--=20
2.34.1


