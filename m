Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYHKP-0001ed-2b for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 15:19:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qADE566C004359
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 14:05:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04019-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 14:05:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qADE4xkr004337
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 14:05:00 GMT
Message-ID: <1352815500.24487.123.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Nov 2012 14:05:00 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] classes: Be consistent about sstate-inputdirs/outputdirs ending with '/'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 14:19:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If sstate-inputdirs and sstate-outputdirs don't match with ending '/'
characters, the manifest file can end up corrupted. This change
ensures the metadata is consistent in ending do_populate_root tasks
with this character to avoid manifest file corruption.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 735f6d2..b57e523 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -54,7 +54,7 @@ base_sbindir = "${bindir}"
 libdir = "${exec_prefix}/lib/${CROSS_TARGET_SYS_DIR}"
 libexecdir = "${exec_prefix}/libexec/${CROSS_TARGET_SYS_DIR}"
 
-do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}"
+do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}/"
 
 python cross_virtclass_handler () {
     if not isinstance(e, bb.event.RecipePreFinalise):
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 6314ba1..1462ffb 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -82,8 +82,8 @@ bindir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libexecdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 
-do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}"
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_NATIVE}"
+do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}/"
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_NATIVE}/"
 
 # Since we actually install these into situ there is no staging prefix
 STAGING_DIR_HOST = ""
diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index c1a090e..83b1d2c 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -72,7 +72,7 @@ eglibcinitial_sstate_postinst() {
 	fi
 }
 
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}"
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}/"
 
 # We don't install any scripts so there is nothing to evacuate
 do_evacuate_scripts () {
diff --git a/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
index 22f56de..4620c96 100644
--- a/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
+++ b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
@@ -33,4 +33,4 @@ do_siteconfig () {
         :
 }
 
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}"
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}/"
diff --git a/meta/recipes-core/uclibc/uclibc-initial_git.bb b/meta/recipes-core/uclibc/uclibc-initial_git.bb
index c0b7d52..9e3edbd 100644
--- a/meta/recipes-core/uclibc/uclibc-initial_git.bb
+++ b/meta/recipes-core/uclibc/uclibc-initial_git.bb
@@ -33,4 +33,4 @@ do_siteconfig () {
         :
 }
 
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}"
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}/"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index ff6556c..1ac1db6 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -74,6 +74,6 @@ sysroot_stage_all() {
 	mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/ || true
 }
 
-do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST} ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}"
+do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST}/ ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}/"
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST}/ ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}/"
 




