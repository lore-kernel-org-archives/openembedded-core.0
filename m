Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2D5C61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 23:35:17 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25204.1787787312758527314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 16:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CkvZN/Kj;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482e1bfcc63so290394f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 16:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787787311; x=1788392111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qSvb5QMgjn9VY62lxA2lAF4XB0Y0EtVxVEboMw/XGw=;
        b=CkvZN/Kju+h9CkOry5ZXA9ufZ1wtTGoikA0qGUL10Hpu3kWFu8PT4oHPt9pRlc/Yjp
         MSShpet/c1IPtbLPk+ui9JKhbtFPg07ez51CCzrzpZ89nPIAwwrCS7Os++l4Pgs9eZhU
         bsTQCgUZk1LFHtMG+SVh/hU7bFKUpunaWYplaT3M7zyXHHRdbBjMcbvLiAvliQharF/9
         LVMSnh3GbacdVCrim5q4QfhVrF6JpoiQx7RHMKeZPgNVva0lq3y8NWX1IPURzpM2FS0Q
         si3wFdyvkEWy1qHBEq0uyMLgPFJpSKa0en8XJx90FjpJknLlTOpuVjE97pRNqn+MGRSv
         Fc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787311; x=1788392111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qSvb5QMgjn9VY62lxA2lAF4XB0Y0EtVxVEboMw/XGw=;
        b=JOqijmxbcitN/i9Ec7cbRoTC7WY/YKIaMJVmIxtyyM3uj6T+wfJb0tReUZ5dbI3G8V
         RX2mA0KG/ck0aDjJ43WRcEhwTUNBWLV5m0tUniejc+cFLG3d8x6Pg5nRP2ZadpNIm6Uf
         5rHRs61+gq5MpMs4N7gHgIHQ/Uu9DB7L2y33ttou4If1PeTIByH/tTGHiVConDtJvZQa
         LoOozT7Fb+U8FPwgPhgWxAborprKUxaNRTu43L/G+skBPFIQUneUsjxZ7N/4+GvHAU14
         VN6stVRCr9JrNdekrieFVV0LcNu3q3z+YAPLzHlxRdGlErVm/pb0vSjYphRAYKNgVf80
         Vdkw==
X-Gm-Message-State: AFuF++kYKkSQn//uy55ZIovFrQ/iJWbSUmklEdFXqjCUU6WidmxICMdy
	DyJfpfnzv8T+m0nziyivtz03YvNgFjfOUSLikCxVAXq+P5wAy6PzLj1IFOKWEU2ymro=
X-Gm-Gg: AR+sD13d1oycNPSYIZiKOWNCb9UkrAHgb2ro9OILV5JsayRvDVHWLBuyAvU9RZ+V7gB
	N4EUh/7F1JBQC4IEyASrsOaBYdn4uIac1xu2b9/wucYwzN9vMIEtqN+ovPj1Fjv2qVC+6x1Vjgp
	+CoJxXBjR4xrjhHZbbjH1HlgUHAm3Ni5Wv5QmdtrWLvfpmktkA/LpsiJ5D6iWaCK//Nz5P3g/aZ
	GpjiIVd8Bmq04hXH6wZKFV7Pxw1fPrjAfZxNCSf9JMgRNOytT7xPQwIA5AfqDsepuHesg4EZPsT
	K+SUT2aKySacM3yePiJ4Dd1Vh32kB67fyh7oNZxoZRwaleJ/N491rPNwcmOZoS8Jg8/4EzYeuEA
	aSY511pnbph0R4Q0mwWXPgdmsy1jUHrQfNcx6dzK8Oxdro8RgGtcO6cQCuRGgzTQa9nvnFJi3T6
	dnJhIS2i0fsM8LR3HNDmWv7wdJol0PDvmZRJeeMBSTPUcdw2clOdqTmEG94devgCz2R/cloSy4p
	tZHxt+CIisC1NlN2CsFehNKTKsjzjNZ2mBlEvL9V3DrUYBWojCy0naGGB16zLs5luZy+YwQY46r
	Kb9uTGyetJ97+//gZ8G6AQ==
X-Received: by 2002:a5d:64e8:0:b0:482:e740:18ca with SMTP id ffacd0b85a97d-482eab7b5fcmr2902573f8f.7.1787787310983;
        Wed, 26 Aug 2026 16:35:10 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab569sm4586872f8f.16.2026.08.26.16.35.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 16:35:10 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v7 3/5] package.py: remove stripping and splitting skip for signed kernel modules
Date: Thu, 27 Aug 2026 01:34:14 +0200
Message-ID: <20260826233416.37047-4-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260826233416.37047-1-anis.bougrine10@gmail.com>
References: <20260826233416.37047-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 23:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244438

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


