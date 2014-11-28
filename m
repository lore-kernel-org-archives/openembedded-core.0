Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 359F4722AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 06:48:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAS6mh35029298
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 22:48:43 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 27 Nov 2014 22:48:43 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Nov 2014 01:48:38 -0500
Message-ID: <dc8c1fc1bb8076ef8da0af7ce2f2496cd9dc8fd0.1417157206.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1417157206.git.jackie.huang@windriver.com>
References: <cover.1417157206.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] qt4: disable webkit for mips64 n32 temporarily
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
X-List-Received-Date: Fri, 28 Nov 2014 06:48:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Disable webkit for mips64 n32 temporarily that fails to compile.

The webkit package also disable the build for n32:
f5c4d18 webkit/midori: block to build webkit on mips64 with libn32 ABI

The opened defect in qt upstream is:
https://bugreports.qt-project.org/browse/QTBUG-39224

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-4.8.6.inc |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.8.6.inc
index ae6692b..924a6ad 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -31,6 +31,11 @@ SRC_URI[sha256sum] = "8b14dd91b52862e09b8e6a963507b74bc2580787d171feda197badfa70
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
+# disable webkit for mips64 n32 temporarily that fails to compile,
+# qt upstream defect:
+# https://bugreports.qt-project.org/browse/QTBUG-39224
+QT_CONFIG_FLAGS_append_mips64 = "${@bb.utils.contains("TUNE_FEATURES", "n32", " -no-webkit", "" ,d)}"
+
 FILES_${QT_BASE_NAME}-tools_append     = " ${bindir}/qml ${bindir}/qmlplugindump"
 FILES_${QT_BASE_NAME}-tools-dbg_append = " ${bindir}/.debug/qml ${bindir}/.debug/qmlplugindump"
 
-- 
1.7.9.5


