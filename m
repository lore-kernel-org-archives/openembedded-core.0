Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9C3C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 12:25:48 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.44])
 by mx.groups.io with SMTP id smtpd.web11.5746.1651667146432232309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 05:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=ptjsIeoM;
 spf=pass (domain: elektrobit.com, ip: 40.107.220.44,
 mailfrom: simone.weiss@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EVUX8DyLsk9EbJsXKxb2Y+Bbe5ELwuIJHmGiM1vAa883SwZdlTtYGz97MY4TfkYgKnog5K4gD4Y8E1STP/OS8as/7yCtsiMKJg3G2ZvxLsdJTHkrMdMrFBacz2i1D8mfEBHjExy9p45ZzqZcA82TUXn76k1vTF2nQGzhLS6hI7rKH7rbrmMIWo9KGddUEeZb90xoZDOzx46Y3mpaisAkgQ6HBQJD/DHvQxnV1Gvp53VhDf9K4yQQv/WAp6rI8JQQy+RB9F/kw8mkF2LrM0MxttwAAA3z5pwWCkkUPQM7c5oNc6CWtQXvgkesnjEvDm2oXJfKxFu+lufUrdZH4xUNiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqInkfM2sH18z0rcGW51OK09xFDf8Vgspj3XsNe4wGg=;
 b=oeKG9RgNxn6zPR6fts5QgI/soVIzxDphSsAm/cibxLnCrpKXF5xQB7OUGGKl5mdufLm/WfmRuZbSjjS4UEJ1xmeth69V7e+F/roIi99fkZ/RZY9iPSQTw4q28KodsD/GsCy8R4v/1jCUHEjo5eJUIl7uyusI8qyF8wIheMkUFtdeDUOP9kvtjqaJL4ddqJpYcNxkD/nqE324zqHSEbuHfr0Ph330WFqRdaotglilD7Q+5X+VOrCFe0Yz5SS0K3NCSFUw7tsYPmA3yTPIziuQb7YbQqILUrG+IF8PuURPX2Do4/iBJU1oIeYAvUKRTNbDGvVVnpea06BRytO/RFXRZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 4.79.107.243) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com; arc=pass (0 oda=0 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqInkfM2sH18z0rcGW51OK09xFDf8Vgspj3XsNe4wGg=;
 b=ptjsIeoMSUHGiQfzlBiVeC5eDwvWGw+Nxsxw23UnH7RxXZAV1jKb7Sn+YaRvcnwda9HVqW1KJ1nJs/4HUgfwyA4JCZwKN5Jt5QNgkW4SEVk5O0e3sMwrQUcuIvHzaxw72wYSEefBZloEiHUHY/wwyRxJiR3auhYaW459+Ot7VQg=
Received: from DS7PR05CA0058.namprd05.prod.outlook.com (2603:10b6:8:2f::11) by
 SN6PR08MB4784.namprd08.prod.outlook.com (2603:10b6:805:76::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.20; Wed, 4 May 2022 12:25:44 +0000
Received: from DM6NAM12FT012.eop-nam12.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::94) by DS7PR05CA0058.outlook.office365.com
 (2603:10b6:8:2f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.7 via Frontend
 Transport; Wed, 4 May 2022 12:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=fail action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 DM6NAM12FT012.mail.protection.outlook.com (10.13.179.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.6 via Frontend Transport; Wed, 4 May 2022 12:25:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
 Wed,  4 May 2022 05:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQcurauuI8yNnxHc7OHm0ih7J/Tp8JiJKALKjM7Xzri5u/sgAtGCrhMBBAUlomQI100UnU78nQpFv1lmRfd+eNlDzJbJTX09UIEqOBDJ4d5hoN90hRbRPM4r+C0LpjH+nVDRHObuSkmK0KyalPv/xVBjWttH/FtfzyE6VJT9brYvucCJPkMiPvM3VLKiDChWzf8XFQ9BJiXe6fEHlV+liPTHvATXHnMmPEMXZ21guiSm0XFFjDftz94dcC+4tSQsWtJN8/D/DPeXikNSyTeHUNBaR3TRJeNA34tFZ6t3FrdzBjkLbKA8cVPCeVwbbUP2nNEWivw0i2DOUb7ANO3hdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqInkfM2sH18z0rcGW51OK09xFDf8Vgspj3XsNe4wGg=;
 b=liFimatGNKOuv91Df02aVwiPxIkcqC87XOl6N0wniYSnn36L6XW7zUwI+pUFfFe59upeWVQvLM3S1mPROTA0D1ROaE7TnxXn3Igx0JJSLXJBa1W8IPlumF8yPJ8sOMS6HLaPaPsqflR5jAdSNDRn4wKaQZZXfoSOb9fxIXrFIq9zp08EkjAFf1fL5O5lkODokP/YOXML7gh999MB1JxIIkYnEicCVlT//pPSD6caVVht67CiitWRa3yzXhtQ5dEvrHJk/U4+ng1n7mT0aWpBDyfp+VZKX5P/aRejBuLuS5wtT3/jS1zGM0eUC6p3bDUb+y101Iv2mJ1UNBBHVfqosA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 213.95.148.172) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqInkfM2sH18z0rcGW51OK09xFDf8Vgspj3XsNe4wGg=;
 b=ptjsIeoMSUHGiQfzlBiVeC5eDwvWGw+Nxsxw23UnH7RxXZAV1jKb7Sn+YaRvcnwda9HVqW1KJ1nJs/4HUgfwyA4JCZwKN5Jt5QNgkW4SEVk5O0e3sMwrQUcuIvHzaxw72wYSEefBZloEiHUHY/wwyRxJiR3auhYaW459+Ot7VQg=
Received: from BN9PR03CA0953.namprd03.prod.outlook.com (2603:10b6:408:108::28)
 by BYAPR08MB4245.namprd08.prod.outlook.com (2603:10b6:a03::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Wed, 4 May 2022 12:25:40 +0000
Received: from BN8NAM12FT011.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::a9) by BN9PR03CA0953.outlook.office365.com
 (2603:10b6:408:108::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Wed, 4 May 2022 12:25:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 213.95.148.172) smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 213.95.148.172 as permitted sender)
Received: from denue6es010.ebgroup.elektrobit.com (213.95.148.172) by
 BN8NAM12FT011.mail.protection.outlook.com (10.13.183.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.6 via Frontend Transport; Wed, 4 May 2022 12:25:38 +0000
Received: from denue6es011.ebgroup.elektrobit.com (10.243.160.101) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 4 May 2022 14:25:34 +0200
Received: from del01461.ebgroup.elektrobit.com (10.243.54.88) by
 denue6es011.ebgroup.elektrobit.com (10.243.160.101) with Microsoft SMTP
 Server id 15.1.2308.20 via Frontend Transport; Wed, 4 May 2022 14:25:33 +0200
From: Simone Weiss <simone.weiss@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
CC: Simone Weiss <simone.weiss@elektrobit.com>
Subject: [PATCH] libgcrypt: Add ptest
Date: Wed, 4 May 2022 14:25:15 +0200
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: 
 <15666fb8-2cff-4525-adde-3e5714cdb7c2@denue6es010.ebgroup.elektrobit.com>
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 39cdc2e5-5ac9-4b75-22f5-08da2dc9355c
X-MS-TrafficTypeDiagnostic: 
	BYAPR08MB4245:EE_|DM6NAM12FT012:EE_|SN6PR08MB4784:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR08MB4784981A7AF3B50376D90D62E2C39@SN6PR08MB4784.namprd08.prod.outlook.com>
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 I+/uML/XeUlZ6F5N7E6tohZlK4tLybRC0nPa/J5HzvitQKjzv85MQ2FoO4XWI4PLhTCYNGD1TpcJZCbO9Qc2+F9eX3mcSewZB56umwFm/fb74QoLisWhZ0DgCXADj8lDoGuZxEh1gTvg+mfoaxlHhOMDkzLYjmjjRxWs/y1/8yKJw4Rz8ToKchht8qra3RWcfCUzJ4OG+lZEBxEPrWp3L3ya8VSUGBU6IAMEX1gM/FI6Ra6ofOxzXyNjuAV7AQI40+KISC+2q0r4N/MwnAHzjSh17zXiO3tYk2GAbgLvm04PmgGlItzpiHCOxCUzPgT+cBMG4/hg5fJiMS6KFz9DxMgxjISMBXa0ee+6H5OpvMMeSZwNZCXdxfqLHu7IigzCgIHksPQ8YqvOiN0f5YiKc1mJu3iVtFm3Vac2VGaZGcl4L7MKfIzp1cQPKa+hEtWsG0+okRJJ13j0/b7ftWGHw8dwh6BsPpgDIzyjDZ6sc+8yrSAFEIucmPgAKsSJZdbPyf3mooLBbfoqDdlknM7OM1+iamxqSzFsyGoDmOyCypIexFZwtuEYbZcYf3SJPW0nQ7DLNdH0evjsTwBLdsqEvVyScAtTZsA1WXP9qAkbPNF1jKk0GlWAaXlaSvh/e8816H3Somnpwy3xk6Uwag7/EQgrOqUkVgt5YlJ8ZOwcuS9DiNf1hRi53rBOD2C/Irr+ilTolQLdBpbs3zBPCzZbQvDJ28YCrOmxCUFS5BJKsX2cYR+h9vgN0208N0I8Bv1cdbV286Jg9mu8AoBw74MIyg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es010.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(86362001)(107886003)(6916009)(356005)(31696002)(316002)(8676002)(4326008)(508600001)(6666004)(36860700001)(26005)(81166007)(426003)(336012)(186003)(70206006)(47076005)(40460700003)(31686004)(44832011)(83380400001)(8936002)(5660300002)(70586007)(2906002)(82310400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4245
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DM6NAM12FT012.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	daeade58-2b7d-483b-9a0b-08da2dc932ef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tTUFg3YgDCf4iAYdgf9F/HZbDhG6L5X0fx8bV+fFXMKoo7y6cgF+5SI0Q7oJVEb1IFoorWEQ0wWUnfS3EVDqyjPYlssik+JeORO9LmUTOuTlhXi034CX15m6TQMoXKG+quftgINWdak4nIcCv5/knkq3VX+/uMuXioHP5Vg5UgJHTqGNwEAYbBFOPJVom7ggDgkwe4NXvQRgqnnbgBShSt57wwtgu1f+SRg2zfdYA3lLFCrxPPtHfODZDr9wVbI2MGSZ0km3X3TjcoKuAgqBEQgnGdYdiHZd/nxMRE7LFWwKBdA+YWYAzlWPYcn+mVXfX8FdUpCLZoHx6rrr43Z0i7f7RgZ78CRgzTdYGUH+1KV6ONnAuenz3uH3/NCsWb/XE9tlUQfkOxWI7WPU16zwwNaIxmd4CQrUalqNoeBVfTXQ9qk5OSQQLK4sHqaJ5K98N47tfr5nXTWsn3SO7JDVIEjFdSMK7KEpXRWtantDGeN8DGISKvIWTElix5KEZy5YgQxO8FDVJD4/pnfef6uX613Z/Cj4xdzoR+FAAiR23uSGk8rkHbY1zubuX/DBS0vCK3+7o7GWW9iRaAFWyaQ9kvErpW1OqLzUjXUjskf98NxkG7nZkCF5qpb9YrKN3CfNk003mTHvo+F37w+ON2pVMShNKa6ifApyTO4BWgZyehcyDPO+BPv3/1/oJB3x70XolJsgWO22/izVrZZj0QgyQV6A0UomTAofcvSSti5unHVb6l5sttVUzxGeHTZPDG1wY9iaozeBk3/ZBw/LazIkDw60h/5Jhzhxy59omcAqGT8=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8936002)(4326008)(82310400005)(26005)(6666004)(70206006)(70586007)(2906002)(40460700003)(8676002)(44832011)(31686004)(81166007)(5660300002)(107886003)(336012)(47076005)(426003)(6916009)(86362001)(316002)(83380400001)(508600001)(186003)(36860700001)(31696002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 12:25:43.0128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39cdc2e5-5ac9-4b75-22f5-08da2dc9355c
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM12FT012.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4784
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 12:25:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165217

Add a ptest for libgcript to core-image-ptest-all. All tests passed on a trial
run.

Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
---
 meta/conf/distro/include/ptest-packagelists.inc   |  1 +
 meta/recipes-support/libgcrypt/files/run-ptest    |  3 +++
 .../recipes-support/libgcrypt/libgcrypt_1.10.1.bb | 15 ++++++++++++++-
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 54a290871e..a1ead90649 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -87,6 +87,7 @@ PTESTS_SLOW = "\
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
+    libgcrypt-ptest \
     lttng-tools-ptest \
     openssh-ptest \
     openssl-ptest \
diff --git a/meta/recipes-support/libgcrypt/files/run-ptest b/meta/recipes-support/libgcrypt/files/run-ptest
new file mode 100644
index 0000000000..4818a061b4
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -C build/tests runtest-TESTS
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
index 251e0d0348..aa83de226d 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     "
 
 DEPENDS = "libgpg-error"
+RDEPENDS:${PN}-ptest = "bash"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
@@ -25,6 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] = "ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bffcef2f01baffe9de"
 
@@ -33,11 +35,13 @@ CVE_CHECK_IGNORE += "CVE-2018-12433 CVE-2018-12438"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-inherit autotools texinfo binconfig-disabled pkgconfig
+inherit autotools texinfo binconfig-disabled pkgconfig ptest
 
 EXTRA_OECONF = "--disable-asm"
 EXTRA_OEMAKE:class-target = "LIBTOOLFLAGS='--tag=CC'"
 
+PRIVATE_LIBS:${PN}-ptest:append = " libgcrypt.so.20"
+
 PACKAGECONFIG ??= "capabilities"
 PACKAGECONFIG[capabilities] = "--with-capabilities,--without-capabilities,libcap"
 
@@ -52,6 +56,15 @@ do_install:append() {
 	install -m 0644 ${B}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
 }
 
+do_install_ptest() {
+    cp -r --preserve=mode,links -v ${S} ${D}${PTEST_PATH}
+    cp -r --preserve=mode,links -v ${B} ${D}${PTEST_PATH}
+    rm ${D}${PTEST_PATH}/build/cipher/gost-s-box
+    rm ${D}${PTEST_PATH}/build/doc/yat2m
+    find ${D}/${PTEST_PATH}/build -name "*.cmake" -or -name "Makefile" \
+    | xargs sed -e "s|${WORKDIR}|${PTEST_PATH}|g" -e "s|${WORKDIR}/recipe-sysroot-native||g" -i
+}
+
 PACKAGES =+ "dumpsexp-dev"
 
 FILES:${PN}-dev += "${bindir}/hmac256"
-- 
2.17.1


