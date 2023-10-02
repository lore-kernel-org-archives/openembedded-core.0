Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FA4E784AF
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 10:40:50 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.78511.1696243242306407260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 03:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MN9V07f7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4065dea9a33so27479615e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696243240; x=1696848040; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JxJlMYHUPEmLuUs8OPQdO0y6E+t2/lHOLdIjGQy62hA=;
        b=MN9V07f70m0PbuYsOtgJOOiRBopHEBNymO1L9+8yiIxsk/ggOu1hrHzS2SQReO0mja
         mFYSCibbb4MbGm+PNztgSe0pDhB0GyWAO4UYC0SP0etfziI0179U8uJWF9XFQKWnoKfg
         q/aOtvlGR8Ic7jR8uP3Ohs/a7nNRlWsK8CP50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696243240; x=1696848040;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxJlMYHUPEmLuUs8OPQdO0y6E+t2/lHOLdIjGQy62hA=;
        b=iWPQrdvvXh3PsRMBNiIqm/nvPBtkuiK6EZ9/4aacEtJo6k4l9TAP/ABbykBqlJEBhK
         5GgkD+qqPSDsfguLw1R43H2OKthINqX1+No14od3NsrrY4VzmJ8kFnpeISOP+G+zuvLV
         HHakzGsUeuOFCTHtWZv4w/FL6wE14DqxmT7QwKmk6hf6NPmS1lcewXxJPESoAel3X9d7
         y58f7I9DHLH1EBP4FuYrCSataanqo9Vz+baBWy+osTvtnAXkO/FO0DexxWR4SgtrVch7
         vt5HhWpSw9LcmcIGIJvEsyUvZcYTW2XW4yiKlv6VyUIf3JpAa0E0cq0FLPm+GqxgcMsS
         G8Lw==
X-Gm-Message-State: AOJu0YzK+AJCPVt2g0zFybESik3QXgksR4Zr0OMhjD8IVZ7BfxYs0RMe
	nsKzX5adhLRSLhl2P7OP92dRjST5oufR2XRX9qU=
X-Google-Smtp-Source: AGHT+IHiPIunTYw/12fnKkyWz+ZXv1D7qvRxjjR2ErY+avcaWvXpNVtSIcA4eyZXKuXRCY9ZXuhAvg==
X-Received: by 2002:adf:cd0a:0:b0:31f:f982:5395 with SMTP id w10-20020adfcd0a000000b0031ff9825395mr10664157wrm.35.1696243240033;
        Mon, 02 Oct 2023 03:40:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:56f3:dc47:6cbe:b39e? ([2001:8b0:aba:5f3c:56f3:dc47:6cbe:b39e])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d4d90000000b0031fba0a746bsm7995166wru.9.2023.10.02.03.40.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 03:40:39 -0700 (PDT)
Message-ID: <5de278299252520d600532c7d0d18c7292c777d8.camel@linuxfoundation.org>
Subject: An insight into the kind of help we need/maintainer overload
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Oct 2023 11:40:38 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 10:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188598

It isn't any secret that I'm overloaded and struggle to keep up with
the demands of the project. People often ask me "how do you need
help?". Today, we have a fairly good example of the kind of problem I
struggle with. So it is documented, I'll describe my side of the
challenge.

We're supposed to be building the final release candidates for 4.3
today. We've also just found out that the 6.4 kernel is EOL much sooner
than we guessed. The choice is ship with a known working but
unsupportable kernel (no security updates), or try and switch to 6.5.

Over the weekend (when I should really be doing anything but work), I
tested the preliminary 6.5 patches Bruce was kind enough to prepare on
the autobuilder.

Just getting to this point is a ton of work for Bruce which goes on
quietly relatively unrecognised. The -dev kernel has been used to try
and prepare for the future kernel upgrades and without that we wouldn't
be at this point already. I'm going to focus on the challenges I have
but I want to recognise others have already faced issues just to get to
this point.

On the autobuilder we found that:

a) cryptodev breaks
b) LTP ARM testing OOMs and crashes badly
c) ARM ptests are hitting jitterentropy issues intermittently (~ a=C2=A0
   third fail)
d) x86 qemu image tests are failing say 5% of the time which means 3-4=C2=
=A0
   of=C2=A05 oe-selftest fail plus some other random failures
e) strace ptests are failing
f) meta-virtualization breaks

Bruce can't be expected to test or fix everything. Some of these issues
have all the hallmarks of being really painful to fix.

a) is trivial, there is a patch in master-next. Being selfish, f) isn't
my problem. It is Bruce's though and will distract him from other
kernel things. e) is probably deterministic and can either be fixed or
disabled.

This leaves b/c/d as the scary problems.

c) has already been reported on the kernel lists but nobody responded.
Not a good sign.=C2=A0I've looked to see if we can disable it but we'd have
to disable the bluetooth stack to do so.

The memory issues in b) if reported upstream will be pushed back with
"why not add more memory?" or "what is using the memory? Please debug
it and tell us how to fix it". Whilst I appreciate this is how the
world works, it is frustrating as we're effectively on our own until we
present it to upstream on a plate.

The issues in d) are the scariest of the lot. A rare ish non-
determinstic failure we can't talk to anyone about until we narrow the
issue down. If I try and share with others, they'll ask how to
reproduce and I simply don't know at this point. Engineers don't like
to touch problems without a reproduction mechanism.

Even just asking others about this has people asking "where is the bug
report I can look at?". Given most of this happened over the weekend, I
haven't written bug reports and that in itself is a lot of work even
collecting up the information from the failed builds.

So what do I do?

I have no engineers I can "assign" to this. Our kernel maintainer will
help but only has finite time they can spend on upstream work and the
shear number of issues means they are unlikely to get all the issues
resolved alone.

Can we afford to fix this in several weeks time? No, we can't as we
need to build 4.3 now so there is time pressure.

I can ask for help from others and I will/have but most people can't
drop everything and dive into this. This leaves my own time as about
the only thing I can directly control/contribute.

If these things happen very occasionally, they can be managed. It does
feel like other upstreams are getting stretched more thinly,, quality
is getting worse and they're pushing more bug resolution to their
consumers. Yocto Project users are also pulling their engineers to
internal/product focused work and I'm left in the middle with
increasing work and fewer resources.

I will likely take 48 hours to work out what we can do. If we can't
find a line of sight on resolving the issues, the outcode after that
time really has to be one of "ship 6.4, who cares about security" or
"delay the release X (4?) weeks and hope for the best".

If anyone has any idea of how to solve these process/resource issues,
or what I should be going differently, let me know. I am really tempted
just to stick with 6.4 as I really don't need these kind of problems.

Cheers,

Richard


