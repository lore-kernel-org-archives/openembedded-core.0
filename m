Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEA4C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:15 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.42122.1737395471869925951
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y8NuDBHW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216728b1836so79586335ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395471; x=1738000271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNDmXefuGj4dvqZDMDsaSLUcVcmXdGiWKUyKTBgqdTM=;
        b=y8NuDBHWXCkfb8N0erzRwvB5cGZLBET61f2ZjMUvcFP2m9jO/UbWDoL5HvaOEnGrEo
         3JXbPwFwMOf3sqvBQBHbP8yIo7r5Of0+o8Z6/k9bk9Oxu8xUZ5RZmmBiidimrMroATg2
         TAZrTfVzYfJYMtH+1LAJHron6lVQ8/NymyApjhuTxCV64GfBpUVEMnjcnjUGPlo909Vd
         zMj0lnZJo3HIz1KvSKoJB6MvIKAyjarHQv3FE8QPydh4fwaLe76gE/IJTjYspO2ukW/c
         3/65mGzGfsY6Fcp5fFZdx0PBNZS6Htzn+AAhMHMCiSpHirwSi+H37Sn93AkyzOJhRqKO
         yb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395471; x=1738000271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNDmXefuGj4dvqZDMDsaSLUcVcmXdGiWKUyKTBgqdTM=;
        b=AY6YOHciFXCuSLTWXxmz+SMblxJBjY+8nZ3LC2ohoU63FZwUqHyWr8DM0IGnfqbOxG
         tCle7/NInIxUI3pI0J77spNH/8pLltgEC6aWQgNzNB9OomlMKWc5mUPLCHr74z7E4vaO
         uWZ7E1JA3kJx7vhOpCGDGSocL3ZLrAO0vcmLUQJm0+73zL3vhBxV9+tAu4Ho7VycnvcF
         esWRWom9KQ4cssNf9t6kHa8AmspkTGa+sRhuVziGIhy4hWXD7Q/jBXyuUQ7SJ/09MUUR
         Xatw9EjqCZ4bxmm9nGr6ow5MfwHxD3Z7KO3U3CdEQExyYFQSpCnSW4S7k2wLbb3GtjmW
         Ql0g==
X-Gm-Message-State: AOJu0YzEUJayAV4vh8es9vlgKTgtH4rhkiKmi0xkgwe08lAOgBuuPzzp
	acY0zvdf+50L7CEqQB5REMt9vS7LhuCr9djwO/D2aQKyjP7f+DQqTlJ6aQWpC9fKFPlOtTkAgkD
	paiw=
X-Gm-Gg: ASbGncsIh+s3jhpaDOh2ERZQ5hMxF6W2msQgiUr6nDTjZg9o65P6v7EGau6GFk+FJ6m
	GCibgeocUaoqdqTalhcZgTQF2fMwfze30C/E4cWfR5YX+8cptz5Dl448eXOTJ2TI72iTN/HkfLP
	3OjJmkFoA+ItT2sKHu5FCdkY6SOY9UsaUV+Ht48Wz4j5kSqVQmjckdbAhpNjaMyqSjPjDjpV6KU
	zhWMAI8M9BF4hlTY+qPpWPxOgXW/K9SAopBLCIZAzDNcF47EcldNVciBHk=
X-Google-Smtp-Source: AGHT+IHfE/g6bF7z8n60+TuX6p3KwWNOI8eonv4/yTAvYgZCZIK+hgg3FRRH9TeeLAEfcV320mMSYg==
X-Received: by 2002:a05:6a21:3388:b0:1e1:a8b7:b45d with SMTP id adf61e73a8af0-1eb2145ffc2mr21467629637.4.1737395471075;
        Mon, 20 Jan 2025 09:51:11 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/16] avahi: fix CVE-2024-52616
