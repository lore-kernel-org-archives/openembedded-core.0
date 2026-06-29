Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025D9C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 20:45:03 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7133.1782765895986275852
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 13:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LUYupHrq;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so3703226d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782765895; cv=none;
        d=google.com; s=arc-20260327;
        b=c/LNCOMcK1JjAIZDeCy2YUvo4URwx6ZYiCf26ZeGmo9aLNpfGRgOE8xIYqCqKjTlaR
         ibsoZ2sqVptEsnLXLkwkcUlyH6YukVYNoMIryQebK3h3orqqLimf+IGAd5foqNVUspfI
         lAcgh8zGiG+Y2w9+MplQIGos+WGO/s31+9hD4WqIAxRajJyfsV1K6/tw3m/Bi4pgrKBB
         Kx4h7+u5UlsKloo68oxJYZ9h/w/Ms1T7H1OmGDqmRWChottCQ+rsT+gTa2odaUN5vZJ7
         Me66GJFioSF4v8YPBBoMI8G3LeqRitxZ8jd+9ImzIY2QQY6hLxu4EjWlAWAOWHScphwR
         sBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=emJlRB0AvfvbIjQGP8oA9hRRKoyewmlL9UIaMb63e0k=;
        fh=KVsJLDHlxg5us2/ThmscPOwMEERCbXK629YENmTT4EM=;
        b=RQgT5LOqaQVbG5M5OlPzTWYjcZHxYqMr9R3wJQ/Oo7L3qP4h/qDOXRLYzJ025azDF7
         5+RsCbKVbY5RWzTZf8nxev3U+1gQnGvXPPmifSWjV3JgbNMvLSOvirVlULYzMrHXWvEh
         W0KBkEeVpMYECI+Fy0qEbNs21trgWYhK2cNlXEsnKc7wgTDIpCUW92VS96V1tCMys084
         eynLaS/Gpdv729btaAlO6rpdVme/GZiTH410QNT4KCDxkJ4qAIfbHsg1Ga+BY5aXy2g6
         OqKZYAeyZD3s7GLMpSkv/8cLokUFGqRP+2R0Vpq3+rkAS3dQSpEY5U+l/lnLEDBTT35K
         O/qw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782765895; x=1783370695; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=emJlRB0AvfvbIjQGP8oA9hRRKoyewmlL9UIaMb63e0k=;
        b=LUYupHrqEWUZJXGO4bhi6Xa71fKE3a3vP2yET623mV45bMx5wVM8NJjQjtlkAn0FWO
         L76cI9ctcnf8POe+nSvhh0yeCOwkhx0RoofXfSWcOWBlX5qvXnT8uxlmzO3RIdHOQgcJ
         HOYcaPwief/iz4Q4wIHCIaLlvryUdNzVYcoh3cJ8pinz0b1jTbhn+pUCBiSN3CW9BZ+q
         SZq+yditqTYShy6k22UC6gKve99aMfVEQloV/dbsKmJzlDTHW0Tm0CPE+b0vy9UH3cYq
         ccHprr8vm+gS09R3IXxMuZjS1yrPHRfuZLfwNTT8vEr+qwLFQqaA7lmUVFXhVSCAB2K+
         2rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765895; x=1783370695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emJlRB0AvfvbIjQGP8oA9hRRKoyewmlL9UIaMb63e0k=;
        b=U9ipgVKARNN0UEac1pxig1hA+KxiwyiH/Mb3JDHmiMA65oFbAB+lPu736dyTjp8/XR
         so8T5c3iIBDV50TiUMmArN1W6L2kX/x9RXm7kkcGeYXUZzirBPmr2GkTSvo4aI4AEG86
         OSXderVSgVjF9f3GZIYjRKb+lRYjwmjtdfSD5KvL6KcVTnRoHiv27PxDhRjFB8kuDVFC
         /DSINMDHBAbZCS+zxHQcaztRsTYO4F99rEiqu9AvX/jakccL5vFhtiHnQEQS7SXKQTMD
         Rx8pXKdx0jtQfCyb+DyZT4eh8yd3C9I+KC6PJKeWG3IazB9/JeySbUfIqJ4aypfqjVrH
         f1zQ==
X-Gm-Message-State: AOJu0Yyx+qRg4VjfjEmxXEtxe0m69qN5Pp4+2VNXwdiG2jqjfUfyi31e
	bYPNNJmGCxEm25bY2PLSGmICpeXco1RmVWvnGBEZCY2neJ+uqANLXtcCOCnJQCbqHfX8Dn3O5X8
	V2RDQm1OU58khdjYRE/9tGoix5S5K/1lE+NlAxZU=
X-Gm-Gg: AfdE7cm0YMq0V9s9IWPMp950NLG60lXCWBk5XZF2MbyUFcjDqHTVSkViYeuuAVasFJ7
	yw111l3YNmT8F8WUrq+5a9HyJZeL3MBcBz2ddosmDAtS5iLRDWM7luyCzR1KPwPE/7I4vRG0qg4
	gXb+pXFBlGCiywILG8HyYEHXRdMd+rZDslPp5hQxyIcFllJm/E2IJF3ws5GkFwLKXnMNF9kKiUI
	Q42fr6niz4NPN/XgipSdq3c0eR9nraWt43MReLzPmy6ep3+C26atZPRGKU0VpZUm2JB4yPexyaP
	47LiyQps
X-Received: by 2002:a05:6214:6009:b0:8e7:e247:8300 with SMTP id
 6a1803df08f44-8f1b8b7cf2dmr16341186d6.3.1782765894894; Mon, 29 Jun 2026
 13:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <0101019f11d7a8cc-83804a7d-3721-48fb-89c9-4a1ad38679cf-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019f11d7a8cc-83804a7d-3721-48fb-89c9-4a1ad38679cf-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Jun 2026 22:44:43 +0200
X-Gm-Features: AVVi8Cep6H8BseKYlKmOuaP_qNdrMeXOOQzPscnYqyARKKnJzaD2TEGcNIV12pw
Message-ID: <CANNYZj_GQ+OjgDTcfgtq64fpohE61y=3CfdCh3LwYyHLybe0NA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] nasm: upgrading to 3.02 FAILED
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 20:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239825

On Mon, 29 Jun 2026 at 07:26, Auto Upgrade Helper via
lists.openembedded.org <auh=yoctoproject.org@lists.openembedded.org>
wrote:
> INFO: Rebasing devtool onto d3db82c7a44140ac4e5d4d7a6b7a194cd95d151d
> WARNING: Command 'git rebase d3db82c7a44140ac4e5d4d7a6b7a194cd95d151d' failed:
> Auto-merging Makefile.in
> CONFLICT (content): Merge conflict in Makefile.in
> Auto-merging configure.ac
> CONFLICT (content): Merge conflict in configure.ac
> Auto-merging include/compiler.h
> CONFLICT (content): Merge conflict in include/compiler.h

This update needs a non-trivial rebase of the patches that add
debug-prefix-map option. I've asked Joshua to do that in the upstream
submission:
https://github.com/netwide-assembler/nasm/pull/8

Alex

