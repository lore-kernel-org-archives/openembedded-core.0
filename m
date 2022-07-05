Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6DFC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 07:03:36 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.81414.1657004602731249250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 00:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 26573LIn026458
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Jul 2022 00:03:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 26573K4K028441
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Jul 2022 00:03:21 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 5 Jul 2022 00:03:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Jul 2022 00:03:20 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 5 Jul 2022 00:03:19 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] strace: set COMPATIBLE_HOST for riscv32
Date: Tue, 5 Jul 2022 15:03:18 +0800
Message-ID: <20220705070318.737747-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 07:03:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167640

From: Mingli Yu <mingli.yu@windriver.com>

Disable the build on riscv32 as it's not supported on riscv32 [1].

[1] https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096db215da

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/strace/strace_5.18.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_5.18.bb b/meta/recipes-devtools/strace/strace_5.18.bb
index 08f0f1d27e..75ff58bd50 100644
--- a/meta/recipes-devtools/strace/strace_5.18.bb
+++ b/meta/recipes-devtools/strace/strace_5.18.bb
@@ -18,6 +18,9 @@ SRC_URI[sha256sum] = "60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db
 
 inherit autotools ptest
 
+# Not yet ported to rv32
+COMPATIBLE_HOST:riscv32 = "null"
+
 PACKAGECONFIG:class-target ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 "
-- 
2.25.1


