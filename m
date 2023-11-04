Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536DFC4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 11:09:24 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.7318.1699096160010227392
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 04:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CVcEKcyw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c5071165d5so39437411fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 04:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699096158; x=1699700958; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XxNPcw251Bg4Y/FVw1H9vbsDaBSBW3vMw4KLRXRFscM=;
        b=CVcEKcywWGeJXGtKjFzUIAWUeSFAzYfKm7AG8yOI+04gV7X4rodREqwb00k7L2qS1C
         armYIFTko0Wh2nUCZdv2R98B9Rbiw/c2l9rsQCH9JJSAGqevgruRonieFgQE49qWI4P4
         2s7eJbKNZvFlNYhudamEb/wmXreyUj5Gk8Jig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699096158; x=1699700958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XxNPcw251Bg4Y/FVw1H9vbsDaBSBW3vMw4KLRXRFscM=;
        b=fqEZTst6Jp998N325TH+p9N32CQNELZLT2ZSFaDPMeZxRhI9g28smGgi6cjdNjAciu
         Hv+Xil4/IJAaJDeY39nIk+Biqe5vAA40THzpo/dHTtChXOwvbqkV+qJdaAgBuz1TwsLw
         LWH/qju7YnlbBakGH1JqJnYqvv6RdAGqiHafyAMsBs7h4hrSnCeUHa2iccvTcD5GsB85
         TK8orGJnaDKMiEeX48PcI3u7pnTRCrcDMu61etMkasJU5aEhPWVuqiAX7LF4ZD4Q/09/
         hV5vVXB3SvKHetYIspunukzqu9l65ywHDD2CZ5avkI2W+XJJCdDBCx23bcGwrXkoy861
         tSPA==
X-Gm-Message-State: AOJu0YzXet3D+PFIx+H73GAbRdBsH40G8IcOTAwQ0VezKE5baP3RBp/T
	sdMTNbo8IVrQvqdLMnzboT85ag==
X-Google-Smtp-Source: AGHT+IHADjUeHKNZPmS5QGUz+hOdN/hUZAXZRb1j7/WaePBYQf6eG0FsavgV4D6JEAHfl9xgS+/Tpw==
X-Received: by 2002:a2e:b0da:0:b0:2c5:1bd9:f946 with SMTP id g26-20020a2eb0da000000b002c51bd9f946mr20426094ljl.9.1699096157722;
        Sat, 04 Nov 2023 04:09:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7cfb:21f7:ac1a:8b7c? ([2001:8b0:aba:5f3c:7cfb:21f7:ac1a:8b7c])
        by smtp.gmail.com with ESMTPSA id k25-20020a05600c1c9900b004067e905f44sm5550633wms.9.2023.11.04.04.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 04:09:16 -0700 (PDT)
Message-ID: <0b1cfe6b26e5c61b1e700e3801900038e2d48f25.camel@linuxfoundation.org>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Michael Halstead
 <mhalstead@linuxfoundation.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
 <jstephan@baylibre.com>
Date: Sat, 04 Nov 2023 11:09:15 +0000
In-Reply-To: <58e2c7a830bceac9b3a8c6cee63f03ae4a118da0.camel@gmail.com>
References: 
	<CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
	 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
	 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
	 <649b2f000761831cabd1f5737fb5b30a2ffc3654.camel@gmail.com>
	 <CANNYZj_Cq+cncw5SCGii=Mhj0KGgo=qr=hCuo+wpdvtR9C=Qyg@mail.gmail.com>
	 <58e2c7a830bceac9b3a8c6cee63f03ae4a118da0.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 11:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190171

On Sat, 2023-11-04 at 11:29 +0100, adrian.freihofer@gmail.com wrote:
> Hi Alex, hi Richard
>=20
> After some internal discussions, I would like to clarify my previous
> answers on this topic.
>=20
>  * Usually there are two different workflows
>     - application developers: could use an SDK with a locked sstate-cache=
.
>     - Yocto/BSP developers: need an unlocked SDK. They change the recipes=
.
>  * A locked SDK
>     - can work with setscene from SSTATE_MIRRORS
>     - setscene does caching in the SSTATE_DIR (no issue about that)
>     - But network problems can occur during the initial build because
>       bitbake executes many independent setscene tasks. Opening so many
>       independent connections slows down the build, especially if the
>       server treats them as a denial of service attack.
>     - The denial of service problem is difficult to solve because each
>       setscene task runs in its own bibtake task. Reusing a connection to
>       download multiple sstate artifacts seems almost impossible.
>       This is much easier to solve with separate sstate download script.

