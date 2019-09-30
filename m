Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 30DCA7CE5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:35 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d22so3414370pls.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=o45MwPbSqLClHfb3loQJcD6n+7OXKh2356ZX1BPurFk=;
	b=jXn5acWyYUJ+pH9bpqHs2b01GPwGmMixfXwBCGoUi51hCTIecIkiprD4k9O9NpNHTa
	mIbFEb3TyL+41QV57BMgvGuchv+dxJTtqKP1kaHDGETuN2KIfjHcOW8kCO4l/CDtkUZi
	+ZnU+/mrOi4dnQebPLEefEnWKkgUT3mtfke51aqV4HMbnngG5WCJhVYUpxpQTFs5yZnC
	K/ZKjYpxtKVgWho/EiFvrhUjF686hxsjSQGHiZMYAs8tXRSiUrB6Y7P97DAFXTnbCxrr
	ryfZ5eVzYV4WPizlJ7qrDfeQPqRrCUMXNnvcHq/Fca4wk9wMI2exwEeyPfOdBxnNDIn/
	XRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=o45MwPbSqLClHfb3loQJcD6n+7OXKh2356ZX1BPurFk=;
	b=QBGL8vRwuDc2YTg7XdGcGFro5WfftMgRUPFXj7gCy6drzTx5fHC/HOsu2R4vCM9IDi
	W6BoH+sccDK+ixyfnSMay5OFH4E1SZHQyOgKtPuj4izik+uJXJubi8IlqWRc1Wc3bEFZ
	VEQ+BFrBGzjoyqzzlvvKBzSAmK5MFs1PXBIdv/Pc+dhesUDEyrdj01HlOb47A+FT5iHl
	I/DpjsI3X14LiTlr13cc/hl3LPz1hOIT0WTW+BbxyZ8XutfDdBExesClpnJhTWtLLVvg
	/R85NKeOvA3YIxRM4LKM66ooDYU6Ga3zwXxGNcPzn/66YzAqdXh8gEZnc7cdUA68iiOl
	K8Xw==
X-Gm-Message-State: APjAAAUfm8aXHxiJt9RV9SMxduEhGkQabutZCmUw4blNQuAXGKkcov6z
	Z7cmWDHX/0l0iAXj8EFW1tJl4GhUwtc=
X-Google-Smtp-Source: APXvYqwkgVwKgLYyHncDUYOpQj/7712Cv2D3f1li5Ah85UjyGaG3VvSVPaO8iiO58FD+3k9z7vF2Tw==
X-Received: by 2002:a17:902:9a49:: with SMTP id
	x9mr4641353plv.324.1569818916242; 
	Sun, 29 Sep 2019 21:48:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:36 -0700
Message-Id: <7e62ca2a518f1fe6e2f3c7098d17ed0b73ece48c.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 41/54] glibc / glibc-locale: Fix stash_locale determinism problems
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:35 -0000

From: Jason Wessel <jason.wessel@windriver.com>

When using sstate, or performing an incremental build any change to
the do_stash_locale() will cause a build failure because
do_stash_locale() was destroying the results obtained from the
do_install() with several mv operations.  A recent change to
do_stash_locale() for a different problem illustrated a number of
build failures for users in the community.

To fix the problem, do_stash_locale() must use copy operations instead
of the mv operations.  Because this is changed to a copy, the sysroot
and package stage need to remove the files that would have been
previously removed.  The correct "fixup" code to deal with the removal
already existed in the previous do_poststash_install_cleanup().  All
that needed change was the path to where to remove the files
from the sysroot and package stages.

In order to force a re-compilation of glibc some unused white space
was removed from do_compile() for glibc.  I could not find any other
way around this and we don't want to have all the community folks to
have another iteration where they have to remove their tmp directories
or purge some portion of the sstate.  It also makes this change
bisectable. If the change to the glibc is not included, it will fail
with the following message:

