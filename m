Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D593E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 11:45:31 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10342.1771415126861596103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 03:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=F9GvAO8J;
 spf=pass (domain: mvista.com, ip: 74.125.82.178, mailfrom: rsangam@mvista.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b785801c93so316946eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 03:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771415126; x=1772019926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CN4KEvodVs+4zB1ZiPVIH9LILy3rx3YD/GEbzCKlVnQ=;
        b=F9GvAO8JQKsBu830f8+E0pnYeKuEVJqvB4I0R0b89qvJZ0Ys2Xm3lghKt7/TCzO6Wi
         HGRiB7MgIfgO0DcaMnnmB+A0tNwJv8fJxQF9OIhqEko9LGHX7T7eeZ72wg+rUFOon+8t
         4IGlj+gZqU8Ogf0PN0ZP5rCPK50IyqrL6dYWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771415126; x=1772019926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN4KEvodVs+4zB1ZiPVIH9LILy3rx3YD/GEbzCKlVnQ=;
        b=lOqtVPPyxCiVernkC/4wuRIqHXXhvmjaOUoVE84f0RRBukiMu/daq+0qFi6NCBsSVH
         7e7jh8PPdXsIFc5os5cYaVT71qjIDUytuzlYsxcuYauq6LqTnSmRA/AhgJDexs3NgM2v
         5QcKTwOtWBPCT21YdSvlpVzwZJSYdxoE+idkXOigrk5sKEV4k4qs8V+hK5GNUsPdsU78
         jC3PKb0MJmDHj+MprwBtBioh7vCE7vGr1F08iYkElE9fCBku4UYqJuCS7TE7Mhxf1XC/
         WvB1pzqOclLMcYuwiVNKcFsO3V4PwAZ2Tx9lQ351oMDsaG1S9lvc4U5IPHvJESDLNiAQ
         pqEA==
X-Gm-Message-State: AOJu0YyhAKf5Z4DkAiF5LIo9AnDbLYKp1sKrWHnpKceRby0VQJdWwb9v
	QVrhwXj4jZB6H6v/72XVHuhVgINt98DP9bovysAD75mMYk2gYU1zVe4yqeXIWXo3+x0UEJ+6eXZ
	ucVDemQA=
X-Gm-Gg: AZuq6aJPETi/Q5MiPGeZwKG7sItBfoatKBFE+lUwKeyO4jOhdkA/LeF8qlPtmheqmJw
	8QSfSuln7laZQjcgNJr6NDlp5MOgdXH+PyV5TJ3RdlEN81pZp7rJabZhiI53NnuIqDhZKcXGzgP
	xTloJluz3XEbSZzQaCgwbsMSF77RLTRLOr39D+YYxgPh8/fTmIqeV9RQHzVvaPVgslksWXHzgqW
	qX9RiRkmSJIBqUBTHzx8pPUhRI3u9v5JQEPeUsokZzom21Ru5n2Li4/J75nAAt0ZYXe+FAGDydP
	ITMPbxb8ufthsbARGzi1hQYJLHN0JaImvYcBmGg9aQY/D7xbjSyhT0JIjY/b/ONvaFvSTcpN2OT
	uLVFueha4Ie7pT3kPzc9FJrnyKRkJt3bgrGR0tKSDavXf4ND81Dpt44Dg34pq8yeUSAWONC1ozN
	r8CNeHzW0Z/te881Q3KmGrdH2ZLnGhjN7/noRk2/ZaIIY=
X-Received: by 2002:a05:7301:6782:b0:2ac:1a21:841d with SMTP id 5a478bee46e88-2bac934546bmr6916849eec.16.1771415126002;
        Wed, 18 Feb 2026 03:45:26 -0800 (PST)
Received: from MVIN00040.mvista.com ([49.207.198.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb658521sm17258019eec.16.2026.02.18.03.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 03:45:25 -0800 (PST)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libsoup-2.4: Security fix for CVE-2025-14523
Date: Wed, 18 Feb 2026 17:15:18 +0530
Message-Id: <20260218114518.16602-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 11:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231293

CVE fixed:
- CVE-2025-14523 libsoup: Duplicate Host Header Handling Causes Host-Parsing Discrepancy (First- vs Last-Value Wins)
Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/383cc02354c2a4235a98338005f8b47ffab4e53a

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-14523.patch  | 79 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
new file mode 100644
index 0000000000..3b534a64d5
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
@@ -0,0 +1,79 @@
+From 383cc02354c2a4235a98338005f8b47ffab4e53a Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Wed, 7 Jan 2026 14:50:33 -0600
+Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
+
+https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/491
+
+Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/383cc02354c2a4235a98338005f8b47ffab4e53a
+CVE: CVE-2025-14523
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ libsoup/soup-headers.c         |  3 +++
+ libsoup/soup-message-headers.c |  3 +++
+ tests/header-parsing-test.c    | 20 +++++++++++++++++++-
+ 3 files changed, 25 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index ea2f986..6cd3dad 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 		for (p = strchr (value, '\r'); p; p = strchr (p, '\r'))
+ 			*p = ' ';
+ 
++		if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (dest, "Host"))
++			goto done;
++
+ 		soup_message_headers_append (dest, name, value);
+         }
+ 	success = TRUE;
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index ff10e10..4fc6768 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
+ 	}
+ #endif
+ 
++	if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (hdrs, "Host"))
++		return;
++
+ 	header.name = intern_header_name (name, &setter);
+ 	header.value = g_strdup (value);
+ 	g_array_append_val (hdrs->array, header);
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index d20da95..63e6424 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -459,7 +459,25 @@ static struct RequestTest {
+ 	{ "NUL in header value", NULL,
+ 	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
+ 	  SOUP_STATUS_BAD_REQUEST,
+-           NULL, NULL, -1,
++          NULL, NULL, -1,
++	  { { NULL } },
++	},
++
++	{ "Duplicate Host headers",
++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
++	  "GET / HTTP/1.1\r\nHost: example.com\r\nHost: example.org\r\n",
++	  -1,
++	  SOUP_STATUS_BAD_REQUEST,
++	  NULL, NULL, -1,
++	  { { NULL } }
++	},
++
++	{ "Duplicate Host headers (case insensitive)",
++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
++	  "GET / HTTP/1.1\r\nHost: example.com\r\nhost: example.org\r\n",
++	  -1,
++	  SOUP_STATUS_BAD_REQUEST,
++          NULL, NULL, -1,
+ 	  { { NULL } }
+ 	},
+ 
+-- 
+2.35.7
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 0cc90a17cc..339b7260ee 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4476.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2025-14523.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.34.1


