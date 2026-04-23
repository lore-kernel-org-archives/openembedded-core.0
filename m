Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DA9FA1FD6
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:15:18 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14378.1776928509953157930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 00:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YXu/LK5y;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2adbfab4501so31072205ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1776928509; x=1777533309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YmlHlhHMXY2/naXUkq2y5HDG3qHGB/oDc4LX0IrV8dM=;
        b=YXu/LK5yiZEFeGpPpPIIDHEYg5ghZHSyy6Vzq0wNn8DRNZpps1qcZbScENQMYCzXvM
         VRjpjJgMOo+uECxpUGJx6no/NjLFxXYHK4cWDw3AvV3O4vjp7cBpMKzuOIqRAYGk8j22
         I7822MTl7UXPagzDBjjU0H3H+lO9iXhBkqo5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928509; x=1777533309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmlHlhHMXY2/naXUkq2y5HDG3qHGB/oDc4LX0IrV8dM=;
        b=b03l7KSjpIwmnPqL7DRy3NRLiKECDkYwm01cEMlqOrj7K6OhuU69WN/sGAEkh3z5sH
         sWEdG3ip2BGgwfaLUMdKLrUw1YQTeYsHREaoQOgl9QK1rgGpKV5gIYLo/0rk8H6cMtFx
         EPnyj/nmgAe94cS8+F4GbVmww4YjVztAuWVTABhhBIdJdYJSiEv56HgvzqCRG/17i45v
         48/qcrIW0OBtOIolZDhFJlilP+c4rB2Fza5OXkrnEZdDFgYs931hBT4U37hYFKHzWHUV
         Z9P1SeMI61edQORtyKNsY1iHOM65r+cQVM640gVEeNxlm15b0XXLfkcJBtniipQDIM+y
         VAtw==
X-Gm-Message-State: AOJu0YyM3l2MVXJjfNhB9/hvxBqmI9cfF675cBw0fdcUlP0n9Z6Ny4LD
	Ipq9wGMHF2Q9cmIcQdH5yfJOb2Im/z594Api8LljwdwXTuFJ/GzD8AMwr94ggzgpWvlrEfyw71D
	jJzeC7Qg=
X-Gm-Gg: AeBDiet0kk5IBStUw2Rb2upwdxHh3Qu6AkhLL2RnECV0HWPiShWnEVzrSYt8cyFcvyh
	9fUWdj8OKFBqnRNWKkvJeieJ3YR1xHvoQRcObCyENtWhr7GXmE+sySEFvHrD3kNyeiYs1uSOCIC
	Kf0s+wbvURk6aG99Yt6gox/O2w5dPVIxK5Vc+t5Afww7NvAugn388Q4FEc9u3P6WyGecOKPOlyb
	1+kyTlJls/1Xz/dmy9yYC1UOoxWu5c4JgxtK7LEDy6123JVJYmdWc6gAtVixswttDvTogHKRuNe
	gZ/7deWalxdq5fuEKtwMz2Tt3Qq/hB6ncH0UyKswghYthxlRlgjTZlJhA7L6A+wXQGge/dPhp+N
	biEvGpIVR2HF73LtP/QNb4iIUtwBUV7+V26g+7T5G05CbCTZzrRix+Bcwo2FKseVrgh2rOCUWqV
	Iri2J3tmWKN5yUfH0wGcEpRnKawr4IljtERkwFLDX0wldZ1xsMqQ==
X-Received: by 2002:a17:902:74c2:b0:2b0:6d33:e7c0 with SMTP id d9443c01a7336-2b5f9ecaea6mr208068545ad.1.1776928508734;
        Thu, 23 Apr 2026 00:15:08 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:1ce5:d73b:b6e5:4ccc:62a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm186795565ad.36.2026.04.23.00.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:15:07 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][master][patch] avahi: Fix CVE-2026-34933
Date: Thu, 23 Apr 2026 12:44:56 +0530
Message-ID: <20260423071457.1301936-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 07:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235743

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-34933
[2] https://github.com/avahi/avahi/pull/891
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34933

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   2 +
 .../avahi/files/CVE-2026-34933-1.patch        | 108 ++++++++++++++++++
 .../avahi/files/CVE-2026-34933-2.patch        |  96 ++++++++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 931946646e..0042c3c2e3 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -41,6 +41,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2026-24401.patch \
            file://CVE-2025-68468.patch \
            file://CVE-2025-68471.patch \
