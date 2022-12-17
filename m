Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2E8C4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 11:28:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.5645.1671276472878737681
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 03:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ecykvc2t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id h16so4706177wrz.12
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 03:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXGyK48HSm95gJ2yonK2tNuwMldwTdyOFIaqL7mrkOQ=;
        b=Ecykvc2t9Iu4mr7kgJ4ZWal7Y9E8QpggVxT1ElGMp/5+TiP0PFlAZlh7SgPE54d4lB
         rwLNxDz2CjDDmoZmalHsBojtrCXBfsH670ZBL2Yhhd0TUxn/hfVX4VOg8HRcwpMF2XOk
         9AjfCyYah/xlIJtIJ5uC5NdLhA4ABAweDhcyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXGyK48HSm95gJ2yonK2tNuwMldwTdyOFIaqL7mrkOQ=;
        b=yo65aEvO0CA4Xk2DttYIB/g3G/xcE+iaE70xy5rbwprq9zbRW7VFRahajjROxcSAM+
         Pi68WKeadDgZHNRrIlX5jhzQFiTbi+EcODB6Lbbru2mnhss0cQn9yo8kXmYTcv7MGOdZ
         +7qWILgIZf7+ygRZjkGefLtJvcSKwPVYVIt9P7PEKbMQXJiLjjV1QH3KlGWiTFtCAIsk
         OvDs+HZxa1wVbQJveMolbk4LVgp/veIoxu3QdS1pddakEcczeOR3VQ1GmmSJSac3gZ3t
         ZB4t0LDpZ/bKLzXHy7F94E6FP65yxm3pNrmKJrpupkmuifs36+e4vyivETYtPnmgmfUW
         i5VA==
X-Gm-Message-State: ANoB5pktQ2pgKROmGwn4D7Jo4/elEBPfl0N1vXGXXJ1h/3H5ExspcBJG
	hmMOOqbj3PJo+h/1SDpoBl3p4g==
X-Google-Smtp-Source: AA0mqf5DquDhkzSf3cgYzECxmdGb+OaiStByRig4Vts+55mTzUfxMD0FVFqbtaSf87rN8u2W6kKWyg==
X-Received: by 2002:adf:eb4f:0:b0:251:d76:94d1 with SMTP id u15-20020adfeb4f000000b002510d7694d1mr13578082wrn.54.1671276471309;
        Sat, 17 Dec 2022 03:27:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6? ([2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6])
        by smtp.gmail.com with ESMTPSA id ck5-20020a5d5e85000000b00257795ffcc8sm4721160wrb.73.2022.12.17.03.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 03:27:51 -0800 (PST)
Message-ID: <67a981b00c4913627f6f6f30f79a58ff4b7dcaac.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kmod: enable openssl support by default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 17 Dec 2022 11:27:50 +0000
In-Reply-To: <20221125150721.1702791-1-mikko.rapeli@linaro.org>
References: <20221125150721.1702791-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 11:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174775

On Fri, 2022-11-25 at 17:07 +0200, Mikko Rapeli wrote:
> linux-yocto kernel adds openssl-native dependency by default even
> when module signing is still optional. kmod should enable
> openssl support too. This helps see details of signed kernel
> modules and debug issues with module signing. For small systems
> this can still be disabled.

This seems like an easy enough change at first glance, my concern is
dependency chain creep. openssl is slower to build and for example may
depend on perl-native so adding this here can cause builds to slow down
quite a bit more than you'd expect.

I've been holding off merging until I could look at the dependency
chain and see how much difference it actually makes. I've not managed
that yet though.

One option may be to add a "signed-kernel-modules" level distro feature
or perhaps a distro include file, since I suspect this functionality is
going to need other changes to enable and work properly?

Cheers,

Richard

