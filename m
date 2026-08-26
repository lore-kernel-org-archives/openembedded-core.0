Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59B7C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:23:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7794.1787732632752985920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kg219byw;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso5720405e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732631; x=1788337431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qSvb5QMgjn9VY62lxA2lAF4XB0Y0EtVxVEboMw/XGw=;
        b=Kg219bywF+0BJ75IMzg5hdhD3WCbPYTUH8FbWyzxTcIE/XTAcV8/G9vJ2dgWNRlTDN
         Ja60P8tMmUXam0LSgDr+gq40dykzJH0CwOqPiuy2Rv0GiTn6Sj61xhqIDOfVuo+2SLqd
         lzUi4dsxHw5/aSBmI4aG86e1W3eGQ87mdlqfrt6yjR7QhACx1OCII8FME/uyhVXnI185
         wiwE6hGAPvZqsKPG7Sb4UgfABTrAxA1pyb12X6/NKEoqUXD5dhF2k9uAUV39SugjrfTt
         xg6AYQbSf7O9ofc1ElwFRDGQT7OzeE5OnM5ALC0XcOxls4076L9lDSNaseiPzfk0Q6Gk
         hlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732631; x=1788337431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qSvb5QMgjn9VY62lxA2lAF4XB0Y0EtVxVEboMw/XGw=;
        b=TtDWu8sRcWzS+xHxNBDcaFfR7ZIowRAQ9Lv1ZeIFj//UYzpxS8h6/tzKjADxREpbvU
         YezysD2hzY4bdNPgEl2Zozdlt60qK+1Oj2nRTJ8ZZ24ptZHlrGD+l9z8dnybUWnIlIJx
         pYPML5f+QduWhuzyyIu3ML5oMIfhoNa0IypmOfL9BzTRRggFkd1wUuFzw4dT4ex4BmTd
         44Ofj54P8ugPi9z0e7hee3tvGtfkZvWSqMMfnFJ/i2CDHVa2nnrZM/umzheig+UBz0wJ
         7pdL7OOI0OEy/KksqF0PyNty9eUZYCLhuMyL2xAMN4u83VE9i+nVpaDbANKAt8xfYGNc
         8Mzg==
X-Gm-Message-State: AFuF++k72kb3z/348yHifhgWY+40jND7W2CeyU0NyJJ2t5rg2AE7M+VC
	sZRqgAnguuzFI9rB1kqgdjffI1KAO0RixuXzW+MKXnKMHrUol1Owdndqbsz+AF0nk1c=
X-Gm-Gg: AR+sD12KgSNCDztG+yOT3eSvrwxvOTDha/MRnre4iKyqrWUFSS/Ug+aa1r7fso57eIW
	n/uUS52eSuTWMCGxCpEgilFI4SkM9pZLvhmXe39uI/I/N9B3xkmyj29KvquCyNEvKofR8KYSS/A
	VGg38RiXXI74Nkp51syFL+tVBGR0swpuM7nLZHPQoU3lFieAbAzaxTGzVFAiF5I8kRGLaxD5nYX
	VylIb/VQW8DWTiXdWGFan7yZAbDil+25hZEC8nvRQQqEee9xrLZddZL1vE9+DcB5qMjvYfc8M8A
	o4zXW8AIjGTk4RvRLgytCLXgYjV4xDEa8xgn6bUNgezl6uRKo0bfU2GUfhSXaFeAbKNa7AnBqyY
	Il/WrrGqNhWw0O5Rc72wsXkeuWYJapfOFBCCfR700QVLe8o2v1MGaVQ9y1klURGuXiq4CxRV4Ca
	BZK6dZiiSm1DSgDPdHnP1eCTn6UkDwO5cNw08I+4Kg7FIX62aTfFfdzdvBJHnvVEFSPrTqNYBVd
	IjUWZG8Oq+9V+z2VqExktz9cqUzT0EEnJXofDM6+QN6b20x17BrTQD+ilishAkTJ4egt1qVXfVn
	2XYAqKvEFOI=
X-Received: by 2002:a05:600c:3513:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-499dc82c0d7mr38617775e9.12.1787732630642;
        Wed, 26 Aug 2026 01:23:50 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8b84esm17933655e9.1.2026.08.26.01.23.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 01:23:50 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	antonin.godard@bootlin.com,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v6 3/5] package.py: remove stripping and splitting skip for signed kernel modules
Date: Wed, 26 Aug 2026 10:23:19 +0200
Message-ID: <20260826082321.22104-4-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260826082321.22104-1-anis.bougrine10@gmail.com>
References: <20260826082321.22104-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244362

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


