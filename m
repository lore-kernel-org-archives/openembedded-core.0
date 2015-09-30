Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BCA0977010
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDsniE008023 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:54:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vBEHRji7BgpI
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:54:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDsZMo007970
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:54:46 +0100
Message-ID: <1443621275.5162.95.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:54:35 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] distutils3: Avoid MACHINE specific checksums
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
X-List-Received-Date: Wed, 30 Sep 2015 13:54:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The MACHINE variable is used to handle sysroot paths within one of the
patches to python3-native. In this context, it is relocation safe and
the resulting packages should not have MACHINE specific checksums,
therefore excluding MACHINE in this context is safe.

This whole setup is ugly and ideally we should come up with a better
way of handling this but at least allow a stop gap solution for now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index e909ef4..443bf3a 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -21,6 +21,7 @@ distutils3_do_compile() {
         build ${DISTUTILS_BUILD_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
 }
+distutils3_do_compile[vardepsexclude] = "MACHINE"
 
 distutils3_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
@@ -33,6 +34,7 @@ distutils3_stage_headers() {
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
 }
+distutils3_stage_headers[vardepsexclude] = "MACHINE"
 
 distutils3_stage_all() {
         if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
@@ -48,6 +50,7 @@ distutils3_stage_all() {
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
 }
+distutils3_stage_all[vardepsexclude] = "MACHINE"
 
 distutils3_do_install() {
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
@@ -90,6 +93,7 @@ distutils3_do_install() {
             rmdir ${D}${datadir}/share
         fi
 }
+distutils3_do_install[vardepsexclude] = "MACHINE"
 
 EXPORT_FUNCTIONS do_compile do_install
 



