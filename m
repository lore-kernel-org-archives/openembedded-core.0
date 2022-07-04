Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A76C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 14:47:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.73292.1656946018255994232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gm1T1t9v;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id r14so8026144wrg.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NIMcz5kxF4sUq59CN9N4jKK6BKA8IMx7U1PXcNFyPvI=;
        b=gm1T1t9vr/JYzbXCzZ0OFOvy6yx0sHV6Ipzfx/i0hOBYt8FTWtfH+in9WkmoJh6CQV
         OhoRyqadk9V0LoOwkm/1ARKZMVg2a0BgBXFCmGUAv+gp5HRPsK2bT12cHtCCJ6jXtU28
         3266XcXnQeV8dcpYv/JSlOJ7Keh8C3enZRypdLoi8E2IaXsPNsyEff624BoetNzWOiAf
         LIQVa86fRnl6Lk782aocR1cCw1CVmjXFIdM3b/gjE/nbb9QpSpDLh1mYrZ2LSZyqnfUy
         ef7Jt04V5moUtOaM96MwIOso7yTPa1myKtODMmZEmgZyQng8kk6EsxvBTWYtmZPgm8Ir
         F2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NIMcz5kxF4sUq59CN9N4jKK6BKA8IMx7U1PXcNFyPvI=;
        b=ROhQQXWhwCAwp7Ii93t0VaHx1ZX8kvZyx02rfZ8t3Q8Pyq5PQTCclCR+dfub16MA3l
         22bnO+oUsGaEs93feyn6ACFaf3Y1g3Juw5LgbloeC93BeULSm7iDHev4M4UFSTMw7fME
         VO/d//fvih9NmEPo66OioGxfss5Ix4U9C8zYSx4vabTSSm0PnJEMmrvYUBXpAvuAdTdC
         y7NZfRAPNQv3/E7nx4VZDeM9IFE0NeXS9k6P7+gF5gEt+uI9oLEHhklz2KmM80qwR79W
         s2JEKc/hhix/xgX09n4WBzRxM9ksNHjkWxf1GHUzQOQl8MNZ3fQXbl20s0E1TooCvF17
         f8hw==
X-Gm-Message-State: AJIora9CqioRe2HzhmeqEy3WXJKk3rL/7G5DuOq/PhSvs1CHnio2Ah9j
	y6gw8wMPKNgkvxxYOCwzXC1twvy+tIov
X-Google-Smtp-Source: 
 AGRyM1tylQSWZRaVihRxMFBgmHBoeL/0RDUxpZryXiJ/KhZ7Nztm5wg1jzRsy7awILY9vhSK3gcG3g==
X-Received: by 2002:a05:6000:18ad:b0:21b:a24a:1786 with SMTP id
 b13-20020a05600018ad00b0021ba24a1786mr29334757wri.115.1656946016572;
        Mon, 04 Jul 2022 07:46:56 -0700 (PDT)
Received: from localhost.localdomain (83.11.75.211.ipv4.supernova.orange.pl.
 [83.11.75.211])
        by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c204f00b0039c5cecf206sm19518363wmg.4.2022.07.04.07.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 07:46:56 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 1/3] utils: create_cmdline_shebang_wrapper whitespace and
 sed refactor
Date: Mon,  4 Jul 2022 16:46:51 +0200
Message-Id: <20220704144653.2490662-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 14:47:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167619

Correct whitespace to match the rest of the code in utils.
Refactored sed expression with a simpler equivalent.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index b617632d9f..b58c22771f 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -188,7 +188,7 @@ create_cmdline_shebang_wrapper () {
 	# Create a wrapper script where commandline options are needed
 	#
 	# These are useful to work around shebang relocation issues, where shebangs are too
-  # long or have arguments in them, thus preventing them from using the /usr/bin/env
+	# long or have arguments in them, thus preventing them from using the /usr/bin/env
 	# shebang
 	#
 	# Usage: create_cmdline_wrapper FILENAME <extra-options>
@@ -198,10 +198,10 @@ create_cmdline_shebang_wrapper () {
 
 	echo "Generating wrapper script for $cmd"
 
-  # Strip #! and get remaining interpreter + arg
-  argument="$(basename "$(head -n1 $cmd | sed -e 's|#![ ]*||g' )")"
-  # strip the shebang from the real script as we do not want it to be usable anyway
-  tail -n +2 $cmd > $cmd.real
+	# Strip #! and get remaining interpreter + arg
+	argument="$(sed -ne 's/^#! *//p;q' $cmd)"
+	# strip the shebang from the real script as we do not want it to be usable anyway
+	tail -n +2 $cmd > $cmd.real
 	cmdname=$(basename $cmd)
 	dirname=$(dirname $cmd)
 	cmdoptions=$@
-- 
2.25.1


