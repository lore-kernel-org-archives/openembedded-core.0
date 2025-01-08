Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F51E7719B
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:24 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.31958.1736371039327649230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iKQtDQSP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2156e078563so2488945ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371038; x=1736975838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb4N5OIutkSI9AJA+SF8IvtGbLWfJ7qIxYex1q+DtsA=;
        b=iKQtDQSPBsBrYUQEA8l7cZ2/bzHXoY/WGggRX48qeCWlcGF0o35fWnh/Kr9zp81Lsy
         Zqc0OLznWGG7O/8B8l6GhDy0Civc2qeKd02I9XVvSp+jDG3HonapDjJLosGG1llgCTTM
         Lz1KYhjjYF1weOWeSgg+Jqb5XharzFcVJ0Y4WSTUiANiEoyMC6AcvweuRsLK4YpO/N0v
         UMiLGUeLAG2Puuz2ZLUwpho1MWnXvaQluqN+wLMjMSUp4/UdiQmzE5wLZ71wpRSmmLLu
         cZXDp75Ck97ylUVnMpz+39KyI6rPbZGjfBqtur5FVEmamA1niDgg8szWMHdjv5lZB8P8
         Szpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371038; x=1736975838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gb4N5OIutkSI9AJA+SF8IvtGbLWfJ7qIxYex1q+DtsA=;
        b=u3ojac3CKt0lN0f/Gq6fL2QzsyKoGboE3agsysuWL4yQRqKXhFbwyweIQvd+HlbM4T
         j2KIAUHotgvFjVpigcSXqBkWiD2b7b5v7SdEHCHenpCTNbHV+e3GbcWWvh7GQhAm+18U
         Usz9Cd6C75c6qSmo5z2gWnC9eafQr5s0plEtDY9vk2VIUxP3tQkv46Nb8zpwPe0wHJBZ
         zWFYvBwl2SmmENEmxY5vDG/OoygtpiUTYydQSq9VFUkaZAwxRQNriNZScKguVu+Tj3wY
         zcAQn7lpW+uKKKvWjKFfNgzB8/+nUNAnd/rwrgS/H7aazFObyM5KG8mosqFv68IpLP/g
         BZoA==
X-Gm-Message-State: AOJu0YyJTYonaKNbDrNkcLBEEY3/pIFGQb7nGZzfDHTsn8ggZt+PNTTf
	KTHA1FGvp/6TIGg6+e2lcJ8oWx0JwE/kv2peE+PzWXKGb4GnoOLn3czp4e70TvYKv+HOzgFGrE9
	BMtk=
X-Gm-Gg: ASbGncsmBCZ89qPgh3cINHruiHSR0eCbT2pD4uJf/iBGbYisM7n5MxldHLY+SHcDEnP
	H2IBxB8EjRVxsXMw2UhJ7vYOs5XqfWhssN/HA9IUdLlSjJQGHiSq0wh9yk5/qSrmOqL+tQI4Q8b
	+4RJUIx/bM3vdf17a9E26Sx3Qw7Ds9O+H6BB/nvCG4N6T923DHvq9VLxjWbc4kMI91GD9AifNUK
	QbwBRMTzjFa28znOPENyICQeSlgE9OUqPw9nMSe/eTz/Q==
X-Google-Smtp-Source: AGHT+IF8JxyqeudgnbWsLTKK3LhQsDmt5rcSZVfy2jO1Ze/G3/zKueiVzH6ez/ziHFCwPzwHFzr6cQ==
X-Received: by 2002:a17:902:d552:b0:215:96bc:b670 with SMTP id d9443c01a7336-21a83f4c0b2mr53240955ad.18.1736371038573;
        Wed, 08 Jan 2025 13:17:18 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 02/18] expat: upgrade 2.6.3 -> 2.6.4
Date: Wed,  8 Jan 2025 13:16:52 -0800
Message-ID: <4b3f573bd2f8c233459e1a3031dce562bb640cff.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209592

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2024-50602

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5dc22afe3d2ea767f084b7c6e3625cb6edd66522)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/{expat_2.6.3.bb => expat_2.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.6.3.bb => expat_2.6.4.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.6.3.bb b/meta/recipes-core/expat/expat_2.6.4.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.6.3.bb
rename to meta/recipes-core/expat/expat_2.6.4.bb
index 5ae694a004..f383792793 100644
--- a/meta/recipes-core/expat/expat_2.6.3.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "b8baef92f328eebcf731f4d18103951c61fa8c8ec21d5ff4202fb6f2198aeb2d"
+SRC_URI[sha256sum] = "8dc480b796163d4436e6f1352e71800a774f73dbae213f1860b60607d2a83ada"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.43.0


