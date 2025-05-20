Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF958C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 13:24:52 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.20731.1747747490570276624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 06:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+EqdVit;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f8cb6b3340so47813836d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 06:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747747489; x=1748352289; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YEVz1SZ9qOTY9G1oNXVTIT9lApgLly3GFOwwcAVx3TQ=;
        b=j+EqdVit+O0rMvoomqQ559iKCm5IHa1jmsER38MjPItIuU3T0vps2z2L5NjcRXUTr7
         T/0tUoiF4Yia4CbaGY9p4adXqZU63arc1YBfNBFgIWYf41c6PjIiGafdJb5w3cgaAeWj
         h/ruGWtdv/uejHE4ccCX2pbK2R39Ifet/gyfAo8JNYcRkuXbmBxbPEHPW+VcO1yDUlCt
         YuQKLOCmmMdDaumxSiO8JivU+zflBY0XsJ6gjd4EYLa2ogMnEt1MF6lv9qTe1YDS2jZi
         xatKbNW3azFxL78x7uCidG+IsgG4T+5YntmoXKxyi7CCudqwSGz2OUpN+JJGoPcOGCWE
         NKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747489; x=1748352289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEVz1SZ9qOTY9G1oNXVTIT9lApgLly3GFOwwcAVx3TQ=;
        b=gkt2qjVILwzjgU9IvUP9QCSHjeyEt9yAXWp3rwiy8yeBZ/ifd1cJ3dHOzuoWWZsJVa
         SlGE2Iao6mMsv2gAjytOFv4BKVeRxwK8yUrBmowrY0qAkWmsIFw20gxyZ0tuyPclgR0w
         BVsobKlGASjtajqUrr3HUIsyGewvP8Hl+5QYOXQ0bKTqMRyCL1A6/aRFr9xUZ3IBa7C+
         zJq3gb3T1heEJUBvhjVD/B8y1gw1oNtkXqof7o8R0MKsvTuwRVXo37ERDNCKlTz5w7ez
         gL3I4QZB4sXp4oOrI8ZhEDRVYmxjbxmvH67MqRnpLTXQeYQaMvsH8gT5rjn+n6d6bC48
         5gwQ==
X-Gm-Message-State: AOJu0YwetSMC3c/tBj4OwPKbTIVNiSp4pnuiITSZ2UhHSOnGAUiJnVmf
	Y6hQU5SXcyjQMV2U+4DY+5H/vrAL3YZhLOeR1hB5ChUPWNKH5TJlyJe88T+aIrTY0Wt8zH0MSrB
	hFO4OPTWGGhYq7GiYIQwcz8af348ZGLLr7g==
X-Gm-Gg: ASbGnctLCacQKL89baOlO6+3nCp2ooSuWeMAgPWLN1YUWDDSxxgj9/oghOaRW3d3eXB
	5isl634Emy77sVWkCYmQUd/RjifTgMtZl9nqNJA2F4nWZkCB6MgezEwISKDMIQppZZArh4yYIt2
	sedxgKG3eChXTI+8HV88buwqJ3XbHuzpbPFQ==
X-Google-Smtp-Source: AGHT+IH0jpStv75LbSfoNoJRIbpi9Y01EkpmYvRQQiwKlp03yr0BeXKp9Gwc5shW51ueibbmGoQtNaisPvQ3KXaBoCI=
X-Received: by 2002:a05:6214:194f:b0:6e8:f99c:7939 with SMTP id
 6a1803df08f44-6f8b2d45f69mr238793936d6.44.1747747489400; Tue, 20 May 2025
 06:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250519181815.2536332-1-jeroen@myspectrum.nl>
In-Reply-To: <20250519181815.2536332-1-jeroen@myspectrum.nl>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 May 2025 15:24:38 +0200
X-Gm-Features: AX0GCFtZFSG-Scyjmk6Hh2_Fq5TOAWdCFaXNnOHaxRKgG-6JuvI28ljsBnMda6w
Message-ID: <CANNYZj8akxs-9hB2LirzQpmM9_-6EMxc=otE+EPuykFvX1Ryrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc 15: fix ldrex r1, [s14] on ARM
To: jeroen@myspectrum.nl
Cc: openembedded-core@lists.openembedded.org, 
	Armin Kuster -M <akuster808@gmail.com>, Jeroen Hofstee <jhofstee@victronenergy.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 13:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216912

On Mon, 19 May 2025 at 20:18, jeroen via lists.openembedded.org
<jeroen=myspectrum.nl@lists.openembedded.org> wrote:
> +Upstream-Status: Backport [WIP, https://gcc.gnu.org/cgit/gcc/patch/?id=e5bb7a328eb71daa02d15b48d3a6c6b8cd24abc5]

Has this landed in master/main? If not, it is not a backport, and
should be marked as 'Submitted [where]'.

Alex

