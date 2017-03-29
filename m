Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 51E9071A3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 23:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 8D6C12E3E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:16:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id PpkKrCAV8s37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:16:21 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 02CEB2E3E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:16:21 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3FEF1E0A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:16:20 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D91781E09D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:16:20 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:16:20 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id CD31A2243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:16:20 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2TNGKWj022191
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:16:20 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2TNGKEm022190
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Mar 2017 01:16:20 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 01:16:06 +0200
Message-Id: <20170329231606.22118-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] update_gio_module_cache: Do not chown a non-existing file
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
X-List-Received-Date: Wed, 29 Mar 2017 23:16:21 -0000

Only change the ownership of ${libdir}/gio/modules/giomodule.cache if
it exists.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/postinst-intercepts/update_gio_module_cache | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
index 92092f2144..fc3f9d0d6c 100644
--- a/scripts/postinst-intercepts/update_gio_module_cache
+++ b/scripts/postinst-intercepts/update_gio_module_cache
@@ -3,7 +3,7 @@
 set -e
 
 PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
-        $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
-
-chown root:root $D${libdir}/gio/modules/giomodule.cache
+	$D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
 
+[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
+	chown root:root $D${libdir}/gio/modules/giomodule.cache
-- 
2.12.0


