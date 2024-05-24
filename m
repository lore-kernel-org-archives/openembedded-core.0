Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F9AC25B7C
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 16:00:42 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.19521.1716566439814104227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 09:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IyWEZSFb;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a5d67064885so873483366b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 09:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716566438; x=1717171238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2zfsx4rjYgyP2FJrz4eFEdbGa7KCk+GrN0dq3hnGnQ=;
        b=IyWEZSFbtiaRHY8lOOX+RDzS/muetxcoSDd51NG30z1mlPHT1o3W5bvuHTvLCQdz6B
         b+R6YgJ9WJJPh1rN/qxKg0fEqUGixBMqO7dVBoEbjpEbmAsjfyzN1ziRFSOAKoM80PBF
         hpP3uCHjTVZYVg/lfBSuZggGJEoltBKzFGh0aBEbcENwmawwj+VFwC1Av/y7ImD+QNOl
         kF8vFVE9WROD4vaOXuxptJU08PvJ+0CAvXD5daSU5GMlavcFA0mAeiXzWB6tTftxxBK7
         JqFRPiWeVJeMM4XVc3garFSEEcNLpKz6uJOb1AoJvucQ40C3XjNcGCOLsBzMlhKz71V3
         QXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716566438; x=1717171238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2zfsx4rjYgyP2FJrz4eFEdbGa7KCk+GrN0dq3hnGnQ=;
        b=t3TuzL0AYlankPiDChU26D9G8iodVm+GoKMsJ9pD6zaBuEQx0jBbq2Zgs7//A3fqSD
         Djap4N9X5jzOapn4YVnl6FN+p2HgqLRryZpZFvWxR72nnrYIbxehntjporqolR0z6ueq
         a9J5TlVMBVsPjJCCmLeCj5EiQ4IQ1utGqQ29F2FGMCFA6s6UOLz6XF+7vGB4yP9Y4Ayr
         aCAbkFcSe0wmSDwmD72dJ80f3jb5zVXB92EWHVVSSuQmCz42ADWi2PSzCz/CFt7Mkqmd
         cZlCUbuGDpK9emn1YbrnWmhk5TI7wFGu9/Yj6G7vDczqPBZqr6OvhgakdZAYs8uJd/we
         DWYQ==
X-Gm-Message-State: AOJu0Yxlw1Re3Gkp7t9gT+4nAqtelWpXUTqIiHspF/puOAm3gSb2Dy7Z
	lsT9KRcj22KnqmcTDR8pDlwD9qbzCdVUAGt/1wa/vt5MZ0d82qO3WLXA3Q==
X-Google-Smtp-Source: AGHT+IE9ik3yXHGG8ZZe1AZB/hBP707k5vVlLwUXgryIl/IHgG6st4ITQFh4rhUfzJrv48MczZ/j7g==
X-Received: by 2002:a17:906:4550:b0:a59:bbf0:88f0 with SMTP id a640c23a62f3a-a62642e4eeamr269731566b.18.1716566437861;
        Fri, 24 May 2024 09:00:37 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c938828sm149710566b.81.2024.05.24.09.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 09:00:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESEND][PATCH] insane: add patch-status to default ERROR_QA
Date: Fri, 24 May 2024 18:00:25 +0200
Message-ID: <20240524160025.275450-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 16:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199853

* it's enabled for patches in oe-core for very long time and I was using
  it for many other layers as well, so most layers should be in good
  shape

* it's also possible to disable it for individual layer as shown
  by oe-core in:
  https://git.openembedded.org/openembedded-core/commit/meta/classes-global/insane.bbclass?h=scarthgap&id=61a881fdbe8b5a21c6276b8a5d06cc30486b1eb3

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
Resend https://patchwork.yoctoproject.org/project/oe-core/patch/20240314070903.83765-1-martin.jansa@gmail.com/
now when scarthgap is released and master is open for development

 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 99736830b9..6d2f83c6f7 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -45,11 +45,10 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz \
+            patch-fuzz patch-status \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
-ERROR_QA:append:layer-core = " patch-status"
 WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
 
 FAKEROOT_QA = "host-user-contaminated"
-- 
2.45.1


