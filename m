Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id DF12973CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 19:36:53 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so129714005wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eJ+XhMCaAo/earCASYcPdZTdYXAzrKiGjMVKULBiMWY=;
	b=i18Z5EogD868yVvVZgXXSsf07yXUctnOKkDF81iwRaCitEgCzBBNGmTy88uftw8UEO
	NglSPMlJhz6xEW21zbYktPKa5v6l1CZJ3IobFvNctGYvmWSsSywsR70ZxnJnnWhZXt7C
	3u9GG7/dymHkM/sdclhApdIlLKWo1HQ48ZUbcsu/aDBNqsXBEPNaYjPF7DmFl4sEuGBe
	h8nSo+3v1YO7tFjaIukQ4geAILNKoELdDVQU2B5SP8hIAB3VhhHFZrgorigxcJU/NBKP
	5gAwoZOUMnD+CwTyWCV7OB9rvlVu/Nr+ZL1pSehTaGTbRAuYbuYg1pga2ePgtw6LyFsQ
	EfrQ==
X-Received: by 10.180.104.40 with SMTP id gb8mr15515234wib.17.1442864213829;
	Mon, 21 Sep 2015 12:36:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h6sm91534wiy.14.2015.09.21.12.36.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 12:36:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 21:36:51 +0200
Message-Id: <1442864211-2994-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <20150921190422.GA28765@jama>
References: <20150921190422.GA28765@jama>
Subject: [RFC][PATCH] perf: don't re-create ${B}
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
X-List-Received-Date: Mon, 21 Sep 2015 19:36:59 -0000

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
 meta/recipes-kernel/perf/perf.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 22bd3c8..7f5c3b3 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -119,8 +119,7 @@ do_install() {
 
 do_configure_prepend () {
     # Fix for rebuilding
-    rm -rf ${B}/
-    mkdir -p ${B}/
+    find ${B} -mindepth 1 -maxdepth 1 -delete
 
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
-- 
2.5.1


