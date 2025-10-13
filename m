Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88345CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 18:59:51 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.53062.1760381981704322871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 11:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dBd63Z9f;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: petr.vorel@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-639e1e8c8c8so8661480a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760381980; x=1760986780; darn=lists.openembedded.org;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nOklOU8m1OZt7mXbP15V92ChP/TY57UW/sdZCipYemU=;
        b=dBd63Z9fvimheOyxDFwrkBHi5RLZt4u62u+TBB7sDgepfYTtfRut410q0Bsme4gSiY
         aAlUCBvmEuMA5qP1y6MLP417jdNlenGRDvXWtsL7lcbcvUXWsrzzpiYbJV3P5KRqkL6T
         EQUN9YZCpTPXTK/gxwGbqUS+VW2XQzrrwI+BDPsFHHRJdwW1Ghv/+18H9BXI2t7XEc8i
         8R/K1Ck5uLKRt5j+FW31yg3MaYWoCCwGaBpqjpQxcDnpgEL3QZn8gGkYYANBNwMHT8Kg
         OzBPVY0DqBJ9OnwX9RxUsWX3C+gkT5RuetvuT2QSLOwISYcMLQG6aTbSRcR8yq8FCJC2
         L4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760381980; x=1760986780;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOklOU8m1OZt7mXbP15V92ChP/TY57UW/sdZCipYemU=;
        b=WeXQhxNlzYqnQH9bCOy4bs6fo4QT0K3AEd8zh0CUZfDNmz7E+oT6wV+yo+C4J0TBwK
         /oNtoenkL+rj26yy+39qMFYt8P40wJItrUy8JXggq1w0GGfE5xheD+y4YZ1XkgWjIBq1
         uocy9RbGj7ME1tLbaZ7+j/tgLGXxIj9LDzljmwFvWj3cFLt+gqUQyt0Py9qnL7UD5uWc
         +Azc4IlUPJhvUQLmSYY4/kq824Yq/i/AWBA3uknN2WywLSunjawuTBAkgpMIA3VL+D8f
         fzTTy0j/eNhCcr1aluUpuwsy9a2xaDWYNoYo2c8VopBZokGfCgqHZSHVsIo89vhimQSe
         to2Q==
X-Gm-Message-State: AOJu0YzwJVAD0XEROtuf+N65rPZwgM4q8H2i/arfM0lhtLJS3rh9SDAK
	H6PMmSt97ycLqWkh1XKFVUg/mT/MItMpqo6sCnadFKFO7OcXJuNg3fy96MvkPiA+
X-Gm-Gg: ASbGnctRS18UNTIcGtmLn5Jvt0+eZehETbEEVpUPc7x0+8uA3MWKJ0y8gmak1ZkP062
	XhbS6ujb/0NJa5Mk+adxlsJ1+lYRbzfgD3B0P6ZA265+ARFASnRXH7UVvDZyA8y+DvDDup4eqzI
	fePkoTckPmMypABUfN1ngR4cm9mnq+zLgwpZOE9ZuS3RgfcUbWQOZkE7FQwK+Z8Ttv0bz432qc3
	kMdwWAzwh+Ho+vR57iZgbngs+BzfhN10b/dE2+fO5PkCqN/XRjzdF8C4S0Z7SQKnzyp7Io9ySTU
	Hs0P28zxihIGkBY+HXH8e76WRlXLq942grAcbYoqxubOBEorU15ax8cW7B2Xip9fIG39ZosFyvX
	oda6OM2s6nH4bsZhlBGPAD6d1IerlVld+YTsAt8st+n8qFc+3V9tL/4J0
X-Google-Smtp-Source: AGHT+IH3XhlvJKjrsdW/R5n7JTWorrPZtPLK8N4pjLT6LNMBh8kr3fq+1mM8cPUnKIQ16qlqZE7pxw==
X-Received: by 2002:a05:6402:909:b0:639:f253:aa21 with SMTP id 4fb4d7f45d1cf-639f253b38dmr17173766a12.29.1760381979682;
        Mon, 13 Oct 2025 11:59:39 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235e7fasm9317104a12.7.2025.10.13.11.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:59:39 -0700 (PDT)
Date: Mon, 13 Oct 2025 20:59:34 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yi Zhao <yi.zhao@eng.windriver.com>, Khem Raj <raj.khem@gmail.com>,
	Hui Min Mina Chou <minachou@andestech.com>
