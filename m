Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4A0C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 05:50:45 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.11055.1711691440148919530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 22:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rpp3zFuZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1def89f0cfdso21558375ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 22:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711691439; x=1712296239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyCbplFAIrspfafpnsV5qFVtDi1H8WkU7+n+KavSLWY=;
        b=Rpp3zFuZQ/VYAccf4PIV+ywwDRsXkzWlR7f28qdLQVVlr8b9ZKTyKhX5BScVIQzYcE
         GrsjarH7kqB7dnH0a9q1F0HNULHbKxkiewvE3wYO3wwxS4q+b7pNU/i/64R6mca51Czl
         VMWSs8jZVhV80tTkXdM0NpPvIyX5y2oX9sBFiK4fvbJpPtKbIWw/g/C7zMTJjqOi7Wec
         XTAHevL4Gevt+VT0cXYOeeU/mbTA9/u+BYukcJnRtdS/XCyME3JaZoxNDkfnsETao0Wd
         36zfJz4c1rXQq1nNrUQPqBIjtUGR0PBrXMV6Zj8AfqWKEJT8z805keYPoLVRMKxBI6Yf
         O6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711691439; x=1712296239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyCbplFAIrspfafpnsV5qFVtDi1H8WkU7+n+KavSLWY=;
        b=Wmrq5rIgsAcBDg2iYr/S+pr7Kerd9cJT5VZOAsQ2yRh8tdOY0EBadx38HC/GYJO5tY
         tgYihoCYoL1mPlTKApNFmqrfzrJ5VO46GfBAXzw3Fmn8pQG/vJtN0kbeKYaynIB3iiPC
         CVjuQ9ZJItyTzxJQXzS2lX8dx9KHRM2WzXJN2fb+Y6sZHgqtB/EmkzgJiVYjfV+n7u6F
         NXDYdCFjgQhlIO/suglkpke8zDDGKq+HvgEY9NXVS0J5mKrKN6RGx3xhOmKHj04adVuI
         ViDUz13XakOXKEJVDsuVCedRt35r+dffCK0R+0uo8GT/yXB/3wjkMFFDc93GKwS0KwdR
         Yu/w==
X-Gm-Message-State: AOJu0Yx/geNJygA56bnIFIRAJilqp70HqxMbwxZJqD1Sfz8XgUaCVh0O
	hzex5bsIHn1Ee2NFS6wvklzXbHbb8xXLRb5fp3ekpWCEiFSr2NjU1V038gq/
X-Google-Smtp-Source: AGHT+IGlIDA/7JDM01sQbYwGko14kzD20Jo4Rz/7MJrdf8XEJUZwrWxJhrHMDKmXmrOQnhRivv1law==
X-Received: by 2002:a17:903:32ca:b0:1e0:b5e5:7291 with SMTP id i10-20020a17090332ca00b001e0b5e57291mr2048473plr.33.1711691439314;
        Thu, 28 Mar 2024 22:50:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::dfbb])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001e088a9e2bcsm2611573plt.292.2024.03.28.22.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 22:50:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] valgrind: Re-enable fixed test cases
Date: Thu, 28 Mar 2024 22:50:33 -0700
Message-ID: <20240329055034.3942360-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329055034.3942360-1-raj.khem@gmail.com>
References: <20240329055034.3942360-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 05:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197624

These tests have been fixed in prior to 3.22 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.22.0.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index 563d99f0e22..783ca3a72a5 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -243,12 +243,6 @@ do_install_ptest() {
     # https://bugs.kde.org/show_bug.cgi?id=402833
     rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest
 
-    # This is known failure see https://bugs.kde.org/show_bug.cgi?id=435732
-    rm ${D}${PTEST_PATH}/memcheck/tests/leak_cpp_interior.vgtest
-
-    # https://bugs.kde.org/show_bug.cgi?id=445743
-    rm ${D}${PTEST_PATH}/drd/tests/pth_mutex_signal
-
     # As the binary isn't stripped or debug-splitted, the source file isn't fetched
     # via dwarfsrcfiles either, so it needs to be installed manually.
     mkdir -p ${D}${TARGET_DBGSRC_DIR}/none/tests/
-- 
2.44.0


