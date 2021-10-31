Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3197DC433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:29 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.33164.1635699508730617523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Fe+0pLhX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id l1so7742846pfu.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iEqLshpqhQo+eIIveOXxMfXWOKnckpSrtvFAAvQROC8=;
        b=Fe+0pLhXW1uhrqfc1qD4yKGgYDIgCegcX7nY28FJiOkvz9WbAyV9lHI99aB2KE5WMw
         iscVhl3QrKBo1AEt8dZwX96r+/5fmxbPWQRlbPWvSVMUYZDE/YvGawPyRV+yaPiIyhaL
         0HudV75j5ynlt7F34a6coy6DFY89970NsuoSb3KHhzEN1XKBbfNKgmH2e4KKBw1na5Hj
         vcwMcvID6e/gpBD7gfEWdFogAPphfnMiWOWea6B4T8HytIhdgH7Gm3b1TCTSK4ftI/MC
         64KL80iwFisp2pGOX6nRVa7N+7WJLrIZelfVI3iEKAvIRin2T9NBBerFzXPOO9JInK9k
         je4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iEqLshpqhQo+eIIveOXxMfXWOKnckpSrtvFAAvQROC8=;
        b=apeDZlaiLMIRXcbUZ5/a4ocxL3lw973eXPWQsezFHva0o9MhJf/ERh4DESwfs7YCe3
         WI5yCZmbVfeYeI3Hm/DaS1LYMxOLfxGcQRj0cfPgDDSW2dqXsMysKXgdzUYlJEhLw30k
         uokRvwnLtp/kq7F2Yx36YdRfchv9PJkxcPXTkiWqcye7Huj4Y+pBlUhIA3ZxzYSlQDfX
         xZEk4IvQ8FV/RRxuWY1IvH9Lhj/iVgy2fSBmz+4BhmqhraubZti5LIuMEbJdAj0T//0S
         r2Lk3Jnkkk4ioxkIJJgV1xo1iOJaYrGa07ePrCXeX2g1GrWo7xM9pRqXI2oPIXHXrIXt
         Ta6g==
X-Gm-Message-State: AOAM533bI9gdPlwE1BBvmJfH8vgbZ1SijptxrxuBL0R8U+oJjF8Xdrt2
	tFnv6mnje6f9L0Yi2vpiDaogrowuTnFD6CwsWjc=
X-Google-Smtp-Source: 
 ABdhPJxOhlv0F/5CgqDiAc94AqhormD59UXUdejBcuaO7ZmNv9bKFstJffCiNIXnSNn0lhMKByFaJg==
X-Received: by 2002:a63:2cd8:: with SMTP id
 s207mr17831964pgs.312.1635699507871;
        Sun, 31 Oct 2021 09:58:27 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/29] patch: Use repr() with exceptions instead of
 str()
Date: Sun, 31 Oct 2021 06:57:32 -1000
Message-Id: 
 <a77ad75e5addaebe3b5850361a0b3cb8dc432225.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157671

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This gives more meaningful errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b285796b618623289992faea1282f1822335239)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/patch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 484d27ac76..6a19ae3e73 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -150,12 +150,12 @@ python patch_do_patch() {
             patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
         except Exception as exc:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (parm['patchname'], parm['striplevel'], str(exc)))
+            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (parm['patchname'], parm['striplevel'], repr(exc)))
         try:
             resolver.Resolve()
         except bb.BBHandledException as e:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, str(e)))
+            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, repr(e)))
 
     bb.utils.remove(process_tmpdir, True)
     del os.environ['TMPDIR']
-- 
2.25.1


