Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13636C54EE9
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 07:41:48 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web08.3472.1663314103063281491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 00:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q4/iVzjR;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id l12so25024251ljg.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 00:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=Neb1rfrb7eXcefFol1KHEJiobZE43M3c3ACrB6vlfK8=;
        b=q4/iVzjRzFAYzTgMhW/KhWb4XA0VnA3YOg1eYdI7c/Onjyb2rHn+wnZ/8mm7fUx0ix
         eaktqiiB0zCK1jh92lw8shCBYRaJ2G4ixYhr14zURbXAYugReAf0+jjH+p69QWCjRdch
         kKeFcCCW6OSa7x8lwABc7Nd5sWGvNrkQ9vhAdgRIOIZLlTVT+uwQ7Q8gsYlXbbptfQYY
         /+seAqC1TfDNyycYY2Q8aKJT3s5M41C7M8aeAH7bZT9lUKVVkJgsRXOjVOFt1QWQma2P
         73/ahnw3CrKs/6z0OP79GAC56uo2Kqt2U8UWPZMmpaSIX5mPQPPjt7a0K1vShSGeQhQF
         nVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=Neb1rfrb7eXcefFol1KHEJiobZE43M3c3ACrB6vlfK8=;
        b=LFlmo/7VHZonoq7hcRc/Nz1WxBoHEXLr4Oscb3uySP9YUHw01Hxg7h1IZq1Ycab5p6
         dA1jMKmcrM+F+q1oa86t12M3fxSeSWQOI3t4Rm4Zc2A6QfbGpEgYF39xLtzKt8dclTbt
         2FYdsOltlTAoXX/9zJiI+8TANZNwjz5D19HY9EUCCSEgBPj7n2CWFrQNmXGIfl3kz08m
         pfsdGjCaU5lepqqwUPr6YWqbeGAMYLxUfQJd54Ihi+KaCYqXSrGz6KDWboO+UtUYPu3r
         why/yczB1ma3vaDNrmlS/Vlh6SrLgl9Xg6cUt3YaQ867jhFgqsWISxf3yX58QKxHwY/9
         59sw==
X-Gm-Message-State: ACrzQf0roclsaMfaUo/z3lpOvwpMEiwL0wcljk0YBYJj4eItj97a17qI
	IiVUgRHiKZ2Tvk12sEOB0Qs+qQz5CGk=
X-Google-Smtp-Source: 
 AMsMyM4Q6OAKtwtjQ2J2l97jXUxz7qPxage0an+CWVjW07kmfKpE/UNdakidz4SqhOa2TFX3PO6jlQ==
X-Received: by 2002:a2e:2e03:0:b0:26c:1e37:c43c with SMTP id
 u3-20020a2e2e03000000b0026c1e37c43cmr1014243lju.418.1663314100586;
        Fri, 16 Sep 2022 00:41:40 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a056512368500b00494643db68fsm3355307lfs.81.2022.09.16.00.41.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 00:41:40 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] Revert "gcc-cross-canadian: Add symlink to real-ld
 alongside other symlinks"
Date: Fri, 16 Sep 2022 07:41:04 +0000
Message-Id: <20220916074105.215147-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 07:41:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170780

This reverts commit cdd86896c8d29135f937968e9aa07f919cf543d3.

real-ld is always used if that is found, which means you cannot
switch between bfd and gold linkers using -fuse-ld gcc option.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index a87b446c4f..38c972aa7c 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -134,8 +134,6 @@ do_install () {
 
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix
 	done
-	t=real-ld
-	ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld$suffix $dest$t$suffix
 
 	# libquadmath headers need to  be available in the gcc libexec dir
 	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
-- 
2.25.1


