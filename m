Return-Path: <rahul.kumar_3@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B55C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 04:32:44 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.125])
 by mx.groups.io with SMTP id smtpd.web08.6415.1651206756330479722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 21:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=RK9IKMuT;
 spf=pass (domain: code1.emi.philips.com, ip: 40.107.15.125,
 mailfrom: rahulkumar@code1.emi.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d77hfSwUPXJyaq3UJSLPm/2lsvqRMZRLy5/siFe75i/nJQZ/CYIJ95fhA8H5jzR8rEnvMKgv54yQdPoUc7xJ7eJC9WbKWpJB+0HsgMd6sDexjYAasBSKLnZ2bhAGPwIzO2i87i4A2AKS8/zsjwFVqMIaP0x0bnmXOVo1eZkXfVc1hyg+XRCwkeEFkGG0k4aw25/wg2do/LD/9sne78sneyI3lIw4PzwawwXqCfVWjoN6vVV7NjOWRr6wF7yRb5bt+Ttcov4Dv91zOurUBKya5a+3f3rdmgEmi/vUGrISM1LrXuvagDmpLukkkyUo5pQcYAitFm4i8XbDGXV1U9MMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xN0bv1oNiUu8nCz6yyy4AaXbmZfjaamRjfMO0DF9OQ=;
 b=OADhA+RGmpigqijLGv97IASikIQsvpUDzOG+YZqyN0iLiy6TwOj+d+jFOZHau96MzpWQBwhJDpF1fZmr2JvU1jePq5NmzA1tNhS+xTE56GfpY9alLDHmW4eq8wAXFMCRKKpRDN93sgwvchfrgLZgnaB4eCqAgZ6XnqgpQDqlZpiiIu52/CKaLm2Wa911KvEU8EECdXrVidfUEDajkfP1Xo7zbzu7CyW1NdcAV9E/2scBr9dVnckkBGUmoyy4XQMjNbAVqJPgXGJ03L8a0y2Dy7R+Z33C5AUVBDUGgH77Av/FFTnG9xEfEouWRMDlwGb0ty2yirHIP940UKxjQSc4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.136.170.117) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=code1.emi.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=code1.emi.philips.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xN0bv1oNiUu8nCz6yyy4AaXbmZfjaamRjfMO0DF9OQ=;
 b=RK9IKMuTydEaSN1LQ1x5Bo0hagAoyLjgg8nK9fYjqDTg7mFzenejpQj14qGzoz33+GWGPsTAoSf6zOgDxM3k99amC94/HYV9SW5ayuAGcwLbxj/2yGQ72IzKUyHCH+HqGV0qSWtM3bBYe39cbSPRaSAM3DMUKf2wPPe1SPokK/s=
Received: from AM6P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::33)
 by AM6P122MB0103.EURP122.PROD.OUTLOOK.COM (2603:10a6:209:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Fri, 29 Apr
 2022 04:32:33 +0000
Received: from VE1EUR01FT083.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::41) by AM6P191CA0020.outlook.office365.com
 (2603:10a6:209:8b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Fri, 29 Apr 2022 04:32:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.136.170.117)
 smtp.mailfrom=code1.emi.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=code1.emi.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of code1.emi.philips.com
 designates 18.136.170.117 as permitted sender)
 receiver=protection.outlook.com; client-ip=18.136.170.117;
 helo=ext-asp1.smtp.philips.com;
Received: from ext-asp1.smtp.philips.com (18.136.170.117) by
 VE1EUR01FT083.mail.protection.outlook.com (10.152.3.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 04:32:31 +0000
Received: from smtprelay-asp1.philips.com ([161.92.84.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-asp1.smtp.philips.com with ESMTP
	id kI3nn9dFCG2CYkI4unA8zj; Fri, 29 Apr 2022 04:18:00 +0000
Received: from ingbtcpic6lx242.in-101.lan.philips.com ([161.85.103.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by smtprelay-asp1.philips.com with ESMTPA
	id kIIVnB6fuOM31kIIxn9XNC; Fri, 29 Apr 2022 04:32:31 +0000
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
From: Rahul Kumar <rahulkumar@code1.emi.philips.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior][PATCH] neard: Switch SRC_URI to git repo
Date: Fri, 29 Apr 2022 15:31:59 +0530
Message-ID: <20220429100159.2196288-1-rahulkumar@code1.emi.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: rahul.kumar_3@philips.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6f78f9c7-1061-4a70-f7d3-08da299946d7
X-MS-TrafficTypeDiagnostic: AM6P122MB0103:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6P122MB010384458F96587BA95262EA9DFC9@AM6P122MB0103.EURP122.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	McJN4Nuszu1rlNiPJ7sBQFznwZ9jAFP9e0B0aj4/RAUUkVq/njtSxuLmhjnyQWDLE8skDosPuDwceQLTOuLLhDh39M0wJvbmR6Kkyp0Ew7bjT90diPi+uNe17nZGSp+QL7g5eQn8eXHIE8+JxhTatpQ/05rM/nOdjb7kdsCrbbIUgv0GE5TwhTvKTbjcR2hIlkFr8yjVupWs1GPfQ+QJ5aZsUGJPvcIO7ehoDyScGJ1KBOvokOMdmg0YW3Cy3+1/jFLTneTE041FkiRtTYGkKwHPdcouVtWrnbvrRw5v3yZtdx3oC04hp+QEqRWTpQaB9BH2g+C1oX/brvAY1FSj0ensSSejQh1wE4CNNhPpIWpwkg81M7koz765CVMStyYLawzg/Xk0ZCMFrJgs7hE7CpQUdY1C3yEtrVmnQEYHcAXcRZ4hzV8fevYCx64i5dZ9zWhAAD8XKGjkvLAGO49Ocb5NAmxCI3wLSDim17EWsz+UseTLpMBkVRQoEFrm2dselb8tH+ejv8adLhKZfRuKO6Bp9B6sGs0TGvn1EJujG1KSwOjBIW+dPeKfiddT5FCN+l3GEw+hxJzLAflbxTe7GxhXkl3PT61HfGLvdx+lVZqb76mP+YimOJVEGgJjasuKESYjDj3v3f80UqOZxC+DfQdY/bQjw0lfb0hs3llJ4JDV5Zrejz2Gs+9mhG+Kpi0gHLTvsOIv1IRtb4cLbZLE+wSDrynYp7xX3ldE8DJWgK7wLQX5ih2/TW9jS6px8tTQXu298gcQsKbxBsaWzXtCvw==
X-Forefront-Antispam-Report: 
	CIP:18.136.170.117;CTRY:SG;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-asp1.smtp.philips.com;PTR:ec2-18-136-170-117.ap-southeast-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(2616005)(70206006)(36860700001)(47076005)(83380400001)(5660300002)(81166007)(316002)(956004)(336012)(1076003)(2906002)(26005)(40460700003)(8936002)(186003)(8676002)(82960400001)(6666004)(356005)(508600001)(6916009)(966005)(86362001)(82310400005);DIR:OUT;SFP:1102;
X-OriginatorOrg: code1.emi.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 04:32:31.6796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f78f9c7-1061-4a70-f7d3-08da299946d7
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[18.136.170.117];Helo=[ext-asp1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT083.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6P122MB0103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 04:32:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164987

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
index cc6af4e1ca..769fda8c19 100644
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
 inherit autotools pkgconfig systemd update-rc.d bluetooth
=20
--=20
2.25.1


