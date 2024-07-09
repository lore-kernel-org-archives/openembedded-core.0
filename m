Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F725C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 18:20:59 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.2944.1720549249424626478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 11:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=oic6hAoZ;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-444fdb6c1cfso36147781cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 11:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720549248; x=1721154048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=enUizIyYNR3T5zQLYzcqOLdqeGiN5x0tWFJY2zMkMPw=;
        b=oic6hAoZdzjng8EmCKzb1TtypRxPt6nulCxqyOCKxom6W4q86wTGEGvBhm4VdGaZgd
         7KGkMH/IK+rBY6V4axUPteLG2v6b7n+FGAudn8Z/Eg1VZmgCvadImV5jhypLPNLDjYAU
         kBJGaGcBGRC5Ux2grh8cOi1ptctp5HTLRWEER36esAsF7Wse1gtAbvAYLoSO+zRD2YuX
         BUS3vrOT7oUn489FPkD/s36sHH4MGNRQF6tIq0PQxPQvAocUzWspvdsKW+Jdek0vYybh
         ojL9o6WpCV6RQxcCSdMw3FfedJLYbfIYnzq2TjmpGDrWkXgFrgK5QseAsGQM+77pKX/7
         D12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720549248; x=1721154048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enUizIyYNR3T5zQLYzcqOLdqeGiN5x0tWFJY2zMkMPw=;
        b=Z4CpTIlJ3njWi+Kh4diuslvPfx8Plr2QVZTP/MUuQQ7w1GpNAASe/Q53eYqurcbGuL
         ZJkdODgMs1/FRhwf11fkwshix1mbnLrEWpzTtNfqM/yGQO1q7btZzouPKtEoVN6xnZJr
         QByQiL/y/IzA9xLXVPwgGboIYFo3WxHBPq25A0WStrVkNLA0MZqe39RTbUJ77XCK8b4O
         ZJN9ghWDmrM6YV3vFjbi3SUecM3pKU6vTd5ZmmgGI4sCKYO7qI3kcBFnv8KVQ+QKM7MG
         3nkVuDSWm1TpDOGH7Wd1ssn2TGa4XAvDh5bX6RJRE7a8R59PirymhcPmCQsgz+A1kgqC
         M48A==
X-Gm-Message-State: AOJu0YygowbmsUa4MTyqvY/XVf2CAfq4GrELMnJjLUmpF6II87WjZ16p
	ZkZBVLvaAemtgkEY2Tt0G+uk0GkOoWBWfi/CxCkQuVefLFlvZ1QN1I4MSA3kTT0sTe7CT1guk6N
	J
X-Google-Smtp-Source: AGHT+IHFvaF2w076xDVvz4EKLYbjaDfW7shGLNfOZuN1lR+diJv4wE7DZAtYboDrEhEDZJzpfJB9gw==
X-Received: by 2002:ac8:5a96:0:b0:447:f73b:6e2f with SMTP id d75a77b69052e-447fa934542mr50150821cf.39.1720549248202;
        Tue, 09 Jul 2024 11:20:48 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9bd3212sm12833151cf.67.2024.07.09.11.20.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 11:20:47 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-hypothesis: upgrade 6.103.2 -> 6.105.1
Date: Tue,  9 Jul 2024 14:20:46 -0400
Message-ID: <20240709182046.3657736-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 18:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201672

Changelog (https://hypothesis.readthedocs.io/en/latest/changes.html):

6.105.1 - 2024-07-07
- This patch iterates on our experimental support for alternative backends (Alternative backends for Hypothesis). See pull request #4029 for details.

6.105.0 - 2024-07-04
- This release improves support for Django 5.0, and drops support for end-of-life Django versions (< 4.2).
- Thanks to Joshua Munn for this contribution.

6.104.4 - 2024-07-04
- Clean up internal cache implementation.

6.104.3 - 2024-07-04
- This patch updates our autoformatting tools, improving our code style without any API changes.

6.104.2 - 2024-06-29
- This patch fixes an issue when realizing symbolics with our experimental backend setting.

6.104.1 - 2024-06-25
- Improves internal test coverage.

6.104.0 - 2024-06-24
- This release adds strategies for Django’s ModelChoiceField and ModelMultipleChoiceField (issue #4010).
- Thanks to Joshua Munn for this contribution.

6.103.5 - 2024-06-24
- Fixes and reinstates full coverage of internal tests, which was accidentally disabled in pull request #3935.
- Closes issue #4003.

6.103.4 - 2024-06-24
- This release prevents a race condition inside internal cache implementation.

6.103.3 - 2024-06-24
- This patch updates our vendored list of top-level domains, which is used by the provisional domains() strategy.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...hon3-hypothesis_6.103.2.bb => python3-hypothesis_6.105.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.103.2.bb => python3-hypothesis_6.105.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb
index b935bb02cf..e582289062 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "83504e31e90a0d7d6e8eb93e51525dc1a48d79c932a50ad6035e29f8295328cd"
+SRC_URI[sha256sum] = "d4eedb42193da9507623f4fe27fd38f715ec19ad30ad7c30e3b25594c0b491dc"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.45.2


