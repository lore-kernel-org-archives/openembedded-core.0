Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE14C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 16:41:21 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.62328.1717346473335259794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 09:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hLarMdx8;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f6134df05fso32951515ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1717346472; x=1717951272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EKikVjPu5kZ84OisPFIqK9wvmURfIe/LF6OHxAkdGDA=;
        b=hLarMdx8UIeMfuuVeniXVhL5P2bcaz0N0sDylvPKX/Ztp+wwfPinHUNry5Q3rJE0G9
         Mj57UqrzNDTlCGyaCFy4ljFRyg8xF29MeulT0wRpnbeYpFjVCgAU7MfNkjcbyaL8Fmhi
         L0vdBCmuW+FcKj+WXVY0sb50w+XBZyS9krwFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717346472; x=1717951272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKikVjPu5kZ84OisPFIqK9wvmURfIe/LF6OHxAkdGDA=;
        b=PXr+E1DpraOxaYf8vMdq+IdYb3viQOvUhSpTyG+DByucIyiNeqlXn4P1XmKm1b3nd3
         WtCt5pEFX7D+wihS+Y9+BkAzZyB/YN2WKHoLm4B95T2ZTlP44E0bS8CGgGI7b0p98buR
         aN9poDbUYg2KNRETOSfMf6m2FKudxZ48eV9pVvpXmwBcTF5pg3ZYVKoFgbREy+joP29E
         guAbHmSvuy8X17n8MJ/2PNddFLZ91SD9qfBTUVLXeZ1ndr8fjCcrcDyCiA9fRW/OTSvP
         F7jrkVf5COhYtbUeJuTaOCqb5n16ehmskxS7lJnNvLrm2dGVnHlpMFJvb61bmA3o5ZlB
         PDSQ==
X-Gm-Message-State: AOJu0YzZqZ4AA5/qK5CpckcBR8T7woPISRCYvmNNc44qSQH0PoFigmtd
	8AwpmvE/X1fl6rcD8/jBQsBuxFA9oIcrMgWsx/39IoERYE6jF6wtWGuDJP5DpWtUNA3xMx3Emzd
	k
X-Google-Smtp-Source: AGHT+IHAyESWEFyk8ZDLv5mDPGH+8cKF587LWhplDuckSRRNTu2cwDL3Uu74AHMhtbXD+qzUQcfHng==
X-Received: by 2002:a17:903:124f:b0:1f5:e635:21fc with SMTP id d9443c01a7336-1f636ffe629mr78764065ad.21.1717346471455;
        Sun, 02 Jun 2024 09:41:11 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.46.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232dcb6sm48976475ad.61.2024.06.02.09.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 09:41:11 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH] openssl: Security fix for CVE-2024-4741
Date: Sun,  2 Jun 2024 22:11:02 +0530
Message-Id: <20240602164102.126228-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 16:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200211

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/c88c3de51020c37e8706bf7a682a162593053aac]

CVE's Fixed:
CVE-2024-4741:Use After Free with SSL_free_buffers

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssl/openssl/CVE-2024-4741.patch       | 44 +++++++++++++++++++
 .../openssl/openssl_3.2.1.bb                  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741.patch
new file mode 100644
index 0000000000..4cb9806c75
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741.patch
@@ -0,0 +1,44 @@
+From 9c24e8a8e04d4bb6de5198bc40a0bdbd860aded0 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Tue, 23 Apr 2024 16:34:46 +0100
+Subject: [PATCH] Only free the read buffers if we're not using them
+
+If we're part way through processing a record, or the application has
+not released all the records then we should not free our buffer because
+they are still needed.
+
+CVE-2024-4741
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24395)
+
+(cherry picked from commit 38690cab18de88198f46478565fab423cf534efa)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/c88c3de51020c37e8706bf7a682a162593053aac]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+
+---
+ ssl/record/methods/tls_common.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/ssl/record/methods/tls_common.c b/ssl/record/methods/tls_common.c
+index 08e519a..f46da0f 100644
+--- a/ssl/record/methods/tls_common.c
++++ b/ssl/record/methods/tls_common.c
+@@ -2129,7 +2129,10 @@ int tls_free_buffers(OSSL_RECORD_LAYER *rl)
+     /* Read direction */
+ 
+     /* If we have pending data to be read then fail */
+-    if (rl->curr_rec < rl->num_recs || TLS_BUFFER_get_left(&rl->rbuf) != 0)
++    if (rl->curr_rec < rl->num_recs
++            || rl->curr_rec != rl->num_released
++            || TLS_BUFFER_get_left(&rl->rbuf) != 0
++            || rl->rstate == SSL_ST_READ_BODY)
+         return 0;
+ 
+     return tls_release_read_buffer(rl);
+-- 
+2.44.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
index 9bdf7e1ec6..c1f5591f8e 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://bti.patch \
            file://CVE-2024-2511.patch \
            file://CVE-2024-4603.patch \
+           file://CVE-2024-4741.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


