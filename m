Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5769372A13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBKBFhQE011950 for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:15:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lY6bv-M4WCUc
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:15:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBKBFUCN011947
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:15:41 GMT
Message-ID: <1419074166.13316.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 20 Dec 2014 11:16:06 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] image: Avoid race over directory creation
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
X-List-Received-Date: Sat, 20 Dec 2014 11:16:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is a race over the do_package_qa task and the do_rootfs task
since rootfs recreates a directory. This patch disables the task
(which isn't used for images) to avoid the race:

NOTE: recipe core-image-minimal-1.0-r0: task do_package_qa: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_rootfs: Started
ERROR: Build of do_package_qa failed
ERROR: Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/bitbake/lib/bb/build.py", line 497, in exec_task
    return _exec_task(fn, task, d, quieterr)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/bitbake/lib/bb/build.py", line 440, in _exec_task
    exec_func(func, localdata)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/bitbake/lib/bb/build.py", line 212, in exec_func
    exec_func_python(func, d, runfile, cwd=adir)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/bitbake/lib/bb/build.py", line 237, in exec_func_python
    os.chdir(cwd)
OSError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/work/qemumips-poky-linux/core-image-minimal/1.0-r0/core-image-minimal-1.0'

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 82e977c..832c738 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -409,6 +409,7 @@ do_compile[noexec] = "1"
 do_install[noexec] = "1"
 do_populate_sysroot[noexec] = "1"
 do_package[noexec] = "1"
+do_package_qa[noexec] = "1"
 do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"



