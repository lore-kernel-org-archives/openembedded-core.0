Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A6EC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 10:07:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9832.1638526011423138074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 02:06:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bRYMKc7a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id s13so4617655wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 02:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+dAdFWtyP4vGeJ1iDihNdgN3zQEjjx2lxS34zXw38xw=;
        b=bRYMKc7aeTIh3/0OEtdxiLBs36oC1LkQPaM2ywzLOcVicdLDSN7x7ApEEerWX5CAwK
         1y7JqRiAFVyLntjJDdL7enuQbBpQv27L4BKXKwg8VeunlZvC4ye4dhdcQTtk/bNBpnH0
         LeTx74LuHi+RcpTdAn6P/z6HRU/+yW5kqdffM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+dAdFWtyP4vGeJ1iDihNdgN3zQEjjx2lxS34zXw38xw=;
        b=3yIQ2r6nsL9BFo+0TF4N5gJbvDLW82DcIKcve6z46TuA+aefHOYaLDu6wRi33VOyoc
         UVGOA/kl2yt/dbF3D0hM5ZU2Uia3L5PMHPLW3jx065Y74cBJkqbna0Kji0VEO+KzGL9V
         W8d055NkzvERqUkJzy8mCUhlZXifEhIAV0qfNbwr/vP/1KeIrfsHhdnQHPX7F7oAj8uN
         gsy0B9+ALSUiX21DRW52J0y+8ig3oy3w78EZbdsjcRrcDJcSME6PqtKJBOf6yIP3mXi1
         sLYqkrvfqhz+Z2lB5K9Z+s1HV8JGoCnq5cYXKN3FB9vvJmuG4Kyps0It9uKXeSxnQbDu
         YqdQ==
X-Gm-Message-State: AOAM532F9k2X11za7CVsLQu4Ggyc0Vz2L/uKYtKg+oSxacBqrJ2ca2hI
	PJTwB5bKQxHdRhquPu1HrGQl3w==
X-Google-Smtp-Source: 
 ABdhPJza4EJcu5CHNdjuK+3z5t89R7YVniOq9erIL9mEp2tsr1DxN246r0EesuQMeDuw16BN8N0lXA==
X-Received: by 2002:adf:fb0c:: with SMTP id
 c12mr22175541wrr.614.1638526009805;
        Fri, 03 Dec 2021 02:06:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:99d4:2d39:57c3:1ae0?
 ([2001:8b0:aba:5f3c:99d4:2d39:57c3:1ae0])
        by smtp.gmail.com with ESMTPSA id
 f15sm2698285wmg.30.2021.12.03.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 02:06:49 -0800 (PST)
Message-ID: 
 <61ee860e605c5e1db1aac7cc1c8cee15c23a4071.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 03 Dec 2021 10:06:46 +0000
In-Reply-To: 
 <CAJ86T=Uzdei4V_GYHH_Cd=C64Yo_HJ9+jW8Nbsq_sS2FjkiEng@mail.gmail.com>
References: <20211130165313.3816904-1-ross.burton@arm.com>
	 <20211130165313.3816904-2-ross.burton@arm.com>
	 <CAJ86T=V_9Y=xCbswnjV5ZkfihQ-KOWk13xYW7FNQaj7ahBUcjw@mail.gmail.com>
	 <CAAnfSTsvgBF1EUZ3t+FNAwGB9j0p8y41c2Mgfv2DMHoMVJWnfg@mail.gmail.com>
	 <CAJ86T=WH+HJPV7MMJFcuNyx+VmgUvPRD=wfHCTcKGyyJ3GTANw@mail.gmail.com>
	 <778f60e30d7fbfd9d4a63d87cb8824a5a9f0120a.camel@linuxfoundation.org>
	 <CAJ86T=Uzdei4V_GYHH_Cd=C64Yo_HJ9+jW8Nbsq_sS2FjkiEng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 10:07:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159113

On Fri, 2021-12-03 at 01:39 -0800, Andre McCurdy wrote:
> On Wed, Dec 1, 2021 at 2:33 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Tue, 2021-11-30 at 13:45 -0800, Andre McCurdy wrote:
> > > On Tue, Nov 30, 2021 at 1:20 PM Ross Burton <ross@burtonini.com> wrote:
> > > > 
> > > > On Tue, 30 Nov 2021 at 19:32, Andre McCurdy <armccurdy@gmail.com> wrote:
> > > > > This isn't equivalent - it will cause a change in behaviour for anyone
> > > > > using PACKAGECONFIG += "foo" from a .bbappend.
> > > > 
> > > > Correct, but this is likely the only recipe in the greater ecosystem
> > > > which has this behaviour, so I'm not that bothered to be honest. :)
> > > 
> > > The only recipe? There are many recipes which set a default
> > > PACKAGECONFIG with ?= and many which set it with ??=. Your change is
> > > effectively switching the vim recipe from one approach to the other.
> > > The fact that adding PACKAGECONFIG options from a .bbappend with +=
> > > sometimes works OK and sometimes not is a source of confusion for new
> > > users.
> > > 
> > > You are right that no one seems to care though...
> > 
> > Some of us very much do care, it is actually bothering me a lot and I've posted
> > several times on the architecture list about this kind of issue.
> > 
> > We haven't worked out what we can agree to do about it though :(.
> 
> As a first, very easy, step, make a statement here on the mailing list
> that all PACKAGECONFIG defaults should be assigned with ?= instead of
> ??= and fix the recipes in oe-core accordingly.

The question is whether we all agree on that and I'm not sure we all do.

> As a second step, the parser could generate a warning (or even an
> error) if any variable is assigned to with only ??= and += (the end
> result of that combination is not what any user would expect and I
> doubt if any legitimate use case relies on it).

Would be interesting to see if there is valid use so it is probably worth some
tests/analysis. The ??= operator never did what I'd hoped it would in reality
sadly.

Cheers,

Richard





