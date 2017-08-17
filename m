Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 412BC77F7D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 07:39:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H7domp007290
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 00:39:50 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 17 Aug 2017 00:39:49 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 15:40:30 +0800
Message-ID: <1502955630-24971-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] wget: Security fix CVE-2017-6508
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
X-List-Received-Date: Thu, 17 Aug 2017 07:39:49 -0000
Content-Type: text/plain

CVE-2017-6508: CRLF injection vulnerability in the url_parse function in
url.c in Wget through 1.19.1 allows remote attackers to inject arbitrary
HTTP headers via CRLF sequences in the host subcomponent of a URL.

External References:
https://nvd.nist.gov/vuln/detail/CVE-2017-6508

Patch from:
http://git.savannah.gnu.org/cgit/wget.git/commit/?id=4d729e322fae359a1aefaafec1144764a54e8ad4

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/wget/wget/CVE-2017-6508.patch | 44 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.19.1.bb          |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2017-6508.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2017-6508.patch b/meta/recipes-extended/wget/wget/CVE-2017-6508.patch
new file mode 100644
index 0000000..b9c290f
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2017-6508.patch
@@ -0,0 +1,44 @@
+From 4d729e322fae359a1aefaafec1144764a54e8ad4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 6 Mar 2017 10:04:22 +0100
+Subject: [PATCH] Fix CRLF injection in Wget host part
+
+* src/url.c (url_parse): Reject control characters in host part of URL
+
+Reported-by: Orange Tsai
+
+Upstream-Status: Backport
+[http://git.savannah.gnu.org/cgit/wget.git/commit/?id=4d729e322fae359a1aefaafec1144764a54e8ad4]
+
+CVE: CVE-2017-6508
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/url.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/src/url.c b/src/url.c
+index 8f8ff0b..7d36b27 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -925,6 +925,17 @@ url_parse (const char *url, int *error, struct iri *iri, bool percent_encode)
+       url_unescape (u->host);
+       host_modified = true;
+ 
++      /* check for invalid control characters in host name */
++      for (p = u->host; *p; p++)
++        {
++          if (c_iscntrl(*p))
++            {
++              url_free(u);
++              error_code = PE_INVALID_HOST_NAME;
++              goto error;
++            }
++        }
++
+       /* Apply IDNA regardless of iri->utf8_encode status */
+       if (opt.enable_iri && iri)
+         {
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/wget/wget_1.19.1.bb b/meta/recipes-extended/wget/wget_1.19.1.bb
index 62313b2..78bde95 100644
--- a/meta/recipes-extended/wget/wget_1.19.1.bb
+++ b/meta/recipes-extended/wget/wget_1.19.1.bb
@@ -1,5 +1,6 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://CVE-2017-6508.patch \
           "
 
 SRC_URI[md5sum] = "87cea36b7161fd43e3fd51a4e8b89689"
-- 
2.7.4


