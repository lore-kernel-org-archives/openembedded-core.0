Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9842FEB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.61503.1688484622541403683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Su12x0fE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b89bda02ebso14210955ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484621; x=1691076621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxGrnfH06KXoWz+onbYlTYRgFuk4xkg0UDDotLmbAbc=;
        b=Su12x0fENx67kbP5CvVu3ggc9oEJMPQzf/1daZlkKO9NDQw21hv3rremHezKON1uXG
         oL4IGlIt5QBuv+Ayw+oRvwaiTyLB2KZ5t/31nSkIyLM9QFqHAxoC24BvCV/iw2jYHmGV
         nzn0mDlV0LXcOgrs1wM7iDWzBexylE8VJz+3rnohVmU7xdkECKOuHKMbROCkasX0f/be
         3F7gRSjBbkpcY/j01/87QF1gHCZzd9fk7pSjlrNaaifMPHlOEJ3AJFDmJ+LvSpjsb3qv
         oTBbeO+TLCpQXnKoFXCXOOeF8hSSlX6ZAeNACadVQzJwGueJLfGrZfis5vlIC1ufpwHx
         lICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484621; x=1691076621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxGrnfH06KXoWz+onbYlTYRgFuk4xkg0UDDotLmbAbc=;
        b=NEzHuda5cCI44nMBOlA7D1J7oUDVhbcQCcxWdg+cq18Nn4HyyKJSahbSnu4dmFFXJD
         Jl9nUcUVZeZo653l2yCmoTUejTnfs3zfgMfV7jDZlsq6cSP0AbkKgUNA6AsNJOtIa426
         6bV2GQJJ3Hlpvq3b80SKuYrs/W7c41IwbnREHDZvvj1L6aqVeAi6//4L8yCftU1UNSlG
         99TeggvV07fu4qnozOhbwuxkiMmbqWVBitI0tHa0r+Z/l/nT6GFopEqPmvqIeV3pJeWn
         zibMpvCbXIHxIIc876QCU5Hwa5D8Nrg/U9y+x9sb4MQn1e9qojR11oVeyOWrLpTUV9dk
         Wcpw==
X-Gm-Message-State: ABy/qLYqfv/WyjB4Iep1UVBuIOJK8Dyu2VqgYEass2fs51q28+IBtOWM
	91TufAy0b0yghQuRAD0kOuH37uPdtr0OZ1yG9G3LXQ==
X-Google-Smtp-Source: APBJJlHiFkTLlwbLLSGD9hG+M6FSn7rleYgU1ADZriXvEgS8FyAMXbs7qMGz6J0n7VQX+gXBjn7Wdg==
X-Received: by 2002:a17:902:9a8c:b0:1b8:4f92:565e with SMTP id w12-20020a1709029a8c00b001b84f92565emr12271896plp.21.1688484621538;
        Tue, 04 Jul 2023 08:30:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/30] zip: remove unnecessary LARGE_FILE_SUPPORT CLFAGS
Date: Tue,  4 Jul 2023 05:29:23 -1000
Message-Id: <0efe5f77027b902b276c925ed09caf5062f51170.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183856

From: Chen Qi <Qi.Chen@windriver.com>

As the zip's configure has been updated to use compile-time
check, it now can do the check correctly, thus no need to
pass LARGE_FILE_SUPPORT to CFLAGS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 601f45bc4e6c563ebf16e724d56519a128815034)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 802877285f..82153131b4 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -32,9 +32,6 @@ CVE_CHECK_IGNORE += "CVE-2018-13410"
 # Not for zip but for smart contract implementation for it
 CVE_CHECK_IGNORE += "CVE-2018-13684"
 
-# Enable largefile support
-CFLAGS += "-DLARGE_FILE_SUPPORT"
-
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
 # whatever we set.
-- 
2.34.1


