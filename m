Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A68407BE17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 15:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 42D0C185F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 16:41:54 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qEIjCLMJjCTo
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 16:41:52 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id D7299185EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 16:41:52 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFAF31E07C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 16:41:52 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3C551E07B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 16:41:52 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 16:41:52 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id A59E219F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 16:41:52 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x0IFfpZc010407
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 16:41:51 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x0IFfpbJ010406
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2019 16:41:51 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2019 16:41:50 +0100
Message-Id: <20190118154150.10366-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] base-files: Avoid problems if DISTRO_VERSION contains undefined variable
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
X-List-Received-Date: Fri, 18 Jan 2019 15:41:54 -0000

If DISTRO_VERSION is defined to some undefined variable, e.g.,
DISTRO_VERSION = "${FOO_VERSION}", and /bin/sh is dash, then
do_install() would fail with an error such as:

  run.do_install.2945:193: run.do_install.2945: Syntax error:
  Unterminated quoted string

This was due to unexpanded Python code making it into the shell code,
confusing the shell parser.

Reported-by: srinivasan <srinivasan.rns@gmail.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 6e30c149ba..f42a4ef7c4 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -150,7 +150,7 @@ do_install_basefilesissue () {
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
 		if [ -n "${DISTRO_VERSION}" ]; then
-			distro_version_nodate=${@'${DISTRO_VERSION}'.replace('snapshot-${DATE}','snapshot').replace('${DATE}','')}
+			distro_version_nodate="${@d.getVar('DISTRO_VERSION').replace('snapshot-${DATE}','snapshot').replace('${DATE}','')}"
 			printf "%s " $distro_version_nodate >> ${D}${sysconfdir}/issue
 			printf "%s " $distro_version_nodate >> ${D}${sysconfdir}/issue.net
 		fi
-- 
2.12.0


