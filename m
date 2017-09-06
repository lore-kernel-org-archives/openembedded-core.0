Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B92F977D3A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 04:49:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v864neCW010642
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Sep 2017 21:49:40 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Sep 2017 21:49:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Sep 2017 12:54:46 +0800
Message-ID: <d5c1771f4903b4302f7b833d02890a30bec9573e.1504673600.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1504673600.git.Qi.Chen@windriver.com>
References: <cover.1504673600.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3-setuptools: extend to nativesdk
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
X-List-Received-Date: Wed, 06 Sep 2017 04:49:39 -0000
Content-Type: text/plain

Extend python3-setuptools to nativesdk because nativesdk-python3-pip needs
it.

Also, adjust RDEPENDS variable setting to keep the runtime dependencies
for nativesdk package the same with the target one. The native package and
the target package's dependencies remain the same as before.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/python/python3-setuptools_36.2.7.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_36.2.7.bb b/meta/recipes-devtools/python/python3-setuptools_36.2.7.bb
index 65af6f0..63f2418 100644
--- a/meta/recipes-devtools/python/python3-setuptools_36.2.7.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_36.2.7.bb
@@ -2,6 +2,7 @@ require python-setuptools.inc
 
 DEPENDS += "python3"
 DEPENDS_class-native += "python3-native"
+DEPENDS_class-nativesdk += "nativesdk-python3"
 
 inherit distutils3
 
@@ -14,11 +15,11 @@ do_install_append() {
     echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
 }
 
-RDEPENDS_${PN} = "\
+RDEPENDS_${PN}_class-native = "\
   python3-distutils \
   python3-compression \
 "
-RDEPENDS_${PN}_class-target = "\
+RDEPENDS_${PN} = "\
   python3-ctypes \
   python3-distutils \
   python3-email \
@@ -34,4 +35,4 @@ RDEPENDS_${PN}_class-target = "\
   python3-unittest \
   python3-xml \
 "
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


