Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232E9C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:46:01 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.15388.1721310360064708908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E7OD4Pag;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-78964fd9f2dso558851a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310359; x=1721915159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAkNpWnSKRt5BmLxxPwZJSpdZ+nQYkhnAQxi1uErDo0=;
        b=E7OD4PagIJkKzw0ZZF89KSe7WETkUcG8lOIy8zqDSa6CL0BYrQkmycYDEhf1Amyqg5
         ne5+qFB1886rGNlky9fL35p/v+tDzuolAuyikbM1wkcoyr7yFqJqIqIYw3Vhli+nBkxk
         tNEOZapqhRQHv0UxdEyNg2C7jO8RM3uw95V5efSjP0En8XRRsVns61eGmoWNYCeX5JmX
         68WCAVfvBksA5MCLFf5aLbVl+3YqhAQj0tzfPbpe+60CwRwNwmAy6amd+XMWzwDy6ofg
         XxtZFGKkIQW63VvK78U0+tChZETReM25c2i+uRJIKFcYrQPUOZSdObz3ytEczhhVW/JM
         qmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310359; x=1721915159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAkNpWnSKRt5BmLxxPwZJSpdZ+nQYkhnAQxi1uErDo0=;
        b=cFblZ7M40Qgw1/Uto8fnTiTxBEOYKh+oMX3GzLVSYavHNtTShoo8Aak8u5mSWy61AZ
         hRnFRgQDecNOBt+hI+zyQUsra10lTQ7Hit63Cvv7hI/FuGIfAKklEbXVZlATB8hO9y1J
         vjBDraVLH57vK+HEtUieC0rNYezB9rUzAnCDDlfUmBb/6o25mb7o8hcMOb5JKBF0TmvK
         Gf8rSh9Hc0iUQBG/2eZHvjAkv6aNrmUsqShjaVKSijP8FYSyFP/Kim8YOFTYal0Mprcf
         tc86rJCoio9SRrfUCKwj58jFtf5VKJYudazjtP9xf4AMx6Cn60EYhcHRmWn01OjYBot1
         fjOQ==
X-Gm-Message-State: AOJu0YwCZgqjC46uprISgxC0QXl9TSDO9P/fjRFiE+yJCHv6IaO3QQqa
	8qsOZan4SqHuKlgrOHaObtqN9msr+195uwHVl+0mJQqX1uQhEBEdwgnOWCBSKPdluo3r85KSIdO
	C
X-Google-Smtp-Source: AGHT+IHMgSzBw0I4gANgWSgcoaAT2WYRvJsVES8h8aNs9m4T58WqDbS/cyD5eqmMUo0oLeOgMLjyKw==
X-Received: by 2002:a05:6a20:d50a:b0:1bd:1d15:f089 with SMTP id adf61e73a8af0-1c3fddf9dd8mr4717054637.54.1721310359050;
        Thu, 18 Jul 2024 06:45:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.45.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:45:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/12] openssh: fix CVE-2024-39894
Date: Thu, 18 Jul 2024 06:45:34 -0700
Message-Id: <644716564d8c223c71be635e2f1794c74ae23d7f.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721310237.git.steve@sakoman.com>
References: <cover.1721310237.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202218

From: Vijay Anusuri <vanusuri@mvista.com>

ssh(1) in OpenSSH versions 9.5p1 to 9.7p1 (inclusive).
Logic error in ObscureKeystrokeTiming option.
A logic error in the implementation of the ssh(1) ObscureKeystrokeTiming option rendered the feature ineffective and additionally exposed limited keystroke timing information when terminal echo was disabled, e.g. while entering passwords to su(8) or sudo(8). This condition could be avoided for affected versions by disabling the feature using ObscureKeystrokeTiming=no.

References:
https://www.openssh.com/security.html
https://www.openssh.com/txt/release-9.8

Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/146c420d29d055cc75c8606327a1cf8439fe3a08]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2024-39894.patch      | 35 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-39894.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-39894.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2024-39894.patch
new file mode 100644
index 0000000000..898295340d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2024-39894.patch
@@ -0,0 +1,35 @@
+From 146c420d29d055cc75c8606327a1cf8439fe3a08 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 1 Jul 2024 04:31:17 +0000
+Subject: [PATCH] upstream: when sending ObscureKeystrokeTiming chaff packets,
+ we
+
+can't rely on channel_did_enqueue to tell that there is data to send. This
+flag indicates that the channels code enqueued a packet on _this_ ppoll()
+iteration, not that data was enqueued in _any_ ppoll() iteration in the
+timeslice. ok markus@
+
+OpenBSD-Commit-ID: 009b74fd2769b36b5284a0188ade182f00564136
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/openssh/tree/debian/patches/CVE-2024-39894.patch?h=ubuntu/noble-security
+Upstream commit https://github.com/openssh/openssh-portable/commit/146c420d29d055cc75c8606327a1cf8439fe3a08]
+CVE: CVE-2024-39894
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ clientloop.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+--- a/clientloop.c
++++ b/clientloop.c
+@@ -612,8 +612,9 @@ obfuscate_keystroke_timing(struct ssh *s
+ 		if (timespeccmp(&now, &chaff_until, >=)) {
+ 			/* Stop if there have been no keystrokes for a while */
+ 			stop_reason = "chaff time expired";
+-		} else if (timespeccmp(&now, &next_interval, >=)) {
+-			/* Otherwise if we were due to send, then send chaff */
++		} else if (timespeccmp(&now, &next_interval, >=) &&
++		    !ssh_packet_have_data_to_write(ssh)) {
++			/* If due to send but have no data, then send chaff */
+ 			if (send_chaff(ssh))
+ 				nchaff++;
+ 		}
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 3cdf0327b0..8bc4f4269a 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
            file://CVE-2024-6387.patch \
+           file://CVE-2024-39894.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.34.1


