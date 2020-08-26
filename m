Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.10695.1598442523313282760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 04:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OSMQfviO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id c15so1473475wrs.11
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 04:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=URIdPjqaUl3SJ8ucqylRtdOYwhLXzPgfEHUpTfxGt3Y=;
        b=OSMQfviObl75wPWLf4DnoGHGF3oTX+n+dS1EAOR/mB4uSIRyNlX30QGDDXDdIdUo8C
         ukW/TLdmhODu8hvfIH48OoX7+XaWNYNJ7bL/4aNj9XqwdCRuegp0YCL6Gdmy8P7iOpk7
         lID+oV+CtqefQix2wNCF77dw6zINODNnwB7us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=URIdPjqaUl3SJ8ucqylRtdOYwhLXzPgfEHUpTfxGt3Y=;
        b=JolCHjSNNRSQQzVBCCG0y1p+Y2FP6MPq5tOnOsDzYlU5MnaBa+mN0K9PuEgfx80sD9
         f2YEkwBrfJsRtIoGNacBbpQojulVmgj7ISANxp4inJHXZqWt1b2UNvQZWfMlZngLmRNh
         9wpXdJGje0MhxGwgOn1erq1Uxsn1IrdmdQm7RTJYnHJm3cbJQVaHsSZzX2oOowqRPXOK
         Rz5HVbzyTT0vpmQWNr3WZiEuphLZDCMLufWotUuIItw8W4Pd0yjYPjgfO2xzSbteREnv
         dR06hg6s82JRhzuwxzc39KNy46uP17I+LtmBlXXTAiDLEJ15XI9OSEqyMM4apsR9WjO+
         aNWA==
X-Gm-Message-State: AOAM530xW782NdyWuyKVwGAOXZ9ewOZ3eHhg+rocshnQNuLj599vXRYU
	a/1f6tBogwTu6s3TOCUPgc1fY09XgkUD49rk
X-Google-Smtp-Source: ABdhPJzlPF9Uu5IqW69hXUeTqOXEkoqz4kK08CnY+QJ/mknMkRDw5gdh/Au8jeH0Rz/RyYqPMQGRfg==
X-Received: by 2002:a5d:570d:: with SMTP id a13mr15012619wrv.111.1598442521777;
        Wed, 26 Aug 2020 04:48:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id p11sm5922726wrw.23.2020.08.26.04.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 04:48:41 -0700 (PDT)
Message-ID: <f5e8f15912143ac89e3361f63cb504a290d427c6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH v2 0/6] Allow PR Service and hash equiv togther
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2020 12:48:40 +0100
In-Reply-To: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>
References: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-26 at 06:27 -0500, Mark Hatle wrote:
> v2:
> 
> Most comments have been addressed to create a v2 version.  I've refactored
> the commits to make a few things more clear, basically moving code around
> and fixing minor issues BEFORE the big patch.
> 
> Before there were two patches that together implemented the PR Serv/Hash
> work.  This has been combined into a single patch and the oe_nohash stuff
> has simply been removed as no longer applicable.
> 
> The only comment that was NOT addressed in this was the suggestion to
> sed the pkgdata files in do_packagedata.  I'm hesitent to do this as
> sed with ${...} in them has proven to be fragile for me in the past.  If
> we decide that is necessary, I'd suggest we start with this set and then
> make that change after this proves to work (or not).

Sorry to keep on about this but I am worried about code readability and
trying not to let the code get too unreadable (we have to try).

Your shell expansion issue is a very valid concern. How about setting
the variables we expand late to "@XXXX@" and then using that as the
expression to sed later?

I'm also wondering if we should just inject the @XXXX@ change (instead
of the delVar) into d directly at the start of do_package itself, where
the existing     bb.build.exec_func("package_get_auto_pr", d) call is?

That would then remove all the confusing localdata changes?

Cheers,

Richard

