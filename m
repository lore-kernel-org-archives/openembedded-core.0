Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3A9CD8C93
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:14:50 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.92771.1696947281691069657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rzLxE5cX;
 spf=temperror, err=temporary DNS error (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c434c33ec0so35032065ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696947281; x=1697552081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trQt569343pG/iNcUia0OHa1KN8yMz8aGFtDUn/CY/o=;
        b=rzLxE5cXCwgkqfdEICneWoOP83M/37xLMPVY/vteujKweyU8jDOq6qXQtyiC4RRelD
         Kq7eXH4gpquosO9hg0+D7UccHQ3nl+csNrR8Msp5rSSD9Tx1b1/lAVJyQ0diVdSK/X8a
         8JajzBxalRTu8Bj70zLdO7Ryt+4dNdQOofHrbU7tV/9nykQP8/CsmEJiCzbs+mJ6hjRh
         eASIYL6V8sNEa7UVyxYgv4cJXVWj/Wa4Xi69CbKEepqofvch/JdCoX6S1LrcrS/UECQD
         nRkpNn7YnBpJgT0oxUR2amXPplE/9xFiT+murLWRcqNPJ1f78jsSjUHUofHOCZ8GhEOX
         W7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947281; x=1697552081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trQt569343pG/iNcUia0OHa1KN8yMz8aGFtDUn/CY/o=;
        b=djZunwIlKKQiFXLPJy7v25GA4vtPGvkxFG/sJcJP+UE6PIgMPpnzB8QtTbcyoWxr+S
         b1Wakek8BRgsj+TmoCAARBPAw22X3G7elFvGzLt7ZaMqt0vHskIi3XEdatEqz/TdyKA9
         EbdD3OJcqKBm9GeUr4MZR80f0F4GmgJqnO0B2rCE0aZwdEnG6hSygkRJbdhkf7Z6Qe2w
         GEBWB2QPWvArDDVx46GjbfGhYtlpj/sz25zckTz9cpGobbPbO6UJMWAYn0yCD/yJSG2d
         W1bF9tHcbudWgcIgalVP8gC+oLa7tQ0hu7KMPbf+b2yDtii4LQMHqUrizCIF+P80LbEp
         5QEA==
X-Gm-Message-State: AOJu0YyJE8LJLHa9OkDBPW7QGsCa1XWB/kvKTyEGr2DQvyJ4qw6EIEnW
	IOVDOSdm1EDnD1h4U7M9uqAsDOOqOiE7VApSPoo=
X-Google-Smtp-Source: AGHT+IEcnUDMRdNwbVJa7oeI+vOQiANoxXoORtmgZmgT4Hl+6Y9qUctHMyK0e3VZMBszTS9NEeUvkA==
X-Received: by 2002:a17:902:eccc:b0:1c4:44a0:5c03 with SMTP id a12-20020a170902eccc00b001c444a05c03mr19134840plh.9.1696947280606;
        Tue, 10 Oct 2023 07:14:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001b81a97860asm11737610plg.27.2023.10.10.07.14.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:14:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] dbus: Backport fix for CVE-2023-34969
Date: Tue, 10 Oct 2023 04:14:21 -1000
Message-Id: <42bf7fee204890b15f80bf0749431aefb33efd99.1696946306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696946306.git.steve@sakoman.com>
References: <cover.1696946306.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188901

From: Julian Haller <julian.haller@philips.com>

Upstream commit https://gitlab.freedesktop.org/dbus/dbus/-/commit/37a4dc5835731a1f7a81f1b67c45b8dfb556dd1c

Signed-off-by: Julian Haller <julian.haller@philips.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/dbus.inc               |  1 +
 .../dbus/dbus/CVE-2023-34969.patch            | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2023-34969.patch

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 82e91c7b13..948aaf2e24 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -8,6 +8,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           file://CVE-2023-34969.patch \
 "
 
 SRC_URI[sha256sum] = "bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a6091abf51dca38"
