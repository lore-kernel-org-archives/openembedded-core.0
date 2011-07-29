Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QmhOQ-0002qm-TR
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 09:21:58 +0200
Received: by fxg11 with SMTP id 11so2254491fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 00:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=nU7bBaFpCaysEA8kPGFr9mI6RG0LLJ/Xj93c6q52FLU=;
	b=hZWLGJ4T+/L6TRztnNwQ8rjhC8zymUDdrT1y3PMrXjvCqSGwb6SBpzTidXJ0+1muig
	TKVxW9oVmdUdRViUcAGwXMN6G2GpjxjBcwMzq+8LNqG8Dn/5g5d6ntkC1iR25LxLanaL
	uHvg/Dp4TO5YT67fKKbTPbNCYbAazLiQT3rWE=
Received: by 10.223.70.197 with SMTP id e5mr635460faj.94.1311923862634;
	Fri, 29 Jul 2011 00:17:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm919387fam.0.2011.07.29.00.17.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 00:17:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2011 09:17:31 +0200
Message-Id: <1311923851-6341-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH] eglibc: unify eglibc-utils/${PN}-utils and remove PACKAGES from eglibc.inc
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
X-List-Received-Date: Fri, 29 Jul 2011 07:21:59 -0000

* PACKAGES were defined in eglibc.inc as well as eglibc-package.inc, definition
  from eglibc.inc was overriden from recipes including eglibc.inc only
* 37ff0fea8f7180b1a9d91d24dfe1735730427497 changed RPROVIDES_eglibc-utils,
  but ie FILES_ were still using eglibc-utils instead of ${PN}-utils, unify
  all eglibc-utils

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    8 ++++----
 meta/recipes-core/eglibc/eglibc.inc         |    2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 7646ea4..4de882e 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -65,11 +65,11 @@ FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
 FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
 	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
-FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
+FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
 FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
 RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
-RDEPENDS_eglibc-utils += "bash"
+RDEPENDS_${PN}-utils += "bash"
 FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
 RPROVIDES_eglibc-dev += "libc-dev"
@@ -82,8 +82,8 @@ SUMMARY_eglibc-extra-nss = "hesiod, NIS and NIS+ nss libraries"
 DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services."
 SUMMARY_ldd = "print shared library dependencies"
 DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
-SUMMARY_eglibc-utils = "Miscellaneous utilities provided by eglibc"
-DESCRIPTION_eglibc-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
+SUMMARY_${PN}-utils = "Miscellaneous utilities provided by eglibc"
+DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
 DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
 
 inherit libc-common multilib_header
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 1b2e630..0f97f82 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -41,8 +41,6 @@ EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
 EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
 PARALLEL_MAKE = ""
 
-PACKAGES = "glibc catchsegv sln nscd ldd glibc-utils glibc-dev glibc-doc libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
-
 OE_FEATURES = "${@features_to_eglibc_settings(d)}"
 do_configure_prepend() {
 	sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
-- 
1.7.6



