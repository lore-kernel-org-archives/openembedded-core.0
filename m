Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3150DC433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:31 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.32836.1635699510725962069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EHyoAVdW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 o10-20020a17090a3d4a00b001a6555878a8so2903057pjf.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tYkjgPgryagG+2YN5csBaZN/kL3CzaPuTy75x64/trQ=;
        b=EHyoAVdWTh1L87DteDhDXLRBuMlaDpCGUMM69Z95u9LRhzVfQ/cMxb3WE1SNqK7vHH
         jLxXl/AWIIkvEba6dmN+HUtM9lnyEArMRXjezGvZIV+6JeIRukX9TmvSieXT/0u1l2uQ
         06zehzMYKwOKMuwRHSpZu1rHr7H6mzJQIxKxuU2Up9ZEZAeTkr8zkALaQ16xvXjkju22
         K8A0D6swdXKCa1rs7ClsUHw7M4Y9DXHCqpmzCA3p96/KRTZr499kxv6k6Os/Y8O+ZgUA
         VxrUvZeTSDTI8U360PXrJ/f8uoMthTCGo7n7B9meQ2wQ5z3rQ6lIYYDlacGsNxIwnJGZ
         iQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tYkjgPgryagG+2YN5csBaZN/kL3CzaPuTy75x64/trQ=;
        b=yRh3vm8kNkteEpqs9Mqpm5kKMuy0mgc2tUNQtea3VKmDqSEmFeCtYTpCaLAsaHiKmf
         0lBSMzedXOcGpNjGwZyl2azg1y/sk2bSIET0pyK/czN+t1PUzOJRI+jkhOWeXuXU0rR4
         cFk9jAQOxNLwXT8cc5AsxNlsrerPYVKU4hikwOxE410CBLF1CJ2ALwWUG/1DEcSnlGrX
         d67uX+EgLdqSReTH/T1EeC1XZwzfK7Hr1/eGMymlhegaUKLwb5HXXJzA2HKiz/nGhe/U
         oG6jqypEec4scwPAYrHUZgSjfYGLAU0aNtjila/JWBuXfyF9ED5Kxlzj71LQuyoG5AiL
         SEIA==
X-Gm-Message-State: AOAM531MReHkDO/C/mJu5K7esJ7olJNsoY0uGzV6NBi9BxQhbvds2uUl
	AE19ET8lLeQT2CybOhvDgfF4CTc0zTxCb06RE9U=
X-Google-Smtp-Source: 
 ABdhPJw0Or4QZSgG4os5dHFrr/7zaCaN2Qj4DHg3LH5vi+vpYpqyg/QrHa2jiPMM2COv4uvDWbZ5TA==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr32205035pjb.40.1635699509773;
        Sun, 31 Oct 2021 09:58:29 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/29] testimage: fix unclosed testdata file
Date: Sun, 31 Oct 2021 06:57:33 -1000
Message-Id: 
 <cb87431d6eb72db0258babf2703950dd31dd8c1d.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157672

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c192a97e3e1c015a48667d6903cc07a8b2620e4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testimage.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index db1d54e5cb..b1aef626f7 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -229,9 +229,10 @@ def testimage_main(d):
 
     tdname = "%s.testdata.json" % image_name
     try:
-        td = json.load(open(tdname, "r"))
-    except (FileNotFoundError) as err:
-         bb.fatal('File %s Not Found. Have you built the image with INHERIT+="testimage" in the conf/local.conf?' % tdname)
+        with open(tdname, "r") as f:
+            td = json.load(f)
+    except FileNotFoundError as err:
+        bb.fatal('File %s not found (%s).\nHave you built the image with INHERIT += "testimage" in the conf/local.conf?' % (tdname, err))
 
     # Some variables need to be updates (mostly paths) with the
     # ones of the current environment because some tests require them.
-- 
2.25.1


