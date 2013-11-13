Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C1CB16D73F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 08:46:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD8kAdJ007783
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Nov 2013 00:46:10 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 13 Nov 2013 00:46:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 16:46:07 +0800
Message-ID: <6049b439fd8ac180b930cee4448162f575fb6511.1384330136.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384330136.git.hongxu.jia@windriver.com>
References: <cover.1384330136.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] lib32-qt4-examples: fix QA warnings and INSANE_SKIP not work
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
X-List-Received-Date: Wed, 13 Nov 2013 08:46:09 -0000
Content-Type: text/plain

Fix the following warnings:
...
lib32-qt4-examples: found library in wrong location: /usr/bin/qt4/examples/tools/echoplugin/plugin/libechoplugin.so
lib32-qt4-examples: found library in wrong location: /usr/bin/qt4/examples/tools/plugandpaint/plugins/libpnp_extrafilters.so
...

In oe-core f119566477243ce43b727492dc78b9cb3dd76de4, it added INSANE_SKIP
libdir for examples packages as it includes plugin shared libraries outside
of libdir.

But it hardcoded ${QT_BASE_NAME} as INSANE_SKIP's package name
and it didn't work while multilib enabled.

Add ${MLPREFIX} as package name's prefix in INSANE_SKIP

[YOCTO #5516]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-qt/qt4/qt4.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 6adc404..293eb87 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -185,8 +185,8 @@ FILES_${QT_BASE_NAME}-xmlpatterns          = "${bindir}/xmlpatterns*"
 FILES_${QT_BASE_NAME}-xmlpatterns-dbg      = "${bindir}/.debug/xmlpatterns*"
 FILES_${QT_BASE_NAME}-qml-plugins          = "${libdir}/${QT_DIR_NAME}/imports/* ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/*"
 FILES_${QT_BASE_NAME}-qml-plugins-dbg      = "${libdir}/${QT_DIR_NAME}/imports/*/*/*/.debug/* ${libdir}/${QT_DIR_NAME}/imports/*/.debug ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/.debug"
-INSANE_SKIP_${QT_BASE_NAME}-examples      += "libdir"
-INSANE_SKIP_${QT_BASE_NAME}-examples-dbg  += "libdir"
+INSANE_SKIP_${MLPREFIX}${QT_BASE_NAME}-examples      += "libdir"
+INSANE_SKIP_${MLPREFIX}${QT_BASE_NAME}-examples-dbg  += "libdir"
 
 # License options, to be set by the recipe if different values are needed
 QT_LICENSE_FILE ?= ""
-- 
1.8.1.2


