Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SFtqP-0005iB-Iy
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 23:03:49 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr12so1465444wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 13:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=bEHoairW67dg7C7HRjTiBaJ2KEQwxxNfSJGp37CFVdo=;
	b=ZAyFWVV58n/uwpt3aKNksmNxxgYC17aOOpjt+f4g+8hxOZ9bmNUxw7vxSXi38TwJ1M
	Ek2TC0485DUB1TKQIKJA+aX8kudybScgqmmrBjyy5NtQAS/7UYFyW1mRA1FDj9FlAFxn
	ixOh2V1/WOtbHUttTfAaQAb+R/Mat3Jto97a9PdA5sN1i4u9VnT/MJtsgaCzogHJTwBD
	doiFFPk18CrKyCG+GX3a6qkrvDsL9gMu6VVf7+BKG7CwCAU/pmId+lzOyCf1RTWxC+xv
	gfF72NSdziPtyrYSF8xqogM4rhep9Ew5tg9vG3o20vzdoSLp/G1TPVCHwaQrzrSYIKnV
	YRxQ==
Received: by 10.216.136.131 with SMTP id w3mr2595574wei.15.1333659279791;
	Thu, 05 Apr 2012 13:54:39 -0700 (PDT)
Received: from localhost.localdomain ([79.115.103.32])
	by mx.google.com with ESMTPS id j3sm606151wiw.1.2012.04.05.13.54.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 13:54:39 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 23:54:22 +0300
Message-Id: <4cf24f2cdaabf03d4b292032338a2f705f36a9cf.1333659001.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
References: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
In-Reply-To: <cover.1333659001.git.andrei@gherzan.ro>
References: <cover.1333659001.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkH+A60J71GzGjQfJ+3UGlANQbmXCnCb7n5rImHX72bKbaQ1UTHJsBHI5gA8J/zP9YQE115
Subject: [PATCH 3/6] python: Add patch to search for db.h in inc_dirs and remove warning
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
X-List-Received-Date: Thu, 05 Apr 2012 21:03:49 -0000

python should search for db.h in inc_dirs and not in a hardcoded path.
If db.h is found but HASHVERSION is not 2 we avoid a warning by not.
adding this module to missing variable.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 ...search_db_h_in_inc_dirs_and_avoid_warning.patch |   40 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 2 files changed, 42 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch

diff --git a/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch b/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch
new file mode 100644
index 0000000..0c1f174
--- /dev/null
+++ b/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch
@@ -0,0 +1,40 @@
+python should search for db.h in inc_dirs and not in a hardcoded path.
+If db.h is found but HASHVERSION is not 2 we avoid a warning by not 
+adding this module to missing variable.
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-04-05 22:27:22.437199989 +0300
++++ Python-2.7.2/setup.py	2012-04-05 22:26:38.000000000 +0300
+@@ -1141,12 +1141,12 @@
+         # the more recent berkeleydb's db.h file first in the include path
+         # when attempting to compile and it will fail.
+         f = "/usr/include/db.h"
+-
++        if len(inc_dirs) != 0:
++            f = os.path.join(inc_dirs[0], "db.h")
+         if sys.platform == 'darwin':
+             if is_macosx_sdk_path(f):
+                 sysroot = macosx_sdk_root()
+                 f = os.path.join(sysroot, f[1:])
+-
+         if os.path.exists(f) and not db_incs:
+             data = open(f).read()
+             m = re.search(r"#s*define\s+HASHVERSION\s+2\s*", data)
+@@ -1161,8 +1161,10 @@
+                                           libraries=libraries))
+                 else:
+                     exts.append(Extension('bsddb185', ['bsddbmodule.c']))
+-            else:
+-                missing.append('bsddb185')
++            # If a newer version is detected don't report an useless
++            # warning
++            #else:
++            #    missing.append('bsddb185')
+         else:
+             missing.append('bsddb185')
+ 
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index b604db4..ab6c91f 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.10"
+PR = "${INC_PR}.11"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -22,6 +22,7 @@ SRC_URI += "\
   file://sys_platform_is_now_always_linux2.patch \
   file://fix_for_using_different_libdir.patch \
   file://check-if-target-is-64b-not-host.patch \
+  file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.5.4



