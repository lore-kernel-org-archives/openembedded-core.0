Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE01C677F1
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 17:03:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.172633.1673888592078699178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 09:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GCtwbHOM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id h16so28089877wrz.12
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 09:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6VNk7D9fBnjRic1oiBCEr6fe0QMMKFKjPdohSrfx9zs=;
        b=GCtwbHOMuHw1GM1RgRlI+CKiAMDlKTobJoOB1Ce26aNGnlEA49qM7GuBpObkgNKGeg
         EHFYTYmPDTzg2KAntpReRYBUOc6Of/VeQxNLq9axmSRzYOxdZ6N4mNohIh0+J18JbhMv
         V85P36/SKBMRYYcu7MrSJHjOfImDOkLhwWsf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6VNk7D9fBnjRic1oiBCEr6fe0QMMKFKjPdohSrfx9zs=;
        b=FQUR0dOH1jrxXiFgKXSl8VCWQpPYEHzQVxZ9XMr/Uk4XNwZBIzuscDSVsjvM80TZGN
         v/TWKC26wo857qelKlwx/ayU/Sqe9eTJeDkOyJB+Z2LKrSrEyQ67uc1QL3/4daiy+Rn2
         49CcogSPPBPFkjvgk9Ep2pXONA0+cSKE2FWREwXUT8quPFiNzzGZLyptAT4gbBHaCNZN
         JeTaoNikMfb1L2kGYQXLwJ6YK3BsSQfAAqdt503GtR0vzzE12tLVaW1oZQVo99GH5w9C
         azsLmsB6180cPDr4Z6srR40xRdF9+SNRrTIP07Dj+KrCK+7sKI5q36nf3jU9n8jPl0HL
         Qlyg==
X-Gm-Message-State: AFqh2kobgg4qgKjTfxzPirWf1fxFen1bip6nxnhZ+7jczks0gkkbX2rD
	zSdLRdmgFn9uPvujhAcojIb73Q==
X-Google-Smtp-Source: AMrXdXs3mdTU6Udt0086WTvXpSBQpFajvAmgf3GT2iBe4lY1smJgNLcfKarWC8dmLMlkVikgn+/d4w==
X-Received: by 2002:adf:e647:0:b0:236:6c33:2130 with SMTP id b7-20020adfe647000000b002366c332130mr7264364wrn.68.1673888590475;
        Mon, 16 Jan 2023 09:03:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d404a000000b00275970a85f4sm26632496wrp.74.2023.01.16.09.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 09:03:10 -0800 (PST)
Message-ID: <74d632633cef4a52f0833ee6eeb1141403ecbff4.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] neard: dont pull in wpa-supplicant
 unconditionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2023 17:03:09 +0000
In-Reply-To: <838LOR.7MMYBGDJNPM51@t-online.de>
References: <20230116164325.289867-1-f_l_k@t-online.de>
	 <ca881583fdf1906bb5828607c19a11113cbd895d.camel@linuxfoundation.org>
	 <838LOR.7MMYBGDJNPM51@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 17:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176008

On Mon, 2023-01-16 at 17:49 +0100, Markus Volk wrote:

> > That isn't going to work as there is no default value for
> > WIRELESS_DAEMON ?
> >=20
>
> We have it set here
>=20
> https://git.yoctoproject.org/poky/commit/?id=3D1eaf64fbe16d2ceb472623c65c=
961b36aee33608
>=20

Sure, but the neard recipe can't see in the packagegroup-base recipe
scope?

Cheers,

Richard

