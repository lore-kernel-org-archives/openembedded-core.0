Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 737DF6DC16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2014 10:43:48 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so2471844eek.37
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2014 02:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zco3LnZdX41jxOORBQvGALlCJWNmRLy+w39Q/us8WXo=;
	b=DfSsZLt4lSbQ7FBa+/pNOHtHQabfC6XwX9j2wLfWcgJHhkMbXsYP9VcyP9pmDU32hs
	gZOGCRYyiGu3SXxsqZlll+YaVf9yfhSaQhDH1gZPD2QrB4YtXoAxqyG98jDLGPDjylcg
	AjXPRUOD/W+s4fFTbk1WBQ04RS5eQenIiNecf77S+kTgbxxwxkVg7A4IsNGYoBASxW/C
	cUI94wgY6gfuXpZo+PU5ljT6bDpUZ776ED0hFLXjftdazNbX+2WBq0XID7koxag3kxHY
	51skW5xRj7cPhshW0x17GYfxay3pHrviI+C0i1rd54V4fVFLNfdqjIhSXi/EfMujF/if
	2xFA==
X-Received: by 10.14.88.131 with SMTP id a3mr19175543eef.64.1393152229132;
	Sun, 23 Feb 2014 02:43:49 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm49637810eeg.5.2014.02.23.02.43.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Feb 2014 02:43:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2014 11:44:22 +0100
Message-Id: <1393152262-30469-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <CABcZAN=PaZ+J4XQ6jp6GbTVTDmA2_pGTfdrA2mC52d7ZH2KdGw@mail.gmail.com>
References: <CABcZAN=PaZ+J4XQ6jp6GbTVTDmA2_pGTfdrA2mC52d7ZH2KdGw@mail.gmail.com>
Subject: [RFC][PATCH] package.py: use subprocess.Popen for rpmdeps call
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
X-List-Received-Date: Sun, 23 Feb 2014 10:43:52 -0000

* I've noticed errors like this in log.do_package:

  DEBUG: Executing python function package_do_filedeps
  sh: 1: Syntax error: "(" unexpected
  sh: 1: Syntax error: "(" unexpected
  DEBUG: Python function package_do_filedeps finished

  which are actually caused by some filenames included in package
  containing '()' characters

  Maybe we should change meta/classes/package.bbclass to
  fail when some filedeprunner call fails like this and fix
  filedeprunner to escape '()' and other possibly dangerous chars
  it's called like this:
  processed = list(pool.imap(oe.package.filedeprunner, pkglist))

* don't use shell=True
* show the command when it fails and let do_package task to fail

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/package.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 9a0ddb8..f8b5322 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -54,7 +54,7 @@ def file_translate(file):
     return ft
 
 def filedeprunner(arg):
-    import re
+    import re, subprocess, shlex
 
     (pkg, pkgfiles, rpmdeps, pkgdest) = arg
     provides = {}
@@ -89,8 +89,11 @@ def filedeprunner(arg):
 
         return provides, requires
 
-    dep_pipe = os.popen(rpmdeps + " " + " ".join(pkgfiles))
-
-    provides, requires = process_deps(dep_pipe, pkg, pkgdest, provides, requires)
+    try:
+        dep_popen = subprocess.Popen(shlex.split(rpmdeps) + pkgfiles, stdout=subprocess.PIPE)
+        provides, requires = process_deps(dep_popen.stdout, pkg, pkgdest, provides, requires)
+    except OSError as e:
+        bb.error("rpmdeps: '%s' command failed, '%s'" % (shlex.split(rpmdeps) + pkgfiles, e))
+        raise e
 
     return (pkg, provides, requires)
-- 
1.9.0


