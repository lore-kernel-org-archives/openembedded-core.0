Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64BBC369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 05:13:31 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.12224.1744780407121055621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 22:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=e5HdNB91;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so4902447a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 22:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744780406; x=1745385206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cWgWolLrjgbgwqRJanGY0atl5CDlXnWTmc3KRhpaIds=;
        b=e5HdNB91l9MWpHSlHHymH00K2gWm+bJe2InF3y8hlW7aaJrrkh5TBW3rJjRT9LD22a
         5ZvZ3xXv5zcJGx68gRE6qkG5VNzaAer5s8X6Nus8zbQfGsogz0BQmGB4++KTLf5l2vId
         vnajHh8FXTe9yknQ0jv9VBmVr2zaD8CJ8ZQAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744780406; x=1745385206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWgWolLrjgbgwqRJanGY0atl5CDlXnWTmc3KRhpaIds=;
        b=bjqVrnKqVFccLasc2M/dKfIbNvoFMgZ0ztl6KIfXw8AQ4fFGxTDUNYAj/XBw2SZwkZ
         4a+IDC3GlfDPrIpv1gB/lpG8AxxPp1zSuwOrzi5hUyz72fNjuP6j6Q6kVk2HVf2LxZQE
         5CmTfeDmVLLGgZP7IwIyQ22DPZFYZ6SkVkSUqjuT4yxslL3S8PAwORTfuVcGjWk1FZga
         wRkcYYX3jGWCSUYB8r1x6s+RMyL+s8adCnJbGpefFw2tf7YJ0HOyE+XjykB7c0NeTnyA
         CjXz3TtM1gPM3XTgpBmOQs9795mTCjKfjkmMvhZnGviPHWlxJRNyt9ChLv/6NS9NmkGz
         Na8Q==
X-Gm-Message-State: AOJu0YyiE0AY9sb9hJu5ihW0jS8bwbFGdxVWH7ykoXyG/nQD+SH/3nnT
	0rQ3OR4mpYJvwr1onQPikkUfC/qbS8cqugOgM2epc3VN6R5VzxWQOqH/K9cG9/i+TQVw7nIcAaa
	ZITQ=
X-Gm-Gg: ASbGnculq2mxvLiL6WkP9lAnum+NoeXtCyxShqK7ZyRdpJRV9vyhskz9PWKjDUpPbbP
	SzfTBXDt+D5oh34IT52cMA6/LvQOHiEwzW129dMzIKmsSD52GpXTTzUOH8jBPxkk2ghRnrO3kCq
	Cw4OTyuaGT0sI7c7OR3gZrEKGiO4Xfpcy4TXQKrGsMXs3r2XjnukyoAdyfYqB4LQj12QV35q6nO
	AY8vcYdsHwrpd3y7XImDmRxUkKBiyzJoVh4l926h0yLgwibBORYTOvOPBEC4iIXEosyvB3iyYIu
	y0la1c4IbC4FEI9rNC6Y+JMzZhR8ou5cj99yPUkXZl77grJlQcE=
X-Google-Smtp-Source: AGHT+IEWl1vb5SN+X0Yw4jdo8kPvFsTq8FtnvgbjhHeoVZdZ0/3ZHP3odNPjs0zWFrESktMRZEcCTA==
X-Received: by 2002:a17:90b:2745:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-30863f30492mr737436a91.18.1744780405964;
        Tue, 15 Apr 2025 22:13:25 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.229.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3086122a8absm582419a91.35.2025.04.15.22.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 22:13:25 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 1/5] libsoup: Fix CVE-2025-32910
Date: Wed, 16 Apr 2025 10:43:10 +0530
Message-Id: <20250416051314.96105-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 05:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214974

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


