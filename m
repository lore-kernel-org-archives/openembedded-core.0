Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T81iP-00030r-1F
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 06:23:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q824Awdj004108
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 1 Sep 2012 21:10:58 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sat, 1 Sep 2012 21:10:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 2 Sep 2012 12:15:47 +0800
Message-ID: <a9931591a663e979f0ef96317c6546bef08adb2e.1346559111.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1346559111.git.liezhi.yang@windriver.com>
References: <cover.1346559111.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] bin_package.bbclass: binary package recipe class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Sep 2012 04:23:17 -0000
Content-Type: text/plain

This is used for the binary package recipe, it's been suggested that it
would be a useful feature to be able to easily take an RPM or similar
containing a software binary from a 3rd party software vendor and
integrate it into an image created by the build system.

* Brief introduction
  - The binary pkg can be .rpm, .deb, .ipk and other formats which can
    be unpacked by bitbake fetcher.

  - Let bitbake unpack the bianry package, just like unpack the source
    package.

  - Skip the do_configure and do_compile.

  - Install the files to ${D}

  - Other steps are similar to the source package's recipe.

* Note:
  - The "subdir" parameter in the SRC_URI is useful for the binary
    package recipe, so I added an example in the comment.

  - I have sent a patch to bitbake-devel mailing list to support
    unpack the .rpm, .ipk, and .deb files.

[YOCTO #1592]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/bin_package.bbclass | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/classes/bin_package.bbclass

diff --git a/meta/classes/bin_package.bbclass b/meta/classes/bin_package.bbclass
new file mode 100644
index 0000000..a52b75b
--- /dev/null
+++ b/meta/classes/bin_package.bbclass
@@ -0,0 +1,36 @@
+#
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Common variable and task for the binary package recipe.
+# Basic principle:
+# * The files have been unpacked to ${S} by base.bbclass
+# * Skip do_configure and do_compile
+# * Use do_install to install the files to ${D}
+#
+# Note:
+# The "subdir" parameter in the SRC_URI is useful when the input package
+# is rpm, ipk, deb and so on, for example:
+#
+# SRC_URI = "http://foo.com/foo-1.0-r1.i586.rpm;subdir=foo-1.0"
+#
+# Then the files would be unpacked to ${WORKDIR}/foo-1.0, otherwise
+# they would be in ${WORKDIR}.
+#
+
+# Skip the unwanted steps
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+# Install the files to ${D}
+bin_package_do_install () {
+    # Do it carefully
+    [ -d "${S}" ] || exit 1
+    cd ${S} || exit 1
+    tar --no-same-owner --exclude='./patches' --exclude='./.pc' -cpf - . \
+        | tar --no-same-owner -xpf - -C ${D}
+}
+
+FILES_${PN} = "/"
+
+EXPORT_FUNCTIONS do_install
-- 
1.7.11.2



