Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE4DC7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:39 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.4685.1685500471881567582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VKTw8r2V;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-25692ff86cdso2100833a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500471; x=1688092471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSblheINXhUTLsq/PDN3oz28pXY0Kiv3BvV/+YQ4Vrc=;
        b=VKTw8r2VuVOAk4MeDjD4ClqzbUlYPlUvW896Mo9TOler5H26lO5a0mXSnAbmMqSlhH
         lKEZwfyLU9Yr93G4AUXMQSMg1RDVQVFpJ0qHjX4590LmliydP4nKqbKz/sy2qVj0J35O
         geIfKS5xPorA8OB6hf0KoWjRBmeOa8kRy3AFLHV4GhSV7DvPE6SgGkHQC/JPCaeqtYu6
         pFG+XQkJaum5fo6ztboEjS5NQNvposRXPpC/ZHXrrxKMAIHe6pTxOOTTMY/A48MvTUTr
         j7MQcEic4t+dFOtVS9mYNVuGHSawvYgPSvFJIcWMdVoOfgxRbSp77SRlebtuKbX3vvUH
         BnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500471; x=1688092471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSblheINXhUTLsq/PDN3oz28pXY0Kiv3BvV/+YQ4Vrc=;
        b=dqU01msE+v4iJblv3r/h7r+ldcU3eFUoaf3+NnyaGKiDonT6g67cSmYA0CKqr4NIkj
         qR3JeYlC7OX4i9luei08haZJmy3gUBV3bXqFMQ0SUhOepYjIWHp4PR7RyJBXq+HpLICO
         rMDrZtFL3zNnIlnlLn08XIicgYE3hdmxVhtimky+gcp+bXS/9E0l2HsDgXKvEveO4EP3
         VgXQtafitogpuGXaOuLLS/+PTHkWxG0eQYRu0b6Qpojd3w+XgI2cLwHIXVImt4ytv6Qh
         WwlQupZ8Wt1U/0iT2PEjS659zo/k51J4Tys+PJ2qQ5XzMPDC4HcLPLiBHPIeS45Gr01t
         jtPQ==
X-Gm-Message-State: AC+VfDwiQZ20+kGtHJv6VXxSRGQ8UbjUCl3Rs2WZ+aao2wk3ScUTzX/p
	NMGQoP02oALxAsEv8tlMdHw6JaD73s9naKOIURE=
X-Google-Smtp-Source: ACHHUZ65DxTAtBFg1E28ivSg4Er5ryyVrYutRHgduqjPOtW13kiuZh1hyuuQg7YOqJNS4i5tN1n2JA==
X-Received: by 2002:a17:90a:2808:b0:252:dd86:9c46 with SMTP id e8-20020a17090a280800b00252dd869c46mr4132419pjd.31.1685500470575;
        Tue, 30 May 2023 19:34:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/13] curl: Fix CVE-2023-28319
Date: Tue, 30 May 2023 16:34:08 -1000
Message-Id: <f7d6751828683ac2adbf140e77dbf7454cfa8eb1.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181970

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Add patch to fix CVE-2023-28319

UAF in SSH sha256 fingerprint check

libcurl offers a feature to verify an SSH server's public key using
a SHA 256hash. When this check fails, libcurl would free the memory
for the fingerprintbefore it returns an error message containing the
(now freed) hash.

This flaw risks inserting sensitive heap-based data into the error
message that might be shown to users or otherwise get
leaked and revealed.

Link: https://curl.se/docs/CVE-2023-28319.html

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-28319.patch            | 33 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28319.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-28319.patch b/meta/recipes-support/curl/curl/CVE-2023-28319.patch
new file mode 100644
index 0000000000..c0bca9a56e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28319.patch
@@ -0,0 +1,33 @@
+From 8e21b1a05f3c0ee098dbcb6c3d84cb61f102a122 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 8 May 2023 14:33:54 +0200
+Subject: [PATCH] libssh2: free fingerprint better
+
+Reported-by: Wei Chong Tan
+Closes #11088
+
+CVE: CVE-2023-28319
+Upstream-Status: Backport [https://github.com/curl/curl/commit/8e21b1a05f3c0ee098dbcb6c]
+Comments: Hunks Refreshed
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ lib/vssh/libssh2.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
+index bfcc94e160178..dd39a844c646b 100644
+--- a/lib/vssh/libssh2.c
++++ b/lib/vssh/libssh2.c
+@@ -695,11 +695,10 @@
+      */
+     if((pub_pos != b64_pos) ||
+         Curl_strncasecompare(fingerprint_b64, pubkey_sha256, pub_pos) != 1) {
+-      free(fingerprint_b64);
+-
+       failf(data,
+           "Denied establishing ssh session: mismatch sha256 fingerprint. "
+           "Remote %s is not equal to %s", fingerprint_b64, pubkey_sha256);
++      free(fingerprint_b64);
+       state(data, SSH_SESSION_FREE);
+       sshc->actualcode = CURLE_PEER_FAILED_VERIFICATION;
+       return sshc->actualcode;
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 70ceb9f370..e38bf14cc4 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -45,6 +45,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-27535-pre1.patch \
            file://CVE-2023-27535_and_CVE-2023-27538.patch \
            file://CVE-2023-27536.patch \
+           file://CVE-2023-28319.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


