Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB24BC624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 11:47:43 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10915.1788349655653164135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 04:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QvH1wHFi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1c26d7e951so137909166b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 04:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788349654; x=1788954454; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :cc:to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GqWSVayDTXWj2OU+ob/LKjetEaaP1gPue/nz86HK7nA=;
        b=QvH1wHFicyj9jINustjpZfnsbOsZrjm4gm79p9mRPnQ493NV91a6GGlKpjG4z6p0vA
         HHcJW3A8uTf7aRnkHaWAyIsQjLhtSWaSV0CNRE8ERV2LcjSkEuzd9QrQbQ0iPrJsI3ed
         QkqbY22de9B30PQtDu9MVp/PsDvXYxYfIjSGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349654; x=1788954454;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :cc:to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GqWSVayDTXWj2OU+ob/LKjetEaaP1gPue/nz86HK7nA=;
        b=Al2JLzkBevcmK99KoJ3xXEYhimYLVR/fU6995vR/1aGvUVzXh58K0/o+e4sQboGUmq
         nkg2Zea4TGiSWFZi4EZZjvipcnLlG3LNhlcWw09h5JdVybyVe+iV8TemD1JdsO8edrXb
         0DB8HgFEakp5XnH9EKrEMieIOHPpIkFfITaULSrQVcTLAARojecB0fgRvb4zr6KIGJhJ
         vjdihcUbXWCKk+fP2kqksiwWyQc1V/r42vvDkVTWukUPKGCG4S/8lAvmsmrGid9zEHcK
         v5J02waLTNPgUwqLn5ziZ/LSVeEkV3JVV4X0HvSygjjjSLEUNI+U/kvBVAZjiTW8sbwf
         wgbg==
X-Gm-Message-State: AFuF++lBuxsqJpfpmLQcGHps2dxJ8UzwErRC2lb50vZcI46mtnJG5dXG
	WU04t+bLDvg3dnm2AOMofbkryOyIFxjqT0AmtlaaAxAIEjlisKzhl0NtGRk+5tHeUh/lS6xY3pA
	PykvR5ZM=
X-Gm-Gg: AYBFou2TWwcA/7tZQWeC8WQrFynJXbc6pSZdP9Uxn1d61Ydbl1Pqj9AlBBn9G/CComo
	fWCqoFM0SUqRKQAgFBsVws9vvyQUOV/oXLg3TI+wNzPOH9/xtI3+2azqphXmv4HSfDluaZeULrS
	eiSKdkQQ2p3uMaKB/d11yaJgqVHuNNSWq4rwaYAJ9RRKeP3ZgZ7a3vbPQ2rvzV0HfIv7RpPzWPi
	VsuF4XjyKexHWccxZaI8qirSs3Gd77m61mV3UFBXUHfcpAe+h59l5GdavCuhKrMvHov8DUU9IEg
	hZWdOQGq9Jo4kQXcGJ16CecwzTdnkRdEwSMYQYJsDVaZPHP75+6JUhn7HX3nu/c/oO3KmaFetQW
	52jINi+idY6yB//cuFfneMimFbstm84OoyNbhZ8Cnu/pzG6BMFnCui1CdkZlj/lW933sZ0I5+Es
	6b2gfGgheEbwLVH10KiN8NGYQrR95IZTK3ANQD83/Cm8/AsGtzEDZfODSQTQNQ8gqK9EqRbVfB9
	OElO3WNX3g16ORiqxAbC+p1oPPCWN/8f0E5yESWLzkvPEx7cx/Flg==
X-Received: by 2002:a17:907:7243:b0:c21:34a3:4df9 with SMTP id a640c23a62f3a-c25d5266804mr254558066b.3.1788349653733;
        Wed, 02 Sep 2026 04:47:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:89b1:8875:2e41:59f0? ([2001:8b0:aba:5f3c:89b1:8875:2e41:59f0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d796sm124026166b.40.2026.09.02.04.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:47:26 -0700 (PDT)
Message-ID: <e13a77790d4c9bb55bd61aa59ff433c703b6f3d8.camel@linuxfoundation.org>
Subject: A walkthrough of some of the challenges with auto generated
 changelogs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: "daniel.turull" <daniel.turull@ericsson.com>, Ross Burton	
 <ross.burton@arm.com>, Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 12:47:25 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 11:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244932

Everyone keeps telling me how great these auto generated change logs
are and yes, they can be helpful but=C2=A0they are also piling pressure on
me as everyone has their own preferences and personal "triggers" for
issues. I keep getting told how XXX shouldn't have merged without YYY
being tweaked but the tweaks/triggers vary per person.=C2=A0I also get told
a changelog is better than none and that we shouldn't be spending time
on it. I can't win.

I'm feeling bad that I haven't written down the things that are causing
issues so I'm now trying to do that here.

One general issue is that we can often delete the "Source: ZZZ" lines.
They're good to explain where the data came from, we don't need to keep
them in the final commit message in most cases (unless they're urls?).

Taking some recent examples of other tweaks that need to be made:

"appstream: upgrade 1.1.6 -> 1.2.0"

This one has a truncated log. We added a test to patchtest to warn
about that, patchtest warned but it is still queued. At least one
manual review missed it too. We may want to up the auto-truncate limit
slightly.

"python3-pdm: upgrade 2.28.2 -> 2.29.0"

This as a github changelog. These are more readable/shorter if you
strip out all the github PR links. We really don't need them. It also
needs linewrapping. If someone doesn't linewrap it manually, I get
complaints.

"libksba: upgrade 1.8.0 -> 1.8.1"

This has a lot of noise in it and isn't well formatted. The commits
hashes, dates and people can be stripped down. It can be reduced to one
or two lines.

"re2c: upgrade 4.5.1 -> 4.6"

github pull request link can be dropped

"librepo: upgrade 1.20.0 -> 1.21.0"

Are the prefixes with the commit hashes useful? Should those prefixes
be stripped?

There are probably other issues but those are probably the most common
tweaks I've been making.


So in summary:
 - could/should the Source: be after the scissors if non-url?
 - can we strip out the github urls for pull requests?
 - can we linewrap the data better?
 - can we drop commit hash refrerences?
 - should the truncation limit be slightly higher?

Cheers,

Richard



