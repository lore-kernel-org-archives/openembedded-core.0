Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10295C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 14:11:28 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.70])
 by mx.groups.io with SMTP id smtpd.web11.137921.1700835079479316384
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 06:11:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=P7CPj+e+;
 spf=pass (domain: infinera.com, ip: 40.107.101.70, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIvrDNNQgvrJ9cZm1NRYx2UZUCQAZ/5tSqTULpxdUzjIUtBT3tLESnwgEnx70AgFpAVVuJWgGfj1bv4nwxn8Upw4kgNnuTsD7MaWMy8WCADuUKMSRDfCz4nNd+s5EZUxxKfF7/ye0TOqA/zGjITD4ZDfcpreJuClR93AIIyDydgCtYxClLVR/7Q+dlhmGFYGL4TYfKK09yfqi3eOt03WqE6vJ0nBviHi9ZVy3HpHFFccCJzbYsKIDnCiE4hY4rgL4iMUE6nqWuEd3WzG83wLH/2ACgbNDEWEFLknDKw5xkKwhMwOhxod9RtN+iW8sG729F4b/YAn0+YUZOuy/WVa6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0cu8aPddouhVFFnCamRgjJyovGnhgtMQg/Y5yZRAJU=;
 b=PtZ6Jtv0v3yExvi56e31bQu2AxkOnPzSSLbIRm+lBV/YMybZ7jAB08IvokHwOvmeETfAErkY/08OJl8OsBODZDoTM/VxUBzR89SZ7J+8qeHoldp8Hqk9kxiXoGTyFtlfS74EWZvT5KC8uGFLNE6RVNOZKib9rHDPpHZICUaE6BYL1H58vWnHgCxwfCfvZT616yAvEI14wA1yL6AjiIxebW+h3II5IIQKHvFvbONFpcwXv21nfQr6vQuwgcbTCqJoulSJi+Ov4X9nfKlvBQJ9s4u2EyjX5EiJE4fBokEfLwwHTKJzJVFWoXc+6OamoxefXu4I226qMClPcNr/dbAjlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0cu8aPddouhVFFnCamRgjJyovGnhgtMQg/Y5yZRAJU=;
 b=P7CPj+e+knH8u2WURLjMJVdAblBJNKF7OCTTSJiUPdEc6HQQhQY7hTcZ0i+LCRYAxyBkZmYu3MV/m2FrnxUvHmHCUiY77LiJcnZUqPwf2Fvu+XFZb9hHL7gSvejp2+4zv5wmvujg+BR8Jj7dgVkBNqZIwllc4hqu61udiy2ENPfk9EthRGRFvFyaIIc+aiyykP8ysK9JK3nkvORc2w7XJ9uX013QnWkpUMI8U/xis/BxlwX3kyKYK2h6TInrpZ9aIuDq6NMqbwYOWs3ARPR2NYnOzfnBbqLFHgpFbXnukp/QbAJzByqDGuvZ9Dyk563fKiJVzYTJ9Q2UW16gMdK8IQ==
Received: from SA0PR11CA0208.namprd11.prod.outlook.com (2603:10b6:806:1bc::33)
 by CH3PR10MB7433.namprd10.prod.outlook.com (2603:10b6:610:157::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 14:11:16 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::f5) by SA0PR11CA0208.outlook.office365.com
 (2603:10b6:806:1bc::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Fri, 24 Nov 2023 14:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 14:11:15 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Fri, 24 Nov 2023 06:11:14 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.6 via Frontend Transport; Fri, 24 Nov 2023 06:11:14 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Fri, 24 Nov 2023 06:11:14 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 893AE2C06D80
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 15:11:13 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id 879B141DEBD0; Fri, 24 Nov 2023 15:11:13 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [kirkstone][PATCH 3/4] pseudo: Add PW_SUBDIR
Date: Fri, 24 Nov 2023 15:10:52 +0100
Message-ID: <20231124141108.1397342-4-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
References: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 24 Nov 2023 14:11:14.0393 (UTC) FILETIME=[158D2490:01DA1EE0]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|CH3PR10MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4c204b-7cbd-4eb5-da3d-08dbecf738cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YYGxdxBEea9VqMDYVY85z8v6oOYYuEavgK4rkVDkpPj/owKg09qivwA9bWbOMZ1e8QEisRYPXddqVvBNwwHJHXWCRFEUsJu7b03YSh/erXXElXyzV+yHrir7NxqEKbO71D//qlvIizbN/kFlMELgHQEOHosugw9zcam0sSZYHta3dHYlSPElRfjofPPXyC6kdjNiTe26ltj7P9fmG/SNLdtc63mseRu+XdEN4GfMNzBWjNeSKWtEIWpVdK5z1081guifaMWMVC+as6bVtyA71vsuMLozZo1IqxX8gDNMlYvxxzNsEyig09N+F9/GtoX8ssebn7QL5RDHzeC9Cgpdt4Qdt2gsUEH8BvJHNGGU5JDrUtKcODJa4XlbdU395E5B6xGymHlA1Z+laPBmuRJudNaxoFTaRXGo/nO5AuOydBcyyYKezaZWOfQBlKlnTvtIRaQZYfckLX8h5IoKuHcszvCOuxJc/Yw4gZg0oHXAHcOXkPaDtny6EZQm76y2JtlQGISiSQYY1oPOK7UhWa0ETXPJjxsVI5MfuQsHbPWcOL32Fnp419gR9BRKihVjJsnzfwQFUrjMi7xUMkfwrb5ywaRpB++9JErVQmpuVhiV6reucgF/tyS5D7KBjIF3pjgd3NrgSHkleZpjTvmQRDRf0HBqlfkirWtayniiJ/JGyfZt6xTG2p0w9jUlrYgoXaxQtIQ2ESAqmxWhI9j1N3BtYpBkGhPgzea6NDhuPYoFQMIW4y41tq2OjP/TjplmD2Pv
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(36840700001)(46966006)(2616005)(107886003)(356005)(47076005)(81166007)(426003)(336012)(83380400001)(6266002)(82740400003)(26005)(40480700001)(1076003)(6666004)(478600001)(36860700001)(70586007)(70206006)(6916009)(42186006)(316002)(44832011)(86362001)(8676002)(2906002)(4326008)(5660300002)(8936002)(41300700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 14:11:15.6342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4c204b-7cbd-4eb5-da3d-08dbecf738cf
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7433
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191199

Add support for creating passwd files in a /etc subdir
Set PW_SUBIR to pwdb to get passwd files in /etc/pwdb

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtool=
s/pseudo/pseudo.inc
index 7e09b6d58c..7ba2e2261c 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -10,6 +10,9 @@ SECTION =3D "base"
 LICENSE =3D "LGPL-2.1-only"
 DEPENDS =3D "sqlite3 attr"
=20
+#Set PW_SUBDIR to pwdb to get passwd files in /etc/pwdb
+PW_SUBDIR ?=3D ""
+
 FILES:${PN} =3D "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${loca=
lstatedir}/pseudo ${prefix}/var/pseudo"
 INSANE_SKIP:${PN} +=3D "libdir"
 INSANE_SKIP:${PN}-dbg +=3D "libdir"
@@ -131,10 +134,12 @@ do_install () {
=20
 do_install:append:class-native () {
 	chrpath ${D}${bindir}/pseudo -r `chrpath ${D}${bindir}/pseudo | cut -d =
=3D -f 2 | sed s/XORIGIN/\\$ORIGIN/`
-	install -d ${D}${sysconfdir}
+	install -d ${D}${sysconfdir}/${PW_SUBDIR}
 	# The fallback files should never be modified
-	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
-	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
+	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/${PW_SUBDIR}/=
passwd
+        [ -n "${PW_SUBDIR}" ] && ln -fs ${PW_SUBDIR}/passwd ${D}${sysconfd=
ir}/passwd
+	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/${PW_SUBDIR}/g=
roup
+        [ -n "${PW_SUBDIR}" ] && ln -fs ${PW_SUBDIR}/group ${D}${sysconfdi=
r}/group
=20
 	# Two native/nativesdk entries below are the same
 	# If necessary install for the alternative machine arch.  This is only
--=20
2.41.0


