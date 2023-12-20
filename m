Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84F9C46CD8
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 02:18:23 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.13135.1703038698606833380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 18:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vQVF8yYp;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3ba46a19689so4163204b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703038697; x=1703643497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+dAlJVKflfrRauGc7SJbfqHImgOUt2B/AajciRV4ag=;
        b=vQVF8yYpRQ60Le3A5M0y9uL3/n9kioxl1PRqkdzor5foNHmFJbgQPAzXxmdVz411qU
         2x/K57MOOCAOxfvdc0hIe+RO1UyWDdsP418MsUA8rJOgFihwghzMkvEtSxJMTrLRb4rD
         IkaMsOvejN4wzK+M6ruW5EPVouVmjeZ+2+x3DGYdslAZIuWtlvDZNtRAe6wM9FP/nvuZ
         A3mgJPel8rPts8qUp7K/bUTHcNBGBKvKZjRt0hmWlmR5aV9Bxe4dmnagQ18BcuJs2//h
         hLjP1EAa1BjMpVrxHj2CV7RFbFDmSl6oWtgNoxC7G3wLcVXK4dV965qhgnsx/rboMB3W
         AXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703038697; x=1703643497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+dAlJVKflfrRauGc7SJbfqHImgOUt2B/AajciRV4ag=;
        b=q6x969UwIEYppSB/Kw1pr3OKuUFNo1RuDwcyTS86fSBmjjxW9VmGG8Bibb9NX/SkEY
         Zte7CdHkn3G2GtStX7v6LvNxePKpj2SvDKJYbD+UUvKYsEFg4p7aN6k42Jfmm/tZZKgQ
         OmeMDp9rax5IL3VvzzLmsOL0+jGggNqR1+XUyMxiJ2UGWtnnBjypwN73gpS+Kj0bX+kX
         yY3BtpF+I6BUbgYl+TwXagVFGVwLW6bSmSZotKGZd0D2ev0P06jevj6Ep/GSfSyZXuqp
         yw/p+d6hmaGkHb4qGsKJWBLU3vXxkKpvu9szlJ8fdC8/ApNYTG9+sjNGWBOSEM0XUJmp
         1S6g==
X-Gm-Message-State: AOJu0YwHBQ3MjFS6ZQDnNhtpvukiRUxJpcCr7oWWvI1Z7Psd3kHYnAbc
	iGHeLzJx2DjlF5FEQIwHcMLLfDzr7w0aV9T9kQmepw==
X-Google-Smtp-Source: AGHT+IE/9/pVRcScmBcDbJxbWZejEhJvaQ7/9AQjtdyr+JgoBbl+aCVPJT6eDeEqLr9EvjP3p9HpOQ==
X-Received: by 2002:a05:6808:1642:b0:3b8:b063:addf with SMTP id az2-20020a056808164200b003b8b063addfmr23625400oib.60.1703038697606;
        Tue, 19 Dec 2023 18:18:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b006d945660076sm367103pfn.59.2023.12.19.18.18.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 18:18:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 6/9] ghostscript: upgrade 10.02.0 -> 10.02.1
Date: Tue, 19 Dec 2023 16:17:56 -1000
Message-Id: <a26c9acc8a853bfa13f08916c596a52da26088e4.1703038443.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703038443.git.steve@sakoman.com>
References: <cover.1703038443.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192765

From: Wang Mingyu <wangmy@fujitsu.com>

upgrade include CVE-2023-46751.

(cherry pick from Oe-Core rev: 9492c2d51a08fbd4c107540a5a833b1a3fb70504 )

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{ghostscript_10.02.0.bb => ghostscript_10.02.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.02.0.bb => ghostscript_10.02.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 4bad0f86e1..18c296128a 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://configure.ac-add-option-to-explicitly-disable-neon.patch \
            "
 
-SRC_URI[sha256sum] = "e54062f166708d84ca82de9f8304a04344466080f936118b88082bd55ed6dc97"
+SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.34.1


