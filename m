Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76052C64ED9
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:20 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.13862.1676902753483632844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Zmlt1eMY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id d1-20020a17090a3b0100b00229ca6a4636so1801102pjc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvMjPCTVxpwZfmmRwbkjpHLYLKc4R2eKSFLm7EibgVo=;
        b=Zmlt1eMYOly7G3ECoM3v2/FWL1lNr3/qx2I68SoYXdHDN3RQSFE+ZEycG38bq+q6dN
         pVhhGZyOcyy12UwRZ0Exbfn5fMpdudSWdwibCA5ruoTTVNTnpimolTf+12YMwFUkcwQz
         9S+arxubR6XAz141orsnmqqXqdcSRk3EMdi6mhkYfFv7rHNmYRRc3Jvew68bCvLIt/LY
         l8i8qwP0FgSx5wTRcvAJAIAbZSWdzk82kWPzlOf9alnWt+1Yrhp/Ae5exr5WFiKp+oq0
         361FHtfFKLJCCRODqDVB6LG+LgWVzdIJ1zvtcb2Pj2L3BB0RHIsbw7tvxivAVPdze1Hc
         FReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvMjPCTVxpwZfmmRwbkjpHLYLKc4R2eKSFLm7EibgVo=;
        b=WIxS+/tt9ZQT7zZTevfaH5OfUkj38nyRq9RDxPnOxhsi1BlrPPnQLN1ZJElcGEQ95C
         uqzoZBuBAz69yHZhfFfR45wabOeJY3zArMuZGbSZPaY95p1p9/mLklAp6HJUs5eW1xrY
         1ChWpcsGI+LiDyxKCbOSVFqXfLiYW8mUvTwsBp9l3eSDEpHcmiSC3E0G+Lfbj+qsoBfQ
         jSw7B0i2fA9Ut245izIZp6axjh9LexA+o6yEItFdpq99DyA+R1CBiK7E6BRgacDQCNJk
         icbkotBn84+nHU8I86EyzqcCEUa9eDkIQNEAi9ls2PW5WV3IP+l4LroZ6+DxJreM2yA+
         Xn1Q==
X-Gm-Message-State: AO0yUKXp95/tSmL/2lf2WmAuC51Rc7Rg32kNAl+94q2/4EPWKbDdlfPK
	gD2qoFgd9aQsZSUHU7BW8ttwm32b6krYXT9MX1U=
X-Google-Smtp-Source: AK7set+7Kzd/ECKrn/htJOK9E2+wlcFea30JpHdCxH0QFaLp42aG6kd7oRT8n0yPqLrXqbq9OHVM3A==
X-Received: by 2002:a05:6a20:914c:b0:bd:2d4:ae12 with SMTP id x12-20020a056a20914c00b000bd02d4ae12mr12400386pzc.12.1676902752459;
        Mon, 20 Feb 2023 06:19:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.19.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:19:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/22] oeqa dump.py: add error counter and stop after 5 failures
Date: Mon, 20 Feb 2023 04:18:26 -1000
Message-Id: <d570e8f3d6ac05be200f5f4acbbd1a15a95fc122.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177425

From: Mikko Rapeli <mikko.rapeli@linaro.org>

If test target qemu machine hangs completely, dump_target() calls
over serial console are taking a long time to time out, possibly
for every failing ssh command execution and a lot of test cases,
and same with dump_monitor().

Instead of trying for ever, count errors and after 5 stop trying
to dump_target() and dump_monitor() completely.

These help to end testing earlier when a test target is completely
deadlocked and all ssh, serial and QMP communication with it are
failing.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit d9ad0a055abba983c6cee1dca4d2f0a8a3c48782)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/dump.py | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index bcee03b576..d420b497f9 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -93,37 +93,55 @@ class HostDumper(BaseDumper):
             self._write_dump(cmd.split()[0], result.output)
 
 class TargetDumper(BaseDumper):
-    """ Class to get dumps from target, it only works with QemuRunner """
+    """ Class to get dumps from target, it only works with QemuRunner.
+        Will give up permanently after 5 errors from running commands over
+        serial console. This helps to end testing when target is really dead, hanging
+        or unresponsive.
+    """
 
     def __init__(self, cmds, parent_dir, runner):
         super(TargetDumper, self).__init__(cmds, parent_dir)
         self.runner = runner
+        self.errors = 0
 
     def dump_target(self, dump_dir=""):
+        if self.errors >= 5:
+                print("Too many errors when dumping data from target, assuming it is dead! Will not dump data anymore!")
+                return
         if dump_dir:
             self.dump_dir = dump_dir
         for cmd in self.cmds:
             # We can continue with the testing if serial commands fail
             try:
                 (status, output) = self.runner.run_serial(cmd)
+                if status == 0:
+                    self.errors = self.errors + 1
                 self._write_dump(cmd.split()[0], output)
             except:
+                self.errors = self.errors + 1
                 print("Tried to dump info from target but "
                         "serial console failed")
                 print("Failed CMD: %s" % (cmd))
 
 class MonitorDumper(BaseDumper):
-    """ Class to get dumps via the Qemu Monitor, it only works with QemuRunner """
+    """ Class to get dumps via the Qemu Monitor, it only works with QemuRunner
+        Will stop completely if there are more than 5 errors when dumping monitor data.
+        This helps to end testing when target is really dead, hanging or unresponsive.
+    """
 
     def __init__(self, cmds, parent_dir, runner):
         super(MonitorDumper, self).__init__(cmds, parent_dir)
         self.runner = runner
+        self.errors = 0
 
     def dump_monitor(self, dump_dir=""):
         if self.runner is None:
             return
         if dump_dir:
             self.dump_dir = dump_dir
+        if self.errors >= 5:
+                print("Too many errors when dumping data from qemu monitor, assuming it is dead! Will not dump data anymore!")
+                return
         for cmd in self.cmds:
             cmd_name = cmd.split()[0]
             try:
@@ -137,4 +155,5 @@ class MonitorDumper(BaseDumper):
                     output = self.runner.run_monitor(cmd_name)
                 self._write_dump(cmd_name, output)
             except Exception as e:
+                self.errors = self.errors + 1
                 print("Failed to dump QMP CMD: %s with\nException: %s" % (cmd_name, e))
-- 
2.34.1


