Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6570C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:52 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.28239.1658155789352625933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eTmQBy08;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id q16so7694117pgq.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1JNhF9Lak23IrYMTuxgy6rpBPOIkleJ/SKoCCZgzqY8=;
        b=eTmQBy08rxUP23sngAOPFVysSh31lVk5VgxIRZVUp3VvXQW8PXMJxVetRXsI8Eebnd
         sW8OXe7TnnM1FrIuGe1R6pPDnl1576hNQSA82jxUrgY5PenWeog5Q5zCqIpG3STw44qv
         mYaGb/4pj1Zvp1mRGUv5/sE9i0KuZAdHyHvE2UG6O0d1rE2k0QbWYSn+gFY4eMWosPAh
         tCv+NIIdmoz4Q6yuC4PqPp8W8rVqxKQR0Arzs1ctVzCkdsoNpJP3VCKLaraP29nvvxJZ
         9/fKCNrAI8UhRGxmE8/06xEhIUeNclgJ+MnYfxnkdyW/6ascJM7lFi/tUTwyeV6sqISB
         inOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1JNhF9Lak23IrYMTuxgy6rpBPOIkleJ/SKoCCZgzqY8=;
        b=s/c3b9DTInHG1QidjY5QkoPmN2ARdfsnUZocquNNjf6e7ivOZ7Nirtbdc+wt6UzyUt
         0FsnKYgqGqcRZF/Ea38gYPtJBYvEG8uuPtuNaG6dgsl1eLohpGIFmw+tx6B/YPFLjoFr
         9kCtxIbsJfUSLxLYJRX0JXYE8H5qCrM/1JXo7Z3mIOX+docheujBdnsTz5waASim9Acv
         3oLALBfYtavRqfcxp2vPzjkQqSuK8MTuxrZalztrq+qvuyPjg3IB4SqZGlt/ZAAWFmRp
         H15MXa8Sz5J2GG6MBZrXPJeLsf+Zlff+Hv7BFWXp7LMGUXaUtt/mECdOnZur8CDOWQgc
         9esg==
X-Gm-Message-State: AJIora9nnFgei+JoAk9E07hdT+brqbflxiReUDZuSo3z3n3Ugac1Zj1X
	D+IIIHg+joSG8EYVsbh9jljj7guJm9XEQQu6
X-Google-Smtp-Source: 
 AGRyM1uNTdWmY5CkR5meDayLA+R498NMlrbwXjonUc+duvnPUztSA1CQMhShYxtfgw8PNCwE+uwaCg==
X-Received: by 2002:a05:6a00:230a:b0:52a:d0e8:c936 with SMTP id
 h10-20020a056a00230a00b0052ad0e8c936mr29194841pfh.67.1658155788184;
        Mon, 18 Jul 2022 07:49:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/35] package.bbclass: Fix base directory for
 debugsource files when using externalsrc
Date: Mon, 18 Jul 2022 04:48:38 -1000
Message-Id: 
 <2772b77c0e3d0f6226a2d7c40a59900a6d7c942f.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168213

From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>

While executing do_package, bitbake checks for a list of
debug source files and uses a pattern to match the ones
to be included in copydebugsources.

Previously when externalsrc was in use either directly or by
using devtool, the source location changed and this pattern
no longer matched, hence debug source files failed to be
included in the corresponding package.

Check when the source directory isnt the default (based on
WORKDIR), and change the pattern used to match debug source
files if that is the case, allowing us to perform do_package
properly.

Workaround debugsource.list containing paths from the host by
moving debug source files away from the host directory
structure  to avoid host contamination (this seems to happen
when packages use $TMPDIR/work-shared and externalsrc is
in use).

Test matrix included using:
- devtool to use externalsrc automatically
- externalsrc with a non-devtool based source directory
- No externalsrc at all
Tested the following packages to be working:
- glibc ($TMPDIR/work-shared based)
- libxcrypt ($TMPDIR/work based)

[YOCTO 8015]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a887bd96fd0a15398e8077ea79df5070971866e4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 62050a18b8..4850134022 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -553,13 +553,25 @@ def copydebugsources(debugsrcdir, sources, d):
         strip = d.getVar("STRIP")
         objcopy = d.getVar("OBJCOPY")
         workdir = d.getVar("WORKDIR")
+        sdir = d.getVar("S")
+        sparentdir = os.path.dirname(os.path.dirname(sdir))
+        sbasedir = os.path.basename(os.path.dirname(sdir)) + "/" + os.path.basename(sdir)
         workparentdir = os.path.dirname(os.path.dirname(workdir))
         workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
 
+        # If S isnt based on WORKDIR we can infer our sources are located elsewhere,
+        # e.g. using externalsrc; use S as base for our dirs
+        if workdir in sdir:
+            basedir = workbasedir
+            parentdir = workparentdir
+        else:
+            basedir = sbasedir
+            parentdir = sparentdir
+
         # If build path exists in sourcefile, it means toolchain did not use
         # -fdebug-prefix-map to compile
         if checkbuildpath(sourcefile, d):
-            localsrc_prefix = workparentdir + "/"
+            localsrc_prefix = parentdir + "/"
         else:
             localsrc_prefix = "/usr/src/debug/"
 
@@ -581,7 +593,7 @@ def copydebugsources(debugsrcdir, sources, d):
         processdebugsrc += "sed 's#%s##g' | "
         processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
 
-        cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
+        cmd = processdebugsrc % (sourcefile, basedir, localsrc_prefix, parentdir, dvar, debugsrcdir)
         try:
             subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError:
@@ -591,9 +603,22 @@ def copydebugsources(debugsrcdir, sources, d):
         # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
         # Work around this by manually finding and copying any symbolic links that made it through.
         cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
-                (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dvar, debugsrcdir)
+                (dvar, debugsrcdir, dvar, debugsrcdir, parentdir, dvar, debugsrcdir)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
+
+        # debugsources.list may be polluted from the host if we used externalsrc,
+        # cpio uses copy-pass and may have just created a directory structure
+        # matching the one from the host, if thats the case move those files to
+        # debugsrcdir to avoid host contamination.
+        # Empty dir structure will be deleted in the next step.
+
+        # Same check as above for externalsrc
+        if workdir not in sdir:
+            if os.path.exists(dvar + debugsrcdir + sdir):
+                cmd = "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir, dvar,debugsrcdir)
+                subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+
         # The copy by cpio may have resulted in some empty directories!  Remove these
         cmd = "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
-- 
2.25.1


