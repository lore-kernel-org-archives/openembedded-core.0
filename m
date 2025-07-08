Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8259C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:55:14 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.21104.1751986506868380957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QEFF+U0o;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a44e94f0b0so56994161cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751986506; x=1752591306; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c9EOMIa7qpg+jdGV0WLS2fXSQLckfFjIuc6JC5a08mA=;
        b=QEFF+U0o7hrRYpLhzPxYnkXV+GNvNcaJGPVNcgpkVBzlqySAo+k2SgpuLH62u5KOXP
         wI47ZUDUIMw/0s0XmpVbLCbfukoAMdn/6oAOwANJ3vztR367yPMR5rpcyyabrIQ7eHRb
         wrbPmw/jhQdWmxi8gBPYoKrummHZgu6nZvdX8M7E70VOvOk33zF4tQpS8GBS7Gl+Zo/W
         XSXHaLXFiblILV9CY5K0zoIe3SNt/Kd/+jpPh0hk21T9LvWNCsu0ojq2CviKk41VA1Op
         UJ/6czsuZ+O6ZKq+tL3w+JM/qX2voKbtXWT7tDk10/z/6dcW4iJRCzUxkm0KWWp/N/qM
         BHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986506; x=1752591306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9EOMIa7qpg+jdGV0WLS2fXSQLckfFjIuc6JC5a08mA=;
        b=ZnyJVgmpQL6y7DnT8+RUeFQt1DKDpCCKajPYiFSJHxcLxkuIXZ6mxfJr0t6sF94Cw5
         r2ID9Jo6/O4MB3Yz2/uELm9wqaLthfHqJJOVfdzHe4V5HJOkF01pEEaxRXfUqmQ4YUcg
         BG19/A4z97AVW1b5Q4cgIlzJ73dXtnogK1kscrZ2i+e9b0KJzyK9VttSfmXfCXATUeQt
         mhVaOq0FsSn138pSL/ssPhIu5N1Rg43yEji+Y86JJtzt5TLmZFujEeqqyh5ICpCDExZv
         KlSjiiryddIfC0rNd/t+2Osu+bmB+QnBHiu4A2VPq4/DqP2kVOycTohjoDLLlolvGpUN
         xfLQ==
X-Gm-Message-State: AOJu0Yyn9O6a6uPVMzgDFvKeXazMfgij99Zqy8exT1uR61IOaG7I6e1V
	FfB5m+6AfrryAEg4THRgv5YVPM3tg9C7y50h3I9x7tBTuDLKeXM1ndo3FEUjAYRKGkLuwc5QM1w
	T8QIwwF/LSZ4IW5QBjzBl480WuZCXh1s=
X-Gm-Gg: ASbGncsMD8A96drza3PMFvF1F1eMdPfLqI2uQYNsTvs3Fum/puO7jY6ZalkQ4lxecY0
	Y3TRGUFzuES54o7lLnAR3yyzT/FU1Qk1kt4QDBhRYMC1aBBO8d00afwxXEXVHOI52PzxUvy38yQ
	YHuw8No+hPe1cp8gyR2Zqk04gnzyQcf/CNmB9cJD0HKF+H
X-Google-Smtp-Source: AGHT+IEMj4CIZl9vzellqnI4WcwnxvO0NIkaxhrPkf+gP/tXY0cA4DNdKa/BQargDiYkTTiO+EqAFGlEsPa0twbQSAQ=
X-Received: by 2002:ac8:57c4:0:b0:4a5:a96d:604c with SMTP id
 d75a77b69052e-4a9ccddf12cmr56736301cf.39.1751986505782; Tue, 08 Jul 2025
 07:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250707082850.600964-1-pascal.weisser.ext@karlstorz.com> <20250707082850.600964-2-pascal.weisser.ext@karlstorz.com>
In-Reply-To: <20250707082850.600964-2-pascal.weisser.ext@karlstorz.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Jul 2025 16:54:57 +0200
X-Gm-Features: Ac12FXxDxizAokM7md1mADyg3WOJX8fxIIC-xNofKxbrkOBoN93furl3Z1gMJw4
Message-ID: <CANNYZj8wcNOU1MDsV15MhCcgwC5YJypRsb-mM2=o+v0VDLGSBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] systemd: add rdepends on libnss-resolve to
 nss-resolve PACKAGECONFIG
To: Pascal.Weisser.ext@karlstorz.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220046

On Mon, 7 Jul 2025 at 10:29, Weisser, Pascal.ext via
lists.openembedded.org
<Pascal.Weisser.ext=karlstorz.com@lists.openembedded.org> wrote:
> -PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=enabled,-Dnss-resolve=disabled"
> +PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=enabled,-Dnss-resolve=disabled,,libnss-resolve"

Why RDEPENDS, and not DEPENDS? This needs an explanation in the commit message.

Alex

