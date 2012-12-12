Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Tik4c-00076z-NV
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 12:02:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBCAlN6q003954
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Dec 2012 02:47:23 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 12 Dec 2012 02:47:23 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 12 Dec 2012 18:48:08 +0800
Message-ID: <7a8d2b4da7062068c212529fe515e81657636629.1355309061.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1355309061.git.kai.kang@windriver.com>
References: <cover.1355309061.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libuser: enable python support
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
X-List-Received-Date: Wed, 12 Dec 2012 11:02:31 -0000
Content-Type: text/plain

Compile libuser with python support and add python to DEPENDS.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/libuser/libuser_0.57.1.bb |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/libuser/libuser_0.57.1.bb b/meta/recipes-extended/libuser/libuser_0.57.1.bb
index 99b661b..105bacf 100644
--- a/meta/recipes-extended/libuser/libuser_0.57.1.bb
+++ b/meta/recipes-extended/libuser/libuser_0.57.1.bb
@@ -15,10 +15,16 @@ SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "be82c6941264d0b4bd04f95fb342ec7d"
 SRC_URI[sha256sum] = "a61289867581fa715354a3fafe09c3e481173ce0a2dcb33b04588b6ac13cead5"
-PR = "r2"
+PR = "r3"
 
-DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native"
+DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native python"
 
-EXTRA_OECONF += "--without-python"
+inherit autotools gettext pythonnative python-dir
+
+EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}"
+
+PACKAGES += "${PN}-python "
+
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 
-inherit autotools gettext
-- 
1.7.5.4



