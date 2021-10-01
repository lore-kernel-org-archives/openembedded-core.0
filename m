Return-Path: <champagne.guillaume.c@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C99C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 18:04:39 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.994.1633111478512126778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 11:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rmo84ULu;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id l13so9793769qtv.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 11:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5n2Zsa8f6oX9oWyRGYL7bHWLxubLNR6VmTJbjQc0SeQ=;
        b=Rmo84ULuCbqeM75luOxQ0xycWFGGZtjyU2z3F58lX4+XqectLMZSYCUVBvkDPDF0qA
         XBc72uswD5zr3WmBec4VlSEYFGuwc7X9S2jlh0fAVkT2TrD7L8f15r2V84RkqmXcH9rI
         BZtWVS1HYQ9Rn+3EoPcMxQOTbUCMfKwK/QsXuJC9SIjB6bC895KK33bo3JYuW7ieAoU7
         K5foaKe8bmokV3JSFZTAgqwjU06KXMu/MKKG7RYsIFChf+MDwd/mbTbt5iqaBK0o9lUg
         zUFb7velDC9BQ9ugzwQgDhYXXEVPfbH7MdnzfLmIzPFpuJ/jmYE9gjBqmhTsY+bf2Czs
         k42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5n2Zsa8f6oX9oWyRGYL7bHWLxubLNR6VmTJbjQc0SeQ=;
        b=7pFp4s8ahUTv24AEJAd0zsnhbFgIQNUynccLRE3c5nvFpDVr5TH/uW82wllZgiSNfh
         j7pESsBTlqa7f05YnrpEAHs2Bcm1+WDD50PN1bIPyTRCMlug4oF9uaQJ9d4EbIAv6b0o
         n9cGJsWJqEXc4f8GhCD0LVJEh1jMO4YL1bUvJa9+Rtu9XVtQngmGJ0L99BnrWAqHfLFO
         XuGO7vzMimonn3Thn3ICTCzSBK3eyv4SEkFkbkFoPqYvaT4TI6jm/42655pQxDZmJlsl
         JIaWDL8Za9S2j5s6cQxHKjVvxEb+999MI0nzbuz7yBcY10tURiw7OIPaXWk1coXzsb+c
         yE3A==
X-Gm-Message-State: AOAM531GGXO6dHQ6IAk6jRQifoSwHIJstcBOU4s93nVsgEw8en58ETLn
	b/5K+3MaUnL/X7/+vYVSW1W7De7LwvY=
X-Google-Smtp-Source: 
 ABdhPJxFR0GhrZDGR/FW5upZpWHyQF4uc08UHZ4rmpQkXGFuDT3bof46cnifY+buZKjeqCovip2gcA==
X-Received: by 2002:ac8:5788:: with SMTP id v8mr14785562qta.372.1633111477565;
        Fri, 01 Oct 2021 11:04:37 -0700 (PDT)
Received: from gchdesk.Sonatest.net
 (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
 [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id
 a22sm3337691qkh.47.2021.10.01.11.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 11:04:37 -0700 (PDT)
From: Guillaume Champagne <champagne.guillaume.c@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [PATCH 0/1] fix pod2man errors in binutils-cross
Date: Fri,  1 Oct 2021 14:04:28 -0400
Message-Id: <20211001180429.6069-1-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 18:04:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156530

Hi,

when building binutils-cross-x86_64 on hardknott, do_compile fails with:
make[4]: Entering directory
'/builds/project/tmp/work/x86_64-linux/binutils-cross-x86_64/2.36.1-r0/git/build.x86_64-linux.x86_64-dist-linux/ld/po'
make[4]: *** No rule to make target 'all'.  Stop.

Seems like it's caused by error:
/bin/bash: pod2man: command not found

which appears multiple time in the log. The following patch inherits
perlnative in binutils to make pod2man available.

-- 
2.20.1


