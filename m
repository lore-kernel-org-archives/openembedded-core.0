Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EF4C83F0C
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:29:08 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.14814.1751642946171501604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uAb089F6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74b27c1481bso680711b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751642945; x=1752247745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+yd7RTymY7fUKiKH4iAjuelM8uEBhKCgqcPdTEzAVs=;
        b=uAb089F6BsO6VZtF0AFTKdewIYOJPnl+sQRqv4oqQR/g+QO0aHL1PFA+8AQJw0nLH5
         TDOb9Vyh5qL/jUQrujUC2+GkOwGF0EFagWuD64TpXYjcs/nbuuC/WT85KnUWBpndvODg
         JPo4+BU/Bymk6MYggJZXTpr/JAUt5tnNGrOLxuMfkw0AbDndGCRwBEwqtVQlW7ymaM+9
         8GH1IxzTbUBe4x1xD+eCY5VOEKSHTHCik8bbe5vDkyf+lJ/XqxJp7im+JFRSQsA3y4JX
         ScfGV8mFLVUhF9LYn+4A3TJGvHT2WYc1bqNcD6lfBP+3siwuDBYO6IgRKSr2D2FC+nG7
         y25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642945; x=1752247745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+yd7RTymY7fUKiKH4iAjuelM8uEBhKCgqcPdTEzAVs=;
        b=VYl+YfhCaj7L7fL65xHbM4geJfXisZy2Esbe9CCwP661vU16wvd6KnN/8V+tFFYh8T
         wT5oBaF3VsmFISGiaojCek1KHafwDujWIDKynNR9MtmDp3olUqvkSPV3vCEHcJ+oACND
         WX9cGEupl3buez7h7sr2jKt7hLJpZfCTR7DOqbROtvO2dnCePPvRAkZptJOBXT74zPVf
         0xTrVp46OlJl7hSukSeS5xVex6OiQ6uJ5AdTNmplHKvtNv3Zyqo31m2tZ7ZNomYY8Ev6
         8XDulgTHCGPimhzoI5nqZC9UKm8RtLJm85XTSd+sJvb1eCGuie9yFl5OhQgyGIXbOtvl
         jtkA==
X-Gm-Message-State: AOJu0YwnPspJz24UyLfvkmZ449Zu5z6+Se5qqIZp8/AOcrNI330A90zv
	mEAwU85FwC9f6dRSwsVk3VSfCOrltxD5nGcyHIiyB3hEnVQNa+wwCSGUZAQKffcGh0CF9C6kE1c
	r4r+x
X-Gm-Gg: ASbGncu8B7R2IYVwBEg+QT0RPabmAboZ9ZHDwAxgPjIRXL1wJtk4qI07GOeaHzRXub3
	ibIb08Zr2OMQqbxF4OuEcPfiJg6xSAOe+y1UqH0MpgMtnGMYr7ACFq6bfLDo381eXHC+l8J+tQz
	5L/twXbSInfE4PZrjFnrfHyQcoYM5zBJiSeuiVxkJuHtAVxzxG8mKNLhTaQYdx4g9WjjmKQaghi
	wzf2aQAb77JOQtlAlIIu5PutrSzyxZDsKneV2wARctfcUaTuiV5bL7V2TH/lv9iOjGCBFLOreQh
	RrWLIDH8Vhqv7Xm2fbOxM0mP1ufEXWwzLXxd3zBAlAxgXx3ZzlNPBA==
X-Google-Smtp-Source: AGHT+IHwHnWaWsT8jdEwTDKV4A4NSyZUe1+y6cLuM6ORbPXa0Napd2zGvsOsoNxxIGmXdkoZ4DSNNQ==
X-Received: by 2002:a05:6a20:1591:b0:21f:4ecc:11ab with SMTP id adf61e73a8af0-225be6e76d6mr4695204637.9.1751642944902;
        Fri, 04 Jul 2025 08:29:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a1ca0sm2424232b3a.138.2025.07.04.08.29.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:29:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] systemd: backport patches to fix CVE-2025-4598
