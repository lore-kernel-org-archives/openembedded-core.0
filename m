Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D31C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 22:40:36 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.10216.1702420832566303278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 14:40:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Byql7DN9;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.53, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1f055438492so4645795fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702420831; x=1703025631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ig6r9SqbmRc2Jglv6mBsVrbU20aECoPkGP+/JpjuBz0=;
        b=Byql7DN96DMBOFbbbjBndD6MUdxRdZs6FmvmenfTW5MWVLHEGQFpvMOk/PQKm0LywU
         ZNrruC7LcPVlwoyv7z2ehfbV22FJJJl6HG0VoN2L6vAqsm8lEm0Uz3OFYv7yWNjdTAyb
         lOVbJxr7V77CES+HhkSlZMNb2satq3z8SSjitlV7kjDjCo1uVPNVgnupRT9UVYsr1vEj
         3IfXd5/D1kLb3YHgD4H9JJQF8jqKIrqUBnThiRbxAXv0HlDwqOU69MVJWZlvgHohzPgO
         Pm07khOUcKTaR30VTAn00s4oCEAMBrApYq2NOzEwrBSSvrAAeMsNk5xiQ7KkBv8sbBVh
         CiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702420831; x=1703025631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ig6r9SqbmRc2Jglv6mBsVrbU20aECoPkGP+/JpjuBz0=;
        b=Yn1ibS1bv0RUscg1CxKe/NHVJs6+6nOvU1hzo4ryp8t1qP/JH9aobppfvT3jyuEJf8
         RRZuRM+3rIVDc7dwpgSQJ7ULi/s8qJvxjUqOeX7KXBOgjHRG7CATITosKFfTQwcnPGsI
         LmuJMbpGnOsHI/U5fMSp3th5tQ76pZsJhCAlLosUL2zHI+bwLC6UowArWOrqQovkMkoQ
         sxoV04dE9r6NhyRi/dcS1ajL5LJAyx8hsnMAXrPrqr7RgkhCwzwF0TkCNEVO6Kje1N2b
         wfpQpK/cvi+MF+eyRxVl+uAy837jmF6PNR0cjPNebfQOgB2mWC6YoSHTAvuUyTI+3sq7
         w/RA==
X-Gm-Message-State: AOJu0Yy6WboIrb/sP5gIwfjk1R/Z8VfVvfgyfMd9/LZYt86AbwrWtqLG
	w4ILlWfY/KWomwf2WC4sbOk9Y5hpqViSoq8bt28=
X-Google-Smtp-Source: AGHT+IHlfdC0jy/USbD0tUtIViJCD64dSEo002QclgIn8v5wiDsCqcCB8w7+ybU52+d519gKU3aeYA==
X-Received: by 2002:a05:6870:d88c:b0:1fb:75b:12f1 with SMTP id oe12-20020a056870d88c00b001fb075b12f1mr8687957oac.67.1702420831262;
        Tue, 12 Dec 2023 14:40:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006d0951e74cbsm3847974pfo.178.2023.12.12.14.40.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:40:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/5] avahi: backport CVE-2023-1981 & CVE's follow-up patches
Date: Tue, 12 Dec 2023 12:40:16 -1000
Message-Id: <06b6a5cc9be0cb4a1fedc911a8a7edbbc75e4471.1702420654.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702420654.git.steve@sakoman.com>
References: <cover.1702420654.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 22:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192247

From: Vijay Anusuri <vanusuri@mvista.com>

import patches from ubuntu to fix
 CVE-2023-1981
 CVE-2023-38469-2
 CVE-2023-38470-2
 CVE-2023-38471-2

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit
https://github.com/lathiat/avahi/commit/a2696da2f2c50ac43b6c4903f72290d5c3fa9f6f
&
https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa516166237
&
https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c
&
https://github.com/lathiat/avahi/commit/b675f70739f404342f7f78635d6e2dcd85a13460]

