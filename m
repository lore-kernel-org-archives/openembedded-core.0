Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F20C7EE2A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:42 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.27817.1750604561024475578
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yN63nYXB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-747fba9f962so2480489b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604560; x=1751209360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUZK7UUS37DQD/SgGwUC3x5M9ESZCkWsaXby+sCLE54=;
        b=yN63nYXB7VMVduQfFUYFVBRocx1/HKRZr1oaRkaaDVO31EBrC34tY3EzPLw8nWuuLt
         tSEh1wns1kyFcDPAiAtUTsHwX5o6H7dpA3Wcnzt7kKOkPhzXqTfwBM7tMy3xkrRpIljB
         j42daL9NWfY5amlxdZ20Ny6h0+ezk27711sTHQmSRBILXV3pmKL9DfPH3pYxYBZcKgL9
         QyI0mFHcdB51WHz/5QN3QbZxb0X2GRWv9DnINvKjkgmMrLi9CKnVgjLM8nUtDy08rblX
         R2mKG9CHTLUjQwHi1NZGu+ZFZZHjQ4aHnI+rTmmnfl8a+ZQB2zWgmpNRwifUEgF1E/wf
         5XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604560; x=1751209360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUZK7UUS37DQD/SgGwUC3x5M9ESZCkWsaXby+sCLE54=;
        b=AMDFs8GBoaZOSKFUgGLOgZd4JuOyq17qpM/lOziPaQgWnqLwveOy63gBVDne2q8Wj2
         vhxzkNvxGCxhvRHBR1wn/7lHdc26Pfo+7AZTUtRwymCsmuLvJOqbfnNC7MZbQOBmlRZW
         ei7kXPKy7l5h3Wh8Xb3B2j1Mb5dsRbSS0pKsvevaxbOLoPoSoKB+N1cfU3QAs96E04pr
         gphsncaBAPCgqtqpEDa+Qm7YBZfEeG42Bm4uFb5sS7a+hk2PorffWXzj+nneBR1f98/X
         qHwn1rQ6r2aCXkvs9ctvJbMeU1xRSpBkxzcYTKOO8jKwUmGNvJjgkwpXzLIRSdsQ1iah
         f1Hw==
X-Gm-Message-State: AOJu0Yx/h3sODQ1TsCD1880QN+FoqZ5ownYnRtBDBSCeBBGx+xN2rI6y
	9EQrjBOMM9tiE/8DyduMMk4PMN9nw6ZC0Pd4QXyfHWFsIUcmOwTYTDlT/PJ+bfsdWNRv/kAsWGE
	sO/nfsr4=
X-Gm-Gg: ASbGncvwm/ZwFAiF/8r+TE8WdeUX3VZNAkmwTX/b1Nv2u+aBaRuJK/IyknoRd9GCpZZ
	DgPnsWDsnfxVxjTns1U2Phle4AEnggCceBHUPNLyo10WKtIDRQnsQ/RVMZq/uXHQwubzkIuuOgs
	c00qF3+kFrn6VJItbxSvHBDy/SeAFIfm8MlmiThUXE/nrBXrompoCIsLplShZW2KHs/VnZcQdwJ
	ltOjtZfHzkLX7ezqhhKUfjuVd1VGibnGrf1vrQXeQMQWpq9z0qTTCHiGKOmKPodxnmveTNiCmUS
	GyDZ/0vzsIwVjwpRAyKINtHnQeiXB8h0IovkOyLMNJA80DfCHQ2gr0TzkphZPzm7
X-Google-Smtp-Source: AGHT+IF3FWwYseTQtw+hrPcO6vPy0Fd0G3Js2qFZxBHxI1T38LPHuOiCQpUXW2A4oV+FDKvTiXBntg==
X-Received: by 2002:a05:6a00:9496:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-7490f5a435emr11746883b3a.10.1750604560174;
        Sun, 22 Jun 2025 08:02:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/14] libsoup-2.4: fix CVE-2025-4476
Date: Sun, 22 Jun 2025 08:00:06 -0700
Message-ID: <2be01469687f30f33b768164f66916b081cc8c62.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219189

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/440

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
new file mode 100644
index 0000000000..874f62e7ad
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
@@ -0,0 +1,38 @@
+From 52a0f9234d384b9dab368835b22e5a5a01542168 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 14:16:10 +0800
+Subject: [PATCH] auth-digest: fix crash in
+ soup_auth_digest_get_protection_space()
+
+We need to validate the Domain parameter in the WWW-Authenticate header.
+
+Unfortunately this crash only occurs when listening on default ports 80
+and 443, so there's no good way to test for this. The test would require
+running as root.
+
+Fixes #440
+
+CVE: CVE-2025-4476
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c?merge_request_iid=457]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index f1621ec..a2dc560 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -229,7 +229,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, SoupURI *source_uri)
+ 			uri = soup_uri_new (d);
+ 			if (uri && uri->scheme == source_uri->scheme &&
+ 			    uri->port == source_uri->port &&
+-			    !strcmp (uri->host, source_uri->host))
++			    !g_strcmp0 (uri->host, source_uri->host))
+ 				dir = g_strdup (uri->path);
+ 			else
+ 				dir = NULL;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index aa2903030d..686e3b6720 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32907.patch \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-4476.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


