Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 4034E7389D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:48:46 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 4D84EF811E0; Thu,  5 Mar 2015 08:48:48 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id EC3C3F811E0;
	Thu,  5 Mar 2015 08:48:47 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 08:48:51 -0700
Message-Id: <1425570531-9477-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH v2] opkg: Fix error when recompiled
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
X-List-Received-Date: Thu, 05 Mar 2015 15:48:47 -0000

If this package were ever recompiled, i.e. do_compile is rerun
as a result of a compiler change, etc., the 'opkg.conf' file
would be incorrectly updated, leading to an error:
 * opkg_conf_set_option: Duplicate option lists_dir, using first seen value "/var/lib/opkg".

v2: Move the update of the opkg.conf file into 'do_install' which
will prevent any erroneous [multiple] options to be added to 'opkg.conf'

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-devtools/opkg/opkg_0.2.4.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index 8455eac..447f3f6 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -47,13 +47,10 @@ do_configure_prepend() {
 	sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
 }
 
-do_compile_append () {
-	echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf
-}
-
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
+	echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${D}${sysconfdir}/opkg/opkg.conf
 
 	# We need to create the lock directory
 	install -d ${D}${OPKGLIBDIR}/opkg
-- 
1.9.1