Ref: https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/nanbield-nut&id=a9203c46cd64c3ec5e5b00e381bbac85733f85df

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  | 10 ++-
 .../avahi/files/CVE-2023-1981.patch           | 58 +++++++++++++++++
 ...023-38469.patch => CVE-2023-38469-1.patch} |  0
 .../avahi/files/CVE-2023-38469-2.patch        | 65 +++++++++++++++++++
 ...023-38470.patch => CVE-2023-38470-1.patch} |  0
 .../avahi/files/CVE-2023-38470-2.patch        | 52 +++++++++++++++
 ...023-38471.patch => CVE-2023-38471-1.patch} |  0
 .../avahi/files/CVE-2023-38471-2.patch        | 52 +++++++++++++++
 .../avahi/files/CVE-2023-38472.patch          | 44 ++++++-------
 9 files changed, 256 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
 rename meta/recipes-connectivity/avahi/files/{CVE-2023-38469.patch => CVE-2023-38469-1.patch} (100%)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
 rename meta/recipes-connectivity/avahi/files/{CVE-2023-38470.patch => CVE-2023-38470-1.patch} (100%)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
 rename meta/recipes-connectivity/avahi/files/{CVE-2023-38471.patch => CVE-2023-38471-1.patch} (100%)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index af5284a252..5d1c86978a 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -26,9 +26,13 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
            file://handle-hup.patch \
            file://local-ping.patch \
