Return-Path: <armccurdy@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id AD8AB745D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 22:12:56 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 77-v6so18434451otd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 15:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FJ27gtMNPFr4NrYY211XXg1vwcyPHJHUlTs5/WaUX4g=;
	b=kr0s/zOo2izd/OzzXkS3J7y2mszUzaXWSNtcP6+aj56BE/rZWCs8Jd3zpWvAKMGAmY
	gWGXzbsmuoAtdBHULGdQ4NK9/zf7jQkB4zxciVGqu5rmlkyFgocbOV7oDSfWQ/g4Ohrc
	q0Re0MC5skvFzAr1XdHSGpNS0jE5uVzFNoGTLeRUXE2tGk0686EMG6tBeCRpRdn1yJJN
	6+1tnlIEXriu8ANXp6OT5x3kKTFzGnHh3lMURQT5YsvJ5RAStZ91TM4SGcDt74ZdF6jr
	4c07hvDOf+tEBlgd3TKwyyAYoiM0rSmXZsJT6xsXYfZoQSFjJfpTp0xfPhX8cky996lk
	i1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FJ27gtMNPFr4NrYY211XXg1vwcyPHJHUlTs5/WaUX4g=;
	b=bmu+tEj62tQFTR8fm06No7IgdNEQAJZz3c9minsY8xWUnUnVXSH+l1ARxP4sdfc6ec
	cfTw6CGv+RVMfyGlxOB+EevocgM7b4AkOlNKmmwc9NY3nw8roiYf/diUNTkQNKpP1XTB
	jqw2LqNXhP3Kuq6ftPc7NWOeFR8bIZ9EvrtPZfevwzjw4gCisc//ZPzW1aEj3f4ORs22
	qk5u7GWhQsB+PBmI5ZqjIHYeRB7Sa55KjyaRBbHzYlUSygWFTGPbtO5QQCYAUcqHJKIc
	7X/cUjm7dlpVdqSv9ypgjBp74vlFnqUM8ZMqPTZbCOtZ/JKL56u5Z0ZI+QsvyyZgfgFe
	OGNg==
X-Gm-Message-State: ALQs6tDxevz/9IKWVG26Y3h6utbsXqTaIGN76QOduOtpMDOUPQWENVxg
	JRny1pjWKRnxi5LfbGCVmjMlEA==
X-Google-Smtp-Source: AB8JxZrLiTZuobyKZ4Le3Vo+Ao25Q6LpdZzUEwlQwCoaVoUqYe5LzzoNlbpGMADEn9E37nVMcwiJOw==
X-Received: by 2002:a9d:282d:: with SMTP id
	m42-v6mr15756000otb.64.1525299177217; 
	Wed, 02 May 2018 15:12:57 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	p3-v6sm8202716otp.2.2018.05.02.15.12.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 May 2018 15:12:56 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2018 15:12:49 -0700
Message-Id: <1525299169-24240-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] subversion: misc recipe cleanup
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
X-List-Received-Date: Wed, 02 May 2018 22:12:57 -0000

 - Add default value for PACKAGECONFIG
 - Combine "inherit autotools" with "inherit pkgconfig gettext"
 - Drop historical addition of -L${STAGING_LIBDIR} to LDFLAGS
 - Re-order variables according to OE styleguide

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../subversion/subversion_1.9.7.bb                 | 37 ++++++++++++----------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.9.7.bb b/meta/recipes-devtools/subversion/subversion_1.9.7.bb
index 57735f7..da9de9d 100644
--- a/meta/recipes-devtools/subversion/subversion_1.9.7.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.9.7.bb
@@ -1,14 +1,11 @@
 SUMMARY = "Subversion (svn) version control system client"
+HOMEPAGE = "http://subversion.tigris.org"
 SECTION = "console/network"
-DEPENDS = "apr-util serf sqlite3 file"
-DEPENDS_append_class-native = " file-replacement-native"
-RDEPENDS_${PN} = "serf"
 LICENSE = "Apache-2"
-HOMEPAGE = "http://subversion.tigris.org"
-
-BBCLASSEXTEND = "native"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=af81ae49ba359e70626c05e9bf313709"
 
-inherit gettext pkgconfig
+DEPENDS = "apr-util serf sqlite3 file"
+DEPENDS_append_class-native = " file-replacement-native"
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
@@ -20,26 +17,28 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "05b0c677681073920f938c1f322e0be2"
 SRC_URI[sha256sum] = "c3b118333ce12e501d509e66bb0a47bcc34d053990acab45559431ac3e491623"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=af81ae49ba359e70626c05e9bf313709"
+inherit autotools pkgconfig gettext
+
+PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
 PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring,--without-gnome-keyring,glib-2.0 gnome-keyring"
 
 EXTRA_OECONF = " \
-                --without-berkeley-db --without-apxs \
-                --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
-                --with-apr-util=${STAGING_BINDIR_CROSS} \
-                --disable-keychain \
-                ac_cv_path_RUBY=none"
+    --with-apr=${STAGING_BINDIR_CROSS} \
+    --with-apr-util=${STAGING_BINDIR_CROSS} \
+    --without-apxs \
+    --without-berkeley-db \
+    --without-swig \
+    --disable-keychain \
+    ac_cv_path_RUBY=none \
+"
 
-inherit autotools
+acpaths = "-I build/ -I build/ac-macros/"
 
-export LDFLAGS += " -L${STAGING_LIBDIR} "
 CPPFLAGS += "-P"
 BUILD_CPPFLAGS += "-P"
 
-acpaths = "-I build/ -I build/ac-macros/"
-
 do_configure_prepend () {
 	rm -f ${S}/libtool
 	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
@@ -53,3 +52,7 @@ do_configure_prepend () {
 #| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/subversion-1.8.9/build-outputs.mk:1090: recipe for target 'install-serf-lib' failed
 #| make: *** [install-serf-lib] Error 1
 PARALLEL_MAKEINST = ""
+
+RDEPENDS_${PN} = "serf"
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


