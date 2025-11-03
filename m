Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0537CCFA08
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:59:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2244.1762203571013149585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e+FXWweh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29570bcf220so26598245ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762203570; x=1762808370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbzJhZneSkI5CKHwBjD+/w6YVujFi5n4XANcVyV2s7s=;
        b=e+FXWweh6hvbO7wNDfYXs8SuAo5p8IQstlwviaKiQ3av/s/JkpR65k3P0/JNkarYVS
         0hdIe0ueNBcSTInWb9izFZkdJi01eabJWPpgDrfALVZw5/bgCGgRrKiiYXXRRJfB3LQk
         nl7ejUY01ayY/Kcw7/xv0uBS3DlRUAiPEdGmZ2xrSx1U9OOQIoshwE7XIFTABDekRtda
         FrJbskHx7Rm1oQ+HlhO4gk9alR7EqCbocSPUrNjrz5WybEUlDJCsrgLQZIF+zbyqpqey
         XmaSjo4HdBprx4ItRJIc3IKOWLhLo59hPH1PUOKM3Qvdzvis72SyzHT72oJBGvXze08c
         0QHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762203570; x=1762808370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbzJhZneSkI5CKHwBjD+/w6YVujFi5n4XANcVyV2s7s=;
        b=sMjbmQpUPnvQKI7yfxALx3NHLk2H29Nx76LgPXfg/HXmLcpe4xb7AtrJbUUjk8mXCe
         TlkfQCRg7LqaG5uT56ej9y62GtdTbDo4YIGjgmiajY6xQTGRdweFGkNp3c/6kWwusnc7
         YFy919PgIs5airRbCk0f5x1ABvju4pv8rHlHib6+Zf88WfdAPSMndx+NNXAyK7ap0W/W
         rec+OFdjWsuWd3PtsP0nepNhp/II0LzrqAx46R0ShMM6WiBHT1ygrnylIX+zdz3YtH75
         adB2scU2OYuc6B40bMpLIJ+MgE8t5/kLupQR2YlRMiTWalvnEO8y83uYFp3jkGE7+cNo
         RXzw==
X-Gm-Message-State: AOJu0YzZhbTl+CAujcA9EPn+C/eSuRpiKPzr010Nh9zCgLGlzHADPuIw
	jaAMW0ofAa9SAlvH13uX2qlLMRsLzaz7rStE6yDER8TT3udPZc5GLWV8+5gduvngGZgoubh87DO
	uGI1BgVk=
X-Gm-Gg: ASbGncviUiT3JRZq7QAFQV92bNi17qpwtpetW0cDr1EvAhrrVtMDYyYiMyxYZ4XOeWL
	5znCEA80UQflmIi372A7sVNsXTNiDc4gDxUri+LP2wpdbuj2l5XZrsUWEV0ImmL16hi+xUe9DOM
	DKadDgeUoloUrWfRNYsKOC1Ltmua42Z+mBKx6ZLYKdaRLgSXNqGFozLQkzinLq/qtK9P6tbQAKD
	VzoUXliVCw4ME6QtuMhXEbpq+htNU1rTSiES3yTElAeyBU6jNF4nw+8pyU/v5CQxsqvXA/dRcyB
	s7wKGHRAcIff+35eBV2aIdMmIagf4yguO8Ty2nBK+jnq0y1tdNOiqA4Epp/pBjUHoqGofm9wYYF
	K6pYUYj0Wb2OMhjrsu2let6MIdrKWFRwzOK3PJrD3lubtqik9G9l45tp3jB0i/PPUY2c=
X-Google-Smtp-Source: AGHT+IF67qwpBbRw5RzNcVBmYjiImDp5mbYUS3wANbrP+9KMXcjdwCnl8GNuymbEvme3xrdM10u95g==
X-Received: by 2002:a17:903:384c:b0:24f:dbe7:73a2 with SMTP id d9443c01a7336-2951a45a272mr170714395ad.31.1762203570287;
        Mon, 03 Nov 2025 12:59:30 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:6a2d:a521:f4d2:20a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415b02891asm2024911a91.9.2025.11.03.12.59.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:59:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] openssh: fix CVE-2025-61985
Date: Mon,  3 Nov 2025 12:59:09 -0800
Message-ID: <5170bd2f8a63bcc310667a327ea2ab96c783c4f6.1762203396.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762203396.git.steve@sakoman.com>
References: <cover.1762203396.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225698

From: Archana Polampalli <archana.polampalli@windriver.com>

ssh in OpenSSH before 10.1 allows the '\0' character in an ssh:// URI, potentially
leading to code execution when a ProxyCommand is used.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2025-61985.patch      | 35 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch
new file mode 100644
index 0000000000..7333d5aae8
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch
@@ -0,0 +1,35 @@
+From 54928cb9eaa7143ff17f463efa7ed3109afdbf30 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 4 Sep 2025 00:30:06 +0000
+Subject: [PATCH] upstream: don't allow \0 characters in url-encoded strings.
+ Suggested by David Leadbeater, ok deraadt@
+
+OpenBSD-Commit-ID: c92196cef0f970ceabc1e8007a80b01e9b7cd49c
+
+CVE: CVE-2025-61985
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/43b3bff47bb029f2299bacb6a36057981b39fdb0]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ misc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/misc.c b/misc.c
+index 6135b15..3d133b5 100644
+--- a/misc.c
++++ b/misc.c
+@@ -934,9 +934,10 @@ urldecode(const char *src)
+			*dst++ = ' ';
+			break;
+		case '%':
++			/* note: don't allow \0 characters */
+			if (!isxdigit((unsigned char)src[1]) ||
+			    !isxdigit((unsigned char)src[2]) ||
+-			    (ch = hexchar(src + 1)) == -1) {
++			    (ch = hexchar(src + 1)) == -1 || ch == 0) {
+				free(ret);
+				return NULL;
+			}
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 345051c8dc..780ece8999 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2024-6387.patch \
            file://CVE-2025-26465.patch \
            file://CVE-2025-32728.patch \
+           file://CVE-2025-61985.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.43.0


