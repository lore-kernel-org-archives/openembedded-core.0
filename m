Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED46C3A589
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.6485.1649733225106029209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 20:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lT5PVWGH;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so1438480pja.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 20:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVBwhXSskk7Ja/dnf9TgUrb0SkGeoHq5yOUjkzD8SJQ=;
        b=lT5PVWGHM5R7BA3Bws4CD08gZgo1vi+/rDSb/3eNeEQvqD5zc8N125pwdCWIQZcPhp
         Zu74j5qa3FyTsbQ4rc43shYmStAOHzF0r9gqPR/vybC0pbN5fRaPJnkonlhoFAt2UiVK
         UC4l185IN041ZK3qz0a2bkMg/GApO+dGLG+QSh9p2tYCBCHedmGHyG1iXGkc4JMVnaCO
         qx9o1WJBLXGH80xU3LLKBhhWqiQWBWtuFkz4mUemxbZrbrn0edfHx5gtS9acq8SMt9o4
         rPc+JXCo/j60HDLNQ4V2LIP7/V67KG/9lkzJX4+gYPZxe87H5oLoZxt64TNHSvDcNlZW
         DIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVBwhXSskk7Ja/dnf9TgUrb0SkGeoHq5yOUjkzD8SJQ=;
        b=BDHNwJe8RcAovwEkvJ2sdhxlvsVwEj0yjz77NL1boqpfRvJW2mlQga8j3tXzUjw/+E
         ktMDx+x5BHW53SeB6hJR/379BjBrz96aLMneTkWosEA/HUYpxlIYJekwVWoW5G3YO0yX
         oc9WQT0OmDRpoygiTwbDCMK0vM6lfJwPjYTfbz1wcUMxUOdQHmjvZl1yydSYosxxe+nS
         FXhyxcrVGd4FrKc2hAyvGLBbzpk9lITd+hUZ7wpkoApXX+/D/4o9S0Ic5EXHqGhjbl4Z
         jYrN9awapjAhLe9c6/zCvyUPEmjDihIuno2O9t9//qSFGLWVDklAtzVALTB4hEAYtHuv
         dmBw==
X-Gm-Message-State: AOAM533VwXhAr8zlQOvc1bSTicBKk8P+plLopn5u7bIpvI/t36p081aW
	HmZA9DFl6ZLfU46ldQqOwGqdw0HdnyTOeQ==
X-Google-Smtp-Source: 
 ABdhPJySHPLsYZd6qOvZV2ETyZi7kqGLAL8e/2cSvCxmZrLhJS3A4TGWZdHvUzl6ircLGosl/+L50A==
X-Received: by 2002:a17:90a:9901:b0:1cb:aa19:5eee with SMTP id
 b1-20020a17090a990100b001cbaa195eeemr2639509pjp.158.1649733223920;
        Mon, 11 Apr 2022 20:13:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a17090ad3c400b001c65ba76911sm873046pjw.3.2022.04.11.20.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 20:13:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] gnupg: Disable FORTIFY_SOURCES on mips
Date: Mon, 11 Apr 2022 20:13:40 -0700
Message-Id: <20220412031341.594068-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164250

This is a workaround for issue reported with gcc12 [1]

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105234

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnupg/gnupg_2.3.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.4.bb b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
index 81361d902ce..d27bddb8bd9 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
@@ -83,3 +83,6 @@ PACKAGECONFIG[gnutls] = "--enable-gnutls, --disable-gnutls, gnutls"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
 
 BBCLASSEXTEND = "native nativesdk"
+
+lcl_maybe_fortify:mipsarch = ""
+
-- 
2.35.1


