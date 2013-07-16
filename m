Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6B18E6B25D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 22:16:13 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i7so1578128oag.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 15:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=JU9Y6QuankoaIZ0haINK3ppKaNWMK/pjfci4TbAnjYc=;
	b=T22R2nserP7xDIP5NqxCBop6nLkiDd1jpyviXnKBFIkI/BtlqaXS/0z1BaM8+UToBx
	Oq2eHbkJj7Q7tnZYWizCIbc9GZQ4t0NH69AfglraB2QIobDOLCBo0MoEVfv2H8RSKtdv
	Oc6zrQuPjiQrIbt64fa1rf5RJCtVWAoBdJvvKNswAzmUm3g6V5OJin4pvpZmUOM33+Ac
	+nNpoCFDVoEvkjQoBUOKIGtQUHjRHeS7AEqf6baMA7akFG5GRoZVJur94NwaNVlRZFIx
	PbTBysZ5muOpbczC8KjkOhLVmvQF0BFSlKdI4+TmjYan2dON31ZNzfjYar3jchrQYrqh
	rUnw==
X-Received: by 10.60.41.66 with SMTP id d2mr4662596oel.28.1374012973822;
	Tue, 16 Jul 2013 15:16:13 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id g1sm3199498oeq.6.2013.07.16.15.16.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Jul 2013 15:16:12 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 15:16:05 -0700
Message-Id: <1374012965-4556-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
X-Gm-Message-State: ALoCoQk5nJxJKG2uIDCAGnLOYYbSumHzWGROQbqLtCqWvYJNYI84+ODDeZ4mNJPv141wXCnCmEWd
Subject: [PATCH v2] valgrind: added perl dependency
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
X-List-Received-Date: Tue, 16 Jul 2013 22:16:13 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

This is necessary since the valgrind package depends on /usr/bin/perl.

This patch will fix this error while installing into rootfs:
Computing transaction...error: Can't install valgrind-3.8.1-r8@armv7a_vfp_neon: no package provides /usr/bin/perl

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.8.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
index 3520d49..4ee1b64 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
 
 X11DEPENDS = "virtual/libx11"
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
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


