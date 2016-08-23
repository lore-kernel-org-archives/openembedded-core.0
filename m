Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id BD1EE76420
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 352771EE0825;
	Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id rj-W72k22Alm; Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id DF1A91EE04C7;
	Tue, 23 Aug 2016 09:25:40 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 09:25:24 +0200
Message-Id: <4878b5cf9dd13a06a3c6aa1c9c126527918e0f62.1471936926.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
MIME-Version: 1.0
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH 3/8] [rpm] force a configure before make distclean
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

The rpm recipe forces a distclean in the syck subdirectory. That call
uses the result of the last ./configure call (that was made by the rpm
developers) which assumes that gcc exists and is in the path

running ./configure before that ensures that BUILD_CC is properly used and
that the make distclean succeeds

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 84adef6..6b82c6d 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -526,7 +526,7 @@ do_configure() {
 	sed -e 's/pkg-config --exists uuid/pkg-config --exists ossp-uuid/g' \
 	    -e 's/pkg-config uuid/pkg-config ossp-uuid/g' -i ${S}/configure
 
-	( cd ${S}/syck ; set +e ; rm -- -l* ; make distclean ) || :
+	( cd ${S}/syck ; set +e ; rm -- -l* ; ./configure ; make distclean ) || :
 
 	export varprefix=${localstatedir}
 	oe_runconf
-- 
git-series 0.8.9

