Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id E2DDA776F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 89C161EEA614;
	Wed,  7 Sep 2016 11:09:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id CoZAikX196kn; Wed,  7 Sep 2016 11:09:04 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id 04B7D1EECBA6;
	Wed,  7 Sep 2016 11:09:03 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 11:08:49 +0200
Message-Id: <a667b7e251d1dcbf7d795fa9d7db9ddc64ef9e16.1473239261.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
MIME-Version: 1.0
In-Reply-To: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH v2 8/8] libpcre: explicitely specify CCLD_FOR_BUILD for this recipe
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
X-List-Received-Date: Wed, 07 Sep 2016 09:09:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libpcre uses CCLD_FOR_BUILD as the name of the host command to use for
linking. This is not a standard autotools symbol but particular to this
recipe. We need to set it explicitely

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-support/libpcre/libpcre_8.39.bb | 2 ++
 1 file changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.39.bb b/meta/recipes-support/libpcre/libpcre_8.39.bb
index 129076a..2d4668b 100644
--- a/meta/recipes-support/libpcre/libpcre_8.39.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.39.bb
@@ -48,6 +48,8 @@ BUILD_CFLAGS =+ "-DLINK_SIZE=2 -I${B}"
 CFLAGS += "-D_REENTRANT"
 CXXFLAGS_append_powerpc = " -lstdc++"
 
+export CCLD_FOR_BUILD ="${BUILD_CCLD}"
+
 PACKAGES =+ "libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest pcretest-doc"
 
 SUMMARY_libpcrecpp = "${SUMMARY} - C++ wrapper functions"
-- 
git-series 0.8.9

