Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEC37C8E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 06:57:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1J6vYu2021890
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Feb 2019 22:57:35 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Mon, 18 Feb 2019 22:57:34 -0800
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 19 Feb 2019 01:57:25 -0500
Message-ID: <20190219065725.171013-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <4367f854b1ff23bc2972294715d3837725ee7c43.1550195817.git.kai.kang@windriver.com>
References: <4367f854b1ff23bc2972294715d3837725ee7c43.1550195817.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] libidn2: fix buildpaths qa issue in .pc file
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
X-List-Received-Date: Tue, 19 Feb 2019 06:57:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When enable buildpaths qa check, it show warning of libidn2:

| WARNING: libidn2-2.0.5-r0 do_package_qa: QA Issue: File
/work/armv5e-poky-linux-gnueabi/libidn2/2.0.5-r0/packages-split/libidn2-dev/usr/lib/pkgconfig/libidn2.pc
in package contained reference to tmpdir [buildpaths]

Fix the issue by substituting @LTLIBUNISTRING@ in the .pc file.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../fix-host-contamination-in-pc-file.patch   | 22 +++++++++++++++++++
 meta/recipes-extended/libidn/libidn2_2.0.5.bb |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libidn/libidn2/fix-host-contamination-in-pc-file.patch

diff --git a/meta/recipes-extended/libidn/libidn2/fix-host-contamination-in-pc-file.patch b/meta/recipes-extended/libidn/libidn2/fix-host-contamination-in-pc-file.patch
new file mode 100644
index 0000000000..026312ab0a
--- /dev/null
+++ b/meta/recipes-extended/libidn/libidn2/fix-host-contamination-in-pc-file.patch
@@ -0,0 +1,22 @@
+Configure option --with-libunistring-prefix is set to fix compile-host-path qa
+issue. It causes @LTLIBUNISTRING@ in line 'Libs.private' of libidn2.pc replaced
+with ${STAGING_EXECPREFIXDIR} which causes buildpaths qa issue.
+
+libunistring is a dependency of libidn2 and installs libraries to standard
+library path, so just substitute @LTLIBUNISTRING@ with standard library path
+and -lunistring in libidn2.pc.in.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/libidn2.pc.in b/libidn2.pc.in
+index 0dade23..24cc29d 100644
+--- a/libidn2.pc.in
++++ b/libidn2.pc.in
+@@ -8,4 +8,4 @@ Description: Library implementing IDNA2008 and TR46
+ Version: @PACKAGE_VERSION@
+ Cflags: -I${includedir}
+ Libs: -L${libdir} -lidn2
+-Libs.private: @LTLIBICONV@ @LTLIBUNISTRING@
++Libs.private: @LTLIBICONV@ -L${libdir} -lunistring
diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
index 0daf7a6877..a243a9181e 100644
--- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ab90e75ef97cc6318ce4f2fbda62fe4d \
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://Unset-need_charset_alias-when-building-for-musl.patch \
-          "
+           file://fix-host-contamination-in-pc-file.patch \
+           "
 SRC_URI[md5sum] = "eaf9a5b9d03b0cce3760f34b3124eb36"
 SRC_URI[sha256sum] = "53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8"
 
-- 
2.20.0


