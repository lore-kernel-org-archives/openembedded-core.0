Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137E9D767F7
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:46:09 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15134.1766144764927625389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YIfY2dkz;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ee1a3ef624so10145751cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766144764; x=1766749564; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lNvJW+1LVQ1s1DxIlQXTojafPBQav7vhJzutCGXzabk=;
        b=YIfY2dkzjK7G0ONZ998I/9ZekkOwbK/bCmXDpJhaU8N7ehL5acd4jM5uRBxIZgl0bt
         O4cOmZtPufDf5k+s7ceP7Np6TLlFtKoZI5TVIImxRDB6M76RFFCNG5tEkysovA16eT3K
         Nu518Yue8vqzPCYHak1p1feIs59Q8jcvOUvQB6N2v26/eYv9Wm7q5GWhje+7i02Sr0Qx
         YMb47zn1umTaT4i6vEOTNlHiwVt75jJ7jEYq0OLJ+OBEZEnhH1J0MWyoAPpyJ8mPqLWr
         Emy0B5dxaIDwN5zH15QKBB/d/NEJgTYEm++a7X1qvMGxB9CK32/Zh/ej+MSeLUSwky43
         xATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144764; x=1766749564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNvJW+1LVQ1s1DxIlQXTojafPBQav7vhJzutCGXzabk=;
        b=Wv/0f/r+kKoXBkhIW6gFOUisSlIbeld8tuqXJos6NB/eUQMAtecIBQhNEAKi9Lstg2
         iqiHt/Pd1gxtDpcRXT20yPSS5gv0NmKxCcNRxul8WMC8cv6mNp/dY+vxfMj+WdywjF3V
         Sbs+ZEGq5bga3YSLKuYCE+9s0Sl/0vAawR9tN662zRJ+7O2EwKd/zo1OykN2y/3/pmGO
         KrP+HXi3ajTmpt118qQ3tWAEwkGzrUS8UrHWwIVWl8ZP77aGeg64B8E6IJdzraynBB3v
         72zrcI9/TYkxeZM/Rchl7miXfU2fDFdZeW/VrnCWxTj6YIypsz+dpyL2jro7rJmkzCNM
         Nxfw==
X-Gm-Message-State: AOJu0YxTKLsUaaTAiSNhV3f4G79JFPlJEA7VA7eFq5ZSTSUgz9OYOj2y
	uzbqYXUClqTkvwwlOXI7dYsDDHgP218q2PMUYeP31KYUNjIa24cCm90IJPi4bTpYwM9G1OIZlLX
	RzDwX1giXeQYYA/Mz6k07WYsHzHt0INo=
X-Gm-Gg: AY/fxX7ngEz5g88USO/Ys7dmCRlHEAYMNSIsY+98JWiMu/RXVa9iLnB26OEpTrWc8Rn
	DP25MDFQDfQkUcY2j8Dlwlm55q/+YBXTuJbutZIajV1Ai3yNYKPeJ1Vq4nEkRG+x6zIyyXBGmXw
	t2IRoG0MhaczTf7yLd+a8gagS9K9/4Qm9tnGuSDt736vX+YWsv6TSLHH/Teqtm7pfwXgihYNZk3
	EI8e5Q9l9U4VQAY5yCILe4Moib9vIDNf0YHQiBlFggNKl0LljUZdIUsa1M36KMuh0pWQQG5VXQE
	JTpQJ7qmbQfO3lwiCh50jvtdbk6i2A==
X-Google-Smtp-Source: AGHT+IG2HgT8AzKb1xsNR4tNj5v+HX+ojZnugYqtYd86NTR/sWW8v6cMJApmDCTnAZF9EXB07l7r9FhY5gEDp+pX9KA=
X-Received: by 2002:a05:622a:259b:b0:4ed:e595:bc85 with SMTP id
 d75a77b69052e-4f4abd621b7mr38179071cf.46.1766144763812; Fri, 19 Dec 2025
 03:46:03 -0800 (PST)
MIME-Version: 1.0
References: <20251219114316.1574858-1-corentin.guillevic@smile.fr>
In-Reply-To: <20251219114316.1574858-1-corentin.guillevic@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Dec 2025 12:45:52 +0100
X-Gm-Features: AQt7F2pRjBdmU-GpLYRLlaUjeEg7lvaBBce7lZHIj7L_LUlHxQAtqOSdvRcDG8I
Message-ID: <CANNYZj_jmioBAzFG3pqO3zphkm_mQF-ZQT9tv_L3e6LRy4nvAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] oe-setup-layers: support inline URI
To: corentin.guillevic@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228220

On Fri, 19 Dec 2025 at 12:43, Corentin Guillevic via
lists.openembedded.org
<corentin.guillevic=smile.fr@lists.openembedded.org> wrote:
> +                import itertools
> +                for i in itertools.count(start=1):
> +                    if not 'origin-{}'.format(i) in r_remote['remotes']:
> +                        break
> +
> +                r_name = 'origin-{}'.format(i)

r_name should be set just before the break, right?

Alex

