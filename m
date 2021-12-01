Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195C9C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 23:11:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.1043.1638400294828970994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 15:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QwN9K0k0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso968498wml.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 15:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=E1A5WuOQYk7sSEUnVgAOAyQV+tErmes3oJWlRcDsgBw=;
        b=QwN9K0k05jffl+SEEM+M/Vu88AHCX6DktOurq2b3eWlOTTGCEdgxLPvQoKse/JBFpw
         Rfo9hjREHG1EYfCP3jB4iRnBw+E4z3pF2+EJqBzR8qvn8PZk7qAlgpgXCQVjnGYe/O6x
         uXSwzfCivFJnnISuYFednMqFloo2K7KnNmssU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=E1A5WuOQYk7sSEUnVgAOAyQV+tErmes3oJWlRcDsgBw=;
        b=j+WWLT199gsDsXzNFRRSWJ/QEqZgkTnAhH69RXR9E++9aAPO/7MMJlh20JddhD1H0u
         v8bOXx1HFrCP4rjQz2Ucixrh8I7uSYlvrBe92dDWzRkXl5JntXSlsXpfMYstA5K01wGP
         eQuyl4TQaxy8e+xNMjReQHUdB1Y1avE769LoupsIujGpuxUNboUkFU6Nq4XRpReZiupw
         mS/nKkwBFIwPAigCzhVRkDAx9Btef7Gcn0h8pTxkCxiXOc3S4iOvSwG5IqZ0xqIslkfF
         IRe70TqG9SWMYD2O8Kkv7Yx0ritI5Ca8kgCSwSFe9Ngk4bamvIF+kuWtnbfGILqs9XHk
         I81Q==
X-Gm-Message-State: AOAM531/LmPlRU2FLU0hCOC9WmpckchVFgdliep/vhmjVtAnWKlRv14K
	yst9F2Ud0JVIBdUgdWRs/mdHrw==
X-Google-Smtp-Source: 
 ABdhPJzO0e77Lfk/OlMuuRO7jqO8jlMs+C1x2bDfDNMYP3HTdoyUnqwR/OPStp84xfqONtzcoJaLZA==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr1464135wmf.185.1638400293139;
        Wed, 01 Dec 2021 15:11:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51?
 ([2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51])
        by smtp.gmail.com with ESMTPSA id
 a1sm1274948wri.89.2021.12.01.15.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 15:11:32 -0800 (PST)
Message-ID: 
 <89904fc65013c82975f32d0ffa6c4761019590e0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH v2 1/2] bitbake.conf: Pad rpath and remove
 build ID in native binaries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Dec 2021 23:11:31 +0000
In-Reply-To: <20211130223722.852434-2-jacob.kroon@gmail.com>
References: <20211130223722.852434-1-jacob.kroon@gmail.com>
	 <20211130223722.852434-2-jacob.kroon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 23:11:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159067

On Tue, 2021-11-30 at 23:37 +0100, Jacob Kroon wrote:
> Try to make sure that the RUNTIME dynamic entry size is the same for all
> binaries produced with the native compiler. This is necessary in order to
> produce identical binaries when using differently sized buildpaths. I've
> tried using only patchelf, and keeping the linker flags as they are, but
> I am unable to produce identical binaries. Has anyone else managed to do
> this with patchelf ? If not, maybe we can write a new tool that can handle it ?
> 
> The build-id also needs to be removed since it is calculated based on
> the data present at link time. This includes STAGING_LIBDIR_NATIVE
> and STAGING_BASE_LIBDIR_NATIVE. Both will differ and they need to be temporarily
> preserved since some recipes will execute the binaries during do_install()
> (for example python3-native). Later on these are removed in chrpath.bbclass.
> 
> This hack is the first step for producing identical native binaries when using
> different build paths. 'zstd-native' is a working example.
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/classes/chrpath.bbclass | 3 +++
>  meta/conf/bitbake.conf       | 5 ++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)

I'm a little torn on this. Our other option would be to hardcoded a specific
dummy path and then edit it later to the correct value. That may be neater than
adding the padding. It will change the end binaries but hopefully only after
they're installed so should give the same net end result more neatly?

If we separate out the build-id patch we could hopefully get that piece merged
as that shouldn't be controversial? 

Cheers,

Richard


