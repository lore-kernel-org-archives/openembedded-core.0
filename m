Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E13536093C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 23:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYaEL000371; Wed, 8 Feb 2017 23:34:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WsUi_5U9yDWN; Wed,  8 Feb 2017 23:34:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYYXu000344
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Feb 2017 23:34:35 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cbbkw-0006QV-G9; Wed, 08 Feb 2017 23:34:34 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 23:34:27 +0000
Message-Id: <1486596869-24628-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/7] openssl/fontconfig/bzip2: Use relative symlinks instead of absolute ones (using a new class)
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
X-List-Received-Date: Wed, 08 Feb 2017 23:34:38 -0000

Absolute path symlinks are a bit of a pain for sstate and the native versions
of these recipes currently contain broken symlinks as a result. There are
only a small number of problematic recipes, at least in OE-Core, namely the
three here.

Rather than trying to make sstate handle this magically, which turns out to
be a harder problem than you'd first realise, simply make the symlinks relative
early in the process and avoid all the problems.

The alternative is adding new complexity to sstate which we could really
do without as without the complexity, you can't always tell where the
absolute symlink is relative to (due to prefixes used for native sstate).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/relative_symlinks.bbclass                | 5 +++++
 meta/recipes-connectivity/openssl/openssl.inc         | 2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb            | 2 +-
 meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb | 2 +-
 4 files changed, 8 insertions(+), 3 deletions(-)
 create mode 100644 meta/classes/relative_symlinks.bbclass

diff --git a/meta/classes/relative_symlinks.bbclass b/meta/classes/relative_symlinks.bbclass
new file mode 100644
index 0000000..3157737
--- /dev/null
+++ b/meta/classes/relative_symlinks.bbclass
@@ -0,0 +1,5 @@
+do_install[postfuncs] += "install_relative_symlinks"
+
+python install_relative_symlinks () {
+    oe.path.replace_absolute_symlinks(d.getVar('D'), d)
+}
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 5cca019..fc55925 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -30,7 +30,7 @@ export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-inherit pkgconfig siteinfo multilib_header ptest
+inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
 FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index ef7bc89..0512a75 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -25,7 +25,7 @@ PACKAGES =+ "libbz2"
 
 CFLAGS_append = " -fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OFFSET_BITS=64"
 
-inherit autotools update-alternatives ptest
+inherit autotools update-alternatives ptest relative_symlinks
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "bunzip2 bzcat"
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
index 8616154..95b066c 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
@@ -37,7 +37,7 @@ RREPLACES_fontconfig-utils = "libfontconfig-utils"
 RCONFLICTS_fontconfig-utils = "libfontconfig-utils"
 DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig relative_symlinks
 
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 
-- 
2.7.4


