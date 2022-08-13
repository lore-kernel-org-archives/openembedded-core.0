Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C586C3F6B0
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 20:35:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.8558.1660422905151526232
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 13:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QTPSMbki;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id j7so4678930wrh.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 13:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=QBT+jHDdtvtu22KpPbuQ1AGEVdBbC9mwR0GrFr1eTXo=;
        b=QTPSMbkiXzo+iJYLWGA2eJbe1velRGanG94RtY8A3iUckeAou+sm9KUszLaihTFeIT
         0TnBXJUi0ZCEWNwnoBC5FDdL2jhwZYPwpQtdXftlckkeYp1lo+dTah+q07zi+OVv070F
         qohYnMdKq+ZPlDfCLhYKlGgnIxOtyzBxL+u+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=QBT+jHDdtvtu22KpPbuQ1AGEVdBbC9mwR0GrFr1eTXo=;
        b=s5E9aeJoyXD2/t9mclpTrYG3JHpLf47hZDDInDzknz8uTH2cOmeMmYepogdv/HcalT
         fioUtY12A6WMOGRmdDufw9Oa2Xy5lbMPhK/Lb1X+8lTK2AkHst6vc/p8L4i3Sbq04Eko
         oDliVxd2BSnkWM6P1VTr6P0rFUX6A2BN9+bR67ZtnUxtsfI9x61gJUHH7rmY+8IONBay
         +jfTHBw/bZavMB+lzXZjPWU9DUaUZZQVLeROaLcb3Z3LlJK7fPWQXzIuc5opqF6xQkXV
         tl949mcDRayPh3zrqjLuRLTXOmB2nuShY/4ufmoGr2g4ZDlBO0gZKyyR+vy3JMgQh+hR
         HD1w==
X-Gm-Message-State: ACgBeo1jEB9b6kAEkwYyHlLLG4EirbPDbnTWT/8+D+J2rZR7IakceE5G
	CwipxLx7CcVL/PAsGoVBp6kf/UVm8varyA==
X-Google-Smtp-Source: 
 AA6agR7icZdFHSRltDITCWQ9JdpQLeCpR4f7r2IlouhKb+jvJO7TrY1NC19lYNRL1n+PSIPfa+Z32A==
X-Received: by 2002:a05:6000:18a2:b0:221:7d32:e6a5 with SMTP id
 b2-20020a05600018a200b002217d32e6a5mr4998302wri.278.1660422903170;
        Sat, 13 Aug 2022 13:35:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6d8:ef31:d475:da8f])
        by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003a1980d55c4sm4182050wmq.47.2022.08.13.13.35.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 13:35:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] package: Switch debug source handling to use prefix map
Date: Sat, 13 Aug 2022 21:34:58 +0100
Message-Id: <20220813203501.1111519-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220813203501.1111519-1-richard.purdie@linuxfoundation.org>
References: <20220813203501.1111519-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 20:35:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169314

Reproducible builds are no longer a configuration option but are required.
We also rely on the prefix mapping capability of the compilers now.

As such, rewrite the source locating code to use the prefix maps instead
of taking a guess about WORKDIR which isn't correct for kernels, gcc,
externalsrc and probably more.

Instead, iterate the maps to locate any matching source code, keeping
in mind that multiple maps may map to one target location.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package.bbclass | 68 ++++++++++++-----------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 418400da8c9..2d985d8affd 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -565,26 +565,16 @@ def copydebugsources(debugsrcdir, sources, d):
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
@@ -595,28 +585,26 @@ def copydebugsources(debugsrcdir, sources, d):
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


