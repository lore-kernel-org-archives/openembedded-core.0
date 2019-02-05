Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 224B47BFFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:49 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id p6so1705613eds.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8qcoEzwkZChnjxkO7sg/0wA3GZqgSf9xksckXwSjxq8=;
	b=JnFJZK4KjDJEQEMVPyFy+tPCfMToHtPhgBnYzNgzJ/l9hpXyTuFwV4qU2I4rH82ASP
	hJMIutKcTIPJLyO879ajyY9OKhhgwg7zFfmaS0vwawGD6W6KZy4s6IUIpim1Qs20DXg/
	/RSyy171/LCfXJpELGfE4IcDjE+sl8wui2rJxcklChg7yrnZZJ/Wn3ZqWporQMF8QCjY
	6fMXWv0ZujVfnHDSyWoQCGLHm2a9AUw4SeisEdhIoetV423bJVWBcYyPsxBtuOMY/fMy
	drnI00FL+bBffDne6EENSRd4HovMWpRcMzxm3J15UI84cw9JptWALZlakJ3nXpwHiqWn
	f+uQ==
X-Gm-Message-State: AHQUAuYJjYoT1Qgbwxp1J98lCmAkqvabuZqdN83EtwHA+T/6s7h+yaTb
	LZig8qcwfeFSaT0EvwufCljxGpJ4
X-Google-Smtp-Source: AHgI3IbwrpZCyR6u2ngjS5Xonqv/PUUszCXrDwOL/FG80uaM3i1r3W6roKmlFSXPBXWZLDNmk/YXpw==
X-Received: by 2002:a17:906:1e12:: with SMTP id
	g18mr1697249ejj.65.1549333969514; 
	Mon, 04 Feb 2019 18:32:49 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:48 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:32 +0000
Message-Id: <20190205023241.29707-5-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 04/13] util-linux: fix packaging nativesdk-util-linux-lib*
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
X-List-Received-Date: Tue, 05 Feb 2019 02:32:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

util-linux is configured with --libdir=${base_libdir} for -target builds,
but with the default --libdir=${libdir} for all other builds. Furthermore,
dynamic util-linux-lib* packages are unconditionally being generated from
${base_libdir}, which is the right location for -target builds, only.

IOW, in the nativesdk case, util-linux-lib* packages are empty, and all
the shared libraries implicitly become part of the main package again.

While this surely wasn't intended, this also is going to cause problems as
upcoming changes are explicitly making util-linux an empty meta-package,
which then is going to cause packaging failures.

While fixing this, clean up the existing use of EXTRA_OECONF as it is a
bit confusing, hard to follow, and needlessly duplicates information:
    target: ${SHARED_EXTRA_OECONF} --libdir=${base_libdir}
    native/nativesdk: ${SHARED_EXTRA_OECONF} --disable-use-tty-group
where ${SHARED_EXTRA_OECONF} already contains --disable-use-tty-group.

This can be simplified by completely dropping the duplicated EXTRA_OECONF
assignments and simply using a new variable UTIL_LINUX_LIBDIR with a
_class-target override.

Additionally, this allows to easily fix packaging of the util-linux-lib*
packages, as we can now simply inspect UTIL_LINUX_LIBDIR where and as
needed to get to the right directories.

Lastly, all this can be moved from the .bb file into the .inc file as none
of that appears to actually be version specific, and we can sort the
configure options alphabetically for clarity.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc   | 31 ++++++++++++-------
 .../util-linux/util-linux_2.32.1.bb           |  9 ------
 2 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4a72e3d40e..a35174f009 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -42,19 +42,26 @@ PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser
 
 PACKAGES_DYNAMIC = "^util-linux-lib.*"
 
-SHARED_EXTRA_OECONF = "--disable-use-tty-group \
-                       --disable-makeinstall-chown \
-                       --enable-kill --enable-last --enable-mesg --enable-partx \
-                       --enable-raw --enable-rfkill --disable-login \
-                       --disable-vipw --disable-newgrp --disable-chfn-chsh \
-                       --enable-write --enable-mount --enable-unshare \
-                       --enable-libuuid --enable-libblkid --enable-fsck \
-                       --disable-minix --disable-bfs --without-udev \
-                       usrsbin_execdir='${sbindir}' \
+CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
+UTIL_LINUX_LIBDIR = "${libdir}"
+UTIL_LINUX_LIBDIR_class-target = "${base_libdir}"
+EXTRA_OECONF = "\
+    --enable-libuuid --enable-libblkid \
+    \
+    --enable-fsck --enable-kill --enable-last --enable-mesg \
+    --enable-mount --enable-partx --enable-raw --enable-rfkill \
+    --enable-unshare --enable-write \
+    \
+    --disable-bfs --disable-chfn-chsh --disable-login \
+    --disable-makeinstall-chown --disable-minix --disable-newgrp \
+    --disable-use-tty-group --disable-vipw \
+    \
+    --without-udev \
+    \
+    usrsbin_execdir='${sbindir}' \
+    --libdir='${UTIL_LINUX_LIBDIR}' \
 "
 
-EXTRA_OECONF = "${SHARED_EXTRA_OECONF} --libdir=${base_libdir}"
-
 PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 
@@ -309,7 +316,7 @@ ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 BBCLASSEXTEND = "native nativesdk"
 
 python populate_packages_prepend() {
-    do_split_packages(d, '${base_libdir}', r'^lib(.*)\.so\..*$',
+    do_split_packages(d, d.getVar('UTIL_LINUX_LIBDIR'), r'^lib(.*)\.so\..*$',
                       output_pattern='util-linux-lib%s',
                       description='util-linux lib%s',
                       extra_depends='', prepend=True, allow_links=True)
diff --git a/meta/recipes-core/util-linux/util-linux_2.32.1.bb b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
index 0f860c221b..e0bd383631 100644
--- a/meta/recipes-core/util-linux/util-linux_2.32.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
@@ -11,12 +11,3 @@ SRC_URI += "file://configure-sbindir.patch \
 "
 SRC_URI[md5sum] = "9e5b1b8c1dc99455bdb6b462cf9436d9"
 SRC_URI[sha256sum] = "86e6707a379c7ff5489c218cfaf1e3464b0b95acf7817db0bc5f179e356a67b2"
-
-CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
-
-EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF} \
-			     --disable-use-tty-group \
-"
-EXTRA_OECONF_class-nativesdk = "${SHARED_EXTRA_OECONF} \
-				--disable-use-tty-group \
-"
-- 
2.20.1


