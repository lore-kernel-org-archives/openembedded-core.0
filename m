Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0AFC3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 07:21:50 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.38882.1721719307248363648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 00:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UOt0Vdvg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efa9500e0so2926430e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721719305; x=1722324105; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SeU09KzjQINNLpm7+tDLiFReeow8bvMVO6WePFDZvrs=;
        b=UOt0Vdvg/HUatm/PDkR7D2Fb+6QxBh3dTGOrna1pbRbtCZ+9QJ1fXceH5V0CcKITPC
         KPRqgIxErfyrviHqjDMJFJIQDILYVUN8LnUOcpVxYOP7nFFxCg5T6JSdUxXRWirbGFBs
         2IdqVkPsfM05yONNEPJ/8hCB/nDhKNVlAQ0Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721719305; x=1722324105;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SeU09KzjQINNLpm7+tDLiFReeow8bvMVO6WePFDZvrs=;
        b=ij31Ovdb1UzPfDmO1XcpICcBd2L/vD3YJxsizihyb7rd3D8h5XgoqxPIqGFV3sUx38
         Kl/oAKSuhCuerktuXGloHT4uDCod16kvBBjKUO2Y0FWd1ZpfAAjRFAbQSPACLL01Mtd4
         OfegqEJnTd0Gr5f1M9rdT1qyN4EhnkGoTwPLTIAk8wK+rYPdEhJ7iZso4kR3rwOlXw21
         T1bdtMKqkMXrS5tfLBG3FpgVhpR+po9hA/ndzgTpplsWfkkMK0po5mLe9PGLYHv6as3n
         bBymVMnmZxYaOLW3QuErD1Y1fuNitsyh021Xvp1f05ASWwvddZKQhvY6sBtxSvfqoMyj
         Hm0A==
X-Gm-Message-State: AOJu0YxFE3SeBXaKpBusC/Ivt21ZZ3xyRf86uh+Q6aTjDIt4/8U0WGtw
	gbIaalBn8Cck/Z/p5qVrgKlz8g/lrm6IhgH5sbEb+ML5TrvdXQ0L8svaFIzkh1M=
X-Google-Smtp-Source: AGHT+IGjISGM4RHgsGDPYAE89I1OET28Av10r1FRET4UtkwWrKFiB9dzXiXcavWYOGK7yTqQbtm3oA==
X-Received: by 2002:a05:6512:2310:b0:52c:e28f:4da6 with SMTP id 2adb3069b0e04-52efb806f12mr6480103e87.51.1721719303934;
        Tue, 23 Jul 2024 00:21:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcbe:ae7b:e03d:272d? ([2001:8b0:aba:5f3c:dcbe:ae7b:e03d:272d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a9466bsm186213415e9.41.2024.07.23.00.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 00:21:43 -0700 (PDT)
Message-ID: <a1a5f23710540de0b194503c8511a7394c1f1a81.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/4] lib/recipeutils: add a function to
 determine recipes with shared include files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 23 Jul 2024 08:21:42 +0100
In-Reply-To: <CANNYZj9fxRzO2pwUaYuDCagMEmz2+sa=D_56p-pWr+fq0yNF_A@mail.gmail.com>
References: <20240717182216.1661015-1-alex.kanavin@gmail.com>
	 <20240717182216.1661015-2-alex.kanavin@gmail.com>
	 <c52ad793f05ea2fd92ee97711dddb29c039a175e.camel@linuxfoundation.org>
	 <CANNYZj9fxRzO2pwUaYuDCagMEmz2+sa=D_56p-pWr+fq0yNF_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202331

On Tue, 2024-07-23 at 09:15 +0200, Alexander Kanavin wrote:
> On Mon, 22 Jul 2024 at 16:44, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Your patch is good and I'm happy to merge as is, I just wanted to
> > mention that it might be possible to catch the mesa issue.
>=20
> Thanks, I just pushed the corresponding changes to AUH. It's possible
> next AUH run won't be perfect, we have to wait and see (I did test
> passing/failing lockstep upggrades with glib, but AUH is notorious
> for
> running into corner cases over the complete recipe set). But you
> should be getting perfect qemu upgrade patches from now on ;)
>=20
> > The challenge is that even if it were identifiable, the code still
> > probably can't know how to actually enable it for the
> > upgrade/testing
> > :(.
>=20
> Yes. We could insert that data into the recipe to be used by
> AUH/devtool, but that's even more work, and all for a single known
> recipe in core (mesa). For mesa I'm tempted to go back to the 'simple
> file rename' proposal that's already implemented; in reality no one
> tests mesa-gl either when they submit mesa version updates. And we
> have to keep telling people to include mesa-gl, because it's only
> natural to overlook that.

FWIW, PV doesn't have to come from the filename. We could set PV from
the inc file and rename the files so PV isn't there...

Cheers,

Richard

