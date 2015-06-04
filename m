Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 58C98734DA;
	Thu,  4 Jun 2015 11:33:18 +0000 (UTC)
Received: by wgv5 with SMTP id 5so31268216wgv.1;
	Thu, 04 Jun 2015 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=ozv/rR4uIgyDOLzqrdGCVx6gXtGsRhAAuSJAQmhkbBk=;
	b=dXNuJsfumyqwrP2SF/kkftYAv4+dononCuiK3wR2/IfdDhArtcJh3xfzsAnKF8tf97
	Dx7GODVRPC0/wVzXuhNTlM/iV5B3SSyVYSxv4JX60fU1vM8YXH4y3iAtlSgDqDnjsIxM
	6O98gRo8QUSlsPsxlcg93pS/MqI4HtiqW6ERxCdBLAmtvMzwVVWB+Gi5L9i7HeJZh3Nx
	x6JONFy2gESyzK5wyQbLHhx9M/3JIvT5l5UJAGHXJ5+2rV6JDIXEd818NC7eyw4DnSxq
	jqPrKb5SGlIG1icDZLRWJHGg0VXU/DNR6KrTO6EGpiFTAby9W1BjodPQ3MbYcbcyEHfu
	yCvw==
X-Received: by 10.180.74.144 with SMTP id t16mr6835446wiv.33.1433417599647;
	Thu, 04 Jun 2015 04:33:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	gs7sm30825431wib.10.2015.06.04.04.33.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 04:33:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2015 13:33:40 +0200
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150604113339.GI2376@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : perf: fix for rebuilding
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
X-List-Received-Date: Thu, 04 Jun 2015 11:33:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I think this commit:

commit 9dafa571ed0a40d21a886dec7704c31150b21942
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Sun Jan 18 22:46:29 2015 -0800

    perf: fix for rebuilding

    Fix for rebuilding error:
    make[3]: *** No rule to make target `/path/to/sysroots/qemuarm64/usr/src/kernel/tools/lib/traceevent//trace-seq.c',
    needed by `.trace-seq.d'.  Stop.
    make[2]: *** [sub-make] Error 2

    Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index bd57c6c..6925eb2 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -115,6 +115,10 @@ do_install() {
 }

 do_configure_prepend () {
+    # Fix for rebuilding
+    rm -rf ${B}/
+    mkdir ${B}/
+
     #kernels before 3.1 do not support WERROR env variable
     sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
     if [ -e "${S}/tools/perf/config/Makefile" ]; then


is causing occasional do_populate_lic failure with:
ERROR: Build of do_populate_lic failed
ERROR: Traceback (most recent call last):
  File "bitbake/lib/bb/build.py", line 497, in exec_task
    return _exec_task(fn, task, d, quieterr)
  File "bitbake/lib/bb/build.py", line 440, in _exec_task
    exec_func(func, localdata)
  File "bitbake/lib/bb/build.py", line 212, in exec_func
    exec_func_python(func, d, runfile, cwd=adir)
  File "bitbake/lib/bb/build.py", line 237, in exec_func_python
    os.chdir(cwd)
OSError: [Errno 2] No such file or directory: 'BUILD/work/qemux86-webos-linux/perf/1.0-r9/perf-1.0'

ERROR: Task 3216 (oe-core/meta/recipes-kernel/perf/perf.bb, do_populate_lic) failed with exit code '1'

perf.bb sets:
B = "${WORKDIR}/${BPN}-${PV}"

and order of do_configure,do_populate_lic isn't given
meta/classes/license.bbclass:addtask populate_lic after do_patch before do_build

So I think we should backport this change to dizzy as well:
oe-core$ git show -1 jansa/dizzy-backports 
commit 40aeb23c427e0c56f7073fc54ea63bf0eabbe092
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Wed Mar 11 01:35:38 2015 -0700

    license.bbclass: set dirs for do_populate_lic_setscene
    
    Fixed:
    ERROR: Build of do_populate_lic failed
    ERROR: Traceback (most recent call last):
      File "bitbake/lib/bb/build.py", line 497, in exec_task
        return _exec_task(fn, task, d, quieterr)
      File "bitbake/lib/bb/build.py", line 437, in _exec_task
        exec_func(func, localdata)
      File "bitbake/lib/bb/build.py", line 212, in exec_func
        exec_func_python(func, d, runfile, cwd=adir)
      File "/home/nxadm/nx/ala-blade44.1/builds-2015-03-09-163005/qemuppc_world_oe_bp/bitbake/lib/bb/build.py", line 237, in exec_func_python
        os.chdir(cwd)
    OSError: [Errno 2] No such file or directory: 'bitbake_build/tmp/work/ppc7400-wrs-linux/taglib/1.9.1-r0/build'
    
    When running setscene, the cwd is $B which maybe removed by
    autotools.bbclass or cmake.bbclass when rebuild.
    
    Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>

Regards,

