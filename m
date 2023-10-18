Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF2ECDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 11:33:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.279472.1697628787101300028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 04:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mD9/8wio;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso9623125e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 04:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697628785; x=1698233585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2oHeQ6lKvFEcWnPb+OhltKDQDHke2yd2Dh6UwAs3c8=;
        b=mD9/8wioa+gxHBUcL9W6EGWoMv440Y+9TBoFZi8KTn/awlYFak2jd78q82/xj0SKsB
         YeMlkriEbdvS1jrJq0tzxMXTgXNXGsIVEGp6sgbsDI6IiUPOeXh36fHEuklMNde5l30r
         GsAz62CrYmwmNeLlyRC5KywegtDqxifchkSooRewGpd6C8MGn5In3iH3n/EQ9Yf2oKDe
         mdGvf7T0l/U8HAfGHlteDthinoMhjYRC3PSqDOVqEaxr4/9ud5eMrmDM6o+GR0LAte9g
         mGgH8qO8OeMYxVCbu5CnWrE+yHSB9rZnT9NhJnI86K8VB0H5/xnDwsD7Qghr98ZFxM6X
         4jkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697628785; x=1698233585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2oHeQ6lKvFEcWnPb+OhltKDQDHke2yd2Dh6UwAs3c8=;
        b=riPPmB+5rJVjps7g0tUgszOWyg0xcsKPGqwks9snHbCOf7UtlyA7+E5CNNCx3sLFkj
         7IyJnPjkM4+ouM9w3lyNrjP5uohAuwarje18apc3QGIz/RIZQt7GwWkGO7mbqqJ8ZfrS
         8H6GRIiFvrU4kY+q83YsRGpFf916uyYOpnl8QPdPVM22ihkFiLMUpStaGgeavc4goYaW
         OKya67Oh+m3kXcAiW7a10kJetiYwO+xg1OHEC3QeaYIA8entHYeHJ0cm9gfurXZ3AtwD
         wR/5MIacRCPxjwv4J+QmV6QaB5E2uovhr+co5kFIORABgnyBRtRC+nlWQ86RFB9lKJZe
         3EWw==
X-Gm-Message-State: AOJu0Yy6vGeT4TrTp0o9vlcLpS4mFUxJfBful9bUfffayxuQ6Qa0M5Ex
	CN/EZnD4hG/fbJk/4bvVupOXOheSFHXkeg==
X-Google-Smtp-Source: AGHT+IG9T9m0RdIQnhXbg3CoefqdG0c1lvxdJ8+5/hnrGqQ7Z1BUMEi1Llit8JUcPRIn4SkQtRmNRg==
X-Received: by 2002:a05:600c:4fd3:b0:402:e68f:8a4f with SMTP id o19-20020a05600c4fd300b00402e68f8a4fmr4440773wmq.0.1697628785059;
        Wed, 18 Oct 2023 04:33:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b00403b63e87f2sm1465725wmq.32.2023.10.18.04.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 04:33:04 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 4/4] systemd: add p11kit package config
Date: Wed, 18 Oct 2023 12:32:55 +0100
Message-ID: <20231018113255.607577-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018113255.607577-1-jose.quaresma@foundries.io>
References: <20231018113255.607577-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 11:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189382

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2: fix alphabetical order

 meta/recipes-core/systemd/systemd_254.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 981d87b04e..d888efdece 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -184,6 +184,7 @@ PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
 PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
+PACKAGECONFIG[p11kit] = "-Dp11kit=true,-Dp11kit=false,p11-kit"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
-- 
2.42.0


