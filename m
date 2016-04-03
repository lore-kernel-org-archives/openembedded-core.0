Return-Path: <max.oss.09@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 16FA4731B3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 20:57:59 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id p188so115125923lfd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Apr 2016 13:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pAExpbvmrkX1QAyg7vy8peD8mZsUGs65pgqsdvsE894=;
	b=HtuiSPaGEy3SrAfyZ3qyF18L3dFhnYzPv3G/mddKKSyBoVY2VlI3ugBvZlTBO5SD8J
	PV8lGVJa8zO/c5VRCdM4rE0M5t/7IFzZUqmJjHeaPgLBS4qjfCVoEiq7Bfukecdo2xXE
	Bfr91yAO3IWQA1Clbxm6lsvUr0QhAA76kSvGYkFUnqeKUv6vfMLbu0qCT3zEACQGs1ii
	zVk/c8iUC4iqnyalQ2mylZb+gNB/1IUI+gD1ubjFrlEeDeXiI70PXBh+2D4q/KH6vO9+
	i3qFC74tcBzeI6sUb5XOD8r0tFbdwGsevNBOt/tt6WiajbMESuNbGyhet4OhI5bi06to
	z5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pAExpbvmrkX1QAyg7vy8peD8mZsUGs65pgqsdvsE894=;
	b=ZfLPXvFWnN782ODouuBtCdSTch/DO76MDrmtLEPKKBMu2zd9J+DjAMmOGacHquhP/2
	9FSe/cMUVwapQ1UZddyrHO40NdFwZIRuEpfQBG0Q9js0t44HlOgLiVuqwxj5VrQoGvYB
	j2ulIB0za7/owpZ8tKiWK5t7Vxt5uCaVCPNiplqWy/YmwPZS6+LMx9/2Kol+uoxAimIV
	GhUlzL9xWioDyx+VIGNEyYaaO5vhLu4GAC3N1s/pikApdfz4EOTpRXDRCFld+mLTuw9I
	8plcy+3mAhNSuT1QWDAVh7h24xRw+1FYkwsBNKOH7hGEATYnUiRXuVvGz1vlDNXzJ114
	5Fhg==
X-Gm-Message-State: AD7BkJJlS090uyKFEOn+UKUTA/PBoV4Sxo3zqaKLklm5mC50lHWmLfmd+yFksAP7GX/rsw==
X-Received: by 10.194.78.129 with SMTP id b1mr14504990wjx.60.1459717078896;
	Sun, 03 Apr 2016 13:57:58 -0700 (PDT)
Received: from Saturn.local.all (212-41-96-121.adsl.solnet.ch. [212.41.96.121])
	by smtp.gmail.com with ESMTPSA id
	kj9sm25611191wjb.14.2016.04.03.13.57.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Apr 2016 13:57:58 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Apr 2016 22:57:18 +0200
Message-Id: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.2
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Sun, 03 Apr 2016 20:58:01 -0000

Addresses https://bugzilla.yoctoproject.org/show_bug.cgi?id=8939

Source files deployed with the *-dbg packages are owned by the user
running bitbake leading to warnings as the one below.

WARNING: glibc-2.23-r0 do_package_qa: QA Issue: glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/resolv.h is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination
glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/monetary.h is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination
glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/locale.h is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination
...

The files are copied as part of the do_package task.
The patch chowns all file in packages/usr/src after cpio copied them into the
package directory.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---


 meta/classes/package.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index bdbe96d..d9ef62c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -362,6 +362,7 @@ def copydebugsources(debugsrcdir, d):
     # and copied to the destination here.
 
     import stat
+    import subprocess
 
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     if debugsrcdir and os.path.isfile(sourcefile):
@@ -410,6 +411,28 @@ def copydebugsources(debugsrcdir, d):
         if retval:
             bb.fatal("debugsrc symlink fixup failed with exit code %s (cmd was %s)" % (retval, cmd))
 
+        # cpio --no-preserve-owner does not create the destination files with
+        # owner root even when run under pseudo, chown them explicitely.
+        fakerootcmd = d.getVar('FAKEROOTCMD', True)
+        if not os.path.exists(fakerootcmd):
+            logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
+            return 2
+        # Set up the appropriate environment
+        newenv = dict(os.environ)
+        fakerootenv = d.getVar('FAKEROOTENV', True)
+        for varvalue in fakerootenv.split():
+            if '=' in varvalue:
+                splitval = varvalue.split('=', 1)
+                newenv[splitval[0]] = splitval[1]
+        kwargs = dict(env = newenv, shell = True)
+
+        cmd = "find '%s%s' -not -uid 0 -exec chown 0:0 {} \;" % (dvar, debugsrcdir)
+        if fakerootcmd is not None:
+            cmd = "%s %s" % (fakerootcmd, cmd)
+        retval = subprocess.call(cmd, **kwargs)
+        if retval:
+            bb.fatal("debugsrc chown failed with code %s (cmd was %s)" % (retval, cmd))
+
         # The copy by cpio may have resulted in some empty directories!  Remove these
         cmd = "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
         (retval, output) = oe.utils.getstatusoutput(cmd)
-- 
2.6.2


