Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37FDA6067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 01:11:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1J1Aja5010695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 17:10:55 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Mon, 18 Feb 2019 17:10:34 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2019 09:10:33 +0800
Message-ID: <1550538633-211116-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python3: fix INCLDIRSTOMAKE in _sysconfigdata.py
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
X-List-Received-Date: Tue, 19 Feb 2019 01:11:05 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

recipe glade do_configure failed after python upgrade
to 3.7.2, it will do runtime check of python headers
with native python3 under recipe-sysroot-native, it will check under
path INCLDIRSTOMAKE, but this value is '/usr/include /usr/include
/usr/include/python3.7m /usr/include/python3.7m', which will cause
below error:

ERROR: This autoconf log indicates errors, it looked at host include and/or
library paths while determining system capabilities.

fix it by replace /usr/include to STAGING_INCDIR

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/python/python3_3.7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 8f9d7dc..4a1cbae 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -124,6 +124,8 @@ do_install_append() {
                 -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
                 -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
                 -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
+                -e "/^ 'INCLDIRSTOMAKE'/{N; s,/usr/include,${STAGING_INCDIR},g}" \
+                -e "/^ 'INCLUDEPY'/s,/usr/include,${STAGING_INCDIR},g" \
                 ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
 }
 
-- 
2.7.4


