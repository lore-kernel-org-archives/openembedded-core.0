Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538A3C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:50 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.1981.1645557469314082714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jxv8hXPm;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id g1so13076890pfv.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Fd2GautqPvCisc4p6IHY7aoRvhv8pp0IfS9CC+gGVBs=;
        b=Jxv8hXPm4d9rpWmcVA64iAT+kd4E8TJu2xg6zgOJSJYi0XobZwwvAXQjXruTLQECfr
         wIP22uQkkLTlgEfzQ7qn21BGtC0ta+Ngg1/ArNW4Jy2auv8Z5bNSTPSrZInDD4ix2+Ek
         7UV/ACnmi/BLtKh64Q8uGDa+jkj+bVcoGfb2HmX08NOCQ/H/zdjpNCz9GmcUZFG9XVme
         C5Zkh+1cbnkzffsu6G6+bOASsIqi2+1CiLffKyKdqcZH1Cb6y9TrGiYHqZXW7D9eNly1
         ZjKIw9IwjtEC3ukf/I+o4GTC3Z3TMFXAwk3FcLhhN0xw8mPnFxIsRa5KW0mmlMyQeAem
         aeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fd2GautqPvCisc4p6IHY7aoRvhv8pp0IfS9CC+gGVBs=;
        b=56Jr6ixOnDXN+L+dYWTgKVCC8HNDtKwWTF1nI+2kwCbsxettNmGpkZu0+jPQDyCOGt
         H8WZBbCb9C4amMwQM9wdfKEX+WNOeQgGFC5V0XFZo/5LhLQo+Bn7hE3y+pH6DZh6OYql
         zzwF1w9SfHGneJqR+ugx3e9omjsVa2ArqUk67iFKmsrmdj3RV25bm6lZK1/rJYCAj9H5
         MDbuPn9s95cQA9p4Tl4Cb5omuwx1kh4A44Xb35ScYhcydoqulLBLRugAwm4bEcX2oy3/
         Mk9E7BoY7+j3OrQHyXt2pPrUccGnUr3mTqgytlj/6qIeBZgPxEPX7wwgKV1aDIH1rm7y
         Y+gA==
X-Gm-Message-State: AOAM532VCIqemwH8oug9CRuyuzJjY6wwcgVfHu9TDW/ohQWUGmZoTkFz
	7TuamryQA8liFlWCisAAAH61+JABsgJXnQ==
X-Google-Smtp-Source: 
 ABdhPJxpJkUBREUxLCti5is7t8nsOiY3CdPdzLZzulVJoQKc6Xqus8lqxksnvtTo7hDWgYnxctGKXg==
X-Received: by 2002:a05:6a00:26e2:b0:4e1:296b:f24e with SMTP id
 p34-20020a056a0026e200b004e1296bf24emr1781259pfw.49.1645557468115;
        Tue, 22 Feb 2022 11:17:48 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:47 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 27/32] gi-docgen: set PIP_INSTALL_PACKAGE
Date: Tue, 22 Feb 2022 11:16:53 -0800
Message-Id: 
 <f889b0b11f640e2ec122d02743b1694ea24f02a2.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162218

The name of the wheel as built by bdist_wheel is "gi_docgen", set
PIP_INSTALL_PACKAGE appropriately.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
index 6a7124c3fea..67617fca393 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -16,6 +16,7 @@ SRCREV = "37b04455ff58cb2ec3f58917d0737c435344f2fb"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "gi_docgen"
 
 RDEPENDS:${PN} += "python3-asyncio python3-core python3-jinja2 python3-json python3-markdown python3-markupsafe python3-pygments python3-toml python3-typogrify python3-xml"
 
-- 
2.30.2


