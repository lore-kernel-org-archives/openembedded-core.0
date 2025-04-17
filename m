Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369F9C369CB
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:43:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.5675.1744886596721457737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KFUajWb3;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso18623465ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744886596; x=1745491396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cWgWolLrjgbgwqRJanGY0atl5CDlXnWTmc3KRhpaIds=;
        b=KFUajWb3NzPsEeTjdmizD2Kfg5MTZw+vGETOi7WLXV2tOhs67YzE/1hSrc2XS2QyMV
         hHPK7bgIniSQI1kVLdnxXA73JxPGZguzdzgYhJTT8bzy5c362H0fhgdE9uEbx2O5nRjj
         pm77DiRpFwUDQidvOgbKHOM3mI7rSzEC9U+Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744886596; x=1745491396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWgWolLrjgbgwqRJanGY0atl5CDlXnWTmc3KRhpaIds=;
        b=DrxGcouZ7lZFXLq2kAFqXCqparwKLMwICu1jLzMWokH4SPkKHEzZjv18m8iq/dWlYm
         0eXCjaYR1l5aHIulhX06Mr//cFRvOqx+3Z2XssAoowSQ6/Iki8kiYoc+ULtlzmUqqeko
         Rk0yf4vVyjWaB9wFwH04HGfbvsvLle+lIQC/V5FOevuYDmsGv9dXulpNRvjM/bSwgh4h
         /o4s17aFpa3Ao22UzbrmqNgVa+j7iGigEsL3xJ/cq8Wkyg7ytgBstA3R06VSGUiox6R5
         nC3/9TvMulFGvRLC+cb9jHYijLSRdJRqkazVcbMkZCFIURtcu+pJB6u41T0/srWkfZvE
         tulw==
X-Gm-Message-State: AOJu0YyPJUC7u82plWfzoubZ0dMmA3qziUDOU2du3gtFhPa2TdTG7s3o
	wSjUGnSQXuCt6QZW9oM5YBl3xhHPswqqlNIahZc2CRzlYJh8dFAOUal/uFk3vhKkmyQJYU3MXo7
	1c24=
X-Gm-Gg: ASbGncu7NHrCBY+cpM/3igdDh5+clrcHl5rfxwJ55PryzooGz6PPgNtSIvxy/m/gWuS
	hG1tZs7FWff0sKPXnUIDZTUGbnM/XHW9Yb4FAeRoDfhyC6vxPtaYB/RVym/0tRkfHU9bvm44PYv
	5kZeJ63JsftrMNU+Tr8blbsOZHvMWjsF+ElIOXuIk9Qww9TvuO8ndXsxLSDn0J8xB0B6vi3+fqu
	rc3liVeLjpLVOAwUdj61CzhGw/W6SQoPA5knRxHvt+517PY+DCezfc+yYdnmxbLSlLZSs3fgcoI
	6+2+TqeRPNWtiUyywEyNpXAbUwpMHmWqUUN+ZJ94us7dGHIbpEWE
X-Google-Smtp-Source: AGHT+IE7iPbMgzk6HuTyTxGkXZLLrmK1b88gCwi2k6EnyfHYMyjY5n4R9xZYKRzSB2LXthzHwWUp+w==
X-Received: by 2002:a17:902:d508:b0:21f:6d63:6f4f with SMTP id d9443c01a7336-22c4196eef2mr27906275ad.2.1744886595716;
        Thu, 17 Apr 2025 03:43:15 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.223.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef1025sm30346605ad.39.2025.04.17.03.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:43:15 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH v2 1/5] libsoup: Fix CVE-2025-32910
Date: Thu, 17 Apr 2025 16:12:54 +0530
Message-Id: <20250417104258.64180-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215059

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-32910.patch        | 27 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
new file mode 100644
index 0000000000..32e0c86e62
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
@@ -0,0 +1,27 @@
+From ea16eeacb052e423eb5c3b0b705e5eab34b13832 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Fri, 27 Dec 2024 13:52:52 -0600
+Subject: [PATCH] auth-digest: Fix leak
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832]
+CVE: CVE-2025-32910
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/auth/soup-auth-digest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index 350bfde6..9eb7fa0e 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -72,6 +72,7 @@ soup_auth_digest_finalize (GObject *object)
+ 	g_free (priv->nonce);
+ 	g_free (priv->domain);
+ 	g_free (priv->cnonce);
++        g_free (priv->opaque);
+ 
+ 	memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+ 	memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index b2e32b892a..757e6432f7 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-1.patch \
            file://CVE-2024-52531-2.patch \
            file://CVE-2024-52531-3.patch \
+           file://CVE-2025-32910.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


