Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.12622.1587278154241148898
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 23:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZFHaxn/A;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id i10so7939889wrv.10
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 23:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mg1hu8xwTCXq3aNcho3kj58SzLrf6+iU27wylOmmqFU=;
        b=ZFHaxn/Axq4yCU/fHeGBJmbqv3OKxaHdtnE8N8kFjnIxxWldCIZXSU2lu1TBY9TIXS
         2dnlZfotUtv4F9hP39b5r3yVKCNvRBEMU/m0hA+LZslErns/SM9dzhB7edZR2ytOWx1C
         kLbm/6OWoYbWwP9NFawR0O0LMTUZ7IiLKUG+WUIllCcBghw7pTNltCKzsdnoTP4f8/nb
         1flwvnEHk7vXY+KLj+JU3uQOxSuj3kdg2r77Lj6NJ7WN9BAQQrTVhDHlC0eF8vWQ14Wn
         Zs8KtHh+8unCcDA6RnmFNpTwpi3+5WDLjKhuG90X9Bqk8Lw9lWO1vy4xz7SEa4MxyFxc
         AZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=mg1hu8xwTCXq3aNcho3kj58SzLrf6+iU27wylOmmqFU=;
        b=ipiq3kstpP7DtFkfKA37AF95Plgsj6HqAyFVIxOjBOlSCNLjkkhIhKe+CaV8zvtGiv
         SdCVycpwcDYGF8gI92JyveNOuKzsQgdgeYK3/859Tqc/WJ9x6Uc2T3IIpqC1AfjIk/pE
         9yXNUhLTryhG6VNsLP9zT55g8PkYEcW38d6gB8Z3KeSPT/sAJlbX76MpDwxEF0HAMNdv
         42gVZrnLzb2jaXY67E9hf7hWvMumYqHCz73cvGJXgs6XkT78ci6s4LLEZgtiPqxnlWz4
         sP9ny+BYJtVvXHQfn36SUSs4L8hIz5nUlvgDStVnhX/v88e3R7MGeiq8OaTEaFo1LY4V
         krUw==
X-Gm-Message-State: AGi0PuaUCHMENeMAGP1N6xo151pXfqKjg2xE3TDRWnq5gMdiPrumeC9o
	D7RPkOI/mAYB7q+RFexzllHK5ocb/8U=
X-Google-Smtp-Source: APiQypKx4kG3vspNwf9LTGQPpXikbgUC6djXO3w/pmioQCKjEqfC5IMMlQahlBcajwhDJZVXmMmC8A==
X-Received: by 2002:adf:f884:: with SMTP id u4mr12083301wrp.171.1587278152560;
        Sat, 18 Apr 2020 23:35:52 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n6sm13980266wmc.28.2020.04.18.23.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:35:51 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v7 07/10] wic: misc: Do not find for executables in ALREADY_PROVIDED
Date: Sun, 19 Apr 2020 08:35:35 +0200
Message-Id: <20200419063539.1467641-8-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Executables like tar won't be available on the native sysroot, as they
are part of the ALREADY_PROVIDED variable.

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/misc.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 1f199b9f23..91975ba151 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -45,7 +45,8 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "parted": "parted",
                   "sfdisk": "util-linux",
                   "sgdisk": "gptfdisk",
-                  "syslinux": "syslinux"
+                  "syslinux": "syslinux",
+                  "tar": "tar"
                  }
 
 def runtool(cmdln_or_args):
@@ -112,6 +113,15 @@ def exec_cmd(cmd_and_args, as_shell=False):
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
@@ -136,7 +146,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     logger.debug("exec_native_cmd: %s", native_cmd_and_args)
 
     # If the command isn't in the native sysroot say we failed.
-    if spawn.find_executable(args[0], native_paths):
+    if find_executable(args[0], native_paths):
         ret, out = _exec_cmd(native_cmd_and_args, True)
     else:
         ret = 127
-- 
2.25.1

