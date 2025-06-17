Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C84C7115D
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:55 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.31417.1750195249687947376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=czAG7Qu/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7486ca9d396so3954591b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195249; x=1750800049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2p6JUAV4I48Id7z22H7SNSbW6mzNFQA669abKDeiSo0=;
        b=czAG7Qu/ZteIOCT0ZgVhPp1S7YA0YYUTmyJN7Ei4LPRw5yfsfyE6Fk7wBrRYZU5rW9
         N2OVwIruBKDjbtPS7EJq2EVDE6bVL3M6ex/Yb8gaAJEc9rACatUEjaX0ZX43WE8c9pJ9
         T/kpa9+A1j1IVXVxMArOGZa9CDH5OM402NVUDEpN2b+PQemDx05HIR5v5JMu7mqlRQuM
         OVgUXPjP5hohrLG9ZJDlStaiCagbySUEj2lA8JlZjX7fqXo3aKAKjtOss/Cyl/eL4/6A
         fVq3Sz1FctqTGxcPj4M4m6s8l9Fea0pnz/3OSZB8BhyPoFBFFSrhIxIBSVDB+XfXEWCe
         qAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195249; x=1750800049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2p6JUAV4I48Id7z22H7SNSbW6mzNFQA669abKDeiSo0=;
        b=OozNX5iJ04UtqukBm5kHHlyZ0NAzDkKV1qIDi7ps2Bjsp1F6vknm5gWU8eG4MAf11b
         SR+fEvHlAjPrjH+mkMTXVI/FUHlog7S6KbibMGKTTtlPf3tlIjCCP/mlTCvhGqgAjJ2m
         dlCwBIo+8pTfhpl2+4sPowWRtvFsaoQUNcbOGEKa7/4iNPBrLtXotvsnyoQ6azWw3kyK
         yp047JDhW8yIKHARtYJMXTWKYKIH4O1T3KtaAzuclUulmnxCoR0nccLmvLqgiFy9RlOn
         OHr4qqsloG3wHQEzxitshKyTQ++ZC9+1sxrdT6QKB+lgyhc9j4qpRWW0WCojFkVaMwqL
         7SGg==
X-Gm-Message-State: AOJu0YyitRLxpDTohiG317AkMH/8V1LBLu85xZ0syuE8rD7aV5VPQdzl
	VitEmwfaWclFggxXOIzky+q+iKzWvG8IvaZbWr9xWrZDubBQQSLLPAjM430FFwEvGb/KGUwJj+X
	MwpHL
X-Gm-Gg: ASbGncu4SkHh4rxfyZVgVoVeTVQUtGMpHh6w7oF5uoRfM+RzR3OyPAXvGNxnThvNbkW
	w2QtGYR0yJ9E3rIrhIHhPyLO1Bo8SeZZVYS0Jpukw8sk0YliU1lL0znrwrbgwc5dvlX2ajm2uin
	NYVbewvq/lH24EEjzveQ/7/ULj6AG8WPKzWyWtH0ghsCq9q1gOmeqeKIX5vKrgeWSSUGpNt8hx0
	dvGFOHRkxL3BKNcCHpqMuJA0+wyhf8v3sKYVPFSFlyU0kFN5ERSSPocNBHSAFzlrsx+GtvhsloS
	rNdML8ZoL40bjHduNF67t07IZ0I+rMwnOnvL58Wv1Z+f62IgvQZ8ew==
X-Google-Smtp-Source: AGHT+IHbEYc9VWUzblSy7SEBDIpCYe0NFtqr1MGRNP+3qvGsyyI5h0PnJXN1UmLucycoweskYqi0JA==
X-Received: by 2002:a05:6a00:4602:b0:748:3849:e790 with SMTP id d2e1a72fcca58-7489ccc77c6mr19556198b3a.0.1750195248814;
        Tue, 17 Jun 2025 14:20:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/27] libsoup-2.4: Fix CVE-2025-32053
Date: Tue, 17 Jun 2025 14:20:07 -0700
Message-ID: <a563a644fcdb556d904c3c391fbf9435fcd4bdf0.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218927

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
new file mode 100644
index 0000000000..139e8936a0
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
@@ -0,0 +1,38 @@
+From eaed42ca8d40cd9ab63764e3d63641180505f40a Mon Sep 17 00:00:00 2001
+From: Ar Jun <pkillarjun@protonmail.com>
+Date: Mon, 18 Nov 2024 14:59:51 -0600
+Subject: [PATCH] Fix heap buffer overflow in
+ soup-content-sniffer.c:sniff_feed_or_html()
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
+CVE: CVE-2025-32053
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index b62e4888..5a181ff1 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -641,7 +641,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
+ 	       (resource[*pos] == '\x0D')) {
+ 		*pos = *pos + 1;
+ 
+-		if (*pos > resource_length)
++		if (*pos >= resource_length)
+ 			return TRUE;
+ 	}
+ 
+@@ -704,7 +704,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 		do {
+ 			pos++;
+ 
+-			if (pos > resource_length)
++			if ((pos + 1) > resource_length)
+ 				goto text_html;
+ 		} while (resource[pos] != '>');
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index f9358773e4..61ebebeacd 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784-2.patch \
            file://CVE-2025-32050.patch \
            file://CVE-2025-32052.patch \
+           file://CVE-2025-32053.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


