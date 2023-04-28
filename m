Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7881EC7EE2C
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.14785.1682671710104875098
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kysViobb;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-2f917585b26so8719306f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671708; x=1685263708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FCKSEiBKsdnPnOfQ0KJHVx12u1UKgE8eNKhQz0q4XU=;
        b=kysViobb99qeIY0rw4y3jzChXp09MGvkNrsf6nQRyjB6LyL7CcYohUthUKfU8tIY8K
         eR3aGvQaqkMe1XQxigoa/NVGYIPBEmbdB+/HeWDnvVbri0XrxdRbJ387Gr6oDpQfMPIz
         /v8tvlRqCLijwh8yjQ9K5VOd1NOqyOiTpsvyJE+jWFQWff55J55eXel7hnnLjccfmxtQ
         tCePAKN5srixQ+KfGo27I8PeRZw3IA14bBtG81b0LegBiCye9R+u5BKwCu0BaAK2i9R/
         on22i6QyXCE6kF1SaXPBJ2QcW68FtDeKN52vsG1TGOsaVhu/wjKq9J+zhf5J56TxiPW2
         D/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671708; x=1685263708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FCKSEiBKsdnPnOfQ0KJHVx12u1UKgE8eNKhQz0q4XU=;
        b=b8nYHXj2E/NuwFP6PAtQzpF5YruCgtKkGMvmQ3B7VG5ZnpYqjUy9UesmDLmFmVuYI9
         mMaDighlkeqoaNi2+iXTPHfvf4O54UTPu0E88aneWStflRbArKaHA8jmr5/HXoUR2GwR
         CEs0rCaidwTd8H77kCcfXiHHN+L7oEqqE06UXHJXHvm/0e3ao7u5kX1oKagwsD1+SGKX
         FP8DcZqCKB6jlTlZF+60vkF2y+w/9h+BA2Io//9Vas0xFAa1ADDVZ/D/1XKYLgpDFZh4
         uCa7snO5Ljj3CbwNqxrmBi8hMINWJVyEYY8GZsIVT83pjxD9R/Pf5nTSqA1iHE/srjad
         md2A==
X-Gm-Message-State: AC+VfDwMtw1PCrf2f4Gj6B7q5c2InZ8wBfbesmXQuxSCMziqovmX0Pqe
	a7yHftx04bKLNklhAXmbBYSFmIQL8Fo=
X-Google-Smtp-Source: ACHHUZ6YOeq2MFuEunR7Zh7g24YHBeADqEjpWYANIaQBL4nTQ8ekxs5JZ+PVDfT/beTdWSQSYcuFtA==
X-Received: by 2002:a05:6000:50f:b0:2f0:442a:2d45 with SMTP id a15-20020a056000050f00b002f0442a2d45mr3210458wrf.57.1682671708383;
        Fri, 28 Apr 2023 01:48:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 03/11] strace: exclude from x86 (32 bit) ptests
Date: Fri, 28 Apr 2023 10:43:44 +0200
Message-Id: <20230428084352.836515-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428084352.836515-1-alex@linutronix.de>
References: <20230428084352.836515-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180514

Please see the linked ticket.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 78750a0d98b..77d69c9fcd1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -114,6 +114,10 @@ PTESTS_SLOW:append:libc-musl = " libc-test"
 PTESTS_SLOW:remove:x86 = "valgrind"
 PTESTS_PROBLEMS:append:x86 = " valgrind"
 
+# https://github.com/strace/strace/issues/250
+PTESTS_SLOW:remove:x86 = "strace"
+PTESTS_PROBLEMS:append:x86 = " strace"
+
 #    ruby \ # Timeout
 #    lz4 \ # Needs a rewrite
 #    rt-tests \ # Needs to be checked whether it runs at all
-- 
2.30.2


