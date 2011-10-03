Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAifo-0005A2-2E
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:12 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=h+RTtvRZEJGVmWZb7QfRRvnauz30gqHqsylfZAjhnk0=;
	b=dUb5/BPtnlQu4EaUUQwxiqtAaj2t+tebB4bivRYHOjMQLSdcP5M3XwFv3GspzODVpv
	eF7uLCKPOI/oPzMMDgw8U+2lrQWDDu2dpzDjYZblZc6Z/lOntAYublZjJB7RV59824Yb
	xG0LSms01oMXecFZ74dtZZCEBMzmmGvGZOEdU=
Received: by 10.204.136.220 with SMTP id s28mr8975503bkt.152.1317648581382;
	Mon, 03 Oct 2011 06:29:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm9545069bks.1.2011.10.03.06.29.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:36 +0200
Message-Id: <0f2f0beef0c4c4ba0f0b4943e8a4a33efeed5eca.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 05/30] libdrm: improve packaging
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
X-List-Received-Date: Mon, 03 Oct 2011 13:35:13 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/drm/libdrm.inc       |    7 ++++---
 meta/recipes-graphics/drm/libdrm_2.4.26.bb |    2 +-
 meta/recipes-graphics/drm/libdrm_git.bb    |    2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index 1ad9dc3..20d7f1f 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -15,7 +15,8 @@ DEPENDS += " libpciaccess"
 
 inherit autotools pkgconfig
 
-PACKAGES =+ "libdrm-tests"
-FILES_libdrm-tests = "${bindir}/dr* ${bindir}/mode*"
+PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-kms"
+FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode*"
+FILES_${PN}-drivers = "${libdir}/libdrm_*.so.*"
+FILES_${PN}-kms = "${libdir}/libkms*.so.*"
 
-LEAD_SONAME = "libdrm.so"
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.26.bb b/meta/recipes-graphics/drm/libdrm_2.4.26.bb
index e5aa6a4..f7a7307 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.26.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.26.bb
@@ -7,4 +7,4 @@ SRC_URI += "file://installtests.patch"
 SRC_URI[md5sum] = "062569426773f69b11a47a7712bba770"
 SRC_URI[sha256sum] = "b25b06ab5a077736044cbd9a3a05a9a23b873a0887ab1aaf93aa2b3218b2d3dc"
 
-PR = "r0"
+PR = "r1"
diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graphics/drm/libdrm_git.bb
index 7d4e1b3..85bd4fb 100644
--- a/meta/recipes-graphics/drm/libdrm_git.bb
+++ b/meta/recipes-graphics/drm/libdrm_git.bb
@@ -6,4 +6,4 @@ S = ${WORKDIR}/git
 
 SRCREV = "3f3c5be6f908272199ccf53f108b1124bfe0a00e"
 PV = "2.4.15+git${SRCPV}"
-PR = "r0"
+PR = "r1"
-- 
1.7.7



