Return-Path: <lnowak.tyco@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 29D4471999
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 08:50:28 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id p100so4072321lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=yeSyVzBMlLwNYxPQ5deO7yjrKEtfcPkf7bktlF8Q+SE=;
	b=VBTV6ruvfN5XjQRlHiHaHG3KQQUASWGgY0i59efwfiXNQCt0L+pynec+Xrx61Ccsqm
	7HakB+0ePHX6+2qhzNUh8Gp2fUr517aHUSoDhbioILuxo8xVirlfdX6oHm1Y+zUV+Ss+
	9mCjyIwU/HY498geEdYc57cemtosPNejYbCwSTerQGlo3elRaq49vKSKV0RnhGRU68xk
	xzz1UXRZznoTSTmfBsft6FzpXBx7r9JlqD9Qf3mAFlZ5NqD69ocg/9mfyEXWQ6ANRQiq
	i+d8OzQY+jJrOY94/nTaYT7Eeen3CWMM4DG46F187MzOi6ePTr1VL8RBVxp/ad7+6XLs
	FgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=yeSyVzBMlLwNYxPQ5deO7yjrKEtfcPkf7bktlF8Q+SE=;
	b=aPvGSyYIAK9sHFoMhwip4sQe3T4dBeD1xdwTQRQiUp7mz6+Onlw2mqGagANpUViVFi
	AQGsRjz6tXudvuib48lD5GMh4L3+J/02KX11LzEekEvkhFuTIvacPmMu58RGs6JjbaSM
	FgWheKtIyTiMYorUhTRd/fCk9Wpt6fumkqWDAcCaWHuKjg6kgTZSrOjzgMSfNAeU1ngJ
	2MJmX15wHE5yTdHXd1Ng5fCUXOTl9GHIy144gGPB6TyfHYBlRJ6PaWl6KkbCPUvzkCyp
	NHmtQ3owP3nYNVPuss/ogGj3dGOj7pf2+BbnMxYKHbrc3qciWdEvaxFps7wNM35862Ky
	fQXg==
X-Gm-Message-State: ABUngvfb97hsOeOmIPQlLZW6tG+cgseJCsST1XFtONHW7kc+lJmLxsEToNv5XAAf+FMq/Q==
X-Received: by 10.25.40.74 with SMTP id o71mr20119072lfo.183.1477990228620;
	Tue, 01 Nov 2016 01:50:28 -0700 (PDT)
Received: from [10.20.30.24] (159-205-99-3.adsl.inetia.pl. [159.205.99.3])
	by smtp.gmail.com with ESMTPSA id
	e94sm1571624lji.40.2016.11.01.01.50.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Nov 2016 01:50:27 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
From: Lukasz Nowak <lnowak.tyco@gmail.com>
Message-ID: <c64cf308-d847-eac0-a2f7-bc8e686c2262@gmail.com>
Date: Tue, 1 Nov 2016 09:50:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
Subject: [PATCH] connman: fix bad file descriptor initialisation
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
X-List-Received-Date: Tue, 01 Nov 2016 08:50:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Lukasz Nowak <lnowak@tycoint.com>

Import a patch from upstream, which fixes a connman daemon freeze
under certain conditions (multiple active interfaces, no r/w storage).

Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
---
 ...ts-Fix-bad-file-descriptor-initialisation.patch | 102 +++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.33.bb  |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch

diff --git a/meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch b/meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch
new file mode 100644
index 0000000..c545811
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch
@@ -0,0 +1,102 @@
+From c7f4151fb053b0d0691d8f10d7e3690265d28889 Mon Sep 17 00:00:00 2001
+From: Lukasz Nowak <lnowak@tycoint.com>
+Date: Wed, 26 Oct 2016 18:13:02 +0100
+Subject: [PATCH] stats: Fix bad file descriptor initialisation
+
+Stats file code initialises its file descriptor field to 0.  But 0 is
+a valid fd value. -1 should be used instead.  This causes problems
+when an error happens before a stats file is open (e.g. mkdir
+fails). The clean-up procedure, stats_free() calls close(fd).  When fd
+is 0, this first closes stdin, and then any files/sockets which
+received fd=0, re-used by the OS.
+
+Fixed several instances of bad file descriptor field handling, in case
+of errors.
+
+The bug results with connman freezing if there is no read/write storage
+directory available, and there are multiple active interfaces
+(fd=0 gets re-used for sockets in that case).
+
+The patch was imported from the Connman git repository
+(git://git.kernel.org/pub/scm/network/connman) as of commit id
+c7f4151fb053b0d0691d8f10d7e3690265d28889. 
+
+Upstream-Status: Accepted
+Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
+---
+ src/stats.c | 15 +++++++++++++++
+ src/util.c  |  4 ++--
+ 2 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/src/stats.c b/src/stats.c
+index 26343b1..c3ca738 100644
+--- a/src/stats.c
++++ b/src/stats.c
+@@ -378,6 +378,7 @@ static int stats_file_setup(struct stats_file *file)
+ 			strerror(errno), file->name);
+ 
+ 		TFR(close(file->fd));
++		file->fd = -1;
+ 		g_free(file->name);
+ 		file->name = NULL;
+ 
+@@ -393,6 +394,7 @@ static int stats_file_setup(struct stats_file *file)
+ 	err = stats_file_remap(file, size);
+ 	if (err < 0) {
+ 		TFR(close(file->fd));
++		file->fd = -1;
+ 		g_free(file->name);
+ 		file->name = NULL;
+ 
+@@ -649,6 +651,13 @@ static int stats_file_history_update(struct stats_file *data_file)
+ 	bzero(history_file, sizeof(struct stats_file));
+ 	bzero(temp_file, sizeof(struct stats_file));
+ 
++	/*
++	 * 0 is a valid file descriptor - fd needs to be initialized
++	 * to -1 to handle errors correctly
++	 */
++	history_file->fd = -1;
++	temp_file->fd = -1;
++
+ 	err = stats_open(history_file, data_file->history_name);
+ 	if (err < 0)
+ 		return err;
+@@ -682,6 +691,12 @@ int __connman_stats_service_register(struct connman_service *service)
+ 		if (!file)
+ 			return -ENOMEM;
+ 
++		/*
++		 * 0 is a valid file descriptor - fd needs to be initialized
++		 * to -1 to handle errors correctly
++		 */
++		file->fd = -1;
++
+ 		g_hash_table_insert(stats_hash, service, file);
+ 	} else {
+ 		return -EALREADY;
+diff --git a/src/util.c b/src/util.c
+index e6532c8..732d451 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -63,7 +63,7 @@ int __connman_util_init(void)
+ {
+ 	int r = 0;
+ 
+-	if (f > 0)
++	if (f >= 0)
+ 		return 0;
+ 
+ 	f = open(URANDOM, O_RDONLY);
+@@ -86,7 +86,7 @@ int __connman_util_init(void)
+ 
+ void __connman_util_cleanup(void)
+ {
+-	if (f > 0)
++	if (f >= 0)
+ 		close(f);
+ 
+ 	f = -1;
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/connman/connman_1.33.bb b/meta/recipes-connectivity/connman/connman_1.33.bb
index 6ea1a08..56a0a0f 100644
--- a/meta/recipes-connectivity/connman/connman_1.33.bb
+++ b/meta/recipes-connectivity/connman/connman_1.33.bb
@@ -5,6 +5,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://connman \
             file://no-version-scripts.patch \
             file://includes.patch \
+            file://0003-stats-Fix-bad-file-descriptor-initialisation.patch \
             "
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-- 
2.7.4


