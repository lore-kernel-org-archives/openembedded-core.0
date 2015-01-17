Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 129CF72D19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 00:31:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0H0VKkY000297
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 16:31:20 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 Jan 2015 16:31:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 16:31:17 -0800
Message-ID: <8be80d110673f5cbac9a99b8d4f84fb6a7f629a8.1421454635.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421454635.git.liezhi.yang@windriver.com>
References: <cover.1421454635.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] neard: fix B != S
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
X-List-Received-Date: Sat, 17 Jan 2015 00:31:26 -0000
Content-Type: text/plain

And bump PR to avoid:
configure: error: source directory already configured; run "make distclean" there first

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/neard/neard.inc     |    4 ++--
 meta/recipes-connectivity/neard/neard_0.14.bb |    1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index e714cad..76640d8 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
  file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
  "
 
-inherit autotools-brokensep pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd update-rc.d
 
 EXTRA_OECONF += "--enable-tools"
 
@@ -35,7 +35,7 @@ do_install_append() {
 	# Install the tests for neard-tests
 	install -d ${D}${libdir}/neard
 	install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
-	install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
+	install -m 0755 ${B}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
 }
 
 PACKAGES =+ "${PN}-tests"
diff --git a/meta/recipes-connectivity/neard/neard_0.14.bb b/meta/recipes-connectivity/neard/neard_0.14.bb
index daf3a4b..43fb589 100644
--- a/meta/recipes-connectivity/neard/neard_0.14.bb
+++ b/meta/recipes-connectivity/neard/neard_0.14.bb
@@ -8,3 +8,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "692ba2653d60155255244c87396c486b"
 SRC_URI[sha256sum] = "6ea724b443d39d679168fc7776a965d1f64727c3735391df2c01469ee7cd8cca"
 
+PR = "r1"
-- 
1.7.9.5


