Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8354C6D183
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 07:03:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA173qlY007123
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2013 00:03:53 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 1 Nov 2013 00:03:51 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Nov 2013 15:03:53 +0800
Message-ID: <1383289433-26145-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] eglibc-locale: Does not create {localedir} if the toolchain has no files under it
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
X-List-Received-Date: Fri, 01 Nov 2013 07:03:50 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

This will kill the not shipped Error:
    ERROR: QA Issue: eglibc-locale: Files/directories were installed but not shipped
       /usr/lib/locale

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index c3fcc6d..83569da 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -67,11 +67,12 @@ FILES_localedef = "${bindir}/localedef"
 LOCALETREESRC = "${STAGING_INCDIR}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}"
 
 do_install () {
-	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir} ${D}${localedir}
+	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir}
 	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
 		cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
 	fi
 	if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
+		mkdir -p ${D}${localedir}
 		cp -fpPR ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
 	fi
 	if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
-- 
1.7.10.4


