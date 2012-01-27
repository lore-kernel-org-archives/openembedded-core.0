Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUo-0005Wb-0Q
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:54 +0100
Received: by mail-gy0-f175.google.com with SMTP id g19so802214ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1fvJaZJSv6O7fn7Ndmbqx3S3+ZxVWDx87oLGWNl4LRw=;
	b=VyJ7wpYlY9XM2msxfTZqCZqwK9hE/k3BLtDLPHaQtv6cx+guufPsmNSMqRbbawlM5c
	g9p/zCxLg/W5cIRd7OjykpMkMe39bO51AbOr/AAqTiTHB58xaif0STrX/jEpdkzRNc7b
	cKIZzp3mcflO4luCOM34GHYd0KPqWgPFpftjU=
Received: by 10.101.21.2 with SMTP id y2mr3522726ani.11.1327684446908;
	Fri, 27 Jan 2012 09:14:06 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.14.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:14:03 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:48 -0600
Message-Id: <8ee0787741b705ad557e60391d0d6f462c5ed29a.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 10/10] external-csl-toolchain: extract version info from the toolchain
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
X-List-Received-Date: Fri, 27 Jan 2012 17:21:55 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/distro/include/csl-versions.inc        |  105 ++++++++++++++++++++++
 meta/conf/distro/include/tcmode-external-csl.inc |    2 +
 meta/recipes-core/meta/external-csl-toolchain.bb |   24 +++++
 3 files changed, 131 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/distro/include/csl-versions.inc

diff --git a/meta/conf/distro/include/csl-versions.inc b/meta/conf/distro/include/csl-versions.inc
new file mode 100644
index 0000000..22e8394
--- /dev/null
+++ b/meta/conf/distro/include/csl-versions.inc
@@ -0,0 +1,105 @@
+def csl_run(d, cmd, *args):
+	import bb.process
+	import subprocess
+
+	topdir = d.getVar('TOPDIR', True)
+	toolchain_path = d.getVar('EXTERNAL_TOOLCHAIN', True)
+	if not toolchain_path:
+		return 'UNKNOWN', 'UNKNOWN'
+
+	target_prefix = d.getVar('TARGET_PREFIX', True)
+	path = os.path.join(toolchain_path, 'bin', target_prefix + cmd)
+	args = [path] + list(args)
+
+	return bb.process.run(args, cwd=topdir, stderr=subprocess.PIPE)
+
+def csl_get_version(d):
+        try:
+		stdout, stderr = csl_run(d, 'gcc', '-v')
+	except bb.process.CmdError as exc:
+		bb.error('Failed to obtain CodeSourcery toolchain version: %s' % exc)
+		return 'UNKNOWN'
+	else:
+		last_line = stderr.splitlines()[-1]
+		return last_line
+
+def csl_get_main_version(d):
+	version = csl_get_version(d)
+	if version != 'UNKNOWN':
+		return version.split()[-1].rstrip(')')
+	else:
+		return version
+
+def csl_get_gcc_version(d):
+	version = csl_get_version(d)
+	if version != 'UNKNOWN':
+		return version.split()[2]
+	else:
+		return version
+
+def csl_get_libc_version(d):
+	import os,bb
+	syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}', d)
+	if not syspath:
+	        return 'UNKNOWN'
+
+	libpath = syspath + '/libc/lib/'
+	if not os.path.exists(libpath):
+		libpath = syspath + '/libc/sgxx-glibc/lib/'
+
+	if os.path.exists(libpath):
+		for file in os.listdir(libpath):
+			if file.find('libc-') == 0:
+				return file[5:-3]
+	return 'UNKNOWN'
+
+def csl_get_kernel_version(d):
+	import os,bb
+	syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}', d)
+	if not syspath:
+	        return 'UNKNOWN'
+
+	vf = syspath + '/libc/usr/include/linux/version.h'
+	if not os.path.exists(vf):
+		vf = syspath + '/libc/sgxx-glibc/usr/include/linux/version.h'
+
+	try:
+		f = open(vf, 'r')
+	except (OSError, IOError):
+		return 'UNKNOWN'
+
+	l = f.readlines();
+	f.close();
+	for s in l:
+		if s.find('LINUX_VERSION_CODE') > 0:
+			ver = int(s.split()[2])
+			maj = ver / 65536
+			ver = ver % 65536
+			min = ver / 256
+			ver = ver % 256
+			return str(maj)+'.'+str(min)+'.'+str(ver)
+	return 'UNKNOWN'
+
+def csl_get_gdb_version(d):
+	try:
+		stdout, stderr = csl_run(d, 'gdb', '-v')
+	except CmdError:
+		return 'UNKNOWN'
+	else:
+		first_line = stdout.splitlines()[0]
+		return first_line.split()[-1]
+
+python csl_version_handler () {
+    if not isinstance(e, bb.event.ConfigParsed):
+        return
+    d = e.data
+    ld = d.createCopy()
+    ld.finalize()
+
+    d.setVar('CSL_VER_MAIN', csl_get_main_version(ld))
+    d.setVar('CSL_VER_GCC', csl_get_gcc_version(ld))
+    d.setVar('CSL_VER_LIBC', csl_get_libc_version(ld))
+    d.setVar('CSL_VER_KERNEL', csl_get_kernel_version(ld))
+    d.setVar('CSL_VER_GDB', csl_get_gdb_version(ld))
+}
+addhandler csl_version_handler
diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 0135590..1ff808d 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -108,3 +108,5 @@ def populate_toolchain_links(d):
             if exc.errno == errno.EEXIST:
                 break
             bb.fatal("Unable to populate toolchain binary symlink for %s: %s" % (newpath, exc))
