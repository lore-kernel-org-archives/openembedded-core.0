Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6BDC0218B
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.34428.1737515014020302211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I3tZs+El;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216728b1836so109377525ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515013; x=1738119813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVU6OlNosesVc8GeD9f3zhn/DAHu8nl6ef1H4kQOMaQ=;
        b=I3tZs+ElV/6s5RmSZMy3Zc1+PRFntzdDg+/R6ftsLjJRcaPScISlgw4F0Xl3WDAJgR
         GIpIzD0OwXDND5WX3qqeEJfkh3tPlDI+Sj3jQ8w2CJCWqpbFUJ6zhr5WucROpGhY5K3/
         KqquaMmkpV3h02umLKppztn0yKrRbDOCKlN5l8qWr2/OUo5F3sySjyUsModjjmnU4t1+
         ldb7GSVODrCQaaOrLHcHRa0D6gKrZktZqUFcg4nVgGQo43N4mQPkva4MUpsGjxU90FxW
         A9uawn6A6Ch1Z+mHP8X3GOeaqdJec3aAVWi7xb8GpSyEdpb7tglJn9TemYwXKtQBqioW
         +j/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515013; x=1738119813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVU6OlNosesVc8GeD9f3zhn/DAHu8nl6ef1H4kQOMaQ=;
        b=aRoweOlruKklFC2PkM4HRopCoaEGRcZ1Hn6HKVI9Gy1zLWNOuUQt6Y4WbZOkRg+STY
         0PkpS4T5G+l1EdH8gJZsMdRrse8OvzxfUj+AMFB7A0KtIRHbNAH4IpruoCTGcF5Ck2/0
         Rkc/qX43smZVeeoj+8ZAaZwzqjJpiTpSIX8Sw9G1m5DNurvB+u71wqA3kloqJYkOGOHX
         ALxVY3oZP9XC1c/QbECaqJ9LhZ5F7kRaxHTyMoGQTU60HllU5F0x73htjzM405cNjZZw
         Dg14BREEGogyF5ceWtwV3bjdyuuOLOsrQYBFNh0WcYl05lBBOYi0oqB97gWNDRtsS4Hq
         Em8A==
X-Gm-Message-State: AOJu0Yy76a0RONMRW5kKIR6szSBoPwB8Efps48sxVAoPIJi0ftVtuzYB
	16KiERU+zVMcNAmYaptl5gY4H4k+7uvK0XAWfaHrjKwcNLgfU9RNtcMS2jRyeFHLELXs5yzymTz
	ZXv4=
X-Gm-Gg: ASbGnctMQ2nb+IN0XCY0XDkybn/JP3lanZs0Von9LPJMZ/rAxwNYX7rOzjCvrbTQLrq
	gaMkg0JzgwT6q6x9acaV5axG7dn5s4PFcYB1G8NTuPeDuRsB1/XZ5xt/wIc6mBA9zIN+Jkodckt
	qOtR9cBWvbf3OPpFHRxUAvqchXKCpapGp4A4fjiBEhiBsBYXFUPXlCc3BM4QXgcOz07mghiXkYQ
	JOE48kl8TFYbctisSns0uceAjFn2Laxj+2JIhKRzOvH64GbqOEzLm5b5rM=
X-Google-Smtp-Source: AGHT+IElPgG/m94dwuW+Ls2crkmlIVcBcepe8juuAk/niWF5pU1OhKgDlwRNKQ8A5oMDXENQwqaYSg==
X-Received: by 2002:a05:6a21:6d91:b0:1e0:cbd1:8046 with SMTP id adf61e73a8af0-1eb21174c17mr30397889637.0.1737515013184;
        Tue, 21 Jan 2025 19:03:33 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/14] avahi: fix CVE-2024-52616
Date: Tue, 21 Jan 2025 19:02:59 -0800
Message-ID: <28de3f131b17dc4165df927060ee51f0de3ada90.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210117

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
index 1f18d4491d..1163c17e20 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38471-2.patch \
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
+           file://CVE-2024-52616.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
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


