Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.24867.1612129814735012653
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 13:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PkJhtxBC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id 7so14563474wrz.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 13:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=KcKpiqesNkJ5G2NkYR7BlA9wXadMhcxqu/J3bJYjUJ4=;
        b=PkJhtxBCrlo8eD+nLJD8XU+NcFHQDjBiIXlHmUJlIOsRN6LRA+sBfcnTXmV5st/baH
         oBZUjnhG2Wbm1jbF2kJR23hcFhLfyVynL/KA/cKO2fr+JyulWX7+an4QwF0xoBay3zhM
         k2nTwD45PrK/hbN9ekhIRX4afmDeu3wHys8A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KcKpiqesNkJ5G2NkYR7BlA9wXadMhcxqu/J3bJYjUJ4=;
        b=efYuYrPQqGRSjgCObuisLrOWiEPR2b9YLqZEezNab7urrWPYMfwAIHTT2FxYDEssE+
         M/zv8VKAdLAdbaCvQlt8USujq5cmL19qdC/Hi97yPf8KuYtdJ5Idqlntk5lledjA/QFM
         OjMnFsKfWQ83PoRGcjzqnpnz7Pu3K+ulf3pZlpOzGO+4t0+5g3roAS/qldeiSH3l+Dk7
         eUwIA99WystiNPzTCosmVisprkyc6vKpWumZ4vWl2F0U/zAZexaG9TVAFs8cdFNcBwgn
         wUfmaCzYUnCv6DyLIDCZ0A+jnZoPTi7bBFHwMQGi5P/duQ3ns4XVObyZFpbEvBmebvNz
         c4Kg==
X-Gm-Message-State: AOAM530Qaly957fqZBtaWx3bEJdnU2KXx1ksE44MalYKYdPdCOlzYtRd
	LB2AqR2mTvFatfPv3TbCQ3cvnQ==
X-Google-Smtp-Source: ABdhPJyE20qAt5cQvaEQ2D/puhujJ91yCeDjXl007taaLSF5dGYsPuAHBaMcrP1I/Oolx+cVhq9S8w==
X-Received: by 2002:adf:f743:: with SMTP id z3mr15252865wrp.165.1612129813207;
        Sun, 31 Jan 2021 13:50:13 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ffbf:3082:adb4:3ffa? ([2001:8b0:aba:5f3c:ffbf:3082:adb4:3ffa])
        by smtp.gmail.com with ESMTPSA id z1sm19249001wrp.62.2021.01.31.13.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 13:50:12 -0800 (PST)
Message-ID: <1559e89a094f9f6eaa3bfa9b01f6126a36e1d0d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] sanity.bbclass: check if PSEUDO_IGNORE_PATHS and paths under pseudo control overlap
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Dorinda <dorindabassey@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 31 Jan 2021 21:50:11 +0000
In-Reply-To: <20210131192649.30005-1-dorindabassey@gmail.com>
References: <20210131192649.30005-1-dorindabassey@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-01-31 at 14:26 -0500, Dorinda wrote:
> 
> +    # Check if PSEUDO_IGNORE_PATHS and and paths under pseudo control overlap
> +    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
> +    pseudo_control_dir = "${D},${PKGD},${PKGDEST},${IMAGEROOTFS},${SDK_OUTPUT}"
> +    pseudocontroldir = d.getVar('pseudo_control_dir', expand=True).split(",")

I'm not sure that would actually work without a setVar as
pseudo_control_dir isn't a variable.

What you probably want is:

pseudocontroldir = d.expand(pseudo_control_dir, expand=True).split(",")


How did you test this? Did you try setting S = "${WORKDIR}/pack" in a
recipe to ensure it correctly detects the issue?


> +    for i in pseudoignorepaths:
> +        for j in pseudocontroldir:
> +            if i and j:
> +                if j.startswith(i):
> +                    status.addresult("a path included in PSEUDO_IGNORE_PATHS " + str(i) + " and the path " + str(j) + " are overlapping each other, please set this path " + str(j) + " to point to a different directory. \n")

How about improving this to:

'''
A path in PSEUDO_IGNORE_PATHS " + str(i) + " and the path " + str(j) +
" overlap and this will break pseudo permission and ownership tracking.
Please set the path " + str(j) + " to a different directory which does
not overlap with pseudo controlled directories. 
'''

Cheers,

Richard



