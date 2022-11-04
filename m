Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93835C43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:47 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.7183.1667530907099797209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=l1w/cBjO;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id gw22so3403426pjb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTQr5umrNnr+M0hqjAL3yxgvB5FgDq8KzdyLKf6dxb8=;
        b=l1w/cBjOvowZi0z6EAN4A+lz4kUOLMIg8HtwUMUJkJrCo9A+glqdiAB5uco5CFMEVf
         8I1GyirmWVQn7J3m36eskGvl1kQzTEMLZR62U2y8vIL/kOF826cgefTLQH/Wbiw2xein
         meSut+ZDCeLBqugvUBVFf7rsDoREzB+aVcDk2OIxJkp92e7S8A/PVM2DxH41RGzIFpCy
         PtLo7mM01Gfs1yZ8JcuQ8Dp8i2JtDUzQLLF6iCqvbirwJDalb4Es8uBnX6pvVVHNRu4T
         NI02GE2R9I61yKtP6jEaegBW4S7xpy0hyNC9aluC/Vf0scvIeJl17BVyYi/S8hwKKYz/
         vnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTQr5umrNnr+M0hqjAL3yxgvB5FgDq8KzdyLKf6dxb8=;
        b=vTAacg5ybj3mhJpbvLc90Isr/kfUPl9XUz60Oo10UYGM+GErz/j8A/ZUScLcV5rK/4
         SSjd4YaNrbHqoomoWkkdFIITRYhtiU0J+zrAdhMtUHRJs0RTXTE5Pydeg9hv7e/q/F7M
         XU9L4T89FFFsTV8+uQUnIGx4KANhy4UZESpfgMriYFfkMC68qOLDBLAV0o5a4MVF/aCn
         oBRFDQ62Bt9HJ7ATJHYQqRqTEQn94iAhOc0nSm9WbahMFDUkl3q0t5g+dCmd/+5jFEPA
         y1wGS5GiCmh15mG5PBXerqYwlD3GsYUjrh6VFwvIBNLtRh6XwJ4mfg7hVaXAoEYPT/5L
         DkUw==
X-Gm-Message-State: ACrzQf2oXqH46Q2J8tgdWKAiItDdmqYeKSUAA91kBMQm7U/iewRqxSmM
	9qYX8WY8DCgq0x06w6fiD5Wq5zBUOKZz1bGc
X-Google-Smtp-Source: AMsMyM4IhKMzzRZbgPq+3BRare3cqb6oFjcWABgtYYl8OAYYYPjg2M3N4FIj5SmISkSbRSCaa/bL0g==
X-Received: by 2002:a17:90a:1a44:b0:215:d520:f5a1 with SMTP id 4-20020a17090a1a4400b00215d520f5a1mr10096109pjl.182.1667530906169;
        Thu, 03 Nov 2022 20:01:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/31] scripts/oe-check-sstate: force build to run for all targets, specifically populate_sysroot
Date: Thu,  3 Nov 2022 17:00:49 -1000
Message-Id: <fa15ca349972746d11e372c08830a2510dcfeaa0.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172675

From: Ross Burton <ross.burton@arm.com>

Since the commit "populate_sdk_base/images: Drop use of 'meta' class and
hence do_build dependencies"[1], builds of images or SDKs don't
recursively depend on the top-level do_build target.  This is typically
a good thing: images just depend on the packages themselves and those
dependencies already exist, but they don't need each recipes sysroot to
be populated.

However, eSDK generation is partly done via the script oe-check-sstate,
which does a 'dry-run' build of the target and collates all of the
sstate that is used.  With this commit the sstate that is used is a
fraction of what would be needed in the SDK, specifically there are no
sysroots populated during the build, so there are no sysroots in the
SDK.

This is obviously a problem, as the entire point of an eSDK is to
contain a sysroot.  Resolve this problem by forcing bitbake to run the
build task for all targets, so that all potentially needed sstate is
collated.

[YOCTO #14626]

[1] https://github.com/openembedded/openembedded-core/commit/41d7f1aa2cc9ef5dba4db38435402d4c9c0a63e1

Tested-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b62344f919b5122f048b6409d09386d7d6dd3cd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-check-sstate | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index 7f9f835da4..4187e77458 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -50,7 +50,7 @@ def check(args):
             env['TMPDIR:forcevariable'] = tmpdir
 
         try:
-            cmd = ['bitbake', '--dry-run'] + args.target
+            cmd = ['bitbake', '--dry-run', '--runall=build'] + args.target
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, env=env)
 
             task_re = re.compile('NOTE: Running setscene task [0-9]+ of [0-9]+ \(([^)]+)\)')
-- 
2.25.1


