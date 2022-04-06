Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D2CC4708C
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.44])
 by mx.groups.io with SMTP id smtpd.web12.8859.1649253221557828098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 06:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=l5pUw8rJ;
 spf=pass (domain: elektrobit.com, ip: 40.107.223.44,
 mailfrom: simone.weiss@elektrobit.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reN6Gq21aY9YxGmbQVvggdfV/xlQTI0CJiSP20XoESU=;
 b=l5pUw8rJDqRG10YjFOkld/2hiWjYd5DnacHirz278oVvNSVR7+euQoJB+6G31zHewKJPG2GzhKzPx6kUhRndHMVQyWGsljHqq3Lx1vj+KPsh5jni7IevzmHPYyza+f6dG/OY1RTlbcj7UYD/DnnobmONkSVimTfgZu6kx7GNRBQ=
Received: from MW4PR03CA0102.namprd03.prod.outlook.com (2603:10b6:303:b7::17)
 by BY5PR08MB6295.namprd08.prod.outlook.com (2603:10b6:a03:1e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 13:53:39 +0000
Received: from MW2NAM12FT024.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::da) by MW4PR03CA0102.outlook.office365.com
 (2603:10b6:303:b7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 13:53:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=none action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 MW2NAM12FT024.mail.protection.outlook.com (10.13.180.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.14 via Frontend Transport; Wed, 6 Apr 2022 13:53:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 06:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iml3WveBfKiVnlWBEKQ8iklO0Rnt8Fmxnix0ssccQjW0QZHz+khOSXhb+9IxoTlZiO6VG0eGfVHuG+yKbl9fKMUXQqgcZjRcFCcnZCvc4CN5dddYa9kZJwvTT3pieScT9vtB4Vfl1HtJsaFzXE5tXOHKRuFyFTUJJj7+cHLTTy4dof//Qee8WQ6GSlYWqPHmuBs7JarJmJqYWaJL/9JAiRuBX5vxPdndgLbKha6VPPNOrlLzc0pUnOU/0qfThsbb0k4vAoSb2+7HJDID3axgTqf73bBAZneAK7E2QwmCBzc/gMdg1haH5cIh+53R7rZWoyL5KVbJj8EOp5dXTzZVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reN6Gq21aY9YxGmbQVvggdfV/xlQTI0CJiSP20XoESU=;
 b=anVyXtgsU7vKf8itlKcCTkJLusgog0hv+R0fCig6YN6Z2kDWBs6cYVfKe7BIni/5M1765X7b0B2SlNcUVqTurGOsxDoztiE+h/aVohuoqIVu+GFllFF7cYr/Bu+pkduH7iL1b7yJJTqLp/m58jBfgX1g7zw73VjTegKBsQfLax+Pfauxbf632bJi6ZgUDwnBUoH3jcL/XKkXZ+EevCcanNAt1YmWvTeuoIOBERZeFwrAL0/cCC5werguuMGgcNOUQhAhoUTOyBo2Vgewmn3J9WLsRY+PMxBRBL1uLrWnC65ahNwx+moS2CsXAo5xi4uKZ84TO7KiZ840WQ5/VCW9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 213.95.148.172) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=none action=none
 header.from=elektrobit.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reN6Gq21aY9YxGmbQVvggdfV/xlQTI0CJiSP20XoESU=;
 b=l5pUw8rJDqRG10YjFOkld/2hiWjYd5DnacHirz278oVvNSVR7+euQoJB+6G31zHewKJPG2GzhKzPx6kUhRndHMVQyWGsljHqq3Lx1vj+KPsh5jni7IevzmHPYyza+f6dG/OY1RTlbcj7UYD/DnnobmONkSVimTfgZu6kx7GNRBQ=
Received: from BN9PR03CA0365.namprd03.prod.outlook.com (2603:10b6:408:f7::10)
 by MN2PR08MB6221.namprd08.prod.outlook.com (2603:10b6:208:1a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 13:53:36 +0000
Received: from BN8NAM12FT021.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::a5) by BN9PR03CA0365.outlook.office365.com
 (2603:10b6:408:f7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 13:53:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 213.95.148.172) smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 213.95.148.172 as permitted sender)
Received: from denue6es010.ebgroup.elektrobit.com (213.95.148.172) by
 BN8NAM12FT021.mail.protection.outlook.com (10.13.183.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.14 via Frontend Transport; Wed, 6 Apr 2022 13:53:36 +0000
Received: from denue6es010.ebgroup.elektrobit.com (10.243.160.100) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 6 Apr 2022 15:53:30 +0200
Received: from del01461.ebgroup.elektrobit.com (10.243.54.48) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server id 15.1.2308.20 via Frontend Transport; Wed, 6 Apr 2022 15:53:30 +0200
From: Simone Weiss <simone.weiss@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
CC: Simone Weiss <simone.weiss@elektrobit.com>
Subject: [PATCH] libgpg-error: Add ptest
Date: Wed, 6 Apr 2022 15:53:24 +0200
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: 
 <3af35af0-4f47-4795-8392-c746c37a3a90@denue6es010.ebgroup.elektrobit.com>
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 0a9c6bc2-59c5-47cb-ab59-08da17d4da43
X-MS-TrafficTypeDiagnostic: 
	MN2PR08MB6221:EE_|MW2NAM12FT024:EE_|BY5PR08MB6295:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR08MB6295DB53C95EBFD0EDE79548E2E79@BY5PR08MB6295.namprd08.prod.outlook.com>
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 A4UqfOVUkkIgxdKwnvIfou5IKVnrY0J+Mtmu5udvS/V6Rc0ik7N05UuZ+qOLj1vCnP0gzkTvqEpMj0TWqhep0aSaVekDRo4GjtM7JBbUoycLu3SiVKTUVhhRp6wIPsleHSaD92HdrUqUSNdcrD3KmVqyxWt+9cEeGRofsPjvkovOe7IabTW+mXJAJblqdr28nGzNQpEC6qI4gMoCRVYFPPuqLQINZ2BowfWNz7qf3Jxc+8qJoNgv0bAaH5UjP8w6NIKPF0YhJDZGEfGTpzvv4+mq22MRvPX7x6ICaK5RwLx2Hw48Vqyq+OScSGVldCjxXwsaxFjW7hTmNAtPOXrOY1wyzp4u1gCMSZGbbAAp3uoUvcuuqNBHsX6F9AN8kEUOabwWxG6J4ZQAI3aA43E5AH1lIJxsi6WKqQyZrDgeJxz1D86rjz3jYor10JPWVrTjj9jpQCrTTXKDKv3sKVRZa3sJU8FF9e+9iwDRrOyH+73bLGX4fJJTnLyRj+DhPkx8qMafe0iLgmZS9eYSuQ5nqofz9EFQKjsXNY7JwukJmQZWwHoH6HDPecoNH4yd+w+XFC3TqMd46RI/rtU3aCA1tQ6Iq9PLf4Xe3K+1PsGNxTKFjALHnYqrKWqYrroccbofIJck9ToVaVowo/lt5omGc3PRnfAjAjRh7rOi6JdLqV0I2dlVBNANyrN6FszPFQIO5yaENH3/e0y3le291+R6J8cUnJ6luKa2/GhflM3bmC3KqeORbiTNgvn7ftK7zCSdB7KxzHayyW1gL5YBO0T+tQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es010.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(186003)(6666004)(83380400001)(26005)(426003)(47076005)(107886003)(2906002)(5660300002)(336012)(44832011)(8936002)(82310400005)(40460700003)(31686004)(70586007)(6916009)(316002)(4326008)(8676002)(31696002)(70206006)(81166007)(356005)(86362001)(36860700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6221
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MW2NAM12FT024.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9c1412a8-4c10-4337-0919-08da17d4d8f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+qgjbnfia8R++YZMBQYT3ZG+P2S2LNwO8HzfxV2WW3FUecVZ5+VwsLDhQ1pVArssmcyl/R6tcC9GVyaOR0Qm4Ec3H9SYFqbcu2YLTbHy4YEOT6KB7vvGyEHO5kBXNJnCx48YEurXHsgHZ4cqY1XAYPSQi52YRxGjntbLlOsVV6NAsF9csee1xxvJWsUkFD4ma6AizFLryBUefEqCCcVsxWK8v39lcW6JmKnUOy896CVZUFzwXBQuFlU+zdgEOSFCcX6bRLIFFpCE3aaRPZwHyqesgdfQBtgCvAfkwZyK4YunsZ1WRiG9WSJAfmIJPSOKpgpdRWJTIWDxdOvBMBBEwj3u0o7CQCfTdKhKJaHmZnGtzq+ccDZy4QzxJGq++Tyt2o+TylMlAd3djVcez9V6V5rzb3SjMB5HD/8VwtueLcCikLcHn/iwn6SW1mEx9lMR9POnwh4E7D9//kCbFi2syNu4/qht1hlnAIjDL1XZQO4DUseCvP5g/X/YqaFd2IhWadzcTY49qUCeXMs2NMXJHQ/TQcsBV/6A7NTeSjckfs1+iYUk9CMEpRJXHglibvudDAitwzWKWBnfhk5lOwoqk+PVQhzl421FXNRsCLdvCrCz9nyuiykOQQuoUjshXDz2qPN6AktaRAaqQroRRJopu6le6FuOdXdF5FVZyYZFI5EcOPZOjJVrYR9sYFg2dAoka5r0wq44o8NQM83+LBPxqtu9euGbL/GGvSK7LAyxOsc/6H27WfnVr7STxEbMlCZb/3OQgxUFzmeKcu+Ls65gfxeGEg2WaEzk2xm8Q6NonEk=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(26005)(186003)(336012)(83380400001)(316002)(426003)(47076005)(70206006)(6916009)(4326008)(31686004)(8676002)(70586007)(86362001)(8936002)(508600001)(31696002)(82310400005)(5660300002)(107886003)(81166007)(36860700001)(44832011)(6666004)(2906002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 13:53:38.8251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0a9c6bc2-59c5-47cb-ab59-08da17d4da43
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM12FT024.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164082

Add a ptest for libgpg-error to core-image-ptest-all. All tests passed on a
trial run.

Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
---
 meta/conf/distro/include/ptest-packagelists.inc    |  1 +
 .../libgpg-error/libgpg-error/run-ptest            |  3 +++
 .../libgpg-error/libgpg-error_1.44.bb              | 14 +++++++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index b51cce4d9e..54a290871e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -25,6 +25,7 @@ PTESTS_FAST = "\
     json-glib-ptest \
     libconvert-asn1-perl-ptest \
     liberror-perl-ptest \
+    libgpg-error-ptest\
     libnl-ptest \
     libmodule-build-perl-ptest \
     libpcre-ptest \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/run-ptest b/meta/recipes-support/libgpg-error/libgpg-error/run-ptest
new file mode 100644
index 0000000000..5eb4e8c6f3
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -k runtest-TESTS
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
index 41adad0ede..174350f6f5 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
@@ -17,13 +17,16 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
+           file://run-ptest \
            "
 
 SRC_URI[sha256sum] = "8e3d2da7a8b9a104dd8e9212ebe8e0daf86aa838cc1314ba6bc4de8f2d8a1ff9"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script
+inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
+
+RDEPENDS_${PN}-ptest:append = " make"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/gpgrt-config"
 
@@ -35,6 +38,15 @@ do_install:append() {
 	oe_multilib_header gpg-error.h gpgrt.h
 }
 
+do_compile_ptest() {
+    oe_runmake -C tests buildtest-TESTS
+}
+
+do_install_ptest() {
+    install ${B}/tests/t-*[!\.o] ${D}${PTEST_PATH}
+    install ${B}/tests/Makefile ${D}${PTEST_PATH}
+}
+
 FILES:${PN}-dev += "${bindir}/gpg-error"
 FILES:${PN}-doc += "${datadir}/libgpg-error/errorref.txt"
 
-- 
2.17.1


