Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EB5C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 14:47:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.72559.1656946018945298449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gx4oL7ES;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id f2so8449466wrr.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FB+lxeDkQMMf3ltvmmPYpZT1PmNB3xNBOlUvDeB2bBU=;
        b=gx4oL7ESTbcuTUkfi2GRg2AmLerhdgIbUBeqxzxPnTHmFukB5PHI377vTomuEu1ICG
         g5AZugc4aNU3CTgRpTWDNGz893WYL832Id/rXPx7cbWeVca/sWLcWQsPYgLUB9plCglX
         zhQhsbnuYqcm8/xBCCyGFGkSJzP87Rhf46rKjolN8UHIxQvCjZxmUivEe3GhYYsvsD/q
         02bVa6qRz284V4qOX0ZB3gIPq2vk1LAbqZQOygzxHJxvA+a/gMn1sOuszJ1ywBlMz0K2
         nIieyZkYyhGvC2PKGz0Wx3jRkp94YZxFvhqAEf+BAyeuHvAvu+1/S39+yO/rRnIg2h93
         s5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FB+lxeDkQMMf3ltvmmPYpZT1PmNB3xNBOlUvDeB2bBU=;
        b=nM+De34xqvpWz67PFMpWIkP4zjjlzTr9ycqCisZU6Iy8+fujZrsx7KVofKjNLEgr24
         w9TA9EWx2Qqe+YheEvQ5iv1eHW97RO4DFl2EPppQMCIN2Br0enPWBRqYjL+W+RgARkEj
         pD0lGCDJ7jNKyf6vUur0DIhetHubeO+P5mB/c09R5SBZOHVMEAD7VRtROWS2P464i2F9
         TvkXcAakWYIhcPClMNlmryhUafFqlyO/oNVbR9pPPNEgjY5zZAELlFOZ8O5xBzNidsTM
         tvsmdkB36aYseqz83RvYDTAWZIXCRgJJmzKFXjdOcC7BQdQkY6AkurX0zWRo4aVAwHPn
         n3XA==
X-Gm-Message-State: AJIora/cwj7Bdl+x2GHeGhCv/CJYYnVHoxbYXA0g/eVO+e4zQ7JskCB8
	l8L62Hpvfu0wETRG8VJ99bC9QZCrCuga
X-Google-Smtp-Source: 
 AGRyM1vJEUUx7vNWpwJ3Y3s/XeYAheKN1GsW4BZ8q0/wVGcZiKsL4IroUu0S4T05qkECeg+rb0NAUQ==
X-Received: by 2002:a5d:6da3:0:b0:21b:aaf5:b814 with SMTP id
 u3-20020a5d6da3000000b0021baaf5b814mr27018968wrs.140.1656946017383;
        Mon, 04 Jul 2022 07:46:57 -0700 (PDT)
Received: from localhost.localdomain (83.11.75.211.ipv4.supernova.orange.pl.
 [83.11.75.211])
        by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c204f00b0039c5cecf206sm19518363wmg.4.2022.07.04.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 07:46:57 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 2/3] utils: create_cmdline_shebang_wrapper preserve
 permission and ownership
Date: Mon,  4 Jul 2022 16:46:52 +0200
Message-Id: <20220704144653.2490662-2-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704144653.2490662-1-ptsneves@gmail.com>
References: <20220704144653.2490662-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 14:47:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167620

The .real command was not given the same permissions and ownership as
the original pre-wrap file and this is now fixed.

A situation where the original pre-wrap file did not have write
permissions would cause a failure in the wrapping is also fixed.

Test update also included.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wrapper/cmdline-shebang-wrapper-test.bb           | 11 ++++++++++-
 meta/classes/utils.bbclass                            |  3 +++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
index c4126a41fc..c3d3548d4a 100644
--- a/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
+++ b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
@@ -8,7 +8,10 @@ SRC_URI += "file://test.awk"
 EXCLUDE_FROM_WORLD = "1"
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/test.awk ${D}${bindir}/test
+    # was not able to make ownership preservation check
+    install -m 0400 ${WORKDIR}/test.awk ${D}${bindir}/test
+
+    perm_old="$(stat --format='%a' ${D}${bindir}/test)"
     sed -i -e 's|@AWK_BIN@|${bindir}/awk|g' ${D}${bindir}/test
     create_cmdline_shebang_wrapper ${D}${bindir}/test
     if [ $(${D}${bindir}/test) != "Don't Panic!" ]; then
@@ -16,6 +19,12 @@ do_install() {
     else
         bbnote "Wrapper is good"
     fi
+
+    perm_new="$(stat --format='%a' ${D}${bindir}/test.real)"
+
+    if [ "$perm_new" != "$perm_old" ]; then
+        bbfatal "Wrapper permissions for ${D}${bindir}/test.real not preserved. Found $perm_new but expected $perm_old"
+    fi
 }
 
 BBCLASSEXTEND = "native"
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index b58c22771f..e6f7f95d80 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -202,6 +202,9 @@ create_cmdline_shebang_wrapper () {
 	argument="$(sed -ne 's/^#! *//p;q' $cmd)"
 	# strip the shebang from the real script as we do not want it to be usable anyway
 	tail -n +2 $cmd > $cmd.real
+	chown --reference=$cmd $cmd.real
+	chmod --reference=$cmd $cmd.real
+	rm -f $cmd
 	cmdname=$(basename $cmd)
 	dirname=$(dirname $cmd)
 	cmdoptions=$@
-- 
2.25.1


