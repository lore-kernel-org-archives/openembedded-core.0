Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCEE7391A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 05:47:56 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so144627765wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 22:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g3OVBE5EcZgmdkAAqyjKCG0Zqo8Y5ibP2n7zsSCoOGA=;
	b=UD7I6ge0EYWN23WWrgGCQ61EgAcC+w+y0LxhNkYJUdsrb81ZBQx5iRFJqpJ0HVwrfl
	9/ZxtifKramx59TAspUpmz8MB1v1DSPNhLj5WJxmRwPnQfItXa07NhARDUF37YZH2CJa
	bocbHm1jgLNqUPCx3FtogHfq5dJP6+eaewsfNovebvi8SdBZ9kjNRycdWz2DwgFpGejD
	TCqN9v+YFrcbgcDSKS8xhxMRwU54UgJMCnsaEeiDfn3RsRSqdyE18GkEj4OXShg9OPRL
	SAOgJJu+9FBfDg67/ELIMWQatdKyB9ym7p8nbAmhNONA8dAYaiuau8AemGm04qVMLL7Z
	SyJw==
X-Received: by 10.180.188.169 with SMTP id gb9mr16405671wic.44.1442900876634; 
	Mon, 21 Sep 2015 22:47:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xt1sm27496496wjb.32.2015.09.21.22.47.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 22:47:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 07:48:00 +0200
Message-Id: <1442900880-20856-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <20150921190422.GA28765@jama>
References: <20150921190422.GA28765@jama>
Subject: [RFC][PATCHv3] autotools.bbclass, cmake.bbclass, perf: don't re-create ${B}
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
X-List-Received-Date: Tue, 22 Sep 2015 05:47:57 -0000

* otherwise there is race-condition between do_configure rm+mkdir and
  bitbake trying to use it as CWD for do_populate_lic task, which
  results in errors like this:

NOTE: recipe perf-1.0-r9: task do_configure: Started
NOTE: recipe perf-1.0-r9: task do_populate_lic: Started
ERROR: Build of do_populate_lic failed
ERROR: Traceback (most recent call last):
  File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 553, in exec_task
    return _exec_task(fn, task, d, quieterr)
  File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 493, in _exec_task
    exec_func(func, localdata)
  File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 227, in exec_func
    exec_func_python(func, d, runfile, cwd=adir)
  File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 252, in exec_func_python
    os.chdir(cwd)
OSError: [Errno 2] No such file or directory: '/OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/perf-1.0'
NOTE: recipe perf-1.0-r9: task do_populate_lic: Failed
ERROR: Task 7 (/OE/build/oe-core/openembedded-core/meta/recipes-kernel/perf/perf.bb, do_populate_lic) failed with exit code '1'
NOTE: recipe perf-1.0-r9: task do_configure: Succeeded

or even longer exception:

NOTE: recipe perf-1.0-r9: task do_populate_lic: Started
NOTE: recipe perf-1.0-r9: task do_configure: Started
ERROR: Error executing a python function in /OE/build/oe-core/openembedded-core/meta/recipes-kernel/perf/perf.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'sstate_task_postfunc', lineno: 14, function: <module>
     0010:    sstate_package(shared_state, d)
     0011:    os.umask(omask)
     0012:
     0013:
 *** 0014:sstate_task_postfunc(d)
     0015:
File: 'sstate_task_postfunc', lineno: 4, function: sstate_task_postfunc
     0001:
     0002:def sstate_task_postfunc(d):
     0003:    shared_state = sstate_state_fromvars(d)
 *** 0004:    sstate_install(shared_state, d)
     0005:    for intercept in shared_state['interceptfuncs']:
     0006:        bb.build.exec_func(intercept, d)
     0007:    omask = os.umask(002)
     0008:    if omask != 002:
File: 'sstate.bbclass', lineno: 113, function: sstate_install
     0109:        if os.path.exists(state[1]):
     0110:            oe.path.copyhardlinktree(state[1], state[2])
     0111:
     0112:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
 *** 0113:        bb.build.exec_func(postinst, d)
     0114:
     0115:    for lock in locks:
     0116:        bb.utils.unlockfile(lock)
     0117:
File: '/OE/build/oe-core/bitbake/lib/bb/build.py', lineno: 227, function: exec_func
     0223:                pass
     0224:
     0225:    with bb.utils.fileslocked(lockfiles):
     0226:        if ispython:
 *** 0227:            exec_func_python(func, d, runfile, cwd=adir)
    0228:        else:
     0229:            exec_func_shell(func, d, runfile, cwd=adir)
     0230:
     0231:_functionfmt = """
File: '/OE/build/oe-core/bitbake/lib/bb/build.py', lineno: 252, function: exec_func_python
     0248:        try:
     0249:            olddir = os.getcwd()
     0250:        except OSError:
     0251:            olddir = None
 *** 0252:        os.chdir(cwd)
     0253:
     0254:    bb.debug(2, "Executing python function %s" % func)
     0255:
     0256:    try:
Exception: OSError: [Errno 2] No such file or directory: '/OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/perf-1.0'

ERROR: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/temp/log.do_populate_lic.16588
NOTE: recipe perf-1.0-r9: task do_populate_lic: Failed
ERROR: Task 7 (/OE/build/oe-core/openembedded-core/meta/recipes-kernel/perf/perf.bb, do_populate_lic) failed with exit code '1'
NOTE: recipe perf-1.0-r9: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 840 tasks of which 835 didn't need to be rerun and 1 failed.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/autotools.bbclass   | 3 +--
 meta/classes/cmake.bbclass       | 3 +--
 meta/recipes-kernel/perf/perf.bb | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 819045a..67e1e3a 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -104,8 +104,7 @@ autotools_preconfigure() {
 		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
 			if [ "${S}" != "${B}" ]; then
 				echo "Previously configured separate build directory detected, cleaning ${B}"
-				rm -rf ${B}
-				mkdir -p ${B}
+				find ${B} -mindepth 1 -maxdepth 1 | xargs rm -rf
 			else
 				# At least remove the .la files since automake won't automatically
 				# regenerate them even if CFLAGS/LDFLAGS are different
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index ae3cc02..e31799a 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -91,8 +91,7 @@ cmake_do_configure() {
 	fi
 
 	if [ "${S}" != "${B}" ]; then
-		rm -rf ${B}
-		mkdir -p ${B}
+		find ${B} -mindepth 1 -maxdepth 1 | xargs rm -rf
 		cd ${B}
 	else
 		find ${B} -name CMakeFiles -or -name Makefile -or -name cmake_install.cmake -or -name CMakeCache.txt -delete
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 22bd3c8..a5a04af 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -119,8 +119,7 @@ do_install() {
 
 do_configure_prepend () {
     # Fix for rebuilding
-    rm -rf ${B}/
-    mkdir -p ${B}/
+    find ${B} -mindepth 1 -maxdepth 1 | xargs rm -rf
 
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
-- 
2.5.1


