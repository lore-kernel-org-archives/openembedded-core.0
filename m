Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAD4C77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 11:33:03 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.47483.1685359974175319204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 04:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AY/E7YGK;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64d3578c25bso3792312b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685359973; x=1687951973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVtuClxez+HDIxHnc+R1q0wn7IjTwjwDe27Mrmjthlo=;
        b=AY/E7YGKM8MgPxiA4gxcjhptlTlkzgRwQx9cHUstyY3P1kSAKI1jhVrVc/Ok+fFaeo
         IpFMmu6umN0/olNTra6tYHY/3/EyskjeIkPra+clKvizBmNzSH+K5Xl7yqyTN8Wq8ChD
         TJ+CIk3TVvINzw3roByqbF52cG9vqlrTj91t0u0PlJ1h52IjASm2ECVHB0fW7PrDcGUF
         YQCCmnO2tP7JCk596hU7jyZ6j7FY2m0J+vyvnj9t9kIls8ZQlPo0a7VdEpQzMBwVJ5jl
         vfXiXW0sPzck31+8w3Aiu2/4Ol5H9Dz0U+gLsiD+JsrCZtlNUj8mE6FkUfi5bMvWZu0w
         4lGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685359973; x=1687951973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVtuClxez+HDIxHnc+R1q0wn7IjTwjwDe27Mrmjthlo=;
        b=N8supvync5BycBsMTYSxx4PPtzMhFqVzLC0bqP1sjdgHvSSNtLNCDRvASuNOK7n5/G
         5DlMNOW8ZfgU8IIc2JFhxUt3lB0iC/ml4cX79iaeiW+nP5GBPhdr/N6HQ4xty6bcgWUs
         ZH1VBQHCZIbTmP6/pcX77xebt2vckX8ZfWqj4D+0XP59CqRULYgoBI6G18VoVu+AjuH9
         9VcvQ7pWGOFbVZyNX98Lhzl9ltZEJoxksce0FmP+8n3P/BkVV7glT833E56tJCob5qlH
         uNInl4XUuk6+8roUvla6qdQ0+zydrjNCbadp6SCEgK47Ggoh7EiblNUvU6l9UjzqO8O7
         js5w==
X-Gm-Message-State: AC+VfDxD6i+JPzYr2szgwpTU3TapKWbYuuO3EJSSx8W1DV9qkrscIMX9
	NsGtIPj5Pm2syc8/ohVScJKrJUVBdwY=
X-Google-Smtp-Source: ACHHUZ402hK0FRGi4tMoaOKLDJ/1TpGp08I3sXjDjktDB6HxrcfPPeZCiEEXQj00xJ2Uyaj7PL6JKA==
X-Received: by 2002:a05:6a00:3924:b0:646:74ce:a36c with SMTP id fh36-20020a056a00392400b0064674cea36cmr14379880pfb.8.1685359973337;
        Mon, 29 May 2023 04:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f26:2235:3507:cad8:e3af:bc2])
        by smtp.gmail.com with ESMTPSA id a15-20020aa780cf000000b00640defda6d2sm6524228pfn.207.2023.05.29.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 04:32:53 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH 1/4] curl: Fix CVE-2023-28319
Date: Mon, 29 May 2023 17:02:43 +0530
Message-Id: <20230529113246.1353022-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 11:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181865

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
2.25.1


