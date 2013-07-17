Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 25EA06AFC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 01:06:37 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id m1so1757031oag.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 18:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=jyLsLsyr7VDSCxbxY0tqzOO2H6iz9VEwtC76zno9QN0=;
	b=JL4G+ficLAlNjf8eDy7ZFPPYCrewPfR10gsStxRJtmNXbvlxzu7Snc5xMVHXvUiQZI
	nDD4rMQ+HHMCyjg7oKi49zWgxEz41Mj94IW7sA7kKAPBZeX7idPx+koCL+IDXdZMmf77
	8HA7fshE5r6Oflv4jP4wczfDPuvT+5DrbgCzRkRll0AqCA/PZlGOaPRB13JP5i701wSR
	UcUSmrowFFes0AzsjubNQ2XZfeyJ2RPehMfjn0q5PMgN6i3lXFAVZRC3GrIAY0ZIRNif
	vJ2uqFDx7d02TI4SWQrCr6yC9bxtjotsCAGQ4dgzHC/7YCtkwdTG+N5xJHPflf5wdE4m
	abYQ==
X-Received: by 10.60.95.198 with SMTP id dm6mr5366529oeb.44.1374023197591;
	Tue, 16 Jul 2013 18:06:37 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id et8sm81625obb.6.2013.07.16.18.06.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Jul 2013 18:06:36 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 18:06:33 -0700
Message-Id: <1374023193-12221-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQlLYSVhEyRwRAm1yFdPioqKPrEcQ7xkCOEcKMqKGOKrjTwZP+vyVzI2+QGXWkIJpGMSlMno
Subject: [PATCH v3] valgrind: added perl dependency
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
X-List-Received-Date: Wed, 17 Jul 2013 01:06:37 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

This is necessary since the valgrind package depends on /usr/bin/perl.

This patch will fix this error while installing into rootfs:
Computing transaction...error: Can't install valgrind-3.8.1-r8@armv7a_vfp_neon: no package provides /usr/bin/perl

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
index 3520d49..33f178c 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
@@ -37,6 +37,8 @@ do_install_append () {
     install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
 }
 
+RDEPENDS_${PN} += "perl"
+
 FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
 RRECOMMENDS_${PN}_powerpc += "${TCLIBC}-dbg"
 RRECOMMENDS_${PN}_powerpc64 += "${TCLIBC}-dbg"
-- 
1.8.1.4


