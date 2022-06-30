Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D87C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:52 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.27230.1656606225068557096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=b1t17qi2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id m14so17474059plg.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AfecorovfXOaAAtaGwLAteIZDyCqppEbI2YFf4h1hrg=;
        b=b1t17qi2pL77je5DiT9ZrXcJk6DeV1EJpDgj5iYW9OlNDvhpIBbVWdqtGwI40PsR7g
         Ok5iZyOES+cx+mwIm9Z1UghNmRV5zlnuyC9urcfR7fQpVEaTBjh5XEqpZiUeuOHCq7e5
         i3G7g8TQ37bvuN0NoLfOr6rvz91N/CtCtobbKZPlq6EBHaAvFeNjGsQ6JbGdi05V0jTe
         01xYDNXmJqAFuIRyDTULTDx/2poIwjPfgs1JB8oeZhyHO3htvQcZFCa1vw0uwr3VfSz4
         ckuoQQL1VgtkiNEmfwR0Muhpipma34s6wslLfOd2TkgEBfw+D9T4kG4MhOhW6qtPrfP2
         LLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AfecorovfXOaAAtaGwLAteIZDyCqppEbI2YFf4h1hrg=;
        b=qnPAL9exyrsM6D5PJ8dYIdxHCzdKBmxJc1+arYYsEZ4yj1HyL4asLiLNP61OYSABa/
         QZlB2MGs3Jg29CvbTIsYZRcy0uc4mnszddtNimzmrMJmIc70L7UniK7bycf0esDzfKjY
         SpDRRvsbGAb7isaEyKeqnfMYUNt1DaMbQctVq36tuBOZHSeKVmwejsQyjtTWhmPsZZyG
         AARJrCeDhrr/DYqp6e/s3RGPro8BQA9lqisqaSmc1Xstskrq56hhGUX12SaKqTwavTse
         YIGLxONmURzqolm8fOeoNrYRFWxPop/ACWwzGDo3wPAusY63J/+0s2wHTpHiR0dOZahR
         qVvQ==
X-Gm-Message-State: AJIora/wFyZgUeE3SdLMDM2w+aYYsagPbzdpgHF5QeFCz9m3kv4gUhu6
	ZcyO3XFKEE4r9+xxsT5FavNKvfUYBraH1GmX
X-Google-Smtp-Source: 
 AGRyM1uFO9B2jeDlxvhhWTQTZwQazZMoQvTXhkzxTW199wjGt/bL7IiQgVGC7KaXXj/L4qchb45rRg==
X-Received: by 2002:a17:90b:1a81:b0:1ed:3c0:3abb with SMTP id
 ng1-20020a17090b1a8100b001ed03c03abbmr11362293pjb.5.1656606227884;
        Thu, 30 Jun 2022 09:23:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] wic: fix WicError message
Date: Thu, 30 Jun 2022 06:23:11 -1000
Message-Id: 
 <c83cabad78dbc98bb72be7fd7dd51023853a3ff9.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167427

From: Martin Jansa <Martin.Jansa@gmail.com>

* add missing % to print the values instead of:
  | INFO: Build artifacts not found, exiting.
  | INFO:   (Please check that the build artifacts for the machine
  | INFO:    selected in local.conf actually exist and that they
  | INFO:    are the correct artifacts for the image (.wks file)).
  |
  | ERROR: ("The artifact that couldn't be found was %s:\n  %s", 'kernel-dir', '/OE/build/deploy/images/qemux86-64')

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e104c2b1273d8c5bd97893f318bf2a2699ef7f2d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/wic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index 6547abe0e9..99a8a97ccb 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -206,7 +206,7 @@ def wic_create_subcommand(options, usage_str):
             logger.info("  (Please check that the build artifacts for the machine")
             logger.info("   selected in local.conf actually exist and that they")
             logger.info("   are the correct artifacts for the image (.wks file)).\n")
-            raise WicError("The artifact that couldn't be found was %s:\n  %s", not_found, not_found_dir)
+            raise WicError("The artifact that couldn't be found was %s:\n  %s" % (not_found, not_found_dir))
 
     krootfs_dir = options.rootfs_dir
     if krootfs_dir is None:
-- 
2.25.1


