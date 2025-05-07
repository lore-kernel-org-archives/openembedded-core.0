Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F739C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 19:04:55 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.4129.1746644693280575123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 12:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HWCosQtb;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c559b3eb0bso14706285a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746644692; x=1747249492; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s/gDZ07N2lugz1n1IcOTlhou4jUdC0NDvw7BUconQn0=;
        b=HWCosQtb6wGOz30QRI+sS+WZLrY+bFw9MSiAXc1xBV80lNXyWbXjDGrc9nh5XPJVQ7
         K2krcHWKNTA9w0v1KrbZbG2ErfJIBXnSk/+hQM3qUYK9x7IgL3zC4OfDD9zqRNt6sLCm
         aca3tBQGojatVaQJm776HQ6xYNCfM1dg+LwhODIXDdcGbUJadXPUZKz2kdntRkvFZLUF
         K8fwoV1Ar4DZDBATo2mlgw6I4Eihs2pkYDmpiaFullgN1KCC8BXk3flVieX52RglNmZj
         UIohk3MdPJJSoDh7SYIYsCG4noXhdrN2NBbTuIiXJoPePc91RReSrLxa8EiIS5laxro6
         +bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746644692; x=1747249492;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/gDZ07N2lugz1n1IcOTlhou4jUdC0NDvw7BUconQn0=;
        b=pffk4CRd9xySbTm5TeOcj2L/WP6lYS+0IyTPbF5LGXgyEE33ZaWtOi7kP3v7dXnGH/
         tPkFLvPbu5LmCUlAd4abA11ve8EsUjXCqbpwL7EQMSk/i4N7gEczaC+qzWfuO4eON4RK
         Dn3uKCbdU8KlwTL7jOzl42bGgeZ7r+c9l/jVgK3TX3tZy/+KFbzO1fLDED1HeiyTlU4m
         KI56KZKah6Udf2HR/DaiZjqRcf8b+5WXkeZhSgUiwrQnvO0I1LiILxdYSE45vitHyi0O
         86SRz0+RGymWlKtsGGDpDsuEFdmGhf3esbBvzWToC2X/3nWRNzY7M8rC+tzKeQQBiylI
         pXQw==
X-Forwarded-Encrypted: i=1; AJvYcCVjAThJyUCIAt+KenAVgj9dvzMuNFjAMR6cxu378GT57JBYtRjtlx6ekd9cwyP4cE3m7QfEKrNSoiaeqMcTN/zU9g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+jlpE05WR0iBl1EBRPCFCwxd5i8w29jr8Cj8qWkJw/gG6MWg/
	o6hJJypr3gZktj0LXYY+4gudFbaZj1L5OHJrWXqVEZbH7Asm6/BR
X-Gm-Gg: ASbGncvQEbYF2XmIW/WxH5kec6WzdcArwC1nFnklPW4yhAVbcMB6K4JaYo6RLlTSz6j
	V59+agw/7eino2Du/TE/hKvOXnNZ3g9pZaR+ap+W+S7Kv5qqbgch4df5tIDI0G8v6Nj9WJS9O+R
	Dx4Ike35oVtFC+jAq33XTp/+KQ4AK09UpOXvXvO70ZEFIVZEB3Qzrms4SBieYQIYxQbAlXjA4cy
	iTDJL9tp/7qa9/ph8qQg0G893+eJn8eKR9m6gltp79oTiQ8gjouGyaXc/+tEkNOz90ttk321gDl
	gYVRW/l4cPR6KjabMa+i02Dsd6CJ5YBK3djjBOsMz05WDG5ki8Jnm+4D1IFIjSTeJ7vO
X-Google-Smtp-Source: AGHT+IEaigrkCobzllBM/IVENsoS9vjZBPgHZwHbIyFSpTWrssCdKrZWyAiI6OG7Nt/++dNLDjjvHQ==
X-Received: by 2002:a05:620a:24c7:b0:7c5:50ab:de04 with SMTP id af79cd13be357-7ccf9e3d4d2mr59991385a.32.1746644692199;
        Wed, 07 May 2025 12:04:52 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7caf751ca60sm195519185a.4.2025.05.07.12.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 12:04:51 -0700 (PDT)
Date: Wed, 7 May 2025 15:04:49 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <20250507190449.GA7882@localhost>
References: <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org>
 <aBtspIFmf7KoIZ_7@nuoska>
 <20250507182924.GA700@localhost>
 <B699294E-FA19-495C-9DFF-68AB3502240E@arm.com>
 <CAMKF1sq6ttpUeRCsSY9WbY8hixTkhaCOB61u6AB-=xVqhTVn+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1sq6ttpUeRCsSY9WbY8hixTkhaCOB61u6AB-=xVqhTVn+g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 19:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216130

On Wed 2025-05-07 @ 11:38:12 AM, Khem Raj wrote:
> On Wed, May 7, 2025 at 11:34 AM Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 7 May 2025, at 19:29, Trevor Woerner via lists.openembedded.org <twoerner=gmail.com@lists.openembedded.org> wrote:
> > >
> > > I stumbled across this build issue via a completely different route than most
> > > others, it seems, and certainly different than what you have described. I'm
> > > not using meta-security and I'm not using tpm2. Therefore your patch will do
> > > little to solve my build, and others will likely stumble across this issue by
> > > other routes as well.
> >
> > For what it’s worth, we’re seeing this without meta-security too.  This needs to be worked around in core (personally, I’d remove —fatal-warnings from systemd until openssl includes the GCS hints).
> >
> 
> thats a bigger hammer, I would suggest to apply
> LDFLAGS:append:aarch64 = " -Wl,-z,gcs-report-dynamic=none"
> in systemd recipe in core

If we want to make the hammer smaller, it's only triggered when:

	PACKAGECONFIG:append:pn-systemd = " openssl"


