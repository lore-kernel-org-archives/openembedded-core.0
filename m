Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id BE42A765DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id EC9361EE0820;
	Tue, 23 Aug 2016 09:25:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id y92TjFYDVDaM; Tue, 23 Aug 2016 09:25:40 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id A376F1EE081A;
	Tue, 23 Aug 2016 09:25:40 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 09:25:23 +0200
Message-Id: <b0afbd8bead81db639e1ff2a74aab06c1aa73adc.1471936926.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
MIME-Version: 1.0
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH 2/8] [cross] export CC family from BUILD_* for cross compilers
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
X-List-Received-Date: Tue, 23 Aug 2016 07:25:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cross-compilers are native recipes that need to be compiled by the host's
compiler. However then do not use native.bbclass

As a consequence, the various CC, CXX etc environment variables are not
correctly set and they will not honor the host compiler name provided
by the BUILD_* variables.

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
---
 meta/classes/cross.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 81d1c9d..8d1e779 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -68,4 +68,16 @@ do_install () {
 
 USE_NLS = "no"
 
+export CC = "${BUILD_CC}"
+export CXX = "${BUILD_CXX}"
+export FC = "${BUILD_FC}"
+export CPP = "${BUILD_CPP}"
+export LD = "${BUILD_LD}"
+export CCLD = "${BUILD_CCLD}"
+export AR = "${BUILD_AR}"
+export AS = "${BUILD_AS}"
+export RANLIB = "${BUILD_RANLIB}"
+export STRIP = "${BUILD_STRIP}"
+export NM = "${BUILD_NM}"
+
 inherit nopackages
-- 
git-series 0.8.9

