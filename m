Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EABCC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 13:27:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.13083.1678368466174144135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 05:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eRjHH6UQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id f11so1846175wrv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 05:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678368464;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fn4XXqncgamb9knUPxLFB60T3s7Xow0zq3mAbGPGsas=;
        b=eRjHH6UQutLIetnOOyI15fnlJ8o2Op1SwgvoYUq9EpIqWfZCuZUg3TKbKi43w3u3b0
         6J2PTBAYdxYEtgLF2pFTiS+TiBHCXBbGzkj1MrrB5i3kchXQPPSVpMpmHQAh/wma8TwC
         Rbgq76qMzE3B/zkZaLaKw9fJbg462RfarV6OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368464;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fn4XXqncgamb9knUPxLFB60T3s7Xow0zq3mAbGPGsas=;
        b=N7iP5cGGiReTAGvs3/Aca0wtbg7iDEZ56WxkcJvKm/sdP4iJG6TVpennXQTyaM2/uq
         RK8fjBY3IqN6yXRDSoS84Z8wYsNYJpwES94YQUP+vlajNnkSwSIp95j/FRPOEQf5Uy9G
         SBQ+VvxGbjQ8r8SvI+Hd3O9vjyrFI/5ugpArJEu6WjimfhX5F6+YZFUgnXA3gsnDU+Gk
         dH7aq7hONl4OPYvwCr108dalzrhey+0c0DTLey4qPO5+mlZYV0BQTTNBR547gxYqTCvm
         A+bgI+o4heGhCi6FcrMr/eUoFQ/8pYwXqtPlowvwkxGlpb78GTzX4kYxlWc1u//B8NXO
         5TLw==
X-Gm-Message-State: AO0yUKVILn4ACgG3HzSIcQrw0/IfccXd1EOrulnm7RGxj6ehWsrd0LNy
	mJJVNdC9xCgYH8A9EBwdNvcLgA==
X-Google-Smtp-Source: AK7set83bHL1jlSIbQ6btHZSusjTXGSRnrCHB1nnMJMlyOECZqiG16HuZVe20rnReo0wmtUt6y7vPQ==
X-Received: by 2002:a5d:4c4c:0:b0:2c5:4f06:5fe with SMTP id n12-20020a5d4c4c000000b002c54f0605femr14838558wrt.57.1678368464354;
        Thu, 09 Mar 2023 05:27:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e05:8348:1f1a:b973? ([2001:8b0:aba:5f3c:7e05:8348:1f1a:b973])
        by smtp.gmail.com with ESMTPSA id r1-20020a056000014100b002c5534db60bsm18221542wrx.71.2023.03.09.05.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 05:27:44 -0800 (PST)
Message-ID: <06de708f3b7114ba42503bee833330eb05aff1d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] staging.bbclass: run prepare_recipe_sysroot
 after unpack, not fetch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 09 Mar 2023 13:27:43 +0000
In-Reply-To: <CANNYZj_hPDwjMFr33JvqeFuS=GWUT1ze0Z-eyVTpFCfndQYx1w@mail.gmail.com>
References: <20230309103225.3110783-1-alex@linutronix.de>
	 <39fcdfbf705f2d2f58bbf317171f0872df2aa2e1.camel@linuxfoundation.org>
	 <CANNYZj85v8Mt97qCNvTf8GdOUAXsfTFPGJfN-1_UxK1io1TrsQ@mail.gmail.com>
	 <69e29ea4c4b9a0cf71578b55e0e2eeda137d4679.camel@linuxfoundation.org>
	 <CANNYZj_hPDwjMFr33JvqeFuS=GWUT1ze0Z-eyVTpFCfndQYx1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 13:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178223

On Thu, 2023-03-09 at 14:04 +0100, Alexander Kanavin wrote:
> On Thu, 9 Mar 2023 at 13:03, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > This is a wider problem, the sysroots are often modified when things
> > are running against it as we don't require task serialisation. Instead
> > the code tries to be careful about it's manipulations. Things aren't
> > always installed/removed just from that task either, it can happen with
> > *any* task that tries to extend the sysroot (which fetch, unpack and
> > patch do as well).
>=20
> Right, then I'm not sure what to do here (short of 'task-specific sysroot=
s' :-D
>=20
> We can lessen the chances by serializing prepare_recipe_sysroot into
> fetch/unpack/patch/configure sequence. But it would not eliminate the
> possibility of other tasks stepping on those or each other.
> We can also make sysroot (de)population code more careful. But it
> won't solve the non-determinism.
> Making git wrapper run with python from hosttools/ solves a specific
> issue I saw, but not the broader problem.
>=20
> It happened just once, so it does seem exceedingly rare.

I realised the "task specific sysroot" issue when implementing recipe
specific sysroots but I still don't know what to do about it. The
issues arising are very very rare.

The population code should avoid problems like you mentioned by
handling xxx/bin/* last. We should probably make the depopulation code
handle xxx/bin/* first which would avoid this there, too.

I've also been thinking we should have recipe specific hosttools for
quite some time but that isn't easy to get working.

For depopulation, I've wondered if bitbake should do more of this "up
front" with some changes to the taskgraph to handle it better. It would
need a new type of task which would complicate a lot of the mechanics
of the system though.

It comes back to a question of time/resources and whether anyone would
want to take on trying to make changes like this. I've slowly chipped
away at the issues but some of this is a much bigger scope of project.

https://git.yoctoproject.org/poky/commit/meta/classes/staging.bbclass?id=3D=
a819c88b875d2357751005df7594de290926ae64
was the fix for population FWIW.

Cheers,

Richard

