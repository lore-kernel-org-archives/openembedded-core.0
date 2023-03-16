Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A61EC761A6
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:46:04 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.5154.1679003156005667339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qsCZJJ0n;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so3013767pjz.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRyvc5C2/T0BkYcHyoIRdDdOZFKTFkUR4iRF7rkWyWc=;
        b=qsCZJJ0nqhr0MTfHKS4ooe1QBlOZNgT8GTI4FRPT9xHcZDKZkTTsSMvsp6B4sqdS6w
         4q0HNbDy3WOHBGNhZq6DwaUwseJvQYEHdBDGv5UohdqT7qm6N5Kc4xGhXcF/caSgJZSZ
         UL7ostnY0Yv2oUr/3ltGSwp8UyU/NcAnp8oA1pD9hogSzzmqUi8k3HSkPFbvExgOr2Vw
         ZzIZavLd0+/lVv3I2y8pPRkvUiJe1DCuP5b+m8zuSAo+WigoPAVDEWXx2eRRAfEfqLhp
         bz5jOBNmcqQRt/iK4tcsv1EVzxEoPd/yxhtnXnjUx+Ny5XQ3uztZxPF/oDCSwpbC1OAl
         5zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRyvc5C2/T0BkYcHyoIRdDdOZFKTFkUR4iRF7rkWyWc=;
        b=HkufO5m9EP34+nchn336+u3oVeReaZH3g+ejQ8doE0Qx/kiFlYo31nNjlHxvas8Sci
         l1TNf2tBvuOFVYvZKhureZ+O7MXKZRH6zj0tfXl63Vuk3PRXCR6FPMiwHc9BW2ieHox0
         V6QaDC76PUNMuKeraG3Bncw5sfKDB30ZV/Pu5JdxA8c7fUoZfACn6sr4JcWVme24r1AL
         6FISamzb6Mgkehl4UeLJ8TjvmQYPedPkcgRcekPZnzaMvUGd0oV/07nBEtzloL8Gmvep
         8Z2LlhbIOhqyA2WNKo3+dAi/G/HDUcWtXJZFidEF8OVQoNsYLDmkkmX9YYyw5w1oXpQa
         WAcw==
X-Gm-Message-State: AO0yUKXG7vMe5ESakQdvZ+4hMohSg3Qu+76l1L2R7zRnAybUFr4Tkaab
	24tm7z66PMCz6/2WAE1oGjB7fjpcwwcAATPAvMA=
X-Google-Smtp-Source: AK7set/9JAv7q3EzllFGlbAd/dMAdue04dmJCroUgk2K8ac7KyzQGlZl8wsOX8svv8FGDjw1GsgpPg==
X-Received: by 2002:a05:6a21:9989:b0:cd:4484:f2c6 with SMTP id ve9-20020a056a21998900b000cd4484f2c6mr6322059pzb.41.1679003155109;
        Thu, 16 Mar 2023 14:45:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/23] cups: check PACKAGECONFIG for pam feature
Date: Thu, 16 Mar 2023 11:45:12 -1000
Message-Id: <2dd5c6ccdce2e402de234df3695a9058a8a126db.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178726

From: Trevor Woerner <twoerner@gmail.com>

The cups' PACKAGECONFIG is populated based on DISTRO_FEATURES, but a user
is free to enable or disable PACKAGECONFIGs at will. In theory it is
possible that pam is enabled globally in DISTRO_FEATURES but disabled in
cups' PACKAGECONFIG. Checking the PACKAGECONFIG to determine whether or not
pam is enabled would be a safer check rather than relying on DISTRO_FEATURES.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a053dd177ddc99ced11e68914079be0ffe261262)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index b8b655a4fb..1b522d7d85 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -74,7 +74,7 @@ do_install () {
 	rmdir ${D}/${libexecdir}/${BPN}/driver
 
 	# Fix the pam configuration file permissions
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'true', 'false', d)}; then
 	    chmod 0644 ${D}${sysconfdir}/pam.d/cups
 	fi
 
-- 
2.34.1


