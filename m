Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA225C433F5
	for <webhook@archiver.kernel.org>; Sun, 26 Sep 2021 13:36:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.18681.1632663376678442957
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 06:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EMradjJN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id s21so3464860wra.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gWTzh4NbN8Qv6WzJa5zy+Uq/sK79fRam/09TjPZzgqg=;
        b=EMradjJNv6UWSu/045r7LYjnukyNHnsDwC8ahAPisMbU324BFRo1vw0QPxCSAAqlyi
         GupVdlsefg2pLhwD1ySSZIXG35gvMLu9pdcsHuHCOuNH+Y8kmWOLqTUi6NCMAk9L0WUs
         qXzLCseuHQIyKV9xOujBrXqQewbSFoeZgCmeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gWTzh4NbN8Qv6WzJa5zy+Uq/sK79fRam/09TjPZzgqg=;
        b=6hXO4rep88yhOhbgPIexDsjJafBcRNxJgAr6AHKP09nj/ifdUb0AVUicwgncee4+LV
         X3gfMvzqZmMOXE3csgge+2RhBOXnOFbmKgfrg5A1fU/56XOwg1HM9qlyn9s2YZRoDfZV
         VUVM9ftypIJnO/EarE4JYyiuzDPVtXSAE7rNr9u93M2J4uftBsB6ML4bOZgedt+qhNOt
         twwGIqk30Dk4LKoymbHlTy6xDMcwSdU/ROLrWdLnicz82pOjW89Rd+W64Q64M/2sFwsD
         ZaWD9Pkrc2AbmSnMWnmQH+7FvqCjjx+3obAkj2GeijQ9y0Xjb8xwBAMxvlZPsAHAGtVv
         4vaw==
X-Gm-Message-State: AOAM531tnkdeckhDOxMGB8Cu8+W22VckxU3m8MpUEwn3RLpbrIrnXOnH
	XnUCOLjcv4CDEM5tVRIjEueiibAmmvNSUVeZ
X-Google-Smtp-Source: 
 ABdhPJy56As4NWBInZJwQ0K8g5FHDFBwbdm1gy+Nm0y9bPMsDckkfB3YbDFm+e3oRh43gEFttxTaQQ==
X-Received: by 2002:adf:e101:: with SMTP id t1mr597364wrz.395.1632663375197;
        Sun, 26 Sep 2021 06:36:15 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ea95:6e9a:b58c:3d3e])
        by smtp.gmail.com with ESMTPSA id
 d5sm14331069wra.38.2021.09.26.06.36.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 06:36:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libc_package/buildstats: Fix python regex quoting warnings
Date: Sun, 26 Sep 2021 14:36:14 +0100
Message-Id: <20210926133614.2011452-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Sep 2021 13:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156362

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/libc-package.bbclass | 2 +-
 meta/lib/buildstats.py            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 7a661d44bdb..13ef8cdc0df 100644
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
index 8627ed3c314..c52b6c3b72c 100644
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
2.32.0


