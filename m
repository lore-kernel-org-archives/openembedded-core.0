Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.17808.1611089566266943551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 12:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=icOoLQ8p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id j18so1003102wmi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 12:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=fHr4yXOYWb3eU2a0DEzoTka9Jut1ZRq4m7u2Eq+Sd/I=;
        b=icOoLQ8puWR39UaWO4VJqyaj0x8vH6sT/03M72vkU0jJR0D4GzibW+jOKaSy6jA2qY
         QIgIYEb0upVBNRwHuKc6wvxPTs9sV6mFZkXRHvO0SY1QhzUNWA0qoz+US3eLgp8tOW6h
         BTdDIp9m/SXVERi724nd0+RB1pyrC1E7b3oxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fHr4yXOYWb3eU2a0DEzoTka9Jut1ZRq4m7u2Eq+Sd/I=;
        b=Q522Wy2pr08dN8iYDU7llsaVWya/Dv5IQRhM81vINGL+ML9TEU9fg5n5Ha50vEX9d6
         08Rf8h1BTZaDkNfOwTxbTLb6ZflPphTXW2HWTvpS3qPBTkEZOOLuN453zqk1W+GZjzuK
         CTBJlI1qIpvRFr5CC5xrQodL6DF6BiSFeBQcZn6ytLgdVrhFY221TEhg9ZzcmD+gGygC
         3KZ3a5tBhxyrvciRm6A4GYiTbQqsio1TTVYbXmlSF0g1xD4IFgH0AEdyQgjsDadzu6wQ
         GnbYrurBrBjWXTVSa8KvUBn0RhnekhWjXYL6x/YuzCw0nC0i2Iq8M6WHdnViGlX3vgGh
         2pAg==
X-Gm-Message-State: AOAM531x0n4FSuc6iv9m5oeyUPqrn7dIP55yS3nZRUAUOfe3yruXoy4Q
	i9xU3toTlzS73VKJpXk94Fna5A==
X-Google-Smtp-Source: ABdhPJz5iAv9VMclJ1cNjs0CV9ovY1sbo7UXJi7YRy5QhZrZOz2q6iKemsblIyjEaybhdDV+cMePFg==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr1232572wmj.182.1611089564733;
        Tue, 19 Jan 2021 12:52:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id j9sm38001267wrm.14.2021.01.19.12.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 12:52:44 -0800 (PST)
Message-ID: <066f346a8d1c643650bf814cc3c18c363b820d5f.camel@linuxfoundation.org>
Subject: Re: [PATCH v4] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2021 20:52:41 +0000
In-Reply-To: <20201210184632.3448265-1-luca.boccassi@gmail.com>
References: <20201123132823.3996355-1-luca.boccassi@gmail.com>
	 <20201210184632.3448265-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-12-10 at 18:46 +0000, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> In the next release util-linux will gain an (optional) build
> dependency on libcryptsetup. But libcryptsetup build-depends on
> util-linux for blkid (optional, can be disabled) and uuid (mandatory).
> Split out util-linux-uuid in a different recipe to break the cycle.
> 
> https://github.com/karelzak/util-linux/pull/898
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory work
>     underway as I'm not sure if this is the best approach or if there are
>     alternatives. Suggestions and comments very welcome. Thanks!
> v2: changed packages names to reflect old ones (eg: libuuid1 -> util-linux-libuuid)
>     and leave uuid build enable in main recipe to allow for uuidgen build to happen,
>     as it does not have its own autoconf switch. Delete the library manualy from
>     the main recipe after build instead, and add dependency.
>     Might help to break loop python3 -> util-linux -> libselinux -> python3, as it's
>     only libuuid that is needed, see https://lists.yoctoproject.org/g/yocto/message/47570
> v3: rebased and refactored to have a common util-linux.inc file
> v4: added RDEPENDS on util-linux-libuuid on various packages to fix QA warnings

This patch got a bit lost before the holidays but I've been reminded we
need to resolve it.

I think the one remaining issue here is the need to change the DEPENDS
of so many other recipes, likely not just here in this patch but in
other layers. I think if util-linux DEPENDS on util-linux-uuid that
might remove the need for those changes? That should still allow you to
break the circular dependency problem?

I suspect libuuid should really be maintained/built as a separate
software project given the dependency problems but that isn't my
decision, we just have to deal with it.

I am also worried this is going to break AUH and mean we have to
manually handle this recipe but again, I suspect there is little to be
done and we just have to deal with it.

Could you resend it with the above DEPENDS change if that will work ok,
refreshed against OE-Core since we have util-linux 2.36.1 now and then
hopefully we can resolve this.

Cheers,

Richard


