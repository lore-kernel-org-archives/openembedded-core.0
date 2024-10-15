Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53A0D21696
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:43:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.12491.1728996227411008419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Erf2n8yD;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so4030253f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728996225; x=1729601025; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0NbrFruE0KeYLqgZFzJmEJAln61+9S7dIo8cTNQF78=;
        b=Erf2n8yDy6OLTDJQcF4qbVZjhQm9ARPW9CFVpQjwzdFlGHu1e+4YmZ6RHAtyU94Qzb
         /qTzFxjnzJbUIqkzEtRjeXZ4/3PVJpgMRgFfHp0FUmCf8zxxBxx3vTNcAjC6KyPJ6sMr
         vG36fKJPIfZAq4UxTZ3Bh3Z3T/31IdXXXC/Dx0+RRcxN9SNh96bUmbrGVC32fjHW8tRf
         dgUFYeMKsPBjMmAipPxM5VDmv1fuFZX5jhXhsef23+VYeyntjeyZa+h2R0gpQcPKeXNx
         fif9TTMYWTl/FIAlR6N89Ljdf8IOHupFM9Vpo50cYJS412kdK7IfDB7HY4xwM6R9BuzN
         0cBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728996225; x=1729601025;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P0NbrFruE0KeYLqgZFzJmEJAln61+9S7dIo8cTNQF78=;
        b=CUymaOly3hVMO8ElR/ZAfa1juPZLnsxjALhtEhnOaQazPQ7eGLoFcIU/L1dWGWDxVT
         b+jlbZnpfeknp3UalLuMvu4W0vdVsc7tUgrJr7zB0PikeyX4NBnM4TIG/wOz3MvOUg6g
         GGEI148usKRf1FZQ4o6kxJrpl2Kc4hcZoAWGOECSOxTtIjHn4ECK4pDiC1PMl//axNkk
         sehtd2wRAgKvFLaneNmy2/c3S1+H+P+CH3tNSGmaIvF6Ec3jrIyFOxSvJtznd8dC/gzX
         ruWASdA/LROhXSvQCU0JxIyScPo10Xvi3RCognYhF1SyPoMxmJt5cNrJmWw5FSZdvczu
         MH5A==
X-Gm-Message-State: AOJu0YxrsnLqKkSb/7ILO7M9Q5CwRDx+ofwfFBeEtccG+Z9mZgzKn5uN
	mzOJd77gPWF93YNkBzPcQ42Y940orRqhUZNVCzRhGYi9TJKfUfALJVLu/w==
X-Google-Smtp-Source: AGHT+IHrNNuIVcgYB/QHOSzsAKXgOWwydG5CIJuPBXmCx6oJy4C3E6CB6wsZuGHUJ1xmPwaAWb8H1Q==
X-Received: by 2002:a5d:5702:0:b0:37d:3a6f:80cf with SMTP id ffacd0b85a97d-37d551847f4mr9946729f8f.6.1728996225137;
        Tue, 15 Oct 2024 05:43:45 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa89c55sm1491530f8f.46.2024.10.15.05.43.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 05:43:44 -0700 (PDT)
Message-ID: <748f5761-7fa1-48b6-9f00-b055bdb97bde@gmail.com>
Date: Tue, 15 Oct 2024 14:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: scarthgap build errors
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205913

Hi,

I found build errors in scarthgap while trying to update
my meta-python-ai layer to be Yocto 5.1 compatible.

1. python3-pandas needs "inherit pkgconfig"

The pandas version now uses the mesonpy build system and
in turn meson. The latter complains about the lack of
pkg-config. Adding "inherit pkgconfig" fixes it.

2. libgfortran-dbg throws a QA error about TMPDIR references

Is INSANE_SKIP:libgfortran-gdb += "buildpaths" acceptable at this stage
of scarthgap development in upstream meta-openembedded?

Best regards,
Zoltán Böszörményi


