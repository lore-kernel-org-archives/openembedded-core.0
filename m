Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 08754776F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id ED5B51EECBA9;
	Wed,  7 Sep 2016 11:09:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Cx-HHWB5ejJb; Wed,  7 Sep 2016 11:09:03 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id 6B3CB1EECBA6;
	Wed,  7 Sep 2016 11:09:03 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 11:08:48 +0200
Message-Id: <020582cae1eb1d47d647d8c654b9277dea0aa4f1.1473239261.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
MIME-Version: 1.0
In-Reply-To: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH v2 7/8] rpm: manually cleanup sysck
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
X-List-Received-Date: Wed, 07 Sep 2016 09:09:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

version 5.4.1 of rpm was not properly distclean before release, which
causes problems when cross-compiling.

The previous version this recipe called make distclean, but that would
trigger a call to ./configure which would fail when no gcc is
available and make the whole do_configure fail further down the line

This patch manually removes the files from the recipe.

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 55acd25..9f78dee 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -527,7 +527,7 @@ do_configure() {
 	sed -e 's/pkg-config --exists uuid/pkg-config --exists ossp-uuid/g' \
 	    -e 's/pkg-config uuid/pkg-config ossp-uuid/g' -i ${S}/configure
 
-	( cd ${S}/syck ; set +e ; rm -- -l* ; make distclean ) || :
+	( cd ${S}/syck ; set +e ; rm -- -l* ; rm Makefile config.h config.status lib/Makefile libtool stamp-h1 tests/.deps tests/Makefile  ) || :
 
 	export varprefix=${localstatedir}
 	oe_runconf
-- 
git-series 0.8.9