Subject: Re: [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
Message-ID: <20251013185934.GA114595@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 18:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224794

Hi Richard, all,

[ I accidentally deleted mail thread. Unfortunately I don't see Message-id in
web UI [1] therefore I cannot set In-Reply-To:. Due this also any reply to other
LTP developers about runltp vs. kirk would not be in the thread ]

> > $ . oe-init-build-env
> > 
> > .../build $ bitbake ltp
> > ERROR: Error importing OE modules: module 'bb.parse' has no attribute
> > 'vardepsexclude'
> > ERROR: Unable to parse
> > /home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py
> > Traceback (most recent call last):
> >   File
> >   "/home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py",
> >   line 372, in eval
> >       layerid, fragment_name = f.split('/', 1)
> > 	      ^^^^^^^^^^^^^^^^^^^^^^
> > 		  ValueError: not enough values to unpack (expected 2, got 1)
> > 

> > FYI I also plan to get rid of some patches posted.

> Are you setting OE_FRAGMENTS to something in a config file? It
> shouldn't traceback like this so that is a bug but something is
> triggering it...

No, simple clone and the 2 commands above. I'll later try it again on fresh
git clone.

> I did send some questions and had some discussion on kirk a while ago.
> Quite simply, it isn't useful/interesting to Yocto Project.

I see your points [2] [3].

> What we want to test with is our images and our kernel, as we build it.
> kirk, as far as I understand it has gone a different route where there
> isn't really any userspace left and it simply tests against a kernel
> binary. We'd no longer be testing our build artefacts but some more
> artificial construct.

I don't understand "any userspace left and it simply tests against a kernel
binary". LTP tests are mostly focused on the kernel (+ it's modules). And you
can run individual tests by just executing them (+ handle environment variables)
or use runltp or use kirk. The executor does not matter that much. In the end we
at SUSE also test with LTP our built image :). (LTP is used by mainline folks
and by distro folks).

FYI although kirk is meant to be run on the host, doing a different connections,
it can also be run on SUT. Sure, there is then python3 dependency on SUT
(heavier than shell + it's dependencies), but still kind of runltp replacement.

> 
> We're trying to test what we build. You're trying to test the kernel
> for regressions. They're two different things.
> 
> I totally understand why you've gone that direction with kirk but I
> also did spell out at the time that it wasn't something which really
> fits in with the way we run tests, or what we actually aim to test. I
> was told at the time that basically, nobody is interested in what we
> want/do.

...
> > I see in meta/lib/oeqa/runtime/cases/ltp.py the deprecated
> > /opt/ltp/runltp is still being used. We want to remove it (not sure
> > when, but it will happen sooner or later). Any change somebody would
> > submit a patch to switch to kirk?

> It is more likely that when you drop runltp, we'll just have to drop
> ltp. Sorry :(. I did explain this at while ago :/.

It's a question if any of the users really need LTP. If yes, you could vendor
runltp.

Or, write a simple script which parses the content of the runtest files and
execute them. FYI for part of openSUSE testing we still use our custom openQA
runner which does exactly this. It would be very light: -d and -r can be
replaced by TMPDIR and LTPROOT, -I is supported by all tests. The only missing
thing will be generating of results (if you really need it, I'd recommend kirk
and it's JSON output).

The reason we go to kirk + ltx is that in the future we plan to get rid of
runtests, replace them with metadata info (that will allow many things [4],
but you were Cc at the discussion [5]). Once this happen, runltp (or any custom
script / framework runner) will be broken. But this likely take long time.

> I did also flag the issue to our own wider community but nobody has
> stepped up to do anything about it. I've way too many other things to
> work on so it is very unlikely I have any time to look at it.

Understand, everybody is busy with the 

Kind regards,
Petr

[1] https://lists.openembedded.org/g/openembedded-core/message/224749
[2] https://lore.kernel.org/ltp/c8d4ee181809c4bbf5e21bf355c241eeb540e9a5.camel@linuxfoundation.org/
[3] https://lore.kernel.org/ltp/8043628a6eed94e788f9fedbf6c8b264ebfbae15.camel@linuxfoundation.org/
[4] https://www.youtube.com/watch?v=T1ImuNr9Oxo
[5] https://lore.kernel.org/ltp/ZmbFyjuXndeXCLp8@rei/

