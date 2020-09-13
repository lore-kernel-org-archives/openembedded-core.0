Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.35571.1599989367444219244
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 02:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OM5w4Shx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id k15so15466381wrn.10
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NVpcQHYHxIS4Q1MiuqSkepxl+PfEKraVHG1o/LaIc6o=;
        b=OM5w4Shx1lnjKLVjmZH0qeORm76Ccvrlg/uoUVL3ClKCofJTJ+butts95kBFR/0uct
         HtJ2USWEmKGj9XfIc2loqi7VdaDPw+E3SXIfq/7myiLM/yBWFd2DxtGLm+N/b6NS9FZX
         SBEINPWwxaV08JmpdsyoU6XhtuAcVHoMZhopA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NVpcQHYHxIS4Q1MiuqSkepxl+PfEKraVHG1o/LaIc6o=;
        b=Sm3rhCAmhWRL8PcNT22kaPc036vuU/7JKRJhM+52WpinDpC4HJA96pvEsBxhiXHlJj
         JHMuuj7gKbxlvrizCXKm72lcURrL4k7rjBzLzXadYMMECC+0/o8F9B8PCxxIfLZ/5NJ2
         BuYL2Bois4Mb+YGl35aXIWkya8JY33MeuvSGp3ti59Uir3ffD3E6A5ihe88idlJ20sYM
         mpPHQeK6UjcbW+qAQc5pKW+2IoCxf4YJ+t/MdtaukknUR4rKo1M7oq9P8YQhExy1IQd4
         /BdoAJMMxlfysm9uXCbbivc/L6a8VtmemdP8nCvZrlK0bQhEPcXpKrbyxPlPhKII13Bs
         FlWA==
X-Gm-Message-State: AOAM5304mRQADWvJ4wII+Vu28eU4zaRJmjaZmWykTUUv1rjI1fBdh4K1
	xK/MeWllCpAoz5G0Wxlf0QFCxw==
X-Google-Smtp-Source: ABdhPJyM5zXaUsqgI7RQ/YP53PIxP3ll61620q+VFfvaY7u1GlDec/B4uyIjWybTGygSKALvZcBNDg==
X-Received: by 2002:a5d:444e:: with SMTP id x14mr9940972wrr.235.1599989365791;
        Sun, 13 Sep 2020 02:29:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id u126sm16531148wmu.9.2020.09.13.02.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 02:29:25 -0700 (PDT)
Message-ID: <3abd8ce10108bb679cd8623df05adc104ee76a98.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] core-image-sato: qemumips use 512 mem
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.comt>, Saul Wold <Saul.Wold@windriver.com>
Date: Sun, 13 Sep 2020 10:29:23 +0100
In-Reply-To: <20200913035916.24165-1-akuster808@gmail.com>
References: <20200913035916.24165-1-akuster808@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-09-12 at 20:59 -0700, akuster wrote:
> From: Armin Kuster <akuster808@gmail.comt>
> 
> Fixes:
> 
> WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Couldn't login into
> serial console as root using blank password
> WARNING: core-image-sato-sdk-1.0-r0 do_testimage: The output:
> root
> <<< run_serial(): command timed out after 60 seconds without output
> >>>

I must admit I was sceptical but I reran my timing tests and this does
appear to significantly reduce the amount of time the serial login
takes for sato-sdk so you are probably right in claiming that.

Its a pretty bad 'advert' for systemd though :(.

> In another run, this error was seen:
> 
> Failed to reload daemon: Refusing to reload, not enough space
> available on /run/systemd. Currently, 14.3M are free, but a safety
> buffer of 16.0M is enforced.
> 
> With updates to systemd and Qemu we should revert: 499a31cf06 core-
> image-sato: don't use 512MB in qemumips

The original hard qemu hangs for qemumips were a real pain to debug so
I remain worried we're going to swap one set of problems for another :(

Cheers,

Richard

