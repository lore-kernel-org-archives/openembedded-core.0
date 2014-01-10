Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3523160B9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:02:18 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hn9so1578672wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UnTcZn+KqVowQgk9KYV6njsqlhwT246uPwqk9hIhQMA=;
	b=cf35mqJNx8an0TTQvyL5NzDysz6UOCRICXTp7yds29QXWFSBc0d4JrHrn5ZGn5x+Bh
	+brJuEV7XTqJWMHKi3JSdQSwEWbC09seF2k3TNtjSxeepv2XJS8jqM7oVAQG80sF8tMY
	VP2LdtsisDLbFEjwIBd8SHkrHd4eifyNJyvBOrJqgljZ9exZcHF6Ur49iIZAsS0KM7Uy
	ZWFyMbi1C52BljdgiU8ZNCODefHwzfnsL3wtN7HTqP+fvIoZuojPXBAGRmZe8scORUSh
	jEcDb/qrsqAv2zO3x4YgWRyrOavUZf9Ugkibn9/dJ0tFrp8QLP4dgzpdtFOUwaoWw0yX
	pCIw==
X-Gm-Message-State: ALoCoQnBL5mLOjNjHWBqCXLYkMvjJd4sjML0eJw6Tj+Kwu02wA2nc/USPeEXHR2PzcGkygqFp1Xa
X-Received: by 10.195.13.164 with SMTP id ez4mr9608190wjd.11.1389373338901;
	Fri, 10 Jan 2014 09:02:18 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id eh7sm3494947wic.2.2014.01.10.09.02.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 09:02:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 17:02:08 +0000
Message-Id: <1389373329-21241-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389373329-21241-1-git-send-email-ross.burton@intel.com>
References: <1389373329-21241-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 4/5] piglit: add (from meta-oe)
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
X-List-Received-Date: Fri, 10 Jan 2014 17:02:18 -0000

Piglit is an OpenGL testing tool.  This recipe is taken directly from meta-oe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb |   48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit_git.bb

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
new file mode 100644
index 0000000..8616764
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -0,0 +1,48 @@
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
+# As piglit doesn't install, enforce in-tree builds so that we can easily copy
+# contents out of $S and $B.
+B="${S}"
+
+# CMake sets the rpath at build time with the source tree, and will reset it at
+# install time. As we don't install this doesn't happen, so force the rpath to
+# what we need.
+EXTRA_OECMAKE = "-DCMAKE_BUILD_WITH_INSTALL_RPATH=1 -DCMAKE_INSTALL_RPATH=${libdir}/piglit/lib"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 piglit-*.py ${D}${bindir}
+
+	install -d ${D}${libdir}/piglit/
+
+	install -d ${D}${libdir}/piglit/bin
+	install -m 755 ${S}/bin/* ${D}${libdir}/piglit/bin
+
+	cp -a lib/ ${D}${libdir}/piglit/
+	cp -a framework/ ${D}${libdir}/piglit/
+	cp -a generated_tests/ ${D}${libdir}/piglit/
+	cp -a tests/ ${D}${libdir}/piglit/
+	cp -a templates/ ${D}${libdir}/piglit/
+
+	sed -i -e 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|' ${D}${bindir}/piglit-*.py
+	sed -i -e 's|^templatedir = .*$|templatedir = "${libdir}/piglit/templates"|' ${D}${bindir}/piglit-summary-html.py
+}
+
+FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
+
+RDEPENDS_${PN} = "python waffle python-json python-subprocess python-multiprocessing python-textutils python-netserver python-shell mesa-demos"
-- 
1.7.10.4


