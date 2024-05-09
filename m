Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F1BC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 09:37:19 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.6028.1715247435745424024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 02:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KSgVVk5/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-520f9d559f6so752287e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 02:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715247433; x=1715852233; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt:date:cc
         :to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlLFM/FFzLs+B6MiurEIwk3CU8u6a1TE7bkM0NQenwk=;
        b=KSgVVk5/oZARAuZyGNwm4d2xqH1nrDyi2TK64VNiwBJY+foY/1hwsMC/9gAvfxpsxi
         UToUn1i005if1Xk2g+TwDtyMZlVzOISZwuTSXu4zVBAHP0/poGsjdrBE66PYCOyFhMZG
         qP3OzzdDyhtb68TxC766Oh3MQBeyH78POPmvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715247433; x=1715852233;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt:date:cc
         :to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nlLFM/FFzLs+B6MiurEIwk3CU8u6a1TE7bkM0NQenwk=;
        b=sldG0ZTmuhIuyFCYhhYFyopNhp6tps8ava1dkmyZNGmaIk6qYpMOviN4hxH+NqQGq/
         nsYx8KSdRxyUSrY0eqN0XK16RQj1vSTorixb6fDMC7FwCGlzXnsKaD0R+WlKqrSVDIDd
         nhIf1/AiMkLibzzAwmvvBBp4cxeGq6r/Yw+xUIXopnd3WQyU/zTTnCdlLzfhw8I7Tow+
         EKC3mdMFgUYnTlNUTaHVfONzCsznYs3GY7C1IruyNXm8FRjZBVyvezQprivPGJgcHT2S
         9CS2RkSMr0kGib/F9QOdEeZtAKtNNVQfGoEisPLfhKl/0eUjhofiEtjy8QLc4EYZ8J6N
         nYDw==
X-Gm-Message-State: AOJu0YxJC4Am5BAoicaceieTD/dkQjcY/ZfiUeg21TIZaHZHnPGx/HdX
	vO6YXlzHzDE1m4qY33+pRvigQfM+ZtaqmoR9Ad8Xsckpn827Wsp5OcyY8AbKzvM=
X-Google-Smtp-Source: AGHT+IFaZJHhzpUXp8Ea0m7CaX8Sw8Cao3HBcjG/2BMu9B6iEo21FIMLhNDwNLK9W9jEtdTos77V/g==
X-Received: by 2002:ac2:464d:0:b0:51a:f362:ab30 with SMTP id 2adb3069b0e04-5217c3707e4mr3329134e87.7.1715247432448;
        Thu, 09 May 2024 02:37:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a95b:1bc1:5128:ffbc? ([2001:8b0:aba:5f3c:a95b:1bc1:5128:ffbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd09sm1209211f8f.14.2024.05.09.02.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:37:12 -0700 (PDT)
Message-ID: <737087f797ecd87620bc96abab014d4fac6bb1e5.camel@linuxfoundation.org>
Subject: Where are we at?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"<yocto@lists.yoctoproject.org>"
	 <yocto@lists.yoctoproject.org>
Date: Thu, 09 May 2024 10:37:10 +0100
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 09:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199143

I think I need to write down a bit of a summary status on where we (and
I) am at with things.

The good news is that scarthgap is released. On the downside, we messed
up the public hash server url in local.conf.sample so we have a point
release in progress to fix that.

The Sovereign Tech Fund (STF) work is drawing to a close now, some
tweaks are needed on some patch series to get them over the line and
able to merge but the basic pieces are there. We have the PoC for
bitbake-setup too. I have not had the time to look at it in detail yet
(see below for an idea of why). That work brings us many steps forward
in many key areas of the project and takes a number of weights off my
mind. It adds some new ones too but change is at least refreshing.

It isn't all rosy, in particular the autobuilder is struggling. The
quality of builds for scarthgap isn't what I'd have liked and Steve is
already abandoning rc builds due to intermittent failures. We're seeing
the same failures with master.

In particular:

A rust reproducibility issue lurking somewhere:
https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/8318
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/8906/step=
s/17/logs/stdio
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15185
[both master and scarthgap]

Intermittent do_compile failure in libportal:
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4760/ste=
ps/12/logs/stdio

debuginfod keeps breaking:
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3299/ste=
ps/14/logs/stdio
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14937

qemuppc with intermittent issues:
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/8906/step=
s/17/logs/stdio

qemuarm eSDK intermittent failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/8946/step=
s/15/logs/stdio
(network glitch or a problem with git/curl/certs in the tools?)

We did have an intermittent python3 test hang. We've taken the decision
just to disable that test for now as we don't have the time to debug
it.

The weird hang in the 6.6 kernel in early boot also remains. Paul
Gortmaker made some progress in debugging it but I haven't found any
time to help/support him.

There is some kind of issue where the longer the arm servers have
uptime, the more broken the builds get too. It is hard to be more
specific, someone needs to do some analysis of the failure and try and
find the pattern.


We then get to the non oe-core failures that seem to be piling up:

meta-oe source mirroring giving warnings:
https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/353/step=
s/12/logs/warnings

meta-oe source mirroring fetch failures:
https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/353/step=
s/16/logs/stdio

kirkstone meta-oe metrics failures:
https://autobuilder.yoctoproject.org/typhoon/#/builders/138/builds/1612/ste=
ps/16/logs/stdio

meta-ti nightly layer check failures:
https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/2064/ste=
ps/19/logs/stdio

Yes, some of these need reporting to the right people, e.g. meta-ti.
*Someone* actually needs to do it. If someone doesn't do it, someone
needs to notice and find/remind someone to do it. We expanded testing
to meta-oe on the basiss there would be help in addressing the issues
but few people seem to be paying attention :(.


Meanwhile, we have a pile of gcc 14 fixes piling up and pressure to get
gcc 14 in so we can build a new uninative to fix things for people on
Fedora 40 and arch. There are simple things others could do to help
like replying to patches about missing patch information.

The current autobuilder hardware is failing. We have a plan for a new
setup however that new setup has issues that need debugging. The one
resource I can direct to help with that is me, everyone else just runs
away from intermittent issues or says it is too hard or they don't have
access/experience/whatever.

We have challenges in the CVE space, I'm hoping Marta has some patches
coming which can help there soon. The open letter idea is all well and
good but it needs socialising with people outside the project.

There are also some bigger changes I think the project needs to make,
WORKDIR changes are one example, we also need to revisit the layer
dependency situation and "Yocto Project Compatible" needs work too,
amongst many other things.


Personally, I'm now really struggling. The intensity of the last few
months has taken a toll on me and I simply can't switch into handling
all of the above, I'm running on empty. This means I need a break,
everyone knows that and agrees. The twist is that yes, everyone
encourages me to do that, as long as I fix the issues on the current
autobuilder, the issues on the new one, review and merge patches, make
architecture/development changes at the right point in the release
cycle, ensure proposals made for key changes are well thought out and
don't upset anyone and so on.

I'm sharing this not as a complaint, but to try and show people that if
their patches aren't merging, it isn't that I/we don't care, it is just
that there simply aren't enough hours in the day and I'm at breaking
point if I don't let some things slow down.

One of the key issues is that I act like a traffic director in the
middle of all this. Nobody else is willing to step into all those
different streams and help try and tame/direct them. The downside to
that is that if I stop or slow down, things do break.

Obviously, help in any of the most regular autobuilder failures would
be much appreciated.

Cheers,

Richard


