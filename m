Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A342C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:24 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.44009.1679494920781267003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Rrsks8fz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id bc12so18819861plb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdH16gwGvbnLjvH1OHpVO1q4WBqxhts4U4FoVZakjYw=;
        b=Rrsks8fzbrjBqbv4bHUTPLxvels1q5uEW0JMGU+GGLSd8eGsuY0Ox3LfpNqrXxP4RW
         ZUHzVkowhzsIL2AoY0H/ZR+N7gqiYIhDg6k9DTLVJf8UiryTiwSdxxo/YXwiTOzRWY2D
         FnH2XSa2TUzKRlQLVtNWedgsoNJS1LzTpGuI/fq0969ykH6Y7jhbe++mEVjah8QQiv93
         VJI435NdAgfVjOTT4783SpD7ExkgI6anmy033smSTdc3hxjQCVaFA/JrsCQGMiSy4+NH
         yw4SWBqgLIJ9ZjEtctjjp/AOePBoXgtmb4L5SG7MFZr415Bm5tu6S89L8oii6V3zOga7
         rjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdH16gwGvbnLjvH1OHpVO1q4WBqxhts4U4FoVZakjYw=;
        b=sFggYFQGPjX9oTG946H6mhBX9MPJAvpMuQADBt8A1q6YhMCLRDv1bpHcPdJJDFYUh7
         hxXU5nj4d3SellOWjGzoS2AlEqbo7wN63MD9gx6saiYLs3sA8Vb9OWardGWqJ5jA7kfy
         RPDEN+4pCXUJAxskDrk77giqyh7REV0bQV6ShHF6WT2Wr1Bjdie75uVT+fsRAaGNIJ70
         AkQ76bwX96BrDKATI/9ZpGuR5H8K+OuPqfBvGq9XvmCQD7PHyfm1728eopy8CLBqbKB9
         vvYCIuwWc7YirLulQ0e2x0A2t4lF7WXAaL53jbNDo5ao3r0S7tm+fZyCE8Oj1BXZ4DSV
         xJrA==
X-Gm-Message-State: AO0yUKUXSKxlfQ31xeVuWnc8DnXhyjSM4JtERMhzG1SgofGbKyijxWyK
	h+g5AepLTM6qQXKYbEEMuytUOwj7gKOcN3idF6I=
X-Google-Smtp-Source: AK7set80qBUuXmiqARQNpKJpK6sOdJcnviVUxM+arUTw6MRun7lOsCRJUNmRGhx8fOb1of4qxnuHdQ==
X-Received: by 2002:a05:6a20:bb09:b0:d9:4c19:fe69 with SMTP id fc9-20020a056a20bb0900b000d94c19fe69mr2846570pzb.25.1679494936380;
        Wed, 22 Mar 2023 07:22:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/21] mdadm: Fix testcase 06wrmostly
Date: Wed, 22 Mar 2023 04:21:35 -1000
Message-Id: <04e4465fa36d2c0a4cbbaf89b5dd2b816b20a61a.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178941

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix the failure of the 06wrmostly test.

[1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=41edf6f45895193f4a523cb0a08d639c9ff9ccc9

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 9c73484cb12f39662a8f10027a55c63b95373066)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-Fix-optional-write-behind-parameter.patch | 45 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
new file mode 100644
index 0000000000..186d1e76f2
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
@@ -0,0 +1,45 @@
+From 41edf6f45895193f4a523cb0a08d639c9ff9ccc9 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:12 -0600
+Subject: [PATCH] mdadm: Fix optional --write-behind parameter
+
+The commit noted below changed the behaviour of --write-behind to
+require an argument. This broke the 06wrmostly test with the error:
+
+  mdadm: Invalid value for maximum outstanding write-behind writes: (null).
+         Must be between 0 and 16383.
+
+To fix this, check if optarg is NULL before parising it, as the origial
+code did.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=41edf6f45895193f4a523cb0a08d639c9ff9ccc9]
+
+Fixes: 60815698c0ac ("Refactor parse_num and use it to parse optarg.")
+Cc: Mateusz Grzonka <mateusz.grzonka@intel.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ mdadm.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/mdadm.c b/mdadm.c
+index d0c5e6de..56722ed9 100644
+--- a/mdadm.c
++++ b/mdadm.c
+@@ -1201,8 +1201,9 @@ int main(int argc, char *argv[])
+ 		case O(BUILD, WriteBehind):
+ 		case O(CREATE, WriteBehind):
+ 			s.write_behind = DEFAULT_MAX_WRITE_BEHIND;
+-			if (parse_num(&s.write_behind, optarg) != 0 ||
+-			s.write_behind < 0 || s.write_behind > 16383) {
++			if (optarg &&
++			    (parse_num(&s.write_behind, optarg) != 0 ||
++			     s.write_behind < 0 || s.write_behind > 16383)) {
+ 				pr_err("Invalid value for maximum outstanding write-behind writes: %s.\n\tMust be between 0 and 16383.\n",
+ 						optarg);
+ 				exit(2);
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 19035caaec..be08d512d7 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-mdadm-skip-test-11spare-migration.patch \
            file://0001-Fix-parsing-of-r-in-monitor-manager-mode.patch \
            file://0001-Makefile-install-mdcheck.patch \
+           file://0001-mdadm-Fix-optional-write-behind-parameter.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.34.1


