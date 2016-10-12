Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B89DE60290
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 02:42:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9C2gV1i006601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Oct 2016 19:42:31 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Oct 2016 19:42:30 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 12 Oct 2016 10:37:34 +0800
Message-ID: <20161012023734.11991-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc-sanitizers: allow empty for lsan and tsan packages
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
X-List-Received-Date: Wed, 12 Oct 2016 02:42:31 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

gcc checks threads and leak sanitizers support when do configure. If not
supported, packages of tsan and lsan are empty. If add such package to
image it fails to build:

| ERROR: core-image-minimal-1.0-r0 do_rootfs: libtsan-dev not found in the feeds
| ERROR: core-image-minimal-1.0-r0 do_rootfs: This is often caused by an empty
| package declared in a recipe's PACKAGES variable. (Empty packages are not
| constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)

Set ALLOW_EMPTY for these packages to resolve the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index df4e297..03d23ec 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -59,6 +59,13 @@ PACKAGES += "libasan libubsan liblsan libtsan"
 PACKAGES += "libasan-dev libubsan-dev liblsan-dev libtsan-dev"
 PACKAGES += "libasan-staticdev libubsan-staticdev liblsan-staticdev libtsan-staticdev"
 
+ALLOW_EMPTY_${MLPREFIX}liblsan = "1"
+ALLOW_EMPTY_${MLPREFIX}liblsan-dev = "1"
+ALLOW_EMPTY_${MLPREFIX}liblsan-staticdev = "1"
+ALLOW_EMPTY_${MLPREFIX}libtsan = "1"
+ALLOW_EMPTY_${MLPREFIX}libtsan-dev = "1"
+ALLOW_EMPTY_${MLPREFIX}libtsan-staticdev = "1"
+
 RDEPENDS_libasan += "libstdc++"
 RDEPENDS_libubsan += "libstdc++"
 RDEPENDS_liblsan += "libstdc++"
-- 
2.9.3


