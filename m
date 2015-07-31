Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C88F77647D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAQCAE020021 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:26:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Cwvs_WBjGndX
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:26:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAQOBZ020079
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:26:35 +0100
Message-ID: <1438338384.22462.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:26:24 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] gcc: Add patch to handle on target multilibs better
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
X-List-Received-Date: Fri, 31 Jul 2015 10:26:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On target multilibs did not work properly since gcc-cross-canadian
was only searching a limited number of sysroot directories to
find multilib target binaries.

This adds an extra search path to ensure those binaries are found
and our gcc-cross-canadian works everywhere we need it to, e.g.
with mips trilib configurations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 7a3e4eb..691ba5f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -79,6 +79,7 @@ SRC_URI = "\
     file://0061-target-gcc-includedir.patch \
     file://0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
     file://0063-nativesdk-gcc-support.patch \
+    file://0064-handle-target-sysroot-multilib.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0064-handle-target-sysroot-multilib.patch b/meta/recipes-devtools/gcc/gcc-4.9/0064-handle-target-sysroot-multilib.patch
new file mode 100644
index 0000000..5356984
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0064-handle-target-sysroot-multilib.patch
@@ -0,0 +1,88 @@
+Search target sysroot gcc version specific dirs with multilib.
+
+We install the gcc libraries (such as crtbegin.p) into
+<sysroot><libdir>/<target-sys>/5.2.0/
+which is a default search path for GCC (aka multi_suffix in the 
+code below). <target-sys> is 'machine' in gcc's terminology. We use
+these directories so that multiple gcc versions could in theory 
+co-exist on target.
+
+We only want to build one gcc-cross-canadian per arch and have this work 
+for all multilibs. <target-sys> can be handled by mapping the multilib
+<target-sys> to the one used by gcc-cross-canadian, e.g. mips64-polkmllib32-linux 
+is symlinked to by mips64-poky-linux.
+
+The default gcc search path in the target sysroot for a "lib64" mutlilib is:
+
+<sysroot>/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/../lib64/
+<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/../lib64/
+<sysroot>/lib32/
+<sysroot>/usr/lib32/
+
+which means that the lib32 crtbegin.o will be found and the lib64 ones
+will not which leads to compiler failures.
+
+This patch injects a multilib version of that path first so the lib64
+binaries can be found first. With this change the search path becomes:
+
+<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/../lib64/
+<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/../lib64/
+<sysroot>/lib32/
+<sysroot>/usr/lib32/
+
+Upstream-Status: Pending
+RP 2015/7/31
+
+Index: gcc-5.2.0/gcc/gcc.c
+===================================================================
+--- gcc-5.2.0.orig/gcc/gcc.c
++++ gcc-5.2.0/gcc/gcc.c
+@@ -2305,7 +2305,7 @@ for_each_path (const struct path_prefix
+       if (path == NULL)
+ 	{
+ 	  len = paths->max_len + extra_space + 1;
+-	  len += MAX (MAX (suffix_len, multi_os_dir_len), multiarch_len);
++	  len += MAX ((suffix_len + multi_os_dir_len), multiarch_len);
+ 	  path = XNEWVEC (char, len);
+ 	}
+ 
+@@ -2317,6 +2317,33 @@ for_each_path (const struct path_prefix
+ 	  /* Look first in MACHINE/VERSION subdirectory.  */
+ 	  if (!skip_multi_dir)
+ 	    {
++	      if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_dir))
++	        {
++	          const char *this_multi;
++	          size_t this_multi_len;
++
++	          if (pl->os_multilib)
++		    {
++		      this_multi = multi_os_dir;
++		      this_multi_len = multi_os_dir_len;
++		    }
++	          else
++		    {
++		      this_multi = multi_dir;
++		      this_multi_len = multi_dir_len;
++		    }
++
++	          /* Look in multilib MACHINE/VERSION subdirectory first */
++	          if (this_multi_len)
++	            {
++		      memcpy (path + len, this_multi, this_multi_len + 1);
++	              memcpy (path + len + this_multi_len, multi_suffix, suffix_len + 1);
++	              ret = callback (path, callback_info);
++	                if (ret)
++		          break;
++	            }
++	        }
++
+ 	      memcpy (path + len, multi_suffix, suffix_len + 1);
+ 	      ret = callback (path, callback_info);
+ 	      if (ret)
diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc b/meta/recipes-devtools/gcc/gcc-5.2.inc
index 1a1ed4c..f691f58 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
            file://0038-fix-g++-sysroot.patch \
            file://0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
            file://0040-nativesdk-gcc-support.patch \
+           file://0041-handle-target-sysroot-multilib.patch \
           "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0041-handle-target-sysroot-multilib.patch b/meta/recipes-devtools/gcc/gcc-5.2/0041-handle-target-sysroot-multilib.patch
new file mode 100644
index 0000000..5356984
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.2/0041-handle-target-sysroot-multilib.patch
@@ -0,0 +1,88 @@
+Search target sysroot gcc version specific dirs with multilib.
+
+We install the gcc libraries (such as crtbegin.p) into
+<sysroot><libdir>/<target-sys>/5.2.0/
+which is a default search path for GCC (aka multi_suffix in the 
+code below). <target-sys> is 'machine' in gcc's terminology. We use
+these directories so that multiple gcc versions could in theory 
+co-exist on target.
+
+We only want to build one gcc-cross-canadian per arch and have this work 
+for all multilibs. <target-sys> can be handled by mapping the multilib
+<target-sys> to the one used by gcc-cross-canadian, e.g. mips64-polkmllib32-linux 
+is symlinked to by mips64-poky-linux.
+
+The default gcc search path in the target sysroot for a "lib64" mutlilib is:
+
+<sysroot>/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/../lib64/
+<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/../lib64/
+<sysroot>/lib32/
+<sysroot>/usr/lib32/
+
+which means that the lib32 crtbegin.o will be found and the lib64 ones
+will not which leads to compiler failures.
+
+This patch injects a multilib version of that path first so the lib64
+binaries can be found first. With this change the search path becomes:
+
+<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/../lib64/
+<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/../lib64/
+<sysroot>/lib32/
+<sysroot>/usr/lib32/
+
+Upstream-Status: Pending
+RP 2015/7/31
+
+Index: gcc-5.2.0/gcc/gcc.c
+===================================================================
+--- gcc-5.2.0.orig/gcc/gcc.c
++++ gcc-5.2.0/gcc/gcc.c
+@@ -2305,7 +2305,7 @@ for_each_path (const struct path_prefix
+       if (path == NULL)
+ 	{
+ 	  len = paths->max_len + extra_space + 1;
+-	  len += MAX (MAX (suffix_len, multi_os_dir_len), multiarch_len);
++	  len += MAX ((suffix_len + multi_os_dir_len), multiarch_len);
+ 	  path = XNEWVEC (char, len);
+ 	}
+ 
+@@ -2317,6 +2317,33 @@ for_each_path (const struct path_prefix
+ 	  /* Look first in MACHINE/VERSION subdirectory.  */
+ 	  if (!skip_multi_dir)
+ 	    {
++	      if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_dir))
++	        {
++	          const char *this_multi;
++	          size_t this_multi_len;
++
++	          if (pl->os_multilib)
++		    {
++		      this_multi = multi_os_dir;
++		      this_multi_len = multi_os_dir_len;
++		    }
++	          else
++		    {
++		      this_multi = multi_dir;
++		      this_multi_len = multi_dir_len;
++		    }
++
++	          /* Look in multilib MACHINE/VERSION subdirectory first */
++	          if (this_multi_len)
++	            {
++		      memcpy (path + len, this_multi, this_multi_len + 1);
++	              memcpy (path + len + this_multi_len, multi_suffix, suffix_len + 1);
++	              ret = callback (path, callback_info);
++	                if (ret)
++		          break;
++	            }
++	        }
++
+ 	      memcpy (path + len, multi_suffix, suffix_len + 1);
+ 	      ret = callback (path, callback_info);
+ 	      if (ret)



