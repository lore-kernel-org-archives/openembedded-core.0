Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id EE8BA606B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:40 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so5768719wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cyqQIoBQgCKdvBa6MRbiiOGsk/u54WDjyuc/CE+s0eY=;
	b=UJFtDb5o/jpWiVwxK6lDwpINu5ypZ2DXOXNgfyKadnRQDLeG4S+cvCAjZ7dHkOxhEN
	/4mEMFDG2GWYrZk5TLSELLATFPAOgRDsxOd+irBZCLNwr6XMym8mMU/ZFKg+f9nzfJ6q
	7MIP0IgUOYLSfuPVTQBQ7q2ZC9Q4aVHx9VkmKiWeRsrMWE/iE1jQ9VaEEqNgvAUXXJ/M
	0ZOFj96jWeFMKeouKdEXQl7NwQ6rB3/rvSH1SBrza7HT4eNZBhgJa1JncaKB8bufIVTj
	mDObxktsU4qMCethMd2FmvV5mDPz7pwWOzzMgFtYBeDNew0RPgGnva+hPJLyhgtq40eW
	l7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cyqQIoBQgCKdvBa6MRbiiOGsk/u54WDjyuc/CE+s0eY=;
	b=B/ZbcrpUOEhBKJHAylwtSaLU7GSKVtFP3817xCWql0JBVXRCznKqJn9AINfuRnzvQj
	OWC3hk/Unps+bpXHl6Mz+Gcxp5GIR6pieu02l+Lg+1fpC7RhcV2htkvfB8uQhVobVfeb
	7HacP+JwcleEw5r2VF950q7Tzjr+BfxVf+pwyNPqJTkFvJ/rb0peXxIqRS5uZn10af+8
	dlhyYkjAAjsYoIC+pZD33pEwClL9BvH7mJbBQZWTQHzkwRZhWE4HZwNw11gRxVUJ+3k0
	NikQl9HomWWr3pZSc+aqXJg/lENbct6P87zUjgIPUma73Y4zIldBE7gLnSLCpkBVPI1i
	Nf1Q==
X-Gm-Message-State: AA6/9RlpZc+tXiDzNoBzDqCanJ7yzKLVR6bq/2KiQUIu1lXcb4dbKOpFLyROdWn0opF0dg==
X-Received: by 10.28.48.19 with SMTP id w19mr526020wmw.54.1475290061574;
	Fri, 30 Sep 2016 19:47:41 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:41 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:52 +0200
Message-Id: <1475290031-20568-4-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 03/22] package_deb.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:41 -0000

This sets a good example and avoids unnecessarily contributing to
perceived complexity and cargo culting.

Motivating quote below:

< kergoth> the *original* intent was for the function/task to error via
           whatever appropriate means, bb.fatal, whatever, and
           funcfailed was what you'd catch if you were calling
           exec_func/exec_task. that is, it's what those functions
           raise, not what metadata functions should be raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
argument, which also shows that the original purpose got lost.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/package_deb.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 4e5dc12..fb6034c 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -126,7 +126,7 @@ python do_package_deb () {
             ctrlfile = codecs.open(os.path.join(controldir, 'control'), 'w', 'utf-8')
         except OSError:
             bb.utils.unlockfile(lf)
-            raise bb.build.FuncFailed("unable to open control file for writing.")
+            bb.fatal("unable to open control file for writing")
 
         fields = []
         pe = d.getVar('PKGE', True)
@@ -197,7 +197,7 @@ python do_package_deb () {
             (type, value, traceback) = sys.exc_info()
             bb.utils.unlockfile(lf)
             ctrlfile.close()
-            raise bb.build.FuncFailed("Missing field for deb generation: %s" % value)
+            bb.fatal("Missing field for deb generation: %s" % value)
 
         # more fields
 
@@ -277,7 +277,7 @@ python do_package_deb () {
                 scriptfile = open(os.path.join(controldir, script), 'w')
             except OSError:
                 bb.utils.unlockfile(lf)
-                raise bb.build.FuncFailed("unable to open %s script file for writing." % script)
+                bb.fatal("unable to open %s script file for writing" % script)
 
             if scriptvar.startswith("#!"):
                 pos = scriptvar.find("\n") + 1
@@ -301,7 +301,7 @@ python do_package_deb () {
                 conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
             except OSError:
                 bb.utils.unlockfile(lf)
-                raise bb.build.FuncFailed("unable to open conffiles for writing.")
+                bb.fatal("unable to open conffiles for writing")
             for f in conffiles_str.split():
                 if os.path.exists(oe.path.join(root, f)):
                     conffiles.write('%s\n' % f)
@@ -311,7 +311,7 @@ python do_package_deb () {
         ret = subprocess.call("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH", True), root, pkgoutdir), shell=True)
         if ret != 0:
             bb.utils.unlockfile(lf)
-            raise bb.build.FuncFailed("dpkg-deb execution failed")
+            bb.fatal("dpkg-deb execution failed")
 
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
-- 
2.7.4


