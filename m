Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C30D66BBF
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:17 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.64672.1732680731201563546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WcpkOXK7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-724e7d5d5b2so4730530b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680730; x=1733285530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWuOyCgrBrh3EN0Cps5LUohtDFWhmI5daNF56h0sHOo=;
        b=WcpkOXK7VVGk3IscvKzX2K7rOqL4F4JGI0zkSySgErS4/IojNlp/+NDmqNYQxGhMPs
         JEl340xutt89KPMKMmZy7jBhSUVqtYe1nR6bvzGLvUvJpgZ+UxDxNK1EJ0Cd57jJyosk
         /UxaTU7oo69eDe26IM+TQNzWHq9LyytFh21IaYtY9hfTfdM9BorQ+Z1EAEATC0/DIKU4
         rL53FI05fibGxFqXMil1wGGm5CYymAb4V6haKuRP7FeTtGrG8+yjs6aX9Rr+hwcqW8BI
         2913ewxhXMve62FxiLJNMuW7fBKBAZvnlF0chwBseQThI5qga650QipBH2K1tMjLKBex
         +HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680730; x=1733285530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWuOyCgrBrh3EN0Cps5LUohtDFWhmI5daNF56h0sHOo=;
        b=iW73wXCAPB7ZwucFUq//kM2YUydPuJMOzyK0WYPall3/Z6BhrU7gRwLiY7FNDfFoJx
         Gsh5baB9HfPh7KzHOkya4dNKWwQ4Y8N6GlBHRjXvG75KnBh1pi+TGNIB9olrob5KcLAQ
         C2W+e3l5H1OSJS3ToLlYgNFvtQyYjucKKqdKZIhW2UVNgcELi6dOmBQvjR/ZgYCGX6gB
         IGosi01TkoF/DtP3bbJx2bfj3E1Cw006iuuGFvRS5XhSy5JPpcsa4DdGniosBssSyhmH
         dBR8NGXGwykA7m0gKFMGagsKrIecVE7KtHIFVQv2p08DZJktRmtShE8EU/CowqFqkz3U
         zi4g==
X-Gm-Message-State: AOJu0YwHcceLurMyj/AFjf9DDv76I6TzaKsWa2OBVw18V6WXtAub15KH
	XK3ddyUUQz/lfNmCFcMRV6rCroGGHjygeQqV//LywCdhOzUHZaLlEvB8ur+ZY6CVLAdczSEzqlM
	L
X-Gm-Gg: ASbGncuO+PgQK5OqOmItiVnaMgObuIMH43CQVfd3XU27MCMmF3YUX2Zj1XCFr/x0LaI
	03I1VhnY1usq81KugPHIAD8kcG5ygU+4uc9upTD2rYBNa/KClCmmQR9sE6VRrwseVpFqu+kU2R4
	mavelPQ+/9fvI+zYS6xPSW+Utchm1NmumELH27U6Aq4OylBycNiQ9Yd/07YP1wSeWMwWAYpoWyA
	C7xpZSBMUCCEkyC0GgonFS0tnkmb5Hw+AuQa94=
X-Google-Smtp-Source: AGHT+IEx6H57LGA3O4OkvgJl9NnobF4iCfIVl9xL75UTQUaqpql/oPmDEgJNSF1hFNQ7Vk+iI3+Jvw==
X-Received: by 2002:a05:6a00:230b:b0:724:f86e:e3d9 with SMTP id d2e1a72fcca58-72530045af1mr2244554b3a.14.1732680730185;
        Tue, 26 Nov 2024 20:12:10 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 12/18] shadow: use update-alternatives to handle groups.1
Date: Tue, 26 Nov 2024 20:11:32 -0800
Message-Id: <822d70b7ccc2e5922de99a7703ec7eb3f814e29f.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207906

From: Chen Qi <Qi.Chen@windriver.com>

This patch fixes the following error at do_rootfs:

  update-alternatives: Error: not linking /PATH/TO/rootfs/usr/share
  /man/man1/groups.1 to /usr/share/man/man1/groups.1.coreutils since
  /PATH/TO/rootfs/usr/share/man/man1/groups.1 exists and is not a link

The problem can be reproduced by adding the following lines to local.conf
and then building an image:

  EXTRA_IMAGE_FEATURES:append = " doc-pkgs"
  IMAGE_INSTALL:append = " shadow coreutils"

groups.1 is handled by update-alternatives in coreutils recipe, so
do it in shadow recipe too.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 78c8eb60097df2e16c699464c39ff9142fc1ae69)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/shadow.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index b5e77b9874..171d6e27c3 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -200,9 +200,10 @@ ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
-ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1"
+ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1"
 ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
 ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
+ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
 
 ALTERNATIVE:${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
-- 
2.34.1