FWIW, we did have a similar issue with do_fetch overloading
servers/proxies/ISPs and added:

do_fetch[number_threads] =3D "4"

Finding the right place to put a thread limit on overall setscene tasks
is harder but in theory possible. Or perhaps a "network capable tasks"
thread limit?

Is the overload caused by the initial query of sstate presence, or,
does it happen when the setscene tasks themselves run?


>  * An unlocked SDK
>     - Tries to download the sstate cache for changed recipes and their
>       dependencies, which obviously can't work.
>     - The useless download requests slow down the build considerably and
>       cause a high load on the servers without any benefit.

Is this sstate over http(s) or something else? I seem to remember you
mentioning sftp. If this were using sftp, it would be horribly slow as
it was designed for a light overhead "does this exist?" check which
http(s) can manage well.

Recently we've been wondering about teaching the hashequiv server about
"presence", which would then mean the build would only query things
that stood a good chance of existing.

>     - A script which gets a list of sstate artifacts from bitbake and the=
n
>       does a upfront download works much better
>        + The script runs only when the user calls it or the SDK gets boot=
-
>          strapped
>        + The script uses a reasonable amount of parallel connections whic=
h
>          are re-used for more then one artifact download

Explaining to users they need to do X before Y quickly gets tiring,
both for people explaining it and the people doing it trying to
remember. I'd really like to get to a point where the system "does the
right thing" if we can.

I don't believe the problems you describe are insurmountable. If you
are using sftp, that is going to be a big chunk of the problem as the
system assumes something faster is available. Yes, I've taken patches
to make sftp work but it isn't recommended at all. I appreciate there
would be reasons why you use sftp but if it is possible to get a list
of "available sstate" via other means, it would improve things.

>  * Idea for a smart lock/unlock implementation
>     - Form a user's perspective a locked vs. an unlocked SDK does not mak=
e
>       much sense. It makes more sense if the SDK would automatically
>       download the sstate-cache if it is expected to be available.
>       Lets think about an implementation (which allows to override the
>       logic) to switch from automatic to manual mode:
>      =20
>       SSTATE_MIRRORS_ENABLED ?=3D "${is_sstate_mirror_available()}"

What determines this availability? I worry that is something very
fragile and specific to your use case. It is also not an all or nothing
binary thing.

>       In our case the sstate mirror is expected to provide all artifacts
>       for tagged commits and for some git branches of the layer
>       repositories.
>       The sstate is obviousely not usable for a "dirty" git layer
>       repository.

That isn't correct and isn't going to work. If I make a single change
locally, there is a good chance that 99.9% of the sstate could still be
valid in some cases. Forcing the user through 10 hours of rebuild when
potentially that much was available is a really really bad user
experience.

>  That's what the is_sstate_mirror_available function
>       could check to automatically enable and disable lazy downloads.
>      =20
>     - If is_sstate_mirror_available() returns false, it should still be
>       possible to initiate a sstate-cache download manually.
>      =20
>  * Terminology
>     - Older Yocto Releases:
>        + eSDK means an installer which provides a different environment w=
ith
>          different tools
>        + The eSDK was static, with a locked sstate cache
>        + Was for one MACHINE, for one image...
>     - Newer Yocto Releases:
>        + The bitbake environment offers all features of the eSDK installe=
r. I
>          consider this as already implemented with meta-ide-support and
>          build-sysroots.

Remember bblock and bbunlock too. These provide a way to fix or unlock
specific sections of the codebase. Usually a developer has a pretty
good idea of which bits they want to allow to change. I don't think
people have yet realised/explored the potential these offer.

Cheers,

Richard

