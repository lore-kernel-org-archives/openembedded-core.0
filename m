Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.3546.1591124971319976325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 12:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OSxxjKKm;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: gzatko@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id u26so2885547wmn.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VvkJz6h3eiyKPS3L7zhgHDdGevzwiekOlnvDG+ODnA4=;
        b=OSxxjKKm56AkhM3jsG1aDGNuAE2EDr8WNkiloUOyAUnAhMc62Wg5lA6T8P7SgoXAXo
         1TDCZ9/cUGpJ4ueaX6mgypsrh+4QnxS0OvvnmL1YxOs5+qbb0L1zkBPinl27/DpwyKjc
         SVTN7yuxpXTXhbd93aHJRYG7mkTEnm0RX7Twb089O9oB0H++lDd/K6XKk/b9qDUqE1tu
         X7fjc4Kj1lGoAezTa1P64pc6Ua/IbLZ3aECxj2kilEdG1n5e1w/c7t2aX/L3GHq/Idns
         7GUQh/KH1UKaOL5yd3S7TCgf3hs8ausAYmbyRcH9DT7LBD8sTqF7jtfVbVsqmYCVhMy7
         Ug8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VvkJz6h3eiyKPS3L7zhgHDdGevzwiekOlnvDG+ODnA4=;
        b=Z/euToYRJmWBAW09HRJbTJrS5HlA1jZefq6hcn19hULfEzAUS5H82Zmk4aCNV52s6A
         GMSLjjHp0UJGBZuBZd5PjtwynG7JFJFrbXpQwYjhwakt+l/dWKEbR+oQ+UOOk1PRkGDe
         j7TEl+AY0GBWzm8wIJ6l7RVjXz9VwnXTTDqWtK+7FjDZs3iPbCXZD/iRWZil8fwD+ML3
         izeK3lcdjD1E3oXlKaNM/+VCo0tKOx1Nm+CrdrBzKxxFhf6mvnqOZ2YzaJ8z7pGWMJbq
         5LUoZzblcCUXqqlfrxCy0nAUA3uE/DzYkOpbYrDkG5xfVH/E3fe4/5M2E752Ft1NjGqf
         0eMA==
X-Gm-Message-State: AOAM533UP9ifPQU0mFZMVnz8drVmmL2i/17CKwrNFSJLt2mr/qHIB+W+
	Vy+FwWe99Zne+zdAGhPxQ9NtGb5tY8wLWg==
X-Google-Smtp-Source: ABdhPJyeAtaqQSCMpoeAnuLL3V/3bj8FkFU/7xZHo8jIiI0ZX0ixK38ExYVmPRFDXAdu/hQun7q6nQ==
X-Received: by 2002:a1c:230a:: with SMTP id j10mr5270443wmj.124.1591124969250;
        Tue, 02 Jun 2020 12:09:29 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from localhost.localdomain (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id y5sm5546139wrs.63.2020.06.02.12.09.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 12:09:28 -0700 (PDT)
From: "Gregor Zatko" <gzatko@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] update-alternatives: introduce new package as a opkg-utils spin-off
Date: Tue,  2 Jun 2020 21:09:25 +0200
Message-Id: <20200602190925.384853-1-gzatko@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases there is a need for update-alternatives script which gets built
within opkg-utils recipe into a standalone package. However, this causes to
many unnecessary dependencies, including Python, bc, OpenSSL etc. to be built.

In this commit a standalone lightweight recipe for update-alternatives that
shouldn't be dependent on nothing other than bash.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=8879

Signed-off-by: Gregor Zatko <gzatko@gmail.com>
---
 .../conf/distro/include/default-providers.inc |  6 +--
 meta/conf/layer.conf                          |  3 +-
 .../packagegroups/packagegroup-self-hosted.bb |  1 +
 .../opkg-utils/opkg-utils_0.4.2.bb            | 25 +---------
 .../update-alternatives_0.4.2.bb              | 49 +++++++++++++++++++
 5 files changed, 56 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives_0.4.2.bb

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ea88bd4876..035877af59 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -10,8 +10,8 @@ PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
-PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
-PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives"
+PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "update-alternatives-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
 PREFERRED_PROVIDER_virtual/base-utils ?= "busybox"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
@@ -21,7 +21,7 @@ PREFERRED_PROVIDER_virtual/make-native ?= "make-native"
 #
 # Default virtual runtime providers
 #
-VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
+VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives"
 VIRTUAL-RUNTIME_apm ?= "apm"
 VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
 VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index da93d64e0a..85fb945f11 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -19,7 +19,6 @@ BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
-# opkg-utils is for update-alternatives :(
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
   busybox-inittab \
@@ -40,7 +39,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   shadow \
   shadow-sysroot \
   base-passwd \
