Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UL7ql-0003tv-31
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 09:06:19 +0100
Received: by mail-pd0-f176.google.com with SMTP id r11so1414012pdi.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 00:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=lbzZFw0VS+7RtSqRtRUIDHN6ZLZqhK29yYaxRrAvsVA=;
	b=esBjrczOU1COci4zs3x44s9oboUZK9eO0XKFdzjEB1tp8JSOD2kCpYfMb3RlG/Oowx
	mqs4+5iwBhBkWmoVuYwUxNPlThNpY6qzqSNuhy491nP7UMG8EPo1KWA1iYEeRkqpbnmA
	rSTL7R18Gq2YmAIgcoYxCM58ALP+f3icL40ta0aD3Ir+sWuWfNtfUkKhMG7wjqRpw4HI
	zDy1g4QJWWxr8z+D85SXiDENnLXdhJBgYr2gCiaUFCgMoaNG9SBWILg7QB26C0nYxnQJ
	caEN7+TICwsESBctVPuOMf92x1bEf7WFRSxMAsSNqzHJbjpsQjUdMMb1MHfPlIx+L9ca
	XyDg==
X-Received: by 10.66.164.41 with SMTP id yn9mr6695583pab.93.1364456953964;
	Thu, 28 Mar 2013 00:49:13 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id da4sm5809481pbb.34.2013.03.28.00.49.13
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 00:49:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2013 00:48:29 -0700
Message-Id: <ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1364456659.git.raj.khem@gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] systemd: Upgrade to 199
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2013 08:06:20 -0000

udevadm is now moved from /usr/bin to /bin so account for that
bash completions for udevadm should be packages with udev-utils
since thats where udevadm itself is, they were in systemd package
which is not correct location for it

Backport patches for readahead fixes on spinning disks
and to tackle error reported on missing /etc/sysctl.conf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0002-readahead-chunk-on-spinning-media.patch   |  142 ++++++++++++++++++++
 .../systemd/systemd/0003-readahead-cleanups.patch  |   86 ++++++++++++
 ...ctl-Handle-missing-etc-sysctl.conf-proper.patch |   33 +++++
 .../systemd/{systemd_198.bb => systemd_199.bb}     |   11 +-
 4 files changed, 268 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
 rename meta/recipes-core/systemd/{systemd_198.bb => systemd_199.bb} (95%)

