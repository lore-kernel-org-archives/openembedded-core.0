Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.7582.1608377203951106302
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 03:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C3zjWsSU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id q18so5817591wrn.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 03:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7VvTIOANO4Klrqqvvf7WEVccUzns6lLgwetP8hc52pY=;
        b=C3zjWsSUNWUb21/mkuc0uipL+NSVERubscodqBi3ZgcGdt2DVmOtbk5X9HViaurihb
         FutNK/DMKWib372nb0gJ0tTrQi+Yvos4exknP96hvZc4HJj2KZdLAsaaVttx+vfxXtTq
         sC28t9/X3YVgETOPJl0MWaZZ0J8PTi3pXsEe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7VvTIOANO4Klrqqvvf7WEVccUzns6lLgwetP8hc52pY=;
        b=lQWitCckIZn1rFH3CjZTsgRsbAJJhj26XX6U51wfk06zsChQz07PDINeSNifvXxLXj
         phKcIqWhDDGxUCGNEHcY68cxRrHqfeF5JCBBdes11BIaTO8rG3lwhxuOdLPvfkmnKhz4
         4FqxA+ICOL8jbo990/MDyiskBhNHPS6rBRatOlEFGxC/iLcdj6gFXevfSTHNIqy2n4ZK
         w+mh20Z7Z/LZ7J817acZzNxVHr99EYNrftWYNaEuDlA4tSs7Vb0LaqW9MxXbI3OcD5qC
         4+JeNNr7PIdvBVjxGYJA7K3j9jAefe9x947F0t4EhbceNqvJwBB+jHQrLUZLtagxYIHn
         v7VA==
X-Gm-Message-State: AOAM532K0+IlGdkWoD7IGROr/YwYjHCJzMQEdT/ANPWgS5n9diILUl4Q
	60h4IHwpYBs3Evfz8upIezl2yw==
X-Google-Smtp-Source: ABdhPJwrTORDq/tdK6n4fc5NtzppS5Xp6qFC4Sj7L9GhNThB0bPh9vtulhZsw1UfqL1CTyevam/dAQ==
X-Received: by 2002:adf:e688:: with SMTP id r8mr8931617wrm.20.1608377202353;
        Sat, 19 Dec 2020 03:26:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id j9sm17857184wrm.14.2020.12.19.03.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 03:26:41 -0800 (PST)
Message-ID: <b73183a95db599853ce42b84702c694748af5310.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/qa: handle the 'no specific instruction set' ELF e_machine value
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2020 11:26:41 +0000
In-Reply-To: <20201218144335.1189805-1-ross.burton@arm.com>
References: <20201218144335.1189805-1-ross.burton@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-12-18 at 14:43 +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oe/qa.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> index ea831b930a..e8a854a302 100644
> --- a/meta/lib/oe/qa.py
> +++ b/meta/lib/oe/qa.py
> @@ -156,6 +156,7 @@ def elf_machine_to_string(machine):
>      """
>      try:
>          return {
> +            0x00: "Unset",
>              0x02: "SPARC",
>              0x03: "x86",
>              0x08: "MIPS",


This breaks the selftests that lib/oe/qa.py has. I'll fix it up.

Cheers,

Richard

