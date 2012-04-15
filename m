Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJNN1-0000Tt-Qf for openembedded-core@lists.openembedded.org;
	Sun, 15 Apr 2012 13:11:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3FB2SYK020624
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 12:02:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17299-09 for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 12:02:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3FB2G1x020618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 12:02:18 +0100
Message-ID: <1334487738.15570.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Apr 2012 12:02:18 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] guile: Fix binary relocation issue for precompiled guile objects
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
X-List-Received-Date: Sun, 15 Apr 2012 11:11:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When guile-native was relocated, there were messages like:

;;; note: source file /srv/home/pokybuild/yocto-autobuilder/yocto-slave/emenlow/build/build/tmp/sysroots/x86_64-linux/usr/share/guile/2.0/ice-9/eval.scm
;;;       newer than compiled /srv/home/pokybuild/yocto-autobuilder/yocto-slave/fri2/build/build/tmp/sysroots/x86_64-linux/usr/lib/guile/2.0/ccache/ice-9/eval.go

and this confuses things like the autogen-native "guile --version"
check. This patch ensures the wrapper script sets the necessary
variables correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/guile/guile_2.0.3.bb b/meta/recipes-devtools/guile/guile_2.0.3.bb
index b638a18..164ab8c 100644
--- a/meta/recipes-devtools/guile/guile_2.0.3.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.3.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
 SRC_URI[md5sum] = "3b8b4e1083037f29d2c4704a6d55f2a8"
 SRC_URI[sha256sum] = "a53b21159befe3e89bbaca71e9e62cf00af0f49fcca297c407944b988d59eb08"
 
-PR = "r4"
+PR = "r5"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
@@ -58,9 +58,11 @@ do_install_append_virtclass-native() {
 	install -m 0755  ${D}${bindir}/guile ${D}${bindir}/${HOST_SYS}-guile
 
 	create_wrapper ${D}/${bindir}/guile \
-		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0
+		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
+		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
 	create_wrapper ${D}${bindir}/${HOST_SYS}-guile
-		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0
+		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
+		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
 }
 
 SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"




