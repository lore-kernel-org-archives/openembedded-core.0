Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8D1673FB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:08:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4B68oQ2008560
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:08:50 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 10 May 2015 23:08:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 23:08:40 -0700
Message-ID: <1e2a54818240359bca1797e04c26e15d5d567693.1431324180.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431324180.git.liezhi.yang@windriver.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] recipes-extended: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 11 May 2015 06:08:48 -0000
Content-Type: text/plain

They can't be built withou x11 in DISTRO_FEATURES.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../packagegroups/packagegroup-core-lsb.bb         |    5 ++++-
 .../xdg-utils/xdg-utils_1.1.0-rc1.bb               |    5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index a07a6ad..3d5075e 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -7,7 +7,10 @@ DESCRIPTION = "Packages required to satisfy the Linux Standard Base (LSB) specif
 PR = "r10"
 LICENSE = "MIT"
 
-inherit packagegroup
+inherit packagegroup distro_features_check
+
+# The libxt, libxtst and others require x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 #
 # We will skip parsing this packagegeoup for non-glibc systems
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
index 2ac979b..46f1e3c 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
@@ -24,6 +24,9 @@ SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "fadf5e7a08e0526fc60dbe3e5b7ef8d6"
 SRC_URI[sha256sum] = "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209d79102"
 
-inherit autotools-brokensep
+inherit autotools-brokensep distro_features_check
+
+# The xprop requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 RDEPENDS_${PN} += "xprop"
-- 
1.7.9.5


