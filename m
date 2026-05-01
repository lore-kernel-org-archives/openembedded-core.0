Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F82CCFA13
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 13:16:57 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14076.1777641407973269272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 06:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Lcy8Vkqj;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-654672a6d68so2021407d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 06:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777641407; cv=none;
        d=google.com; s=arc-20240605;
        b=UNIn1Oe5fEXVg/PA30sVGZh8/yMg4CHPwwSS7aFLXuLWzvWnf2PjJ4U5Puxe8kD9k2
         n1RL25NFPi1bY5x4EMqahGYzMN4Pd1pE3Q1AmoZNqQzRS+OhZD1hYlhIObZ8biMfd8bP
         IC0vNWg3XYcExGaV/0E9o8XTA9h+HUeYVCud5MYXyOasyoMoRRtlASjV4VXMGJZ2m8B4
         1clsIraBD++Eou5THbnvaAwh+Hd+lUfhmqlmJPR/xucZPfYIrq1tlqUIIwrVe15hz4Y1
         fKdd9Fu6rVsZTa4l5nZYnVdNILtnngbysinB6NU+P+Ys12Y1QUD5oYq/pVoSh4BQkN0U
         6E0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nAvqJ59pJLjuoy1yryrTZ7FNpqON9nqmRlhQeFdXeNU=;
        fh=2OgyJC1ocBqP4ZMAeBmOH5g1q4VwpYKdvp6AnKDZOMU=;
        b=DdoSCy6uX+myy/PNZS17Zp7txmzLvlXr2ZttsTJsg2aQIkVkzoJoNjKk4QaQnFigul
         MCpL1s3CdEzgJpweh/Q2DJ+M3EtqNEekW8ynC1bnWKIpxqqgpXYaiE9agY/EWsevdn3o
         tskbf48yYxa7yzzMxR4O3uHKgmecEr1IOBBiB4RJtL/UtOdJfG0DZySdlg3DGDXW2ju/
         +QgJst15AUc9ueRBbfhP/tcjADhSLSXadOuSZDU6DZHFXih05eYhTXAE+oJAir3JMOUK
         7HUbIO+xYST24C1HZYLhMmlMPtiljrRpXSmvL63fI0sD9m71gkfsZnyqXA4cjtkQYmv5
         pukg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777641407; x=1778246207; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nAvqJ59pJLjuoy1yryrTZ7FNpqON9nqmRlhQeFdXeNU=;
        b=Lcy8Vkqj1d7o3viwF+rcNG0iDyHmJ7cF6xdBzj0ZyNDVrT/11shH5lJEVZeV7JeTAA
         i010I68dtK1h5L0xcWyMjdM+c8c7A5R3qe+bbKKxBLcGR88hfpWDwN+okxF2IzJQjcsF
         oMFBP1A8ZPgAgieIOIwiME4pDIGxYRhI5A3CxrSR+juEJOR4JbnFCbuPY/O7J5et/+9E
         eoIKoYeY00Fvbzx8uHWE9Yum+9jjRny05+J+chVfruTH4Ya6GiLcovvpTVvgd8w4Gtcs
         ID5uBYhbNV/5WlPF80XbUnbh/eGxLbC+zMOHCZTORJNeplC5o1XYsn5La7g2fLcxQtfV
         a7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777641407; x=1778246207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAvqJ59pJLjuoy1yryrTZ7FNpqON9nqmRlhQeFdXeNU=;
        b=j4KvVCXbRCxVfdPh5/RNXaiIMfxhF2vcDDXvgurE0PJruKKUxZOOZGNAuH1fKEj89R
         mqIjyRjCDZvWm2YKLsbWlu70zFlNm2sRAp9bJPNAiOK139+wQzSoeA7r6tu25ZV8cP53
         E+FG+tCqIrSPp7PjENQAnk3SieYl4tUnnzQ3pg7UQwp+ynqATjtA0pwxaMXpq91J8Z5g
         flYMmpr782aFfR8zpC9Lz4WNkVi0fXUdhAEmGDZc/x7eVO1TiizpICe6JIgbXAsUfzy6
         IVvS3K+4CEaEV6Ud3lR4878UeoZMHDzPqATSTY34KX3xchAGtEhdF9ChFIoAZ41bzbsY
         ciBw==
X-Gm-Message-State: AOJu0YwM9loK3cuZR2AUL0KHTG0L+51yeZtxogf0uutCodM74FO085BO
	ietnXjVURdJ/lGst7D5gAPO1Pt25Vn7Ozu2efZdwmiV7hjvnKzN22xEzcgeXvMlCIO36XQJ3nT3
	bgs4TAyuyYZ8Cwc1WvHmESZmxnd94Xlc=
X-Gm-Gg: AeBDievCE3VCMx2iSZ6Hhe+cG6oRF8FjvXqVs7MzCsPLvSWchQpmmr9WDnLwwd8MwgA
	iTz2u1nK6rmuH+Txqj2xhuzhh16/BPgPzkH2L2Zn0p0YsE5w8dPTnHBXGSsB2dIQik+ZXSvcpq1
	WLkDfbi984i7yx+uQxf2efar73OQEh0g0n4KNO2FfgRI6e+QrDF5iAWxrECHVphlpS+zO2Ozm0a
	hkeHgQMOoB+9DBarQuQ+JQyYZFK+SDZiJO5DtArzR/YFB3IUdAimqJt7ZoHWij0TOddDMtRDi1Z
	HwLeRTo1oNBmzwFSFOp4Hehz/IPtKQmOKoueMxxPAqHs3ywPQP4E
X-Received: by 2002:a05:690e:1557:10b0:64a:d479:bfbe with SMTP id
 956f58d0204a3-65c18b02ba5mr5035909d50.11.1777641406969; Fri, 01 May 2026
 06:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260430175308.868993-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20260430175308.868993-1-dario.binacchi@amarulasolutions.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 May 2026 15:16:37 +0200
X-Gm-Features: AVHnY4LJhcjrMikAh0YM4W41xIqF9QrLQsGLSRgqnapoZRbX9KCq-vwgVw1fKs4
Message-ID: <CANNYZj97SF0G6X0dBg4C7PnrW6QFCXBpq6e4XJCkWzYECK7RhA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] libfwumdata: add new recipe
To: dario.binacchi@amarulasolutions.com
Cc: openembedded-core@lists.openembedded.org, 
	linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 13:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236194

On Fri, 1 May 2026 at 00:18, Dario Binacchi via lists.openembedded.org
<dario.binacchi=amarulasolutions.com@lists.openembedded.org> wrote:
> libfwumdata is a lightweight C library for parsing, validating (CRC32),
> and manipulating Firmware Update (FWU) metadata, allowing tools such as
> RAUC or SWUpdate, and in general any application, to modify the boot
> bank selection.

A library recipe without any consumers doesn't make sense. The patch
should include enabling support for it in other recipes. There should
also be an explanation of why this functionality is common and
important enough that the recipe should be in oe-core; until now no
one has asked for it.

> Changes v1 -> v2:
> - Drop S = "${WORKDIR}/git"

This begs the question: how was the recipe tested before submission?
The above line would result in an immediate error on master and some
earlier releases.

Alex

