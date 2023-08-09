Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C74CC001E0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 00:18:43 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.77767.1691540318116433205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 17:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Drtn9wAC;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2680182bc21so3396209a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691540317; x=1692145117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rF3CfxTzf/4Gt/Nh83A2eFowdt4uAQ9CKDkIjThZ0lw=;
        b=Drtn9wACh85+E/Zc4yOTGrkh08q2vIeWHw3XCh/MnYQgQ8Nvja2mYLZLDP5fwgLbhP
         4dse8+Rvt99F9l2AvUDYcN3zNtwWQ9rX+i13ftohDlXoJhPQ8N0++rJBI4RRaVpP4NHv
         vZlkJ0pGJ9uEbxas7o+eE8yPHlqYUZipzS0wmpA1anbY0ekT66RvWxnTXj8SIVpfQCRe
         BbXQHPiMiAAU8IoV1ZMN4PVUNEEsoSu9Bwb/Ro+cEsoF4IziwSUDMU1grJXC2/6/72ss
         Fq1TL/zQLYJ6MlQrEJ7ncW4zLFYRmVv2UQD/fY1H0voOfdZ8gQCU/PFw6HTHCixh1eM9
         GA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691540317; x=1692145117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rF3CfxTzf/4Gt/Nh83A2eFowdt4uAQ9CKDkIjThZ0lw=;
        b=PT0QVlTutpQx/kLpfJo1uHM1OuFlu+pfLlLfbFxoXvc7fQu8i1nf8YglbfMbQSf6PU
         TbewIL2b6fEEPTZsmmOzT2ixcRyQwWtfF1qIRpBAE6fWCYRT7HhMtElr7KLhXVOeGA7f
         feYnqPQBFS8vDR3x/ejj/Dulr524TAqTg9QeeJsxZhboQRbAhfeGUHhjQfaAPysqeJL9
         8BSPxMIMcpb5WqqnzUDyUrEP4cPgMPsuIGOkpWQn7ZYAEIEva2a6i7l9mLQqzfLp0VN7
         bvByFWaXdQGOhEMVs8v6uCSJOVV13R01xkMlQpS91qwo3kYdmZWs4ygHnDpRvZ2Tz6yq
         mJiw==
X-Gm-Message-State: AOJu0Yz6ihgnDJjNqwiO1iKKXPP5fjcfSNf9eDqUSKQYaE+29SCGVRh4
	HsrXkxWAJjHfy5gB4XWXJxPf6mbwGqGtTw==
X-Google-Smtp-Source: AGHT+IHu/l/nFSHMU+0JerURbMi8Mr4bPKZMG/8PVnYxsPv2bkJQUK8Qo1RYq9x+LV6dgYM0cbRv0w==
X-Received: by 2002:a17:90a:7e12:b0:25e:d303:b710 with SMTP id i18-20020a17090a7e1200b0025ed303b710mr828795pjl.35.1691540317178;
        Tue, 08 Aug 2023 17:18:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id p12-20020a17090a284c00b00262ca945cecsm133579pjf.54.2023.08.08.17.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 17:18:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] pm-utils: Do not require GNU grep at runtime
Date: Tue,  8 Aug 2023 17:18:34 -0700
Message-ID: <20230809001834.1682013-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 00:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185682

This was added to fix bug reported here [1]

back then busybox grep applet did not implement -x option
and it would fail as reported in the bug, in due course
busybox now has implemented -x option [2] and the expression

using grep -x in /usr/lib/pm-utils/functions:219 works fine

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=1887
[2] https://git.busybox.net/busybox/commit/?id=cd09e81520b7917adebcffd7c361671f913325eb

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index dcc09f279ef..2c3ade99347 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -17,7 +17,7 @@ inherit pkgconfig autotools manpages
 
 PACKAGECONFIG[manpages] = "--enable-doc, --disable-doc, libxslt-native xmlto-native"
 
-RDEPENDS:${PN} = "grep bash"
+RDEPENDS:${PN} = "bash"
 
 EXTRA_OECONF = "--libdir=${nonarch_libdir}"
 
-- 
2.41.0


