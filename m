Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FC6C6FA9E
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3145.1675840917714604858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FRWK1MTC;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id u10so9596767wmj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdPL2DW102sn47lDQb1gl65YtQObZ0jltI/N7Rapv/c=;
        b=FRWK1MTCkfQY/kehyFobSugVsns+bqPqXCTN8bC5FI0U34U87cKgh3gnS7TT+074Rr
         r0DMW7sWb/Yi4zJJQZcKZsF+wOqzG5oPxSklEODsDBeTtPNeQHpl46AOabkCKcT18pYo
         JWgzKvQgoXYaDSNW96FX8JKra0HTI/iSQPxfIMehTtlxsaXGE66P11QxUPInlVBY7qZg
         +1VgNZ/e77SOJIVJXSqJU8SOPxCQozPutFeg8obM8xrYJk44YbJ9FG4rgSe4XXd5rjCj
         wSGl2pkfpqYPUAz3B2lwEXZRcw/9+v7s6UY6kIx7HosYmBXmzWvPufUceV85/EmS9ETV
         nI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdPL2DW102sn47lDQb1gl65YtQObZ0jltI/N7Rapv/c=;
        b=M4sLQI3CdGdb0xOyu+1b76ggg5OsSxmMBj6brFDaSH3LublCApUwEcgUqn6q8XWF+f
         sKyExGgCrRSa01DqwJoTYgd5I84Sciqnpe008NYIHbeL9/nVcR2lqQh0GVAdJ0JyFg2N
         ItNd6YAMF9ZUcO/NoXbBozvd84e4F8mMA10m9CLo1G6XZJq9EO77hOlBZVWhGAO7e3yb
         /7I14gAa4465vcTubJlDeSw+o5culm8vim6q6Gs5OhMG4qs4iiG36I5K/iaXgx223scS
         ulWgm3maq+hJZMqjUgJLbyukVaFFPTD1YB+3brHERZYDqTTgkwfHoI7w3i/cFGEUIpkC
         FA1A==
X-Gm-Message-State: AO0yUKWW0CF6KSa6OnvY7uQ5+Ki6nCUyX1870h9eYg9++qPwT5P5LJ/1
	90BTioulAc64Y/cytpcwmlAs2fsKCic=
X-Google-Smtp-Source: AK7set+5tcNnVET5JihHZJGTFh2d6wSIqaSUaOQVqk0QtpoLa73QjvDFtEqjdOtlzBzf7Oq9rJjjWA==
X-Received: by 2002:a05:600c:4f85:b0:3df:f127:efa7 with SMTP id n5-20020a05600c4f8500b003dff127efa7mr1025450wmq.22.1675840925588;
        Tue, 07 Feb 2023 23:22:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/52] libjpeg-turbo: upgrade 2.1.4 -> 2.1.5
Date: Wed,  8 Feb 2023 08:21:22 +0100
Message-Id: <20230208072143.2930292-31-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176871

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../jpeg/{libjpeg-turbo_2.1.4.bb => libjpeg-turbo_2.1.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.4.bb => libjpeg-turbo_2.1.5.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
index 1708fa97f0..4d21ca1e1d 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[sha256sum] = "d3ed26a1131a13686dfca4935e520eb7c90ae76fbc45d98bb50a8dc86230342b"
+SRC_URI[sha256sum] = "bc12bc9dce55300c6bf4342bc233bcc26bd38bf289eedf147360d731c668ddaf"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.30.2


