Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D79BC433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.9633.1642084668475312573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=J1+b6J0R;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id e19so10221060plc.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1daHS/7DeWHSRA7SFVOGPq87+Wa/gq0Xukrn+Te6S9k=;
        b=J1+b6J0RW6k45r07+mPVI74D8KuBiz78PI/6bxBpbvdJcfPgahhAJ6jk1hdz6rdCXX
         kOwGfdMDPRpL/dy3uyulfQqD5rhQnxdgdAnrH7gv0PqxwBo5VYaMSAksk6b+KOvdDa14
         CYXo51xuUZjRY+di3S6LTwfi9YkKry6J6bLXgQtv1u4r4hEsv7ZJzfvuZDnUJGQ8PEZ/
         k6boe6hlwe37DShGzs3krYjz+OcPYmJtiyBIuxFzvHJ7jvyPDlKLREQYTVlNHsTqBbeX
         sTPXd3RSZAreWXuMULuIVH2zoo8IaghjXV9Puy0pythz3U3jchfX+9waQVP/FjEjMX2h
         sXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1daHS/7DeWHSRA7SFVOGPq87+Wa/gq0Xukrn+Te6S9k=;
        b=mOvhVTwh2fPRr4Z/ouCu5WOkKpdJCdwpKFwKZ63Mg9gtNtqwLiuLy5EzC1cG3E+S1v
         +DIcrNs2jEW+ul18I5oveORHwVPRGjPfS14WXwA45APRlm8hNqBgAjtR5pYO03pSuzGM
         m1qJ3htvIKdUUdAmKECt+oK6Cp820cn1z96zn6xemSR/AyblOhJCWE7sYTZOxyF3OAhn
         F52/2AU+oPsEak2sNGLx7Zv1x5L+ydapMbcUisaJu/tG7bFgjubzU0UFigdaTyXLcHQk
         v30UuGsv2aFqLOZf9iyhvkXoZKk3/RGqTDUduZ/FlOyVlr3R/nAmTK+SZDR6eBe2s1j0
         rFWw==
X-Gm-Message-State: AOAM532XVMNxadFYPVUv4oA3PzLu+fQPtQvqCobTCi3JVdzeOA6Cox38
	/2GrDyRW/J+XudnVBshv5EvcpzahP0bVRQT98a4=
X-Google-Smtp-Source: 
 ABdhPJzGEOWgifszQrUVzOFEcXNEIFMKLy+yDTiNUT9FydUbXWRbHnbGk16OB4LsvPo3z0+dXuO8Aw==
X-Received: by 2002:a17:902:7149:b0:149:c123:a983 with SMTP id
 u9-20020a170902714900b00149c123a983mr4584607plm.79.1642084667538;
        Thu, 13 Jan 2022 06:37:47 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/11] wic: misc: Do not find for executables in
 ASSUME_PROVIDED
Date: Thu, 13 Jan 2022 04:37:10 -1000
Message-Id: 
 <eab485069809c991433b9e1b8e4223a555e4d7f9.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642083419.git.steve@sakoman.com>
References: <cover.1642083419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160517

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Executables like tar won't be available on the native sysroot, as they
are part of the ASSUME_PROVIDED variable.

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f574d535f8665b26dab65c14668cf8fc7b751c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/misc.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 8fb508dd39..57c042c503 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -46,7 +46,8 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "parted": "parted",
                   "sfdisk": "util-linux",
                   "sgdisk": "gptfdisk",
-                  "syslinux": "syslinux"
+                  "syslinux": "syslinux",
+                  "tar": "tar"
                  }
 
 def runtool(cmdln_or_args):
@@ -113,6 +114,15 @@ def exec_cmd(cmd_and_args, as_shell=False):
     """
     return _exec_cmd(cmd_and_args, as_shell)[1]
 
+def find_executable(cmd, paths):
+    recipe = cmd
+    if recipe in NATIVE_RECIPES:
+        recipe =  NATIVE_RECIPES[recipe]
+    provided = get_bitbake_var("ASSUME_PROVIDED")
+    if provided and "%s-native" % recipe in provided:
+        return True
+
+    return spawn.find_executable(cmd, paths)
 
 def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     """
@@ -141,7 +151,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     logger.debug("exec_native_cmd: %s", native_cmd_and_args)
 
     # If the command isn't in the native sysroot say we failed.
-    if spawn.find_executable(args[0], native_paths):
+    if find_executable(args[0], native_paths):
         ret, out = _exec_cmd(native_cmd_and_args, True)
     else:
         ret = 127
-- 
2.25.1


