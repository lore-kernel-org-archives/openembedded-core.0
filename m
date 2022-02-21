Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF83C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:22 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.4746.1645478661234724025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TDhjwKso;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id z15so4218062pfe.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RtcFMuPclQ4DUz920xLyzHC54n4w5lFOmmvPeqnMHeE=;
        b=TDhjwKsohGnWYMAUDtfvpKvo7hlti6bXDImGEC+l5ZfsQvT/wfo3UNypd5WVLGMFSL
         umTv7lUDfQ9/nr9yEAgADmH6fbLQNPHqPUt97paMpQd733zDZmhbHi2rkCheL76TwkuG
         9SjkKi4k9UITqXWs9KTUtjG8hCNJAO6fejYzeBT4FnZizmz9Y82IbvnbLhXLnqLQqDt8
         p0vZn9bCRz+xCqg7sVafk7uHvhjzRA0/YMaPrBaeEcm5LCuc9Fzd0De39WJ7qaU44O5h
         iwDyNv6bpSzIsQ/IXKZgRph7wFY5qd0iUZqCvoodAsAXWbz9qRX4Tc2RlXu1BT+CZaE/
         yIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtcFMuPclQ4DUz920xLyzHC54n4w5lFOmmvPeqnMHeE=;
        b=KhfIeA3E+kxqvanQ+cg5FelHtUa/K5S/H+7X27xEMUEa1x9Kp0kiEgWWXEmAwv0Rfn
         SAfZjrUPBATnG7Rn1rnYyeE3Yxa0h5kJ8P+GjX7ZmHqLIKW9OXETN5My0cLwh3z2iX1x
         FsSp6MhftTZs3qz3T09fINUQaqWS6NXR5i/kxJO/oyKFdCF1jqwqHNv+gBn7NtlK3I6O
         ZfpLePThi87/PvQcKb90nye+d/xhW20p6qMaiHcUlFSpLkBIguYcDQ+joWqHkXc1Yrxj
         SLBTwha+Bz3M5GTj7E5sF2s+CDz6TEOhZUda5HYOsMTazkVExyJethyopvvp5us6mK1v
         LkJA==
X-Gm-Message-State: AOAM532kv4T7YnJ17DKkEJz/u9C3ltW19Mhfg7hNKIYuEsJwSie+tJYd
	AocVRYhEB9qygzZktZNzV7MHZwb4A5gRgA==
X-Google-Smtp-Source: 
 ABdhPJy6rgL8PKTUQ8lXOGTCrr9YXUKQgQ6TNTGH83eumKNA4/OEptdUWW7/r6kLPDwJiHN62/pxqw==
X-Received: by 2002:a05:6a00:1f07:b0:4e1:3335:9dd6 with SMTP id
 be7-20020a056a001f0700b004e133359dd6mr21712794pfb.76.1645478660147;
        Mon, 21 Feb 2022 13:24:20 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:19 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 12/32] python3-zipp: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:27 -0800
Message-Id: 
 <d2140e01a77ff1c620c5dbd62ec41f70c7632f3e.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162088

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-zipp_3.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
index 9ce987c8702..d0f936faf7c 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "9f50f446828eb9d45b267433fd3e9da8d801f614129124863f9c51ebce
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 DEPENDS += "${PYTHON_PN}-toml-native"
 
-- 
2.30.2


