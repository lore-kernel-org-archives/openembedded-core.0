Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DF1C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.10876.1700620291890526283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=otGepQyq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6c4eb5fda3cso6332073b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620290; x=1701225090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LS7Dk+qrRwZ9mXVS/9Env6v+R1kvn27M59iIRL0Dd58=;
        b=otGepQyqmOu+sgkHLyhTWocnR3VSNAD8HK6onVHniomU2BNDG/zAfjTxHqhfj/PkkF
         JAvEKAcJh9c+3XboA1PlWobhqY5l7AYcy3GakumCBzzGMsXphpNYXBqGGn5JdwE83BnE
         hd4+NlPHRedEKD2/sIFiiVuw6WwZj3L7mqJQDWx5u7pZBnyXFaDTk7nkJSQaejk9iwJD
         S8FlN2hmFe6vYdQyapEncS0Z97qppLTXgQW0FmCh/Z8ITGMdQGyzX1iP3L2nW4joymdp
         2HJNaZJ88LAR9a2T/QLZ/RTmYzN7tZDFbON207IBYYp4MsPbdTANN/hKtLIb425Hed5P
         LX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620290; x=1701225090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LS7Dk+qrRwZ9mXVS/9Env6v+R1kvn27M59iIRL0Dd58=;
        b=iK1fbOsJTzPpS0+CYPEOTXV9mgpO7aF0xFRmOhhX1kUUqpK1yKRUl1VR+hR5F5M255
         rFcXfJr6f1BDZGcSQc/L9OBZEBGnQzJbm9i5dvPvliwyaxB+T516F6WaWcLfQMy/PytX
         mI61VDc2hdZZOG5Pb6c9fa5vJ3Bli2ygBK81O309w/aJVuBsI+28WROf71KoE6rwugW9
         kgGLRogN4mO4erSBHvH5l/R3FrTmsXn3j4WT9FdltbV/m27T8WaHfIj6aGB8vOX1dxoo
         BA5Ge2gPoQqLmvA/sulQ9hPI8SEQ/88alSGZrfgaocB2Z468rE4niyVK4LHns9+tompi
         Enrw==
X-Gm-Message-State: AOJu0YxMlG3MbvTwcxe4GTpes/3nfeHtFAST7+2ZAV4iQmyJkwCs9JGX
	M5zzpV9ROjz+1ChuCCAHrae+6xvJTgbPMTPhB+Xd2A==
X-Google-Smtp-Source: AGHT+IFlhf0xWAAmIoaUdb2kpuCf04OqSSV4/vh9FlB1OgGdo2EK0IEjK+YhmW4mlOuBse66P5LqBA==
X-Received: by 2002:a05:6a00:2314:b0:6be:4e6e:2a85 with SMTP id h20-20020a056a00231400b006be4e6e2a85mr1175220pfh.30.1700620290569;
        Tue, 21 Nov 2023 18:31:30 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/16] avahi: fix CVE-2023-38472
Date: Tue, 21 Nov 2023 16:31:04 -1000
Message-Id: <1b699ac1e8519cd488ee033919b9205283b7b465.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191006

From: Meenali Gupta <meenali.gupta@windriver.com>

A vulnerability was found in Avahi. A reachable assertion
exists in the avahi_rdata_parse() function.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2023-38472.patch          | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index c733f94e42..23801a7e54 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2023-38471.patch \
            file://CVE-2023-38470.patch \
            file://CVE-2023-38469.patch \
+           file://CVE-2023-38472.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
new file mode 100644
index 0000000000..2f172622c9
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
@@ -0,0 +1,46 @@
+From 4e2537500dd0a1333845482f1f4147ef906030dd Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Thu, 19 Oct 2023 17:36:44 +0200
+Subject: [PATCH]core: make sure there is rdata to process before
+ parsing it
+
+Fixes #452
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40]
+CVE: CVE-2023-38472
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ avahi-client/client-test.c      | 3 +++
+ avahi-daemon/dbus-entry-group.c | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
+index 7d04a6a..57750a4 100644
+--- a/avahi-client/client-test.c
++++ b/avahi-client/client-test.c
+@@ -258,6 +258,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     printf("%s\n", avahi_strerror(avahi_entry_group_add_service (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site", "_http._tcp", NULL, NULL, 80, "foo=bar", NULL)));
+     printf("add_record: %d\n", avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "\5booya", 6));
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
+2.40.0
-- 
2.34.1


