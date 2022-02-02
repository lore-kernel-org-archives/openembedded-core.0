Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464CBC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:10 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.2244.1643826489652828620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZleAceal;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id s5so283495ejx.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IIdEHKTwGIQs0mEaQFCWVV06oEbZexqELwano7oFARs=;
        b=ZleAcealiTiqM+YVMRz/Kk8sZeQ0X5ssc5BmXQRXNaVreLcnHxsH2+KEf1Ww98LWGP
         kH0znXXxGSSSL8tprMPaVw1myLL1q2ggAahSDi6LOk/Cpocfyu2zfEBdlYhqgJaX/BTu
         O+kbl6VfKjUPHV1a+DKryNXBLWzTf1Dp5BA/InPAtGHMefgVm7u6cSae6m4lsdJz7axG
         4drijwFLX/Ur4NSQhVjKxvYWcjVLc/qkOMRVJ6jHomBjiYSTq7WajSQl7F8URCbkZFgb
         GonXWLpbzJVM6j1T800ocxkDRUNwOkfS0u23Chw6In0aAUFNYRQNSegtm0sLxcQ3+BCN
         vDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IIdEHKTwGIQs0mEaQFCWVV06oEbZexqELwano7oFARs=;
        b=D62L/qG8GX1g7C3O/O4zFuVAS3bojjWWFLt5lg/6UhDhRIbOcveL5ELn+T2bFTnR73
         XJNFOfr2kYgULUJQN++7Gox4upA8pRUXVFC958D/W3jhikffoAlUV1LU8Mlwrja0yobP
         n7e3WcbZGfvOuQ37vhNXeRq+A193iHlXE9YI30sa4J0oBv1V2BXzYExNyVVZIbLLL+Zr
         1xtjWnkv+q0IQt5rlJ3IyytoQdw/JHBLp8NDkDVSGcbQauhz0UNmNN1KmMKsyeYhvuB0
         yG5hIsOMhMBldTDW1HuzYw3Aegr9OMNRKYtUA1Xk4ZUpmCKCNca3gFQwVCj5OkRLUo+W
         dHvQ==
X-Gm-Message-State: AOAM5329H7jfvOl2u/dTRZIiHuey1BLHWDjEVWHYr1hl7BAzmUjTwsNf
	pBOb7+AvAK02yOLkYea+5mBBYweE35k=
X-Google-Smtp-Source: 
 ABdhPJwT7y95RHMG8abaqnnpYb6GvoszeWN35EUn6q309ljAvPQMVFv66uB6iXCqsN/cGDx6JnWGMw==
X-Received: by 2002:a17:907:d1c:: with SMTP id
 gn28mr26764624ejc.59.1643826488189;
        Wed, 02 Feb 2022 10:28:08 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/33] git: merge .inc into .bb
