Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F7DC0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 06:52:39 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.14433.1738306353697745277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 22:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I9hjVfyM;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d8fd060e27so10551076d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 22:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738306353; x=1738911153; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WE1njqL2xPswqFjWt2HbW5V88Lh+aO52ztfEOa7Kr0U=;
        b=I9hjVfyMDyhNeLJzDsjazQdOVcOE7BELYwQqCUvMMplYP2farcvhp9fH6xfslcNErF
         7vl1tWk4ZI+U1AAfIzs3m2opNR+buP7FEezP7PP2LFJXDNuQDVoGW+XbsU/3F/VQnUSY
         /xDiWvJLUx24u59Is/AR06BsbZXYhgScwxA7Bl89C2xhHZGfLEmS5n23lQ3sl3Tr3HKy
         I8pDKu/0sLXJZd8FAwb1LcV076TOrv2+64jAxbtOYtQvD14oh0EwodIZUzVgtek20XKA
         f9Ij/4iJqpnvR2mMYRm7La1eHtpYULuNPsrLYljpIwP2/vS8NVzh+XYhYF746KEr/4Jl
         N02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738306353; x=1738911153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WE1njqL2xPswqFjWt2HbW5V88Lh+aO52ztfEOa7Kr0U=;
        b=LKI3tP6g1wSIrAtr4YHASLLmUtHNUFF+Stkrax787RPhAQrDlX28F1wyTcBF1S8DhS
         s146F3uDsYwNx6hAsmwcgYy9hdQIg/4MWsRl2+dBxQ+205R2orakbtnylk/3LFTMz2B4
         WBOts7t+Ktj1316RkPk2xpHfGMSYuRNV2SIOKeEwY0vla5Go9Uw5dTZy20aLUSVbvu8A
         hATxXGaZsaS1t/zVj2GwXmCymf4u0ZeRN1Nck4nHPDGKt/uDtEg+xfGFeugS2cBrUF2X
         Qc1s2UHERaRTUXR08W34Maln2/pCIbJ8ADN7/y7DHVcig8zKgxKM4MEszIOu2oGwK4Dn
         itbg==
X-Forwarded-Encrypted: i=1; AJvYcCXxkJM/0Do4ifM3QrojJh9bWbI0GsnTRcKw/6qISj0iNrsj/6DX+q7UfplfZs8uth4VPeCtAuamZd47XlX28Dx1TQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyT8FvXBHS5OnmkSkf8jyHOdiosj4bUlVQdv+O600+WR6UWqnf/
	7HLCOUHtv67p/qnqkPoLI3oUUurtLruf/bushZrQmrtnjhGTPnVQmk8FHz4O4TVAlAYOCi9z9p1
	S8WkRyIOpmri9G+Z9Rdu+DYvWEDA=
X-Gm-Gg: ASbGnct+DwTtNshVsdRFAUPXAzSYmZL12If2oQRwWSttQFZz6RvoUE+yl72kJnYumst
	f33ctB/ITFinDWDhefCu63rlC9FQLpfLYfn6sFeFrGYESnoBxT5OU/ytaUyiVFMtRAYfO70MZmO
	/dFUE6/MbGXMIpsYebo+FsUv8kJsNnPYs=
X-Google-Smtp-Source: AGHT+IGAY+qZeevSQ8JcsdNu4euep4X9H1gSkhMMoTteXLY96TIYQ/EKOxShAQav9xez4uQPfsGFi9L+cCtL9piRW1k=
X-Received: by 2002:a05:6214:1c47:b0:6d8:96a6:ec31 with SMTP id
 6a1803df08f44-6e243c949cdmr156558816d6.35.1738306352701; Thu, 30 Jan 2025
 22:52:32 -0800 (PST)
MIME-Version: 1.0
References: <20250129124741.4115324-1-zboszor@gmail.com> <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
In-Reply-To: <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Jan 2025 07:52:21 +0100
X-Gm-Features: AWEUYZnZ6600JA1TbLo79skEWGeEwYwQgqVC2WhsANAahIH7QwkzcHNvyfmAuxE
Message-ID: <CANNYZj_5rbGOL4bxe0r3+ekVXH0XVD_mdr3pnwqmjK2Px2gcWQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 1/2] rpm-sequoia: New recipe for version 1.7.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: zboszor@gmail.com, openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 06:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210472

On Thu, 30 Jan 2025 at 15:24, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
> AssertionError:
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> rpm-sequoia (/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb)

This should've been caught in do_recipe_qa task, right when Zoltan was
making and building the recipe. We probably have a regression there.

Alex

