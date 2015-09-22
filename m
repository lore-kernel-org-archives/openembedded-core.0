Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4038D73CF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 08:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8M8AlNg015793; Tue, 22 Sep 2015 09:10:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EMiAeu2XpVpG; Tue, 22 Sep 2015 09:10:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8M8AYDN015788
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Sep 2015 09:10:45 +0100
Message-ID: <1442909434.12435.242.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 22 Sep 2015 09:10:34 +0100
In-Reply-To: <1442867607-8913-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150921190422.GA28765@jama>
	<1442867607-8913-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCHv2] cmake.bbclass, perf: don't re-create ${B}
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
X-List-Received-Date: Tue, 22 Sep 2015 08:10:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-09-21 at 22:33 +0200, Martin Jansa wrote:
> * otherwise there is race-condition between do_configure rm+mkdir and
>   bitbake trying to use it as CWD for do_populate_lic task, which
>   results in errors like this:
> 
> NOTE: recipe perf-1.0-r9: task do_configure: Started
> NOTE: recipe perf-1.0-r9: task do_populate_lic: Started
> ERROR: Build of do_populate_lic failed
> ERROR: Traceback (most recent call last):
>   File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 553, in exec_task
>     return _exec_task(fn, task, d, quieterr)
>   File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 493, in _exec_task
>     exec_func(func, localdata)
>   File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 227, in exec_func
>     exec_func_python(func, d, runfile, cwd=adir)
>   File "/OE/build/oe-core/bitbake/lib/bb/build.py", line 252, in exec_func_python
>     os.chdir(cwd)
> OSError: [Errno 2] No such file or directory: '/OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/perf-1.0'
> NOTE: recipe perf-1.0-r9: task do_populate_lic: Failed
> ERROR: Task 7 (/OE/build/oe-core/openembedded-core/meta/recipes-kernel/perf/perf.bb, do_populate_lic) failed with exit code '1'
> NOTE: recipe perf-1.0-r9: task do_configure: Succeeded
> 
> or even longer exception:
> 
> NOTE: recipe perf-1.0-r9: task do_populate_lic: Started
> NOTE: recipe perf-1.0-r9: task do_configure: Started
> ERROR: Error executing a python function in /OE/build/oe-core/openembedded-core/meta/recipes-kernel/perf/perf.bb:
> 
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'sstate_task_postfunc', lineno: 14, function: <module>
>      0010:    sstate_package(shared_state, d)
>      0011:    os.umask(omask)
>      0012:
>      0013:
>  *** 0014:sstate_task_postfunc(d)
>      0015:
> File: 'sstate_task_postfunc', lineno: 4, function: sstate_task_postfunc
>      0001:
>      0002:def sstate_task_postfunc(d):
>      0003:    shared_state = sstate_state_fromvars(d)
>  *** 0004:    sstate_install(shared_state, d)
>      0005:    for intercept in shared_state['interceptfuncs']:
>      0006:        bb.build.exec_func(intercept, d)
>      0007:    omask = os.umask(002)
>      0008:    if omask != 002:
> File: 'sstate.bbclass', lineno: 113, function: sstate_install
>      0109:        if os.path.exists(state[1]):
>      0110:            oe.path.copyhardlinktree(state[1], state[2])
>      0111:
>      0112:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
>  *** 0113:        bb.build.exec_func(postinst, d)
>      0114:
>      0115:    for lock in locks:
>      0116:        bb.utils.unlockfile(lock)
>      0117:

The longer stack trace is actually really helpful. I believe the code
here should inherit the working directory of the current task rather
than rely on the default of ${B} which bitbake assigns if there is
nothing else.

The trouble is that if the function does specify a dirs flag, it should
really use that instead of a supplied parameter and if we use the
parameter to exec_func(), it won't do that.

There aren't that many uses of SSTATEPOSTINSTFUNCS in our metadata so
the easiest way to fix this short term is probably to go through them
and add specific [dirs] options to the functions.

Cheers,

Richard


