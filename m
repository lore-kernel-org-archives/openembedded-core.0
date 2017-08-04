Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E240771BB9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 08:18:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v748Inap013115
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Aug 2017 01:18:49 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 4 Aug 2017 01:18:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 4 Aug 2017 04:18:45 -0400
Message-ID: <f738cccd0d60f1029cf2f53dff355eed6b0cbc1b.1501834468.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1501834468.git.hongxu.jia@windriver.com>
References: <cover.1501834468.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python2/python3: fix multiprocessing.BoundedSemaphore not work on qemux86/qemuarm
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
X-List-Received-Date: Fri, 04 Aug 2017 08:18:53 -0000
Content-Type: text/plain

In upstream, the following commit:
https://github.com/python/cpython/commit/e711cafab13efc9c1fe6c5cd75826401445eb585
...
commit e711cafab13efc9c1fe6c5cd75826401445eb585
Author: Benjamin Peterson <benjamin@python.org>
Date:   Wed Jun 11 16:44:04 2008 +0000

    Merged revisions 64104,64117 via svnmerge from
    svn+ssh://pythondev@svn.python.org/python/trunk
...
(see diff in setup.py)
It assigned libraries for multiprocessing module according
the host_platform, but not pass it to Extension.

In glibc, the following commit caused two definition of
sem_getvalue are different.
https://sourceware.org/git/?p=glibc.git;a=commit;h=042e1521c794a945edc43b5bfa7e69ad70420524
(see diff in nptl/sem_getvalue.c for detail)
`__new_sem_getvalue' is the latest sem_getvalue@@GLIBC_2.1
and `__old_sem_getvalue' is to compat the old version
sem_getvalue@GLIBC_2.0.

If not explicitly link to library pthread (-lpthread), it will
load glibc's sem_getvalue randomly at runtime.

Such as build python on linux x86_64 host and run the python
on linux x86_32 target. If not link library pthread, it caused
multiprocessing bounded semaphore could not work correctly.
...
>>> import multiprocessing
>>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
>>> pool_sema.acquire()
True
>>> pool_sema.release()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: semaphore or lock released too many times
...

And the semaphore issue also caused multiprocessing.Queue().put() hung.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ss-missing-libraries-to-Extension-for-mul.patch | 82 ++++++++++++++++++++++
 ...ss-missing-libraries-to-Extension-for-mul.patch | 82 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |  1 +
 meta/recipes-devtools/python/python_2.7.13.bb      |  1 +
 4 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/pass-missing-libraries-to-Extension-for-mul.patch
 create mode 100644 meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch

