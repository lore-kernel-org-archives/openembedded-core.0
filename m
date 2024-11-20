Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B28D711B4
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:26:15 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.16261.1732116367786296417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 07:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QY8lRpm/;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d413def36cso39459836d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 07:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732116367; x=1732721167; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H8Mu0rcAT1doy0WdLuLCa7z8RosWMwbxIElWKvTvACE=;
        b=QY8lRpm/IztXKH/hWjv//9ZdB/ePMSOmIAQcaCg9+zmBYnfiuOEYx5f5UxwXg99ikw
         2hEgJRspHRXBSlwGAY880kbrLD2i0A19eHn3K6fOm3tPL2MC18JRLsZE9mpUJ7ZGfs8R
         zsxbbDGtq6yoq6lanFMchUXxqGGOeKwApodqTyFMLXNsY54sqwEPL71Pwg7Gn+hqoF0d
         bR4Om5E3Izknj3xCukuRqPP9PjJNmoyVeR7meJIoUSyKF3+Msxakex47/iy2Q1EXCQ4V
         ibMxqMK+zeOW1SzoE6iXq7rEgZxmk4b0pjxfeGWEvAXml6Lxf0LrhUmsvt93FYNhFgjv
         aOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732116367; x=1732721167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8Mu0rcAT1doy0WdLuLCa7z8RosWMwbxIElWKvTvACE=;
        b=a19uJxHy3vAN21d/aKdfbMVTtr9SLCNkv9YLbRK17uqIfeVM6R1hsR07vjC+mi3qLN
         gFyhi484nWyaZ6Cdu8fqA03qvRI3ZWKdpdEU8B0c/EgoVBHJA2yTn5pNK67J+tqDopRl
         3ZGBnvXUKVgcLqvQ2vwASrB4QAlL4IpBZhTDl89MmzTc+13BORE/Zs4OiXJj11e/vkQz
         82LMg0qBfUwj0bC2sRU7CE7jQiGgvY+uQaL3w2lBvDsIVTy6tTyPxyYMiJZu9DjinJ4w
         gKuJWec9HHOy0NS8AWxvoEw/eCFseoqslQ8GKIvONDhDDwk+4ezNzhsk+f/wKq5HhVVm
         I1MQ==
X-Gm-Message-State: AOJu0YwduSD3+zL9XdLoLykItGroBRwyFKH86+K5VWYOlENcirDw5hgH
	5Qy/cW/81dxBM8yWkfTU67mkoCn07DC6UpWFueadZAbfEip+nuWVoOD3Y1zs3VAOfeStHrqu2Qz
	9B+4PhK49qErFIXkIo4u42Fxzrlqbkw==
X-Google-Smtp-Source: AGHT+IH37/1dNpyEj/1dOWsuFZlBqNH2PW3vekwCfCUvk76BVImVeaVilw+67zpyRPHtH+LwNSBngAW+WbwgpE23HEM=
X-Received: by 2002:a05:6214:29eb:b0:6d3:f981:345b with SMTP id
 6a1803df08f44-6d4377b449bmr36941626d6.9.1732116366589; Wed, 20 Nov 2024
 07:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20241120150346.2279992-1-alex.kanavin@gmail.com> <2bffb899-bbeb-4459-8110-7b6fedcffbe7@cherry.de>
In-Reply-To: <2bffb899-bbeb-4459-8110-7b6fedcffbe7@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Nov 2024 16:25:54 +0100
Message-ID: <CANNYZj_TYXjp3O4n-f4izCNPJS0ARqPAcAPC1rVFwJ0FP5QNQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] package_rpm: use zstd's default compression level
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 15:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207460

On Wed, 20 Nov 2024 at 16:20, Quentin Schulz <quentin.schulz@cherry.de> wrote:

> Since we have a variable containing the compression level for ZSTD
> (ZSTD_COMPRESSION_LEVEL), should we use it? The downside is that it's
> prefixed with a dash, which would need to remove before using it (or
> update the variable to not contain it and add it where the variable is
> currently used.

Sure. I can send a v2.

Alex

