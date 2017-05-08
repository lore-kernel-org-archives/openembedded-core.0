Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2722471E02
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 03:09:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4839wkV015573
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 May 2017 20:09:58 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 7 May 2017 20:09:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 May 2017 11:12:11 +0800
Message-ID: <acf44a59ccec892480fe447d160c79e317eeaf7a.1494213091.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1494213091.git.Qi.Chen@windriver.com>
References: <cover.1494213091.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cve-check-tool: backport a patch to make CVE checking work
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
X-List-Received-Date: Mon, 08 May 2017 03:09:58 -0000
Content-Type: text/plain

CVE checking in OE didn't work as do_populate_cve_db failed with the following
error message.

  [snip]/downloads/CVE_CHECK/nvdcve-2.0-2002.xml is not consistent

Backport a patch to fix this error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |  1 +
 ...are-computed-vs-expected-sha256-digit-str.patch | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
index fcd3182..1f906ee 100644
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.
            file://check-for-malloc_trim-before-using-it.patch \
            file://0001-print-progress-in-percent-when-downloading-CVE-db.patch \
            file://0001-curl-allow-overriding-default-CA-certificate-file.patch \
+           file://0001-update-Compare-computed-vs-expected-sha256-digit-str.patch \
           "
 
 SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch b/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
new file mode 100644
index 0000000..458c0cc
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
@@ -0,0 +1,52 @@
+From b0426e63c9ac61657e029f689bcb8dd051e752c6 Mon Sep 17 00:00:00 2001
+From: Sergey Popovich <popovich_sergei@mail.ua>
+Date: Fri, 21 Apr 2017 07:32:23 -0700
+Subject: [PATCH] update: Compare computed vs expected sha256 digit string
+ ignoring case
+
+We produce sha256 digest string using %x snprintf()
+qualifier for each byte of digest which uses alphabetic
+characters from "a" to "f" in lower case to represent
+integer values from 10 to 15.
+
+Previously all of the NVD META files supply sha256
+digest string for corresponding XML file in lower case.
+
+However due to some reason this changed recently to
+provide digest digits in upper case causing fetched
+data consistency checks to fail. This prevents database
+from being updated periodically.
+
+While commit c4f6e94 (update: Do not treat sha256 failure
+as fatal if requested) adds useful option to skip
+digest validation at all and thus provides workaround for
+this situation, it might be unacceptable for some
+deployments where we need to ensure that downloaded
+data is consistent before start parsing it and update
+SQLite database.
+
+Use strcasecmp() to compare two digest strings case
+insensitively and addressing this case.
+
+Upstream-Status: Backport
+Signed-off-by: Sergey Popovich <popovich_sergei@mail.ua>
+---
+ src/update.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/update.c b/src/update.c
+index 8588f38..3cc6b67 100644
+--- a/src/update.c
++++ b/src/update.c
+@@ -187,7 +187,7 @@ static bool nvdcve_data_ok(const char *meta, const char *data)
+                 snprintf(&csum_data[idx], len, "%02hhx", digest[i]);
+         }
+ 
+-        ret = streq(csum_meta, csum_data);
++        ret = !strcasecmp(csum_meta, csum_data);
+ 
+ err_unmap:
+         munmap(buffer, length);
+-- 
+2.11.0
+
-- 
1.9.1


