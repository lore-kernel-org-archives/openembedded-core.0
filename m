Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6A3C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:27 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.6209.1636603765858079498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0TE6BV1q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id gt5so3224810pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yCXlC//hYIRX7D6Warxi6KnOaPcBLkX5tLqAEV9XrNw=;
        b=0TE6BV1qyXqN/pO6pN9MYBouqgjqMwFzuFVjlALKQ/bHVJwKhv172gN5DL6uJkMfj6
         RNrqN7E9ivh/tvqltPlMjdKibVSGiOt7tuIvL8feQ4IXEh75/exgjy2zArAG0pAeA6J7
         ze8asctI+AQPl9v4PUX7r1+KuZNVy0OJ2ZMiha2guOUFSvnL9hyzmYAobguy+lbCoZ/E
         2EIVo9mpwEL8Sok28vgdyJR5VcX/u2sQLEai0cIzEIqe4rsBLdrN8sTJr4K7fWG4I2NN
         XcBxMtep4rSWD7ikMiXcizXsQk02s4SPTEYy3CbaKF/XqsFYwnkvhiLBpJMSNJDlj8OG
         HPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yCXlC//hYIRX7D6Warxi6KnOaPcBLkX5tLqAEV9XrNw=;
        b=kaE3mziZULcGKRtMH5tefMHnyODM3Vo/SjzAHs0KW2M849qunMSjLf+9fVg1nDww8X
         B/HyzHmCLlku8UC90oyxtji+Cb1esq4/waolre81sFGGONCHAaWyT1mSkxkkwi34vTLY
         iJD1pLgfo1JFYCAB+32in7P7V7owtecA+3AOq2xVHI01zL1y4RrchsbmV1/ztJPqvbX/
         hQL/N+MsPK7klAlyGEBIHMNLp72wQtrHzxX9a0panbv9iiSrfCgCFGdg392Bp8u8I/Ow
         ZH82xFufuZyqIZpPmUHGH7tWsTRK/Lj970qB+OiCbwqRHzL5lR75xds9nBt42TPWpgvL
         SnoQ==
X-Gm-Message-State: AOAM531s1C0bd/9rye/eM0bV02YU5tFnH1V+akAnuRGIJLha03yopPKQ
	L0e4bAk7l/d1r6wpFAu95X2XFq0n0cx0NiFZOXM=
X-Google-Smtp-Source: 
 ABdhPJzgsGuIkX8EbHeLyezqhsfzLLnBIfonoQsGhnpBHYGfS1fZglN5Tx1ooYgo+0huZ12CfH3piw==
X-Received: by 2002:a17:90a:a513:: with SMTP id
 a19mr23412336pjq.26.1636603764789;
        Wed, 10 Nov 2021 20:09:24 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] sstate: Ensure SDE is accounted for in
 package task timestamps
Date: Wed, 10 Nov 2021 18:08:36 -1000
Message-Id: 
 <06b8f2a5a24be1a87f0eaf29fdba719ebe3bb06e.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158143

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When creating packages we build them with --clamp-mtime and use
SOURCE_DATE_EPOCH as the maximum mtime. This makes the end packages
reproducible. The data stored in sstate for do_package and the package
task doesn't benefit from this though and have varying timestamps.
This means their outhash varies and means hash equivalance isn't
effective at all and doesn't work as intended/desired.

We could create the sstate archives with the same clamping however
that would lead to different results depending on whether a task was
installed from sstate or not. Making that differ is a path to madness.
It also wouldn't fix the outhash of the task to be determninistic
without clamping of the date in the hash calculation code.

Instead, iterate over the files in sstate output and clamp them at
the code level. This isn't ideal but does make the file timestamps
determnistic everywhere and means we don't have to change the hash
calculation code.

This issue can be clearly seen looking at the do_package outhash for
a recipe which you then re-run the package task for after adding
something like whitespace to the install task. The outhash shouldn't
change but currently does.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c3b3cc4745811b48b9193f83889946b2e1788932)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 930d87424f..50d44398f9 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -640,10 +640,21 @@ python sstate_hardcode_path () {
 
 def sstate_package(ss, d):
     import oe.path
+    import time
 
     tmpdir = d.getVar('TMPDIR')
 
+    fixtime = False
+    if ss['task'] == "package":
+        fixtime = True
+
+    def fixtimestamp(root, path):
+        f = os.path.join(root, path)
+        if os.lstat(f).st_mtime > sde:
+            os.utime(f, (sde, sde), follow_symlinks=False)
+
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
+    sde = int(d.getVar("SOURCE_DATE_EPOCH") or time.time())
     d.setVar("SSTATE_CURRTASK", ss['task'])
     bb.utils.remove(sstatebuild, recurse=True)
     bb.utils.mkdirhier(sstatebuild)
@@ -656,6 +667,8 @@ def sstate_package(ss, d):
         # to sstate tasks but there aren't many of these so better just avoid them entirely.
         for walkroot, dirs, files in os.walk(state[1]):
             for file in files + dirs:
+                if fixtime:
+                    fixtimestamp(walkroot, file)
                 srcpath = os.path.join(walkroot, file)
                 if not os.path.islink(srcpath):
                     continue
@@ -677,6 +690,11 @@ def sstate_package(ss, d):
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
         os.rename(plain, pdir)
+        if fixtime:
+            fixtimestamp(pdir, "")
+            for walkroot, dirs, files in os.walk(pdir):
+                for file in files + dirs:
+                    fixtimestamp(walkroot, file)
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
-- 
2.25.1


