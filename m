Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F89C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 05:37:29 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.39673.1671687440722601396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 21:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ND/PBBfZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 79so635167pgf.11
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JIzwNqNGA3tTMnidk7sCooYQdMYrrfLvCljkiPMQ3cs=;
        b=ND/PBBfZ8yG2QHzifH/X1sG5O6TIhN7YXaC01HE9xWENaZyj8YOfKUDBpPgX14xCvW
         DneifTF+PlObCAymm9+ImIPS98QNHuWtbEOg7POjZc9tEuVsgSUlsuGsrfVHWb6F9Xu/
         fEORZYsW0B7zT2QlzVAV+tR6gjJViL/TZVqDfWkrdpBFn9WWA1vxUlZLBLA+dIIbuAeq
         kuHzVubwo5O6fYW89IDWZB/5KnlOzYWFkWHv39QHtU2DPsuQgQv76901w6vTTwsWGgS6
         HHDosyEytoOjlD/fhdk8M0dcdnlJUecAaUi6lo+nw8+QvFnbSpPZdupNJ9QSm9E6xAJN
         aJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIzwNqNGA3tTMnidk7sCooYQdMYrrfLvCljkiPMQ3cs=;
        b=nomd8Dlf8JmGP4z+uQWc8LIvqe1Yme9COvZlcbKtqI5M0oPjTgSDybktgI3KftGwmz
         WbnR4jD6Ndt0IXQhcdnSsA7FQiGLr8eKiPkP7S3/TIlvmFnVZ50CwsuJh0rr/M7A5wur
         J6og6QQv9SGEAXhLu6mV7Pzo68yzoHHorwEZkkBMlwu5NgXpznnl8LhkcP+CmpHtGLs3
         5xffR1uYkgNrNL2qfuSDREjgwz5IdHrXt6D5yo9aIzUYhgk1Fy0SHadUcy1laPDeusoU
         EykR3ihZtYLu65f09NjEmR04ZLBtGTvL1+XFnpduMGrArhwQ0PdpR7zrhW9uk0BKgQ5C
         eckg==
X-Gm-Message-State: AFqh2krFTU5aMyw1ebkllSey93MD8tb7f0ji7T/Ne8CuRcxlRea+7363
	J/0DAH+aqZQmRDSjYiVmMWHbIpLGV5c=
X-Google-Smtp-Source: AMrXdXuWsjL+BRIo0gBLnAyu7JM8Ss9PaAfA7ecqoMmiDMpozKqYesATWaw3HpftiuRUHwoEpjS9Cg==
X-Received: by 2002:aa7:87c7:0:b0:57a:9b14:69b7 with SMTP id i7-20020aa787c7000000b0057a9b1469b7mr4469440pfo.0.1671687439691;
        Wed, 21 Dec 2022 21:37:19 -0800 (PST)
Received: from localhost.localdomain ([103.85.11.254])
        by smtp.gmail.com with ESMTPSA id p62-20020a622941000000b0056b9ec7e2desm11438258pfp.125.2022.12.21.21.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 21:37:19 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][kirkstone][PATCH 1/2] curl: Add patch to fix CVE-2022-43551
Date: Thu, 22 Dec 2022 11:07:08 +0530
Message-Id: <20221222053709.20001-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 05:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174955

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix the security issue "curl's HSTS check could be bypassed
to trick it to keep using HTTP. Using its HSTS support, curl can be
instructed to use HTTPS instead of using an insecure clear-text HTTP
step even when HTTP is provided in the URL." as per below link
Link: https://curl.se/docs/CVE-2022-43551.html

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../curl/curl/CVE-2022-43551.patch            | 35 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43551.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-43551.patch b/meta/recipes-support/curl/curl/CVE-2022-43551.patch
new file mode 100644
index 0000000000..e1ec7bf72e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-43551.patch
@@ -0,0 +1,35 @@
+From 9e71901634e276dd050481c4320f046bebb1bc28 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 19 Dec 2022 08:36:55 +0100
+Subject: [PATCH] http: use the IDN decoded name in HSTS checks
+
+Otherwise it stores the info HSTS into the persistent cache for the IDN
+name which will not match when the HSTS status is later checked for
+using the decoded name.
+
+Reported-by: Hiroki Kurosawa
+
+Closes #10111
+
+CVE: CVE-2022-43551
+Upstream-Status: Backport [https://github.com/curl/curl/commit/9e71901634e276dd050481c4320f046bebb1bc28]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comments: Hunk refresh to remove patch-fuzz warning
+
+---
+ lib/http.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/http.c b/lib/http.c
+index 85528a2218eee..a784745a8d505 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -3652,7 +3652,7 @@ CURLcode Curl_http_header(struct Curl_easy *data, struct connectdata *conn,
+   else if(data->hsts && checkprefix("Strict-Transport-Security:", headp) &&
+           (conn->handler->flags & PROTOPT_SSL)) {
+     CURLcode check =
+-      Curl_hsts_parse(data->hsts, data->state.up.hostname,
++      Curl_hsts_parse(data->hsts, conn->host.name,
+                       headp + strlen("Strict-Transport-Security:"));
+     if(check)
+       infof(data, "Illegal STS header skipped");
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 87f4cd13aa..20a602920d 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-32221.patch \
            file://CVE-2022-42916.patch \
            file://CVE-2022-42915.patch \
+           file://CVE-2022-43551.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


