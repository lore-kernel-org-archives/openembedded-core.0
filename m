Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.7704.1625717147668982136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 21:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16845kZh010318
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 21:05:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 21:05:46 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Wed, 7 Jul 2021 21:05:45 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] boost-build-native: workaround one rarely hang problem on fedora34
Date: Thu, 8 Jul 2021 12:04:35 +0800
Message-ID: <20210708040435.42223-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Reproduce scenes:
* On fedora34
* autofs.service is started
* test is nis user, which mounted at /nis by autofs
* under /nis/test, there are symlinks point to another nis mount point /nis/yan

Result:
task boost-build-native:do_install hang forever

NOTE: recipe ovmf-edk2-stable202102-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 8124 of 8152 (/layers/oe-core/meta/recipes-core/ovmf/ovmf_git.bb:do_build)
Bitbake still alive (5000s)
Bitbake still alive (10000s)
Bitbake still alive (15000s)
Bitbake still alive (20000s)
Bitbake still alive (25000s)
Bitbake still alive (30000s)
Bitbake still alive (35000s)
Bitbake still alive (40000s)
Bitbake still alive (45000s)
Bitbake still alive (50000s)

$ps aux | grep b2
test 2773444 0.0 0.0 13532 2748 ? D Jul01 0:00 ./b2 install --prefix=/build/tmp-glibc/work/x86_64-linux/boost-build-native/4.4.1-r0/recipe-sysroot-native/usr staging-prefix=/build/tmp-glibc/work/x86_64-linux/boost-build-native/4.4.1-r0/image/build/tmp-glibc/work/x86_64-linux/boost-build-native/4.4.1-r0/recipe-sysroot-native/usr

$ sudo cat /proc/2773444/stack
[<0>] autofs_wait+0x257/0x720
[<0>] autofs_mount_wait+0x49/0xf0
[<0>] autofs_d_manage+0x76/0x1a0
[<0>] __traverse_mounts+0xd9/0x220
[<0>] step_into+0x3ad/0x6d0
[<0>] walk_component+0x62/0x190
[<0>] link_path_walk.part.0.constprop.0+0x20d/0x350
[<0>] path_lookupat+0x3a/0x1b0
[<0>] filename_lookup+0x9b/0x180
[<0>] vfs_statx+0x64/0x100
[<0>] __do_sys_newfstatat+0x1e/0x40
[<0>] do_syscall_64+0x33/0x40
[<0>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

$ dmesg
[1559743.424610] autofs4:pid:2773444:autofs_mount_wait: waiting for mount name=yan
[1559743.424621] autofs4:pid:2773444:autofs_wait: existing wait id = 0x00000056, name = yan, nfy=1
[1560001.400440] autofs4:pid:2774530:autofs_mount_wait: waiting for mount name=yan
[1560001.400452] autofs4:pid:2774530:autofs_wait: existing wait id = 0x00000056, name = yan, nfy=1
[1560022.493282] autofs4:pid:2774537:autofs_mount_wait: waiting for mount name=yan
[1560022.493292] autofs4:pid:2774537:autofs_wait: existing wait id = 0x00000056, name = yan, nfy=1
[1560122.076589] autofs4:pid:3979116:autofs_mount_wait: mount wait done status=-4
[1560162.222374] autofs4:pid:2774530:autofs_mount_wait: mount wait done status=-4
[1560167.116188] autofs4:pid:2774537:autofs_mount_wait: mount wait done status=-4
[1560188.140532] autofs4:pid:2774671:autofs_mount_wait: waiting for mount name=yan
[1560188.140540] autofs4:pid:2774671:autofs_wait: existing wait id = 0x00000056, name = yan, nfy=1
[1560189.651905] autofs4:pid:2774671:autofs_mount_wait: mount wait done status=-4

Analyzation:
b2 will walk the HOME dir, when access the symlink point to /nis/yan,
autofs hang at autofs_wait.  the process stay at D stat forever. This
maybe caused by abnormal status of autofs.service. The problem cannot
reproduce after restart autofs.service. There should be an autofs bug.
and there is an autofs hang problem bug on fedora34 on it's bugzilla:
https://bugzilla.redhat.com/show_bug.cgi?id=1953390

Workaround:
Since b2 don't actually write something to HOME dir, change HOME dir to
/var/run, a dir not mounted by autofs.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/boost/boost-build-native_4.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-build-native_4.4.1.bb b/meta/recipes-support/boost/boost-build-native_4.4.1.bb
index ad675ce731..d4df5b5cf1 100644
--- a/meta/recipes-support/boost/boost-build-native_4.4.1.bb
+++ b/meta/recipes-support/boost/boost-build-native_4.4.1.bb
@@ -20,7 +20,7 @@ do_compile() {
 }
 
 do_install() {
-    ./b2 install --prefix=${prefix} staging-prefix=${D}${prefix}
+    HOME=/var/run ./b2 install --prefix=${prefix} staging-prefix=${D}${prefix}
 }
 
 # The build is either release mode (pre-stripped) or debug (-O0).
-- 
2.17.1

