Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3EFC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 14:36:21 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.10701.1644503780010660126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 06:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=AeaGZ7rJ;
 spf=pass (domain: burtonini.com, ip: 209.85.128.51,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f51.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so5330811wme.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 06:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dLm6pFgTA7oa3wYr5cYgBVXJrCiNvz08dQyHoe8tip0=;
        b=AeaGZ7rJDWRxvOaIqR1UMqrk28oNsg8obR830NG1XNChsjM2F3HRdoClgvgGhrVQjK
         nME1SvAYIxmR4poBo2IY0ZxTrA00SalmRSxvxs2pcgux13llWcOZ6FM7sXnxOD4aRJSp
         uCp4tIpDkP/ULu9/Yepsr/hcv2R7gbXCNzh7H+KllfPUn1t96+kpmNxeaFeW4SAGt8Zq
         t0BslvmEs+/9ErQZsnyZ3DN86lqtHAxyOGxAoHzRD/dKemJXVPTNgiwoqaw75Ynf2EMP
         MqxWA5XU3rfLoXT4JnRkrjH+Qp7A+CoZKiDiJQ8gaVOhEfhStFqZu7nZQU23Go57s9CM
         6WGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dLm6pFgTA7oa3wYr5cYgBVXJrCiNvz08dQyHoe8tip0=;
        b=tBs/LDZi9y3+FBFmHYI/q6aJysAqSfGtQM9evr7r2m2lOzkLSKUAx6LoEz02S90bVZ
         eHa5AlKLivJLAjO1KSLtDfNnXSSwmYRRjOYPsXq02Hth3Hf37S8EBy/ZP4TJwCCjjjh/
         fZ2i9mogFpxB8sXkQftURD6YXkHYw/PGDToAeoSP6CFuLOQdF+fVlOFg76qC18hBbEZH
         vm07Lgaxm0r4U76rvsk9TQruDo3M27jWXW6SR8aAFxkehuB3OQTG0CHuAZjWJjaxlXsZ
         n8B1J/9ofgmKEBrvh07Px3v2gyQrwp3e7XPU8rGvLuiy4664ibfSs5sG6AMta3hnikWL
         86Zg==
X-Gm-Message-State: AOAM533i2NMU4hODHIkj17SAu9u7B6nX3AA9Gu+qwmkI3eWEwYgZ8rBb
	vAh29ZGw5+XeTwlMsRGvz54RyK+3NFMa+2FTIhWZMA==
X-Google-Smtp-Source: 
 ABdhPJwYrT7SHA+BhNsJTQfKlEGZLLV3ahfJqdew60RXNSZf1O1oVF4MFvdrZUiKrM7xEx92aVU5TDMHnOYrqP4vFH0=
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr2407508wmj.157.1644503778319;
 Thu, 10 Feb 2022 06:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20220125095922.70163-1-rybczynska@gmail.com>
In-Reply-To: <20220125095922.70163-1-rybczynska@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Feb 2022 14:36:07 +0000
Message-ID: 
 <CAAnfSTvkWktcmBBGWVXxuBRgeu6iBMoi7bt2iniNyuNRG3cPKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: add json format
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 14:36:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161614

On Tue, 25 Jan 2022 at 09:59, Marta Rybczynska <rybczynska@gmail.com> wrote:
> Add an option to output the CVE check in a JSON-based format.
> This format is easier to parse in software than the original
> text-based one and allows post-processing by other tools.

Nice, thanks.

> +        from jsonmerge import Merger

This isn't part of the standard Python library, you'll have to
replicate the logic.

One suggestion would be to move more of the logic into
lib/oe/cve_check.py so the class doesn't get too big.

Ross