+
+require conf/distro/include/csl-versions.inc
diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index 8cf73da..c9f35c4 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -23,6 +23,7 @@ PROVIDES += "\
 	libgcc \
 	virtual/linux-libc-headers \
 "
+PV = "${CSL_VER_MAIN}"
 PR = "r3"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
@@ -97,6 +98,29 @@ PKG_${PN}-extra-nss = "eglibc-extra-nss"
 PKG_${PN}-thread-db = "eglibc-thread-db"
 PKG_${PN}-pcprofile = "eglibc-pcprofile"
 
+PKGV_${PN} = "${CSL_VER_LIBC}"
+PKGV_${PN}-dev = "${CSL_VER_LIBC}"
+PKGV_${PN}-doc = "${CSL_VER_LIBC}"
+PKGV_${PN}-dbg = "${CSL_VER_LIBC}"
+PKGV_${PN}-pic = "${CSL_VER_LIBC}"
+PKGV_${PN}-utils = "${CSL_VER_LIBC}"
+PKGV_${PN}-gconv = "${CSL_VER_LIBC}"
+PKGV_${PN}-extra-nss = "${CSL_VER_LIBC}"
+PKGV_${PN}-thread-db = "${CSL_VER_LIBC}"
+PKGV_${PN}-pcprofile = "${CSL_VER_LIBC}"
+PKGV_catchsegv = "${CSL_VER_LIBC}"
+PKGV_libsegfault = "${CSL_VER_LIBC}"
+PKGV_sln = "${CSL_VER_LIBC}"
+PKGV_nscd = "${CSL_VER_LIBC}"
+PKGV_ldd = "${CSL_VER_LIBC}"
+PKGV_libgcc = "${CSL_VER_GCC}"
+PKGV_libgcc-dev = "${CSL_VER_GCC}"
+PKGV_libstdc++ = "${CSL_VER_GCC}"
+PKGV_libstdc++-dev = "${CSL_VER_GCC}"
+PKGV_linux-libc-headers = "${CSL_VER_KERNEL}"
+PKGV_linux-libc-headers-dev = "${CSL_VER_KERNEL}"
+PKGV_gdbserver = "${CSL_VER_GDBSERVER}"
+
 FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
 FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
 FILES_libstdc++ = "${libdir}/libstdc++.so.*"
-- 
1.7.8.rc4



