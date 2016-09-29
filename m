Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9C196FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 09:02:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8T92EjN010315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 02:02:14 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Sep 2016 02:02:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2016 02:02:11 -0700
Message-ID: <4653801e7765ff1b46b90dade2d4f560a22053d6.1475139494.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1475139494.git.liezhi.yang@windriver.com>
References: <cover.1475139494.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] xcb-proto: create blank .pyc files in xcbgen dir
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
X-List-Received-Date: Thu, 29 Sep 2016 09:02:15 -0000
Content-Type: text/plain

The .pyc files will be generated when "bitbake libxcb", but they can't
be removed when "bitabke xcb-proto -ccleansstate" since they are not
tracked by manifest, create blank .pyc files can fix the problem.

When switch
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
$ bitbake world

The libdir is /usr/lib64 in this build

The
MACHINE = "qemux86-64"
$ bitbake world
Now libdir is /usr/lib, the previous /usr/lib64 can be removed totally
after this patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
index 8bdca32..d33910b 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
@@ -28,3 +28,9 @@ RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_append() {
+    # Create blank .pyc files, so that they will be recorded in
+    # manifest, and can be cleaned correctly.
+    find ${D}${libdir}/xcb-proto/xcbgen -type f -maxdepth 1 -name '*.py' -exec touch {}c \;
+}
-- 
2.9.0


