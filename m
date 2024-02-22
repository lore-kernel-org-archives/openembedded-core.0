Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F96C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 18:14:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.19881.1708625676370798818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 10:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AE2dkgYs;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3392b12dd21so25749f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708625674; x=1709230474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gCHV4tVc+/fmKAhCcV9ttIFHsY7WoyWTM9rdIVTINFo=;
        b=AE2dkgYslOlfn326TO8zSfktRpGnWH11I5bYG9ZN3Fiam53kR6mem8BoSe62M5sSqe
         KHepKp0D4k4ixq7cAZwrYr9oBlhNU9jfKEya46h+EebzJ6irHZKdLRcys72pVCG82ZuR
         kaIJqYrAoBvz+dEvFWZ3G90DyKHaJ/SkXPt8ZVnlb9R6Rk43IU0E4PbZSbMI0Bcd0cbw
         5OnUaV8reXKHRQOwdUHhd5UOUMXwChSUTuCWW1eKojkIM9Ie2cyZUu1bQf0oX4YkwiGD
         ClBvXmCi1dO9fimhp2CT5VPV5yvj+N+5K6Z6THBcn2jOhQx5BImfd9vouNhvQpdoEAiR
         yfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708625674; x=1709230474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCHV4tVc+/fmKAhCcV9ttIFHsY7WoyWTM9rdIVTINFo=;
        b=hgCowpc7L4Iz269ikYeUruHpR/6dNIGwLaNfP1aY0RSbxaTJ0UpyLQgo9iPrt1n6Mg
         cbrXslb6YywGmzK6JtTNXGg1+WAwgR0w6i0YMQaHwBcfZSqSNEA++vUVsQQumEWb7Vyx
         zV0EVGE0gfXCGyyUBMbIniKtsvC5BJtGQrP2aIQ3D5kXYKBoQvlSEMA0xa5nTsBN52iT
         j8LFcIckGaCp26FtDeWaSbjtAt9tEYFSyQf3gmfEZZ2ROLxLuwMACAlLVLuFFAXnteeB
         H6+HEdMX1xwOuNeoMQJ4CLwlVKlfNie+HCXJirhyQEUL2xK4VwnMqu8YxjE5i9r3xAvo
         Do1A==
X-Gm-Message-State: AOJu0Yy9AOWEhGZfE3cvS3Neq40cNFbfeydVi0uM6gFe6lI80mBC8Ip1
	Ox0qxa25jYIu7QM6Mk1gOlVRGz+z9o9ft2WRAOUtEzwSji6/CeCN3MSguilb
X-Google-Smtp-Source: AGHT+IEJyl+6ov5wYsf+k4FLlnpKnjStbieNZefro9nrp3KKJj7NO87UUUaN/pIIC1fg3tVV0ZDG/w==
X-Received: by 2002:a5d:4b51:0:b0:33d:371b:34df with SMTP id w17-20020a5d4b51000000b0033d371b34dfmr8856150wrs.33.1708625674286;
        Thu, 22 Feb 2024 10:14:34 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id g1-20020a056000118100b00337d5cd0d8asm21002551wrx.90.2024.02.22.10.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 10:14:33 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] devtool: ide-sdk python 3.12 escaping
Date: Thu, 22 Feb 2024 19:14:14 +0100
Message-ID: <20240222181414.2409611-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 18:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196038

scripts/lib/devtool/ide_sdk.py:709: SyntaxWarning: invalid escape sequence '\.'
  re_so = re.compile('.*\.so[.0-9]*$')

scripts/lib/devtool/ide_plugins/__init__.py:87: SyntaxWarning: invalid escape sequence '\$'
  gdbserver_cmd_start += "test -f \$TEMP_DIR/pid && exit 0; "

scripts/lib/devtool/ide_plugins/__init__.py:88: SyntaxWarning: invalid escape sequence '\$'
  gdbserver_cmd_start += "mkdir -p \$TEMP_DIR; "

scripts/lib/devtool/ide_plugins/__init__.py:89: SyntaxWarning: invalid escape sequence '\$'
  gdbserver_cmd_start += "%s --multi :%s > \$TEMP_DIR/log 2>&1 & " % (

scripts/lib/devtool/ide_plugins/__init__.py:91: SyntaxWarning: invalid escape sequence '\$'
  gdbserver_cmd_start += "echo \$! > \$TEMP_DIR/pid;"

scripts/lib/devtool/ide_plugins/__init__.py:94: SyntaxWarning: invalid escape sequence '\$'
  gdbserver_cmd_stop += "test -f \$TEMP_DIR/pid && kill \$(cat \$TEMP_DIR/pid); "

scripts/lib/devtool/ide_plugins/__init__.py:95: SyntaxWarning: invalid escape sequence '\$'
  gdbserver_cmd_stop += "rm -rf \$TEMP_DIR; "

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 12 ++++++------
 scripts/lib/devtool/ide_sdk.py              |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 3371b242640..02707bfc37b 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -81,15 +81,15 @@ class GdbCrossConfig:
         if self.gdbserver_multi:
             temp_dir = "TEMP_DIR=/tmp/gdbserver_%s; " % self.id_pretty
             gdbserver_cmd_start = temp_dir
-            gdbserver_cmd_start += "test -f \$TEMP_DIR/pid && exit 0; "
-            gdbserver_cmd_start += "mkdir -p \$TEMP_DIR; "
-            gdbserver_cmd_start += "%s --multi :%s > \$TEMP_DIR/log 2>&1 & " % (
+            gdbserver_cmd_start += "test -f \\$TEMP_DIR/pid && exit 0; "
+            gdbserver_cmd_start += "mkdir -p \\$TEMP_DIR; "
+            gdbserver_cmd_start += "%s --multi :%s > \\$TEMP_DIR/log 2>&1 & " % (
                 self.gdb_cross.gdbserver_path, self.gdbserver_port)
-            gdbserver_cmd_start += "echo \$! > \$TEMP_DIR/pid;"
+            gdbserver_cmd_start += "echo \\$! > \\$TEMP_DIR/pid;"
 
             gdbserver_cmd_stop = temp_dir
-            gdbserver_cmd_stop += "test -f \$TEMP_DIR/pid && kill \$(cat \$TEMP_DIR/pid); "
-            gdbserver_cmd_stop += "rm -rf \$TEMP_DIR; "
+            gdbserver_cmd_stop += "test -f \\$TEMP_DIR/pid && kill \\$(cat \\$TEMP_DIR/pid); "
+            gdbserver_cmd_stop += "rm -rf \\$TEMP_DIR; "
 
             gdbserver_cmd_l = []
             gdbserver_cmd_l.append('if [ "$1" = "stop" ]; then')
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 14679744807..9b0b2f9bc6e 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -695,7 +695,7 @@ class RecipeModified:
         """find all executable elf files in the image directory"""
         binaries = []
         d_len = len(self.d)
-        re_so = re.compile('.*\.so[.0-9]*$')
+        re_so = re.compile(r'.*\.so[.0-9]*$')
         for root, _, files in os.walk(self.d, followlinks=False):
             for file in files:
                 if os.path.islink(file):
-- 
2.43.1


