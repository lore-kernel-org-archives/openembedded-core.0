Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 397916A88F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:35:08 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id eh20so6777328obb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 10:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=JLIpWtsK7aJbfcTxRE2Vd9gulgM3i7ExcL+AQfI1VUo=;
	b=okVUoCRjlw/0ZALUTZjRArQHWg9UDx9egmbn9Ok4ACughTXFvpoWQIE7Q2WJuL95iH
	rgllp24o1USQBhaJZRZ5MoARSrVYIi4lpWUR9AXlcdkQAJa0LFUsOa86wX5Qgl2g2BSH
	e6Fi96CG07+XCU9eqj6uTHUOyTth76Asg6Ft8B0kTk1Us/iv34tTpEjSTm3pk/WHL9T2
	XAjBF/Tr3DsI+PsLNzcKLvxKKCIlSv4uaoE+SmSNLolShdlPkFbyEa2Bh/LuMgcFcW1H
	BoryZ5iag6LG8kqjbt2wIZTYpPHpnTOjHbeBBCNCKZ3UnsBodDATTu9k3zUtCKxIqDrY
	sW/g==
X-Received: by 10.182.134.231 with SMTP id pn7mr21733804obb.11.1370626508829; 
	Fri, 07 Jun 2013 10:35:08 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id i2sm34454702obz.11.2013.06.07.10.35.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 10:35:08 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 10:35:02 -0700
Message-Id: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQlGoaZGF3CB9ZbWhOhj7NYv//gJLKXJVBLyCAS6+LtjvLGxyuOxHbD3W3swxDvqruDkkHNe
Subject: [PATCH] valgrind: added perl dependency
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
X-List-Received-Date: Fri, 07 Jun 2013 17:35:08 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

This is necessary since the valgrind package depends on /usr/bin/perl.

This patch will fix this error while installing into rootfs:
Computing transaction...error: Can't install valgrind-3.8.1-r8@armv7a_vfp_neon: no package provides /usr/bin/perl

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.8.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
index 3520d49..ae2c5a2 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
                     file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
 
 X11DEPENDS = "virtual/libx11"
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-PR = "r8"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)} perl"
+PR = "r9"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
-- 
1.8.1.4


