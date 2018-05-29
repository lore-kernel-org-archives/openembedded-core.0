Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8652B72EA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 09:33:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4T9XYpq022270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 02:33:35 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 29 May 2018 02:33:21 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 May 2018 17:02:07 +0800
Message-ID: <20180529090207.32406-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH] mesa: fix installed-vs-shipped error
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
X-List-Received-Date: Tue, 29 May 2018 09:33:34 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When 'opengl' is not set in DISTRO_FEATURES, ${libdir}/pkgconfig is an
empty directory and cause installed-vs-shipped error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8bf417ac737..fa99f7d50cc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -138,6 +138,7 @@ do_install_append () {
     # libwayland-egl has been moved to wayland 1.15+
     rm -f ${D}${libdir}/libwayland-egl*
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
+    rmdir --ignore-fail-on-non-empty ${D}${libdir}/pkgconfig
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
-- 
2.14.1


