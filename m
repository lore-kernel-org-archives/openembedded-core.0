Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E851AC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 04:08:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.403.1700107695431575694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 20:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DB9YRHwP;
 spf=pass (domain: mvista.com, ip: 209.85.210.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so340405b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 20:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1700107694; x=1700712494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wnquqNxBlw2nj5bqbFJ0SYKQGeWsINqjOdrctkAe3v8=;
        b=DB9YRHwPPLhk8bgjjjmhh87jTLkOOWiHKjQr5RXk+bc5He8uoAA2KV8hGpQIzQ5y+x
         uRpm6XB0OEQ7+ax+wbWyZVYA6DSeiaM1dOnjoT6z0STu+5n0Sbjh+UB8WNsaL6U1jdwd
         tpeo+0FfF9zPtv52jIKoTosZ8Xw/la4jfgW/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700107694; x=1700712494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnquqNxBlw2nj5bqbFJ0SYKQGeWsINqjOdrctkAe3v8=;
        b=mWtHzlrhmPWJkqS38LLOWTBxeQmBbwptCpb5cQ5d2ltlaDz8P0rI3J5tWn82fT4w+h
         ncd6mqTRdPSASUOQXz4wm7CNjxhTj3eb1tvIAYZmYAM4OmWbhF7r6k175tvutac9nC6L
         KUjpik1BDSm1DYv60wAJn1FlTmZK9ReJAKjeYn9cRsT+WENaiDXcPPlYNy9OC0XVOv8z
         r/ToiNIZcYm9yWnBMoLWKjtdwZ/xj+FiooPJnGpeOsyGBtIiIHEnOLnizmbOy4dcLvKC
         AE14G6qqckYbYTHAQPmqaXP7lMxUYHWVCm3ovcbMHKq+II69Tq4TecqHcbHb8ChJsCEJ
         APpg==
X-Gm-Message-State: AOJu0YxgbQmKTKidqaqLpRVpXh//NoH3tZDKz4kv8GToBc5QrYIkwrDg
	63xH1ToCvnlAdTDt6x2KvEMb4DNv9z/DjKw9zLM=
X-Google-Smtp-Source: AGHT+IE+c6hrocJspCdZZwOjNBKkGil3Uwlb9jyDoLC10nEUnqHQcnoRnghTVFpraleZWs4pAj7QEQ==
X-Received: by 2002:a05:6a00:2314:b0:68f:dcc1:4bef with SMTP id h20-20020a056a00231400b0068fdcc14befmr18363577pfh.7.1700107693774;
        Wed, 15 Nov 2023 20:08:13 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.37.150.92])
        by smtp.gmail.com with ESMTPSA id fb32-20020a056a002da000b006933f504111sm3660425pfb.145.2023.11.15.20.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 20:08:13 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] avahi: Fix for multiple CVE's
Date: Thu, 16 Nov 2023 09:35:49 +0530
Message-Id: <20231116040549.11447-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 04:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190751

From: Vijay Anusuri <vanusuri@mvista.com>

Patches to fix:
 CVE-2023-38469
 CVE-2023-38470
 CVE-2023-38471
 CVE-2023-38472
 CVE-2023-38473

Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf
&
https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa516166237
&
https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c
&
https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09
&
https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40
&
https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   6 +
 .../avahi/files/CVE-2023-38469-1.patch        |  47 ++++++++
 .../avahi/files/CVE-2023-38469-2.patch        |  65 +++++++++++
 .../avahi/files/CVE-2023-38470.patch          |  56 +++++++++
 .../avahi/files/CVE-2023-38471.patch          |  72 ++++++++++++
 .../avahi/files/CVE-2023-38472.patch          |  47 ++++++++
 .../avahi/files/CVE-2023-38473.patch          | 108 ++++++++++++++++++
 7 files changed, 401 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index b5c966c102..772fb43939 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -26,6 +26,12 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
            file://handle-hup.patch \
            file://local-ping.patch \
