Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D09C06A651
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:04:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4TF43ti016045
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:04:03 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 08:04:02 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 10:10:03 -0500
Message-ID: <1369840203-21898-22-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 21/21] libarchive: Fix build dependencies
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
X-List-Received-Date: Wed, 29 May 2013 15:04:02 -0000
Content-Type: text/plain

Move to using the PACKAGECONFIG mechanism to select configure options and
dependencies.  Without this the system will attempt to discover various
dependencies, and usually does so incorrectly.

We also ensure that the nativesdk version does not inherit any of the
DISTRO_FEATURES.  We shouldn't need acl or xattr support for nativesdk.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/libarchive/libarchive_2.8.5.bb | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
index 5cf13e6..06989d3 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
@@ -5,7 +5,25 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4255e2e6f0349a4ac8fbd68459296e46"
 PR = "r0"
 
-DEPENDS = "libxml2"
+PACKAGECONFIG ?= "libxml2 zlib bz2"
+
+PACKAGECONFIG_class-target += "\
+	${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+	${@base_contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)} \
+	${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
+"
+
+PACKAGECONFIG_class-nativesdk += "largefile"
+
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
+PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
+PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib,"
+PACKAGECONFIG[bz2] = "--with-bz2lib,--without-bz2lib,bzip2,"
+PACKAGECONFIG[xz] = "--with-lzmadec --with-lzma,--without-lzmadec --without-lzma,xz,"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
+PACKAGECONFIG[libxml2] = "--with-xml2,--without-xml2,libxml2,"
+PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat,"
 
 SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
            file://0001-Patch-from-upstream-revision-1990.patch \
-- 
1.8.1.2.545.g2f19ada


