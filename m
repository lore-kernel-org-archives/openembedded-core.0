Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E842DC27C44
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 14:27:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.10339.1717079222578111589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 07:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NeXIYKlY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4202cea9a2fso9178795e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 07:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717079221; x=1717684021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilXH0l4VI8lYsz32MsIp48yY49CUvVGmt3YCUjODt2A=;
        b=NeXIYKlYeaKQ035oHyNWJzHu4j+cLve2ByMlCpSPSlbpxq0shWjtXNMpriiERX0lyu
         aXCzmBgw2oLxoX75RxEl5uZxlnqRIv3GVc1ch+40HCl7wWDFzyhbS1fkrUASBZ3npJRv
         xBBpc3AWjqou1ykMy7u1Qr1s5rUwm6ndq6JTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079221; x=1717684021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilXH0l4VI8lYsz32MsIp48yY49CUvVGmt3YCUjODt2A=;
        b=DuKDrBx/fxslwJ1QldQbX2W1A0/UEZ3RMFBB3dreLcVFr/0SPeRFIv28aOH/i86U8e
         FJkqmtQncR1pc7U+CPBY2wRMnz5J8W+TMH1ZK5wOVfYkudNBk+M4xcQagYHO1ymSQwQf
         ZvB4jkHFeegUHw/78fsxjSCZjOvaYGJoCSXDIBUwI3WO6oDnwPE89eaq7lgn3ceNzKpu
         HJ3xVMQq5w3vgo8u03VWzFsvCty7H7Em8YOK+lRNQ7ckdDmZc1cS46qOsxYRZCbID4Nk
         eUMvXSrPfu9rhnOqSu8noE2wSFu5qM63OBO0WVufWGzeZ5eC3tFntd64I+A2/aTUvGxG
         CGvg==
X-Gm-Message-State: AOJu0YzZsEaCooUFGNFghHgvNLT6BNLC+Tg2dTpt+OJNXVS1qofC4HjW
	J0e6N8+UO4yXr815PtAxa+5yoZZI3QB/f0pHiAHCiFDrH33yxtH7Y3bz3O+OjRom+sPBHjvdb4/
	X
X-Google-Smtp-Source: AGHT+IElx7B3ymgUfF1b2W5NkS+VaoJGM7w2+55ZoSyS8Q/E+AllLcUKj8S+nkwTLFm7e+ejMnyeZA==
X-Received: by 2002:a05:600c:1989:b0:420:355f:1c07 with SMTP id 5b1f17b1804b1-42127816306mr25534325e9.13.1717079220762;
        Thu, 30 May 2024 07:27:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e2db:3695:26f3:1f11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42127065ba7sm27081395e9.12.2024.05.30.07.27.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 07:27:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sstate/buildhistory: Fix plaindirs handling to occur before SSTATEPOSTINSTFUNCS
Date: Thu, 30 May 2024 15:26:58 +0100
Message-Id: <20240530142658.3095832-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240530142658.3095832-1-richard.purdie@linuxfoundation.org>
References: <20240530142658.3095832-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 14:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200024

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
index 76a7b59636c..d4e23426ed0 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -225,12 +225,23 @@ def sstate_install(ss, d):
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
@@ -329,6 +340,17 @@ def sstate_install(ss, d):
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
@@ -393,29 +415,8 @@ def sstate_installpkgdir(ss, d):
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

