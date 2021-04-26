Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.9.1619472575029171855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 14:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OwzSr5Bt;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id n21so10372148eji.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=c+M/zrtvytdJjJczvnyXdlF+pj8l1eGgbvdMLTmUVws=;
        b=OwzSr5Btcs8wzkhct1Aafwblu0wCW/SlQtQ7ufzeFDZ0PZJPz7EnJ6ZxxDRIudGx5u
         2+552Qb9nPrMj/5NvOV9/CgpX+L5MHYh6LRanHLiJQbdwE7SPmGNA0+8IzsgRQ0onoNF
         84BGRCAFKmbjWeNEdcVSd25II6nm/7oIYoSxyI05MV+UtpMidSzQ1pwJQ295NO+PK58t
         8RrvkwnIGDdLw7/PfZnGcsrMOBrD8OBty9GPAf0UxTtzKl75Xgp5IlAX8kuNPTjW8FsZ
         t7/KvYbOp7t31FtaoNLPB4cGcx6yw4DwMqn8J0rjwYk8kiq4E+lVs7wR8vFARTSH8eGH
         LBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=c+M/zrtvytdJjJczvnyXdlF+pj8l1eGgbvdMLTmUVws=;
        b=cqBFbz60kCoGLsyu6BD16tZ5u38Xlf02MSVkGcXjAtv7+V6xL3Z3LFp/uBLL2NNMJl
         KXyM5FwAkVSn3cjdEdYCnMSIxCmb3id9BmF8rAT96iwf4m8lThobABfkN6ixTA9lY6Bp
         3MeA1GPZsV+HwoF1aB73BBMPPcVCXBzCfv/4lauNBedyJM6eT8oH6kKbi8yZXdjQ0LxL
         q2DS5Aj5Z96hj+PvNciMLVPMer6zADpUwK2ux211w6b192zB0b5elc+gMUQ4snljVlz5
         +WpB2c6sPJWUtg5ZQk6iFG291wz3F5EM2a3AP6cnMrRXSz0hSAs1926HAXCip2DDBqEf
         GRZQ==
X-Gm-Message-State: AOAM530A1s0OCt0drXaRvKHRnsmF6oIcIAK29zcljIHr9pTz3FXyOQFj
	6xE1lw12UYrps9VySy4Zrao=
X-Google-Smtp-Source: ABdhPJzvUFLdOh3mwPxg6pof7LMI0PYHBFk/tG+GYgEzq1Juu0d315epZmRaUDPu13DxnLUGVfyb3A==
X-Received: by 2002:a17:906:cf8f:: with SMTP id um15mr20232580ejb.547.1619472573467;
        Mon, 26 Apr 2021 14:29:33 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id g8sm4367617ejt.25.2021.04.26.14.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 14:29:32 -0700 (PDT)
Date: Mon, 26 Apr 2021 23:29:30 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] LTP drop MUSL specific patch
Message-ID: <YIcwurySkHcO7/MY@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <YIcMLMtsNSTlinqq@pevik>
 <CAJ86T=VDx=w4FB34BZhsGcFYO8zAJ27kE6t9d_3xbBvkpOPDfg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VDx=w4FB34BZhsGcFYO8zAJ27kE6t9d_3xbBvkpOPDfg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andre,

> On Mon, Apr 26, 2021 at 11:53 AM Petr Vorel <petr.vorel@gmail.com> wrote:

> > Hi Khem, Richard,

> > I'd like to replace MUSL specific patch
> > meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
> > with just removing broken files. We use this in upstream CI for Alpine, I ported
> > it to Buildroot [2], where works well. It's better because it does allow to
> > handle MUSL without rebasing this patch.

> > I was looking into the docs, it looks to me that do_configure [3] might be good hook
> > to add it into. But it looks like by default it contains oe_runmake clean [4].
> > Or should I use different hook? And how to find the default content of chosen
> > hook? (if I need to extend it, I'll have to provide the original as well)

> Changes to source files, including removing them, should be done as
> part of the do_patch task. Since do_patch is implemented in python you
> can't simply _append shell script commands to it, but you can add a
> shell function via do_patch[postfuncs]. If you grep for
> "do_patch[postfuncs]" in oe-core you should find a few examples.

Great, thanks a lot!

Kind regards,
Petr
