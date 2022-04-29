Return-Path: <rahul.kumar_3@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833C6C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 06:49:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.107])
 by mx.groups.io with SMTP id smtpd.web11.7099.1651214955768690626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 23:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=nUaituvV;
 spf=pass (domain: code1.emi.philips.com, ip: 40.107.21.107,
 mailfrom: rahulkumar@code1.emi.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSE19BdCLjYinmvihp+7aZ0fqGC4DMIEcT+EHTYsPvMJz48EHOtizUPX8uaKkz0yYWOOX70jCR94wwvhlJfLPWYBcimxx4TUY8csugg62Mm5hNcOnUJy0BM9mR29NIqeqhuIdpdXkoCASW0J7wy/8xIq2BcRLE7OoZwlILe7hbBh0k+Db2CnXR5KOcAjtAndqBPZU15dcv9M5qvgKLduUNlISlZX6IMvkEI2O0wAAErm4xU8wI8lexNZy9Df5AWUOybe4iZY7I8d8bFFpRp7CMLzUXqETBZ8+h4cJxIwXupXsHp9JYvHs2+9jNL0bUqYKmoeTS/NQmonQ8BZaw7dRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGAA5v/sMTAcbIEgcrkkex4T9c/YV1wLNVqIsVdd0+o=;
 b=OpMggNUdRmR+cwhsOTi3jrde0/s1n7Qa48WY75TInctcRbo764lmG/h1/L9a+9QB+qFk0RnT1yykCfEroACdcuD08tq1H+p5efuyZFAzua+6Fvk1/hfWEUgoTwcoo2wQi9tuBiIwLyiVoIpN3KwmRj2TyZosgs0xTna2hy2qDrxr3rfVvdbxFnn2g2WbYToJR9nDtS0t5UO6a2lpW/hKUtra3pRmDjAeMD//darxqFqo75ONGEqlLNVf67oNjI+WP9zEbU5pBoaOsdpg3kt9IMVdrgz8zOoiw1FHdK66l09tAaYBJQ8pON+8EBubtPYvhsfTGf1eZP2SHk9RhCA6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.136.170.117) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=code1.emi.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=code1.emi.philips.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGAA5v/sMTAcbIEgcrkkex4T9c/YV1wLNVqIsVdd0+o=;
 b=nUaituvVA8UZo8pZCknhVgNIsVi5pLPbFJ8EhgvU6gmfBNt+as0op/KvKhNojP9YcUTOsIXIRB92cToG/615cVtYEF3K4oAGgJMDdMPN+h7HPtDupCNJliJPG+dfdxPPFR1xcW3PQZV6cUiZlJRA2KqqIzWhKt5lCdip/itlDyk=
Received: from DU2P250CA0002.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::7) by
 DB9P122MB0269.EURP122.PROD.OUTLOOK.COM (2603:10a6:10:1dc::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.23; Fri, 29 Apr 2022 06:49:12 +0000
Received: from DB5EUR01FT048.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::5a) by DU2P250CA0002.outlook.office365.com
 (2603:10a6:10:231::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Fri, 29 Apr 2022 06:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.136.170.117)
 smtp.mailfrom=code1.emi.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=code1.emi.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of code1.emi.philips.com
 designates 18.136.170.117 as permitted sender)
 receiver=protection.outlook.com; client-ip=18.136.170.117;
 helo=ext-asp1.smtp.philips.com;
