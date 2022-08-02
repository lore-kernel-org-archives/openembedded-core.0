Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2072C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 17:19:13 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.9046.1659460752342770091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 10:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EIKu5ifW;
 spf=pass (domain: konsulko.com, ip: 209.85.222.180,
 mailfrom: trini@konsulko.com)
Received: by mail-qk1-f180.google.com with SMTP id c3so11114092qko.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 10:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uWjk85wnGGyxKa2GhCoXG+4AgBJtDvjAiSg+lFxwoqo=;
        b=EIKu5ifWYJr/w3P6JmuoSrRekOqsnY2Mn9/4ShCIgyeWV5TDKzFhDFtVKB9CEda3i6
         OscpGk/g+lRGvlvuOOemlNCVNlSPn9/qE40TIBQi80v93MHKCjR2gGWL7i3dWUJ0exqp
         NBdl/oAOohdxJgrju2xY78gq3xuXE4C29EsA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uWjk85wnGGyxKa2GhCoXG+4AgBJtDvjAiSg+lFxwoqo=;
        b=fNVaJfyA5z2EVRT9Cz6qrC8N9NKcvXNIaCxBBtl7YdrdOhI9+74/zlJ3nN9bNk/vBW
         4gehHQ1MGLJ4KzKBo76iGUwqbiLDFk6fqtJhp4J8BUzp2MCug72mrTYAu0TvPZ+BKD0j
         oURpBmMmRxjTxGZulwBWZlIZmpH1RsrHC0FWxmcFpP+EdzxGwzCHd85/tJIVRwzrKT9O
         MXGhe67U51pEpEcuFnu6I8uNMkTIxG3MtuX4PPJa37ut42I2wRggOc9OyVu1icr9E7zr
         l9Uekab+PvXowdffKBm9Gsm27KpmjoB3zrG+73b+0exTNjSKad9IYqNHxCRjdNVxq31J
         0MwQ==
X-Gm-Message-State: AJIora/X15nvUmS2JwUWKkzaVrIC3WcbeV8N5jiJQW03qLcdmVdA80FN
	+oxBfL/ZzSJ+f4lUYBe3pj3WNA==
X-Google-Smtp-Source: 
 AGRyM1vgcsyvvcmNMfLbBFPkQGHG0IhCZO/DvrpwiLLVrgdcvO0O1iIG2txvf4O7Nxn1vjRr9eRxCA==
X-Received: by 2002:ae9:f311:0:b0:6b6:30a9:1bb1 with SMTP id
 p17-20020ae9f311000000b006b630a91bb1mr15738878qkg.30.1659460751312;
        Tue, 02 Aug 2022 10:19:11 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id
 e17-20020ac84151000000b00320f3e2cc9fsm8008453qtm.24.2022.08.02.10.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 10:19:10 -0700 (PDT)
Date: Tue, 2 Aug 2022 13:19:09 -0400
From: Tom Rini <trini@konsulko.com>
To: Steve Sakoman <sakoman@gmail.com>
Cc: Minjae Kim <flowergom@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell][PATCH] u-boot: fix CVE-2022-34835
Message-ID: <20220802171909.GM1146598@bill-the-cat>
References: <20220731110127.15278-1-flowergom@gmail.com>
 <20220801180433.GW1146598@bill-the-cat>
 <CAGDS+nnm--fF2wMzDDYFuHpx7qtpNEQSarcSu8VZrSn5wuYjPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAGDS+nnm--fF2wMzDDYFuHpx7qtpNEQSarcSu8VZrSn5wuYjPg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 17:19:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168800

On Tue, Aug 02, 2022 at 07:17:23AM -1000, Steve Sakoman wrote:
> On Mon, Aug 1, 2022 at 8:04 AM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Sun, Jul 31, 2022 at 01:01:27PM +0200, Minjae Kim wrote:
> >
> > > i2c: fix stack buffer overflow vulnerability in i2c md command
> > >
> > > CVE: CVE-2022-34835
> > >
> > > Signed-off-by:Minjae Kim <flowergom@gmail.com>
> >
> > Reviewed-by: Tom Rini <trini@konsulko.com>
> 
> Hi Tom,
> 
> Thanks for reviewing.
> 
> Did you build test this? I'm getting do_patch errors on both local and
> autobuilder builds.

Ah, no, just that it's indeed the whole of the fix for that CVE,
backported.  There are a handful of them fixed in v2022.07, fwiw.

-- 
Tom