+           file://CVE-2023-38469-1.patch \
+           file://CVE-2023-38469-2.patch \
+           file://CVE-2023-38470.patch \
+           file://CVE-2023-38471.patch \
+           file://CVE-2023-38472.patch \
+           file://CVE-2023-38473.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
new file mode 100644
index 0000000000..99c717daf3
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
@@ -0,0 +1,47 @@
+From a337a1ba7d15853fb56deef1f464529af6e3a1cf Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Mon, 23 Oct 2023 20:29:31 +0000
+Subject: [PATCH] core: reject overly long TXT resource records
+
+Closes https://github.com/lathiat/avahi/issues/455
+
+CVE-2023-38469
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf]
+CVE: CVE-2023-38469
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-core/rr.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/rr.c b/avahi-core/rr.c
+index 2bb89244..9c04ebbd 100644
+--- a/avahi-core/rr.c
++++ b/avahi-core/rr.c
+@@ -32,6 +32,7 @@
+ #include <avahi-common/malloc.h>
+ #include <avahi-common/defs.h>
+ 
++#include "dns.h"
+ #include "rr.h"
+ #include "log.h"
+ #include "util.h"
+@@ -689,11 +690,17 @@ int avahi_record_is_valid(AvahiRecord *r) {
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
index 0000000000..b83a70e29b
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
@@ -0,0 +1,65 @@
+From c6cab87df290448a63323c8ca759baa516166237 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 25 Oct 2023 18:15:42 +0000
+Subject: [PATCH] tests: pass overly long TXT resource records
+
+to make sure they don't crash avahi any more.
+
+It reproduces https://github.com/lathiat/avahi/issues/455
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa516166237]
+CVE: CVE-2023-38469
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-client/client-test.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
+index 7d04a6a..66e3574 100644
+--- a/avahi-client/client-test.c
++++ b/avahi-client/client-test.c
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
+@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     uint32_t cookie;
+     struct timeval tv;
+     AvahiAddress a;
++    uint8_t rdata[AVAHI_DNS_RDATA_MAX+1];
++    AvahiStringList *txt = NULL;
++    int r;
+ 
+     simple_poll = avahi_simple_poll_new();
+     poll_api = avahi_simple_poll_get(simple_poll);
+@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
new file mode 100644
index 0000000000..1cbb00dcab
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
@@ -0,0 +1,56 @@
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
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c]
+CVE: CVE-2023-38470
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-common/domain-test.c | 14 ++++++++++++++
+ avahi-common/domain.c      |  2 +-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-common/domain-test.c b/avahi-common/domain-test.c
+index cf763eca6..3acc1c1e4 100644
+--- a/avahi-common/domain-test.c
++++ b/avahi-common/domain-test.c
+@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
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
+diff --git a/avahi-common/domain.c b/avahi-common/domain.c
+index 3b1ab6834..e66d2416c 100644
+--- a/avahi-common/domain.c
++++ b/avahi-common/domain.c
+@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, char *ret_s, size_t size) {
+         }
+ 
+         if (!empty) {
+-            if (size < 1)
++            if (size < 2)
+                 return NULL;
+ 
+             *(r++) = '.';
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
new file mode 100644
index 0000000000..8242646da1
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
@@ -0,0 +1,72 @@
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
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09]
+CVE: CVE-2023-38471
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-core/server.c | 27 +++++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/avahi-core/server.c b/avahi-core/server.c
+index c32637af8..f6a21bb77 100644
+--- a/avahi-core/server.c
++++ b/avahi-core/server.c
+@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) {
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
+@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
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
++
++    h = label_escaped;
++    len = sizeof(label_escaped);
++    if (!avahi_escape_label(label, strlen(label), &h, &len))
++        return AVAHI_ERR_INVALID_HOST_NAME;
+ 
+-    if (avahi_domain_equal(s->host_name, hn) && s->state != AVAHI_SERVER_COLLISION) {
+-        avahi_free(hn);
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
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
new file mode 100644
index 0000000000..43b26c1132
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
@@ -0,0 +1,47 @@
+From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Thu, 19 Oct 2023 17:36:44 +0200
+Subject: [PATCH] core: make sure there is rdata to process before parsing it
+
+Fixes #452
+
+CVE-2023-38472
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40]
+CVE: CVE-2023-38472
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-client/client-test.c      | 3 +++
+ avahi-daemon/dbus-entry-group.c | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
+index 66e3574..9a015d7 100644
+--- a/avahi-client/client-test.c
++++ b/avahi-client/client-test.c
+@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     assert(error == AVAHI_ERR_INVALID_RECORD);
+     avahi_string_list_free(txt);
+ 
++    error = avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
++    assert(error != AVAHI_OK);
++
+     avahi_entry_group_commit (group);
+ 
+     domain = avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback, (char*) "omghai3u");
+diff --git a/avahi-daemon/dbus-entry-group.c b/avahi-daemon/dbus-entry-group.c
+index 4e879a5..aa23d4b 100644
+--- a/avahi-daemon/dbus-entry-group.c
++++ b/avahi-daemon/dbus-entry-group.c
+@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_group_impl(DBusConnection *c, DBusMessage
+         if (!(r = avahi_record_new_full (name, clazz, type, ttl)))
+             return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMORY, NULL);
+ 
+-        if (avahi_rdata_parse (r, rdata, size) < 0) {
++        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
+             avahi_record_unref (r);
+             return avahi_dbus_respond_error(c, m, AVAHI_ERR_INVALID_RDATA, NULL);
+         }
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
new file mode 100644
index 0000000000..7b33d564f8
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
@@ -0,0 +1,108 @@
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
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797]
+CVE: CVE-2023-38473
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ avahi-common/alternative-test.c |  3 +++
+ avahi-common/alternative.c      | 27 +++++++++++++++++++--------
+ 2 files changed, 22 insertions(+), 8 deletions(-)
+
+diff --git a/avahi-common/alternative-test.c b/avahi-common/alternative-test.c
+index 9255435ec..681fc15b8 100644
+--- a/avahi-common/alternative-test.c
++++ b/avahi-common/alternative-test.c
+@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     const char* const test_strings[] = {
+         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
+         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXüüüüüüü",
++        ").",
++        "\\.",
++        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\\\",
+         "gurke",
+         "-",
+         " #",
+diff --git a/avahi-common/alternative.c b/avahi-common/alternative.c
+index b3d39f0ed..a094e6d76 100644
+--- a/avahi-common/alternative.c
++++ b/avahi-common/alternative.c
+@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {
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
+@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const char *s) {
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
+@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const char *s) {
+     } else {
+         char *c;
+ 
+-        if (!(c = avahi_strndup(s, AVAHI_LABEL_MAX-1-2)))
++        if (!(c = avahi_strndup(label, AVAHI_LABEL_MAX-1-2)))
+             return NULL;
+ 
+         drop_incomplete_utf8(c);
+@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const char *s) {
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


