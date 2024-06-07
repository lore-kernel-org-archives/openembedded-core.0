Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B004EC27C65
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 01:32:46 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.31628.1717723961181867800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 18:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hnku7l8e;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4402066471cso13832131cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 18:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717723960; x=1718328760; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lgHMnfVF8tWPukiaYbsjj6dnYc4PptczCEp4nwIWcMw=;
        b=hnku7l8ez+cAumzQKMad50oP1rbhYvf74Z4mVonzwyur1MvS9KPNCD57l7cLGtD8Hc
         h7A5ZNq/mfgXyFEHYEb7JLzNEzf7wp1ocsoW4+Q9P9Ak7BJBw8+iT+Fzc2igPcBFxs4H
         mkhqjD2sk4rS5Ed8FZHlcXqSL7t6qxwz09QdbUP3gMsPHSgv9kfTItkeGdWw/gJoMgel
         b96og9wlS/xlggG5/oaXf3xMF8AXgHxjDhNVFWj9MmGx6lKvTk9EslF7Mfls+D2BMMnv
         4l11fFqnvyfUDYvNfvTdS7GVwvCsK81Ixu1Xr+jehxewee4RQdRuM1bqr+HjtegUvnMH
         KzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717723960; x=1718328760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgHMnfVF8tWPukiaYbsjj6dnYc4PptczCEp4nwIWcMw=;
        b=AJKeewqR32W84+qAmq5PoAlyIv+qWESrj3yegPVrq8OXhiHkBORPY9m7LOky6uLjzY
         h0vuhzLICyOauatAPf5pQVNzkLwIYjpKcvGrlrxCcck/DUQVB3loBU+JfZJeM8pDpiSV
         4LwXS4YMnbiZarBWBx1nRzttXG4eE3cLOFJ/OUFbQeXg6he2aJyioeG8CeOITHjnAcZH
         A/3Gll3EKzFipowpuS0ACjJM7nYuHKNG32eZobwT5Z9y17nRiMmgi23ePGUrJ/v1aLav
         tQ9tVQeWERAa0J4Kypr/Fspoo92OdwET5FJHtovDxBXfXkLnVUoIyl366trifgJAApyq
         PlxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUijzGy+8z1LggK9ek7V+yJtR4kSWg637EgzC9Pm+4+ogogzsPcLyuhMy1C29X2vycW/H7rKe81+o0jNiFBYJfYkDfNyGgCHmo+7Ua/Y8lPtwewDe8ikwLB
X-Gm-Message-State: AOJu0Yxkp9Q+2lZ6KJ+sdHb0I3R8WHBwiiGQ94jRO9NEG+w+Nyc6zCr5
	fDM/JUcLWeUX2RyodYoAYGBYdjIxiEC4T2nO0YPbjBcuv/7Fs5qf+pUVtmzF10U=
X-Google-Smtp-Source: AGHT+IGfaIkJGzlnC2HgDZODHFI5QuJFjQHNr7pmbOWqDGSj4qVt/NVYJZbxgbo2qSeJQuloWtLSBg==
X-Received: by 2002:ac8:578b:0:b0:440:25e8:15d7 with SMTP id d75a77b69052e-440361f9611mr74410451cf.6.1717723960163;
        Thu, 06 Jun 2024 18:32:40 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79532813a2dsm114083085a.20.2024.06.06.18.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 18:32:39 -0700 (PDT)
Message-ID: <ad4d9971-f983-4dfc-a4d1-c7cb2ae1cca8@baylibre.com>
Date: Thu, 6 Jun 2024 21:32:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH] archiver.bbclass: Fix
 work-shared checking for kernel recipes
To: egyszeregy@freemail.hu, openembedded-core@lists.openembedded.org
References: <8404.1717709883800685810@lists.openembedded.org>
 <Groupsio.1.8404.1717709883800685810@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <Groupsio.1.8404.1717709883800685810@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 01:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200420


On 2024-06-06 5:41 p.m., Livius via lists.openembedded.org wrote:
> [Edited Message Follows]
>
> When i apply and check my patch in my git bash console i have no any error about "malformed diff lines".
>
> Livius@DESKTOP-LIVIUS MINGW64 /d/Bosch/openembedded-core (master)
> $ git apply --check 0001-archiver.bbclass-Fix-work-shared-checking-for-kernel.patch
>
> Livius@DESKTOP-LIVIUS MINGW64 /d/Bosch/openembedded-core (master)
> $ git am 0001-archiver.bbclass-Fix-work-shared-checking-for-kernel.patch
> Applying: archiver.bbclass: Fix work-shared checking for kernel recipes

It looks like your patch diff is getting mangled once it hits Patchwork: 
https://patchwork.yoctoproject.org/project/oe-core/patch/20240606204855.1904-1-egyszeregy@freemail.hu/

The version on the list is OK: 
https://lists.openembedded.org/g/openembedded-core/topic/patch_archiver_bbclass_fix/106531570

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200419): https://lists.openembedded.org/g/openembedded-core/message/200419
> Mute This Topic: https://lists.openembedded.org/mt/106531811/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

