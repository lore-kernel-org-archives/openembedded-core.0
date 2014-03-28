Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87BA46F01E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9hrKa024600
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:53 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:35 +0800
Message-ID: <eedfe13af69c82c667fb78152bb070b0cc448bc2.1395997035.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395997035.git.hongxu.jia@windriver.com>
References: <cover.1395997035.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/4] libarchive: fix CVE-2013-0211
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:52 -0000
Content-Type: text/plain

From: Baogen Shang <baogen.shang@windriver.com>

CVE description:
Integer signedness error in the archive_write_zip_data function in
archive_write_set_format_zip.c in libarchive 3.1.2 and earlier, when running
on 64-bit machines, allows context-dependent attackers to cause a denial of
service (crash) via unspecified vectors, which triggers an improper conversion
between unsigned and signed types, leading to a buffer overflow.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0211
Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libarchive/libarchive-CVE-2013-0211.patch      | 38 ++++++++++++++++++++++
 .../libarchive/libarchive_3.1.2.bb                 |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch b/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch
new file mode 100644
index 0000000..126f80e
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch
@@ -0,0 +1,38 @@
+From 2f55d6bd308ea61975558c2469ae349dba297e89 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sat, 22 Feb 2014 14:35:59 +0800
+Subject: [PATCH] Fix CVE-2013-0211
+
+This patch comes from:https://github.com/libarchive/libarchive/commit/22531545514043e04633e1c015c7540b9de9dbe4
+
+Upstream-Status: Backport
+
+Signed-off-by: Baogen shang <baogen.shang@windriver.com>
+
+Update the patch because of uprev on 20140222
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libarchive/archive_write.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
+index a3d1a33..a323588 100644
+--- a/libarchive/archive_write.c
++++ b/libarchive/archive_write.c
+@@ -671,8 +671,12 @@ static ssize_t
+ _archive_write_data(struct archive *_a, const void *buff, size_t s)
+ {
+ 	struct archive_write *a = (struct archive_write *)_a;
++	const size_t max_write = INT_MAX;
+ 	archive_check_magic(&a->archive, ARCHIVE_WRITE_MAGIC,
+ 	    ARCHIVE_STATE_DATA, "archive_write_data");
++	/* In particular, this catches attempts to pass negative values. */
++	if (s > max_write)
++		s = max_write;
+ 	archive_clear_error(&a->archive);
+ 	return ((a->format_write_data)(a, buff, s));
+ }
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index 2556dc8..d5599e0 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -26,6 +26,7 @@ PACKAGECONFIG[libxml2] = "--with-xml2,--without-xml2,libxml2,"
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat,"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://libarchive-CVE-2013-0211.patch \
            "
 
 SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
-- 
1.8.1.2


