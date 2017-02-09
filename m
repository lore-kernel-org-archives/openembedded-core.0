Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DEB2A7391A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 19:38:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 09 Feb 2017 11:38:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,137,1484035200"; d="scan'208";a="1124430832"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 09 Feb 2017 11:38:39 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 14FFB6A4006;
	Thu,  9 Feb 2017 11:37:37 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 21:38:33 +0200
Message-Id: <3126cc0be3fdcd228a3bc73e2e58b90447c53ef2.1486668313.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486668313.git.jussi.kukkonen@intel.com>
References: <cover.1486668313.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/3] cve-check-tool: Use CA cert bundle in correct sysroot
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
X-List-Received-Date: Thu, 09 Feb 2017 19:38:40 -0000

Native libcurl looks for CA certs in the wrong place by
default.
* Add patch that allows overriding the default CA certificate
  location. Patch is originally from meta-security-isafw.
* Use the new --cacert to set the correct CA bundle path

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |   4 +-
 ...ow-overriding-default-CA-certificate-file.patch | 215 +++++++++++++++++++++
 2 files changed, 218 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
index c78af67..fcd3182 100644
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e8c1458438ead3c34974bc0be3a03ed6"
 SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
            file://check-for-malloc_trim-before-using-it.patch \
            file://0001-print-progress-in-percent-when-downloading-CVE-db.patch \
+           file://0001-curl-allow-overriding-default-CA-certificate-file.patch \
           "
 
 SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
