Received: from belief.htu.tuwien.ac.at ([128.131.95.14])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jin@mediatomb.cc>) id 1RO8QX-0007Fm-3D
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 14:42:53 +0100
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id ACD4D83874; Wed,  9 Nov 2011 14:04:24 +0100 (CET)
Date: Wed, 9 Nov 2011 14:04:24 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111109130424.GB31478@deadlock.dhs.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: invalid recipe or a bug in bitbake?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Nov 2011 13:42:53 -0000
X-Groupsio-MsgNum: 12211
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I was trying to buld a simple native-only recipe and ran into a strange
problem that can be triggered using theattached test recipe.

The actual problem is that do_populate_sysroot fails, although I do not
do anything in regard to that in my recipe, I only have a custom do_install.

I do not see what I could be doing wrong in the recipe itself, it looks valid
to me... but it always triggers the error where tar is getting wrong directories
as parameters.

I did look into sysroot_stage_dirs() in staging.bbclass, it's basically
doing things like:
    sysroot_stage_dir $from${includedir} $to${includedir}

My $from and $to seem to be correct, but the appended dirs seem to be wrong.
I did echo ${includedir} and ${includedir_native} in my do_install() in the
recipe, and it looked OK there...

I did build quite a few packages in this setup already, so it seems that my
overall configuration is OK (setup is based angstrom 2010).

I am using OE core with bitbake:
BitBake Build Tool Core version 1.13.3, bitbake version 1.13.3

Any ideas?

Kind regards,
Jin


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="native-test_0.1.bb"

DESCRIPTION="test for the sysroot staging error"
LICENSE="GPL"

SRC_URI = "http://www.deadlock.dhs.org/jin/COPYING"

LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

PR="r1"

inherit native

do_configure() {
    :
}

do_install() {
    install -d ${D}${includedir_native}
    echo "test" > ${D}${includedir_native}/sometest.h
}

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="log.do_populate_sysroot.11889"

+ cd /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/native-test-0.1
+ sysroot_stage_all
+ sysroot_stage_dirs /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir/
+ from=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image
+ to=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir/
+ sysroot_stage_dir /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/include /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/include
+ src=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/include
+ dest=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/include
+ '[' '!' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/include ']'
+ return
+ '[' x86_64-linux = x86_64-linux ']'
+ sysroot_stage_dir /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/bin /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/bin
+ src=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/bin
+ dest=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/bin
+ '[' '!' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/bin ']'
+ return
+ sysroot_stage_dir /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/sbin /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/sbin
+ src=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/sbin
+ dest=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/sbin
+ '[' '!' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/sbin ']'
+ return
+ sysroot_stage_dir /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/bin /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/bin
+ src=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/bin
+ dest=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/bin
+ '[' '!' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/bin ']'
+ return
+ sysroot_stage_dir /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/sbin /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/sbin
+ src=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/sbin
+ dest=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/sbin
+ '[' '!' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/sbin ']'
+ return
+ sysroot_stage_dir /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/libexec /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/libexec
+ src=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/libexec
+ dest=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/libexec
+ '[' '!' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/libexec ']'
+ return
+ sysroot_stage_dir /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/etc /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/etc
+ src=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/etc
+ dest=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/etc
+ '[' '!' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/etc ']'
+ return
+ sysroot_stage_dir /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/var /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/var
+ src=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/var
+ dest=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/var
+ '[' '!' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/var ']'
+ return
+ '[' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/lib ']'
+ '[' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/lib ']'
+ sysroot_stage_dir /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/share /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/share
+ src=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/share
+ dest=/dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir//dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/share
+ '[' '!' -d /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/image/dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux/usr/share ']'
+ return
NOTE: QA checking staging
ERROR: Error executing a python function in /dss-oe/dS/meta-dss11-devel/recipes-support/rubygems/native-test_0.1.bb:
CalledProcessError: Command 'tar -cf - -C /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir///dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux -ps . | tar -xf - -C /dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux' returned non-zero exit status 2 with output tar: /dss-oe/angstrom-devel-build-eglibc/work/x86_64-linux/native-test-0.1-r1/sysroot-destdir///dss-oe/angstrom-devel-build-eglibc/sysroots/x86_64-linux: Cannot chdir: No such file or directory
tar: Error is not recoverable: exiting now
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors


ERROR: The stack trace of python calls that resulted in this exception/failure was:
ERROR:   File "sstate_task_postfunc", line 10, in <module>
ERROR: 
ERROR:   File "sstate_task_postfunc", line 4, in sstate_task_postfunc
ERROR: 
ERROR:   File "sstate.bbclass", line 19, in sstate_install
ERROR: 
ERROR:   File "/dss-oe/OE/openembedded-core/meta/lib/oe/path.py", line 59, in copytree
ERROR:     check_output(cmd, shell=True, stderr=subprocess.STDOUT)
ERROR: 
ERROR:   File "/dss-oe/OE/openembedded-core/meta/lib/oe/path.py", line 121, in check_output
ERROR:     raise CalledProcessError(retcode, cmd, output=output)
ERROR: 
ERROR: The code that was being executed was:
ERROR:      0006:        bb.build.exec_func(intercept, d)
ERROR:      0007:    sstate_package(shared_state, d)
ERROR:      0008:
ERROR:      0009:
ERROR:  *** 0010:sstate_task_postfunc(d)
ERROR:      0011:
ERROR: (file: 'sstate_task_postfunc', lineno: 10, function: <module>)
ERROR:      0001:
ERROR:      0002:def sstate_task_postfunc(d):
ERROR:      0003:    shared_state = sstate_state_fromvars(d)
ERROR:  *** 0004:    sstate_install(shared_state, d)
ERROR:      0005:    for intercept in shared_state['interceptfuncs']:
ERROR:      0006:        bb.build.exec_func(intercept, d)
ERROR:      0007:    sstate_package(shared_state, d)
ERROR:      0008:
ERROR: (file: 'sstate_task_postfunc', lineno: 4, function: sstate_task_postfunc)
ERROR: Function 'sstate_task_postfunc' failed

--EVF5PPMfhYS0aIcm--
