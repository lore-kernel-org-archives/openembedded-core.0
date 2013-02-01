Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1U1B0r-0001Dk-Dv
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 08:26:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r117AXu0007643
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 23:10:33 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 31 Jan 2013 23:10:32 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 15:10:29 +0800
Message-ID: <c5542b7a6ce2324c11b2c133227d6922ebd48d95.1359688928.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359688928.git.rongqing.li@windriver.com>
References: <cover.1359688928.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] QT4: use '-no-neon' if cpu does not support neon
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 07:26:19 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Some armv7a cpu does not support neon, like SPEAr1310,
so we should check against "neon" in TUNE_FEATURES.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb |    4 ++--
 meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
index 5a3dc65..0f417c9 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
@@ -1,9 +1,9 @@
 require qt4-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+QT_CONFIG_FLAGS_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "-no-neon" ,d)}"
 
 QT_CONFIG_FLAGS += " \
  -exceptions \
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
index 9b03ff2..a589fbe 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
@@ -1,9 +1,9 @@
 require qt4-x11-free.inc
 require qt4-${PV}.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+QT_CONFIG_FLAGS_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "-no-neon" ,d)}"
 
 QT_CONFIG_FLAGS += " \
  -no-embedded \
-- 
1.7.10.4



