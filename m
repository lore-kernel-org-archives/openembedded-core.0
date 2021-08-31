Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.5158.1630415019855352523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 06:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tmso/+i/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id u16so27600372wrn.5
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 06:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Fz9U8nVzx2vjbN7LT7eRoysZ8GsqW8jvRFffckxx7D0=;
        b=Tmso/+i/28R3afsemUd1MZ7ASDX7pYbOR4sF/fJAED1XaciMk9DjekWfp53gWPQQUF
         P9ocvdmXvZd1P4CqAE4Ts99aPScTRc5jwoqMDGNmOz7JrvVqm1ytl9Jdlg6zPH+XkvRG
         vuGoAE7/D/rPUT0ogLAjuRUZJ4mVfo43kXtsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Fz9U8nVzx2vjbN7LT7eRoysZ8GsqW8jvRFffckxx7D0=;
        b=HT44L43TOCRJP8W5hP4ONgFmblmcF4S5gds/kzyW4dDWue8JIcOrSxCwUATaBFjMhL
         frw5wehW2Y3Wrm3Sek98xQe35qkt40sx5lID0amJdr944y+Qb0bPJJbvhbSrsj441cQf
         UlEYz2tvK7eDgBicAdG+oljBlzjL5jUzKtI6Ose++sAPv+5shinwlhE88qiKBWYtRqug
         470FX1obw9cEMmj4g96xylCgpB79rMSSyEtx2Oos0HBHL/kMAdZw+55zbM7B0QyztiBi
         0Mjpg9kDACSZgLgwmSOxYeO+1MGY29/JsbCFH71Ht6DPygY5rAdAC6UViCWjEpeYIQXb
         g/zA==
X-Gm-Message-State: AOAM531ej4nXlA15zl0qVi0LDos2Wvik1aeee0u1hAIx8TL+OmdTHLYW
	0pOpBAS5GtS7vYhMKiMf3GS45w==
X-Google-Smtp-Source: ABdhPJzHnitn+zMMEooP84Gje9fNjcEC8WMxdD9/+jnYFA7MPtakCTcRfv1NeVVDi5Bn4HrX1RbpWA==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr30866312wrv.7.1630415017982;
        Tue, 31 Aug 2021 06:03:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id b12sm21302779wrx.72.2021.08.31.06.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 06:03:37 -0700 (PDT)
Message-ID: <78fde0d5a1bb9b74efd8da33a9cf8d7949df6ccd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] bitbake: fetch2: fix handling of `\` in file:// SRC_URI
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrei Gherzan <andrei@gherzan.com>, openembedded
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Aug 2021 14:03:36 +0100
In-Reply-To: <b052a428-da00-4a55-9027-65828171b1f6@www.fastmail.com>
References: <20210823135250.767173-1-andrei@gherzan.com>
	 <CAOSpxdYA6FchYLNRASehUkPcQkdHkjRJyjE6VaX0z--y6m3BWg@mail.gmail.com>
	 <d248b212e6724aac56ae6b1638e438f25d350486.camel@linuxfoundation.org>
	 <169E47906AF45A5C.6361@lists.openembedded.org>
	 <b052a428-da00-4a55-9027-65828171b1f6@www.fastmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-08-31 at 13:45 +0100, Andrei Gherzan wrote:
> Hey,
> 
> On Tue, 24 Aug 2021, at 16:25, Andrei Gherzan wrote:
> > On Tue, 24 Aug 2021, at 15:24, Richard Purdie wrote:
> > > On Tue, 2021-08-24 at 04:20 -1000, Steve Sakoman wrote:
> > > > On Mon, Aug 23, 2021 at 3:53 AM Andrei Gherzan <andrei@gherzan.com> wrote:
> > > > > 
> > > > > From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> > > > > 
> > > > > Using backslashes in file:// URIs was broken.
> > > > > Either the resolver would fail or the subsequent `cp` command.
> > > > > Try to avoid this by putting the filenames into quotes.
> > > > > 
> > > > > Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=8161
> > > > > 
> > > > > (Bitbake rev: aa857fa2e9cf3b0e43a9049b04ec4b0b3c779b11)
> > > > 
> > > > Patches for bitbake should be sent to: bitbake-devel@lists.openembedded.org
> > > > 
> > > > I tried applying this patch, but found that it caused errors on the autobuilder:
> > > > 
> > > > https://errors.yoctoproject.org/Errors/Build/129189/
> > > > 
> > > 
> > > We dropped wildcard support in master but that is still present in dunfell. That
> > > means we can't quote things as we are relying on expansion of the wildcards for
> > > some SRC_URIs. This could be difficult to fix with the compatibility constraints
> > > of an older release funfortunately :/.
> > 
> > Got it now. That's going to be painful indeed. I can't think of an easy 
> > way out of this either.
> 
> Can you guys think of a way forward with this? Or shall we just drop it and consider it unsupported?

The only idea I had was to see if wildcards were in the name and only quote it
if not. I'm not sure we ever have had backslashes working though so it has
always been unsupported until the fix in master afaict.

Cheers,

Richard

