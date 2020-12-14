Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web09.32685.1607940309793530370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 02:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q8k8JyDH;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id 91so15825777wrj.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 02:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6BWgWwoD1UCLheBtyWxwc0DBegdGKyaRfdQQ9LpbBvQ=;
        b=Q8k8JyDHuGcfEM4ACa/7U6dQ/UpBKl+TG2/nhYtQuWBL/mv4auq4WegvoMxlA8Oku9
         VL1s8inVKaAsDCZ6fUQEDr8OqlOva7ZpTOJiuaMQUnibv+P34SZms+rw0bBp//mUIixR
         x8GSx1xiP/h1l2Q4R0261FBfGs63tC9DzAiscIxlhTYBTdPW8gII8+0mttqY4Tqvqt/Y
         uA6q2QIp9cbpCazmbYr8S3nyu6pUyQujJZ1aD1Z5sSBer+1uId/MeMLuZBFm5+OmqtP0
         QrRVS/J+fzqCPkku5wZeMs2qJ2mtE8enMxBqpj60EKXL1H9L+dsFM8hCnW0tA59ISNEg
         nshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6BWgWwoD1UCLheBtyWxwc0DBegdGKyaRfdQQ9LpbBvQ=;
        b=YQ1ebGUS0Tn5xezr4iurhwgU0YKcMtLUgWd9LP1ahS1M6kJAw5L5+X1hQlG1F73i6r
         cMB0XuamCa1aiPpqhBQb6Z4VQ3n2DrqgvHkMOBMyxBfZtbOzVYnNt4C0zjOIdG9kA+2I
         IPrRm7aDciOYWz9JELEkOe40rmNVq9t6mSAcQgK5X4kdguTP4chjN1XUwMpb9PhVH0d0
         FvVEJ2k7IsMjwFTSqOVAu52RrWbDLu55VNyCtEfnhXU/xWGacllBFQ9YtriAwRb4+Upl
         QbzSZQKqWzuEdxjcawhwBJV9c02pwZyTMPnE+uMfHmHR0lgtZTxKopBaEvNkdbz/3/6T
         XRVQ==
X-Gm-Message-State: AOAM533lXAfBuPEwuCziuJEqEEDw4anWBndYe8fzicwzWoPiickN9rjL
	j6b6yb2ReV1cet08deNh4EE=
X-Google-Smtp-Source: ABdhPJzYRadJQFke4tPtu/4d4qlYvP2X3pW648bJvdtK14hcr/osjlRS7Eg5XSUQway7YJTzQ2bV8A==
X-Received: by 2002:adf:f401:: with SMTP id g1mr28090639wro.258.1607940308311;
        Mon, 14 Dec 2020 02:05:08 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id a18sm30355560wrr.20.2020.12.14.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 02:05:07 -0800 (PST)
Message-ID: <ea95fab55a1536a6cc7fec99324c2a379e7277e4.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] systemd: add RRECOMMENDS for weak dependencies, if enabled
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2020 10:05:06 +0000
In-Reply-To: <CAJ86T=XA_L6FfJoN1dcVzU2L7D6jJKeu+bUc2Jg4DrcKADiwmw@mail.gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201210125312.3302065-5-luca.boccassi@gmail.com>
	 <CAJ86T=XA_L6FfJoN1dcVzU2L7D6jJKeu+bUc2Jg4DrcKADiwmw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-12-11 at 12:55 -0800, Andre McCurdy wrote:
> On Thu, Dec 10, 2020 at 4:53 AM Luca Bocassi <luca.boccassi@gmail.com> wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > Some libraries are now dlopen'ed and skipped at runtime if
> > not available. Add them to the RRECOMMENDS list, to allow
> > users to exclude them for smaller images even if generally
> > enabled at build time.
> 
> This seems to imply that these options have some basic level of
> functionality even when the corresponding shared library isn't found
> at runtime. Is that right?

Yes - or more precisely, the options themselves are not available at
runtime without the related library, but fallback is graceful. Eg: you
don't get a QR encoded printout when generating a recovery key, just
the textual form, and a warning that libqrencode is missing.

The system is designed to allow building just once with these features
enabled, but then make the decision on whether to include the
additional library when building the image.

> If there's no functionality at all without the corresponding shared
> library then these should just be regular dependencies (and users who
> need smaller images should disable via the PACKAGECONFIG rather than
> leaving the PACKAGECONFIG enabled but then excluding the shared
> library).
> 
> Note also that PACKAGECONFIG gives a way to express recommended
> dependencies (the 5th argument).
> 
>   https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-PACKAGECONFIG

Thanks for the suggestion, will send a v2.

-- 
Kind regards,
Luca Boccassi

