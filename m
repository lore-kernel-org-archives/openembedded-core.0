Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB9FC52D54
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:08:57 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.70689.1722524934412059156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W2fOFXda;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a1dd2004e1so441957385a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722524933; x=1723129733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZCJ3KbM7kT7goMLGVkp/pDS71QJMdvhFQy/UwvGXLg=;
        b=W2fOFXda6x0CXO6Xp186mLA6pZIbVGwk1ErXGTx2pPNOQakqHh1erGxo60iq8Pa6hZ
         wgLrI8EmNdv/b2U4Vk9kaok7OGKre5E5ytCOy08hec3eLSGmcK6KFKWe41rUYtQWfyDc
         Fr5+ZKrM+rBRrwCQh+4KceX4pG6C4c90laI9NJ0w/LZVkvaIkuT8FGpmoQaE3Nw+uN1r
         5G9eF0ecvn3LTV+aDeUTuaDKeCQAYMc1tkZngFu3BAaxMCklwtkl6sf+7za3F2YbXa1m
         udrEzi6odU7Y5JmGT3MiUNq/qkHk6xnoKRB5Xw2eaWDZbdtWlOxhuwYqH0e8AtgW+Xk+
         x/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524933; x=1723129733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZCJ3KbM7kT7goMLGVkp/pDS71QJMdvhFQy/UwvGXLg=;
        b=LLBD7bRi8ASQY0Zhpxt3s6ECB6Y7Z40QK0pKFQyZIyiWukYXZvZ3EU1zDO5gntHJGb
         tcYkITqj6p2cFeMHPU3B5gVbYp+cqlaNE8MWxgafanrqtWV0NK1wqlzKEb1C80q9xNuE
         WyBk/KAQEbEHuxAfmokbTw0mtK6mDTVh6zT4NsyOo+5QBHm0mQvj6yzRjSAykyffEXWu
         xfGLgMKGQcDP9oQ7yrBChM4jgQWL4o9AySxG+Owqr9pXFb6Kc4vJETV1nXwyaKuNadaK
         ZuVvW5lF/4MPDJ+6tQuEUt/Z6Ez04euXmJ03MbbfpvHC1m+df2CnBvrqX+W1sp4OhOOF
         IBew==
X-Gm-Message-State: AOJu0YyBxiUVtsMndimJ+QbJmHsiiG4NsuU1DjPCPwKPaUDlxiiFn53u
	TPrBqFM/qHDKtKyC/jJwQmS8GwhugleAJ9LJ2O2Q7sQi0H0izPx6usCv/3cK
X-Google-Smtp-Source: AGHT+IFspOYuGw0yN/adzoC0gMhW/COtV1okmZHQSbKQMSPds2ErR/Gp8030hp0IFJ4Aiiuys6KQVw==
X-Received: by 2002:a05:620a:44d4:b0:79f:88f:6989 with SMTP id af79cd13be357-7a34eed2a72mr30477085a.20.1722524933066;
        Thu, 01 Aug 2024 08:08:53 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73b5003sm859343985a.43.2024.08.01.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:08:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] kernel-devsrc: remove 64 bit vdso cmd files
Date: Thu,  1 Aug 2024 11:08:39 -0400
Message-Id: <f842759d542e114bb86b70133ccfe4b5e83e11f7.1722524523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722524523.git.bruce.ashfield@gmail.com>
References: <cover.1722524523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202747

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In a similar way to the other architectures, 64 bit arches
can also require vdso generation. If we leave the .cmd files
around, they'll be packaged and generate build errors:

   ERROR: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /usr/lib/modules/6.10.0-yocto-standard/build/include/generated/.vdso64-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
So we add the file to our remove list and avoid the issue.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index fafab475f3..7724967151 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -134,6 +134,7 @@ do_install() {
         rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
         rm -f $kerneldir/build/include/generated/.compat_vdso-offsets.h.cmd
         rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.cmd
+        rm -f $kerneldir/build/include/generated/.vdso64-offsets.h.cmd 
     )
 
     # now grab the chunks from the source tree that we need
-- 
2.39.2


