Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2F2C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:49:08 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web10.2588.1685558945199571008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 11:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jKP6ZaIb;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-43932736509so3603458137.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 11:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558944; x=1688150944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf4Uznz8tvra+BPXVUUWRAGVvsvauZ0NH6dwXWtvtq4=;
        b=jKP6ZaIbJprb/gIyUTtqSvTB1Rz/ne2lAxYKFdgwVkYWndZVO7JFWFDvhqe0UpbLh3
         01pyupJIVIIurJlEV+ugOoBKUSsLnJ2l7xF+S18DstA0Jb0JPCnii9+eCogtAf2oc3s4
         wIC5rvEzsrqhaTVJzEwlJh4NPvN0Y5+IVqxGlmFB9UgW2d4kOpj8k36WGIWRmfatAdaU
         IgNvC1i4ZLvfN6FeSKXq9jCqiYc60W0WzOrQOE6pHRC32azklkxnTq5dC4rfJqfvmOEn
         JrZa7EOvBYxgqrVR+k9E3vaRZ4THCAVS6Uu0DaVbFhpspFPzCQTzluGmPbKY2h04eNsX
         aQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558944; x=1688150944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lf4Uznz8tvra+BPXVUUWRAGVvsvauZ0NH6dwXWtvtq4=;
        b=H8ZN62bLoQIU0qO6ZYCJjBQdW2MQTNgJD5gyJF0KFf3gC4dI0SAdeBVog8L9Le6Us2
         u1Eoy5m1h7tHLwtwy10yERsXzrN/rO6xBgMydteko3y5MOPaCKaqKs6ULEdzFqPjW/LS
         u3kND5yMav4dvC4E9ONtdvY2qKGGlxS2V0sBpLMYRkVTZFKVO9x3zOyIU8LiRZ2BCQIy
         sIJyHJSgFbx4Tpd/+Plt8+Tq7n1bOPkIV2Rs9ETvaQG0HWTkXhZyuDnDEGiwqP9Rqxju
         IVDHEDSs+vCOY3u8uu1EY7+fHfFq9dSrRVB8vNFj+48AB5BKh6jwLYEpnYd08EtTWxRM
         Uswg==
X-Gm-Message-State: AC+VfDxZ4c2207RbyFfMVOwKUe4SNi04+hTKfR5l8B2/89FGbSfPNaFu
	5LbOO+rTfHmeswbyV5Yb37c=
X-Google-Smtp-Source: ACHHUZ7oqB0p37O2XS9cD2h0fG9gAWzZB36XKlZ6cAQoDuE4zFOFbIzpys+0o6pbybstf5e+7weQng==
X-Received: by 2002:a67:ad18:0:b0:434:9021:30c1 with SMTP id t24-20020a67ad18000000b00434902130c1mr2758538vsl.14.1685558944109;
        Wed, 31 May 2023 11:49:04 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e16-20020a0cf750000000b006257e64474asm3926645qvo.113.2023.05.31.11.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 11:49:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel/linux-yocto: consolidated pull request
Date: Wed, 31 May 2023 14:48:52 -0400
Message-Id: <cover.1685558432.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182023

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's my consolidated queue. I've had some of these in testing for quite
a while, as I didn't want to send them right before release or before my
vacation last week.

Most are -stable updates to 6.1 and finally bumping the -dev recipe to
show that we've been testing 6.4 for quite some time.

The make-mod-scripts rmwork fix was discussed at lenght on the list, and
has been tested by myself and people seeing the issues. But with all the
races and issues we've seen in that area for years, I'll keep a close eye
out for AB issues.

I've factored things a bit around enabling PAHOLE, I don't expect it
to cause issues since it isn't on by default .. but you never know with
these sorts of changes.

I also have a bump for the refernece BSPs (sent to the appropriate
list shortly) and a documentation commit for the PAHOLE tweaks (also
sent to that list shortly, once we agree on the this change).

Bruce

The following changes since commit ca12fac112f1a6c1d5c7ea692a2914a2f3f671e4:

  selftest: wic.py respect IMAGE_LINK_NAME (2023-05-29 13:42:56 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  make-mod-scripts: force static linking and make dependencies explicit
  linux-yocto/6.1: update to v6.1.26
  linux-yocto/6.1: update to v6.1.27
  linux-yocto-dev: bump to v6.4+
  kernel: don't force PAHOLE=false
  linux-yocto: move build / debug dependencies to .inc
  linux-yocto/6.1: update to v6.1.28
  linux-yocto/6.1: update to v6.1.29
  linux-yocto/6.1: update to v6.1.30

 meta/classes-recipe/kernel.bbclass            |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto.inc     | 10 ++++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 32 ++++++++-----------
 .../make-mod-scripts/make-mod-scripts_1.0.bb  | 30 +++++++++++++++--
 7 files changed, 58 insertions(+), 32 deletions(-)

-- 
2.34.1


