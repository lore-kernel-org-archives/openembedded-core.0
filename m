Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175D5C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:25 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.10087.1633357284028076459
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=tkuGBCts;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so62182pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MwUpXdh8NJ2QheNf9UzHan0DXM1T1c/GftHwzSaU91A=;
        b=tkuGBCtsZ6HVN3ecR8Z5IaDKHMqne5tOVsNbm1QUQ7YVw3DZAby4O1GczcS5ax6dP0
         1lBDB9rxMnmlXQvNuGJaiqeaaBuItsH/FIDJmYnRbEHEFXBgRbnJtcyQwTdM9rFV8n1h
         d4s4E10BhU3VMG4PWb+y+Y9PdBKDAEBCAZ4VteEgXpXtjJDQ6NxTLS17TeAdiwTPbeIl
         +8Lb82o3b5W5SQfXyNYd4WZ2K1rkE6tzLyf12DrvyUlHgVd4wn/lAxny5AjiD4cYXyus
         tUnNcBPkzflQ8LGgtIE7FBd9UojY6BqTlKz4HhVqKZ8M6w/M5CaujkalVSogqZuGgVYE
         IwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MwUpXdh8NJ2QheNf9UzHan0DXM1T1c/GftHwzSaU91A=;
        b=NMp2ormHghmIdHXe8z/91DHvaeMDdbIt22kqK35scANqDubyFzOg7vSQCn2EdLwGTV
         EhpVPUR88rJjCI8/ROlcGke0yXXhRg1eXnXfxw1V0tQqROZ2YJ/Hc2rd0Ha9dCjIyuQP
         95eOcdVOqHStgUmtmvljR2TthDxYZZXG3mc1G3fwX8aDFRgrBTaoeRwRB5eNRcioCtoQ
         zUGICHDvDyViYewxLzFkR/Msl0/xRs/4Fx+SfvcdhXgj4kL7NkTI5t7G7KrguelW6GjC
         7iUB1dlxhq4cHql5QztJDFMBJa87lbSZDv4ai7NbSL2+5sjI3Ev5zUHudb34gIn6KXQK
         kMbQ==
X-Gm-Message-State: AOAM532drjkoH1ZTdLSz954VOReOL4qW0Brf2ftw22/NQm7m0Coj32hh
	BBp4gq/KKGQB7J1f5wz2p3u/0Q7IY9f83ruzLGA=
X-Google-Smtp-Source: 
 ABdhPJwXLtGQN6WFH5/4eyXB1/UMTeEb11hMDMAdH/tb2ICyInPbijf7WnEAaxjmUX2RN0EsW0oNYA==
X-Received: by 2002:a17:902:8549:b0:13e:85eb:3967 with SMTP id
 d9-20020a170902854900b0013e85eb3967mr17443497plo.80.1633357283133;
        Mon, 04 Oct 2021 07:21:23 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/15] libc_package/buildstats: Fix python regex
 quoting warnings
Date: Mon,  4 Oct 2021 04:18:39 -1000
Message-Id: 
 <dd705fccfb35f9d3fee1452a5145d4e7ad24999d.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156604

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a8077317ce12e13018ec4472f728dd24880bda9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/libc-package.bbclass | 2 +-
 meta/lib/buildstats.py            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index de3b4250c7..1143f538d6 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -355,7 +355,7 @@ python package_do_split_gconvs () {
                 m.write("\t@echo 'Progress %d/%d'\n" % (i, total))
                 m.write("\t" + makerecipe + "\n\n")
         d.setVar("EXTRA_OEMAKE", "-C %s ${PARALLEL_MAKE}" % (os.path.dirname(makefile)))
-        d.setVarFlag("oe_runmake", "progress", "outof:Progress\s(\d+)/(\d+)")
+        d.setVarFlag("oe_runmake", "progress", r"outof:Progress\s(\d+)/(\d+)")
         bb.note("Executing binary locale generation makefile")
         bb.build.exec_func("oe_runmake", d)
         bb.note("collecting binary locales from locale tree")
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 8627ed3c31..c52b6c3b72 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -43,8 +43,8 @@ class SystemStats:
         # depends on the heartbeat event, which fires less often.
         self.min_seconds = 1
 
-        self.meminfo_regex = re.compile(b'^(MemTotal|MemFree|Buffers|Cached|SwapTotal|SwapFree):\s*(\d+)')
-        self.diskstats_regex = re.compile(b'^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
+        self.meminfo_regex = re.compile(rb'^(MemTotal|MemFree|Buffers|Cached|SwapTotal|SwapFree):\s*(\d+)')
+        self.diskstats_regex = re.compile(rb'^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
         self.diskstats_ltime = None
         self.diskstats_data = None
         self.stat_ltimes = None
-- 
2.25.1


