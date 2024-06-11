Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9528C27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:07:56 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.9097.1718111269124265928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kn0Goort;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6818eea9c3aso4129474a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718111268; x=1718716068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HB3wQQSTrKKRN+iyiyn8aw6p67oxD/UTIcrsqdB/ft8=;
        b=Kn0Goort6wAUS9MC+gs1Yzw3LQ96SihrQNKtxLE9TwL5bDC4urkUol/dKeOJUbmUri
         d3xwCgNdCU25EU4MsTeNc7OLNN++VZpTVm18IiQPC9Kg9y8YVKkgmfqoS8iYV6YDNmVi
         CNu+RsFgXmQhT2I75D+wPqoqXZil/9VVZ2Wwn9Cq2Up6vZwjGkSghefBo1TEdM4V3epf
         Zl39+I81iIc3ZpW/xjxz60YIbeZskJIUHgz2Jr34aAiq4aCgOCHIHt21fP0Nir2U0sLK
         jOZDbkn7QQXYcZUWJMPVDfznsRmrJhQoZX+S48xofFXJ8LnL5blduvon+2HkVq3hQ89r
         7+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111268; x=1718716068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HB3wQQSTrKKRN+iyiyn8aw6p67oxD/UTIcrsqdB/ft8=;
        b=MjdB/mso11DIetrn1Lvk+K+khKFk47t3TG9v/p8mnSDlazInqFiOTUYub76OQyfxQW
         IqLWfPaJu4i4jMQrhkOtg/NHjyWU4w4Or+b3GjfLsr0/CMp813ADFZMyXOFvVV9CecgP
         ggOE/Bke0ceyMY0cozEdnjLKExz7S83K9xla1yk/b/bUWp/4PCoaiSDwqkPTruXRUlWp
         toYLQpDxQSnXHJaxVehJJL/tEMGQZh/pqE2LNDJ8j5TAz0sLg6eoG8gY/JhwelVWd01g
         nA+GjU8uszYUjWzqnGzFeOUbjxybTxVJQYB4VjR238c4j0NBybX39Gkjt5ZqHKF6z2pD
         ztMA==
X-Gm-Message-State: AOJu0Yx3YnSd5MwS1XGn2LBrHg+XHXrhnesJ/E5ZgOZ9Nm7M2r7cVxnI
	00PQmduyM7nIDS0dRdDr2qWsCruFEzUUBfoSMcpfw4NSTbYZaIfJp4kVmX1X3MAZQDoyP1ZOObr
	o
X-Google-Smtp-Source: AGHT+IEFgkI6rNxiFeu0iGDC8K48agYDPvWfmFPOAnqzBGZW8882u7SpFduFPyQLnYlajtL5AI/w7A==
X-Received: by 2002:a17:90a:b793:b0:2c3:3cee:7d7b with SMTP id 98e67ed59e1d1-2c33cee928cmr982919a91.0.1718111268118;
        Tue, 11 Jun 2024 06:07:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3076dcf04sm4380915a91.48.2024.06.11.06.07.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:07:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/10] classes: image_types: quote variable assignment needed by dash
Date: Tue, 11 Jun 2024 06:07:23 -0700
Message-Id: <a3b51197f3ce868c83ed5ca415bd6506ecc2575d.1718111104.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718111104.git.steve@sakoman.com>
References: <cover.1718111104.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200517

From: Martin Hundeb?ll <martin@geanix.com>

The change in commit 39fc503036
("classes: image_types: apply EXTRA_IMAGECMD:squashfs* in oe_mksquashfs()")
assigns $@ to a local variable without quoting it. While this works with
bash, it fails with dash. Here, only the first token of $@ is assigned
to the variable, and the reamining tokens are passed as arguments to the
"local" keyword.

Fix it by adding the missing quotes.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 14ca134f9f72d518c9180156a8efac19f8bb3ab0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index b4a83ae284..2f948ecbf8 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -113,7 +113,7 @@ IMAGE_CMD:btrfs () {
 
 oe_mksquashfs () {
     local comp=$1; shift
-    local extra_imagecmd=$@
+    local extra_imagecmd="$@"
 
     if [ "$comp" = "zstd" ]; then
         suffix="zst"
-- 
2.34.1


