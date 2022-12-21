Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5D1C4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:53:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.17933.1671627199281179632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dpxU7zhy;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id bg10so11107628wmb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/bcoh8mrr5x0qx9JKuQrmbDQU5745WgEa5whVlg5mw=;
        b=dpxU7zhy+KIcpzfqCXT5abdj1yywrVZAi9kOtyedqttmyhFUQp0sSp4DaG/X7WNMrw
         ZMG17sMpJpLuecZqaRFQnhQyI99WUdDvHfjeahRb/1RrjisjeIj6z36s97+OXdHJJpKC
         YYH1KxCrCBUuWsmsjJg/ahToHw/nxyFCBcZSAXo837UW35VYXKKNuh71tBkuZQouIs+w
         DgwlH0e3Om4y0mbUWkEOcpz5GxymHv8JHSuKYUKgl7TmQNm/sN0Awp/2jeVaIk+mPjtF
         kl0OwwnRVP/HKZFSYMa17kTlfnVdsdcpcFEw+1PnlCUEQ23h4kXiJWBNYhDHGKeUU7oZ
         0zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/bcoh8mrr5x0qx9JKuQrmbDQU5745WgEa5whVlg5mw=;
        b=s5NzcZMkoqpbCIj+s+3LVcUQl8Dr75THqham7PpX48lofeP8ubhX5oV/wQ9K6qMmZk
         2IhxEPnMZZ7zh/rBW+5J2j7e8B2hn9ByDRDWZBg7QrXjLfJSSfbzXZ8vFy2u3gbUZACv
         T1WEKE5F8ZGYipLUjY7P3nr5/2OnoXLIg3fcBUoTbj5D1EeZlZeAqk3ByQ0uHiq5Xknj
         /CL0YtAhuPMOLlUJdz7EnmMOS/iPwShxbNF6KF4dvcMLvKx5h3EZiHm1cN/eJnIfI4MW
         2Zbv03kVTkuIvl93UWDtMblgzqLw4JB2+uo0W7lEQpp+SaWHSqcpLYWK8FUlL9NmD+7C
         +08A==
X-Gm-Message-State: AFqh2kqlfRjnTsbNUcI2dLUw2efPjV6jpgJp/dySxzZDmrioDdwAOy+4
	h5XnfxUNiOjCwpvGjEgDbzSv0yQ7GXo=
X-Google-Smtp-Source: AMrXdXsnjwT0QVEKyLuage/k0kw14QVNpsgsoDNcG+3sNRIVswQ+yHGwbsvnXiIuD1iIpcwVrljELA==
X-Received: by 2002:a05:600c:4d22:b0:3cf:a5df:8bb0 with SMTP id u34-20020a05600c4d2200b003cfa5df8bb0mr1528192wmp.37.1671627197413;
        Wed, 21 Dec 2022 04:53:17 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003b47ff307e1sm2124097wmi.31.2022.12.21.04.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:53:16 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 03/10] libstd-rs: Move source directory to library/test
Date: Wed, 21 Dec 2022 12:52:58 +0000
Message-Id: <20221221125306.13779-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221125306.13779-1-alex.kiernan@gmail.com>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 12:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174909

Building libstd-rs from library/std omits proc_macro from the sysroot.
Using library/test causes that to be installed which then allows cargo
to build (https://github.com/meta-rust/meta-rust/issues/266)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/rust/libstd-rs_1.66.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
index 6c5a979f4f23..8802e9790ce4 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=92289ed52a60b63ab715612ad2915603"
 
 require rust-source.inc
 
-# libstd moved from src/libstd to library/std in 1.47+
-S = "${RUSTSRC}/library/std"
+# Building with library/std omits proc_macro from the sysroot. Using
+# library/test causes that to be installed which then allows cargo to
+# build (https://github.com/meta-rust/meta-rust/issues/266)
+S = "${RUSTSRC}/library/test"
 
 RUSTLIB_DEP = ""
 inherit cargo
-- 
2.39.0


