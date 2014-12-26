Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68364726D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 09:35:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBQ9ZedP000445
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 01:35:40 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 26 Dec 2014 01:35:39 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:35:31 +0800
Message-ID: <4b642d59f869280dcd66c38d7744a4a822bfa1a7.1419586441.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419586441.git.Qi.Chen@windriver.com>
References: <cover.1419586441.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] pciutils: add PACKAGECONFIG for 'hwdb'
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
X-List-Received-Date: Fri, 26 Dec 2014 09:35:42 -0000
Content-Type: text/plain

Add PACKAGECONFIG for 'hwdb' to fix the following QA warning.
WARNING: QA Issue: libpci rdepends on libudev, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: pciutils rdepends on libudev, but it isn't a build dependency? [build-deps]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.3.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
index 71f7e04..f544919 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
@@ -18,13 +18,18 @@ SRC_URI[sha256sum] = "413395d4bdc66fdedd6c993ed9083d1dd73812bf2a679d320f73de35c7
 
 inherit multilib_header
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
+
 PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
 
 # see configure.patch
 do_configure () {
 	(
 	  cd lib && \
-	  ${PCI_CONF_FLAG} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
+	  # EXTRA_OECONF for this recipe could only possibly contain 'HWDB=yes/no', so we put it
+	  # before ./configure
+	  ${PCI_CONF_FLAG} ${EXTRA_OECONF} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
 	)
 }
 
-- 
1.9.1


