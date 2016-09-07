Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id CAE4A776B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 6E6D31EECBA6;
	Wed,  7 Sep 2016 11:09:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id zkXCxbFAdAUK; Wed,  7 Sep 2016 11:09:00 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id 5CF711EECBA8;
	Wed,  7 Sep 2016 11:08:59 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 11:08:42 +0200
Message-Id: <1a5e9e674a0692eef1938e7e58ac2e943a4e8685.1473239261.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
MIME-Version: 1.0
In-Reply-To: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH v2 1/8] cross: export CC family from BUILD_* for cross compilers
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
X-List-Received-Date: Wed, 07 Sep 2016 09:09:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cross-compilers are native recipes that need to be compiled by the host's
compiler. However they do not use native.bbclass

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

