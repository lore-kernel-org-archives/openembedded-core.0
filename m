Return-Path: <niko.mauno@iki.fi>
X-Greylist: delayed 558 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 11 Nov 2018 15:43:45 UTC
Received: from sypressi2.dnainternet.net (sypressi3.dnainternet.net
	[83.102.40.158])
	by mail.openembedded.org (Postfix) with ESMTP id 9E96B6C0F2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 15:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 29AF013D1E;
	Sun, 11 Nov 2018 17:34:27 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.652
X-Spam-Level: 
X-Spam-Status: No, score=0.652 tagged_above=-9999 required=6
	tests=[SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sypressi2.dnainternet.net ([83.102.40.158])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id orw5wDULJO3Y; Sun, 11 Nov 2018 17:34:26 +0200 (EET)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net
	[83.102.40.54])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 9BF89169BE;
	Sun, 11 Nov 2018 17:34:26 +0200 (EET)
Received: from localhost.localdomain (82-181-15-94.bb.dnainternet.fi
	[82.181.15.94])
	by omenapuu2.dnainternet.net (Postfix) with ESMTP id 73A642AE;
	Sun, 11 Nov 2018 17:34:24 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Nov 2018 17:34:14 +0200
Message-Id: <20181111153414.26447-1-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] opkg-utils: Fix update-alternatives link relocation
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
X-List-Received-Date: Sun, 11 Nov 2018 15:43:46 -0000
Content-Transfer-Encoding: 8bit

Recently Debian-style support for link relocation was added to
'update-alternatives' script, but it fails under circumstances where
host rootfs root directory differs from target rootfs root directory
and two alternative packages provide a symbolic link with source
located in different directories.

An example of the case is busybox provided /bin/rev (symlinking to
/bin/busybox.nosuid) and util-linux provided /usr/bin/rev (symlinking
to /usr/bin/rev.util-linux) in which case following failure occurs
during image recipe's do_rootfs() task:

  ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of ['util-linux'] have failed. If the intention is to defer them to first boot,
  then please place them into pkg_postinst_ontarget_${PN} ().
  Deferring to first boot via 'exit 1' is no longer supported.
  Details of the failure are in .../tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.
  ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs

Looking in log.do_rootfs file, following relevant lines can be observed:

  update-alternatives: renaming rev link from /bin/rev to /usr/bin/rev
  mv: cannot stat '/bin/rev': No such file or directory

Mitigate issue by applying patch which adds target root filesystem root
directory path prefix to failing 'mv' calls relevant variable references

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
---
 ...rnatives-Fix-link-relocation-support.patch | 40 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.3.6.bb            |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-Fix-link-relocation-support.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-Fix-link-relocation-support.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-Fix-link-relocation-support.patch
new file mode 100644
index 0000000000..e1836dbb34
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-Fix-link-relocation-support.patch
@@ -0,0 +1,40 @@
+From 18562ccae6996431d37767653b061d4e9e1b9424 Mon Sep 17 00:00:00 2001
+From: Niko Mauno <niko.mauno@iki.fi>
+Date: Sun, 11 Nov 2018 15:50:22 +0200
+Subject: [opkg-utils PATCH] update-alternatives: Fix link relocation support
+
+Commit fcb26339000021eb9bb711aa264247aebcfdd4ae which added Debian-style
+support for link relocation tries to relocate symbolic link on host OS,
+resulting in following-like error when two alternative packages have
+symbolic link source located in different directories (/bin/rev ->
+/bin/busybox.nosuid and /usr/bin/rev -> /usr/bin/rev.util-linux):
+
+  update-alternatives: renaming rev link from /bin/rev to /usr/bin/rev
+  mv: cannot stat '/bin/rev': No such file or directory
+
+Fix the issue by prefixing 'olink' and 'link' variable references with
+path to targeted root filesystem's root directory.
+
+Upstream-Status: Pending
+
+Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
+---
+ update-alternatives | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/update-alternatives b/update-alternatives
+index 89a440b..d4fa7eb 100644
+--- a/update-alternatives
++++ b/update-alternatives
+@@ -58,7 +58,7 @@ register_alt() {
+ 			local link_str=`echo $link | protect_slashes`
+ 			sed -e "1s/.*/$link_str/" $ad/$name > $ad/$name.new
+ 			mv $ad/$name.new $ad/$name
+-			mv $olink $link
++			mv $OPKG_OFFLINE_ROOT$olink $OPKG_OFFLINE_ROOT$link
+ 		fi
+ 	else
+ 		echo "$link" > "$ad/$name"
+-- 
+2.19.1
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
index cb3775d9c9..4c41774c39 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
            file://0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch \
            file://threaded-xz.patch \
            file://pigz.patch \
+           file://0001-update-alternatives-Fix-link-relocation-support.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
-- 
2.19.1


