Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.197.1627502406401972517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 13:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b9n4U6eS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id c16so3937547wrp.13
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 13:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=h13yyM7sey7A+b//sD+YBt4CkjMklVUjWIINBgz3+f8=;
        b=b9n4U6eSJjofNL3w8x8+6zuuKdCnTwiVPpHS43UiDsgb3XCD5c9exy/VPav5td5dpH
         0Ml/gBROGtCefYvqx+zWx2Q/+QLRxjf8ZiCpDN6s96KayWLHFvy/Kt0YNxQpYvDaFJ9c
         WyZxi/tSUn0OZDj6SbV6qimnonYhSfJyZHhaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=h13yyM7sey7A+b//sD+YBt4CkjMklVUjWIINBgz3+f8=;
        b=heqajyovuEaDKsY1EOvWT2Yg238N4yrHomMSUHdl0QEmmVbaM1OuZqxIN0zmpk1Fdc
         zHT36SOncxxcn2YcaSi9uF18NILeYytmhDasTg60d5CcYb/PNcSefSmB5Z884u37j27O
         /HuM67fq+KwIMIpy1cjmqa5OJlxhePg4QcYdiq0B1nLjeSonD4OXCliCUtwIKeE4qzBJ
         vGflmcFP1sI2F8kHEy2R553OGRsCOCuWraVruh//goKcgmuuSBhbs3cxUZuugHBqiXWc
         DzrTHOtZvh2Qx/GLkF00Om1fLlyaOmQ4ISoWTNL+yRwRYtWSwgDWsUWBzPa8I8Zt49DD
         FQJw==
X-Gm-Message-State: AOAM532KB2W/0hbW9lN3TWG26PH6Py4uc/puiLXp0KMvZaedZRIUypFN
	1JvoQys6eI/Bh4QdLLOS1OQXgQ==
X-Google-Smtp-Source: ABdhPJzNBcVrqg6fDo1pu4dx1Vkr0/ApFxFm/2xZ6R5z/dBgI9cSSyJpQciCJGykp/fxk2ms/6MuiA==
X-Received: by 2002:a5d:6d89:: with SMTP id l9mr964334wrs.371.1627502404885;
        Wed, 28 Jul 2021 13:00:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:824:a750:d1fb:a5cc? ([2001:8b0:aba:5f3c:824:a750:d1fb:a5cc])
        by smtp.gmail.com with ESMTPSA id z17sm843239wrt.47.2021.07.28.13.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 13:00:04 -0700 (PDT)
Message-ID: <393c82382db7b88aec671e6f4d0c080ebbdef665.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] meta: Manual override fixes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jul 2021 21:00:02 +0100
In-Reply-To: <CAJ86T=UNcf=Tzj4hq2uwXJzmtio71YZExLsr6zqOZr-ZAq9trQ@mail.gmail.com>
References: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
	 <20210728141506.3287158-3-richard.purdie@linuxfoundation.org>
	 <CAJ86T=UNcf=Tzj4hq2uwXJzmtio71YZExLsr6zqOZr-ZAq9trQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-28 at 12:32 -0700, Andre McCurdy wrote:
> On Wed, Jul 28, 2021 at 7:15 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > The automated conversion of OE-Core to use the new override sytax isn't
> > perfect. This patches some mis-converted lines and some lines which were missed
> > by the automation.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > @@ -86,7 +86,7 @@ python systemd_populate_packages() {
> >          bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
> > 
> >          paths_escaped = ' '.join(shlex.quote(s) for s in d.getVar('SYSTEMD_SERVICE:' + pkg).split())
> > -        d.setVar('SYSTEMD_SERVICE:ESCAPED_' + pkg, paths_escaped)
> > +        d.setVar('SYSTEMD_SERVICE_ESCAPED:' + pkg, paths_escaped)
> 
> This is manually fixing the misconversion of _ESCAPED to :ESCAPED,
> right? If so then does it mean a bug in the automatic conversion
> script since overrides can't be uppercase?

There are several bugs in the script, yes. The question is how far to go 
in trying to address them and this wasn't a common issue.

Cheers,

Richard

