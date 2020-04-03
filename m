Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.14271.1585929338616707651
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 08:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tSOKvCpQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id o18so5628307qko.12
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dGQGPRpjLgsA+gTlbCe8E4fIvG2KGBRn6WsOsTWd76U=;
        b=tSOKvCpQp4MHU0TkVo2/0Pa15Z+FwFJmA3QEMc5zCHpzyKjdScGROkzU3OhDvf7q8r
         W4gAl9wNYSXeBCrdJ/6GfyTzigUL+BSVklfyh3DUsdViF9hkqH/2ns4NEheL+kRmdMli
         AT/vDLlBwub/6BodWKyt/Z3GtcbUCC8H9MqVMVzZrrskXMWWJJYr5zzFCYeIvOgdEEPM
         43XwPyhukPGIYkzRLHOTCzsulz0x5R2sZpY176EDi8lTY0Bof9bAPuUdJ/cqda33YeFw
         mYS9SgI17RLw1xfVBim0lIqzcc7EFgPmNsUQZP5eRzsH40F3arqR05sTM1f1eekk2Yfq
         7cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dGQGPRpjLgsA+gTlbCe8E4fIvG2KGBRn6WsOsTWd76U=;
        b=Tr7WKrlT33YrAOj6yxqeEsL02y1WBZcTLvGRIUK/PiekwJaHZK3G6UE005ewyvnacr
         FiznOqcxj5YsSFHB2/I9x+VgisPKwVEUcVMRMWtYg49Y8ChJa8MlLxu5LXLwGkYQPh39
         xPbKE3PP2pBHSUafOAc867n2oxFm81kctZ7K3KFkGPbUqB/1Rw7hCRePU562BxUuF53c
         3QBDOapRqfhMqse7Hvh4nZ8nXAfzno26tAlDtjHEDXC9CxVKRFJR0EBE7OyQXsW6Q6Aj
         TX5ED2SMmzUYegc4dPt2bS7b8Xvrq83q+BhUEMP5lHeZgzlgqoOW0MSE/DqNJfs4uqww
         wunw==
X-Gm-Message-State: AGi0Pub+J1Cz1D/n45GmkmlXTvCjcOuen6fl3n5SW2oL3FnVJiUe3SxD
	R30xR+/JuNjLKwEJd5XGoJdAeRSGCGVY4IPGAmU=
X-Google-Smtp-Source: APiQypKmPdAq3xWA0BwGbPxLJzfbFz0ggOG+eLOv7NdOQoyZe6Rp/K/piayKJ0S9ceNBvNGOyeGDpGWAwV5U9GGx8Tw=
X-Received: by 2002:a37:bd81:: with SMTP id n123mr9483207qkf.431.1585929337370;
 Fri, 03 Apr 2020 08:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200403015350.1002891-1-raj.khem@gmail.com> <dee2e56432928c971eb0f1512f5945d6af846b89.camel@linuxfoundation.org>
In-Reply-To: <dee2e56432928c971eb0f1512f5945d6af846b89.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 3 Apr 2020 08:55:10 -0700
Message-ID: <CAMKF1srEjB5cg57jWM2dVfESrf17M2diBB_5P4Ws3bgZgmhgig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: Add knobs to generate a subset of ICU data
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Wouter Meek <w.meek@metrological.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 3, 2020 at 8:26 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-04-02 at 18:53 -0700, Khem Raj wrote:
> > Recent versions of ICU (64+) provides a tool for configuring ICU
> > locale data file with finer granularity [1]
> >
> > Default generated size for libicudata.so.66.1 is ~27M, which is quite
> > large for embedded systems and all of them may not even need all
> > locale
> > data.
> >
> > This patch calls the icudata buildtool during configure on the
> > icudata
> > and utilizes a filter called 'filter.json` ( empty by default) to
> > create the data, default behavior should remain same but someone can
> > add a filter.json in own layer to configure this data, e.g.
>
> Nice idea, fails on ppc:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/411
>

yeah looking into it. Are there any other arch failures ?

> Cheers,
>
> Richard
>
