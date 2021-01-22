Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.5917.1611302113619989439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 23:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MuguAJ8H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id s24so6217522wmj.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 23:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JV6EVju7NwArcAHPFykAc9LcsJR5N3YEFVWy2TCiz44=;
        b=MuguAJ8Hv/tzr3VdDB0uQgjOTRaOE6SqO9zmBQ2+rcVdJxZ8SADkKTayrTpWYV3OX4
         wxFD7xGUES5b9ImlSc+RnYeehEhsTtpSszRjZ61p46ghpG7Nv5QnNIuwxndtJxtD2C+M
         UKVVIIlAyd9j2fEeJ0a0G8S1gdkLxoiIa0OJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JV6EVju7NwArcAHPFykAc9LcsJR5N3YEFVWy2TCiz44=;
        b=Ty0T7zScM8Wdbsq8jHSaM8Q9xBGs1gi90ZLg8V8s3737l0SjzpTcpsS7Fpaptw6s4s
         fhWWvm/e96lqIl2M7YFF70BKXOyRxUe/Bk/dWiONbtylZX7Fs54vZBY/McIpJ16UN1Sw
         P03BeOaLswnFT4vEJF77Q3MshJFCTLcHZ3UkpyisUphbZ0nDLRZbFO9oICXamuxVWFZH
         3XFzbG6zNL/gEQnDrsOIg5RofXuMSwr0cpdHGjm53Ckzh3lpgoMCgHwEPNPw6W8RKo/b
         c+eUIs72MHZvRNZDg5J2+1sK52v5d5FxVeZIgAVqjAs40Te2pWT/dsUQqY06UFjMv8w+
         yeZw==
X-Gm-Message-State: AOAM530BAuB9RsZjH3p+JCni4EdUTcxTZwPMSkeDXQ+dHHWnviFgJE2d
	dBjqu9TUbGezDIHpjTupmliVtQ==
X-Google-Smtp-Source: ABdhPJxNIsnd1omk6v2ONRB8fUDpMT9TYF00T1XmdNNqp5zwFFVq1XaIkZNRuGvrP2PVXR5PIYxNKQ==
X-Received: by 2002:a1c:6109:: with SMTP id v9mr2708515wmb.144.1611302112106;
        Thu, 21 Jan 2021 23:55:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78? ([2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78])
        by smtp.gmail.com with ESMTPSA id a25sm9972603wmb.25.2021.01.21.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 23:55:11 -0800 (PST)
Message-ID: <ca24a1e3892d838054450245f2f8c7714eafbb37.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] gobject-introspection: reserve less memory for qemu
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2021 07:55:08 +0000
In-Reply-To: <20210122044426.19719-1-Qi.Chen@windriver.com>
References: <20210122044426.19719-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-22 at 12:44 +0800, Chen Qi wrote:
> By default, qemu reserves 4G virtual address. It's too large.
> We've met error due to lack of memory even on a 32G build machine.
> 
> So change it to 512M to mitigate this problem.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../gobject-introspection/gobject-introspection_1.66.1.bb        | 1 +
>  1 file changed, 1 insertion(+)

Are you sure its out of memory?

Its only taking virtual addresses, it shouldn't actually be allocating
it all.

We did notice that on some of our autobuilder workers we had to change
mmap_min_addr setting being too 65536 which solved out "out of memory"
issues.

Cheers,

Richard

