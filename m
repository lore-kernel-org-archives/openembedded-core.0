Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE49C10DC1
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:57:50 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.5132.1701377863849181971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1WRFdtZN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6cde4aeea29so1183525b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377862; x=1701982662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRbSnBEVBuehTRN/0+gCpXqmhnT9B2fQNz1ff9XEEB8=;
        b=1WRFdtZN0OkG3RSq3Qcg4hg3es62q/6YFQv8/h7jIE/iUWiMqGAAkl9ZbIjRGrcI81
         e4p/be/PJ5QQGNFKqrdCt63iasCasJvOsW8P6sKWW13YRO9EDTXXL6e2qHpDTykJKedO
         eZV0OUacCvI2EbuMyq6fRf+I8UUaMWW/3NQro43t5f1sxZraPP4gLjxYSf2Uq25v5NrK
         GpKVW24L6RkcSjtxUYHN2OLi5rQAHltIyW24b5Ea7X1FJckxYAaVC9H5I0r64YOPU2v4
         vBOP/j405mXUP9EkHX32hS+528Sz1q98PiiRaXKvCkQvpGQ3GpTeEEMTzdz4pWPEaWpA
         yU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377862; x=1701982662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRbSnBEVBuehTRN/0+gCpXqmhnT9B2fQNz1ff9XEEB8=;
        b=k6TDV7/YnAUrDPVmf/NIW2sQWXZESASgktDyM1izEeXnV068/07uLgI6c4sUmYRQuc
         oG03bCjevqtwYeUrVfNFqZ6WkEWZsK9LXEA5Pxfb24sB2BrKfbsJ1/Y3KjIyEZpa8GLz
         nwawsac5BcBIvuexPnznKlNCr2rcUFvDwxdHT7nVd0BRV+8woy5QcIxxvPRSwCdG3KdQ
         TBiWVtvLs96+ADqH9gkHVwOon0wDMKzxFTjHFdQtbLkoMhS5GCkAWIE3GAyjvz5mekB9
         DTINJqYHngYx5Ua57UepEvEOA9PcfXmxmd12EtWYJ1HScazDlhhmWU8X21GyRwxQrAhU
         OOjw==
X-Gm-Message-State: AOJu0YzVPsxmG0M+IaWsn+XSTHeY5myRaGGWsGISkAdX84wxifL2mtDa
	4jCNBjVGWcBT4qDIHaDiRjWW/2dPCUADznwQQmtysw==
X-Google-Smtp-Source: AGHT+IGMdzWNaATaXyJtY9cCIDO3+l0Ksnwinryu3/7cg45OKlKVXVPRQH1uJpMUjawMk8r2Vk/niQ==
X-Received: by 2002:a05:6a20:94cc:b0:18b:b02d:8b6 with SMTP id ht12-20020a056a2094cc00b0018bb02d08b6mr25261296pzb.23.1701377862115;
        Thu, 30 Nov 2023 12:57:42 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 01/25] avahi: backport Debian patches to fix multiple CVE's
Date: Thu, 30 Nov 2023 10:57:09 -1000
Message-Id: <a9203c46cd64c3ec5e5b00e381bbac85733f85df.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191519

From: Vijay Anusuri <vanusuri@mvista.com>

import patches from ubuntu to fix
 CVE-2023-1981
 CVE-2023-38469
 CVE-2023-38470
 CVE-2023-38471
 CVE-2023-38472
 CVE-2023-38473

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit
https://github.com/lathiat/avahi/commit/a2696da2f2c50ac43b6c4903f72290d5c3fa9f6f
&
https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf
&
https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa516166237
&
https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c
&
https://github.com/lathiat/avahi/commit/20dec84b2480821704258bc908e7b2bd2e883b24
&
https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09
&
https://github.com/lathiat/avahi/commit/b675f70739f404342f7f78635d6e2dcd85a13460
&
https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40
&
https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   8 ++
 .../avahi/files/CVE-2023-1981.patch           |  58 ++++++++++
 .../avahi/files/CVE-2023-38469-1.patch        |  48 ++++++++
 .../avahi/files/CVE-2023-38469-2.patch        |  65 +++++++++++
 .../avahi/files/CVE-2023-38470-1.patch        |  57 +++++++++
 .../avahi/files/CVE-2023-38470-2.patch        |  52 +++++++++
 .../avahi/files/CVE-2023-38471-1.patch        |  73 ++++++++++++
 .../avahi/files/CVE-2023-38471-2.patch        |  52 +++++++++
 .../avahi/files/CVE-2023-38472.patch          |  45 ++++++++
 .../avahi/files/CVE-2023-38473.patch          | 109 ++++++++++++++++++
 10 files changed, 567 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 4c830cc058..aa395beaf9 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -26,6 +26,14 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://handle-hup.patch \
            file://local-ping.patch \
            file://invalid-service.patch \
