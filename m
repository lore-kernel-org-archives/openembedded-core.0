Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id BA0D46B7C2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 17:14:13 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id p61so2984782wes.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 09:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6Uxevb+kxtyEPuTTZX0vuifrpQ98zAJDtNsgicnF58E=;
	b=To6KEqX04ZNektMkgYPCvt0a/gE5a2CkM5YnycNhnGSe1Iao+wxPYl8eI+Lfl+lduI
	o/0L9DIGA2thaE+P5zhXBj2L5+QgZopXmzQWXtuQDyIcyWfVKs8rZUOT5l5oqHXwZUhD
	JyvNohBDj0FsfXf99Gv2dEo/sgFAxBAh214LHroKpPKiSmYU/2j3iEs6DtG2rhDMiLAH
	SNgl/d7mBgP5JZ8tTlxSx7AwsaQPHsmM7xIaOPJn9wFAc4wqf6na9i0NtgY8XvXKjr6V
	SHTrbyAHterMeTfbx2oHGzvKzoPvsw6vufVSIQQAiIjbCbxVpqwqhQpBHUg6HFEXf9V9
	o/yw==
X-Gm-Message-State: ALoCoQlEso8X4cxP1yWDJonPg+ddtlgxt/iVLrnEivIGJZec5DhLq3+eczYjtatVfiNGAlHsnDSk
X-Received: by 10.180.228.8 with SMTP id se8mr4234656wic.29.1389287654410;
	Thu, 09 Jan 2014 09:14:14 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm8589634wij.7.2014.01.09.09.14.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 09:14:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2014 17:14:03 +0000
Message-Id: <1389287644-901-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389287644-901-1-git-send-email-ross.burton@intel.com>
References: <1389287644-901-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/5] piglit: add (from meta-oe)
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
X-List-Received-Date: Thu, 09 Jan 2014 17:14:14 -0000

Piglit is an OpenGL testing tool.  This recipe is taken directly from meta-oe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb |   44 ++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit_git.bb

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
new file mode 100644
index 0000000..7c4f9a0
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -0,0 +1,44 @@
+SUMMARY = "OpenGL driver testing framework"
+LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
+
+SRC_URI = "git://anongit.freedesktop.org/piglit"
+
+# From 2012/12/30.
+SRCREV = "bbeff5d21b06d37338ad28e42d88f499bef13268"
+# (when PV goes above 1.0 remove the trailing r)
+PV = "1.0+gitr${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "virtual/libx11 waffle virtual/libgl libglu python-mako-native python-numpy-native"
+
+inherit cmake pythonnative
+
+# CMake sets the rpath at build time with the source tree, and will reset it at
+# install time. As we don't install this doesn't happen, so force the rpath to
+# what we need.
+EXTRA_OECMAKE = "-DCMAKE_BUILD_WITH_INSTALL_RPATH=1 -DCMAKE_INSTALL_RPATH=${libdir}/piglit/lib"
+
+do_install() {
+	install -d ${D}${bindir}
+        install -m 0755 piglit-*.py ${D}${bindir}
+
+        install -d ${D}${libdir}/piglit/
+
+        install -d ${D}${libdir}/piglit/bin
+        install -m 755 ${S}/bin/* ${D}${libdir}/piglit/bin
+
+        cp -a lib/ ${D}${libdir}/piglit/
+        cp -a framework/ ${D}${libdir}/piglit/
+        cp -a generated_tests/ ${D}${libdir}/piglit/
+        cp -a tests/ ${D}${libdir}/piglit/
+        cp -a templates/ ${D}${libdir}/piglit/
+
+        sed -i -e 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|' ${D}${bindir}/piglit-*.py
+        sed -i -e 's|^templatedir = .*$|templatedir = "${libdir}/piglit/templates"|' ${D}${bindir}/piglit-summary-html.py
+}
+
+FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
+
+RDEPENDS_${PN} = "python waffle python-json python-subprocess python-multiprocessing python-textutils python-netserver python-shell mesa-demos"
-- 
1.7.10.4


