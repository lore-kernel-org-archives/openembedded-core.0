Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1D7C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:48 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.4694.1645478687353954470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AE/svYVG;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso396092pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Fd2GautqPvCisc4p6IHY7aoRvhv8pp0IfS9CC+gGVBs=;
        b=AE/svYVGI0iTxlsX3B7hHnEcGNT6YOftlOgQUyemdyyuRPu4xzsWVvfBIVqumIjWVa
         i7QsvgEfWaN33SALVTGkQKboqVP0jxlLn2p4eQZxPi/NgtsXqrMSM2GoGcej6rpCNBJ3
         tsbqsZhBxzcYuG7Y0tjZ9Dw9UgQx0TEZo7YbP+fWLFQdOeY4yGMwVFzPjFGcKfLASn11
         HPD6IeOSXfVAiYPshoQtcCiSk4EqFFMp6sD2HmBh57WHg1woiyR8djdiOyeS6v2d1C45
         bSojT/mB+f6kHZgBmz/Ag0SOXbeAfXB9zUYB4T5IlDWD2NICK0pfp5UNuIrRN9VE+F4k
         lvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fd2GautqPvCisc4p6IHY7aoRvhv8pp0IfS9CC+gGVBs=;
        b=V8VRjUOP9j1WoFzB4iGX3ovSafVf5W1Mu/GcxefFaNOCjo/OdJqEoCtCJnnxFPBt2G
         J4RO0znkxv+QqFT8XtQCmw2M+gc9EqlWFwdajwaHKhR39GjOpk33AxmcqiD/+uzvHmCX
         C8QVOHY/1utfhIuMcOLJWKelMlsU0oVblesBGbqBh4S4l+6H+UJRKHOXCt2S1rRdD4RS
         uGS0GmaPcMAM4HOx9lC/byAUvqyUV5gk5k8vtC+TKl/knwuxiirdsbph1mYU0dnqUemB
         5Tv3v+4KpXvYIMeS4R9wDsrPpG/9u8J+z1v1okKBZqdEQk7tcA43Jj6fyRrkeYMYlJ9T
         lDKw==
X-Gm-Message-State: AOAM5325nzCpjQowhyMo1Wx4E0J23XbE0DJRX5roR6XRcZsV6Evybnll
	3Kj65wdzJ2gPolqLYOZrt2xADRVT7BGdAA==
X-Google-Smtp-Source: 
 ABdhPJw/sUPv8E/meYgX745/QfnQhNowQt1PCtGNapk0Obl6YcyTWeMohniN3JaAbOg3OROoipj3/A==
X-Received: by 2002:a17:902:6b48:b0:14f:3b13:b8e with SMTP id
 g8-20020a1709026b4800b0014f3b130b8emr20786963plt.26.1645478686422;
        Mon, 21 Feb 2022 13:24:46 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:45 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 27/32] gi-docgen: set PIP_INSTALL_PACKAGE
Date: Mon, 21 Feb 2022 13:23:42 -0800
Message-Id: 
 <2da4397335d6336444898ba14618c29ebca4a97d.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162103

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


