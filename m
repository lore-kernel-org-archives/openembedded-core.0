Return-Path: <jhaller.oss@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F68C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 13:40:53 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.104])
 by mx.groups.io with SMTP id smtpd.web11.48425.1693834852592055828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 06:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Philips.onmicrosoft.com header.s=selector2-Philips-onmicrosoft-com header.b=lTdc+l8t;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.20.104, mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaHR8b5fA9vLSOMw0L+lE/XHyzLhUHUMFklbbxYazHBgrL1jPDIL02mwS32KpXZuKzazH7xPBob5WbeHgtt1YMB/C3PP/yZviUaSDDt6yItY4Qfj8oE8SoxjuyIqgkk5peymLSZWesBUkcikXAPZrkSDJkd96ELNRJ9al3p10k/s75llXDahX3PneUaHEa2YJYzx0x8psxiogqeirc9Jjhhq7NwBKCL9t9tDpKmhebNQ6LJNY82ERPzBfP9Dyu4usyluIb9HO3fsEyc9uEVCU81CRFK3c3arcTNSIu1wYgyZZ8ZdVomt3g48EqJMHa1fMUEEIl4GkO1Fff3v4lQv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avqB+6DxHxg3fqkwHm60u/TVkYIfu6qBR0wmZXqk3i8=;
 b=ZEYp42SYePYMjLX+I2+xoOsYwNBN/asHDCPCQhHE3DyZ4gddK9oou57iiF5ARO4tbVvDldVsxY248yBvmWZ9FiCIjXN5hTwQ+x02t4dewzBANe7+pevdPmcRjkx63gXXqmTqcTyL97ggcWRN5P6jgGWaP2oO0e3Slca6yaUhJ+mz1BAJR6K3mh6bdEF9mnPNBsdX8o8KY16IkZLMtYwgpxOmeZkJYf/6YiLMDehEBAlgccgawzfzaV6n4cD/NDzqs6edNfFI5K3rZkAaDj93EFP3Q4/DT67lY/g+3kDQ6jTqFqywRbffXem8QCkaJ6yORwj0ZFQfrJh1gXMTEnNhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=fail (p=none sp=quarantine pct=100)
 action=none header.from=gmail.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avqB+6DxHxg3fqkwHm60u/TVkYIfu6qBR0wmZXqk3i8=;
 b=lTdc+l8tSXnoNSMbD9ZYI0EBA9YbCAFW50GdrT5BkgpBwNva3RGNvC7E7JgPxE/j5IgKATCJda3GinzxL8p1wC6AaofmMD5rZLpK0MZmKkKixxrPSCN37l5wWiw08FlI/Rb5WDwRrjh5O3ail2bI9HUSQSvceJwhG2eO/C3P89Q=
Received: from DB8P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::25)
 by AMAP122MB0225.EURP122.PROD.OUTLOOK.COM (2603:10a6:20b:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.38; Mon, 4 Sep
 2023 13:40:49 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::bb) by DB8P191CA0015.outlook.office365.com
 (2603:10a6:10:130::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 13:40:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 13:40:49 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id cxhRqdixCxYR8d9ovqusGC; Mon, 04 Sep 2023 15:40:49 +0200
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id d9ovq1BT2YxEZd9ovq7qOx; Mon, 04 Sep 2023 15:40:49 +0200
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com [130.143.222.238])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 1126F184780
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Sep 2023 15:40:49 +0200 (CEST)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id 0E47E2A0D4F; Mon,  4 Sep 2023 15:40:49 +0200 (CEST)
From: jhaller.oss@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] dbus: Add missing CVE_PRODUCT
Date: Mon,  4 Sep 2023 15:40:49 +0200
Message-ID: <20230904134049.229892-2-jhaller.oss@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904134049.229892-1-jhaller.oss@gmail.com>
References: <20230904134049.229892-1-jhaller.oss@gmail.com>
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|AMAP122MB0225:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 834ca3de-f70a-44c2-eb9b-08dbad4c8cd4
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KEnSTgI97byrlxlzg6T3v2Gf37YGb1MzBmYYwhR3Xk8rS8b1btJymCcCJvTFnYc+n3ZsJUJnb30LhOM5Pgd7cwjyu8QkBS8UNkdILG8Ymg8piQrDNNP/HCjUK6ec+B880lVuczxGLl3qDxwQXHV1tS/UgRxgK7/+Te3cdD+pOpPa/+3bLyths0CdNAOLO4mkTJhfsKy7sD+9Xltodz7SRs4YaGsuAGuXtETbZv+M++QlhsqTQUH/aYgCISyXe258jHQZwpYiXIw5AkEq6aK4U6bRRJA298GdSbhxAY1pgZwql1IQLm4kZTyuNhJrLQzB4Q3DFj8SXLRNQL5kEBtjMsrq1zraMUhjvWyt1GqoAv9EXRkQ3iT23bzfJJN8YFS/cXqybt/DMomGlZqSR6xrAZ3fTTbG+h1aK1LF/wC796J7+M1j8s3iOmsS0jGW/8xjQExgoT7jV02m5NMQHmUhPc2lDBMf1cvDZGdl7U6RJ2cvCYKWdw0iKvtqtm0JerqnSQ58Fw5U6tom41bi/uV3ELBnKXHozhxw5tPOIfAd28KAdQLSARiSBZL76Z+3lUPK3bxIAlweIRRnQ8LkI/UKdKCm+pA2tu6/6uZtuhJBcV1DdiKg4nliq5gP41K/YLhHgf3NRLIdnmUooRaYA7eSdoXBvbbm4KkZR8cG7MIBxWXsu1LhY2dCy4oQF5cVLFZjIYtKx2L8Ag56p0u61+PhQX9jkvEFHbyfAQmXnJ+u/IjMcZ6zKHecW/o3bTYjpecLgSAMVw0JLoZ5F8ba85yWkdVw5P+TUGHDbaeQo0AauIrsXiPhst7JnUmKuShPgnxp
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(186009)(48200799006)(82310400011)(61400799006)(451199024)(40470700004)(36840700001)(46966006)(4744005)(2906002)(6916009)(316002)(5660300002)(8676002)(41300700001)(40460700003)(8936002)(40480700001)(36756003)(55446002)(42186006)(356005)(478600001)(7636003)(7596003)(82740400003)(1076003)(2616005)(82202003)(6266002)(26005)(73392003)(42882007)(336012)(83170400001)(70206006)(9686003)(82960400001)(70586007)(36860700001)(76482006)(47076005)(35450700002);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 13:40:49.3534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 834ca3de-f70a-44c2-eb9b-08dbad4c8cd4
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMAP122MB0225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 13:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187175

From: Julian Haller <julian.haller@philips.com>

Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 meta/recipes-core/dbus/dbus.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.=
inc
index 948aaf2e24..9b5cc53d92 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -32,3 +32,5 @@ PACKAGECONFIG[systemd] =3D "--enable-systemd --with-syste=
mdsystemunitdir=3D${systemd
 PACKAGECONFIG[x11] =3D "--with-x --enable-x11-autolaunch,--without-x --dis=
able-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[user-session] =3D "--enable-user-session --with-systemduseru=
nitdir=3D${systemd_user_unitdir},--disable-user-session"
 PACKAGECONFIG[verbose-mode] =3D "--enable-verbose-mode,,,"
+
+CVE_PRODUCT +=3D "d-bus_project:d-bus freedesktop:dbus freedesktop:libdbus=
"
--=20
2.25.1


