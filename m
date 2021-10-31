Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46271C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:11 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.33161.1635699490183072361
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TN1BELHq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id b4so7995082pgh.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UC3Fuv6W0f1qgIPZRqt3hRC7JCGnF+4QEw7dTHxWnYY=;
        b=TN1BELHqQBUxHWatfA7NxHDzJL/TARJ8fon0g56kXazSFgywudZUSwfujKKkzkClxz
         HR4LYTvfdIRVzzjiu41eNnPttDgeK5EINTgS++YGImD/gdBK5drJOgtol5X64cfzA2F5
         x4ylMFGlGyEO8uJ6kmNOGX/qXg0WUnnJZCr1033fIxzVwbetvuwkSXle3sFoFHNOTGdj
         nd8PtpKDwxNbhPf9aHWNI7gROF9VLb7+TdjcjIfwt8uB18F+qqp2ytuMDaGKYH2FyWo0
         7H83RXpfC9VgpIXC5rgelf9pXvBgdZ+JTkEoc8u9TFsNwBJCUhTpyztqnzK+NXzd9qsK
         0Kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UC3Fuv6W0f1qgIPZRqt3hRC7JCGnF+4QEw7dTHxWnYY=;
        b=CpvB8zCB8PY/gdvZB4N920Pnw7V7KY7K7RPSw93fAOM/zPP8EjbKr7nqbUjNbCpWW2
         oQlWDlpzYuEDFTRF2QGSvt2+ygppfKBa1iuPlLL7pzka3LQ/z10k7OrTnFoZtdj/hife
         9PpRkXatGynT+UykHvcxZT79Lyo1Kmn6WV2Xn7TOaxuifGNFV6Ugje2M6jtiVaaUegHD
         k1FBbxQUNvSmsOZ1suuHNArMQ0FWIiAB48axm10ikCSZxERcQ2zQABOteJ44uVR+uQzQ
         a4FTLNKc+kDhYx0eOuUKAo3ClWyyW82soyjTKzBIGVNCEgFY23afj3Z2pKXxYzIsuQXi
         7nLQ==
X-Gm-Message-State: AOAM5321Xzlko9IkgCNMXeTQEsbwRnRy121csa5EHahzw3+i4cNUHIka
	MOHVRpRG4poLbMaSMYUMGPtT2c+EpkRpEyF+J2U=
X-Google-Smtp-Source: 
 ABdhPJyMcBOUpM211l2rJiyaoyLhwiBLmdrAH7pprqG22YaaoC09JehCJcwHVo56dO6tR6St0Y1S9Q==
X-Received: by 2002:aa7:848a:0:b0:47f:d648:2df4 with SMTP id
 u10-20020aa7848a000000b0047fd6482df4mr11864702pfn.63.1635699489135;
        Sun, 31 Oct 2021 09:58:09 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/29] devtool: fix modify with patches in override
 directories
Date: Sun, 31 Oct 2021 06:57:23 -1000
Message-Id: 
 <b20699229671ef37daac8b0ed1133aacb477f6a0.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157662

From: Ross Burton <ross@burtonini.com>

If a recipe applies patches which are in machine-specific override
directories, devtool will fail to fetch the patches that don't match the
default configuration.  For example where there are patches at
qemux86/x86.patch and qemuarm/arm.patch:

SRC_URI = "file://source"
SRC_URI_append_qemuarm = " file://arm.patch"
SRC_URI_append_qemux86 = " file://x86.patch"

The patch apply phase sets OVERRIDES but does not set FILESOVERRIDES, so
it cannot find the patch files as the search path isn't correct.  Fix
this by setting FILESOVERRIDES too.

Also when iterating through the overrides we need to be sure that other
overrides that are used are not enabled, so extend no_overrides instead of
simply appending the current override.

Fixes most but not all of [ YOCTO #14060 ].

(From OE-Core rev: a372cdf8e175423c47faeecc98ad076ee26bbec8)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a35bcc9d164ac038a31356a15a0f61ccdd38be2)
Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/devtool-source.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 280d6009f3..41900e651f 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -199,6 +199,7 @@ python devtool_post_patch() {
             # Run do_patch function with the override applied
             localdata = bb.data.createCopy(d)
             localdata.setVar('OVERRIDES', ':'.join(no_overrides))
+            localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides))
             bb.build.exec_func('do_patch', localdata)
             rm_patches()
             # Now we need to reconcile the dev branch with the no-overrides one
@@ -216,7 +217,8 @@ python devtool_post_patch() {
                 # Reset back to the initial commit on a new branch
                 bb.process.run('git checkout %s -b devtool-override-%s' % (initial_rev, override), cwd=srcsubdir)
                 # Run do_patch function with the override applied
-                localdata.appendVar('OVERRIDES', ':%s' % override)
+                localdata.setVar('OVERRIDES', ':'.join(no_overrides + [override]))
+                localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides + [override]))
                 bb.build.exec_func('do_patch', localdata)
                 rm_patches()
                 # Now we need to reconcile the new branch with the no-overrides one
-- 
2.25.1


