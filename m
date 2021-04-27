Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.1759.1619553606562211089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 13:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fcBU7y2W;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: petr.vorel@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id q6so12156909edr.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 13:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=5T8/ZxOqN1O2ySiOQO0HBVnNDU6GhPnFARgdOsI+RQA=;
        b=fcBU7y2WC5ZBNHWzO2Sqxx0TJ3CV/tLcP99l63YIw9o2AQ981Q20bLwQf8BMWKWseL
         8iRQrBHV5gKZhYuDlK1YfC1yF62XX7uf/Z3/+ZhR8tWhtaRTEqKdj99OGWldn5rm0JDY
         CSENLskLwetwBp4A8BVOYHMM8FZWsyfTVwgFt4jCkoWAVNwLLoayBtUOiYB9plmezDn5
         KLN3ufsVa9Zyvyzo9oBvswstAuswYqNBi3HQpkWstXFfmanoUlVt3kj0OfDgADTChrzN
         /1VCxpdU0KzErAgX4gqIIywj4QHYKJcYrnfT1h5RHsPe0MkH8fbJsqWoRHJ7qsMSNxNq
         rR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=5T8/ZxOqN1O2ySiOQO0HBVnNDU6GhPnFARgdOsI+RQA=;
        b=L/Us6O0/RdsEl9uI0iquv3zUTfqi3X8dp/AR1RA9nxEHUJs9MDIMLYniiJJRjXfjPo
         aGXbX5dnKz71rUxJSDSEs5oBvKO80iCJbSt8HkzkzOSV9oiRJg2v3/G1v/z6WvcK6XNZ
         kvZhZdhdfS796PmNCQL+ytVsPxeoxcAXPv+CtH1bEacioUkYp5Whh6R218XVlLHzXVz8
         6xrZHaUTXLlMZ4icgMF0wV8kJJx4tkKnh2ZuyzXS+fT2S6bRq9zW4ysqdXxzNDjOelIq
         fvjH4gEHg/ruiIbhwM+bQ/60FxEd9yhYePftPIfE+D1OXkd4okr3M92ZLw0Zl0gwln6q
         HP8w==
X-Gm-Message-State: AOAM531IcYmmG2ZFjTJuresOyyxPwKzvywLstcCbhzpYxKEBGqnVugui
	akd08J1qMuVAmOb9B9Q3tEI=
X-Google-Smtp-Source: ABdhPJzRpFqQ63j9kgWzF+u/9MTTxDzHRfU3vwPj3UlgascIVl1hwqJ0+4JN9tOTrYs16S+KMmJxsA==
X-Received: by 2002:a05:6402:351:: with SMTP id r17mr6555682edw.186.1619553605057;
        Tue, 27 Apr 2021 13:00:05 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id j20sm493370ejc.110.2021.04.27.13.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 13:00:04 -0700 (PDT)
Date: Tue, 27 Apr 2021 22:00:02 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] LTP drop MUSL specific patch
Message-ID: <YIhtQoUK4bY0sZ36@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <YIcMLMtsNSTlinqq@pevik>
 <CAJ86T=VDx=w4FB34BZhsGcFYO8zAJ27kE6t9d_3xbBvkpOPDfg@mail.gmail.com>
 <YIhjWj/HwYya8k1l@pevik>
 <CAJ86T=V=2F8vesD+=Ps7kyMLbivy-VHa58HK+MSMkoKtMFX_eQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=V=2F8vesD+=Ps7kyMLbivy-VHa58HK+MSMkoKtMFX_eQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andre,

...
> > One more question: how to make this function MUSL specific?
> > I noticed some functions has suffix "_libc-musl" (e.g.
> > do_install_append_libc-musl), but I guess this would not work for
> > do_patch[postfuncs], where I specify the name.

> You can either use an intermediate variable in the recipe, e.g.

>   PRUNESOURCE = ""
>   PRUNESOURCE_libc-musl = "the-real-function"
>   do_patch[postfuncs] += "${PRUNESOURCE}"

> Or you can call the script unconditionally and check if [ "${TCLIBC}"
> = "musl" ] from inside it.

Thank you!

Kind regards,
Petr
