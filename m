Return-Path: <petter@technux.se>
Received: from bin-vsp-out-02.atm.binero.net (vsp-unauthed02.binero.net
	[195.74.38.227])
	by mail.openembedded.org (Postfix) with ESMTP id D2E3360617
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 09:56:41 +0000 (UTC)
X-Halon-ID: cbe1cf7a-9290-11e5-bdaa-005056917f90
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.lan (unknown [81.229.90.163])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA;
	Tue, 24 Nov 2015 10:50:29 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Nov 2015 10:50:16 +0100
Message-Id: <014aa84864010a55eeb75c81327332fc4e5501ce.1448358455.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1448358455.git.petter@technux.se>
References: <cover.1448358455.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 1/2] readline: prepare for readline6.3 upstream patches
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
X-List-Received-Date: Tue, 24 Nov 2015 09:56:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream patches are always preferred to be applied first (before
integration patches). In order to apply readline-6.3 specific upstream
patches in a preferred order we need to apply the integration-patches
at the end in the 6.3 specific recipe (this is already the case
for readline-5.2).

Also take the oppertunity to move 'norpath.patch' to readline-6.3 dir
since this patch is not shared between the 5.2 and 6.3 recipe.

[YOCTO #8451]

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-core/readline/{files => readline-6.3}/norpath.patch | 0
 meta/recipes-core/readline/readline.inc                          | 5 +----
 meta/recipes-core/readline/readline_6.3.bb                       | 5 ++++-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/readline/{files => readline-6.3}/norpath.patch (100%)

diff --git a/meta/recipes-core/readline/files/norpath.patch b/meta/recipes-core/readline/readline-6.3/norpath.patch
similarity index 100%
rename from meta/recipes-core/readline/files/norpath.patch
rename to meta/recipes-core/readline/readline-6.3/norpath.patch
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 3f662c3..30892e1 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -11,10 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS += "ncurses"
 
-SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive \
-           file://configure-fix.patch \
-           file://config-dirent-symbols.patch \
-           file://norpath.patch"
+SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive"
 
 inherit autotools texinfo
 
diff --git a/meta/recipes-core/readline/readline_6.3.bb b/meta/recipes-core/readline/readline_6.3.bb
index fc362ae..dbb9f0a 100644
--- a/meta/recipes-core/readline/readline_6.3.bb
+++ b/meta/recipes-core/readline/readline_6.3.bb
@@ -1,6 +1,9 @@
 require readline.inc
 
-SRC_URI += "file://readline-cve-2014-2524.patch;striplevel=0 \
+SRC_URI += "file://configure-fix.patch \
+            file://config-dirent-symbols.patch \
+            file://norpath.patch \
+            file://readline-cve-2014-2524.patch;striplevel=0 \
             file://readline-dispatch-multikey.patch"
 
 SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
-- 
1.9.1


