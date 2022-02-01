Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879BDC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 15:12:02 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.79])
 by mx.groups.io with SMTP id smtpd.web09.49759.1643728321308558191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 07:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=yNfbnWbx;
 spf=pass (domain: siemens.com, ip: 40.107.5.79,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sepu63LtFMIquEtcKet0ltkesT2M/ySJ2A9YUqvLubTMs44XQUuQ2XI9pB64heCEi80Z4In9NdvcvohqVqhGx9OOZL5OexbhR6z8ff6rlPz1q6LcZPDA8gIPrN9Ah3Hl+brSvy1RxKm2/H+NMF/P33gq5umiUYuHVOi7CO8W2Fub6rIVH2lEMF5NR5p+SYb5Fgn8nB+zMbK81N1xq2tDrmDB4jQrefMoPqxTkSwphcCRkKYVxiJ8nlTfs9jp23uAe97NfPMTh7phkz2OFARwYLyhAPot3hQa93SS4wlO8cRoaotLvWyQvGi3/VWa5CV/UBthaqpzLMlslx3NNIrPnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uN8V9c5ufP6BQoMh42YKObc/wfQNaw+RJjm+oJ6SDtw=;
 b=BKI6Ib+eu01XpdC6xO1IWSHZDtqyGsvEylv7jlmIXfAkIJ94rxl6rWArpVC/wFAOX4q3vPwOoJv5hDMA+l7oM7dUdRVVgry+e224o4AfIeGVzRTh7HlnGQ8djrO9GOXEjnCg0gVK5SpYFm5h/3uT/6HDJngkjfrKnmwXzK6cYgkSXpr3HNto6pw062jTnx+7ceSLjD8ITZOgqBxwB9TSVnBttl/QBcsvo3Who5IWtlCu9/xTJyDtbG+qihmuIQPnabhk3DBERx3sqyqXD3ZgoBZNa+jFa3WWymjj6DvLjvhMBWeql3jEyET2MLXtcVibRk9EHn+vCIaFAbGhwJuntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uN8V9c5ufP6BQoMh42YKObc/wfQNaw+RJjm+oJ6SDtw=;
 b=yNfbnWbxiYh+SlO/MQn2kDf3gxv+NMC2lopVZtO21x6ppKszs+vBPeCLmHbvmoPYLte1gkQbkfefKxWHGIx31hR0cs3637BFgxkyeR4smv0/cCRcRy4nmdC4RYQ7VAqeDRR9e4X9g+U7Q+lEtybKcRkQX301O9VRP7A5c6wbvvsDkqJSO4ORi8Uvc8UrI2iHQ2yRGHZZjC1AZXKLnk/6C3TzJzhCznT3W+ULdmo5RlkCtEU5ARWVKG74Y8wW2hz4UqF3urgSxxKjKCHU7ojZnJcKRvYRfsy4DiGU895VnRUa+nmkL9JBNkVaC4El8ponlS4AgmRxH8TJP1+9CmTuBA==
Received: from DB6PR0601CA0007.eurprd06.prod.outlook.com (2603:10a6:4:7b::17)
 by VI1PR10MB2544.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:82::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Tue, 1 Feb
 2022 15:11:58 +0000
Received: from DB5EUR01FT005.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::3b) by DB6PR0601CA0007.outlook.office365.com
 (2603:10a6:4:7b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21 via Frontend
 Transport; Tue, 1 Feb 2022 15:11:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 DB5EUR01FT005.mail.protection.outlook.com (10.152.4.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 15:11:57 +0000
Received: from DEMCHDC89YA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 1 Feb 2022 16:11:57 +0100
Received: from md3hr6tc.lan (167.87.1.27) by DEMCHDC89YA.ad011.siemens.net
 (139.25.226.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 1 Feb
 2022 16:11:57 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] dhcpcd: add option to set DBDIR location
Date: Tue, 1 Feb 2022 16:11:36 +0100
Message-ID: <20220201151136.398787-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.1.27]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC89YA.ad011.siemens.net (139.25.226.104)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.261600-8.000000
X-TMASE-MatchedRID: GSK28GLB3jED6PNB0c9WJhIbNaRRgYPSkSm6y5yVdOg/ApMPW/xhXkyQ
	5fRSh2656Mw4RnkAvRKcoHkKu1u1byESwSpCESDRe2ASDCNvnxqM46lASX8KqWWnA2xO92UpVM6
	1tYy22NFfCOymABgDYC2NgsVnbGZK0BpcSFb1f16AMuqetGVetnyef22ep6XYOwBXM346/+xj7e
	H0ao9Yg5O2OuZfSeQzvp+z7XfSeQn3jOKM6BiU79jTb1pprlew
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.261600-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 DF5AD8D575672E658365251A06A228388A86A729BB33BD76ABE8355977587EA62000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d50c0780-ff96-41ca-fc0c-08d9e59530ba
X-MS-TrafficTypeDiagnostic: VI1PR10MB2544:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB2544794D4228EB1004EDB5EC92269@VI1PR10MB2544.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lawoTsa83x/awc4K6TtMGQu/R1GajxFj4zDLTmEHHaVtU0xRHo5JxXb1fKEkg+b3ojVAtm3qyait0xZK28PiNgRq3y4tBOcxV36raxJ7pedJRDnCEKq5BLjVCBSQWYfO7huQaafwb9m0whkYD/lBh+OqeC5fohqAVy26QNpPr4jF8zJERkEfvJA7oypN0s8vFaDPfcrolg0b+JXPEkDqXKMCuD5XwgmGL0YAx4YruWDgkRvS4LdzYVCm46fLAuFRkGtJAeoDU1SYsXsRGhfirOkiijvLssGYORMnLp4/iT3ueQy/I6tECSJ7gHMLkeq9Uj+ov4mDdwbS9Fl6bY82gF9/sfAm+ATKO61C8uQiFeQHpqN3ABp6LOu+7+Nofg8GG1RkNcJSvbWGGVJmXAh0yh1q1tAnJ9qbvnLBOkV/8bO0ociT7DzjCLuMw9IuGXsy1rRsFmymuF93JMe5+Xc6hTmgXYI0BGibwyA8tww7nr4RaJJuDsJDXIcz0MXnXJPpB0/d9jhesqVLpr9J6T1tw5Poscg6CCOafrYD+YpAaOesNxdp3oFK960s+Bx72ILSgEZiCp7v32YuL9fpFzPRHckDtDL1PGN34aQl4Ljtim91283qCSBwd3Kale2ikG8lLa81p5OoZpyytHBqO5TeMTlJDDFd6mxH7JnB3hNNwA6dWIltL0bjprvE4jpGcWJAm/xntOpf9AHgKd3ZXKtOWw==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82960400001)(8936002)(70206006)(107886003)(44832011)(2906002)(2616005)(36756003)(5660300002)(8676002)(86362001)(4326008)(40460700003)(336012)(81166007)(70586007)(356005)(956004)(26005)(186003)(1076003)(83380400001)(16526019)(47076005)(82310400004)(6666004)(316002)(508600001)(36860700001)(6916009)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:11:57.9303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d50c0780-ff96-41ca-fc0c-08d9e59530ba
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT005.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2544
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 15:12:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161157

