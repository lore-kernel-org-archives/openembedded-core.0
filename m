Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1C72078B40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 15:48:47 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id s9-v6so9946851wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=3VeOydA7n8wf2vZ1kmGJ8P9XiN03NkGRJBqOLiVadG4=;
	b=dxORgdwa1s21mbuLmprYOIaVo1sXvFI4YJ3BXGEELvTe6Yg8xPNK51R23g2KDIy5f4
	W9zRPgJs45ZMOXTgeuomP4J/RQUR7ETdZ2hXWXSGbRs1q/jonBSC7urGgrejuXJV65p2
	SOvdzZRWl9ANISpYnYL7m8Ss6npHwuwKHv3qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3VeOydA7n8wf2vZ1kmGJ8P9XiN03NkGRJBqOLiVadG4=;
	b=UrU3a639w95fhrw8VtMmNMcuI2wX3Lm0Y1jDnBR0rmW7aLGVSFuT3h2pT/7s3h6AoJ
	Edgz4TXTCIWg2iPM/6TZktvp5HuoSnEOLKon4RCMTAt48q5cXAKdWrSgRAtR7Kqut1cc
	1ci2sXUAL8B4myLkzopyDJHZo92QM+vBfK9tKZtf/5DG+PtNnqEjqiqsazsBBdxQHXLa
	jpXoLxyEdDGfkgoGDmm4WWAULTVDjRTgGobMswMRY1gl2CodMkuEBlASN3it7YaEtIYG
	RzxhWKtfkeaKHrMVAYZvLdrcDiC6PjKJorXiI6ubCvNr+/YcUZAMEOje5T4pDCiophJ3
	BB7A==
X-Gm-Message-State: AOUpUlEwtWfyas8QuJA49QXQ6uzPMUgiADDOfPDAv+jWAQGLuX3P5vGv
	8fOIaQZEqdP2qaxD1Y8FANoWc6T7DPqvhg==
X-Google-Smtp-Source: AAOMgpc8VaHmdTa0yBMubY7osQzTltCQwO0UfbNHH/CY60i+Cl46DrMp15XSKpr86KcdV7cvKIruwQ==
X-Received: by 2002:a1c:e5cf:: with SMTP id
	c198-v6mr1889381wmh.113.1532101727495; 
	Fri, 20 Jul 2018 08:48:47 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g204-v6sm3337166wmd.26.2018.07.20.08.48.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 08:48:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 16:48:45 +0100
Message-Id: <20180720154845.4449-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] package: Clean up getstatusoutput usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2018 15:48:47 -0000

Replace usage of oe.utils.getstatusoutput() with direct subprocess calls. The
call is just a wraper to the subprocess call of the same name and requires
the caller to handle exceptions themselves. We usually do this badly, failing
to show the output or the command or the return code.

Its much safer to rely on a call like subprocess.check_output() instead.

This also makes it easier to spot and remove cases where shell=True isn't
needed in a later cleanup.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 978a8fbeb57..86a6090f1b0 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -430,6 +430,7 @@ def copydebugsources(debugsrcdir, d):
     # and copied to the destination here.
 
     import stat
+    import subprocess
 
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     if debugsrcdir and os.path.isfile(sourcefile):
@@ -466,23 +467,20 @@ def copydebugsources(debugsrcdir, d):
         processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
 
         cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
-        (retval, output) = oe.utils.getstatusoutput(cmd)
-        # Can "fail" if internal headers/transient sources are attempted
-        #if retval:
-        #    bb.fatal("debug source copy failed with exit code %s (cmd was %s)" % (retval, cmd))
+        try:
+            subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError:
+            # Can "fail" if internal headers/transient sources are attempted
+            pass
 
         # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
         # Work around this by manually finding and copying any symbolic links that made it through.
         cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)" % (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dvar, debugsrcdir)
-        (retval, output) = oe.utils.getstatusoutput(cmd)
-        if retval:
-            bb.fatal("debugsrc symlink fixup failed with exit code %s (cmd was %s)" % (retval, cmd))
+        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
         # The copy by cpio may have resulted in some empty directories!  Remove these
         cmd = "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
-        (retval, output) = oe.utils.getstatusoutput(cmd)
-        if retval:
-            bb.fatal("empty directory removal failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
         # Also remove debugsrcdir if its empty
         for p in nosuchdir[::-1]:
@@ -643,6 +641,8 @@ python package_do_split_locales() {
 }
 
 python perform_packagecopy () {
+    import subprocess
+
     dest = d.getVar('D')
     dvar = d.getVar('PKGD')
 
@@ -650,9 +650,7 @@ python perform_packagecopy () {
     # files to operate on
     # Preserve sparse files and hard links
     cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (dest, dvar)
-    (retval, output) = oe.utils.getstatusoutput(cmd)
-    if retval:
-        bb.fatal("file copy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
     # replace RPATHs for the nativesdk binaries, to make them relocatable
     if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d):
-- 
2.17.1