Date: Mon, 20 Jan 2025 09:50:45 -0800
Message-ID: <7708d0c346b23ab3e687e2a2ca464d77d55cebd7.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210045

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-52616:
A flaw was found in the Avahi-daemon, where it initializes DNS transaction IDs
randomly only once at startup, incrementing them sequentially after that. This
predictable behavior facilitates DNS spoofing attacks, allowing attackers to
guess transaction IDs.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-52616]
[https://github.com/avahi/avahi/security/advisories/GHSA-r9j3-vjjh-p8vm]

Upstream patches:
[https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52616.patch          | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 5d1c86978a..b3739ad2c0 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,6 +35,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2023-38471-2.patch \
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
+           file://CVE-2024-52616.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch b/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
new file mode 100644
index 0000000000..a156f98728
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
@@ -0,0 +1,104 @@
+From f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Mon, 11 Nov 2024 00:56:09 +0100
+Subject: [PATCH] Properly randomize query id of DNS packets
+
+CVE: CVE-2024-52616
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ avahi-core/wide-area.c | 36 ++++++++++++++++++++++++++++--------
+ configure.ac           |  3 ++-
+ 2 files changed, 30 insertions(+), 9 deletions(-)
+
+diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
+index 971f5e714..00a15056e 100644
+--- a/avahi-core/wide-area.c
++++ b/avahi-core/wide-area.c
+@@ -40,6 +40,13 @@
+ #include "addr-util.h"
+ #include "rr-util.h"
+ 
++#ifdef HAVE_SYS_RANDOM_H
++#include <sys/random.h>
++#endif
++#ifndef HAVE_GETRANDOM
++#  define getrandom(d, len, flags) (-1)
++#endif
++
+ #define CACHE_ENTRIES_MAX 500
+ 
+ typedef struct AvahiWideAreaCacheEntry AvahiWideAreaCacheEntry;
+@@ -84,8 +91,6 @@ struct AvahiWideAreaLookupEngine {
+     int fd_ipv4, fd_ipv6;
+     AvahiWatch *watch_ipv4, *watch_ipv6;
+ 
+-    uint16_t next_id;
+-
+     /* Cache */
+     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
+     AvahiHashmap *cache_by_key;
+@@ -201,6 +206,26 @@ static void sender_timeout_callback(AvahiTimeEvent *e, void *userdata) {
+     avahi_time_event_update(e, avahi_elapse_time(&tv, 1000, 0));
+ }
+ 
++static uint16_t get_random_uint16(void) {
++    uint16_t next_id;
++
++    if (getrandom(&next_id, sizeof(next_id), 0) == -1)
++        next_id = (uint16_t) rand();
++    return next_id;
++}
++
++static uint16_t avahi_wide_area_next_id(AvahiWideAreaLookupEngine *e) {
++    uint16_t next_id;
++
++    next_id = get_random_uint16();
++    while (find_lookup(e, next_id)) {
++        /* This ID is already used, get new. */
++        next_id = get_random_uint16();
++    }
++    return next_id;
++}
++
++
+ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     AvahiWideAreaLookupEngine *e,
+     AvahiKey *key,
+@@ -227,11 +252,7 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     /* If more than 65K wide area quries are issued simultaneously,
+      * this will break. This should be limited by some higher level */
+ 
+-    for (;; e->next_id++)
+-        if (!find_lookup(e, e->next_id))
+-            break; /* This ID is not yet used. */
+-
+-    l->id = e->next_id++;
++    l->id = avahi_wide_area_next_id(e);
+ 
+     /* We keep the packet around in case we need to repeat our query */
+     l->packet = avahi_dns_packet_new(0);
+@@ -604,7 +625,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new(AvahiServer *s) {
+         e->watch_ipv6 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
+ 
+     e->n_dns_servers = e->current_dns_server = 0;
+-    e->next_id = (uint16_t) rand();
+ 
+     /* Initialize cache */
+     AVAHI_LLIST_HEAD_INIT(AvahiWideAreaCacheEntry, e->cache);
+diff --git a/configure.ac b/configure.ac
+index a3211b80e..31bce3d76 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -367,7 +367,8 @@ AC_FUNC_SELECT_ARGTYPES
+ # whether libc's malloc does too. (Same for realloc.)
+ #AC_FUNC_MALLOC
+ #AC_FUNC_REALLOC
+-AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket strchr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy gethostbyname seteuid setegid setproctitle getprogname])
++AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket strchr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy gethostbyname seteuid setegid setproctitle getprogname getrandom])
++AC_CHECK_HEADERS([sys/random.h])
+ 
+ AC_FUNC_CHOWN
+ AC_FUNC_STAT
+
-- 
2.43.0


