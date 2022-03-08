Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA5CC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 11:47:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.7152.1646740058548773279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 03:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=5I2AuYdm;
 spf=pass (domain: burtonini.com, ip: 209.85.221.42,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f42.google.com with SMTP id i8so28059376wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 03:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nYrMVoZdZx+ZNpL9NHDc4WVp/0BTeYU8TS/3JE5mtWg=;
        b=5I2AuYdm8MYDt1VLPMMxM1L63ZKlZOwGwr4Lm7bhXPKkn+xOMxzt8EIQJU6WzwQDeX
         DNTPPEGicj6qFu/kR8Dsh8Riu+VHx00z/ktB1C5qp+98tWp8RgZv4telMumbxIsknf/4
         Z/iUSikPj75GFc6u/jLmuE6FNREiS8H+zXXPLtniDrHHTdIQqrpgKU22fXQ3Dm+rCCYr
         6HZXvT6+vhpB3wv01ChBv2gGNQKyJryDpDgOhGv7gpeAxuw8X4QTmv3Rr5hz1gzQlofa
         07CR6KX7tW9y4aqGJ8hWniACJ3LTXRYNHCKPx6jsz51AfM6s0tx7BoRUC8+6vLKF3Fqd
         gZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nYrMVoZdZx+ZNpL9NHDc4WVp/0BTeYU8TS/3JE5mtWg=;
        b=i+ejfraYp3YZpfuIv4g3BUGlieqil+DndSGITIUUw46KqHkspvEBR3y+uuWKMLLkgC
         MdI9fUTcLHJq0DpQGit+B2Bk2v7wOJPMxq9oPXDjkpqqWarsT/uDb8VyYKwPDlmOr7/y
         agftGNM5J0ACInBpFAI4IsU6pNaQfI3X1mbUSQ0ivgltvQcaSGGKJSvUtitl7DEzcxBG
         Pdoaiq9dLzapkps+ptk5+iVk3LIEaQxdcf/RI4mXYKfy3FJ1t5ux4uuK8c8cWD//fqLt
         RHC7c6/3e8G9XHsndSM1EKYNGaOaR9me7uDosFNkBeazv+DxTjFvplL47YGGJo7ZYiAJ
         ZE8A==
X-Gm-Message-State: AOAM530M/aMXWbicD1ofvvKKczQsN9DJTSfM/DL/nTg1s+3zZZJI9Ijd
	pFy9sDJAMb4+2scahbX8C8bhDEyh26AELE+4lck3ZQ==
X-Google-Smtp-Source: 
 ABdhPJwavp6dLeOl9PRvxfV678bfbKk0PsiGRbuRNSIJ057A/08SixyW2zdiuq99QZJedEFrTrZFss/vWbbAzwEzAr4=
X-Received: by 2002:a5d:5918:0:b0:1f0:3295:f4ec with SMTP id
 v24-20020a5d5918000000b001f03295f4ecmr11933812wrd.451.1646740056892; Tue, 08
 Mar 2022 03:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20220307194236.3837684-1-ross.burton@arm.com>
 <AM9PR09MB4642242FEC1B96DD9711A1C8A8089@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTt9RmJY4ab8NOk7s-UDXg+fLV3=VxWfAqFP_0ygVKsN-g@mail.gmail.com>
 <AM9PR09MB4642625B1CC2A410991DCF3AA8099@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642625B1CC2A410991DCF3AA8099@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 8 Mar 2022 11:47:26 +0000
Message-ID: 
 <CAAnfSTu3S1U9VD-e2wRu4u4W1Zs_j8QmEvr49wH_NER9PvnkUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] pip_install_wheel: don't lazy assign
 PIPINSTALLARGS
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 11:47:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162901

On Tue, 8 Mar 2022 at 07:40, Konrad Weihmann <kweihmann@outlook.com> wrote:
> For instance the --user option is something that I used once in a setup.

This is the pip_install_wheel class for installing wheels to the
system library directory, so --user wouldn't be useful surely?

Ross