Date: Wed,  2 Feb 2022 19:27:32 +0100
Message-Id: <20220202182758.919991-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161232

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/git/git.inc       | 141 -----------------------
 meta/recipes-devtools/git/git_2.34.1.bb | 142 +++++++++++++++++++++++-
 2 files changed, 141 insertions(+), 142 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git.inc

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
deleted file mode 100644
index 1d74270fdd..0000000000
--- a/meta/recipes-devtools/git/git.inc
+++ /dev/null
@@ -1,141 +0,0 @@
-SUMMARY = "Distributed version control system"
-HOMEPAGE = "http://git-scm.com"
-DESCRIPTION = "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-DEPENDS = "openssl curl zlib expat"
-
-PROVIDES:append:class-native = " git-replacement-native"
-
-SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
-           file://fixsort.patch \
-"
-
-S = "${WORKDIR}/git-${PV}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
-
-CVE_PRODUCT = "git-scm:git"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[cvsserver] = ""
-PACKAGECONFIG[svn] = ""
-
-EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
-		--without-tcltk \
-		--without-iconv \
-"
-EXTRA_OECONF:append:class-nativesdk = " --with-gitconfig=/etc/gitconfig "
-
-# Needs brokensep as this doesn't use automake
-inherit autotools-brokensep perlnative bash-completion
-
-EXTRA_OEMAKE = "NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
-EXTRA_OEMAKE += "'PERL_PATH=/usr/bin/env perl'"
-EXTRA_OEMAKE += "COMPUTE_HEADER_DEPENDENCIES=no"
-EXTRA_OEMAKE:append:class-native = " NO_CROSS_DIRECTORY_HARDLINKS=1"
-
-do_compile:prepend () {
-	# Remove perl/perl.mak to fix the out-of-date perl.mak error
-	# during rebuild
-	rm -f perl/perl.mak
-}
-
-do_install () {
-	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
-		template_dir=${datadir}/git-core/templates
-
-	for section in man1 man5 man7; do
-		install -d ${D}/${mandir}/$section
-		install -t ${D}/${mandir}/$section ${WORKDIR}/$section/*
-	done
-
-	install -d ${D}/${datadir}/bash-completion/completions/
-	install -m 644 ${S}/contrib/completion/git-completion.bash ${D}/${datadir}/bash-completion/completions/git
-}
-
-perl_native_fixup () {
-	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
-	       -e 's#${libdir}/perl-native/#${libdir}/#' \
-	    ${@d.getVar("PERLTOOLS").replace(' /',d.getVar('D') + '/')}
-
-	if [ ! "${@bb.utils.filter('PACKAGECONFIG', 'cvsserver', d)}" ]; then
-		# Only install the git cvsserver command if explicitly requested
-		# as it requires the DBI Perl module, which does not exist in
-		# OE-Core.
-		rm ${D}${libexecdir}/git-core/git-cvsserver \
-		   ${D}${bindir}/git-cvsserver
-	fi
-
-	if [ ! "${@bb.utils.filter('PACKAGECONFIG', 'svn', d)}" ]; then
-		# Only install the git svn command and all Git::SVN Perl modules
-		# if explicitly requested as they require the SVN::Core Perl
-		# module, which does not exist in OE-Core.
-		rm -r ${D}${libexecdir}/git-core/git-svn \
-		      ${D}${datadir}/perl5/Git/SVN*
-	fi
-}
-
-REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
-REL_GIT_TEMPLATE_DIR = "${@os.path.relpath(datadir, bindir)}/git-core/templates"
-
-do_install:append:class-target () {
-	perl_native_fixup
-}
-
-do_install:append:class-native() {
-	create_wrapper ${D}${bindir}/git \
-		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
-		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
-}
-
-do_install:append:class-nativesdk() {
-	create_wrapper ${D}${bindir}/git \
-		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
-		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
-	perl_native_fixup
-}
-
-FILES:${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
-
-PERLTOOLS = " \
-    ${bindir}/git-cvsserver \
-    ${libexecdir}/git-core/git-add--interactive \
-    ${libexecdir}/git-core/git-archimport \
-    ${libexecdir}/git-core/git-cvsexportcommit \
-    ${libexecdir}/git-core/git-cvsimport \
-    ${libexecdir}/git-core/git-cvsserver \
-    ${libexecdir}/git-core/git-send-email \
-    ${libexecdir}/git-core/git-svn \
-    ${libexecdir}/git-core/git-instaweb \
-    ${datadir}/gitweb/gitweb.cgi \
-    ${datadir}/git-core/templates/hooks/prepare-commit-msg.sample \
-    ${datadir}/git-core/templates/hooks/pre-rebase.sample \
-    ${datadir}/git-core/templates/hooks/fsmonitor-watchman.sample \
-"
-
-# Git tools requiring perl
-PACKAGES =+ "${PN}-perltools"
-FILES:${PN}-perltools += " \
-    ${PERLTOOLS} \
-    ${libdir}/perl \
-    ${datadir}/perl5 \
-"
-
-RDEPENDS:${PN}-perltools = "${PN} perl perl-module-file-path findutils"
-
-# git-tk package with gitk and git-gui
-PACKAGES =+ "${PN}-tk"
-#RDEPENDS_${PN}-tk = "${PN} tk tcl"
-#EXTRA_OEMAKE = "TCL_PATH=${STAGING_BINDIR_CROSS}/tclsh"
-FILES:${PN}-tk = " \
-    ${bindir}/gitk \
-    ${datadir}/gitk \
-"
-
-PACKAGES =+ "gitweb"
-FILES:gitweb = "${datadir}/gitweb/"
-RDEPENDS:gitweb = "perl"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/git/git_2.34.1.bb b/meta/recipes-devtools/git/git_2.34.1.bb
index 24081764a2..a762ebac99 100644
--- a/meta/recipes-devtools/git/git_2.34.1.bb
+++ b/meta/recipes-devtools/git/git_2.34.1.bb
@@ -1,4 +1,144 @@
-require git.inc
+SUMMARY = "Distributed version control system"
+HOMEPAGE = "http://git-scm.com"
+DESCRIPTION = "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+DEPENDS = "openssl curl zlib expat"
+
+PROVIDES:append:class-native = " git-replacement-native"
+
+SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
+           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
+           file://fixsort.patch \
+"
+
+S = "${WORKDIR}/git-${PV}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
+
+CVE_PRODUCT = "git-scm:git"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cvsserver] = ""
+PACKAGECONFIG[svn] = ""
+
+EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
+		--without-tcltk \
+		--without-iconv \
+"
+EXTRA_OECONF:append:class-nativesdk = " --with-gitconfig=/etc/gitconfig "
+
+# Needs brokensep as this doesn't use automake
+inherit autotools-brokensep perlnative bash-completion
+
+EXTRA_OEMAKE = "NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE += "'PERL_PATH=/usr/bin/env perl'"
+EXTRA_OEMAKE += "COMPUTE_HEADER_DEPENDENCIES=no"
+EXTRA_OEMAKE:append:class-native = " NO_CROSS_DIRECTORY_HARDLINKS=1"
+
+do_compile:prepend () {
+	# Remove perl/perl.mak to fix the out-of-date perl.mak error
+	# during rebuild
+	rm -f perl/perl.mak
+}
+
+do_install () {
+	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
+		template_dir=${datadir}/git-core/templates
+
+	for section in man1 man5 man7; do
+		install -d ${D}/${mandir}/$section
+		install -t ${D}/${mandir}/$section ${WORKDIR}/$section/*
+	done
+
+	install -d ${D}/${datadir}/bash-completion/completions/
+	install -m 644 ${S}/contrib/completion/git-completion.bash ${D}/${datadir}/bash-completion/completions/git
+}
+
+perl_native_fixup () {
+	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
+	       -e 's#${libdir}/perl-native/#${libdir}/#' \
+	    ${@d.getVar("PERLTOOLS").replace(' /',d.getVar('D') + '/')}
+
+	if [ ! "${@bb.utils.filter('PACKAGECONFIG', 'cvsserver', d)}" ]; then
+		# Only install the git cvsserver command if explicitly requested
+		# as it requires the DBI Perl module, which does not exist in
+		# OE-Core.
+		rm ${D}${libexecdir}/git-core/git-cvsserver \
+		   ${D}${bindir}/git-cvsserver
+	fi
+
+	if [ ! "${@bb.utils.filter('PACKAGECONFIG', 'svn', d)}" ]; then
+		# Only install the git svn command and all Git::SVN Perl modules
+		# if explicitly requested as they require the SVN::Core Perl
+		# module, which does not exist in OE-Core.
+		rm -r ${D}${libexecdir}/git-core/git-svn \
+		      ${D}${datadir}/perl5/Git/SVN*
+	fi
+}
+
+REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
+REL_GIT_TEMPLATE_DIR = "${@os.path.relpath(datadir, bindir)}/git-core/templates"
+
+do_install:append:class-target () {
+	perl_native_fixup
+}
+
+do_install:append:class-native() {
+	create_wrapper ${D}${bindir}/git \
+		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
+		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
+}
+
+do_install:append:class-nativesdk() {
+	create_wrapper ${D}${bindir}/git \
+		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
+		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
+	perl_native_fixup
+}
+
+FILES:${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
+
+PERLTOOLS = " \
+    ${bindir}/git-cvsserver \
+    ${libexecdir}/git-core/git-add--interactive \
+    ${libexecdir}/git-core/git-archimport \
+    ${libexecdir}/git-core/git-cvsexportcommit \
+    ${libexecdir}/git-core/git-cvsimport \
+    ${libexecdir}/git-core/git-cvsserver \
+    ${libexecdir}/git-core/git-send-email \
+    ${libexecdir}/git-core/git-svn \
+    ${libexecdir}/git-core/git-instaweb \
+    ${datadir}/gitweb/gitweb.cgi \
+    ${datadir}/git-core/templates/hooks/prepare-commit-msg.sample \
+    ${datadir}/git-core/templates/hooks/pre-rebase.sample \
+    ${datadir}/git-core/templates/hooks/fsmonitor-watchman.sample \
+"
+
+# Git tools requiring perl
+PACKAGES =+ "${PN}-perltools"
+FILES:${PN}-perltools += " \
+    ${PERLTOOLS} \
+    ${libdir}/perl \
+    ${datadir}/perl5 \
+"
+
+RDEPENDS:${PN}-perltools = "${PN} perl perl-module-file-path findutils"
+
+# git-tk package with gitk and git-gui
+PACKAGES =+ "${PN}-tk"
+#RDEPENDS_${PN}-tk = "${PN} tk tcl"
+#EXTRA_OEMAKE = "TCL_PATH=${STAGING_BINDIR_CROSS}/tclsh"
+FILES:${PN}-tk = " \
+    ${bindir}/gitk \
+    ${datadir}/gitk \
+"
+
+PACKAGES =+ "gitweb"
+FILES:gitweb = "${datadir}/gitweb/"
+RDEPENDS:gitweb = "perl"
+
+BBCLASSEXTEND = "native nativesdk"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
2.20.1


