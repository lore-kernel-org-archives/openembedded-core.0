Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BECB719B9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 14:54:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB5Esg1I024033
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2016 06:54:42 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Dec 2016 06:54:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Dec 2016 06:54:39 -0800
Message-ID: <981a3fcb8a50c6277be726177a5895c64296d2ac.1480949616.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1480949616.git.liezhi.yang@windriver.com>
References: <cover.1480949616.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] diffutils: do_configure: fix "Argument list too long"
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
X-List-Received-Date: Mon, 05 Dec 2016 14:54:41 -0000
Content-Type: text/plain

Fixed when len(TMPDIR) =  410:
aclocal: error: cannot open echo [snip]: Argument list too long

This is becuase it has a lot of m4 files, use relative path for them
can fix the problem.

It doesn't happen when MACHINE="qemux86", I think it is because
intel-x86-64 is longer than qemux86.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/diffutils/diffutils_3.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.4.bb b/meta/recipes-extended/diffutils/diffutils_3.4.bb
index cb7092b..be280ec 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.4.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.4.bb
@@ -10,6 +10,9 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
 
 EXTRA_OECONF += "--without-libsigsegv-prefix"
 
+# Fix "Argument list too long" error when len(TMPDIR) = 410
+acpaths = "-I ./m4"
+
 do_configure_prepend () {
 	# Need to remove gettext macros with weird mix of versions
 	for i in codeset.m4 gettext_gl.m4 intlmacosx.m4 inttypes-pri.m4 lib-ld_gl.m4 lib-prefix_gl.m4 po_gl.m4 ssize_t.m4 wchar_t.m4 wint_t.m4; do
-- 
2.9.0


