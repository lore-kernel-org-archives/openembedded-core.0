Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDB3E71975
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 06:31:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9C6VVNl012613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 23:31:31 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Oct 2016 23:31:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 23:31:26 -0700
Message-ID: <239ab1764ad811a12d8da6eb66ced3fff9987891.1476253865.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1476253865.git.liezhi.yang@windriver.com>
References: <cover.1476253865.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] xcb-proto: create .pyc files for python2
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
X-List-Received-Date: Wed, 12 Oct 2016 06:31:30 -0000
Content-Type: text/plain

Its Makefile's do_install creates .pyc files for python3, now also
create them for python2 so that they will be recorded by manifest, and
can be cleaned correctly.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
index 8bdca32..54988fc 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
@@ -28,3 +28,11 @@ RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_append() {
+    # Makefile's do_install creates .pyc files for python3, now also create
+    # them for python2 so that they will be recorded by manifest, and can be
+    # cleaned correctly.
+    cd  ${D}${libdir}/xcb-proto/xcbgen
+    python -m py_compile *.py
+}
-- 
2.9.0


