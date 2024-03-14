Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED64AC5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 07:09:23 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.6578.1710400156642275503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 00:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Al8DAHKg;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so812217a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710400155; x=1711004955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+/eYb8P2d5WBlskUPwkXRMAFqyCrKycqXmBZqSX8Jrw=;
        b=Al8DAHKgBTo5oibvaEKc3RFwLZDeIjQuAjt6F37v+oOqQ/+9ohUdUuf5S6m9dzFkCP
         8m0qUNmr6oDmLw7mK+twZRjHUG9czjqe3XxJKcAV5ahKKWn+oOSUnmXgJbLFyyVF0d/B
         A1JIeCpFM4WbqPdgepw4+KTQFh4QTpHzXmofCR4zAnkiKDg0EJHudP7BDsaEsWDzz3/D
         BazdupN4N1x9275W6oyYkMgNICI1EyECQF7GlHmQ0wc5r/q0hWyFqImd3EuJHQsDcCGY
         vtuGbl7XhZVLWcLSkuEiT9QyZaRkcqId1kFF2qkDj4a/GesnkuHL3bcH/dTawEAFygjc
         2lWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710400155; x=1711004955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/eYb8P2d5WBlskUPwkXRMAFqyCrKycqXmBZqSX8Jrw=;
        b=dq7/vYHav2uuNSq3YkJvP37dFvJciDzaosdR6zzLrifUC3YCgi8Sp7Y6B4ARNb78e4
         SGExW0YngpkYf3jncIor0qYxThsfvJH7IAkxX1EoQf7QN8Emq3xntg8M4ygXb1B8Zryo
         6ONTmXyyi/ZlgqORBY4LUUQBe/8RmNa56W6lgdXK51Xrwygg1mYnI048hhvRCaOniDO0
         A/mYLYwTD0aXgEsypz+ICAy8YIZwkBNVy5Xuk/rmnLSXZ1JndbM7ZAsBzl1xjJoNbxAA
         AU5jxgUWnFhoBe6JUuo5lAT3gVlky1aEmqy9Qu09S8GonB1sQ2fgb4II9l2R7P9KDeQJ
         JjRQ==
X-Gm-Message-State: AOJu0Yx70i2QxBN3eARSW58JID0Y58rsHH9BBUOzHYSj3oj5zbMRQHls
	5aQYIaTZsVMzwpeeedYgRuMYdlYfrTVi8TImLTGF/U20EMRGJHLlg7rxt6/4
X-Google-Smtp-Source: AGHT+IF4PY5mTqx3FhIOzSIp4mmiRCSYomKyWEUBOJ5oaDNgUq8EzdKdsdtz0rufz/ugHwuP5Poq4g==
X-Received: by 2002:a05:6402:5485:b0:566:aa2:8433 with SMTP id fg5-20020a056402548500b005660aa28433mr473867edb.36.1710400154557;
        Thu, 14 Mar 2024 00:09:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m7-20020a056402430700b005687e041608sm391447edc.37.2024.03.14.00.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:09:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] insane: add patch-status to default ERROR_QA for all layers
Date: Thu, 14 Mar 2024 08:09:03 +0100
Message-ID: <20240314070903.83765-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 07:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197098

* it's enabled for patches in oe-core for very long time and I was using
  it for many other layers as well, so most layers should be in good
  shape

* it's also possible to disable it for individual layer as shown
  by oe-core in:
  https://git.openembedded.org/openembedded-core/commit/meta/classes-global/insane.bbclass?h=scarthgap&id=61a881fdbe8b5a21c6276b8a5d06cc30486b1eb3

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index e963001d09..9350bfa106 100644
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
2.44.0


