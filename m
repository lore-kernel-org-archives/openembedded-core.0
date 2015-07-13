Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 725FF75ED4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:08:57 +0000 (UTC)
Received: by wicmz13 with SMTP id mz13so63008992wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rHG0PCZreTM4PGhI6OGUXOjxGJa+gJhM9hmph/63Ukw=;
	b=NUaSlHGKoGU1DisjfG5v/FWP2Xw/nDMk4tBrwR0Dk/LHVt1gwqR+3uRBTaO74VmDtP
	WgQ+Mr/qXjF95ZdnDjyXjHz6DmR8pYw/xsB1tVvtQx4qb68telXZNm2VXm8+UZsn6aQx
	GwaWes9SY5EjiMAaXH0SFzefYujGIa9JNOwgtUlQk3F13fSvckVxePvHrOLk4+lLnF73
	1Sb2yeoD0K5QITnQAfpVzd2dctZ0db3uYDHfKKTUWkRWdzXaKNJFEsKNI1JLts2ph+JT
	/NZXyrK14FUZYiXYu5yGYzJnMLfB0kcDpF9IetG5Cg4g+nOQKI+OUvSNygtEe3lQn8KS
	bYxA==
X-Gm-Message-State: ALoCoQldewkxePTG0hE8skkw+Y37REQStX45gq6zygLVtOM/aw1QFA5hvzBNLEP6RHFdHMhxHYmd
X-Received: by 10.194.57.170 with SMTP id j10mr65757248wjq.140.1436796536843; 
	Mon, 13 Jul 2015 07:08:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f3sm14841438wiz.13.2015.07.13.07.08.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jul 2015 07:08:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2015 15:03:00 +0100
Message-Id: <abcd8aaa11c33543653e36a2be15599812447d61.1436795781.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
Subject: [PATCH 2/7] build: add remove/mkdir/chdir debugging
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
X-List-Received-Date: Mon, 13 Jul 2015 14:08:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 bitbake/lib/bb/build.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
index 7cefee7..fa297c3 100644
--- a/bitbake/lib/bb/build.py
+++ b/bitbake/lib/bb/build.py
@@ -169,6 +169,7 @@ def exec_func(func, d, dirs = None):
     cleandirs = flags.get('cleandirs')
     if cleandirs:
         for cdir in d.expand(cleandirs).split():
+            bb.note("removing %s (for %s)" % (cdir, func))
             bb.utils.remove(cdir, True)
             bb.utils.mkdirhier(cdir)
 
@@ -179,6 +180,7 @@ def exec_func(func, d, dirs = None):
 
     if dirs:
         for adir in dirs:
+            bb.note("creating explicit %s (for %s)" % (adir, func))
             bb.utils.mkdirhier(adir)
         adir = dirs[-1]
     else:
@@ -251,7 +253,13 @@ def exec_func_python(func, d, runfile, cwd=None):
             olddir = os.getcwd()
         except OSError:
             olddir = None
+        bb.note("chdir(%s) for %s" % (cwd, func))
         os.chdir(cwd)
+    else:
+        try:
+            bb.note("pwd(%s) for %s" % (os.getcwd(), func))
+        except:
+            bb.note("no chdir for %s" % func)
 
     bb.debug(2, "Executing python function %s" % func)
 
@@ -301,6 +309,13 @@ def exec_func_shell(func, d, runfile, cwd=None):
     # Don't let the emitted shell script override PWD
     d.delVarFlag('PWD', 'export')
 
+    if cwd:
+        bb.note("shell for %s cd %s" % (func, cwd))
+    else:
+        try:
+            bb.note("pwd(%s) for %s" % (os.getcwd(), func))
+        except:
+            bb.note("no cd for %s" % func)
     with open(runfile, 'w') as script:
         script.write(shell_trap_code())
 
-- 
2.1.4


