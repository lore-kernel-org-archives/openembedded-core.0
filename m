Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69720CD37B4
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8168.1778224352373965381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rsIWzCBl;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45297094718so1336190f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224350; x=1778829150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmusIbuVtyK2g/VZwPEBbn9xybBKuSt1cL9ueULP+nM=;
        b=rsIWzCBlbOu/6otZXnoNmbvOyEx8CZbImMspyWgjzdhV375OHwB20bQs+WhLqOL7GN
         2anQ4nqCviZ9jTjWvo80k0Vx3TbPF8/eRe1t9T5cywaA9nvxK90SCgQ3ftExnpnrV9Rc
         RQGO8TSaZ9updPbUniAYW7DIJYOWX1Z7X3LnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224350; x=1778829150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XmusIbuVtyK2g/VZwPEBbn9xybBKuSt1cL9ueULP+nM=;
        b=MqvuoYWzJhfXZsMraPQGafow3yE5jmFXjdzIcnPeYM6OwRJlSTtAgWRfGVqvh5/rfy
         KgR1IIUnl48HAi4PJ+DgQkZJSyNjqjZf9pNtEFSXmEL0001ZARgujOwp+in8iRWtd/U8
         UwE7JHXXh/8ZXMuMoX3Gk10C0U9VrWJ5fmBpD3yFs5BLprdSz02569eiDVNg+oz5i3wL
         0poGcPxzrZj8BdJb2FAvmq8pX4eAmp3cMv+NWoxmVBe3Kkkpc8fwbiFyf/G9WPg6nYCc
         DzJQqjOjJ01zk2UcsIK8ehinHNlb+I1SRunwTe5xobSJwNPmTTLkdnoaj4tG/XZhy07g
         DweA==
X-Gm-Message-State: AOJu0Yyaxv5ua/y6G2cSGbtyW/Hk+KJthI5OtvpaVoCRq/iXmWFZDKW2
	PzZ6siMIfzum6zeGyB4hHJRStnTWREhu2ueqOZcHi3COSKDDdpCe0TZmFxtQjjzGa5k93PZvW4c
	+EmmFlvQ=
X-Gm-Gg: Acq92OE6MEsKSX+r5gcwHr0aMj8/KLSYypcCqbem+X0Ncx1xchDQhFhTJ9zjqsYcZCL
	F3xiEjfnNVUcQTGqM3s6Vs9m/xAfD9WnCM8PJVZ8kuppEGtklvN+Vkw7LJtiisfSBVx4kD5bWMc
	TIdW50PHff442hbnt98lJaNR9L520oIT8+L090P7s0g0Jpt3OdAWCfA7bUP/gbRAeRrGs3k7T3X
	HjHZwqLZFfupJqDhs1yeQeWKpX4u24L3LF/VDNKmks9Qs2G7x4bxi59jPLaqMLRkrrI/nRIhKem
	XnDFhUF39BwakfxweRcPtACxRokrwN+t3AznodaNzTnkND4w7fpsPyE4TxaNFcRhnjVRxGXVexA
	QCKgAdZrGc5GSobdvZmw4KT5/OMxyNtVvCoYHJMYeMBV0ScQRJVzGzBSLQ/RDIHy6PwHl1o8pnY
	t8KHKBUeeTrUoUvGMDE1m4xC6nMVjNdiiTj1/ttp0nwWJTQzhLZ0YryfJ9CioOzvBmNmnr4sYCu
	nZ401OcN4KiONkW4MQ2cp0a4V7i/0OHKP1RpQ==
X-Received: by 2002:a5d:64c5:0:b0:43d:70de:1c70 with SMTP id ffacd0b85a97d-4515d5c54cbmr16814540f8f.32.1778224350047;
        Fri, 08 May 2026 00:12:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/52] avahi: Fix CVE-2026-34933
Date: Fri,  8 May 2026 09:11:20 +0200
Message-ID: <157d78fa9458829bf6384d253c00791532f8def1.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236669

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-34933
[2] https://github.com/avahi/avahi/pull/891
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34933

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 4ef89e64135d07cb975e6232f4eaa18c4771de2f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   2 +
 .../avahi/files/CVE-2026-34933-1.patch        | 108 ++++++++++++++++++
 .../avahi/files/CVE-2026-34933-2.patch        |  96 ++++++++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 931946646ef..0042c3c2e3d 100644
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
index 00000000000..208345a3258
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
index 00000000000..479d0d7e932
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

