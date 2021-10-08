Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E2AC433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 08:35:35 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.6505.1633682134375790988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 01:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1988ZWfM013502
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 8 Oct 2021 01:35:32 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Oct 2021 01:35:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 8 Oct 2021 01:35:31 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 8 Oct 2021 01:35:30 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lttng-ust: fix do_compile failure for arm32 with DEBUG_BUILD
 enabled
Date: Fri, 8 Oct 2021 16:33:56 +0800
Message-ID: <20211008083356.43379-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 08:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156771

From: Changqing Li <changqing.li@windriver.com>

After upgrade to 2.13.0, for arm32, with DEBUG_BUILD enabled, lttng-ust
build failed with error:
| /path/to/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-ust/2_2.13.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.2.0/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `_uatomic_link_error'
| collect2: error: ld returned 1 exit status
| Makefile:399: recipe for target 'test_ust_error' failed
| make[3]: *** [test_ust_error] Error 1

The problem has reported to upstream, and upstream suggests to use
-DUATOMIC_NO_LINK_ERROR for the failure case, refer [1].

[1]https://lists.lttng.org/pipermail/lttng-dev/2021-September/030056.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
index 4ec92c0683..7c6a0743e1 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
@@ -16,6 +16,7 @@ inherit autotools lib_package manpages python3native pkgconfig
 include lttng-platforms.inc
 
 EXTRA_OECONF = "--disable-numa"
+CPPFLAGS:append:arm = "${@oe.utils.vartrue('DEBUG_BUILD', '-DUATOMIC_NO_LINK_ERROR', '', d)}"
 
 DEPENDS = "liburcu util-linux"
 RDEPENDS:${PN}-bin = "python3-core"
-- 
2.17.1


