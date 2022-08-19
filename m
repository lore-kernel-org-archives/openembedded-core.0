Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74977C00140
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:55 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.50705.1660877034840405650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XGNLZ4yo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id 20so3024491plo.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=dzSTQ4DnNjmC2Sgy2MlPUfV8JyApt+xd3ht6SfjqX6s=;
        b=XGNLZ4yod0WYwkHt/wVEmc+VS/DuW5/HAYbi7cyqNqHaSqDkb0XpmgnFX6GVFJKHmw
         xwJxR/uq+1QinPojHJvRInQcADaPzGVc0vVV2Hzm7Hc4cvcK/mfppiN14HB75zkuTfU1
         M4cSWrw1Q30OX5mnjqYsxB3DCp1k/t9vEqcJGi6U/Bb8QN/zOtz/9d2bQQURaXCDJopm
         hvdx5UlkHFKwch5jKfkaXf8BW6edy2Ieqh65JLoEoSoFjst5/OXJuVVfxX/lSgGMCPLq
         P9OLx7YyGMgLhrOtxqIOqMebYdOveZEIhsfgVt5N//gsS61uUaXCboVrAdOt/ic95t2Q
         CMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=dzSTQ4DnNjmC2Sgy2MlPUfV8JyApt+xd3ht6SfjqX6s=;
        b=62wBH2c59aHJamd58FJ01nOzPH9oA2pbkKMJPe9wDNlDEYHhFAsU63Jjrnj6UWFfBQ
         ztJ14IZM5A08nf10D59cSbgfyd4LP3GRYO6+Ynlen3AvoibelV8nL8G3paV7cUsagaft
         msb1zZG3QuOlNXXBupyeNYxsqvTio0oAQFzfIHG0nWt/H0BK7UFbbTZmUCWXT0IeOrmb
         2vntCrwexCkxkxs/nb5pw4YzgPNvh6jjBMGIP+fhVqDtDkK/Cwq6Pb3iQFjZWxsnG/nq
         UU2oMmOSYq3aZxq1APrQk0IDpGEnFedEbX8x4/XbpaLDu9RAV11ywtLxa9ol6RSBci9+
         0G3A==
X-Gm-Message-State: ACgBeo2XvxMf3MgG0EbarxwpM5LZQ6LtEzRD5XdmoCnQmkgVq/kggQSa
	mcj6xgsFrETkLP2vyoD0pFXdiePfmXv0tr5Q
X-Google-Smtp-Source: 
 AA6agR6aqGiPEiDRGC+HeUHUSYmUd5oOEDvHM9QLHHb5nZD2AYvSWOuyr3jxo1vf2/uuO8a1A1hM7w==
X-Received: by 2002:a17:903:2345:b0:16f:1f3:1ade with SMTP id
 c5-20020a170903234500b0016f01f31ademr5662798plh.106.1660877033946;
        Thu, 18 Aug 2022 19:43:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/26] relocate_sdk.py: ensure interpreter size
 error causes relocation to fail
Date: Thu, 18 Aug 2022 16:42:44 -1000
Message-Id: 
 <3f258378bcaebb9c42c0011c7c424c920ef71d22.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169565

From: Paul Eggleton <paul.eggleton@microsoft.com>

If there is insufficent space to change the interpreter, we were
printing an error here but the overall script did not return an error
code, and thus the SDK installation appeared to succeed - but some of
the binaries will not be in a working state. Allow the relocation to
proceed (so we still get a full list of the failures) but error out at
the end so that the installation is halted.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5a9a448e462d3e5457e8403c5a1a54148ecd224)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/relocate_sdk.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 4ed8bfc0d1..8a728720ba 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -104,11 +104,12 @@ def change_interpreter(elf_file_name):
             if (len(new_dl_path) >= p_filesz):
                 print("ERROR: could not relocate %s, interp size = %i and %i is needed." \
                     % (elf_file_name, p_memsz, len(new_dl_path) + 1))
-                break
+                return False
             dl_path = new_dl_path + b("\0") * (p_filesz - len(new_dl_path))
             f.seek(p_offset)
             f.write(dl_path)
             break
+    return True
 
 def change_dl_sysdirs(elf_file_name):
     if arch == 32:
@@ -222,6 +223,7 @@ else:
 
 executables_list = sys.argv[3:]
 
+errors = False
 for e in executables_list:
     perms = os.stat(e)[stat.ST_MODE]
     if os.access(e, os.W_OK|os.R_OK):
@@ -247,7 +249,8 @@ for e in executables_list:
         arch = get_arch()
         if arch:
             parse_elf_header()
-            change_interpreter(e)
+            if not change_interpreter(e):
+                errors = True
             change_dl_sysdirs(e)
 
     """ change permissions back """
@@ -260,3 +263,6 @@ for e in executables_list:
         print("New file size for %s is different. Looks like a relocation error!", e)
         sys.exit(-1)
 
+if errors:
+    print("Relocation of one or more executables failed.")
+    sys.exit(-1)
-- 
2.25.1