+           file://CVE-2026-34933-1.patch \
+           file://CVE-2026-34933-2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
new file mode 100644
index 0000000000..208345a325
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
@@ -0,0 +1,108 @@
+From 0be89b6bb5c3983837b5e0febcbbbf452ecf7675 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 1 Apr 2026 05:31:58 +0000
+Subject: [PATCH] core: refuse to accept publish flags where both wide_area and
+ multicast are set
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon via D-Bus by calling EntryGroup methods accepting
+flags and passing both AVAHI_PUBLISH_USE_WIDE_AREA and
+AVAHI_PUBLISH_USE_MULTICAST there. For example when AddRecord was
+invoked like that avahi-daemon crashed with
+```
+dbus-entry-group.c: interface=org.freedesktop.Avahi.EntryGroup, path=/Client0/EntryGroup1, member=AddRecord
+avahi-daemon: entry.c:57: transport_flags_from_domain: Assertion `!((*flags & AVAHI_PUBLISH_USE_MULTICAST) && (*flags & AVAHI_PUBLISH_USE_WIDE_AREA))' failed.
+==84944==
+==84944== Process terminating with default action of signal 6 (SIGABRT)
+==84944==    at 0x4B353BC: __pthread_kill_implementation (pthread_kill.c:44)
+==84944==    by 0x4ADE941: raise (raise.c:26)
+==84944==    by 0x4AC64AB: abort (abort.c:77)
+==84944==    by 0x4AC641F: __assert_fail_base.cold (assert.c:118)
+==84944==    by 0x48A9404: transport_flags_from_domain (entry.c:57)
+==84944==    by 0x48A9F8F: server_add_internal (entry.c:224)
+==84944==    by 0x48AA49F: avahi_server_add (entry.c:324)
+==84944==    by 0x401A670: avahi_dbus_msg_entry_group_impl (dbus-entry-group.c:348)
+==84944==    by 0x4A70741: ??? (in /usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)
+==84944==    by 0x4A5FB22: dbus_connection_dispatch (in /usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)
+==84944==    by 0x401D01D: dispatch_timeout_callback (dbus-watch-glue.c:105)
+==84944==    by 0x488E3AE: timeout_callback (simple-watch.c:447)
+==84944==
+```
+It's a follow-up to fbce111b069aa1e4c701ed37ee1d9f6d6cefaac5 where
+those flags were introduced and consistent with the other places
+where wide_area/multicast flags are used.
+
+It was discovered by
+Guillaume Meunier - Head of Vulnerability Operations Center France - Orange Cyberdefense
+
+https://github.com/avahi/avahi/security/advisories/GHSA-w65r-6gxh-vhvc
+
+CVE-2026-34933
+
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/0be89b6bb5c3983837b5e0febcbbbf452ecf7675]
+CVE: CVE-2026-34933
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-core/entry.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/avahi-core/entry.c b/avahi-core/entry.c
+index 0d862133d..06eb12076 100644
+--- a/avahi-core/entry.c
++++ b/avahi-core/entry.c
+@@ -207,6 +207,7 @@ static AvahiEntry * server_add_internal(
+                                          AVAHI_PUBLISH_UPDATE|
+                                          AVAHI_PUBLISH_USE_WIDE_AREA|
+                                          AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_domain_name(r->key->name), AVAHI_ERR_INVALID_HOST_NAME);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, r->ttl != 0, AVAHI_ERR_INVALID_TTL);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !avahi_key_is_pattern(r->key), AVAHI_ERR_IS_PATTERN);
+@@ -454,6 +455,7 @@ int avahi_server_add_address(
+                                               AVAHI_PUBLISH_UPDATE|
+                                               AVAHI_PUBLISH_USE_WIDE_AREA|
+                                               AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, !name || avahi_is_valid_fqdn(name), AVAHI_ERR_INVALID_HOST_NAME);
+ 
+     /* Prepare the host naem */
+@@ -595,6 +597,7 @@ static int server_add_service_strlst_nocopy(
+                                                                 AVAHI_PUBLISH_UPDATE|
+                                                                 AVAHI_PUBLISH_USE_WIDE_AREA|
+                                                                 AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -754,6 +757,7 @@ static int server_update_service_txt_strlst_nocopy(
+                                                                 AVAHI_PUBLISH_NO_COOKIE|
+                                                                 AVAHI_PUBLISH_USE_WIDE_AREA|
+                                                                 AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -843,6 +847,7 @@ int avahi_server_add_service_subtype(
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_IF_VALID(interface), AVAHI_ERR_INVALID_INTERFACE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_PROTO_VALID(protocol), AVAHI_ERR_INVALID_PROTOCOL);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -910,6 +915,7 @@ static AvahiEntry *server_add_dns_server_name(
+     assert(name);
+ 
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, type == AVAHI_DNS_SERVER_UPDATE || type == AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, port != 0, AVAHI_ERR_INVALID_PORT);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_fqdn(name), AVAHI_ERR_INVALID_HOST_NAME);
+@@ -967,6 +973,7 @@ int avahi_server_add_dns_server_address(
+     AVAHI_CHECK_VALIDITY(s, AVAHI_IF_VALID(interface), AVAHI_ERR_INVALID_INTERFACE);
+     AVAHI_CHECK_VALIDITY(s, AVAHI_PROTO_VALID(protocol) && AVAHI_PROTO_VALID(address->proto), AVAHI_ERR_INVALID_PROTOCOL);
+     AVAHI_CHECK_VALIDITY(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, type == AVAHI_DNS_SERVER_UPDATE || type == AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, port != 0, AVAHI_ERR_INVALID_PORT);
+     AVAHI_CHECK_VALIDITY(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
new file mode 100644
index 0000000000..479d0d7e93
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
@@ -0,0 +1,96 @@
+From a93fdd980d2db5d453475c0aa2b39946bd6611bd Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 1 Apr 2026 05:30:58 +0000
+Subject: [PATCH] tests: make sure AVAHI_PUBLISH_USE_WIDE_AREA is refused
+
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/a93fdd980d2db5d453475c0aa2b39946bd6611bd]
+CVE: CVE-2026-34933
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-client/client-test.c | 25 +++++++++++++++++++++++++
+ avahi-core/avahi-test.c    | 12 +++++++++++-
+ 2 files changed, 36 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
+index 9a015d7..c80e12f 100644
+--- a/avahi-client/client-test.c
++++ b/avahi-client/client-test.c
+@@ -212,6 +212,28 @@ static void terminate(AVAHI_GCC_UNUSED AvahiTimeout *timeout, AVAHI_GCC_UNUSED v
+     avahi_simple_poll_quit(simple_poll);
+ }
+ 
++static void test_refuse_publish_flags(AvahiEntryGroup *g, AvahiPublishFlags flags, int expected) {
++    AvahiAddress a;
++    AvahiStringList *l = NULL;
++    int r;
++
++    r = avahi_entry_group_add_record(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, "test.local", AVAHI_DNS_CLASS_IN, AVAHI_DNS_TYPE_CNAME, 120, "\0", 1);
++    assert(r == expected);
++
++    avahi_address_parse("224.0.0.251", AVAHI_PROTO_UNSPEC, &a);
++    r = avahi_entry_group_add_address(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, "test.local", &a);
++    assert(r == expected);
++
++    r = avahi_entry_group_add_service_strlst(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, NULL, 80, l);
++    assert(r == expected);
++
++    r = avahi_entry_group_update_service_txt_strlst(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, l);
++    assert(r == expected);
++
++    r = avahi_entry_group_add_service_subtype(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, "_magic._sub._http._tcp");
++    assert(r == expected);
++}
++
+ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     AvahiClient *avahi;
+     AvahiEntryGroup *group, *group2;
+@@ -275,6 +297,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     error = avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
+     assert(error != AVAHI_OK);
+ 
++    test_refuse_publish_flags(group, AVAHI_PUBLISH_USE_WIDE_AREA, AVAHI_ERR_NOT_SUPPORTED);
++    test_refuse_publish_flags(group, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST, AVAHI_ERR_INVALID_FLAGS);
++
+     avahi_entry_group_commit (group);
+ 
+     domain = avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback, (char*) "omghai3u");
+diff --git a/avahi-core/avahi-test.c b/avahi-core/avahi-test.c
+index 2a7872b..2bae82b 100644
+--- a/avahi-core/avahi-test.c
++++ b/avahi-core/avahi-test.c
+@@ -30,6 +30,7 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ 
++#include <avahi-common/error.h>
+ #include <avahi-common/malloc.h>
+ #include <avahi-common/simple-watch.h>
+ #include <avahi-common/alternative.h>
+@@ -150,6 +151,7 @@ static void remove_entries(void) {
+ static void create_entries(int new_name) {
+     AvahiAddress a;
+     AvahiRecord *r;
++    int error;
+ 
+     remove_entries();
+ 
+@@ -181,7 +183,15 @@ static void create_entries(int new_name) {
+         goto fail;
+     }
+ 
+-    if (avahi_server_add_dns_server_address(server, group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, NULL, AVAHI_DNS_SERVER_RESOLVE, avahi_address_parse("192.168.50.1", AVAHI_PROTO_UNSPEC, &a), 53) < 0) {
++    avahi_address_parse("192.168.50.1", AVAHI_PROTO_UNSPEC, &a);
++
++    error = avahi_server_add_dns_server_address(server, group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, AVAHI_PUBLISH_USE_WIDE_AREA, NULL, AVAHI_DNS_SERVER_RESOLVE, &a, 53);
++    assert(error == AVAHI_ERR_NOT_SUPPORTED);
++
++    error = avahi_server_add_dns_server_address(server, group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST, NULL, AVAHI_DNS_SERVER_RESOLVE, &a, 53);
++    assert(error == AVAHI_ERR_INVALID_FLAGS);
++
++    if (avahi_server_add_dns_server_address(server, group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, NULL, AVAHI_DNS_SERVER_RESOLVE, &a, 53) < 0) {
+         avahi_log_error("Failed to add new DNS Server address");
+         goto fail;
+     }
+-- 
+2.43.0
+
-- 
2.43.0


