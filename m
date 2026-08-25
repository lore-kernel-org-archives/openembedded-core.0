Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59772C61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 20:50:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31930.1787691009521216675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 13:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CoAVvPh3;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso1608945e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787691008; x=1788295808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qSvb5QMgjn9VY62lxA2lAF4XB0Y0EtVxVEboMw/XGw=;
        b=CoAVvPh3+AiatbAGQBRX5oW+XwFnr+s5YjYI1SCYo+VFxX1Urf1t8nFLjWS06b3eGM
         PfsF3ExcWyxdtYnrMmZfVfe4D2VoGtGq3WJtASnzcdioUycbsviEk6uQi/gk5rS1sInc
         x3rHrEuTac5hAYHC8bHkNGU34wffQK8BJ7lYS9HuY8hGbsBiaY678pQsbtD8oMSfuWeV
         YqZHVs9f2sEv+/wp6EQ+OuRCwG+XNusJ8bAtFBmL5pdCX93yTk/EEeStrl52aG6arbA3
         O1RFLFxKPYQBFqqMzOc/jHSj66oZMLWjghh4x/7t5w4eF4P/WQk8a6qhMH0Oo2/cV2lC
         MlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787691008; x=1788295808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qSvb5QMgjn9VY62lxA2lAF4XB0Y0EtVxVEboMw/XGw=;
        b=FH3V5K08w/VpcEwPkyZAcpuJsC+hNT6AEY6rCKXObpLrRLvzifN2NXiBKbaFLLpwlA
         HsZF6Xi4jyOjfni+80Crc8nOlDx0Rife4zUTRBBP6imYLxq+/GIWH7GKx3xwKlthtMzP
         R8bYO4M975pqy8Ffr1/A4ab8WPQ25IWV8+VJEMRrBc4HUcrMDhsbKdHqnOY7d6lXtUa9
         6hH93G4tVRHKx010iR81vXD79LapwUeysyWNa8c4g2g0oCONaDyWzwuxRFwRYgQjQo88
         OVemrWih6m/3PTdxwk6CI9f03szjcvEDU+vRQXUnzParksHKcu0lZm4Qe5NAxebYSgv2
         yaKw==
X-Gm-Message-State: AFuF++m0EfLplnk7F0YsfQ3qS3/h1Ar0fzxv25X4YdEhvJ13PiTMb9Dc
	U2cRegakFJ1nlEBZRJlwIinE+UJ+MANkODZweHWWkLuNyA4hQLcy7VRU7s8xbhyZ1T4=
X-Gm-Gg: AR+sD13KRtWhiBCJzFEe9HUUAxTRUpzM4WOwKVFqCh+npMI6K4+L6aRpmVVRDY6IE3A
	WpMp67sIvIq68+GLZFyraAVEnNdl+27ndwCRAAVTKAGY4C8muh38e2KXeASsmc/BSh0un2aCv83
	rElhRATu5NnmwGMQ17V5ftzrl7kR6GYycptdk8YnjGCqn2cgoN2+8ilJngPTyo4g26evis+vdLQ
	L8oZGGud4PEjtAr75im9Vm3ypvx2XthB+0IvUwYSwrPUrCsGMOrxy/UeMSsP4ZrTyV+A9WhejHC
	8+BRXZnwgVIR/SvKRo0u/O0T4JTTeyBwheqI0F6NV3MqTdZLEG9Iaw+0VGGxwFY39Pokql/eQ8z
	qEo3dgBsk3B9C3Q967K3uyKvuPNroOtgthvjzRJNqO84z7irUblaDiBMICnkV3CSVg7gSLCVshO
	CB4pn23qzUR1vxhFplkQsv+pSq0r/quOIlr9cqUltXveIBj5rrXhjF0zZ+w+IFsxKw1lQDd3yhJ
	Vv+u05DwEfng1JH/r7kd95OMLDMNdBvdHDNAzG3n6mbRYFs8hz4zamygDqs7IcUH5WEtMmbgJwg
	imwJIVEeOp7k
X-Received: by 2002:a05:600c:4505:b0:499:8ed2:8234 with SMTP id 5b1f17b1804b1-499dc6a1ee8mr16448205e9.0.1787691007500;
        Tue, 25 Aug 2026 13:50:07 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca98095sm4507845e9.5.2026.08.25.13.50.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Aug 2026 13:50:07 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v5 3/5] package.py: remove stripping and splitting skip for signed kernel modules
Date: Tue, 25 Aug 2026 22:49:28 +0200
Message-ID: <20260825204931.17628-4-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260825204931.17628-1-anis.bougrine10@gmail.com>
References: <20260825204931.17628-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244277

Fixes [YOCTO #12927]

Now kernel modules are re-signed after package stripping process.
Therefore, they can be stripped and splitted securely.

Reported-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
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


