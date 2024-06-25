Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232B1C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 11:06:58 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.169342.1719313610894458591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 04:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cc+dwH8u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-424798859dfso45052045e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719313609; x=1719918409; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RQXfe6C+NdCp9GgTLQCv0UdQieRXPGq3XfFIBrtcJsE=;
        b=cc+dwH8umOg3Vs2Bpn9p7KM4w1720MzJvOIi1WZYR7i44wTv4AQSVhbkNIPVigJLGS
         Hgh/pWphk2CW/AEcTNbZc9ZXuEJQUxL6xpd6l2CuzQDucVZJ/fF/b9/BCMkuize4q7p7
         0bkVCZgYywPgK6UzClrzk0ilmfU+rAb4V2a4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719313609; x=1719918409;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQXfe6C+NdCp9GgTLQCv0UdQieRXPGq3XfFIBrtcJsE=;
        b=M1IiUAeVxgE/KsgjixoQueR/iVuNYhDI3DEF0RowtYKpGGSo/1OBNvbR4dYHTl3WKw
         PgXMkUmOczlGJRIr44jBiO96i70LnQOUXh/J2cC47az+hMKPMqXRMDIwhD1LFv/8Rp4w
         jBInbDsYWTlds2Hgz4T3wcvrSRGy+zAO62NgXOerLffcCbr7919RshoNpVyldYjkfvh4
         iVS/0JVuuQodPdHWjDMMUjZPdRCDNdCQvv1blkbE1JsCBOVPmIT3280UrT/8NuZyhqyR
         3YA5mRJZYRNpI3rAt2tbmTp9u+X9jP9qbn3hBrgcCZpxIl4MfjdDUrRugWkp5E69oaeU
         AiGA==
X-Gm-Message-State: AOJu0Yz43SKcvfrAmQd+1wvYYbPt9lJd70jNG6JruuKS/3l+p+U1Y+gp
	TQ4OAgjUQpJmCcSmCYTU+OEVUfOJZhc3XFV7S1jbMo5N+LEKZhmDVSTeejsZD0Q=
X-Google-Smtp-Source: AGHT+IEA7CFM3AbjfH+7bZO/bWohxua/dNA2OYM1rfCuXAGrqxsO9iElKzNH7Q+tS/LLranVv05N6A==
X-Received: by 2002:a05:600c:6c8c:b0:424:a48a:99ff with SMTP id 5b1f17b1804b1-424a48a9ab6mr8559745e9.8.1719313609248;
        Tue, 25 Jun 2024 04:06:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e? ([2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0b63a9sm208912635e9.9.2024.06.25.04.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 04:06:48 -0700 (PDT)
Message-ID: <f9d0520c75c0144cb6f7a433769b593ddcf9091c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/11] devtool/upgrade: add
 RECIPE_UPGRADE_FINISH_EXTRA_TASKS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 25 Jun 2024 12:06:47 +0100
In-Reply-To: <CANNYZj9hXzes_pH_tH1P4wVUsLOKiQpRnucds-YpVtJDQRTMuA@mail.gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
	 <20240621103414.2842509-2-alex.kanavin@gmail.com>
	 <de66e3216fb54cf24171e800ea032770517fab69.camel@linuxfoundation.org>
	 <CANNYZj9hXzes_pH_tH1P4wVUsLOKiQpRnucds-YpVtJDQRTMuA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 11:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201129

On Tue, 2024-06-25 at 11:19 +0200, Alexander Kanavin wrote:
> On Mon, 24 Jun 2024 at 22:33, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Whilst I understand the desire, I'm not sure this lives up to way
> > devtool works.
> >=20
> > By that I mean that devtool upgrade usually does testing of the result
> > but with what you implement here, the second recipe is never actually
> > tested so things could easily break after devtool finish and you
> > wouldn't know without further testing.
>=20
> Yes. Supplementary .bb renaming only works if those additional recipes
> do not add licensing statements, or custom patches (and AUH also won't
> test-build them separately). It was something of a low hanging fruit I
> wanted to try, as for things like mesa, qemu, cmake and others in the
> patchset I sent this does turn reliably failing AUH updates into
> working ones (as long as only the renaming is needed).
>=20
> > Thinking about this a bit more, we should be able to ask bitbake which
> > other recipes "share" files since I think the list of included files is
> > actually cached by bitbake. Yes, we may need API but in theory this
> > means devtool can know which other recipes it needs to upgrade at the
> > same time, and when doing so, run them through the same process as
> > normal upgrades.
> >=20
> > So yes, it will be a bit more work but the end result should be more
> > generic and scalable?
>=20
> I would first try to simply list the additional recipes directly in
> the main one:
> RECIPE_UPGRADE_ADDITIONAL =3D "qemu-native qemu-system-native"
> and see if devtool can be easily made to iterate over them:
>=20
> devtool upgrade qemu
> =C2=A0- internally performs upgrade qemu-native qemu-system-native
>=20
> devtool finish qemu
> =C2=A0- does the same for finish operation.
>=20
> And since these share includes and patches and other items in SRC_URI,
> we need to ensure they don't step on each other. Although there will
> be multiple overwriting in 'devtool finish' which is okay as long as
> one updated thing is overwritten with the same updated thing.

I don't think we even need to list the recipes like this. When devtool
upgrade runs, we get a list of files which change. We can then query
bitbake with that list of changed files and ask "which recipes also
depend on these?".=20

Based upon that list we can then know what else might need to change
(e.g. if any of those recipe names have the same PV in) and also which
recipe targets also need to be tested as part of the upgrade.

Cheers,

Richard

