Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA4B672595
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 08:28:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBT8SIo4015432
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 00:28:18 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Dec 2014 00:28:18 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Dec 2014 16:28:21 +0800
Message-ID: <29bb03e819cc686d3999d6efed833a16ab2b67e2.1419841627.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419841627.git.Qi.Chen@windriver.com>
References: <cover.1419841627.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] diffutils & diffstat: fix up EXTRA_OECONF
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
X-List-Received-Date: Mon, 29 Dec 2014 08:28:21 -0000
Content-Type: text/plain

The following line is meant to be in diffutils but it was added to
diffstat by accident. The commit message which introduced this line
says that it's for diffutils.

     EXTRA_OECONF += "--without-libsigsegv-prefix"

This patch fixes this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.59.bb  | 2 --
 meta/recipes-extended/diffutils/diffutils_3.3.bb | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.59.bb b/meta/recipes-devtools/diffstat/diffstat_1.59.bb
index c64eb7f..f599622b 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.59.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.59.bb
@@ -16,8 +16,6 @@ SRC_URI[sha256sum] = "267d1441b8889cbefbb7ca7dfd4a17f6c8bc73bc114904c74ecad945a3
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-EXTRA_OECONF += "--without-libsigsegv-prefix"
-
 inherit autotools gettext ptest
 
 do_configure () {
diff --git a/meta/recipes-extended/diffutils/diffutils_3.3.bb b/meta/recipes-extended/diffutils/diffutils_3.3.bb
index a467f20..b708962 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.3.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.3.bb
@@ -7,6 +7,8 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://run-ptest \
 "
 
+EXTRA_OECONF += "--without-libsigsegv-prefix"
+
 do_configure_prepend () {
 	# Need to remove gettext macros with weird mix of versions
 	for i in codeset.m4 gettext_gl.m4 intlmacosx.m4 inttypes-pri.m4 lib-ld_gl.m4 lib-prefix_gl.m4 po_gl.m4 ssize_t.m4 wchar_t.m4 wint_t.m4; do
-- 
1.9.1


