Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1E107ED57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 02:52:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8Q2psn2014937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 19:52:04 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 19:51:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2019 10:51:43 +0800
Message-ID: <acf2ac895d9134ca4b03b43bf139e2685d4281a7.1569466181.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569466181.git.liezhi.yang@windriver.com>
References: <cover.1569466181.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/3] expect: Fix configure error for nativesdk
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
X-List-Received-Date: Thu, 26 Sep 2019 02:52:14 -0000
Content-Type: text/plain

Fixed:
$ bitbake nativesdk-expect
checking for Tcl public headers... configure: error: tcl.h not found.  Please specify its location with --with-tclinclude

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 96eacd9..5f59083 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -44,9 +44,9 @@ do_install_append() {
 }
 
 # Apparently the public Tcl headers are only in /usr/include/tcl8.6
-# when building for the target.
-TCL_INCLUDE_PATH = ""
-TCL_INCLUDE_PATH_class-target = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
+# when building for the target and nativesdk.
+TCL_INCLUDE_PATH = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
+TCL_INCLUDE_PATH_class-native = ""
 
 EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
                  --enable-shared \
-- 
2.7.4


