Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFE3C74A5B
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 15:38:10 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.75918.1679585887677546104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 08:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kpzPXNyO;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso12321289oti.8
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679585886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQyDmI9q/tiKcPIH+j3tcikhICe3X+X5+P9ticS90e4=;
        b=kpzPXNyODRjjK/cuWqRy/jqwoaZK1WTeldjHKlB+rVtDarTQg8ra5XOTzR3m8zoQYF
         l4M36KWz7NKKS8HbscWw6toDIFnI4ESEZOosd3cuFSG7i952H8Vl9StiY+rL6KerIfLn
         Z6Rrdx3fyXFd8QGJi+qLD5R6UX18vJVlA/SQ6sGfovR+cWZRk8V6+LwRxy0Fls//W5yC
         Csp3A4q1IGDa8Dj7iHo/YXcfCwKNsIs+rdSMfzDhyjK99Q/9/B3gMbWySY0g46TrhD8b
         zD8UnPCcWnNreTSLoAhNeSOJxvut3cUJkjyz0816aXD5qzmQzZHt4zdnW/8HhmO/tFbd
         vo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679585886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQyDmI9q/tiKcPIH+j3tcikhICe3X+X5+P9ticS90e4=;
        b=LPw28IbdglpTRr/mIoVzXvb1lTf/ov0I5B47WtTgMSga64BNUsSfYq193JnPWVPepH
         bM+E2lRFTvf5FjiZvdQGhOEpyx8CWElJc3MWziUQLfXRYqvD2BIiDYR14F5pYE/jfNG8
         gJn5gM83Bnp1pCFxsSQsxp5W3tjt8XXKMC2SOFXvquNcPLv7zxsM2k1ebTOgDyIyqhuR
         vaXlh8gdBt5eXqOKAiEvrjp7dhrE4rmH3WXfI8ycLPZB5oDctA/drVfCRdaMXJL6tX5Z
         BSofcfhUBC/oed9i2LyU+Gklh5HK3oK3+6aqgpH1ae/0jjbc0x3lJqjM8B2iaZEgWwvX
         nzXA==
X-Gm-Message-State: AO0yUKWnGR3cUPIFLikHG1C30labx0XO6ekE7nLXA4IuH1msnXD1Kwzd
	C8NowTikgzwUnJooxyuZgWromO/f0LE=
X-Google-Smtp-Source: AK7set82K7IGANceYtMYpHifdBRTlI+vs6aLnfM3LW4oHRupDumyZIUPGxgfXY+oxTKfUN9xNmbqWA==
X-Received: by 2002:a9d:6c9a:0:b0:698:37ed:2bde with SMTP id c26-20020a9d6c9a000000b0069837ed2bdemr3639611otr.29.1679585886297;
        Thu, 23 Mar 2023 08:38:06 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id m10-20020a9d7aca000000b0068bcb290a38sm7592343otn.55.2023.03.23.08.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:38:05 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] runqemu: Fix TypeError when command fails
Date: Thu, 23 Mar 2023 10:37:59 -0500
Message-Id: <20230323153759.1554168-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 15:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178988

The commands passed to subprocess are tuples which when passed to a %
format are treated as multiple format arguments instead of a single
argument to be coerced by "%s". This results in a TypeError being
raised with python claiming that not all arguments were consumed.

Fix this by wrapping the command tuple in a str() call, as is done for
the logging strings

[YOCTO #15078]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/runqemu | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1a378925ce..6e7575c083 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1042,7 +1042,7 @@ to your build configuration.
                 cmd = ('runqemu-extract-sdk', src, dest)
                 logger.info('Running %s...' % str(cmd))
                 if subprocess.call(cmd) != 0:
-                    raise RunQemuError('Failed to run %s' % cmd)
+                    raise RunQemuError('Failed to run %s' % str(cmd))
                 self.rootfs = dest
                 self.cleanup_files.append(self.rootfs)
                 self.cleanup_files.append('%s.pseudo_state' % self.rootfs)
@@ -1051,7 +1051,7 @@ to your build configuration.
         cmd = ('runqemu-export-rootfs', 'start', self.rootfs)
         logger.info('Running %s...' % str(cmd))
         if subprocess.call(cmd) != 0:
-            raise RunQemuError('Failed to run %s' % cmd)
+            raise RunQemuError('Failed to run %s' % str(cmd))
 
         self.nfs_running = True
 
@@ -1060,7 +1060,7 @@ to your build configuration.
         if cmd != '':
             logger.info('Running setup command %s' % str(cmd))
             if subprocess.call(cmd, shell=True) != 0:
-                raise RunQemuError('Failed to run %s' % cmd)
+                raise RunQemuError('Failed to run %s' % str(cmd))
 
     def setup_net_bridge(self):
         self.set('NETWORK_CMD', '-netdev bridge,br=%s,id=net0,helper=%s -device virtio-net-pci,netdev=net0 ' % (
@@ -1554,7 +1554,7 @@ to your build configuration.
         if cmd != '':
             logger.info('Running cleanup command %s' % str(cmd))
             if subprocess.call(cmd, shell=True) != 0:
-                raise RunQemuError('Failed to run %s' % cmd)
+                raise RunQemuError('Failed to run %s' % str(cmd))
 
     def cleanup(self):
         if self.cleaned:
@@ -1663,7 +1663,7 @@ to your build configuration.
                 return result
             raise RunQemuError("Native sysroot directory %s doesn't exist" % result)
         else:
-            raise RunQemuError("Can't find STAGING_BINDIR_NATIVE in '%s' output" % cmd)
+            raise RunQemuError("Can't find STAGING_BINDIR_NATIVE in '%s' output" % str(cmd))
 
 
 def main():
-- 
2.33.0


