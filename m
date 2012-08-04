Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SxWcv-000664-S4
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 07:10:14 +0200
Received: by pbbrq2 with SMTP id rq2so2129512pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3N4wr+Nc8ZTGS6uDh5E8fRyyD5zhzjw6A2kz3WDLJr4=;
	b=uPuFjm7h/qU7HfST8XhyyNLX30hHlX5NKoaSNPjcJgh4xuHcrH/VqGpX/YGz5KdQC5
	eLpgXeC+6PwcRuHNaV8R8p9r1S+tJoklIR0s5xWB+Ct06dObPzLnUZyvaLhASI9IFLrW
	mALn1yeffZkqglEb6twVP3OYR6dPxKfrpCACu8md0mWNGAXWxUmhTZw9j4531v4xb99z
	G3a45a/UDO2XPmWuOmasCgL72wTDjVOD2Fyxkbjx6P1oyatua8qQJLvDRqMjqzwQNxPY
	WcLSo/6KKdZbBUvOsuj+mhuN0IA/DR2adhPtenYGDYmRd1fbUec2A9svkmK+xBTEgDoj
	kPwg==
Received: by 10.68.216.136 with SMTP id oq8mr427717pbc.68.1344056311199;
	Fri, 03 Aug 2012 21:58:31 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id qa5sm4286005pbb.19.2012.08.03.21.58.28
	(version=SSLv3 cipher=OTHER); Fri, 03 Aug 2012 21:58:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2012 21:58:20 -0700
Message-Id: <1344056301-3710-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] glib-2.0-nativesdk: Add dependency on glib-2.0-native
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
X-List-Received-Date: Sat, 04 Aug 2012 05:10:14 -0000

when we build for nativesdk it needs tools from installed
glib-2.0-dev package. We zeroes out compile_resourses but
then genmarshal came up so instead of going about disabling
them one by one lets depend on glib-2.0-native since
thats the right thing to do.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 932c946..8f7cd69 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -1,11 +1,11 @@
 require glib.inc
 
-PR = "r3"
+PR = "r4"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
 DEPENDS_virtclass-native += "libffi-native python-argparse-native"
-DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nativesdk"
+DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nativesdk ${BPN}-native"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
@@ -22,7 +22,6 @@ SRC_URI[sha256sum] = "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709bda4d11b1
 SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
 
-CACHED_CONFIGUREVARS_virtclass-nativesdk = "ac_cv_path_GLIB_COMPILE_RESOURCES=/bin/true"
 do_configure_prepend() {
 	sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-- 
1.7.5.4



