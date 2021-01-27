Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.9961.1611764244456349388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 08:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X9MwbSWL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id s24so3607651wmj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sS/gQUI8zXQnwjzdMszG3steSmKVBMacFSJAv2Do0gI=;
        b=X9MwbSWLxCT3++6WuZ5+JRS4WHLI1PDoSWK4NAc/J5FvAsR7AAzszXl63S6Pe7d/Hv
         lzuwn8Ki/LBreTQry6bVHhEFutP1A3pATp/W1ICQCjsIhB9g0v7OE8eaBtbZeOyyz+m4
         hTfsfwHFGPsrfPWreOn1ePW2DYof8XC7UHYo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sS/gQUI8zXQnwjzdMszG3steSmKVBMacFSJAv2Do0gI=;
        b=o4KOtaiLLbST54zo+Is5O3poTQeJZ9ixBEfGyRRqA1trSKvp8VHsr79RTntURQ9pf4
         uqZ4Ntf7virkkRng8fiZ+HFnkgj96Wmyvq52myo5QNLuWBqHaSv60qZG4QT5pmnVS3jO
         tj/N2UYCfGY0BunT7/FulnA1rz8TL4pCNBYFLAazpbTQBglQrsSVfevO0l2NBHIwmh3G
         v8p1t31Yulwcin2pEFXTQ7o0fMxLPWoRHzdsRfnQV8tPhn4DbwL0j34HVrEkXOAhIQD5
         IAv87MNfaHFl4ZcZRYyWIzPP9q/AXoxBgiHZ3nwk/nkGIAoJdhDILQFH2+Hl6A0AYxe/
         4Uaw==
X-Gm-Message-State: AOAM532lh1JsJPz4DyuFO6vf+WwfO5Nv+KMVDx8re66YYdleI0OfWug7
	EstFvPZjdJANUXSbF9LWL9r/LA==
X-Google-Smtp-Source: ABdhPJz3otXC9PZBRk7okjQnyo7itVt2ubliF20HpRzBiyJfde5s0CrDzdKz7sT0Lwfppt7qeXkvQA==
X-Received: by 2002:a1c:7d0c:: with SMTP id y12mr4881700wmc.184.1611764242912;
        Wed, 27 Jan 2021 08:17:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc? ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id b7sm3433151wru.33.2021.01.27.08.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 08:17:22 -0800 (PST)
Message-ID: <98a5a6064748624812b1656ba6b781d23f3b3634.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 00/47] Patch review - pseudo file mode corruption fix V2
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jan 2021 16:17:19 +0000
In-Reply-To: <CAOSpxda7n7G6TNu1Tqns0CWrBpQ5q_KVFmPFgkmcQDzSj=DhcA@mail.gmail.com>
References: <cover.1611585425.git.steve@sakoman.com>
	 <9fc1e6aeae0f76694b4de468bd1b00e502522874.camel@intel.com>
	 <CAOSpxda7n7G6TNu1Tqns0CWrBpQ5q_KVFmPFgkmcQDzSj=DhcA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-01-27 at 05:01 -1000, Steve Sakoman wrote:
> On Tue, Jan 26, 2021 at 5:19 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
> > 
> > On Mon, 2021-01-25 at 04:50 -1000, Steve Sakoman wrote:
> > > Issues with undetected file mode corruption in pseudo have been
> > > identified.
> > > 
> > > Fixes have been merged into master and gatesgarth over the past
> > > several months and
> > > things seem to have stabilized enough that we can consider
> > > backporting these fixes
> > > to dunfell.
> > > 
> > > This is a somewhat more invasive change than normal. Specifically the
> > > user will
> > > be required to clean TMPDIR after this merge. It may also expose
> > > issues with
> > > other layers, though master and gategarth have probably helped to
> > > pave the way for
> > > this change.
> > > 
> > > Personally I think that this fixes a serious enough issue that we
> > > should consider
> > > this series for dunfell.
> > 
> > I think it might be better to wait for some more time before they are
> > merged in LTS so they get wider testing by people who might be using
> > gatesgarth. The wic patches have not been merged in gatesgarth yet (I
> > just sent the pull request).
> 
> How long would you suggest that we wait?
> 
> I felt that this was a good time since we've just released 3.1.5 and
> it would give layer maintainers a good chunk of time to react before
> we release 3.1.6
> 
> I'm open to suggestions, but if we don't do it now I feel we ought to
> wait till just after 3.1.6 then.

It is a tricky balance but FWIW I'm leaning towards having these as one
of the 3.1.6 changes.

Cheers,

Richard

