Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A1F886E435
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:19:48 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id z12so514534wgg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 07:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=UnTcZn+KqVowQgk9KYV6njsqlhwT246uPwqk9hIhQMA=;
	b=nBD/cExq9DSYmcFzWkxIn3Cebu119IJ6LVd64rJqC59ru2Au2Al3TJzjjOSoXeOgFA
	ZqdtSHB8d9tCTJHvOaYOSVUFStuEsY/Ram1+aA2UDAdjYbLq3ciGCKo0oINP5FZcHwBy
	+HiHV1DvtSZid9vlq+ccnflXyBFwmhqt8cfddlL6WF543uvl87IuNffYBTk10zhSZQ7w
	9p34/VhZ5RjJpzCoqBieTDTA2Wzr1V3V3yfUSbyRGWyD48+qYQlDuS4DRDhavBKuLQTh
	ExtE4YPeRsv0MjVs4Tuh2Xf8md56ZmTkgpyLqPXcI6jm5IuS0J3+cGFaRaSud7TyrTJV
	Fzyw==
X-Gm-Message-State: ALoCoQkcBfc0X5oL1JwAVFa3xszNXgawnm1USYJd/DKRttXVZ2NB5ZD1yQy+TLNr9uqzOfM9T+tT
X-Received: by 10.180.93.196 with SMTP id cw4mr21145129wib.39.1389712788993;
	Tue, 14 Jan 2014 07:19:48 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm1923314wij.7.2014.01.14.07.19.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 07:19:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 15:19:31 +0000
Message-Id: <192ce8d5330b8067c7bb73697299c64f38a8402d.1389712683.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
Subject: [PATCH][V3 6/7] piglit: add (from meta-oe)
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
X-List-Received-Date: Tue, 14 Jan 2014 15:19:49 -0000

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