@@ -39,7 +40,8 @@ do_populate_cve_db() {
     [ -z "${cve_file}" ] && cve_file="${TMPDIR}/cve_check"
 
     bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
-    if cve-check-update -d "$cve_dir" ; then
+    # --cacert works around curl-native not finding the CA bundle
+    if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-certificates.crt -d "$cve_dir" ; then
         printf "CVE database was updated on %s UTC\n\n" "$(LANG=C date --utc +'%F %T')" > "$cve_file"
     else
         bbwarn "Error in executing cve-check-update"
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch b/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
new file mode 100644
index 0000000..3d8ebd1
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
@@ -0,0 +1,215 @@
+From 825a9969dea052b02ba868bdf39e676349f10dce Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 9 Feb 2017 14:51:28 +0200
+Subject: [PATCH] curl: allow overriding default CA certificate file
+
+Similar to curl, --cacert can now be used in cve-check-tool and
+cve-check-update to override the default CA certificate file. Useful
+in cases where the system default is unsuitable (for example,
+out-dated) or broken (as in OE's current native libcurl, which embeds
+a path string from one build host and then uses it on another although
+the right path may have become something different).
+
+Upstream-Status: Submitted [https://github.com/ikeydoherty/cve-check-tool/pull/45]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+
+
+Took Patrick Ohlys original patch from meta-security-isafw, rebased
+on top of other patches.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ src/library/cve-check-tool.h |  1 +
+ src/library/fetch.c          | 10 +++++++++-
+ src/library/fetch.h          |  3 ++-
+ src/main.c                   |  5 ++++-
+ src/update-main.c            |  4 +++-
+ src/update.c                 | 12 +++++++-----
+ src/update.h                 |  2 +-
+ 7 files changed, 27 insertions(+), 10 deletions(-)
+
+diff --git a/src/library/cve-check-tool.h b/src/library/cve-check-tool.h
+index e4bb5b1..f89eade 100644
+--- a/src/library/cve-check-tool.h
++++ b/src/library/cve-check-tool.h
+@@ -43,6 +43,7 @@ typedef struct CveCheckTool {
+     bool bugs;                          /**<Whether bug tracking is enabled */
+     GHashTable *mapping;                /**<CVE Mapping */
+     const char *output_file;            /**<Output file, if any */
++    const char *cacert_file;            /**<Non-default SSL certificate file, if any */
+ } CveCheckTool;
+ 
+ /**
+diff --git a/src/library/fetch.c b/src/library/fetch.c
+index 0fe6d76..8f998c3 100644
+--- a/src/library/fetch.c
++++ b/src/library/fetch.c
+@@ -60,7 +60,8 @@ static int progress_callback_new(void *ptr, curl_off_t dltotal, curl_off_t dlnow
+ }
+ 
+ FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
+-                      unsigned int start_percent, unsigned int end_percent)
++                      unsigned int start_percent, unsigned int end_percent,
++                      const char *cacert_file)
+ {
+         FetchStatus ret = FETCH_STATUS_FAIL;
+         CURLcode res;
+@@ -74,6 +75,13 @@ FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
+                 return ret;
+         }
+ 
++        if (cacert_file) {
++                res = curl_easy_setopt(curl, CURLOPT_CAINFO, cacert_file);
++                if (res != CURLE_OK) {
++                        goto bail;
++                }
++        }
++
+         if (stat(target, &st) == 0) {
+                 res = curl_easy_setopt(curl, CURLOPT_TIMECONDITION, CURL_TIMECOND_IFMODSINCE);
+                 if (res != CURLE_OK) {
+diff --git a/src/library/fetch.h b/src/library/fetch.h
+index 4cce5d1..836c7d7 100644
+--- a/src/library/fetch.h
++++ b/src/library/fetch.h
+@@ -29,7 +29,8 @@ typedef enum {
+  * @return A FetchStatus, indicating the operation taken
+  */
+ FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
+-                      unsigned int this_percent, unsigned int next_percent);
++                      unsigned int this_percent, unsigned int next_percent,
++                      const char *cacert_file);
+ 
+ /**
+  * Attempt to extract the given gzipped file
+diff --git a/src/main.c b/src/main.c
+index 8e6f158..ae69d47 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -280,6 +280,7 @@ static bool csv_mode = false;
+ static char *modified_stamp = NULL;
+ static gchar *mapping_file = NULL;
+ static gchar *output_file = NULL;
++static gchar *cacert_file = NULL;
+ 
+ static GOptionEntry _entries[] = {
+         { "not-patched", 'n', 0, G_OPTION_ARG_NONE, &hide_patched, "Hide patched/addressed CVEs", NULL },
+@@ -294,6 +295,7 @@ static GOptionEntry _entries[] = {
+         { "csv", 'c', 0, G_OPTION_ARG_NONE, &csv_mode, "Output CSV formatted data only", NULL },
+         { "mapping", 'M', 0, G_OPTION_ARG_STRING, &mapping_file, "Path to a mapping file", NULL},
+         { "output-file", 'o', 0, G_OPTION_ARG_STRING, &output_file, "Path to the output file (output plugin specific)", NULL},
++        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &cacert_file, "Path to the combined SSL certificates file (system default is used if not set)", NULL},
+         { .short_name = 0 }
+ };
+ 
+@@ -492,6 +494,7 @@ int main(int argc, char **argv)
+ 
+         quiet = csv_mode || !no_html;
+         self->output_file = output_file;
++        self->cacert_file = cacert_file;
+ 
+         if (!csv_mode && self->output_file) {
+                 quiet = false;
+@@ -530,7 +533,7 @@ int main(int argc, char **argv)
+                 if (status) {
+                         fprintf(stderr, "Update of db forced\n");
+                         cve_db_unlock();
+-                        if (!update_db(quiet, db_path->str)) {
++                        if (!update_db(quiet, db_path->str, self->cacert_file)) {
+                                 fprintf(stderr, "DB update failure\n");
+                                 goto cleanup;
+                         }
+diff --git a/src/update-main.c b/src/update-main.c
+index 2379cfa..c52d9d0 100644
+--- a/src/update-main.c
++++ b/src/update-main.c
+@@ -43,11 +43,13 @@ the Free Software Foundation; either version 2 of the License, or\n\
+ static gchar *nvds = NULL;
+ static bool _show_version = false;
+ static bool _quiet = false;
++static const char *_cacert_file = NULL;
+ 
+ static GOptionEntry _entries[] = {
+         { "nvd-dir", 'd', 0, G_OPTION_ARG_STRING, &nvds, "NVD directory in filesystem", NULL },
+         { "version", 'v', 0, G_OPTION_ARG_NONE, &_show_version, "Show version", NULL },
+         { "quiet", 'q', 0, G_OPTION_ARG_NONE, &_quiet, "Run silently", NULL },
++        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &_cacert_file, "Path to the combined SSL certificates file (system default is used if not set)", NULL},
+         { .short_name = 0 }
+ };
+ 
+@@ -88,7 +90,7 @@ int main(int argc, char **argv)
+                 goto end;
+         }
+ 
+-        if (update_db(_quiet, db_path->str)) {
++        if (update_db(_quiet, db_path->str, _cacert_file)) {
+                 ret = EXIT_SUCCESS;
+         } else {
+                 fprintf(stderr, "Failed to update database\n");
+diff --git a/src/update.c b/src/update.c
+index 070560a..8cb4a39 100644
+--- a/src/update.c
++++ b/src/update.c
+@@ -267,7 +267,8 @@ static inline void update_end(int fd, const char *update_fname, bool ok)
+ 
+ static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,
+                            bool db_exist, bool verbose,
+-                           unsigned int this_percent, unsigned int next_percent)
++                           unsigned int this_percent, unsigned int next_percent,
++                           const char *cacert_file)
+ {
+         const char nvd_uri[] = URI_PREFIX;
+         autofree(cve_string) *uri_meta = NULL;
+@@ -331,14 +332,14 @@ refetch:
+         }
+ 
+         /* Fetch NVD META file */
+-        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, this_percent, this_percent);
++        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, this_percent, this_percent, cacert_file);
+         if (st == FETCH_STATUS_FAIL) {
+                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str);
+                 return -1;
+         }
+ 
+         /* Fetch NVD XML file */
+-        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose, this_percent, next_percent);
++        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose, this_percent, next_percent, cacert_file);
+         switch (st) {
+         case FETCH_STATUS_FAIL:
+                 fprintf(stderr, "Failed to fetch %s\n", uri_data_gz->str);
+@@ -391,7 +392,7 @@ refetch:
+         return 0;
+ }
+ 
+-bool update_db(bool quiet, const char *db_file)
++bool update_db(bool quiet, const char *db_file, const char *cacert_file)
+ {
+         autofree(char) *db_dir = NULL;
+         autofree(CveDB) *cve_db = NULL;
+@@ -466,7 +467,8 @@ bool update_db(bool quiet, const char *db_file)
+                 if (!quiet)
+                         fprintf(stderr, "completed: %u%%\r", start_percent);
+                 rc = do_fetch_update(y, db_dir, cve_db, db_exist, !quiet,
+-                                     start_percent, end_percent);
++                                     start_percent, end_percent,
++                                     cacert_file);
+                 switch (rc) {
+                 case 0:
+                         if (!quiet)
+diff --git a/src/update.h b/src/update.h
+index b8e9911..ceea0c3 100644
+--- a/src/update.h
++++ b/src/update.h
+@@ -15,7 +15,7 @@ cve_string *get_db_path(const char *path);
+ 
+ int update_required(const char *db_file);
+ 
+-bool update_db(bool quiet, const char *db_file);
++bool update_db(bool quiet, const char *db_file, const char *cacert_file);
+ 
+ 
+ /*
+-- 
+2.1.4
+
-- 
2.1.4


