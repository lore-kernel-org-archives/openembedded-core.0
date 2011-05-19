Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNAW0-0002NP-PW
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 23:12:20 +0200
Received: by mail-pz0-f47.google.com with SMTP id 36so1426512pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 14:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=R4NHRUeHj4BB+Jm/I9rMKOneF4erZCncn5eDTaT+wO0=;
	b=S6eKzROQoJUw1fLoZbTOzz04nT/KcaSY2yBXF0O39rJSb7t+6mpQzDRLMcKLR9CAKg
	fHIwHTBpSUJ5x3MRgLMOD355V5LElLyHXrQLnEkxs7GupPfXdQypLwAi1EEECHomSzQL
	kJuoKp7X2B/my+pFVsgIRQrZrFM2gjrlEW2Yc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qWN9ym2S+tgWdNyWEA4/8sAA7YGIhbR8OMjiYJ83cBtPSKhcJL4K1lKHcLfBMenmA6
	wu8ZgvcHMXSPRfR6IPeF3r+bA4Hau+d1CN3aPSZ/CO0DGHeakdCJ4W0EuG1NeBfsPsnq
	PZsr+tfp/JpxUiOHjwp5i6+GFbpf5Fq48qdw4=
Received: by 10.142.7.12 with SMTP id 12mr2204273wfg.181.1305839362529;
	Thu, 19 May 2011 14:09:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x15sm1783965wfd.0.2011.05.19.14.09.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 14:09:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2011 14:09:11 -0700
Message-Id: <836208067c345a911ddb3a266ac398b435054798.1305839225.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305839225.git.raj.khem@gmail.com>
References: <cover.1305839225.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] opkg-utils: Allow uppercase lettlers in package names
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
X-List-Received-Date: Thu, 19 May 2011 21:12:20 -0000

Some packages have uppercase letters in their names e.g.
efikamx kernel. We allow uppercase character with
uppercase-letters.patch

Import mtime-int.patch from OE commit
c81990aecae3bdf70a7c924699776b248ab7a006

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opkg-utils/opkg-utils/mtime-int.patch          |   29 +++++++++++++
 .../opkg-utils/opkg-utils/uppercase-letters.patch  |   44 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    8 +++-
 3 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/uppercase-letters.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
new file mode 100644
index 0000000..fdbce21
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
@@ -0,0 +1,29 @@
+Convert mtime to int before comparing it
+
+The st_mtime attribute (which is a float) is compared against a value
+from the timestamp database, which was stored as an integer there.
+
+When working on a filesystem with precise timestamps the comparision
+will fail nearly everytime hence.
+
+Although it might be possible to enhance the database to store the
+fractional part too, this will complicate things more than we would
+gain by this change.
+
+Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+
+Upstream-Status: Pending
+
+Index: opkg-utils/opkg-make-index
+===================================================================
+--- opkg-utils.orig/opkg-make-index
++++ opkg-utils/opkg-make-index
+@@ -100,7 +100,7 @@ for filename in files:
+      pkg = None
+      fnameStat = os.stat(filename)
+      if old_pkg_hash.has_key(basename):
+-          if pkgsStamps.has_key(basename) and fnameStat.st_mtime == pkgsStamps[basename]:
++          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:
+             if (verbose):
+                sys.stderr.write("Found %s in Packages\n" % (filename,))
+             pkg = old_pkg_hash[basename]
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/uppercase-letters.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/uppercase-letters.patch
new file mode 100644
index 0000000..689d780
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/uppercase-letters.patch
@@ -0,0 +1,44 @@
+when building packages, accept uppercase letters in the package name
+Fixes issues like
+
+
+| Packaged contents of kernel into /home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/work/efikamx-angstrom-linux-gnueabi/linux-efikamx-2.6.31-r0/deploy-ipks/efikamx/kernel_2.6.31-r0_efikamx.ipk
+| kernel-2.6.31.12-ER1
+| *** Error: Package name  contains illegal characters, (other than [a-z0-9.+-])
+|
+| opkg-build: Please fix the above errors and try again.
+| ERROR: Function 'opkg-build execution failed' failed
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: opkg-utils/opkg-buildpackage
+===================================================================
+--- opkg-utils.orig/opkg-buildpackage
++++ opkg-utils/opkg-buildpackage
+@@ -65,8 +65,8 @@ pkg_appears_sane_control() {
+ 	required_field Maintainer >/dev/null
+ 	required_field Description >/dev/null
+ 
+-	if echo $pkg | grep '[^a-z0-9.+-]'; then
+-		echo "opkg-build: Error: Package name $name contains illegal characters, (other than [a-z0-9.+-])"
++	if echo $pkg | grep '[^a-zA-Z0-9.+-]'; then
++		echo "opkg-build: Error: Package name $name contains illegal characters, (other than [a-zA-Z0-9.+-])"
+ 		PKG_ERROR=1;
+ 	fi
+ 
+Index: opkg-utils/opkg-build
+===================================================================
+--- opkg-utils.orig/opkg-build
++++ opkg-utils/opkg-build
+@@ -118,8 +118,8 @@ You probably want to chown these to a sy
+ 	disallowed_filename=`disallowed_field Filename`
+ 	[ "$?" -ne 0 ] && PKG_ERROR=1
+ 
+-	if echo $pkg | grep '[^a-z0-9.+-]'; then
+-		echo "*** Error: Package name $name contains illegal characters, (other than [a-z0-9.+-])" >&2
++	if echo $pkg | grep '[^a-zA-Z0-9.+-]'; then
++		echo "*** Error: Package name $name contains illegal characters, (other than [a-zA-Z0-9.+-])" >&2
+ 		PKG_ERROR=1;
+ 	fi
+ 
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
index 0db6f80..7e4c6e4 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
@@ -9,10 +9,13 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
-           file://index-ignore-filenotfound.patch"
+           file://index-ignore-filenotfound.patch \
+           file://mtime-int.patch \
+           file://uppercase-letters.patch \
+           "
 
 S = "${WORKDIR}/opkg-utils"
 
@@ -24,3 +27,4 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.7.4.1



