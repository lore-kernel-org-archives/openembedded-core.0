Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B77CC5DF94
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 00:29:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2173.1787358578218113623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 17:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sbwR7Y3P;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1236505f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 17:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787358576; x=1787963376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDc2acH1zkc6kwz1r6XyNwdt5zTHMtDHW+V8K7epIN0=;
        b=sbwR7Y3PVmC0rsnLgtOlSFyFVepFT3PuGCTDp6u/5O+ALPZStjme9pogUbA06pPYBI
         hnYhm0DnE9mIp945m6WqtSG0jQXf5l6QkG1L5RvdjAH0/w3sDcsSazHmtThF5ObT9jgZ
         E+C4ovYC5KbWeNhuRDZDCqtoT2c9bw3ZheomG0u9AenX5Ew/mP0JXEHX/8+j538eeLcB
         BZQ+JMEBZuGZ5JIncEApeBIr6fJrfKZZCtK2EuFzazZTG8w8yhW6N89vphzIsWC4Umt0
         +WtZFVA9VDs/PAoytbgBe/bpqd+8SLURX+b3+6FSWz9DqcHWuFlR77f6Npn++6nLiBFD
         p5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787358576; x=1787963376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mDc2acH1zkc6kwz1r6XyNwdt5zTHMtDHW+V8K7epIN0=;
        b=MQq6+NWBxNtSMrvSj1qSWRJkdpmoZue4j10GF1ewIzwaM4pb1op7kNCse4nKw1hZLi
         cWhaNejdx3Y2gAxO4Yxg4vCBYK71LjMF0tR3gGySGDun3yMM7cLWCGjyvDa0IA6QakyP
         mqrE+jdgj+3QliBFZ74Cm7XWhCYvrij+5Mcjq8+Zs8fVlFVylFDQiEfvrJgTFQztpby1
         7Nj89642+McCP074YF+P2LPjdczNrOkm40xIXB5Z5DQL/W+Dm5C45wz3CAXyHnHcLSpW
         g8OEZ5PkxP4Tc7UAgOxEPvvxbKJ+duSEfZSgmC0FpZg5xWHa68wtZQ79ibGT9G1rE2IR
         Ikew==
X-Gm-Message-State: AFuF++mr1VK2BKs0gN3Wo0uytievBDMyJMUTaBo46BrnZjAtgFT+eJ10
	IjGtvs7uUkMVOinuEU5o47J9VxgKgSPyra+xOdHmn0OJJ8nEEoy8GnJfrzeXy0nLfnY=
X-Gm-Gg: AR+sD10G+9eAN1cLZl5skJ7hmevw6NoMQBeVvxXtyEXCFG1dQp7NfA0S8YBXkrDWB3Z
	mKOLuDliMBq0hrsjCW0pLXXGOGJ0A4Y0K6PIisgp8Brv8ljNKPgoUcROdOF8e9UzR+FLq7HkzCl
	4WdaJbP7ZfQcmKWdSiTrMgm1r/oOC/ITj3pTudMo2I5ouzlS40mykJ0GxqSYEAnqGeDbaExz1Fp
	SFTgpnu+0LQbozKQeWpoSpIoIxMR/73yJXUOKmXh1L7SxG3XImYlK/yINqkNdnQZBBIVaUhnZPr
	Ue88wvSSQ1KCuY9vrGsFAnI0fdoE61etTLkuq0gk/U6QCnA7pMpuXHK1I8ROpdVfiEkVY2nze84
	yJ21rwdvf8MFtHb5xVMeXWV+B5ChMPtlgpllip6YxNSctHo/Ve3hzBHZobgM8n5YCZhZrgJWgIS
	SIKOggS08nrkn+TRvgW9DSHZey+GdgCz5ojoCcGvIXlWYoYtDgm4MIoUmZ9bm7bqIUBHq1I/S3u
	/wWeT3dAMIkhKHFXNuf8e7s7oDza079lHmgvHHttsb5tmcVQSUP1Ppimrv5KEOiewiqdmwrc6yB
	huRWAVaDfFhM
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr151368135e9.10.1787358576161;
        Fri, 21 Aug 2026 17:29:36 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:7910:2866:fbeb:d177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b914bfcbsm44728335e9.9.2026.08.21.17.29.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 17:29:35 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: antonin.godard@bootlin.com,
	bruce.ashfield@gmail.com,
	jose.quaresma@oss.qualcomm.com,
	richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v4 2/4] package.py: remove stripping and splitting skip for signed kernel modules
Date: Sat, 22 Aug 2026 02:25:59 +0200
Message-ID: <20260822002601.90667-3-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260822002601.90667-1-anis.bougrine10@gmail.com>
References: <20260822002601.90667-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 00:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243961

Fixes [YOCTO #12927]

Now kernel modules are re-signed after package stripping process.
Therefore, they can be stripped and splitted securely.

Reported-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
    changes in v4:
    
    - Re-sign kernel modules after package stripping process
    - Remove package-stripping skip in package.py
    - Add MOD_INSTALL_PREFIX variable
    
    changes in v3:
    
    - Fixing rebase issue.
    
    changes in v2:
    
    - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
      duplicating the oe_runmake call.
    - Use `scripts/config` script instead of grepping .config file.
---
 meta/lib/oe/package.py | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 4a244ec980..1657eaad93 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -36,16 +36,9 @@ def runstrip(file, elftype, strip, extra_strip_sections=''):
         os.chmod(file, newmode)
 
     stripcmd = [strip]
-    skip_strip = False
-    # kernel module: use --strip-debug and --preserve-dates (required for
-    # module signing to remain valid after stripping)
+    # kernel module
     if elftype & 16:
-        if is_kernel_module_signed(file):
-            bb.debug(1, "Skip strip on signed module %s" % file)
-            skip_strip = True
-        else:
-            stripcmd.extend(["--strip-debug", "--remove-section=.comment",
-                "--remove-section=.note", "--preserve-dates"])
+        stripcmd.extend(["--strip-debug", "--remove-section=.comment", "--remove-section=.note"])
     # .so and shared library
     elif ".so" in file and elftype & 8:
         stripcmd.extend(["--remove-section=.comment", "--remove-section=.note", "--strip-unneeded"])
@@ -59,8 +52,7 @@ def runstrip(file, elftype, strip, extra_strip_sections=''):
     stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
-    if not skip_strip:
-        output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT)
+    output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT)
 
     if newmode:
         os.chmod(file, origmode)
@@ -70,13 +62,6 @@ def is_kernel_module(path):
     with open(path) as f:
         return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
 
-# Detect if .ko module is signed
-def is_kernel_module_signed(path):
-    with open(path, "rb") as f:
-        f.seek(-28, 2)
-        module_tail = f.read()
-        return "Module signature appended" in "".join(chr(c) for c in bytearray(module_tail))
-
 # Return type (bits):
 # 0 - not elf
 # 1 - ELF
@@ -810,11 +795,6 @@ def splitdebuginfo(file, dvar, dv, d):
     debugfile = dvar + dest
     sources = []
 
-    if file.endswith(".ko") and file.find("/lib/modules/") != -1:
-        if oe.package.is_kernel_module_signed(file):
-            bb.debug(1, "Skip strip on signed module %s" % file)
-            return (file, sources)
-
     # Split the file...
     bb.utils.mkdirhier(os.path.dirname(debugfile))
     #bb.note("Split %s -> %s" % (file, debugfile))
-- 
2.50.1 (Apple Git-155)


