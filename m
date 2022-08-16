Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C270C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 20:57:50 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.20998.1660683469463840658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gbQCyQEl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id v3so14047533wrp.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=QBT+jHDdtvtu22KpPbuQ1AGEVdBbC9mwR0GrFr1eTXo=;
        b=gbQCyQEl1TRE4y5Nq/uJnfhDJSuX2pQn0WDlXWR7z7szDrgNOuWy74o6+yHR5nJXQZ
         /EOIzaQVfNhJHsXws59OUBKwFF1Mgwudp1mY27DXYH2Dh3RuHju7s6mQ6PiRbTVi0an4
         KcmuOA0AZHw/zh+6a4WvQs9cWKb3PGXdi2Who=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=QBT+jHDdtvtu22KpPbuQ1AGEVdBbC9mwR0GrFr1eTXo=;
        b=oHa+5TCVy1L4KUGKqgjgIYJcODC4hYBnto7H7SmJSs++syBs7iQSLHMfRXaVwpUnb+
         qASP+JTMF4KQrfm5IrmgJlCBDh8A0T55ty5epyFN6a4Wf/fhrYSKXgUj6IEA0QmhzIJH
         cP1wHQaqlqWJ9cLnrYP6+7cNIy8X7lv5P+FlogM0jM9jzZTMrbJx2LzfGp0O6XW9/Gzl
         WfrgVp++BImrBuwfZDaDZwT2zf7D0/r4woBoBhGwEjSPlRikKZ1QS4p3OFEJexx386x2
         mUK1bVWsc2AQa5q3r+GZ3qSzX9pdH1QmUp7Hev9nf/CTGiP0JqSbHhtw92DmCTXts7rG
         lbmA==
X-Gm-Message-State: ACgBeo1BNcgm5H3US8yJRu9ymPa5Wo7mbmZyE2IgEf5szqcwMsLSexME
	fNVleRZxyQQDBGvtuXxgz3IU00GXb1RyEw==
X-Google-Smtp-Source: 
 AA6agR41S44yeMcqZ+CB5UOsdROYxRxb+PKL7+JmLhtugjYqqtLavIk+dm6vC7DvuzGyJeO5ghKl8A==
X-Received: by 2002:a5d:64e9:0:b0:220:7dd7:63eb with SMTP id
 g9-20020a5d64e9000000b002207dd763ebmr12663588wri.590.1660683467206;
        Tue, 16 Aug 2022 13:57:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b002250f9abdefsm5349460wrr.117.2022.08.16.13.57.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:57:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] package: Switch debug source handling to use prefix map
Date: Tue, 16 Aug 2022 21:57:39 +0100
Message-Id: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 20:57:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169455

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


