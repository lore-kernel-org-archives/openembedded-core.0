Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.11172.1586871393439128216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R/5m9TfY;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id q19so12443360ljp.9
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sMo91uHjwDDMyGJuOIdg5aUtcJ7Tj9GaXt1ZuLBZ5Mo=;
        b=R/5m9TfY0ogbl3on8EuuGGwQM2xnAXU4RYKuuZaUnlOjZihSXY+137oM1UvDQgZcKg
         Eb57kvN4TqyLN1IzCLCd1flVakC3SOZLnBMChcY32nwBDkFL4l3JPvtQX/NsIWlBAoxI
         NwN8DgYhSirMknWwk87rzcOWUuINOyigQgF/Npe6ehWO0D0Gx7qNpl86zWn5cPhzgMsW
         285A55c1V9BDQAHWsiAoMtqklwsJd9c+jTULrh4wDK7ZR22uIAsrF94n6VfylRNNrYXv
         UxxHDX+iuC7J3SiBx57+soJsOmt6+Va39DuVuspfW42gGxeSpMydzBoK5/YoJ4iivsIU
         f2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=sMo91uHjwDDMyGJuOIdg5aUtcJ7Tj9GaXt1ZuLBZ5Mo=;
        b=HAav2g9PWAF6SNK37M+qpVlVakbbRGQ2lWD1oOMaA5uy1m4h8ceryiTjGNjGzeDst+
         Q0NruGaxcG3M57YDRYMr5HRUZ8ZaoIv/CQTk6JAAyc7wUo1qvgS71p7j5nf6V5tEV5hD
         goYqZAi7U7Mz7avaQHTiBVSIrlzK1w9GLa0h74vODuoRBXn50ML6aMcZJ4+Q4gcAujlW
         tj6htJs25Hjr5SvnRKmewWIocWlIQPaofnXicB1cq5cG4kEVfJjnECt2xnezau3XY4aH
         gztsLmTPB5Zi/bLGBHQSb1TiLsF2KEQssjJtBoc6xkMJ+h9mx/Lhtvdu/E3rJh76HTUL
         xMCg==
X-Gm-Message-State: AGi0PuaqAwlbPvs9vv7RR6OOgmWhUyr752QRxxbhkQCcMvlKUqyKnjMp
	AvXo1NYhDgbk6kaCkrOuOVs+S/NEv68=
X-Google-Smtp-Source: APiQypJcIKHtEuZO1cEg3QeTVXprTdq6YW+6nPBoTl3L3NoQmOl3rlRYQoYXMvW23EOjFKNn8gJp/w==
X-Received: by 2002:a2e:7606:: with SMTP id r6mr151396ljc.118.1586871391245;
        Tue, 14 Apr 2020 06:36:31 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o6sm9218344lji.15.2020.04.14.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:36:29 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 07/10] wic: misc: Do not find for executables in ALREADY_PROVIDED
Date: Tue, 14 Apr 2020 15:36:11 +0200
Message-Id: <20200414133614.1830058-8-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414133614.1830058-1-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

