Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1F7678883
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 02:18:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w122IRBB012333
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 18:18:27 -0800 (PST)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 1 Feb 2018 18:18:25 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 10:16:12 +0800
Message-ID: <1517537774-12847-6-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
References: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 5/7] json-c: update to 0.13
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
X-List-Received-Date: Fri, 02 Feb 2018 02:18:26 -0000
Content-Type: text/plain

Drop 0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch since it
had been merged upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-FALLTHRU-comment-to-handle-GCC7-warnings.patch | 74 ----------------------
 .../json-c/{json-c_0.12.1.bb => json-c_0.13.bb}    | 11 ++--
 2 files changed, 5 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch
 rename meta/recipes-devtools/json-c/{json-c_0.12.1.bb => json-c_0.13.bb} (75%)

diff --git a/meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch b/meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch
deleted file mode 100644
index 537be5e..0000000
--- a/meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 7b24f8bd95ad4f7d00c93ca2ad998c14a0266dbe Mon Sep 17 00:00:00 2001
-From: marxin <mliska@suse.cz>
-Date: Tue, 21 Mar 2017 08:42:11 +0100
-Subject: [PATCH] Add FALLTHRU comment to handle GCC7 warnings.
-
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- json_object.c  |  1 +
- json_tokener.c |  1 +
- linkhash.c     | 22 +++++++++++-----------
- 3 files changed, 13 insertions(+), 11 deletions(-)
-
-diff --git a/json_object.c b/json_object.c
-index 6cc73bc..77e8b21 100644
---- a/json_object.c
-+++ b/json_object.c
-@@ -552,6 +552,7 @@ int64_t json_object_get_int64(struct json_object *jso)
-     return jso->o.c_boolean;
-   case json_type_string:
- 	if (json_parse_int64(jso->o.c_string.str, &cint) == 0) return cint;
-+	/* FALLTHRU */
-   default:
-     return 0;
-   }
-diff --git a/json_tokener.c b/json_tokener.c
-index 9a76293..ae7b1ae 100644
---- a/json_tokener.c
-+++ b/json_tokener.c
-@@ -305,6 +305,7 @@ struct json_object* json_tokener_parse_ex(struct json_tokener *tok,
-             tok->err = json_tokener_error_parse_unexpected;
-             goto out;
-         }
-+	/* FALLTHRU */
-       case '"':
- 	state = json_tokener_state_string;
- 	printbuf_reset(tok->pb);
-diff --git a/linkhash.c b/linkhash.c
-index 712c387..74e3b0f 100644
---- a/linkhash.c
-+++ b/linkhash.c
-@@ -376,17 +376,17 @@ static uint32_t hashlittle( const void *key, size_t length, uint32_t initval)
-     /*-------------------------------- last block: affect all 32 bits of (c) */
-     switch(length)                   /* all the case statements fall through */
-     {
--    case 12: c+=((uint32_t)k[11])<<24;
--    case 11: c+=((uint32_t)k[10])<<16;
--    case 10: c+=((uint32_t)k[9])<<8;
--    case 9 : c+=k[8];
--    case 8 : b+=((uint32_t)k[7])<<24;
--    case 7 : b+=((uint32_t)k[6])<<16;
--    case 6 : b+=((uint32_t)k[5])<<8;
--    case 5 : b+=k[4];
--    case 4 : a+=((uint32_t)k[3])<<24;
--    case 3 : a+=((uint32_t)k[2])<<16;
--    case 2 : a+=((uint32_t)k[1])<<8;
-+    case 12: c+=((uint32_t)k[11])<<24; /* FALLTHRU */
-+    case 11: c+=((uint32_t)k[10])<<16; /* FALLTHRU */
-+    case 10: c+=((uint32_t)k[9])<<8; /* FALLTHRU */
-+    case 9 : c+=k[8]; /* FALLTHRU */
-+    case 8 : b+=((uint32_t)k[7])<<24; /* FALLTHRU */
-+    case 7 : b+=((uint32_t)k[6])<<16; /* FALLTHRU */
-+    case 6 : b+=((uint32_t)k[5])<<8; /* FALLTHRU */
-+    case 5 : b+=k[4]; /* FALLTHRU */
-+    case 4 : a+=((uint32_t)k[3])<<24; /* FALLTHRU */
-+    case 3 : a+=((uint32_t)k[2])<<16; /* FALLTHRU */
-+    case 2 : a+=((uint32_t)k[1])<<8; /* FALLTHRU */
-     case 1 : a+=k[0];
-              break;
-     case 0 : return c;
--- 
-2.12.2
-
diff --git a/meta/recipes-devtools/json-c/json-c_0.12.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.bb
similarity index 75%
rename from meta/recipes-devtools/json-c/json-c_0.12.1.bb
rename to meta/recipes-devtools/json-c/json-c_0.13.bb
index 401cf13..06319de 100644
--- a/meta/recipes-devtools/json-c/json-c_0.12.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.bb
@@ -5,18 +5,17 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
-           file://0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch \
            "
-SRC_URI[md5sum] = "55f7853f7d8cf664554ce3fa71bf1c7d"
-SRC_URI[sha256sum] = "2a136451a7932d80b7d197b10441e26e39428d67b1443ec43bbba824705e1123"
+SRC_URI[md5sum] = "11fc5d90c77375e5fc8401e8b9efbf21"
+SRC_URI[sha256sum] = "0316780be9ad16c42d7c26b015a784fd5df4b0909fef0aba51cfb13e492ac24d"
 
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
 # json-c releases page is fetching the list of releases in some weird XML format
 # from https://s3.amazonaws.com/json-c_releases and processes it with javascript :-/
 #UPSTREAM_CHECK_URI = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
-RECIPE_UPSTREAM_VERSION = "0.12.1"
-RECIPE_UPSTREAM_DATE = "Jun 07, 2016"
-CHECK_DATE = "Apr 19, 2017"
+RECIPE_UPSTREAM_VERSION = "0.13"
+RECIPE_UPSTREAM_DATE = "Dec 07, 2017"
+CHECK_DATE = "Jan 31, 2018"
 
 RPROVIDES_${PN} = "libjson"
 
-- 
2.7.4


