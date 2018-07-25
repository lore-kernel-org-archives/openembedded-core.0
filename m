Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2881378870
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 18:36:14 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id h23-v6so10011766ita.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 11:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wtOYwa8jPxE5kT+jzTSTpmRQq1N99tkjlE0+m2Zr/ns=;
	b=fZNedmLwfPONPfhxDa8fxdOv6HM39tOgeqsPTgstgb1Do4Xp3O78r/XhSzu4ygMBmJ
	zdubs9TSupSl3/NQp5OM9R5676oztJltFypMTEJ9lSCjMHP1Z8+fawpewETLoqzZtPQs
	hCA8bqlf2iaIFTZ7z+3SmzT4Po9VNR77noYdVANZNhE2sVKdv+nUOKYPmx1goZ39vCzK
	rBRVyGp/ARJJ46rOZYvFbajYGSh707U8WwahgKBS/LLD4H73fn/XIyqCY0mukGM5dN71
	xj7uWijYxY7rVB+DStaClfhARYTjDoGhya2iOBICQpqW6Z7USi1t1k2dscxI2VA9wz5S
	ccZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wtOYwa8jPxE5kT+jzTSTpmRQq1N99tkjlE0+m2Zr/ns=;
	b=MQ0dr9J9mhXX0sphUSNL7bb3+oUz/PBCTgrleKoba6nlnhHShcUpr/RddKqbotuc0i
	mNnOWe/itRanwXcWlAmd+BZevVI3cRGJYNrNo6+9iVzjqeB8JOuv/LIgakcyuV61EpaR
	O/5unbH1vN69XG/x+U7EU6Ra5gHvtQvwkEGoyoJzklWFnF6M6L9ycOfUMLPlWnXXZ4F7
	VwkJWC8/AfPhD01H/M7IvHSmlKdYRBJjCZEM7i3mi5FuiHI8FinhmSnxoxHUQqGKpfDy
	Qj++9sPYxsFegtgKCnFKz+CT0QLaRKEPKyjamvqIb5OuXuDAdx1R7IzZ723aM1PWewp3
	nh6Q==
X-Gm-Message-State: AOUpUlHiH3lXKc3oF0Jb33+mws0doxLkznRRUahnj76K8Kh2okxV4DN8
	4Iqp6u21yaWL3l+RGgElmsKB2lIF
X-Google-Smtp-Source: AAOMgpeJpbG3ZuvLrU0pZ6LfeNXy2w6TCCskuqhFbGXuGpOfZ3h+hCKpHfoJqRPj/yFe3oGA6nvDCg==
X-Received: by 2002:a02:5684:: with SMTP id
	u4-v6mr20795386jad.36.1532543775040; 
	Wed, 25 Jul 2018 11:36:15 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	f20-v6sm600837iog.5.2018.07.25.11.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jul 2018 11:36:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2018 13:35:29 -0500
Message-Id: <20180725183529.4478-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] classes/kernel-yocto: Cleanup getstatusoutput usage
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
X-List-Received-Date: Wed, 25 Jul 2018 18:36:14 -0000

Replace usage of os.utils.getstatusoutput() with direct subprocess
calls. Pass a modified environment and working directory where necessary
to bypass the need to execute in a shell.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 82d80741a95..3a7717282f3 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -319,7 +319,7 @@ do_kernel_configme() {
 addtask kernel_configme before do_configure after do_patch
 
 python do_kernel_configcheck() {
-    import re, string, sys
+    import re, string, sys, subprocess
 
     # if KMETA isn't set globally by a recipe using this routine, we need to
     # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
@@ -328,13 +328,23 @@ python do_kernel_configcheck() {
     if not os.path.exists(kmeta):
         kmeta = "." + kmeta
 
-    pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH'), "${S}/scripts/util/")
+    s = d.getVar('S')
 
-    cmd = d.expand("scc --configs -o ${S}/.kernel-meta")
-    ret, configs = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
+    env = os.environ.copy()
+    env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
 
-    cmd = d.expand("cd ${S}; kconf_check --report -o ${S}/%s/cfg/ ${B}/.config ${S} %s" % (kmeta,configs))
-    ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
+    try:
+        configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
+    except subprocess.CalledProcessError:
+        # Is this really non-fatal?
+        pass
+
+    try:
+        subprocess.check_call(['kconf_check', '--report', '-o',
+                '%s/%s/cfg' % (s, kmeta), d.getVar('B') + '/.config', s, configs], cwd=s, env=env)
+    except subprocess.CalledProcessError:
+        # Is this really non-fatal?
+        pass
 
     config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
     bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
-- 
2.17.1


