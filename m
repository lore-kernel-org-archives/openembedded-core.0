Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D28B605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 12:05:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so5628082wma.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 05:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8D7kfLz8K4Oh7GIhX0bSe+wTFekapXkfxeCF4waGi70=;
	b=M6/KK0aT09Hw7mUpYymObCw9HWABkcqyLDM+y4D/VNMafS2NxwkeNLuIaZPOtlzS3B
	Gap+efwvqoYZR1saXUXSbyV6zJco5Wpprtvoo7dqoxPk4aWlFxUa/zf7QAhM09+xomyl
	osJfxSq+zJ+MOIW1pSbeMWQGl3VSW/YwRVGtVHkR/Edo8jZuxoME+Fx8wwl/FJrevNJG
	G8PXWgZq/IUwacYDLG9tdUZpFyqA1LJZ/aESCS1eRSJThoS11+5GDKVt0BGKa05HOJA9
	otRk6kza9CIIw3IYPEzT+4mddr4nv4ku0moXyh8bWKrHGJQbIwoeP/wiGITXW4p2JLXT
	I7CQ==
X-Gm-Message-State: AA6/9RlHabelOfeqTX2bSoliNRbBmJAEo5xYPGjEqOLdwUPz3i1Uqzwu2uq4WmuPSdlCaw==
X-Received: by 10.194.125.208 with SMTP id ms16mr26928299wjb.163.1475064348617;
	Wed, 28 Sep 2016 05:05:48 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 123sm8479804wmj.5.2016.09.28.05.05.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Sep 2016 05:05:47 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 13:05:45 +0100
Message-Id: <20160928120545.28679-2-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160928120545.28679-1-git@andred.net>
References: <20160926154228.30567-1-git@andred.net>
	<20160928120545.28679-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] cve-check-tool: report progress when downloading CVE database
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
X-List-Received-Date: Wed, 28 Sep 2016 12:05:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We add a patch to report the progress, and at the same time
inform bitbake that progress can be extracted via the simple
'percent' progress handler.

Signed-off-by: André Draszik <git@andred.net>
---
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |   2 +
 ...ogress-in-percent-when-downloading-CVE-db.patch | 135 +++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
index 5bb22d1..1baadea 100644
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e8c1458438ead3c34974bc0be3a03ed6"
 
 SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
            file://check-for-malloc_trim-before-using-it.patch \
+           file://0001-print-progress-in-percent-when-downloading-CVE-db.patch \
           "
 
 SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
