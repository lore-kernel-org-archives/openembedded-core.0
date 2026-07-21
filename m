Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDF2C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 07:58:39 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17594.1784620709957582917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 00:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HRlaDRcf;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8f0d6853360so89631036d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 00:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784620709; cv=none;
        d=google.com; s=arc-20260327;
        b=KGMa5EaaB3mCfX4jhXpD2Z3uq17x67UAd8v6Xd/wsXZLXPSYA74BIsK3JywABYTSEh
         BaboWE663iXw+GXYeda1w1MeziIWAkcRH+qqwMbSAXQT+U5s0DCb5QA+Xj6LFIo9cpSf
         NDcFciqB89oq2mVLfTsG/gYle3rwksFv99QmucrYMcXn9h9VdiLhVGJmVApOHNKEJVGk
         +mx8UIT1Il6gTH5T8g8Z+CCiQ7nS2jEVSuQ8LFLuWYTNYAG6FDG4vkC3LsjQd2QYKOrD
         TGSvZDArmxugyEMTK2hUCiBv7O99pbSFFnyYGkx8ywuDgvyg5zHfIoz0A/7IIa/j1Cn8
         8nUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yAnxc4tQidPxWEsT4k7D5BrA5/oNks1oSK5pSig4mhw=;
        fh=uePVF2todFOEF4d1yIuoXUv2hRbH27rrEffEHnJE1to=;
        b=N8KlBE4SQVIe9l5Lk2xt+hEiiufwfZOABk81Nr5C8G46k8VpFOX157wHfavR2ZpDIv
         r4JXSPGRtS8jQSWig45wwhwICJ5vAgiFuY8UiDZi0MsJVkPwTTooRlF6zh7vktpCEKIy
         6Kf00cjRf/gPZ06tRf2cuQSaVLK6nvVx3pIkaMPFGkg8KoufGvMxWsa5CwaNXYFXzV5y
         Uk5dGkXGj2YvO6bZTF+z4uGJjrcM/Gk6ax5l+rZP0PIyjMpIgPqpQB+yIMXRpzCku89Q
         2h/DxfpBdusyKsuLMRVp+ENafIsfcLenRC8XO5R4pYe5Q/2WDf2s0dfVPeBNhJVBqM+E
         twZw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784620709; x=1785225509; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yAnxc4tQidPxWEsT4k7D5BrA5/oNks1oSK5pSig4mhw=;
        b=HRlaDRcfmIjCmp/F5rCKeAIzQ4YQxVk+ja9gzlJHNmRw3KNx8ucZwjDaXVCRJpTJyP
         XcuDBPWjsXZ9RTeU5CkFJwh1cW8li8kTaDcaPFFQPI/KZzKkFHXJMpkeVO3I6KNnwJps
         LFwqoJpNUaYRZBUE4L3UD0wuNAuvOd2jJaa1g0IoQAmINC2dttAB0Ffdmp15rgP3UyJg
         +DNgs47m4QUy9VdgifrOf4ILnRVywc3QVOwn8b6did9VBwDzFRuhqS5WqXtsTNMznlBk
         K/0Y7Bv1hhSVw4o+PZwFY3hzGWGJ+rrsBblgxAarYdg9jnyaJzKxeyZdOXBsbeQbmVud
         7FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620709; x=1785225509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yAnxc4tQidPxWEsT4k7D5BrA5/oNks1oSK5pSig4mhw=;
        b=NN1kckOC8E6DubC0hYjIPHVov1K4HdXXctkptqi1c73E5H3tGsDI7CQFGXDF06Z55G
         HEe5oM17wZhKDPdIAoShZaHr795zVPs1YGDm5MmSS67EhVbmX/LE9qx25NvVAqFCGBaM
         GkBVcSdEN/EgT2MNub9hglGqAsZ7OQ+/wUV74WxfgwQR+2h0/Lo5wymXyiVzED40LjD+
         UcGabATjqWvw9TG4JBJD72ob4rKEFoYiFwOrz4ch6xyKveXEgP7k5sX2lZrFKpmZM7Hp
         bOwP/6LzjclBOaeM3zfIOUPZE0BfxDgLz3So29BYMWtehKzDfUaIj3t1gGvyXSqabaN3
         ZfWA==
X-Gm-Message-State: AOJu0YwJ7dZoR5r79if1OAmwbAVTH0UgOl9iXmr1uDS4bqK8ELzRq71t
	agiEh8BddO/VrBveNlKymQjvi0fY7cpqrTvK3H8+wL8ceSKAquYwSAbxtUwvP4wb+D6YmEbyan1
	3G62RlpkAXS2f/yh5ZjFjXT1ZE+bC+CUfpA==
X-Gm-Gg: AfdE7cmeu7cwk1FR0Js5ezwFkUberKY5SGi//w49A30jb8K2NiIymNAzELnIqlG4XmN
	Epx6oH24Zdvgw5qOXz9eXHaf9ZtQgt3NQR436b4pPWhJ/E/7ZEe8hSQnK1xNdrmIUr8HMX4pH4p
	Yu5PjiXRw0kqdfajHypwIlYIqUbHHXa/nYI+mDur9G1aji380ifm/BuVd1ftrXqTYej7cmlFHM2
	EQTp4+Rg705gWvJzVqGB1mdzTdMXXYaFnTEvkrH8DBmLfICpIuXLc1Bf3/31UCOjv+S7hUP4Baz
	V2rQLmHXXpAl2mgri9UA
X-Received: by 2002:a05:620a:2319:20b0:92e:c117:5ed1 with SMTP id
 af79cd13be357-930b431cdc2mr1249562285a.81.1784620708615; Tue, 21 Jul 2026
 00:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260721030510.2071878-1-priyadarshini.babu@windriver.com>
In-Reply-To: <20260721030510.2071878-1-priyadarshini.babu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Jul 2026 09:58:17 +0200
X-Gm-Features: AUfX_mws2dqwr_fGZK0zTXXqRRfWaWkmIhgsTN7fW36jKFpcW9-eWJijOLAyRLE
Message-ID: <CANNYZj9bZSwtH67JwyapPQ3T5_7rFocdPzHu84uCHV_1Vp2aSw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] vulkan-samples: disable VKB_ray_tracing_position_fetch
 and add install
To: Priyadarshini.Babu@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 07:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241510

On Tue, 21 Jul 2026 at 05:05, Babu, Priyadarshini via
lists.openembedded.org
<Priyadarshini.Babu=windriver.com@lists.openembedded.org> wrote:
> Disable ray_tracing_position_fetch sample by default as it depends on
> pica_pica_robot which is licensed under CC-BY-NC-4.0. This can be
> re-enabled via the pica_pica_robot PACKAGECONFIG option.
>
> Add do_install to properly install the vulkan_samples binary along with
> its required assets and shaders directories.

Please split this in two separate patches. They are completely
different issues and should not be squashed together.

Also, I don't understand why something needs to be disabled because it
has a certain license. This needs to be explained. Are there
particularly problematic terms in there? We should instead tweak the
LICENSE field, or packaging.

Alex

