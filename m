Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E602279605
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7OF0Kwh003248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:00:20 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:00:19 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 10:59:58 -0400
Message-ID: <9daf06e81db12ca11e47116caa05aeb51eeeaa6a.1535118570.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/12] libc-headers: update to 4.18
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
X-List-Received-Date: Fri, 24 Aug 2018 15:00:20 -0000
Content-Type: text/plain

Updating to the 4.18 headers to match the newest kernel that will
be part of the release.

4.18 brings a requirement on bison-native to the libc-headers, since
it is required as part of the configuration steps.

We also tweak the license md5sum, since the kernel now includes SPDX
headers in the license file and that changes our sum.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                          | 2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc        | 4 ++--
 .../{linux-libc-headers_4.15.7.bb => linux-libc-headers_4.18.bb}     | 5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.15.7.bb => linux-libc-headers_4.18.bb} (75%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1c9226cb0603..37dc5e9e0e0e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.31%"
 GDBVERSION ?= "8.1%"
 GLIBCVERSION ?= "2.28%"
-LINUXLIBCVERSION ?= "4.15%"
+LINUXLIBCVERSION ?= "4.18%"
 QEMUVERSION ?= "3.0%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index b5cf96dd49e4..05c82558e653 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -30,7 +30,7 @@ LICENSE = "GPLv2"
 #
 # -- RP
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 python __anonymous () {
     major = d.getVar("PV").split('.')[0]
@@ -92,4 +92,4 @@ RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS += "unifdef-native"
+DEPENDS += "unifdef-native bison-native"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.7.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
similarity index 75%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.7.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
index a7db4c9c015a..e38872bb919a 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.7.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
@@ -8,6 +8,5 @@ SRC_URI_append_libc-musl = "\
     file://0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch \
    "
 
-
-SRC_URI[md5sum] = "8186ce63c489199b58b6a58ad2a24a94"
-SRC_URI[sha256sum] = "cd44df4b23a3e0edc14be63df95d768b9600b31c35be05fb89f93226907fc8c6"
+SRC_URI[md5sum] = "bee5fe53ee1c3142b8f0c12c0d3348f9"
+SRC_URI[sha256sum] = "19d8bcf49ef530cd4e364a45b4a22fa70714b70349c8100e7308488e26f1eaf1"
-- 
2.5.0


