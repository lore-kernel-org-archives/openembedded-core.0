Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4B6C61D99
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:34 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.10880.1700620286752575416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f8uo0ZmB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53fa455cd94so4191732a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620285; x=1701225085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HrqdG9xORZbbYqxsmNruMXBrHYi8m9uxkXmYMWa4LM=;
        b=f8uo0ZmBCc2zhE/u7GxF/76aW1mQgg+3pShcILXmKVgQp7Ypm4WmWZ6mVN1pgqbCfm
         eJbAVF94hxYhLYKV3q5xMbqcPp7Bo9ZPC/a1WpJsacwL99EXp1pc4xEpd27Zcny0jni2
         ohwx8hRIOT36+ESKVZJbUgn9VdMpo6YT9n+OEUCw5xhf/XUH6ao+MxafCPk7dgP7g3DX
         F6gIRNlO0CjDoYhSpWQ5Uv4TuG2NEuhIxzRvwdJR2c+/Cw7kBg+FESH3tT9/OOoUe0Ul
         lsDC08nEJ9ZwCREdiGV2FCD/8GfBOoVCfIgwLZnQypItp0bISzN89X4B6dGtjhBKgWPM
         sJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620285; x=1701225085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HrqdG9xORZbbYqxsmNruMXBrHYi8m9uxkXmYMWa4LM=;
        b=arWAIetRQdWRNmw9qha0Hw+zXmrWPpPVjDB4izACVVydjoHm3G6BqQy12V6UNZSbfL
         5PxM5JaH/WSBd9px1BNS5hcytrGA6HVK/RB30f+D2rME7pGwF7YI5o3INTfrTsIN7779
         QrXkzM6VKHbUzX5UMS2dvh38PZYxYMb1RYoClrMxaksGJjHu5TjTsu8S98WzdZUBLioi
         9giE9SCXzejXM7mEYbHQXelnyrGubfAjgK1jK7qoHPJixLCu58SnVG4PpvN/ONWevJq7
         LqrDI4YF4/WrBq1rTw2bYfv29jiU3JmcpoLpH8nkcFkcOS7hSBRm6BBYUiZdzwZcSW8m
         OZlA==
X-Gm-Message-State: AOJu0YwnMoPjQKzkqyhorVPEDpn4zl6We+C8r8MapDm9AXwlxOxqP1Xe
	75+iFyge5SdA11Fy3wIp7MeTOlyAp7Mld2BE7C/ZyQ==
X-Google-Smtp-Source: AGHT+IHt52vBDTYxTYCY4BA3gYJFCSVFhw+mWVuZ76RIZVHdbutxy28OMsdEKYFbbdMy1G5ltuSdVA==
X-Received: by 2002:a05:6a20:e104:b0:18a:e455:a3ae with SMTP id kr4-20020a056a20e10400b0018ae455a3aemr1191818pzb.40.1700620285312;
        Tue, 21 Nov 2023 18:31:25 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/16] avahi: fix CVE-2023-38471
Date: Tue, 21 Nov 2023 16:31:01 -1000
Message-Id: <f4286c3a3070fd50e334a48f1b7c068d34747115.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191003

From: Meenali Gupta <meenali.gupta@windriver.com>

A vulnerability was found in Avahi. A reachable assertion exists
in the dbus_set_host_name function.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2023-38471.patch          | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index b5c966c102..ac04b42614 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
            file://handle-hup.patch \
            file://local-ping.patch \
+           file://CVE-2023-38471.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
new file mode 100644
index 0000000000..40b61b71dd
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
@@ -0,0 +1,73 @@
+From 9cd4ea89b3ac89b7bb0196fda1aa88cd51b106b6 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09]
+CVE: CVE-2023-38471
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ avahi-core/server.c | 27 +++++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/avahi-core/server.c b/avahi-core/server.c
+index e507750..40f1d68 100644
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
+--
+2.40.0
-- 
2.34.1