diff --git a/meta/recipes-devtools/python/python/pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/python/pass-missing-libraries-to-Extension-for-mul.patch
new file mode 100644
index 0000000..44fcaac
--- /dev/null
+++ b/meta/recipes-devtools/python/python/pass-missing-libraries-to-Extension-for-mul.patch
@@ -0,0 +1,82 @@
+From 71447f04979b267f8866573b67a4340b2719d799 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 4 Aug 2017 14:10:43 +0800
+Subject: [PATCH] setup.py: pass missing libraries to Extension for multiprocessing module
+
+In the following commit:
+...
+commit e711cafab13efc9c1fe6c5cd75826401445eb585
+Author: Benjamin Peterson <benjamin@python.org>
+Date:   Wed Jun 11 16:44:04 2008 +0000
+
+    Merged revisions 64104,64117 via svnmerge from
+    svn+ssh://pythondev@svn.python.org/python/trunk
+...
+(see diff in setup.py)
+It assigned libraries for multiprocessing module according
+the host_platform, but not pass it to Extension.
+
+In glibc, the following commit caused two definition of
+sem_getvalue are different.
+https://sourceware.org/git/?p=glibc.git;a=commit;h=042e1521c794a945edc43b5bfa7e69ad70420524
+(see diff in nptl/sem_getvalue.c for detail)
+`__new_sem_getvalue' is the latest sem_getvalue@@GLIBC_2.1
+and `__old_sem_getvalue' is to compat the old version
+sem_getvalue@GLIBC_2.0.
+
+To build python for embedded Linux systems:
+http://www.yoctoproject.org/docs/2.3.1/yocto-project-qs/yocto-project-qs.html
+If not explicitly link to library pthread (-lpthread), it will
+load glibc's sem_getvalue randomly at runtime.
+
+Such as build python on linux x86_64 host and run the python
+on linux x86_32 target. If not link library pthread, it caused
+multiprocessing bounded semaphore could not work correctly.
+...
+>>> import multiprocessing
+>>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
+>>> pool_sema.acquire()
+True
+>>> pool_sema.release()
+Traceback (most recent call last):
+  File "<stdin>", line 1, in <module>
+ValueError: semaphore or lock released too many times
+...
+
+And the semaphore issue also caused multiprocessing.Queue().put() hung.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/2999]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ setup.py | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 54054c2..9646bfc 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1586,8 +1586,10 @@ class PyBuildExt(build_ext):
+         elif host_platform.startswith('netbsd'):
+             macros = dict()
+             libraries = []
+-
+-        else:                                   # Linux and other unices
++        elif host_platform.startswith(('linux')):
++            macros = dict()
++            libraries = ['pthread']
++        else:                                   # Other unices
+             macros = dict()
+             libraries = ['rt']
+ 
+@@ -1610,6 +1612,7 @@ class PyBuildExt(build_ext):
+         if sysconfig.get_config_var('WITH_THREAD'):
+             exts.append ( Extension('_multiprocessing', multiprocessing_srcs,
+                                     define_macros=macros.items(),
++                                    libraries=libraries,
+                                     include_dirs=["Modules/_multiprocessing"]))
+         else:
+             missing.append('_multiprocessing')
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
new file mode 100644
index 0000000..5c3af6b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
@@ -0,0 +1,82 @@
+From a784b70d47ba2104afbcfd805e2a66cdc2109ec5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 4 Aug 2017 11:16:14 +0800
+Subject: [PATCH] setup.py: pass missing libraries to Extension for multiprocessing module
+
+In the following commit:
+...
+commit e711cafab13efc9c1fe6c5cd75826401445eb585
+Author: Benjamin Peterson <benjamin@python.org>
+Date:   Wed Jun 11 16:44:04 2008 +0000
+
+    Merged revisions 64104,64117 via svnmerge from
+    svn+ssh://pythondev@svn.python.org/python/trunk
+...
+(see diff in setup.py)
+It assigned libraries for multiprocessing module according
+the host_platform, but not pass it to Extension.
+
+In glibc, the following commit caused two definition of
+sem_getvalue are different.
+https://sourceware.org/git/?p=glibc.git;a=commit;h=042e1521c794a945edc43b5bfa7e69ad70420524
+(see diff in nptl/sem_getvalue.c for detail)
+`__new_sem_getvalue' is the latest sem_getvalue@@GLIBC_2.1
+and `__old_sem_getvalue' is to compat the old version
+sem_getvalue@GLIBC_2.0.
+
+To build python for embedded Linux systems:
+http://www.yoctoproject.org/docs/2.3.1/yocto-project-qs/yocto-project-qs.html
+If not explicitly link to library pthread (-lpthread), it will
+load glibc's sem_getvalue randomly at runtime.
+
+Such as build python on linux x86_64 host and run the python
+on linux x86_32 target. If not link library pthread, it caused
+multiprocessing bounded semaphore could not work correctly.
+...
+>>> import multiprocessing
+>>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
+>>> pool_sema.acquire()
+True
+>>> pool_sema.release()
+Traceback (most recent call last):
+  File "<stdin>", line 1, in <module>
+ValueError: semaphore or lock released too many times
+...
+
+And the semaphore issue also caused multiprocessing.Queue().put() hung.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/2999]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ setup.py | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 4f0f522..d05707d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1606,8 +1606,10 @@ class PyBuildExt(build_ext):
+         elif host_platform.startswith('netbsd'):
+             macros = dict()
+             libraries = []
+-
+-        else:                                   # Linux and other unices
++        elif host_platform.startswith(('linux')):
++            macros = dict()
++            libraries = ['pthread']
++        else:                                   # Other unices
+             macros = dict()
+             libraries = ['rt']
+ 
+@@ -1626,6 +1628,7 @@ class PyBuildExt(build_ext):
+         if sysconfig.get_config_var('WITH_THREAD'):
+             exts.append ( Extension('_multiprocessing', multiprocessing_srcs,
+                                     define_macros=list(macros.items()),
++                                    libraries=libraries,
+                                     include_dirs=["Modules/_multiprocessing"]))
+         else:
+             missing.append('_multiprocessing')
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 7419c71..b67aec9 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -38,6 +38,7 @@ SRC_URI += "\
             file://upstream-random-fixes.patch \
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
             file://Fix-29519-weakref-spewing-exceptions-during-interp-f.patch \
+            file://pass-missing-libraries-to-Extension-for-mul.patch \
            "
 SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
 SRC_URI[sha256sum] = "eefe2ad6575855423ab630f5b51a8ef6e5556f774584c06beab4926f930ddbb0"
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index 4ef9952..98bc8ad 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -27,6 +27,7 @@ SRC_URI += "\
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
   file://Don-t-use-getentropy-on-Linux.patch \
+  file://pass-missing-libraries-to-Extension-for-mul.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.8.1


