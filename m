Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.5712.1601501965579806811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 14:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O8eOcCAN;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id p21so316563pju.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 14:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sSVNHvrbk1q6GHfoEXTZqLWBChoG7Jg2aLOOtM/zenk=;
        b=O8eOcCANtmbyb0QlQF3FbUArnZTWSPUJsPgGZAY0GX4Ri1yJkueZ7G+rH8i2jPjhkr
         iM3oq0oBHdKMG+EHwwudPPZzmh0/nj8iN5Rkg1EK6MMd9EbZknlYm5Wuzf7yGTnYlkVc
         Ma8CTfFdxuWC34Hw0tuKPLSOPrVyS/jtEXsINPbKeCIOj6OKZ2Ca8midujp13TL1WIST
         V1HaY4U76qVnt5ZOsxopdQ0WTljkO7bBJi8w47sNmRshXg3FLyGRn7DHykyrZLV4LB7v
         Poix80MKJxt7BmUMCFnxgPdfwS1BbB6wxh4pYYjxoQvEYxTPvvRJLwmEDCCCyMcMYJ+/
         37IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sSVNHvrbk1q6GHfoEXTZqLWBChoG7Jg2aLOOtM/zenk=;
        b=baN+i//mw1hXTwhHhUUJbmTN69zsa5nXuvsBDKxIiIju9cjpYDHbZ/5ALBfjJWXNG9
         tUUNdlwHxiPagXgKKOJ0uQ9m58nFeXIOjoVy5pUIMrwdfOjYTqH8J5B2CMEJ/3ugMFEt
         R1Kc7r5mGFifOedRCvUgBsmAkZMRF17yaiWOOBMPGxkEdXYBBhr4hHKPVYKjRMaHWlnU
         79QZvk6A47d4M4fqQeEUW70jnVvIZORCh+y/GgSmCQvbOOlPiQbWy4XDeT7qknnj8/Yh
         Yfz8MGsMgwUGPNohhfzk5uPTPqy++gMNnhxOVZh+ltSpdzgVzVQxEoAh9yxdGeY3OpKJ
         6Mrg==
X-Gm-Message-State: AOAM530NwzSqbb9cZbPX221Fs3cVPwJfV0ZL161aXAE4R6TkLJt7oDiF
	HdF6Sdz5aTyh+ff2p80Y8T/7+pUoy7p5tg==
X-Google-Smtp-Source: ABdhPJwl/7qiTZABAhIYBmR9Z/GKhjoQJXonsgqmhFCscWPTUhzTgjKGsTbM8Mqgoh+4URnMpNYnAA==
X-Received: by 2002:a17:90a:f187:: with SMTP id bv7mr3881844pjb.63.1601501964885;
        Wed, 30 Sep 2020 14:39:24 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:d879:d540:4522:d2a1])
        by smtp.gmail.com with ESMTPSA id s20sm3389524pfu.112.2020.09.30.14.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 14:39:24 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH] oeqa/selftest/cases/devtool.py: avoid .pyc race
Date: Wed, 30 Sep 2020 14:39:18 -0700
Message-Id: <20200930213918.30229-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

In certain conditions, most likely under heavy load on the
AutoBuilder, the prebuilt .pyc files are attempting to be
executed before they have been completely copied. Avoid
this by not copying the .pyc files (nor the __pycache__
directory). The impact of python3-native recreating the .pyc
files should hopefully be negligible.

YOCTO#13421
YOCTO#13803

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---

This has already been merged to 3.2 tree and as a bug fix
qualifies for backport to dunfell/3.1

 meta/lib/oeqa/selftest/cases/devtool.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5003f08c75f..d8bf4aea081 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -56,7 +56,8 @@ def setUpModule():
                     if pth.startswith(canonical_layerpath):
                         if relpth.endswith('/'):
                             destdir = os.path.join(corecopydir, relpth)
-                            shutil.copytree(pth, destdir)
+                            # avoid race condition by not copying .pyc files YPBZ#13421,13803
+                            shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
                         else:
                             destdir = os.path.join(corecopydir, os.path.dirname(relpth))
                             bb.utils.mkdirhier(destdir)
-- 
2.25.0