Date: Fri,  4 Jul 2025 08:28:48 -0700
Message-ID: <a2e75ca4fa01d5005906fb88d28d52ea951def00.1751641924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641924.git.steve@sakoman.com>
References: <cover.1751641924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219941

From: Chen Qi <Qi.Chen@windriver.com>

Patch 0003 is the actual patch to fix CVE.

Patch 0002 is a preparation patch which systemd upstream uses for
all actively maintained branches in preparation for patch 0003.

Patch 0001 is a bug fix patch and is needed to avoid conflict introduced
by patch 0002. Note that patch 0002 claims itself to be of no functional
change, so this patch 0001 is really needed for patch 0002.

Patch 0004 is a compilation fix patch which adds a macro needed by
previous 0002 patch.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd/CVE-2025-4598-0001.patch  |  92 +++++++++++
 .../systemd/systemd/CVE-2025-4598-0002.patch  | 106 +++++++++++++
 .../systemd/systemd/CVE-2025-4598-0003.patch  | 144 ++++++++++++++++++
 .../systemd/systemd/CVE-2025-4598-0004.patch  |  36 +++++
 meta/recipes-core/systemd/systemd_250.14.bb   |   4 +
 5 files changed, 382 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0001.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0002.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0004.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0001.patch b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0001.patch