This will allow to use the different DBDIR location, because the /var/lib
could be used as a read-only location.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipe=
s-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 4007a4bd2d..ab6ffe986c 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -32,8 +32,11 @@ PACKAGECONFIG[ntp] =3D "--with-hook=3Dntp, , ,ntp"
 PACKAGECONFIG[chrony] =3D "--with-hook=3Dntp, , ,chrony"
 PACKAGECONFIG[ypbind] =3D "--with-eghook=3Dyp, , ,ypbind-mt"
=20
+# add option to override DBDIR location
+DBDIR ?=3D "${localstatedir}/lib/${BPN}"
+
 EXTRA_OECONF =3D "--enable-ipv4 \
-                --dbdir=3D${localstatedir}/lib/${BPN} \
+                --dbdir=3D${DBDIR} \
                 --sbindir=3D${base_sbindir} \
                 --runstatedir=3D/run \
                 --enable-privsep \
@@ -43,15 +46,15 @@ EXTRA_OECONF =3D "--enable-ipv4 \
                "
=20
 USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system -d ${localstatedir}/lib/${BPN} -M -s /bi=
n/false -U dhcpcd"
+USERADD_PARAM:${PN} =3D "--system -d ${DBDIR} -M -s /bin/false -U dhcpcd"
=20
 do_install:append () {
     # install systemd unit files
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/dhcpcd*.service ${D}${systemd_system_unitdi=
r}
=20
-    chmod 700 ${D}${localstatedir}/lib/${BPN}
-    chown dhcpcd:dhcpcd ${D}${localstatedir}/lib/${BPN}
+    chmod 700 ${D}${DBDIR}
+    chown dhcpcd:dhcpcd ${D}${DBDIR}
 }
=20
 FILES:${PN}-dbg +=3D "${libdir}/dhcpcd/dev/.debug"
--=20
2.34.1


