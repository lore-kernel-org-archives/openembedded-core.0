Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D95CF436BB
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 16:10:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48872.1776442192700212528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 09:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qkXxcAb8;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so6257625e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 09:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776442191; x=1777046991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ud1P8aSygvnc4jUZzJFbWlE2K5ZhFhHnnU1daBzNiiI=;
        b=qkXxcAb8NQc/Jv2Q2Wt4Zh57+6iXqaabOseTPuQX3/KprVkQiVPQATyKyC+HwnYeWC
         u3bqVMFrpdQUFZIQJMAkefU7miW0qsJSJhI1XgAU4f4kp7YN50xtVRAI65VYP/5cx7ak
         K+htiS0xetmG6Fn68g1aX3ID0XE35ZwzRB9pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776442191; x=1777046991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ud1P8aSygvnc4jUZzJFbWlE2K5ZhFhHnnU1daBzNiiI=;
        b=mtO0awm49+N+ISzsU/nkT7IhF2Wxv5fvM+LkEHcgxXZ5cXVNV+lDgQuAobcMWvnDUq
         8nzoFxDZYyKvpJTsJa4zMLew606dMV4DGWC7bFClvih2iYd+6Jh1ADfzIiFhP2PQmqUt
         KjXayLezyc0CMGEJuh1dd90CvZCnVOXYOyvnEE+rTXtF/SoRLpPhBw2oi+DiCPcV65Os
         rSaTl2jZZM9FjOwygx+Cesou/QFiB4FiNDDf6YxXpVtE8G70UWTJCYnOIXhyEvnx6Mwp
         yTkrTka1hTFD6uopBI4/aD2dMQoa3IByV6uXh6O0A3hTH964UHkFLf19V+y13YekZaOL
         Rhuw==
X-Gm-Message-State: AOJu0YxFegYSQqcV0bC39sqPrz08zb/HSy5UCllhDuqMhkXdENK9z/h/
	ObAeOEFOhpvny7Y5q0jQ/H8cE2et4yNVFdh9VIssRZVjJ61mUdkuH26xxm5g3SFos6B5TIpg/r8
	zwKMS6Lo=
X-Gm-Gg: AeBDievxnrvfyOH9K0HlkxGxb7qV1iQ6Aah5ywOAptKgPJt5RJ4MyBKz3Gs+bBVbz7j
	qdVOaBKhQH2yZehRJNwIMshqlT9fHMZxNzjqhYl/TKsGz/TqMfIS32AQtJEWgHAfB4ex1rF1Spn
	O88vqRocwNkJh6b/RWh5oOkc8t2+nu+70NMxOtWU8yCDw6WsmBpMmsYQblFyvoadQLLnn3V9o8n
	mO9exLOeXevlyTiGWOGJJcIdjNPCH0RLc13lIDQRMboT9zf08vHRDQMKrFL4O9Fgj2hbtVvNjbG
	5VyYyli0VXRwcMpsdpIJcbanbpDjnS72nrH3pgF4Agz5eOPc2nE+MRZ0k6o3CrGUoy/W7WV6rLL
	OlHNVQyWEI04yNjqWyXj4bNwtBwgOP6ZGdenOTksbpJg/kS8xI5Lfbs28VL3VaZxyPp9e6U2qTu
	fzqP7VGfhr7U44vTR4OZU1O7wHvsaHkhDgsoDjzA==
X-Received: by 2002:a05:600c:4e16:b0:488:d6eb:e63a with SMTP id 5b1f17b1804b1-488fb76fe73mr52781595e9.14.1776442190939;
        Fri, 17 Apr 2026 09:09:50 -0700 (PDT)
Received: from heaven ([2a01:e0a:2c:37e0:31a6:f161:bbe5:6cec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc177dafsm69192945e9.4.2026.04.17.09.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:09:50 -0700 (PDT)
From: corentin.guillevic@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH] sanity: add check for own-mirrors/SOURCE_MIRROR_URL
Date: Fri, 17 Apr 2026 18:09:25 +0200
Message-ID: <20260417160925.339720-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 16:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235508

From: Corentin Guillevic <corentin.guillevic@smile.fr>

The SOURCE_MIRROR_URL variable belongs to  the own-mirrors class. However, the
user may forget to define it. This will cause the class to inject incorrect
content into PREMIRRORS, resulting in the following error:

ERROR: gettext-minimal-native-1.0-r0 do_fetch: Bitbake Fetcher Error: MalformedUrl('${SOURCE_MIRROR_URL}')
ERROR: Logfile of failure stored in: /path/to/tmp/work/x86_64-linux/gettext-minimal-native/1.0/temp/log.do_fetch.258066
ERROR: Task (/path/to/layers/poky/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_fetch) failed with exit code '1'

Add a check to the sanity class, to detect this case and raise an error.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/classes-global/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1a490f8d61..b24cec7f2c 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -984,6 +984,11 @@ def check_sanity_everybuild(status, d):
             "Please set TMPDIR to a clean path with no trailing slash or "
             "consecutive slashes (e.g. %s).\n" % (tmpdir, os.path.normpath(tmpdir)))
 
+    # Check whether the SOURCE_MIRROR_URL variable, belonging to the 'own-mirrors' class, is defined
+    inheritlist = d.getVar('INHERIT')
+    if "own-mirrors" in inheritlist.split(" ") and not d.getVar('SOURCE_MIRROR_URL'):
+        bb.fatal("own-mirrors is enabled, but SOURCE_MIRROR_URL is not defined")
+
     # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
     import re
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
-- 
2.51.0