+           file://CVE-2023-1981.patch \
+           file://CVE-2023-38469-1.patch \
+           file://CVE-2023-38469-2.patch \
+           file://CVE-2023-38470-1.patch \
+           file://CVE-2023-38470-2.patch \
+           file://CVE-2023-38471-1.patch \
+           file://CVE-2023-38471-2.patch \
+           file://CVE-2023-38472.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/lathiat/avahi/releases/"
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
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
new file mode 100644
index 0000000000..85345edc10
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
@@ -0,0 +1,48 @@
+From a337a1ba7d15853fb56deef1f464529af6e3a1cf Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Mon, 23 Oct 2023 20:29:31 +0000
+Subject: [PATCH] core: reject overly long TXT resource records
+
+Closes https://github.com/lathiat/avahi/issues/455
+
+CVE-2023-38469
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38469-1.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf]
+CVE: CVE-2023-38469
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-core/rr.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+Index: avahi-0.8/avahi-core/rr.c
+===================================================================
+--- avahi-0.8.orig/avahi-core/rr.c
++++ avahi-0.8/avahi-core/rr.c
+@@ -32,6 +32,7 @@
+ #include <avahi-common/malloc.h>
+ #include <avahi-common/defs.h>
+ 
++#include "dns.h"
+ #include "rr.h"
+ #include "log.h"
+ #include "util.h"
+@@ -688,11 +689,17 @@ int avahi_record_is_valid(AvahiRecord *r
+         case AVAHI_DNS_TYPE_TXT: {
+ 
+             AvahiStringList *strlst;
++            size_t used = 0;
+ 
+-            for (strlst = r->data.txt.string_list; strlst; strlst = strlst->next)
++            for (strlst = r->data.txt.string_list; strlst; strlst = strlst->next) {
+                 if (strlst->size > 255 || strlst->size <= 0)
+                     return 0;
+ 
++                used += 1+strlst->size;
++                if (used > AVAHI_DNS_RDATA_MAX)
++                    return 0;
++            }
++
+             return 1;
+         }
+     }
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
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
new file mode 100644
index 0000000000..4cca81698b
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
@@ -0,0 +1,57 @@
+From 94cb6489114636940ac683515417990b55b5d66c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Tue, 11 Apr 2023 15:29:59 +0200
+Subject: [PATCH] Ensure each label is at least one byte long
+
+The only allowed exception is single dot, where it should return empty
+string.
+
+Fixes #454.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38470-1.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c]
+CVE: CVE-2023-38470
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-common/domain-test.c | 14 ++++++++++++++
+ avahi-common/domain.c      |  2 +-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+Index: avahi-0.8/avahi-common/domain-test.c
+===================================================================
+--- avahi-0.8.orig/avahi-common/domain-test.c
++++ avahi-0.8/avahi-common/domain-test.c
+@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc, AVAH
+     printf("%s\n", s = avahi_normalize_name_strdup("fo\\\\o\\..f oo."));
+     avahi_free(s);
+ 
++    printf("%s\n", s = avahi_normalize_name_strdup("."));
++    avahi_free(s);
++
++    s = avahi_normalize_name_strdup(",.=.}.=.?-.}.=.?.?.}.}.?.?.?.z.?.?.}.}."
++		    "}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.=.=.?.?.}.}.?.?.}.}.}"
++		    ".?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.=.=.?.?.}.}.?.?.?.zM.?`"
++		    "?.}.}.}.?.?.?.r.=.?.}.=.?.?.}.?.?.?.}.=.?.?.}??.}.}.?.?."
++		    "?.z.?.?.}.}.}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.?`?.}.}.}."
++		    "??.?.zM.?`?.}.}.}.?.?.?.r.=.?.}.=.?.?.}.?.?.?.}.=.?.?.}?"
++		    "?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM."
++		    "?`?.}.}.}.?.?.?.r.=.=.?.?`.?.?}.}.}.?.?.?.r.=.?.}.=.?.?."
++		    "}.?.?.?.}.=.?.?.}");
++    assert(s == NULL);
++
+     printf("%i\n", avahi_domain_equal("\\065aa bbb\\.\\046cc.cc\\\\.dee.fff.", "Aaa BBB\\.\\.cc.cc\\\\.dee.fff"));
+     printf("%i\n", avahi_domain_equal("A", "a"));
+ 
+Index: avahi-0.8/avahi-common/domain.c
+===================================================================
+--- avahi-0.8.orig/avahi-common/domain.c
++++ avahi-0.8/avahi-common/domain.c
+@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s
+         }
+ 
+         if (!empty) {
+-            if (size < 1)
++            if (size < 2)
+                 return NULL;
+ 
+             *(r++) = '.';
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
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
new file mode 100644
index 0000000000..07cd3246e8
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
@@ -0,0 +1,73 @@
+From 894f085f402e023a98cbb6f5a3d117bd88d93b09 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Mon, 23 Oct 2023 13:38:35 +0200
+Subject: [PATCH] core: extract host name using avahi_unescape_label()
+
+Previously we could create invalid escape sequence when we split the
+string on dot. For example, from valid host name "foo\\.bar" we have
+created invalid name "foo\\" and tried to set that as the host name
+which crashed the daemon.
+
+Fixes #453
+
+CVE-2023-38471
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38471-1.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09]
+CVE: CVE-2023-38471
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-core/server.c | 27 +++++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 6 deletions(-)
+
+Index: avahi-0.8/avahi-core/server.c
+===================================================================
+--- avahi-0.8.orig/avahi-core/server.c
++++ avahi-0.8/avahi-core/server.c
+@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s)
+ }
+ 
+ int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
+-    char *hn = NULL;
++    char label_escaped[AVAHI_LABEL_MAX*4+1];
++    char label[AVAHI_LABEL_MAX];
++    char *hn = NULL, *h;
++    size_t len;
++
+     assert(s);
+ 
+     AVAHI_CHECK_VALIDITY(s, !host_name || avahi_is_valid_host_name(host_name), AVAHI_ERR_INVALID_HOST_NAME);
+@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServ
+     else
+         hn = avahi_normalize_name_strdup(host_name);
+ 
+-    hn[strcspn(hn, ".")] = 0;
++    h = hn;
++    if (!avahi_unescape_label((const char **)&hn, label, sizeof(label))) {
++        avahi_free(h);
++        return AVAHI_ERR_INVALID_HOST_NAME;
++    }
++
++    avahi_free(h);
+ 
+-    if (avahi_domain_equal(s->host_name, hn) && s->state != AVAHI_SERVER_COLLISION) {
+-        avahi_free(hn);
++    h = label_escaped;
++    len = sizeof(label_escaped);
++    if (!avahi_escape_label(label, strlen(label), &h, &len))
++        return AVAHI_ERR_INVALID_HOST_NAME;
++
++    if (avahi_domain_equal(s->host_name, label_escaped) && s->state != AVAHI_SERVER_COLLISION)
+         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
+-    }
+ 
+     withdraw_host_rrs(s);
+ 
+     avahi_free(s->host_name);
+-    s->host_name = hn;
++    s->host_name = avahi_strdup(label_escaped);
++    if (!s->host_name)
++        return AVAHI_ERR_NO_MEMORY;
+ 
+     update_fqdn(s);
+ 
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
new file mode 100644
index 0000000000..5c63edb31f
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
@@ -0,0 +1,45 @@
+From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Thu, 19 Oct 2023 17:36:44 +0200
+Subject: [PATCH] core: make sure there is rdata to process before parsing it
+
+Fixes #452
+
+CVE-2023-38472
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38472.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40]
+CVE: CVE-2023-38472
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-client/client-test.c      | 3 +++
+ avahi-daemon/dbus-entry-group.c | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+Index: avahi-0.8/avahi-client/client-test.c
+===================================================================
+--- avahi-0.8.orig/avahi-client/client-test.c
++++ avahi-0.8/avahi-client/client-test.c
+@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVA
+     assert(error == AVAHI_ERR_INVALID_RECORD);
+     avahi_string_list_free(txt);
+ 
++    error = avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
++    assert(error != AVAHI_OK);
++
+     avahi_entry_group_commit (group);
+ 
+     domain = avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback, (char*) "omghai3u");
+Index: avahi-0.8/avahi-daemon/dbus-entry-group.c
+===================================================================
+--- avahi-0.8.orig/avahi-daemon/dbus-entry-group.c
++++ avahi-0.8/avahi-daemon/dbus-entry-group.c
+@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_g
+         if (!(r = avahi_record_new_full (name, clazz, type, ttl)))
+             return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMORY, NULL);
+ 
+-        if (avahi_rdata_parse (r, rdata, size) < 0) {
++        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
+             avahi_record_unref (r);
+             return avahi_dbus_respond_error(c, m, AVAHI_ERR_INVALID_RDATA, NULL);
+         }
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
new file mode 100644
index 0000000000..d7c69225b1
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
@@ -0,0 +1,109 @@
+From b448c9f771bada14ae8de175695a9729f8646797 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Wed, 11 Oct 2023 17:45:44 +0200
+Subject: [PATCH] common: derive alternative host name from its unescaped
+ version
+
+Normalization of input makes sure we don't have to deal with special
+cases like unescaped dot at the end of label.
+
+Fixes #451 #487
+CVE-2023-38473
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38473.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797]
+CVE: CVE-2023-38473
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-common/alternative-test.c |  3 +++
+ avahi-common/alternative.c      | 27 +++++++++++++++++++--------
+ 2 files changed, 22 insertions(+), 8 deletions(-)
+
+Index: avahi-0.8/avahi-common/alternative-test.c
+===================================================================
+--- avahi-0.8.orig/avahi-common/alternative-test.c
++++ avahi-0.8/avahi-common/alternative-test.c
+@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAH
+     const char* const test_strings[] = {
+         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
+         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXüüüüüüü",
++        ").",
++        "\\.",
++        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\\\",
+         "gurke",
+         "-",
+         " #",
+Index: avahi-0.8/avahi-common/alternative.c
+===================================================================
+--- avahi-0.8.orig/avahi-common/alternative.c
++++ avahi-0.8/avahi-common/alternative.c
+@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c
+ }
+ 
+ char *avahi_alternative_host_name(const char *s) {
++    char label[AVAHI_LABEL_MAX], alternative[AVAHI_LABEL_MAX*4+1];
++    char *alt, *r, *ret;
+     const char *e;
+-    char *r;
++    size_t len;
+ 
+     assert(s);
+ 
+     if (!avahi_is_valid_host_name(s))
+         return NULL;
+ 
+-    if ((e = strrchr(s, '-'))) {
++    if (!avahi_unescape_label(&s, label, sizeof(label)))
++        return NULL;
++
++    if ((e = strrchr(label, '-'))) {
+         const char *p;
+ 
+         e++;
+@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const
+ 
+     if (e) {
+         char *c, *m;
+-        size_t l;
+         int n;
+ 
+         n = atoi(e)+1;
+         if (!(m = avahi_strdup_printf("%i", n)))
+             return NULL;
+ 
+-        l = e-s-1;
++        len = e-label-1;
+ 
+-        if (l >= AVAHI_LABEL_MAX-1-strlen(m)-1)
+-            l = AVAHI_LABEL_MAX-1-strlen(m)-1;
++        if (len >= AVAHI_LABEL_MAX-1-strlen(m)-1)
++            len = AVAHI_LABEL_MAX-1-strlen(m)-1;
+ 
+-        if (!(c = avahi_strndup(s, l))) {
++        if (!(c = avahi_strndup(label, len))) {
+             avahi_free(m);
+             return NULL;
+         }
+@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const
+     } else {
+         char *c;
+ 
+-        if (!(c = avahi_strndup(s, AVAHI_LABEL_MAX-1-2)))
++        if (!(c = avahi_strndup(label, AVAHI_LABEL_MAX-1-2)))
+             return NULL;
+ 
+         drop_incomplete_utf8(c);
+@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const
+         avahi_free(c);
+     }
+ 
++    alt = alternative;
++    len = sizeof(alternative);
++    ret = avahi_escape_label(r, strlen(r), &alt, &len);
++
++    avahi_free(r);
++    r = avahi_strdup(ret);
++
+     assert(avahi_is_valid_host_name(r));
+ 
+     return r;
-- 
2.34.1


