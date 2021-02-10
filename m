Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.9751.1612980201630722521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 10:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gv3F0ma4;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id e15so2165163qte.9
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=peItpkgEV+OvLnpNDOib1mTCiPL9TRx1xo1ynrUX2sY=;
        b=Gv3F0ma4yWlcXB2oKOeJfztefiB9IX7EUriTbBWkeKFzGmyuRYNUlklkyvx4CWR7e1
         zI2aPRsuAxxCMC4CRAw2381NWDiNO2eHdWEwc6ikcIDZ1TfUsFRbDKkpo6JwhMBH96hn
         Q/rN/MZrXgWGHF/5J7MFm7EOFro3jaBc4CqpepiY2YF/PuvDcXMFClUZW0fJcaFXTyqt
         DqJ24Zqzu0MjPt1c0bBoeKW8/Z4PNcXKbftcfTCOAq3Ne1/p1rLcN3KO1VMs4nv5Qxsk
         zaIiB3m6CtorCvV+hqVSX2fYVyHMws1OkPSTmevT0zNTqT6tN58eDGx+WglDPrB/5AzP
         0ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=peItpkgEV+OvLnpNDOib1mTCiPL9TRx1xo1ynrUX2sY=;
        b=B+BgJoAGrkk0IKO1XWgqYaGCkgsy/M5R7lGu/X0AmcbY6JifswVboXpUqE3nXUc+oI
         LN1CbIutSWT0T4736eqREzh9Cdb1vTnKMAW1g3S+PPcrRZKCrfF++Dor/NJF5HcxWCMb
         98eYGtAXyjAsg9DRt5/kqDS8Bykuqq8k7mVm9Xe8QOJAQQGP4ouL1AoPcKOtbHhXtM8Z
         p2LLiui4jDi5mn8/X0qZwabrTxepszVcz07+uEhfYWD0qpSPwnjRd1Dk6b2ho6d8NGPU
         ks2OptxPmLVw3LNplF1+9/sM7d8AXIuYEShseZUov12LIpJHntj4Vkg4eD7qewQPR/fh
         iF3Q==
X-Gm-Message-State: AOAM532yHDBTzD2PzpHdqYbc+W7PoVQVrerKJal81K060V9b/qsDwhRv
	ggykbxF8T9vcHU41z95q/UzvQaMDSLBCLgMje+c=
X-Google-Smtp-Source: ABdhPJxrgMRfaxQV18d+Rk5vA36CIGWR6dk2k9J9pYMo7q+m7ZfxBUIXIHcdo5+OQnOgsjNVnMosSLYXtgEAuccq3I4=
X-Received: by 2002:ac8:60c9:: with SMTP id i9mr3915441qtm.88.1612980200789;
 Wed, 10 Feb 2021 10:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20210206063138.1649019-1-raj.khem@gmail.com> <3b2c317d565d09bda89eacb05002ef1f0d816c6c.camel@intel.com>
 <CAMKF1so+8XcjgVUjSbn3ph1ZMRQRjnLQbq4na9WNEfTT_TPwuQ@mail.gmail.com> <YCOd2Ru/zB/fZedT@korppu>
In-Reply-To: <YCOd2Ru/zB/fZedT@korppu>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 10 Feb 2021 10:02:54 -0800
Message-ID: <CAMKF1soExCkLsKd9A3Z_E0y9BqZpPE+f_t57B_xivaZmAhm9hA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] security_flags.inc: Use -O with -D_FORTIFY_SOURCE
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021 at 12:48 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>
> Hi,
>
> On Tue, Feb 09, 2021 at 11:37:39PM -0800, Khem Raj wrote:
> > In this case -O  will take effect sadly. and it seems to be that
> > autconf munges the compiler cmdline
> > while generating CFLAGS in generated Makefiles and appends the value
> > of -On coming from CC
> > variable last.
> >
> > I think right solution would be to add same -O<level> as specified in
> > SELECTED_OPTIMIZATION so it remains
> > in sync always, I have sent a patch to ml. Could you test it out and
> > let me know if it works for you as well.
>
> Or let it go? A lot of recipes amend their own optimization flags and override
> distro wide optimization and other compiler flags. I once fixes all recipes
> in a project which were not obeying Os until buildhistory showed change in binary
> sizes... that was a lot of work for a PoC..
>

I think we need to solve this. I have seen many cases where configure
tests silently fails due to these warnings and we
don't necessarily notice it because configure just disables the failed
part and the package might not fail to build

We still are fine if a package is overriding these flags but we want
to be consistent about what we pass.

> Cheers,
>
> -Mikko
> 
>