new file mode 100644
index 0000000000..cf27acafe9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0001.patch
@@ -0,0 +1,92 @@
+From 2108812a76bd078a2bbd7583308ff18bf01f2383 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 29 Apr 2025 14:47:59 +0200
+Subject: [PATCH 1/3] coredump: restore compatibility with older patterns
+
+This was broken in f45b8015513d38ee5f7cc361db9c5b88c9aae704. Unfortunately
+the review does not talk about backward compatibility at all. There are
+two places where it matters:
+- During upgrades, the replacement of kernel.core_pattern is asynchronous.
+  For example, during rpm upgrades, it would be updated a post-transaction
+  file trigger. In other scenarios, the update might only happen after
+  reboot. We have a potentially long window where the old pattern is in
+  place. We need to capture coredumps during upgrades too.
+- With --backtrace. The interface of --backtrace, in hindsight, is not
+  great. But there are users of --backtrace which were written to use
+  a specific set of arguments, and we can't just break compatiblity.
+  One example is systemd-coredump-python, but there are also reports of
+  users using --backtrace to generate coredump logs.
+
+Thus, we require the original set of args, and will use the additional args if
+found.
+
+A test is added to verify that --backtrace works with and without the optional
+args.
+
+(cherry picked from commit ded0aac389e647d35bce7ec4a48e718d77c0435b)
+(cherry picked from commit f9b8b75c11bba9b63096904be98cc529c304eb97)
+(cherry picked from commit 385a33b043406ad79a7207f3906c3b15192a3333)
+(cherry picked from commit c6f79626b6d175c6a5b62b8c5d957a83eb882301)
+(cherry picked from commit 9f02346d50e33c24acf879ce4dd5937d56473325)
+(cherry picked from commit ac0aa5d1fdc21db1ef035fce562cb6fc8602b544)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/cadd1b1a1f39fd13b1115a10f563017201d7b56a]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/coredump/coredump.c | 21 ++++++++++++++-------
+ 1 file changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index 79280ab986..d598f6f59a 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -84,8 +84,12 @@ enum {
+         META_ARGV_SIGNAL,       /* %s: number of signal causing dump */
+         META_ARGV_TIMESTAMP,    /* %t: time of dump, expressed as seconds since the Epoch (we expand this to µs granularity) */
+         META_ARGV_RLIMIT,       /* %c: core file size soft resource limit */
+-        META_ARGV_HOSTNAME,     /* %h: hostname */
++        _META_ARGV_REQUIRED,
++        /* The fields below were added to kernel/core_pattern at later points, so they might be missing. */
++        META_ARGV_HOSTNAME = _META_ARGV_REQUIRED,  /* %h: hostname */
+         _META_ARGV_MAX,
++        /* If new fields are added, they should be added here, to maintain compatibility
++         * with callers which don't know about the new fields. */
+ 
+         /* The following indexes are cached for a couple of special fields we use (and
+          * thereby need to be retrieved quickly) for naming coredump files, and attaching
+@@ -96,7 +100,7 @@ enum {
+         _META_MANDATORY_MAX,
+ 
+         /* The rest are similar to the previous ones except that we won't fail if one of
+-         * them is missing. */
++         * them is missing in a message sent over the socket. */
+ 
+         META_EXE = _META_MANDATORY_MAX,
+         META_UNIT,
+@@ -1278,14 +1282,17 @@ static int gather_pid_metadata_from_argv(
+         char *t;
+ 
+         /* We gather all metadata that were passed via argv[] into an array of iovecs that
+-         * we'll forward to the socket unit */
++         * we'll forward to the socket unit.
++         *
++         * We require at least _META_ARGV_REQUIRED args, but will accept more.
++         * We know how to parse _META_ARGV_MAX args. The rest will be ignored. */
+ 
+-        if (argc < _META_ARGV_MAX)
++        if (argc < _META_ARGV_REQUIRED)
+                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL),
+-                                       "Not enough arguments passed by the kernel (%i, expected %i).",
+-                                       argc, _META_ARGV_MAX);
++                                       "Not enough arguments passed by the kernel (%i, expected between %i and %i).",
++                                       argc, _META_ARGV_REQUIRED, _META_ARGV_MAX);
+ 
+-        for (int i = 0; i < _META_ARGV_MAX; i++) {
++        for (int i = 0; i < MIN(argc, _META_ARGV_MAX); i++) {
+ 
+                 t = argv[i];
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0002.patch b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0002.patch
new file mode 100644
index 0000000000..0520bac87c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0002.patch
@@ -0,0 +1,106 @@
+From fb22bb743556d4d14463b0f0373c24d07d2e7b28 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 26 May 2025 12:04:44 +0200
+Subject: [PATCH 2/3] coredump: get rid of _META_MANDATORY_MAX
+
+No functional change. This change is done in preparation for future changes.
+Currently, the list of fields which are received on the command line is a
+strict subset of the fields which are always expected to be received on a
+socket. But when we add new kernel args in the future, we'll have two
+non-overlapping sets and this approach will not work. Get rid of the variable
+and enumerate the required fields. This set will never change, so this is
+actually more maintainable.
+
+The message with the hint where to add new fields is switched with
+_META_ARGV_MAX. The new order is more correct.
+
+(cherry-picked from 49f1f2d4a7612bbed5211a73d11d6a94fbe3bb69)
+(cherry-picked from aea6a631bca93e8b04a11aaced694f25f4da155e)
+(cherry picked from cf16b6b6b2e0a656531bfd73ad66be3817b155cd)
+
+(cherry picked from commit b46a4f023cd80b24c8f1aa7a95700bc0cb828cdc)
+(cherry picked from commit 5855552310ed279180c21cb803408aa2ce36053d)
+(cherry picked from commit cc31f2d4146831b9f2fe7bf584468908ff9c4de5)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/2c81e60fe0b8c506a4fe902e45bed6f58f482b39]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/coredump/coredump.c | 29 ++++++++++++++++++++---------
+ 1 file changed, 20 insertions(+), 9 deletions(-)
+
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index d598f6f59a..0b27086288 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -71,7 +71,7 @@
+  * size. See DATA_SIZE_MAX in journal-importer.h. */
+ assert_cc(JOURNAL_SIZE_MAX <= DATA_SIZE_MAX);
+ 
+-enum {
++typedef enum {
+         /* We use these as array indexes for our process metadata cache.
+          *
+          * The first indices of the cache stores the same metadata as the ones passed by
+@@ -87,9 +87,9 @@ enum {
+         _META_ARGV_REQUIRED,
+         /* The fields below were added to kernel/core_pattern at later points, so they might be missing. */
+         META_ARGV_HOSTNAME = _META_ARGV_REQUIRED,  /* %h: hostname */
+-        _META_ARGV_MAX,
+         /* If new fields are added, they should be added here, to maintain compatibility
+          * with callers which don't know about the new fields. */
++        _META_ARGV_MAX,
+ 
+         /* The following indexes are cached for a couple of special fields we use (and
+          * thereby need to be retrieved quickly) for naming coredump files, and attaching
+@@ -97,16 +97,15 @@ enum {
+          * environment. */
+ 
+         META_COMM = _META_ARGV_MAX,
+-        _META_MANDATORY_MAX,
+ 
+         /* The rest are similar to the previous ones except that we won't fail if one of
+          * them is missing in a message sent over the socket. */
+ 
+-        META_EXE = _META_MANDATORY_MAX,
++        META_EXE,
+         META_UNIT,
+         META_PROC_AUXV,
+         _META_MAX
+-};
++} meta_argv_t;
+ 
+ static const char * const meta_field_names[_META_MAX] = {
+         [META_ARGV_PID]       = "COREDUMP_PID=",
+@@ -1192,12 +1191,24 @@ static int process_socket(int fd) {
+         if (r < 0)
+                 goto finish;
+ 
+-        /* Make sure we received at least all fields we need. */
+-        for (int i = 0; i < _META_MANDATORY_MAX; i++)
++        /* Make sure we received all the expected fields. We support being called by an *older*
++         * systemd-coredump from the outside, so we require only the basic set of fields that
++         * was being sent when the support for sending to containers over a socket was added
++         * in a108c43e36d3ceb6e34efe37c014fc2cda856000. */
++        meta_argv_t i;
++        VA_ARGS_FOREACH(i,
++                        META_ARGV_PID,
++                        META_ARGV_UID,
++                        META_ARGV_GID,
++                        META_ARGV_SIGNAL,
++                        META_ARGV_TIMESTAMP,
++                        META_ARGV_RLIMIT,
++                        META_ARGV_HOSTNAME,
++                        META_COMM)
+                 if (!context.meta[i]) {
+                         r = log_error_errno(SYNTHETIC_ERRNO(EINVAL),
+-                                            "A mandatory argument (%i) has not been sent, aborting.",
+-                                            i);
++                                            "Mandatory argument %s not received on socket, aborting.",
++                                            meta_field_names[i]);
+                         goto finish;
+                 }
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
new file mode 100644
index 0000000000..737121af12
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
@@ -0,0 +1,144 @@
+From 89730dea979b2d22fd548b622cd88bac99ff1d6b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 29 Apr 2025 14:47:59 +0200
+Subject: [PATCH 3/3] coredump: use %d in kernel core pattern
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The kernel provides %d which is documented as
+"dump mode—same as value returned by prctl(2) PR_GET_DUMPABLE".
+
+We already query /proc/pid/auxv for this information, but unfortunately this
+check is subject to a race, because the crashed process may be replaced by an
+attacker before we read this data, for example replacing a SUID process that
+was killed by a signal with another process that is not SUID, tricking us into
+making the coredump of the original process readable by the attacker.
+
+With this patch, we effectively add one more check to the list of conditions
+that need be satisfied if we are to make the coredump accessible to the user.
+
+Reportedy-by: Qualys Security Advisory <qsa@qualys.com>
+
+(cherry-picked from commit 0c49e0049b7665bb7769a13ef346fef92e1ad4d6)
+(cherry-picked from commit c58a8a6ec9817275bb4babaa2c08e0e35090d4e3)
+(cherry picked from commit 19d439189ab85dd7222bdd59fd442bbcc8ea99a7)
+(cherry picked from commit 254ab8d2a7866679cee006d844d078774cbac3c9)
+(cherry picked from commit 7fc7aa5a4d28d7768dfd1eb85be385c3ea949168)
+(cherry picked from commit 19b228662e0fcc6596c0395a0af8486a4b3f1627)
+
+CVE: CVE-2025-4598
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/2eb46dce078334805c547cbcf5e6462cf9d2f9f0]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ man/systemd-coredump.xml     | 12 ++++++++++++
+ src/coredump/coredump.c      | 21 ++++++++++++++++++---
+ sysctl.d/50-coredump.conf.in |  2 +-
+ 3 files changed, 31 insertions(+), 4 deletions(-)
+
+diff --git a/man/systemd-coredump.xml b/man/systemd-coredump.xml
+index cb9f47745b..ba7cad12bc 100644
+--- a/man/systemd-coredump.xml
++++ b/man/systemd-coredump.xml
+@@ -259,6 +259,18 @@ COREDUMP_FILENAME=/var/lib/systemd/coredump/core.Web….552351.….zst
+         </listitem>
+       </varlistentry>
+ 
++      <varlistentry>
++        <term><varname>COREDUMP_DUMPABLE=</varname></term>
++
++        <listitem><para>The <constant>PR_GET_DUMPABLE</constant> field as reported by the kernel, see
++        <citerefentry
++        project='man-pages'><refentrytitle>prctl</refentrytitle><manvolnum>2</manvolnum></citerefentry>.
++        </para>
++
++        <xi:include href="version-info.xml" xpointer="v258"/>
++        </listitem>
++      </varlistentry>
++
+       <varlistentry>
+         <term><varname>COREDUMP_OPEN_FDS=</varname></term>
+ 
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index 0b27086288..aca6a2eb6b 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -87,6 +87,7 @@ typedef enum {
+         _META_ARGV_REQUIRED,
+         /* The fields below were added to kernel/core_pattern at later points, so they might be missing. */
+         META_ARGV_HOSTNAME = _META_ARGV_REQUIRED,  /* %h: hostname */
++        META_ARGV_DUMPABLE,     /* %d: as set by the kernel */
+         /* If new fields are added, they should be added here, to maintain compatibility
+          * with callers which don't know about the new fields. */
+         _META_ARGV_MAX,
+@@ -115,6 +116,7 @@ static const char * const meta_field_names[_META_MAX] = {
+         [META_ARGV_TIMESTAMP] = "COREDUMP_TIMESTAMP=",
+         [META_ARGV_RLIMIT]    = "COREDUMP_RLIMIT=",
+         [META_ARGV_HOSTNAME]  = "COREDUMP_HOSTNAME=",
++        [META_ARGV_DUMPABLE]  = "COREDUMP_DUMPABLE=",
+         [META_COMM]           = "COREDUMP_COMM=",
+         [META_EXE]            = "COREDUMP_EXE=",
+         [META_UNIT]           = "COREDUMP_UNIT=",
+@@ -125,6 +127,7 @@ typedef struct Context {
+         const char *meta[_META_MAX];
+         size_t meta_size[_META_MAX];
+         pid_t pid;
++        unsigned dumpable;
+         bool is_pid1;
+         bool is_journald;
+ } Context;
+@@ -470,14 +473,16 @@ static int grant_user_access(int core_fd, const Context *context) {
+         if (r < 0)
+                 return r;
+ 
+-        /* We allow access if we got all the data and at_secure is not set and
+-         * the uid/gid matches euid/egid. */
++        /* We allow access if dumpable on the command line was exactly 1, we got all the data,
++         * at_secure is not set, and the uid/gid match euid/egid. */
+         bool ret =
++                context->dumpable == 1 &&
+                 at_secure == 0 &&
+                 uid != UID_INVALID && euid != UID_INVALID && uid == euid &&
+                 gid != GID_INVALID && egid != GID_INVALID && gid == egid;
+-        log_debug("Will %s access (uid="UID_FMT " euid="UID_FMT " gid="GID_FMT " egid="GID_FMT " at_secure=%s)",
++        log_debug("Will %s access (dumpable=%u uid="UID_FMT " euid="UID_FMT " gid="GID_FMT " egid="GID_FMT " at_secure=%s)",
+                   ret ? "permit" : "restrict",
++                  context->dumpable,
+                   uid, euid, gid, egid, yes_no(at_secure));
+         return ret;
+ }
+@@ -1102,6 +1107,16 @@ static int save_context(Context *context, const struct iovec_wrapper *iovw) {
+         if (r < 0)
+                 return log_error_errno(r, "Failed to parse PID \"%s\": %m", context->meta[META_ARGV_PID]);
+ 
++        /* The value is set to contents of /proc/sys/fs/suid_dumpable, which we set to 2,
++         * if the process is marked as not dumpable, see PR_SET_DUMPABLE(2const). */
++        if (context->meta[META_ARGV_DUMPABLE]) {
++                r = safe_atou(context->meta[META_ARGV_DUMPABLE], &context->dumpable);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to parse dumpable field \"%s\": %m", context->meta[META_ARGV_DUMPABLE]);
++                if (context->dumpable > 2)
++                        log_notice("Got unexpected %%d/dumpable value %u.", context->dumpable);
++        }
++
+         unit = context->meta[META_UNIT];
+         context->is_pid1 = streq(context->meta[META_ARGV_PID], "1") || streq_ptr(unit, SPECIAL_INIT_SCOPE);
+         context->is_journald = streq_ptr(unit, SPECIAL_JOURNALD_SERVICE);
+diff --git a/sysctl.d/50-coredump.conf.in b/sysctl.d/50-coredump.conf.in
+index 5fb551a8cf..9c10a89828 100644
+--- a/sysctl.d/50-coredump.conf.in
++++ b/sysctl.d/50-coredump.conf.in
+@@ -13,7 +13,7 @@
+ # the core dump.
+ #
+ # See systemd-coredump(8) and core(5).
+-kernel.core_pattern=|{{ROOTLIBEXECDIR}}/systemd-coredump %P %u %g %s %t %c %h
++kernel.core_pattern=|{{ROOTLIBEXECDIR}}/systemd-coredump %P %u %g %s %t %c %h %d
+ 
+ # Allow 16 coredumps to be dispatched in parallel by the kernel.
+ # We collect metadata from /proc/%P/, and thus need to make sure the crashed
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0004.patch b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0004.patch
new file mode 100644
index 0000000000..a3aed25e27
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0004.patch
@@ -0,0 +1,36 @@
+From a0c698c720441782fcf2cb7dfd01e69baf8f1f39 Mon Sep 17 00:00:00 2001
+From: Dan Streetman <ddstreet@ieee.org>
+Date: Thu, 2 Feb 2023 15:58:10 -0500
+Subject: [PATCH] basic/macro: add macro to iterate variadic args
+
+(cherry picked from commit e179f2d89c9f0c951636d74de00136b4075cd1ac)
+(cherry picked from commit cd4f43bf378ff33ce5cfeacd96f7f3726603bddc)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/c288a3aafdf11cd93eb7a21e4d587c6fc218a29c]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/macro.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/basic/macro.h b/src/basic/macro.h
+index 9e62f9c71c..16242902ec 100644
+--- a/src/basic/macro.h
++++ b/src/basic/macro.h
+@@ -454,4 +454,13 @@ typedef struct {
+ 
+ assert_cc(sizeof(dummy_t) == 0);
+ 
++/* Iterate through each variadic arg. All must be the same type as 'entry' or must be implicitly
++ * convertable. The iteration variable 'entry' must already be defined. */
++#define VA_ARGS_FOREACH(entry, ...)                                     \
++        _VA_ARGS_FOREACH(entry, UNIQ_T(_entries_, UNIQ), UNIQ_T(_current_, UNIQ), ##__VA_ARGS__)
++#define _VA_ARGS_FOREACH(entry, _entries_, _current_, ...)         \
++        for (typeof(entry) _entries_[] = { __VA_ARGS__ }, *_current_ = _entries_; \
++             ((long)(_current_ - _entries_) < (long)ELEMENTSOF(_entries_)) && ({ entry = *_current_; true; }); \
++             _current_++)
++
+ #include "log.h"
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-core/systemd/systemd_250.14.bb
index b3e31e1f23..66d20a46fd 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -31,6 +31,10 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-core-fix-build-when-seccomp-is-off.patch \
            file://0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch \
            file://0001-basic-do-not-warn-in-mkdir_p-when-parent-directory-e.patch \
+           file://CVE-2025-4598-0001.patch \
+           file://CVE-2025-4598-0002.patch \
+           file://CVE-2025-4598-0003.patch \
+           file://CVE-2025-4598-0004.patch \
            "
 
 # patches needed by musl
-- 
2.43.0


