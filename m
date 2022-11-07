Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6552C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 09:52:30 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web09.1684.1667814742665498816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 01:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DjRZQ3yz;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id z24so15367310ljn.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 01:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X0777ZAp6AQIHSScSKfGpBvqegvPUWk4WKM1ucghFGk=;
        b=DjRZQ3yzSmyFFHXYTS8usAXP+tqej7siHdPZma+bqaByqpG0uNGs/4lKp+Dt6x+ApS
         r/uTFXZbwSR1zMNfTsrl+8nl+8G0BqBvL4pnxAtEnK37wQW1p6u0SCg9RRJBU3pm0BPg
         w7d3m9GT0w++rfvUDXWYq/BmN8tphoWe0mJwU0Aid605d+oxnIfzWUC7/5JFGKX6fVIq
         NbjZhGIvyMaX1iIey7YPIcr+umtT5vR/bUnP1VHiZSwisJMyVK0x1T4Ye8K5pr8Yulj8
         Kk5Y4VwTWPqeZKLsmlYN6LHrg2hbdZYGGMCv2TKq0Sq1mlAEWD1JQNO11+3jxdM9EpX8
         JigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0777ZAp6AQIHSScSKfGpBvqegvPUWk4WKM1ucghFGk=;
        b=5KeC4B6eWSlyzqRmpNkg23UxHswOMNR2kf9qmC2x7ldmlM2t0s5uTg9KpBlRSKxP0c
         fIrrHw1uXE7pHLAiEboPgv1A30KK5l1fHmAp1+4/1FP1OM0yJhnQeS2qblqv7bHaJ5E+
         wKqUbjXi2ONTZQNe7AdDZy1AJNf01dsSsHLyTXpaa9+AStXb4eh219v4/ci8j4UqCp3k
         vIUHgOJlebwSWJCdxA2V2MHYsNW62tFy5WIHYS+iIsEtzUAuau6q9JTQ/hg2mEnH4XHB
         Nk4ZFLmS/h8KublGMyqspykUT54Or/IMvbODPwIzVCOfBOn83Ivz5G9v6S33TCxJ+vGT
         hd7Q==
X-Gm-Message-State: ACrzQf0Pm5tS+pvvsgkPxbtSZo2JVMCONKxCy0TNJaD1tSyMrovnqTXV
	0OhvQfDQEoyA1UVSURg21beMv4SHregG5lhRzpM=
X-Google-Smtp-Source: AMsMyM4fhUJaJOyQeG+uQf8iKWt2pNkXSFJRA5zQaZxxCnKlqOOaixXLRtKZYnRm0ncc/oKS4jYHvaHLCe8ydHh4wJE=
X-Received: by 2002:a2e:3011:0:b0:277:3a99:7a49 with SMTP id
 w17-20020a2e3011000000b002773a997a49mr17682501ljw.217.1667814740641; Mon, 07
 Nov 2022 01:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20221106133153.2232-1-egyszeregy@freemail.hu> <00d37819-e04d-6368-47cc-10e0aa51c421@theobroma-systems.com>
In-Reply-To: <00d37819-e04d-6368-47cc-10e0aa51c421@theobroma-systems.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Nov 2022 10:52:08 +0100
Message-ID: <CANNYZj8p_3BDy0wa60J8v9Z2pp-ryWEG0y2e3-0f_0B-B28R9Q@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH v2] image_types: Add 7-Zip support in
 conversion types and commands
To: quentin.schulz@theobroma-systems.com
Cc: Livius <egyszeregy@freemail.hu>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 09:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172830

On Mon, 7 Nov 2022 at 10:46, Quentin Schulz via lists.openembedded.org
<quentin.schulz=theobroma-systems.com@lists.openembedded.org> wrote:
> > +CONVERSION_DEPENDS_7zip = "p7zip-native"
>
> This tool is in meta-openembedded/meta-oe and not openembedded-core,
> should we actually move the recipe into oe-core?

I don't think so. There's plenty of references in oe-core recipes to
recipes that are not in core, as long as they're not used by default.

Alex

