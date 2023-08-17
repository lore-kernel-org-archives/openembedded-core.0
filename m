Return-Path: <jtilahun@astranis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15850C5ACA1
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 20:22:48 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.4106.1692303763290210372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 13:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@astranis.com header.s=google header.b=oEMfYpdf;
 spf=pass (domain: astranis.com, ip: 209.85.210.175, mailfrom: jtilahun@astranis.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-689e8115f8dso170592b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 13:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=astranis.com; s=google; t=1692303762; x=1692908562;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HKYzx+QS0iWlLnkXS02SgeowZyQwPPMvDBsUvMT1UKY=;
        b=oEMfYpdferAANQ5f9yJ+4r4UefBbM+9C/ZS8NknnsIz7Xl94nOB4vGZITfD0lf7GEN
         lg9DpuBYi9YH1l+xJ3L1AuA/LabgzP22LYh0EsbAl9JUAYxPiAPfBOwzg67nSVW8hk+D
         1jdUMU+hSOStL9mzm6OWNJXZNncdCyQ21eTQ/ugQuLATo6YPK5RoqOp5BJv65YdHqj4Y
         +W9zozalI+ItSeqILb79w1zWNsX9a/4JLAhPhWbSqNW+oL0w8D9hP64hyNPDrhmdiscJ
         HpH5OA7kQEpK4KvDM+vuyBX4MbPlMvXpsV9SJvfi+Ir+66mMJCylYfPsTehU5ph3vQPw
         DOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692303762; x=1692908562;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HKYzx+QS0iWlLnkXS02SgeowZyQwPPMvDBsUvMT1UKY=;
        b=gXyy/08BgKTkj97HVrnHZjAexrfn7tbDFxhdETIUYu35XG1XuhlIPIbwJFUhJEuA4T
         465hwYUtIvEH7mjceKC8FXL8klQe8mfA7upHAOc2Pj8WEJCisA2XNQOPzqlVt1esryj2
         yCnNNGC2QnuI0MG3deyYvm0d42PkB5wDgkoDRxyg68WFqXAR6pFNT1AVatkas8hHEnTb
         8CEu/U4tYqIqfJOIsn/veQ0SVnFrJoTYo5sduhqYJSXpi2F+ODfAR5IZEsVsQMOZb2Qd
         fIHA/nq6I8tvDhAc79S6+y3KccTqJhmyahSyzo2DBgK9hchIHnVM9tjK3Dh9lJtF2kzi
         zCog==
X-Gm-Message-State: AOJu0YwPkHYujOBMA5sSNlRJh0XWeOzyv2xxRmyJ/tUuolAeBQyEdIga
	TkPzf28xFUcIWye+zMtOKSsRAA/b22FsYN2soUvBlXUhzWWjR4580SpdjO4A4B1fhjxnblwFt9C
	2e7oi2S7b0ZSfC/rk2lbc0V3QUp1mEIt5QxHVw535b0Ml0sH0OrJDnWGx1jNzyy/AhzIH/Fbfbw
	Ox25mF6mZLeluFSlELZjlG4enEZPx9
X-Google-Smtp-Source: AGHT+IG0tvC7LvBfnjqqWG9xYnFlonWZzl3ZvwTHWt3mPzLGNtYNl+AesihHL4sDn7CE270mfjt5Kw==
X-Received: by 2002:a05:6a00:2393:b0:688:4a14:a802 with SMTP id f19-20020a056a00239300b006884a14a802mr703859pfc.22.1692303762533;
        Thu, 17 Aug 2023 13:22:42 -0700 (PDT)
Received: from JTN86G3.corp.astranis.com ([4.7.92.102])
        by smtp.gmail.com with ESMTPSA id x52-20020a056a000bf400b0068883728c16sm161946pfu.144.2023.08.17.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 13:22:42 -0700 (PDT)
From: jtilahun@astranis.com
To: openembedded-core@lists.openembedded.org
Cc: Joseph Tilahun <jtilahun@astranis.com>
Subject: [PATCH] scripts: use the monotonic clock to compute time elapsed
Date: Thu, 17 Aug 2023 13:22:05 -0700
Message-Id: <20230817202205.519957-1-jtilahun@astranis.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 20:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186342

From: Joseph Tilahun <jtilahun@astranis.com>

The monotonic clock is preferable over the system clock when
computing the time elapsed.

Signed-off-by: Joseph Tilahun <jtilahun@astranis.com>
---
 scripts/oe-pkgdata-browser | 4 ++--
 scripts/runqemu            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index c152c82b25..727803ba93 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -29,10 +29,10 @@ FileColumns = enum.IntEnum("FileColumns", {"Filename": 0, "Size": 1})
 import time
 def timeit(f):
     def timed(*args, **kw):
-        ts = time.time()
+        ts = time.monotonic()
         print ("func:%r calling" % f.__name__)
         result = f(*args, **kw)
-        te = time.time()
+        te = time.monotonic()
         print ('func:%r args:[%r, %r] took: %2.4f sec' % \
           (f.__name__, args, kw, te-ts))
         return result
diff --git a/scripts/runqemu b/scripts/runqemu
index 0e105a918b..d3c0b3fc38 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1252,9 +1252,9 @@ to your build configuration.
         if self.snapshot and tmpfsdir:
             newrootfs = os.path.join(tmpfsdir, os.path.basename(self.rootfs)) + "." + str(os.getpid())
             logger.info("Copying rootfs to %s" % newrootfs)
-            copy_start = time.time()
+            copy_start = time.monotonic()
             shutil.copyfile(self.rootfs, newrootfs)
-            logger.info("Copy done in %s seconds" % (time.time() - copy_start))
+            logger.info("Copy done in %s seconds" % (time.monotonic() - copy_start))
             self.rootfs = newrootfs
             # Don't need a second copy now!
             self.snapshot = False
-- 
2.25.1


-- 


________
This email and any attachments may contain Astranis confidential 
and/or proprietary information governed by a non-disclosure agreement, and 
are intended solely for the individual or entity specified by the message.

