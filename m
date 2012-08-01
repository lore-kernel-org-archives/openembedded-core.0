Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SwP7t-0003Ar-Mh
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 04:57:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q712jt6L018951
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 19:45:55 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Tue, 31 Jul 2012 19:45:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 21:59:35 -0500
Message-ID: <bb4b80e538c6b5f7e7d889853855692c5e43e0dc.1343789879.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1343789879.git.mark.hatle@windriver.com>
References: <cover.1343789879.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] python-setuptools: Fix setuptools install libdir != /usr/lib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 02:57:34 -0000
Content-Type: text/plain

--install-lib= is required to be passed via distutils install
otherwise the install location gets set to whatever the python-native
location is.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../python/python-setuptools_0.6c11.bb             |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
index a769714..24dd9e5 100644
--- a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
@@ -5,7 +5,7 @@ LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=23;endline=23;md5=8a314270dd7a8dbca741775415f1716e"
 
 SRCNAME = "setuptools"
-PR = "ml4"
+PR = "ml5"
 DEPENDS += "python"
 DEPENDS_virtclass-native += "python-native"
 
@@ -16,6 +16,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
+
 do_install_prepend() {
     install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
 }
-- 
1.7.3.4



