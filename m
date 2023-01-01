Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BF2C4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:06 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.15992.1672594685131258197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gcVzzvQ8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id n12so14918941pjp.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6smei+h7TB8iHTYfKwokjSpXJX27nAs4JOfQisy6rtk=;
        b=gcVzzvQ8Y5/3PJDk+MT6efjARt9ghAenwprDWRbTxI+fImC5rDyxKZADtCo6NbQxkk
         FoLT6FTuZhtN2jN/aNy/+FLK30g9MqphQztk1oTENHtevlKd1JyOT8dS3smgwEwMp9Dw
         PAZoywj94gl2EYwOlwBy45r0wB3CgHQj1DkJ1dy/eFKTF2B5FP6kYshE0Or+olhDsNE/
         AUm5VeuEMZtLpo7X3XwMw/pBOHIdbhC9cOysZT2MbIK9Gj0DI+xg6cbPNcGkyzmbGv33
         FFS+REDOc8DoJVq/cE8EVck0RErmf1RAiV2sekFJepJllF40Zl535eulqtYLD/+/LjII
         5E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6smei+h7TB8iHTYfKwokjSpXJX27nAs4JOfQisy6rtk=;
        b=2BCpp06CY+AS2S5CHuf0fp/vDjiS63b4qvHvWd4+yl5jRORAukKICXqCzFi/kOF9sQ
         mzeJNzgIVCbRWtwm06G2r5Q4fq00m9/xLnSe9ltihyzkk/b3RrrcnihNxJSB2cS1jNut
         xBYyAVQuBUWyIV0/CL4+PNFKy3KqT0wOru7dvXkdJItt9Q8c0yVg2lnXkRJ71L3LGyJy
         j6fbwETL2uZ/cf5Htxu3l2MiXyLb8ImrjXzfeXF3Nkxdy8qe6KWeFNuOv5XVZSxn/G/x
         q7bcMxQlmg6Xkk/iLwjGJ/XgGGS4guCIDB9LaOMBtWv1EJetMnzg5/F0cT1tpNnYvxfY
         ZOWQ==
X-Gm-Message-State: AFqh2kqFaPe6N0AC2ghYQ0kpYmQciaB2zdIG0z/bkF0cgl/yLzTtLxK5
	C9hW7J95Ta+IxLh1tCBPq7xydChFpcRqUx3+QKw=
X-Google-Smtp-Source: AMrXdXsmtQDS7U8JF3FjKUoNjv7HvICOt9KM6neIVkokTJbIaVfPqdK3uq12GaPjN39QS8PTaDVf8g==
X-Received: by 2002:a05:6a20:2d9f:b0:9d:efbe:205b with SMTP id bf31-20020a056a202d9f00b0009defbe205bmr46069239pzb.17.1672594684042;
        Sun, 01 Jan 2023 09:38:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/29] curl: Add patch to fix CVE-2022-43551
Date: Sun,  1 Jan 2023 07:37:26 -1000
Message-Id: <c262d999034001d1253330b3c65996d0d5fb113f.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175192

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix the security issue "curl's HSTS check could be bypassed
to trick it to keep using HTTP. Using its HSTS support, curl can be
instructed to use HTTPS instead of using an insecure clear-text HTTP
step even when HTTP is provided in the URL." as per below link
Link: https://curl.se/docs/CVE-2022-43551.html

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 4774ae7f2b..bd68e40ca4 100644
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


