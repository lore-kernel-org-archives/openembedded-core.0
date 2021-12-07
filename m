Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F280C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 16:52:19 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.610.1638895938315122256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pybP7fli;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id t83so15262138qke.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x57+bEFU1TdemoxOj8bXzYIWgjwwHdSAFWb5PlWQcBU=;
        b=pybP7fli1L4g2vkHeY1JvcCtFTeRc7uiKK7DszsKs2+uZgb9eIlgZ9IXQ2Xn1NgC1D
         EoK6TtIhNI7k7LLxIz5sJFEiheclring9KX/Enq57GtXQLseOkO7WY3/fWxqNoBwulE8
         x/v0MGEygd2GICHuFmCuf0oEf6raV4iVPJus9J/2K3fvUMLJY1aF1QpFdcWNrm71wxvY
         nGhx4czVg6bx4GqBUTHJLBGU/J4noRdQVVqbLwTOdfCwMsvkFsnI3nFHyXfeqkRBGgY3
         Pom8Z4tlFs1qUbwMhCU8naTHfOt9C68+AuDViAAVRpTQM212spUEb9CzXJRRbarJegBT
         sgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x57+bEFU1TdemoxOj8bXzYIWgjwwHdSAFWb5PlWQcBU=;
        b=OBNx0nteqK5qiUYguOKTI+bzUOcn5ILzs0r8NjBUtfKBFDmGAa+0kh6yPRiW3YztYf
         hdc1iHT0QKVIUrOw3rGrZpBJyBTP3BZcrGSkFORTNk9uUtYskmE80qn6uSjypXH7qxzs
         9bLiSnG+CuJja/FMNtBY1hULYF6e6uPZEw3Ms+3NQMor/eLXswxpQmYYt+Z5sHn0ENzF
         J4a0ZfQbsKJfPzIY5t71XboZUjmecbFW+T+rq3Ex/HCDBICZ5GslB69Swruw9vBWqKoQ
         P5wDSMF5Pbbs3+uTleZnmCWYt+lnOKvktqHihv9EqVRED1bvI8LcN6TKFWiaJnmIt3Vz
         wC8Q==
X-Gm-Message-State: AOAM532pkPCtZWKrnqVT2MB8H5xtbp0wLY5/LLMYDg0zyevwVE7VPwEV
	bOzOt1SxsMbjF0C64yHunqSsJwEK7BB5xw==
X-Google-Smtp-Source: 
 ABdhPJwYg90ZXI0qcpt2H37WdFITyny076hrAYluk5o05NTtsScuTgho/0aKllFvgAH1FkrrwBP5/A==
X-Received: by 2002:a37:9fce:: with SMTP id i197mr326243qke.67.1638895937503;
        Tue, 07 Dec 2021 08:52:17 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id v9sm57536qkf.90.2021.12.07.08.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 08:52:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] kern-tools: bug fixes and kgit-gconfig
Date: Tue,  7 Dec 2021 11:52:08 -0500
Message-Id: 
 <96df7ebc8b23eb2bf612b7f80115cb21b483756e.1638895732.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1638895732.git.bruce.ashfield@gmail.com>
References: <cover.1638895732.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 16:52:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159322

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping yocto-kernel-tools to version v0.3, which comprises the following commits:

    90598a5 tools: Makefile: add missing install file
    330f9fa kgit-config: fix file mode
    22b55cd kgit-config: cleanup error message
    1e2a233 kgit-config: fix the "not found" message
    e7fcb9a kgit-config: trim trailing whitespace
    3cd14ce kgit-config: BSP template and auto meta-data creation
    e56620c tools: introduce kgit-config
    969b888 buckets: update to v5.14+
    d220b06 Kconfiglib: add support for bare 'modules' keyword

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index ef035aed23..018e34dfe6 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "d220b063852245fdd16b9731a395ace525f932d6"
+SRCREV = "90598a5fae1172e3f7782a1b02f7b7518efd32c8"
 PR = "r12"
-PV = "0.2+git${SRCPV}"
+PV = "0.3+git${SRCPV}"
 
 inherit native
 
-- 
2.19.1


