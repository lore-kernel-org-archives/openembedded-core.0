Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlpHA-0007HF-Vv
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:34:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QLUcCb028046
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:30:38 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 26 Jul 2011 14:30:38 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2011 16:31:04 -0500
Message-ID: <16aed39c6ed0f3b5c0d9032f8523a125fb0dbfa1.1311715727.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311715727.git.mark.hatle@windriver.com>
References: <cover.1311715727.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [v3 PATCH 3/8] apr: Fix multilib header conflict - apr.h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 21:34:53 -0000
Content-Type: text/plain

apr.h conflicts between 32-bit and 64-bit versions

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-support/apr/apr_1.4.2.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/apr/apr_1.4.2.bb b/meta/recipes-support/apr/apr_1.4.2.bb
index 89bdadf..b37001d 100644
--- a/meta/recipes-support/apr/apr_1.4.2.bb
+++ b/meta/recipes-support/apr/apr_1.4.2.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
                     file://include/apr_lib.h;endline=17;md5=ee42fa7575dc40580a9e01c1b75fae96"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
            file://configure_fixes.patch;patch=1 \
@@ -17,7 +17,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
 SRC_URI[md5sum] = "4b00e8f70c067893d075577962656b35"
 SRC_URI[sha256sum] = "2017ca700694d09d2b0b21dd7c4d195e43a48735aac88526160c6195ee8f5391"
 
-inherit autotools lib_package binconfig
+inherit autotools lib_package binconfig multilib_header
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
@@ -34,6 +34,10 @@ do_configure_append() {
 	sed -i -e 's/LIBTOOL=\(.*\)top_build/LIBTOOL=\1apr_build/' build/apr_rules.mk
 }
 
+do_install_append() {
+	oe_multilib_header apr.h
+}
+
 SYSROOT_PREPROCESS_FUNCS += "apr_sysroot_preprocess"
 
 apr_sysroot_preprocess () {
-- 
1.7.3.4



