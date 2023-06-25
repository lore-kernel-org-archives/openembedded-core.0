Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619F4C0015E
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.20354.1687728176031003696
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pcG7VoY1;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3094910b150so3199367f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728174; x=1690320174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEkCwwabmnqnKbt0Tq3ss+JES3VVrKPlsNqH53Ud2DA=;
        b=pcG7VoY1EBNmKgZxkYTr0b8r5h7bMBji+dAqSCGHif5a6BLbZ0QeIur0gxFuOSgkb5
         J6dkxN5w/hubjtiunB8EmOnohril0Sjdt0D1FeYdZqO3f7jPacsy+uf4L9csWH1KFvBy
         gBJ647SlgwST9BFWfhu88/t16KfcRigb/T1nEUL1hhPWYLqtSf3Yzx8ZRNU86LuRi1Oe
         kqIAjWbf+eMcl0+j2gdWAG3Ts2lSHpfr3wlxZjc6Qg+rAkpWps+nr5Ymw1CQZkkj/fj5
         xUU678L8zW4oBDeX2IaIEFQ0T5tWw6hYp6igIZMKij5sMYE6AiBa+JhQ035+NRqM6zDj
         I5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728174; x=1690320174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEkCwwabmnqnKbt0Tq3ss+JES3VVrKPlsNqH53Ud2DA=;
        b=dQX8vHJilhD/L58uf3txTIrUj5Fj9hL7M2b8PZGHNdYaTUXVXIqpoUHeX7GtdvHu3Q
         kSXSBqcnq/2YIyE38HdhdseWhbKHu/XFHt0BViHNmM8+42R/RnvEbTt1LwIxeG5JMBSt
         6DRIw1aRNBdfpDbemF5aCAJgr7ufiV0ivL1zSallC/wIZmnKh43uRLr49WVnuFtPa7Ee
         /gNByUg8vqVGi7rsB7XJ8q8g6Kg/AgD4htP1WpI1vzBNygfPL1sRvC4KeLLoZAPO5D7w
         VAwYyDMfqLCBzDZQCsvGsxfkU0QIfa32kX0cFcQ2CM3xh9BuZsfzO1Nv75u9ybc1DJTB
         7fLw==
X-Gm-Message-State: AC+VfDxJnzCmrLz9qaRxWX3N0hITOfY6jgyt5hB7ijh9E62rtdP7R5QB
	ADcEEbmhcri0SzjAzDwBLJQCKR7IHAwkHA==
X-Google-Smtp-Source: ACHHUZ4tZt3qmn/PkPoFSUpRebGG1dF1PqRoiPwcarIyXGOSwXkoEaAtofwA5tPrkbCVKZBiZcku0Q==
X-Received: by 2002:adf:e507:0:b0:30f:bc98:ede1 with SMTP id j7-20020adfe507000000b0030fbc98ede1mr23222512wrm.8.1687728174472;
        Sun, 25 Jun 2023 14:22:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/21] libproxy: fetch from git
Date: Sun, 25 Jun 2023 23:22:39 +0200
Message-Id: <20230625212241.915739-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183394

Upstream no longer provides tarballs for newer versions.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libproxy/libproxy_0.4.18.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.18.bb b/meta/recipes-support/libproxy/libproxy_0.4.18.bb
index 01ba2a6fe92..748b1bd2c04 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.18.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.18.bb
@@ -12,10 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "69b5856e9ea42c38ac77e6b8c92ffc86a71d341fef74e77bef85f9cc6c47a4b1"
+SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
+SRCREV = "caccaf28e3df6ea612d2d4b39f781c4324019fdb"
+S = "${WORKDIR}/git"
 
-inherit cmake pkgconfig github-releases
+inherit cmake pkgconfig
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gnome', '', d)} gnome3"
 PACKAGECONFIG[gnome] = "-DWITH_GNOME=yes,-DWITH_GNOME=no,gconf"
-- 
2.30.2


