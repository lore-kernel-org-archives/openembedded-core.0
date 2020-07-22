Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.16990.1595418261547027458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 04:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BceYpi46;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f139so1676975wmf.5
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LY/0xUklfQYIVUziPCOd3L1L0igl3Tsi9VbOyCfuc2U=;
        b=BceYpi466Ms6NsWhCW/L0tRFmRfVgW2JPsuNDJD87Qk6lOM921LxcstKAdCUg2E43V
         UruVKwOYa9B9gJepZCXYF95sT/5wFDJOcJFql28OL+BxMJV0fxzbK5Gna+y2px26rXWi
         PVY/HXN0A8bjCX+Wo2zPP6VR4gDaCCgPU17w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LY/0xUklfQYIVUziPCOd3L1L0igl3Tsi9VbOyCfuc2U=;
        b=N5nbNyj+Fp5S+PVtsvdm5vSRxU9d524sMfpK1vaCqzp/E4BqfY0OtJiM4KlDvOjAgd
         RllHrHSya6eLr0k7LLI8Dhm7dcTa9h7oGSXmndkrC2ksqgm2P6vE/XiEng+yrKKvLu2m
         hoPs4xOdCmj9XoyNp5UvjeZladOhhC8y8G/o68IRTSMV3aDuOXsvILhpj4gjc6A+iCiZ
         ZycEnmPStqm4t6iIOhOM4XcK2ARXpAjM3H3AxI98Fa0jr08T6FILd7ylH1IQv8PJoTis
         SuwVvJ+gMwoq3qJXQV/pyb+Vk8SpBEST6wYte4qSO8zOo+Vk1hAsaaf3Q9dWz1ezyv6y
         8IBQ==
X-Gm-Message-State: AOAM531/gvlLOvVBShS2i0J3Ira5oxIixHzrsJqpMIZdBnHNDMjw5wVW
	pYEh60icZ3OQ7t1XMxA6kMUbvA==
X-Google-Smtp-Source: ABdhPJyOQ08UjZFOSVpcJr2OmBVVux6yfyCWml7FVSmy5apUz24Dq5U6b4+sf6DN6LpbeCto00/zmg==
X-Received: by 2002:a1c:f317:: with SMTP id q23mr1334207wmq.182.1595418259970;
        Wed, 22 Jul 2020 04:44:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.3.a.7.d.5.9.a.4.5.7.5.f.0.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.3.a.7.d.5.9.a.4.5.7.5.f.0.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:3d0f:5754:a95d:7a3b])
        by smtp.gmail.com with ESMTPSA id x204sm4162023wmg.2.2020.07.22.04.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 04:44:18 -0700 (PDT)
Message-ID: <56743047d0ab30cb084fe71a2302efd63e6e67ab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemurunner: Use tempfile.mkstemp to create pidfile name
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jul 2020 12:44:17 +0100
In-Reply-To: <CAJdd5GY5jBuoE5zAHqYMnkX7ZAz5mU41p2dpxWqhEQNymyr0Cg@mail.gmail.com>
References: <20200721215640.136052-1-richard.purdie@linuxfoundation.org>
	 <CAJdd5GY5jBuoE5zAHqYMnkX7ZAz5mU41p2dpxWqhEQNymyr0Cg@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-07-21 at 18:49 -0500, Joshua Watt wrote:
> 
> 
> On Tue, Jul 21, 2020, 4:56 PM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > We continue to see qemu races where qemu fails to write out a pidfile. The
> > pidfile name being used was based on the parent process starting the qemus
> > so in theory, a qemu shutting down could have deleted the file into which
> > the new qemu's pid was about to be written. This shouldn't happen as qemu
> > processes should be exitting completely before the code returns.
> > 
> > In the absence of better theory for the failure, use a random pid filename
> > rather than the parent pid so there is no overlap in the pid filename,
> > thereby removing any theoretical race.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/lib/oeqa/utils/qemurunner.py | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> > index 519aa9aa1e5..73a3efdc964 100644
> > --- a/meta/lib/oeqa/utils/qemurunner.py
> > +++ b/meta/lib/oeqa/utils/qemurunner.py
> > @@ -20,6 +20,7 @@ import string
> >  import threading
> >  import codecs
> >  import logging
> > +import tempfile
> >  from oeqa.utils.dump import HostDumper
> >  from collections import defaultdict
> > 
> > @@ -65,7 +66,11 @@ class QemuRunner:
> >          self.runqemutime = 120
> >          if not workdir:
> >              workdir = os.getcwd()
> > -        self.qemu_pidfile = workdir + '/pidfile_' + str(os.getpid())
> > +        # Use tempfile to obtain a unique name. We own the directory
> > +        # so closing the file isn't an issue as long as we don't delete it
> > +        self.qemu_pidfile = tempfile.mkstemp(dir=workdir, prefix="qemupid_")
> > +        os.close(self.qemu_pidfile[0])
> > +        self.qemu_pidfile = self.qemu_pidfile[1]
> 
> Minor, but more idiomatic python:
> 
>  (fd, self.qemu_pidfile) = tempfile.mkstemp(...)
>  os.close(fd)

Yes!

I'd changed the code a few too many times and it ended up a bit silly.

Sadly the autobuilder showed the same fault with this applied so this
patch doesn't work anyway and probably isn't worth applying :(

If anyone can spot the race...

Cheers,

Richard

