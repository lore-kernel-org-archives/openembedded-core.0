Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96E1D44D62
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:33:36 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.45795.1730900016411439451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ORhA8ob3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so5397555b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900016; x=1731504816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3oa+z62HQFmGI0AbYcWvdSeQdoiXEEThnbJi5iViao=;
        b=ORhA8ob3tMAO9sxgzGmxC1FGD17DhzbTWfD219ov1g/TBOx2ubVxVXBDWq9KOSdyAo
         Fxk+SQ+sXHTB0NQ0QzMDUXmaPByTo2EpqU84qCJNVH9vMXCJDSN8wZ2NBpIxkm7U1JL2
         6ESqxS0Bpf+h9YRkiolMBR8/PYvaTM4Lk9QuZK8rna5KESX2JonFzvMN4ObmXX2xUWJM
         mAHXAkjVczru5+ujfw+XqhZ4CPR6kp2scetKbRlNC6TUlrqeAtKenIEXtHyqjD3x04d2
         o1P1n1D/aa7SdceqGkFtt6Rtf5ygiDb5YJ4yxGfAd3B9WL/z2Fnr4O1Fx2N769C9CR/y
         JrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900016; x=1731504816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3oa+z62HQFmGI0AbYcWvdSeQdoiXEEThnbJi5iViao=;
        b=A2TVe8334jdy9BAiVFpTh+fTGNPCy9zCN0PHHGhkNdnKVxe0z/CpCHjX+5WGy5Gzh1
         IV0kqy8knS242FStragJXS9IFPakE6bSvgYcgwPvtkfdrYhuFF6ZLHOn8+Y67auhE1zv
         1yhAIS4Rz1yvhdiM9YXCZeUb/er7U7vvk0qlPoxyQ7N1lajcGoQSaMWEQ0DhdsmBhKH9
         oLUUeWorm7ALG7QnLqffyPDaR9xmPsndKOJnr+C5rB6uOv12HR3h/Ewu9QkFd3mXirww
         sH4VQG4gE3dAeWlV5EQnmfOyy6UTpEhnsMFDBecUSXl5+5uKStU5aOIFzRX6sCUDrBUs
         iaXg==
X-Gm-Message-State: AOJu0Yws5vTh42Gb1xYB7DARFo188tsj+Brs0jw9Evr/I04q2+0GcX+k
	i1O+7lEga2jrhlnOXN3kHuQuZISnzQwj2aMm3xE9K2VXHRX/DqEOH75nN1idwOMlp3b1pt964Wa
	Q
X-Google-Smtp-Source: AGHT+IFczEOnnsqvr2o+o5W0+xLq9k1mxvj6SYCQrro97/r/O9zP+IoGsZmeXv89WWk7ZnIJUPAq/Q==
X-Received: by 2002:a05:6a20:c998:b0:1d5:1354:5256 with SMTP id adf61e73a8af0-1d9a84d9806mr55108657637.39.1730900015632;
        Wed, 06 Nov 2024 05:33:35 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5722sm11631717b3a.71.2024.11.06.05.33.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:33:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/5] package: Switch debug source handling to use prefix map
Date: Wed,  6 Nov 2024 05:33:21 -0800
Message-Id: <80289f49d0c5ca98da1d1558728b8a468aab4326.1730899830.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730899830.git.steve@sakoman.com>
References: <cover.1730899830.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206771

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Reproducible builds are no longer a configuration option but are required.
We also rely on the prefix mapping capability of the compilers now.

As such, rewrite the source locating code to use the prefix maps instead
of taking a guess about WORKDIR which isn't correct for kernels, gcc,
externalsrc and probably more.

Instead, iterate the maps to locate any matching source code, keeping
in mind that multiple maps may map to one target location.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cbd6144a9769d21371ae0fe04db2adc05f6eed02)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 68 +++++++++++++++---------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 67351b2510..07bf5eb426 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -574,26 +574,16 @@ def copydebugsources(debugsrcdir, sources, d):
         objcopy = d.getVar("OBJCOPY")
         workdir = d.getVar("WORKDIR")
         sdir = d.getVar("S")
-        sparentdir = os.path.dirname(os.path.dirname(sdir))
-        sbasedir = os.path.basename(os.path.dirname(sdir)) + "/" + os.path.basename(sdir)
-        workparentdir = os.path.dirname(os.path.dirname(workdir))
-        workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
-
-        # If S isnt based on WORKDIR we can infer our sources are located elsewhere,
-        # e.g. using externalsrc; use S as base for our dirs
-        if workdir in sdir or 'work-shared' in sdir:
-            basedir = workbasedir
-            parentdir = workparentdir
-        else:
-            basedir = sbasedir
-            parentdir = sparentdir
+        cflags = d.expand("${CFLAGS}")
 
-        # If build path exists in sourcefile, it means toolchain did not use
-        # -fdebug-prefix-map to compile
-        if checkbuildpath(sourcefile, d):
-            localsrc_prefix = parentdir + "/"
-        else:
-            localsrc_prefix = "/usr/src/debug/"
+        prefixmap = {}
+        for flag in cflags.split():
+            if not flag.startswith("-fdebug-prefix-map"):
+                continue
+            if "recipe-sysroot" in flag:
+                continue
+            flag = flag.split("=")
+            prefixmap[flag[1]] = flag[2]
 
         nosuchdir = []
         basepath = dvar
@@ -604,28 +594,26 @@ def copydebugsources(debugsrcdir, sources, d):
         bb.utils.mkdirhier(basepath)
         cpath.updatecache(basepath)
 
-        # Ignore files from the recipe sysroots (target and native)
-        processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '((<internal>|<built-in>)$|/.*recipe-sysroot.*/)' | "
-        # We need to ignore files that are not actually ours
-        # we do this by only paying attention to items from this package
-        processdebugsrc += "fgrep -zw '%s' | "
-        # Remove prefix in the source paths
-        processdebugsrc += "sed 's#%s##g' | "
-        processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
-
-        cmd = processdebugsrc % (sourcefile, basedir, localsrc_prefix, parentdir, dvar, debugsrcdir)
-        try:
-            subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError:
-            # Can "fail" if internal headers/transient sources are attempted
-            pass
-
-        # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
-        # Work around this by manually finding and copying any symbolic links that made it through.
-        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
-                (dvar, debugsrcdir, dvar, debugsrcdir, parentdir, dvar, debugsrcdir)
-        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+        for pmap in prefixmap:
+            # Ignore files from the recipe sysroots (target and native)
+            cmd =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '((<internal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
+            # We need to ignore files that are not actually ours
+            # we do this by only paying attention to items from this package
+            cmd += "fgrep -zw '%s' | " % prefixmap[pmap]
+            # Remove prefix in the source paths
+            cmd += "sed 's#%s/##g' | " % (prefixmap[pmap])
+            cmd += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
 
+            try:
+                subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+            except subprocess.CalledProcessError:
+                # Can "fail" if internal headers/transient sources are attempted
+                pass
+            # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
+            # Work around this by manually finding and copying any symbolic links that made it through.
+            cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
+                    (dvar, prefixmap[pmap], dvar, prefixmap[pmap], pmap, dvar, prefixmap[pmap])
+            subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
         # debugsources.list may be polluted from the host if we used externalsrc,
         # cpio uses copy-pass and may have just created a directory structure
-- 
2.34.1


