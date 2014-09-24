Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E31E360167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 11:38:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8OBcSQQ019106
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 04:38:28 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 24 Sep 2014 04:38:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 19:38:11 +0800
Message-ID: <7e7372c19a7505befddeb7f5ce6edcba6109515c.1411558039.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411558039.git.hongxu.jia@windriver.com>
References: <cover.1411558039.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] man/texinfo: conditionally add gzip/bzip2/xz to RDEPENDS
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
X-List-Received-Date: Wed, 24 Sep 2014 11:38:52 -0000
Content-Type: text/plain

Conditionally add 'xz/bz2/gzip' to info/man's RDEPENDS
according to DOC_COMPRESS.

[YOCTO #6750]
[YOCTO #6751]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/man/man_1.6g.bb        | 13 +++++++++++++
 meta/recipes-extended/texinfo/texinfo_5.2.bb | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
index a66e01c..2a0868f 100644
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ b/meta/recipes-extended/man/man_1.6g.bb
@@ -9,6 +9,19 @@ PR = "r1"
 
 DEPENDS = "groff less"
 
+def compress_pkg(d):
+    if "compress_doc" in d.getVar("INHERIT", True):
+         compress = d.getVar("DOC_COMPRESS", True)
+         if compress == "gz":
+             return "gzip"
+         elif compress == "bz2":
+             return "bzip2"
+         elif compress == "xz":
+             return "xz"
+    return ""
+
+RDEPENDS_${PN} += "${@compress_pkg(d)}"
+
 SRC_URI = "http://primates.ximian.com/~flucifredi/${BPN}/${BPN}-${PV}.tar.gz \
            file://man-1.5k-confpath.patch;striplevel=0 \
            file://man-1.5h1-make.patch \
diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-extended/texinfo/texinfo_5.2.bb
index cdcb37b..0ea5d54 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
@@ -9,6 +9,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PROVIDES_append_class-native = " texinfo-replacement-native"
 
+def compress_pkg(d):
+    if "compress_doc" in d.getVar("INHERIT", True):
+         compress = d.getVar("DOC_COMPRESS", True)
+         if compress == "gz":
+             return "gzip"
+         elif compress == "bz2":
+             return "bzip2"
+         elif compress == "xz":
+             return "xz"
+    return ""
+
+RDEPENDS_info += "${@compress_pkg(d)}"
+
 DEPENDS = "zlib ncurses texinfo-replacement-native"
 DEPENDS_class-native = "zlib-native ncurses-native"
 
-- 
1.9.1