-  opkg-utils \
+  update-alternatives \
   gstreamer1.0-meta-base \
   ca-certificates \
   shared-mime-info \
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 9a70b189a4..4a494f1578 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -166,6 +166,7 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     tcl \
     texinfo \
     unzip \
+    update-alternatives \
     usbutils \
     watchdog \
     wget \
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
index 9315240190..5ebe3d8e60 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
@@ -1,13 +1,11 @@
 SUMMARY = "Additional utilities for the opkg package manager"
-SUMMARY_update-alternatives-opkg = "Utility for managing the alternatives system"
 SECTION = "base"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=2;endline=18;md5=ffa11ff3c15eb31c6a7ceaa00cc9f986"
-PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
-SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \ 
+SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://fix-reproducibility.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
@@ -25,42 +23,23 @@ inherit perlnative
 PYTHONRDEPS = "python3 python3-shell python3-io python3-math python3-crypt python3-logging python3-fcntl python3-pickle python3-compression python3-stringold"
 PYTHONRDEPS_class-native = ""
 
-PACKAGECONFIG = "python update-alternatives"
+PACKAGECONFIG = "python"
 PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
-PACKAGECONFIG[update-alternatives] = ",,,"
 
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
-	if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'true', 'false', d)}; then
-		rm -f "${D}${bindir}/update-alternatives"
-	fi
 }
 
 do_install_append_class-target() {
 	if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
 		grep -lZ "/usr/bin/env.*python" ${D}${bindir}/* | xargs -0 rm
 	fi
-
-	if [ -e "${D}${bindir}/update-alternatives" ]; then
-		sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${nonarch_libdir},g'
-	fi
 }
 
 # These are empty and will pull python3-dev into images where it wouldn't
 # have been otherwise, so don't generate them.
 PACKAGES_remove = "${PN}-dev ${PN}-staticdev"
 
-PACKAGES =+ "update-alternatives-opkg"
-FILES_update-alternatives-opkg = "${bindir}/update-alternatives"
-RPROVIDES_update-alternatives-opkg = "update-alternatives update-alternatives-cworth"
-RREPLACES_update-alternatives-opkg = "update-alternatives-cworth"
-RCONFLICTS_update-alternatives-opkg = "update-alternatives-cworth"
-
-pkg_postrm_update-alternatives-opkg() {
-	rm -rf $D${nonarch_libdir}/opkg/alternatives
-	rmdir $D${nonarch_libdir}/opkg || true
-}
-
 BBCLASSEXTEND = "native nativesdk"
 
 CLEANBROKEN = "1"
diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives_0.4.2.bb b/meta/recipes-devtools/update-alternatives/update-alternatives_0.4.2.bb
new file mode 100644
index 0000000000..8cbf8c4889
--- /dev/null
+++ b/meta/recipes-devtools/update-alternatives/update-alternatives_0.4.2.bb
@@ -0,0 +1,49 @@
+SUMMARY = "Utility for managing the alternatives system"
+DESCRIPTION = "This program was inspired by the Debian update-alternatives program which is Copyright (C) 1995 Ian Jackson. This version of update-alternatives is command-line compatible with Debian's for a subset of the options, (only --install, --remove, and --help)"
+SECTION = "base"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://opkg.py;beginline=2;endline=18;md5=ffa11ff3c15eb31c6a7ceaa00cc9f986"
+
+SRC_ARCHIVE_NAME = "opkg-utils"
+SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${SRC_ARCHIVE_NAME}/snapshot/${SRC_ARCHIVE_NAME}-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
+S = "${WORKDIR}/${SRC_ARCHIVE_NAME}-${PV}"
+
+SRC_URI[md5sum] = "cc210650644fcb9bba06ad5ec95a63ec"
+SRC_URI[sha256sum] = "5929ad87d541789e0b82d626db01a1201ac48df6f49f2262fcfb86cf815e5d6c"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+RDEPENDS_${PN} += "bash"
+
+do_compile[noexec] = "1"
+
+do_install() {
+
+    install -D -m 755 ${S}/update-alternatives ${D}${bindir}/update-alternatives
+}
+
+do_install_append_class-target() {
+
+    sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${nonarch_libdir},g'
+}
+
+FILES_${PN} = "${bindir}/update-alternatives"
+RPROVIDES_${PN} = "${PN} update-alternatives-cworth"
+RREPLACES_${PN} = "update-alternatives-cworth"
+RCONFLICTS_${PN} = "update-alternatives-cworth"
+
+PROVIDES_class-target += "virtual/update-alternatives"
+RPROVIDES_${PN}_class-target += "update-alternatives"
+PROVIDES_class-native += "virtual/update-alternatives-native"
+RPROVIDES_${PN}_class-native += "update-alternatives-native"
+
+pkg_postrm_${PN}() {
+
+    rm -rf $D${nonarch_libdir}/opkg/alternatives
+    rmdir $D${nonarch_libdir}/opkg || true
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.26.2

