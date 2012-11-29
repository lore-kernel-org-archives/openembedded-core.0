Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Tdxxo-0004vO-Jq
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 07:51:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAT6au8D010223
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 22:36:56 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 28 Nov 2012 22:36:56 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Nov 2012 14:36:56 +0800
Message-ID: <cb54673a133a17e2be78912491a696de62c6e431.1354170824.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1354170824.git.rongqing.li@windriver.com>
References: <cover.1354170824.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] apr: set flag of inheriting O_NONBLOCK as no
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
X-List-Received-Date: Thu, 29 Nov 2012 06:51:13 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The flag ac_cv_o_nonblock_inherited is always set to yes in cross compiling
environment. This flag is intended to think the socket, returned from
accept(), inherit file status flags such as O_NONBLOCK from the listening
socket, but socket never inherits file status from the listening socket on
Linux (more information to man accept).

If ac_cv_o_nonblock_inherited is set to yes on Linux, clients can not access the
same ip address(URL) with Apache web server via http(port 80) and https(port443)
without redirection

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index 896f79f..3e7b0a9 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
@@ -22,6 +22,7 @@ SRC_URI[sha256sum] = "9b635e60feb163e6fc6c375721f71f44d7e26d6b9cd52f6b86b04e65d2
 inherit autotools lib_package binconfig multilib_header
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
+EXTRA_OECONF = "ac_cv_o_nonblock_inherited=no"
 
 do_configure_prepend() {
 	cd ${S}
-- 
1.7.5.4



