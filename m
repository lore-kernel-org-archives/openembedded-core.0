Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95E1C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:31 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.9357.1672830362235773377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J83cHyST;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id t15so23701101wro.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JLV7Q9jE24PA75TkNtAztLjktfNUM0Dq4SXRwSEsI8=;
        b=J83cHyST8mtk4KYwnmDZnM0J0OwWJXx8ySs8I+icJAv9cH0QMxIz7M5dMDHPhz+8Y+
         MVo3x9XGPffaCYTjFGQpGjEQf7v17bsbVJbkO+hTbqDBE9F2pcFKYrmcWj3rmCn8yuYI
         6PIfSYWDhTo1HQVex7LQD76It03VGdHKcz5wlA2eT8+8TJcEX+McQiE45Q5LfSOWjA4j
         g1gY0tupElmgIODQFboB4uArFv9foyqD2XTNtTmGMHTK7kXFryIHCf6pYE2ExycbndtG
         PAVAKBTwKvDHgY+t9Sxybdx4pOI5Atwr9B/rQuROPiBU7rXakPNle5awfnXbrqQvi5Et
         5RYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JLV7Q9jE24PA75TkNtAztLjktfNUM0Dq4SXRwSEsI8=;
        b=gU7df26x7d1nDsZ6KiKMEzKbGWSBJ1TlmuzJrfnoxOVW7Ob9mzVc6kGgY04HAnh8Kw
         WDGPDVL5OtQbUYqGYHdKhZeIFR+BapA4pXoPvH+o917rIBKCyrzmcQ+skAjMlcFkGELa
         W1unTCsZivaqtCp2FYNyV5Pbw6Enrfa+jf8tCFQd9k9bt8UpxLTY62X67tnEScNp1T0n
         HQ4CablHrOn4SjXU3HLA7EunJgQQWUSw9PQBLGsDIbg6fwibB/Wy6gJ6Zt3/CEq1mbuO
         MxGctUIOAeJYc0BAEKZldoJ3/45ISbChg+L6N2tJuuRkJjC3/1Kbtv3Zqv1IyC8CAo3n
         69yw==
X-Gm-Message-State: AFqh2kqulk4D0NhBnlLCBUjWj5HgEm4dgvaxO9lF+vguiJaI+3ZQxe85
	Lqd+tBoLgu1OQY5iHcRT/so4tIN8ebo=
X-Google-Smtp-Source: AMrXdXuoe/EtbiQzPBaYGn12/SezsbIUHY/R4/jBJ1VF2kDWI83ayEJ3XidznWDc5TNIrlatOs4Mqw==
X-Received: by 2002:a5d:5e81:0:b0:244:e704:df2c with SMTP id ck1-20020a5d5e81000000b00244e704df2cmr34056884wrb.57.1672830389849;
        Wed, 04 Jan 2023 03:06:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 49/77] python3-mako: upgrade 1.2.3 -> 1.2.4
Date: Wed,  4 Jan 2023 12:05:20 +0100
Message-Id: <20230104110548.2537259-49-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175434

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-mako_1.2.3.bb => python3-mako_1.2.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.2.3.bb => python3-mako_1.2.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.2.3.bb b/meta/recipes-devtools/python/python3-mako_1.2.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-mako_1.2.3.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.4.bb
index 12acfee777..9860058723 100644
--- a/meta/recipes-devtools/python/python3-mako_1.2.3.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.4.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7fde96466fcfeedb0eed94f187f20b23d85e4cb41444be0e542e2c8c65c396cd"
+SRC_URI[sha256sum] = "d60a3903dc3bb01a18ad6a89cdbe2e4eadc69c0bc8ef1e3773ba53d44c3f7a34"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.30.2


