Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D4BECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:54 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.51794.1661624781364166147
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Vnbrqzgi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id y127so4544792pfy.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=b4p6WJkMMb1E7l49rXjxHX2mgUZTmuVWiwPonYe774w=;
        b=VnbrqzgihQMu6V4UQMxsFn7S4iWYFdy+2ImDu/4wsvQ1W2fGoYZWJH5EVpfWRQqK7y
         6vCeIJGRjZWOM58RoJ5p6IcfJhEwWPnB33c84QcwAopIGm+rLzO2G6BCI6oep6hiD9qf
         5FFx41hjjy0B/ciLo1Cfoei+rIkzUeLePx0FKftA/6a5abtjCHKSYsQj+rGRE0UeqzeO
         CbJTI79mVAE1DV+/CtAjUkwqHCOzlwxPz+c4VTOGHqVWc5k7Pft2c3SHlHMJo2adQUf+
         LLjfcX5pcfyPzpSt8K36lg5bgfPC1V5pI8VzBS2Q5k1646e4SshS+ANfThyctNBEi/RJ
         jArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=b4p6WJkMMb1E7l49rXjxHX2mgUZTmuVWiwPonYe774w=;
        b=ZeDl3RRBL2EiQBcG4kqE0aE3EwXSgLOygSEDJpgQRRFU6SkMouERSPT/hgwU/TzOce
         bb3yMzm5LXRwWzLYlr2gU8NwS+ABciaVDu2Z/To+eMYBtkEFJLfgH4iKq56agjW2oeh3
         R2N6DW5DhNIUevP5JlKlMBO6ujcrfuLQ2ehY/efZIi6iUbFYLJlNT13xtDKsLZoR5J7e
         n4B1Y+9dGFCIOh8iAz+QM2geB4hjpoxhpq8zKRYZehmdcRP2ygYd3RFLSR5WhhMESYl2
         jloKWjdnmjrdAScThc4Tlv+zWjN4RHvyZif+tPH2H+PXKUv18XI4W0QxMXb1oAOZXGEe
         DIvw==
X-Gm-Message-State: ACgBeo22U64XOnZFRzaud6zFvy8pKHlL24scEkVVK9hbG4lciOwWQBXK
	VNeTpv7jpcQ7aFDwqCN9vcPChbKBFKUQOnw6
X-Google-Smtp-Source: 
 AA6agR59fa7Aswgog/XQnIsAvsLyytt9GdGlIXAIqfi4D/8dqNlvzdh5g8RXo5a6REdWetKy28hFxw==
X-Received: by 2002:a05:6a00:1909:b0:536:65dd:44ca with SMTP id
 y9-20020a056a00190900b0053665dd44camr9492966pfi.1.1661624809620;
        Sat, 27 Aug 2022 11:26:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/24] wic: add target tools to PATH when
 executing native commands
Date: Sat, 27 Aug 2022 08:25:46 -1000
Message-Id: 
 <5f4ad4575e5c660081a7058b1421da36cfc5676a.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169963

From: Ross Burton <ross.burton@arm.com>

We might want to run a cross tool, such as objcopy, in wic.  These are
in a TARGET_SYS/ subdirectory under /usr/bin, so add that directory to
the search path too.

(From OE-Core rev: c523549141e5c31edc75281f581d97867b7d251d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/misc.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 3e11822996..a8aab6c524 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -140,11 +140,12 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
         cmd_and_args = pseudo + cmd_and_args
 
     hosttools_dir = get_bitbake_var("HOSTTOOLS_DIR")
+    target_sys = get_bitbake_var("TARGET_SYS")
 
-    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/bin:%s" % \
+    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/usr/bin/%s:%s/bin:%s" % \
                    (native_sysroot, native_sysroot,
-                    native_sysroot, native_sysroot,
-                    hosttools_dir)
+                    native_sysroot, native_sysroot, target_sys,
+                    native_sysroot, hosttools_dir)
 
     native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
                    (native_paths, cmd_and_args)
-- 
2.25.1


