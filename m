Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9FAC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:51:39 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.21005.1747911097060410292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 03:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TOHA3yMh;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f8cf00d96fso50333706d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 03:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747911096; x=1748515896; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tMf6zNwbuPprQqFTEQxUYNGym3xqMnXSQlimM7O4Qmc=;
        b=TOHA3yMhB+Fh2d+0OObsaW2qJhmmMUFeNvyUng3ePLcleyzmMw7RVCSFS8D/Au6r1a
         JSwX0WXrzfDJ9PVLWc2JzHF4i/0wAkPwiv2W0s4hBOnjOxcMQ2PHUyu0Onu1jTn4z7jG
         vDPt+XakEL8a4Cx/9eG38NsZTU6oav0zmplhzp0YeklFCJtrYC8FgNG3EvTUSX1tSUmh
         sDikhzdKkkE/TPhRQ+OJoW0V9vr0iL0Oqw9NQ92TjYGFpfHEQ5JMQJiw6uHS9OhO7VPq
         SPyZOv5W4J4CRonnltoFnR+mD+T0mDB7tjBvYyMlcwZB/ZYKs6oUB+ZbRnn0RDRE9HPB
         3JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747911096; x=1748515896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMf6zNwbuPprQqFTEQxUYNGym3xqMnXSQlimM7O4Qmc=;
        b=OJ2Cct9qvt/gWNiV6YFBSl0CPuKnykHq4SVmOmGyfW2gqYkJkydVUXSXahWn5PHtyS
         DJkxiH1VcVQ+0iPxVPV9W0tOowLdKB4Mf1g4A6Dp+vNixzFMLVXsTuO5jpKn8ylcxwgP
         EB5EovMM8BjuXh8gopEUNawu7TXKz8IlZQ/L3X1e1gt+/h0ma5nU1OxfmgEoeXaD9M1f
         2HYsetv/cyPQ5XbUtVk71jeZHAQESsJBPd512RszJYLmIWt0bSh2zUwXn11TEyNdgsiQ
         fOY3uN5LW/u9KRY7yKsNlZehQ9sdhJ2RslSrURdgxBPsUwZ6bm6biBRYUf/9RPqie5gA
         72DA==
X-Gm-Message-State: AOJu0Yz6RwF+mREJOl1zaUBR2El+uDgGsteblDIk3GMsaJxBvCeyFPeE
	Awfe6UO3a09RTML9PtP+CXfVUrd8U4UdMvmbFoVI3vHH6FjA3D2QRaCB1McSU3KUgSNLIWZtLlY
	UautcomYnvuihtW0BLWxiGS5Z4oxF0fvuaQ==
X-Gm-Gg: ASbGncsKWsyw+jksfdy8JEPxTYxicjWUuIeOjBk0QIsQX83M8NxrofSorEJa7GS+BZX
	oZLqXLPzXr3y9bdhqagsHkbb97aQ51pPTyCIQzb48w97WnF4w+ilDyHposKdtrL62xNoALVhRo9
	s/3RUDKxXWfVG0J8b81mQbB1SIdzCqeSqkjA==
X-Google-Smtp-Source: AGHT+IGsw9kyd9dJFXzdMYG9p2jKW5buv0QVCSlpwpssGQBKS21I/d9hncQqAHBE5iBMS1GEneV5bzsXuoXlkhrKs/U=
X-Received: by 2002:ad4:5cca:0:b0:6eb:28e4:8518 with SMTP id
 6a1803df08f44-6f8b08fcfc3mr438789086d6.34.1747911096084; Thu, 22 May 2025
 03:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250521184906.181219-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250521184906.181219-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 May 2025 12:51:25 +0200
X-Gm-Features: AX0GCFt0Wd73aLM5HKqx4Tb6ZeGMaZ5OybMS3PMApdObGidgQBP-N_zn7XldnpE
Message-ID: <CANNYZj-8WFy0CWocfy911Gqc4nKYOfyZt4cPKx8PizOZxPNc+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: disable CONFIG_BLOBLIST on
 genericarm64 and qemuarm64
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217084

On Wed, 21 May 2025 at 20:49, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> +# workaround for aarch64 kvm qemu boot regression
> +SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
> +SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg"

What steps are going to be taken to get to the root cause of this?
Does this workaround have to be kept forever?

Alex

