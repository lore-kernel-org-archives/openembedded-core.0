Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5E978226
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 09:53:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9V9rFu8016671
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 02:53:15 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 31 Oct 2017 02:53:14 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 17:52:29 +0800
Message-ID: <1509443549-101657-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] wget: Upgrade 1.19.1 -> 1.19.2
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
X-List-Received-Date: Tue, 31 Oct 2017 09:53:14 -0000
Content-Type: text/plain

Among other things, fix CVE-2017-13089 CVE-2017-13090 CVE-2017-6508
External References:
https://nvd.nist.gov/vuln/detail/CVE-2017-13089
https://nvd.nist.gov/vuln/detail/CVE-2017-13090
https://nvd.nist.gov/vuln/detail/CVE-2017-6508

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../recipes-extended/wget/wget/CVE-2017-6508.patch | 44 ----------------------
 meta/recipes-extended/wget/wget_1.19.1.bb          |  9 -----
 meta/recipes-extended/wget/wget_1.19.2.bb          |  8 ++++
 3 files changed, 8 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget/CVE-2017-6508.patch
 delete mode 100644 meta/recipes-extended/wget/wget_1.19.1.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.19.2.bb

diff --git a/meta/recipes-extended/wget/wget/CVE-2017-6508.patch b/meta/recipes-extended/wget/wget/CVE-2017-6508.patch
deleted file mode 100644
index b9c290f..0000000
--- a/meta/recipes-extended/wget/wget/CVE-2017-6508.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4d729e322fae359a1aefaafec1144764a54e8ad4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
-Date: Mon, 6 Mar 2017 10:04:22 +0100
-Subject: [PATCH] Fix CRLF injection in Wget host part
-
-* src/url.c (url_parse): Reject control characters in host part of URL
-
-Reported-by: Orange Tsai
-
-Upstream-Status: Backport
-[http://git.savannah.gnu.org/cgit/wget.git/commit/?id=4d729e322fae359a1aefaafec1144764a54e8ad4]
-
-CVE: CVE-2017-6508
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/url.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/src/url.c b/src/url.c
-index 8f8ff0b..7d36b27 100644
---- a/src/url.c
-+++ b/src/url.c
-@@ -925,6 +925,17 @@ url_parse (const char *url, int *error, struct iri *iri, bool percent_encode)
-       url_unescape (u->host);
-       host_modified = true;
- 
-+      /* check for invalid control characters in host name */
-+      for (p = u->host; *p; p++)
-+        {
-+          if (c_iscntrl(*p))
-+            {
-+              url_free(u);
-+              error_code = PE_INVALID_HOST_NAME;
-+              goto error;
-+            }
-+        }
-+
-       /* Apply IDNA regardless of iri->utf8_encode status */
-       if (opt.enable_iri && iri)
-         {
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/wget/wget_1.19.1.bb b/meta/recipes-extended/wget/wget_1.19.1.bb
deleted file mode 100644
index 78bde95..0000000
--- a/meta/recipes-extended/wget/wget_1.19.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-           file://CVE-2017-6508.patch \
-          "
-
-SRC_URI[md5sum] = "87cea36b7161fd43e3fd51a4e8b89689"
-SRC_URI[sha256sum] = "9e4f12da38cc6167d0752d934abe27c7b1599a9af294e73829be7ac7b5b4da40"
-
-require wget.inc
diff --git a/meta/recipes-extended/wget/wget_1.19.2.bb b/meta/recipes-extended/wget/wget_1.19.2.bb
new file mode 100644
index 0000000..bdafa70
--- /dev/null
+++ b/meta/recipes-extended/wget/wget_1.19.2.bb
@@ -0,0 +1,8 @@
+SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+          "
+
+SRC_URI[md5sum] = "caabf9727fa429626316619a6369fffa"
+SRC_URI[sha256sum] = "4f4a673b6d466efa50fbfba796bd84a46ae24e370fa562ede5b21ab53c11a920"
+
+require wget.inc
-- 
1.9.1