Received: from ext-asp1.smtp.philips.com (18.136.170.117) by
 DB5EUR01FT048.mail.protection.outlook.com (10.152.5.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 06:49:11 +0000
Received: from smtprelay-asp1.philips.com ([161.92.84.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-asp1.smtp.philips.com with ESMTP
	id kK5Tn9dyPG2CYkKDAnABDD; Fri, 29 Apr 2022 06:34:40 +0000
Received: from ingbtcpic6lx242.in-101.lan.philips.com ([161.85.103.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by smtprelay-asp1.philips.com with ESMTPA
	id kKPsnBAc1OM31kKRDn9bgT; Fri, 29 Apr 2022 06:49:11 +0000
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
From: Rahul Kumar <rahulkumar@code1.emi.philips.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] neard: Switch SRC_URI to git repo
Date: Fri, 29 Apr 2022 17:47:44 +0530
Message-ID: <20220429121744.2196669-1-rahulkumar@code1.emi.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: rahul.kumar_3@philips.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7715e3b8-8779-41ab-b6ae-08da29ac5e4a
X-MS-TrafficTypeDiagnostic: DB9P122MB0269:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9P122MB02690B3A6B068EE8B0EBE1C19DFC9@DB9P122MB0269.EURP122.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hyarKdmZpwDUHYdFYc5CcHu2d+hrStoyuKaHb4jydpVYWBO8GJ1/sJrHjjhmiqEbpaoYeItyCzY2PnHrEF+MVYwlfyj4u9Q4IRPXCWi+yqfMQS4/bLsKBxFm0Sexak0PZDMuq+Owlq7LkJYG2T6s5ediUQGLhoCVDpV6L+HS+fDCZBpain9scQF1wfjOErYCD/MZvbjDtR7dNwsHRijRsLr9J4K4LIlZAXvvGO71fvPSkuHX3pA+DFTkj8uTXxVM31ZZ1T7E+Hq4o1F2ATDRyH3xlK5S+DjficbY6xkIuUe6GrEUzpjci/FHLyaVfzEUm607dYQtvr/vPRw+oi4Y3kNZMDtuwJNDxL400nBO+ZZZbKUer1qCCjfa8u2eD2iJu6PTsGxkDVFN5V84mPLGIOuafj5kKsEhTK81KYDqxzvHyDX431waiqe5A4Q546BEzLGFQys9111XefDDeERJVXC9vlLA5pugpdEQp2Su2hAvHg6lPeLB82Y1LDWYekIl7RhStJl5VQYYvVFuZ/lag06Ul0OLPLKf+AoRWmVCBK2gw6W1CCgyXp+g879pm608XxAHMJ3bZEcuBpi28XkVn1LACBXBHeSw1Se52HZZWrAfZKiZmgjmFZ34SeAXtA3X5Od3dsUHahLvgOCCkrq9ZKNHzczqZ9psZ7kN/gHbN/Ay9hg6L1E72ofdqC72C7j6xRbaX7rknKoWcrYwgxCTOCqNNEGS8KRhSehTTcUYSYuxGK+ljtxyM0TS41Q0oAMRUZyFSt6gZSH0RXM2gsWIng==
X-Forefront-Antispam-Report: 
	CIP:18.136.170.117;CTRY:SG;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-asp1.smtp.philips.com;PTR:ec2-18-136-170-117.ap-southeast-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(336012)(6666004)(81166007)(82960400001)(40460700003)(36860700001)(47076005)(2616005)(956004)(26005)(5660300002)(966005)(2906002)(82310400005)(8936002)(8676002)(83380400001)(508600001)(70586007)(70206006)(1076003)(86362001)(186003)(356005)(6916009)(316002);DIR:OUT;SFP:1102;
X-OriginatorOrg: code1.emi.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 06:49:11.4578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7715e3b8-8779-41ab-b6ae-08da29ac5e4a
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[18.136.170.117];Helo=[ext-asp1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT048.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P122MB0269
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 06:49:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164994

From: Rahul Kumar <rahul.kumar_3@philips.com>

The tarball (neard-0.16.tar.xz) fetched by the recipe is incomplete.
Few plugins (e.g. tizen) and tests scripts (e.g. Test-channel, test-see,
neard-ui.py, ndef-agent etc) are missing.

Since neard did not release latest tarballs, so as per community
recommendation switching the recipe SRC_URI to git repo.

Community Discussion:
https://lists.openembedded.org/g/openembedded-core/topic/90058043#163681

Signed-off-by: Rahul Kumar <rahul.kumar_3@philips.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 (cherry-picked from b563f40ebf4461d9c35df72bd7599ea11e97da9c)
Signed-off-by: Rahul Kumar <rahul.kumar_3@philips.com>
---
 meta/recipes-connectivity/neard/neard_0.16.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-c=
onnectivity/neard/neard_0.16.bb
index 7c124a3c0b..dd0742f792 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -2,21 +2,22 @@ SUMMARY =3D "Linux NFC daemon"
 DESCRIPTION =3D "A daemon for the Linux Near Field Communication stack"
 HOMEPAGE =3D "http://01.org/linux-nfc"
 LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7=
e \
+                    file://src/near.h;beginline=3D1;endline=3D20;md5=3D358=
e4deefef251a4761e1ffacc965d13 \
+                   "
=20
 DEPENDS =3D "dbus glib-2.0 libnl"
=20
-SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
+SRC_URI =3D "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=
=3Dgit;branch=3Dmaster \
            file://neard.in \
            file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
            file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
-SRC_URI[md5sum] =3D "5c691fb7872856dc0d909c298bc8cb41"
-SRC_URI[sha256sum] =3D "eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6c=
eac9b6e6e65b36"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7=
e \
- file://src/near.h;beginline=3D1;endline=3D20;md5=3D358e4deefef251a4761e1f=
facc965d13 \
- "
+SRCREV =3D "949795024f7625420e93e288c56e194cb9a3e74a"
+
+S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig systemd update-rc.d
=20
--=20
2.25.1


