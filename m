Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 855D67F945
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 02:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B1D63183C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 04:42:24 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 3w16WRQNNFXy
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 04:42:24 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 04ACD18378
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 04:42:24 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEE031E07B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 04:42:23 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3C631E076
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 04:42:23 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 04:42:23 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by thoth.se.axis.com (Postfix) with ESMTP id C7DC2124
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 04:42:23 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x8H2gN7S005287
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 04:42:23 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x8H2gNfE005286
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Sep 2019 04:42:23 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 04:42:18 +0200
Message-Id: <20190917024218.5230-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH] glibc: Make it build without ldconfig in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 17 Sep 2019 02:42:24 -0000
Content-Transfer-Encoding: 8bit

The removal of the supposedly empty /etc when ldconfig is not in
DISTRO_FEATURES seems to be a remnant from a long time ago when nothing
else was installed in /etc. However, that is no longer the case as,
e.g., nscd.conf is always installed to /etc now.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 2e8f9f3e02..d7037c5cce 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -97,7 +97,7 @@ do_install_append () {
 	# The dynamic loader will have been installed into
 	# ${base_libdir}. However, if that isn't going to end up being
 	# available in the ABI-mandated location, then a symlink must
-        # be created.
+	# be created.
 
 	if [ -n "${ARCH_DYNAMIC_LOADER}" -a ! -e "${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
 		install -d ${D}${root_prefix}/lib
@@ -111,8 +111,6 @@ do_install_append_class-target() {
 		# The distro doesn't want these files so let's not install them
 		rm -f ${D}${sysconfdir}/ld.so.conf
 		rm -f ${D}${base_sbindir}/ldconfig
-		# This directory will be empty now so remove it too.
-		rmdir ${D}${sysconfdir}
 	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
-- 
2.21.0