=====
| DEBUG: Executing shell function do_prep_locale_tree
| tar: i18n: Cannot stat: No such file or directory
| tar: Exiting with failure status due to previous errors
| gzip: /poky/build/tmp/work/core2-64-poky-linux/glibc-locale/2.29-r0/locale-tree//usr/share/i18n/charmaps/*gz.gz: No such file or directory
=====

After this one time change I tested changing only the
do_stash_locale() function and it now works well because it is
deterministically operating off the sstate data or a local build.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 40 ++++++++++++++++++-------------
 meta/recipes-core/glibc/glibc_2.29.bb     |  1 -
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index ff17a19..5cfb1b6 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -164,13 +164,13 @@ do_stash_locale () {
 	install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir} ${dest}${datadir}
 	# Hide away the locale data from the deployment
 	if [ -e ${D}${bindir}/localedef ]; then
-		mv -f ${D}${bindir}/localedef ${dest}${bindir}
+		cp -a ${D}${bindir}/localedef ${dest}${bindir}
 	fi
 	if [ -e ${D}${libdir}/gconv ]; then
-		mv -f ${D}${libdir}/gconv ${dest}${libdir}
+		cp -a ${D}${libdir}/gconv ${dest}${libdir}
 	fi
 	if [ -e ${D}${datadir}/i18n ]; then
-		mv ${D}${datadir}/i18n ${dest}${datadir}
+		cp -a  ${D}${datadir}/i18n ${dest}${datadir}
 	fi
 
 	# Make a copy of all the libraries into the locale stash
@@ -210,30 +210,38 @@ python do_stash_locale_setscene () {
 }
 addtask do_stash_locale_setscene
 
-do_poststash_install_cleanup () {
-	# Remove all files which do_stash_locale would remove (mv)
-	# since that task could have come from sstate and not get run.
+PACKAGE_PREPROCESS_FUNCS += "stash_locale_package_cleanup"
+SYSROOT_PREPROCESS_FUNCS += "stash_locale_sysroot_cleanup"
+stash_locale_cleanup () {
+	cleanupdir=$1
+	# Remove all files which do_stash_locale() copies
 	for i in ${bashscripts}; do
-	    rm -f ${D}${bindir}/$i
+	    rm -f ${cleanupdir}${bindir}/$i
 	done
-	rm -f ${D}${bindir}/localedef
-	rm -rf ${D}${datadir}/i18n
-	rm -rf ${D}${libdir}/gconv
-	rm -rf ${D}/${localedir}
-	rm -rf ${D}${datadir}/locale
+	rm -f ${cleanupdir}${bindir}/localedef
+	rm -rf ${cleanupdir}${datadir}/i18n
+	rm -rf ${cleanupdir}${libdir}/gconv
+	rm -rf ${cleanupdir}/${localedir}
+	rm -rf ${cleanupdir}${datadir}/locale
 	if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then
-	    if [ -d "${D}${exec_prefix}/lib" ]; then
+	    if [ -d "${cleanupdir}${exec_prefix}/lib" ]; then
 		if [ -z "${ARCH_DYNAMIC_LOADER}" -o \
-		     ! -e "${D}${exec_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
+		     ! -e "${cleanupdir}${exec_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
 			# error out if directory isn't empty
 			# this dir should only contain locale dir
 			# which has been deleted in the previous step
-			rmdir ${D}${exec_prefix}/lib
+			rmdir ${cleanupdir}${exec_prefix}/lib
 		fi
 	    fi
 	fi
 }
-addtask do_poststash_install_cleanup after do_stash_locale do_install before do_populate_sysroot do_package
+
+stash_locale_sysroot_cleanup() {
+	stash_locale_cleanup ${SYSROOT_DESTDIR}
+}
+stash_locale_package_cleanup() {
+	stash_locale_cleanup ${PKGD}
+}
 
 pkg_postinst_nscd () {
 	if [ -z "$D" ]; then
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index 073d153..c6b2caa 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -121,7 +121,6 @@ do_compile () {
 		echo "ldd \"${prevrtld} ${RTLDLIST}\" -> \"${newrtld}\""
 		sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${newrtld}\"#"
 	fi
-
 }
 
 require glibc-package.inc
-- 
2.7.4


