Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F13AC77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:05:21 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.48720.1681718718684670746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JUYMkbzG;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id la15so1512782plb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681718718; x=1684310718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JwT99BTdVYAwmxr8SeaiRwYdM1sV/KvIrJl2pDmf8As=;
        b=JUYMkbzGVblf+YZEVATSF5d6NkBXxwOUf6i8B3Xq4Gb2F2n9w1pZFn3uyfciO1DbnW
         EIjD2w2IF7E93lnZOx53kext9c+r0uewVDaWB6lZ1KkU0J+hZLY4Hp8SNynAmR6xzSey
         bBe9s8E3RIOuQHD7UHEme3opAlZ26X8YxqMXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681718718; x=1684310718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwT99BTdVYAwmxr8SeaiRwYdM1sV/KvIrJl2pDmf8As=;
        b=jsCIUD9dJS8VF1UHc22RBEsZaY6EknsCgZYwTkm3Tz7h96MQVook24Vtizo35w6XD2
         WyEz8kwoMHN5SQlXH3rVEnNRcftFkwO416LNydvzz5rWshnpzWWUGEuOwmubrC6c7cs0
         O5UUZrGvhTJW9Ol63K45uEjU07aNJupp9sxbl9AcZurQ9TULESFtY4mD9Ja6gQ+amICl
         vNT7A1wWUwlZSDkGDKOxwnFy43ZfZtTFD2xLw+7sCCL8RT+UJg2GbPeAifMN/FJoL8yM
         CkVe3U6yWRnBM1mt/rOX3X8D8CZ/AwxPJTCQA4Wl8URJZ9gQF6Qr4FqjQGoelhJoxb3T
         MK2g==
X-Gm-Message-State: AAQBX9e6vCLgUEbPd+WSV5MbhgFDNzXSM20ddFDBfz9tj62mEGanPFKm
	OxMPcv5oE6XXsSPJh0OQn7Zncs19TvSNkJpTQbo=
X-Google-Smtp-Source: AKy350Y4DrnOQrD4vAnXiK2ZrI2LyDWoOfvSTDh2K6soZ1hzrUY8NaboeGKl06ZpUN7ZHIulPqp7ww==
X-Received: by 2002:a05:6a20:3c90:b0:ec:8bae:83a8 with SMTP id b16-20020a056a203c9000b000ec8bae83a8mr15758052pzj.28.1681718717946;
        Mon, 17 Apr 2023 01:05:17 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.209])
        by smtp.gmail.com with ESMTPSA id j12-20020a17090276cc00b001a674fb0dd8sm7057293plt.247.2023.04.17.01.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 01:05:17 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 17 Apr 2023 13:35:13 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] curl: CVE-2023-27538 fix SSH connection too eager reuse
Date: Mon, 17 Apr 2023 13:35:12 +0530
Message-Id: <20230417080512.169770-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180151

Upstream-Status: Backport from https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../curl/curl/CVE-2023-27538.patch            | 31 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27538.patch b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
new file mode 100644
index 0000000000..8ef81fb306
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
@@ -0,0 +1,31 @@
+From af369db4d3833272b8ed443f7fcc2e757a0872eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 10 Mar 2023 08:22:51 +0100
+Subject: [PATCH] url: fix the SSH connection reuse check
+
+Reported-by: Harry Sintonen
+Closes #10735
+
+CVE: CVE-2023-27538
+Upstream-Status: Backport [https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index f5e54c7..7dd342a 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1353,7 +1353,7 @@ ConnectionExists(struct Curl_easy *data,
+          (data->state.httpwant < CURL_HTTP_VERSION_2_0))
+         continue;
+ 
+-      if(get_protocol_family(needle->handler) == PROTO_FAMILY_SSH) {
++      if(get_protocol_family(needle->handler) & PROTO_FAMILY_SSH) {
+         if(!ssh_config_matches(needle, check))
+           continue;
+       }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 4c18afe293..b0a456016d 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-23916.patch \
            file://CVE-2023-27533.patch \
            file://CVE-2023-27534.patch \
+           file://CVE-2023-27538.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


