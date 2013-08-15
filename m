Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id BBD6A6B8D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:05 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so184271eek.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Sgo8LLsIPz4qtppMVBSexgee/D3mwiWPy7RmbbAb/UQ=;
	b=cZc5TVnfgVK9BR3df/3u5VOCulprRlmCsXSKNF+nXfbTTx5rMD+pjGECAHr4s+/ipk
	2L+Gx89ptz/nFNLMqDWAVFlv5O8CJJVTgFc+/xe7lawQxiDaIMzi+fjCiq7jhJQIwVhV
	AnXvcuCgmbuBdUrxWIYUoGIHCNzK0dV18BfiEq9QXWmektQxuApdVDHQYhqXqYYqyZF4
	eNRMHVjT/Cmh/n2MzFbBT0TPh7M0sy6b+G7VCv00iO3CLY9p3B6yYNlhtUT+c5q5WiMS
	d/hQ3dkGguVFtU7jpLlGunSDM0k1NCHgKb5kwR7IHEIuz6Dnk4b9xizgrmshRDsUfrES
	fZLg==
X-Received: by 10.15.99.133 with SMTP id bl5mr129659eeb.92.1376551386200;
	Thu, 15 Aug 2013 00:23:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm81957723eex.2.2013.08.15.00.23.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:21 +0200
Message-Id: <2a685a6b8c2d9c825d1607f87b933f944290571c.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 10/33] libarchive: Fix build dependencies
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:06 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Move to using the PACKAGECONFIG mechanism to select configure options and
dependencies.  Without this the system will attempt to discover various
dependencies, and usually does so incorrectly.

We also ensure that the nativesdk version does not inherit any of the
DISTRO_FEATURES.  We shouldn't need acl or xattr support for nativesdk.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
1.8.3.2