diff --git a/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch b/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
new file mode 100644
index 0000000..d57a01c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
@@ -0,0 +1,142 @@
+Upstream-Status: Backport
+
+-Khem 2013/03/28
+
+From 94243ef299425d6c7089a7a05c48c9bb8f6cf3da Mon Sep 17 00:00:00 2001
+From: Auke Kok <auke-jan.h.kok@intel.com>
+Date: Fri, 22 Mar 2013 15:09:45 -0700
+Subject: [PATCH 02/17] readahead: chunk on spinning media
+
+Readahead has all sorts of bad side effects depending on your
+storage media. On rotating disks, it may be degrading startup
+performance if enough requests are queued spanning linearly
+over all blocks early at boot, and mount, blkid and friends
+want to insert reads to the start of these block devices after.
+
+The end result is that on spinning disks with ext3/4 that udev
+and mounts take a very long time, and nothing really happens until
+readahead is completely finished.
+
+This has the net effect that the CPU is almost entirely idle
+for the entire period that readahead is working. We could have
+finished starting up quite a lot of services in this time if
+we were smarter at how we do readahead.
+
+This patch sorts all requests into 2 second "chunks" and sub-sorts
+each chunk by block. This adds a single cross-drive seek per "chunk"
+but has the benefit that we will have a lot of the blocks we need
+early on in the boot sequence loaded into memory faster.
+
+For a comparison of how before/after bootcharts look (ext4 on a
+mobile 5400rpm 250GB drive) please look at:
+
+    http://foo-projects.org/~sofar/blocked-tests/
+
+There are bootcharts in the "before" and "after" folders where you
+should be able to see that many low-level services finish 5-7
+seconds earlier with the patch applied (after).
+---
+ Makefile.am                       |    2 +-
+ src/readahead/readahead-collect.c |   28 +++++++++++++++++++++++++---
+ 2 files changed, 26 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 37c1cc2..5861976 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES = \
+ systemd_readahead_LDADD = \
+ 	libsystemd-shared.la \
+ 	libsystemd-daemon.la \
+-	libudev.la
++	libudev.la -lm
+ 
+ dist_doc_DATA += \
+ 	src/readahead/sd-readahead.c \
+diff --git a/src/readahead/readahead-collect.c b/src/readahead/readahead-collect.c
+index 5d07f47..5d22949 100644
+--- a/src/readahead/readahead-collect.c
++++ b/src/readahead/readahead-collect.c
+@@ -42,6 +42,7 @@
+ #include <sys/vfs.h>
+ #include <getopt.h>
+ #include <sys/inotify.h>
++#include <math.h>
+ 
+ #ifdef HAVE_FANOTIFY_INIT
+ #include <sys/fanotify.h>
+@@ -67,6 +68,7 @@
+  */
+ 
+ static ReadaheadShared *shared = NULL;
++static struct timespec starttime;
+ 
+ /* Avoid collisions with the NULL pointer */
+ #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)
+@@ -205,6 +207,7 @@ static unsigned long fd_first_block(int fd) {
+ struct item {
+         const char *path;
+         unsigned long block;
++        unsigned long bin;
+ };
+ 
+ static int qsort_compare(const void *a, const void *b) {
+@@ -213,6 +216,13 @@ static int qsort_compare(const void *a, const void *b) {
+         i = a;
+         j = b;
+ 
++        /* sort by bin first */
++        if (i->bin < j->bin)
++                return -1;
++        if (i->bin > j->bin)
++                return 1;
++
++        /* then sort by sector */
+         if (i->block < j->block)
+                 return -1;
+         if (i->block > j->block)
+@@ -250,6 +260,8 @@ static int collect(const char *root) {
+                 goto finish;
+         }
+ 
++        clock_gettime(CLOCK_MONOTONIC, &starttime);
++
+         /* If there's no pack file yet we lower the kernel readahead
+          * so that mincore() is accurate. If there is a pack file
+          * already we assume it is accurate enough so that kernel
+@@ -447,10 +459,21 @@ static int collect(const char *root) {
+                                         free(p);
+                                 else {
+                                         unsigned long ul;
++                                        struct timespec ts;
++                                        struct item *entry;
++
++                                        entry = new0(struct item, 1);
+ 
+                                         ul = fd_first_block(m->fd);
+ 
+-                                        if ((k = hashmap_put(files, p, SECTOR_TO_PTR(ul))) < 0) {
++                                        clock_gettime(CLOCK_MONOTONIC, &ts);
++
++                                        entry->block = ul;
++                                        entry->path = strdup(p);
++                                        entry->bin = round((ts.tv_sec - starttime.tv_sec +
++                                                     ((ts.tv_nsec - starttime.tv_nsec) / 1000000000.0)) / 2.0);
++
++                                        if ((k = hashmap_put(files, p, entry)) < 0) {
+                                                 log_warning("set_put() failed: %s", strerror(-k));
+                                                 free(p);
+                                         }
+@@ -518,8 +541,7 @@ done:
+ 
+                 j = ordered;
+                 HASHMAP_FOREACH_KEY(q, p, files, i) {
+-                        j->path = p;
+-                        j->block = PTR_TO_SECTOR(q);
++                        memcpy(j, q, sizeof(struct item));
+                         j++;
+                 }
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch b/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
new file mode 100644
index 0000000..e0b68df
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
@@ -0,0 +1,86 @@
+Upstream-Status: Backport
+
+-Khem 2013/03/28
+
+From b0640287f784a320661f7206c9ade07b99003fd5 Mon Sep 17 00:00:00 2001
+From: Auke Kok <auke-jan.h.kok@intel.com>
+Date: Tue, 26 Mar 2013 11:13:47 -0700
+Subject: [PATCH 03/17] readahead: cleanups
+
+- check for OOM
+- no need to use floats and round()
+---
+ Makefile.am                       |    2 +-
+ src/readahead/readahead-collect.c |   20 ++++++++++++++------
+ 2 files changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5861976..37c1cc2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES = \
+ systemd_readahead_LDADD = \
+ 	libsystemd-shared.la \
+ 	libsystemd-daemon.la \
+-	libudev.la -lm
++	libudev.la
+ 
+ dist_doc_DATA += \
+ 	src/readahead/sd-readahead.c \
+diff --git a/src/readahead/readahead-collect.c b/src/readahead/readahead-collect.c
+index 5d22949..e2fd8df 100644
+--- a/src/readahead/readahead-collect.c
++++ b/src/readahead/readahead-collect.c
+@@ -68,7 +68,7 @@
+  */
+ 
+ static ReadaheadShared *shared = NULL;
+-static struct timespec starttime;
++static usec_t starttime;
+ 
+ /* Avoid collisions with the NULL pointer */
+ #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)
+@@ -260,7 +260,7 @@ static int collect(const char *root) {
+                 goto finish;
+         }
+ 
+-        clock_gettime(CLOCK_MONOTONIC, &starttime);
++        starttime = now(CLOCK_MONOTONIC);
+ 
+         /* If there's no pack file yet we lower the kernel readahead
+          * so that mincore() is accurate. If there is a pack file
+@@ -459,19 +459,27 @@ static int collect(const char *root) {
+                                         free(p);
+                                 else {
+                                         unsigned long ul;
+-                                        struct timespec ts;
++                                        usec_t entrytime;
+                                         struct item *entry;
+ 
+                                         entry = new0(struct item, 1);
++                                        if (!entry) {
++                                                r = log_oom();
++                                                goto finish;
++                                        }
+ 
+                                         ul = fd_first_block(m->fd);
+ 
+-                                        clock_gettime(CLOCK_MONOTONIC, &ts);
++                                        entrytime = now(CLOCK_MONOTONIC);
+ 
+                                         entry->block = ul;
+                                         entry->path = strdup(p);
+-                                        entry->bin = round((ts.tv_sec - starttime.tv_sec +
+-                                                     ((ts.tv_nsec - starttime.tv_nsec) / 1000000000.0)) / 2.0);
++                                        if (!entry->path) {
++                                                free(entry);
++                                                r = log_oom();
++                                                goto finish;
++                                        }
++                                        entry->bin = (entrytime - starttime) / 2000000;
+ 
+                                         if ((k = hashmap_put(files, p, entry)) < 0) {
+                                                 log_warning("set_put() failed: %s", strerror(-k));
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch b/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
new file mode 100644
index 0000000..f2c8e02
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Backport
+
+-Khem 2013/03/28
+
+From 6f6fad96addf6b00b55c98cc0d0d8026b0c1e7ca Mon Sep 17 00:00:00 2001
+From: Eelco Dolstra <eelco.dolstra@logicblox.com>
+Date: Wed, 27 Mar 2013 13:41:59 +0100
+Subject: [PATCH 13/17] systemd-sysctl: Handle missing /etc/sysctl.conf
+ properly
+
+Since fabe5c0e5fce730aa66e10a9c4f9fdd443d7aeda, systemd-sysctl returns
+a non-zero exit code if /etc/sysctl.conf does not exist, due to a
+broken ENOENT check.
+---
+ src/sysctl/sysctl.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sysctl/sysctl.c b/src/sysctl/sysctl.c
+index 2d43660..79f3f77 100644
+--- a/src/sysctl/sysctl.c
++++ b/src/sysctl/sysctl.c
+@@ -125,7 +125,7 @@ static int parse_file(Hashmap *sysctl_options, const char *path, bool ignore_eno
+ 
+         r = search_and_fopen_nulstr(path, "re", conf_file_dirs, &f);
+         if (r < 0) {
+-                if (ignore_enoent && errno == -ENOENT)
++                if (ignore_enoent && r == -ENOENT)
+                         return 0;
+ 
+                 log_error("Failed to open file '%s', ignoring: %s", path, strerror(-r));
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/systemd/systemd_198.bb b/meta/recipes-core/systemd/systemd_199.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd_198.bb
rename to meta/recipes-core/systemd/systemd_199.bb
index 6a8db51..74b14af 100644
--- a/meta/recipes-core/systemd/systemd_198.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -23,10 +23,13 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://var-run.conf \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
+           file://0002-readahead-chunk-on-spinning-media.patch \
+           file://0003-readahead-cleanups.patch \
+           file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch \
            file://init \
           "
-SRC_URI[md5sum] = "26a75e2a310f8c1c1ea9ec26ddb171c5"
-SRC_URI[sha256sum] = "444492355e5ff0ad99e0691ecaff1081ee8d45901580f47ba8b74e56107c71bf"
+SRC_URI[md5sum] = "4bb13f84ce211e93f0141774a90a2322"
+SRC_URI[sha256sum] = "8c4462a04f3ecf7f083782e5e0687913b1d33c6444bf20fa2f31df9222965fed"
 
 UCLIBCPATCHES = ""
 UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
@@ -114,7 +117,7 @@ PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
 
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "-r lock"
+GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
 
 FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
 
@@ -224,7 +227,7 @@ FILES_udev += "${base_sbindir}/udevd \
 FILES_udev-consolekit += "/lib/ConsoleKit"
 RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 
-FILES_udev-utils = "${bindir}/udevadm"
+FILES_udev-utils = "${base_bindir}/udevadm ${datadir}/bash-completion/completions/udevadm"
 
 FILES_udev-hwdb = "${base_libdir}/udev/hwdb.d"
 
-- 
1.7.9.5



