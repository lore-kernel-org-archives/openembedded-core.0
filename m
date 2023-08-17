Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF84C52D74
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 19:02:47 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.2178.1692298966151107837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 12:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=QjtPoph+;
 spf=pass (domain: baylibre.com, ip: 209.85.167.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a7d7de894bso50124b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692298965; x=1692903765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAHQYkNZ9mha0cRro4uNUtAinvGfSg3fgNrjZP+UA1U=;
        b=QjtPoph+/Rwk4PHvO3R01SNhs9gOV21nMh8ab35jxmcYgHRASPI1PMLSI3g+pd0qvs
         8ARvX4Uf8gN3zGptWJdjsyIQuXO6nYSG7MEgYDjG6RTs4iYH00C82afsLYzlaUUJdIPq
         YmeZmMQ9Zj019jfT2r557FMhpqJKCYRsWOQ6578VXs57M9976xRP6yuNHJLDaAq5KOzn
         iw2S12XCO4fMI1n66q0k5dzARXNuo8JLP+jsXTxJ33/9PRijoOWoBelKlbPjAXGcuht8
         e9hmiuDV/OOvc/7yewdI1/OsZ47cZIpgMAwMMGAe9PKmR4Q/cqdUVkF0aiBGlkJ9lF+5
         pJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298965; x=1692903765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAHQYkNZ9mha0cRro4uNUtAinvGfSg3fgNrjZP+UA1U=;
        b=YYuvIdf+fjUgGAQLn7Mz1lIogmGzqir+7GOTgUObBNuqULsDAxofplHff6FZkH9mOR
         cSjhn3rCVJGddSuFz1wKLjjEUUxFPJeCRzTRsC9+A8oM3jfp/hx3ZhEOqeS2Ky3BzFHo
         3CRPRXrb5daA+eilw/Gy8HUIbgn4urO7eXdEAA6zG8x07u4AWNi6TryldM7KBqVhMxio
         QfK8p890n6zRoSiQ3XmdtU9VnKyAwi9i5VQm/j8XShOREwAJvwXy9bm1a7nkQ0JsRFPa
         H0bXGwII/Gvp2xmSQYJAYYsqxVES1NaT2RU1zjod9isEww52lGWFpyWXcYN1cPMMaYRP
         9gOw==
X-Gm-Message-State: AOJu0YxZY0Y5/RXsHsu368JOEOEzmEybjqJP6ItD6RL03F9O0jvzXZYU
	d0rhLOITKy/szDssPNiCUtr6leXGXeR/eYeQUIs=
X-Google-Smtp-Source: AGHT+IEubQ0uAB2iiBzX/g1s4ZE7Vxl5akUn7DRmu4r8/PGxrBRO7927OqBUfG+lYKcXjTNmoo2Exw==
X-Received: by 2002:a05:6808:1307:b0:3a4:894a:9f57 with SMTP id y7-20020a056808130700b003a4894a9f57mr496792oiv.6.1692298965437;
        Thu, 17 Aug 2023 12:02:45 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k17-20020a0cf291000000b0063d47a29e6fsm80998qvl.55.2023.08.17.12.02.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 12:02:45 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/5] python3-trove-classfiers: upgrade 2023.7.6 -> 2023.8.7
Date: Thu, 17 Aug 2023 15:02:40 -0400
Message-ID: <20230817190241.2302457-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817190241.2302457-1-tgamblin@baylibre.com>
References: <20230817190241.2302457-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 19:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186337

Changelog: https://github.com/pypa/trove-classifiers/releases

- Add Trove classifier for Python 3.13 (#150)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ifiers_2023.7.6.bb => python3-trove-classifiers_2023.8.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.7.6.bb => python3-trove-classifiers_2023.8.7.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb
index 7879dc2031..9aed0d62e4 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8a8e168b51d20fed607043831d37632bb50919d1c80a64e0f1393744691a8b22"
+SRC_URI[sha256sum] = "c9f2a0a85d545e5362e967e4f069f56fddfd91215e22ffa48c66fb283521319a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.41.0


