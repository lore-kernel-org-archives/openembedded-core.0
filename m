Return-Path: <petter@technux.se>
Received: from bin-vsp-out-02.atm.binero.net (vsp-authed01.binero.net
	[195.74.38.224])
	by mail.openembedded.org (Postfix) with ESMTP id 4C76272498
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Jan 2015 14:46:35 +0000 (UTC)
X-Halon-ID: 9cc53462-98d6-11e4-8a31-005056917f90
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.lan (unknown [81.229.90.163])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Jan 2015 15:40:24 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Jan 2015 15:40:13 +0100
Message-Id: <67a14ff42f16570d2a8dfc3c50141e6b84766d62.1420899992.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420899992.git.petter@technux.se>
References: <cover.1420899992.git.petter@technux.se>
In-Reply-To: <cover.1420899992.git.petter@technux.se>
References: <cover.1420899992.git.petter@technux.se>
MIME-Version: 1.0
Subject: [RFC PATCH 4/5] xorg-minimal-fonts: set and handle S in a proper way
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
X-List-Received-Date: Sat, 10 Jan 2015 14:46:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After removal of auto-creating S we must ensure that all recipes are
using a proper value for S. Also do some minor adjustment after changing
value of S.

[YOCTO #5627]

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 3688685..bee500b 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -15,13 +15,15 @@ PR = "r2"
 
 inherit allarch
 
+S = "${WORKDIR}/misc"
+
 PACKAGES = "${PN}"
 FILES_${PN} = "${libdir}/X11/ ${datadir}/fonts/X11/"
 RDEPENDS_${PN} += "font-alias"
 
 do_install() {
 	install -d ${D}/${datadir}/fonts/X11/misc
-	install -m 0644 ${WORKDIR}/misc/* ${D}/${datadir}/fonts/X11/misc/
+	install -m 0644 ${S}/* ${D}/${datadir}/fonts/X11/misc/
 	install -d ${D}/${libdir}/X11
 	ln -sf ${datadir}/fonts/X11/ ${D}/${libdir}/X11/fonts -s
 }
-- 
1.9.1


