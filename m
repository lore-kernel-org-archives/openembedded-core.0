Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web08.157.1607377772372854318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 13:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d+lErp8y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id 3so624166wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 13:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VH+qmocKuWpLY6BHenqp5c6At5Y1wtnLFwrdxTXOhFQ=;
        b=d+lErp8y1OiTbtlXKv/7Zw1Mqbpjv1QlHxt823kXuSMq5eLnKDvncX1XK41WxV6vOK
         5fvEN04LuLN+KN1GlZ2Gyou3sWTGLYumpGV0aTYxqTzlwq5/GV5Y/vHnnIisUHZUmmYD
         uOitEfktRUUEovfG135C7c0H8mlyrdnRbRg/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VH+qmocKuWpLY6BHenqp5c6At5Y1wtnLFwrdxTXOhFQ=;
        b=U+IiAbrPn65mpnOyXuJENMLgAXYaXlk7DWAbffpL6Xc9+xSlfb3ei4LjmJ1qY85HEH
         g8E0EhzpN2hyKL31ZMKo0klMnQKd79cGwHCRlq6gzYUjQmbsJUjJJyGbCGcFWKcy89Zs
         syi4wpAWOnsejMueWvmcg7yDSQ12CqwqZqTmZs60Mt35kCmVB6zifatKACzkjyv/ShTP
         7JvDm/gKdzps6jFtPO9dp0CVNa/AeDyjVcbH8FTlXVPGceRvgw7rln1MJarwrY0lenkn
         GhuJVP+V7OoKrVsYOueTbal5RStAUh2wfoeCo/X4x0vNXL5U4g2XmwXJ/Twd2WASlgpD
         NkEw==
X-Gm-Message-State: AOAM532WcZutU1mobXe8Sgq5RAcAcDuP+akpcg7nuqSFE9WipFJDjbpz
	mIwHIvGt3zKKITGF8iDhs6PMJA==
X-Google-Smtp-Source: ABdhPJwOMgOxxKbpggs3Lg8cTdJOpBYoz/AzbIPy1T6HUz3Exj13DDY3EjqlPXVHXCtBWhODzUOTQA==
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr833071wmd.91.1607377770487;
        Mon, 07 Dec 2020 13:49:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.8.c.0.f.4.1.5.6.b.7.5.c.c.0.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.8.c.0.f.4.1.5.6.b.7.5.c.c.0.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c0cc:57b6:514f:c89])
        by smtp.gmail.com with ESMTPSA id l8sm674293wmf.35.2020.12.07.13.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 13:49:30 -0800 (PST)
Message-ID: <bb38bb9111dbc5e0a2c3c47256d2bead31b70316.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] iproute2: install tools to mirror install under Debian/Ubuntu
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alan Perry <alanp@snowmoose.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 07 Dec 2020 21:49:29 +0000
In-Reply-To: <20201205082246.14954-1-alanp@snowmoose.com>
References: <20201205082246.14954-1-alanp@snowmoose.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-05 at 08:22 +0000, Alan Perry wrote:
> Many scripts exist that expect the iproute2 tools to be found in
> the same directories where they are found in Debian or Ubuntu.
> For the iproute2 tools included in the iproute2 recipe, move
> them to those directories or create links there.. Also, add
> bash-completion files as is done by Debian and Ubuntu.
> 
> Signed-off-by: Alan Perry <alanp@snowmoose.com>
> ---
>  .../iproute2/iproute2.inc                     | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)

The direction in the patch is worrying me a little.

There is a bash-completion class which splits completion files into
their own package, most "embedded" users don't want them in the main
packages. This patch does something different to what has been done
elsewhere.

Secondly, I'm also not sure that just because debian does something we
should therefore do it, I'm not convinced that scripts should be
hardcoding path assumptions about these tools. IF this is such a
universal need, why doesn't upstream change the default installation
locations? Has it been discussed?

I'd expect there to be opinions on this topic but I'm not seeing much
discussion. I suspect if if does merge there would be push back later
though.

Also, the duplication between bin and sbin for ip is not particularly
good practise.

Cheers,

Richard

