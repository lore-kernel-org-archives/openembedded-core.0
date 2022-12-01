Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF0AC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:27:42 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.44914.1669904861418891488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QIW5EUiL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id jl24so1780532plb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6oLzprM3Sf/Ql/OXwO1Azf+UKP+R5JdPW09693ft8U=;
        b=QIW5EUiLUITlETGS9e3gWgXWk2CbA49pArEcuZtdMCqB+U8VLGP4FodugLg2QxXV8G
         fgPOrK256g9rzqy9kNbTP37Rta6Lzoe1jcXuxrtnhsrlsJk4Zl9ek9vxwnaQR0CZDoqj
         u9KjW3C1Yd8o3FMOumIWrIECqOiH4jHHmqGGxs5zf1W77+HTURWi2fI7QU2DaNc0Qnsy
         68Pb3bVhqpzA2l+m0qXo/i041ylwOYmMzO+TsTpes2CZrRoTsj3pSxkIyDlAL3EGv0eV
         eM15607UaNF87azR7/PmZ9GXr5uL0CQ5xwJedk9WS7Hhqr9jBuhhpvqwcgSOEaTCE/Yv
         Lexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6oLzprM3Sf/Ql/OXwO1Azf+UKP+R5JdPW09693ft8U=;
        b=ni/Nc0K7C2gTSwU/bih+pn6hgRAuwB3FKjdPkSz3Y8IxhdxKpvt+jsWcGW1JKCjQ6U
         EQutS24L38tQHz/i/QiBd15S14q48vhEMV/1IQXai0fEmQj5T12qnBQzcaXkRuqxV6aa
         IvMyFPsnY0BZS9khdbLBFS0+IHmDiVpFLrXDKfHApISVqFpVyeGuXBVL/o6qnXSUri9b
         Dq+2PKjzqemdDGZqLvIdObaukkPvyBAe1W5giEVhmn2HvyTc87jChLz9B4Ec8pqMb4L2
         4FyFCSjBKcvrY/k09OwaHO6nESgdniVjfu7XwZx34UnviO7l6lKZ5RY3wbVhTzI+jwg7
         bmOw==
X-Gm-Message-State: ANoB5pnINDlopU8xmz2ojNDZ+FxbGK3C9VLanf4In4LHc7Bbh49wbaDV
	9o3+B6e8yPHvBzXUETX/ZTlct9lUOEHluUEi43c=
X-Google-Smtp-Source: AA0mqf6tH/ANl31LuH3cPxgEwABKU28GTHZpAL6zMIN+Ruh5R5Mb9RJdA5PRBB/xW3sL4+cAyVlskg==
X-Received: by 2002:a17:90b:35cc:b0:213:e907:5c0d with SMTP id nb12-20020a17090b35cc00b00213e9075c0dmr67654562pjb.83.1669904860283;
        Thu, 01 Dec 2022 06:27:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.27.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:27:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/23] curl: Fix CVE-2022-32221
Date: Thu,  1 Dec 2022 04:27:00 -1000
Message-Id: <518bea85c9496d77c70d703b818e442eda841554.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174092

From: Bhabu Bindu <bhabu.bindu@kpit.com>

POST following PUT confusion

Link: https://ubuntu.com/security/CVE-2022-32221

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2022-32221.patch            | 28 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-32221.patch b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
new file mode 100644
index 0000000000..b78b2ce1a8
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
@@ -0,0 +1,28 @@
+From a64e3e59938abd7d667e4470a18072a24d7e9de9 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 15 Sep 2022 09:22:45 +0200
+Subject: [PATCH] setopt: when POST is set, reset the 'upload' field
+
+Reported-by: RobBotic1 on github
+Fixes #9507
+Closes #9511
+
+CVE: CVE-2022-32221
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a64e3e59938abd7d667e4470a18072a24d7e9de9]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ lib/setopt.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 03c4efdbf1e58..7289a4e78bdd0 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -700,6 +700,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+     }
+     else
+       data->set.method = HTTPREQ_GET;
++    data->set.upload = FALSE;
+     break;
+ 
+   case CURLOPT_HTTPPOST:
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 5368c91f5c..e0099f7453 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-32207.patch \
            file://CVE-2022-32208.patch \
            file://CVE-2022-35252.patch \
+           file://CVE-2022-32221.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


