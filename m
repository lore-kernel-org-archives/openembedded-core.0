Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 17AE97FC8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 09:35:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBA9Zm7F018073
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 01:35:48 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 10 Dec 2019 01:35:47 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Dec 2019 17:35:35 +0800
Message-ID: <20191210093535.26762-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210093535.26762-1-kai.kang@windriver.com>
References: <20191210093535.26762-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] glew/curl: specify exclusive package configs
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
X-List-Received-Date: Tue, 10 Dec 2019 09:35:48 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Specify exclusive package configs for glew and curl to make sure that
conflict package configs will NOT set at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/glew/glew_2.1.0.bb | 4 ++--
 meta/recipes-support/curl/curl_7.67.0.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/glew/glew_2.1.0.bb b/meta/recipes-graphics/glew/glew_2.1.0.bb
index f6f43406f8..edcbdc0a7a 100644
--- a/meta/recipes-graphics/glew/glew_2.1.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.1.0.bb
@@ -22,8 +22,8 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', 'egl-gles2', d)}"
 
 # The opengl and egl-XXX options are exclusive, enable only one.
-PACKAGECONFIG[opengl] = "SYSTEM='linux',,virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
-PACKAGECONFIG[egl-gles2] = "SYSTEM='linux-egl' GLEW_NO_GLU='-DGLEW_NO_GLU' LDFLAGS.GL='-lEGL -lGLESv2',,virtual/egl virtual/libgles2"
+PACKAGECONFIG[opengl] = "SYSTEM='linux',,virtual/libx11 virtual/libgl libglu libxext libxi libxmu,,,egl-gles2"
+PACKAGECONFIG[egl-gles2] = "SYSTEM='linux-egl' GLEW_NO_GLU='-DGLEW_NO_GLU' LDFLAGS.GL='-lEGL -lGLESv2',,virtual/egl virtual/libgles2,,,opengl"
 
 CFLAGS += "-D_GNU_SOURCE"
 # Override SYSTEM (via PACKAGECONFIG_CONFARGS) to avoid calling config.guess,
diff --git a/meta/recipes-support/curl/curl_7.67.0.bb b/meta/recipes-support/curl/curl_7.67.0.bb
index e08e08ed4a..e42bd5835e 100644
--- a/meta/recipes-support/curl/curl_7.67.0.bb
+++ b/meta/recipes-support/curl/curl_7.67.0.bb
@@ -20,7 +20,7 @@ PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
 PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose zlib"
 
 # 'ares' and 'threaded-resolver' are mutually exclusive
-PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares"
+PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
 PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
 PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
 PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
@@ -45,7 +45,7 @@ PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openss
 PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
 PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
-PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver"
+PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
 PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 
-- 
2.17.1


