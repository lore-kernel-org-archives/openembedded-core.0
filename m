Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C39B60B9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 03:29:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02H3T1HJ017050
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 20:29:02 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 16 Mar 2020 20:28:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Mar 2020 20:28:43 -0700
Message-ID: <20200317032843.118712-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: fix install error for multilib
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
X-List-Received-Date: Tue, 17 Mar 2020 03:29:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

A previous patch adds this `mv' command, but patch file, static-link.test
might not even be there. So add a check to avoid do_install error in case
of multilib.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index edecc51fdb..4f99b86569 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -129,7 +129,9 @@ do_install_append_class-target () {
 		fi
 	fi
         if test "x${MLPREFIX}" != "x"; then
-                mv ${D}${datadir}/installed-tests/glib/static-link.test ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test
+                if [ -e ${D}${datadir}/installed-tests/glib/static-link.test ]; then
+                        mv ${D}${datadir}/installed-tests/glib/static-link.test ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test
+                fi
         fi
 }
 
-- 
2.21.0