-           file://CVE-2023-38471.patch \
-           file://CVE-2023-38470.patch \
-           file://CVE-2023-38469.patch \
+           file://CVE-2023-1981.patch \
+           file://CVE-2023-38469-1.patch \
+           file://CVE-2023-38469-2.patch \
+           file://CVE-2023-38470-1.patch \
+           file://CVE-2023-38470-2.patch \
+           file://CVE-2023-38471-1.patch \
+           file://CVE-2023-38471-2.patch \
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
            "
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
new file mode 100644
index 0000000000..4d7924d13a
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
@@ -0,0 +1,58 @@
+From a2696da2f2c50ac43b6c4903f72290d5c3fa9f6f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Thu, 17 Nov 2022 01:51:53 +0100
+Subject: [PATCH] Emit error if requested service is not found
+
+It currently just crashes instead of replying with error. Check return
+value and emit error instead of passing NULL pointer to reply.
+
+Fixes #375
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-1981.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/lathiat/avahi/commit/a2696da2f2c50ac43b6c4903f72290d5c3fa9f6f]
+CVE: CVE-2023-1981
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-daemon/dbus-protocol.c | 20 ++++++++++++++------
+ 1 file changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/avahi-daemon/dbus-protocol.c b/avahi-daemon/dbus-protocol.c
+index 70d7687bc..406d0b441 100644
+--- a/avahi-daemon/dbus-protocol.c
++++ b/avahi-daemon/dbus-protocol.c
+@@ -375,10 +375,14 @@ static DBusHandlerResult dbus_get_alternative_host_name(DBusConnection *c, DBusM
+     }
+ 
+     t = avahi_alternative_host_name(n);
+-    avahi_dbus_respond_string(c, m, t);
+-    avahi_free(t);
++    if (t) {
++        avahi_dbus_respond_string(c, m, t);
++        avahi_free(t);
+ 
+-    return DBUS_HANDLER_RESULT_HANDLED;
++        return DBUS_HANDLER_RESULT_HANDLED;
++    } else {
++        return avahi_dbus_respond_error(c, m, AVAHI_ERR_NOT_FOUND, "Hostname not found");
++    }
+ }
+ 
+ static DBusHandlerResult dbus_get_alternative_service_name(DBusConnection *c, DBusMessage *m, DBusError *error) {
+@@ -389,10 +393,14 @@ static DBusHandlerResult dbus_get_alternative_service_name(DBusConnection *c, DB
+     }
+ 
+     t = avahi_alternative_service_name(n);
+-    avahi_dbus_respond_string(c, m, t);
+-    avahi_free(t);
++    if (t) {
++        avahi_dbus_respond_string(c, m, t);
++        avahi_free(t);
+ 
+-    return DBUS_HANDLER_RESULT_HANDLED;
++        return DBUS_HANDLER_RESULT_HANDLED;
++    } else {
++        return avahi_dbus_respond_error(c, m, AVAHI_ERR_NOT_FOUND, "Service not found");
++    }
+ }
+ 
+ static DBusHandlerResult dbus_create_new_entry_group(DBusConnection *c, DBusMessage *m, DBusError *error) {
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
similarity index 100%
rename from meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch
rename to meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
new file mode 100644
index 0000000000..f8f60ddca1
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
@@ -0,0 +1,65 @@
+From c6cab87df290448a63323c8ca759baa516166237 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 25 Oct 2023 18:15:42 +0000
+Subject: [PATCH] tests: pass overly long TXT resource records
+
+to make sure they don't crash avahi any more.
+It reproduces https://github.com/lathiat/avahi/issues/455
+
+Canonical notes:
+nickgalanis> removed first hunk since there is no .github dir in this release
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38469-2.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa516166237]
+CVE: CVE-2023-38469
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-client/client-test.c       | 14 ++++++++++++++
+ 1 files changed, 14 insertions(+)
+
+Index: avahi-0.8/avahi-client/client-test.c
+===================================================================
+--- avahi-0.8.orig/avahi-client/client-test.c
++++ avahi-0.8/avahi-client/client-test.c
+@@ -22,6 +22,7 @@
+ #endif
+ 
+ #include <stdio.h>
++#include <string.h>
+ #include <assert.h>
+ 
+ #include <avahi-client/client.h>
+@@ -33,6 +34,8 @@
+ #include <avahi-common/malloc.h>
+ #include <avahi-common/timeval.h>
+ 
++#include <avahi-core/dns.h>
++
+ static const AvahiPoll *poll_api = NULL;
+ static AvahiSimplePoll *simple_poll = NULL;
+ 
+@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVA
+     uint32_t cookie;
+     struct timeval tv;
+     AvahiAddress a;
++    uint8_t rdata[AVAHI_DNS_RDATA_MAX+1];
++    AvahiStringList *txt = NULL;
++    int r;
+ 
+     simple_poll = avahi_simple_poll_new();
+     poll_api = avahi_simple_poll_get(simple_poll);
+@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED int argc, AVA
+     printf("%s\n", avahi_strerror(avahi_entry_group_add_service (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site", "_http._tcp", NULL, NULL, 80, "foo=bar", NULL)));
+     printf("add_record: %d\n", avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "\5booya", 6));
+ 
++    memset(rdata, 1, sizeof(rdata));
++    r = avahi_string_list_parse(rdata, sizeof(rdata), &txt);
++    assert(r >= 0);
++    assert(avahi_string_list_serialize(txt, NULL, 0) == sizeof(rdata));
++    error = avahi_entry_group_add_service_strlst(group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", "_qotd._tcp", NULL, NULL, 123, txt);
++    assert(error == AVAHI_ERR_INVALID_RECORD);
++    avahi_string_list_free(txt);
++
+     avahi_entry_group_commit (group);
+ 
+     domain = avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback, (char*) "omghai3u");
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
similarity index 100%
rename from meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
rename to meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
new file mode 100644
index 0000000000..e0736bf210
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
@@ -0,0 +1,52 @@
+From 20dec84b2480821704258bc908e7b2bd2e883b24 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Tue, 19 Sep 2023 03:21:25 +0000
+Subject: [PATCH] [common] bail out when escaped labels can't fit into ret
+
+Fixes:
+```
+==93410==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7f9e76f14c16 at pc 0x00000047208d bp 0x7ffee90a6a00 sp 0x7ffee90a61c8
+READ of size 1110 at 0x7f9e76f14c16 thread T0
+    #0 0x47208c in __interceptor_strlen (out/fuzz-domain+0x47208c) (BuildId: 731b20c1eef22c2104e75a6496a399b10cfc7cba)
+    #1 0x534eb0 in avahi_strdup avahi/avahi-common/malloc.c:167:12
+    #2 0x53862c in avahi_normalize_name_strdup avahi/avahi-common/domain.c:226:12
+```
+and
+```
+fuzz-domain: fuzz/fuzz-domain.c:38: int LLVMFuzzerTestOneInput(const uint8_t *, size_t): Assertion `avahi_domain_equal(s, t)' failed.
+==101571== ERROR: libFuzzer: deadly signal
+    #0 0x501175 in __sanitizer_print_stack_trace (/home/vagrant/avahi/out/fuzz-domain+0x501175) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad600216ea8)
+    #1 0x45ad2c in fuzzer::PrintStackTrace() (/home/vagrant/avahi/out/fuzz-domain+0x45ad2c) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad600216ea8)
+    #2 0x43fc07 in fuzzer::Fuzzer::CrashCallback() (/home/vagrant/avahi/out/fuzz-domain+0x43fc07) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad600216ea8)
+    #3 0x7f1581d7ebaf  (/lib64/libc.so.6+0x3dbaf) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #4 0x7f1581dcf883 in __pthread_kill_implementation (/lib64/libc.so.6+0x8e883) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #5 0x7f1581d7eafd in gsignal (/lib64/libc.so.6+0x3dafd) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #6 0x7f1581d6787e in abort (/lib64/libc.so.6+0x2687e) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #7 0x7f1581d6779a in __assert_fail_base.cold (/lib64/libc.so.6+0x2679a) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #8 0x7f1581d77186 in __assert_fail (/lib64/libc.so.6+0x36186) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #9 0x5344a4 in LLVMFuzzerTestOneInput /home/vagrant/avahi/fuzz/fuzz-domain.c:38:9
+```
+
+It's a follow-up to 94cb6489114636940ac683515417990b55b5d66c
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38470-2.patch?h=ubuntu/jammy-security
+CVE: CVE-2023-38470 #Follow-up patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-common/domain.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: avahi-0.8/avahi-common/domain.c
+===================================================================
+--- avahi-0.8.orig/avahi-common/domain.c
++++ avahi-0.8/avahi-common/domain.c
+@@ -210,7 +210,8 @@ char *avahi_normalize_name(const char *s
+         } else
+             empty = 0;
+ 
+-        avahi_escape_label(label, strlen(label), &r, &size);
++        if (!(avahi_escape_label(label, strlen(label), &r, &size)))
++            return NULL;
+     }
+ 
+     return ret_s;
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
similarity index 100%
rename from meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
rename to meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
new file mode 100644
index 0000000000..44737bfc2e
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
@@ -0,0 +1,52 @@
+From b675f70739f404342f7f78635d6e2dcd85a13460 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Tue, 24 Oct 2023 22:04:51 +0000
+Subject: [PATCH] core: return errors from avahi_server_set_host_name properly
+
+It's a follow-up to 894f085f402e023a98cbb6f5a3d117bd88d93b09
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38471-2.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/lathiat/avahi/commit/b675f70739f404342f7f78635d6e2dcd85a13460]
+CVE: CVE-2023-38471 #Follow-up Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-core/server.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+Index: avahi-0.8/avahi-core/server.c
+===================================================================
+--- avahi-0.8.orig/avahi-core/server.c
++++ avahi-0.8/avahi-core/server.c
+@@ -1309,10 +1309,13 @@ int avahi_server_set_host_name(AvahiServ
+     else
+         hn = avahi_normalize_name_strdup(host_name);
+ 
++    if (!hn)
++        return avahi_server_set_errno(s, AVAHI_ERR_NO_MEMORY);
++
+     h = hn;
+     if (!avahi_unescape_label((const char **)&hn, label, sizeof(label))) {
+         avahi_free(h);
+-        return AVAHI_ERR_INVALID_HOST_NAME;
++        return avahi_server_set_errno(s, AVAHI_ERR_INVALID_HOST_NAME);
+     }
+ 
+     avahi_free(h);
+@@ -1320,7 +1323,7 @@ int avahi_server_set_host_name(AvahiServ
+     h = label_escaped;
+     len = sizeof(label_escaped);
+     if (!avahi_escape_label(label, strlen(label), &h, &len))
+-        return AVAHI_ERR_INVALID_HOST_NAME;
++        return avahi_server_set_errno(s, AVAHI_ERR_INVALID_HOST_NAME);
+ 
+     if (avahi_domain_equal(s->host_name, label_escaped) && s->state != AVAHI_SERVER_COLLISION)
+         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
+@@ -1330,7 +1333,7 @@ int avahi_server_set_host_name(AvahiServ
+     avahi_free(s->host_name);
+     s->host_name = avahi_strdup(label_escaped);
+     if (!s->host_name)
+-        return AVAHI_ERR_NO_MEMORY;
++        return avahi_server_set_errno(s, AVAHI_ERR_NO_MEMORY);
+ 
+     update_fqdn(s);
+ 
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
index 2f172622c9..85dbded73b 100644
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
@@ -1,46 +1,46 @@
-From 4e2537500dd0a1333845482f1f4147ef906030dd Mon Sep 17 00:00:00 2001
+From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00 2001
 From: Michal Sekletar <msekleta@redhat.com>
 Date: Thu, 19 Oct 2023 17:36:44 +0200
-Subject: [PATCH]core: make sure there is rdata to process before
- parsing it
+Subject: [PATCH] core: make sure there is rdata to process before parsing it
 
 Fixes #452
 
-Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40]
-CVE: CVE-2023-38472
+CVE-2023-38472
 
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38472.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40]
+CVE: CVE-2023-38472
 Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 ---
  avahi-client/client-test.c      | 3 +++
  avahi-daemon/dbus-entry-group.c | 2 +-
  2 files changed, 4 insertions(+), 1 deletion(-)
 
-diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
-index 7d04a6a..57750a4 100644
---- a/avahi-client/client-test.c
-+++ b/avahi-client/client-test.c
-@@ -258,6 +258,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
-     printf("%s\n", avahi_strerror(avahi_entry_group_add_service (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site", "_http._tcp", NULL, NULL, 80, "foo=bar", NULL)));
-     printf("add_record: %d\n", avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "\5booya", 6));
-
+Index: avahi-0.8/avahi-client/client-test.c
+===================================================================
+--- avahi-0.8.orig/avahi-client/client-test.c
++++ avahi-0.8/avahi-client/client-test.c
+@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVA
+     assert(error == AVAHI_ERR_INVALID_RECORD);
+     avahi_string_list_free(txt);
+ 
 +    error = avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
 +    assert(error != AVAHI_OK);
 +
      avahi_entry_group_commit (group);
-
+ 
      domain = avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback, (char*) "omghai3u");
-diff --git a/avahi-daemon/dbus-entry-group.c b/avahi-daemon/dbus-entry-group.c
-index 4e879a5..aa23d4b 100644
---- a/avahi-daemon/dbus-entry-group.c
-+++ b/avahi-daemon/dbus-entry-group.c
-@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_group_impl(DBusConnection *c, DBusMessage
+Index: avahi-0.8/avahi-daemon/dbus-entry-group.c
+===================================================================
+--- avahi-0.8.orig/avahi-daemon/dbus-entry-group.c
++++ avahi-0.8/avahi-daemon/dbus-entry-group.c
+@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_g
          if (!(r = avahi_record_new_full (name, clazz, type, ttl)))
              return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMORY, NULL);
-
+ 
 -        if (avahi_rdata_parse (r, rdata, size) < 0) {
 +        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
              avahi_record_unref (r);
              return avahi_dbus_respond_error(c, m, AVAHI_ERR_INVALID_RDATA, NULL);
          }
---
-2.40.0
-- 
2.34.1


