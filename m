Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D3CC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:55:23 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.1165.1668704113610444743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WgSHb2UO;
 spf=pass (domain: linaro.org, ip: 209.85.160.177, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f177.google.com with SMTP id w9so1434452qtv.13
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0x4Rx4XTOynb1Ks0i3xkSzPG+VwLJZRVVHQhJk+MRZc=;
        b=WgSHb2UOrs4koT1eJpr4wG1QwIDNMEKycfWywyZu1AqQXwYa4Bao+GXC9WdZLy3Lrw
         NqNNLDeuw6MU050GS6Gkpx1g0VR3abR+aBH8m2OLt6lCD6XCHEBzjI/1BcNKV1CPVDBL
         CKg7PJ0u3mlDLv2ZH2dNq6GBEbYnQ4K444q+3wionzYK8XzIFyLsu8TsDo90Sbxw6B3j
         Q5zXhRb6cH4IQRJbg32vNRzauy4Y3IQyWAaoprXp9PyEaZIASjEM2Is++/Qhx4NGdbFE
         7zbZIyaqBFIG6ZcLOnBtmba55Tot320+dmaPql+lfbBUz/9H6fzDkenPTyYM2SUllw6h
         8sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0x4Rx4XTOynb1Ks0i3xkSzPG+VwLJZRVVHQhJk+MRZc=;
        b=CilagbUUSlp4jsPhKiLrLlEmbXCATXR3AFzwRYEHGS3Ig+42s0+tLa33nD19nYhaeV
         arot1+ern+EwfYU+ZGLE3nLC2ZPpOyy9TAjfdQfOt0IyyLl08tm/38yMOdKjKvPG9fvM
         o4iTKZ+5taZqVxnQQLLMdjnr+lgtnvXuQjPi2GWDPO+X3BFc0gkDWRlLGNL3WmaIfzCk
         I1yW5hW9AffhmVsFCTN8uCWiZDfjX+iqg7zIj3fgwqtxoiOo9HkMCCkKE/hTxVFxo0ou
         OoAPXFSmUBJx+9HgcALJHr3R6twM9yvRB4avmM4iBt2/Vhay3OWYcM9N01G30Ob535Ib
         I4pQ==
X-Gm-Message-State: ANoB5plIK0T1++mJnAPoEVSROQwvb59F7Qfl3sx/HCaxV79Mfz2w9y66
	B/3hpj3TzZijUowBpOZnYZK/rfUwl15zYg==
X-Google-Smtp-Source: AA0mqf4mpEJmiGQ2p0KjFQbpY/GIsKBGsyDSiQYZoohaRbtPLYY/wVR2Ai9vHTY5z+Kuf/Lpmda63Q==
X-Received: by 2002:a05:622a:6002:b0:3a5:8c9a:638f with SMTP id he2-20020a05622a600200b003a58c9a638fmr3046802qtb.350.1668704112730;
        Thu, 17 Nov 2022 08:55:12 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm785081qkp.74.2022.11.17.08.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:55:12 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH 09/11] golang: ignore CVE-2021-41772
Date: Thu, 17 Nov 2022 11:54:54 -0500
Message-Id: <20221117165456.1029099-9-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
References: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173442

Dunfell uses golang 1.14 which does not contain the affected code (it
was introduced in golang 1.16). From the golang announcement [1]

"Reader.Open (the API implementing io/fs.FS introduced in Go 1.16) can
be made to panic by an attacker providing either a crafted ZIP archive
containing completely invalid names or an empty filename argument.

[1] https://groups.google.com/g/golang-announce/c/0fM21h43arc

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-devtools/go/go-1.14.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 9fd46356e9..ef33bf5afb 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -68,3 +68,6 @@ CVE_CHECK_WHITELIST += "CVE-2022-30634"
 
 # Issue is in golang.org/x/net/html/parse.go, not used in go compiler
 CVE_CHECK_WHITELIST += "CVE-2021-33194"
+
+# Issue introduced in go1.16, does not exist in 1.14
+CVE_CHECK_WHITELIST += "CVE-2021-41772"
-- 
2.25.1


