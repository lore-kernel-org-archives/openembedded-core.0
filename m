Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 14506791A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 02:43:48 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id v71-v6so18676026itb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 19:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=frbiwBg0bwlu0djFjPqjCipHOxcunZ927/wLiMj2LVg=;
	b=Ls7CS/w79iFdu2O1YheTIODi4jZQBylOPU/rQea1m9faWYPMiz2lensiNKRrmrXs2+
	SiA202oM+4HADI579jtVLO0vusT+f4nWsqAwcU/faJJk/TsAVQ8T3P00e5so+v+uzIEW
	yNjVZm5i6DAHBnJvm5knqEuDx7CHH8+YC2nQO7Cz2fG/Ve5Egs+iAAqeuImQcgMj3VCL
	Hle8NklK2SILInfoVHXA7/RxvcW0wYcDfHNomKiG+Bwn4CWsqyaDYxy38CwQTgEZYZx9
	2n3MKY9a643y1NzOudfuVksMi7MnNMHoevCtjb+PyR57DIlXGCyVW89G5ass7wqTTBw9
	3+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=frbiwBg0bwlu0djFjPqjCipHOxcunZ927/wLiMj2LVg=;
	b=bUcwzSpUxaIP/wQIw2S84gGfutQhV9lfFyo2CNSMvnDP1aW+0eKuJyGDYk04BlJ2lC
	Wgz3FsOU25mTLmfQtoksYYz4BZfSkmvvFcdlP9IIV343zvCMRyTQBlB76Iv7jRWHuWxS
	sguqCXr+QKEKk/4wlIF5Rp8qEpBnNaxi7zIjQssWSHCpILM47VE1t5+wfm34lvmGsjOR
	E5QvtiEktPQTPjskZnzgcWMmWPX0MRyVXYAa2MSurR78Rg4mRoLx7c/0L83shti4Ay29
	FD9N2bA25ZnY/Wa+Hp7zK968UKuJ6CX0ljTATpim33LXtS7sVIpRV4OKKoo+ouajYmZt
	b/VQ==
X-Gm-Message-State: AOUpUlGnmD7X44i1M2XBBV7zauYENnfY7MIuKHHm7PY2+65TveZfo9fs
	L03+thocJy7p2WbkIF3bSCV1ia+v
X-Google-Smtp-Source: AA+uWPyTf3cS9k28B60r6AkBK+06QHJUrgGVqYF7vzSyXYUE5CbjYR/1iFCK1oKZi8lgyWZfTnZ/pQ==
X-Received: by 2002:a24:3ec3:: with SMTP id
	s186-v6mr33171562its.73.1534733028922; 
	Sun, 19 Aug 2018 19:43:48 -0700 (PDT)
Received: from localhost.localdomain
	([2605:a601:21d1:5200:620a:c230:ada8:3135])
	by smtp.gmail.com with ESMTPSA id
	x7-v6sm866978ioh.3.2018.08.19.19.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 Aug 2018 19:43:48 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 21:43:42 -0500
Message-Id: <20180820024342.15484-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] classes/package: Clean up getstatusoutput
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
X-List-Received-Date: Mon, 20 Aug 2018 02:43:48 -0000

Replaces usage of the deprecated oe.utils.getstatusoutput() with Python
subprocess calls.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/package.bbclass | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4ce9de2f573..b05d2858281 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -380,6 +380,7 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
     # sourcefile is also generated containing a list of debugsources
 
     import stat
+    import subprocess
 
     src = file[len(dvar):]
     dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
@@ -409,16 +410,18 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
 
     bb.utils.mkdirhier(os.path.dirname(debugfile))
 
-    cmd = "'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile)
-    (retval, output) = oe.utils.getstatusoutput(cmd)
-    if retval:
-        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+    cmd = (objcopy, '--only-keep-debug', file, debugfile)
+    try:
+        subprocess.check_output(cmd)
+    except subprocess.CalledProcessError as e:
+        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (e.returncode, ' '.join(cmd), ":\n%s" % output.decode('utf-8') if e.output else ""))
 
     # Set the debuglink to have the view of the file path on the target
-    cmd = "'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file)
-    (retval, output) = oe.utils.getstatusoutput(cmd)
-    if retval:
-        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+    cmd = (objcopy, '--add-gnu-debuglink', debugfile, file)
+    try:
+        subprocess.check_output(cmd)
+    except subprocess.CalledProcessError as e:
+        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (e.returncode, ' '.join(cmd), ":\n%s" % output.decode('utf-8') if e.output else ""))
 
     if newmode:
         os.chmod(file, origmode)
-- 
2.17.1


