Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE8D6B272
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 03:35:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBU3ZLal018279
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 19:35:21 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 29 Dec 2013 19:35:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Dec 2013 22:34:59 -0500
Message-ID: <58f3bc521994a50891050d2890fb17d218d11c84.1388369850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1388369850.git.liezhi.yang@windriver.com>
References: <cover.1388369850.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/14] enchant: fix unrecognised option
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
X-List-Received-Date: Mon, 30 Dec 2013 03:35:20 -0000
Content-Type: text/plain

Fix the unrecognised option --disable-binreloc, the configure now uses:

AM_CONDITIONAL(WITH_BINRELOC, test "x$br_cv_binreloc" = "xyes")

We can use br_cv_binreloc=no to fix it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/enchant/enchant_1.6.0.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/enchant/enchant_1.6.0.bb b/meta/recipes-support/enchant/enchant_1.6.0.bb
index c16a2a8..5c9359b 100644
--- a/meta/recipes-support/enchant/enchant_1.6.0.bb
+++ b/meta/recipes-support/enchant/enchant_1.6.0.bb
@@ -17,7 +17,9 @@ SRC_URI = "http://www.abisource.com/downloads/enchant/${PV}/enchant-${PV}.tar.gz
 SRC_URI[md5sum] = "de11011aff801dc61042828041fb59c7"
 SRC_URI[sha256sum] = "2fac9e7be7e9424b2c5570d8affe568db39f7572c10ed48d4e13cddf03f7097f"
 
-EXTRA_OECONF = "--with-aspell-prefix=${STAGING_DIR_HOST}${prefix} --enable-aspell --disable-binreloc"
+EXTRA_OECONF = "--with-aspell-prefix=${STAGING_DIR_HOST}${prefix} \
+		--enable-aspell br_cv_binreloc=no \
+		"
 
 FILES_${PN} = "${bindir} ${libdir}/*${SOLIBS} ${datadir}/${BPN} ${libdir}/${BPN}/*.so"
 FILES_${PN}-dev += "${libdir}/${BPN}/*{SOLIBSDEV} ${libdir}/${BPN}/*.la"
-- 
1.7.10.4


