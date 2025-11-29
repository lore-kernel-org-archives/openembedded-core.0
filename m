Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733A5D116F1
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 12:36:56 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13719.1764419815812062250
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 04:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X8dzvHb2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429c4c65485so2444082f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 04:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1764419814; x=1765024614; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=07OK+yLUzG/3ccV0nbuZ6hNEGBmieoVtFtk1wrLqMMM=;
        b=X8dzvHb2Ut6tZAM45mEdTvO2FdWCBSkmgGaLsBx6Mck13HmEoELMDfu2irlBSPc7L/
         39a275DMTyRvFU2wV4YAchVMnwKLeIBHujFAuUgeU7bqWg7+4Lo8r3e1bgRwLMnF853J
         3T7erfbxVudmqVjUEEwl7JR7bY5Kpx6+/WppU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764419814; x=1765024614;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07OK+yLUzG/3ccV0nbuZ6hNEGBmieoVtFtk1wrLqMMM=;
        b=wqWNd11rSF4umYAYq9Hhw1bbnEDP/V/AA+nw34ygtqxSSa9QFMsAnpLlYMP0vNdIU2
         nx7bngJ5ZWVL5i9uwiDdn0DYcnrR/AExesotUDho+//rMiF56oFqUjiC2LNr4oKVsVq3
         x7yGZjucW+XyjIzjF0FJow3mCr04/sPNP5jSlBELYr7oL7gEIB6oujnh1xBGizs9ftCS
         +WwYOpgVsIJYgFJGGF17S6oojy8EX5yJvaB3VWI/dbOr8OR6tAuWOIUmatiVDeRRnMrB
         H1m4SYCrBOsmoomt0ddjUc7to0YjDaQivW3o4wQtKFmy5cHBwg/IIkjKlPEK7CCFteuf
         GuZw==
X-Gm-Message-State: AOJu0Yxmt4WSQV/8y/lWbJnmq1qC4U31fP4dMWBl96y4x+9GtRZYZAiT
	gCjy/s6F/Ixif6fQiKSdZtUn8KVdnXOgQghB5MIGEDOM+RHc76GhKzf0ND2G7+N0VWg=
X-Gm-Gg: ASbGncsnCq4RZ9orfk10KbWp6byNAds4wTxVJ7M0SE317l0oQPegv3eapd3QgPFmAxp
	dyytafJFPguoaMU97Qv6YQHCDmK8gm7UZ7jFHYgHW+jlh54fmWAvBStVBnL6uoYXDjlYopXoGjB
	6dExaBHDBvMpdaBEVav/yZHE1gxjgzQt1niIyzhmONJqUH1uoi02JNX9neYFwNhgl23X7QTledD
	xl5ZJ08uPrPS8FLioJSzkRoIOcyIM14EN1Lko+XEGs1LAnG/1o+mt4RM+sEvuMLT+H+HAFOB00S
	HP8OqX6ixlXYW+8lkT7bjEIIY2FKGlAFBs6WmRzYiaFn3lzOmnrA+UcZ4GFmaKiD7YTDOTun1Nu
	toKPFV0eGesrvtC7W6PmbHbCIGzfDnPeetWBRad0Wkw8la4Sx4fL5cL5yrshF60fvueh+vi0nk1
	IoG2cVrN6l6aGYfPWcqBByqKKl8IMHD6F8OW0uY/AYzYc6oJI/UnLFQWYMHcZ2HyZuLMT7dEZx
X-Google-Smtp-Source: AGHT+IFOi5BPJPDDXLqGzRF4HnypaQd+zLYBrBw24Id+M8xc4lEy9GnaQVVck1au79OTkhVOXFZjLw==
X-Received: by 2002:a05:6000:428a:b0:42b:40df:2339 with SMTP id ffacd0b85a97d-42cc1d61959mr35390905f8f.57.1764419814200;
        Sat, 29 Nov 2025 04:36:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9cf7:b95e:b79:bb48? ([2001:8b0:aba:5f3c:9cf7:b95e:b79:bb48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c81sm15355196f8f.3.2025.11.29.04.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 04:36:53 -0800 (PST)
Message-ID: <cb6c4438fceb407f39f6a0f540928c18474883d6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/configfragments: match fragment prefixes
 rather than full fragment names when disabling fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Sat, 29 Nov 2025 12:36:52 +0000
In-Reply-To: <CANNYZj_evzQWBTw1gH9GpuqH=wGwmTwg9HhbyWFz_vUq+Z34tQ@mail.gmail.com>
References: <20251128182713.4148461-1-alex.kanavin@gmail.com>
	 <247791bb-e71b-402a-b14c-0f51a0bc709f@gmail.com>
	 <CANNYZj_evzQWBTw1gH9GpuqH=wGwmTwg9HhbyWFz_vUq+Z34tQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 12:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226933

On Sat, 2025-11-29 at 10:59 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> On Sat, 29 Nov 2025 at 08:25, Gyorgy Sarvari <skandigraun@gmail.com> wrot=
e:
> > > This allows disabling classes of fragments without knowing their full=
 names, e.g.
> > > instead of
> > >=20
> > > $ bitbake-config-build disable-fragment machine/qemuarm
> > >=20
> > > one can issue
> > >=20
> > > $ bitbake-config-build disable-fragment machine
> > >=20
> > > to match and disable everything that starts with 'machine'.
> > >=20
> > > Add an --exact option to preserve exact maching (e.g. when
> > > theres some/feature and some/feature-with-foobar both enabled
> > > and only the first needs to be disabled).
> >=20
> > Why not add a --wildcard option instead, and keep the default behavior
> > backwards compatible?
>=20
> I considered this, but I tohught most people would prefer prefix
> matching to be the default, it's just more convenient. Fragments are
> still very new, and situations where --exact is necessary are rare.
>=20
> This will be discussed in patch review. If preserving behaviour is the
> outcome, I wouldn't add an option (that no one would know about), it
> would be a separate command: disable-by-prefix.

Perhaps the compromise is to support:

bitbake-config-build disable-fragment machine/

i.e. the prefix matching only triggers if the / is at the end?

That is perhaps relatively explicit/intuitive enough?

Cheers,

Richard

