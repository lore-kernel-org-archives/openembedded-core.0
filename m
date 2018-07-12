Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36CBA7600C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 06:08:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6C68hii014611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 23:08:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 11 Jul 2018 23:08:42 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2018 14:12:02 +0800
Message-ID: <9d5f054e72ef373953afa90126f9b0c6417febec.1531375710.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1531375709.git.Qi.Chen@windriver.com>
References: <cover.1531375709.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] systemd: fix segment fault on musl
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
X-List-Received-Date: Thu, 12 Jul 2018 06:08:42 -0000
Content-Type: text/plain

There are two strerror_r, XSI-compliant and GNU-specific.

       int strerror_r(int errnum, char *buf, size_t buflen);
                   /* XSI-compliant */

       char *strerror_r(int errnum, char *buf, size_t buflen);
                   /* GNU-specific */

systemd is using the GNU-specific strerror_r as it only cares about glibc.

On musl, strerror_r is implementing as XSI-compliant. So we will meet
segment fault in some cases.

This segment fault is discovered by the systemd.py runtime test case in
oeqa on qemuarm target. The command is "systemd list-unit-files". On qemuarm,
this command times out and the error handling codes start to run, revealing
this problem.

Add a patch to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-XSI-compliant-strerror_r-from-GNU-specif.patch | 62 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch

diff --git a/meta/recipes-core/systemd/systemd/0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
new file mode 100644
index 0000000..5c78cab
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -0,0 +1,62 @@
+From dd53dc9b9542cbd2c39a39096941dfed70d06506 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 10 Jul 2018 15:40:17 +0800
+Subject: [PATCH 20/20] distinguish XSI-compliant strerror_r from GNU-specifi
+ strerror_r
+
+XSI-compliant strerror_r and GNU-specifi strerror_r are different.
+
+       int strerror_r(int errnum, char *buf, size_t buflen);
+                   /* XSI-compliant */
+
+       char *strerror_r(int errnum, char *buf, size_t buflen);
+                   /* GNU-specific */
+
+We need to distinguish between them. Otherwise, we'll get an int value
+assigned to (char *) variable, resulting in segment fault.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/journal/journal-send.c        | 5 +++++
+ src/libsystemd/sd-bus/bus-error.c | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
+index 65bcbcd2e..aef80dd8f 100644
+--- a/src/journal/journal-send.c
++++ b/src/journal/journal-send.c
+@@ -337,7 +337,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
+                 char* j;
+ 
+                 errno = 0;
++#ifndef __GLIBC__
++                strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);
++                j = buffer + 8 + k;
++#else
+                 j = strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);
++#endif
+                 if (errno == 0) {
+                         char error[STRLEN("ERRNO=") + DECIMAL_STR_MAX(int) + 1];
+ 
+diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
+index ec359ac13..d2aa86cea 100644
+--- a/src/libsystemd/sd-bus/bus-error.c
++++ b/src/libsystemd/sd-bus/bus-error.c
+@@ -362,7 +362,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
+                         return;
+ 
+                 errno = 0;
++#ifndef __GLIBC__
++                strerror_r(error, m, k);
++                x = m;
++#else
+                 x = strerror_r(error, m, k);
++#endif
+                 if (errno == ERANGE || strlen(x) >= k - 1) {
+                         free(m);
+                         k *= 2;
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 4b7ecc5..99fbfc1 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -50,6 +50,7 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
                file://0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
                file://0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
+               file://0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
                "
 
 # Workaround undefined reference to `__stack_chk_fail_local' on qemux86 and qemuppc for musl
-- 
1.9.1


