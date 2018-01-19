Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF4A771F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 03:12:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0J3CZ41001444
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 19:12:35 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 18 Jan 2018 19:12:34 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jan 2018 11:10:12 +0800
Message-ID: <20180119031012.2056-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] opkg-utils: fix the sed pattern in update-alternatives
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
X-List-Received-Date: Fri, 19 Jan 2018 03:12:34 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

'\>' is to matches the end of a word, but the executable is
not always a 'word', e.g. /usr/lib64/busybox/usr/bin/[

then such alternatives can not be removed.

So change to use '\s' in the pattern since the following
character of the $path is whitespace.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...ternatives-remove_alt-fix-the-sed-pattern.patch | 36 ++++++++++++++++++++++
 .../opkg-utils/opkg-utils_0.3.5.bb                 |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/update-alternatives-remove_alt-fix-the-sed-pattern.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/update-alternatives-remove_alt-fix-the-sed-pattern.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/update-alternatives-remove_alt-fix-the-sed-pattern.patch
new file mode 100644
index 0000000000..cca07a7d5b
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/update-alternatives-remove_alt-fix-the-sed-pattern.patch
@@ -0,0 +1,36 @@
+From e8b8880a281ccb0082f6cad63eb253b921f31fef Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 18 Jan 2018 17:57:08 -0800
+Subject: [PATCH] update-alternatives: fix the sed pattern in remove_alt
+
+'\>' is to matches the end of a word, but the executable is
+not always a 'word', e.g. /usr/lib64/busybox/usr/bin/[
+
+then such alternatives can not be removed.
+
+So change to use '\s' in the pattern since the following
+character of the $path is whitespace.
+
+Upstream-Status: Submitted [yocto@yoctoproject.org, opkg-devel@googlegroups.com]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ update-alternatives | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/update-alternatives b/update-alternatives
+index ffad853..ce7d66c 100644
+--- a/update-alternatives
++++ b/update-alternatives
+@@ -80,7 +80,7 @@ remove_alt() {
+ 	[ ! -f $ad/$name ] && return 0
+ 
+ 	path=`echo $path | protect_slashes | protect_special_character`
+-	sed -ne "/^$path\>.*/!p" $ad/$name > $ad/$name.new
++	sed -ne "/^$path\s.*/!p" $ad/$name > $ad/$name.new
+ 	mv $ad/$name.new $ad/$name
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
index 514ba7912a..53b69efe55 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
@@ -9,6 +9,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
+           file://update-alternatives-remove_alt-fix-the-sed-pattern.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
-- 
2.11.0


