Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643B0C87FCF
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:35:50 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.5118.1753392948763947394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MzdckH0M;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso1627920b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392948; x=1753997748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaVCZw7rVH9WBQNClAI9WhIhDm7oaqb72sS5HDzbtkU=;
        b=MzdckH0MwrGLmmrCBY+0kjCY3G7Dn0Qr9wM31OReKSEhA1Zc93tRnGNV9s+I8piLjS
         6wL8mevKnRs7Gg3GLZ1bACqWHw9e9JpFP69rWFmZ4Q5BNL6sJc09EpDHD0hsSZnN7U2r
         7YXnTZ1iQUsMC6tNubESQChdbRN06cIum7t73Go3WlnOr843Y0mIkAv/ZiaJyUdDYa+W
         mLGsj6vQhiPIIGU73e5vfcdTN/sjPKIbP8p7eQI70UMIz2V07H0mZ5+Jq+Xfklr2zW7Y
         mxXuh1osDcZvepQax7zObQz270fXot5JZhMN8mheTi4F+oAHvq0PDeTpMJ/3R1fh0O4h
         /vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392948; x=1753997748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaVCZw7rVH9WBQNClAI9WhIhDm7oaqb72sS5HDzbtkU=;
        b=nFo75WKLIzW+BSQuJH5fcM19Wmhk2FvRBd9fjE/JOnguq151JNt1FOQLv6yAg0jW4b
         ZVHtMfACNVjVR1nNhO69aAew3a3tdQGl1QJ1E8752+bH3DDz0NDFV2rtyaR1y4yE0GFx
         TavS3vE4adNnvo/197Oq1QDUjKmLIeM4cq3TlVOAYmuO2QoezQvRklPV1bsgiyzkgc7I
         iqLjIdXjMdSNsYyy25z+43BsWh6BJgQFjS7Gp8W3MWqjeRI10ghgbYXiWDpDXkag3+Ow
         Z0FTap4E8dqpGZPGlNaOUF90R4kxSvWbCWlKCnvUQQ5kY5JYsaTMlguc8p6F8ipNh/Ad
         JYhg==
X-Gm-Message-State: AOJu0YzxFeaJoZF1f+isj3TOjTpTPF2zSdK398v8cE+37+Y9lQsH3Fj7
	igVgcgSYTtZWcBCTpV58pfbP6o+jdp9gFlwLuG+grHy8IpioOzzsE2fOQYbwAjY4Zk7BJ7YsOEM
	hsw/G
X-Gm-Gg: ASbGncuS0a56rY/XtoRnnxC1de6JeSh5s4b8FhjAn8WUTacbmKU3Jp7TAdwV8hmfkQM
	3ewWENyF8U3mwMJu7AyBuMK7DEkdl0IwIpl+aXemipawpMUV36RUZp+nnZeR4Pe4EOav3yra2pb
	+ebuWKLdeKBvmhM90oNCIeGVuTsIgQAWaIvIv0fdxFW6d4ClffnIA6cM/g0b9YcM/sgMcLSrucX
	Pnp9smXf9G99jpTDdkvG3Lz+QQJhEs+2Vftpqp2Py/7bktee/e5lK41nyfqGWi7geqeKazQa0bp
	wPCEywj0Wo9dZpjgrgmaBdSsE5mNSCIm/bHyvxo1Xg7bcHGjp0U1MEyhWhy+n6ErEVEHaUxfabQ
	5oJLyYSmgnwmfy/By2AzEfS4=
X-Google-Smtp-Source: AGHT+IFMX/UDF1+seOia1EIfWMR/YuuCwLDZVJRoB1i5ma7XiyS2QC+BlhDt1iy1KfcdVh3IQagCyg==
X-Received: by 2002:a05:6a21:3285:b0:216:1476:f71 with SMTP id adf61e73a8af0-23d491698c9mr13907996637.39.1753392947894;
        Thu, 24 Jul 2025 14:35:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.35.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:35:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/16] orc: set CVE_PRODUCT
Date: Thu, 24 Jul 2025 14:35:21 -0700
Message-ID: <3977b007727e7029dabff0394f12dc4190e29aaa.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220878

From: Peter Marko <peter.marko@siemens.com>

There are new CVEs reported for this recipe which are not for this
componene, but for a component with same name from apache.

sqlite> select vendor, product, id, count(*) from products where product like 'orc' group by vendor, product, id;
apache|orc|CVE-2018-8015|1
apache|orc|CVE-2025-47436|4
gstreamer|orc|CVE-2024-40897|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/orc/orc_0.4.40.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/orc/orc_0.4.40.bb b/meta/recipes-devtools/orc/orc_0.4.40.bb
index e437831cd7..ee96ca0a4c 100644
--- a/meta/recipes-devtools/orc/orc_0.4.40.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.40.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "3fc2bee78dfb7c41fd9605061fc69138db7df007eae2f669a1f56e8bac
 
 inherit meson pkgconfig gtk-doc
 
+# distinguish from apache:orc
+CVE_PRODUCT = "gstreamer:orc"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG = "enabled"
 GTKDOC_MESON_DISABLE_FLAG = "disabled"
-- 
2.43.0


