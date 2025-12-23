Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA7FE6F084
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 10:27:23 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98717.1766485641226173255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 02:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fOxzf57y;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a347c424aso63125186d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 02:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766485640; x=1767090440; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XP7w+bVRA01GX27ZG1V0LlxIJtyomhS4SLpXphysCW8=;
        b=fOxzf57yuc4qZE/F93WT29n2xEyrxXesx5t63SUmlVt+DFqzCB0AsC6YrGTtRBxRkI
         Ge84FM1bJYHffI4ynnkO65ZtCjdZIpxPxIuxYey9xDHYWQ/zxCoFTODkugWMazr18bbn
         6dJuCMBSPESlCBkIlcvgNNgE1SctAIewW6L6ldHw4ll/r2riNm3HwRNSwy7odRM1qxCj
         THq5CJJMfEg7XlQcqwznijt4PqgSbapNrWggaJlaDSEMQZvARm59TE6HjPPbecy06med
         V1KkjstAMJP5KX/2ovYZM1FnUy/RuSmdmKRC43lOQta46ksM1pyyh83amme169wnrM8h
         7KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766485640; x=1767090440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP7w+bVRA01GX27ZG1V0LlxIJtyomhS4SLpXphysCW8=;
        b=X/YPOVTyucBqP01Op2AT/RYdKOs1Mu548ff8x1J6xYuy4dysU44eBIlJT4fB/7V7f3
         jv90Ljx18wNYZlPqQ599cmN4VqsHCb0wrRNcTWbApJmBPxrtc9eMhdCdjy7nZ7Yf15e8
         OQa4LO+waHmXwLNQTrsDOAeUGm4akoHXr8W5muBL8WiIYgoXuKEu2Zv4r4sIx4sXQDsd
         O8ReomXJsRrwhWNPiVY3yV9VooBGcRGsKIIrTnqwYoQVxDProOfnU/7LNl9or5T+UAJB
         z1VRBQMDnln1/kMu/oDSlE/+LJeQKkKz1Ojw+C0HdZbqPnBC7uY87gLgY0eXkxu76XhK
         +LCg==
X-Gm-Message-State: AOJu0Yy57W7ogFEd2Xf+bLBAHBRfoVYNYn+Vk+IdK7rNOOz27GGkEWql
	QS9WO3sNyu3o17gfTm4kdCIycS/N2RU5v9JlaMHlHqS4bD5gOmMNPadF75PoBnE5x/dAoi6GB7/
	/8iFR0jmaobbzbMd6t+BUu4m6M6TgBQ+Vzw==
X-Gm-Gg: AY/fxX5HaiserteIIZlWMFy16mYzmSKzp2wMSxOxLCrfRG0NaPTZlhUhiiUY3BiAB8h
	ss5OuzdeEblhGXtoqq/Sn9dD1lomrbuE5NE7LxRbEnYPXRmG2dkDEt/WPCJojm9320em9VoEFGD
	j8pf28KMjtSSQaTC6oeh1omZWHd/dTvjt+YPfsdGEXF7+URCZU6vXR2DvDg7XjeE2U1u7oDPPmw
	W2gHg35AgT9kem3eQQ9nwd1ucPq7YJUFDRcGq6dqyhOw3xSN99DgstP+uvCWyB48eUTxn+Euhjx
	uyqD
X-Google-Smtp-Source: AGHT+IGWlP5iwGSIcLz2cj0RA43zkODmfr/lQnRFOcl+sEeVUW7mjmf4REac4WRKTXPLnRfpgl889h8bKiDphkFdImE=
X-Received: by 2002:ad4:57b3:0:b0:884:6f86:e07d with SMTP id
 6a1803df08f44-88d81c499e4mr162956186d6.15.1766485640110; Tue, 23 Dec 2025
 02:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20251223085453.1635323-1-hongxu.jia@windriver.com>
In-Reply-To: <20251223085453.1635323-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Dec 2025 11:27:07 +0100
X-Gm-Features: AQt7F2r9o4XyQ00LkxoLEgv_Lf5QS8mfOXKpNh4tDOUrZAPSOlwUsqc5Ezvrsn0
Message-ID: <CANNYZj-rHr0YQewsyj30cUHNtm2vLJ7iwb4NonudHYxnUg2gqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vte: fix build failed for ppc64
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 10:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228464

On Tue, 23 Dec 2025 at 09:55, hongxu via lists.openembedded.org
<hongxu.jia=windriver.com@lists.openembedded.org> wrote:
> +Upstream-Status: Inappropriate [Yocto specific for ppc64]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + meson.build | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 330ee89..a6c64ca 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -41,10 +41,11 @@ simdutf_amalgamate = [
> +   '--no-zip',
> +   '--no-readme',
> +   '--with-utf8',
> +-  # '--with-utf16',
> ++  '--with-utf16',
> +   '--with-utf32',
> +   # '--with-base64',
> +   # '--with-detect-enc',
> ++  '--with-latin1',
> +   '--with-ascii',

Why these particular options are necessary on powerpc64 but not other
targets? They do not seem specific to that platform.

Also carrying conditional patches for configurations that aren't
tested in CI is prone to quiet regressions (including such patches
failing to apply after a version update). I'd say you need to both
investigate a bit deeper, and raise the issue with both vte and
simdutf upstreams.

Alex

