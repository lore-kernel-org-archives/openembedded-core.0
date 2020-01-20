Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1B760043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:02:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,341,1574092800"; d="scan'208";a="82302795"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2020 17:02:02 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 95A374CE30F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:52:50 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 20 Jan 2020 17:02:03 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 20 Jan 2020 17:02:08 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 04:26:44 -0800
Message-ID: <1579523214-47426-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 95A374CE30F3.A28C2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] file: upgrade 5.37 -> 5.38
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
X-List-Received-Date: Mon, 20 Jan 2020 09:02:04 -0000
Content-Type: text/plain

CVE-2019-18218.patch
Removed since it is included in 5.38.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../file/file/CVE-2019-18218.patch            | 55 -------------------
 .../file/{file_5.37.bb => file_5.38.bb}       |  5 +-
 2 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/CVE-2019-18218.patch
 rename meta/recipes-devtools/file/{file_5.37.bb => file_5.38.bb} (91%)

diff --git a/meta/recipes-devtools/file/file/CVE-2019-18218.patch b/meta/recipes-devtools/file/file/CVE-2019-18218.patch
deleted file mode 100644
index 3d02c5ad4b..0000000000
--- a/meta/recipes-devtools/file/file/CVE-2019-18218.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-cdf_read_property_info in cdf.c in file through 5.37 does not restrict the
-number of CDF_VECTOR elements, which allows a heap-based buffer overflow (4-byte
-out-of-bounds write).
-
-CVE: CVE-2019-18218
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 46a8443f76cec4b41ec736eca396984c74664f84 Mon Sep 17 00:00:00 2001
-From: Christos Zoulas <christos@zoulas.com>
-Date: Mon, 26 Aug 2019 14:31:39 +0000
-Subject: [PATCH] Limit the number of elements in a vector (found by oss-fuzz)
-
----
- src/cdf.c | 9 ++++-----
- src/cdf.h | 1 +
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/cdf.c b/src/cdf.c
-index 9d6396742..bb81d6374 100644
---- a/src/cdf.c
-+++ b/src/cdf.c
-@@ -1016,8 +1016,9 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
- 				goto out;
- 			}
- 			nelements = CDF_GETUINT32(q, 1);
--			if (nelements == 0) {
--				DPRINTF(("CDF_VECTOR with nelements == 0\n"));
-+			if (nelements > CDF_ELEMENT_LIMIT || nelements == 0) {
-+				DPRINTF(("CDF_VECTOR with nelements == %"
-+				    SIZE_T_FORMAT "u\n", nelements));
- 				goto out;
- 			}
- 			slen = 2;
-@@ -1060,8 +1061,6 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
- 					goto out;
- 				inp += nelem;
- 			}
--			DPRINTF(("nelements = %" SIZE_T_FORMAT "u\n",
--			    nelements));
- 			for (j = 0; j < nelements && i < sh.sh_properties;
- 			    j++, i++)
- 			{
-diff --git a/src/cdf.h b/src/cdf.h
-index 2f7e554b7..05056668f 100644
---- a/src/cdf.h
-+++ b/src/cdf.h
-@@ -48,6 +48,7 @@
- typedef int32_t cdf_secid_t;
- 
- #define CDF_LOOP_LIMIT					10000
-+#define CDF_ELEMENT_LIMIT				100000
- 
- #define CDF_SECID_NULL					0
- #define CDF_SECID_FREE					-1
diff --git a/meta/recipes-devtools/file/file_5.37.bb b/meta/recipes-devtools/file/file_5.38.bb
similarity index 91%
rename from meta/recipes-devtools/file/file_5.37.bb
rename to meta/recipes-devtools/file/file_5.38.bb
index a96ccc0d39..99c75988c2 100644
--- a/meta/recipes-devtools/file/file_5.37.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "zlib file-replacement-native"
 DEPENDS_class-native = "zlib-native"
 
-SRC_URI = "git://github.com/file/file.git \
-           file://CVE-2019-18218.patch"
+SRC_URI = "git://github.com/file/file.git"
 
-SRCREV = "a0d5b0e4e9f97d74a9911e95cedd579852e25398"
+SRCREV = "ec41083645689a787cdd00cb3b5bf578aa79e46c"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.17.1




