Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84CA375577
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 03:23:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6B3NoZn003460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 20:23:51 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 10 Jul 2018 20:23:50 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2018 11:23:44 +0800
Message-ID: <1531279424-13408-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] file: Security fix CVE-2018-10360
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
X-List-Received-Date: Wed, 11 Jul 2018 03:23:50 -0000
Content-Type: text/plain

CVE-2018-10360: The do_core_note function in readelf.c in libmagic.a in
file 5.33 allows remote attackers to cause a denial of service
(out-of-bounds read and application crash) via a crafted ELF file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2018-10360

Patch from:
https://github.com/file/file/commit/a642587a9c9e2dd7feacdf513c3643ce26ad3c22

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../file/file/CVE-2018-10360.patch                 | 32 ++++++++++++++++++++++
 meta/recipes-devtools/file/file_5.33.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/file/file/CVE-2018-10360.patch

diff --git a/meta/recipes-devtools/file/file/CVE-2018-10360.patch b/meta/recipes-devtools/file/file/CVE-2018-10360.patch
new file mode 100644
index 0000000..7f5671b
--- /dev/null
+++ b/meta/recipes-devtools/file/file/CVE-2018-10360.patch
@@ -0,0 +1,32 @@
+From df494f4ca494b5e1044052d96a6092a16ef1f6b3 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Sat, 9 Jun 2018 16:00:06 +0000
+Subject: [PATCH] Avoid reading past the end of buffer (Rui Reis)
+
+Upstream-Status: Backport
+[https://github.com/file/file/commit/a642587a9c9e2dd7feacdf513c3643ce26ad3c22]
+
+CVE: CVE-2018-10360
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/readelf.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/readelf.c b/src/readelf.c
+index 3df0836..d96a538 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -825,7 +825,8 @@ do_core_note(struct magic_set *ms, unsigned char *nbuf, uint32_t type,
+ 
+ 				cname = (unsigned char *)
+ 				    &nbuf[doff + prpsoffsets(i)];
+-				for (cp = cname; *cp && isprint(*cp); cp++)
++				for (cp = cname; cp < nbuf + size && *cp
++				    && isprint(*cp); cp++)
+ 					continue;
+ 				/*
+ 				 * Linux apparently appends a space at the end
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/file/file_5.33.bb b/meta/recipes-devtools/file/file_5.33.bb
index 4126422..745ef10 100644
--- a/meta/recipes-devtools/file/file_5.33.bb
+++ b/meta/recipes-devtools/file/file_5.33.bb
@@ -16,6 +16,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 
 SRC_URI = "git://github.com/file/file.git \
         file://debian-742262.patch \
+        file://CVE-2018-10360.patch \
         "
 
 SRCREV = "219846094c7593e27453e62855e61181089c48cf"
-- 
2.7.4


