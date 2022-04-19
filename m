Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B62C352AA
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.41])
 by mx.groups.io with SMTP id smtpd.web12.3851.1650373192941391643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 05:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=LDrHlE5B;
 spf=pass (domain: elektrobit.com, ip: 40.107.93.41,
 mailfrom: simone.weiss@elektrobit.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FddgqOrrdvK3bmBBIXETCsNAI6OaUFYWDIy8ihLER9c=;
 b=LDrHlE5BT29gD9Cz7/h9HnnUzoU4JkTG4IT03rXWL76djATRv459yI9zMr1GzZsbUYCO7Q/To75r8CK9+8fqxS60JycOxAkJKi0NeAxtfveyA+4ICnCaFluzOekKIj1SSiHDLdi/K56GZjZS2n+CaCE9gEWNlSMSpjPNt1LnXrE=
Received: from DS7PR03CA0337.namprd03.prod.outlook.com (2603:10b6:8:55::25) by
 BN7PR08MB4369.namprd08.prod.outlook.com (2603:10b6:408::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Tue, 19 Apr 2022 12:59:51 +0000
Received: from DM6NAM12FT037.eop-nam12.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::c9) by DS7PR03CA0337.outlook.office365.com
 (2603:10b6:8:55::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Tue, 19 Apr 2022 12:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=none action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 DM6NAM12FT037.mail.protection.outlook.com (10.13.179.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.7 via Frontend Transport; Tue, 19 Apr 2022 12:59:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 05:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kd+uDHP7RnAbyie6fVohYVSKt1BvPD+1pg04kyHZmImldeA0gfbO5N43tCQVGxLB2099eL7K5v2Kq5m1Cq8Q1TRT9MRJCKwbswkd6jocvTC+5t0SL1mqLeFd8wTLBqMbzze0w8PG2GUUjtdY5zzYlDe4kZsSfAqwOFpniTApxp5C4HCLoufACsj5C+pmuNRsbeJJDZpfc8eblmkNZbnaGGYeT23DpqCRnNeVwUKaX7x/4q/CdCvooKyjniAYsMjrg6tWgOfMwS/nIuykd5wkd3Z5enZbxOc62XU8aUVsYCUGtemXO/WSljQFI9sf8pKOxK4ggjMmuAJhjnUbFB/HHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FddgqOrrdvK3bmBBIXETCsNAI6OaUFYWDIy8ihLER9c=;
 b=CjXeWz/LVUB/RUJD2WjWdFargk+7XSUL74O3J7rYM4EVCVJbcsZZNXUngMpDyU5Swa+mOhZib7S73gFarMR7SrYN0HR6itJOZw6RdRAy47WpbxLFtkccX9+jIVq1PzQAuk60ML/7yyYgfqiZbNMVyu4DUAR7jXUhPJJb+iCYUSkHzq58PvYQ0UbtBOw4FLie/5wJ4mAhDbCKrEeMZXGMeRZdUO+OkQOZpz+S2rf2hjy40kCPo3lENj+EbQDhEuvZm/XY8toxazPqF1mUK8R2xKi9TjbZSkQ/Frqpyqc3BxfUV/E+dR7i1t0gORCjrWYPyeCcnHOXHgp0lDwvzQXuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 213.95.148.172) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=none action=none
 header.from=elektrobit.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FddgqOrrdvK3bmBBIXETCsNAI6OaUFYWDIy8ihLER9c=;
 b=LDrHlE5BT29gD9Cz7/h9HnnUzoU4JkTG4IT03rXWL76djATRv459yI9zMr1GzZsbUYCO7Q/To75r8CK9+8fqxS60JycOxAkJKi0NeAxtfveyA+4ICnCaFluzOekKIj1SSiHDLdi/K56GZjZS2n+CaCE9gEWNlSMSpjPNt1LnXrE=
Received: from BN1PR12CA0008.namprd12.prod.outlook.com (2603:10b6:408:e1::13)
 by SN4PR0801MB7839.namprd08.prod.outlook.com (2603:10b6:806:21e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 12:59:46 +0000
Received: from BN8NAM12FT010.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::74) by BN1PR12CA0008.outlook.office365.com
 (2603:10b6:408:e1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Tue, 19 Apr 2022 12:59:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 213.95.148.172) smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 213.95.148.172 as permitted sender)
Received: from denue6es011.ebgroup.elektrobit.com (213.95.148.172) by
 BN8NAM12FT010.mail.protection.outlook.com (10.13.182.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.7 via Frontend Transport; Tue, 19 Apr 2022 12:59:46 +0000
Received: from denue6es011.ebgroup.elektrobit.com (10.243.160.101) by
 denue6es011.ebgroup.elektrobit.com (10.243.160.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 19 Apr 2022 14:59:44 +0200
Received: from del01461.ebgroup.elektrobit.com (10.243.54.72) by
 denue6es011.ebgroup.elektrobit.com (10.243.160.101) with Microsoft SMTP
 Server id 15.1.2308.20 via Frontend Transport; Tue, 19 Apr 2022 14:59:43
 +0200
From: Simone Weiss <simone.weiss@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
CC: Simone Weiss <simone.weiss@elektrobit.com>
Subject: [PATCH v3] libgpg-error: Add ptest
Date: Tue, 19 Apr 2022 14:59:41 +0200
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: 
 <0ee23a29-d7f3-4874-9b7d-ca68f144d14b@denue6es011.ebgroup.elektrobit.com>
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 4b6f2420-0b3c-4a67-8349-08da22047d50
X-MS-TrafficTypeDiagnostic: 
	SN4PR0801MB7839:EE_|DM6NAM12FT037:EE_|BN7PR08MB4369:EE_
X-Microsoft-Antispam-PRVS: 
	<BN7PR08MB43698F96C4710025752C1D5FE2F29@BN7PR08MB4369.namprd08.prod.outlook.com>
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bSu9vOYJBDaSkwNzxuYrzENgrP/3hYdCP4NkWSj7vbM5ljkPQb/GV/bECxCiNeKyFZlBUDzLKnd5ZD/0Rgi1V6CUMp5q5nuaXzcIWWj4Bud4ktNQQSgzUxkiir2YWm8LGBFO3gi5yfAHTEynBqGdApFncfUGFQsXIwvUSLxmM/q43EhatWy4hkxb4dMisgm9BoinCkx0ant3yB/dsPbbUgQaxpSsMFTHZDDeCQbBOAR7nyP3ebLunoOAJ4HQtbtlh0YN/J3jftrI+ul23sDUS8xi7Vr92lxFzxv4JB490P+8+TsRjAQ++/J+E7vfHhwb6SR+gm9tBh1XSl6IktOUVNtyqu8YFai7x+4bGfOxt6srRDxVCnz+7jmxdC59q3BMDLZWGXYNR+dfFDstHSj+n8nWTScbl8QA1TnavICgP2rj/XtQ2kvUFQo+mQqN6CiTv4UQw1nb1Z3Fu0b0n2T30njKSgAUWpFZSj9lcrof27SAqFCeqtbkzJvl23RCkHAatIBLnRtVNhY/wqvUztG+J8CoNXOohJT/SNeIQiXr5/MB1TLYiDEdY0VV5x9tZYkotHQsmlXFqv5y9cOlYp/XUbgwtr7sBOzULjONUPPjKYVxiPxRJeY0O0Bmq6UZiNhkuAS7raTLsQqHnnk12nCTnnFTe3T4VRQG3bwwRE7y1rbzqHW3Y5kQTSyD5v0pDHPUwemJope/bnfhgRwqk/yFUcCFxXmbwOemfMh8QZwaXBGwYfAPNyH+XKfCMyx7V1sRYlaLkcIciT7aZgHWgV7AMQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es011.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(316002)(26005)(6916009)(47076005)(426003)(336012)(186003)(107886003)(40460700003)(82310400005)(31696002)(86362001)(5660300002)(8676002)(4326008)(8936002)(508600001)(70206006)(81166007)(31686004)(2906002)(356005)(44832011)(36860700001)(70586007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0801MB7839
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DM6NAM12FT037.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ef3a4b75-eed1-4702-6714-08da22047ae1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wW4choNVC8N/gzJZjpm4W3fRO8orVDSTnU7kKl6Z0k2xmOmcoZiDw8SIP9khWA65aalku0d3015lyuD9rdQcso8flBJVT0odUL59EE2N1neG0CT0nvQzCBvwo6KxP+rIacLc6rA+PP00aEXw04CwRVx3HbUXgKne75ylW+Bi8MV3U6rzaM+BTfvRwSlNQaoVbx7KcO2ywzqouT7vgd3tbCWxQ9mrbx/9Ttkx1XnDE16RKY65tYDe4nhjThf0WeJVdGK+MknrVThGqG6uzMdMRcyg9bU2LNj+2+mKmt+fjMebPf8xFAbj4ElIfgC+vSppatXm8jsbTcaSU3/nY5aZgQKKtVvgWT6tqknh6Jp9NIP1d5ZczLotPtVz99Ou74vi1AI4dAD1RWEpiUpMH+F80trYrDx8QwTTrkyf2EHT/m2Alpw1fuh6pEYY5RIly8Q7jiOmTwMWWtCPI/TNzDS745CY/GI+eYF/UFvsTOm0FGAUah4X8yOWA4hs4c8mvf1k1QabhcVN6rLkAVd85xcJStClNUxm7REJtI+0jTR5jqevTnelSGJjPoGhLMuYZX6oaw/8Fs3zkdTjPIWianxZcLb1RgUpSk94QDHD+m3TyY8Aplfk+sm6TLNSLoeudc6mSWIqaiD4nDvfQErNu38vnCuLbYAb6Z/ZUE0H0wdM/HjlAzuQfRadNIy8tCsKiKeBKltJU4kbrQ0bnsedkiVQYo60lxze2PIKHqzWaPSHPyfjFcSYA9Y7YB6Q5p8he8KdL36v1F0CdhLWov+D1B9jhl0oNqZka2wm0VtCQcqh18s=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(316002)(8676002)(508600001)(31686004)(86362001)(31696002)(81166007)(82310400005)(107886003)(4326008)(36860700001)(70206006)(6916009)(70586007)(47076005)(26005)(40460700003)(83380400001)(8936002)(5660300002)(44832011)(186003)(336012)(426003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 12:59:50.0707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b6f2420-0b3c-4a67-8349-08da22047d50
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM12FT037.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4369
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164628

Add a ptest for libgpg-error to core-image-ptest-all. Avoid refreshing the
Makefile in qemu as this would fail and is not needed. All tests passed on
a trial run.

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
index 0000000000..2d23159eb0
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -o Makefile runtest-TESTS
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
index 41adad0ede..f5b482f4c9 100644
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
+RDEPENDS:${PN}-ptest:append = " make"
 
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


