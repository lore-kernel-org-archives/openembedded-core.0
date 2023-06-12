Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7257C7EE23
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 11:58:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.64])
 by mx.groups.io with SMTP id smtpd.web10.56865.1686571082784901688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 04:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=AKMThV4G;
 spf=pass (domain: siemens.com, ip: 40.107.21.64, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGJZcrCQGELceTNGHrgQEwFmM46Yu1r+h6hhWAndEy8wZeI+nvtYB3Qw1GbATPtp2VeyCuJbBJo8vbxkIyHZEqz7fSn6M3OxM7xputOJRNK+/R/UU7oHdUAM1ERx/GJrR/JhbIZ5vQUnC4s7+0NlJ/NdasDyJ0WusWXpY2i5ryWC5zzxyg26KlOCcpxVC6amxp3xl3pIwY4WRUJGzoTZzxrjLRj6TPDg79fBCF2vOnDeI8F+epbtTjEV79S1TcjXOFknA/25cyeqbYVKcMrVJrU85hPLphL3N+NLR1Kb3H6kAptibczlfL+5CXD486kGyc4VhB05pgvCHWrZZSEjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0oxS+0G/CWJ374FsEojGGlTMkogPmahz/GAA1Ys7dY=;
 b=B0SJy0g6s2gmNy+gnvKObSTFpc/sDVmxX7zDkhtmy//jtNJ6EGLEk2hzi4m1aSnbpnf3XJwx1zGPFE50X/TkBqD56vNivPRFmminYIPkFvuRpoGusd6BE/8g1HxiD89gUBuE0pbY5tkkMw4spd5ogyXhPNE9kHcPd7+E3Nea103dS5py1GvpAqYkMZus5kF1gq7rwcCPJDML5nxkUZ11UMMqtOQBG66NoeW56mHEgAgtOLT7WA6qGtKrruK2VofDQcKgtNEjx31gOMisE74TJrdFOp2V8t2AOflVlUY1Pylkx0zQxH8M/sFr+GxrE6Vlp7lm06YLhWPMXWodwbeDsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0oxS+0G/CWJ374FsEojGGlTMkogPmahz/GAA1Ys7dY=;
 b=AKMThV4G4frmGposjstx4q/nYs8qZ84Y10sD1P0c0wBTCfN/ALE71kYw1Wqnjojefs5KjvhxR9pyyxDnMw9dKLtBm2yBHaWCao4gJLudcbx1SjWNQi1d2roeiN6JdxjUG4Fzb8411w9TvtSK1XF5vgoy3ppVZxHA3HWNp3775ePorgBZjbDaWbHN8N8QIK2TI4pxOChRa7K5R1c2YIVCwjLsg2LX+91+NNBBF1MVreZFLJfwNpm84+r5s1mF0RF+dxta2hXnOgenJzEqFCb5IMfv9MXGKXPJVF3rr0Aa9Grb8uhWbbA6lObhmo33zp1/PPC38F+lzKEL4RO6VD6xDg==
Received: from GV3P280CA0111.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::28) by
 DB8PR10MB3895.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:148::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.46; Mon, 12 Jun 2023 11:57:59 +0000
Received: from HE1EUR01FT085.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:8::4) by GV3P280CA0111.outlook.office365.com
 (2603:10a6:150:8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.34 via Frontend
 Transport; Mon, 12 Jun 2023 11:57:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 HE1EUR01FT085.mail.protection.outlook.com (10.152.1.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21 via Frontend Transport; Mon, 12 Jun 2023 11:57:59 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 12 Jun 2023 13:57:58 +0200
Received: from md3hr6tc.ad001.siemens.net (167.87.37.146) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 12 Jun 2023 13:57:58 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v5 0/2] CVE-check handling
Date: Mon, 12 Jun 2023 13:57:41 +0200
Message-ID: <20230612115743.52686-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.37.146]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT085:EE_|DB8PR10MB3895:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5eeb39-617b-4b54-a193-08db6b3c447b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+e6fagV4xctfvy1CEJOjHV+VcYSl3VZeKpmF0H/uWYE1A9RPnsps4/GgONyJOcN4XliOFdC/TF9bw0o1YcakdEmiS+pqmpfRKVjS5rtg4bA46gfHxR97AY9rPj94rx8YvR1OsrrZ5Cj3vdqrBlpACCNQnFFZO45lpvZAp66UM3tu5LNwACpL+2e6wryPlH3jIGJdIdIDLFfWTG7rcchhXqgp8pL9Werlo4AavzaS5yN6XBEC5XFKx/dVAeg/ISKbGo5Ww7naE7M1VwatI/UsFCPy4OetfZWesESMHBPRZr+1P9PwSAeww5Pyn8sL4YZydo2TMZbN7qXFgMT2riu+iHR61b4AqbtmnqwocZPrCG355jfSHe76V79o0RrYlx7WceEwp2QXsNVfWny8DLfS4mAfq3Lc7rTBnbBYX0l8Usoe/zrgu3wNzbv+UA9ZcmXeoJPXsFU3hIs7yQpV+8a/GIkb4cQmx4bic/7H/UWRrNoAhIV1MR+BQ82/hC+sOtvcIhYXtr+lozRr08QTax8Rspcpj+KbGxF1qMFRBZM41aBMWV53M8vEFsQblRzk8oW68xuK8QrNOEhOn5Rc04bklh6QuirGVfz0GK9NTeGwaBVQU4MmLGj0G2D6dnn/hJYlisL+tdrxt70X6YGy200R4p3dB6dZ00Qa55JQRkKWBwrIBebO4uIkfEOuspPgGNa7CWxMnQzG7tKzO9TtfpG1hXKss9GfW3ILmghG8E6oC4FT+uikK+Dq02LZyJYhmxsl
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(6916009)(4326008)(8936002)(8676002)(44832011)(41300700001)(316002)(2906002)(4744005)(186003)(16526019)(478600001)(70206006)(70586007)(66899021)(6666004)(107886003)(40460700003)(1076003)(82740400003)(356005)(7596003)(7636003)(40480700001)(26005)(83380400001)(336012)(47076005)(36756003)(36860700001)(86362001)(82310400005)(82960400001)(2616005)(956004);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:57:59.2969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5eeb39-617b-4b54-a193-08db6b3c447b
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT085.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3895
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182664

After discussion in all parallel threads we proposed following variant whic=
h
covers both expressed requirements to have very small number of different c=
ve
statuses and also very large number of them at the same time.
This is a compromise version which maybe is not ideal but deals with
conflicting responses we got.

Please guide us which direction do we need to go to get further with accept=
ance of this patch series.
The CVE_CHECK_IGNORE variable is now deprecated in favor of CVE_STATUS vari=
able.
The variable contains the same values like before ("Ignored", "Patched"
and "Unpatched"). The previous implementation has been extended by two
additional optional variables, CVE_STATUS_DETAIL and CVE_STATUS_DESCRIPTION=
.

 meta/classes/cve-check.bbclass                | 89 ++++++++++++++++---
 meta/lib/oe/cve_check.py                      |  6 ++
 meta/lib/oeqa/selftest/cases/cve_check.py     | 26 ++++--
 .../logrotate/logrotate_3.21.0.bb             |  7 +-
 4 files changed, 109 insertions(+), 19 deletions(-)

--=20
2.40.1