@@ -48,5 +49,6 @@ do_populate_cve_db() {
 
 addtask populate_cve_db after do_populate_sysroot
 do_populate_cve_db[nostamp] = "1"
+do_populate_cve_db[progress] = "percent"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch b/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
new file mode 100644
index 0000000..0510e3a
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
@@ -0,0 +1,135 @@
+From e9ed26cde63f8ca7607a010a518329339f8c02d3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Mon, 26 Sep 2016 12:12:41 +0100
+Subject: [PATCH] print progress in percent when downloading CVE db
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+Signed-off-by: André Draszik <git@andred.net>
+---
+ src/library/fetch.c | 28 +++++++++++++++++++++++++++-
+ src/library/fetch.h |  3 ++-
+ src/update.c        | 16 ++++++++++++----
+ 3 files changed, 41 insertions(+), 6 deletions(-)
+
+diff --git a/src/library/fetch.c b/src/library/fetch.c
+index 06d4b30..0fe6d76 100644
+--- a/src/library/fetch.c
++++ b/src/library/fetch.c
+@@ -37,13 +37,37 @@ static size_t write_func(void *ptr, size_t size, size_t nmemb, struct fetch_t *f
+         return fwrite(ptr, size, nmemb, f->f);
+ }
+ 
+-FetchStatus fetch_uri(const char *uri, const char *target, bool verbose)
++struct percent_t {
++        unsigned int start;
++        unsigned int end;
++};
++
++static int progress_callback_new(void *ptr, curl_off_t dltotal, curl_off_t dlnow, curl_off_t ultotal, curl_off_t ulnow)
++{
++        (void) ultotal;
++        (void) ulnow;
++
++        struct percent_t *percent = (struct percent_t *) ptr;
++
++        if (dltotal && percent && percent->end >= percent->start) {
++                unsigned int diff = percent->end - percent->start;
++                if (diff) {
++                        fprintf(stderr,"completed: "CURL_FORMAT_OFF_T"%%\r", percent->start + (diff * dlnow / dltotal));
++                }
++        }
++
++        return 0;
++}
++
++FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
++                      unsigned int start_percent, unsigned int end_percent)
+ {
+         FetchStatus ret = FETCH_STATUS_FAIL;
+         CURLcode res;
+         struct stat st;
+         CURL *curl = NULL;
+         struct fetch_t *f = NULL;
++        struct percent_t percent = { .start = start_percent, .end = end_percent };
+ 
+         curl = curl_easy_init();
+         if (!curl) {
+@@ -67,6 +91,8 @@ FetchStatus fetch_uri(const char *uri, const char *target, bool verbose)
+         }
+         if (verbose) {
+                 (void)curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0L);
++                (void)curl_easy_setopt(curl, CURLOPT_XFERINFODATA, &percent);
++                (void)curl_easy_setopt(curl, CURLOPT_XFERINFOFUNCTION, progress_callback_new);
+         }
+         res = curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, (curl_write_callback)write_func);
+         if (res != CURLE_OK) {
+diff --git a/src/library/fetch.h b/src/library/fetch.h
+index 70c3779..4cce5d1 100644
+--- a/src/library/fetch.h
++++ b/src/library/fetch.h
+@@ -28,7 +28,8 @@ typedef enum {
+  * @param verbose Whether to be verbose
+  * @return A FetchStatus, indicating the operation taken
+  */
+-FetchStatus fetch_uri(const char *uri, const char *target, bool verbose);
++FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
++                      unsigned int this_percent, unsigned int next_percent);
+ 
+ /**
+  * Attempt to extract the given gzipped file
+diff --git a/src/update.c b/src/update.c
+index 30fbe96..eaeeefd 100644
+--- a/src/update.c
++++ b/src/update.c
+@@ -266,7 +266,8 @@ static inline void update_end(int fd, const char *update_fname, bool ok)
+ }
+ 
+ static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,
+-                           bool db_exist, bool verbose)
++                           bool db_exist, bool verbose,
++                           unsigned int this_percent, unsigned int next_percent)
+ {
+         const char nvd_uri[] = URI_PREFIX;
+         autofree(cve_string) *uri_meta = NULL;
+@@ -330,14 +331,14 @@ refetch:
+         }
+ 
+         /* Fetch NVD META file */
+-        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose);
++        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, this_percent, this_percent);
+         if (st == FETCH_STATUS_FAIL) {
+                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str);
+                 return -1;
+         }
+ 
+         /* Fetch NVD XML file */
+-        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose);
++        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose, this_percent, next_percent);
+         switch (st) {
+         case FETCH_STATUS_FAIL:
+                 fprintf(stderr, "Failed to fetch %s\n", uri_data_gz->str);
+@@ -459,10 +460,17 @@ bool update_db(bool quiet, const char *db_file)
+         for (int i = YEAR_START; i <= year+1; i++) {
+                 int y = i > year ? -1 : i;
+                 int rc;
++                unsigned int start_percent = ((i+0 - YEAR_START) * 100) / (year+2 - YEAR_START);
++                unsigned int end_percent = ((i+1 - YEAR_START) * 100) / (year+2 - YEAR_START);
+ 
+-                rc = do_fetch_update(y, db_dir, cve_db, db_exist, !quiet);
++                if (!quiet)
++                        fprintf(stderr, "completed: %u%%\r", start_percent);
++                rc = do_fetch_update(y, db_dir, cve_db, db_exist, !quiet,
++                                     start_percent, end_percent);
+                 switch (rc) {
+                 case 0:
++                        if (!quiet)
++                                fprintf(stderr,"completed: %u%%\r", end_percent);
+                         continue;
+                 case ENOMEM:
+                         goto oom;
+-- 
+2.9.3
+
-- 
2.9.3


