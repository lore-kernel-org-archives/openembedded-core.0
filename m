Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E489C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 11:21:55 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27892.1786965708497105870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 04:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ciYrvlbk;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b00d083818so4031139e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786965706; x=1787570506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8yBz4EmB+GmKu1avINSCc+BWigC87GcZptcOTKWHzA=;
        b=ciYrvlbkVvGTL/aKEi1FNgjzjj0TXRl4Wi6A9Robb1EepPYAS+zJtE8WSmdfNajvAl
         wvIjI408+y0tvpkJDFYIMSx5uZJwFoDPQMhTPMJJUg603EC7quVRwJYLQq0h3x62wPbp
         leLo1AKTXEgMyHf4O7Pv5+w8qnJmPB81VDAli0AEOBlqs7+ev9tHgvpFWLacqtH7gXLQ
         nQOwxWxcUAcIHxOHgdKyBdMo3NR9M5qW5CpCkVzBEP5WZlMQoMGpWkisIYqCggO6Pvrd
         FglDx4opZ7XXt8y5wZNLngp9oDq1JqsmQ89OeS94CS+KTF7QTa9iE/PB/Bgn8Zn/Hvwv
         IkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965706; x=1787570506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8yBz4EmB+GmKu1avINSCc+BWigC87GcZptcOTKWHzA=;
        b=YSZMhrjcZLnv0USKzg4Sp2cuhTU8YEqP/e/5K53U0jJ+xjZjd3wb803G9I4HQqsmvK
         uNcCsvZHvqtGlYZVgTrIv58hrXnkLiDak/azEZiO7p7rYMPt/WnqwZfoJHb4sK+hljiL
         bQe//zJ+UEiag6qP3mlhn3LKolsN0KnLk/jarx5hfEJ9trjF041ytFism6oHIi2w3X/v
         xLrO4XgAvlH2fXaNpYjXuSgfQoYnzVwpapFSR3IPTiZ/KXb6BhyjseJYNr2dC8QejGN5
         OQas8Nt0fZsKcNeRM5IuSFDrDlZud6KHmZxs27ToogwuMJs8EFDqQMm9LI6ZQF8mjsll
         7y9g==
X-Gm-Message-State: AOJu0Yz0wh+TEa0lQ18kPrDDN5swa3UgoezP22gAc0KJd3Ei2LbyilLd
	hFJFSgAQYunstsKfYMNYIuHZFDlRIYSP05dZai6ZvkqjNOzy3x+1gBrM4HzBNHv3UjXFRsstYIr
	+F3Qd
X-Gm-Gg: AR+sD13+pOzPLlshsBXIW38E3/2TngEtZdGxnQYCebxpZX1cyTK5756EKKZxGWkZSza
	5GV/n/0hRqhIQmrbWrdgYcWr8kBKMxgzXEBK4eRjDkqb4YOedBoPfx6Z+FjgZykJwuRZhQYNlpl
	9nL4yhE5XhPs9QWPQ8eYPXiqVtChAph8ikMphSSuSsNkQo13B5lYy5bM+QKnnf6use+9xfAwh2a
	26Uw++ugbZTCZQjINkdY1NfRr6CIa3SKMmFA5Ar1m9VIAp/k0oC+kW+7o2oV6hZayhNPNgwMkBc
	7SOB1ik2EhxxYw2SBrLlhQa3s8Lm6NEZS9kW3GOqWm4E94+Y2g+XZNRF4+/6rWWWbbFRIZ7EGWq
	CDBROT3sbRpsclcdAr/tDhjj8Vf2gCwntaOM29plZ6VDoA3YOU9C6orqcUlJkZ6lg3dhnBElK2A
	2DqILJmlmICuFLOY8UoTt/JA+LHjjBOS+RCQyBtxQsFGAsbZd0/xs5+bNE5OgaolqNI+DlsLgli
	GL1Gb0fk+K2WuM=
X-Received: by 2002:a05:6512:3d86:b0:5ae:a4a4:b6ca with SMTP id 2adb3069b0e04-5b458f58c59mr4618944e87.14.1786965706401;
        Mon, 17 Aug 2026 04:21:46 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa0e5esm318180e87.25.2026.08.17.04.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:21:46 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v2 4/4] kernel-devsrc: copy kernel/sched/ext/ext.h
Date: Mon, 17 Aug 2026 14:21:29 +0300
Message-ID: <20260817112129.1271154-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
References: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243617

ext.h etc files were moved to new subdir in upstream commit
bba2c3615bd sched_ext: Move sources under kernel/sched/ext/

Fixes oeqa kernelmodule.py failure with 7.2 kernel:

  CC      kernel/sched/rq-offsets.s
In file included from kernel/sched/rq-offsets.c:5:
kernel/sched/sched.h:4214:10: fatal error: ext/ext.h: No such file or directory
 4214 | #include "ext/ext.h"
      |          ^~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
make[1]: *** [/usr/lib/modules/7.2.0-rc7-yoctodev-standard/build/Makefile:1408: prepare0] Error 2

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
 1 file changed, 3 insertions(+)

v2: only copy ext/ext.h not the whole kernel/sched/ext directory since
    this is enough to fix the build issue

v1: https://lists.openembedded.org/g/openembedded-core/message/243422

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index a70399cc95..4ae121eb62 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -368,6 +368,9 @@ do_install() {
         cp -a --parents kernel/sched/ext.h $kerneldir/build 2>/dev/null || :
         cp -a --parents kernel/workqueue_internal.h $kerneldir/build 2>/dev/null || :
 
+        # 7.1+
+        cp -a --parents kernel/sched/ext/ext.h $kerneldir/build 2>/dev/null || :
+
         if [ "${ARCH}" = "mips" ]; then
             cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
             cp --parents $(find -type f -name "Platform") $kerneldir/build
-- 
2.55.0


