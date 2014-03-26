Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67FD36FA4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:15:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2QAG06q022437
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 03:16:00 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 26 Mar 2014 03:16:00 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 18:15:59 +0800
Message-ID: <5b7a9db543d66fb092fd43307fa3dcb75f068d55.1395825881.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395825881.git.kai.kang@windriver.com>
References: <cover.1395825881.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 3/3] ocf-linux: remove recipe
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
X-List-Received-Date: Wed, 26 Mar 2014 10:15:59 -0000
Content-Type: text/plain

ocf-linux only provides header file and no kernel module is built. We
can't use ocf-linux without its implementation. And linux-yocto uses an
alternative project cryptodev-linux, so we remove ocf-linux and use
cryptodev-linux instead.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/openssl/ocf-linux.inc    | 24 ----------------------
 .../openssl/ocf-linux_20120127.bb                  |  6 ------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/ocf-linux.inc
 delete mode 100644 meta/recipes-connectivity/openssl/ocf-linux_20120127.bb

diff --git a/meta/recipes-connectivity/openssl/ocf-linux.inc b/meta/recipes-connectivity/openssl/ocf-linux.inc
deleted file mode 100644
index d6cde9a..0000000
--- a/meta/recipes-connectivity/openssl/ocf-linux.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Installs required headers for OCF-Linux crypto acceleration support"
-LICENSE = "BSD"
-
-LIC_FILES_CHKSUM = "file://README;md5=493ffe65655667614cf24567adf22f11"
- 
-INC_PR = "r3"
-
-SRC_URI = "http://sourceforge.net/projects/ocf-linux/files/ocf-linux/${PV}/ocf-linux-${PV}.tar.gz"
-
-S = "${WORKDIR}/ocf-linux-${PV}"
-
-# Need to unpack the the ocf-linux.tar.gz file contained inside the
-# downloaded tarball
-# Install the OCF Linux headers so that other packages such as openssl
-# can find them.  The headers must be in a crypto directory according to
-# the README file.
-do_install() {
-    cd ${S}
-    install -d ${D}${includedir}/crypto
-    install -m 0644 ${S}/ocf/*.h ${D}${includedir}/crypto/
-}
-
-ALLOW_EMPTY_${PN} = "1"
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-connectivity/openssl/ocf-linux_20120127.bb b/meta/recipes-connectivity/openssl/ocf-linux_20120127.bb
deleted file mode 100644
index 7f4d5b3..0000000
--- a/meta/recipes-connectivity/openssl/ocf-linux_20120127.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ocf-linux.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "3e68afaf6a76dfdab79540fbd6b0cbb3"
-SRC_URI[sha256sum] = "5113609d2c2c43fde962bec1238fe5a81211a751ebb0337b54a9804d40cfef53"
-- 
1.8.1.2


