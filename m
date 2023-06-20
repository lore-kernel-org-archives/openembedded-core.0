Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3909AEB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 17:59:24 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.1158.1687283956820614009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 10:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Yk3yVfb8;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3fde9d3868fso25762201cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687283955; x=1689875955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFc5sHIjkEYKQnCMp18+NWKbZ+6L8CsVc43kfoSDFjQ=;
        b=Yk3yVfb8hZfml862/DLoKI6EZyaQSmJObJ8M1E9t6vACd+9/5aNWl29e+KR3TvbRg5
         GDwHfTrfmLGUfI+XWxyyMBo3bByblGN5OrgCr37DkjJ+8v1cjXV4K3QDQSwHqo2gDfx2
         YSStQLXYzXaf+JlCVYYot98cv2UY+mAOeYfME1UUuCvLjDXH8qgxGHT8EDcnwEE9OGwo
         hvsnrsLIdwjf/Qjxz2lGJ8d5wbej/zBm8LbcafVjrNFR33eCYH2FjaLTKlKdRhZ2ZcBH
         AuQF7HeRLE8Q/k6spsi5i2mXjDPU5WxQ9VZSpS+pXv6tl7QSALqOhYuKQt5oghz/Ar57
         41hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687283955; x=1689875955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFc5sHIjkEYKQnCMp18+NWKbZ+6L8CsVc43kfoSDFjQ=;
        b=eY0O0zeyGfzVeDZ05UaakgfLYFxYb+6eE2HwqnAoa622bUa4ugNLTpMz9RCEHcz3tT
         8OMukMW0nfNCr/Nv3HejH2yC6Sha1UNNJbusrlpQI8zbH1IABPlGyDs9TBxSPX7jadTK
         XLD/ZYFyOaGkI5tQ6Ys0Upw+2ZMhmr48/Xs0WkOCD3EAZn8meb2JKfb4aS88d/RiLcBF
         7MdZ+Dx0m+P8P4r3eyDMe+O9Khayt58ETQTvCOpK9MRVT7iEFqnvjXYzAvvJQncLfn6I
         7wp5AtkMuU4QnmadzDgpIleZbBmm7QcCxpu6rlxzEmAk/2KWy2ngoidojvedgUwvMAJp
         JbmA==
X-Gm-Message-State: AC+VfDwqbthnM3PpDpM6RJb/zbRn81GWt+smBcFyxA1vmQQV0mD821zO
	mRCd7Zt6L1IUosNUfjRIfqXYizNxqVuzF4L+C5o=
X-Google-Smtp-Source: ACHHUZ45BUI5mVHhtacn8WJKSZw+3CCoYakuZ67rIzU9U1QdI23bUsNerCEyHeGN51bUFrXhXE6YhA==
X-Received: by 2002:a05:622a:3c9:b0:3fc:394a:573a with SMTP id k9-20020a05622a03c900b003fc394a573amr17432489qtx.23.1687283955377;
        Tue, 20 Jun 2023 10:59:15 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85485000000b003e388264753sm1343952qtq.65.2023.06.20.10.59.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 10:59:15 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] glib-networking: use correct error code in ptest
Date: Tue, 20 Jun 2023 13:59:13 -0400
Message-ID: <20230620175913.1640723-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 17:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183154

The eagain patch is currently using G_IO_ERROR_BUSY as part of the check
to retry when the simul_read_thread test fails during ptests, but the
actual error code is 27, which corresponds to G_IO_ERROR_WOULD_BLOCK.
Change the check so that it looks for the right code.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index ac6592ffef..ee5b6a7beb 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -21,7 +21,7 @@ Index: glib-networking-2.74.0/tls/tests/connection.c
                                     MIN (TEST_DATA_LENGTH / 2, TEST_DATA_LENGTH - test->nread),
                                     NULL, &error);
 +
-+      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_BUSY))
++      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK))
 +          continue;
 +
        g_assert_no_error (error);
-- 
2.41.0


