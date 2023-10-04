Return-Path: <jhaller.oss@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F882E7B5E6
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 10:04:19 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.111])
 by mx.groups.io with SMTP id smtpd.web11.14840.1696413854967524212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 03:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Philips.onmicrosoft.com header.s=selector2-Philips-onmicrosoft-com header.b=jQ8mmdE4;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.8.111, mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFDZWz3MD5jO4WNnFFQ/8RMcefd8PJpjNB/AMixqsj/fVXNHEngkUbabHAhZv5nmIN6COrggxgFszgUpFiT1b4c1b8NVhILGOW0IfXJPGfkytbNTctvEUaHcHLdNUB5v1RM3eUfb5sCbeAlOJzzW3RsifFsepo4keq29/pUzchk44zGeUdf1W5rFLUw1gnWODqRIADQ65fWHUlZxW8+8H5aZABBJh1C3R4it8JcmrcucjC10HpSqk6msczzsU/LWafGIg6rSsT08bDJ53z+osYUpU5YeVdfm2eZKHkHXNTx6LmNzVPNf1LbCXUQvZ/IpMGTDYzKlygeRfPbFGvDNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZFWb/0WLv9Uy40Mle5dIac20sfremB1bR+6GPnW8FE=;
 b=bAeeel4jmC/MvzfEpraEaIAwv2t5jwX/E/PZTsM9z1+i/EPUqBUR/83mV/3FyLC7h2s39j7CrNNup/mmF7Z5Y0QNUkSUF1Qf5JOkC27v26gYmZ/29eXfMbkWu5xhXuqWORSbR/0sgx++vKuBz9xtiEbgUVZZ++w3g1LhO144Sefjji/Fuly3K7iFpxpBnsj9vp3izaOcgTFvw8jZsErecTN43nLB7HAGikKlpXz0/JG4wUhQXi+JeUQ2TM8GPoAgWQsWraEXccStanM8rWfzxA+Urbab0v0+JGq1N/Cz5afHZVEp0wo7prO/mj9+dBGwXRyl2JK2Gxc72AZ5wkIBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=fail (p=none sp=quarantine pct=100)
 action=none header.from=gmail.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZFWb/0WLv9Uy40Mle5dIac20sfremB1bR+6GPnW8FE=;
 b=jQ8mmdE4saLw6mTMLuY7MRwnTHmNEw8eh41hrk3MSv+iS56ajaVDPLoGGm9Du5NfQU4SBX4fmNCxmHCAYavK4EbxYmXHwUrN5LFDOgcjEcLGi5Kim4bE5Oes69eYHM5L6ORUauLaO0KG/lrr5kMfZyjTtRTW2G/YDJ37hp9yZUM=
Received: from AS9PR04CA0054.eurprd04.prod.outlook.com (2603:10a6:20b:46a::12)
 by DBBP122MB0202.EURP122.PROD.OUTLOOK.COM (2603:10a6:10:174::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Wed, 4 Oct
 2023 10:04:11 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a:cafe::81) by AS9PR04CA0054.outlook.office365.com
 (2603:10a6:20b:46a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Wed, 4 Oct 2023 10:04:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 10:04:11 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id nr7MqwBtexYR8nyjjqfBiu; Wed, 04 Oct 2023 12:04:11 +0200
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id nyjiqgBmoVjBvnyjjqefFe; Wed, 04 Oct 2023 12:04:11 +0200
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com [130.143.222.238])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id E04CE1847A8
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Oct 2023 12:04:10 +0200 (CEST)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id D84DD2A1428; Wed,  4 Oct 2023 12:04:10 +0200 (CEST)
From: jhaller.oss@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 2/2] dbus: Add missing CVE_PRODUCT
Date: Wed,  4 Oct 2023 12:04:10 +0200
Message-ID: <20231004100410.1609317-2-jhaller.oss@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231004100410.1609317-1-jhaller.oss@gmail.com>
References: <20231004100410.1609317-1-jhaller.oss@gmail.com>
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|DBBP122MB0202:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e5b5304f-833a-4f13-a72a-08dbc4c1419f
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vfEdAegsIcFXZwAXBmksHayNWHcrrNy+v12BZYYkdaMzCEMl3vOUs8ew44BamXglR5PzuVOihx3YJ+3n/12tGU+mmuutTEvG4OITEh23+mN27TRqBqo2AqCNbkt9M1fEEuihtmGci/Yk3DYizlp18rlNDsWYTh6twhGEaImKckywIGL6Am7DZxb3feSmb4gAt3p9LE9qEP6OBBguWYlZVNHoCY+v+vXLOWXnaUxsRgW0dpXwDev5afLSz+k11TSzi41SgHIlMY+Up1SMAtLwvKj6Z+eTULLq0ueawVXra2oS03y4SVl7AkY4oP+3Rb5JY/iA0rYAexbvI+3FRpF5imKPmQgafZ9sSkATtCuo8PG0cEhITq3MkY62JxJv/Ji3pvUOlNQ7JmfuKvkKvU95mwCudZtRrK8dTAW4fxUI3q72YGAqYVqgtj8acEQkSPkfK8q0iBkLEETByTdVwsUDEv1GHGOQ8zT5k2FMUeW3xMFU0cPHL99SEf7fKTkOxx5GUjT2kyTBSWZtQE8dIk4jrwn7M9kuVLq9VCkWl2pdmUM5y37NAJ1docHp+fAVxn4BnDivj9RK75K4QC10FCay7ZhLKkOx8yGZb5lWARF1JN8xKWTs6d6FfDSX48fInlv3KRtUTc0tT6gz4KKHXx3V89bGECu5dt8pH9DdIjYKzNMotPnMc4IF1AC/uvqYTHn4/7IaRIhjSspMZBGl/mRFxxWzBMWrpYKCNr7NhCBu+vYl/F+TH2zuiUIDwvD6guuZ2AgXIUhHcYXCZuhu/M9a11EhYx72VZOUjA+qM+tChVEw/VSX2sbRcwOGtnG6Rh0m
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(61400799006)(48200799006)(64100799003)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(36860700001)(7636003)(76482006)(83170400001)(70586007)(6916009)(82960400001)(316002)(55446002)(42186006)(70206006)(47076005)(36756003)(6266002)(82202003)(42882007)(40480700001)(336012)(26005)(1076003)(73392003)(2616005)(9686003)(82740400003)(40460700003)(356005)(7596003)(478600001)(2906002)(8676002)(8936002)(41300700001)(5660300002)(35450700002);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 10:04:11.1615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b5304f-833a-4f13-a72a-08dbc4c1419f
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP122MB0202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 10:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188669

From: Julian Haller <julian.haller@philips.com>

The current dunfell CVE scans report 0 CVEs for our dbus version. This
is not correct, though, as we use the wrong product name to query it.
Fix this to get a proper CVE list.

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


