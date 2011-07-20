Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qje3c-000446-4o
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:11:52 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2396807fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DpghOrzef1ZZJOiX4+UAHRDUhFOeTe2BcnZfC/SfrQw=;
	b=ZLkETWruDy8hu78A3/0DJ7NKyl+pf1Pbc+2bAlr1P0LU9paxg38JPDJ9mFHT5rQeKs
	PmV/vNy3cMAN7Ms5h+RJ9JphDu3jlxYBTngDfyal1uNwpWcKI4Bdd7VVRPF0zyIEmbM7
	nc6uYfMyL8MA33gFSYsJoftzMXv9JGceHoOkI=
Received: by 10.223.51.67 with SMTP id c3mr14122677fag.132.1311196067397;
	Wed, 20 Jul 2011 14:07:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l22sm939088fam.9.2011.07.20.14.07.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:07:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:06:27 +0200
Message-Id: <b3cd488b769c1624880075311b1be610a3a584de.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
References: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/10] python: add patch to fix cross compilation on host with linux-3.0
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
X-List-Received-Date: Wed, 20 Jul 2011 21:11:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python/07-linux3-regen-fix.patch        |   18 ++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    1 +
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/07-linux3-regen-fix.patch

diff --git a/meta/recipes-devtools/python/python/07-linux3-regen-fix.patch b/meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
new file mode 100644
index 0000000..d7fb313
--- /dev/null
+++ b/meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Without this patch it calls cross-compiled python if host is running linux-3.0
+python$EXE ../../Tools/scripts/h2py.py -i '(u_long)' /usr/include/netinet/in.h
+| ./regen: line 3: /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.6.6-nk2.8/Python-2.6.6/python: cannot execute binary file
+
+diff -uNr Python-2.6.6.orig//Lib/plat-linux3/regen Python-2.6.6/Lib/plat-linux3/regen
+--- Python-2.6.6.orig//Lib/plat-linux3/regen	1970-01-01 01:00:00.000000000 +0100
++++ Python-2.6.6/Lib/plat-linux3/regen	2001-08-09 14:48:17.000000000 +0200
+@@ -0,0 +1,8 @@
++#! /bin/sh
++case `uname` in
++Linux*)	;;
++*)	echo Probably not on a Linux system 1>&2
++	exit 1;;
++esac
++set -v
++h2py -i '(u_long)' /usr/include/sys/types.h /usr/include/netinet/in.h /usr/include/dlfcn.h
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 76f32f2..598fea8 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "\
   file://05-enable-ctypes-cross-build.patch \
   file://06-ctypes-libffi-fix-configure.patch \
   file://06-avoid_usr_lib_termcap_path_in_linking.patch \
+  file://07-linux3-regen-fix.patch \
   file://99-ignore-optimization-flag.patch \
   ${DISTRO_SRC_URI} \
   file://multilib.patch \
-- 
1.7.6



