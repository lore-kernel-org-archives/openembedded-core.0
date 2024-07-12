Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05CFC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 11:17:51 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.5359.1720783069797691175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 04:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j4By0piM;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so25932291fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720783068; x=1721387868; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b//rOQPLoBpGALv4/KnBo5OTFKIrkTW/lM1wt5yw+Qo=;
        b=j4By0piMHLj2K5EO7QohXV0/p0AZyHQu3045YZCNfBd+prHVD+nyfsh/DHXrNbf1b8
         NwFLGH7ZNZyX2J7IB/wX8E2LzRg9ZE2a6BdfAg8ofGXPHIBn/3MzLTlx5Hbw2otiam8+
         gz/0rGB6vlnxluWkOH5J4vUnKEI4DkZz4aK4J/lDHRxPSGofRiuSLdJyDa2yAVXAlMZI
         9PgjjgIGXjpP0vLinnqsp4SggbCSNKuBt8ZXAfmHmzix/+6ys3z4WtQu9bSd6bLqCZ6o
         azeQVlyNFvBwUituyoBBBxyZrUkEpdOTrJhQJ6A5nHtCF6k5PkpZ+ySw5r4TDDQfnV9s
         y3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720783068; x=1721387868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b//rOQPLoBpGALv4/KnBo5OTFKIrkTW/lM1wt5yw+Qo=;
        b=PJnGipEXjjLyg0meC1DkHAjxn0OWQfhQMA+LaQrsOnfZ0utTBdM8Hftip0Zby3WnqB
         Wzk8SfIfGfpZsV0BKT17hf+d76j/yUZBbBiurljr1/60odI4bZjiEhQ165GnZ5szdOWX
         vb4foVibR8XeMG+9AIaRIaTaYrELwKjyFbarxec9rN39H/XHWfxuszwdQNP/G+jgKL8u
         QA7JJtGMHS8P+ufMi44UQp4S6hyR3VF0B5s9hDXq3N15SvqoGbgJEGFCg8e56K6lgU12
         R0MDe4b6IUdf+vuS5ynS1p6TkIehDepG2Mc9KDnrPmEKL4ArcgGRXoxKjtkjPDkONRpQ
         XFQQ==
X-Gm-Message-State: AOJu0YyZv81F3oNZXkinXY2vAYeoRNB3qjdx7a59RPnlnrqkM4V9cQpH
	DWu5FmMfC4SKjUClXQRXw7Y9IY6pM5q3Plq07/wdPm/4QFQQkamX3DL7BHZdvIJTiTyrjjac3L1
	gvk386AoxLuZrMbZClxpk7jvc7TY=
X-Google-Smtp-Source: AGHT+IFy6Z9BMCqarsNxCkp1GWUAaBed/zKiUzGjpLACvaVJmbL4Y6c+AUp3Wryi6E3Hxqn6vFdHxlG93ov06bP1hV4=
X-Received: by 2002:a2e:a585:0:b0:2ee:4f93:ae25 with SMTP id
 38308e7fff4ca-2eeb30fcfb8mr97712081fa.29.1720783067749; Fri, 12 Jul 2024
 04:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240712110050.2211164-1-ohnatiuk@cisco.com>
In-Reply-To: <20240712110050.2211164-1-ohnatiuk@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Jul 2024 13:17:36 +0200
Message-ID: <CANNYZj8AxXZ2Cpk6DiCo0V8sk7pROD-Rp-WXkUHU5mGmHcK2Qg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: remove paths to sysroot from configargs.h
 and checksum-options for gcc-cross-canadian
To: ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 11:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201822

On Fri, 12 Jul 2024 at 13:01, Oleksandr Hnatiuk via
lists.openembedded.org <ohnatiuk=cisco.com@lists.openembedded.org>
wrote:
> +       sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
> +       sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/checksum-options

The sed stuff here should also go to a function instead of being copy-pasted.

Alex

