Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D645C072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 07:59:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.14585.1700639975406635280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 23:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZEIOtVbX;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6c396ef9a3dso5479758b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 23:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1700639974; x=1701244774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfVBHoaUfQK0Q3D76TG6r59oIv4D1qgLQDkmN/GBNn8=;
        b=ZEIOtVbXguZONLel6oQQ55giFfrmNbxzbsgDgBQ1BJDi6+inzO1IvRPbxhzDYITwmP
         OCgbmx2k1tLqy66JaYGYh6GISo6kn4Nf5aRBnpAbA+SlgSMI9acc+e+ojBeixVu7eFDD
         8Vj/TT9VycGr8lLCSveyJ2N7uTSPJ2QFS3iRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700639974; x=1701244774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfVBHoaUfQK0Q3D76TG6r59oIv4D1qgLQDkmN/GBNn8=;
        b=UCYrSAgWCyy8/0S5QWfQdu93ieMnilZ/eabshv4FQpc88JU9tZWa4zoh1E9loVMcHq
         7Gbw4sFyBxQWWGrvW80IEdLBYsi7T594fFK9PKhw1edP4puYymC35D2CUDaVnUCnhpZb
         Ghi8hxLZbmVfc8S8jv8S4BIXT/Vn6EO6A2USkzFnARLY0XtC5WSDVfZhO66YphO8NDb+
         tZQ7taRDSTFwgZI2DTUkg4Zh5hNRYfBLfF3mayAIR1Ra0v9sR/NDTTRMBbn4oKX/ff1m
         IjSOlj9mUh1a9K7FFkuR1XcLdlIHmc+xpwob62e4Qc7ZN+qX9gcPT82DND/piSWNsGa7
         uNEg==
X-Gm-Message-State: AOJu0YwgMWdZE6h8wwyl1msPWn2de/kkLCz+H8EE5RDItcwpQFa4JMtK
	56JX19XNIKWnH7AvJtv9OKsBOrEX+kykCCKgHIA=
X-Google-Smtp-Source: AGHT+IHRClPksiKBp64Rky0tWNuocYdKfvh6ecbcGY6itCj0u9p7P4aQC1yHMj1KkD3cVxpyx3Dp0g==
X-Received: by 2002:a05:6a21:a585:b0:187:cc5f:dbf4 with SMTP id gd5-20020a056a21a58500b00187cc5fdbf4mr1738700pzc.42.1700639973676;
        Tue, 21 Nov 2023 23:59:33 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1cb0:ae01:5847:2fe1:65bd:882a])
        by smtp.gmail.com with ESMTPSA id bv5-20020a17090af18500b00285256be528sm754946pjb.47.2023.11.21.23.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 23:59:33 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] avahi: backport Debian patches to fix multiple CVE's
Date: Wed, 22 Nov 2023 13:29:23 +0530
Message-Id: <20231122075923.1344178-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 07:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191021

From: Vijay Anusuri <vanusuri@mvista.com>

import patches from ubuntu to fix
 CVE-2023-1981
 CVE-2023-38469
 CVE-2023-38470
 CVE-2023-38471
 CVE-2023-38472
 CVE-2023-38473

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches?h=ubuntu/focal-security
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
---
 meta/recipes-connectivity/avahi/avahi.inc     |   9 ++
 .../avahi/files/CVE-2023-1981.patch           |  60 ++++++++++
 .../avahi/files/CVE-2023-38469-1.patch        |  48 ++++++++
 .../avahi/files/CVE-2023-38469-2.patch        |  65 +++++++++++
 .../avahi/files/CVE-2023-38470-1.patch        |  57 +++++++++
 .../avahi/files/CVE-2023-38470-2.patch        |  53 +++++++++
 .../avahi/files/CVE-2023-38471-1.patch        |  73 ++++++++++++
 .../avahi/files/CVE-2023-38471-2.patch        |  52 +++++++++
 .../avahi/files/CVE-2023-38472.patch          |  45 ++++++++
 .../avahi/files/CVE-2023-38473.patch          | 109 ++++++++++++++++++
 10 files changed, 571 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 25bb41b738..e1dfc7a861 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -22,6 +22,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
            file://fix-CVE-2017-6519.patch \
            file://CVE-2021-3468.patch \
