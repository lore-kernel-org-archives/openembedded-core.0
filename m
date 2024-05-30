Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D28C27C44
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:24:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.663.1717086260296172730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 09:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gHZInsCf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35dc0472b7eso1034607f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717086258; x=1717691058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MooWPPdzvDePAKrG5H/k9VJJr2pZmOd7kDevdX9I9CI=;
        b=gHZInsCfItf2a4ue0RyqLVoG8t39ov3paPdIr998Uh9rFcVHgEPufwDW/WlczjD2RC
         6xw/8TDqaU9sHUCkTDVZ7wKPethGWK230YXgqBNOeGPlwe24mKnTaQ/WKFJ1X2TsuNlO
         HcyWuXwROgBvEBHBup4BsMuseY+WxZnhdZda4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717086258; x=1717691058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MooWPPdzvDePAKrG5H/k9VJJr2pZmOd7kDevdX9I9CI=;
        b=N6N6Tdu0yFz2f6F09+YswsJ+KcfGsqxhoU/CpGAOkzlcveIlkWggO/N2GqnFYYPWXC
         tyBWFzMzkMX+2JrnWlYuX0NcPieO6GQ/9V7aTbHw6WOLZHgl/8OZURviWTNCUo9KuN7s
         ayFhoUIZ9r4miOsqOZsrtTt+VvbSaNKg8irfpSczLpvCsXekWrONvhverCfhU3ZVRmoC
         sI/JQvxsVo6NJvRFvCLGlwSGhzk9xyjgEaU8X3gwvI9lQ3Lvj9OcTpDSShi+GMwzEqQW
         RZJOlRWm1K47bE3yM2MmKbeeALN+Cl85dHS1vlRNPQmav0oVDqCw1fiQ2rfEB5O2X3fO
         uxwA==
X-Gm-Message-State: AOJu0Yw3WIknw3IKSinsanxL5lyuXawRTwp+Gg6pvPRgDFAknF/wnR/G
	LjIlxnSHCi5P92MvvO49Y5DxRKK4yd/rvU/kpKYQSf+IwKGEY4jDVzfYycXyKUv57lhsBGPf+lG
	4
X-Google-Smtp-Source: AGHT+IFFDkKWXBM8OFT7+IyJifNHlEM+LKmv6iBPwT7xFPN5WNjTTSLRwoqpf5ExkgnluIL7nTrwJA==
X-Received: by 2002:adf:eac4:0:b0:35c:1cef:b36d with SMTP id ffacd0b85a97d-35dc02ba59amr1692235f8f.57.1717086258436;
        Thu, 30 May 2024 09:24:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e2db:3695:26f3:1f11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3587724c6f4sm12914650f8f.28.2024.05.30.09.24.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:24:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] sstate/buildhistory: Fix plaindirs handling to occur before SSTATEPOSTINSTFUNCS
Date: Thu, 30 May 2024 17:24:14 +0100
Message-Id: <20240530162414.3111406-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240530162414.3111406-1-richard.purdie@linuxfoundation.org>
References: <20240530162414.3111406-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 16:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200032

buildhistory is showing issues where plaindirs installed files (such as package
listings) are not reliably being handled with installs from sstate.

The reason is that plaindirs is being handled after SSTATEPOSTINSTFUNCS
instead of before it, meaning the files visible in a non-sstate accelerated
code run are different to show from an accelerated run.

This can be observed by the missing files lists for packages in buildhistory, both
in from scratch builds and in builds from sstate. In builds where sstate is installed
over an existing build directory, the files are present though, so there is a
determinism problem.

Fix this by moving the code into sstate_install, this is the only call
site for the funciton.

Since the move needs prepdir, move that as well as it's call site,
being careful to handle the two different definitions of SSTATE_INSTDIR. The
version originally in the function was obsolete and was causing the postinstfuncs
to run in an incorrect directory. The only user is buildhistory and it wasn't
sensitive to cwd however so this happened not to cause a problem. Fix the
code to use the correct location.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 47 +++++++++++++++---------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index f4ebeb5859a..beb22f424e8 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -223,12 +223,23 @@ def sstate_install(ss, d):
     import oe.sstatesig
     import subprocess
 
+    def prepdir(dir):
+        # remove dir if it exists, ensure any parent directories do exist
+        if os.path.exists(dir):
+            oe.path.remove(dir)
+        bb.utils.mkdirhier(dir)
+        oe.path.remove(dir)
+
+    sstateinst = d.getVar("SSTATE_INSTDIR")
+
+    for state in ss['dirs']:
+        prepdir(state[1])
+        bb.utils.rename(sstateinst + state[0], state[1])
+
     sharedfiles = []
     shareddirs = []
     bb.utils.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
 
-    sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
-
     manifest, d2 = oe.sstatesig.sstate_get_manifest_filename(ss['task'], d)
 
     if os.access(manifest, os.R_OK):
@@ -327,6 +338,17 @@ def sstate_install(ss, d):
         if os.path.exists(state[1]):
             oe.path.copyhardlinktree(state[1], state[2])
 
+    for plain in ss['plaindirs']:
+        workdir = d.getVar('WORKDIR')
+        sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
+        src = sstateinst + "/" + plain.replace(workdir, '')
+        if sharedworkdir in plain:
+            src = sstateinst + "/" + plain.replace(sharedworkdir, '')
+        dest = plain
+        bb.utils.mkdirhier(src)
+        prepdir(dest)
+        bb.utils.rename(src, dest)
+
     for postinst in (d.getVar('SSTATEPOSTINSTFUNCS') or '').split():
         # All hooks should run in the SSTATE_INSTDIR
         bb.build.exec_func(postinst, d, (sstateinst,))
@@ -391,29 +413,8 @@ def sstate_installpkgdir(ss, d):
         # All hooks should run in the SSTATE_INSTDIR
         bb.build.exec_func(f, d, (sstateinst,))
 
-    def prepdir(dir):
-        # remove dir if it exists, ensure any parent directories do exist
-        if os.path.exists(dir):
-            oe.path.remove(dir)
-        bb.utils.mkdirhier(dir)
-        oe.path.remove(dir)
-
-    for state in ss['dirs']:
-        prepdir(state[1])
-        bb.utils.rename(sstateinst + state[0], state[1])
     sstate_install(ss, d)
 
-    for plain in ss['plaindirs']:
-        workdir = d.getVar('WORKDIR')
-        sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
-        src = sstateinst + "/" + plain.replace(workdir, '')
-        if sharedworkdir in plain:
-            src = sstateinst + "/" + plain.replace(sharedworkdir, '')
-        dest = plain
-        bb.utils.mkdirhier(src)
-        prepdir(dest)
-        bb.utils.rename(src, dest)
-
     return True
 
 python sstate_hardcode_path_unpack () {

