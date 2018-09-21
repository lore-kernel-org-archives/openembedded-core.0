Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id D9BD779943
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 22:25:13 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [137.117.33.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 00DE22156F;
	Fri, 21 Sep 2018 22:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1537568158;
	bh=H866h8ulDMFhVpe+vAf/sEH7EL8nJgpEgbNV8NjC4vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGLch+m1Rt8XnU+6rcxkymlaGlLPrWi1q3IKvlRRChFfMd0zh+ZoERcfHjBRHjRjt
	7gB/4vuouFPQYO5MJ1WIJPkZbuNc50U4N/Q8qbFk+SeitpmW3akK/v4IN0OqicMkd/
	3CRVZOSp8AYnzF5aXM/6m3NjvLNOnJgbtgQauRrs=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 22:15:52 +0000
Message-Id: <20180921221553.23399-2-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180921221553.23399-1-okaya@kernel.org>
References: <20180921221553.23399-1-okaya@kernel.org>
MIME-Version: 1.0
Subject: [PATCH v1 2/3] libpng: CVE-2018-13785
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
X-List-Received-Date: Fri, 21 Sep 2018 22:25:14 -0000
Content-Transfer-Encoding: 8bit

* CVE-2018-13785
In libpng 1.6.34, a wrong calculation of row_factor in the
png_check_chunk_length function (pngrutil.c) may trigger an
integer overflow and resultant divide-by-zero while processing
a crafted PNG file, leading to a denial of service.

(cherry picked from 8a05766cb74af05c04c53e6c9d60c13fc4d59bf2)

Affects libpng <= 1.6.34

CVE: CVE-2018-13785
Upstream-Status: Backport [https://github.com/glennrp/libpng/commit/8a05766cb74af05c04c53e6c9d60c13fc4d59bf2]
Ref: https://access.redhat.com/security/cve/cve-2018-13785
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../libpng/files/CVE-2018-13785.patch         | 35 +++++++++++++++++++
 .../libpng/libpng_1.6.34.bb                   |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2018-13785.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2018-13785.patch b/meta/recipes-multimedia/libpng/files/CVE-2018-13785.patch
new file mode 100644
index 0000000000..3ffbe0813e
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2018-13785.patch
@@ -0,0 +1,35 @@
+From 8a05766cb74af05c04c53e6c9d60c13fc4d59bf2 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Sun, 17 Jun 2018 22:56:29 -0400
+Subject: [PATCH] [libpng16] Fix the calculation of row_factor in
+ png_check_chunk_length
+
+(Bug report by Thuan Pham, SourceForge issue #278)
+---
+ pngrutil.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/pngrutil.c b/pngrutil.c
+index 95571b517..5ba995abf 100644
+--- a/pngrutil.c
++++ b/pngrutil.c
+@@ -3167,10 +3167,13 @@ png_check_chunk_length(png_const_structrp png_ptr, const png_uint_32 length)
+    {
+       png_alloc_size_t idat_limit = PNG_UINT_31_MAX;
+       size_t row_factor =
+-         (png_ptr->width * png_ptr->channels * (png_ptr->bit_depth > 8? 2: 1)
+-          + 1 + (png_ptr->interlaced? 6: 0));
++         (size_t)png_ptr->width
++         * (size_t)png_ptr->channels
++         * (png_ptr->bit_depth > 8? 2: 1)
++         + 1
++         + (png_ptr->interlaced? 6: 0);
+       if (png_ptr->height > PNG_UINT_32_MAX/row_factor)
+-         idat_limit=PNG_UINT_31_MAX;
++         idat_limit = PNG_UINT_31_MAX;
+       else
+          idat_limit = png_ptr->height * row_factor;
+       row_factor = row_factor > 32566? 32566 : row_factor;
+-- 
+2.19.0
+
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.34.bb b/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
index e52d032289..3877d6cbf0 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
@@ -8,7 +8,9 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz \
+           file://CVE-2018-13785.patch \
+"
 SRC_URI[md5sum] = "c05b6ca7190a5e387b78657dbe5536b2"
 SRC_URI[sha256sum] = "2f1e960d92ce3b3abd03d06dfec9637dfbd22febf107a536b44f7a47c60659f6"
 
-- 
2.19.0