+           file://CVE-2023-1981.patch \
+           file://CVE-2023-38469-1.patch \
+           file://CVE-2023-38469-2.patch \
+           file://CVE-2023-38470-1.patch \
+           file://CVE-2023-38470-2.patch \
+           file://CVE-2023-38471-1.patch \
+           file://CVE-2023-38471-2.patch \
+           file://CVE-2023-38472.patch \
+           file://CVE-2023-38473.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
new file mode 100644
index 0000000000..1209864402
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
@@ -0,0 +1,60 @@
+Backport of:
+
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-1981.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/lathiat/avahi/commit/a2696da2f2c50ac43b6c4903f72290d5c3fa9f6f]
+CVE: CVE-2023-1981
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-daemon/dbus-protocol.c | 20 ++++++++++++++------
+ 1 file changed, 14 insertions(+), 6 deletions(-)
+
+--- a/avahi-daemon/dbus-protocol.c
++++ b/avahi-daemon/dbus-protocol.c
+@@ -391,10 +391,14 @@ static DBusHandlerResult msg_server_impl
+         }
+ 
+         t = avahi_alternative_host_name(n);
+-        avahi_dbus_respond_string(c, m, t);
+-        avahi_free(t);
+-
+-        return DBUS_HANDLER_RESULT_HANDLED;
++        if (t) {
++            avahi_dbus_respond_string(c, m, t);
++            avahi_free(t);
++
++            return DBUS_HANDLER_RESULT_HANDLED;
++        } else {
++            return avahi_dbus_respond_error(c, m, AVAHI_ERR_NOT_FOUND, "Hostname not found");
++        }
+ 
+     } else if (dbus_message_is_method_call(m, AVAHI_DBUS_INTERFACE_SERVER, "GetAlternativeServiceName")) {
+         char *n, *t;
+@@ -405,10 +409,14 @@ static DBusHandlerResult msg_server_impl
+         }
+ 
+         t = avahi_alternative_service_name(n);
+-        avahi_dbus_respond_string(c, m, t);
+-        avahi_free(t);
+-
+-        return DBUS_HANDLER_RESULT_HANDLED;
++        if (t) {
++            avahi_dbus_respond_string(c, m, t);
++            avahi_free(t);
++
++            return DBUS_HANDLER_RESULT_HANDLED;
++        } else {
++            return avahi_dbus_respond_error(c, m, AVAHI_ERR_NOT_FOUND, "Service not found");
++        }
+ 
+     } else if (dbus_message_is_method_call(m, AVAHI_DBUS_INTERFACE_SERVER, "EntryGroupNew")) {
+         Client *client;
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
new file mode 100644
index 0000000000..12dad9ef6f
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38469-1.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf]
+CVE: CVE-2023-38469
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-core/rr.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+Index: avahi-0.7/avahi-core/rr.c
+===================================================================
+--- avahi-0.7.orig/avahi-core/rr.c
++++ avahi-0.7/avahi-core/rr.c
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
index 0000000000..a62c718ebe
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38469-2.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa516166237]
+CVE: CVE-2023-38469
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-client/client-test.c       | 14 ++++++++++++++
+ 1 files changed, 14 insertions(+)
+
+Index: avahi-0.7/avahi-client/client-test.c
+===================================================================
+--- avahi-0.7.orig/avahi-client/client-test.c
++++ avahi-0.7/avahi-client/client-test.c
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
index 0000000000..82fb1ab40b
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38470-1.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c]
+CVE: CVE-2023-38470
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-common/domain-test.c | 14 ++++++++++++++
+ avahi-common/domain.c      |  2 +-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+Index: avahi-0.7/avahi-common/domain-test.c
+===================================================================
+--- avahi-0.7.orig/avahi-common/domain-test.c
++++ avahi-0.7/avahi-common/domain-test.c
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
+Index: avahi-0.7/avahi-common/domain.c
+===================================================================
+--- avahi-0.7.orig/avahi-common/domain.c
++++ avahi-0.7/avahi-common/domain.c
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
index 0000000000..403ed6fd6a
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
@@ -0,0 +1,53 @@
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38471-2.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/lathiat/avahi/commit/20dec84b2480821704258bc908e7b2bd2e883b24]
+CVE: CVE-2023-38470 #Follow-up patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-common/domain.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: avahi-0.7/avahi-common/domain.c
+===================================================================
+--- avahi-0.7.orig/avahi-common/domain.c
++++ avahi-0.7/avahi-common/domain.c
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
index 0000000000..c8d6a66174
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38471-1.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09]
+CVE: CVE-2023-38471
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-core/server.c | 27 +++++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 6 deletions(-)
+
+Index: avahi-0.7/avahi-core/server.c
+===================================================================
+--- avahi-0.7.orig/avahi-core/server.c
++++ avahi-0.7/avahi-core/server.c
+@@ -1253,7 +1253,11 @@ static void update_fqdn(AvahiServer *s)
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
+@@ -1263,17 +1267,28 @@ int avahi_server_set_host_name(AvahiServ
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
index 0000000000..a789b144ed
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38471-2.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/lathiat/avahi/commit/b675f70739f404342f7f78635d6e2dcd85a13460]
+CVE: CVE-2023-38471 #Follow-up Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-core/server.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+Index: avahi-0.7/avahi-core/server.c
+===================================================================
+--- avahi-0.7.orig/avahi-core/server.c
++++ avahi-0.7/avahi-core/server.c
+@@ -1267,10 +1267,13 @@ int avahi_server_set_host_name(AvahiServ
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
+@@ -1278,7 +1281,7 @@ int avahi_server_set_host_name(AvahiServ
+     h = label_escaped;
+     len = sizeof(label_escaped);
+     if (!avahi_escape_label(label, strlen(label), &h, &len))
+-        return AVAHI_ERR_INVALID_HOST_NAME;
++        return avahi_server_set_errno(s, AVAHI_ERR_INVALID_HOST_NAME);
+ 
+     if (avahi_domain_equal(s->host_name, label_escaped) && s->state != AVAHI_SERVER_COLLISION)
+         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
+@@ -1288,7 +1291,7 @@ int avahi_server_set_host_name(AvahiServ
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
index 0000000000..f49d990a42
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38472.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40]
+CVE: CVE-2023-38472
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-client/client-test.c      | 3 +++
+ avahi-daemon/dbus-entry-group.c | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+Index: avahi-0.7/avahi-client/client-test.c
+===================================================================
+--- avahi-0.7.orig/avahi-client/client-test.c
++++ avahi-0.7/avahi-client/client-test.c
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
+Index: avahi-0.7/avahi-daemon/dbus-entry-group.c
+===================================================================
+--- avahi-0.7.orig/avahi-daemon/dbus-entry-group.c
++++ avahi-0.7/avahi-daemon/dbus-entry-group.c
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
index 0000000000..59f6806c85
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38473.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797]
+CVE: CVE-2023-38473
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-common/alternative-test.c |  3 +++
+ avahi-common/alternative.c      | 27 +++++++++++++++++++--------
+ 2 files changed, 22 insertions(+), 8 deletions(-)
+
+Index: avahi-0.7/avahi-common/alternative-test.c
+===================================================================
+--- avahi-0.7.orig/avahi-common/alternative-test.c
++++ avahi-0.7/avahi-common/alternative-test.c
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
+Index: avahi-0.7/avahi-common/alternative.c
+===================================================================
+--- avahi-0.7.orig/avahi-common/alternative.c
++++ avahi-0.7/avahi-common/alternative.c
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
2.25.1


