Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 47EA871C9D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:21 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 40C5BB88DBD; Thu,  8 Dec 2016 22:48:00 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:51 +0100
Message-Id: <1481233677-27298-28-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 27/33] dpkg: simplify replacing perl interpreter in scripts
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:21 -0000

Target scripts already contain the correct value.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 2575fbb..d2dc38e 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -44,13 +44,11 @@ do_configure_prepend_class-native() {
     sed -i -e 's|SYSCONFDIR|"${sysconfdir_native}"|' ${S}/utils/update-alternatives.c
 }
 
-do_install_append () {
-	if [ "${PN}" = "dpkg-native" ]; then
-		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env nativeperl|' ${D}${bindir}/dpkg-*
-	else
-		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-*
-	fi
+do_install_append_class-native() {
+    sed -i -e 's|^#!${PERL}|#!/usr/bin/env nativeperl|' ${D}${bindir}/dpkg-*
+}
 
+do_install_append () {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
 		install -d ${D}${systemd_unitdir}/system
 		install -m 0644 ${WORKDIR}/dpkg-configure.service ${D}${systemd_unitdir}/system/
-- 
2.7.4


