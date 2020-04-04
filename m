Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.8206.1586040355397159868
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 15:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QagfacBD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id p10so12957135wrt.6
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=hzmco7gNaN6uyM5ENXS/5MU8baLSMAMgMwPMKaP3zM4=;
        b=QagfacBDiny6hdVMtPB0Bzk6xUBMJo1toboK3zZjExBkyd83avQo4bKF7UQ51KbeFg
         t4bhU72ODODx6Xf8qhCg+aoIQnT0rpltRU3qLfMN+iTpsozhmG+saT19j+pElrwmIzxj
         vHORnLMCLz2d0TUDoslvpsrBlJI1/8f8vbCJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hzmco7gNaN6uyM5ENXS/5MU8baLSMAMgMwPMKaP3zM4=;
        b=Tjbhf9LlCXr125LB/PxkZN/hP1AHpK2cFJosWzddy3UW7mW7jd+s3IV76v0+9Ph4b7
         CdsCqIrut+q2O7kAb+8auIRBEo9FTadjKkk5C6hxq89hszpoLFOOoorvHrjvCLv2uDD6
         THBtc6c29TLITFmSsknSGYxi+iMUpkjdVP+55KSzlwcSXeQFHx1XqRRc84IGmZzYwJNj
         9cXorU7R73QVnvbh7DH8OmGSonvDvaYaFKPGp5euqsfPswSVltQjk1c8OjiJqS/vzbID
         gOFpNxIVoLqWapdyMcWq/c4cgdQ0pTxMgHd5N+ZgOGbfJVdqhJdOcO8EWi41qjQLLZul
         4fFw==
X-Gm-Message-State: AGi0PuZ/GncEYAnRNdtkxTYm1fl9M/Lh6oq5DkP0iQkaWBgkv1wPmibp
	KOlfVa1wBFnqG2XdHo2R94QwGQ==
X-Google-Smtp-Source: APiQypKU7rrrWbiS76pd1OnSSDXq/9XKxiv7aLBB6/WoXmesleepOxQyb6tB5s/cW7QdvaufpHX4MA==
X-Received: by 2002:a5d:544f:: with SMTP id w15mr11711456wrv.62.1586040353758;
        Sat, 04 Apr 2020 15:45:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 127sm18341008wmd.38.2020.04.04.15.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:45:53 -0700 (PDT)
Message-ID: <dd4a9f62d5ed17c83fec6cdc8edb3b46453ad646.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: Force seccomp to return success when in fact doing nothing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>, Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Sat, 04 Apr 2020 23:45:51 +0100
In-Reply-To: <20200404171329.3398164c@seebsdell>
References: <20200403215938.175657-1-richard.purdie@linuxfoundation.org>
	 <CAJ86T=XabPQEn6xFeCwU9MLTPx50N86o6-HAyAAgu1r6UYWwCQ@mail.gmail.com>
	 <df6f9b54bb244e0f3e893f0db330649eb6bdfbcb.camel@linuxfoundation.org>
	 <CAJ86T=WehmnH33uDH0ZUHqAoRZaSpM_t5QCE2_p3a4obKF1ajg@mail.gmail.com>
	 <20200404171329.3398164c@seebsdell>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-04 at 17:13 -0500, Seebs wrote:
> On Sat, 4 Apr 2020 14:32:03 -0700
> "Andre McCurdy" <armccurdy@gmail.com> wrote:
> 
> > Also, since prctl() is Linux specific, it looks like this patch
> > will
> > make pseudo Linux specific. Is that OK? If so maybe worth making an
> > official statement that OE is only supported for Linux hosts?
> 
> We have existing hooks for making things like this be in a
> Linux-specific port directory. I don't think the Darwin port still
> works; people asked me about it a lot, so I made it work and never
> heard about it again. :)

Darwin disabled LD preloads as they were too much of a security risk,
thereby making pseudo 'problematic' on darwin as I understand it :(

At Peter mentions, we should really have prctl in the Linux specific
ports directory.

Cheers,

Richard

