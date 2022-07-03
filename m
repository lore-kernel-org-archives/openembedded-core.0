Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D782BC43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:37:25 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.64014.1656877042874667539
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Fsff1WxU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d17so7175110pfq.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vpxF9p40a9HAlXH4ISFDanCcGk+nD4ibDLlybq152Wo=;
        b=Fsff1WxU9jTNO1Zu/e6I+ZvDYG0IjMkDyBSHjOAmPbYyef7OE9riwBAMyqn9mrs0+t
         5zqfv7ikm0EsN3o8hYMk4XvYX840WnVrf4tGPVKetcomv7ifXK4tcj91Gzb3HSxqpe0G
         fodBYeE8PkrcqZyp6/qejkQi2n8F5xUfc2qOlnpuePWM1U8t29wA7IqGEWeinrWtgIJ0
         H1dQU3cCZk950ruzMRRdjiThhYAxoj2Pm+qcsCc0eEHpWaONWotprZ8Am6WKIa8tflJq
         jqaoosX5IsKxHH5MZDK7B8fY5KBCChHd2WIPEBoFXBML4ZnPjHYnH6NGGgaELn4EWHgZ
         dqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vpxF9p40a9HAlXH4ISFDanCcGk+nD4ibDLlybq152Wo=;
        b=UyuN/IcuVwxrzAz17ZX+OVS/ZT8nw5hULuQxatU4YVlizX6+YdKKyKsaGoHBJc/77R
         euC8xcAXAM3TSL3Gpyc7rmUe18BgMtYcIe+xmlUB1X+el0q9u94Z5yx9Y+EKzg8P9pbn
         CmQ22twHeoDxFEXFbOE1xo7mVOoKDykoIk++qMGx3cemHa/n1QhHkrbtFYARRRiD/jNY
         KSpi/yjfbi4/Ff3ApKY/sYvBePQc0XGge4coWXx4VcdEMlWuFpsP2S8gflzdAeDek18e
         xFfaR8cUUdWhn3cI3+s22ODIskj9D9HrCjFLPgJId7msvTxmIBrv0+JpprDyOqepvDWO
         C1XQ==
X-Gm-Message-State: AJIora/irpRjeq7VQWwCdtqS0TyedlWWz9R0XK37MU36gVv2SPD8NxU7
	cp/apeOty0r+Iuqyt0l2mZujq4E0LsooASNO
X-Google-Smtp-Source: 
 AGRyM1sMSNdqa2HkJlGrlkDqV5O/pf1KTsrjm1swOwPnXMzvZbJgieL4rlhqkvwQdcDPennBOAapPQ==
X-Received: by 2002:a63:8441:0:b0:40d:34a3:b7ce with SMTP id
 k62-20020a638441000000b0040d34a3b7cemr22601807pgd.292.1656877041835;
        Sun, 03 Jul 2022 12:37:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.37.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:37:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/30] wic: fix WicError message
Date: Sun,  3 Jul 2022 09:35:48 -1000
Message-Id: 
 <772c9f66633e85c5059670d328e1b5fad407457f.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:37:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167573

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
index aee63a45aa..06e0b48db0 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -209,7 +209,7 @@ def wic_create_subcommand(options, usage_str):
             logger.info("  (Please check that the build artifacts for the machine")
             logger.info("   selected in local.conf actually exist and that they")
             logger.info("   are the correct artifacts for the image (.wks file)).\n")
-            raise WicError("The artifact that couldn't be found was %s:\n  %s", not_found, not_found_dir)
+            raise WicError("The artifact that couldn't be found was %s:\n  %s" % (not_found, not_found_dir))
 
     krootfs_dir = options.rootfs_dir
     if krootfs_dir is None:
-- 
2.25.1


