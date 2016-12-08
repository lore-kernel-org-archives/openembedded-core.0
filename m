Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8C86F71C71
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:01 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 0CF5AB85902; Thu,  8 Dec 2016 22:47:57 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:27 +0100
Message-Id: <1481233677-27298-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 03/33] dpkg-native: hardcode SYSCONFDIR to sysconfdir_native in update-alternatives
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:05 -0000

It needs to be relative to DPKG_INSTDIR when installing.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 v2: Use ${sysconfdir_native} instead of /etc.

 meta/recipes-devtools/dpkg/dpkg.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 2285f23..4fd0f2a 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -42,6 +42,10 @@ EXTRA_OECONF = "\
 EXTRA_OECONF += "TAR=tar"
 EXTRA_OECONF_append_class-target = " DEB_HOST_ARCH=${DPKG_ARCH}"
 
+do_configure_prepend_class-native() {
+    sed -i -e 's|SYSCONFDIR|"${sysconfdir_native}"|' ${S}/utils/update-alternatives.c
+}
+
 do_configure () {
     echo >> ${S}/m4/compiler.m4
     sed -i -e 's#PERL_LIBDIR=.*$#PERL_LIBDIR="${libdir}/perl"#' ${S}/configure
-- 
2.7.4


