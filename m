Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA306AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 16:39:46 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p190so5478449wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 09:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Nyr1FLiggmrIq4dshUuR8AmbeA2Y2+rmm3X5knfXvrU=;
	b=ME5OBPwuGbs3PVEpeTIQ2SjlsFu5Zl4EZExTdcCm3eLirPdLnPgSrvSht3lzX6v2nf
	U/BDQwns9+fc9EFosiUpu1MhSRWUPK5Vrb05IufEmWSD86f1orJV4L5uY+IfauT97ZTV
	gB0XBroiFSKjGOvyMftqWFbmRfOBP8/0XavNRGoKEQfVb+9qSnyUZnpuoHi3RwkCzPxC
	77CKD6kiyTtmA3EZgL7TIfpH7vpQV6RcCcUJI3gs96cQyGYZk+O1CJdwxE2QIcjYiN4Q
	lRBkNub1OdamF1UOPRKQVHav+xkPLzHHo1MBHhUPigdh5Q3374/V9uh9qK90ZRgoPZZR
	74fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Nyr1FLiggmrIq4dshUuR8AmbeA2Y2+rmm3X5knfXvrU=;
	b=e3oxLoFtCG5EHMnypYqg7D/pCfG93mpCQ/2BsFSOlHlxEtN322TPLiL4J81pxBN3ip
	xv3fNdnHgvAr70HCMdEJrJngqfLiuyTWxGTc6mh8AiuD1gi6+rQIEIoM/+8V8s+4c6wU
	NqhVOemEgMusZH1pbQUK0Vxbmtl3R6DizH7q/nsrFo+3S/oRWtci2My71QctRG18AUMq
	qMGqKeC9CenR4cl7NRD5Fi//3s7kIpxkJLEmC3oXcUO7WCXU+S7IYPc/X0LZzYNv8FO7
	44CYSUD7ZZEo1dBAqyHFB7sWu3UACGd6gfODQthOv+pw/EzBCz1KFSJjYxnVeQ/E+HJ4
	cWCw==
X-Gm-Message-State: ALyK8tJETE6xCHTf4Wv6+mxUQalcccobgOmrfFM5VUFLPXH7gHXKC3XzQE2TaSwQmP7Ws8Uk
X-Received: by 10.28.182.136 with SMTP id g130mr16559189wmf.21.1468514387276; 
	Thu, 14 Jul 2016 09:39:47 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i66sm16903385wmg.9.2016.07.14.09.39.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jul 2016 09:39:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 17:39:41 +0100
Message-Id: <1468514381-6587-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468514381-6587-1-git-send-email-ross.burton@intel.com>
References: <1468514381-6587-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] build: don't use $B as the default cwd for functions
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
X-List-Received-Date: Thu, 14 Jul 2016 16:39:47 -0000

When bitbake executes a shell or Python function it can cd/chdir() into a
directory before executing the task. If no directory is specified then the
default of $B is used.  However $B is an OpenEmbedded variable and BitBake
shouldn't be aware of it.

To solve this change the semantics slightly so that if no directory is
specified, the current working directory isn't changed.  There's also a sanity
check that emits a warning if a Python task does os.chdir() without restoring
the old path, and the previous working directory is restored.

This does change semantics: whereas before a function in OE would have $B as the
working directory unless specified, now the working directory is the top of the
build tree.  Any breakage this causes can be solved by either adding
do_some_task[dirs] = "${B}" or by using absolute paths in the task.

[ YOCTO #4634 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 bitbake/lib/bb/build.py | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
index 4fb2a77..4f01d66 100644
--- a/bitbake/lib/bb/build.py
+++ b/bitbake/lib/bb/build.py
@@ -188,6 +188,11 @@ class LogTee(object):
 def exec_func(func, d, dirs = None, pythonexception=False):
     """Execute a BB 'function'"""
 
+    try:
+        oldcwd = os.getcwd()
+    except:
+        oldcwd = None
+
     body = d.getVar(func, False)
     if not body:
         if body is None:
@@ -211,9 +216,7 @@ def exec_func(func, d, dirs = None, pythonexception=False):
             bb.utils.mkdirhier(adir)
         adir = dirs[-1]
     else:
-        adir = d.getVar('B', True)
-        bb.utils.mkdirhier(adir)
-
+        adir = None
     ispython = flags.get('python')
 
     lockflag = flags.get('lockfiles')
@@ -257,6 +260,13 @@ def exec_func(func, d, dirs = None, pythonexception=False):
         else:
             exec_func_shell(func, d, runfile, cwd=adir)
 
+    if oldcwd and os.getcwd() != oldcwd:
+        try:
+            bb.warn("Task %s changed cwd to %s" % (func, os.getcwd()))
+            os.chdir(oldcwd)
+        except:
+            pass
+
 _functionfmt = """
 {function}(d)
 """
@@ -272,7 +282,8 @@ def exec_func_python(func, d, runfile, cwd=None, pythonexception=False):
     if cwd:
         try:
             olddir = os.getcwd()
-        except OSError:
+        except OSError as e:
+            bb.warn("%s: Cannot get cwd: %s" % (func, e))
             olddir = None
         os.chdir(cwd)
 
@@ -298,8 +309,8 @@ def exec_func_python(func, d, runfile, cwd=None, pythonexception=False):
         if cwd and olddir:
             try:
                 os.chdir(olddir)
-            except OSError:
-                pass
+            except OSError as e:
+                bb.warn("%s: Cannot restore cwd %s: %s" % (func, olddir, e))
 
 def shell_trap_code():
     return '''#!/bin/sh\n
-- 
2.8.1


