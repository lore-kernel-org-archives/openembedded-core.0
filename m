Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1C267C771
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 14:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B69FC18288
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:19 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id i8tBZZ56R5Xi
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:19 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 235591814A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:19 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EB471E060
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:19 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 037E91E057
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:19 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:18 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id EBADF3054
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:18 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x1HEpHIE002871
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:17 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x1HEpHFq002870
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2019 15:51:17 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 15:51:06 +0100
Message-Id: <20190217145107.2796-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20190217145107.2796-1-pkj@axis.com>
References: <20190217145107.2796-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/3] libc-package.bbclass: Only extract wanted files in prep_locale_tree()
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
X-List-Received-Date: Sun, 17 Feb 2019 14:51:19 -0000

prep_locale_tree() predates the usrmerge DISTRO_FEATURE, which meant it
was not prepared for the case when ${base_libdir} == ${libdir}. This
lead to it extracting files and directories where it shouldn't.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/libc-package.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 60000a9547..ee598905b0 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -67,7 +67,12 @@ do_prep_locale_tree() {
 	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
 		gunzip $i
 	done
-	tar -cf - -C ${LOCALETREESRC}${base_libdir} -p . | tar -xf - -C $treedir/${base_libdir}
+	# The extract pattern "./l*.so*" is carefully selected so that it will
+	# match ld*.so and lib*.so*, but not any files in the gconv directory
+	# (if it exists). This makes sure we only unpack the files we need.
+	# This is important in case usrmerge is set in DISTRO_FEATURES, which
+	# means ${base_libdir} == ${libdir}.
+	tar -cf - -C ${LOCALETREESRC}${base_libdir} -p . | tar -xf - -C $treedir/${base_libdir} './l*.so*'
 	if [ -f ${STAGING_LIBDIR_NATIVE}/libgcc_s.* ]; then
 		tar -cf - -C ${STAGING_LIBDIR_NATIVE} -p libgcc_s.* | tar -xf - -C $treedir/${base_libdir}
 	fi
-- 
2.12.0


