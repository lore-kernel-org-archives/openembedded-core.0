Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83FAF6B598
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 09:32:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r779W3jr007271
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Aug 2013 02:32:03 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 7 Aug 2013 02:32:03 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2013 17:30:13 +0800
Message-ID: <8e2c5e865ee5b6ce9887769c4b305df772ae1c2a.1375865440.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375865440.git.kai.kang@windriver.com>
References: <cover.1375865440.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 1/1] sudo: quote BUILD_CC
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
X-List-Received-Date: Wed, 07 Aug 2013 09:32:02 -0000
Content-Type: text/plain

BUILD_CC is assigned to CC when do compile. If BUILD_CC has multi-items
such as "ccache gcc", compilation fails with:

make: *** No rule to make target `gcc'.  Stop.

Double quote BUILD_CC to avoid this error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index ef2367a..e77c901 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -26,7 +26,7 @@ do_configure_prepend () {
 
 # mksigname/mksiglist are used on build host to generate source files
 do_compile_prepend () {
-	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC=$BUILD_CC CFLAGS="$BUILD_CFLAGS" CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C compat mksigname mksiglist
+	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC="$BUILD_CC" CFLAGS="$BUILD_CFLAGS" CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C compat mksigname mksiglist
 }
 
 # Explicitly create ${localstatedir}/lib before do_install to ensure
-- 
1.8.1.2


