Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460D2C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:34 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.10877.1700620293642517482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QWZrEZVM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6b20a48522fso5085365b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620292; x=1701225092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCw/al9lQ0Dsn3vxdHEyJbFMjFqmx3tnj/nrGQGMEDE=;
        b=QWZrEZVMr4yn1zZT831zOnwT/tOzOOfTcPIJmB4LBvTb5FDBQHQaVhsewNItJjU9kp
         72JYx788AG6dI4vEaUd6iwobL8CAS833hAqo8wE/5sZpafxBlNI/CNCGIjFy1eqyWS6d
         QdrPPKsVnjpKwWZlkd3F4RBWh4rQwgr/vt01EMH5kUfeVUcymm8d5eX1GIb1WSJ8eHmp
         fs+573RWbV5N6kfwVJW+CCXakDUcD+BcyXnl5mgusAB5oQXFnU/4zN3boGYxODKSHtrq
         h/BWat7QxfwLm25aAcc6gRQRDLA7fbylT+oZ8SZj2pfF994L3pB7N1iwirEBvfnTl2Op
         gELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620292; x=1701225092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCw/al9lQ0Dsn3vxdHEyJbFMjFqmx3tnj/nrGQGMEDE=;
        b=cAILr306uDbOZ4wVm3hbF0uB08rg0cWze/EdeqpZ/6C4KuWYlOmyOx+toma5HqyqXP
         VBY0Kv5LBEnUZyN990Q6nOXRrZKTLYZoUGthYstCGJORZDF1ChlynhtnuMZ5SNZYh1Uo
         px6oe3epX0dN4n1wEWXr3PY7mpMn//jFz9tHDFqzMBWoXLi96rtf+Cnz40RfGsPAjxtA
         uO5Zz/Rp/hDY8AfLPQg5bZqqmglnoIiWiktJ5oEiusgx0kxg8s7B8cAJls79LStqAtod
         xRBZmPoi5xeomQ1DtKWffbGR+abXCHfSeoV3o9qDuGMCSuPF7o6uvp+MiJuAdCDYiqf9
         YLew==
X-Gm-Message-State: AOJu0Yzgw9jyOY9KU6ol16F2VAPyKcJVWL8e5dpLG/NZCZpenKekIiVo
	gXDpeYq/qjvkwTzAyxFBKBdFzCX5M6ykJpbbTH+M3A==
X-Google-Smtp-Source: AGHT+IEIdAZSHa9xSc2HIcebBnqOQYkl3N0W/EUr0z9a3kT1T1DHcVIGZ7mygkAF4I9F1wTsJN2bLQ==
X-Received: by 2002:a05:6a00:ad6:b0:6bd:66ce:21d4 with SMTP id c22-20020a056a000ad600b006bd66ce21d4mr1016708pfl.23.1700620292282;
        Tue, 21 Nov 2023 18:31:32 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/16] avahi: fix CVE-2023-38473
Date: Tue, 21 Nov 2023 16:31:05 -1000
Message-Id: <3a9b67f222d6e004a8b56eedca6ff869e9aba710.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191007

From: Meenali Gupta <meenali.gupta@windriver.com>

A vulnerability was found in Avahi. A reachable assertion
exists in the avahi_alternative_host_name() function.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2023-38473.patch          | 108 ++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 23801a7e54..af5284a252 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2023-38470.patch \
            file://CVE-2023-38469.patch \
            file://CVE-2023-38472.patch \
+           file://CVE-2023-38473.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
new file mode 100644
index 0000000000..8a372a072a
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
@@ -0,0 +1,108 @@
+From b448c9f771bada14ae8de175695a9729f8646797 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Wed, 11 Oct 2023 17:45:44 +0200
+Subject: [PATCH]common: derive alternative host name from its
+ unescaped version
+
+Normalization of input makes sure we don't have to deal with special
+cases like unescaped dot at the end of label.
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797]
+CVE: CVE-2023-38473
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ avahi-common/alternative-test.c |  3 +++
+ avahi-common/alternative.c      | 27 +++++++++++++++++++--------
+ 2 files changed, 22 insertions(+), 8 deletions(-)
+
+diff --git a/avahi-common/alternative-test.c b/avahi-common/alternative-test.c
+index 9255435..681fc15 100644
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
+index b3d39f0..a094e6d 100644
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
+--
+2.40.0
-- 
2.34.1