diff --git a/meta/recipes-core/dbus/dbus/CVE-2023-34969.patch b/meta/recipes-core/dbus/dbus/CVE-2023-34969.patch
new file mode 100644
index 0000000000..8f29185cf6
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/CVE-2023-34969.patch
@@ -0,0 +1,96 @@
+From 37a4dc5835731a1f7a81f1b67c45b8dfb556dd1c Mon Sep 17 00:00:00 2001
+From: hongjinghao <q1204531485@163.com>
+Date: Mon, 5 Jun 2023 18:17:06 +0100
+Subject: [PATCH] bus: Assign a serial number for messages from the driver
+
+Normally, it's enough to rely on a message being given a serial number
+by the DBusConnection just before it is actually sent. However, in the
+rare case where the policy blocks the driver from sending a message
+(due to a deny rule or the outgoing message quota being full), we need
+to get a valid serial number sooner, so that we can copy it into the
+DBUS_HEADER_FIELD_REPLY_SERIAL field (which is mandatory) in the error
+message sent to monitors. Otherwise, the dbus-daemon will crash with
+an assertion failure if at least one Monitoring client is attached,
+because zero is not a valid serial number to copy.
+
+This fixes a denial-of-service vulnerability: if a privileged user is
+monitoring the well-known system bus using a Monitoring client like
+dbus-monitor or `busctl monitor`, then an unprivileged user can cause
+denial-of-service by triggering this crash. A mitigation for this
+vulnerability is to avoid attaching Monitoring clients to the system
+bus when they are not needed. If there are no Monitoring clients, then
+the vulnerable code is not reached.
+
+Co-authored-by: Simon McVittie <smcv@collabora.com>
+Resolves: dbus/dbus#457
+(cherry picked from commit b159849e031000d1dbc1ab876b5fc78a3ce9b534)
+---
+ bus/connection.c                | 15 +++++++++++++++
+ dbus/dbus-connection-internal.h |  2 ++
+ dbus/dbus-connection.c          | 11 ++++++++++-
+ 3 files changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/bus/connection.c b/bus/connection.c
+index b3583433..215f0230 100644
+--- a/bus/connection.c
++++ b/bus/connection.c
+@@ -2350,6 +2350,21 @@ bus_transaction_send_from_driver (BusTransaction *transaction,
+   if (!dbus_message_set_sender (message, DBUS_SERVICE_DBUS))
+     return FALSE;
+ 
++  /* Make sure the message has a non-zero serial number, otherwise
++   * bus_transaction_capture_error_reply() will not be able to mock up
++   * a corresponding reply for it. Normally this would be delayed until
++   * the first time we actually send the message out from a
++   * connection, when the transaction is committed, but that's too late
++   * in this case.
++   */
++  if (dbus_message_get_serial (message) == 0)
++    {
++      dbus_uint32_t next_serial;
++
++      next_serial = _dbus_connection_get_next_client_serial (connection);
++      dbus_message_set_serial (message, next_serial);
++    }
++
+   if (bus_connection_is_active (connection))
+     {
+       if (!dbus_message_set_destination (message,
+diff --git a/dbus/dbus-connection-internal.h b/dbus/dbus-connection-internal.h
+index 48357321..ba79b192 100644
+--- a/dbus/dbus-connection-internal.h
++++ b/dbus/dbus-connection-internal.h
+@@ -54,6 +54,8 @@ DBUS_PRIVATE_EXPORT
+ DBusConnection *  _dbus_connection_ref_unlocked                (DBusConnection     *connection);
+ DBUS_PRIVATE_EXPORT
+ void              _dbus_connection_unref_unlocked              (DBusConnection     *connection);
++DBUS_PRIVATE_EXPORT
++dbus_uint32_t     _dbus_connection_get_next_client_serial      (DBusConnection *connection);
+ void              _dbus_connection_queue_received_message_link (DBusConnection     *connection,
+                                                                 DBusList           *link);
+ dbus_bool_t       _dbus_connection_has_messages_to_send_unlocked (DBusConnection     *connection);
+diff --git a/dbus/dbus-connection.c b/dbus/dbus-connection.c
+index c525b6dc..09cef278 100644
+--- a/dbus/dbus-connection.c
++++ b/dbus/dbus-connection.c
+@@ -1456,7 +1456,16 @@ _dbus_connection_unref_unlocked (DBusConnection *connection)
+     _dbus_connection_last_unref (connection);
+ }
+ 
+-static dbus_uint32_t
++/**
++ * Allocate and return the next non-zero serial number for outgoing messages.
++ *
++ * This method is only valid to call from single-threaded code, such as
++ * the dbus-daemon, or with the connection lock held.
++ *
++ * @param connection the connection
++ * @returns A suitable serial number for the next message to be sent on the connection.
++ */
++dbus_uint32_t
+ _dbus_connection_get_next_client_serial (DBusConnection *connection)
+ {
+   dbus_uint32_t serial;
+-- 
+2.25.1
+
-- 
2.34.1


