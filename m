Return-Path: <petter@technux.se>
Received: from bin-vsp-out-01.atm.binero.net (vsp-authed01.binero.net
	[195.74.38.224])
	by mail.openembedded.org (Postfix) with ESMTP id 08171722C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 21:57:33 +0000 (UTC)
X-Halon-ID: 9409336d-9d01-11e4-a1ae-005056917a89
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.localdomain (unknown [95.197.59.95])
	by bin-vsp-out-01.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:58:02 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 22:57:19 +0100
Message-Id: <7840fd8e44ac45d69af7d7a679d88141d269630e.1421358457.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421358457.git.petter@technux.se>
References: <cover.1421358457.git.petter@technux.se>
In-Reply-To: <cover.1421358457.git.petter@technux.se>
References: <cover.1421358457.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 2/5] makedevs: set and handle S in a proper way
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
X-List-Received-Date: Thu, 15 Jan 2015 21:57:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After removal of auto-creating S we must ensure that all recipes are
using a proper value for S. Also do some cleanup of code not needed
after changing value of S.

[YOCTO #5627]

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-devtools/makedevs/makedevs_1.0.1.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
index dd9bea2..92d5870 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
@@ -5,11 +5,9 @@ SECTION = "base"
 SRC_URI = "file://makedevs.c \
            file://COPYING.patch"
 
-FILES_${PN}_append_class-nativesdk = " ${datadir}"
+S = "${WORKDIR}"
 
-do_configure() {
-	install -m 0644 ${WORKDIR}/makedevs.c ${S}/
-}
+FILES_${PN}_append_class-nativesdk = " ${datadir}"
 
 do_compile() {
 	${CC} ${CFLAGS} ${LDFLAGS} -o ${S}/makedevs ${S}/makedevs.c
-- 
1.9.1


