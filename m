Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE61C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 16:55:25 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.14110.1637686522355889267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 08:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GOUS7gY/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id u1so40056194wru.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 08:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W1JR2FWuVgXMYMHF+g6W3luqI4GmJH4BwNy0/r/rj2s=;
        b=GOUS7gY/ljdAhWgjuDrse76t5oeO9YK162DgkpMnIwwYfOE4S2Kod4LQlIfrvY9qNb
         Wf/dNsFgWph8HmLscNvOc6pAJvZUE6p7JBh0bvB1hYpW9ib4OpJw3FOtpFe8Qu5CBYbd
         Z/dxKl5jmi5DOAOVNcPdYx+gSzAvczNSJFdK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W1JR2FWuVgXMYMHF+g6W3luqI4GmJH4BwNy0/r/rj2s=;
        b=DbmdO7XWPRkooIwvEe70Rejgz2ZadmrMzey8VqCZF98rn7FPqegCf29bP4S8FsG36Y
         yJic96F9iuRFXunCSDCUH8lAvB5Vlorgw8uIowVP576iMCHFqPwktvarSohBg5rDHtAO
         RU7cUv1LdEcwvIbqaR0n78d4dlkz7NCqkgTh8h99sQIn4EWCEMSK9K9IbyYze8MV1IvT
         XsFmgqo2wn+f8etghneEwWNhoQhCW0RJhdw1wJP2XF6NJh7b3txM3OKkxaPCYe9gyBTX
         isTq1WdUfNSILw9DhQ7cF6yPO9TLxcJCv7nSLxKz7NQzbUgxOS7VcPgFLtSx2xt2eY0Y
         vY5w==
X-Gm-Message-State: AOAM530HgJwZfO/q3zTgXqEewmwTM2uTB3Jhg1ciG+gT7JqUV2Uk7evy
	O5UoUErOTCwSFk6tPA9IykOvndOuH4zeeQ==
X-Google-Smtp-Source: 
 ABdhPJzQW/8BOoBfJltQooCJ0iXjPpvAPwS1DhyXDeYbJt2lDjJtdxMkPdfrh2QQ5xBANe7NhPCyVA==
X-Received: by 2002:a5d:53cb:: with SMTP id a11mr8754975wrw.357.1637686520265;
        Tue, 23 Nov 2021 08:55:20 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e990:5f99:797d:8988])
        by smtp.gmail.com with ESMTPSA id
 a1sm15782673wri.89.2021.11.23.08.55.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:55:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: Fix i586/c3 support
Date: Tue, 23 Nov 2021 16:55:19 +0000
Message-Id: <20211123165519.36922-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 16:55:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158611

CET can't be enabled on i586 or c3 for x86, adjust the configuration accordingly
to fix those builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc_2.34.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 72064772789..7efc1ec1ef7 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -90,7 +90,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
-EXTRA_OECONF:append:x86 = " --enable-cet"
+EXTRA_OECONF:append:x86 = " ${@bb.utils.contains_any('TUNE_FEATURES', 'i586 c3', '--disable-cet', '--enable-cet', d)}"
 EXTRA_OECONF:append:x86-64 = " --enable-cet"
 
 PACKAGECONFIG ??= "nscd memory-tagging"
-- 
2.32.0


