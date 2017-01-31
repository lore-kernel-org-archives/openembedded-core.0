Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E32A771DB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 00:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0V0DX0x006041; Tue, 31 Jan 2017 00:14:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ahg3DLTwRQDA; Tue, 31 Jan 2017 00:14:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0V0EXDf006130
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Jan 2017 00:14:34 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cYM5h-00079X-Gw; Tue, 31 Jan 2017 00:14:33 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 00:14:26 +0000
Message-Id: <1485821667-27436-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485821667-27436-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485821667-27436-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/5] binutils-cross: Remove exec_prefix from the linker search path
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
X-List-Received-Date: Tue, 31 Jan 2017 00:14:40 -0000

We don't put target libs into a native/cross ${exec_prefix} but having
this in the default search path means all linker scripts have to be relocated.
This is a considerable chunk of files to create multiple copies of for no good
reason.

Instead, patch out the paths we don't need.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils-cross.inc  |  5 +++
 .../binutils/binutils/no-tooldirpaths.patch        | 47 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/no-tooldirpaths.patch

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index fd3d801..7ebd7e3 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -7,9 +7,14 @@ BPN = "binutils"
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
+SRC_URI += "file://no-tooldirpaths.patch"
+
+# Specify lib-path else we use a load of search dirs which we don't use
+# and mean the linker scripts have to be relocated.
 EXTRA_OECONF += "--with-sysroot=${STAGING_DIR_TARGET} \
                 --disable-install-libbfd \
                 --enable-poison-system-directories \
+                --with-lib-path==${target_base_libdir}:=${target_libdir} \
                 "
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
diff --git a/meta/recipes-devtools/binutils/binutils/no-tooldirpaths.patch b/meta/recipes-devtools/binutils/binutils/no-tooldirpaths.patch
new file mode 100644
index 0000000..2bfc8d4
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/no-tooldirpaths.patch
@@ -0,0 +1,47 @@
+We don't place target libraries within ${exec_prefix}, we'd always place these
+within the target sysroot within the standard library directories. Worse, the
+append_to_lib_path code prefixes these paths with the sysroot which makes even
+less sense.
+
+These directories therefore don't make sense in our case and mean we have to 
+relocate all the linker scripts if they're present. Dropping them 
+gives a reasonable performance improvement/simplification.
+
+Upstream-Status: Inappropriate
+
+RP 2017/01/30
+
+Index: git/ld/genscripts.sh
+===================================================================
+--- git.orig/ld/genscripts.sh
++++ git/ld/genscripts.sh
+@@ -189,29 +189,6 @@ append_to_lib_path()
+   fi
+ }
+ 
+-# Always search $(tooldir)/lib, aka /usr/local/TARGET/lib when native
+-# except when LIBPATH=":".
+-if [ "${LIB_PATH}" != ":" ] ; then
+-  libs=
+-  if [ "x${TOOL_LIB}" = "x" ] ; then
+-    if [ "x${NATIVE}" = "xyes" ] ; then
+-      libs="${exec_prefix}/${target_alias}/lib"
+-    fi
+-  else
+-    # For multilib'ed targets, ensure both ${target_alias}/lib${LIBPATH_SUFFIX}
+-    # and ${TOOL_LIB}/lib${LIBPATH_SUFFIX} are in the default search path,
+-    # because 64bit libraries may be in both places, depending on
+-    # cross-development setup method (e.g.: /usr/s390x-linux/lib64
+-    # vs. /usr/s390-linux/lib64)
+-    case "${NATIVE}:${LIBPATH_SUFFIX}:${TOOL_LIB}" in
+-      :* | *::* | *:*:*${LIBPATH_SUFFIX}) ;;
+-      *) libs="${exec_prefix}/${target_alias}/lib${LIBPATH_SUFFIX}" ;;
+-    esac
+-    libs="${exec_prefix}/${TOOL_LIB}/lib ${libs}"
+-  fi
+-  append_to_lib_path ${libs}
+-fi
+-
+ if [ "x${LIB_PATH}" = "x" ] && [ "x${USE_LIBPATH}" = xyes ] ; then
+   libs=${NATIVE_LIB_DIRS}
+   if [ "x${NATIVE}" = "xyes" ] ; then
-- 
2.7.4


