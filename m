Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5785C65EB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 16:46:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5DGko6b022554; Fri, 13 Jun 2014 17:46:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6QekWDC_8mdG; Fri, 13 Jun 2014 17:46:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5DGklVh022550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 13 Jun 2014 17:46:48 +0100
Message-ID: <1402678001.562.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jun 2014 17:46:41 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] git: revert to wrapper based relocation
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
X-List-Received-Date: Fri, 13 Jun 2014 16:47:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


From: Christopher Larson <kergoth@gmail.com>

It seems that there are multiple problems with the upstream RUNTIME_PREFIX
mechanism at this time. It doesn't canonicalize argv[0] to an absolute path,
breaking calls via the PATH, for example. In addition, it doesn't seem to
locate template_dir via the runtime prefix even when specified as relative.

Revert this for now to the previous wrapper-based mechanism, but tweaked
slightly to avoid hardcoding the sysroot path into the wrapper (based on the
bits in the rpm recipe).

[YOCTO #6211]

[Pulled from meta-mentor by RP]

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index ad0ad1b..96254f0 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -15,7 +15,7 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 
 inherit autotools-brokensep perlnative
 
-EXTRA_OEMAKE = "NO_PYTHON=1 RUNTIME_PREFIX=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE = "NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
 EXTRA_OEMAKE_append_class-native = " NO_CROSS_DIRECTORY_HARDLINKS=1"
 
 do_compile_prepend () {
@@ -41,11 +41,23 @@ PERLSEDFIXUP = " \
 	    ${@d.getVar("PERLTOOLS", True).replace(' /',d.getVar('D', True) + '/')} \
 "
 
+REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
+REL_GIT_TEMPLATE_DIR = "${@os.path.relpath(datadir, bindir)}/git-core/templates"
+
 do_install_append_class-target () {
 	${PERLSEDFIXUP}
 }
 
-do_install_append_class-nativesdk () {
+do_install_append_class-native() {
+	create_wrapper ${D}${bindir}/git \
+		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
+		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
+}
+
+do_install_append_class-nativesdk() {
+	create_wrapper ${D}${bindir}/git \
+		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
+		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
 	${PERLSEDFIXUP}
 }
 




